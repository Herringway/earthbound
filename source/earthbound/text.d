module earthbound.text;

import earthbound.actionscripts;
import earthbound.commondefs;

const(void)[][const(char)[]] textData;

private struct CacheEntry {
	uint keyLength;
	uint valueLength;
	uint keyOffset;
	uint valueOffset;
}

void loadTextCache(string path) {
	import std.file : read;
	auto data = cast(const(ubyte)[])read(path);
	const entryCount = (cast(const(uint)[])(data[0 .. uint.sizeof]))[0];
	const entries = cast(const(CacheEntry)[])(data[uint.sizeof .. entryCount * CacheEntry.sizeof + uint.sizeof]);
	textData = null;
	foreach (entry; entries) {
		const key = cast(const(char)[])data[entry.keyOffset .. entry.keyOffset + entry.keyLength];
		const value = data[entry.valueOffset .. entry.valueOffset + entry.valueLength];
		textData[key] = value.fromBytes;
	}
}

void saveTextCache(string path) {
	import std.stdio : File;
	const(ubyte)[] data;
	CacheEntry[] entries;
	entries.reserve(textData.length);
	const baseOffset = (textData.length * CacheEntry.sizeof) + uint.sizeof;

	foreach (key, value; textData) {
		CacheEntry entry;
		const currentOffset = baseOffset + data.length;
		const converted = value.asBytes;
		entry.keyLength = cast(uint)key.length;
		entry.valueLength = cast(uint)converted.length;
		entry.keyOffset = cast(uint)currentOffset;
		entry.valueOffset = cast(uint)(currentOffset + key.length);
		data ~= key;
		data ~= converted;
		entries ~= entry;
	}

	assert(textData.length < uint.max, "Too many text entries for cache");
	auto writer = File(path, "w").lockingBinaryWriter;
	writer.put(cast(uint)entries.length);
	writer.put(entries);
	writer.put(data);
}

const(ubyte)[] asBytes(const(void)[] textChunk) {
	import std.algorithm.searching : countUntil;
	const(ubyte)[] readLabel(const(ubyte)[] label) {
		auto str = (cast(const(char[])[])(label[0 .. (const(char)[]).sizeof]))[0];
		uint[1] strLength = cast(uint)str.length;
		return cast(ubyte[])strLength[] ~ cast(const(ubyte)[])str;
	}
	const(ubyte)[] data;
	while(textChunk.length > 0) {
		const cc = getFullCC(cast(const(ubyte)[])textChunk);
		textChunk = textChunk[cc.length .. $];
		switch (cc[0]) {
			case MainCC.jumpIfFlagSet:
				data ~= cc[0 .. 3];
				data ~= readLabel(cc[3 .. $]);
				break;
			case MainCC.jump:
			case MainCC.call:
				data ~= cc[0] ~ readLabel(cc[1 .. $]);
				break;
			case MainCC.jumpSwitch:
				data ~= cc[0 .. 2];
				size_t offset = 2;
				foreach(i; 0 .. cc[1]) {
					const label = readLabel(cc[offset .. $]);
					offset += string.sizeof;
					data ~= label;
				}
				break;
			case MainCC.misc19:
				switch (cc[1]) {
					case SubCC19.loadString:
						const text = cc[2 .. 2 + cc[2 .. $].countUntil(1, 2)];
						const type = cc[text.length + 2];
						data ~= cc[0 .. 2] ~ text ~ type;
						if (type == 1) {
							data ~= readLabel(cc[text.length + uint.sizeof + 3 .. $]);
						}
						break;
					default:
						data ~= cc;
						break;
				}
				break;
			case MainCC.menus:
				switch (cc[1]) {
					case SubCC1A.cc00:
					case SubCC1A.cc01:
						data ~= cc[0 .. 2];
						size_t offset = 2;
						foreach (i; 0 .. 4) {
							const label = readLabel(cc[offset .. $]);
							data ~= label;
							offset += string.sizeof;
						}
						data ~= cc[$ - 1 .. $];
						break;
					default:
						data ~= cc;
						break;
				}
				break;
			case MainCC.memory:
				switch (cc[1]) {
					case SubCC1B.cc02:
					case SubCC1B.cc03:
						data ~= cc[0 .. 2] ~ readLabel(cc[2 .. $]);
						break;
					default:
						data ~= cc;
						break;
				}
				break;
			case MainCC.misc1F:
				switch (cc[1]) {
					case SubCC1F.cc63:
						data ~= cc[0 .. 2] ~ readLabel(cc[2 .. $]);
						break;
					case SubCC1F.cc66:
						data ~= cc[0 .. 4] ~ readLabel(cc[4 .. $]);
						break;
					case SubCC1F.ccC0:
						data ~= cc[0 .. 3];
						size_t offset = 3;
						foreach(i; 0 .. cc[2]) {
							const label = readLabel(cc[offset .. $]);
							offset += string.sizeof;
							data ~= label;
						}
						break;
					default:
						data ~= cc;
						break;
				}
				break;
			default:
				data ~= cc;
				break;
		}
	}
	return data;
}

const(void)[] fromBytes(const(ubyte)[] textChunk) {
	import std.algorithm.searching : countUntil;
	static const(ubyte)[] readLabelLength(const(ubyte)[] label, out uint length) {
		length = (cast(const(uint)[])(label[0 .. uint.sizeof]))[0];
		string str = (cast(const(char)[])label[uint.sizeof .. uint.sizeof + length]).idup;
		return allBytes(str);
	}
	static const(ubyte)[] readLabel(const(ubyte)[] label) {
		uint _;
		return readLabelLength(label, _);
	}
	const(void)[] data;
	while(textChunk.length > 0) {
		const cc = getCachedFullCC(textChunk);
		textChunk = textChunk[cc.length .. $];
		switch (cc[0]) {
			case MainCC.jumpIfFlagSet:
				data ~= cc[0 .. 3];
				data ~= readLabel(cc[3 .. $]);
				break;
			case MainCC.jump:
			case MainCC.call:
				data ~= cc[0] ~ readLabel(cc[1 .. $]);
				break;
			case MainCC.jumpSwitch:
				data ~= cc[0 .. 2];
				size_t offset = 2;
				foreach(i; 0 .. cc[1]) {
					uint length;
					const label = readLabelLength(cc[offset .. $], length);
					offset += length + uint.sizeof;
					data ~= label;
				}
				break;
			case MainCC.misc19:
				switch (cc[1]) {
					case SubCC19.loadString:
						const text = cc[2 .. 2 + cc[2 .. $].countUntil(1, 2)];
						const type = cc[text.length + 2];
						data ~= cc[0 .. 2] ~ text ~ type;
						if (type == 1) {
							data ~= readLabel(cc[text.length + uint.sizeof + 3 .. $]);
						}
						break;
					default:
						data ~= cc;
						break;
				}
				break;
			case MainCC.menus:
				switch (cc[1]) {
					case SubCC1A.cc00:
					case SubCC1A.cc01:
						data ~= cc[0 .. 2];
						size_t offset = 2;
						foreach (i; 0 .. 4) {
							uint length;
							const label = readLabelLength(cc[offset .. $], length);
							offset += length + uint.sizeof;
							data ~= label;
						}
						data ~= cc[$ - 1 .. $];
						break;
					default:
						data ~= cc;
						break;
				}
				break;
			case MainCC.memory:
				switch (cc[1]) {
					case SubCC1B.cc02:
					case SubCC1B.cc03:
						data ~= cc[0 .. 2] ~ readLabel(cc[2 .. $]);
						break;
					default:
						data ~= cc;
						break;
				}
				break;
			case MainCC.misc1F:
				switch (cc[1]) {
					case SubCC1F.cc63:
						data ~= cc[0 .. 2] ~ readLabel(cc[2 .. $]);
						break;
					case SubCC1F.cc66:
						data ~= cc[0 .. 4] ~ readLabel(cc[4 .. $]);
						break;
					case SubCC1F.ccC0:
						data ~= cc[0 .. 3];
						size_t offset = 3;
						foreach(i; 0 .. cc[2]) {
							uint length;
							const label = readLabelLength(cc[offset .. $], length);
							offset += length + uint.sizeof;
							data ~= label;
						}
						break;
					default:
						data ~= cc;
						break;
				}
				break;
			default:
				data ~= cc;
				break;
		}
	}
	return data;
}

const(ubyte)* getTextBlock(const(char)[] label) {
	import std.experimental.logger : tracef;
	tracef("Looking for text '%s'", label);
	static immutable ubyte[1] r = [2];
	debug if (!(label in textData)) {
		tracef("Not found!");
	}
	return cast(const(ubyte)*)&(textData.get(label, r[]))[0];
}

void loadText(const StructuredText[] script, const string label, const string nextLabel) {
	import std.algorithm.comparison : among;
	ubyte[] data;
	bool properlyTerminated;
	foreach (cc; script) {
		properlyTerminated = false;
		if (cc.mainCC.isNull) {
			data ~= ebString(cc.text);
		} else {
			data ~= cc.mainCC.get();
			final switch (cc.mainCC.get()) {
				case MainCC.halt:
					properlyTerminated = true;
					break;
				case MainCC.haltWithoutTriangle:
				case MainCC.haltWithPrompt:
				case MainCC.haltVariablePrompt:
				case MainCC.lineBreak: //these have no arguments
				case MainCC.startBlankLine:
				case MainCC.incrementSecondaryMemory:
				case MainCC.createMenu:
				case MainCC.clearLine:
					break;
				case MainCC.setFlag:
				case MainCC.clearFlag:
				case MainCC.getFlag:
					assert(cc.eventFlag.get() <= 0x400, "Invalid event flag!");
					data ~= allBytes(cast(ushort)cc.eventFlag.get());
					break;
				case MainCC.jumpIfFlagSet:
					assert(cc.eventFlag.get() <= 0x400, "No flag specified!");
					assert(cc.labels.length == 1, "No label specified!");
					data ~= allBytes(cast(ushort)cc.eventFlag.get());
					data ~= allBytes(cc.labels[0]);
					break;
				case MainCC.jump:
					properlyTerminated = true;
					goto case;
				case MainCC.call:
					assert(cc.labels.length <= ubyte.max, "No label specified!");
					data ~= allBytes(cc.labels[0]);
					break;
				case MainCC.jumpSwitch:
					assert(cc.labels.length <= ubyte.max, "Too many jump labels!");
					data ~= cast(ubyte)cc.labels.length;
					foreach (jumpLabel; cc.labels) {
						data ~= allBytes(jumpLabel);
					}
					break;
				case MainCC.testWorkMemoryTrue:
				case MainCC.testWorkMemoryFalse:
				case MainCC.storeSecondaryMemory:
				case MainCC.pause:
				case MainCC.compressed1:
				case MainCC.compressed2:
				case MainCC.compressed3:
					assert(cc.byteValues.length > 0, "Missing argument!");
					data ~= cc.byteValues[0];
					break;
				case MainCC.copyToArgMemory:
					assert(!cc.cc0DArgument.isNull, "Missing argument!");
					data ~= cc.cc0DArgument.get;
					break;
				case MainCC.manageWindows:
					assert(!cc.subCC.isNull, "No sub-CC specified!");
					data ~= cc.subCC.get();
					final switch (cast(SubCC18)cc.subCC.get) {
						case SubCC18.closeWindow: //no args
						case SubCC18.saveWindow:
						case SubCC18.closeAllWindows:
						case SubCC18.clearWindow:
						case SubCC18.showWalletWindow:
							break;
						case SubCC18.openWindow:
						case SubCC18.switchWindow:
						case SubCC18.menuInWindow:
						case SubCC18.cancellableMenuInWindow:
							assert(!cc.window.isNull, "Missing window!");
							data ~= cast(ubyte)cc.window.get;
							break;
						case SubCC18.setTextAlignment:
						case SubCC18.printCharacterStatus:
							assert(cc.byteValues.length == 2, "Missing arguments!");
							data ~= cc.byteValues[0 .. 2];
							break;
						case SubCC18.compareRegisterWithNumber:
							assert(cc.intValues.length == 1, "Missing int argument!");
							assert(cc.byteValues.length == 1, "Missing byte argument!");
							data ~= allBytes(cc.intValues[0]);
							data ~= cc.byteValues;
							break;
					}
					break;
				case MainCC.misc19:
					assert(!cc.subCC.isNull, "No sub-CC specified!");
					data ~= cc.subCC.get();
					final switch (cast(SubCC19)cc.subCC.get()) {
						case SubCC19.clearStrings: //no args
						case SubCC19.returnEscargoExpressItemAutoIncrement:
						case SubCC19.getDelta:
						case SubCC19.getBattleActionArgument:
						case SubCC19.returnPartyCount:
							break;
						case SubCC19.loadString:
							assert(cc.text != "", "No string specified!");
							assert(cc.byteValues.length == 1, "Must specify one byte value!");
							assert(cc.byteValues[0].among(1, 2), "Invalid byte value!");
							assert(cc.byteValues[0] == 2 || (cc.labels.length == 1), "loadString type 1 must specify a single label!");
							data ~= ebString(cc.text);
							data ~= cc.byteValues[0];
							if (cc.byteValues[0] == 1) {
								data ~= allBytes(cc.labels[0]);
							}
							break;
						case SubCC19.inflictStatus:
							assert(cc.byteValues.length == 3, "Must specify three byte values!");
							data ~= cc.byteValues;
							break;
						case SubCC19.returnCharacterNumber:
						case SubCC19.returnCharacterLetter:
						case SubCC19.returnCharacterEXPNeeded:
						case SubCC19.returnEscargoExpressItem:
						case SubCC19.returnMenuItemCount:
						case SubCC19.returnFoodCategory:
						case SubCC19.returnMatchingCondimentID:
						case SubCC19.setRespawnPoint:
						case SubCC19.returnStatValue:
						case SubCC19.returnStatLetter:
							assert(cc.byteValues.length == 1, "Must specify one byte value!");
							data ~= cc.byteValues;
							break;
						case SubCC19.returnCharacterStatusByte:
						case SubCC19.returnCharacterInventoryItem:
						case SubCC19.queueItemForDelivery:
						case SubCC19.getQueuedItem:
							assert(cc.byteValues.length == 2, "Must specify two byte values!");
							data ~= cc.byteValues;
							break;
						case SubCC19.returnDirectionFromCharacterToObject:
							assert(cc.byteValues.length == 2, "Must specify two byte values!");
							assert(cc.shortValues.length == 1, "Must specify one short value!");
							data ~= cc.byteValues;
							data ~= allBytes(cc.shortValues[0]);
							break;
						case SubCC19.returnDirectionFromNPCToObject:
						case SubCC19.returnDirectionFromGeneratedSpriteToObject:
							assert(cc.byteValues.length == 1, "Must specify one byte value!");
							assert(cc.shortValues.length == 2, "Must specify two short values!");
							data ~= allBytes(cc.shortValues[0]);
							data ~= cc.byteValues;
							data ~= allBytes(cc.shortValues[1]);
							break;
					}
					break;
				case MainCC.menus:
					assert(!cc.subCC.isNull, "No sub-CC specified!");
					data ~= cc.subCC.get();
					final switch (cast(SubCC1A)cc.subCC.get()) {
						case SubCC1A.cc04: //no args
						case SubCC1A.cc07:
						case SubCC1A.cc08:
						case SubCC1A.cc09:
						case SubCC1A.cc0A:
						case SubCC1A.cc0B:
							break;
						case SubCC1A.cc00:
						case SubCC1A.cc01:
							assert(cc.byteValues.length == 1, "Must specify one byte value!");
							assert(cc.labels.length == 4, "Must specify four labels!");
							foreach (jumpLabel; cc.labels[0 .. 4]) {
								data ~= allBytes(jumpLabel);
							}
							data ~= cc.byteValues;
							break;
						case SubCC1A.cc05:
							assert(cc.byteValues.length == 2, "Must specify two byte values!");
							data ~= cc.byteValues;
							break;
						case SubCC1A.cc06:
							assert(cc.byteValues.length == 1, "Must specify one byte value!");
							data ~= cc.byteValues;
							break;
					}
					break;
				case MainCC.memory:
					assert(!cc.subCC.isNull, "No sub-CC specified!");
					data ~= cc.subCC.get();
					final switch (cast(SubCC1B)cc.subCC.get()) {
						case SubCC1B.cc00: //no args
						case SubCC1B.cc01:
						case SubCC1B.cc04:
						case SubCC1B.cc05:
						case SubCC1B.cc06:
							break;
						case SubCC1B.cc02:
						case SubCC1B.cc03:
							assert(cc.labels.length == 1, "Must specify a label!");
							data ~= allBytes(cc.labels[0]);
							break;
					}
					break;
				case MainCC.misc1C:
					assert(!cc.subCC.isNull, "No sub-CC specified!");
					data ~= cc.subCC.get();
					final switch (cast(SubCC1C)cc.subCC.get()) {
						case SubCC1C.cc04: //no args
						case SubCC1C.cc0D:
						case SubCC1C.cc0E:
						case SubCC1C.cc0F:
							break;
						case SubCC1C.cc00:
						case SubCC1C.cc01:
						case SubCC1C.cc02:
						case SubCC1C.cc03:
						case SubCC1C.cc05:
						case SubCC1C.cc06:
						case SubCC1C.cc07:
						case SubCC1C.cc08:
						case SubCC1C.cc09:
						case SubCC1C.cc0C:
						case SubCC1C.cc11:
						case SubCC1C.cc12:
						case SubCC1C.cc14:
						case SubCC1C.cc15:
							assert(cc.byteValues.length == 1, "Must specify a byte value!");
							data ~= cc.byteValues;
							break;
						case SubCC1C.cc0A:
						case SubCC1C.cc0B:
							assert(cc.intValues.length == 1, "Must specify an int value!");
							data ~= allBytes(cc.intValues[0]);
							break;
						case SubCC1C.cc13:
							assert(cc.byteValues.length == 2, "Must specify two byte values!");
							data ~= cc.byteValues;
							break;
					}
					break;
				case MainCC.inventory:
					assert(!cc.subCC.isNull, "No sub-CC specified!");
					data ~= cc.subCC.get();
					final switch (cast(SubCC1D)cc.subCC.get()) {
						case SubCC1D.cc20: //no args
						case SubCC1D.cc22:
							break;
						case SubCC1D.cc02:
						case SubCC1D.cc03:
						case SubCC1D.cc0A:
						case SubCC1D.cc0B:
						case SubCC1D.cc18:
						case SubCC1D.cc19:
						case SubCC1D.cc21:
						case SubCC1D.cc23:
						case SubCC1D.cc24:
							assert(cc.byteValues.length == 1, "Must specify a byte value!");
							data ~= cc.byteValues;
							break;
						case SubCC1D.cc00:
						case SubCC1D.cc01:
						case SubCC1D.cc04:
						case SubCC1D.cc05:
						case SubCC1D.cc0E:
						case SubCC1D.cc0F:
						case SubCC1D.cc10:
						case SubCC1D.cc11:
						case SubCC1D.cc12:
						case SubCC1D.cc13:
							assert(cc.byteValues.length == 2, "Must specify two byte values!");
							data ~= cc.byteValues;
							break;
						case SubCC1D.cc06:
						case SubCC1D.cc07:
						case SubCC1D.cc14:
						case SubCC1D.cc17:
							assert(cc.intValues.length == 1, "Must specify an int value!");
							data ~= allBytes(cc.intValues[0]);
							break;
						case SubCC1D.cc08:
						case SubCC1D.cc09:
						case SubCC1D.cc0C:
						case SubCC1D.cc15:
							assert(cc.shortValues.length == 1, "Must specify a short value!");
							data ~= allBytes(cc.shortValues[0]);
							break;
						case SubCC1D.cc0D:
							assert(cc.byteValues.length == 3, "Must specify three byte values!");
							data ~= cc.byteValues;
							break;
					}
					break;
				case MainCC.stats:
					assert(!cc.subCC.isNull, "No sub-CC specified!");
					data ~= cc.subCC.get();
					final switch (cast(SubCC1E)cc.subCC.get()) {
						case SubCC1E.cc00:
						case SubCC1E.cc01:
						case SubCC1E.cc02:
						case SubCC1E.cc03:
						case SubCC1E.cc04:
						case SubCC1E.cc05:
						case SubCC1E.cc06:
						case SubCC1E.cc07:
						case SubCC1E.cc08:
						case SubCC1E.cc0A:
						case SubCC1E.cc0B:
						case SubCC1E.cc0C:
						case SubCC1E.cc0D:
						case SubCC1E.cc0E:
							assert(cc.byteValues.length == 2, "Must specify two byte values!");
							data ~= cc.byteValues;
							break;
						case SubCC1E.cc09:
							assert(cc.byteValues.length == 1, "Must specify a byte value!");
							assert(cc.intValues.length == 1, "Must specify an int value!");
							data ~= cc.byteValues;
							data ~= allBytes(cc.intValues[0]);
							break;
					}
					break;
				case MainCC.misc1F:
					assert(!cc.subCC.isNull, "No sub-CC specified!");
					data ~= cc.subCC.get();
					final switch (cast(SubCC1F)cc.subCC.get()) {
						case SubCC1F.cc03: //no args
						case SubCC1F.cc05:
						case SubCC1F.cc06:
						case SubCC1F.cc30:
						case SubCC1F.cc31:
						case SubCC1F.cc50:
						case SubCC1F.cc51:
						case SubCC1F.cc61:
						case SubCC1F.cc64:
						case SubCC1F.cc65:
						case SubCC1F.cc68:
						case SubCC1F.cc69:
						case SubCC1F.cc90:
						case SubCC1F.ccA0:
						case SubCC1F.ccA1:
						case SubCC1F.ccA2:
						case SubCC1F.ccB0:
						case SubCC1F.ccD1:
						case SubCC1F.ccED:
						case SubCC1F.ccF0:
							break;
						case SubCC1F.cc01:
						case SubCC1F.cc02:
						case SubCC1F.cc04:
						case SubCC1F.cc07:
						case SubCC1F.cc11:
						case SubCC1F.cc12:
						case SubCC1F.cc14:
						case SubCC1F.cc1D:
						case SubCC1F.cc21:
						case SubCC1F.cc41:
						case SubCC1F.cc52:
						case SubCC1F.cc60:
						case SubCC1F.cc62:
						case SubCC1F.cc67:
						case SubCC1F.ccD0:
						case SubCC1F.ccD2:
						case SubCC1F.ccD3:
						case SubCC1F.ccE5:
						case SubCC1F.ccE8:
							assert(cc.byteValues.length == 1, "Must specify a byte value!");
							data ~= cc.byteValues;
							break;
						case SubCC1F.cc00:
						case SubCC1F.cc13:
						case SubCC1F.cc1C:
						case SubCC1F.cc20:
						case SubCC1F.cc71:
						case SubCC1F.cc81:
						case SubCC1F.cc83:
						case SubCC1F.ccEB:
						case SubCC1F.ccEC:
							assert(cc.byteValues.length == 2, "Must specify two byte values!");
							data ~= cc.byteValues;
							break;
						case SubCC1F.cc15:
						case SubCC1F.cc17:
							assert(cc.shortValues.length == 2, "Must specify two short values!");
							assert(cc.byteValues.length == 1, "Must specify a byte value!");
							data ~= allBytes(cc.shortValues[0], cc.shortValues[1]);
							data ~= cc.byteValues;
							break;
						case SubCC1F.cc16:
						case SubCC1F.cc1A:
						case SubCC1F.cc1E:
						case SubCC1F.cc1F:
						case SubCC1F.ccE4:
						case SubCC1F.ccF3:
							assert(cc.shortValues.length == 1, "Must specify a short value!");
							assert(cc.byteValues.length == 1, "Must specify a byte value!");
							data ~= allBytes(cc.shortValues[0]);
							data ~= cc.byteValues;
							break;
						case SubCC1F.cc18:
						case SubCC1F.cc19:
							data ~= [0, 0, 0, 0, 0, 0, 0];
							break;
						case SubCC1F.cc1B:
						case SubCC1F.cc23:
						case SubCC1F.ccE6:
						case SubCC1F.ccE7:
						case SubCC1F.ccE9:
						case SubCC1F.ccEA:
						case SubCC1F.ccEE:
						case SubCC1F.ccEF:
						case SubCC1F.ccF4:
							assert(cc.shortValues.length == 1, "Must specify a short value!");
							data ~= allBytes(cc.shortValues[0]);
							break;
						case SubCC1F.cc40:
							data ~= [0, 0];
							break;
						case SubCC1F.cc63:
							assert(cc.labels.length == 1, "Must specify a label!");
							data ~= allBytes(cc.labels[0]);
							break;
						case SubCC1F.cc66:
							assert(cc.byteValues.length == 2, "Must specify two byte values!");
							assert(cc.labels.length == 1, "Must specify a label!");
							data ~= cc.byteValues;
							data ~= allBytes(cc.labels[0]);
							break;
						case SubCC1F.ccC0:
							assert(cc.labels.length <= ubyte.max, "Too many labels specified!");
							data ~= cast(ubyte)cc.labels.length;
							foreach (jumpLabel; cc.labels) {
								data ~= allBytes(jumpLabel);
							}
							break;
						case SubCC1F.ccE1:
							assert(cc.byteValues.length == 3, "Must specify three byte values!");
							data ~= cc.byteValues;
							break;
						case SubCC1F.ccF1:
						case SubCC1F.ccF2:
							assert(cc.shortValues.length == 2, "Must specify two byte values!");
							data ~= allBytes(cc.shortValues[0], cc.shortValues[1]);
							break;
					}
					break;
			}
		}
	}
	if (!properlyTerminated) {
		assert(nextLabel != "", "No label specified!");
		data ~= allBytes(MainCC.jump, nextLabel);
	}
	textData[label] = data;
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
	raw.raw[0 .. $ - 1] = ccArgumentStorage[0 .. T.sizeof - 1];
	raw.raw[$- 1] = lastValue;
	return raw.structure;
}

T useVariableIfZero(T,U)(T value, U variable) {
	return value == 0 ? (cast(T)variable) : value;
}

enum ReadParameters(T) = "
	alias ArgType = "~T.stringof~";
	if (ArgType.sizeof - 1 > ccArgumentGatheringLoopCounter) {
		ccArgumentStorage[ccArgumentGatheringLoopCounter++] = arg2;
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
	string[4] partyScripts;
	ubyte display;
}

align(1) struct CC1A05Arguments {
	align(1):
	ubyte window;
	ubyte character;
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

enum MainCC : ubyte {
	lineBreak = 0x00,
	startBlankLine = 0x01,
	halt = 0x02,
	haltVariablePrompt = 0x03,
	setFlag = 0x04,
	clearFlag = 0x05,
	jumpIfFlagSet = 0x06,
	getFlag = 0x07,
	call = 0x08,
	jumpSwitch = 0x09,
	jump = 0x0A,
	testWorkMemoryTrue = 0x0B,
	testWorkMemoryFalse = 0x0C,
	copyToArgMemory = 0x0D,
	storeSecondaryMemory = 0x0E,
	incrementSecondaryMemory = 0x0F,
	pause = 0x10,
	createMenu = 0x11,
	clearLine = 0x12,
	haltWithoutTriangle = 0x13,
	haltWithPrompt = 0x14,
	compressed1 = 0x15,
	compressed2 = 0x16,
	compressed3 = 0x17,
	manageWindows = 0x18,
	misc19 = 0x19,
	menus = 0x1A,
	memory = 0x1B,
	misc1C = 0x1C,
	inventory = 0x1D,
	stats = 0x1E,
	misc1F = 0x1F
}

enum SubCC18 : ubyte {
	closeWindow = 0x00,
	openWindow = 0x01,
	saveWindow = 0x02,
	switchWindow = 0x03,
	closeAllWindows = 0x04,
	setTextAlignment = 0x05,
	clearWindow = 0x06,
	compareRegisterWithNumber = 0x07,
	menuInWindow = 0x08,
	cancellableMenuInWindow = 0x09,
	showWalletWindow = 0x0A,
	printCharacterStatus = 0x0D,
}

enum SubCC19 : ubyte {
	loadString = 0x02,
	clearStrings = 0x04,
	inflictStatus = 0x05,
	returnCharacterNumber = 0x10,
	returnCharacterLetter = 0x11,
	returnEscargoExpressItemAutoIncrement = 0x14,
	returnCharacterStatusByte = 0x16,
	returnCharacterEXPNeeded = 0x18,
	returnCharacterInventoryItem = 0x19,
	returnEscargoExpressItem = 0x1A,
	returnMenuItemCount = 0x1B,
	queueItemForDelivery = 0x1C,
	getQueuedItem = 0x1D,
	getDelta = 0x1E,
	getBattleActionArgument = 0x1F,
	returnPartyCount = 0x20,
	returnFoodCategory = 0x21,
	returnDirectionFromCharacterToObject = 0x22,
	returnDirectionFromNPCToObject = 0x23,
	returnDirectionFromGeneratedSpriteToObject = 0x24,
	returnMatchingCondimentID = 0x25,
	setRespawnPoint = 0x26,
	returnStatValue = 0x27,
	returnStatLetter = 0x28,
}

enum SubCC1A : ubyte {
	cc00 = 0x00,
	cc01 = 0x01,
	cc04 = 0x04,
	cc05 = 0x05,
	cc06 = 0x06,
	cc07 = 0x07,
	cc08 = 0x08,
	cc09 = 0x09,
	cc0A = 0x0A,
	cc0B = 0x0B,
}

enum SubCC1B : ubyte {
	cc00 = 0x00,
	cc01 = 0x01,
	cc02 = 0x02,
	cc03 = 0x03,
	cc04 = 0x04,
	cc05 = 0x05,
	cc06 = 0x06,
}

enum SubCC1C : ubyte {
	cc00 = 0x00,
	cc01 = 0x01,
	cc02 = 0x02,
	cc03 = 0x03,
	cc04 = 0x04,
	cc05 = 0x05,
	cc06 = 0x06,
	cc07 = 0x07,
	cc08 = 0x08,
	cc09 = 0x09,
	cc0A = 0x0A,
	cc0B = 0x0B,
	cc0C = 0x0C,
	cc0D = 0x0D,
	cc0E = 0x0E,
	cc0F = 0x0F,
	cc11 = 0x11,
	cc12 = 0x12,
	cc13 = 0x13,
	cc14 = 0x14,
	cc15 = 0x15,
}

enum SubCC1D : ubyte {
	cc00 = 0x00,
	cc01 = 0x01,
	cc02 = 0x02,
	cc03 = 0x03,
	cc04 = 0x04,
	cc05 = 0x05,
	cc06 = 0x06,
	cc07 = 0x07,
	cc08 = 0x08,
	cc09 = 0x09,
	cc0A = 0x0A,
	cc0B = 0x0B,
	cc0C = 0x0C,
	cc0D = 0x0D,
	cc0E = 0x0E,
	cc0F = 0x0F,
	cc10 = 0x10,
	cc11 = 0x11,
	cc12 = 0x12,
	cc13 = 0x13,
	cc14 = 0x14,
	cc15 = 0x15,
	cc17 = 0x17,
	cc18 = 0x18,
	cc19 = 0x19,
	cc20 = 0x20,
	cc21 = 0x21,
	cc22 = 0x22,
	cc23 = 0x23,
	cc24 = 0x24,
}

enum SubCC1E : ubyte {
	cc00 = 0x00,
	cc01 = 0x01,
	cc02 = 0x02,
	cc03 = 0x03,
	cc04 = 0x04,
	cc05 = 0x05,
	cc06 = 0x06,
	cc07 = 0x07,
	cc08 = 0x08,
	cc09 = 0x09,
	cc0A = 0x0A,
	cc0B = 0x0B,
	cc0C = 0x0C,
	cc0D = 0x0D,
	cc0E = 0x0E,
}

enum SubCC1F : ubyte {
	cc00 = 0x00,
	cc01 = 0x01,
	cc02 = 0x02,
	cc03 = 0x03,
	cc04 = 0x04,
	cc05 = 0x05,
	cc06 = 0x06,
	cc07 = 0x07,
	cc11 = 0x11,
	cc12 = 0x12,
	cc13 = 0x13,
	cc14 = 0x14,
	cc15 = 0x15,
	cc16 = 0x16,
	cc17 = 0x17,
	cc18 = 0x18,
	cc19 = 0x19,
	cc1A = 0x1A,
	cc1B = 0x1B,
	cc1C = 0x1C,
	cc1D = 0x1D,
	cc1E = 0x1E,
	cc1F = 0x1F,
	cc20 = 0x20,
	cc21 = 0x21,
	cc23 = 0x23,
	cc30 = 0x30,
	cc31 = 0x31,
	cc40 = 0x40,
	cc41 = 0x41,
	cc50 = 0x50,
	cc51 = 0x51,
	cc52 = 0x52,
	cc60 = 0x60,
	cc61 = 0x61,
	cc62 = 0x62,
	cc63 = 0x63,
	cc64 = 0x64,
	cc65 = 0x65,
	cc66 = 0x66,
	cc67 = 0x67,
	cc68 = 0x68,
	cc69 = 0x69,
	cc71 = 0x71,
	cc81 = 0x81,
	cc83 = 0x83,
	cc90 = 0x90,
	ccA0 = 0xA0,
	ccA1 = 0xA1,
	ccA2 = 0xA2,
	ccB0 = 0xB0,
	ccC0 = 0xC0,
	ccD0 = 0xD0,
	ccD1 = 0xD1,
	ccD2 = 0xD2,
	ccD3 = 0xD3,
	ccE1 = 0xE1,
	ccE4 = 0xE4,
	ccE5 = 0xE5,
	ccE6 = 0xE6,
	ccE7 = 0xE7,
	ccE8 = 0xE8,
	ccE9 = 0xE9,
	ccEA = 0xEA,
	ccEB = 0xEB,
	ccEC = 0xEC,
	ccED = 0xED,
	ccEE = 0xEE,
	ccEF = 0xEF,
	ccF0 = 0xF0,
	ccF1 = 0xF1,
	ccF2 = 0xF2,
	ccF3 = 0xF3,
	ccF4 = 0xF4,
}

enum CC0DArgument : ubyte {
	workingMemory = 0x00,
	secondaryMemory = 0x01,
}

struct StructuredText {
	import std.typecons : Nullable;
	Nullable!MainCC mainCC;
	Nullable!ubyte subCC;
	string text;
	Nullable!EventFlag eventFlag;
	string[] labels;
	ubyte[] byteValues;
	ushort[] shortValues;
	uint[] intValues;
	Nullable!CC0DArgument cc0DArgument;
	Nullable!Window window;
}


const(ubyte)[] getCachedFullCC(const(ubyte)[] script) @safe pure {
	static size_t textSize(const ubyte[] script) {
		return (cast(const(uint)[])(script[0 .. uint.sizeof]))[0] + uint.sizeof;
	}
	ubyte f = script[0];
	if (f < 0x20) {
		switch (f) {
			case 11:
			case 12:
			case 13:
			case 14:
			case 16:
			case 21:
			case 22:
			case 23:
				return script[0 .. 2];
			case 4:
			case 5:
			case 7:
				return script[0 .. 3];
			case 6:
				return script[0 .. 3 + textSize(script[3 .. $])];
			case 8:
			case 10:
				return script[0 .. 1 + textSize(script[1 .. $])];
			case 9:
				size_t offset = 2;
				foreach (i; 0 .. script[1]) {
					offset += textSize(script[offset .. $]);
				}
				return script[0 .. offset];
			case 24:
				switch (script[1]) {
					case 1:
					case 3:
					case 8:
					case 9:
						return script[0 .. 3];
					case 5:
					case 13:
						return script[0 .. 4];
					case 7:
						return script[0 .. 7];
					default:
						return script[0 .. 2];
				}
			case 25:
				switch (script[1]) {
					case 16:
					case 17:
					case 24:
					case 26:
					case 27:
					case 33:
					case 37:
					case 38:
					case 39:
					case 40:
						return script[0 .. 3];
					case 22:
					case 25:
					case 28:
					case 29:
						return script[0 .. 4];
					case 5:
						return script[0 .. 5];
					case 34:
						return script[0 .. 6];
					case 35:
					case 36:
						return script[0 .. 7];
					case 2:
						foreach (idx, v; script[2 .. $]) {
							if (v == 1) {
								return script[0 .. idx + textSize(script[idx .. $]) + 3];
							} else if (v == 2) {
								return script[0 .. idx + 3];
							}
						}
						assert(0, "Invalid CC [19 02]");
					default:
						return script[0 .. 2];
				}
			case 26:
				switch (script[1]) {
					case 0:
					case 1:
						size_t offset = 2;
						foreach (i; 0 .. 4) {
							offset += textSize(script[offset .. $]);
						}
						return script[0 .. offset];
					case 6:
						return script[0 .. 3];
					case 5:
						return script[0 .. 4];
					default:
						return script[0 .. 2];
				}
			case 27:
				switch (script[1]) {
					case 2:
					case 3:
						return script[0 .. 2 + textSize(script[2 .. $])];
					default:
						return script[0 .. 2];
				}
			case 28:
				switch (script[1]) {
					case 0:
					case 1:
					case 2:
					case 3:
					case 5:
					case 6:
					case 7:
					case 8:
					case 9:
					case 12:
					case 17:
					case 18:
					case 20:
					case 21:
						return script[0 .. 3];
					case 19:
						return script[0 .. 4];
					case 10:
					case 11:
						return script[0 .. 6];
					default:
						return script[0 .. 2];
				}
			case 29:
				switch (script[1]) {
					case 2:
					case 3:
					case 10:
					case 11:
					case 24:
					case 25:
					case 33:
					case 35:
					case 36:
						return script[0 .. 3];
					case 0:
					case 1:
					case 4:
					case 5:
					case 8:
					case 9:
					case 12:
					case 14:
					case 15:
					case 16:
					case 17:
					case 18:
					case 19:
					case 21:
						return script[0 .. 4];
					case 13:
						return script[0 .. 5];
					case 6:
					case 7:
					case 20:
					case 23:
						return script[0 .. 6];
					default:
						return script[0 .. 2];
				}
			case 30:
				switch (script[1]) {
					case 0:
					case 1:
					case 2:
					case 3:
					case 4:
					case 5:
					case 6:
					case 7:
					case 8:
					case 10:
					case 11:
					case 12:
					case 13:
					case 14:
						return script[0 .. 4];
					case 9:
						return script[0 .. 7];
					default:
						return script[0 .. 2];
				}
			case 31:
				switch (script[1]) {
					case 1:
					case 2:
					case 4:
					case 7:
					case 17:
					case 18:
					case 20:
					case 29:
					case 33:
					case 65:
					case 82:
					case 96:
					case 98:
					case 103:
					case 208:
					case 210:
					case 211:
					case 229:
					case 232:
						return script[0 .. 3];
					case 0:
					case 19:
					case 27:
					case 28:
					case 32:
					case 35:
					case 113:
					case 129:
					case 131:
					case 230:
					case 231:
					case 233:
					case 234:
					case 235:
					case 236:
					case 238:
					case 239:
					case 244:
						return script[0 .. 4];
					case 22:
					case 26:
					case 30:
					case 31:
					case 225:
					case 228:
					case 243:
						return script[0 .. 5];
					case 241:
					case 242:
						return script[0 .. 6];
					case 21:
					case 23:
						return script[0 .. 7];
					case 24:
					case 25:
						return script[0 .. 9];
					case 99:
						return script[0 .. 2 + textSize(script[2 .. $])];
					case 102:
						return script[0 .. 4 + textSize(script[4 .. $])];
					case 192:
						size_t offset = 3;
						foreach (i; 0 .. script[2]) {
							offset += textSize(script[offset .. $]);
						}
						return script[0 .. offset];
					default:
						return script[0 .. 2];
				}
			default:
				return script[0 .. 1];
		}
	}
	return script[0 .. 1];
}
