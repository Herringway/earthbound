module spc;

import earthbound.globals : unknown7E001E;

import registers;

__gshared const(ubyte)* spcDataPointer; /// $00C6

__gshared ubyte soundEffectQueueEndIndex; /// $00CA
__gshared ubyte soundEffectQueueIndex; /// $00CB

__gshared ubyte[8] soundEffectQueue; /// $1AC2
__gshared ubyte unknown7E1ACA; /// $1ACA
__gshared ubyte unknown7E1ACB; /// $1ACB

__gshared ushort currentPrimarySamplePack; /// $B53D
__gshared ushort currentSecondarySamplePack; /// $B53F
__gshared ushort currentSequencePack; /// $B541
__gshared short unknown7EB543; /// $B543

///
struct MusicDataset {
	ubyte primarySamplePack; ///
	ubyte secondarySamplePack; ///
	ubyte sequencePack; ///
}
///
struct MusicPackPointer {
	//ubyte bank;
	const(ubyte)* addr; ///
}

void initialize() {
	currentSequencePack = 0xFFFF;
	currentPrimarySamplePack = 0xFFFF;
	unknown7EB543 = musicDatasetTable[0].sequencePack;
	currentSecondarySamplePack = musicDatasetTable[0].sequencePack;
	//loadSPC700Data(musicPackPointerTable[musicDatasetTable[0].sequencePack].addr & unknown7EB547, unknownC4FB42(musicPackPointerTable[musicDatasetTable[0].sequencePack].bank));
	loadSPC700Data(&musicPackPointerTable[musicDatasetTable[0].sequencePack][0]);
}


/// $C0ABA8
void waitForSPC700() {
	*APUIO2 = 0;
	*APUIO0 = 0;
	do {
		*APUIO0 = 0xFF;
		*APUIO1 = 0x00;
	} while ((*APUIO0 != 0xAA) || (*APUIO1 != 0xBB));
}


/// $C0ABC6
void stopMusic() {
	*APUIO0 = 0;
	while (unknownC0AC20() != 0) {}
}

void doMusicEffect(short effect) {
	*APUIO1 = cast(ubyte)(effect | unknown7E1ACB);
	unknown7E1ACB ^= 0x80;
}


/// $C0AC20
ubyte unknownC0AC20() {
	return *APUIO0;
}

/// $C0AC2C
immutable ubyte[14] stereoMonoData = [
	0x01, 0x00, 0x31, 0x04, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x31, 0x04, 0x01, 0x00, 0x00,
];

/// $C0AC3A
void setStatic(short arg1) {
	*APUIO2 = cast(ubyte)arg1;
}

/// $C0ABE0 - Play a sound effect
void playSfx(short sfx) {
	if (sfx != 0) {
		soundEffectQueue[soundEffectQueueEndIndex] = cast(ubyte)(sfx | unknown7E1ACA);
		soundEffectQueueEndIndex = (soundEffectQueueEndIndex + 1) & 7;
		unknown7E1ACA ^= 0x80;
		return;
	}
	playSfxUnknown();
}
void playSfxUnknown() {
	*APUIO3 = 0x57;
}

/// $C08501
void processSfxQueue() {
	if (soundEffectQueueIndex == soundEffectQueueEndIndex) {
		return;
	}
	*APUIO3 = soundEffectQueue[soundEffectQueueIndex];
	soundEffectQueueIndex = (soundEffectQueueIndex + 1) & 7;
}

/// $C0ABBD
void unknownC0ABBD(short arg1) {
	*APUIO0 = cast(ubyte)arg1;
}

void setMusicChannels(ushort channels) {
	if (channels == 0) {
		loadSPC700Data(&stereoMonoData[7]);
	} else {
		loadSPC700Data(&stereoMonoData[0]);
	}
}

/// $C0ABC6
//original version had separate bank/addr parameters
void loadSPC700Data(const(ubyte)* data) {
	spcDataPointer = data;
	//unknown7E00C8 = bank;
	ushort y = 0;
	ubyte b;
	if ((*APUIO0 != 0xAA) || (*APUIO1 != 0xBB)) {
		waitForSPC700();
	}
	unknown7E001E &= 0x7F;
	*NMITIMEN = unknown7E001E;
	ubyte a = 0xCC;
	ushort x;
	// proceed at your own peril.
	// definitely going to have to triple check this one later
	goto l7;
	l1:
		b = spcDataPointer[y++];
		a = 0;
		goto l4;
	l2:
		b = spcDataPointer[y++];
		while (*APUIO0 != a) {}
		a++;
	l4:
		*APUIO0 = a;
		*APUIO1 = b;
		if (--x != 0) {
			goto l2;
		}
		while(*APUIO0 != a) {}
		while((a += 3) == 0) {}
	l7:
		ubyte tmpA = a;
		x = cast(ushort)(a | (b << 8));
		if (spcDataPointer[y] != 0) {
			a = 0;
			b = 5;
		} else {
			y += 2;
			a = spcDataPointer[y];
			b = spcDataPointer[y + 1];
			y += 2;
		}
		*APUIO2 = a;
		*APUIO3 = b;
		*APUIO1 = x < 1;
		a = tmpA;
		*APUIO0 = a;
		while (*APUIO0 != a) {}
		if (x < 1) {
			goto l1;
		}
		while (*APUIO0 != 0 || *APUIO1 != 0) {}
		unknown7E001E |= 0x80;
		*NMITIMEN = unknown7E001E;
}

void playMusic(ushort track) {
	const(MusicDataset)* dataset = &musicDatasetTable[track - 1];
	if ((dataset.primarySamplePack != currentPrimarySamplePack) || (dataset.primarySamplePack != 0xFF)) {
		currentPrimarySamplePack = dataset.primarySamplePack;
		loadSPC700Data(&musicPackPointerTable[dataset.primarySamplePack][0]);
	}
	if ((dataset.secondarySamplePack != currentSecondarySamplePack) || (dataset.secondarySamplePack != 0xFF)) {
		currentSecondarySamplePack = dataset.secondarySamplePack;
		loadSPC700Data(&musicPackPointerTable[dataset.secondarySamplePack][0]);
	}
	if ((dataset.sequencePack != currentSequencePack) || (dataset.sequencePack != 0xFF)) {
		currentSequencePack = dataset.sequencePack;
		loadSPC700Data(&musicPackPointerTable[dataset.sequencePack][0]);
	}
	unknownC0ABBD(track);
}

/// $C4F70D
immutable MusicDataset[191] musicDatasetTable = [
	MusicDataset(0x00, 0xFF, 0x01),
	MusicDataset(0x02, 0x03, 0x04),
	MusicDataset(0x02, 0x03, 0x04),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0x06),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0x07),
	MusicDataset(0x05, 0x08, 0x09),
	MusicDataset(0x05, 0x08, 0x0A),
	MusicDataset(0x05, 0x08, 0x0B),
	MusicDataset(0x05, 0x08, 0x0C),
	MusicDataset(0x05, 0x08, 0x0D),
	MusicDataset(0x05, 0x08, 0x0E),
	MusicDataset(0x05, 0x08, 0x0F),
	MusicDataset(0x05, 0x08, 0x10),
	MusicDataset(0x05, 0x08, 0x11),
	MusicDataset(0x05, 0x08, 0x12),
	MusicDataset(0x05, 0x08, 0x13),
	MusicDataset(0x05, 0x08, 0x13),
	MusicDataset(0x05, 0x08, 0x14),
	MusicDataset(0x05, 0x15, 0x16),
	MusicDataset(0x05, 0xFF, 0x17),
	MusicDataset(0x05, 0xFF, 0x17),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x15, 0x1A),
	MusicDataset(0x05, 0x1B, 0x1C),
	MusicDataset(0x05, 0x1B, 0x1D),
	MusicDataset(0x05, 0x1B, 0x1E),
	MusicDataset(0x05, 0x1B, 0x1F),
	MusicDataset(0x05, 0x08, 0x20),
	MusicDataset(0x05, 0x21, 0x22),
	MusicDataset(0x05, 0x23, 0x24),
	MusicDataset(0x05, 0x25, 0x26),
	MusicDataset(0x05, 0x25, 0x27),
	MusicDataset(0x05, 0x28, 0x29),
	MusicDataset(0x05, 0x2A, 0x2B),
	MusicDataset(0x05, 0x2C, 0x2D),
	MusicDataset(0x05, 0x08, 0x2E),
	MusicDataset(0x05, 0x2F, 0x30),
	MusicDataset(0x05, 0x2F, 0x31),
	MusicDataset(0x05, 0x32, 0x33),
	MusicDataset(0x05, 0x34, 0x35),
	MusicDataset(0x05, 0x36, 0x37),
	MusicDataset(0x05, 0x38, 0x39),
	MusicDataset(0x05, 0x3A, 0x3B),
	MusicDataset(0x05, 0x3C, 0x3D),
	MusicDataset(0x05, 0x3C, 0x3E),
	MusicDataset(0x05, 0x3C, 0x3F),
	MusicDataset(0x05, 0x40, 0x41),
	MusicDataset(0x05, 0x42, 0x43),
	MusicDataset(0x05, 0x18, 0x44),
	MusicDataset(0x05, 0x18, 0x45),
	MusicDataset(0x05, 0x46, 0x47),
	MusicDataset(0x05, 0x48, 0x49),
	MusicDataset(0x05, 0x4A, 0x4B),
	MusicDataset(0x05, 0x4C, 0x4D),
	MusicDataset(0x05, 0x4C, 0x4D),
	MusicDataset(0x05, 0x4E, 0x4F),
	MusicDataset(0x05, 0x50, 0x51),
	MusicDataset(0x05, 0x52, 0x53),
	MusicDataset(0x05, 0x54, 0x55),
	MusicDataset(0x05, 0x54, 0x56),
	MusicDataset(0x05, 0x54, 0x57),
	MusicDataset(0x05, 0x46, 0x58),
	MusicDataset(0x05, 0x59, 0x5A),
	MusicDataset(0x05, 0x2C, 0x5B),
	MusicDataset(0x05, 0x5C, 0x5D),
	MusicDataset(0x05, 0x2C, 0x5E),
	MusicDataset(0x05, 0x2C, 0x5E),
	MusicDataset(0x05, 0x5F, 0x60),
	MusicDataset(0x05, 0x2C, 0x61),
	MusicDataset(0x05, 0x62, 0x63),
	MusicDataset(0x05, 0x23, 0x64),
	MusicDataset(0x05, 0xFF, 0x65),
	MusicDataset(0x05, 0xFF, 0x66),
	MusicDataset(0x05, 0xFF, 0x67),
	MusicDataset(0x05, 0x54, 0x68),
	MusicDataset(0x05, 0x69, 0x6A),
	MusicDataset(0x05, 0x54, 0x6B),
	MusicDataset(0x6C, 0xFF, 0x6D),
	MusicDataset(0x05, 0x6E, 0x6F),
	MusicDataset(0x05, 0x6E, 0x70),
	MusicDataset(0x05, 0x6E, 0x71),
	MusicDataset(0x05, 0x72, 0x73),
	MusicDataset(0x05, 0x74, 0x75),
	MusicDataset(0x05, 0x76, 0x77),
	MusicDataset(0x05, 0x76, 0x78),
	MusicDataset(0x05, 0x15, 0x79),
	MusicDataset(0x05, 0x7A, 0x7B),
	MusicDataset(0x05, 0x7C, 0x7D),
	MusicDataset(0x05, 0x7E, 0x7F),
	MusicDataset(0x05, 0x7E, 0x80),
	MusicDataset(0x05, 0x15, 0x81),
	MusicDataset(0x05, 0x2C, 0x5E),
	MusicDataset(0x05, 0x2C, 0x5E),
	MusicDataset(0x05, 0xFF, 0x82),
	MusicDataset(0x05, 0x83, 0x0E),
	MusicDataset(0x05, 0x83, 0x0E),
	MusicDataset(0x05, 0x83, 0x84),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0x83, 0x85),
	MusicDataset(0x05, 0x15, 0x86),
	MusicDataset(0x05, 0x83, 0x84),
	MusicDataset(0x05, 0xFF, 0x87),
	MusicDataset(0x05, 0x08, 0x88),
	MusicDataset(0x05, 0x83, 0x84),
	MusicDataset(0x05, 0x21, 0x22),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0x89),
	MusicDataset(0x05, 0x2F, 0x8A),
	MusicDataset(0x05, 0xFF, 0x67),
	MusicDataset(0x05, 0xFF, 0x67),
	MusicDataset(0x05, 0x8B, 0x8C),
	MusicDataset(0x05, 0x8B, 0x8D),
	MusicDataset(0x05, 0x54, 0x57),
	MusicDataset(0x05, 0x08, 0x8E),
	MusicDataset(0x05, 0xFF, 0x8F),
	MusicDataset(0x05, 0x1B, 0x90),
	MusicDataset(0x05, 0x72, 0x91),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0x25, 0x26),
	MusicDataset(0x05, 0x08, 0x0A),
	MusicDataset(0x05, 0x08, 0x0A),
	MusicDataset(0x05, 0x08, 0x0A),
	MusicDataset(0x05, 0x59, 0x92),
	MusicDataset(0x05, 0x72, 0x73),
	MusicDataset(0x05, 0xFF, 0x93),
	MusicDataset(0x05, 0x18, 0x94),
	MusicDataset(0x05, 0x36, 0x37),
	MusicDataset(0x05, 0x1B, 0x1C),
	MusicDataset(0x05, 0x2C, 0x61),
	MusicDataset(0x05, 0x83, 0x95),
	MusicDataset(0x05, 0x54, 0x96),
	MusicDataset(0x05, 0x54, 0x96),
	MusicDataset(0x05, 0x83, 0x85),
	MusicDataset(0x05, 0x1B, 0x97),
	MusicDataset(0x05, 0x83, 0x95),
	MusicDataset(0x05, 0x83, 0x85),
	MusicDataset(0x05, 0x83, 0x98),
	MusicDataset(0x05, 0xFF, 0x91),
	MusicDataset(0x05, 0x83, 0x95),
	MusicDataset(0x02, 0x99, 0x9A),
	MusicDataset(0x02, 0x03, 0x04),
	MusicDataset(0x05, 0x2C, 0x9B),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x18, 0x9E),
	MusicDataset(0x05, 0x38, 0x9F),
	MusicDataset(0x05, 0x2F, 0xA0),
	MusicDataset(0x05, 0xA1, 0xA2),
	MusicDataset(0x05, 0x08, 0x88),
	MusicDataset(0x00, 0xFF, 0x01),
	MusicDataset(0x02, 0x99, 0xA3),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0x83, 0x85),
	MusicDataset(0x05, 0x3C, 0xA4),
	MusicDataset(0x05, 0xA5, 0xA6),
	MusicDataset(0x05, 0xA1, 0xA2),
	MusicDataset(0x05, 0xFF, 0x66),
	MusicDataset(0x05, 0x52, 0x53),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0x4E, 0x4F),
	MusicDataset(0x05, 0x4C, 0xA7),
	MusicDataset(0x05, 0x4E, 0x4F),
	MusicDataset(0x05, 0x2F, 0xA8),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x52, 0x53),
	MusicDataset(0x05, 0x50, 0x51),
];

immutable ubyte[][169] musicPackPointerTable = [
	cast(immutable(ubyte)[])import("audiopacks/0.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/1.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/2.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/3.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/4.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/5.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/6.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/7.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/8.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/9.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/10.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/11.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/12.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/13.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/14.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/15.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/16.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/17.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/18.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/19.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/20.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/21.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/22.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/23.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/24.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/25.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/26.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/27.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/28.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/29.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/30.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/31.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/32.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/33.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/34.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/35.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/36.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/37.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/38.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/39.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/40.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/41.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/42.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/43.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/44.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/45.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/46.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/47.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/48.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/49.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/50.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/51.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/52.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/53.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/54.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/55.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/56.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/57.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/58.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/59.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/60.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/61.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/62.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/63.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/64.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/65.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/66.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/67.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/68.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/69.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/70.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/71.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/72.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/73.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/74.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/75.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/76.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/77.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/78.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/79.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/80.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/81.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/82.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/83.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/84.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/85.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/86.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/87.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/88.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/89.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/90.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/91.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/92.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/93.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/94.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/95.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/96.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/97.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/98.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/99.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/100.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/101.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/102.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/103.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/104.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/105.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/106.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/107.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/108.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/109.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/110.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/111.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/112.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/113.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/114.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/115.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/116.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/117.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/118.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/119.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/120.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/121.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/122.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/123.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/124.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/125.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/126.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/127.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/128.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/129.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/130.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/131.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/132.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/133.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/134.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/135.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/136.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/137.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/138.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/139.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/140.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/141.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/142.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/143.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/144.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/145.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/146.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/147.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/148.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/149.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/150.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/151.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/152.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/153.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/154.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/155.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/156.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/157.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/158.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/159.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/160.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/161.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/162.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/163.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/164.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/165.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/166.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/167.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/168.spcpack"),
];
