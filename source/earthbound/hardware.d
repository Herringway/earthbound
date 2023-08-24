/// snes hardware layer
module earthbound.hardware;

///
struct OAMEntry {
	ubyte xCoord; ///
	ubyte yCoord; ///
	ubyte startingTile; ///
	ubyte flags; ///
	///
	bool flipVertical() const {
		return !!(flags & 0b10000000);
	}
	///
	bool flipHorizontal() const {
		return !!(flags & 0b01000000);
	}
	///
	ubyte priority() const {
		return (flags & 0b00110000) >> 4;
	}
	///
	ubyte palette() const {
		return (flags & 0b00001110) >> 1;
	}
	///
	bool nameTable() const {
		return !!(flags & 0b00000001);
	}
}

__gshared ubyte HDMAEN; ///

__gshared ubyte HVBJOY; ///

__gshared ubyte BG1SC; ///
__gshared ubyte BG2SC; ///
__gshared ubyte BG3SC; ///
__gshared ubyte BG4SC; ///
__gshared ubyte BG12NBA; ///
__gshared ubyte BG34NBA; ///

__gshared ubyte BGMODE; ///

__gshared ubyte CGADSUB; ///
__gshared ubyte CGWSEL; ///

__gshared ubyte OBSEL; ///


///
enum DMATransferUnit {
	Byte = 0,
	Word = 1,
	ByteTwice = 2,
	WordTwiceInterlaced = 3,
	Int = 4,
	WordTwice = 5,
	WordCopy = 6,
	WordTwiceInterlacedCopy = 7,
}

///
struct DMAChannel {
	///DMAPx - $43x0
	ubyte DMAP;
	///BBADx - $43x1
	ubyte BBAD;
	/// A1Tx - $43x2
	union {
		struct {
			ubyte A1TL; ///
			ubyte A1TH; ///
			ubyte A1B; ///
		}
		const(void)* A1T; ///
	}
	/// DASx - $43x5
	union {
		struct {
			ubyte DASL; ///
			ubyte DASH; ///
			ubyte DASB; /// HDMA only
		}
		ushort DAS; /// not for HDMA
		const(void)* HDMADAS; ///
	}
	/// A2Ax - $43x8, HDMA only
	union {
		struct {
			ubyte A2AL; ///
			ubyte A2AH; ///
		}
		ushort A2A; ///
	}
	///NTLRx - $43xA - HDMA only
	ubyte NTLR;
	private ubyte[5] __unused;
}

__gshared DMAChannel[8] dmaChannels; ///

__gshared ubyte NMITIMEN; ///
__gshared ubyte INIDISP; ///
__gshared ubyte MOSAIC; ///
__gshared ubyte W12SEL; ///
__gshared ubyte W34SEL; ///
__gshared ubyte WOBJSEL; ///
__gshared ubyte WH0; ///
__gshared ubyte WH1; ///
__gshared ubyte WH2; ///
__gshared ubyte WH3; ///
__gshared ubyte WBGLOG; ///
__gshared ubyte WOBJLOG; ///
__gshared ubyte TM; ///
__gshared ubyte TD; ///
__gshared ubyte TMW; ///
__gshared ubyte TSW; ///
__gshared ubyte STAT78; ///


///
enum CGWSELFlags {
	MainScreenBlackNever = 0<<6,
	MainScreenBlackNotMathWin = 1<<6,
	MainScreenBlackMathWin = 2<<6,
	MainScreenBlackAlways = 3<<6,
	ColourMathEnableAlways = 0 << 4,
	ColourMathEnableMathWin = 1 << 4,
	ColourMathEnableNotMathWin = 2 << 4,
	ColourMathEnableNever = 3 << 4,
	SubscreenBGOBJEnable = 1 << 1,
	SubscreenBGOBJDisable = 0 << 1,
	DirectColour = 1,
	UsePalette = 0,
}

///
enum CGADSUBFlags {
	ColourMathAddsub = 1 << 7,
	ColourMathDiv2 = 1 << 6,
	ColourMathMainIsBackdrop = 1 << 5,
	ColourMathMainIsOBJ47 = 1 << 4,
	ColourMathMainIsBG4 = 1 << 3,
	ColourMathMainIsBG3 = 1 << 2,
	ColourMathMainIsBG2 = 1 << 1,
	ColourMathMainIsBG1 = 1 << 0,
}

///
enum BGR555Mask {
	Red = 0x1F,
	Green = 0x3E0,
	Blue = 0x7C00,
}

align(1) struct HDMAIndirectTableEntry {
	import earthbound.commondefs : skip;
	align(1):
	ubyte lines;
	@skip const(ubyte)* address;
}
