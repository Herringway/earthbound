module earthbound.external;

import replatform64.snes;

__gshared SNES snes;

version(unittest) {
	shared static this() {
		import earthbound.external.dataloader : extractExtraAssets, loadableDataModules, loadExtraData;
		import earthbound.globals : romDataLoaded;
		import earthbound.testing : initializeForTesting;
		snes.initializeForTesting();
		initializeForTesting();
		snes.gameID = "earthbound";
		try {
			snes.handleAssets!loadableDataModules(&extractExtraAssets, &loadExtraData);
			romDataLoaded = true;
		} catch (Exception) {
			romDataLoaded = false;
		}
	}
}
