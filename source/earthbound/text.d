module earthbound.text;

import earthbound.actionscripts;
import earthbound.commondefs;

const(ubyte)*[string] textData;

const(ubyte)* getTextBlock(string label) {
	import std.experimental.logger : tracef;
	tracef("Looking for text: %s", label);
	static immutable ubyte[1] r = [2];
	return textData.get(label, &r[0]);
}

ubyte[] textCommand(T...)(ubyte command, T args) {
	return allBytes(command, args);
}

ubyte[] textSubCommand(T...)(ubyte command, ubyte subCommand, T args) {
	return allBytes(command, subCommand, args);
}

T getCCParameters(T)(ubyte lastValue) {
	import earthbound.globals : ccArgumentStorage;
	static assert(T.sizeof - 1 <= ccArgumentStorage.length);
	union Raw {
		ubyte[T.sizeof] raw;
		T structure;
	}
	Raw raw;
	raw.raw[0 .. $ - 1] = ccArgumentStorage[T.sizeof - 1];
	raw.raw[$- 1] = lastValue;
	return raw.structure;
}

T useVariableIfZero(T,U)(T value, U variable) {
	return value == 0 ? (cast(T)variable) : value;
}

enum ReadParameters(T)  = "
	alias ArgType = "~T.stringof~";
	if (ArgType.sizeof - 1 < ccArgumentGatheringLoopCounter) {
		ccArgumentStorage[ccArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &mixin(__FUNCTION__);
	}";

align(1) struct CC1805Arguments {
	align(1):
	ubyte alignment;
	ubyte unused;
}

align(1) struct CC1807Arguments {
	align(1):
	uint value;
	ubyte register;
}

align(1) struct CC180DArguments {
	align(1):
	ubyte character;
	ubyte unknown;
}

align(1) struct CC1905Arguments {
	align(1):
	ubyte character;
	ubyte statusGroup;
	ubyte status;
}

align(1) struct CC1916Arguments {
	align(1):
	ubyte character;
	ubyte statusGroup;
}

alias CC191CArguments = CC1D00Arguments;

align(1) struct CC191DArguments {
	align(1):
	ubyte queuedItem;
	bool remove;
}

align(1) struct CC1922Arguments {
	align(1):
	ubyte character;
	ubyte type;
	ushort target;
}

align(1) struct CC1923Arguments {
	align(1):
	ushort npc;
	ubyte type;
	ushort target;
}

align(1) struct CC1924Arguments {
	align(1):
	ushort entity;
	ubyte type;
	ushort target;
}

align(1) struct CC1A00Arguments {
	align(1):
	ubyte*[4] partyScripts;
	ubyte display;
}

align(1) struct CC1A05Arguments {
	align(1):
	ubyte character;
	ubyte window;
}

align(1) struct CC1C13Arguments {
	align(1):
	ubyte allyAnimation;
	ubyte enemyAnimation;
}

align(1) struct CC1D00Arguments {
	align(1):
	ubyte character;
	ubyte item;
}

alias CC1D0CArguments = CC1D00Arguments;

align(1) struct CC1EArguments {
	align(1):
	ubyte character;
	ubyte amount;
}

align(1) struct CC1E08Arguments {
	align(1):
	ubyte character;
	ubyte level;
}

align(1) struct CC1E09Arguments {
	align(1):
	ubyte character;
	uint amount;
}

align(1) struct CC1F00Arguments {
	align(1):
	ubyte track;
	ubyte unused;
}

align(1) struct CC1F13Arguments {
	align(1):
	ubyte arg1;
	ubyte arg2;
}

align(1) struct CC1F15Arguments {
	align(1):
	ushort sprite;
	ushort actionScript;
	ubyte style;
}

align(1) struct CC1F16Arguments {
	align(1):
	ushort arg1;
	ubyte arg2;
}

align(1) struct CC1F17Arguments {
	align(1):
	ushort arg1;
	ushort arg2;
	ubyte arg3;
}

alias CC1F18Arguments = ubyte[7];
alias CC1F19Arguments = CC1F18Arguments;

align(1) struct CC1F1AArguments {
	align(1):
	ushort tpt;
	ubyte sprite;
}

align(1) struct CC1F1CArguments {
	align(1):
	ubyte character;
	ubyte sprite;
}

align(1) struct CC1F1EArguments {
	align(1):
	ushort tpt;
	ubyte style;
}

align(1) struct CC1F20Arguments {
	align(1):
	ubyte p1;
	ubyte p2;
}

align(1) struct CC1FE1Arguments {
	align(1):
	ubyte tileset;
	ubyte palette;
	ubyte speed;
}

align(1) struct CC1FE4Arguments {
	align(1):
	ushort arg1;
	ubyte arg2;
}

align(1) struct CC1F66Arguments {
	align(1):
	ubyte arg1;
	ubyte arg2;
	string arg3;
}

align(1) struct CC1FEBArguments {
	align(1):
	ubyte arg1;
	ubyte arg2;
}

alias CC1FECArguments = CC1FEBArguments;

align(1) struct CC1FF1Arguments {
	align(1):
	ushort arg1;
	ushort arg2;
}

alias CC1FF2Arguments = CC1FF1Arguments;

align(1) struct CC1FF3Arguments {
	align(1):
	ushort arg1;
	ubyte arg2;
}
