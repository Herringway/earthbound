module sfcdma;
import snesdrawframedata;
import earthbound.hardware;

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

void handleDma() {
    auto channels = MDMAEN;
    for(auto i = 0; i < 8; i += 1) {
        if (((channels >> i) & 1) == 0) continue;
        auto dmap = dmaChannels[i].DMAP;
        auto bbad = dmaChannels[i].BBAD;
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
        dmaCopy(cast(const(ubyte)*)dmaChannels[i].A1T, dest, wrapAt, wrapTo,
                dmaChannels[i].DAS, transferSize, srcAdjust, dstAdjust);
    }
    MDMAEN = 0;
}
