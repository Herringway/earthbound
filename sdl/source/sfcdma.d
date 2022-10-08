module sfcdma;
import snesdrawframedata;
import earthbound.commondefs;
import earthbound.hardware;
import std.experimental.logger;

void dmaCopy(const(ubyte)* src, ubyte* dst, ubyte* wrapAt, ubyte* wrapTo, int count, int transferSize, int srcAdjust, int dstAdjust) {
	if(count == 0) count = 0x10000;
	for(int i = 0; i < count;) {
		for(int j = 0; i < count && j < transferSize; i += 1, j += 1) {
			if (dst >= wrapAt) dst = wrapTo;
			*dst = *src;
			src++;
			dst++;
		}
		src += srcAdjust;
		dst += dstAdjust;
	}
}

void handleDMA(ubyte dmap, ubyte bbad, const(void)* a1t, ushort das) {
	assert((dmap & 0x80) == 0); // Can't go from B bus to A bus
	assert((dmap & 0x10) == 0); // Can't decrement pointer
	ubyte* dest, wrapAt, wrapTo;
	int transferSize = 1, srcAdjust = 0, dstAdjust = 0;
	if (bbad == 0x04) {
		// Dest is OAM
		assert((dmap & 0x07) == 0);
		wrapTo = cast(ubyte *)(&g_frameData.oam1);
		dest = wrapTo + ((OAMADDL | (OAMADDH & 3) << 8) << 1);
		wrapAt = wrapTo + 0x220;
	} else if (bbad == 0x18 || bbad == 0x19) {
		// Dest is VRAM
		auto hibyte = bbad == 0x19;
		// Ensure we're only doing single byte to $2119
		assert(!hibyte || (dmap & 0x07) == 0);
		// Set transfer size
		// Ensure we're either copying one or two bytes
		assert((dmap & 0x07) <= 1);
		if ((dmap & 0x07) == 1) {
			transferSize = 2;
			dstAdjust = 0;
		} else {
			transferSize = 1;
			dstAdjust = 1; // skip byte when copying
		}
		// Handle VMAIN
		auto addrIncrementAmount = [1, 32, 128, 256][VMAIN & 0x03];
		// Skip ahead by addrIncrementAmount words, less the word we just
		// dealt with by setting transferSize and dstAdjust.
		dstAdjust += (addrIncrementAmount - 1) * 2;
		// Address mapping is not implemented.
		assert((VMAIN & 0x0C) == 0);
		// Address increment is only supported for the used cases:
		// - writing word value and increment after writing $2119
		// - writing byte to $2119 and increment after writing $2119
		// - writing byte to $2118 and increment after writing $2118
		assert((VMAIN & 0x80) || (!hibyte && transferSize == 1));
		wrapTo = cast(ubyte *)(&g_frameData.vram);
		dest = wrapTo + ((VMADDL | VMADDH << 8) << 1 + (hibyte ? 1 : 0));
		wrapAt = wrapTo + 0x10000;
	} else if (bbad == 0x22) {
		// Dest is CGRAM
		assert((dmap & 0x07) == 0);
		wrapTo = cast(ubyte *)(&g_frameData.cgram);
		dest = wrapTo + (CGADD << 1);
		wrapAt = wrapTo + 0x200;
	}
	// If the "Fixed Transfer" bit is set, transfer same data repeatedly
	if ((dmap & 0x08) != 0) srcAdjust = -transferSize;
	// Perform actual copy
	dmaCopy(cast(const(ubyte)*)a1t, dest, wrapAt, wrapTo, das, transferSize, srcAdjust, dstAdjust);
}

void handleHDMA() {
	import std.algorithm.sorting : sort;
	g_frameData.numHdmaWrites = 0;
	auto channels = HDMAEN;
	for(auto i = 0; i < 8; i += 1) {
		if (((channels >> i) & 1) == 0) continue;
		queueHDMA(cast(ubyte)i);
	}
	auto writes = g_frameData.hdmaData[0 .. g_frameData.numHdmaWrites];
	sort!((x,y) => x.vcounter < y.vcounter)(writes);
	if (writes.length > 0) {
		debug(printHDMA) tracef("Transfer: %s", writes);
	}
}

void queueHDMA(ubyte channelID) {
	import earthbound.hardware : dmaChannels, HDMAIndirectTableEntry;
	import std.experimental.logger : tracef;
	static void readTable(const(ubyte)* data, ubyte mode, ubyte lines, ubyte lineBase, ubyte baseAddr, bool always, bool increment, ubyte channel, HDMAWrite[] buffer, out size_t count) {
		const(ubyte)[] chunk;
		ubyte numBytes;
		bool shortSized;
		switch (mode) {
			case 0b000:
				numBytes = 1;
				shortSized = false;
				break;
			case 0b001:
				numBytes = 2;
				shortSized = false;
				break;
			case 0b010:
				numBytes = 2;
				shortSized = true;
				break;
			case 0b011:
				numBytes = 4;
				shortSized = true;
				break;
			case 0b100:
				numBytes = 4;
				shortSized = false;
				break;
			case 0b101:
			case 0b110:
			case 0b111:
			default:
				assert(0, "Invalid DMA mode");
		}
		if (increment) {
			chunk = data[0 .. numBytes * lines];
		} else {
			chunk = data[0 .. numBytes];
		}
		auto lineChunk = chunk[0 .. numBytes];
		ushort line = 1;
		do {
			if (increment) {
				lineChunk = chunk[line * numBytes .. line * numBytes + numBytes];
				line++;
			}
			foreach (o; 0 .. numBytes) {
				const addr = cast(ubyte)(baseAddr + o / (1 + shortSized));
				buffer[0] = HDMAWrite(lineBase, addr, chunk[o]);
				buffer = buffer[1 .. $];
			}
		} while (always && line < lines); //always bit means value is written EVERY line
		count = line * numBytes;
	}
	assert(channelID < 8);
	const channel = dmaChannels[channelID];
	const dmap = channel.DMAP;
	const indirect = !!(dmap & 0b01000000);
	const mode = (dmap & 0b00000111);
	const autoIncrement = !!(dmap&0b00001000);
	const decrement = !!(dmap&0b00010000);
	assert(!autoIncrement && !decrement, "autoincrement is unimplemented");
	ubyte lineBase = 0;
	ubyte dest = channel.BBAD;
	HDMAWrite[] buffer = g_frameData.hdmaData[g_frameData.numHdmaWrites .. $];
	ubyte lineByte;
	ubyte increment = 1;
	if (!indirect) {
		auto data = cast(const(ubyte)*)channel.A1T;
		while (data[0] != 0) {
			lineByte = data[0];
			const lines = (data[0] == 0x80) ? 128 : (data[0] & 0x7F);
			const always = !!(data[0] & 0x80);
			size_t offset;
			readTable(data + 1, mode, lines, lineBase, dest, always, false, channelID, buffer[g_frameData.numHdmaWrites .. $], offset);
			g_frameData.numHdmaWrites += offset;
			data += offset + 1;
			lineBase += lines;
		}
	} else {
		auto data = cast(const(HDMAIndirectTableEntry)*)channel.A1T;
		while (data[0].lines != 0) {
			const lines = (data[0].lines == 0x80) ? 128 : (data[0].lines & 0x7F);
			const always = !!(data[0].lines & 0x80);
			auto addr = data[0].address;
			size_t offset;
			// Indirect tables always auto-increment when always bit is set? Should figure out if this is controlled by something
			readTable(addr, mode, lines, lineBase, dest, always, always, channelID, buffer[g_frameData.numHdmaWrites .. $], offset);
			g_frameData.numHdmaWrites += offset;
			lineBase += lines;
			data++;
		}
	}
	debug(printHDMA) tracef("Performing HDMA %s (mode: %s, indirect: %s, dest: %04X, autoinc: %s, dec: %s)", channelID, mode, indirect, channel.BBAD + 0x2100, autoIncrement, decrement);
}
