module watchdog;

import core.stdc.stdlib;
import core.thread;
import core.time;
import debugging;

version(Windows) {
	import core.sys.windows.stacktrace;
	import core.sys.windows.winbase;
	import core.sys.windows.winnt;
}
// Windows hang detection takes five seconds to kick in, Might as well use the same duration here.
private enum hangThreshold = 5.seconds;

private Thread watchThread;
///
shared SimpleWatchDog watchDog;

///
struct SimpleWatchDog {
	private MonoTime lastPetting;
	version(Windows) {
		private DWORD watchThread;
	}
	/// Pet the watchdog, so it knows that the thread is okay
	void pet() shared @safe {
		lastPetting = MonoTime.currTime();
	}
	/// Whether or not the watchdog is alarmed by a lack of pets in the last few seconds.
	bool alarmed() const shared @safe {
		return MonoTime.currTime() - lastPetting > hangThreshold;
	}
	private void printStackTrace() const shared {
		// for now, this functionality is windows-exclusive.
		// it might not be necessary on POSIX systems if we can install a signal handler that throws instead...
		version(Windows) {
			// get thread handle
			HANDLE thread = OpenThread(THREAD_ALL_ACCESS, false, watchThread);
			CONTEXT context;
			context.ContextFlags = CONTEXT_FULL;
			// can't get thread context while it's active
			SuspendThread(thread);
			// get thread context and create stack trace from it
			GetThreadContext(thread, &context);
			scope stackTrace = new StackTrace(0, &context);
			writeDebugDump("Hang detected", stackTrace);
		}
	}
}
/// Main function for the watchdog thread. If a hang is detected, generate a crash dump and exit
noreturn watchGameLogic() {
	while(true) {
		if (watchDog.alarmed) {
			watchDog.printStackTrace();
			break;
		}
		Thread.sleep(1.seconds);
	}
	exit(1);
}
/// Create a watchdog thread for the current thread.
/// Note that although multiple watchdogs can be created, they will share the same thread to watch.
void startWatchDog() {
	version(Windows) {
		watchDog.watchThread = GetCurrentThreadId();
	}
	watchThread = new Thread(&watchGameLogic).start;
	watchThread.isDaemon = true;
}
