module earthbound.testing;

import earthbound.bank00;
import earthbound.bank02;
import earthbound.commondefs;
import earthbound.globals;
import earthbound.hardware;

void demoReplayStart(DemoEntry[] demo)
	in(demo.length > 0, "Cannot replay empty demo")
	in(demo[$ - 1].frames == 0, "Demo must end with a 0-frame input")
{
	earthbound.bank00.demoReplayStart(&demo[0]);
}

alias FrameTestFunction = void delegate(uint);
private FrameTestFunction frameTestDelegate;
void initializeForTesting() {
	waitForInterrupt = &irqNMICommon;
	dmaQueueIndex = 0;

	INIDISP = 0x80;
	mirrorINIDISP = 0x80;

	// clearing the heap would happen here

	currentHeapAddress = &heap[0][0];
	heapBaseAddress = &heap[0][0];
	randA = 0x1234;
	randB = 0x5678;
	nextFrameBufferID = 1;
	irqCallback = &defaultIRQCallback;
	renderFirstFrame();
	clearSpriteTable();
	initializeEntitySubsystem();
	initializeTextSystem();
}
void runGameTest(alias fun)(FrameTestFunction perFrameTests, string demo) {
	runGameTest!fun(perFrameTests, generateDemoFromString(demo));
}
void runGameTest(alias fun)(FrameTestFunction perFrameTests, DemoEntry[] demo = [DemoEntry.init]) {
	static void interruptFunction() {
		static uint frame = 0;
		irqNMICommon();
		frameTestDelegate(frame++);
	}

	initializeForTesting();

	frameTestDelegate = perFrameTests;
	waitForInterrupt = &interruptFunction;
	scope(exit) {
		waitForInterrupt = () {};
		frameTestDelegate = null;
	}

	if (demo) {
		demoReplayStart(demo);
	}

	fun();
	demoRecordingEnd();
}

unittest {
	static void waitOneFrame() {
		waitUntilNextFrame();
	}
	bool ran;
	runGameTest!waitOneFrame((frame) {
		assert(!ran);
		ran = true;
	});
	assert(ran);
}

DemoEntry[] generateDemoFromString(string str) @safe pure {
	import std.algorithm.searching : countUntil;
	import std.ascii : isDigit;
	import std.conv : to;
	import std.range : front;
	DemoEntry[] result;
	DemoEntry next;
	void finalizeState() {
		result ~= next;
		next = next.init;
	}
	void addButton(ushort button) {
		next.padState |= button;
		next.frames = 1;
	}
	while (str != "") {
		switch (str.front) {
			case '.':
				addButton(0);
				str = str[1 .. $];
				break;
			case 'a':
				addButton(Pad.a);
				str = str[1 .. $];
				break;
			case 'b':
				addButton(Pad.b);
				str = str[1 .. $];
				break;
			case 'x':
				addButton(Pad.x);
				str = str[1 .. $];
				break;
			case 'y':
				addButton(Pad.y);
				str = str[1 .. $];
				break;
			case '^':
				addButton(Pad.up);
				str = str[1 .. $];
				break;
			case 'v':
				addButton(Pad.down);
				str = str[1 .. $];
				break;
			case '>':
				addButton(Pad.right);
				str = str[1 .. $];
				break;
			case '<':
				addButton(Pad.left);
				str = str[1 .. $];
				break;
			case 'l':
				addButton(Pad.l);
				str = str[1 .. $];
				break;
			case 'r':
				addButton(Pad.r);
				str = str[1 .. $];
				break;
			case 's':
				addButton(Pad.select);
				str = str[1 .. $];
				break;
			case 'S':
				addButton(Pad.start);
				str = str[1 .. $];
				break;
			case '/':
				str = str[1 .. $];
				finalizeState();
				break;
			case '0': .. case '9':
				const found = str.countUntil!(x => !x.isDigit);
				const endOfNumbers = found == -1 ? str.length : found;
				next.frames = str[0 .. endOfNumbers].to!ubyte;
				str = str[endOfNumbers .. $];
				finalizeState();
				break;
			default:
				assert(0, "Unknown demo char");
		}
	}
	if (next.frames != 0) {
		result ~= next;
	}
	result ~= DemoEntry.init;
	return result;
}
@safe pure unittest {
	assert(generateDemoFromString("") == [DemoEntry()]);
	assert(generateDemoFromString(".") == [DemoEntry(frames: 1, padState: 0), DemoEntry()]);
	assert(generateDemoFromString("./.") == [DemoEntry(frames: 1, padState: 0), DemoEntry(frames: 1, padState: 0), DemoEntry()]);
	assert(generateDemoFromString("a") == [DemoEntry(frames: 1, padState: Pad.a), DemoEntry()]);
	assert(generateDemoFromString("ab") == [DemoEntry(frames: 1, padState: Pad.a | Pad.b), DemoEntry()]);
	assert(generateDemoFromString("xy20") == [DemoEntry(frames: 20, padState: Pad.x | Pad.y), DemoEntry()]);
	assert(generateDemoFromString("xy20ab") == [DemoEntry(frames: 20, padState: Pad.x | Pad.y), DemoEntry(frames: 1, padState: Pad.a | Pad.b), DemoEntry()]);
	assert(generateDemoFromString(".20") == [DemoEntry(frames: 20, padState: 0), DemoEntry()]);
}

void prettyCompare(string fmt = "%s", T)(const T[] value1, const T[] value2, string file = __FILE__, size_t line = __LINE__) {
	import core.exception : AssertError;
	import std.range : zip;
	import std.stdio : write, writef, writeln;
	if (value1 != value2) {
		foreach (a, b; zip(value1, value2)) {
			if (a != b) {
				write("\x1B[1;31m");
			} else {
				write("\x1B[1;32m");
			}
			writef!fmt(a);
			write(" ");
		}
		writeln("\x1B[0m");
		throw new AssertError("Assertion failure", file, line);
	}
}
