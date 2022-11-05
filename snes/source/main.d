import registers;
import spc;
import ppu;
import earthbound.globals;
import earthbound.bank00;

///
struct SNESHeader {
	char[2] makerCode; ///
	char[4] gameCode; ///
	ushort[5] padding; ///
	char[21] title; ///
	ubyte mapMode; ///
	ubyte romType; ///
	ubyte romSize; ///
	ubyte sramSize; ///
	ubyte destinationCode; ///
	ubyte licenseeCode = 0x33; ///
	ubyte version_; ///
	ushort checksumComplement; ///
	ushort checksum; ///
	void function() unusedNativeVector0; ///
	void function() unusedNativeVector1; ///
	void function() nativeCOP; ///
	void function() nativeBRK; ///
	void function() nativeABORT; ///
	void function() nativeNMI; ///
	void function() unusedNativeVector6; ///
	void function() nativeIRQ; ///
	void function() unusedEmulationVector0; ///
	void function() unusedEmulationVector1; ///
	void function() emulationCOP; ///
	void function() unusedEmulationVector3; ///
	void function() emulationABORT; ///
	void function() emulationNMI; ///
	void function() emulationRESET; ///
	void function() emulationIRQBRK; ///
}

void main() {
	initHardware();
	start();
}

void initHardware() {
	exitEmulationMode();
	*NMITIMEN = 0;
	dmaQueueIndex = 0;

	// stack setup would happen here

	*INIDISP = 0x80;
	mirrorINIDISP = 0x80;
	*OBSEL = 0;
	*OAMADDL = 0;
	*OAMADDH = 0;
	*BGMODE = 0;
	*MOSAIC = 0;
	*BG1SC = 0;
	*BG2SC = 0;
	*BG3SC = 0;
	*BG4SC = 0;
	*BG12NBA = 0;
	*BG34NBA = 0;
	setBGOffsetX(1, 0);
	setBGOffsetY(1, 0);
	setBGOffsetX(2, 0);
	setBGOffsetY(2, 0);
	setBGOffsetX(3, 0);
	setBGOffsetY(3, 0);
	setBGOffsetX(4, 0);
	setBGOffsetY(4, 0);
	*VMAIN = 0x80;
	*VMADDL = 0;
	*VMADDH = 0;
	*M7SEL = 0;
	//yep, repeating again. kinda
	*M7A = 0;
	*M7A = 1;
	*M7B = 0;
	*M7B = 0;
	*M7C = 0;
	*M7C = 0;
	*M7D = 0;
	*M7D = 1;
	*M7X = 0;
	*M7X = 0;
	*M7Y = 0;
	*M7Y = 0;
	*CGADD = 0;
	*W12SEL = 0;
	*W34SEL = 0;
	*WOBJSEL = 0;
	*WH0 = 0;
	*WH1 = 0;
	*WH2 = 0;
	*WH3 = 0;
	*WBGLOG = 0;
	*WOBJLOG = 0;
	*TM = 0x1F;
	*TD = 0;
	*TMW = 0;
	*TSW = 0;
	*CGWSEL = 0;
	*CGADSUB = 0;
	setFixedColourData(0xE0);
	*SETINI = 0;
	*WRMPYA = 0xFF;
	*WRMPYA = 0;
	*WRMPYB = 0;
	*WRDIVL = 0;
	*WRDIVH = 0;
	*WRDIVB = 0;
	*HTIMEL = 0;
	*HTIMEH = 0;
	*VTIMEL = 0;
	*VTIMEH = 0;
	*HDMAEN = 0;
	*MEMSEL = 1;
}

void exitEmulationMode() {
	// figure out how to do this if the time comes
}

/// $C0814F
void irq() {
	if (*TIMEUP & 0x80) {
		serviceInterrupt();
	}
}

void nmi() {
	serviceInterrupt();
}

void serviceInterrupt() {
	irqNMICommon();
	processSfxQueue();
}


immutable SNESHeader header = {
	makerCode: "01",
	gameCode: "MB  ",
	title: "EARTH BOUND          ",
	mapMode: 0x31,
	romType: 0x02,
	romSize: 0x0C,
	sramSize: 0x03,
	destinationCode: 0x01,
	licenseeCode: 0x33,
	version_: 0,
	checksumComplement: 0xBFB7,
	checksum: 0x4048,
	nativeNMI: &nmi,
	nativeIRQ: &irq,
	emulationRESET: &start,
};
