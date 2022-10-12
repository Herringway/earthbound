import registers;
import ppu;
import earthbound.globals;

void main() {}

void start() {
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
