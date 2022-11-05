module input;

import registers;

ushort getControllerState(ushort id) {
	if (id == 0) {
		return *JOYPAD_1_DATA;
	} else {
		return *JOYPAD_2_DATA;
	}
}