module debugging;

import rendering;

import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank15;
import earthbound.commondefs;
import earthbound.globals;
import earthbound.text;

import std.algorithm;
import std.conv;
import std.format;
import std.logger;
import std.range;
import std.string;

import rendering;

import ImGui = d_imgui;
import d_imgui.imgui_h;
import imgui.hexeditor;

int debugMenuHeight;
enum debugWindowWidth = 500;

struct DebugState {
	bool showDebugWindow = true;
	bool addingPartyMember;
	bool askingForScript;
	bool askingWarpToPreset;
	bool askingBattle;
	bool editingVRAM;
	bool editingBG2;
	bool askingForEntity;
}

DebugState state;
static this() {
	memoryEditor.Cols = 8;
	memoryEditor.OptShowOptions = false;
	memoryEditor.OptShowDataPreview = false;
	memoryEditor.OptShowAscii = false;
}
MemoryEditor memoryEditor;

void prepareDebugUI(size_t width, size_t height) {
	if (ImGui.BeginMainMenuBar()) {
		if (ImGui.BeginMenu("Windows")) {
			ImGui.MenuItem("Debugging", null, &state.showDebugWindow);
			ImGui.EndMenu();
		}
		if (ImGui.BeginMenu("Other Stuff")) {
			menuItemCallback("Add Party Member", () { state.addingPartyMember = true; });
			menuItemCallback("Run Text Script", () { state.askingForScript = true; });
			menuItemCallback("Warp to preset destination", () { state.askingWarpToPreset = true; });
			menuItemCallback("Start a battle", () { state.askingBattle = true; });
			menuItemCallback("Edit VRAM", () { state.editingVRAM = true; });
			menuItemCallback("Edit BG2", () { state.editingBG2 = true; });
			menuItemCallback("Spawn an entity", () { state.askingForEntity = true; });
			ImGui.EndMenu();
		}
		if (ImGui.BeginMenu("Dump")) {
			menuItemCallback("VRAM", &dumpVRAM);
			menuItemCallback("Save", &dumpSave);
			ImGui.EndMenu();
		}
		immutable str = cast(immutable)frameRateString;
		ImGui.SetCursorPosX(ImGui.GetWindowSize().x - ImGui.CalcTextSize(str).x);
		ImGui.Text(str);
		debugMenuHeight = cast(int)ImGui.GetWindowSize().y;
		ImGui.EndMainMenuBar();
	}
	if (state.showDebugWindow) {
		renderDebugWindow(0, debugMenuHeight - 1, width, height);
	}
	if (state.editingVRAM) {
		memoryEditor.DrawWindow("VRAM", g_frameData.vram);
		state.editingVRAM = memoryEditor.Open;
	}
	if (state.editingBG2) {
		memoryEditor.DrawWindow("BG2", bg2Buffer);
		state.editingBG2 = memoryEditor.Open;
	}
	handleDialog!AddPartyMember(state.addingPartyMember, "Add a party member");
	handleDialog!WarpToDialog(state.askingWarpToPreset, "Warp to preset destination");
	handleDialog!StartBattleDialog(state.askingBattle, "Start battle");
	handleDialog!RunTextScript(state.askingForScript, "Run a Text Script");
	handleDialog!SpawnEntity(state.askingForEntity, "Spawn an entity");
}

void renderDebugWindow(float x, float y, float width, float height) {
	ImGui.SetNextWindowSize(ImGui.ImVec2(debugWindowWidth, height - y));
	ImGui.SetNextWindowPos(ImGui.ImVec2(x, y));
	ImGui.Begin("Debugging", null, ImGuiWindowFlags.NoTitleBar | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoBringToFrontOnFocus);
	if (ImGui.TreeNode("Game State")) {
		inputEBText("Player Name (obsolete)", gameState.mother2PlayerName[]);
		inputEBText("Player Name", gameState.earthboundPlayerName[]);
		inputEBText("Pet Name", gameState.petName[]);
		inputEBText("Favourite Food", gameState.favouriteFood[]);
		inputEBText("Favourite Thing", gameState.favouriteThing[]);
		InputEditable("Money", gameState.moneyCarried);
		InputEditable("Bank", gameState.bankBalance);
		InputEditable("PSI Flags", gameState.partyPSI);
		if (ImGui.TreeNode("Party NPCs")) {
			foreach (idx, ref npc; gameState.partyNPCs) {
				if (ImGui.TreeNode(["NPC 1", "NPC 2"][idx])) {
					InputEditable("ID", npc);
					InputEditable("HP", gameState.partyNPCHP[idx]);
					ImGui.TreePop();
				}
			}
			if (ImGui.TreeNode("NPC 1 Backup")) {
				InputEditable("ID", gameState.partyNPC1Copy);
				InputEditable("HP", gameState.partyNPC1HPCopy);
				ImGui.TreePop();
			}
			if (ImGui.TreeNode("NPC 2 Backup")) {
				InputEditable("ID", gameState.partyNPC2Copy);
				InputEditable("HP", gameState.partyNPC2HPCopy);
				ImGui.TreePop();
			}
			ImGui.TreePop();
		}
		InputEditable!PartyStatus("Party status", gameState.partyStatus);
		InputEditable("Money (Backup)", gameState.walletBackup);
		if (ImGui.TreeNode("Escargo Express")) {
			foreach (invIdx, ref item; gameState.escargoExpressItems) {
				if (ImGui.BeginCombo(format!"Item %s"(invIdx), printable(itemData[item].name))) {
					foreach (itemIdx, itemInfo; itemData) {
						if (ImGui.Selectable(printable(itemInfo.name), itemIdx == invIdx)) {
							item = cast(ubyte)itemIdx;
						}
					}
					ImGui.EndCombo();
				}
			}
			ImGui.TreePop();
		}
		foreach (idx, ref p; gameState.partyMembers) {
			if (p == 0) {
				break;
			}
			if (ImGui.TreeNode(format!"Party Member %s"(idx))) {
				InputEditable("ID", p);
				InputEditable("Index", gameState.partyMemberIndex[idx]);
				InputEditable("???", gameState.playerControlledPartyMembers[idx]);
				InputEditable("Entity", gameState.partyEntities[idx]);
				if (ImGui.Button("Remove")) {
					removeCharFromParty(p);
				}
				ImGui.TreePop();
			}
		}
		InputEditable("Camera coords", gameState.leaderX, gameState.leaderY);
		InputEditable("Leader position index", gameState.leaderPositionIndex);
		InputEditable!Direction("Direction", gameState.leaderDirection);
		InputEditable("Tile type", gameState.troddenTileType);
		InputEditable!WalkingStyle("Walking style", gameState.walkingStyle);
		InputEditable("Leader moved", gameState.leaderHasMoved);
		InputEditable("Unknown92", gameState.unknown92);
		InputEditable("Leader entity", gameState.firstPartyMemberEntity);
		InputEditable!CameraMode("Camera mode", gameState.cameraMode);
		InputEditable("Autoscroll frames", gameState.autoScrollFrames);
		InputEditable("Autoscroll walking style backup", gameState.autoScrollOriginalWalkingStyle);
		InputEditable("Autofight enabled", gameState.autoFightEnable);
		InputEditable("Exit mouse coords", gameState.exitMouseXCoordinate, gameState.exitMouseYCoordinate);
		InputEditable("Text speed", gameState.textSpeed);
		InputEditable("Sound Setting", gameState.soundSetting);
		InputEditable("UnknownC3", gameState.unknownC3);
		InputEditable("Money earned since last call", gameState.moneyEarnedSinceLastCall);
		if (ImGui.TreeNode("Active hotspots")) {
			foreach (idx, ref mode; gameState.activeHotspotModes) {
				if (ImGui.TreeNode(format!"Hotspot %s"(idx))) {
					InputEditable("Mode", mode);
					InputEditable("ID", gameState.activeHotspotIDs[idx]);
					ImGui.TreePop();
				}
			}
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("Saved Photos")) {
			foreach (idx, ref state; gameState.savedPhotoStates) {
				if (ImGui.TreeNode(format!"Photos %s"(idx))) {
					InputEditable("Unknown", state.unknown);
					foreach (partyIdx, label; ["Party member 0", "Party member 1", "Party member 2", "Party member 3", "Party member 4", "Party member 5"]) {
						InputEditable(label, state.partyMembers[partyIdx]);
					}
					ImGui.TreePop();
				}
			}
			ImGui.TreePop();
		}
		InputEditable("Timer", gameState.timer);
		InputEditable("Text Flavour", gameState.textFlavour);
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Entities")) {
		short entityEntry = firstEntity;
		while (entityEntry >= 0) {
			const entity = entityEntry / 2;
			if (ImGui.TreeNode(format!"%s: %s"(entity, cast(ActionScript)entityScriptTable[entity]))) {
				InputEditable!OverworldSprite("Sprite", entityTPTEntrySprites[entity]);
				InputEditable("Var 0", entityScriptVar0Table[entity]);
				InputEditable("Var 1", entityScriptVar1Table[entity]);
				InputEditable("Var 2", entityScriptVar2Table[entity]);
				InputEditable("Var 3", entityScriptVar3Table[entity]);
				InputEditable("Var 4", entityScriptVar4Table[entity]);
				InputEditable("Var 5", entityScriptVar5Table[entity]);
				InputEditable("Var 6", entityScriptVar6Table[entity]);
				InputEditable("Var 7", entityScriptVar7Table[entity]);
				InputEditable("S. Coords", entityScreenXTable[entity], entityScreenYTable[entity]);
				if (auto newCoords = InputEditableR("M. Coords", FixedPoint1616(entityAbsXFractionTable[entity], entityAbsXTable[entity]), FixedPoint1616(entityAbsYFractionTable[entity], entityAbsYTable[entity]), FixedPoint1616(entityAbsZFractionTable[entity], entityAbsZTable[entity]))) {
					entityAbsXFractionTable[entity] = newCoords[0].fraction;
					entityAbsXTable[entity] = newCoords[0].integer;
					entityAbsYFractionTable[entity] = newCoords[1].fraction;
					entityAbsYTable[entity] = newCoords[1].integer;
					entityAbsZFractionTable[entity] = newCoords[2].fraction;
					entityAbsZTable[entity] = newCoords[2].integer;
				}
				if (auto newCoords = InputEditableR("Delta Coords", FixedPoint1616(entityDeltaXFractionTable[entity], entityDeltaXTable[entity]), FixedPoint1616(entityDeltaYFractionTable[entity], entityDeltaYTable[entity]), FixedPoint1616(entityDeltaZFractionTable[entity], entityDeltaZTable[entity]))) {
					entityDeltaXFractionTable[entity] = newCoords[0].fraction;
					entityDeltaXTable[entity] = newCoords[0].integer;
					entityDeltaYFractionTable[entity] = newCoords[1].fraction;
					entityDeltaYTable[entity] = newCoords[1].integer;
					entityDeltaZFractionTable[entity] = newCoords[2].fraction;
					entityDeltaZTable[entity] = newCoords[2].integer;
				}
				InputEditable("Size", entitySizes[entity]);
				InputEditable!Direction("Direction", entityDirections[entity]);
				InputEditable("Priority", entityDrawPriority[entity]);
				if (auto newAddress = InputEditableR!(ImGuiInputTextFlags.CharsHexadecimal)("VRAM", cast(ushort)(entityVramAddresses[entity] * 2))) {
					entityVramAddresses[entity] = newAddress[0] >> 1;
				}
				InputEditable("Frame", entityAnimationFrames[entity]);
				InputEditable("TPT", entityTPTEntries[entity]);
				InputEditable!EnemyID("Enemy", entityEnemyIDs[entity]);
				InputEditable("Collided", entityCollidedObjects[entity]);
				foreach (idx, flagName; ["Script", "Callback"]) {
					const mask = (1 << idx + 14);
					bool flagEnabled = !(entityTickCallbackFlags[entity] & mask);
					if (ImGui.Checkbox(flagName, &flagEnabled)) {
						entityTickCallbackFlags[entity] = cast(ushort)((entityTickCallbackFlags[entity] & ~mask) | (!flagEnabled * mask));
					}
				}
				foreach (idx, flagName; ["Visible"]) {
					const mask = (1 << idx + 15);
					bool flagEnabled = !(entitySpriteMapFlags[entity] & mask);
					if (ImGui.Checkbox(flagName, &flagEnabled)) {
						entitySpriteMapFlags[entity] = cast(ushort)((entitySpriteMapFlags[entity] & ~mask) | (!flagEnabled * mask));
					}
				}
				foreach (idx, flagName; ["Obscure lower", "Obscure upper", "Sunstroke", "Water", "Climbing", "UnknownS1", "UnknownS2", "Solid"]) {
					const mask = 1 << idx;
					bool flagEnabled = !(entitySurfaceFlags[entity] & mask);
					if (!!(idx & 1)) {
						ImGui.SameLine();
					}
					if (ImGui.Checkbox(flagName, &flagEnabled)) {
						entitySurfaceFlags[entity] = cast(ushort)((entitySurfaceFlags[entity] & ~mask) | (!flagEnabled * mask));
					}
				}
				InputEditable("Sleep", entityScriptSleepFrames[entity]);
				InputEditable("L/R height", entityHitboxLeftRightHeight[entity]);
				InputEditable!Direction("Moving direction", entityMovingDirection[entity]);
				InputEditable("u284C", entityUnknown284C[entity]);
				InputEditable("u2916", entityUnknown2916[entity]);
				InputEditable("u2952", entityUnknown2952[entity]);
				InputEditable("Speed", entityMovementSpeed[entity]);
				InputEditable("u2BE6", entityUnknown2BE6[entity]);
				InputEditable("u2C22", entityUnknown2C22[entity]);
				InputEditable("u2C5E", entityUnknown2C5E[entity]);
				InputEditable("Enemy spawn tile", entityEnemySpawnTiles[entity]);
				InputEditable("u2D8A", entityUnknown2D8A[entity]);
				InputEditable("u2DC6", entityUnknown2DC6[entity]);
				InputEditable("u2E3E", entityUnknown2E3E[entity]);
				InputEditable("Overlay flags", entityOverlayFlags[entity]);
				InputEditable("Mushroom frames", entityMushroomizedNextUpdateFrames[entity]);
				InputEditable("Sweat frames", entitySweatingNextUpdateFrames[entity]);
				InputEditable("Ripple frames", entityRippleNextUpdateFrames[entity]);
				InputEditable("Big ripple frames", entityBigRippleNextUpdateFrames[entity]);
				InputEditable("Strength", entityWeakEnemyValue[entity]);
				InputEditable("Hitbox enabled?", entityHitboxEnabled[entity]);
				InputEditable("U/D width", entityHitboxUpDownWidth[entity]);
				InputEditable("U/D height", entityHitboxUpDownHeight[entity]);
				InputEditable("L/R width", entityHitboxLeftRightWidth[entity]);
				InputEditable("u3456", entityUnknown3456[entity]);
				if (ImGui.Button("Delete")) {
					deleteEntity(entity);
				}
				ImGui.TreePop();
			}
			entityEntry = entityNextEntityTable[entity];
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Overworld State")) {
		InputEditable("Unknown7E436E", unknown7E436E);
		InputEditable("Unknown7E4370", unknown7E4370);
		InputEditable("Unknown7E4372", unknown7E4372);
		InputEditable("Screen coords", screenLeftX, screenTopY);
		InputEditable("Unknown7E437C", unknown7E437C);
		InputEditable("Unknown7E437E", unknown7E437E);
		InputEditable("Unknown7E4380", unknown7E4380);
		InputEditable("Unknown7E4382", unknown7E4382);
		InputEditable("Unknown7E4386", unknown7E4386);
		InputEditable("Unknown7E4388", unknown7E4388);
		InputEditable("Unknown7E438A", unknown7E438A);
		InputEditable("Unknown7E438C", unknown7E438C);
		InputEditable("Current sector attributes", currentSectorAttributes);
		InputEditable("Unknown7E43D0", unknown7E43D0);
		InputEditable("Unknown7E43D2", unknown7E43D2);
		InputEditable("Unknown7E43D4", unknown7E43D4);
		InputEditable("Unknown7E43D6", unknown7E43D6);
		InputEditable("Unknown7E43D8", unknown7E43D8);
		InputEditable("Unknown7E43DA", unknown7E43DA);
		InputEditable("Animated tile count", loadedAnimatedTileCount);
		InputEditable("Unknown7E4474", unknown7E4474);
		InputEditable("Unknown7E4676", unknown7E4676);
		InputEditable("Unknown7E467A", unknown7E467A);
		InputEditable("Unknown7E467C", unknown7E467C);
		InputEditable("Unknown7E4A58", unknown7E4A58);
		InputEditable("Enemy spawns enabled", enemySpawnsEnabled);
		InputEditable("Overworld enemy count", overworldEnemyCount);
		InputEditable("Unknown7E4A5E", unknown7E4A5E);
		InputEditable("Magic butterfly", magicButterfly);
		InputEditable("Spawn Range", enemySpawnRangeWidth, enemySpawnRangeHeight);
		InputEditable("Show NPC flag", showNPCFlag);
		InputEditable("Unknown7E4A68", unknown7E4A68);
		InputEditable("Unknown7E4A6A", unknown7E4A6A);
		InputEditable("Unknown7E4A6C", unknown7E4A6C);
		InputEditable("Remaining enemies in spawn group", enemySpawnRemainingEnemyCount);
		InputEditable("Unknown7E4A70", unknown7E4A70);
		InputEditable("Spawning enemy group", spawningEnemyGroup);
		InputEditable("Spawning enemy sprite", spawningEnemySprite);
		InputEditable("Unknown7E4A7A", unknown7E4A7A);
		InputEditable("Current battle group", currentBattleGroup);
		InputEditable("Unknown7E4A8E", unknown7E4A8E);
		InputEditable("Unknown7E4A90", unknown7E4A90);
		InputEditable("Unknown7E4A92", unknown7E4A92);
		InputEditable("Unknown7E4A94", unknown7E4A94);
		InputEditable("Touched enemy", touchedEnemy);
		InputEditable("Unknown7E4DB8", unknown7E4DB8);
		InputEditable("Swirl flag", battleSwirlFlag);
		InputEditable("Initiative", battleInitiative);
		InputEditable("Unknown7E4DBE", unknown7E4DBE);
		InputEditable("Unknown7E4DC0", unknown7E4DC0);
		InputEditable("Battle Debug?", battleDebug);
		InputEditable("Unknown7E4DC4", unknown7E4DC4);
		InputEditable("Unknown7E4DD4", unknown7E4DD4);
		InputEditable("Misc debug flags", miscDebugFlags);
		InputEditable("Intangibility frames", playerIntangibilityFrames);
		InputEditable("Unknown7E5D5A", unknown7E5D5A);
		InputEditable("Unknown7E5D5C", unknown7E5D5C);
		InputEditable("Unknown7E5D5E", unknown7E5D5E);
		InputEditable("Battle swirl frames", battleSwirlCountdown);
		InputEditable("Current TPT entry", currentTPTEntry);
		InputEditable("Unknown7E5D64", unknown7E5D64);
		InputEditable("BG colour backup", backgroundColourBackup);
		InputEditable("Input disabled frames", inputDisableFrameCounter);
		InputEditable("Unknown7E5D76", unknown7E5D76);
		InputEditable("Unknown7E5D78", unknown7E5D78);
		InputEditable("Unknown7E5D7A", unknown7E5D7A);
		InputEditable("Unknown7E5D7C", unknown7E5D7C);
		InputEditable("Unknown7E5D7E", unknown7E5D7E);
		InputEditable("OSS", overworldStatusSuppression);
		InputEditable("Pending QI", pendingInteractions);
		InputEditable("Mushroomization timer", mushroomizationTimer);
		InputEditable("Mushroomization modifier", mushroomizationModifier);
		InputEditable("Mushroomized walking", mushroomizedWalkingFlag);
		InputEditable("Unknown7E5DA2", unknown7E5DA2);
		InputEditable("Temp entity surface flags", tempEntitySurfaceFlags);
		InputEditable("Unknown7E5DA6", unknown7E5DA6);
		InputEditable("Unknown7E5DA8", unknown7E5DA8);
		InputEditable("Unknown7E5DAA", unknown7E5DAA);
		InputEditable("Checked Left X", checkedCollisionLeftX);
		InputEditable("Checked Top Y", checkedCollisionTopY);
		InputEditable("Unknown7E5DB4", unknown7E5DB4);
		InputEditable("Unknown7E5DB6", unknown7E5DB6);
		InputEditable("Unknown7E5DB8", unknown7E5DB8);
		InputEditable("Unknown7E5DBA", unknown7E5DBA);
		InputEditable("Unknown7E5DBE", unknown7E5DBE);
		InputEditable("Current QI type", currentQueuedInteractionType);
		InputEditable("Unknown7E5DC2", unknown7E5DC2);
		InputEditable("Unknown7E5DC4", unknown7E5DC4);
		InputEditable("Unknown7E5DC6", unknown7E5DC6);
		InputEditable("Unknown7E5DCA", unknown7E5DCA);
		InputEditable("Unknown7E5DCC", unknown7E5DCC);
		InputEditable("Unknown7E5DCE", unknown7E5DCE);
		InputEditable("Unknown7E5DD0", unknown7E5DD0);
		InputEditable("Unknown7E5DD2", unknown7E5DD2);
		InputEditable("Map music track", currentMapMusicTrack);
		InputEditable("Next map music track", nextMapMusicTrack);
		InputEditable("Unknown7E5DD8", unknown7E5DD8);
		InputEditable("Unknown7E5DDA", unknown7E5DDA);
		InputEditable("Unknown7E5DDC", unknown7E5DDC);
		ImGui.Text(format!"Unknown7E5DDE: %s"(unknown7E5DDE));
		InputEditable("Current QI", currentQueuedInteraction);
		InputEditable("Next QI", nextQueuedInteraction);
		InputEditable("Unknown7E5E36", unknown7E5E36);
		InputEditable("Unknown7E5E6C", unknown7E5E6C);
		InputEditable("Unknown7E5E6D", unknown7E5E6D);
		InputEditable("Unknown7E5E6E", unknown7E5E6E);
		InputEditable("Unknown7E5E70", unknown7E5E70);
		InputEditable("Unknown7E5E71", unknown7E5E71);
		InputEditable("Unknown7E5E72", unknown7E5E72);
		InputEditable("Unknown7E5E73", unknown7E5E73);
		InputEditable("Unknown7E5E74", unknown7E5E74);
		InputEditable("Unknown7E5E75", unknown7E5E75);
		InputEditable("Unknown7E5E76", unknown7E5E76);
		InputEditable("Unknown7E5E77", unknown7E5E77);
		InputEditable("Unknown7E5E78", unknown7E5E78);
		InputEditable("Unknown7E5E79", unknown7E5E79);
		InputEditable("Unknown7E5E7A", unknown7E5E7A);
		InputEditable("Unknown7E5E7C", unknown7E5E7C);
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Event Flags")) {
		foreach (i; 0 .. 8) {
			if (ImGui.TreeNode(format!"Flags %s - %s"(i * 128, (i + 1) * 128))) {
				foreach (flag; i * 128 + 1 .. (i + 1) * 128 + 1) {
					bool flagValue = !!getEventFlag(cast(short)flag);
					if (ImGui.Checkbox((cast(EventFlag)flag).text, &flagValue)) {
						setEventFlag(cast(short)flag, flagValue);
					}
				}
				ImGui.TreePop();
			}
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Party Members")) {
		foreach (idx, ref character; partyCharacters) {
			if (character.name[0] == '\0') {
				continue;
			}
			if (ImGui.TreeNode(format!"%s"(printable(character.name)))) {
				inputEBText("Name", character.name);
				InputEditable("Level", character.level);
				InputEditable("EXP", character.exp);
				InputEditable("Max HP", character.maxHP);
				InputEditable("HP (current)", character.hp.current);
				InputEditable("HP (target)", character.hp.target);
				InputEditable("Max PP", character.maxPP);
				InputEditable("PP (current)", character.pp.current);
				InputEditable("PP (target)", character.pp.target);
				InputEditable("Offense", character.offense);
				InputEditable("Defense", character.defense);
				InputEditable("Speed", character.speed);
				InputEditable("Guts", character.guts);
				InputEditable("Luck", character.luck);
				InputEditable("Vitality", character.vitality);
				InputEditable("IQ", character.iq);
				if (ImGui.TreeNode("Afflictions")) {
					void handleAfflictions(string label, size_t idx) {
						if (ImGui.BeginCombo(label, afflictionNames[idx][character.afflictions[idx]])) {
							foreach (afflictionIdx, afflictionName; afflictionNames[idx]) {
								if (ImGui.Selectable(afflictionName, afflictionIdx == character.afflictions[idx])) {
									character.afflictions[idx] = cast(ubyte)afflictionIdx;
								}
							}
							ImGui.EndCombo();
						}
					}
					handleAfflictions("Status 0", 0);
					handleAfflictions("Status 1", 1);
					handleAfflictions("Status 2", 2);
					handleAfflictions("Status 3", 3);
					handleAfflictions("Status 4", 4);
					handleAfflictions("Status 5", 5);
					handleAfflictions("Status 6", 6);
					ImGui.TreePop();
				}
				if (ImGui.TreeNode("Items")) {
					foreach (invIdx, ref item; character.items) {
						if (ImGui.BeginCombo(format!"Item %s"(invIdx), printable(itemData[item].name))) {
							foreach (itemIdx, itemInfo; itemData) {
								if (ImGui.Selectable(printable(itemInfo.name), itemIdx == invIdx)) {
									item = cast(ubyte)itemIdx;
								}
							}
							ImGui.EndCombo();
						}
					}
					ImGui.TreePop();
				}
				InputEditable("unknown53", character.unknown53);
				InputEditable("unknown55", character.unknown55);
				InputEditable("unknown57", character.unknown57);
				InputEditable("unknown59", character.unknown59);
				InputEditable("positionIndex", character.positionIndex);
				InputEditable("unknown63", character.unknown63);
				InputEditable("unknown65", character.unknown65);
				InputEditable("HP/PP Window Opt", character.hpPPWindowOptions);
				InputEditable("Miss rate", character.missRate);
				InputEditable("Fire resist", character.fireResist);
				InputEditable("Freeze resist", character.freezeResist);
				InputEditable("Flash resist", character.flashResist);
				InputEditable("Paralysis Resist", character.paralysisResist);
				InputEditable("Hypnosis / Brainshock resist", character.hypnosisBrainshockResist);
				InputEditable("Boosted speed", character.boostedSpeed);
				InputEditable("Boosted guts", character.boostedGuts);
				InputEditable("Boosted vitality", character.boostedVitality);
				InputEditable("Boosted IQ", character.boostedIQ);
				InputEditable("Boosted luck", character.boostedLuck);
				InputEditable("unknown92", character.unknown92);
				InputEditable("unknown94", character.unknown94);
				ImGui.TreePop();
			}
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Text System")) {
		InputEditable("CNum", cNum);
		InputEditable("CItem", cItem);
		if (ImGui.TreeNode("Windows")) {
			foreach (openWindowID; windowTable) {
				if (openWindowID == -1) {
					continue;
				}
				if (ImGui.TreeNode(format!"%s"(cast(Window)windowStats[openWindowID].windowID))) {
					InputEditable("Next", windowStats[openWindowID].next);
					InputEditable("Previous", windowStats[openWindowID].prev);
					InputEditable("Coords", windowStats[openWindowID].x, windowStats[openWindowID].y);
					InputEditable("Dimensions", windowStats[openWindowID].width, windowStats[openWindowID].height);
					InputEditable("Text Coords", windowStats[openWindowID].textX, windowStats[openWindowID].textY);
					InputEditable("Padding", windowStats[openWindowID].numPadding);
					InputEditable("Tile Attributes", windowStats[openWindowID].tileAttributes);
					InputEditable("Font", windowStats[openWindowID].font);
					if (ImGui.TreeNode("Registers")) {
						InputEditable("Result", windowStats[openWindowID].result.integer);
						InputEditable("Argument", windowStats[openWindowID].argument);
						InputEditable("Counter", windowStats[openWindowID].counter);
						InputEditable("Result (2)", windowStats[openWindowID].resultBak.integer);
						InputEditable("Argument (2)", windowStats[openWindowID].argumentBak);
						InputEditable("Counter (2)", windowStats[openWindowID].counterBak);
						ImGui.TreePop();
					}
					InputEditable("Current option", windowStats[openWindowID].currentOption);
					InputEditable("Options", windowStats[openWindowID].optionCount);
					InputEditable("Selected option", windowStats[openWindowID].selectedOption);
					InputEditable("Menu Columns", windowStats[openWindowID].menuColumns);
					InputEditable("Menu Page", windowStats[openWindowID].menuPage);
					InputEditable("Title ID", windowStats[openWindowID].titleID);
					inputEBText("Title", windowStats[openWindowID].title);
					ImGui.TreePop();
				}
			}
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("Script States")) {
			foreach (i; 0 .. unknown7E97B8) {
				if (ImGui.TreeNode(format!"State %s"(i))) {
					ImGui.Text(format!"Current CC [%02X]"(displayTextStates[(i + 1) % displayTextStates.length].textptr[0]));
					InputEditable("Unknown4", displayTextStates[(i + 1) % displayTextStates.length].unknown4);
					if (ImGui.TreeNode("Attribute Backup")) {
						InputEditable("ID", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.id);
						InputEditable("Text Coords", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.textX, displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.textY);
						InputEditable("Padding", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.numberPadding);
						InputEditable("Tile Attributes", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.currTileAttributes);
						InputEditable("Font", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.font);
						InputEditable("Unknown11[0]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[0]);
						InputEditable("Unknown11[1]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[1]);
						InputEditable("Unknown11[2]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[2]);
						InputEditable("Unknown11[3]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[3]);
						InputEditable("Unknown11[4]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[4]);
						InputEditable("Unknown11[5]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[5]);
						InputEditable("Unknown11[6]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[6]);
						InputEditable("Unknown11[7]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[7]);
						InputEditable("Unknown11[8]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[8]);
						InputEditable("Unknown11[9]", displayTextStates[(i + 1) % displayTextStates.length].savedTextAttributes.unknown11[9]);
						ImGui.TreePop();
					}
					ImGui.TreePop();
				}
			}
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("Menu Options")) {
			foreach (ref menuOption; menuOptions) {
				if (!menuOption.field00) {
					continue;
				}
				const label = printable(menuOption.label);
				if (ImGui.TreeNode(label ? label : "Unlabelled option")) {
					InputEditable("Unknown", menuOption.field00);
					InputEditable("Next option", menuOption.next);
					InputEditable("Previous option", menuOption.prev);
					InputEditable("Page", menuOption.page);
					InputEditable("Text coords", menuOption.textX, menuOption.textY);
					InputEditable("User Data", menuOption.userdata);
					InputEditable!Sfx("SFX", menuOption.sfx);
					ImGui.Text(format!"Script: %s"(menuOption.script));
					InputEditable("Pixel Alignment", menuOption.pixelAlign);
					ImGui.TreePop();
				}
			}
			ImGui.TreePop();
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Battle")) {
		InputEditable("Enemy count", enemiesInBattle);
		InputEditable("Target flags", battlerTargetFlags);
		InputEditable("EXP rewarded", battleEXPScratch);
		InputEditable("Money rewarded", battleMoneyScratch);
		InputEditable!GiygasPhase("Giygas phase", currentGiygasPhase);
		InputEditable("Unknown7EA97C", unknown7EA97C);
		InputEditable("Unknown7EAA0C", unknown7EAA0C);
		InputEditable!SpecialDefeat("Special Defeat", specialDefeat);
		InputEditable!ItemID("Item dropped", itemDropped);
		InputEditable("Mirrored enemy", mirrorEnemy);
		InputEditable("Mirror turns left", mirrorTurnTimer);
		InputEditable("Unknown7EAA70", unknown7EAA70);
		InputEditable("Unknown7EAA72", unknown7EAA72);
		InputEditable("Unknown7EAA74", unknown7EAA74);
		InputEditable("Unknown7EAA8E", unknown7EAA8E);
		InputEditable("Unknown7EAA90", unknown7EAA90);
		InputEditable("Unknown7EAA92", unknown7EAA92);
		InputEditable("Unknown7EAA94", unknown7EAA94);
		InputEditable("Unknown7EAA96", unknown7EAA96);
		InputEditable("Unknown7EAAB2", unknown7EAAB2);
		InputEditable("Unknown7EAAB4", unknown7EAAB4);
		InputEditable("Back row battlers", numBattlersInBackRow);
		InputEditable("Front row battlers", numBattlersInFrontRow);
		if (ImGui.TreeNode("Battlers")) {
			foreach (idx, ref battler; battlersTable) {
				if (battler.id == 0) {
					continue;
				}
				if (ImGui.TreeNode(format!"%s - %s"(idx, getBattlerName(battler)))) {
					InputEditable("ID", battler.id);
					InputEditable("Sprite", battler.sprite);
					InputEditable("Unknown3", battler.unknown3);
					InputEditable!BattleActions("Current action", battler.currentAction);
					InputEditable("Action order var", battler.actionOrderVar);
					InputEditable("Action item", battler.actionItemSlot);
					InputEditable("Action argument", battler.currentActionArgument);
					InputEditable("Action targetting", battler.actionTargetting);
					InputEditable("Current target", battler.currentTarget);
					InputEditable("The", battler.theFlag);
					InputEditable("Consciousness", battler.consciousness);
					InputEditable("Taken turn", battler.hasTakenTurn);
					InputEditable("Side", battler.side);
					InputEditable("NPC ID", battler.npcID);
					InputEditable("Row", battler.row);
					InputEditable("HP", battler.hp);
					InputEditable("HP target", battler.hpTarget);
					InputEditable("HP max", battler.hpMax);
					InputEditable("PP", battler.pp);
					InputEditable("PP target", battler.ppTarget);
					InputEditable("PP max", battler.ppMax);
					if (ImGui.TreeNode("Afflictions")) {
						void handleAfflictions(string label, size_t idx) {
							if (ImGui.BeginCombo(label, afflictionNames[idx][battler.afflictions[idx]])) {
								foreach (afflictionIdx, afflictionName; afflictionNames[idx]) {
									if (ImGui.Selectable(afflictionName, afflictionIdx == battler.afflictions[idx])) {
										battler.afflictions[idx] = cast(ubyte)afflictionIdx;
									}
								}
								ImGui.EndCombo();
							}
						}
						handleAfflictions("Status 0", 0);
						handleAfflictions("Status 1", 1);
						handleAfflictions("Status 2", 2);
						handleAfflictions("Status 3", 3);
						handleAfflictions("Status 4", 4);
						handleAfflictions("Status 5", 5);
						handleAfflictions("Status 6", 6);
						ImGui.TreePop();
					}
					InputEditable("On guard", battler.guarding);
					InputEditable("Shield HP", battler.shieldHP);
					InputEditable("Offense", battler.offense);
					InputEditable("Defense", battler.defense);
					InputEditable("Speed", battler.speed);
					InputEditable("Guts", battler.guts);
					InputEditable("Luck", battler.luck);
					InputEditable("Vitality", battler.vitality);
					InputEditable("IQ", battler.iq);
					InputEditable("Base offense", battler.baseOffense);
					InputEditable("Base defense", battler.baseDefense);
					InputEditable("Base speed", battler.baseSpeed);
					InputEditable("Base guts", battler.baseGuts);
					InputEditable("Base luck", battler.baseLuck);
					InputEditable("Base vitality", battler.paralysisResist);
					InputEditable("Base IQ", battler.freezeResist);
					InputEditable("Flash resist", battler.flashResist);
					InputEditable("Fire resist", battler.fireResist);
					InputEditable("Brainshock resist", battler.brainshockResist);
					InputEditable("Hypnosis resist", battler.hypnosisResist);
					InputEditable("Money", battler.money);
					InputEditable("EXP", battler.exp);
					InputEditable("VRAM sprite index", battler.vramSpriteIndex);
					InputEditable("Screen coords", battler.spriteX, battler.spriteY);
					InputEditable("Initiative", battler.initiative);
					InputEditable("Unknown71", battler.unknown71);
					InputEditable("Unknown72", battler.unknown72);
					InputEditable("Unknown73", battler.unknown73);
					InputEditable("Flashing", battler.isFlashing);
					InputEditable("Alt spritemap", battler.useAltSpritemap);
					InputEditable("Unknown76", battler.unknown76);
					InputEditable("ID2", battler.id2);
					ImGui.TreePop();
				}
			}
			ImGui.TreePop();
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Credits")) {
		InputEditable("Next credit position", creditsNextCreditPosition);
		InputEditable("Unknown7EB4E5", unknown7EB4E5);
		InputEditable("Current credit position", creditsScrollPosition);
		InputEditable("Photograph map loading mode", photographMapLoadingMode);
		InputEditable("Current photo", currentPhotoDisplay);
		InputEditable("Unknown7EB4F3", unknown7EB4F3);
		InputEditable("Unknown7EB4F5", unknown7EB4F5);
		InputEditable("Unknown7EB4F7", unknown7EB4F7);
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Palettes")) {
		foreach (idx, ref palette; palettes) {
			if (ImGui.TreeNode(format!"Palette %s"(idx))) {
				foreach (i, ref colour; palette) {
					float[3] c = [RGB(colour).red / 31.0, RGB(colour).green / 31.0, RGB(colour).blue / 31.0];
					if (ImGui.ColorEdit3(format!"%s"(i), c)) {
						colour = RGB(cast(ushort)(c[0] * 31), cast(ushort)(c[1] * 31), cast(ushort)(c[2] * 31)).bgr555;
						preparePaletteUpload(PaletteUpload.full);
					}
				}
				ImGui.TreePop();
			}
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Screen effects")) {
		InputEditable("Layer Config", currentLayerConfig);
		InputEditable("Vertical shake duration", verticalShakeDuration);
		InputEditable("Vertical shake hold duration", verticalShakeHoldDuration);
		InputEditable("Unknown7EAD90", unknown7EAD90);
		InputEditable("Wobble duration", wobbleDuration);
		InputEditable("Shake duration", shakeDuration);
		InputEditable("Unknown7EAD96", unknown7EAD96);
		InputEditable("Unknown7EAD98", unknown7EAD98);
		InputEditable("Unknown7EAD9A", unknown7EAD9A);
		InputEditable("Unknown7EAD9C", unknown7EAD9C);
		InputEditable("Green flash frames", greenFlashDuration);
		InputEditable("Red flash frames", redFlashDuration);
		InputEditable("Target Flashing enabled", enemyTargettingFlashing);
		InputEditable("HP/PP box blink duration", hpPPBoxBlinkDuration);
		InputEditable("HP/PP box blink target", hpPPBoxBlinkTarget);
		InputEditable("Unknown7EADA8", unknown7EADA8);
		InputEditable("Unknown7EADAA", unknown7EADAA);
		InputEditable("Unknown7EADAC", unknown7EADAC);
		InputEditable("Unknown7EADAE", unknown7EADAE);
		InputEditable("Unknown7EADB0", unknown7EADB0);
		InputEditable("Letterbox top end", letterboxTopEnd);
		InputEditable("Letterbox bottom start", letterboxBottomStart);
		InputEditable("Letterbox ending effect", letterboxEffectEnding);
		InputEditable("Letterbox ending top", letterboxEffectEndingTop);
		InputEditable("Letterbox ending bottom", letterboxEffectEndingBottom);
		foreach (layer, label; zip([&loadedBGDataLayer1, &loadedBGDataLayer2], ["Background effect 1", "Background effect 2"])) {
			if (ImGui.TreeNode(label)) {
				InputEditable("Layer", layer.targetLayer);
				InputEditable("Bit depth", layer.bitDepth);
				InputEditable("Freeze palette", layer.freezePaletteScrolling);
				InputEditable("Palette style", layer.paletteShiftingStyle);
				InputEditable("Cycle 1 colours", layer.paletteCycle1First, layer.paletteCycle1Last);
				InputEditable("Cycle 2 colours", layer.paletteCycle2First, layer.paletteCycle2Last);
				InputEditable("Cycle 1 step", layer.paletteCycle1Step);
				InputEditable("Cycle 2 step", layer.paletteCycle2Step);
				InputEditable("Palette cycle speed", layer.paletteChangeSpeed);
				InputEditable("Palette cycle frames left", layer.paletteChangeDurationLeft);
				InputEditable("Scrolling styles", layer.scrollingMovements.tupleof);
				InputEditable("Scrolling", layer.currentScrollingMovement);
				InputEditable("Scrolling frames", layer.scrollingDurationLeft);
				InputEditable("Position", layer.horizontalPosition, layer.verticalPosition);
				InputEditable("Velocity", layer.horizontalVelocity, layer.verticalVelocity);
				InputEditable("Acceleration", layer.horizontalAcceleration, layer.verticalAcceleration);
				InputEditable("Distortion styles", layer.distortionStyles.tupleof);
				InputEditable("Distortion", layer.currentDistortionIndex);
				InputEditable("Distortion framess", layer.distortionDurationLeft);
				InputEditable("Distortion type", layer.distortionType);
				InputEditable("Ripple frequency", layer.distortionRippleFrequency);
				InputEditable("Ripple amplitude", layer.distortionRippleAmplitude);
				InputEditable("Distortion speed", layer.distortionSpeed);
				InputEditable("Compression rate", layer.distortionCompressionRate);
				InputEditable("Ripple frequency acceleration", layer.distortionRippleFrequencyAcceleration);
				InputEditable("Ripple amplitude acceleration", layer.distortionRippleAmplitudeAcceleration);
				InputEditable("Distortion acceleration", layer.distortionSpeedAcceleration);
				InputEditable("Distortion compression acceleration", layer.distortionCompressionAcceleration);
				ImGui.TreePop();
			}
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Renderer")) {
		ImGui.Text("Layers");
		foreach (idx, layer; ["BG1", "BG2", "BG3", "BG4", "OBJ"]) {
			const mask = (1 << idx);
			bool layerEnabled = !(layersDisabled & mask);
			ImGui.SameLine();
			if (ImGui.Checkbox(layer, &layerEnabled)) {
				layersDisabled = cast(ubyte)((layersDisabled & ~mask) | (!layerEnabled * mask));
			}
		}
		if (ImGui.TreeNode("Sprites")) {
			foreach (id, entry; g_frameData.oam1) {
				const uint upperX = !!(g_frameData.oam2[id/4] & (1 << ((id % 4) * 2)));
				const size = !!(g_frameData.oam2[id/4] & (1 << ((id % 4) * 2 + 1)));
				if (entry.yCoord < 0xE0) {
					if (ImGui.TreeNode(format!"Sprite %s"(id))) {
						ImGui.BeginDisabled();
						ImGui.Text(format!"Tile Offset: %s"(entry.startingTile));
						ImGui.Text(format!"Coords: (%s, %s)"(entry.xCoord + (upperX << 8), entry.yCoord));
						ImGui.Text(format!"Palette: %s"(entry.palette));
						bool boolean = entry.flipVertical;
						ImGui.Checkbox("Vertical flip", &boolean);
						boolean = entry.flipHorizontal;
						ImGui.Checkbox("Horizontal flip", &boolean);
						ImGui.Text(format!"Priority: %s"(entry.priority));
						ImGui.Text(format!"Priority: %s"(entry.nameTable));
						boolean = size;
						ImGui.Checkbox("Use alt size", &boolean);
						ImGui.EndDisabled();
						ImGui.TreePop();
					}
				}
			}
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("Layers")) {
			const screenRegisters = [g_frameData.BG1SC, g_frameData.BG2SC, g_frameData.BG3SC, g_frameData.BG4SC];
			const screenRegisters2 = [g_frameData.BG12NBA & 0xF, g_frameData.BG12NBA >> 4, g_frameData.BG34NBA & 0xF, g_frameData.BG34NBA >> 4];
			static foreach (layer, label; ["BG1", "BG2", "BG3", "BG4"]) {{
				if (ImGui.TreeNode(label)) {
					ImGui.Text(format!"Tilemap address: $%04X"((screenRegisters[layer] & 0xFC) << 9));
					ImGui.Text(format!"Tile base address: $%04X"(screenRegisters2[layer] << 13));
					ImGui.Text(format!"Size: %s"(["32x32", "64x32", "32x64", "64x64"][screenRegisters[layer] & 3]));
					ImGui.Text(format!"Tile size: %s"(["8x8", "16x16"][!!(g_frameData.BGMODE >> (4 + layer))]));
					disabledCheckbox("Mosaic Enabled", !!((g_frameData.MOSAIC >> layer) & 1));
					ImGui.TreePop();
				}
			}}
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("VRAM")) {
			static int paletteID = 0;
			if (ImGui.InputInt("Palette", &paletteID)) {
				paletteID = clamp(paletteID, 0, 16);
			}
			const texWidth = 16 * 8;
			const texHeight = 0x8000 / 16 / 16 * 8;
			static ubyte[2 * texWidth * texHeight] data;
			auto pixels = cast(ushort[])(data[]);
			ushort[16] palette = g_frameData.cgram[paletteID * 16 .. (paletteID + 1) * 16];
			palette[] &= 0x7FFF;
			foreach (idx, tile; g_frameData.vram[].chunks(16).enumerate) {
				const base = (idx % 16) * 8 + (idx / 16) * texWidth * 8;
				foreach (p; 0 .. 8 * 8) {
					const px = p % 8;
					const py = p / 8;
					const plane01 = tile[py] & pixelPlaneMasks[px];
					const plane23 = tile[py + 8] & pixelPlaneMasks[px];
					const s = 7 - px;
					const pixel = ((plane01 & 0xFF) >> s) | (((plane01 >> 8) >> s) << 1) | (((plane23 & 0xFF) >> s) << 2) | (((plane23 >> 8) >> s) << 3);
					pixels[base + px + py * texWidth] = palette[pixel];
				}
			}
			ImGui.Image(createTexture(data[], texWidth, texHeight), ImVec2(texWidth * 3, texHeight * 3));
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("Registers")) {
			InputEditable("INIDISP", g_frameData.INIDISP);
			InputEditable("OBSEL", g_frameData.OBSEL);
			InputEditable("OAMADDR", g_frameData.OAMADDR);
			InputEditable("BGMODE", g_frameData.BGMODE);
			InputEditable("MOSAIC", g_frameData.MOSAIC);
			InputEditable("BGxSC", g_frameData.BG1SC, g_frameData.BG2SC, g_frameData.BG3SC, g_frameData.BG4SC);
			InputEditable("BGxNBA", g_frameData.BG12NBA, g_frameData.BG34NBA);
			InputEditable("BG1xOFS", g_frameData.BG1HOFS, g_frameData.BG1VOFS);
			InputEditable("BG2xOFS", g_frameData.BG2HOFS, g_frameData.BG2VOFS);
			InputEditable("BG3xOFS", g_frameData.BG3HOFS, g_frameData.BG3VOFS);
			InputEditable("BG4xOFS", g_frameData.BG4HOFS, g_frameData.BG4VOFS);
			InputEditable("M7SEL", g_frameData.M7SEL);
			InputEditable("M7A", g_frameData.M7A);
			InputEditable("M7B", g_frameData.M7B);
			InputEditable("M7C", g_frameData.M7C);
			InputEditable("M7D", g_frameData.M7D);
			InputEditable("M7X", g_frameData.M7X);
			InputEditable("M7Y", g_frameData.M7Y);
			InputEditable("WxSEL", g_frameData.W12SEL, g_frameData.W34SEL);
			InputEditable("WOBJSEL", g_frameData.WOBJSEL);
			InputEditable("WHx", g_frameData.WH0, g_frameData.WH1, g_frameData.WH2, g_frameData.WH3);
			InputEditable("WBGLOG", g_frameData.WBGLOG);
			InputEditable("WOBJLOG", g_frameData.WOBJLOG);
			InputEditable("TM", g_frameData.TM);
			InputEditable("TS", g_frameData.TS);
			InputEditable("TMW", g_frameData.TMW);
			InputEditable("TSW", g_frameData.TSW);
			InputEditable("CGWSEL", g_frameData.CGWSEL);
			InputEditable("CGADSUB", g_frameData.CGADSUB);
			InputEditable("FIXED_COLOUR_DATA", g_frameData.FIXED_COLOUR_DATA_R, g_frameData.FIXED_COLOUR_DATA_G, g_frameData.FIXED_COLOUR_DATA_B);
			InputEditable("SETINI", g_frameData.SETINI);
			ImGui.TreePop();
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Misc Debugging Features")) {
		if (ImGui.TreeNode("Position buffer")) {
			if (ImGui.BeginTable("Positions", 7)) {
				ImGui.TableSetupColumn("");
				ImGui.TableSetupColumn("X");
				ImGui.TableSetupColumn("Y");
				ImGui.TableSetupColumn("Flags");
				ImGui.TableSetupColumn("Style");
				ImGui.TableSetupColumn("Dir");
				ImGui.TableSetupColumn("???");
				ImGui.TableHeadersRow();
				foreach (idx, entry; playerPositionBuffer) {
					ImGui.TableNextRow();
					ImGui.TableNextColumn();
					ImGui.Text("%s".format(idx));
					ImGui.TableNextColumn();
					ImGui.Text("%s".format(entry.xCoord));
					ImGui.TableNextColumn();
					ImGui.Text("%s".format(entry.yCoord));
					ImGui.TableNextColumn();
					ImGui.Text("%s".format(entry.tileFlags));
					ImGui.TableNextColumn();
					ImGui.Text("%s".format(cast(WalkingStyle)entry.walkingStyle));
					ImGui.TableNextColumn();
					ImGui.Text("%s".format(cast(Direction)entry.direction));
					ImGui.TableNextColumn();
					ImGui.Text("%s".format(entry.unknown10));
				}
				ImGui.EndTable();
			}
			ImGui.TreePop();
		}
		bool debugFlag = !!earthbound.globals.debugging;
		if (ImGui.Checkbox("Debug flag", &debugFlag)) {
			earthbound.globals.debugging = debugFlag;
		}
		ImGui.TreePop();
	}
	ImGui.End();
}

void handleDialog(T)(ref bool isActive, string title) {
	import std.meta : Filter;
	import dataloader : typeMatches;
	static T data;
	if (!isActive) {
		return;
	}
	ImGui.OpenPopup(title);
	ImGui.SetNextWindowPos(ImGui.GetMainViewport().GetCenter(), ImGuiCond.Appearing, ImVec2(0.5f, 0.5f));
	if (ImGui.BeginPopupModal(title, null, ImGuiWindowFlags.AlwaysAutoResize)) {
		static foreach (field; T.tupleof) {{
			alias labels = Filter!(typeMatches!Label, __traits(getAttributes, __traits(getMember, data, __traits(identifier, field))));
			static if (labels.length == 1) {
				enum label = labels[0].text;
			} else {
				enum label = "NO LABEL";
			}
			InputEditable(label, __traits(getMember, data, __traits(identifier, field)));
		}}
		if (ImGui.Button("OK")) {
			mainFiberExecute = () { data.execute(); };
			isActive = false;
		}
		ImGui.SameLine();
		if (ImGui.Button("Cancel")) {
			isActive = false;
		}
		ImGui.EndPopup();
	}
}

void InputEditable(E, ImGuiInputTextFlags flags = ImGuiInputTextFlags.None, T)(string label, ref T value) {
	E e = cast(E)value;
	InputEditable!flags(label, e);
	value = cast(T)e;
}
void InputEditable(ImGuiInputTextFlags flags = ImGuiInputTextFlags.None, V...)(string label, ref V values) {
	if (auto result = InputEditableR!flags(label, values)) {
		values = result.values;
	}
}
IMGUIValueChanged!V InputEditableR(ImGuiInputTextFlags flags = ImGuiInputTextFlags.None, V...)(string label, V value) {
	IMGUIValueChanged!V result;
	result.values = value;
	ImGui.BeginGroup();
	ImGui.PushID(label);
	ImGui.PushMultiItemsWidths(V.length, ImGui.CalcItemWidth());
	static foreach (i, T; V) {{
		ImGui.PushID(i);
		static if (is(T == FixedPoint1616)) {
			float tmp = cast(float)value[i].asDouble;
			if (ImGui.InputFloat("##v", &tmp, flags)) {
				infof("%s", tmp);
				result.values[i] = tmp;
				result.changed = true;
			}
		} else static if (is(T == enum)) { //enum type
			import std.traits : EnumMembers;
			if (ImGui.BeginCombo("##v", value[i].text)) {
				static foreach (e; EnumMembers!T) {
					if (ImGui.Selectable(e.text, e == value[i])) {
						result.values[i] = e;
						result.changed = true;
					}
				}
				ImGui.EndCombo();
			}
		} else static if (is(T : const(char)[])) { // strings
			if (value[i][0] == char.init) {
				value[i][] = 0;
			}
			if (ImGui.InputText("##v", value[i][])) {
				result.values[i] = value[i];
				result.changed = true;
			}
		} else { //integer type
			int tmp = value[i];
			if (ImGui.InputInt("##v", &tmp, flags)) {
				result.values[i] = cast(T)tmp;
				result.changed = true;
			}
		}
		ImGui.SameLine();
		ImGui.PopID();
		ImGui.PopItemWidth();
	}}
	ImGui.PopID();
	ImGui.Text(label);
	ImGui.EndGroup();
	return result;
}

void disabledCheckbox(string label, bool value) {
	ImGui.BeginDisabled();
	ImGui.Checkbox(label, &value);
	ImGui.EndDisabled();
}

struct IMGUIValueChanged(T...) {
	T values;
	private bool changed;
	alias values this;
	bool opCast(T: bool)() const @safe pure {
		return changed;
	}
}

struct Label {
	string text;
}

struct RunTextScript {
	@Label("Script") char[60] script;
	void execute() const {
		freezeEntities();
		playSfx(Sfx.cursor1);
		createWindowN(Window.textStandard);
		displayText(getTextBlock(script.fromStringz));
		clearInstantPrinting();
		hideHPPPWindows();
		closeAllWindows();
		unfreezeEntities();
	}
}
struct AddPartyMember {
	@Label("Party member") PartyMember newMember;
	void execute() const {
		addCharToParty(cast(ubyte)newMember);
	}
}
struct WarpToDialog {
	@Label("Preset") WarpPreset preset;
	void execute() const {
		teleport(cast(ubyte)preset);
	}
}
struct StartBattleDialog {
	@Label("Battle") EnemyGroup group;
	void execute() const {
		initBattleScripted(cast(short)group);
	}
}
struct SpawnEntity {
	@Label("Sprite") OverworldSprite sprite;
	@Label("ActionScript") ActionScript script;
	@Label("Index") short index = -1;
	@Label("X") short x;
	@Label("Y") short y;
	void execute() const {
		createEntity(cast(short)sprite, cast(short)script, index, x, y);
	}
}

void inputEBText(string label, ubyte[] input, ImGuiInputTextFlags flags = ImGuiInputTextFlags.None) {
	import std.algorithm.comparison : min;
	scope buffer = new char[](input.length * 2);
	buffer[] = '\0';
	printableRef(buffer, input);
	if (ImGui.InputText(label, buffer)) {
		const converted = ebString(buffer);
		const length = min(converted.length, input.length);
		input[0 .. length] = converted[0 .. length];
		input[length .. $] = 0;
	}
}

void menuItemCallback(string label, void function() func) {
	if (ImGui.MenuItem(label, null, null)) {
		func();
	}
}

static immutable string[][] afflictionNames = [
	[
		"None",
		"Unconscious",
		"Diamondized",
		"Paralyzed",
		"Nauseous",
		"Poisoned",
		"Sunstroke",
		"Cold",
	], [
		"None",
		"Mushroomized",
		"Possessed",
	], [
		"None",
		"Asleep",
		"Crying",
		"Immobilized",
		"Solidified",
	], [
		"None",
		"Strange",
	], [
		"None",
		"Can't concentrate (1 turn)",
		"Can't concentrate (2 turns)",
		"Can't concentrate (3 turns)",
		"Can't concentrate (4 turns)",
	], [
		"None",
		"Homesick",
	], [
		"None",
		"PSI Power Shield",
		"PSI Shield",
		"Power Shield",
		"Shield",
	],
];

void dumpVRAM() {
	import std.stdio : File;
	static int dumpVramCount = 0;
	File(format!"gfxstate%03d.regs"(dumpVramCount), "wb").rawWrite(g_frameData.getRegistersConst());
	File(format!"gfxstate%03d.vram"(dumpVramCount), "wb").rawWrite(g_frameData.vram);
	File(format!"gfxstate%03d.cgram"(dumpVramCount), "wb").rawWrite(g_frameData.cgram);
	File(format!"gfxstate%03d.oam"(dumpVramCount), "wb").rawWrite(g_frameData.oam1);
	File(format!"gfxstate%03d.oam2"(dumpVramCount), "wb").rawWrite(g_frameData.oam2);
	File(format!"gfxstate%03d.hdma"(dumpVramCount), "wb").rawWrite(g_frameData.getValidHdmaDataConst());
	dumpVramCount++;
}

void dumpSave() {
	import siryul : toFile, YAML;
	import earthbound.globals;
	import earthbound.bank2F;
	import core.stdc.string;
	SaveData block;
	memcpy(&block.gameState, &gameState, GameState.sizeof);
	memcpy(&block.partyCharacters, &partyCharacters[0], (PartyCharacter[6]).sizeof);
	memcpy(&block.eventFlags, &eventFlags[0], eventFlags.sizeof);
	block.toFile!YAML("save.yaml");
}
