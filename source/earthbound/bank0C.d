///
module earthbound.bank0C;

import earthbound.commondefs;

/// $CC2DE1
immutable AnimationSequence[7] animationSequencePointers = [
	AnimationSequence(null, 0x0000, 0x00, 0x00),
	AnimationSequence(cast(immutable(ubyte)[])import("graphics/animations/lightning_reflect.anim.lzhal"), 0x1C10, 0x06, 0x03),
	AnimationSequence(cast(immutable(ubyte)[])import("graphics/animations/lightning_strike.anim.lzhal"), 0x05A0, 0x07, 0x10),
	AnimationSequence(cast(immutable(ubyte)[])import("graphics/animations/starman_jr_teleport.anim.lzhal"), 0x03C0, 0x08, 0x08),
	AnimationSequence(cast(immutable(ubyte)[])import("graphics/animations/boom.anim.lzhal"), 0x0AA0, 0x02, 0x10),
	AnimationSequence(cast(immutable(ubyte)[])import("graphics/animations/zombies.anim.lzhal"), 0x0040, 0x03, 0x08),
	AnimationSequence(cast(immutable(ubyte)[])import("graphics/animations/the_end.anim.lzhal"), 0x0120, 0x02, 0x08),
];


/// $CCAC25
immutable ubyte[] psiAnimationGraphicsSet1 = cast(immutable(ubyte)[])import("psianims/gfx/0.gfx.lzhal");

/// $CCB613
immutable ubyte[] psiAnimationGraphicsSet2 = cast(immutable(ubyte)[])import("psianims/gfx/1.gfx.lzhal");

/// $CCDB27
immutable ubyte[] psiAnimationGraphicsSet3 = cast(immutable(ubyte)[])import("psianims/gfx/2.gfx.lzhal");

/// $CCE31D
immutable ubyte[] psiAnimationGraphicsSet4 = cast(immutable(ubyte)[])import("psianims/gfx/3.gfx.lzhal");

/// $CCF04D
immutable PSIAnimation[34] psiAnimationConfig = [
	PSIAnimation(psiAnimationGraphicsSet3, 5, 3, 1, 2, 47, PSIAnimationTarget.allEnemies, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 4, 3, 1, 3, 29, PSIAnimationTarget.single, 50, 80, RGB(18, 6, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 4, 3, 1, 3, 47, PSIAnimationTarget.allEnemies, 90, 160, RGB(16, 6, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 3, 3, 1, 3, 33, PSIAnimationTarget.single, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 5, 3, 1, 3, 28, PSIAnimationTarget.single, 40, 70, RGB(0, 0, 10).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 5, 3, 1, 3, 33, PSIAnimationTarget.allEnemies, 40, 70, RGB(0, 0, 10).bgr555),
	PSIAnimation(psiAnimationGraphicsSet2, 5, 2, 1, 3, 13, PSIAnimationTarget.row, 40, 70, RGB(31, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet2, 5, 2, 1, 3, 16, PSIAnimationTarget.row, 50, 80, RGB(31, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet2, 5, 3, 1, 3, 17, PSIAnimationTarget.row, 50, 80, RGB(31, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet2, 5, 3, 1, 3, 27, PSIAnimationTarget.row, 80, 130, RGB(31, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 5, 3, 1, 2, 6, PSIAnimationTarget.allEnemies, 10, 40, RGB(29, 29, 29).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 5, 3, 1, 2, 10, PSIAnimationTarget.allEnemies, 20, 50, RGB(29, 29, 29).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 2, 1, 3, 19, PSIAnimationTarget.allEnemies, 30, 60, RGB(29, 29, 29).bgr555),
	PSIAnimation(psiAnimationGraphicsSet2, 4, 2, 1, 3, 33, PSIAnimationTarget.allEnemies, 76, 125, RGB(29, 29, 29).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 3, 1, 3, 23, PSIAnimationTarget.single, 50, 80, RGB(0, 0, 31).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 3, 1, 3, 22, PSIAnimationTarget.single, 50, 80, RGB(0, 0, 31).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 3, 1, 3, 23, PSIAnimationTarget.single, 50, 80, RGB(0, 0, 31).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 3, 1, 3, 35, PSIAnimationTarget.single, 60, 135, RGB(0, 0, 31).bgr555),
	PSIAnimation(psiAnimationGraphicsSet4, 3, 2, 1, 3, 31, PSIAnimationTarget.allEnemies, 63, 92, RGB(26, 14, 14).bgr555),
	PSIAnimation(psiAnimationGraphicsSet4, 3, 2, 1, 3, 48, PSIAnimationTarget.allEnemies, 114, 143, RGB(26, 14, 14).bgr555),
	PSIAnimation(psiAnimationGraphicsSet4, 3, 2, 1, 3, 54, PSIAnimationTarget.allEnemies, 132, 161, RGB(26, 14, 14).bgr555),
	PSIAnimation(psiAnimationGraphicsSet4, 4, 2, 1, 3, 64, PSIAnimationTarget.allEnemies, 141, 255, RGB(26, 14, 14).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 5, 3, 1, 3, 26, PSIAnimationTarget.single, 60, 90, RGB(0, 10, 4).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 5, 3, 1, 3, 26, PSIAnimationTarget.allEnemies, 60, 90, RGB(0, 10, 4).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 3, 3, 1, 3, 34, PSIAnimationTarget.single, 45, 75, RGB(18, 18, 18).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 3, 3, 1, 3, 26, PSIAnimationTarget.allEnemies, 45, 75, RGB(18, 18, 18).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 7, 4, 1, 2, 17, PSIAnimationTarget.allEnemies, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 5, 3, 1, 3, 11, PSIAnimationTarget.single, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 5, 3, 1, 3, 17, PSIAnimationTarget.allEnemies, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet3, 3, 3, 1, 3, 33, PSIAnimationTarget.allEnemies, 0, 0, RGB(0, 0, 0).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 2, 1, 3, 33, PSIAnimationTarget.allEnemies, 80, 131, RGB(18, 18, 31).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 2, 1, 3, 46, PSIAnimationTarget.allEnemies, 121, 183, RGB(18, 18, 31).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 3, 1, 3, 15, PSIAnimationTarget.random, 25, 54, RGB(31, 31, 11).bgr555),
	PSIAnimation(psiAnimationGraphicsSet1, 4, 3, 1, 3, 19, PSIAnimationTarget.random, 49, 75, RGB(31, 31, 11).bgr555),
];

/// $CCF47F
immutable ubyte[][34] psiAnimationPalettes = [
	cast(immutable(ubyte)[])import("psianims/palettes/00.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/01.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/02.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/03.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/04.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/05.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/06.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/07.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/08.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/09.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/10.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/11.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/12.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/13.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/14.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/15.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/16.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/17.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/18.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/19.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/20.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/21.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/22.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/23.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/24.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/25.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/26.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/27.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/28.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/29.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/30.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/31.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/32.bin"),
	cast(immutable(ubyte)[])import("psianims/palettes/33.bin"),
];

/// $CCF58F
immutable ubyte[][34] psiAnimationPointers = [
	cast(immutable(ubyte)[])import("psianims/arrangements/0.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/1.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/2.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/3.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/4.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/5.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/6.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/7.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/8.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/9.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/10.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/11.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/12.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/13.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/14.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/15.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/16.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/17.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/18.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/19.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/20.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/21.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/22.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/23.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/24.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/25.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/26.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/27.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/28.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/29.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/30.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/31.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/32.arr.lzhal"),
	cast(immutable(ubyte)[])import("psianims/arrangements/33.arr.lzhal"),
];
