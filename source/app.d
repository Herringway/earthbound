import earthbound.bank00;
import earthbound.commondefs;
import earthbound.external;
import earthbound.external.audio;
import earthbound.external.dataloader;
import earthbound.external.debugging;

import replatform64.snes;

import std.conv;
import std.functional;
import std.getopt : defaultGetoptPrinter, getopt;
import std.logger;
import std.typecons;

void handleNullableOption(alias var)(string, string value) {
	var = value.to!(typeof(var.get));
}
int main(string[] args) {
	repositoryURL = "https://github.com/Herringway/revengeofthegator";
	Nullable!bool noIntro;
	Nullable!ubyte autoLoadFile;
	Nullable!bool debugMenu;
	snes.entryPoint = &start;
	snes.interruptHandlerVBlank = &irqNMICommon;
	snes.title = "Earthbound";
	snes.matchingInternalID = "EARTH BOUND          ";
	snes.gameID = "earthbound";
	snes.debugMenuRenderer = (&prepareDebugUI).toDelegate;
	snes.gameStateMenu = (&renderDebugWindow).toDelegate;
	config = snes.loadSettings!GameConfig();
	if (snes.parseArgs(args,
		"nointro|n", "Skip intro scenes", &handleNullableOption!noIntro,
		"autoload|a", "Auto-load specified file. Will be created if nonexistent", &handleNullableOption!autoLoadFile,
		"debug|d", "Always boot to debug menu (debug builds only)", &handleNullableOption!debugMenu,
	)) {
		return 2;
	}
	if (!autoLoadFile.isNull) {
		config.autoLoadFile = autoLoadFile;
	}
	debug if (!debugMenu.isNull) {
		config.loadDebugMenu = debugMenu.get();
	}
	if (!noIntro.isNull) {
		config.noIntro = noIntro.get();
	}
	snes.initialize();
	if (config.hleAudio) {
		snes.initializeAudio(new EarthboundNSPC);
	} else {
		snes.initializeAudio(new EarthboundSPC700);
	}

	snes.handleAssets!loadableDataModules(&extractExtraAssets, &loadExtraData);
	scope(exit) snes.saveSettings(config);
	snes.run();
	return 0;
}
