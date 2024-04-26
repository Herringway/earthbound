///
module earthbound.bank0C;

import earthbound.commondefs;

/** Fullscreen animation sequences that are controlled by actionscripts
 *
 * Tiles are always 2BPP
 * Original_Address: $(DOLLAR)CC2DE1
 */
immutable AnimationSequence[7] animationSequences = [
	AnimationSequence(),
	AnimationSequence(id: 1, tileSize: 449 * 16, frames: 6, frameDelay: 3),
	AnimationSequence(id: 2, tileSize: 90 * 16, frames: 7, frameDelay: 16),
	AnimationSequence(id: 3, tileSize: 60 * 16, frames: 8, frameDelay: 8),
	AnimationSequence(id: 4, tileSize: 170 * 16, frames: 2, frameDelay: 16),
	AnimationSequence(id: 5, tileSize: 4 * 16, frames: 3, frameDelay: 8),
	AnimationSequence(id: 6, tileSize: 18 * 16, frames: 2, frameDelay: 8),
];

/** Bundles of graphics data used for actionscript animations (compressed)
 *
 * Contains a variable number of tile data (set via tileSize of animationSequences), a single 2BPP palette followed by a variable number (set via frames of animationSequences) of 32x28 tilemaps
 */
@([ROMSource(0, 0), ROMSource(0xC0000, 6091), ROMSource(0xC17CB, 1937), ROMSource(0xC1F5C, 892), ROMSource(0xC22D8, 2481), ROMSource(0xC2C89, 88), ROMSource(0xC2CE1, 256)])
immutable(ubyte[])[] animationGraphics;


/** Sets of 2BPP tile data used by PSI animation sequences (compressed)
 * Original_Address: $(DOLLAR)CCAC25
 */
@([ROMSource(0xCAC25, 1290), ROMSource(0xCB613, 1204), ROMSource(0xCDB27, 722), ROMSource(0xCE31D, 592)])
immutable(ubyte[])[] psiAnimationTilesets;

/** Various bits of information used to play PSI animations
 * Original_Address: $(DOLLAR)CCF04D
 */
immutable PSIAnimation[34] psiAnimationConfig = [
	PSIAnimation(2, 5, 3, 1, 2, 47, PSIAnimationTarget.allEnemies, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(2, 4, 3, 1, 3, 29, PSIAnimationTarget.single, 50, 80, RGB(18, 6, 0).bgr555),
	PSIAnimation(2, 4, 3, 1, 3, 47, PSIAnimationTarget.allEnemies, 90, 160, RGB(16, 6, 0).bgr555),
	PSIAnimation(2, 3, 3, 1, 3, 33, PSIAnimationTarget.single, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(2, 5, 3, 1, 3, 28, PSIAnimationTarget.single, 40, 70, RGB(0, 0, 10).bgr555),
	PSIAnimation(2, 5, 3, 1, 3, 33, PSIAnimationTarget.allEnemies, 40, 70, RGB(0, 0, 10).bgr555),
	PSIAnimation(1, 5, 2, 1, 3, 13, PSIAnimationTarget.row, 40, 70, RGB(31, 0, 0).bgr555),
	PSIAnimation(1, 5, 2, 1, 3, 16, PSIAnimationTarget.row, 50, 80, RGB(31, 0, 0).bgr555),
	PSIAnimation(1, 5, 3, 1, 3, 17, PSIAnimationTarget.row, 50, 80, RGB(31, 0, 0).bgr555),
	PSIAnimation(1, 5, 3, 1, 3, 27, PSIAnimationTarget.row, 80, 130, RGB(31, 0, 0).bgr555),
	PSIAnimation(0, 5, 3, 1, 2, 6, PSIAnimationTarget.allEnemies, 10, 40, RGB(29, 29, 29).bgr555),
	PSIAnimation(0, 5, 3, 1, 2, 10, PSIAnimationTarget.allEnemies, 20, 50, RGB(29, 29, 29).bgr555),
	PSIAnimation(0, 4, 2, 1, 3, 19, PSIAnimationTarget.allEnemies, 30, 60, RGB(29, 29, 29).bgr555),
	PSIAnimation(1, 4, 2, 1, 3, 33, PSIAnimationTarget.allEnemies, 76, 125, RGB(29, 29, 29).bgr555),
	PSIAnimation(0, 4, 3, 1, 3, 23, PSIAnimationTarget.single, 50, 80, RGB(0, 0, 31).bgr555),
	PSIAnimation(0, 4, 3, 1, 3, 22, PSIAnimationTarget.single, 50, 80, RGB(0, 0, 31).bgr555),
	PSIAnimation(0, 4, 3, 1, 3, 23, PSIAnimationTarget.single, 50, 80, RGB(0, 0, 31).bgr555),
	PSIAnimation(0, 4, 3, 1, 3, 35, PSIAnimationTarget.single, 60, 135, RGB(0, 0, 31).bgr555),
	PSIAnimation(3, 3, 2, 1, 3, 31, PSIAnimationTarget.allEnemies, 63, 92, RGB(26, 14, 14).bgr555),
	PSIAnimation(3, 3, 2, 1, 3, 48, PSIAnimationTarget.allEnemies, 114, 143, RGB(26, 14, 14).bgr555),
	PSIAnimation(3, 3, 2, 1, 3, 54, PSIAnimationTarget.allEnemies, 132, 161, RGB(26, 14, 14).bgr555),
	PSIAnimation(3, 4, 2, 1, 3, 64, PSIAnimationTarget.allEnemies, 141, 255, RGB(26, 14, 14).bgr555),
	PSIAnimation(2, 5, 3, 1, 3, 26, PSIAnimationTarget.single, 60, 90, RGB(0, 10, 4).bgr555),
	PSIAnimation(2, 5, 3, 1, 3, 26, PSIAnimationTarget.allEnemies, 60, 90, RGB(0, 10, 4).bgr555),
	PSIAnimation(2, 3, 3, 1, 3, 34, PSIAnimationTarget.single, 45, 75, RGB(18, 18, 18).bgr555),
	PSIAnimation(2, 3, 3, 1, 3, 26, PSIAnimationTarget.allEnemies, 45, 75, RGB(18, 18, 18).bgr555),
	PSIAnimation(2, 7, 4, 1, 2, 17, PSIAnimationTarget.allEnemies, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(0, 5, 3, 1, 3, 11, PSIAnimationTarget.single, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(0, 5, 3, 1, 3, 17, PSIAnimationTarget.allEnemies, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(2, 3, 3, 1, 3, 33, PSIAnimationTarget.allEnemies, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(0, 4, 2, 1, 3, 33, PSIAnimationTarget.allEnemies, 80, 131, RGB(18, 18, 31).bgr555),
	PSIAnimation(0, 4, 2, 1, 3, 46, PSIAnimationTarget.allEnemies, 121, 183, RGB(18, 18, 31).bgr555),
	PSIAnimation(0, 4, 3, 1, 3, 15, PSIAnimationTarget.random, 25, 54, RGB(31, 31, 11).bgr555),
	PSIAnimation(0, 4, 3, 1, 3, 19, PSIAnimationTarget.random, 49, 75, RGB(31, 31, 11).bgr555),
];

/** 2BPP palettes used by PSI animations
 * Original_Address: $(DOLLAR)CCF47F
 */
@psiAnimationPaletteSource
immutable(ubyte[])[] psiAnimationPalettes;

/** Tilemaps used for PSI animations (compressed)
 * Original_Address: $(DOLLAR)CCF58F
 */
@psiAnimationTilemapSource
immutable(ubyte[])[] psiAnimationTilemaps;

enum psiAnimationPaletteSource = [
	ROMSource(0xCF47F, ushort[4].sizeof),
	ROMSource(0xCF487, ushort[4].sizeof),
	ROMSource(0xCF48F, ushort[4].sizeof),
	ROMSource(0xCF497, ushort[4].sizeof),
	ROMSource(0xCF49F, ushort[4].sizeof),
	ROMSource(0xCF4A7, ushort[4].sizeof),
	ROMSource(0xCF4AF, ushort[4].sizeof),
	ROMSource(0xCF4B7, ushort[4].sizeof),
	ROMSource(0xCF4BF, ushort[4].sizeof),
	ROMSource(0xCF4C7, ushort[4].sizeof),
	ROMSource(0xCF4CF, ushort[4].sizeof),
	ROMSource(0xCF4D7, ushort[4].sizeof),
	ROMSource(0xCF4DF, ushort[4].sizeof),
	ROMSource(0xCF4E7, ushort[4].sizeof),
	ROMSource(0xCF4EF, ushort[4].sizeof),
	ROMSource(0xCF4F7, ushort[4].sizeof),
	ROMSource(0xCF4FF, ushort[4].sizeof),
	ROMSource(0xCF507, ushort[4].sizeof),
	ROMSource(0xCF50F, ushort[4].sizeof),
	ROMSource(0xCF517, ushort[4].sizeof),
	ROMSource(0xCF51F, ushort[4].sizeof),
	ROMSource(0xCF527, ushort[4].sizeof),
	ROMSource(0xCF52F, ushort[4].sizeof),
	ROMSource(0xCF537, ushort[4].sizeof),
	ROMSource(0xCF53F, ushort[4].sizeof),
	ROMSource(0xCF547, ushort[4].sizeof),
	ROMSource(0xCF54F, ushort[4].sizeof),
	ROMSource(0xCF557, ushort[4].sizeof),
	ROMSource(0xCF55F, ushort[4].sizeof),
	ROMSource(0xCF567, ushort[4].sizeof),
	ROMSource(0xCF56F, ushort[4].sizeof),
	ROMSource(0xCF577, ushort[4].sizeof),
	ROMSource(0xCF57F, ushort[4].sizeof),
	ROMSource(0xCF587, ushort[4].sizeof),
];
enum psiAnimationTilemapSource = [
	ROMSource(0xCC32F, 978),
	ROMSource(0xCDDF9, 680),
	ROMSource(0xCD820, 775),
	ROMSource(0xCBAC7, 1126),
	ROMSource(0xCF1E5, 371),
	ROMSource(0xCB12F, 1252),
	ROMSource(0xCC701, 940),
	ROMSource(0xCBF2D, 1026),
	ROMSource(0xC7E9E, 1931),
	ROMSource(0xCA6B9, 1388),
	ROMSource(0xCF358, 295),
	ROMSource(0xCE96C, 467),
	ROMSource(0xCD4FB, 805),
	ROMSource(0xC6390, 2535),
	ROMSource(0xCEB3F, 463),
	ROMSource(0xCE78B, 481),
	ROMSource(0xCE56D, 542),
	ROMSource(0xCCAAD, 938),
	ROMSource(0xC760B, 2195),
	ROMSource(0xC4D53, 3112),
	ROMSource(0xC2E19, 4670),
	ROMSource(0xC597B, 2581),
	ROMSource(0xCD1C7, 820),
	ROMSource(0xC6D77, 2196),
	ROMSource(0xCE0A1, 636),
	ROMSource(0xC9B45, 1511),
	ROMSource(0xCA12C, 1421),
	ROMSource(0xCEEB4, 409),
	ROMSource(0xC94DF, 1638),
	ROMSource(0xC8D86, 1881),
	ROMSource(0xC8629, 1885),
	ROMSource(0xC4057, 3324),
	ROMSource(0xCED0E, 422),
	ROMSource(0xCCE57, 880),
];
