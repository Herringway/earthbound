module gamepad;

import misc;

import std.experimental.logger;
import std.file;
import std.string;

import bindbc.sdl;

import earthbound.commondefs;

void initializeGamepad() {
	enforceSDL(SDL_InitSubSystem(SDL_INIT_GAMECONTROLLER) == 0, "Couldn't initialise controller SDL subsystem");
	if ("gamecontrollerdb.txt".exists) {
		if (SDL_GameControllerAddMappingsFromFile("gamecontrollerdb.txt") < 0) {
			SDLError("Error loading game controller database");
		} else {
			info("Successfully loaded game controller database");
		}
	}
	SDL_GameControllerEventState(SDL_ENABLE);
	info("SDL game controller subsystem initialized");
}

void uninitializeGamepad() {
	//nothing to do here
}

ushort getControllerState(ushort id) {
	return input.gameInput[id];
}

void handleSNESButton(ushort val, bool pressed, uint playerID) {
	if (pressed) {
		input.gameInput[playerID - 1] |= val;
	} else {
		input.gameInput[playerID - 1] &= cast(ushort)~val;
	}
}

void connectGamepad(int id) {
	if (SDL_IsGameController(id)) {
		if (auto controller = SDL_GameControllerOpen(id)) {
			SDL_GameControllerSetPlayerIndex(controller, 1);
			const(char)* name = SDL_GameControllerNameForIndex(id);
			infof("Initialized controller: %s", name.fromStringz);
		} else {
			SDLError("Error opening controller: %s");
		}
	}
}

void disconnectGamepad(int id) {
	if (auto controller = SDL_GameControllerFromInstanceID(id)) {
		infof("Controller disconnected: %s", SDL_GameControllerName(controller).fromStringz);
		SDL_GameControllerClose(controller);
	}
}

auto getDefaultGamepadAxisMapping() pure @safe {
	return [
		SDL_CONTROLLER_AXIS_LEFTX: AxisMapping.leftRight,
		SDL_CONTROLLER_AXIS_LEFTY: AxisMapping.upDown,
	];
}
auto getDefaultGamepadMapping() pure @safe {
	return [
		SDL_CONTROLLER_BUTTON_X : Controller.y,
		SDL_CONTROLLER_BUTTON_A : Controller.b,
		SDL_CONTROLLER_BUTTON_B : Controller.a,
		SDL_CONTROLLER_BUTTON_Y : Controller.x,
		SDL_CONTROLLER_BUTTON_START : Controller.start,
		SDL_CONTROLLER_BUTTON_BACK : Controller.select,
		SDL_CONTROLLER_BUTTON_LEFTSHOULDER : Controller.l,
		SDL_CONTROLLER_BUTTON_RIGHTSHOULDER : Controller.r,
		SDL_CONTROLLER_BUTTON_DPAD_UP : Controller.up,
		SDL_CONTROLLER_BUTTON_DPAD_DOWN : Controller.down,
		SDL_CONTROLLER_BUTTON_DPAD_LEFT : Controller.left,
		SDL_CONTROLLER_BUTTON_DPAD_RIGHT : Controller.right,
	];
}
auto getDefaultKeyboardMapping() pure @safe {
	return [
		SDL_Scancode.SDL_SCANCODE_S: Controller.b,
		SDL_Scancode.SDL_SCANCODE_A: Controller.y,
		SDL_Scancode.SDL_SCANCODE_X: Controller.select,
		SDL_Scancode.SDL_SCANCODE_Z: Controller.start,
		SDL_Scancode.SDL_SCANCODE_UP: Controller.up,
		SDL_Scancode.SDL_SCANCODE_DOWN: Controller.down,
		SDL_Scancode.SDL_SCANCODE_LEFT: Controller.left,
		SDL_Scancode.SDL_SCANCODE_RIGHT: Controller.right,
		SDL_Scancode.SDL_SCANCODE_D: Controller.a,
		SDL_Scancode.SDL_SCANCODE_W: Controller.x,
		SDL_Scancode.SDL_SCANCODE_Q: Controller.l,
		SDL_Scancode.SDL_SCANCODE_E: Controller.r,
		SDL_Scancode.SDL_SCANCODE_P: Controller.pause,
		SDL_Scancode.SDL_SCANCODE_BACKSLASH: Controller.skipFrame,
		SDL_Scancode.SDL_SCANCODE_GRAVE: Controller.fastForward,
		SDL_Scancode.SDL_SCANCODE_ESCAPE: Controller.exit
	];
}

enum Controller {
	up,
	down,
	left,
	right,
	l,
	r,
	select,
	start,
	a,
	b,
	x,
	y,
	extra1,
	extra2,
	extra3,
	extra4,
	fastForward,
	pause,
	skipFrame,
	exit
}

enum AxisMapping {
	upDown,
	leftRight,
	l,
	r,
	select,
	start,
	a,
	b,
	x,
	y,
	extra1,
	extra2,
	extra3,
	extra4,
	fastForward,
	pause,
	skipFrame,
	exit,
}

Pad controllerToPad(Controller button) @safe pure {
	switch (button) {
		case Controller.up: return Pad.up;
		case Controller.down: return Pad.down;
		case Controller.left: return Pad.left;
		case Controller.right: return Pad.right;
		case Controller.l: return Pad.l;
		case Controller.r: return Pad.r;
		case Controller.select: return Pad.select;
		case Controller.start: return Pad.start;
		case Controller.a: return Pad.a;
		case Controller.b: return Pad.b;
		case Controller.x: return Pad.x;
		case Controller.y: return Pad.y;
		case Controller.extra1: return Pad.extra1;
		case Controller.extra2: return Pad.extra2;
		case Controller.extra3: return Pad.extra3;
		case Controller.extra4: return Pad.extra4;
		default: assert(0, "No mapping available for this button");
	}
}

Pad controllerAxisToPad(AxisMapping mapping) @safe pure {
	switch (mapping) {
		case AxisMapping.l: return Pad.l;
		case AxisMapping.r: return Pad.r;
		case AxisMapping.select: return Pad.select;
		case AxisMapping.start: return Pad.start;
		case AxisMapping.a: return Pad.a;
		case AxisMapping.b: return Pad.b;
		case AxisMapping.x: return Pad.x;
		case AxisMapping.y: return Pad.y;
		case AxisMapping.extra1: return Pad.extra1;
		case AxisMapping.extra2: return Pad.extra2;
		case AxisMapping.extra3: return Pad.extra3;
		case AxisMapping.extra4: return Pad.extra4;
		default: assert(0, "No mapping available for this button");
	}
}


void handleButton(Controller button, bool pressed, uint playerID) {
	final switch (button) {
		case Controller.up, Controller.down, Controller.left, Controller.right, Controller.l, Controller.r, Controller.select, Controller.start, Controller.a, Controller.b, Controller.x, Controller.y, Controller.extra1, Controller.extra2, Controller.extra3, Controller.extra4:
			handleSNESButton(cast(ushort)controllerToPad(button), pressed, playerID);
			break;
		case Controller.fastForward:
			input.fastForward = pressed;
			break;
		case Controller.pause:
			input.pause = pressed;
			break;
		case Controller.skipFrame:
			input.step = pressed;
			break;
		case Controller.exit:
			input.exit = pressed;
			break;
	}
}
void handleAxis(uint playerID, AxisMapping axis, short value) {
	enum upper = short.max / 2;
	enum lower = short.min / 2;
	const pressed = (value >= upper) || (value <= lower);
	final switch (axis) {
		case AxisMapping.upDown:
			handleSNESButton(cast(ushort)controllerToPad(Controller.down), value >= upper, playerID);
			handleSNESButton(cast(ushort)controllerToPad(Controller.up), value <= lower, playerID);
			break;
		case AxisMapping.leftRight:
			handleSNESButton(cast(ushort)controllerToPad(Controller.right), value >= upper, playerID);
			handleSNESButton(cast(ushort)controllerToPad(Controller.left), value <= lower, playerID);
			break;
		case AxisMapping.l, AxisMapping.r, AxisMapping.select, AxisMapping.start, AxisMapping.a, AxisMapping.b, AxisMapping.x, AxisMapping.y, AxisMapping.extra1, AxisMapping.extra2, AxisMapping.extra3, AxisMapping.extra4:
			handleSNESButton(cast(ushort)controllerAxisToPad(axis), pressed, playerID);
			break;
		case AxisMapping.fastForward:
			input.fastForward = pressed;
			break;
		case AxisMapping.pause:
			input.pause = pressed;
			break;
		case AxisMapping.skipFrame:
			input.step = pressed;
			break;
		case AxisMapping.exit:
			input.exit = pressed;
			break;
	}
}

struct Input {
	ushort[2] gameInput;
	bool exit;
	bool pause;
	bool step;
	bool fastForward;
}

Input input;
