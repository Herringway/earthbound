module earthbound.assets;

import std.algorithm.comparison;
import std.algorithm.iteration;
import std.algorithm.searching;
import std.algorithm.sorting;
import std.bitmanip;
import std.conv;
import std.datetime;
import std.exception;
import std.file;
import std.format;
import std.logger;
import std.mmfile;
import std.path;
import std.range;
import std.stdio;
import std.string;
import std.traits;

import nspcplay;
import siryul;

import dataloader;
import earthbound.text;
import earthbound.sdl.audio.common;
import earthbound.sdl.audio.emulated : AllSPC, loadNSPCBuffer;

enum textCacheFile = "text.cache";
enum extractDoc = "extract.yaml";
enum earthboundROM = "earthbound.sfc";

struct ExtractInfo {
	string[size_t][string] renameLabels;
	DumpInfo[] text;
}

struct PlanetArchive {
	static struct Header {
		align(8):
		char[8] magic = "PLANET!?";
		ulong entries;
		ulong dataOffset;
		ulong entryOffset = Header.sizeof;
		ubyte[32] reserved;
	}
	static struct Entry {
		align(8):
		char[256] name = '\0';
		ulong offset;
		ulong size;
	}
	Header header;
	Entry[] entries;
	const(ubyte)[] data;
	void write(OutputRange)(OutputRange range) const {
		void writeLittleEndian(T)(const T structure) {
			static foreach (i, field; structure.tupleof) {
				static if (isArray!(typeof(field))) {
					range.put(cast(const(ubyte)[])structure.tupleof[i]);
				} else {
					range.append!(typeof(field), Endian.littleEndian)(structure.tupleof[i]);
				}
			}
		}
		writeLittleEndian(header);
		foreach (entry; entries) {
			writeLittleEndian(entry);
		}
		range.put(data);
	}
	static PlanetArchive read(ubyte[] buffer) {
		static T readLittleEndian(T)(ubyte[] data) {
			T structure;
			static foreach (i, field; T.tupleof) {
				static if (isArray!(typeof(field))) {
					structure.tupleof[i] = cast(typeof(field))data[0 .. field.sizeof];
				} else {
					structure.tupleof[i] = data.peek!(typeof(field), Endian.littleEndian)();
				}
				data = data[field.sizeof .. $];
			}
			return structure;
		}
		PlanetArchive archive;
		archive.header = readLittleEndian!Header(buffer);
		archive.entries.reserve(archive.header.entries);
		foreach (i; 0 .. archive.header.entries) {
			archive.entries ~= readLittleEndian!Entry(buffer[archive.header.entryOffset + i * Entry.sizeof .. archive.header.entryOffset + (i + 1) * Entry.sizeof]);
		}
		archive.data = buffer[archive.header.dataOffset .. $];
		return archive;
	}
	void addFile(const(char)[] name, const(ubyte)[] data) {
		const offset = this.data.length;
		header.entries++;
		header.dataOffset = Header.sizeof + header.entries * Entry.sizeof;
		Entry entry;
		entry.name[0 .. name.length] = name;
		entry.offset = offset;
		entry.size = data.length;
		entries ~= entry;
		this.data ~= data;
	}
}

enum archiveName = "earthbound.planet";
void tryExtractAssets(string baseDir, bool force) {
	if (force | !archiveName.exists) {
		PlanetArchive archive;
		enforce(earthboundROM.exists, "Earthbound ROM not found - Place earthbound.sfc in the current directory");
		auto rom = cast(const(ubyte)[])read(earthboundROM);
		const detected = detect(rom, "EARTH BOUND          ");
		enforce(detected.matched, "Loaded ROM is not an Earthbound (USA) ROM.");
		info("Loaded Earthbound ROM", detected.header ? " (with header)" : "");
		if (detected.header) {
			rom = rom[0x200 .. $];
		}
		foreach (asset; extractROMData(rom)) {
			const dest = buildPath(baseDir,  "assets", asset.name);
			infof("Extracting %s", asset.name);
			if (asset.data.length == 1) {
				archive.addFile(asset.name, asset.data[0]);
			} else {
				foreach(i, file; asset.data) {
					archive.addFile(asset.name, file);
				}
			}
		}

		ubyte[65536] song4; // we want the silent song to record sound effects against
		buildNSPCFiles(rom, archive, song4);

		foreach (ubyte i; 0 .. 0x80) {
			infof("Dumping sound effect %s", i);
			archive.addFile("sfx", dumpSoundEffect(song4[], i));
		}

		const extractDoc = "extract.yaml";
		const extractInfo = fromFile!(ExtractInfo, YAML)(extractDoc);
		infof("Building text cache...");
		foreach (textDocFile; extractInfo.text) {
			const textData = parseTextData(rom[textDocFile.offset .. textDocFile.offset + textDocFile.size], textDocFile.offset, extractInfo.renameLabels, extractInfo.text);
			foreach (idx, scriptData; textData) {
				string nextLabel;
				if (idx + 1 < textData.length) {
					nextLabel = textData[idx + 1].keys[0];
				}
				string label = scriptData.keys[0];
				auto script = scriptData.values[0];
				loadText(script, label, nextLabel);
			}
			debug(dumpText) textData.toFile!(YAML, Siryulize.omitInits)(format!"dump/%s.yaml"(textDocFile.name));
			tracef("Loaded text %s", textDocFile.name);
		}
		tracef("Loaded text, saving cache");
		Appender!(ubyte[]) buffer;
		buildTextCache(buffer);
		archive.addFile("text", buffer.data);

		// write the archive
		archive.write(File(archiveName, "w").lockingBinaryWriter);
	}
}
void loadAssets(string baseDir) {
	auto archiveData = new MmFile("earthbound.planet")[].dup;
	const archive = PlanetArchive.read(cast(ubyte[])archiveData);
	Asset[const(char)[]] assets;
	foreach (entry; archive.entries) {
		const filename = entry.name.fromStringz.dup;
		switch(filename) {
			case "sfx":
				static uint sfxIndex = 1;
				loadSFX(sfxIndex++, archive.data[entry.offset .. entry.offset + entry.size]);
				break;
			case "song":
				static uint songIndex = 1;
				loadSong(songIndex++, archive.data[entry.offset .. entry.offset + entry.size]);
				break;
			case "text":
				loadTextCache(archive.data[entry.offset .. entry.offset + entry.size]);
				break;
			default:
				with (assets.require(filename, Asset.init)) {
					name = filename;
					data ~= archive.data[entry.offset .. entry.offset + entry.size];
				}
				break;
		}
	}
	loadROMAssets(assets.values);
}

void buildNSPCFiles(const ubyte[] data, ref PlanetArchive archive, out ubyte[65536] song4) {
	static align(1) struct PackPointer {
		align(1):
		ubyte bank;
		ushort addr;
		uint full() const {
			return addr + ((cast(uint)bank) << 16);
		}
	}
	enum NUM_SONGS = 0xBF;
	enum NUM_PACKS = 0xA9;
	enum packPointerTable = 0x4F947;
	enum packTableOffset = 0x4F70A;
	auto packs = (cast(PackPointer[])(data[packPointerTable .. packPointerTable + NUM_PACKS * PackPointer.sizeof]))
		.map!(x => parsePacks(data[x.full - 0xC00000 .. $]));
	enum SONG_POINTER_TABLE = 0x294A;
	auto bgmPacks = cast(ubyte[3][])data[packTableOffset .. packTableOffset + (ubyte[3]).sizeof * NUM_SONGS];
	auto songPointers = cast(ushort[])packs[1][2].data[SONG_POINTER_TABLE .. SONG_POINTER_TABLE + ushort.sizeof * NUM_SONGS];
	foreach (idx, songPacks; bgmPacks) {
		NSPCWriter writer;
		writer.header.songBase = songPointers[idx];
		writer.header.instrumentBase = 0x6E00;
		writer.header.sampleBase = 0x6C00;
		writer.header.volumeTable = VolumeTable.hal1;
		writer.header.releaseTable = ReleaseTable.hal1;
		writer.packs ~= packs[0]; // engine packs
		writer.packs ~= packs[1];
		foreach (pack; songPacks) {
			if (pack == 0xFF) {
				continue;
			}
			writer.packs ~= packs[pack];
		}
		tracef("Writing %03X.nspc", idx);
		Appender!(ubyte[]) buffer;
		writer.toBytes(buffer);
		if (idx == 4) {
			song4 = loadNSPCBuffer(buffer.data);
		}
		archive.addFile("song", buffer.data);
	}
}

auto detect(const scope ubyte[] data, scope string identifier) @safe pure {
    struct Result {
        bool header;
        bool matched;
    }
    foreach (headered, base; zip(only(false, true), only(0xFFB0, 0x101B0))) {
        const checksum = (cast(const ushort[])data[base + 46 .. base + 48])[0];
        const checksumComplement = (cast(const ushort[])data[base + 44 .. base + 46])[0];
        if ((checksum ^ checksumComplement) == 0xFFFF) {
            if (cast(const(char[]))data[base + 16 .. base + 37] == identifier) {
                return Result(headered, true);
            }
        }
    }
    return Result(false, false);
}
SysTime getLastModifiedTime(string path) {
	SysTime access, modified;
	getTimes(path, access, modified);
	return modified;
}

auto getDataFiles(string base, string type, string pattern) {
	static struct Result {
		DirIterator iterator;
		bool pathExists;
		void popFront() {
			iterator.popFront();
		}
		auto front() {
			return iterator.front;
		}
		bool empty() {
			return !pathExists || iterator.empty;
		}
	}
	const path = buildPath(base, type);
	bool filterFunc(string name) {
		return globMatch(baseName(name), pattern);
	}
	tracef("Looking for %s (%s) in %s", type, pattern, path.asAbsolutePath);
	return Result(path.exists ? dirEntries(path, SpanMode.depth) : DirIterator.init, path.exists).map!(x => x.name).filter!filterFunc;
}

private struct WAVHeader {
	align(1):
	static struct Chunk1 {
		align(1):
		char[4] magic = "fmt ";
		uint size = 16;
		ushort format = 1;
		ushort channels = 2;
		uint sampleRate = 32000;
		uint byteRate = 32000 * 2 * short.sizeof;
		ushort blockAlign = short.sizeof * 2;
		ushort bitsPerSample = short.sizeof * 8;
	}
	static struct Chunk2 {
		align(1):
		char[4] magic = "data";
		uint size;
		ubyte[0] data;
	}
	char[4] magic = "RIFF";
	uint chunkSize;
	char[4] wavMagic = "WAVE";
	Chunk1 chunk1;
	Chunk2 chunk2;
}

ubyte[] dumpSoundEffect(scope ubyte[] data, ubyte index) {
	enum chunkLength = 512 * short.sizeof * 2;
	enum silentChunkThreshold = 128;


	AllSPC player;
	player.initialize();
	player.playSong(data, 4); // 0 is silent
	player.writePort(3, index); // port 3 is used for sound effects
	ubyte[] full = new ubyte[](WAVHeader.sizeof);
	(cast(WAVHeader[])(full[0 .. WAVHeader.sizeof]))[0] = WAVHeader.init;
	auto buffer = new ubyte[](chunkLength);
	size_t threshold = silentChunkThreshold;
	while (true) {
		player.fillBuffer(cast(short[])buffer);
		if (buffer.all!(x => x == 0)) {
			if (--threshold == 0) {
				break;
			}
		} else {
			threshold = silentChunkThreshold;
		}
		full ~= buffer;
	}
	full = full[0 .. max(WAVHeader.sizeof + chunkLength, $ - chunkLength * (silentChunkThreshold - 1))];
	with((cast(WAVHeader[])(full[0 .. WAVHeader.sizeof]))[0]) {
		chunk2.size = cast(uint)(full.length - WAVHeader.sizeof);
		chunkSize = cast(uint)(full.length - 8);
	}
	return full;
}
