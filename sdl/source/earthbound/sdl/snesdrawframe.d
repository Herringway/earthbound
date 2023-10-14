module earthbound.sdl.snesdrawframe;
import earthbound.sdl.rendering;
import bindbc.loader;

public enum ImgW = 512;
public enum ImgH = 448;

extern(C) @nogc nothrow {
	alias plibsfcppu_init = bool function();
	alias plibsfcppu_drawFrame = ushort * function(const(SnesDrawFrameData)* d);
}

__gshared {
	plibsfcppu_init libsfcppu_init;
	plibsfcppu_drawFrame libsfcppu_drawFrame;
}

private {
	SharedLib lib;
}

public bool loadSnesDrawFrame() {
	version(Windows) {
		const(char)[][1] libNames = [
			"libsfcppu.dll",
		];
	} else version(OSX) {
		const(char)[][1] libNames = [
			"libsfcppu.dylib",
		];
	} else version(Posix) {
		const(char)[][1] libNames = [
			"libsfcppu.so",
		];
	} else static assert(0, "libsfcppu is not yet supported on this platform.");

	bool ret;
	foreach(name; libNames) {
		ret = loadDynamicLibrary(name);
		if(ret) break;
	}
	return ret;
}

bool loadDynamicLibrary(const(char)[] libName) {
	lib = load(libName.ptr);
	if(lib == invalidHandle) {
		return false;
	}

	auto errCount = errorCount();
	lib.bindSymbol(cast(void**)&libsfcppu_init, "libsfcppu_init");
	lib.bindSymbol(cast(void**)&libsfcppu_drawFrame, "libsfcppu_drawFrame");
	if(errorCount() != errCount) return false;
	return true;
}


public bool initSnesDrawFrame() {
	assert(libsfcppu_init, "libsfcppu not loaded?");
	return libsfcppu_init();
}

public void drawFrame(ushort* buffer, int pitch, const(SnesDrawFrameData)* d) {
	assert(renderer.width == 512);
	assert(renderer.height == 448);
	assert(pitch == 1024);
	assert(libsfcppu_drawFrame, "libsfcppu not loaded?");
	buffer[0 .. renderer.width * renderer.height] = getFrameData(d);
}
ushort[] getFrameData(const(SnesDrawFrameData)* d) {
	ushort * rawdata = libsfcppu_drawFrame(d);
	return rawdata[renderer.width * 16 .. renderer.width * (renderer.height + 16)];
}
