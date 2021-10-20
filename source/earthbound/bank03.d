module earthbound.bank03;

import earthbound.commondefs;

immutable ushort[] AllowedInputDirections = [
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //NORMAL
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_01
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_02
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //BICYCLE
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //GHOST
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_05
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //SLOWER
	DirectionMask.Up | DirectionMask.Down, //LADDER
	DirectionMask.Up | DirectionMask.Down, //ROPE
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_09
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //SLOWEST
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_0B
	0, //ESCALATOR
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft //STAIRS
];

immutable ushort[2] arrC3E406 = [ 0x2441, 0x268D ];
immutable ushort[2] arrC3E40A = [ 0x2451, 0x269D ];

// $C3E4CA - Clear the instant text print flag
void     ClearInstaprint();
// $C3E4D4 - Set the instant text print flag
void     SetInstaprint();

// $C3E521
void CloseWindow(short);
