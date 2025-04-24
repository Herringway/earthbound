///
module earthbound.bank1F;

import earthbound.commondefs;
import replatform64;

/** Palette animations for the overworld map
 * Original_Address: $(DOLLAR)DFE4E1
 */
immutable MapDataPaletteAnimationPointer[31] mapPaletteAnimations = [
	MapDataPaletteAnimationPointer(0, 4, [10, 10, 10, 10]),
	MapDataPaletteAnimationPointer(1, 4, [15, 15, 15, 15]),
	MapDataPaletteAnimationPointer(2, 6, [20, 20, 20, 20, 20, 20]),
	MapDataPaletteAnimationPointer(3, 3, [15, 15, 20]),
	MapDataPaletteAnimationPointer(4, 4, [15, 15, 15, 15]),
	MapDataPaletteAnimationPointer(5, 3, [15, 15, 15]),
	MapDataPaletteAnimationPointer(6, 3, [60, 8, 8]),
	MapDataPaletteAnimationPointer(7, 8, [30, 10, 10, 10, 10, 10, 10, 10]),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
	MapDataPaletteAnimationPointer(8, 0, []),
];

/** Palettes used for overworld map animations (compressed)
 *
 * Consists of N full sets of map palettes, with N being at least as large as its corresponding entry in mapPaletteAnimations
 * Original_Address: $(DOLLAR)DFE61B
 */
@([ROMSource(0x1FE61B, 151), ROMSource(0x1FE6B2, 139), ROMSource(0x1FE73D, 419), ROMSource(0x1FE8E0, 140), ROMSource(0x1FE96C, 234), ROMSource(0x1FEA56, 219), ROMSource(0x1FEB31, 123), ROMSource(0x1FEBAC, 154), ROMSource(0x1FEC46, 0)])
immutable(ubyte[])[] mapPaletteAnimationData;
