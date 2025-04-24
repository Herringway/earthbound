module earthbound.external.audio;

import earthbound.commondefs;
import earthbound.external;

import nspcplay;

import replatform64;
import replatform64.snes;

import std.logger;

immutable bool[Sfx.max + 1] altChannel = [
	Sfx.onettTrumpetSolo: true,
	Sfx.praying: true,
	Sfx.psiUsed: true,
	Sfx.damageTaken: true,
	Sfx.smaaaash: true,
	Sfx.allyFell: true,
	Sfx.recoverHP: true,
	Sfx.recoverStatus: true,
	Sfx.shield: true,
	Sfx.psiShield: true,
	Sfx.statIncrease: true,
	Sfx.statDecrease: true,
	Sfx.psiHypnosis: true,
	Sfx.psiMagnet: true,
	Sfx.psiParalysis: true,
	Sfx.psiBrainshock: true,
	Sfx.psiRockin1: true,
	Sfx.psiRockin2: true,
	Sfx.psiRockin3: true,
	Sfx.psiFire: true,
	Sfx.counterPSI: true,
	Sfx.enemyPSIUsed: true,
	Sfx.psiFreeze1: true,
	Sfx.psiFreeze2: true,
	Sfx.psiFreezeFinish: true,
	Sfx.hpSucker: true,
	Sfx.psiStarstorm: true,
	Sfx.psiFlash2: true,
	Sfx.psiFlash3: true,
	Sfx.reflectDamage: true,
	Sfx.devilMachineOff: true,
	Sfx.psiDefenseDown: true,
	Sfx.beam: true,
	Sfx.unknown4E: true,
	Sfx.psiParalysisO: true,
	Sfx.psiBrainshockO: true,
	Sfx.spores: true,
	Sfx.afflicted: true,
	Sfx.ouch: true,
	Sfx.unknown56: true,
	Sfx.unknown57: true,
	Sfx.refilled: true,
	Sfx.defensesDestroyed: true,
	Sfx.psiReflected: true,
	Sfx.unknown5E: true,
	Sfx.magicButterfly: true,
	Sfx.ghost: true,
	Sfx.unknown62: true,
	Sfx.shieldKiller: true,
	Sfx.mysteriousTransport: true,
	Sfx.congrats: true,
	Sfx.learnedPSI: true,
	Sfx.pyramid1: true,
	Sfx.pyramid2: true,
	Sfx.pyramid3: true,
	Sfx.pyramid4: true,
	Sfx.pyramid5: true,
	Sfx.pyramidOpened: true,
	Sfx.rapidKnocking: true,
	Sfx.mysterious: true,
	Sfx.mysterious2: true,
	Sfx.itemSold: true,
	Sfx.unknown79: true,
	Sfx.textInput: true,
	Sfx.unknown7B: true,
	Sfx.unknown7C: true,
	Sfx.unknown7D: true,
	Sfx.unknown7E: true,
];

class EarthboundSPC700 : SPC700Emulated {
	override void writeRegister(ushort addr, ubyte value) @safe {
		if ((addr == Register.APUIO0) && (value != 0)) {
			changeSong(value - 1, 0x500);
		}
		super.writeRegister(addr, value);
	}
}
class EarthboundNSPC : NSPCBase {
	private bool shouldRestoreVolume;
	private bool[8] shouldRestoreChannelVolume;
	private bool shouldRestoreTempo;
	override void writeRegister(ushort addr, ubyte value) @safe {
		switch (addr) {
			case Register.APUIO0:
				if (value == 0) {
					player.stop();
				} else {
					changeSong(value - 1);
				}
				break;
			case Register.APUIO1:
				switch (value) {
					case 0:
					case 1:
						if (shouldRestoreVolume) {
							player.restoreVolume();
							shouldRestoreVolume = false;
						}
						foreach (idx, ref shouldRestore; shouldRestoreChannelVolume) {
							if (shouldRestore) {
								player.restoreChannelVolume(cast(ubyte)idx);
								shouldRestore = false;
							}
						}
						if (shouldRestoreTempo) {
							player.restoreTempo();
							shouldRestoreTempo = false;
						}
						player.transpose(0);
						break;
					case 2:
						player.fade(24, 16);
						shouldRestoreVolume = true;
						break;
					case 3:
						player.fade(112, 16);
						shouldRestoreVolume = true;
						break;
					case 4: //no-ops
					case 6:
					case 17:
					case 18:
					case 19:
					case 20:
						break;
					case 5:
						player.transpose(14);
						const savedTempo = player.tempo;
						player.tempo = 200;
						player.addTimer(112, (player) {
							player.transpose(0);
							player.restoreTempo();
						});
						break;
					case 7:
						player.addTimer(40, (player) {
							player.volume = 160;
						});
						shouldRestoreVolume = true;
						break;
					case 8:
						player.addTimer(105, (player) {
							player.volume = 240;
						});
						shouldRestoreVolume = true;
						break;
					case 9:
					case 10:
					case 11:
					case 12:
					case 13:
					case 14:
					case 15:
					case 16:
						static immutable ubyte[5][8] presets = [
							[0, 0, 0, 0, 0],
							[0, 0, 0, 0, 0],
							[0, 0, 0, 0, 120],
							[100, 0, 0, 0, 120],
							[100, 100, 0, 0, 120],
							[100, 100, 0, 0, 120],
							[100, 100, 100, 0, 120],
							[100, 100, 100, 120, 120],
						];
						const selected = presets[value - 9];
						shouldRestoreChannelVolume[0] = true;
						shouldRestoreChannelVolume[1] = true;
						shouldRestoreChannelVolume[2] = true;
						shouldRestoreChannelVolume[3] = true;
						shouldRestoreChannelVolume[4] = true;
						player.setChannelVolume(0, selected[0]);
						player.setChannelVolume(1, selected[1]);
						player.setChannelVolume(2, selected[2]);
						player.setChannelVolume(3, selected[3]);
						player.setChannelVolume(4, selected[4]);
						break;
					case 21:
						player.transpose(16);
						break;
					case 22:
						player.transpose(0);
						break;
					case 23:
						shouldRestoreVolume = true;
						player.volume = 100;
						break;
					case 24:
						shouldRestoreVolume = true;
						player.volume = 240;
						break;
					case 25:
						shouldRestoreChannelVolume[7] = true;
						player.setChannelVolume(7, 250);
						break;
					case 26:
						shouldRestoreChannelVolume[7] = true;
						player.setChannelVolume(7, 0);
						break;
					case 27:
						shouldRestoreChannelVolume[7] = true;
						player.setChannelVolume(7, 90);
						break;
					case 28:
						shouldRestoreChannelVolume[7] = true;
						player.setChannelVolume(7, 40);
						break;
					default:
						infof("Music effect %02X not yet implemented", value);
						break;
				}
				break;
			case Register.APUIO2:
				infof("NYI: Giygas static");
				break;
			case Register.APUIO3:
				if (value > 0) {
					assert(backend);
					backend.playWAV((value & 0x7F), altChannel[(value & 0x7F)]);
				}
				break;
			default: assert(0);
		}
	}
	override ubyte readRegister(ushort addr) { return 0; }
}
