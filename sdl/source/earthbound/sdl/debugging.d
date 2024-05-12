module earthbound.sdl.debugging;

import earthbound.sdl.rendering;

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
import std.meta;
import std.range;
import std.string;

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
	bool askingWarpPoint;
	bool editingVRAM;
	bool editingBG2;
	bool editingBuffer;
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
		if (ImGui.BeginMenu("File")) {
			menuItemCallback("Save game", () { mainFiberExecute = () { saveCurrentGame(); }; });
			ImGui.EndMenu();
		}
		if (ImGui.BeginMenu("Windows")) {
			ImGui.MenuItem("Debugging", null, &state.showDebugWindow);
			ImGui.EndMenu();
		}
		if (ImGui.BeginMenu("Other Stuff")) {
			menuItemCallback("Add Party Member", () { state.addingPartyMember = true; });
			menuItemCallback("Run Text Script", () { state.askingForScript = true; });
			menuItemCallback("Warp to preset destination", () { state.askingWarpToPreset = true; });
			menuItemCallback("Warp to position", () { state.askingWarpPoint = true; });
			menuItemCallback("Start a battle", () { state.askingBattle = true; });
			menuItemCallback("Edit VRAM", () { state.editingVRAM = true; });
			menuItemCallback("Edit BG2", () { state.editingBG2 = true; });
			menuItemCallback("Edit Buffer", () { state.editingBuffer = true; });
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
		memoryEditor.DrawWindow("VRAM", renderer.vram);
		state.editingVRAM = memoryEditor.Open;
	}
	if (state.editingBuffer) {
		memoryEditor.DrawWindow("Buffer", buffer);
		state.editingBuffer = memoryEditor.Open;
	}
	if (state.editingBG2) {
		memoryEditor.DrawWindow("BG2", bg2Buffer);
		state.editingBG2 = memoryEditor.Open;
	}
	handleDialog!AddPartyMember(state.addingPartyMember, "Add a party member");
	handleDialog!WarpToDialog(state.askingWarpToPreset, "Warp to preset destination");
	handleDialog!WarpToPosition(state.askingWarpPoint, "Warp to point");
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
		InputEditable!SpecialGameState("Special game state", gameState.specialGameState);
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
					InputEditable("Timer", state.timer);
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
		ImGui.Checkbox("Pause script execution", &breakActionscript);
		short entityEntry = firstEntity;
		while (entityEntry >= 0) {
			const entity = entityEntry / 2;
			if (ImGui.TreeNode(format!"%s: %s"(entity, cast(ActionScript)entityScriptTable[entity]))) {
				if (ImGui.TreeNode("Scripts")) {
					ImGui.Checkbox("Break on script execution", &entityExtra[entity].breakpoint);
					short scriptIndex = entityScriptIndexTable[entity] / 2;
					do {
						if (ImGui.TreeNode(format!"Script %s"(scriptIndex))) {
							ImGui.Text(format!"%s"(actionscriptCommandPrinter(entityProgramCounters[scriptIndex])));
							InputEditable("Sleep frames", entityScriptSleepFrames[scriptIndex]);
							InputEditable("Temp var", entityScriptTempvars[scriptIndex]);
							ImGui.TreePop();
						}
						scriptIndex = entityScriptNextScripts[scriptIndex] / 2;
					} while (scriptIndex > 0);
					ImGui.TreePop();
				}
				InputEditable!OverworldSprite("Sprite", entitySpriteIDs[entity]);
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
				InputEditable("NPC", entityNPCIDs[entity]);
				InputEditable!EnemyID("Enemy", entityEnemyIDs[entity]);
				InputEditable("Collided", entityCollidedObjects[entity]);
				foreach (idx, flagName; ["Script", "Callback"]) {
					const mask = (1 << idx + 14);
					bool flagEnabled = !(entityCallbackFlags[entity] & mask);
					if (ImGui.Checkbox(flagName, &flagEnabled)) {
						entityCallbackFlags[entity] = cast(ushort)((entityCallbackFlags[entity] & ~mask) | (!flagEnabled * mask));
					}
				}
				foreach (idx, flagName; ["Draw", "Fading"]) {
					const mask = (1 << idx + 14);
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
				InputEditable("Callback flags backup", entityCallbackFlagsBackup[entity]);
				InputEditable("SpriteMap size", entitySpriteMapSizes[entity]);
				InputEditable("SpriteMap index", entitySpriteMapBeginningIndices[entity]);
				InputEditable("Speed", entityMovementSpeed[entity]);
				InputEditable("Upper/lower body divide", entityUpperLowerBodyDivide[entity]);
				InputEditable!WalkingStyle("Walking style", entityWalkingStyles[entity]);
				InputEditable("Pathfinding state", entityPathfindingState[entity]);
				InputEditable("Enemy spawn tile", entityEnemySpawnTiles[entity]);
				InputEditable("u2D8A", entityUnknown2D8A[entity]);
				InputEditable("u2DC6", entityUnknown2DC6[entity]);
				InputEditable("Path points remaining", entityPathPointsCount[entity]);
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
				InputEditable("Animation fingerprint", entityAnimationFingerprints[entity]);
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
		InputEditable("Loaded map tile combo", loadedMapTileCombo);
		InputEditable("Loaded map palette", loadedMapPalette);
		InputEditable("Loaded map tileset", loadedMapTileset);
		InputEditable("Screen coords", screenLeftX, screenTopY);
		InputEditable("Screen coords (px)", screenXPixels, screenYPixels);
		InputEditable("Screen coords (px copy)", screenXPixelsCopy, screenYPixelsCopy);
		InputEditable("BG coordinates (copy)", bg12PositionXCopy, bg12PositionYCopy);
		InputEditable("Current teleport destination", currentTeleportDestinationX, currentTeleportDestinationY);
		InputEditable("Current sector attributes", currentSectorAttributes);
		InputEditable("Colour average", colourAverageRed, colourAverageGreen, colourAverageBlue);
		InputEditable("Saved colour average", savedColourAverageRed, savedColourAverageGreen, savedColourAverageBlue);
		InputEditable("Animated tile count", loadedAnimatedTileCount);
		InputEditable("Animated map palette loaded", mapPaletteAnimationLoaded);
		InputEditable("Wipe palettes on map load", wipePalettesOnMapLoad);
		InputEditable("New sprite tile width", newSpriteTileWidth);
		InputEditable("New sprite tile height", newSpriteTileHeight);
		InputEditable!SpawnControl("NPC spawns enabled", npcSpawnsEnabled);
		InputEditable!SpawnControl("Enemy spawns enabled", enemySpawnsEnabled);
		InputEditable("Overworld enemy count", overworldEnemyCount);
		InputEditable("Overworld enemy maximum", overworldEnemyMaximum);
		InputEditable("Magic butterfly", magicButterfly);
		InputEditable("Spawn Range", enemySpawnRangeWidth, enemySpawnRangeHeight);
		InputEditable("Show NPC flag", showNPCFlag);
		InputEditable("Too many enemies failure count", enemySpawnTooManyEnemiesFailureCount);
		InputEditable("Enemy spawn encounter ID", enemySpawnEncounterID);
		InputEditable("Remaining enemies in spawn group", enemySpawnRemainingEnemyCount);
		InputEditable("Enemy spawn chance", enemySpawnChance);
		InputEditable("Spawning enemy group", spawningEnemyGroup);
		InputEditable("Spawning enemy sprite", spawningEnemySprite);
		InputEditable("Enemy spawn counter", enemySpawnCounter);
		InputEditable("Current battle group", currentBattleGroup);
		InputEditable("Pathfinding target coordinates", pathfindingTargetCenterX, pathfindingTargetCenterY);
		InputEditable("Pathfinding target dimensions", pathfindingTargetWidth, pathfindingTargetHeight);
		InputEditable("Touched enemy", touchedEnemy);
		InputEditable("Touched enemy target entity", enemyPathfindingTargetEntity);
		InputEditable("Enemy has just been touched", enemyHasBeenTouched);
		InputEditable("Initiative", battleInitiative);
		InputEditable("Actionscript backup coordinates", actionScriptBackupX, actionScriptBackupY);
		InputEditable!BattleMode("Battle mode", battleMode);
		InputEditable("Party member didn't die this frame", partyMembersAliveOverworld);
		InputEditable("Misc debug flags", playerMovementFlags);
		InputEditable("Intangibility frames", playerIntangibilityFrames);
		InputEditable("Bicycle diagonal turn frame counter", bicycleDiagonalTurnCounter);
		InputEditable("Last sector", lastSectorX, lastSectorY);
		InputEditable("Battle swirl frames", battleSwirlCountdown);
		InputEditable("Interacting NPC ID", interactingNPCID);
		InputEditable("Interacting NPC entity", interactingNPCEntity);
		InputEditable("BG colour backup", backgroundColourBackup);
		InputEditable("Input disabled frames", inputDisableFrameCounter);
		InputEditable!Direction("Current leader direction", currentLeaderDirection);
		InputEditable("Current leading party member entity", currentLeadingPartyMemberEntity);
		InputEditable!CameraMode("Camera mode backup", cameraModeBackup);
		InputEditable("Camera mode 3 frames left", cameraMode3FramesLeft);
		InputEditable("OSS", overworldStatusSuppression);
		InputEditable("Pending QI", pendingInteractions);
		InputEditable("Mushroomization timer", mushroomizationTimer);
		InputEditable("Mushroomization modifier", mushroomizationModifier);
		InputEditable("Mushroomized walking", mushroomizedWalkingFlag);
		InputEditable("Temp entity surface flags", tempEntitySurfaceFlags);
		InputEditable("Final movement direction", finalMovementDirection);
		InputEditable("Ladder/stairs tile x", ladderStairsTileX);
		InputEditable("Ladder/stairs tile y", ladderStairsTileY);
		InputEditable("Checked Left X", checkedCollisionLeftX);
		InputEditable("Checked Top Y", checkedCollisionTopY);
		InputEditable("Set temp entity surface flags", setTempEntitySurfaceFlags);
		InputEditable("North/south collision test result", northSouthCollisionTestResult);
		InputEditable("Not moving in same direction faced", notMovingInSameDirectionFaced);
		InputEditable("Door found type", mapObjectFoundType);
		InputEditable("Current QI type", currentQueuedInteractionType);
		InputEditable("Door is currently being used", usingDoor);
		InputEditable!StairDirection("Stairs direction", stairsDirection);
		InputEditable("Escalator entrance direction", escalatorEntranceDirection);
		InputEditable("Auto movement direction", autoMovementDirection);
		InputEditable("Stairs new X", stairsNewX);
		InputEditable("Stairs new Y", stairsNewY);
		InputEditable("Escalator new X", escalatorNewX);
		InputEditable("Escalator new Y", escalatorNewY);
		InputEditable("Map music track", currentMapMusicTrack);
		InputEditable("Next map music track", nextMapMusicTrack);
		InputEditable("Disable music changes", disableMusicChanges);
		InputEditable("Do map music fade", doMapMusicFade);
		ImGui.Text(format!"Map object text: %s"(mapObjectText));
		InputEditable("Current QI", currentQueuedInteraction);
		InputEditable("Next QI", nextQueuedInteraction);
		InputEditable("Entity creation requests count", entityCreationRequestsCount);
		InputEditable("Force left text alignment", forceLeftTextAlignment);
		InputEditable("New text pixel subtile offset", newTextPixelOffset);
		InputEditable("Previous text pixel subtile offset", lastTextPixelOffsetSet);
		InputEditable("Force centre text alignment", forceCentreTextAlignment);
		InputEditable("Indent new line", vwfIndentNewLine);
		InputEditable("Last printed character", lastPrintedCharacter);
		InputEditable("Print attacker article", printAttackerArticle);
		InputEditable("Print target article", printTargetArticle);
		InputEditable("Restore menu backup", restoreMenuBackup);
		InputEditable!Window("Pagination window", paginationWindow);
		InputEditable("Pagination animation frame", paginationAnimationFrame);
		if (ImGui.TreeNode("Bubble Monkey")) {
			InputEditable!BubbleMonkeyMode("Current mode", bubbleMonkeyMode);
			InputEditable("Mode change timer", bubbleMonkeyMovementChangeTmer);
			InputEditable!Direction("Distracted next direction", bubbleMonkeyDistractedNextDirection);
			InputEditable("Distracted next direction change time", bubbleMonkeyDistractedNextDirectionChangeTime);
			InputEditable("Distracted direction changes left", bubbleMonkeyDistractedDirectionChangesLeft);
			ImGui.TreePop();
		}
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
				InputEditable("ID", character.characterID);
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
				InputEditable("Is autohealed", character.isAutoHealed);
				ImGui.TreePop();
			}
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Text System")) {
		InputEditable("Character padding", characterPadding);
		InputEditable("Current focus", currentFocusWindow);
		InputEditable("CNum", cNum);
		InputEditable("CItem", cItem);
		InputEditable("Skip adding command text", skipAddingCommandText);
		InputEditable("Enable word wrap", enableWordWrap);
		InputEditable("Extra tick before window closes", extraTickOnWindowClose);
		InputEditable("Blinking triangle prompt", blinkingTriangleFlag);
		InputEditable!TextSoundMode("Text sound mode", textSoundMode);
		if (ImGui.TreeNode("Windows")) {
			foreach (openWindowID; windowTable) {
				if (openWindowID == -1) {
					continue;
				}
				if (ImGui.TreeNode(format!"%s"(cast(Window)windowStats[openWindowID].windowID))) {
					InputEditable("Next", windowStats[openWindowID].next);
					InputEditable("Previous", windowStats[openWindowID].previous);
					InputEditable("Coords", windowStats[openWindowID].x, windowStats[openWindowID].y);
					InputEditable("Dimensions", windowStats[openWindowID].width, windowStats[openWindowID].height);
					InputEditable("Text Coords", windowStats[openWindowID].textX, windowStats[openWindowID].textY);
					InputEditable("Padding", windowStats[openWindowID].numPadding);
					InputEditable("Tile Attributes", windowStats[openWindowID].tileAttributes);
					InputEditable("Font", windowStats[openWindowID].font);
					if (ImGui.TreeNode("Registers")) {
						InputEditable("Main", windowStats[openWindowID].mainRegister.integer);
						InputEditable("Sub", windowStats[openWindowID].subRegister);
						InputEditable("Loop", windowStats[openWindowID].loopRegister);
						InputEditable("Main (backup)", windowStats[openWindowID].mainRegisterBackup.integer);
						InputEditable("Sub (backup)", windowStats[openWindowID].subRegisterBackup);
						InputEditable("Loop (backup)", windowStats[openWindowID].loopRegisterBackup);
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
			foreach (i; 0 .. nextTextStackFrame) {
				if (ImGui.TreeNode(format!"State %s"(i))) {
					ImGui.Text(format!"Current CC [%02X]"(displayTextStates[(i + 1) % displayTextStates.length].script[0]));
					InputEditable("Restore window attributes", displayTextStates[(i + 1) % displayTextStates.length].restoreWindowAttributes);
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
				if (menuOption.type == MenuOptionType.available) {
					continue;
				}
				const label = printable(menuOption.label);
				if (ImGui.TreeNode(label ? label : "Unlabelled option")) {
					InputEditable!MenuOptionType("Type", menuOption.type);
					InputEditable("Next option", menuOption.next);
					InputEditable("Previous option", menuOption.previous);
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
		if (ImGui.TreeNode("Renderer State")) {
			InputEditable("Pixel position", textRenderState.pixelsRendered);
			InputEditable("VRAM index (Upper half)", textRenderState.upperVRAMPosition);
			InputEditable("VRAM index (Lower half)", textRenderState.lowerVRAMPosition);
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
		InputEditable!ItemID("Item used", battleItemUsed);
		InputEditable("Highest enemy level in battle", highestEnemyLevelInBattle);
		InputEditable!SpecialDefeat("Special Defeat", specialDefeat);
		InputEditable!ItemID("Item dropped", itemDropped);
		InputEditable("Mirrored enemy", mirrorEnemy);
		InputEditable("Mirror turns left", mirrorTurnTimer);
		InputEditable("Debugging - Current PSI animation", debuggingCurrentPSIAnimation);
		InputEditable("Debugging - Current swirl", debuggingCurrentSwirl);
		InputEditable("Debugging - Current swirl flags", debuggingCurrentSwirlFlags);
		InputEditable("Is a Smaaaash attack", isSmaaaashAttack);
		InputEditable("Enemy is performing final attack", enemyPerformingFinalAttack);
		InputEditable("Skip death text and cleanup", skipDeathTextAndCleanup);
		InputEditable("Shield has nullified damage", shieldHasNullifiedDamage);
		InputEditable("Damage is reflected", damageIsReflected);
		InputEditable("Current battle spritemap allocation count", currentBattleSpritemapsAllocated);
		InputEditable("Current battle sprite allocation count", currentBattleSpritesAllocated);
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
					InputEditable("Letter", battler.suffixLetter);
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
					InputEditable("Original ID", battler.originalID);
					ImGui.TreePop();
				}
			}
			ImGui.TreePop();
		}
		ImGui.TreePop();
	}
	if (ImGui.TreeNode("Credits")) {
		InputEditable("Next credit position", creditsNextCreditPosition);
		InputEditable("Credits Row Wipe Threshold", creditsRowWipeThreshold);
		InputEditable("Current credit position", creditsScrollPosition);
		InputEditable("Photograph map loading mode", photographMapLoadingMode);
		InputEditable("Current photo", currentPhotoDisplay);
		InputEditable("Credits DMA Queue End", creditsDMAQueueEnd);
		InputEditable("Credits DMA Queue Start", creditsDMAQueueStart);
		InputEditable("Credits Current Row", creditsCurrentRow);
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
		InputEditable("Minimum wait frames", screenEffectMinimumWaitFrames);
		InputEditable("Wobble duration", wobbleDuration);
		InputEditable("Shake duration", shakeDuration);
		InputEditable("Total horizontal offset", screenEffectHorizontalOffset);
		InputEditable("Total vertical offset", screenEffectVerticalOffset);
		InputEditable("PSI animation layer X offset ", psiAnimationXOffset);
		InputEditable("PSI animation layer Y offset", psiAnimationYOffset);
		InputEditable("Green flash frames", greenFlashDuration);
		InputEditable("Red flash frames", redFlashDuration);
		InputEditable("Target Flashing enabled", enemyTargettingFlashing);
		InputEditable("HP/PP box blink duration", hpPPBoxBlinkDuration);
		InputEditable("HP/PP box blink target", hpPPBoxBlinkTarget);
		InputEditable("Damage reflect flash duration", reflectFlashDuration);
		InputEditable("Green background flash duration", greenBackgroundFlashDuration);
		InputEditable("30FPS distortion", distort30FPS);
		InputEditable("Screen value for visible part of letterbox", letterboxVisibleScreenValue);
		InputEditable("Screen value for nonvisible part of letterbox", letterboxNonvisibleScreenValue);
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
	if (ImGui.TreeNode("Engine state")) {
		if (ImGui.TreeNode("Register mirrors")) {
			InputEditable("INIDISP", mirrorINIDISP);
			InputEditable("OBSEL", mirrorOBSEL);
			InputEditable("BGMODE", mirrorBGMODE);
			InputEditable("MOSAIC", mirrorMOSAIC);
			InputEditable("BG1SC", mirrorBG1SC);
			InputEditable("BG2SC", mirrorBG2SC);
			InputEditable("BG3SC", mirrorBG3SC);
			InputEditable("BG4SC", mirrorBG4SC);
			InputEditable("BG12NBA", mirrorBG12NBA);
			InputEditable("BG34NBA", mirrorBG34NBA);
			InputEditable("WH2", mirrorWH2);
			InputEditable("TM", mirrorTM);
			InputEditable("TD", mirrorTD);
			InputEditable("NMITIMEN", mirrorNMITIMEN);
			InputEditable("HDMAEN", mirrorHDMAEN);
			InputEditable("BG1 position", bg1XPosition, bg1YPosition);
			InputEditable("BG2 position", bg2XPosition, bg2YPosition);
			InputEditable("BG3 position", bg3XPosition, bg3YPosition);
			InputEditable("BG4 position", bg4XPosition, bg4YPosition);
			InputEditable("BG1 position buffer", bg1XPositionBuffer[0], bg1YPositionBuffer[0], bg1XPositionBuffer[1], bg1YPositionBuffer[1]);
			InputEditable("BG2 position buffer", bg2XPositionBuffer[0], bg2YPositionBuffer[0], bg2XPositionBuffer[1], bg2YPositionBuffer[1]);
			InputEditable("BG3 position buffer", bg3XPositionBuffer[0], bg3YPositionBuffer[0], bg3XPositionBuffer[1], bg3YPositionBuffer[1]);
			InputEditable("BG4 position buffer", bg4XPositionBuffer[0], bg4YPositionBuffer[0], bg4XPositionBuffer[1], bg4YPositionBuffer[1]);
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("DMA state")) {
			InputEditable("Mode", dmaCopyMode);
			InputEditable("Size", dmaCopySize);
			InputEditable("VRAM destination", dmaCopyVRAMDestination);
			InputEditable("DMA bytes copied", dmaBytesCopied);
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("Input state")) {
			InputEditable("Gamepad state", padState[0], padState[1]);
			InputEditable("Gamepad held", padHeld[0], padHeld[1]);
			InputEditable("Gamepad press", padPress[0], padPress[1]);
			InputEditable("Gamepad timer", padTimer[0], padTimer[1]);
			InputEditable("Gamepad temp", padTemp);
			InputEditable("Gamepad raw", padRaw[0], padRaw[1]);
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("Demo state")) {
			InputEditable("Recording flags", demoRecordingFlags);
			InputEditable("Frames left", demoFramesLeft);
			InputEditable("Initial pad state", demoInitialPadState);
			InputEditable("Same input frames", demoSameInputFrames);
			InputEditable("Last input", demoLastInput);
			ImGui.TreePop();
		}
		InputEditable("OAM High Table Buffer", oamHighTableBuffer);
		// not really used, but whatever
		InputEditable("Spritemap bank", spritemapBank);
		InputEditable("Executing IRQ callback", inIRQCallback);
		InputEditable("RNG state", randA, randB);
		InputEditable("Fade delay frames left", fadeDelayFramesLeft);
		InputEditable("New frame started", newFrameStarted);
		InputEditable("Next frame display ID", nextFrameDisplayID);
		InputEditable("Next frame buffer ID", nextFrameBufferID);
		InputEditable("Palette upload mode", paletteUploadMode);
		InputEditable("Timer", timer);
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
			foreach (id, entry; renderer.oam1) {
				const uint upperX = !!(renderer.oam2[id/4] & (1 << ((id % 4) * 2)));
				const size = !!(renderer.oam2[id/4] & (1 << ((id % 4) * 2 + 1)));
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
			const screenRegisters = [renderer.BG1SC, renderer.BG2SC, renderer.BG3SC, renderer.BG4SC];
			const screenRegisters2 = [renderer.BG12NBA & 0xF, renderer.BG12NBA >> 4, renderer.BG34NBA & 0xF, renderer.BG34NBA >> 4];
			static foreach (layer, label; ["BG1", "BG2", "BG3", "BG4"]) {{
				if (ImGui.TreeNode(label)) {
					ImGui.Text(format!"Tilemap address: $%04X"((screenRegisters[layer] & 0xFC) << 9));
					ImGui.Text(format!"Tile base address: $%04X"(screenRegisters2[layer] << 13));
					ImGui.Text(format!"Size: %s"(["32x32", "64x32", "32x64", "64x64"][screenRegisters[layer] & 3]));
					ImGui.Text(format!"Tile size: %s"(["8x8", "16x16"][!!(renderer.BGMODE >> (4 + layer))]));
					disabledCheckbox("Mosaic Enabled", !!((renderer.MOSAIC >> layer) & 1));
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
			ushort[16] palette = renderer.cgram[paletteID * 16 .. (paletteID + 1) * 16];
			palette[] &= 0x7FFF;
			foreach (idx, tile; (cast(ushort[])renderer.vram).chunks(16).enumerate) {
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
			ImGui.Image(createTexture(data[], texWidth, texHeight, ushort.sizeof * texWidth, nativeFormat), ImVec2(texWidth * 3, texHeight * 3));
			ImGui.TreePop();
		}
		if (ImGui.TreeNode("Registers")) {
			InputEditableR("INIDISP", renderer.INIDISP);
			InputEditableR("OBSEL", renderer.OBSEL);
			InputEditableR("OAMADDR", renderer.OAMADDR);
			InputEditableR("BGMODE", renderer.BGMODE);
			InputEditableR("MOSAIC", renderer.MOSAIC);
			InputEditableR("BGxSC", renderer.BG1SC, renderer.BG2SC, renderer.BG3SC, renderer.BG4SC);
			InputEditableR("BGxNBA", renderer.BG12NBA, renderer.BG34NBA);
			InputEditableR("BG1xOFS", renderer.BG1HOFS, renderer.BG1VOFS);
			InputEditableR("BG2xOFS", renderer.BG2HOFS, renderer.BG2VOFS);
			InputEditableR("BG3xOFS", renderer.BG3HOFS, renderer.BG3VOFS);
			InputEditableR("BG4xOFS", renderer.BG4HOFS, renderer.BG4VOFS);
			InputEditableR("M7SEL", renderer.M7SEL);
			InputEditableR("M7A", renderer.M7A);
			InputEditableR("M7B", renderer.M7B);
			InputEditableR("M7C", renderer.M7C);
			InputEditableR("M7D", renderer.M7D);
			InputEditableR("M7X", renderer.M7X);
			InputEditableR("M7Y", renderer.M7Y);
			InputEditableR("WxSEL", renderer.W12SEL, renderer.W34SEL);
			InputEditableR("WOBJSEL", renderer.WOBJSEL);
			InputEditableR("WHx", renderer.WH0, renderer.WH1, renderer.WH2, renderer.WH3);
			InputEditableR("WBGLOG", renderer.WBGLOG);
			InputEditableR("WOBJLOG", renderer.WOBJLOG);
			InputEditableR("TM", renderer.TM);
			InputEditableR("TS", renderer.TS);
			InputEditableR("TMW", renderer.TMW);
			InputEditableR("TSW", renderer.TSW);
			InputEditableR("CGWSEL", renderer.CGWSEL);
			InputEditableR("CGADSUB", renderer.CGADSUB);
			InputEditableR("FIXED_COLOUR_DATA", renderer.FIXED_COLOUR_DATA_R, renderer.FIXED_COLOUR_DATA_G, renderer.FIXED_COLOUR_DATA_B);
			InputEditableR("SETINI", renderer.SETINI);
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
struct WarpToPosition {
	@Label("X") ushort x;
	@Label("Y") ushort y;
	void execute() const {
		for (short i = 1; i <= 10; i++) {
			setEventFlag(i, 0);
		}
		fadeOut(1, 1);
		playSfx(Sfx.equippedItem);
		loadMapAtPosition(x, y);
		playerHasMovedSinceMapLoad = 0;
		unknownC03FA9(x, y, 4);
		fadeIn(1, 1);
		stairsDirection = -1;
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
		createOverworldEntity(cast(short)sprite, cast(short)script, index, x, y);
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
	dumpVRAMToDir(".");
}

void dumpVRAMToDir(string basePath) {
	import std.path : buildPath;
	import std.stdio : File;
	static int dumpVramCount = 0;
	File(buildPath(basePath, format!"gfxstate%03d.regs"(dumpVramCount)), "wb").rawWrite(renderer.registers);
	File(buildPath(basePath, format!"gfxstate%03d.vram"(dumpVramCount)), "wb").rawWrite(renderer.vram);
	File(buildPath(basePath, format!"gfxstate%03d.cgram"(dumpVramCount)), "wb").rawWrite(renderer.cgram);
	File(buildPath(basePath, format!"gfxstate%03d.oam"(dumpVramCount)), "wb").rawWrite(renderer.oam1);
	File(buildPath(basePath, format!"gfxstate%03d.oam2"(dumpVramCount)), "wb").rawWrite(renderer.oam2);
	File(buildPath(basePath, format!"gfxstate%03d.hdma"(dumpVramCount)), "wb").rawWrite(renderer.allHDMAData());
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

void dumpGameState(string basePath) {
	import std.path : buildPath;
	import std.traits : isCallable;
	import siryul : toFile, YAML;
	import earthbound.hardware;
	static struct FullGameState {
		static foreach (member; AllWantedState) {
			mixin(typeof(member), " ", __traits(identifier, member), ";");
		}
	}
	FullGameState state;
	static foreach (member; AllWantedState) {
		__traits(getMember, state, __traits(identifier, member)) = member;
	}
	state.toFile!YAML(buildPath(basePath, "state.yaml"));
}

__gshared string otherThreadCrashMsg;
__gshared Throwable.TraceInfo otherThreadCrashTrace;
__gshared bool otherThreadCrashed;

noreturn writeDebugDumpOtherThread(string msg, Throwable.TraceInfo traceInfo) nothrow {
	otherThreadCrashMsg = msg;
	otherThreadCrashTrace = traceInfo;
	otherThreadCrashed = true;
	while(true) {}
}

void writeDebugDump(string msg, Throwable.TraceInfo traceInfo) {
	import std.datetime : Clock;
	import std.file : mkdirRecurse;
	import std.path : absolutePath, buildNormalizedPath, buildPath;
	import std.stdio : File, writeln;
	auto crashDir = buildNormalizedPath("dump", format!"crash %s"(Clock.currTime.toISOString)).absolutePath;
	mkdirRecurse(crashDir);
	dumpScreen(buildPath(crashDir, "screen.bmp"));
	dumpVRAMToDir(crashDir);
	dumpGameState(crashDir);
	File(buildPath(crashDir, "trace.txt"), "w").write(msg, "\n", traceInfo);
	infof("Game crashed! Details written to '%s', please report this bug at https://github.com/Herringway/earthbound/issues with as many details as you can include.", crashDir);
	debug writeln(msg, "\n", traceInfo);
}

alias AllWantedState = AliasSeq!(dmaQueueIndex, lastCompletedDMAIndex, frameCounter, oamHighTableBuffer, spritemapBank, mirrorINIDISP, mirrorOBSEL, mirrorBGMODE, mirrorMOSAIC, mirrorBG1SC, mirrorBG2SC, mirrorBG3SC, mirrorBG4SC, mirrorBG12NBA, mirrorBG34NBA, mirrorWH2, mirrorTM, mirrorTD, mirrorNMITIMEN, mirrorHDMAEN, inIRQCallback, randA, randB, fadeDelayFramesLeft, newFrameStarted, nextFrameDisplayID, nextFrameBufferID, paletteUploadMode, bg1XPosition, bg1YPosition, bg2XPosition, bg2YPosition, bg3XPosition, bg3YPosition, bg4XPosition, bg4YPosition, bg1XPositionBuffer, bg1YPositionBuffer, bg2XPositionBuffer, bg2YPositionBuffer, bg3XPositionBuffer, bg3YPositionBuffer, bg4XPositionBuffer, bg4YPositionBuffer, evenBG1XPosition, evenBG1YPosition, padState, padHeld, padPress, padTimer, padTemp, padRaw, demoRecordingFlags, demoFramesLeft, demoInitialPadState, demoSameInputFrames, demoLastInput, dmaCopyMode, dmaCopySize, dmaCopyVRAMDestination, dmaBytesCopied, currentSpriteXBase, currentSpriteYBase, currentSpriteY, memcpyWordsLeft, timer, mult16NumCalls, palettes, oam1, oam2, playerHasDoneSomethingThisFrame, lastSRAMBank, newEntityVar0, newEntityVar1, newEntityVar2, newEntityVar3, newEntityVar4, newEntityVar5, newEntityVar6, newEntityVar7, newEntityPosZ, newEntityPriority, entityAllocationMinSlot, entityAllocationMaxSlot, firstEntity, lastEntity, lastAllocatedScript, nextActiveEntity, actionScriptCurrentScript, disableActionscript, entityScriptTable, entityNextEntityTable, entityScriptIndexTable, entityScreenXTable, entityScreenYTable, entityAbsXTable, entityAbsYTable, entityAbsZTable, entityAbsXFractionTable, entityAbsYFractionTable, entityAbsZFractionTable, entityDeltaXTable, entityDeltaYTable, entityDeltaZTable, entityDeltaXFractionTable, entityDeltaYFractionTable, entityDeltaZFractionTable, entityScriptVar0Table, entityScriptVar1Table, entityScriptVar2Table, entityScriptVar3Table, entityScriptVar4Table, entityScriptVar5Table, entityScriptVar6Table, entityScriptVar7Table, entityDrawPriority, entityCallbackFlags, entityAnimationFrames, entitySpriteMapFlags, entityScriptNextScripts, entityScriptStackPosition, entityScriptSleepFrames, entityScriptTempvars, entityScriptStacks, entityBGHorizontalOffsetLow, entityBGVerticalOffsetLow, entityBGHorizontalOffsetHigh, entityBGVerticalOffsetHigh, entityBGHorizontalVelocityLow, entityBGVerticalVelocityLow, entityBGHorizontalVelocityHigh, entityBGVerticalVelocityHigh, currentEntitySlot, currentEntityOffset, currentScriptSlot, currentScriptOffset, entityHitboxLeftRightHeight, entityMovingDirection, backgroundDistortionStyle, backgroundDistortionTargetLayer, backgroundDistortSecondLayer, backgroundDistortionCompressionRate, usedBG2TileMap, keyboardInputCharacterOffsets, keyboardInputCharacterWidths, keyboardInputCharacters, psiAnimationTimeUntilNextFrame, psiAnimationFrameHoldFrames, psiAnimationTotalFrames, psiAnimationPaletteAnimationLowerRange, psiAnimationPaletteAnimationUpperRange, psiAnimationCurrentPaletteOffset, psiAnimationPaletteFrames, psiAnimationPaletteTimeUntilNextFrame, psiAnimationFullLoadedPalette, psiAnimationEnemyColourChangeStartFramesLeft, psiAnimationEnemyColourChangeFramesLeft, psiAnimationEnemyColourChangeRed, psiAnimationEnemyColourChangeGreen, psiAnimationEnemyColourChangeBlue, heap, currentSpriteDrawingPriority, priority0SpriteX, priority0SpriteY, priority0SpriteMapBanks, priority0SpriteOffset, priority1SpriteX, priority1SpriteY, priority1SpriteMapBanks, priority1SpriteOffset, priority2SpriteX, priority2SpriteY, priority2SpriteMapBanks, priority2SpriteOffset, priority3SpriteX, priority3SpriteY, priority3SpriteMapBanks, priority3SpriteOffset, entityDrawSorting, entityMovementProspectX, entityMovementProspectY, entityCallbackFlagsBackup, cachedMapBlockX, cachedMapBlockY, cachedMapBlock, usedBG2TileMapFirstFreeBit, playerHasMovedSinceMapLoad, useSecondSpriteFrame, spriteUpdateEntityOffset, footstepSoundIgnoreEntity, footstepSoundID, footstepSoundIDOverride, entityCollidedObjects, entityObstacleFlags, entitySpriteMapSizes, entitySpriteMapBeginningIndices, entityVramAddresses, entityByteWidths, entityTileHeights, entityDirections, entityMovementSpeed, entitySizes, entitySurfaceFlags, entityUpperLowerBodyDivide, entityWalkingStyles, entityPathfindingState, entityNPCIDs, entitySpriteIDs, entityEnemyIDs, entityEnemySpawnTiles, entityUnknown2D8A, entityUnknown2DC6, entityPathPointsCount, entityOverlayFlags, entityMushroomizedNextUpdateFrames, entitySweatingNextUpdateFrames, entityRippleNextUpdateFrames, entityBigRippleNextUpdateFrames, entityWeakEnemyValue, entityHitboxEnabled, entityHitboxUpDownWidth, entityHitboxUpDownHeight, entityHitboxLeftRightWidth, entityAnimationFingerprints, vwfBuffer, flyoverNextLineIncrement, transitionBackgroundXVelocity, transitionBackgroundYVelocity, transitionBackgroundX, transitionBackgroundY, animatedBackgroundLayer1HDMATable, animatedBackgroundLayer2HDMATable, backgroundHDMABuffer, swirlWindowHDMATable, swirlWindowHDMAData, earthbound.globals.debugging, loadedMapTileCombo, loadedMapPalette, loadedMapTileset, screenLeftX, screenTopY, screenXPixelsCopy, screenYPixelsCopy, screenXPixels, screenYPixels, bg12PositionXCopy, bg12PositionYCopy, currentTeleportDestinationX, currentTeleportDestinationY, currentSectorAttributes, loadedRowsX, loadedRowsY, loadedColumnsX, loadedColumnsY, colourAverageRed, colourAverageGreen, colourAverageBlue, savedColourAverageRed, savedColourAverageGreen, savedColourAverageBlue, overworldTilesetAnim, overworldPaletteAnim, loadedAnimatedTileCount, mapPaletteAnimationLoaded, mapPaletteBackup, wipePalettesOnMapLoad, newSpriteTileWidth, newSpriteTileHeight, overworldSpriteMaps, spriteVramTable, npcSpawnsEnabled, enemySpawnsEnabled, overworldEnemyCount, overworldEnemyMaximum, magicButterfly, enemySpawnRangeWidth, enemySpawnRangeHeight, showNPCFlag, enemySpawnTooManyEnemiesFailureCount, enemySpawnEncounterID, enemySpawnRemainingEnemyCount, enemySpawnChance, spawningEnemyGroup, spawningEnemySprite, enemySpawnCounter, pathfindingEnemyIDs, pathfindingEnemyCounts, currentBattleGroup, pathfindingTargetCenterX, pathfindingTargetCenterY, pathfindingTargetHeight, pathfindingTargetWidth, deliveryPaths, touchedEnemy, enemyPathfindingTargetEntity, enemyHasBeenTouched, battleInitiative, actionScriptBackupX, actionScriptBackupY, battleMode, partyMembersAliveOverworld, horizontalMovementSpeeds, verticalMovementSpeeds, playerPositionBuffer, creditsDMAQueue, playerMovementFlags, playerIntangibilityFrames, bicycleDiagonalTurnCounter, lastSectorX, lastSectorY, battleSwirlCountdown, interactingNPCID, interactingNPCEntity, overworldDamageCountdownFrames, backgroundColourBackup, inputDisableFrameCounter, currentLeaderDirection, currentLeadingPartyMemberEntity, cameraModeBackup, cameraMode3FramesLeft, hpAlertShown, overworldStatusSuppression, pendingInteractions, mushroomizationTimer, mushroomizationModifier, mushroomizedWalkingFlag, tempEntitySurfaceFlags, finalMovementDirection, ladderStairsTileX, ladderStairsTileY, checkedCollisionLeftX, checkedCollisionTopY, setTempEntitySurfaceFlags, northSouthCollisionTestResult, notMovingInSameDirectionFaced, mapObjectFoundType, currentQueuedInteractionType, usingDoor, stairsDirection, escalatorEntranceDirection, autoMovementDirection, stairsNewX, stairsNewY, escalatorNewX, escalatorNewY, currentMapMusicTrack, nextMapMusicTrack, disableMusicChanges, doMapMusicFade, mapObjectText, queuedInteractions, currentQueuedInteraction, nextQueuedInteraction, entityCreationRequests, entityCreationRequestsCount, activeHotspots, skipAddingCommandText, characterPadding, enableWordWrap, extraTickOnWindowClose, forceLeftTextAlignment, newTextPixelOffset, lastTextPixelOffsetSet, forceCentreTextAlignment, vwfIndentNewLine, lastPrintedCharacter, printAttackerArticle, printTargetArticle, restoreMenuBackup, paginationWindow, paginationAnimationFrame, textTilemapBuffer, bg2Buffer, dummyWindow, windowStats, windowHead, windowTail, windowTable, titledWindows, currentFocusWindow, numberTextBuffer, hpPPWindowDigitBuffer, hpPPWindowBuffer, renderHPPPWindows, battleMenuCurrentCharacterID, currentFlashingRow, currentFlashingEnemy, currentFlashingEnemyRow, menuOptions, instantPrinting, redrawAllWindows, uploadHPPPMeterTiles, selectedTextSpeed, hpMeterSpeed, partyMemberSelectionScripts, actionscriptState, battleModeFlag, textPromptWaitingForInput, currentlyDrawnHPPPWindows, hpPPMeterAreaNeedsUpdate, textSpeedBasedWait, blinkingTriangleFlag, textSoundMode, textRenderState, attackerEnemyID, targetEnemyID, upcomingWordLength, nextKeyboardInputIndex, wordSplittingBuffer, menuBackupSelectedTextX, menuBackupSelectedTextY, menuBackupCurrentOption, menuBackupSelectedOption, earlyTickExit, menuOptionLabelLengths, unknown7E9691, halfHPMeterSpeed, fastestHPMeterSpeed, disableHPPPRolling, hpPPMeterFlipoutMode, hpPPMeterFlipoutModeHPBackups, hpPPMeterFlipoutModePPBackups, displayTextStates, nextTextStackFrame, ccArgumentStorage, ccArgumentGatheringLoopCounter, textSubRegisterBackup, textLoopRegisterBackup, onGoSubOffset, textNewMenuOptionBuffer, gameState, partyCharacters, eventFlags, currentInteractingEventFlag, windowTextAttributesBackup, temporaryTextBuffer, temporaryWeapon, temporaryBodyGear, temporaryArmsGear, temporaryOtherGear, compareEquipmentMode, characterForEquipMenu, battleAttackerName, battleTargetName, cItem, cNum, overworldSelectedPSIUser, onlyOneCharacterWithPSI, lastSelectedPSIDescription, respawnX, respawnY, vwfX, vwfTile, dmaTransferFlag, entityPreparedXCoordinate, entityPreparedYCoordinate, entityPreparedDirection, cameraFocusEntity, spawningTravellingPhotographerID, actionscriptCOLDATABlue, actionscriptCOLDATAGreen, actionscriptCOLDATARed, rectangleWindowBufferIndex, overworldTasks, dadPhoneTimer, dadPhoneQueued, autoMovementDemoBuffer, autoMovementDemoPosition, loadedItemTransformations, itemTransformationsLoaded, timeUntilNextItemTransformationCheck, flyoverScreenOffset, flyoverPixelOffset, flyoverByteOffset, bubbleMonkeyMode, bubbleMonkeyMovementChangeTmer, bubbleMonkeyDistractedNextDirection, bubbleMonkeyDistractedNextDirectionChangeTime, bubbleMonkeyDistractedDirectionChangesLeft, psiTeleportDestination, psiTeleportStyle, teleportState, teleportationSpeed, psiTeleportSpeedX, psiTeleportSpeedY, psiTeleportNextX, psiTeleportNextY, psiTeleportSuccessScreenSpeedX, psiTeleportSuccessScreenX, psiTeleportSuccessScreenSpeedY, psiTeleportSuccessScreenY, psiTeleportBetaAngle, psiTeleportBetaProgress, psiTeleportBetterProgress, psiTeleportBetaXAdjustment, psiTeleportBetaYAdjustment, miniGhostEntityID, miniGhostAngle, possessedPlayerCount, pajamaFlag, movingPartyMemberEntityID, titleScreenQuickMode, sramVersion, corruptionCheckResults, tilemapUpdateTileX, tilemapUpdateTileY, tilemapUpdateTileCount, tilemapUpdateTileHeight, tilemapUpdateTileWidth, tilemapUpdateBaseAddress, unused7E9F88, enemiesInBattle, enemiesInBattleIDs, battlersTable, battlerTargetFlags, battleEXPScratch, battleMoneyScratch, currentGiygasPhase, battleItemUsed, battleMenuSelection, attackerNameAdjustScratch, targetNameAdjustScratch, targetNameBuffer, stealableItemCandidates, highestEnemyLevelInBattle, specialDefeat, itemDropped, mirrorEnemy, mirrorBattlerBackup, mirrorTurnTimer, partyMembersWithSelectedActions, debuggingCurrentPSIAnimation, debuggingCurrentSwirl, debuggingCurrentSwirlFlags, instantWinSortedOffense, instantWinSortedHP, instantWinSortedDefense, isSmaaaashAttack, enemyPerformingFinalAttack, skipDeathTextAndCleanup, shieldHasNullifiedDamage, damageIsReflected, usedEnemyLetters, currentBattleSpritemapsAllocated, currentBattleSpritesAllocated, battleSpritemapAllocationCounts, currentBattleSpriteEnemyIDs, currentBattleSpriteWidths, currentBattleSpriteHeights, battleSpritemaps, altBattleSpritemaps, numBattlersInFrontRow, numBattlersInBackRow, battlerFrontRowXPositions, battlerFrontRowYPositions, battlerBackRowXPositions, battlerBackRowYPositions, backRowBattlers, frontRowBattlers, currentLayerConfig, verticalShakeDuration, verticalShakeHoldDuration, screenEffectMinimumWaitFrames, wobbleDuration, shakeDuration, screenEffectHorizontalOffset, screenEffectVerticalOffset, psiAnimationXOffset, psiAnimationYOffset, greenFlashDuration, redFlashDuration, enemyTargettingFlashing, hpPPBoxBlinkDuration, hpPPBoxBlinkTarget, reflectFlashDuration, greenBackgroundFlashDuration, distort30FPS, letterboxVisibleScreenValue, letterboxNonvisibleScreenValue, letterboxTopEnd, letterboxBottomStart, letterboxEffectEnding, letterboxHDMATable, letterboxEffectEndingTop, letterboxEffectEndingBottom, enableBackgroundDarkening, backgroundBrightness, loadedBGDataLayer1, loadedBGDataLayer2, framesLeftUntilNextSwirlUpdate, framesUntilNextSwirlFrame, swirlFramesLeft, swirlHDMATableID, swirlInvertEnabled, swirlReversed, swirlMaskSettings, swirlHDMAChannelOffset, swirlLengthPadding, swirlAutoRestore, loadedOvalWindowCentreX, loadedOvalWindowCentreY, loadedOvalWindowWidth, loadedOvalWindowHeight, loadedOvalWindowCentreXAdd, loadedOvalWindowCentreYAdd, loadedOvalWindowWidthVelocity, loadedOvalWindowHeightVelocity, loadedOvalWindowWidthAcceleration, loadedOvalWindowHeightAcceleration, swirlNextSwirl, swirlRepeatSpeed, swirlRepeatsUntilSpeedUp, psiAnimationEnemyTargets, activeOvalWindow, battleSpriteRowWidth, battleSpritePaletteEffectFramesLeft, battleSpritePaletteEffectDeltas, battleSpritePaletteEffectCounters, battleSpritePaletteEffectSteps, battleSpritePaletteEffectSpeed, soundStonePlaybackState, soundStoneSpriteTilemap1, soundStoneSpriteTilemap2, activeManpuX, activeManpuY, pathMatrixRows, pathMatrixCols, pathMatrixBorder, pathMatrixSize, pathCardinalOffset, pathCardinalIndex, pathDiagonalIndex, allowTextOverflow, saveFilesPresent, currentSaveSlot, lastPartyMemberStatusLastCheck, entityFadeStatesLength, entityFadeEntity, townMapIconAnimationFrame, townMapPlayerIconAnimationFrame, framesUntilMapIconPaletteUpdate, waitForNamingScreenActionScript, disabledTransitions, nextYourSanctuaryLocationTileIndex, totalYourSanctuaryLoadedTilesetTiles, yourSanctuaryLoadedTilesetTiles, loadedYourSanctuaryLocations, forceNormalFontForLengthCalculation, castTileOffset, initialCastEntitySleepFrames, creditsNextCreditPosition, creditsRowWipeThreshold, creditsScrollPosition, photographMapLoadingMode, currentPhotoDisplay, creditsDMAQueueEnd, creditsDMAQueueStart, creditsCurrentRow, creditsPlayerNameBuffer, deliveryAttempts, deliveryTimers, piracyFlag, currentMusicTrack, debugSoundMenuInitialBGM, sequencePackMask, enableAutoSectorMusicChanges, debugSoundMenuSelectedBGM, debugSoundMenuSelectedSE, debugSoundMenuSelectedEffect, debugCursorEntity, debugMenuCursorPosition, debugMenuButtonPressed, debugModeNumber, viewAttributeMode, debugStartPositionX, debugStartPositionY, debugViewCharacterSprite, replayModeActive, randABackup, randBBackup, frameCounterBackup, replayTransitionStyle, debugEnemiesEnabledFlag, );
