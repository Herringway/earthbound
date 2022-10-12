module gamepad;

import misc;

import std.experimental.logger;
import std.string;

import bindbc.sdl;

import earthbound.commondefs;
import earthbound.hardware;

void handleSNESButton(ushort val, bool pressed, uint playerID) {
	if (pressed) {
		if (playerID == 1) {
			JOYPAD_1_DATA |= val;
		} else {
			JOYPAD_2_DATA |= val;
		}
	} else {
		if (playerID == 1) {
			JOYPAD_1_DATA &= cast(ushort)~cast(uint)val;
		} else {
			JOYPAD_2_DATA &= cast(ushort)~cast(uint)val;
		}
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
		SDL_Scancode.SDL_SCANCODE_9: Controller.printRegisters,
		SDL_Scancode.SDL_SCANCODE_0: Controller.dumpVRAM,
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
	dumpVRAM,
	dumpEntities,
	skipFrame,
	printRegisters,
	exit
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
