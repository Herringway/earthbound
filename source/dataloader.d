module dataloader;

import earthbound.commondefs;
import earthbound.globals;
import earthbound.bank00;
import earthbound.bank04;
import earthbound.bank08;
import earthbound.text;
import std.exception : enforce;
import std.meta : Filter;
import std.format : format;

private enum isROMLoadable(alias sym) = (Filter!(typeMatches!ROMSource, __traits(getAttributes, sym)).length == 1) || (Filter!(typeMatches!(ROMSource[]), __traits(getAttributes, sym)).length == 1);
private template typeMatches(T) {
	enum typeMatches(alias t) = is(typeof(t) == T);
}
void loadROMData(const ubyte[] romData) {
	import std.logger : tracef;
	import std.meta : AliasSeq;
	static import earthbound.bank03, earthbound.bank04, earthbound.bank0A, earthbound.bank0C, earthbound.bank0E, earthbound.bank11, earthbound.bank18, earthbound.bank20, earthbound.bank21, earthbound.bank2F;
	static foreach (mod; AliasSeq!(earthbound.bank03, earthbound.bank04, earthbound.bank0A, earthbound.bank0C, earthbound.bank0E, earthbound.bank11, earthbound.bank18, earthbound.bank20, earthbound.bank21, earthbound.bank2F)) {
		static foreach (member; __traits(allMembers, mod)) { // look for loadable things in module
			static if (!is(typeof(__traits(getMember, mod, member)) == function) && isROMLoadable!(__traits(getMember, mod, member))) {{
				tracef("Loading %s from ROM", member.stringof);
				static if (Filter!(typeMatches!ROMSource, __traits(getAttributes, __traits(getMember, mod, member))).length == 1) { // single source
					enum source = Filter!(typeMatches!ROMSource, __traits(getAttributes, __traits(getMember, mod, member)))[0];
					__traits(getMember, mod, member) = cast(typeof(__traits(getMember, mod, member)))(romData[source.offset .. source.offset + source.length]);
				} else static if (Filter!(typeMatches!(ROMSource[]), __traits(getAttributes, __traits(getMember, mod, member))).length == 1) { // array of sources
					enum sources = Filter!(typeMatches!(ROMSource[]), __traits(getAttributes, __traits(getMember, mod, member)))[0];
					__traits(getMember, mod, member).reserve(sources.length);
					static foreach (source; sources) {
						__traits(getMember, mod, member) ~= cast(typeof(__traits(getMember, mod, member)[0]))(romData[source.offset .. source.offset + source.length]);
					}
				}
			}}
		}
	}
}


struct DumpInfo {
    string name;
    ulong offset;
    ulong size;
}

StructuredText[][string][] parseTextData(const(ubyte)[] source, ulong offset, const string[size_t][string] renameLabels, const DumpInfo[] dumpEntries) {
    import std.algorithm.searching : canFind;
    import std.array : empty, front, popFront;
    DumpInfo[string] textFiles;
    foreach (entry; dumpEntries) {
        textFiles[entry.name] = DumpInfo(entry.name, entry.offset + 0xC00000, entry.size);
    }
    offset += 0xC00000;
    StructuredText[][string][] resultUncompressed;
    StructuredText[] currentScriptUncompressed;
    ubyte[] raw;
    string tmpbuff;
    string tmpCompbuff;
    string label(const ulong addr) {
        if (addr == 0) {
            return "null";
        }
        foreach (name, file; textFiles) {
            if ((addr >= file.offset) && (addr < file.offset + file.size)) {
                if (auto found = (addr - file.offset) in renameLabels.get(name, null)) {
                    return *found;
                }
                return format!"TEXT_UNKNOWN_%s_%06X"(name, addr - file.offset);
            }
        }
        return format!"_UNDEFINED_%06X"(addr);
    }
    string nextLabel = label(offset);
    auto nextByte() {
        auto first = source.front;
        source.popFront();
        offset++;
        return first;
    }
    ushort nextShort() {
        return nextByte() + (nextByte() << 8);
    }
    uint nextInt() {
        return nextShort() + (nextShort() << 16);
    }
    void addEntry(StructuredText txt) {
        currentScriptUncompressed ~= txt;
    }
    void flushBuff() {
        if (tmpbuff == []) {
            return;
        }
        StructuredText entry = { text: tmpbuff };
        raw = [];
        tmpbuff = [];
    }
    void flushCompressedBuff() {
        if (tmpCompbuff == []) {
            return;
        }
        StructuredText entry;
        entry.text = tmpCompbuff;
        currentScriptUncompressed ~= entry;
        tmpCompbuff = [];
    }
    void flushBuffs() {
        flushBuff();
        flushCompressedBuff();
    }
    void nextScript() {
        if (currentScriptUncompressed.length == 0) {
            return;
        }
        flushBuffs();
        resultUncompressed ~= [nextLabel: currentScriptUncompressed];
        nextLabel = label(offset);
        currentScriptUncompressed = [];
    }
    while (!source.empty) {
        foreach (name, textFile; textFiles) {
            if ((offset >= textFile.offset) && (offset < textFile.offset + textFile.size)) {
                if ((offset - textFile.offset) in renameLabels.get(name, null)) {
                    nextScript();
                    break;
                }
            }
        }
        auto first = nextByte();
        if (first in textTable) {
            raw ~= first;
            tmpbuff ~= textTable[first];
            tmpCompbuff ~= textTable[first];
            continue;
        }
        if ((first >= 0x15) && (first <= 0x18)) {
            flushBuff();
        } else {
            flushBuffs();
        }
        switch (first) {
            case 0x00:
                StructuredText entry = { mainCC: MainCC.lineBreak };
                addEntry(entry);
                break;
            case 0x01:
                StructuredText entry = { mainCC: MainCC.startBlankLine };
                addEntry(entry);
                break;
            case 0x02:
                StructuredText entry = { mainCC: MainCC.halt };
                addEntry(entry);
                nextScript();
                break;
            case 0x03:
                StructuredText entry = { mainCC: MainCC.haltVariablePrompt };
                addEntry(entry);
                break;
            case 0x04:
                const flag = nextShort();
                enforce(flag < 0x400, format!"Event flag %02X out of range (%06X)"(flag, offset));
                StructuredText entry = { mainCC: MainCC.setFlag, eventFlag: cast(EventFlag)flag };
                addEntry(entry);
                break;
            case 0x05:
                const flag = nextShort();
                enforce(flag < 0x400, format!"Event flag %02X out of range (%06X)"(flag, offset));
                StructuredText entry = { mainCC: MainCC.clearFlag, eventFlag: cast(EventFlag)flag };
                addEntry(entry);
                break;
            case 0x06:
                const flag = nextShort();
                const dest = nextInt();
                enforce(flag < 0x400, format!"Event flag %02X out of range (%06X)"(flag, offset));
                StructuredText entry = { mainCC: MainCC.jumpIfFlagSet, eventFlag: cast(EventFlag)flag, labels: [ label(dest) ] };
                addEntry(entry);
                break;
            case 0x07:
                const flag = nextShort();
                enforce(flag < 0x400, format!"Event flag %02X out of range (%06X)"(flag, offset));
                StructuredText entry = { mainCC: MainCC.getFlag, eventFlag: cast(EventFlag)flag };
                addEntry(entry);
                break;
            case 0x08:
                const dest = nextInt();
                StructuredText entry = { mainCC: MainCC.call, labels: [ label(dest) ] };
                addEntry(entry);
                break;
            case 0x09:
                StructuredText entry = { mainCC: MainCC.jumpSwitch };
                ubyte argCount = nextByte();
                while(argCount--) {
                    entry.labels ~= label(nextInt());
                }
                addEntry(entry);
                break;
            case 0x0A:
                const dest = nextInt();
                StructuredText entry = { mainCC: MainCC.jump, labels: [ label(dest) ] };
                addEntry(entry);
                nextScript();
                break;
            case 0x0B:
                const arg = nextByte();
                StructuredText entry = { mainCC: MainCC.testWorkMemoryTrue, byteValues: [ arg ] };
                addEntry(entry);
                break;
            case 0x0C:
                auto arg = nextByte();
                StructuredText entry = { mainCC: MainCC.testWorkMemoryFalse, byteValues: [ arg ] };
                addEntry(entry);
                break;
            case 0x0D:
                auto dest = nextByte();
                StructuredText entry = { mainCC: MainCC.copyToArgMemory, cc0DArgument: cast(CC0DArgument)dest };
                addEntry(entry);
                break;
            case 0x0E:
                auto dest = nextByte();
                StructuredText entry = { mainCC: MainCC.storeSecondaryMemory, byteValues: [ dest ] };
                addEntry(entry);
                break;
            case 0x0F:
                StructuredText entry = { mainCC: MainCC.incrementSecondaryMemory };
                addEntry(entry);
                break;
            case 0x10:
                auto time = nextByte();
                StructuredText entry = { mainCC: MainCC.pause, byteValues: [ time ] };
                addEntry(entry);
                break;
            case 0x11:
                StructuredText entry = { mainCC: MainCC.createMenu };
                addEntry(entry);
                break;
            case 0x12:
                StructuredText entry = { mainCC: MainCC.clearLine };
                addEntry(entry);
                break;
            case 0x13:
                StructuredText entry = { mainCC: MainCC.haltWithoutTriangle };
                addEntry(entry);
                break;
            case 0x14:
                StructuredText entry = { mainCC: MainCC.haltWithPrompt };
                addEntry(entry);
                break;
            case 0x15: .. case 0x17:
                StructuredText entry = { mainCC: cast(MainCC)(MainCC.compressed1 + (first - 0x15)) };
                auto arg = nextByte();
                auto id = arg;
                entry.byteValues = [ arg ];
                tmpCompbuff ~= compressedTextStrings[first - 0x15][id];
                //currentScript ~= entry;
                break;
            case 0x18:
                StructuredText entry = { mainCC: MainCC.manageWindows };
                entry.subCC = nextByte();
                switch (cast(SubCC18)entry.subCC.get()) {
                    case SubCC18.closeWindow:
                    case SubCC18.saveWindow:
                    case SubCC18.closeAllWindows:
                    case SubCC18.clearWindow:
                    case SubCC18.showWalletWindow:
                        break;
                    case SubCC18.openWindow:
                    case SubCC18.switchWindow:
                    case SubCC18.menuInWindow:
                    case SubCC18.cancellableMenuInWindow:
                        entry.window = cast(Window)nextByte();
                        break;
                    case SubCC18.setTextAlignment:
                        entry.byteValues = [ nextByte(), nextByte() ];
                        break;
                    case SubCC18.compareRegisterWithNumber:
                        entry.intValues = [ nextInt() ];
                        entry.byteValues = [ nextByte() ];
                        break;
                    default:
                        throw new Exception(format!"Unhandled CC: 18 %02X"(entry.subCC));
                }
                addEntry(entry);
                break;
            case 0x19:
                StructuredText entry = { mainCC: MainCC.misc19 };
                entry.subCC = nextByte();
                switch (cast(SubCC19)entry.subCC.get()) {
                    case SubCC19.clearStrings:
                    case SubCC19.returnEscargoExpressItemAutoIncrement:
                    case SubCC19.getDelta:
                    case SubCC19.getBattleActionArgument:
                    case SubCC19.returnPartyCount:
                        break;
                    case SubCC19.loadString:
                        string payload;
                        while (auto x = nextByte()) {
                            if (x == 1) {
                                entry.byteValues ~= 0x01;
                                entry.labels = [ label(nextInt()) ];
                                break;
                            } else if (x == 2) {
                                entry.byteValues ~= 0x02;
                                break;
                            } else {
                                entry.text ~= textTable[x];
                            }
                        }
                        break;
                    case SubCC19.inflictStatus:
                        entry.byteValues = [ nextByte(), nextByte(), nextByte() ];
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
                        entry.byteValues = [ nextByte() ];
                        break;
                    case SubCC19.returnCharacterStatusByte:
                    case SubCC19.returnCharacterInventoryItem:
                    case SubCC19.queueItemForDelivery:
                    case SubCC19.getQueuedItem:
                        entry.byteValues = [ nextByte(), nextByte() ];
                        break;
                    case SubCC19.returnDirectionFromCharacterToObject:
                        entry.byteValues = [ nextByte(), nextByte() ];
                        entry.shortValues = [ nextShort() ];
                        break;
                    case SubCC19.returnDirectionFromNPCToObject:
                    case SubCC19.returnDirectionFromGeneratedSpriteToObject:
                        entry.shortValues = [ nextShort() ];
                        entry.byteValues = [ nextByte() ];
                        entry.shortValues ~= nextShort();
                        break;
                    default:
                        throw new Exception(format!"Unhandled: 19 %02X"(entry.subCC));
                }
                addEntry(entry);
                break;
            case 0x1A:
                StructuredText entry = { mainCC: MainCC.menus };
                entry.subCC = nextByte();
                switch (cast(SubCC1A)entry.subCC.get()) {
                    case SubCC1A.cc04:
                    case SubCC1A.cc07:
                    case SubCC1A.cc08:
                    case SubCC1A.cc09:
                    case SubCC1A.cc0A:
                    case SubCC1A.cc0B:
                        break;
                    case SubCC1A.cc00:
                    case SubCC1A.cc01:
                        entry.labels = [ label(nextInt()), label(nextInt()), label(nextInt()), label(nextInt()) ];
                        entry.byteValues = [ nextByte() ];
                        break;
                    case SubCC1A.cc05:
                        entry.byteValues = [ nextByte(), nextByte() ];
                        break;
                    case SubCC1A.cc06:
                        entry.byteValues = [ nextByte() ];
                        break;
                    default:
                        throw new Exception(format!"UNHANDLED: 1A %02X"(entry.subCC));
                }
                addEntry(entry);
                break;
            case 0x1B:
                StructuredText entry = { mainCC: MainCC.memory };
                entry.subCC = nextByte();
                switch (cast(SubCC1B)entry.subCC.get()) {
                    case SubCC1B.cc00:
                    case SubCC1B.cc01:
                    case SubCC1B.cc04:
                    case SubCC1B.cc05:
                    case SubCC1B.cc06:
                        break;
                    case SubCC1B.cc02:
                    case SubCC1B.cc03:
                        entry.labels = [ label(nextInt()) ];
                        break;
                    default:
                        throw new Exception(format!"UNHANDLED: 1B %02X"(entry.subCC));
                }
                addEntry(entry);
                break;
            case 0x1C:
                StructuredText entry = { mainCC: MainCC.misc1C };
                entry.subCC = nextByte();
                switch (cast(SubCC1C)entry.subCC.get()) {
                    case SubCC1C.cc04:
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
                        entry.byteValues = [ nextByte() ];
                        break;
                    case SubCC1C.cc0A:
                    case SubCC1C.cc0B:
                        entry.intValues = [ nextInt() ];
                        break;
                    case SubCC1C.cc13:
                        entry.byteValues = [ nextByte(), nextByte() ];
                        break;
                    default:
                        throw new Exception(format!"UNHANDLED: 1C %02X"(entry.subCC));
                }
                addEntry(entry);
                break;
            case 0x1D:
                StructuredText entry = { mainCC: MainCC.inventory };
                entry.subCC = nextByte();
                switch (cast(SubCC1D)entry.subCC.get()) {
                    case SubCC1D.cc20:
                    case SubCC1D.cc22:
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
                        entry.byteValues = [ nextByte(), nextByte() ];
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
                        entry.byteValues = [ nextByte() ];
                        break;
                    case SubCC1D.cc06:
                    case SubCC1D.cc07:
                    case SubCC1D.cc14:
                    case SubCC1D.cc17:
                        entry.intValues = [ nextInt() ];
                        break;
                    case SubCC1D.cc08:
                    case SubCC1D.cc09:
                    case SubCC1D.cc0C:
                    case SubCC1D.cc15:
                        entry.shortValues = [ nextShort() ];
                        break;
                    case SubCC1D.cc0D:
                        entry.byteValues = [ nextByte(), nextByte(), nextByte() ];
                        break;
                    default:
                        throw new Exception(format!"UNHANDLED: 1D %02X"(entry.subCC));
                }
                addEntry(entry);
                break;
            case 0x1E:
                StructuredText entry = { mainCC: MainCC.stats };
                entry.subCC = nextByte();
                switch (cast(SubCC1E)entry.subCC.get()) {
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
                        entry.byteValues = [ nextByte(), nextByte() ];
                        break;
                    case SubCC1E.cc09:
                        entry.byteValues = [ nextByte() ];
                        entry.intValues = [ nextInt() ];
                        break;
                    default:
                        throw new Exception(format!"UNHANDLED: 1E %02X"(entry.subCC));
                }
                addEntry(entry);
                break;
            case 0x1F:
                StructuredText entry = { mainCC: MainCC.misc1F };
                entry.subCC = nextByte();
                switch (cast(SubCC1F)entry.subCC.get()) {
                    case SubCC1F.cc03:
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
                    case SubCC1F.ccA0:
                    case SubCC1F.ccA1:
                    case SubCC1F.ccA2:
                    case SubCC1F.ccB0:
                    case SubCC1F.ccD1:
                    case SubCC1F.ccED:
                    case SubCC1F.ccF0:
                        break;
                    case SubCC1F.cc00:
                    case SubCC1F.cc13:
                    case SubCC1F.cc1C:
                    case SubCC1F.cc20:
                    case SubCC1F.cc71:
                    case SubCC1F.cc83:
                    case SubCC1F.ccEB:
                    case SubCC1F.ccEC:
                        entry.byteValues = [ nextByte(), nextByte() ];
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
                        entry.byteValues = [ nextByte() ];
                        break;
                    case SubCC1F.cc15:
                    case SubCC1F.cc17:
                        entry.shortValues = [ nextShort(), nextShort() ];
                        entry.byteValues = [ nextByte() ];
                        break;
                    case SubCC1F.cc16:
                    case SubCC1F.cc1A:
                    case SubCC1F.cc1E:
                    case SubCC1F.cc1F:
                    case SubCC1F.ccE4:
                    case SubCC1F.ccF3:
                        entry.shortValues = [ nextShort() ];
                        entry.byteValues = [ nextByte() ];
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
                        entry.shortValues = [ nextShort() ];
                        break;
                    case SubCC1F.cc63:
                        entry.labels = [ label(nextInt()) ];
                        break;
                    case SubCC1F.cc66:
                        entry.byteValues = [ nextByte(), nextByte() ];
                        entry.labels = [ label(nextInt()) ];
                        break;
                    case SubCC1F.ccC0:
                        ubyte argCount = nextByte();
                        while(argCount--) {
                            entry.labels ~= label(nextInt());
                        }
                        break;
                    case SubCC1F.ccE1:
                        entry.byteValues = [ nextByte(), nextByte(), nextByte() ];
                        break;
                    case SubCC1F.ccF1:
                    case SubCC1F.ccF2:
                        entry.shortValues = [ nextShort(), nextShort() ];
                        break;
                    default:
                        throw new Exception(format!"UNHANDLED: 1F %02X"(entry.subCC));
                }
                addEntry(entry);
                break;
            default:
                throw new Exception(format!"I don't know what this is: %06X: %02X"(offset, first));
        }
    }
    if (currentScriptUncompressed.length > 0) { //whatever's left
        nextScript();
    }
    return resultUncompressed;
}

enum textTable = [
	0x50: ' ',
	0x51: '!',
	0x52: '&',
	0x53: '{',
	0x54: '$',
	0x55: '%',
	0x56: '}',
	0x57: '\'',
	0x58: '(',
	0x59: ')',
	0x5A: '*',
	0x5C: ',',
	0x5D: '-',
	0x5E: '.',
	0x60: '0',
	0x61: '1',
	0x62: '2',
	0x63: '3',
	0x64: '4',
	0x65: '5',
	0x66: '6',
	0x67: '7',
	0x68: '8',
	0x69: '9',
	0x6A: ':',
	0x6B: ';',
	0x6C: '<',
	0x6D: '=',
	0x6E: '>',
	0x6F: '?',
	0x70: '@',
	0x71: 'A',
	0x72: 'B',
	0x73: 'C',
	0x74: 'D',
	0x75: 'E',
	0x76: 'F',
	0x77: 'G',
	0x78: 'H',
	0x79: 'I',
	0x7A: 'J',
	0x7B: 'K',
	0x7C: 'L',
	0x7D: 'M',
	0x7E: 'N',
	0x7F: 'O',
	0x80: 'P',
	0x81: 'Q',
	0x82: 'R',
	0x83: 'S',
	0x84: 'T',
	0x85: 'U',
	0x86: 'V',
	0x87: 'W',
	0x88: 'X',
	0x89: 'Y',
	0x8A: 'Z',
	0x8B: '~',
	0x8C: '^',
	0x8D: '[',
	0x8E: ']',
	0x8F: '#',
	0x90: '_',
	0x91: 'a',
	0x92: 'b',
	0x93: 'c',
	0x94: 'd',
	0x95: 'e',
	0x96: 'f',
	0x97: 'g',
	0x98: 'h',
	0x99: 'i',
	0x9A: 'j',
	0x9B: 'k',
	0x9C: 'l',
	0x9D: 'm',
	0x9E: 'n',
	0x9F: 'o',
	0xA0: 'p',
	0xA1: 'q',
	0xA2: 'r',
	0xA3: 's',
	0xA4: 't',
	0xA5: 'u',
	0xA6: 'v',
	0xA7: 'w',
	0xA8: 'x',
	0xA9: 'y',
	0xAA: 'z',
	0xAB: '[',
	0xAC: '|',
	0xAD: ']',
];
