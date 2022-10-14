module snesdrawframe;
import bindbc.loader;
import snesdrawframedata;

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
	} else version(osx) {
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
		ret = loadDynamicLibrary(name.ptr);
		if(ret) break;
	}
	return ret;
}

bool loadDynamicLibrary(const(char)* libName)
{
	lib = load(libName);
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
	assert(ImgW == 512);
	assert(ImgH == 448);
	assert(pitch == 1024);
	assert(libsfcppu_drawFrame, "libsfcppu not loaded?");
	ushort * rawdata = libsfcppu_drawFrame(d);
	buffer[0..ImgW*ImgH] = rawdata[ImgW * 16..ImgW*(ImgH + 16)];
}
