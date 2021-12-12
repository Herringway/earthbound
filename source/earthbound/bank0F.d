///
module earthbound.bank0F;

import earthbound.commondefs;
import earthbound.bank05;
import earthbound.bank06;
import earthbound.bank07;
import earthbound.bank08;
import earthbound.bank09;
import earthbound.bank2F;

/// $CF0000

immutable SectorDoors[1280] doorConfig = [	SectorDoors(1, [DoorConfig(0x11, 0x15, DoorType.Object, null/+&DoorEntry910+/)]),
	SectorDoors(2, [DoorConfig(0x0E, 0x15, DoorType.Door, null/+&DoorEntry908+/), DoorConfig(0x19, 0x15, DoorType.Object, null/+&DoorEntry911+/)]),
	SectorDoors(1, [DoorConfig(0x0E, 0x16, DoorType.Door, null/+&DoorEntry904+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0F, 0x05, DoorType.Door, null/+&DoorEntry0+/)]),
	SectorDoors(4, [DoorConfig(0x11, 0x02, DoorType.Object, null/+&DoorEntry150+/), DoorConfig(0x11, 0x04, DoorType.Object, null/+&DoorEntry150+/), DoorConfig(0x12, 0x03, DoorType.Object, null/+&DoorEntry150+/), DoorConfig(0x12, 0x05, DoorType.Object, null/+&DoorEntry150+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x0B, DoorType.Door, null/+&DoorEntry885+/), DoorConfig(0x11, 0x0C, DoorType.Door, null/+&DoorEntry885+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x15, 0x07, DoorType.Door, null/+&DoorEntry886+/), DoorConfig(0x15, 0x08, DoorType.Door, null/+&DoorEntry886+/)]),
	SectorDoors(2, [DoorConfig(0x11, 0x01, DoorType.Door, null/+&DoorEntry887+/), DoorConfig(0x11, 0x02, DoorType.Door, null/+&DoorEntry887+/)]),
	SectorDoors(6, [DoorConfig(0x0D, 0x06, DoorType.Object, null/+&DoorEntry840+/), DoorConfig(0x0D, 0x0C, DoorType.Object, null/+&DoorEntry862+/), DoorConfig(0x0D, 0x12, DoorType.Object, null/+&DoorEntry841+/), DoorConfig(0x15, 0x0E, DoorType.Object, null/+&DoorEntry842+/), DoorConfig(0x19, 0x0A, DoorType.Object, null/+&DoorEntry843+/), DoorConfig(0x1D, 0x11, DoorType.Object, null/+&DoorEntry844+/)]),
	SectorDoors(45, [DoorConfig(0x01, 0x07, DoorType.Door, null/+&DoorEntry818+/), DoorConfig(0x01, 0x13, DoorType.Door, null/+&DoorEntry819+/), DoorConfig(0x02, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x0D, DoorType.Door, null/+&DoorEntry820+/), DoorConfig(0x02, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x19, DoorType.Door, null/+&DoorEntry821+/), DoorConfig(0x03, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x07, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x05, DoorType.Object, null/+&DoorEntry845+/), DoorConfig(0x0D, 0x0A, DoorType.Object, null/+&DoorEntry845+/), DoorConfig(0x0D, 0x11, DoorType.Object, null/+&DoorEntry845+/), DoorConfig(0x0D, 0x16, DoorType.Object, null/+&DoorEntry845+/), DoorConfig(0x1A, 0x18, DoorType.Object, null/+&DoorEntry847+/)]),
	SectorDoors(4, [DoorConfig(0x09, 0x11, DoorType.Door, null/+&DoorEntry839+/), DoorConfig(0x0D, 0x15, DoorType.Object, null/+&DoorEntry848+/), DoorConfig(0x15, 0x01, DoorType.Object, null/+&DoorEntry849+/), DoorConfig(0x19, 0x06, DoorType.Object, null/+&DoorEntry850+/)]),
	SectorDoors(5, [DoorConfig(0x1C, 0x05, DoorType.Door, null/+&DoorEntry402+/), DoorConfig(0x1C, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x1D, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x1E, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x1F, 0x16, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(5, [DoorConfig(0x14, 0x02, DoorType.Door, null/+&DoorEntry403+/), DoorConfig(0x1C, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x1D, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x1E, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x1F, 0x16, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x16, DoorType.Door, null/+&DoorEntry942+/)]),
	SectorDoors(6, [DoorConfig(0x08, 0x06, DoorType.Door, null/+&DoorEntry345+/), DoorConfig(0x09, 0x05, DoorType.Door, null/+&DoorEntry345+/), DoorConfig(0x0A, 0x04, DoorType.Door, null/+&DoorEntry345+/), DoorConfig(0x0B, 0x03, DoorType.Door, null/+&DoorEntry345+/), DoorConfig(0x0C, 0x02, DoorType.Door, null/+&DoorEntry345+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry345+/)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x08, 0x19, DoorType.Door, null/+&DoorEntry346+/), DoorConfig(0x09, 0x1A, DoorType.Door, null/+&DoorEntry346+/), DoorConfig(0x0A, 0x1B, DoorType.Door, null/+&DoorEntry346+/), DoorConfig(0x0B, 0x1C, DoorType.Door, null/+&DoorEntry346+/), DoorConfig(0x0C, 0x1D, DoorType.Door, null/+&DoorEntry346+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry346+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x06, DoorType.Door, null/+&DoorEntry31+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x11, DoorType.Door, null/+&DoorEntry32+/), DoorConfig(0x07, 0x1D, DoorType.Door, null/+&DoorEntry33+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry34+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x0E, DoorType.Door, null/+&DoorEntry35+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry36+/)]),
	SectorDoors(4, [DoorConfig(0x0B, 0x09, DoorType.Door, null/+&DoorEntry151+/), DoorConfig(0x0B, 0x11, DoorType.Door, null/+&DoorEntry152+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry37+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry38+/)]),
	SectorDoors(2, [DoorConfig(0x11, 0x13, DoorType.Door, null/+&DoorEntry905+/), DoorConfig(0x11, 0x14, DoorType.Door, null/+&DoorEntry905+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x11, DoorType.Object, null/+&DoorEntry912+/)]),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x06, 0x09, DoorType.Door, null/+&DoorEntry1+/), DoorConfig(0x19, 0x1D, DoorType.Door, null/+&DoorEntry2+/), DoorConfig(0x1A, 0x05, DoorType.Door, null/+&DoorEntry3+/)]),
	SectorDoors(1, [DoorConfig(0x1E, 0x11, DoorType.Door, null/+&DoorEntry4+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x0B, DoorType.Door, null/+&DoorEntry21+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x0B, DoorType.Door, null/+&DoorEntry22+/), DoorConfig(0x13, 0x1A, DoorType.Object, null/+&DoorEntry148+/), DoorConfig(0x13, 0x1C, DoorType.Object, null/+&DoorEntry148+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x0B, DoorType.Door, null/+&DoorEntry888+/), DoorConfig(0x11, 0x0C, DoorType.Door, null/+&DoorEntry888+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x05, 0x04, DoorType.Object, null/+&DoorEntry851+/)]),
	SectorDoors(1, []),
	SectorDoors(3, [DoorConfig(0x01, 0x11, DoorType.Object, null/+&DoorEntry852+/), DoorConfig(0x0D, 0x05, DoorType.Object, null/+&DoorEntry853+/), DoorConfig(0x11, 0x15, DoorType.Object, null/+&DoorEntry854+/)]),
	SectorDoors(11, [DoorConfig(0x00, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x01, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x0F, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x14, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(13, [DoorConfig(0x00, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x01, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x0F, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x14, 0x1A, DoorType.Door, null/+&DoorEntry404+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x00, 0x1C, DoorType.Door, null/+&DoorEntry461+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.Door, null/+&DoorEntry39+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x06, DoorType.Door, null/+&DoorEntry40+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x04, DoorType.Door, null/+&DoorEntry41+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry42+/)]),
	SectorDoors(4, [DoorConfig(0x0A, 0x0F, DoorType.Door, null/+&DoorEntry43+/), DoorConfig(0x17, 0x0D, DoorType.Door, null/+&DoorEntry44+/), DoorConfig(0x17, 0x19, DoorType.Door, null/+&DoorEntry45+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry46+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry47+/), DoorConfig(0x1D, 0x16, DoorType.Door, null/+&DoorEntry48+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x11, DoorType.Object, null/+&DoorEntry863+/)]),
	SectorDoors(9, [DoorConfig(0x09, 0x05, DoorType.Door, null/+&DoorEntry825+/), DoorConfig(0x09, 0x06, DoorType.Door, null/+&DoorEntry825+/), DoorConfig(0x09, 0x0D, DoorType.Door, null/+&DoorEntry826+/), DoorConfig(0x09, 0x0E, DoorType.Door, null/+&DoorEntry826+/), DoorConfig(0x09, 0x15, DoorType.Door, null/+&DoorEntry827+/), DoorConfig(0x09, 0x16, DoorType.Door, null/+&DoorEntry827+/), DoorConfig(0x09, 0x1D, DoorType.Door, null/+&DoorEntry828+/), DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry828+/), DoorConfig(0x1D, 0x01, DoorType.Object, null/+&DoorEntry864+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x12, DoorType.Object, null/+&DoorEntry865+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x04, 0x15, DoorType.Door, null/+&DoorEntry5+/), DoorConfig(0x04, 0x17, DoorType.Door, null/+&DoorEntry5+/), DoorConfig(0x07, 0x15, DoorType.Door, null/+&DoorEntry6+/), DoorConfig(0x09, 0x19, DoorType.Object, null/+&DoorEntry133+/), DoorConfig(0x09, 0x1A, DoorType.Object, null/+&DoorEntry133+/)]),
	SectorDoors(2, [DoorConfig(0x1F, 0x02, DoorType.Object, null/+&DoorEntry135+/), DoorConfig(0x1F, 0x04, DoorType.Object, null/+&DoorEntry135+/)]),
	SectorDoors(1, [DoorConfig(0x12, 0x1C, DoorType.Door, null/+&DoorEntry7+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x0C, 0x15, DoorType.Door, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x17, DoorType.Door, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x19, DoorType.Door, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x1B, DoorType.Door, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x1D, DoorType.Door, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x1F, DoorType.Door, null/+&DoorEntry28+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x0D, DoorType.Door, null/+&DoorEntry889+/), DoorConfig(0x0D, 0x0E, DoorType.Door, null/+&DoorEntry889+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x03, DoorType.Door, null/+&DoorEntry890+/), DoorConfig(0x01, 0x04, DoorType.Door, null/+&DoorEntry890+/), DoorConfig(0x1D, 0x07, DoorType.Door, null/+&DoorEntry891+/), DoorConfig(0x1D, 0x08, DoorType.Door, null/+&DoorEntry891+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x05, 0x03, DoorType.Door, null/+&DoorEntry892+/), DoorConfig(0x05, 0x04, DoorType.Door, null/+&DoorEntry892+/)]),
	SectorDoors(3, [DoorConfig(0x05, 0x19, DoorType.Object, null/+&DoorEntry855+/), DoorConfig(0x15, 0x09, DoorType.Door, null/+&DoorEntry822+/), DoorConfig(0x19, 0x09, DoorType.Object, null/+&DoorEntry856+/)]),
	SectorDoors(3, [DoorConfig(0x11, 0x16, DoorType.Object, null/+&DoorEntry857+/), DoorConfig(0x19, 0x0A, DoorType.Object, null/+&DoorEntry858+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.Object, null/+&DoorEntry859+/), DoorConfig(0x15, 0x0C, DoorType.Object, null/+&DoorEntry860+/)]),
	SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.Door, null/+&DoorEntry650+/), DoorConfig(0x16, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x00, DoorType.Door, null/+&DoorEntry650+/), DoorConfig(0x17, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x00, DoorType.Door, null/+&DoorEntry651+/), DoorConfig(0x1B, 0x00, DoorType.Door, null/+&DoorEntry651+/)]),
	SectorDoors(13, [DoorConfig(0x03, 0x03, DoorType.Door, null/+&DoorEntry652+/), DoorConfig(0x04, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x08, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x0A, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x0B, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x0C, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x03, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x19, DoorType.Door, null/+&DoorEntry653+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x1D, DoorType.Door, null/+&DoorEntry654+/)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x16, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x1F, DoorType.Door, null/+&DoorEntry655+/), DoorConfig(0x17, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x1F, DoorType.Door, null/+&DoorEntry655+/), DoorConfig(0x1A, 0x1F, DoorType.Door, null/+&DoorEntry656+/), DoorConfig(0x1B, 0x1F, DoorType.Door, null/+&DoorEntry656+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x14, 0x0D, DoorType.Door, null/+&DoorEntry432+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry49+/), DoorConfig(0x17, 0x11, DoorType.Door, null/+&DoorEntry50+/), DoorConfig(0x17, 0x19, DoorType.Door, null/+&DoorEntry153+/), DoorConfig(0x17, 0x1D, DoorType.Door, null/+&DoorEntry154+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry51+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry52+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry53+/)]),
	SectorDoors(6, [DoorConfig(0x07, 0x11, DoorType.Door, null/+&DoorEntry54+/), DoorConfig(0x07, 0x1A, DoorType.Object, null/+&DoorEntry155+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry55+/), DoorConfig(0x15, 0x11, DoorType.Door, null/+&DoorEntry56+/), DoorConfig(0x15, 0x12, DoorType.Door, null/+&DoorEntry56+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry57+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x01, DoorType.Door, null/+&DoorEntry58+/), DoorConfig(0x0D, 0x0E, DoorType.Door, null/+&DoorEntry59+/), DoorConfig(0x19, 0x06, DoorType.Door, null/+&DoorEntry60+/)]),
	SectorDoors(8, [DoorConfig(0x02, 0x15, DoorType.Door, null/+&DoorEntry829+/), DoorConfig(0x03, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x18, DoorType.Object, null/+&DoorEntry866+/), DoorConfig(0x15, 0x0C, DoorType.Object, null/+&DoorEntry867+/)]),
	SectorDoors(5, [DoorConfig(0x01, 0x11, DoorType.Object, null/+&DoorEntry846+/), DoorConfig(0x15, 0x16, DoorType.Object, null/+&DoorEntry868+/), DoorConfig(0x15, 0x1D, DoorType.Door, null/+&DoorEntry830+/), DoorConfig(0x15, 0x1E, DoorType.Door, null/+&DoorEntry830+/)]),
	SectorDoors(3, [DoorConfig(0x09, 0x19, DoorType.Object, null/+&DoorEntry869+/), DoorConfig(0x11, 0x10, DoorType.Object, null/+&DoorEntry870+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x14, 0x12, DoorType.Door, null/+&DoorEntry124+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0C, 0x0A, DoorType.Door, null/+&DoorEntry23+/), DoorConfig(0x13, 0x1E, DoorType.Object, null/+&DoorEntry145+/)]),
	SectorDoors(1, [DoorConfig(0x13, 0x00, DoorType.Object, null/+&DoorEntry145+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.Door, null/+&DoorEntry893+/), DoorConfig(0x09, 0x0E, DoorType.Door, null/+&DoorEntry893+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x15, 0x0F, DoorType.Door, null/+&DoorEntry894+/), DoorConfig(0x15, 0x10, DoorType.Door, null/+&DoorEntry894+/)]),
	SectorDoors(1, [DoorConfig(0x12, 0x16, DoorType.Door, null/+&DoorEntry895+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x15, DoorType.Object, null/+&DoorEntry861+/), DoorConfig(0x12, 0x1A, DoorType.Door, null/+&DoorEntry824+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry61+/), DoorConfig(0x1A, 0x13, DoorType.Door, null/+&DoorEntry62+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry63+/), DoorConfig(0x17, 0x0A, DoorType.Object, null/+&DoorEntry677+/), DoorConfig(0x17, 0x12, DoorType.Door, null/+&DoorEntry64+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry66+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry65+/)]),
	SectorDoors(4, [DoorConfig(0x0A, 0x13, DoorType.Door, null/+&DoorEntry67+/), DoorConfig(0x1B, 0x11, DoorType.Door, null/+&DoorEntry68+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry69+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry70+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry71+/), DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry72+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry73+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry74+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry75+/)]),
	SectorDoors(5, [DoorConfig(0x00, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x01, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x14, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x06, DoorType.Object, null/+&DoorEntry871+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x01, DoorType.Object, null/+&DoorEntry872+/), DoorConfig(0x0D, 0x15, DoorType.Door, null/+&DoorEntry831+/), DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry831+/), DoorConfig(0x11, 0x09, DoorType.Object, null/+&DoorEntry873+/)]),
	SectorDoors(2, [DoorConfig(0x05, 0x05, DoorType.Object, null/+&DoorEntry874+/), DoorConfig(0x19, 0x02, DoorType.Object, null/+&DoorEntry875+/)]),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x0B, 0x15, DoorType.Object, null/+&DoorEntry130+/), DoorConfig(0x0B, 0x17, DoorType.Object, null/+&DoorEntry130+/), DoorConfig(0x0B, 0x18, DoorType.Object, null/+&DoorEntry130+/), DoorConfig(0x0B, 0x1A, DoorType.Object, null/+&DoorEntry130+/)]),
	SectorDoors(3, [DoorConfig(0x03, 0x02, DoorType.Object, null/+&DoorEntry131+/), DoorConfig(0x03, 0x04, DoorType.Object, null/+&DoorEntry131+/), DoorConfig(0x04, 0x12, DoorType.Door, null/+&DoorEntry125+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x08, DoorType.Door, null/+&DoorEntry8+/), DoorConfig(0x0D, 0x19, DoorType.Door, null/+&DoorEntry9+/)]),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x0A, 0x15, DoorType.Object, null/+&DoorEntry143+/), DoorConfig(0x0A, 0x17, DoorType.Object, null/+&DoorEntry143+/), DoorConfig(0x0A, 0x18, DoorType.Object, null/+&DoorEntry143+/), DoorConfig(0x0A, 0x1A, DoorType.Object, null/+&DoorEntry143+/)]),
	SectorDoors(2, [DoorConfig(0x0B, 0x01, DoorType.Door, null/+&DoorEntry24+/), DoorConfig(0x0B, 0x0D, DoorType.Door, null/+&DoorEntry25+/)]),
	SectorDoors(5, [DoorConfig(0x12, 0x11, DoorType.Object, null/+&DoorEntry147+/), DoorConfig(0x12, 0x13, DoorType.Object, null/+&DoorEntry147+/), DoorConfig(0x12, 0x14, DoorType.Object, null/+&DoorEntry147+/), DoorConfig(0x12, 0x16, DoorType.Object, null/+&DoorEntry147+/), DoorConfig(0x1F, 0x11, DoorType.Door, null/+&DoorEntry139+/)]),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0A, 0x11, DoorType.Door, null/+&DoorEntry281+/), DoorConfig(0x0A, 0x12, DoorType.Door, null/+&DoorEntry281+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x17, DoorType.Door, null/+&DoorEntry277+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x06, DoorType.Door, null/+&DoorEntry276+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(11, [DoorConfig(0x08, 0x08, DoorType.Object, null/+&DoorEntry157+/), DoorConfig(0x08, 0x09, DoorType.Object, null/+&DoorEntry157+/), DoorConfig(0x08, 0x0A, DoorType.Object, null/+&DoorEntry157+/), DoorConfig(0x08, 0x0C, DoorType.Object, null/+&DoorEntry158+/), DoorConfig(0x08, 0x0D, DoorType.Object, null/+&DoorEntry158+/), DoorConfig(0x08, 0x0E, DoorType.Object, null/+&DoorEntry158+/), DoorConfig(0x08, 0x10, DoorType.Object, null/+&DoorEntry159+/), DoorConfig(0x08, 0x11, DoorType.Object, null/+&DoorEntry159+/), DoorConfig(0x08, 0x12, DoorType.Object, null/+&DoorEntry159+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry76+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry77+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x0A, DoorType.Door, null/+&DoorEntry78+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry79+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x1B, DoorType.Door, null/+&DoorEntry80+/), DoorConfig(0x1A, 0x13, DoorType.Door, null/+&DoorEntry81+/), DoorConfig(0x1B, 0x0C, DoorType.Door, null/+&DoorEntry82+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry83+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry84+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x04, DoorType.Door, null/+&DoorEntry85+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry86+/)]),
	SectorDoors(4, [DoorConfig(0x12, 0x1F, DoorType.Door, null/+&DoorEntry657+/), DoorConfig(0x13, 0x1F, DoorType.Door, null/+&DoorEntry657+/), DoorConfig(0x16, 0x1F, DoorType.Door, null/+&DoorEntry658+/), DoorConfig(0x17, 0x1F, DoorType.Door, null/+&DoorEntry658+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x1D, DoorType.Stairway, 0x0200), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry787+/), DoorConfig(0x1D, 0x0A, DoorType.Stairway, 0x0100)]),
	SectorDoors(1, [DoorConfig(0x09, 0x06, DoorType.Door, null/+&DoorEntry788+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x1F, DoorType.Door, null/+&DoorEntry126+/)]),
	SectorDoors(3, [DoorConfig(0x00, 0x1A, DoorType.Door, null/+&DoorEntry10+/), DoorConfig(0x0B, 0x09, DoorType.Door, null/+&DoorEntry11+/), DoorConfig(0x1B, 0x05, DoorType.Door, null/+&DoorEntry12+/)]),
	SectorDoors(4, [DoorConfig(0x02, 0x19, DoorType.Object, null/+&DoorEntry134+/), DoorConfig(0x02, 0x1B, DoorType.Object, null/+&DoorEntry134+/), DoorConfig(0x02, 0x1C, DoorType.Object, null/+&DoorEntry134+/), DoorConfig(0x02, 0x1E, DoorType.Object, null/+&DoorEntry134+/)]),
	SectorDoors(3, [DoorConfig(0x06, 0x0F, DoorType.Door, null/+&DoorEntry13+/), DoorConfig(0x13, 0x16, DoorType.Object, null/+&DoorEntry136+/), DoorConfig(0x13, 0x18, DoorType.Object, null/+&DoorEntry136+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x1F, DoorType.Door, null/+&DoorEntry14+/)]),
	SectorDoors(4, [DoorConfig(0x0D, 0x17, DoorType.Door, null/+&DoorEntry142+/), DoorConfig(0x11, 0x0B, DoorType.Door, null/+&DoorEntry141+/), DoorConfig(0x13, 0x19, DoorType.Object, null/+&DoorEntry144+/), DoorConfig(0x13, 0x1A, DoorType.Object, null/+&DoorEntry144+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0F, 0x01, DoorType.Door, null/+&DoorEntry26+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(12, [DoorConfig(0x08, 0x08, DoorType.Object, null/+&DoorEntry160+/), DoorConfig(0x08, 0x09, DoorType.Object, null/+&DoorEntry160+/), DoorConfig(0x08, 0x0A, DoorType.Object, null/+&DoorEntry160+/), DoorConfig(0x08, 0x0C, DoorType.Object, null/+&DoorEntry161+/), DoorConfig(0x08, 0x0D, DoorType.Object, null/+&DoorEntry161+/), DoorConfig(0x08, 0x0E, DoorType.Object, null/+&DoorEntry161+/), DoorConfig(0x08, 0x10, DoorType.Object, null/+&DoorEntry162+/), DoorConfig(0x08, 0x11, DoorType.Object, null/+&DoorEntry162+/), DoorConfig(0x08, 0x12, DoorType.Object, null/+&DoorEntry162+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry87+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry88+/), DoorConfig(0x1A, 0x17, DoorType.Door, null/+&DoorEntry89+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry90+/), DoorConfig(0x1B, 0x09, DoorType.Door, null/+&DoorEntry91+/), DoorConfig(0x1B, 0x0E, DoorType.Object, null/+&DoorEntry156+/), DoorConfig(0x1B, 0x11, DoorType.Door, null/+&DoorEntry92+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry93+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry94+/), DoorConfig(0x18, 0x16, DoorType.Object, null/+&DoorEntry163+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry95+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry96+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry97+/)]),
	SectorDoors(4, [DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry98+/), DoorConfig(0x17, 0x11, DoorType.Door, null/+&DoorEntry99+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry100+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry101+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1B, 0x19, DoorType.Door, null/+&DoorEntry15+/)]),
	SectorDoors(2, [DoorConfig(0x1B, 0x01, DoorType.Object, null/+&DoorEntry128+/), DoorConfig(0x1B, 0x02, DoorType.Object, null/+&DoorEntry128+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x12, 0x0F, DoorType.Door, null/+&DoorEntry16+/), DoorConfig(0x1B, 0x05, DoorType.Object, null/+&DoorEntry129+/), DoorConfig(0x1B, 0x07, DoorType.Object, null/+&DoorEntry129+/), DoorConfig(0x1B, 0x08, DoorType.Object, null/+&DoorEntry129+/), DoorConfig(0x1B, 0x0A, DoorType.Object, null/+&DoorEntry129+/)]),
	SectorDoors(3, [DoorConfig(0x0B, 0x00, DoorType.Object, null/+&DoorEntry132+/), DoorConfig(0x0B, 0x02, DoorType.Object, null/+&DoorEntry132+/), DoorConfig(0x19, 0x14, DoorType.Door, null/+&DoorEntry127+/)]),
	SectorDoors(3, [DoorConfig(0x12, 0x05, DoorType.Door, null/+&DoorEntry17+/), DoorConfig(0x12, 0x07, DoorType.Door, null/+&DoorEntry17+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry18+/)]),
	SectorDoors(4, [DoorConfig(0x03, 0x16, DoorType.Object, null/+&DoorEntry138+/), DoorConfig(0x03, 0x18, DoorType.Object, null/+&DoorEntry138+/), DoorConfig(0x15, 0x1C, DoorType.Door, null/+&DoorEntry19+/), DoorConfig(0x19, 0x08, DoorType.Door, null/+&DoorEntry20+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x07, 0x11, DoorType.Door, null/+&DoorEntry27+/), DoorConfig(0x17, 0x01, DoorType.Door, null/+&DoorEntry140+/)]),
	SectorDoors(6, [DoorConfig(0x07, 0x05, DoorType.Object, null/+&DoorEntry146+/), DoorConfig(0x07, 0x07, DoorType.Object, null/+&DoorEntry146+/), DoorConfig(0x07, 0x08, DoorType.Object, null/+&DoorEntry146+/), DoorConfig(0x07, 0x0A, DoorType.Object, null/+&DoorEntry146+/), DoorConfig(0x13, 0x11, DoorType.Object, null/+&DoorEntry149+/), DoorConfig(0x13, 0x12, DoorType.Object, null/+&DoorEntry149+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.Door, null/+&DoorEntry282+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x04, 0x09, DoorType.Door, null/+&DoorEntry278+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry258+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry259+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry260+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry381+/), DoorConfig(0x18, 0x0D, DoorType.Door, null/+&DoorEntry395+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry261+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry262+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry382+/), DoorConfig(0x18, 0x0D, DoorType.Door, null/+&DoorEntry396+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry102+/), DoorConfig(0x1A, 0x04, DoorType.Door, null/+&DoorEntry265+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry266+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x07, 0x0D, DoorType.Object, null/+&DoorEntry137+/), DoorConfig(0x07, 0x0E, DoorType.Object, null/+&DoorEntry137+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1F, 0x11, DoorType.Door, null/+&DoorEntry948+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x10, 0x02, DoorType.Door, null/+&DoorEntry383+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry384+/), DoorConfig(0x18, 0x0D, DoorType.Door, null/+&DoorEntry397+/)]),
	SectorDoors(1, [DoorConfig(0x12, 0x04, DoorType.Door, null/+&DoorEntry267+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry385+/), DoorConfig(0x18, 0x0D, DoorType.Door, null/+&DoorEntry398+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry491+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x1C, DoorType.Door, null/+&DoorEntry365+/), DoorConfig(0x11, 0x1E, DoorType.Door, null/+&DoorEntry365+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(14, [DoorConfig(0x0A, 0x07, DoorType.Door, null/+&DoorEntry115+/), DoorConfig(0x0A, 0x08, DoorType.Door, null/+&DoorEntry115+/), DoorConfig(0x12, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x13, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x14, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x15, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x16, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x17, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x18, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x19, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x1A, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x1B, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x1C, 0x0A, DoorType.RopeLadder, 0x8000), DoorConfig(0x1D, 0x0A, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1B, 0x05, DoorType.Door, null/+&DoorEntry29+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x0B, DoorType.Door, null/+&DoorEntry121+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry122+/)]),
	SectorDoors(10, [DoorConfig(0x0A, 0x09, DoorType.Door, null/+&DoorEntry896+/), DoorConfig(0x0B, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x0C, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x0F, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x10, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x09, DoorType.RopeLadder, 0)]),
	SectorDoors(10, [DoorConfig(0x06, 0x01, DoorType.Door, null/+&DoorEntry897+/), DoorConfig(0x07, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x08, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x0A, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x0B, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x0C, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x0F, 0x01, DoorType.RopeLadder, 0)]),
	SectorDoors(2, [DoorConfig(0x18, 0x16, DoorType.Door, null/+&DoorEntry279+/), DoorConfig(0x18, 0x17, DoorType.Door, null/+&DoorEntry279+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0C, 0x09, DoorType.Door, null/+&DoorEntry447+/)]),
	SectorDoors(2, [DoorConfig(0x1E, 0x15, DoorType.Door, null/+&DoorEntry446+/), DoorConfig(0x1E, 0x16, DoorType.Door, null/+&DoorEntry446+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry263+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry492+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x12, DoorType.Door, null/+&DoorEntry264+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x02, 0x11, DoorType.Object, null/+&DoorEntry379+/), DoorConfig(0x02, 0x13, DoorType.Object, null/+&DoorEntry379+/), DoorConfig(0x03, 0x17, DoorType.Door, null/+&DoorEntry366+/)]),
	SectorDoors(0, []),
	SectorDoors(21, [DoorConfig(0x04, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x0F, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x13, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x14, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x15, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x16, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x17, 0x06, DoorType.RopeLadder, 0x8000), DoorConfig(0x19, 0x0E, DoorType.Door, null/+&DoorEntry116+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(10, [DoorConfig(0x16, 0x01, DoorType.Door, null/+&DoorEntry898+/), DoorConfig(0x17, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x18, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x1B, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x1C, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x1D, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x1E, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x1F, 0x01, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x03, 0x01, DoorType.Door, null/+&DoorEntry328+/), DoorConfig(0x03, 0x1E, DoorType.Door, null/+&DoorEntry329+/), DoorConfig(0x1E, 0x05, DoorType.Door, null/+&DoorEntry902+/), DoorConfig(0x1F, 0x05, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry270+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry271+/)]),
	SectorDoors(2, [DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry119+/), DoorConfig(0x1B, 0x01, DoorType.Door, null/+&DoorEntry120+/)]),
	SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry785+/), DoorConfig(0x19, 0x12, DoorType.Door, null/+&DoorEntry786+/)]),
	SectorDoors(2, [DoorConfig(0x18, 0x05, DoorType.Door, null/+&DoorEntry113+/), DoorConfig(0x19, 0x17, DoorType.Door, null/+&DoorEntry114+/)]),
	SectorDoors(2, [DoorConfig(0x04, 0x16, DoorType.Door, null/+&DoorEntry433+/), DoorConfig(0x04, 0x17, DoorType.Door, null/+&DoorEntry433+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1A, 0x01, DoorType.Door, null/+&DoorEntry938+/), DoorConfig(0x1A, 0x11, DoorType.Door, null/+&DoorEntry939+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x06, DoorType.Door, null/+&DoorEntry940+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x02, 0x0C, DoorType.Door, null/+&DoorEntry268+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry380+/)]),
	SectorDoors(2, [DoorConfig(0x1B, 0x11, DoorType.Door, null/+&DoorEntry386+/), DoorConfig(0x1B, 0x1A, DoorType.Door, null/+&DoorEntry387+/)]),
	SectorDoors(1, [DoorConfig(0x02, 0x13, DoorType.Door, null/+&DoorEntry269+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1A, 0x03, DoorType.Door, null/+&DoorEntry378+/)]),
	SectorDoors(0, []),
	SectorDoors(11, [DoorConfig(0x01, 0x13, DoorType.Door, null/+&DoorEntry906+/), DoorConfig(0x02, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x13, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x05, DoorType.Door, null/+&DoorEntry907+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x08, 0x17, DoorType.Door, null/+&DoorEntry913+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(12, [DoorConfig(0x02, 0x0D, DoorType.Door, null/+&DoorEntry899+/), DoorConfig(0x03, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x08, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x0A, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x0B, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x1E, 0x0D, DoorType.Door, null/+&DoorEntry900+/), DoorConfig(0x1F, 0x0D, DoorType.RopeLadder, 0)]),
	SectorDoors(1, []),
	SectorDoors(0, []),
	SectorDoors(8, [DoorConfig(0x00, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x01, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x05, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x14, 0x17, DoorType.Door, null/+&DoorEntry682+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x13, 0x08, DoorType.Door, null/+&DoorEntry683+/)]),
	SectorDoors(1, [DoorConfig(0x13, 0x17, DoorType.Door, null/+&DoorEntry684+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x14, 0x02, DoorType.Door, null/+&DoorEntry685+/), DoorConfig(0x14, 0x03, DoorType.Door, null/+&DoorEntry685+/)]),
	SectorDoors(3, [DoorConfig(0x11, 0x0C, DoorType.Door, null/+&DoorEntry686+/), DoorConfig(0x11, 0x0E, DoorType.Door, null/+&DoorEntry686+/), DoorConfig(0x11, 0x10, DoorType.Door, null/+&DoorEntry686+/)]),
	SectorDoors(3, [DoorConfig(0x17, 0x05, DoorType.Object, null/+&DoorEntry741+/), DoorConfig(0x17, 0x07, DoorType.Object, null/+&DoorEntry741+/), DoorConfig(0x17, 0x08, DoorType.Object, null/+&DoorEntry741+/)]),
	SectorDoors(2, [DoorConfig(0x16, 0x0D, DoorType.Door, null/+&DoorEntry687+/), DoorConfig(0x16, 0x0E, DoorType.Door, null/+&DoorEntry687+/)]),
	SectorDoors(3, [DoorConfig(0x18, 0x0D, DoorType.Object, null/+&DoorEntry742+/), DoorConfig(0x18, 0x0F, DoorType.Object, null/+&DoorEntry742+/), DoorConfig(0x18, 0x11, DoorType.Object, null/+&DoorEntry742+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x0A, DoorType.Door, null/+&DoorEntry688+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x0B, DoorType.Door, null/+&DoorEntry738+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x0B, DoorType.Door, null/+&DoorEntry739+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x05, DoorType.Door, null/+&DoorEntry388+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x0A, DoorType.Door, null/+&DoorEntry389+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(8, [DoorConfig(0x00, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x01, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x0D, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x0E, 0x0D, DoorType.Door, null/+&DoorEntry901+/), DoorConfig(0x0F, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x10, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x0D, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x05, 0x0D, DoorType.Stairway, 0x0300), DoorConfig(0x05, 0x1E, DoorType.Stairway, 0x0200), DoorConfig(0x07, 0x05, DoorType.Stairway, 0x0300), DoorConfig(0x07, 0x0F, DoorType.Stairway, 0), DoorConfig(0x07, 0x1C, DoorType.Stairway, 0x0100), DoorConfig(0x09, 0x07, DoorType.Stairway, 0)]),
	SectorDoors(2, [DoorConfig(0x07, 0x0A, DoorType.Stairway, 0x0200), DoorConfig(0x09, 0x08, DoorType.Stairway, 0x0100)]),
	SectorDoors(4, [DoorConfig(0x09, 0x02, DoorType.Stairway, 0x0200), DoorConfig(0x0B, 0x00, DoorType.Stairway, 0x0100), DoorConfig(0x0B, 0x0E, DoorType.Stairway, 0x0200), DoorConfig(0x0D, 0x0C, DoorType.Stairway, 0x0100)]),
	SectorDoors(6, [DoorConfig(0x09, 0x09, DoorType.Stairway, 0x0300), DoorConfig(0x09, 0x1A, DoorType.Stairway, 0x0200), DoorConfig(0x0B, 0x01, DoorType.Stairway, 0x0300), DoorConfig(0x0B, 0x0B, DoorType.Stairway, 0), DoorConfig(0x0B, 0x18, DoorType.Stairway, 0x0100), DoorConfig(0x0D, 0x03, DoorType.Stairway, 0)]),
	SectorDoors(10, [DoorConfig(0x08, 0x08, DoorType.Object, null/+&DoorEntry740+/), DoorConfig(0x08, 0x09, DoorType.Object, null/+&DoorEntry740+/), DoorConfig(0x08, 0x0A, DoorType.Object, null/+&DoorEntry740+/), DoorConfig(0x08, 0x0C, DoorType.Object, null/+&DoorEntry740+/), DoorConfig(0x08, 0x0D, DoorType.Object, null/+&DoorEntry740+/), DoorConfig(0x08, 0x0E, DoorType.Object, null/+&DoorEntry740+/), DoorConfig(0x0B, 0x02, DoorType.Stairway, 0x0200), DoorConfig(0x0B, 0x19, DoorType.Stairway, 0x0300), DoorConfig(0x0D, 0x00, DoorType.Stairway, 0x0100), DoorConfig(0x0D, 0x1B, DoorType.Stairway, 0)]),
	SectorDoors(2, [DoorConfig(0x09, 0x05, DoorType.Stairway, 0x0300), DoorConfig(0x0B, 0x07, DoorType.Stairway, 0)]),
	SectorDoors(6, [DoorConfig(0x05, 0x09, DoorType.Stairway, 0x0300), DoorConfig(0x05, 0x1E, DoorType.Stairway, 0x0200), DoorConfig(0x07, 0x01, DoorType.Stairway, 0x0300), DoorConfig(0x07, 0x0B, DoorType.Stairway, 0), DoorConfig(0x07, 0x1C, DoorType.Stairway, 0x0100), DoorConfig(0x09, 0x03, DoorType.Stairway, 0)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0A, DoorType.Stairway, 0x0200), DoorConfig(0x09, 0x08, DoorType.Stairway, 0x0100), DoorConfig(0x0B, 0x1E, DoorType.Stairway, 0x0100)]),
	SectorDoors(1, [DoorConfig(0x09, 0x00, DoorType.Stairway, 0x0200)]),
	SectorDoors(2, [DoorConfig(0x02, 0x02, DoorType.Door, null/+&DoorEntry689+/), DoorConfig(0x02, 0x16, DoorType.Door, null/+&DoorEntry690+/)]),
	SectorDoors(2, [DoorConfig(0x02, 0x02, DoorType.Door, null/+&DoorEntry691+/), DoorConfig(0x02, 0x16, DoorType.Door, null/+&DoorEntry692+/)]),
	SectorDoors(1, [DoorConfig(0x02, 0x02, DoorType.Door, null/+&DoorEntry693+/)]),
	SectorDoors(3, [DoorConfig(0x04, 0x1E, DoorType.Door, null/+&DoorEntry391+/), DoorConfig(0x1B, 0x11, DoorType.Door, null/+&DoorEntry392+/), DoorConfig(0x1B, 0x1A, DoorType.Door, null/+&DoorEntry393+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x1A, DoorType.Door, null/+&DoorEntry390+/), DoorConfig(0x0A, 0x1B, DoorType.Door, null/+&DoorEntry390+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0E, 0x03, DoorType.Door, null/+&DoorEntry367+/)]),
	SectorDoors(2, [DoorConfig(0x10, 0x18, DoorType.Door, null/+&DoorEntry30+/), DoorConfig(0x10, 0x1A, DoorType.Door, null/+&DoorEntry30+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x02, 0x0A, DoorType.Door, null/+&DoorEntry914+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.Door, null/+&DoorEntry667+/), DoorConfig(0x16, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x00, DoorType.Door, null/+&DoorEntry667+/), DoorConfig(0x17, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x00, DoorType.Door, null/+&DoorEntry668+/), DoorConfig(0x1B, 0x00, DoorType.Door, null/+&DoorEntry668+/)]),
	SectorDoors(13, [DoorConfig(0x03, 0x1B, DoorType.Door, null/+&DoorEntry669+/), DoorConfig(0x04, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x08, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x0A, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x0B, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x0C, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x09, DoorType.Door, null/+&DoorEntry670+/)]),
	SectorDoors(2, [DoorConfig(0x16, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x09, DoorType.RopeLadder, 0)]),
	SectorDoors(3, [DoorConfig(0x09, 0x01, DoorType.Door, null/+&DoorEntry797+/), DoorConfig(0x0A, 0x0A, DoorType.Stairway, 0x0300), DoorConfig(0x1D, 0x1D, DoorType.Stairway, 0)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x0A, DoorType.Door, null/+&DoorEntry798+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry458+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x1F, DoorType.Door, null/+&DoorEntry455+/), DoorConfig(0x1B, 0x01, DoorType.Door, null/+&DoorEntry456+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x05, DoorType.Door, null/+&DoorEntry394+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry457+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x02, 0x0B, DoorType.Door, null/+&DoorEntry368+/), DoorConfig(0x06, 0x13, DoorType.Door, null/+&DoorEntry369+/)]),
	SectorDoors(1, [DoorConfig(0x02, 0x07, DoorType.Door, null/+&DoorEntry370+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x18, 0x1A, DoorType.Door, null/+&DoorEntry400+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x01, DoorType.Door, null/+&DoorEntry272+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry273+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x19, DoorType.Door, null/+&DoorEntry743+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry808+/), DoorConfig(0x1D, 0x0E, DoorType.Stairway, 0x0100)]),
	SectorDoors(6, [DoorConfig(0x09, 0x0E, DoorType.Door, null/+&DoorEntry809+/), DoorConfig(0x0A, 0x01, DoorType.Stairway, 0x0200), DoorConfig(0x15, 0x00, DoorType.Door, null/+&DoorEntry330+/), DoorConfig(0x15, 0x0A, DoorType.Stairway, 0x0300), DoorConfig(0x1D, 0x12, DoorType.Stairway, 0), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry331+/)]),
	SectorDoors(7, [DoorConfig(0x08, 0x06, DoorType.Door, null/+&DoorEntry548+/), DoorConfig(0x09, 0x05, DoorType.Door, null/+&DoorEntry548+/), DoorConfig(0x0A, 0x04, DoorType.Door, null/+&DoorEntry548+/), DoorConfig(0x0B, 0x03, DoorType.Door, null/+&DoorEntry548+/), DoorConfig(0x0C, 0x02, DoorType.Door, null/+&DoorEntry548+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry548+/), DoorConfig(0x1C, 0x19, DoorType.Door, null/+&DoorEntry659+/)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry813+/)]),
	SectorDoors(7, [DoorConfig(0x08, 0x15, DoorType.Door, null/+&DoorEntry549+/), DoorConfig(0x09, 0x16, DoorType.Door, null/+&DoorEntry549+/), DoorConfig(0x0A, 0x17, DoorType.Door, null/+&DoorEntry549+/), DoorConfig(0x0B, 0x18, DoorType.Door, null/+&DoorEntry549+/), DoorConfig(0x0C, 0x19, DoorType.Door, null/+&DoorEntry549+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry549+/), DoorConfig(0x1D, 0x1E, DoorType.Stairway, 0x0100)]),
	SectorDoors(2, [DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry814+/), DoorConfig(0x0A, 0x11, DoorType.Stairway, 0x0200)]),
	SectorDoors(3, [DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry478+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry459+/), DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry460+/)]),
	SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.Door, null/+&DoorEntry661+/), DoorConfig(0x16, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x00, DoorType.Door, null/+&DoorEntry661+/), DoorConfig(0x17, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x00, DoorType.Door, null/+&DoorEntry662+/), DoorConfig(0x1B, 0x00, DoorType.Door, null/+&DoorEntry662+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x1D, DoorType.Door, null/+&DoorEntry663+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x16, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x1F, DoorType.Door, null/+&DoorEntry664+/), DoorConfig(0x17, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x1F, DoorType.Door, null/+&DoorEntry664+/), DoorConfig(0x1A, 0x1F, DoorType.Door, null/+&DoorEntry665+/), DoorConfig(0x1B, 0x1F, DoorType.Door, null/+&DoorEntry665+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x0D, 0x05, DoorType.Door, null/+&DoorEntry793+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry794+/), DoorConfig(0x0E, 0x0F, DoorType.Door, null/+&DoorEntry795+/), DoorConfig(0x0E, 0x10, DoorType.Door, null/+&DoorEntry795+/), DoorConfig(0x11, 0x01, DoorType.Door, null/+&DoorEntry796+/)]),
	SectorDoors(1, [DoorConfig(0x10, 0x09, DoorType.Door, null/+&DoorEntry401+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x08, 0x14, DoorType.Door, null/+&DoorEntry552+/), DoorConfig(0x09, 0x15, DoorType.Door, null/+&DoorEntry552+/), DoorConfig(0x0A, 0x16, DoorType.Door, null/+&DoorEntry552+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x18, 0x10, DoorType.Door, null/+&DoorEntry562+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x13, 0x00, DoorType.Door, null/+&DoorEntry744+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1F, 0x0E, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(13, [DoorConfig(0x0A, 0x0C, DoorType.Door, null/+&DoorEntry423+/), DoorConfig(0x14, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x18, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1B, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1C, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1D, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1E, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1F, 0x06, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(13, [DoorConfig(0x04, 0x0C, DoorType.Door, null/+&DoorEntry409+/), DoorConfig(0x05, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x08, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x0A, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x0B, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x0C, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x0F, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x1A, DoorType.Door, null/+&DoorEntry410+/)]),
	SectorDoors(1, [DoorConfig(0x1E, 0x18, DoorType.Door, null/+&DoorEntry963+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x1C, DoorType.Door, null/+&DoorEntry964+/), DoorConfig(0x1E, 0x02, DoorType.Object, null/+&DoorEntry976+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x00, 0x19, DoorType.Door, null/+&DoorEntry371+/), DoorConfig(0x00, 0x1A, DoorType.Door, null/+&DoorEntry371+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x17, 0x04, DoorType.Door, null/+&DoorEntry767+/), DoorConfig(0x17, 0x18, DoorType.Door, null/+&DoorEntry768+/)]),
	SectorDoors(9, [DoorConfig(0x0C, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0F, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x13, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x1F, 0x0C, DoorType.Door, null/+&DoorEntry769+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x02, 0x04, DoorType.Door, null/+&DoorEntry553+/)]),
	SectorDoors(1, [DoorConfig(0x06, 0x0A, DoorType.Object, null/+&DoorEntry672+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x18, DoorType.Door, null/+&DoorEntry745+/)]),
	SectorDoors(1, [DoorConfig(0x13, 0x08, DoorType.Door, null/+&DoorEntry746+/)]),
	SectorDoors(1, [DoorConfig(0x03, 0x10, DoorType.Door, null/+&DoorEntry747+/)]),
	SectorDoors(26, [DoorConfig(0x00, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x01, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x0E, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x13, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x14, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x15, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x16, 0x0D, DoorType.RopeLadder, 0x8000), DoorConfig(0x1A, 0x0C, DoorType.RopeLadder, 0x8000), DoorConfig(0x1B, 0x0C, DoorType.RopeLadder, 0x8000), DoorConfig(0x1C, 0x0C, DoorType.RopeLadder, 0x8000), DoorConfig(0x1D, 0x0C, DoorType.RopeLadder, 0x8000), DoorConfig(0x1E, 0x0C, DoorType.RopeLadder, 0x8000), DoorConfig(0x1F, 0x0C, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(7, [DoorConfig(0x00, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x01, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x06, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(16, [DoorConfig(0x10, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x18, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1B, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1C, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1D, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1E, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1F, 0x06, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x04, 0x08, DoorType.Door, null/+&DoorEntry965+/), DoorConfig(0x05, 0x09, DoorType.Door, null/+&DoorEntry965+/), DoorConfig(0x06, 0x0A, DoorType.Door, null/+&DoorEntry965+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x14, 0x15, DoorType.Door, null/+&DoorEntry372+/), DoorConfig(0x14, 0x16, DoorType.Door, null/+&DoorEntry372+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x04, 0x19, DoorType.Door, null/+&DoorEntry770+/)]),
	SectorDoors(1, [DoorConfig(0x03, 0x0C, DoorType.Door, null/+&DoorEntry771+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x16, 0x1A, DoorType.Object, null/+&DoorEntry673+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x14, 0x14, DoorType.Door, null/+&DoorEntry554+/), DoorConfig(0x16, 0x12, DoorType.Door, null/+&DoorEntry554+/), DoorConfig(0x18, 0x10, DoorType.Door, null/+&DoorEntry554+/)]),
	SectorDoors(1, [DoorConfig(0x02, 0x10, DoorType.Door, null/+&DoorEntry555+/)]),
	SectorDoors(2, [DoorConfig(0x17, 0x03, DoorType.Door, null/+&DoorEntry556+/), DoorConfig(0x18, 0x04, DoorType.Door, null/+&DoorEntry556+/)]),
	SectorDoors(2, [DoorConfig(0x01, 0x0D, DoorType.Door, null/+&DoorEntry557+/), DoorConfig(0x02, 0x0D, DoorType.Door, null/+&DoorEntry557+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x1D, DoorType.Door, null/+&DoorEntry748+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x00, 0x0C, DoorType.RopeLadder, 0x8000), DoorConfig(0x01, 0x0C, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x0C, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x11, DoorType.Door, null/+&DoorEntry949+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.Door, null/+&DoorEntry648+/), DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry649+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x0E, DoorType.Object, null/+&DoorEntry975+/), DoorConfig(0x11, 0x1E, DoorType.Door, null/+&DoorEntry974+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry430+/)]),
	SectorDoors(32, [DoorConfig(0x00, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x01, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x08, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x0A, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x0B, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x0C, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x0F, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x10, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x18, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1B, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1C, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1D, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1E, 0x06, DoorType.RopeLadder, 0), DoorConfig(0x1F, 0x06, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x04, 0x1C, DoorType.Door, null/+&DoorEntry966+/), DoorConfig(0x06, 0x1A, DoorType.Door, null/+&DoorEntry966+/), DoorConfig(0x08, 0x18, DoorType.Door, null/+&DoorEntry966+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0B, 0x0A, DoorType.Door, null/+&DoorEntry377+/), DoorConfig(0x0B, 0x0B, DoorType.Door, null/+&DoorEntry377+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x17, 0x1E, DoorType.Door, null/+&DoorEntry558+/), DoorConfig(0x1C, 0x19, DoorType.Door, null/+&DoorEntry558+/), DoorConfig(0x1D, 0x18, DoorType.Door, null/+&DoorEntry558+/), DoorConfig(0x1E, 0x17, DoorType.Door, null/+&DoorEntry558+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x0C, 0x19, DoorType.Door, null/+&DoorEntry660+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry789+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry790+/)]),
	SectorDoors(4, [DoorConfig(0x15, 0x09, DoorType.Door, null/+&DoorEntry760+/), DoorConfig(0x15, 0x0A, DoorType.Door, null/+&DoorEntry760+/), DoorConfig(0x19, 0x19, DoorType.Door, null/+&DoorEntry761+/), DoorConfig(0x19, 0x1A, DoorType.Door, null/+&DoorEntry761+/)]),
	SectorDoors(3, [DoorConfig(0x19, 0x15, DoorType.Door, null/+&DoorEntry762+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry762+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x15, DoorType.Person, null/+&DoorEntry960+/), DoorConfig(0x0D, 0x16, DoorType.Person, null/+&DoorEntry960+/)]),
	SectorDoors(2, [DoorConfig(0x1F, 0x11, DoorType.Object, null/+&DoorEntry957+/), DoorConfig(0x1F, 0x13, DoorType.Object, null/+&DoorEntry957+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x11, DoorType.Object, null/+&DoorEntry958+/), DoorConfig(0x1B, 0x13, DoorType.Object, null/+&DoorEntry958+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry431+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x06, 0x07, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x07, DoorType.RopeLadder, 0), DoorConfig(0x08, 0x07, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x07, DoorType.RopeLadder, 0), DoorConfig(0x0A, 0x07, DoorType.RopeLadder, 0)]),
	SectorDoors(1, [DoorConfig(0x0A, 0x07, DoorType.Door, null/+&DoorEntry424+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x15, DoorType.Door, null/+&DoorEntry374+/)]),
	SectorDoors(2, [DoorConfig(0x04, 0x01, DoorType.Door, null/+&DoorEntry373+/), DoorConfig(0x04, 0x02, DoorType.Door, null/+&DoorEntry373+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x04, DoorType.Door, null/+&DoorEntry559+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x0E, 0x0D, DoorType.Object, null/+&DoorEntry674+/), DoorConfig(0x0E, 0x10, DoorType.Door, null/+&DoorEntry560+/), DoorConfig(0x0F, 0x11, DoorType.Door, null/+&DoorEntry560+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0C, 0x19, DoorType.Door, null/+&DoorEntry666+/), DoorConfig(0x19, 0x0E, DoorType.Door, null/+&DoorEntry799+/)]),
	SectorDoors(1, [DoorConfig(0x0E, 0x0E, DoorType.Door, null/+&DoorEntry444+/)]),
	SectorDoors(1, [DoorConfig(0x12, 0x0B, DoorType.Door, null/+&DoorEntry445+/)]),
	SectorDoors(3, [DoorConfig(0x10, 0x1F, DoorType.Door, null/+&DoorEntry950+/), DoorConfig(0x11, 0x15, DoorType.Person, null/+&DoorEntry961+/), DoorConfig(0x11, 0x16, DoorType.Person, null/+&DoorEntry961+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.Person, null/+&DoorEntry962+/), DoorConfig(0x09, 0x0E, DoorType.Person, null/+&DoorEntry962+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x07, 0x01, DoorType.Person, null/+&DoorEntry959+/), DoorConfig(0x07, 0x02, DoorType.Person, null/+&DoorEntry959+/), DoorConfig(0x08, 0x0B, DoorType.Door, null/+&DoorEntry951+/), DoorConfig(0x0C, 0x1B, DoorType.Door, null/+&DoorEntry952+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry903+/), DoorConfig(0x19, 0x06, DoorType.Door, null/+&DoorEntry903+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(1, [DoorConfig(0x0A, 0x18, DoorType.Object, null/+&DoorEntry977+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.Door, null/+&DoorEntry429+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x02, 0x08, DoorType.Door, null/+&DoorEntry375+/)]),
	SectorDoors(2, [DoorConfig(0x00, 0x11, DoorType.Door, null/+&DoorEntry376+/), DoorConfig(0x00, 0x12, DoorType.Door, null/+&DoorEntry376+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(3, [DoorConfig(0x02, 0x1F, DoorType.Door, null/+&DoorEntry772+/), DoorConfig(0x15, 0x18, DoorType.Switch, null/+&DoorEntry779+/), DoorConfig(0x1C, 0x1A, DoorType.Switch, null/+&DoorEntry778+/)]),
	SectorDoors(5, [DoorConfig(0x02, 0x00, DoorType.Door, null/+&DoorEntry772+/), DoorConfig(0x0C, 0x00, DoorType.Person, null/+&DoorEntry774+/), DoorConfig(0x11, 0x00, DoorType.Switch, null/+&DoorEntry775+/), DoorConfig(0x15, 0x07, DoorType.Switch, null/+&DoorEntry776+/), DoorConfig(0x1C, 0x05, DoorType.Switch, null/+&DoorEntry777+/)]),
	SectorDoors(8, [DoorConfig(0x18, 0x16, DoorType.Door, null/+&DoorEntry561+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry561+/), DoorConfig(0x1A, 0x16, DoorType.Door, null/+&DoorEntry561+/), DoorConfig(0x1B, 0x16, DoorType.Door, null/+&DoorEntry561+/), DoorConfig(0x1C, 0x16, DoorType.Door, null/+&DoorEntry561+/), DoorConfig(0x1D, 0x16, DoorType.Door, null/+&DoorEntry561+/), DoorConfig(0x1E, 0x16, DoorType.Door, null/+&DoorEntry561+/), DoorConfig(0x1F, 0x16, DoorType.Door, null/+&DoorEntry561+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x17, DoorType.Door, null/+&DoorEntry110+/)]),
	SectorDoors(3, [DoorConfig(0x0C, 0x1D, DoorType.Door, null/+&DoorEntry671+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry802+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry803+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry645+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry563+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.Door, null/+&DoorEntry633+/)]),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry564+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry565+/), DoorConfig(0x17, 0x05, DoorType.Door, null/+&DoorEntry566+/)]),
	SectorDoors(1, [DoorConfig(0x0A, 0x0E, DoorType.Door, null/+&DoorEntry567+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x01, DoorType.Door, null/+&DoorEntry568+/), DoorConfig(0x0D, 0x0E, DoorType.Door, null/+&DoorEntry569+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x0D, DoorType.Door, null/+&DoorEntry570+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry571+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry572+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry573+/)]),
	SectorDoors(1, [DoorConfig(0x0C, 0x05, DoorType.Door, null/+&DoorEntry407+/)]),
	SectorDoors(2, [DoorConfig(0x07, 0x0E, DoorType.Object, null/+&DoorEntry677+/), DoorConfig(0x09, 0x05, DoorType.Door, null/+&DoorEntry970+/)]),
	SectorDoors(1, [DoorConfig(0x0C, 0x1E, DoorType.Door, null/+&DoorEntry408+/)]),
	SectorDoors(2, [DoorConfig(0x19, 0x0A, DoorType.Stairway, 0x0300), DoorConfig(0x1D, 0x0E, DoorType.Stairway, 0)]),
	SectorDoors(2, [DoorConfig(0x0B, 0x1D, DoorType.Door, null/+&DoorEntry967+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry448+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0A, DoorType.Object, null/+&DoorEntry677+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry968+/), DoorConfig(0x19, 0x1B, DoorType.Door, null/+&DoorEntry449+/)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x00, DoorType.Door, null/+&DoorEntry413+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x0E, DoorType.Stairway, 0x0300), DoorConfig(0x05, 0x12, DoorType.Stairway, 0), DoorConfig(0x05, 0x1E, DoorType.Door, null/+&DoorEntry414+/), DoorConfig(0x1D, 0x04, DoorType.Door, null/+&DoorEntry415+/)]),
	SectorDoors(2, [DoorConfig(0x14, 0x1E, DoorType.Door, null/+&DoorEntry452+/), DoorConfig(0x14, 0x1F, DoorType.Door, null/+&DoorEntry452+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x14, 0x0E, DoorType.Door, null/+&DoorEntry453+/), DoorConfig(0x14, 0x0F, DoorType.Door, null/+&DoorEntry453+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(10, [DoorConfig(0x00, 0x0C, DoorType.Door, null/+&DoorEntry476+/), DoorConfig(0x01, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x0C, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry477+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry479+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x03, 0x01, DoorType.Door, null/+&DoorEntry332+/), DoorConfig(0x03, 0x1E, DoorType.Door, null/+&DoorEntry333+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry440+/)]),
	SectorDoors(4, [DoorConfig(0x06, 0x12, DoorType.Door, null/+&DoorEntry933+/), DoorConfig(0x0A, 0x01, DoorType.Door, null/+&DoorEntry934+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry806+/), DoorConfig(0x1D, 0x05, DoorType.Switch, 0x20ED)]),
	SectorDoors(2, [DoorConfig(0x11, 0x1E, DoorType.Object, null/+&DoorEntry679+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry634+/)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x16, 0x1D, DoorType.Door, null/+&DoorEntry635+/), DoorConfig(0x17, 0x1D, DoorType.Door, null/+&DoorEntry635+/), DoorConfig(0x18, 0x1D, DoorType.Door, null/+&DoorEntry635+/), DoorConfig(0x19, 0x1D, DoorType.Door, null/+&DoorEntry635+/), DoorConfig(0x1A, 0x1D, DoorType.Door, null/+&DoorEntry635+/), DoorConfig(0x1B, 0x1D, DoorType.Door, null/+&DoorEntry635+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x10, DoorType.Door, null/+&DoorEntry574+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry575+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry576+/), DoorConfig(0x17, 0x05, DoorType.Door, null/+&DoorEntry577+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x01, 0x02, DoorType.Door, null/+&DoorEntry578+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry579+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry580+/)]),
	SectorDoors(6, [DoorConfig(0x12, 0x05, DoorType.Door, null/+&DoorEntry499+/), DoorConfig(0x13, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x05, DoorType.RopeLadder, 0)]),
	SectorDoors(9, [DoorConfig(0x07, 0x05, DoorType.Door, null/+&DoorEntry533+/), DoorConfig(0x07, 0x09, DoorType.Door, null/+&DoorEntry534+/), DoorConfig(0x09, 0x0E, DoorType.Door, null/+&DoorEntry535+/), DoorConfig(0x12, 0x19, DoorType.Door, null/+&DoorEntry500+/), DoorConfig(0x13, 0x19, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x19, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x19, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x19, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x19, DoorType.RopeLadder, 0)]),
	SectorDoors(1, [DoorConfig(0x11, 0x00, DoorType.Door, null/+&DoorEntry419+/)]),
	SectorDoors(0, []),
	SectorDoors(7, [DoorConfig(0x02, 0x0D, DoorType.Door, null/+&DoorEntry501+/), DoorConfig(0x03, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x0D, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry506+/)]),
	SectorDoors(8, [DoorConfig(0x10, 0x18, DoorType.Door, null/+&DoorEntry505+/), DoorConfig(0x11, 0x18, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x18, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x18, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x18, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x18, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x18, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x18, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1C, 0x06, DoorType.Door, null/+&DoorEntry454+/), DoorConfig(0x1C, 0x07, DoorType.Door, null/+&DoorEntry454+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x17, DoorType.Door, null/+&DoorEntry773+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.Door, null/+&DoorEntry765+/)]),
	SectorDoors(3, [DoorConfig(0x19, 0x15, DoorType.Door, null/+&DoorEntry766+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry766+/)]),
	SectorDoors(12, [DoorConfig(0x14, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x18, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x1B, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x1C, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x1D, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x1E, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x1F, 0x16, DoorType.RopeLadder, 0)]),
	SectorDoors(2, [DoorConfig(0x07, 0x1E, DoorType.Object, null/+&DoorEntry462+/), DoorConfig(0x11, 0x06, DoorType.Door, null/+&DoorEntry434+/)]),
	SectorDoors(1, [DoorConfig(0x06, 0x04, DoorType.Door, null/+&DoorEntry435+/)]),
	SectorDoors(21, [DoorConfig(0x09, 0x1A, DoorType.Door, null/+&DoorEntry436+/), DoorConfig(0x0C, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x0F, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x10, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x18, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x1B, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x1C, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x1D, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x1E, 0x0E, DoorType.RopeLadder, 0), DoorConfig(0x1F, 0x0E, DoorType.RopeLadder, 0)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x01, DoorType.Door, null/+&DoorEntry929+/), DoorConfig(0x19, 0x1B, DoorType.Door, null/+&DoorEntry111+/)]),
	SectorDoors(5, [DoorConfig(0x05, 0x15, DoorType.Stairway, 0x0200), DoorConfig(0x05, 0x1E, DoorType.Door, null/+&DoorEntry334+/), DoorConfig(0x0D, 0x00, DoorType.Door, null/+&DoorEntry335+/), DoorConfig(0x0D, 0x0D, DoorType.Stairway, 0x0100), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry441+/)]),
	SectorDoors(5, [DoorConfig(0x0A, 0x01, DoorType.Door, null/+&DoorEntry935+/), DoorConfig(0x0A, 0x0E, DoorType.Door, null/+&DoorEntry936+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry807+/), DoorConfig(0x1A, 0x0E, DoorType.Object, null/+&DoorEntry817+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry581+/), DoorConfig(0x11, 0x01, DoorType.Door, null/+&DoorEntry582+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x19, DoorType.Door, null/+&DoorEntry636+/), DoorConfig(0x07, 0x1A, DoorType.Door, null/+&DoorEntry636+/), DoorConfig(0x0B, 0x0B, DoorType.Door, null/+&DoorEntry637+/)]),
	SectorDoors(1, [DoorConfig(0x15, 0x1E, DoorType.Door, null/+&DoorEntry638+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x0A, DoorType.Door, null/+&DoorEntry583+/), DoorConfig(0x07, 0x10, DoorType.Door, null/+&DoorEntry584+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry585+/), DoorConfig(0x17, 0x05, DoorType.Door, null/+&DoorEntry586+/)]),
	SectorDoors(1, [DoorConfig(0x05, 0x09, DoorType.Door, null/+&DoorEntry587+/)]),
	SectorDoors(1, [DoorConfig(0x05, 0x0A, DoorType.Door, null/+&DoorEntry588+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry589+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry590+/)]),
	SectorDoors(6, [DoorConfig(0x07, 0x05, DoorType.Door, null/+&DoorEntry521+/), DoorConfig(0x07, 0x0D, DoorType.Door, null/+&DoorEntry522+/), DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry523+/), DoorConfig(0x15, 0x00, DoorType.Door, null/+&DoorEntry420+/), DoorConfig(0x15, 0x0E, DoorType.Stairway, 0x0300), DoorConfig(0x1D, 0x16, DoorType.Stairway, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.Door, null/+&DoorEntry493+/), DoorConfig(0x09, 0x16, DoorType.Door, null/+&DoorEntry493+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x05, 0x1E, DoorType.Door, null/+&DoorEntry416+/)]),
	SectorDoors(1, [DoorConfig(0x05, 0x1E, DoorType.Door, null/+&DoorEntry417+/)]),
	SectorDoors(7, [DoorConfig(0x02, 0x15, DoorType.Door, null/+&DoorEntry502+/), DoorConfig(0x03, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry418+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0A, 0x10, DoorType.Door, null/+&DoorEntry437+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x00, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x01, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x16, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x05, DoorType.Door, null/+&DoorEntry438+/)]),
	SectorDoors(0, []),
	SectorDoors(12, [DoorConfig(0x0C, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x0F, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x10, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x1A, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x1A, DoorType.RopeLadder, 0)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x0A, DoorType.Door, null/+&DoorEntry439+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x01, DoorType.Door, null/+&DoorEntry930+/), DoorConfig(0x0A, 0x1A, DoorType.Door, null/+&DoorEntry931+/), DoorConfig(0x19, 0x17, DoorType.Door, null/+&DoorEntry112+/)]),
	SectorDoors(9, [DoorConfig(0x00, 0x1C, DoorType.Door, null/+&DoorEntry336+/), DoorConfig(0x01, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x15, DoorType.Stairway, 0x0200), DoorConfig(0x0D, 0x00, DoorType.Door, null/+&DoorEntry337+/), DoorConfig(0x0D, 0x0D, DoorType.Stairway, 0x0100), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry442+/)]),
	SectorDoors(4, [DoorConfig(0x0A, 0x12, DoorType.Door, null/+&DoorEntry937+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry810+/), DoorConfig(0x1A, 0x09, DoorType.Door, null/+&DoorEntry811+/), DoorConfig(0x1A, 0x0A, DoorType.Door, null/+&DoorEntry811+/)]),
	SectorDoors(2, [DoorConfig(0x1A, 0x1E, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x1D, 0x11, DoorType.Door, null/+&DoorEntry639+/)]),
	SectorDoors(6, [DoorConfig(0x1A, 0x04, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x09, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x0A, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x15, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x16, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x1C, DoorType.Person, null/+&DoorEntry681+/)]),
	SectorDoors(2, [DoorConfig(0x1A, 0x02, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x1D, 0x0E, DoorType.Door, null/+&DoorEntry640+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x10, DoorType.Door, null/+&DoorEntry591+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry592+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry593+/), DoorConfig(0x17, 0x05, DoorType.Door, null/+&DoorEntry594+/)]),
	SectorDoors(4, [DoorConfig(0x1A, 0x09, DoorType.Door, null/+&DoorEntry595+/), DoorConfig(0x1A, 0x11, DoorType.Door, null/+&DoorEntry596+/), DoorConfig(0x1A, 0x19, DoorType.Door, null/+&DoorEntry675+/), DoorConfig(0x1A, 0x1D, DoorType.Door, null/+&DoorEntry675+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x0A, DoorType.Door, null/+&DoorEntry597+/), DoorConfig(0x1A, 0x09, DoorType.Door, null/+&DoorEntry598+/), DoorConfig(0x1A, 0x11, DoorType.Door, null/+&DoorEntry599+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry600+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry601+/), DoorConfig(0x19, 0x0A, DoorType.Door, null/+&DoorEntry602+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.Door, null/+&DoorEntry524+/), DoorConfig(0x07, 0x0D, DoorType.Door, null/+&DoorEntry525+/), DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry526+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry507+/), DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry508+/)]),
	SectorDoors(8, [DoorConfig(0x02, 0x15, DoorType.Door, null/+&DoorEntry503+/), DoorConfig(0x03, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry972+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry973+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.Door, null/+&DoorEntry536+/), DoorConfig(0x07, 0x15, DoorType.Door, null/+&DoorEntry537+/), DoorConfig(0x09, 0x1A, DoorType.Door, null/+&DoorEntry538+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry425+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry426+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.Door, null/+&DoorEntry494+/), DoorConfig(0x09, 0x16, DoorType.Door, null/+&DoorEntry494+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x05, DoorType.Door, null/+&DoorEntry545+/), DoorConfig(0x09, 0x16, DoorType.Door, null/+&DoorEntry546+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry969+/)]),
	SectorDoors(1, [DoorConfig(0x13, 0x18, DoorType.Door, null/+&DoorEntry943+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0B, 0x14, DoorType.Door, null/+&DoorEntry944+/), DoorConfig(0x0B, 0x15, DoorType.Door, null/+&DoorEntry944+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x05, 0x0B, DoorType.Door, null/+&DoorEntry164+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x16, DoorType.Door, null/+&DoorEntry791+/), DoorConfig(0x0A, 0x0D, DoorType.Stairway, 0x0200)]),
	SectorDoors(1, [DoorConfig(0x0A, 0x0E, DoorType.Door, null/+&DoorEntry932+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.Door, null/+&DoorEntry123+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry443+/)]),
	SectorDoors(3, [DoorConfig(0x08, 0x0D, DoorType.Door, null/+&DoorEntry399+/), DoorConfig(0x19, 0x12, DoorType.Door, null/+&DoorEntry812+/)]),
	SectorDoors(9, [DoorConfig(0x02, 0x16, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x02, 0x1C, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x0E, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x14, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x1A, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x0A, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x10, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x16, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x1C, DoorType.Person, null/+&DoorEntry681+/)]),
	SectorDoors(13, [DoorConfig(0x02, 0x02, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x02, 0x08, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x02, 0x18, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x02, 0x1E, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x00, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x06, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x0C, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x14, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x1A, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x02, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x08, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x18, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x1E, DoorType.Person, null/+&DoorEntry681+/)]),
	SectorDoors(10, [DoorConfig(0x02, 0x04, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x02, 0x0A, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x00, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x06, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x0C, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x12, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x04, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x0A, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x10, DoorType.Person, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x16, DoorType.Person, null/+&DoorEntry681+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry603+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x09, DoorType.Door, null/+&DoorEntry605+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x02, DoorType.Door, null/+&DoorEntry604+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry606+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry607+/), DoorConfig(0x17, 0x11, DoorType.Door, null/+&DoorEntry608+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry609+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry610+/)]),
	SectorDoors(3, [DoorConfig(0x09, 0x0E, DoorType.Door, null/+&DoorEntry527+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry509+/), DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry510+/)]),
	SectorDoors(3, [DoorConfig(0x05, 0x00, DoorType.Door, null/+&DoorEntry411+/), DoorConfig(0x05, 0x06, DoorType.Stairway, 0x0300), DoorConfig(0x09, 0x0A, DoorType.Stairway, 0)]),
	SectorDoors(3, [DoorConfig(0x09, 0x0E, DoorType.Door, null/+&DoorEntry539+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry518+/), DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry517+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.Door, null/+&DoorEntry495+/), DoorConfig(0x09, 0x16, DoorType.Door, null/+&DoorEntry495+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.Door, null/+&DoorEntry541+/), DoorConfig(0x07, 0x0D, DoorType.Door, null/+&DoorEntry542+/), DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry543+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry427+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry428+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x0D, DoorType.Door, null/+&DoorEntry496+/), DoorConfig(0x0D, 0x0E, DoorType.Door, null/+&DoorEntry496+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x14, DoorType.Door, null/+&DoorEntry947+/), DoorConfig(0x1B, 0x15, DoorType.Door, null/+&DoorEntry947+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x19, DoorType.Door, null/+&DoorEntry165+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x19, DoorType.Door, null/+&DoorEntry166+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1B, DoorType.Door, null/+&DoorEntry179+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1D, 0x05, DoorType.Door, null/+&DoorEntry792+/), DoorConfig(0x1D, 0x0E, DoorType.Stairway, 0x0100)]),
	SectorDoors(2, [DoorConfig(0x05, 0x12, DoorType.Stairway, 0x0100), DoorConfig(0x06, 0x05, DoorType.Stairway, 0x0200)]),
	SectorDoors(2, [DoorConfig(0x1A, 0x01, DoorType.Door, null/+&DoorEntry915+/), DoorConfig(0x1A, 0x02, DoorType.Door, null/+&DoorEntry915+/)]),
	SectorDoors(1, [DoorConfig(0x05, 0x05, DoorType.Door, null/+&DoorEntry749+/)]),
	SectorDoors(10, [DoorConfig(0x0D, 0x08, DoorType.Object, null/+&DoorEntry876+/), DoorConfig(0x11, 0x05, DoorType.Door, null/+&DoorEntry832+/), DoorConfig(0x11, 0x06, DoorType.Door, null/+&DoorEntry832+/), DoorConfig(0x16, 0x15, DoorType.Door, null/+&DoorEntry833+/), DoorConfig(0x17, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x18, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x19, 0x0A, DoorType.Object, null/+&DoorEntry877+/), DoorConfig(0x19, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1A, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1B, 0x15, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(1, [DoorConfig(0x15, 0x06, DoorType.Object, null/+&DoorEntry878+/)]),
	SectorDoors(1, [DoorConfig(0x0C, 0x02, DoorType.Door, null/+&DoorEntry611+/)]),
	SectorDoors(2, [DoorConfig(0x0B, 0x13, DoorType.Escalator, 0x0300), DoorConfig(0x0E, 0x10, DoorType.Escalator, 0x8000)]),
	SectorDoors(1, [DoorConfig(0x1E, 0x06, DoorType.Escalator, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x07, 0x0D, DoorType.Object, null/+&DoorEntry676+/), DoorConfig(0x07, 0x12, DoorType.Door, null/+&DoorEntry612+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry613+/), DoorConfig(0x17, 0x11, DoorType.Door, null/+&DoorEntry614+/), DoorConfig(0x17, 0x1D, DoorType.Door, null/+&DoorEntry615+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0E, DoorType.Object, null/+&DoorEntry677+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry616+/), DoorConfig(0x1D, 0x0E, DoorType.Door, null/+&DoorEntry617+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry618+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry619+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry620+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.Door, null/+&DoorEntry528+/), DoorConfig(0x07, 0x09, DoorType.Door, null/+&DoorEntry529+/), DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry530+/), DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry511+/), DoorConfig(0x1B, 0x01, DoorType.Door, null/+&DoorEntry512+/)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x00, DoorType.Door, null/+&DoorEntry412+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry519+/)]),
	SectorDoors(3, [DoorConfig(0x05, 0x19, DoorType.Door, null/+&DoorEntry497+/), DoorConfig(0x05, 0x1A, DoorType.Door, null/+&DoorEntry497+/), DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry520+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x0E, DoorType.Door, null/+&DoorEntry544+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0F, 0x13, DoorType.Object, null/+&DoorEntry241+/), DoorConfig(0x0F, 0x15, DoorType.Object, null/+&DoorEntry241+/)]),
	SectorDoors(2, [DoorConfig(0x0E, 0x0B, DoorType.Door, null/+&DoorEntry167+/), DoorConfig(0x0E, 0x1C, DoorType.Door, null/+&DoorEntry168+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x12, DoorType.Door, null/+&DoorEntry169+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x10, 0x16, DoorType.Door, null/+&DoorEntry170+/), DoorConfig(0x11, 0x01, DoorType.Object, null/+&DoorEntry243+/), DoorConfig(0x11, 0x03, DoorType.Object, null/+&DoorEntry243+/), DoorConfig(0x11, 0x04, DoorType.Object, null/+&DoorEntry243+/), DoorConfig(0x11, 0x06, DoorType.Object, null/+&DoorEntry243+/)]),
	SectorDoors(5, [DoorConfig(0x1A, 0x09, DoorType.Object, null/+&DoorEntry244+/), DoorConfig(0x1A, 0x0B, DoorType.Object, null/+&DoorEntry244+/), DoorConfig(0x1A, 0x0C, DoorType.Object, null/+&DoorEntry244+/), DoorConfig(0x1A, 0x0E, DoorType.Object, null/+&DoorEntry244+/), DoorConfig(0x1A, 0x13, DoorType.Door, null/+&DoorEntry180+/)]),
	SectorDoors(2, [DoorConfig(0x1B, 0x01, DoorType.Object, null/+&DoorEntry245+/), DoorConfig(0x1B, 0x02, DoorType.Object, null/+&DoorEntry245+/)]),
	SectorDoors(0, []),
	SectorDoors(15, [DoorConfig(0x03, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x09, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x1D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x09, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x1D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x09, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x1D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x09, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x1D, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x0E, DoorType.Door, null/+&DoorEntry916+/), DoorConfig(0x1E, 0x02, DoorType.Door, null/+&DoorEntry917+/), DoorConfig(0x1E, 0x0D, DoorType.Door, null/+&DoorEntry918+/)]),
	SectorDoors(12, [DoorConfig(0x0E, 0x11, DoorType.Door, null/+&DoorEntry919+/), DoorConfig(0x0F, 0x09, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x09, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x09, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x02, DoorType.Door, null/+&DoorEntry920+/), DoorConfig(0x12, 0x09, DoorType.RopeLadder, 0x8000), DoorConfig(0x17, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x18, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x19, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1A, 0x05, DoorType.Door, null/+&DoorEntry921+/), DoorConfig(0x1A, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1F, 0x05, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(4, [DoorConfig(0x1B, 0x01, DoorType.RopeLadder, 0x8000), DoorConfig(0x1C, 0x01, DoorType.RopeLadder, 0x8000), DoorConfig(0x1D, 0x01, DoorType.RopeLadder, 0x8000), DoorConfig(0x1E, 0x01, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(5, [DoorConfig(0x01, 0x1D, DoorType.Door, null/+&DoorEntry834+/), DoorConfig(0x01, 0x1E, DoorType.Door, null/+&DoorEntry834+/), DoorConfig(0x02, 0x12, DoorType.Object, null/+&DoorEntry879+/), DoorConfig(0x15, 0x09, DoorType.Object, null/+&DoorEntry880+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x11, DoorType.Door, null/+&DoorEntry835+/), DoorConfig(0x01, 0x12, DoorType.Door, null/+&DoorEntry835+/), DoorConfig(0x0D, 0x0E, DoorType.Object, null/+&DoorEntry881+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1A, 0x11, DoorType.Escalator, 0x8000), DoorConfig(0x1D, 0x14, DoorType.Escalator, 0x0100)]),
	SectorDoors(3, [DoorConfig(0x01, 0x03, DoorType.Escalator, 0), DoorConfig(0x07, 0x04, DoorType.Escalator, 0x0200), DoorConfig(0x0A, 0x07, DoorType.Escalator, 0x8000)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x1C, DoorType.Door, null/+&DoorEntry621+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry622+/), DoorConfig(0x17, 0x12, DoorType.Object, null/+&DoorEntry680+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry641+/)]),
	SectorDoors(4, [DoorConfig(0x0B, 0x05, DoorType.Door, null/+&DoorEntry623+/), DoorConfig(0x0B, 0x0D, DoorType.Object, null/+&DoorEntry678+/), DoorConfig(0x0B, 0x11, DoorType.Door, null/+&DoorEntry624+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry625+/)]),
	SectorDoors(3, [DoorConfig(0x06, 0x0D, DoorType.Door, null/+&DoorEntry626+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry627+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry628+/)]),
	SectorDoors(3, [DoorConfig(0x05, 0x0A, DoorType.Door, null/+&DoorEntry531+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry514+/), DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry513+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry971+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry540+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1F, 0x09, DoorType.Door, null/+&DoorEntry172+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x06, 0x0A, DoorType.Door, null/+&DoorEntry239+/), DoorConfig(0x0E, 0x02, DoorType.Door, null/+&DoorEntry178+/)]),
	SectorDoors(0, []),
	SectorDoors(10, [DoorConfig(0x03, 0x1D, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x1D, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x1D, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x1D, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x12, DoorType.Door, null/+&DoorEntry922+/), DoorConfig(0x0F, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x05, DoorType.Door, null/+&DoorEntry923+/), DoorConfig(0x11, 0x19, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x19, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(6, [DoorConfig(0x02, 0x1D, DoorType.Door, null/+&DoorEntry924+/), DoorConfig(0x03, 0x11, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x11, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x11, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x11, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x16, DoorType.Door, null/+&DoorEntry925+/)]),
	SectorDoors(10, [DoorConfig(0x00, 0x05, DoorType.RopeLadder, 0x8000), DoorConfig(0x01, 0x05, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x05, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x1D, DoorType.Door, null/+&DoorEntry926+/), DoorConfig(0x06, 0x0E, DoorType.Door, null/+&DoorEntry927+/), DoorConfig(0x0B, 0x11, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x11, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x11, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x11, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x0D, DoorType.Door, null/+&DoorEntry928+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x09, DoorType.Door, null/+&DoorEntry757+/), DoorConfig(0x19, 0x0A, DoorType.Door, null/+&DoorEntry757+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x01, 0x04, DoorType.Door, null/+&DoorEntry629+/)]),
	SectorDoors(2, [DoorConfig(0x03, 0x13, DoorType.Escalator, 0x0300), DoorConfig(0x06, 0x10, DoorType.Escalator, 0x8000)]),
	SectorDoors(2, [DoorConfig(0x16, 0x06, DoorType.Escalator, 0x8000), DoorConfig(0x19, 0x03, DoorType.Escalator, 0)]),
	SectorDoors(3, [DoorConfig(0x16, 0x17, DoorType.Door, null/+&DoorEntry630+/), DoorConfig(0x17, 0x18, DoorType.Door, null/+&DoorEntry630+/), DoorConfig(0x18, 0x19, DoorType.Door, null/+&DoorEntry630+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry642+/), DoorConfig(0x1B, 0x0D, DoorType.Door, null/+&DoorEntry643+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry644+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry631+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry632+/)]),
	SectorDoors(5, [DoorConfig(0x0A, 0x1A, DoorType.Door, null/+&DoorEntry823+/), DoorConfig(0x1C, 0x00, DoorType.Door, null/+&DoorEntry646+/), DoorConfig(0x1D, 0x00, DoorType.Door, null/+&DoorEntry646+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry647+/), DoorConfig(0x1E, 0x00, DoorType.Door, null/+&DoorEntry646+/)]),
	SectorDoors(3, [DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry532+/), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry516+/), DoorConfig(0x19, 0x1E, DoorType.Door, null/+&DoorEntry515+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x0A, DoorType.Door, null/+&DoorEntry421+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry422+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x16, DoorType.Door, null/+&DoorEntry547+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1A, 0x1A, DoorType.Door, null/+&DoorEntry498+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x12, 0x09, DoorType.Door, null/+&DoorEntry176+/), DoorConfig(0x16, 0x1F, DoorType.Door, null/+&DoorEntry175+/)]),
	SectorDoors(1, [DoorConfig(0x15, 0x15, DoorType.Door, null/+&DoorEntry174+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x18, 0x06, DoorType.Door, null/+&DoorEntry181+/)]),
	SectorDoors(21, [DoorConfig(0x00, 0x14, DoorType.Door, null/+&DoorEntry117+/), DoorConfig(0x01, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x08, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x0A, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x0B, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x0C, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x0D, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x0E, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x0F, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x10, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x14, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry118+/)]),
	SectorDoors(13, [DoorConfig(0x03, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x1F, 0x0F, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(2, [DoorConfig(0x10, 0x12, DoorType.Door, null/+&DoorEntry884+/), DoorConfig(0x10, 0x13, DoorType.Door, null/+&DoorEntry884+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x04, DoorType.Escalator, 0x0200), DoorConfig(0x1E, 0x07, DoorType.Escalator, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry450+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0B, 0x08, DoorType.Door, null/+&DoorEntry780+/), DoorConfig(0x19, 0x1B, DoorType.Door, null/+&DoorEntry451+/)]),
	SectorDoors(1, [DoorConfig(0x1F, 0x1B, DoorType.Door, null/+&DoorEntry463+/)]),
	SectorDoors(14, [DoorConfig(0x12, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x15, DoorType.Door, null/+&DoorEntry467+/), DoorConfig(0x15, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x18, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x19, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x1A, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x1B, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x1C, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x1D, 0x05, DoorType.RopeLadder, 0), DoorConfig(0x1F, 0x15, DoorType.RopeLadder, 0)]),
	SectorDoors(1, [DoorConfig(0x10, 0x05, DoorType.Door, null/+&DoorEntry472+/)]),
	SectorDoors(2, [DoorConfig(0x17, 0x10, DoorType.Door, null/+&DoorEntry946+/), DoorConfig(0x17, 0x11, DoorType.Door, null/+&DoorEntry946+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x0A, 0x05, DoorType.Object, null/+&DoorEntry242+/), DoorConfig(0x0A, 0x07, DoorType.Object, null/+&DoorEntry242+/), DoorConfig(0x0A, 0x08, DoorType.Object, null/+&DoorEntry242+/), DoorConfig(0x0A, 0x0A, DoorType.Object, null/+&DoorEntry242+/), DoorConfig(0x0E, 0x17, DoorType.Door, null/+&DoorEntry171+/), DoorConfig(0x16, 0x0F, DoorType.Door, null/+&DoorEntry173+/)]),
	SectorDoors(3, [DoorConfig(0x0F, 0x12, DoorType.Object, null/+&DoorEntry246+/), DoorConfig(0x0F, 0x14, DoorType.Object, null/+&DoorEntry246+/), DoorConfig(0x16, 0x1D, DoorType.Door, null/+&DoorEntry177+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry758+/)]),
	SectorDoors(16, [DoorConfig(0x00, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x01, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x0F, DoorType.RopeLadder, 0x8000), DoorConfig(0x16, 0x1E, DoorType.Door, null/+&DoorEntry759+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x0E, 0x11, DoorType.Escalator, 0x8000), DoorConfig(0x11, 0x14, DoorType.Escalator, 0x0100), DoorConfig(0x17, 0x13, DoorType.Escalator, 0x0300), DoorConfig(0x1A, 0x10, DoorType.Escalator, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x07, 0x19, DoorType.Door, null/+&DoorEntry187+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry188+/), DoorConfig(0x17, 0x11, DoorType.Door, null/+&DoorEntry230+/), DoorConfig(0x17, 0x12, DoorType.Door, null/+&DoorEntry230+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry231+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry232+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.Door, null/+&DoorEntry189+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry193+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry191+/)]),
	SectorDoors(10, [DoorConfig(0x02, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x18, DoorType.Door, null/+&DoorEntry465+/), DoorConfig(0x06, 0x1B, DoorType.RopeLadder, 0), DoorConfig(0x0F, 0x15, DoorType.Door, null/+&DoorEntry466+/), DoorConfig(0x10, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x15, DoorType.RopeLadder, 0)]),
	SectorDoors(7, [DoorConfig(0x00, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x01, 0x15, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x0D, DoorType.Door, null/+&DoorEntry464+/), DoorConfig(0x0B, 0x05, DoorType.Door, null/+&DoorEntry471+/), DoorConfig(0x0F, 0x1D, DoorType.RopeLadder, 0), DoorConfig(0x10, 0x1D, DoorType.RopeLadder, 0), DoorConfig(0x11, 0x1D, DoorType.RopeLadder, 0)]),
	SectorDoors(6, [DoorConfig(0x00, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x01, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x01, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x01, DoorType.RopeLadder, 0)]),
	SectorDoors(2, [DoorConfig(0x17, 0x0C, DoorType.Door, null/+&DoorEntry945+/), DoorConfig(0x17, 0x0D, DoorType.Door, null/+&DoorEntry945+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x02, 0x0D, DoorType.Door, null/+&DoorEntry240+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x14, 0x18, DoorType.Door, null/+&DoorEntry249+/)]),
	SectorDoors(2, [DoorConfig(0x17, 0x0D, DoorType.Object, null/+&DoorEntry274+/), DoorConfig(0x17, 0x0E, DoorType.Object, null/+&DoorEntry274+/)]),
	SectorDoors(1, [DoorConfig(0x17, 0x17, DoorType.Door, null/+&DoorEntry250+/)]),
	SectorDoors(1, [DoorConfig(0x17, 0x02, DoorType.Door, null/+&DoorEntry251+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry781+/)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry192+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x06, DoorType.Escalator, 0x8000), DoorConfig(0x0D, 0x03, DoorType.Escalator, 0), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry190+/)]),
	SectorDoors(4, [DoorConfig(0x0A, 0x0B, DoorType.Door, null/+&DoorEntry194+/), DoorConfig(0x0B, 0x0C, DoorType.Door, null/+&DoorEntry194+/), DoorConfig(0x0C, 0x0D, DoorType.Door, null/+&DoorEntry194+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry195+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry197+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry233+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.Door, null/+&DoorEntry196+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry198+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry234+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x1B, DoorType.Door, null/+&DoorEntry468+/)]),
	SectorDoors(1, [DoorConfig(0x03, 0x17, DoorType.Door, null/+&DoorEntry469+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x00, 0x1E, DoorType.Door, null/+&DoorEntry343+/), DoorConfig(0x01, 0x1E, DoorType.Door, null/+&DoorEntry343+/), DoorConfig(0x02, 0x1E, DoorType.Door, null/+&DoorEntry343+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x00, 0x09, DoorType.Door, null/+&DoorEntry344+/), DoorConfig(0x01, 0x09, DoorType.Door, null/+&DoorEntry344+/), DoorConfig(0x02, 0x09, DoorType.Door, null/+&DoorEntry344+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x02, 0x17, DoorType.Door, null/+&DoorEntry252+/), DoorConfig(0x1B, 0x1F, DoorType.Door, null/+&DoorEntry253+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x04, 0x0E, DoorType.Door, null/+&DoorEntry254+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry199+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry782+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x04, DoorType.Door, null/+&DoorEntry201+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry200+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry202+/)]),
	SectorDoors(4, [DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry750+/), DoorConfig(0x1B, 0x09, DoorType.Door, null/+&DoorEntry203+/), DoorConfig(0x1B, 0x11, DoorType.Door, null/+&DoorEntry204+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry205+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry206+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry207+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x1B, DoorType.Door, null/+&DoorEntry953+/), DoorConfig(0x19, 0x12, DoorType.Door, null/+&DoorEntry751+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry208+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry209+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry210+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry211+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry954+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x19, DoorType.Door, null/+&DoorEntry470+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x12, 0x1D, DoorType.Door, null/+&DoorEntry103+/), DoorConfig(0x12, 0x1E, DoorType.Door, null/+&DoorEntry103+/), DoorConfig(0x1C, 0x11, DoorType.Door, null/+&DoorEntry104+/)]),
	SectorDoors(2, [DoorConfig(0x0E, 0x19, DoorType.Door, null/+&DoorEntry105+/), DoorConfig(0x0E, 0x1A, DoorType.Door, null/+&DoorEntry105+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x14, 0x02, DoorType.Door, null/+&DoorEntry283+/), DoorConfig(0x14, 0x03, DoorType.Door, null/+&DoorEntry283+/)]),
	SectorDoors(1, [DoorConfig(0x03, 0x19, DoorType.Door, null/+&DoorEntry255+/)]),
	SectorDoors(3, [DoorConfig(0x17, 0x0A, DoorType.Door, null/+&DoorEntry256+/), DoorConfig(0x1D, 0x15, DoorType.Object, null/+&DoorEntry275+/), DoorConfig(0x1D, 0x16, DoorType.Object, null/+&DoorEntry275+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x02, DoorType.Door, null/+&DoorEntry257+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(7, [DoorConfig(0x03, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x0D, DoorType.Door, null/+&DoorEntry473+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry783+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x11, DoorType.Door, null/+&DoorEntry212+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry213+/), DoorConfig(0x1A, 0x04, DoorType.Door, null/+&DoorEntry214+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry215+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry752+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry216+/)]),
	SectorDoors(3, [DoorConfig(0x09, 0x0D, DoorType.Door, null/+&DoorEntry474+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry217+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry218+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x1B, DoorType.Door, null/+&DoorEntry955+/), DoorConfig(0x19, 0x16, DoorType.Door, null/+&DoorEntry753+/)]),
	SectorDoors(7, [DoorConfig(0x03, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x06, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x07, 0x09, DoorType.RopeLadder, 0), DoorConfig(0x09, 0x0D, DoorType.Door, null/+&DoorEntry475+/), DoorConfig(0x1D, 0x16, DoorType.Door, null/+&DoorEntry219+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry220+/), DoorConfig(0x1A, 0x17, DoorType.Door, null/+&DoorEntry956+/)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x12, 0x11, DoorType.Door, null/+&DoorEntry504+/), DoorConfig(0x13, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x16, 0x11, DoorType.RopeLadder, 0), DoorConfig(0x17, 0x11, DoorType.RopeLadder, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x19, 0x08, DoorType.Object, null/+&DoorEntry882+/), DoorConfig(0x1D, 0x05, DoorType.Door, null/+&DoorEntry836+/), DoorConfig(0x1D, 0x06, DoorType.Door, null/+&DoorEntry836+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(14, [DoorConfig(0x0A, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x0F, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x1D, DoorType.Door, null/+&DoorEntry106+/), DoorConfig(0x12, 0x1E, DoorType.Door, null/+&DoorEntry106+/), DoorConfig(0x13, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x14, 0x16, DoorType.RopeLadder, 0x8000), DoorConfig(0x15, 0x16, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(10, [DoorConfig(0x00, 0x1C, DoorType.Door, null/+&DoorEntry326+/), DoorConfig(0x01, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x02, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x03, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x04, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x05, 0x15, DoorType.Stairway, 0x0200), DoorConfig(0x0D, 0x0D, DoorType.Stairway, 0x0100), DoorConfig(0x11, 0x0A, DoorType.Stairway, 0x0300), DoorConfig(0x1D, 0x16, DoorType.Stairway, 0), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry327+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x10, DoorType.Door, null/+&DoorEntry284+/), DoorConfig(0x12, 0x10, DoorType.Door, null/+&DoorEntry284+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x0A, DoorType.Door, null/+&DoorEntry754+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x15, DoorType.Door, null/+&DoorEntry221+/)]),
	SectorDoors(2, [DoorConfig(0x0F, 0x09, DoorType.Door, null/+&DoorEntry222+/), DoorConfig(0x15, 0x1A, DoorType.Door, null/+&DoorEntry223+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.Door, null/+&DoorEntry755+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x1A, DoorType.Door, null/+&DoorEntry756+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x12, DoorType.Object, null/+&DoorEntry247+/), DoorConfig(0x1B, 0x14, DoorType.Object, null/+&DoorEntry247+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x09, 0x0C, DoorType.Object, null/+&DoorEntry883+/), DoorConfig(0x09, 0x19, DoorType.Door, null/+&DoorEntry837+/), DoorConfig(0x09, 0x1A, DoorType.Door, null/+&DoorEntry837+/), DoorConfig(0x0D, 0x09, DoorType.Door, null/+&DoorEntry838+/), DoorConfig(0x0D, 0x0A, DoorType.Door, null/+&DoorEntry838+/)]),
	SectorDoors(13, [DoorConfig(0x02, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x12, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x05, DoorType.Door, null/+&DoorEntry107+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x06, 0x09, DoorType.Door, null/+&DoorEntry108+/), DoorConfig(0x06, 0x0A, DoorType.Door, null/+&DoorEntry108+/)]),
	SectorDoors(1, [DoorConfig(0x14, 0x1A, DoorType.Door, null/+&DoorEntry109+/)]),
	SectorDoors(1, [DoorConfig(0x14, 0x05, DoorType.Door, null/+&DoorEntry405+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x18, 0x1E, DoorType.Door, null/+&DoorEntry406+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x05, DoorType.Door, null/+&DoorEntry804+/), DoorConfig(0x0A, 0x12, DoorType.Stairway, 0x0300)]),
	SectorDoors(2, [DoorConfig(0x1D, 0x05, DoorType.Stairway, 0), DoorConfig(0x1E, 0x0E, DoorType.Stairway, 0x0300)]),
	SectorDoors(2, [DoorConfig(0x15, 0x0D, DoorType.Door, null/+&DoorEntry763+/), DoorConfig(0x15, 0x0E, DoorType.Door, null/+&DoorEntry763+/)]),
	SectorDoors(3, [DoorConfig(0x16, 0x1E, DoorType.Door, null/+&DoorEntry764+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0E, 0x10, DoorType.Door, null/+&DoorEntry285+/), DoorConfig(0x0F, 0x10, DoorType.Door, null/+&DoorEntry285+/)]),
	SectorDoors(6, [DoorConfig(0x07, 0x19, DoorType.Door, null/+&DoorEntry286+/), DoorConfig(0x09, 0x1D, DoorType.Object, null/+&DoorEntry364+/), DoorConfig(0x09, 0x1E, DoorType.Object, null/+&DoorEntry364+/), DoorConfig(0x1F, 0x15, DoorType.Object, null/+&DoorEntry363+/), DoorConfig(0x1F, 0x16, DoorType.Object, null/+&DoorEntry363+/), DoorConfig(0x1F, 0x18, DoorType.Object, null/+&DoorEntry363+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x09, DoorType.Door, null/+&DoorEntry235+/)]),
	SectorDoors(1, [DoorConfig(0x15, 0x1A, DoorType.Door, null/+&DoorEntry236+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0D, 0x0A, DoorType.Door, null/+&DoorEntry224+/)]),
	SectorDoors(6, [DoorConfig(0x18, 0x06, DoorType.Door, null/+&DoorEntry550+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry550+/), DoorConfig(0x1A, 0x04, DoorType.Door, null/+&DoorEntry550+/), DoorConfig(0x1B, 0x03, DoorType.Door, null/+&DoorEntry550+/), DoorConfig(0x1C, 0x02, DoorType.Door, null/+&DoorEntry550+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry550+/)]),
	SectorDoors(7, [DoorConfig(0x0D, 0x0A, DoorType.Door, null/+&DoorEntry784+/), DoorConfig(0x18, 0x19, DoorType.Door, null/+&DoorEntry551+/), DoorConfig(0x19, 0x1A, DoorType.Door, null/+&DoorEntry551+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry551+/), DoorConfig(0x1B, 0x1C, DoorType.Door, null/+&DoorEntry551+/), DoorConfig(0x1C, 0x1D, DoorType.Door, null/+&DoorEntry551+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry551+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x00, 0x01, DoorType.Door, null/+&DoorEntry182+/), DoorConfig(0x01, 0x01, DoorType.Door, null/+&DoorEntry182+/), DoorConfig(0x02, 0x01, DoorType.Door, null/+&DoorEntry182+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1D, 0x0D, DoorType.Stairway, 0), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry805+/)]),
	SectorDoors(28, [DoorConfig(0x04, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0F, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x10, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x11, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x12, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x13, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x14, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x15, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x16, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x17, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x18, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x19, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1A, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1B, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1C, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1D, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1E, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x1F, 0x15, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.Door, null/+&DoorEntry349+/)]),
	SectorDoors(1, [DoorConfig(0x14, 0x15, DoorType.Door, null/+&DoorEntry350+/)]),
	SectorDoors(1, [DoorConfig(0x08, 0x05, DoorType.Door, null/+&DoorEntry351+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x12, 0x11, DoorType.Object, null/+&DoorEntry730+/), DoorConfig(0x12, 0x1D, DoorType.Object, null/+&DoorEntry731+/), DoorConfig(0x15, 0x05, DoorType.Door, null/+&DoorEntry703+/), DoorConfig(0x19, 0x0F, DoorType.Object, null/+&DoorEntry732+/), DoorConfig(0x19, 0x1B, DoorType.Object, null/+&DoorEntry733+/)]),
	SectorDoors(6, [DoorConfig(0x12, 0x09, DoorType.Object, null/+&DoorEntry734+/), DoorConfig(0x16, 0x1B, DoorType.Door, null/+&DoorEntry704+/), DoorConfig(0x17, 0x1B, DoorType.Door, null/+&DoorEntry704+/), DoorConfig(0x18, 0x1B, DoorType.Door, null/+&DoorEntry704+/), DoorConfig(0x19, 0x07, DoorType.Object, null/+&DoorEntry735+/), DoorConfig(0x19, 0x1B, DoorType.Door, null/+&DoorEntry704+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x18, DoorType.Door, null/+&DoorEntry705+/), DoorConfig(0x09, 0x09, DoorType.Door, null/+&DoorEntry706+/), DoorConfig(0x1C, 0x02, DoorType.Door, null/+&DoorEntry707+/)]),
	SectorDoors(2, [DoorConfig(0x07, 0x08, DoorType.Door, null/+&DoorEntry708+/), DoorConfig(0x1C, 0x1D, DoorType.Door, null/+&DoorEntry709+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x0E, DoorType.Object, null/+&DoorEntry248+/), DoorConfig(0x07, 0x11, DoorType.Door, null/+&DoorEntry225+/), DoorConfig(0x07, 0x1E, DoorType.Object, null/+&DoorEntry677+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry226+/), DoorConfig(0x19, 0x0A, DoorType.Door, null/+&DoorEntry227+/)]),
	SectorDoors(3, [DoorConfig(0x0C, 0x0E, DoorType.Door, null/+&DoorEntry228+/), DoorConfig(0x0D, 0x0E, DoorType.Door, null/+&DoorEntry228+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry229+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(16, [DoorConfig(0x00, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x01, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x02, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x03, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x04, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x05, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x06, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x07, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x08, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x09, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0A, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0B, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0C, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0D, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0E, 0x15, DoorType.RopeLadder, 0x8000), DoorConfig(0x0F, 0x15, DoorType.RopeLadder, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0F, 0x1E, DoorType.Object, null/+&DoorEntry356+/), DoorConfig(0x1B, 0x0D, DoorType.Door, null/+&DoorEntry352+/)]),
	SectorDoors(1, [DoorConfig(0x0F, 0x00, DoorType.Object, null/+&DoorEntry356+/)]),
	SectorDoors(3, [DoorConfig(0x01, 0x13, DoorType.Door, null/+&DoorEntry287+/), DoorConfig(0x15, 0x1B, DoorType.Door, null/+&DoorEntry288+/), DoorConfig(0x15, 0x1C, DoorType.Door, null/+&DoorEntry288+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x13, DoorType.Door, null/+&DoorEntry353+/)]),
	SectorDoors(6, [DoorConfig(0x03, 0x01, DoorType.Object, null/+&DoorEntry360+/), DoorConfig(0x03, 0x02, DoorType.Object, null/+&DoorEntry360+/), DoorConfig(0x0F, 0x0D, DoorType.Object, null/+&DoorEntry361+/), DoorConfig(0x0F, 0x0E, DoorType.Object, null/+&DoorEntry361+/), DoorConfig(0x0F, 0x10, DoorType.Object, null/+&DoorEntry361+/), DoorConfig(0x17, 0x09, DoorType.Door, null/+&DoorEntry289+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x0D, DoorType.Door, null/+&DoorEntry354+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry694+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry710+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x16, 0x0B, DoorType.Door, null/+&DoorEntry711+/), DoorConfig(0x18, 0x0D, DoorType.Door, null/+&DoorEntry711+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry695+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry712+/)]),
	SectorDoors(2, [DoorConfig(0x10, 0x15, DoorType.Door, null/+&DoorEntry713+/), DoorConfig(0x18, 0x1D, DoorType.Door, null/+&DoorEntry714+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x18, 0x0F, DoorType.Door, null/+&DoorEntry290+/), DoorConfig(0x19, 0x0F, DoorType.Door, null/+&DoorEntry290+/), DoorConfig(0x1A, 0x0F, DoorType.Door, null/+&DoorEntry290+/), DoorConfig(0x1B, 0x0F, DoorType.Door, null/+&DoorEntry290+/), DoorConfig(0x1C, 0x0F, DoorType.Door, null/+&DoorEntry290+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x05, DoorType.Door, null/+&DoorEntry291+/)]),
	SectorDoors(6, [DoorConfig(0x03, 0x14, DoorType.Object, null/+&DoorEntry357+/), DoorConfig(0x03, 0x16, DoorType.Object, null/+&DoorEntry357+/), DoorConfig(0x0D, 0x0D, DoorType.Door, null/+&DoorEntry292+/), DoorConfig(0x0D, 0x0E, DoorType.Door, null/+&DoorEntry292+/), DoorConfig(0x0D, 0x1C, DoorType.Door, null/+&DoorEntry293+/), DoorConfig(0x0D, 0x1D, DoorType.Door, null/+&DoorEntry293+/)]),
	SectorDoors(1, [DoorConfig(0x0C, 0x1F, DoorType.Door, null/+&DoorEntry294+/)]),
	SectorDoors(4, [DoorConfig(0x06, 0x1F, DoorType.Door, null/+&DoorEntry355+/), DoorConfig(0x0C, 0x01, DoorType.Door, null/+&DoorEntry294+/), DoorConfig(0x0D, 0x11, DoorType.Door, null/+&DoorEntry295+/), DoorConfig(0x0D, 0x12, DoorType.Door, null/+&DoorEntry295+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x10, 0x02, DoorType.Door, null/+&DoorEntry296+/), DoorConfig(0x16, 0x19, DoorType.Door, null/+&DoorEntry297+/)]),
	SectorDoors(5, [DoorConfig(0x18, 0x10, DoorType.Door, null/+&DoorEntry298+/), DoorConfig(0x19, 0x10, DoorType.Door, null/+&DoorEntry298+/), DoorConfig(0x1A, 0x10, DoorType.Door, null/+&DoorEntry298+/), DoorConfig(0x1B, 0x10, DoorType.Door, null/+&DoorEntry298+/), DoorConfig(0x1C, 0x10, DoorType.Door, null/+&DoorEntry298+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x11, DoorType.Door, null/+&DoorEntry299+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry300+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry301+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry715+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry716+/)]),
	SectorDoors(3, [DoorConfig(0x08, 0x12, DoorType.Object, null/+&DoorEntry347+/), DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry302+/), DoorConfig(0x1D, 0x16, DoorType.Door, null/+&DoorEntry303+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x0A, DoorType.Door, null/+&DoorEntry304+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry717+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry305+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry306+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0D, DoorType.Door, null/+&DoorEntry307+/), DoorConfig(0x07, 0x15, DoorType.Door, null/+&DoorEntry308+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry718+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.Door, null/+&DoorEntry309+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry310+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry487+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x13, 0x13, DoorType.Door, null/+&DoorEntry482+/)]),
	SectorDoors(2, [DoorConfig(0x14, 0x0A, DoorType.Door, null/+&DoorEntry485+/), DoorConfig(0x15, 0x09, DoorType.Door, null/+&DoorEntry486+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x01, DoorType.Door, null/+&DoorEntry800+/), DoorConfig(0x1A, 0x0E, DoorType.Stairway, 0x0300)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x07, 0x11, DoorType.Object, null/+&DoorEntry358+/), DoorConfig(0x07, 0x12, DoorType.Object, null/+&DoorEntry358+/)]),
	SectorDoors(4, [DoorConfig(0x03, 0x11, DoorType.Object, null/+&DoorEntry359+/), DoorConfig(0x03, 0x13, DoorType.Object, null/+&DoorEntry359+/), DoorConfig(0x03, 0x14, DoorType.Object, null/+&DoorEntry359+/), DoorConfig(0x03, 0x16, DoorType.Object, null/+&DoorEntry359+/)]),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x07, 0x0D, DoorType.Object, null/+&DoorEntry362+/), DoorConfig(0x07, 0x0F, DoorType.Object, null/+&DoorEntry362+/), DoorConfig(0x07, 0x10, DoorType.Object, null/+&DoorEntry362+/), DoorConfig(0x07, 0x12, DoorType.Object, null/+&DoorEntry362+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x12, DoorType.Door, null/+&DoorEntry909+/)]),
	SectorDoors(8, [DoorConfig(0x10, 0x1C, DoorType.Door, null/+&DoorEntry338+/), DoorConfig(0x11, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x12, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x13, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x14, 0x1C, DoorType.RopeLadder, 0), DoorConfig(0x15, 0x11, DoorType.Stairway, 0x0200), DoorConfig(0x1D, 0x00, DoorType.Door, null/+&DoorEntry339+/), DoorConfig(0x1D, 0x09, DoorType.Stairway, 0x0100)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry719+/), DoorConfig(0x17, 0x0A, DoorType.Object, null/+&DoorEntry677+/), DoorConfig(0x17, 0x12, DoorType.Door, null/+&DoorEntry696+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry698+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry697+/)]),
	SectorDoors(5, [DoorConfig(0x0C, 0x00, DoorType.Door, null/+&DoorEntry720+/), DoorConfig(0x0D, 0x00, DoorType.Door, null/+&DoorEntry720+/), DoorConfig(0x0D, 0x1E, DoorType.Door, null/+&DoorEntry721+/), DoorConfig(0x0E, 0x00, DoorType.Door, null/+&DoorEntry720+/), DoorConfig(0x1D, 0x16, DoorType.Door, null/+&DoorEntry311+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry722+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry699+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0D, DoorType.Door, null/+&DoorEntry723+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry724+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry312+/)]),
	SectorDoors(5, [DoorConfig(0x09, 0x12, DoorType.Door, null/+&DoorEntry725+/), DoorConfig(0x1B, 0x09, DoorType.Door, null/+&DoorEntry700+/), DoorConfig(0x1B, 0x0E, DoorType.Object, null/+&DoorEntry737+/), DoorConfig(0x1B, 0x11, DoorType.Door, null/+&DoorEntry701+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry702+/)]),
	SectorDoors(3, [DoorConfig(0x0B, 0x0D, DoorType.Object, null/+&DoorEntry736+/), DoorConfig(0x0D, 0x01, DoorType.Door, null/+&DoorEntry726+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry313+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1B, 0x0F, DoorType.Door, null/+&DoorEntry480+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1E, 0x16, DoorType.Object, null/+&DoorEntry490+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.Stairway, 0), DoorConfig(0x0D, 0x0E, DoorType.Door, null/+&DoorEntry801+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x12, 0x19, DoorType.Door, null/+&DoorEntry941+/), DoorConfig(0x12, 0x1A, DoorType.Door, null/+&DoorEntry941+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry727+/), DoorConfig(0x17, 0x0A, DoorType.Object, null/+&DoorEntry677+/), DoorConfig(0x17, 0x12, DoorType.Door, null/+&DoorEntry314+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry316+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry315+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry280+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry317+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry728+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry318+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x17, DoorType.Door, null/+&DoorEntry319+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x16, DoorType.Door, null/+&DoorEntry729+/), DoorConfig(0x1B, 0x09, DoorType.Door, null/+&DoorEntry320+/), DoorConfig(0x1B, 0x0E, DoorType.Object, null/+&DoorEntry348+/), DoorConfig(0x1B, 0x11, DoorType.Door, null/+&DoorEntry321+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry322+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Door, null/+&DoorEntry323+/), DoorConfig(0x1D, 0x1A, DoorType.Door, null/+&DoorEntry324+/)]),
	SectorDoors(0, []),
	SectorDoors(8, [DoorConfig(0x00, 0x10, DoorType.Door, null/+&DoorEntry481+/), DoorConfig(0x01, 0x10, DoorType.Door, null/+&DoorEntry481+/), DoorConfig(0x02, 0x10, DoorType.Door, null/+&DoorEntry481+/), DoorConfig(0x03, 0x10, DoorType.Door, null/+&DoorEntry481+/), DoorConfig(0x04, 0x10, DoorType.Door, null/+&DoorEntry481+/), DoorConfig(0x05, 0x10, DoorType.Door, null/+&DoorEntry481+/), DoorConfig(0x06, 0x10, DoorType.Door, null/+&DoorEntry481+/), DoorConfig(0x07, 0x10, DoorType.Door, null/+&DoorEntry481+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(8, [DoorConfig(0x00, 0x0F, DoorType.Door, null/+&DoorEntry488+/), DoorConfig(0x01, 0x0F, DoorType.Door, null/+&DoorEntry488+/), DoorConfig(0x02, 0x0F, DoorType.Door, null/+&DoorEntry488+/), DoorConfig(0x03, 0x0F, DoorType.Door, null/+&DoorEntry488+/), DoorConfig(0x04, 0x0F, DoorType.Door, null/+&DoorEntry488+/), DoorConfig(0x05, 0x0F, DoorType.Door, null/+&DoorEntry488+/), DoorConfig(0x06, 0x0F, DoorType.Door, null/+&DoorEntry488+/), DoorConfig(0x07, 0x0F, DoorType.Door, null/+&DoorEntry488+/)]),
	SectorDoors(14, [DoorConfig(0x00, 0x10, DoorType.Door, null/+&DoorEntry489+/), DoorConfig(0x01, 0x10, DoorType.Door, null/+&DoorEntry489+/), DoorConfig(0x02, 0x10, DoorType.Door, null/+&DoorEntry489+/), DoorConfig(0x03, 0x10, DoorType.Door, null/+&DoorEntry489+/), DoorConfig(0x04, 0x10, DoorType.Door, null/+&DoorEntry489+/), DoorConfig(0x05, 0x10, DoorType.Door, null/+&DoorEntry489+/), DoorConfig(0x06, 0x10, DoorType.Door, null/+&DoorEntry489+/), DoorConfig(0x07, 0x10, DoorType.Door, null/+&DoorEntry489+/), DoorConfig(0x18, 0x06, DoorType.Door, null/+&DoorEntry341+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry341+/), DoorConfig(0x1A, 0x04, DoorType.Door, null/+&DoorEntry341+/), DoorConfig(0x1B, 0x03, DoorType.Door, null/+&DoorEntry341+/), DoorConfig(0x1C, 0x02, DoorType.Door, null/+&DoorEntry341+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry341+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x18, 0x19, DoorType.Door, null/+&DoorEntry342+/), DoorConfig(0x19, 0x1A, DoorType.Door, null/+&DoorEntry342+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry342+/), DoorConfig(0x1B, 0x1C, DoorType.Door, null/+&DoorEntry342+/), DoorConfig(0x1C, 0x1D, DoorType.Door, null/+&DoorEntry342+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry342+/)]),
	SectorDoors(8, [DoorConfig(0x00, 0x0F, DoorType.Door, null/+&DoorEntry484+/), DoorConfig(0x01, 0x0F, DoorType.Door, null/+&DoorEntry484+/), DoorConfig(0x02, 0x0F, DoorType.Door, null/+&DoorEntry484+/), DoorConfig(0x03, 0x0F, DoorType.Door, null/+&DoorEntry484+/), DoorConfig(0x04, 0x0F, DoorType.Door, null/+&DoorEntry484+/), DoorConfig(0x05, 0x0F, DoorType.Door, null/+&DoorEntry484+/), DoorConfig(0x06, 0x0F, DoorType.Door, null/+&DoorEntry484+/), DoorConfig(0x07, 0x0F, DoorType.Door, null/+&DoorEntry484+/)]),
	SectorDoors(6, [DoorConfig(0x18, 0x06, DoorType.Door, null/+&DoorEntry237+/), DoorConfig(0x19, 0x05, DoorType.Door, null/+&DoorEntry237+/), DoorConfig(0x1A, 0x04, DoorType.Door, null/+&DoorEntry237+/), DoorConfig(0x1B, 0x03, DoorType.Door, null/+&DoorEntry237+/), DoorConfig(0x1C, 0x02, DoorType.Door, null/+&DoorEntry237+/), DoorConfig(0x1D, 0x01, DoorType.Door, null/+&DoorEntry237+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x05, 0x1A, DoorType.Door, null/+&DoorEntry340+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.Door, null/+&DoorEntry183+/), DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry184+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x01, DoorType.Door, null/+&DoorEntry185+/)]),
	SectorDoors(7, [DoorConfig(0x09, 0x1E, DoorType.Door, null/+&DoorEntry186+/), DoorConfig(0x18, 0x19, DoorType.Door, null/+&DoorEntry238+/), DoorConfig(0x19, 0x1A, DoorType.Door, null/+&DoorEntry238+/), DoorConfig(0x1A, 0x1B, DoorType.Door, null/+&DoorEntry238+/), DoorConfig(0x1B, 0x1C, DoorType.Door, null/+&DoorEntry238+/), DoorConfig(0x1C, 0x1D, DoorType.Door, null/+&DoorEntry238+/), DoorConfig(0x1D, 0x1E, DoorType.Door, null/+&DoorEntry238+/)]),
	SectorDoors(2, [DoorConfig(0x0F, 0x1C, DoorType.Door, null/+&DoorEntry325+/), DoorConfig(0x10, 0x1C, DoorType.Door, null/+&DoorEntry325+/)]),
	];

immutable DoorEntryA DoorEntry0 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_279 | EVENT_FLAG_UNSET,  0xC09A, 0x03B1, 0x04);
immutable DoorEntryA DoorEntry1 = DoorEntryA(TextDoor001, EventFlag.None,  0x010B, 0x0087, 0x01);
immutable DoorEntryA DoorEntry2 = DoorEntryA(null, EventFlag.None,  0x03EF, 0x0119, 0x01);
immutable DoorEntryA DoorEntry3 = DoorEntryA(null, EventFlag.None,  0x83FC, 0x00F3, 0x01);
immutable DoorEntryA DoorEntry4 = DoorEntryA(TextDoor004, EventFlag.None,  0xC434, 0x0158, 0x01);
immutable DoorEntryA DoorEntry5 = DoorEntryA(null, EventFlag.None,  0x80B9, 0x0367, 0x01);
immutable DoorEntryA DoorEntry6 = DoorEntryA(TextDoor006, EventFlag.UNKNOWN_06C | EVENT_FLAG_UNSET,  0xC0BA, 0x0375, 0x04);
immutable DoorEntryA DoorEntry7 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC0A9, 0x03F0, 0x01);
immutable DoorEntryA DoorEntry8 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC0BD, 0x03DC, 0x06);
immutable DoorEntryA DoorEntry9 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC03D, 0x03BC, 0x06);
immutable DoorEntryA DoorEntry10 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC02D, 0x03FC, 0x04);
immutable DoorEntryA DoorEntry11 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC04D, 0x03B8, 0x04);
immutable DoorEntryA DoorEntry12 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC06A, 0x03B1, 0x04);
immutable DoorEntryA DoorEntry13 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC04D, 0x03EC, 0x01);
immutable DoorEntryA DoorEntry14 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC0BD, 0x03FC, 0x01);
immutable DoorEntryA DoorEntry15 = DoorEntryA(TextDoor015, EventFlag.UNKNOWN_2EA | EVENT_FLAG_UNSET,  0xC0BA, 0x03B9, 0x04);
immutable DoorEntryA DoorEntry16 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC07D, 0x039C, 0x01);
immutable DoorEntryA DoorEntry17 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0x0056, 0x03D1, 0x04);
immutable DoorEntryA DoorEntry18 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC059, 0x03E4, 0x06);
immutable DoorEntryA DoorEntry19 = DoorEntryA(TextDoor019, EventFlag.UNKNOWN_278,  0xC031, 0x0384, 0x01);
immutable DoorEntryA DoorEntry20 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC0AD, 0x0398, 0x06);
immutable DoorEntryA DoorEntry21 = DoorEntryA(TextDoor021, EventFlag.UNKNOWN_1D4,  0xC06D, 0x0398, 0x04);
immutable DoorEntryA DoorEntry22 = DoorEntryA(TextDoor022, EventFlag.UNKNOWN_1DA,  0xC02A, 0x03CD, 0x04);
immutable DoorEntryA DoorEntry23 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC03D, 0x03F4, 0x01);
immutable DoorEntryA DoorEntry24 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC07A, 0x0371, 0x04);
immutable DoorEntryA DoorEntry25 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC09D, 0x03F8, 0x04);
immutable DoorEntryA DoorEntry26 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC08A, 0x03B9, 0x04);
immutable DoorEntryA DoorEntry27 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC09D, 0x0378, 0x04);
immutable DoorEntryA DoorEntry28 = DoorEntryA(TextDoor028, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0xC02A, 0x03CD, 0x00);
immutable DoorEntryA DoorEntry29 = DoorEntryA(TextDoor000, EventFlag.UNKNOWN_278,  0xC0AD, 0x03B4, 0x04);
immutable DoorEntryA DoorEntry30 = DoorEntryA(TextDoor030, EventFlag.None,  0x02E6, 0x008B, 0x01);
immutable DoorEntryA DoorEntry31 = DoorEntryA(null, EventFlag.None,  0x0048, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry32 = DoorEntryA(null, EventFlag.None,  0xC0AD, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry33 = DoorEntryA(null, EventFlag.None,  0xC0CD, 0x03FC, 0x07);
immutable DoorEntryA DoorEntry34 = DoorEntryA(null, EventFlag.UNKNOWN_026,  0x800D, 0x03E3, 0x07);
immutable DoorEntryA DoorEntry35 = DoorEntryA(TextDoor035, EventFlag.None,  0x80BD, 0x03E3, 0x01);
immutable DoorEntryA DoorEntry36 = DoorEntryA(null, EventFlag.None,  0x806D, 0x03C3, 0x0F);
immutable DoorEntryA DoorEntry37 = DoorEntryA(null, EventFlag.None,  0xC01A, 0x03B9, 0x07);
immutable DoorEntryA DoorEntry38 = DoorEntryA(null, EventFlag.None,  0x8031, 0x0363, 0x01);
immutable DoorEntryA DoorEntry39 = DoorEntryA(null, EventFlag.None,  0xC00D, 0x03FC, 0x01);
immutable DoorEntryA DoorEntry40 = DoorEntryA(null, EventFlag.None,  0x00D6, 0x00FC, 0x01);
immutable DoorEntryA DoorEntry41 = DoorEntryA(null, EventFlag.None,  0x807D, 0x03A3, 0x0F);
immutable DoorEntryA DoorEntry42 = DoorEntryA(null, EventFlag.None,  0x008E, 0x00D9, 0x0C);
immutable DoorEntryA DoorEntry43 = DoorEntryA(TextDoor043, EventFlag.UNKNOWN_1D3,  0x002B, 0x014B, 0x0A);
immutable DoorEntryA DoorEntry44 = DoorEntryA(null, EventFlag.None,  0xC08D, 0x037C, 0x07);
immutable DoorEntryA DoorEntry45 = DoorEntryA(null, EventFlag.None,  0xC0AD, 0x037C, 0x07);
immutable DoorEntryA DoorEntry46 = DoorEntryA(null, EventFlag.None,  0x805D, 0x0363, 0x0F);
immutable DoorEntryA DoorEntry47 = DoorEntryA(null, EventFlag.None,  0x00A1, 0x009A, 0x0A);
immutable DoorEntryA DoorEntry48 = DoorEntryA(TextDoor048, EventFlag.None,  0x006D, 0x010A, 0x01);
immutable DoorEntryA DoorEntry49 = DoorEntryA(null, EventFlag.None,  0x806D, 0x0363, 0x0F);
immutable DoorEntryA DoorEntry50 = DoorEntryA(null, EventFlag.None,  0xC06D, 0x03FC, 0x07);
immutable DoorEntryA DoorEntry51 = DoorEntryA(null, EventFlag.None,  0x803D, 0x03C3, 0x0F);
immutable DoorEntryA DoorEntry52 = DoorEntryA(null, EventFlag.None,  0x00AC, 0x0089, 0x0A);
immutable DoorEntryA DoorEntry53 = DoorEntryA(null, EventFlag.None,  0x007C, 0x03B1, 0x07);
immutable DoorEntryA DoorEntry54 = DoorEntryA(null, EventFlag.None,  0xC011, 0x0384, 0x07);
immutable DoorEntryA DoorEntry55 = DoorEntryA(null, EventFlag.None,  0xC06D, 0x03D4, 0x07);
immutable DoorEntryA DoorEntry56 = DoorEntryA(null, EventFlag.FLG_ONET_GUARDSHARK_DISAPPEAR | EVENT_FLAG_UNSET,  0x40D1, 0x00C5, 0x0A);
immutable DoorEntryA DoorEntry57 = DoorEntryA(null, EventFlag.None,  0x8079, 0x03E7, 0x0F);
immutable DoorEntryA DoorEntry58 = DoorEntryA(null, EventFlag.None,  0xC08D, 0x03DC, 0x07);
immutable DoorEntryA DoorEntry59 = DoorEntryA(null, EventFlag.None,  0x00A7, 0x00CF, 0x01);
immutable DoorEntryA DoorEntry60 = DoorEntryA(null, EventFlag.None,  0x00DA, 0x00C5, 0x0C);
immutable DoorEntryA DoorEntry61 = DoorEntryA(null, EventFlag.None,  0x804D, 0x0363, 0x0F);
immutable DoorEntryA DoorEntry62 = DoorEntryA(null, EventFlag.None,  0x008C, 0x0121, 0x0A);
immutable DoorEntryA DoorEntry63 = DoorEntryA(TextDoor063, EventFlag.None,  0x002C, 0x012B, 0x0A);
immutable DoorEntryA DoorEntry64 = DoorEntryA(null, EventFlag.None,  0xC09D, 0x0398, 0x07);
immutable DoorEntryA DoorEntry65 = DoorEntryA(null, EventFlag.None,  0x00D3, 0x008F, 0x01);
immutable DoorEntryA DoorEntry66 = DoorEntryA(null, EventFlag.None,  0x80BD, 0x0383, 0x0F);
immutable DoorEntryA DoorEntry67 = DoorEntryA(null, EventFlag.None,  0x00BC, 0x0085, 0x0A);
immutable DoorEntryA DoorEntry68 = DoorEntryA(null, EventFlag.None,  0xC05D, 0x03BC, 0x07);
immutable DoorEntryA DoorEntry69 = DoorEntryA(TextDoor069, EventFlag.None,  0x802A, 0x03A6, 0x0F);
immutable DoorEntryA DoorEntry70 = DoorEntryA(null, EventFlag.None,  0x808A, 0x03E6, 0x07);
immutable DoorEntryA DoorEntry71 = DoorEntryA(TextDoor071, EventFlag.None,  0x801D, 0x03C3, 0x0F);
immutable DoorEntryA DoorEntry72 = DoorEntryA(null, EventFlag.None,  0x804D, 0x03C3, 0x07);
immutable DoorEntryA DoorEntry73 = DoorEntryA(null, EventFlag.None,  0x00BC, 0x0389, 0x07);
immutable DoorEntryA DoorEntry74 = DoorEntryA(null, EventFlag.None,  0x0058, 0x0371, 0x07);
immutable DoorEntryA DoorEntry75 = DoorEntryA(null, EventFlag.None,  0x8059, 0x03C7, 0x0F);
immutable DoorEntryA DoorEntry76 = DoorEntryA(null, EventFlag.None,  0x0038, 0x03CD, 0x07);
immutable DoorEntryA DoorEntry77 = DoorEntryA(null, EventFlag.None,  0x00C8, 0x0131, 0x0A);
immutable DoorEntryA DoorEntry78 = DoorEntryA(null, EventFlag.None,  0x00B8, 0x03F1, 0x07);
immutable DoorEntryA DoorEntry79 = DoorEntryA(null, EventFlag.None,  0x0078, 0x0392, 0x07);
immutable DoorEntryA DoorEntry80 = DoorEntryA(null, EventFlag.None,  0x00B0, 0x0141, 0x0A);
immutable DoorEntryA DoorEntry81 = DoorEntryA(null, EventFlag.None,  0x0010, 0x00E5, 0x0A);
immutable DoorEntryA DoorEntry82 = DoorEntryA(TextDoor004, EventFlag.UNKNOWN_01F,  0x0361, 0x01F4, 0x01);
immutable DoorEntryA DoorEntry83 = DoorEntryA(null, EventFlag.None,  0x0048, 0x03E1, 0x07);
immutable DoorEntryA DoorEntry84 = DoorEntryA(null, EventFlag.None,  0x00BC, 0x0391, 0x07);
immutable DoorEntryA DoorEntry85 = DoorEntryA(TextDoor085, EventFlag.None,  0xC07D, 0x03BC, 0x07);
immutable DoorEntryA DoorEntry86 = DoorEntryA(null, EventFlag.None,  0x008C, 0x012D, 0x0A);
immutable DoorEntryA DoorEntry87 = DoorEntryA(null, EventFlag.None,  0x0038, 0x03D9, 0x07);
immutable DoorEntryA DoorEntry88 = DoorEntryA(null, EventFlag.None,  0x4043, 0x00B5, 0x01);
immutable DoorEntryA DoorEntry89 = DoorEntryA(null, EventFlag.None,  0x0048, 0x00B5, 0x0A);
immutable DoorEntryA DoorEntry90 = DoorEntryA(null, EventFlag.None,  0x00DA, 0x00E8, 0x0C);
immutable DoorEntryA DoorEntry91 = DoorEntryA(null, EventFlag.None,  0xC07D, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry92 = DoorEntryA(null, EventFlag.None,  0xC09D, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry93 = DoorEntryA(null, EventFlag.None,  0x807D, 0x0383, 0x0F);
immutable DoorEntryA DoorEntry94 = DoorEntryA(null, EventFlag.None,  0x011C, 0x00C5, 0x0A);
immutable DoorEntryA DoorEntry95 = DoorEntryA(null, EventFlag.None,  0x00DC, 0x0039, 0x0A);
immutable DoorEntryA DoorEntry96 = DoorEntryA(null, EventFlag.None,  0x0008, 0x03B1, 0x07);
immutable DoorEntryA DoorEntry97 = DoorEntryA(null, EventFlag.None,  0x008E, 0x00C8, 0x0C);
immutable DoorEntryA DoorEntry98 = DoorEntryA(null, EventFlag.None,  0x0053, 0x00FC, 0x01);
immutable DoorEntryA DoorEntry99 = DoorEntryA(null, EventFlag.None,  0xC089, 0x0388, 0x07);
immutable DoorEntryA DoorEntry100 = DoorEntryA(null, EventFlag.None,  0xC00D, 0x03CC, 0x01);
immutable DoorEntryA DoorEntry101 = DoorEntryA(TextDoor101, EventFlag.None,  0x00B2, 0x00FF, 0x01);
immutable DoorEntryA DoorEntry102 = DoorEntryA(null, EventFlag.None,  0x0008, 0x03BD, 0x07);
immutable DoorEntryA DoorEntry103 = DoorEntryA(null, EventFlag.None,  0xC139, 0x02F5, 0x01);
immutable DoorEntryA DoorEntry104 = DoorEntryA(null, EventFlag.None,  0x003B, 0x0085, 0x01);
immutable DoorEntryA DoorEntry105 = DoorEntryA(null, EventFlag.None,  0x003A, 0x009D, 0x01);
immutable DoorEntryA DoorEntry106 = DoorEntryA(null, EventFlag.None,  0xC2D9, 0x01D5, 0x01);
immutable DoorEntryA DoorEntry107 = DoorEntryA(null, EventFlag.None,  0xC2B9, 0x01D9, 0x01);
immutable DoorEntryA DoorEntry108 = DoorEntryA(null, EventFlag.None,  0xC279, 0x01F5, 0x01);
immutable DoorEntryA DoorEntry109 = DoorEntryA(TextDoor109, EventFlag.None,  0x003F, 0x00B1, 0x01);
immutable DoorEntryA DoorEntry110 = DoorEntryA(null, EventFlag.None,  0x0427, 0x0129, 0x01);
immutable DoorEntryA DoorEntry111 = DoorEntryA(null, EventFlag.None,  0x8430, 0x00E7, 0x01);
immutable DoorEntryA DoorEntry112 = DoorEntryA(null, EventFlag.None,  0x0413, 0x013D, 0x01);
immutable DoorEntryA DoorEntry113 = DoorEntryA(null, EventFlag.None,  0xC139, 0x008C, 0x01);
immutable DoorEntryA DoorEntry114 = DoorEntryA(null, EventFlag.None,  0x03F3, 0x00FD, 0x01);
immutable DoorEntryA DoorEntry115 = DoorEntryA(TextDoor115, EventFlag.DEFEATED_SANCTUARY_BOSS_1 | EVENT_FLAG_UNSET,  0x0027, 0x0089, 0x01);
immutable DoorEntryA DoorEntry116 = DoorEntryA(null, EventFlag.None,  0x8138, 0x02E7, 0x01);
immutable DoorEntryA DoorEntry117 = DoorEntryA(null, EventFlag.None,  0x409A, 0x03AC, 0x01);
immutable DoorEntryA DoorEntry118 = DoorEntryA(null, EventFlag.None,  0xC139, 0x02BC, 0x01);
immutable DoorEntryA DoorEntry119 = DoorEntryA(null, EventFlag.None,  0x8379, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry120 = DoorEntryA(null, EventFlag.None,  0xC109, 0x01BC, 0x01);
immutable DoorEntryA DoorEntry121 = DoorEntryA(null, EventFlag.None,  0x82E9, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry122 = DoorEntryA(null, EventFlag.None,  0x813B, 0x02A3, 0x01);
immutable DoorEntryA DoorEntry123 = DoorEntryA(null, EventFlag.None,  0xC109, 0x0189, 0x01);
immutable DoorEntryA DoorEntry124 = DoorEntryA(TextDoor124, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0075, 0x0092, 0x00);
immutable DoorEntryA DoorEntry125 = DoorEntryA(TextDoor125, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0085, 0x00B2, 0x00);
immutable DoorEntryA DoorEntry126 = DoorEntryA(TextDoor126, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00A2, 0x007F, 0x00);
immutable DoorEntryA DoorEntry127 = DoorEntryA(TextDoor127, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00DA, 0x00B4, 0x00);
immutable DoorEntryC DoorEntry128 = DoorEntryC(TextDoor128);
immutable DoorEntryC DoorEntry129 = DoorEntryC(TextDoor129);
immutable DoorEntryC DoorEntry130 = DoorEntryC(TextDoor130);
immutable DoorEntryC DoorEntry131 = DoorEntryC(TextDoor131);
immutable DoorEntryC DoorEntry132 = DoorEntryC(TextDoor132);
immutable DoorEntryC DoorEntry133 = DoorEntryC(TextDoor133);
immutable DoorEntryC DoorEntry134 = DoorEntryC(TextDoor134);
immutable DoorEntryC DoorEntry135 = DoorEntryC(TextDoor135);
immutable DoorEntryC DoorEntry136 = DoorEntryC(TextDoor136);
immutable DoorEntryC DoorEntry137 = DoorEntryC(TextDoor137);
immutable DoorEntryC DoorEntry138 = DoorEntryC(TextDoor138);
immutable DoorEntryA DoorEntry139 = DoorEntryA(TextDoor139, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00A0, 0x0151, 0x00);
immutable DoorEntryA DoorEntry140 = DoorEntryA(TextDoor140, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00D8, 0x0121, 0x00);
immutable DoorEntryA DoorEntry141 = DoorEntryA(TextDoor141, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00B2, 0x010B, 0x00);
immutable DoorEntryA DoorEntry142 = DoorEntryA(TextDoor142, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00AE, 0x0117, 0x00);
immutable DoorEntryC DoorEntry143 = DoorEntryC(TextDoor143);
immutable DoorEntryC DoorEntry144 = DoorEntryC(TextDoor144);
immutable DoorEntryC DoorEntry145 = DoorEntryC(TextDoor145);
immutable DoorEntryC DoorEntry146 = DoorEntryC(TextDoor146);
immutable DoorEntryC DoorEntry147 = DoorEntryC(TextDoor147);
immutable DoorEntryC DoorEntry148 = DoorEntryC(TextDoor148);
immutable DoorEntryC DoorEntry149 = DoorEntryC(TextDoor149);
immutable DoorEntryC DoorEntry150 = DoorEntryC(TextDoor150);
immutable DoorEntryA DoorEntry151 = DoorEntryA(TextDoor151, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x000C, 0x03E9, 0x00);
immutable DoorEntryA DoorEntry152 = DoorEntryA(TextDoor152, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x000C, 0x03F1, 0x00);
immutable DoorEntryA DoorEntry153 = DoorEntryA(TextDoor153, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0058, 0x0379, 0x00);
immutable DoorEntryA DoorEntry154 = DoorEntryA(TextDoor154, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0058, 0x037D, 0x00);
immutable DoorEntryC DoorEntry155 = DoorEntryC(TextDoor155);
immutable DoorEntryC DoorEntry156 = DoorEntryC(TextDoor156);
immutable DoorEntryC DoorEntry157 = DoorEntryC(TextDoor157);
immutable DoorEntryC DoorEntry158 = DoorEntryC(TextDoor157);
immutable DoorEntryC DoorEntry159 = DoorEntryC(TextDoor157);
immutable DoorEntryC DoorEntry160 = DoorEntryC(TextDoor160);
immutable DoorEntryC DoorEntry161 = DoorEntryC(TextDoor157);
immutable DoorEntryC DoorEntry162 = DoorEntryC(TextDoor157);
immutable DoorEntryC DoorEntry163 = DoorEntryC(TextDoor163);
immutable DoorEntryA DoorEntry164 = DoorEntryA(null, EventFlag.None,  0x418F, 0x0098, 0x01);
immutable DoorEntryA DoorEntry165 = DoorEntryA(null, EventFlag.None,  0xC3FD, 0x0358, 0x04);
immutable DoorEntryA DoorEntry166 = DoorEntryA(null, EventFlag.None,  0xC3FD, 0x0398, 0x04);
immutable DoorEntryA DoorEntry167 = DoorEntryA(null, EventFlag.None,  0xC38D, 0x03C4, 0x01);
immutable DoorEntryA DoorEntry168 = DoorEntryA(null, EventFlag.None,  0xC3BD, 0x0378, 0x06);
immutable DoorEntryA DoorEntry169 = DoorEntryA(null, EventFlag.None,  0xC3AB, 0x038A, 0x06);
immutable DoorEntryA DoorEntry170 = DoorEntryA(TextDoor170, EventFlag.THREED_REACHED,  0xC39D, 0x03BC, 0x04);
immutable DoorEntryA DoorEntry171 = DoorEntryA(null, EventFlag.None,  0xC3BD, 0x03D8, 0x04);
immutable DoorEntryA DoorEntry172 = DoorEntryA(null, EventFlag.None,  0xC3FD, 0x03D4, 0x04);
immutable DoorEntryA DoorEntry173 = DoorEntryA(null, EventFlag.None,  0xC3DD, 0x03D8, 0x04);
immutable DoorEntryA DoorEntry174 = DoorEntryA(null, EventFlag.None,  0xC42D, 0x03A8, 0x06);
immutable DoorEntryA DoorEntry175 = DoorEntryA(null, EventFlag.None,  0xC3CD, 0x0334, 0x06);
immutable DoorEntryA DoorEntry176 = DoorEntryA(null, EventFlag.None,  0xC3AD, 0x03C4, 0x04);
immutable DoorEntryA DoorEntry177 = DoorEntryA(null, EventFlag.None,  0xC3FD, 0x037C, 0x04);
immutable DoorEntryA DoorEntry178 = DoorEntryA(null, EventFlag.None,  0xC3CD, 0x03F8, 0x04);
immutable DoorEntryA DoorEntry179 = DoorEntryA(null, EventFlag.None,  0xC44D, 0x03EC, 0x01);
immutable DoorEntryA DoorEntry180 = DoorEntryA(null, EventFlag.None,  0xC38D, 0x03F8, 0x04);
immutable DoorEntryA DoorEntry181 = DoorEntryA(TextDoor004, EventFlag.None,  0x84E9, 0x0363, 0x01);
immutable DoorEntryA DoorEntry182 = DoorEntryA(TextDoor182, EventFlag.None,  0x84FC, 0x02E4, 0x01);
immutable DoorEntryA DoorEntry183 = DoorEntryA(TextDoor183, EventFlag.None,  0xC378, 0x01C4, 0x01);
immutable DoorEntryA DoorEntry184 = DoorEntryA(null, EventFlag.None,  0x84EB, 0x03A3, 0x01);
immutable DoorEntryA DoorEntry185 = DoorEntryA(null, EventFlag.None,  0xC4E9, 0x037C, 0x01);
immutable DoorEntryA DoorEntry186 = DoorEntryA(null, EventFlag.None,  0x0119, 0x0216, 0x01);
immutable DoorEntryA DoorEntry187 = DoorEntryA(null, EventFlag.None,  0xC459, 0x03C8, 0x07);
immutable DoorEntryA DoorEntry188 = DoorEntryA(null, EventFlag.None,  0xC415, 0x03B8, 0x01);
immutable DoorEntryA DoorEntry189 = DoorEntryA(TextDoor189, EventFlag.None,  0x032F, 0x00AB, 0x01);
immutable DoorEntryA DoorEntry190 = DoorEntryA(TextDoor190, EventFlag.None,  0x032F, 0x00BC, 0x0C);
immutable DoorEntryA DoorEntry191 = DoorEntryA(null, EventFlag.None,  0x033B, 0x0133, 0x0A);
immutable DoorEntryA DoorEntry192 = DoorEntryA(null, EventFlag.None,  0x03DC, 0x0369, 0x07);
immutable DoorEntryA DoorEntry193 = DoorEntryA(null, EventFlag.None,  0x0448, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry194 = DoorEntryA(TextDoor194, EventFlag.None,  0x0332, 0x00D2, 0x0C);
immutable DoorEntryA DoorEntry195 = DoorEntryA(null, EventFlag.None,  0x03DC, 0x0371, 0x07);
immutable DoorEntryA DoorEntry196 = DoorEntryA(TextDoor196, EventFlag.None,  0x0373, 0x0109, 0x0A);
immutable DoorEntryA DoorEntry197 = DoorEntryA(null, EventFlag.None,  0xC3CD, 0x035C, 0x07);
immutable DoorEntryA DoorEntry198 = DoorEntryA(null, EventFlag.None,  0x038F, 0x00F7, 0x0A);
immutable DoorEntryA DoorEntry199 = DoorEntryA(null, EventFlag.None,  0x0377, 0x011F, 0x0A);
immutable DoorEntryA DoorEntry200 = DoorEntryA(null, EventFlag.None,  0x83AD, 0x03A3, 0x07);
immutable DoorEntryA DoorEntry201 = DoorEntryA(null, EventFlag.None,  0x83ED, 0x0343, 0x0F);
immutable DoorEntryA DoorEntry202 = DoorEntryA(null, EventFlag.None,  0x83FA, 0x0346, 0x0F);
immutable DoorEntryA DoorEntry203 = DoorEntryA(null, EventFlag.None,  0xC3BD, 0x035C, 0x07);
immutable DoorEntryA DoorEntry204 = DoorEntryA(null, EventFlag.None,  0xC3BD, 0x039C, 0x07);
immutable DoorEntryA DoorEntry205 = DoorEntryA(null, EventFlag.None,  0x844D, 0x03C3, 0x0F);
immutable DoorEntryA DoorEntry206 = DoorEntryA(null, EventFlag.None,  0x040C, 0x0395, 0x07);
immutable DoorEntryA DoorEntry207 = DoorEntryA(null, EventFlag.None,  0x83FD, 0x0383, 0x0F);
immutable DoorEntryA DoorEntry208 = DoorEntryA(null, EventFlag.None,  0x0410, 0x03A9, 0x07);
immutable DoorEntryA DoorEntry209 = DoorEntryA(null, EventFlag.UNKNOWN_126,  0x0397, 0x00EF, 0x0A);
immutable DoorEntryA DoorEntry210 = DoorEntryA(null, EventFlag.None,  0xC3ED, 0x03F8, 0x07);
immutable DoorEntryA DoorEntry211 = DoorEntryA(null, EventFlag.None,  0x034F, 0x0122, 0x0A);
immutable DoorEntryA DoorEntry212 = DoorEntryA(null, EventFlag.None,  0xC45D, 0x03F8, 0x07);
immutable DoorEntryA DoorEntry213 = DoorEntryA(null, EventFlag.None,  0x83CA, 0x0346, 0x0F);
immutable DoorEntryA DoorEntry214 = DoorEntryA(null, EventFlag.None,  0x83DD, 0x0343, 0x0F);
immutable DoorEntryA DoorEntry215 = DoorEntryA(null, EventFlag.None,  0x030C, 0x00D9, 0x0A);
immutable DoorEntryA DoorEntry216 = DoorEntryA(null, EventFlag.None,  0x0397, 0x011D, 0x0A);
immutable DoorEntryA DoorEntry217 = DoorEntryA(null, EventFlag.None,  0x83DD, 0x0383, 0x0F);
immutable DoorEntryA DoorEntry218 = DoorEntryA(null, EventFlag.None,  0x030C, 0x00F9, 0x0A);
immutable DoorEntryA DoorEntry219 = DoorEntryA(null, EventFlag.None,  0x0360, 0x00A9, 0x0A);
immutable DoorEntryA DoorEntry220 = DoorEntryA(null, EventFlag.None,  0x83CD, 0x03E3, 0x07);
immutable DoorEntryA DoorEntry221 = DoorEntryA(null, EventFlag.None,  0xC3CD, 0x039C, 0x07);
immutable DoorEntryA DoorEntry222 = DoorEntryA(null, EventFlag.None,  0xC3CD, 0x03DC, 0x07);
immutable DoorEntryA DoorEntry223 = DoorEntryA(null, EventFlag.None,  0x838D, 0x03A3, 0x01);
immutable DoorEntryA DoorEntry224 = DoorEntryA(null, EventFlag.None,  0x0376, 0x0135, 0x0C);
immutable DoorEntryA DoorEntry225 = DoorEntryA(null, EventFlag.None,  0xC39D, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry226 = DoorEntryA(null, EventFlag.None,  0x83DD, 0x0363, 0x0F);
immutable DoorEntryA DoorEntry227 = DoorEntryA(null, EventFlag.None,  0x0388, 0x03B9, 0x07);
immutable DoorEntryA DoorEntry228 = DoorEntryA(null, EventFlag.None,  0x030E, 0x011B, 0x01);
immutable DoorEntryA DoorEntry229 = DoorEntryA(null, EventFlag.None,  0x03E8, 0x0351, 0x07);
immutable DoorEntryA DoorEntry230 = DoorEntryA(null, EventFlag.UNKNOWN_135,  0xC435, 0x0378, 0x07);
immutable DoorEntryA DoorEntry231 = DoorEntryA(null, EventFlag.None,  0xC3BD, 0x03BC, 0x07);
immutable DoorEntryA DoorEntry232 = DoorEntryA(TextDoor232, EventFlag.None,  0x0331, 0x0116, 0x0A);
immutable DoorEntryA DoorEntry233 = DoorEntryA(null, EventFlag.None,  0x839D, 0x03A3, 0x07);
immutable DoorEntryA DoorEntry234 = DoorEntryA(TextDoor234, EventFlag.None,  0x8431, 0x034B, 0x07);
immutable DoorEntryA DoorEntry235 = DoorEntryA(TextDoor235, EventFlag.UNKNOWN_073 | EVENT_FLAG_UNSET,  0xC3AD, 0x03FC, 0x07);
immutable DoorEntryA DoorEntry236 = DoorEntryA(null, EventFlag.None,  0x0398, 0x03B1, 0x07);
immutable DoorEntryA DoorEntry237 = DoorEntryA(TextDoor237, EventFlag.UNKNOWN_2F9,  0xC442, 0x009F, 0x01);
immutable DoorEntryA DoorEntry238 = DoorEntryA(TextDoor238, EventFlag.THREED_REACHED | EVENT_FLAG_UNSET,  0x849B, 0x0231, 0x01);
immutable DoorEntryA DoorEntry239 = DoorEntryA(TextDoor239, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0347, 0x012A, 0x00);
immutable DoorEntryA DoorEntry240 = DoorEntryA(TextDoor240, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x03A3, 0x010D, 0x00);
immutable DoorEntryC DoorEntry241 = DoorEntryC(TextDoor241);
immutable DoorEntryC DoorEntry242 = DoorEntryC(TextDoor242);
immutable DoorEntryC DoorEntry243 = DoorEntryC(TextDoor243);
immutable DoorEntryC DoorEntry244 = DoorEntryC(TextDoor244);
immutable DoorEntryC DoorEntry245 = DoorEntryC(TextDoor245);
immutable DoorEntryC DoorEntry246 = DoorEntryC(TextDoor246);
immutable DoorEntryC DoorEntry247 = DoorEntryC(TextDoor247);
immutable DoorEntryC DoorEntry248 = DoorEntryC(TextDoor248);
immutable DoorEntryA DoorEntry249 = DoorEntryA(TextDoor004, EventFlag.None,  0xC139, 0x029C, 0x01);
immutable DoorEntryA DoorEntry250 = DoorEntryA(TextDoor004, EventFlag.None,  0xC1A9, 0x021C, 0x01);
immutable DoorEntryA DoorEntry251 = DoorEntryA(null, EventFlag.None,  0xC0DD, 0x037C, 0x04);
immutable DoorEntryA DoorEntry252 = DoorEntryA(null, EventFlag.None,  0xC10D, 0x03BC, 0x04);
immutable DoorEntryA DoorEntry253 = DoorEntryA(TextDoor253, EventFlag.THREED_REACHED,  0xC122, 0x03F1, 0x04);
immutable DoorEntryA DoorEntry254 = DoorEntryA(TextDoor004, EventFlag.None,  0x80D1, 0x0187, 0x01);
immutable DoorEntryA DoorEntry255 = DoorEntryA(TextDoor255, EventFlag.SATURN_VALLEY_REACHED | EVENT_FLAG_UNSET,  0xC101, 0x03F0, 0x04);
immutable DoorEntryA DoorEntry256 = DoorEntryA(null, EventFlag.None,  0xC0CD, 0x037C, 0x04);
immutable DoorEntryA DoorEntry257 = DoorEntryA(null, EventFlag.None,  0xC0DD, 0x03BC, 0x04);
immutable DoorEntryA DoorEntry258 = DoorEntryA(null, EventFlag.None,  0x80CD, 0x03A3, 0x0F);
immutable DoorEntryA DoorEntry259 = DoorEntryA(TextDoor101, EventFlag.None,  0x03F8, 0x01CA, 0x0A);
immutable DoorEntryA DoorEntry260 = DoorEntryA(null, EventFlag.None,  0x03B8, 0x0202, 0x0A);
immutable DoorEntryA DoorEntry261 = DoorEntryA(null, EventFlag.None,  0x80CD, 0x0363, 0x0F);
immutable DoorEntryA DoorEntry262 = DoorEntryA(null, EventFlag.None,  0x03EC, 0x0202, 0x0A);
immutable DoorEntryA DoorEntry263 = DoorEntryA(null, EventFlag.None,  0x03C3, 0x01D7, 0x0A);
immutable DoorEntryA DoorEntry264 = DoorEntryA(null, EventFlag.None,  0x03E4, 0x01B9, 0x0A);
immutable DoorEntryA DoorEntry265 = DoorEntryA(null, EventFlag.None,  0x80F2, 0x03A6, 0x0F);
immutable DoorEntryA DoorEntry266 = DoorEntryA(TextDoor266, EventFlag.None,  0x8122, 0x03AE, 0x07);
immutable DoorEntryA DoorEntry267 = DoorEntryA(null, EventFlag.None,  0x80DA, 0x03E6, 0x0F);
immutable DoorEntryA DoorEntry268 = DoorEntryA(TextDoor268, EventFlag.None,  0xC0DA, 0x03F9, 0x07);
immutable DoorEntryA DoorEntry269 = DoorEntryA(TextDoor269, EventFlag.None,  0x03DC, 0x01DF, 0x0A);
immutable DoorEntryA DoorEntry270 = DoorEntryA(null, EventFlag.None,  0x00C5, 0x02E9, 0x01);
immutable DoorEntryA DoorEntry271 = DoorEntryA(TextDoor271, EventFlag.None,  0x83B4, 0x01BA, 0x01);
immutable DoorEntryA DoorEntry272 = DoorEntryA(null, EventFlag.None,  0x008A, 0x02E6, 0x01);
immutable DoorEntryA DoorEntry273 = DoorEntryA(null, EventFlag.None,  0x03B8, 0x01F7, 0x01);
immutable DoorEntryC DoorEntry274 = DoorEntryC(TextDoor274);
immutable DoorEntryC DoorEntry275 = DoorEntryC(TextDoor275);
immutable DoorEntryA DoorEntry276 = DoorEntryA(null, EventFlag.None,  0x81A9, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry277 = DoorEntryA(null, EventFlag.None,  0xC4CD, 0x0374, 0x04);
immutable DoorEntryA DoorEntry278 = DoorEntryA(TextDoor004, EventFlag.None,  0x8139, 0x0263, 0x01);
immutable DoorEntryA DoorEntry279 = DoorEntryA(TextDoor004, EventFlag.None,  0xC4E9, 0x03DC, 0x01);
immutable DoorEntryA DoorEntry280 = DoorEntryA(null, EventFlag.None,  0x009A, 0x02D7, 0x0A);
immutable DoorEntryA DoorEntry281 = DoorEntryA(TextDoor281, EventFlag.DEFEATED_SANCTUARY_BOSS_2 | EVENT_FLAG_UNSET,  0x03F5, 0x0182, 0x01);
immutable DoorEntryA DoorEntry282 = DoorEntryA(null, EventFlag.None,  0xC3C4, 0x020C, 0x01);
immutable DoorEntryA DoorEntry283 = DoorEntryA(TextDoor001, EventFlag.None,  0x008B, 0x01F1, 0x01);
immutable DoorEntryA DoorEntry284 = DoorEntryA(TextDoor004, EventFlag.None,  0x0401, 0x023C, 0x01);
immutable DoorEntryA DoorEntry285 = DoorEntryA(null, EventFlag.None,  0x04B1, 0x033C, 0x01);
immutable DoorEntryA DoorEntry286 = DoorEntryA(null, EventFlag.None,  0xC4CD, 0x03F8, 0x04);
immutable DoorEntryA DoorEntry287 = DoorEntryA(null, EventFlag.None,  0xC48D, 0x035C, 0x04);
immutable DoorEntryA DoorEntry288 = DoorEntryA(null, EventFlag.None,  0xC4EF, 0x03FA, 0x01);
immutable DoorEntryA DoorEntry289 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x03B8, 0x04);
immutable DoorEntryA DoorEntry290 = DoorEntryA(TextDoor290, EventFlag.None,  0xC4FC, 0x03DB, 0x01);
immutable DoorEntryA DoorEntry291 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x0374, 0x04);
immutable DoorEntryA DoorEntry292 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x03FC, 0x06);
immutable DoorEntryA DoorEntry293 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x0374, 0x06);
immutable DoorEntryA DoorEntry294 = DoorEntryA(null, EventFlag.None,  0xC4DD, 0x035C, 0x01);
immutable DoorEntryA DoorEntry295 = DoorEntryA(null, EventFlag.None,  0xC4DD, 0x03F8, 0x06);
immutable DoorEntryA DoorEntry296 = DoorEntryA(null, EventFlag.None,  0xC4DA, 0x0379, 0x04);
immutable DoorEntryA DoorEntry297 = DoorEntryA(null, EventFlag.None,  0xC4DA, 0x03B5, 0x04);
immutable DoorEntryA DoorEntry298 = DoorEntryA(TextDoor004, EventFlag.None,  0x84FC, 0x0224, 0x01);
immutable DoorEntryA DoorEntry299 = DoorEntryA(null, EventFlag.None,  0xC489, 0x0388, 0x07);
immutable DoorEntryA DoorEntry300 = DoorEntryA(null, EventFlag.None,  0xC48D, 0x03E4, 0x01);
immutable DoorEntryA DoorEntry301 = DoorEntryA(TextDoor101, EventFlag.None,  0x0462, 0x02B3, 0x0A);
immutable DoorEntryA DoorEntry302 = DoorEntryA(null, EventFlag.None,  0x04DC, 0x03C9, 0x07);
immutable DoorEntryA DoorEntry303 = DoorEntryA(null, EventFlag.None,  0x048E, 0x029C, 0x0C);
immutable DoorEntryA DoorEntry304 = DoorEntryA(null, EventFlag.None,  0x0488, 0x0351, 0x07);
immutable DoorEntryA DoorEntry305 = DoorEntryA(null, EventFlag.None,  0x04DC, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry306 = DoorEntryA(null, EventFlag.None,  0x0488, 0x03CD, 0x07);
immutable DoorEntryA DoorEntry307 = DoorEntryA(TextDoor307, EventFlag.None,  0xC49D, 0x03BC, 0x07);
immutable DoorEntryA DoorEntry308 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x03FC, 0x07);
immutable DoorEntryA DoorEntry309 = DoorEntryA(null, EventFlag.None,  0x848D, 0x0343, 0x01);
immutable DoorEntryA DoorEntry310 = DoorEntryA(null, EventFlag.None,  0x0488, 0x03D5, 0x07);
immutable DoorEntryA DoorEntry311 = DoorEntryA(null, EventFlag.None,  0x048C, 0x0265, 0x0A);
immutable DoorEntryA DoorEntry312 = DoorEntryA(null, EventFlag.None,  0x0478, 0x02E9, 0x0A);
immutable DoorEntryA DoorEntry313 = DoorEntryA(null, EventFlag.None,  0x048E, 0x028D, 0x0C);
immutable DoorEntryA DoorEntry314 = DoorEntryA(null, EventFlag.None,  0xC4DD, 0x0398, 0x07);
immutable DoorEntryA DoorEntry315 = DoorEntryA(null, EventFlag.None,  0x048D, 0x02BF, 0x01);
immutable DoorEntryA DoorEntry316 = DoorEntryA(null, EventFlag.None,  0x84DD, 0x03C3, 0x0F);
immutable DoorEntryA DoorEntry317 = DoorEntryA(null, EventFlag.None,  0x0491, 0x0302, 0x0A);
immutable DoorEntryA DoorEntry318 = DoorEntryA(null, EventFlag.None,  0x04D8, 0x0352, 0x07);
immutable DoorEntryA DoorEntry319 = DoorEntryA(null, EventFlag.None,  0x0497, 0x0319, 0x0A);
immutable DoorEntryA DoorEntry320 = DoorEntryA(null, EventFlag.None,  0xC48D, 0x0378, 0x07);
immutable DoorEntryA DoorEntry321 = DoorEntryA(null, EventFlag.None,  0xC48D, 0x03B8, 0x07);
immutable DoorEntryA DoorEntry322 = DoorEntryA(null, EventFlag.None,  0x84DD, 0x0343, 0x0F);
immutable DoorEntryA DoorEntry323 = DoorEntryA(null, EventFlag.None,  0x0428, 0x0319, 0x0A);
immutable DoorEntryA DoorEntry324 = DoorEntryA(null, EventFlag.None,  0x048E, 0x02D1, 0x0C);
immutable DoorEntryA DoorEntry325 = DoorEntryA(null, EventFlag.None,  0x0476, 0x02BB, 0x01);
immutable DoorEntryA DoorEntry326 = DoorEntryA(null, EventFlag.None,  0x0413, 0x0290, 0x01);
immutable DoorEntryA DoorEntry327 = DoorEntryA(null, EventFlag.None,  0x8123, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry328 = DoorEntryA(null, EventFlag.None,  0xC41D, 0x023C, 0x01);
immutable DoorEntryA DoorEntry329 = DoorEntryA(null, EventFlag.None,  0x81B5, 0x02A2, 0x01);
immutable DoorEntryA DoorEntry330 = DoorEntryA(null, EventFlag.None,  0xC123, 0x01FC, 0x01);
immutable DoorEntryA DoorEntry331 = DoorEntryA(null, EventFlag.None,  0x8283, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry332 = DoorEntryA(null, EventFlag.None,  0xC1BD, 0x02BC, 0x01);
immutable DoorEntryA DoorEntry333 = DoorEntryA(null, EventFlag.None,  0x82AD, 0x01E2, 0x01);
immutable DoorEntryA DoorEntry334 = DoorEntryA(null, EventFlag.None,  0x82CD, 0x01E2, 0x01);
immutable DoorEntryA DoorEntry335 = DoorEntryA(null, EventFlag.None,  0xC283, 0x01FC, 0x01);
immutable DoorEntryA DoorEntry336 = DoorEntryA(null, EventFlag.None,  0x0125, 0x0316, 0x01);
immutable DoorEntryA DoorEntry337 = DoorEntryA(null, EventFlag.None,  0xC2A5, 0x01FC, 0x01);
immutable DoorEntryA DoorEntry338 = DoorEntryA(null, EventFlag.None,  0x0430, 0x02F0, 0x01);
immutable DoorEntryA DoorEntry339 = DoorEntryA(null, EventFlag.None,  0xC4E5, 0x0358, 0x07);
immutable DoorEntryA DoorEntry340 = DoorEntryA(TextDoor340, EventFlag.UNKNOWN_21D | EVENT_FLAG_UNSET,  0x84BD, 0x0322, 0x07);
immutable DoorEntryA DoorEntry341 = DoorEntryA(null, EventFlag.None,  0xC49B, 0x032E, 0x01);
immutable DoorEntryA DoorEntry342 = DoorEntryA(TextDoor342, EventFlag.UNKNOWN_2F9,  0x83C2, 0x0140, 0x01);
immutable DoorEntryA DoorEntry343 = DoorEntryA(null, EventFlag.None,  0xC4FC, 0x02BB, 0x01);
immutable DoorEntryA DoorEntry344 = DoorEntryA(null, EventFlag.None,  0x800C, 0x0304, 0x01);
immutable DoorEntryA DoorEntry345 = DoorEntryA(null, EventFlag.None,  0xC3C2, 0x0187, 0x01);
immutable DoorEntryA DoorEntry346 = DoorEntryA(TextDoor346, EventFlag.None,  0x84E6, 0x0032, 0x01);
immutable DoorEntryC DoorEntry347 = DoorEntryC(TextDoor347);
immutable DoorEntryC DoorEntry348 = DoorEntryC(TextDoor348);
immutable DoorEntryA DoorEntry349 = DoorEntryA(TextDoor349, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0452, 0x02C1, 0x00);
immutable DoorEntryA DoorEntry350 = DoorEntryA(TextDoor350, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0455, 0x02F5, 0x00);
immutable DoorEntryA DoorEntry351 = DoorEntryA(TextDoor351, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0449, 0x0305, 0x00);
immutable DoorEntryA DoorEntry352 = DoorEntryA(TextDoor352, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x047C, 0x026D, 0x00);
immutable DoorEntryA DoorEntry353 = DoorEntryA(TextDoor353, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x047A, 0x02D3, 0x00);
immutable DoorEntryA DoorEntry354 = DoorEntryA(TextDoor354, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0462, 0x030D, 0x00);
immutable DoorEntryA DoorEntry355 = DoorEntryA(TextDoor355, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0487, 0x02DF, 0x00);
immutable DoorEntryC DoorEntry356 = DoorEntryC(TextDoor356);
immutable DoorEntryC DoorEntry357 = DoorEntryC(TextDoor357);
immutable DoorEntryC DoorEntry358 = DoorEntryC(TextDoor358);
immutable DoorEntryC DoorEntry359 = DoorEntryC(TextDoor359);
immutable DoorEntryC DoorEntry360 = DoorEntryC(TextDoor360);
immutable DoorEntryC DoorEntry361 = DoorEntryC(TextDoor361);
immutable DoorEntryC DoorEntry362 = DoorEntryC(TextDoor362);
immutable DoorEntryC DoorEntry363 = DoorEntryC(TextDoor363);
immutable DoorEntryC DoorEntry364 = DoorEntryC(TextDoor364);
immutable DoorEntryA DoorEntry365 = DoorEntryA(null, EventFlag.None,  0xC141, 0x03E8, 0x04);
immutable DoorEntryA DoorEntry366 = DoorEntryA(null, EventFlag.None,  0xC13D, 0x03B8, 0x04);
immutable DoorEntryA DoorEntry367 = DoorEntryA(TextDoor367, EventFlag.None,  0xC0F8, 0x03CB, 0x01);
immutable DoorEntryA DoorEntry368 = DoorEntryA(TextDoor367, EventFlag.None,  0xC0D8, 0x038B, 0x01);
immutable DoorEntryA DoorEntry369 = DoorEntryA(TextDoor367, EventFlag.None,  0xC0D8, 0x03CB, 0x01);
immutable DoorEntryA DoorEntry370 = DoorEntryA(TextDoor367, EventFlag.None,  0xC0F8, 0x038B, 0x01);
immutable DoorEntryA DoorEntry371 = DoorEntryA(TextDoor001, EventFlag.None,  0xC014, 0x0280, 0x01);
immutable DoorEntryA DoorEntry372 = DoorEntryA(TextDoor004, EventFlag.None,  0x801C, 0x0267, 0x01);
immutable DoorEntryA DoorEntry373 = DoorEntryA(TextDoor373, EventFlag.None,  0xC1B8, 0x00F8, 0x01);
immutable DoorEntryA DoorEntry374 = DoorEntryA(TextDoor004, EventFlag.None,  0x81D0, 0x008B, 0x01);
immutable DoorEntryA DoorEntry375 = DoorEntryA(null, EventFlag.None,  0xC169, 0x03F8, 0x04);
immutable DoorEntryA DoorEntry376 = DoorEntryA(TextDoor004, EventFlag.None,  0xC26C, 0x035C, 0x01);
immutable DoorEntryA DoorEntry377 = DoorEntryA(TextDoor004, EventFlag.None,  0x01C5, 0x036C, 0x01);
immutable DoorEntryA DoorEntry378 = DoorEntryA(TextDoor367, EventFlag.None,  0xC2E8, 0x020B, 0x01);
immutable DoorEntryC DoorEntry379 = DoorEntryC(TextDoor379);
immutable DoorEntryA DoorEntry380 = DoorEntryA(null, EventFlag.None,  0x0124, 0x0057, 0x0A);
immutable DoorEntryA DoorEntry381 = DoorEntryA(null, EventFlag.None,  0x013C, 0x03DA, 0x07);
immutable DoorEntryA DoorEntry382 = DoorEntryA(null, EventFlag.None,  0x013C, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry383 = DoorEntryA(null, EventFlag.None,  0x8164, 0x03E0, 0x0F);
immutable DoorEntryA DoorEntry384 = DoorEntryA(null, EventFlag.None,  0x017C, 0x03DA, 0x07);
immutable DoorEntryA DoorEntry385 = DoorEntryA(null, EventFlag.None,  0x017C, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry386 = DoorEntryA(null, EventFlag.None,  0xC0CD, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry387 = DoorEntryA(null, EventFlag.None,  0xC0CD, 0x0394, 0x07);
immutable DoorEntryA DoorEntry388 = DoorEntryA(null, EventFlag.None,  0x8181, 0x03C7, 0x0F);
immutable DoorEntryA DoorEntry389 = DoorEntryA(TextDoor389, EventFlag.None,  0x0112, 0x003E, 0x0A);
immutable DoorEntryA DoorEntry390 = DoorEntryA(null, EventFlag.None,  0x0263, 0x0028, 0x0A);
immutable DoorEntryA DoorEntry391 = DoorEntryA(null, EventFlag.None,  0x80F0, 0x0364, 0x0F);
immutable DoorEntryA DoorEntry392 = DoorEntryA(null, EventFlag.None,  0xC0ED, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry393 = DoorEntryA(null, EventFlag.None,  0xC0ED, 0x0398, 0x07);
immutable DoorEntryA DoorEntry394 = DoorEntryA(null, EventFlag.None,  0x8141, 0x03C7, 0x0F);
immutable DoorEntryA DoorEntry395 = DoorEntryA(TextDoor395, EventFlag.None,  0x01A3, 0x002B, 0x01);
immutable DoorEntryA DoorEntry396 = DoorEntryA(TextDoor395, EventFlag.None,  0x01A7, 0x0033, 0x01);
immutable DoorEntryA DoorEntry397 = DoorEntryA(TextDoor395, EventFlag.None,  0x01A3, 0x0047, 0x01);
immutable DoorEntryA DoorEntry398 = DoorEntryA(TextDoor395, EventFlag.None,  0x018F, 0x0063, 0x01);
immutable DoorEntryA DoorEntry399 = DoorEntryA(TextDoor101, EventFlag.None,  0x015B, 0x0043, 0x01);
immutable DoorEntryA DoorEntry400 = DoorEntryA(null, EventFlag.None,  0x0245, 0x0061, 0x01);
immutable DoorEntryA DoorEntry401 = DoorEntryA(TextDoor401, EventFlag.None,  0x024A, 0x0055, 0x01);
immutable DoorEntryA DoorEntry402 = DoorEntryA(TextDoor402, EventFlag.None,  0x0215, 0x0035, 0x01);
immutable DoorEntryA DoorEntry403 = DoorEntryA(TextDoor403, EventFlag.DEFEATED_SANCTUARY_BOSS_4 | EVENT_FLAG_UNSET,  0x01E1, 0x0019, 0x01);
immutable DoorEntryA DoorEntry404 = DoorEntryA(null, EventFlag.None,  0x8434, 0x0167, 0x01);
immutable DoorEntryA DoorEntry405 = DoorEntryA(null, EventFlag.None,  0xC034, 0x0298, 0x01);
immutable DoorEntryA DoorEntry406 = DoorEntryA(null, EventFlag.None,  0x826C, 0x0307, 0x01);
immutable DoorEntryA DoorEntry407 = DoorEntryA(null, EventFlag.None,  0xC438, 0x01BC, 0x01);
immutable DoorEntryA DoorEntry408 = DoorEntryA(TextDoor408, EventFlag.None,  0x0261, 0x0051, 0x01);
immutable DoorEntryA DoorEntry409 = DoorEntryA(null, EventFlag.None,  0x422A, 0x002A, 0x01);
immutable DoorEntryA DoorEntry410 = DoorEntryA(null, EventFlag.None,  0x82E5, 0x0322, 0x01);
immutable DoorEntryA DoorEntry411 = DoorEntryA(null, EventFlag.None,  0xC1D4, 0x0378, 0x01);
immutable DoorEntryA DoorEntry412 = DoorEntryA(null, EventFlag.None,  0xC265, 0x03FC, 0x01);
immutable DoorEntryA DoorEntry413 = DoorEntryA(null, EventFlag.None,  0xC2A5, 0x03BC, 0x01);
immutable DoorEntryA DoorEntry414 = DoorEntryA(null, EventFlag.None,  0x831D, 0x0322, 0x01);
immutable DoorEntryA DoorEntry415 = DoorEntryA(null, EventFlag.None,  0xC2A5, 0x03DC, 0x01);
immutable DoorEntryA DoorEntry416 = DoorEntryA(null, EventFlag.None,  0x827D, 0x03C2, 0x01);
immutable DoorEntryA DoorEntry417 = DoorEntryA(null, EventFlag.None,  0x827D, 0x03E6, 0x01);
immutable DoorEntryA DoorEntry418 = DoorEntryA(null, EventFlag.None,  0x8291, 0x0342, 0x01);
immutable DoorEntryA DoorEntry419 = DoorEntryA(null, EventFlag.None,  0xC2BD, 0x03FC, 0x01);
immutable DoorEntryA DoorEntry420 = DoorEntryA(null, EventFlag.None,  0xC349, 0x0348, 0x01);
immutable DoorEntryA DoorEntry421 = DoorEntryA(null, EventFlag.None,  0x82B5, 0x0302, 0x01);
immutable DoorEntryA DoorEntry422 = DoorEntryA(null, EventFlag.None,  0x01CB, 0x030C, 0x01);
immutable DoorEntryA DoorEntry423 = DoorEntryA(null, EventFlag.None,  0xC35D, 0x039C, 0x01);
immutable DoorEntryA DoorEntry424 = DoorEntryA(null, EventFlag.None,  0x82DD, 0x0343, 0x04);
immutable DoorEntryA DoorEntry425 = DoorEntryA(null, EventFlag.None,  0xC22A, 0x0385, 0x07);
immutable DoorEntryA DoorEntry426 = DoorEntryA(null, EventFlag.None,  0x8239, 0x0323, 0x07);
immutable DoorEntryA DoorEntry427 = DoorEntryA(null, EventFlag.None,  0xC219, 0x035C, 0x07);
immutable DoorEntryA DoorEntry428 = DoorEntryA(null, EventFlag.None,  0x8251, 0x03E3, 0x07);
immutable DoorEntryA DoorEntry429 = DoorEntryA(null, EventFlag.None,  0xC2FD, 0x03DC, 0x07);
immutable DoorEntryA DoorEntry430 = DoorEntryA(null, EventFlag.None,  0x82FD, 0x03C3, 0x07);
immutable DoorEntryA DoorEntry431 = DoorEntryA(null, EventFlag.None,  0xC2DD, 0x0358, 0x07);
immutable DoorEntryA DoorEntry432 = DoorEntryA(TextDoor004, EventFlag.None,  0x819B, 0x03A3, 0x01);
immutable DoorEntryA DoorEntry433 = DoorEntryA(TextDoor004, EventFlag.None,  0x02C1, 0x01FC, 0x01);
immutable DoorEntryA DoorEntry434 = DoorEntryA(null, EventFlag.None,  0x82D9, 0x01E3, 0x07);
immutable DoorEntryA DoorEntry435 = DoorEntryA(null, EventFlag.None,  0x0021, 0x031C, 0x01);
immutable DoorEntryA DoorEntry436 = DoorEntryA(null, EventFlag.None,  0x8299, 0x01E3, 0x07);
immutable DoorEntryA DoorEntry437 = DoorEntryA(null, EventFlag.None,  0xC252, 0x0249, 0x01);
immutable DoorEntryA DoorEntry438 = DoorEntryA(null, EventFlag.None,  0xC2F9, 0x01F4, 0x07);
immutable DoorEntryA DoorEntry439 = DoorEntryA(null, EventFlag.None,  0x82B9, 0x01E3, 0x07);
immutable DoorEntryA DoorEntry440 = DoorEntryA(null, EventFlag.None,  0xC2A9, 0x01B8, 0x07);
immutable DoorEntryA DoorEntry441 = DoorEntryA(null, EventFlag.None,  0xC2DD, 0x01A8, 0x07);
immutable DoorEntryA DoorEntry442 = DoorEntryA(null, EventFlag.None,  0xC2B1, 0x0164, 0x07);
immutable DoorEntryA DoorEntry443 = DoorEntryA(null, EventFlag.None,  0x82CD, 0x0147, 0x07);
immutable DoorEntryA DoorEntry444 = DoorEntryA(null, EventFlag.None,  0x8379, 0x03A3, 0x01);
immutable DoorEntryA DoorEntry445 = DoorEntryA(null, EventFlag.None,  0x02CB, 0x0110, 0x01);
immutable DoorEntryA DoorEntry446 = DoorEntryA(TextDoor446, EventFlag.DEFEATED_SANCTUARY_BOSS_3 | EVENT_FLAG_UNSET,  0x0295, 0x004E, 0x01);
immutable DoorEntryA DoorEntry447 = DoorEntryA(TextDoor447, EventFlag.None,  0x02BD, 0x0066, 0x01);
immutable DoorEntryA DoorEntry448 = DoorEntryA(null, EventFlag.None,  0x0391, 0x0045, 0x01);
immutable DoorEntryA DoorEntry449 = DoorEntryA(TextDoor447, EventFlag.None,  0x0295, 0x001E, 0x01);
immutable DoorEntryA DoorEntry450 = DoorEntryA(null, EventFlag.None,  0x024F, 0x022E, 0x01);
immutable DoorEntryA DoorEntry451 = DoorEntryA(null, EventFlag.None,  0x0395, 0x0035, 0x01);
immutable DoorEntryA DoorEntry452 = DoorEntryA(null, EventFlag.None,  0xC279, 0x03B9, 0x01);
immutable DoorEntryA DoorEntry453 = DoorEntryA(TextDoor001, EventFlag.None,  0x011F, 0x0395, 0x01);
immutable DoorEntryA DoorEntry454 = DoorEntryA(null, EventFlag.None,  0x810C, 0x036B, 0x01);
immutable DoorEntryA DoorEntry455 = DoorEntryA(null, EventFlag.None,  0x8199, 0x0343, 0x01);
immutable DoorEntryA DoorEntry456 = DoorEntryA(null, EventFlag.None,  0x0055, 0x034D, 0x01);
immutable DoorEntryA DoorEntry457 = DoorEntryA(null, EventFlag.None,  0x81B9, 0x0343, 0x01);
immutable DoorEntryA DoorEntry458 = DoorEntryA(null, EventFlag.None,  0xC199, 0x03BD, 0x01);
immutable DoorEntryA DoorEntry459 = DoorEntryA(null, EventFlag.None,  0xC199, 0x03FC, 0x01);
immutable DoorEntryA DoorEntry460 = DoorEntryA(TextDoor460, EventFlag.None,  0x03E2, 0x0019, 0x01);
immutable DoorEntryA DoorEntry461 = DoorEntryA(TextDoor461, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0021, 0x031C, 0x01);
immutable DoorEntryC DoorEntry462 = DoorEntryC(TextDoor462);
immutable DoorEntryA DoorEntry463 = DoorEntryA(null, EventFlag.None,  0xC3E9, 0x03CB, 0x04);
immutable DoorEntryA DoorEntry464 = DoorEntryA(TextDoor004, EventFlag.None,  0xC1A9, 0x0350, 0x01);
immutable DoorEntryA DoorEntry465 = DoorEntryA(TextDoor004, EventFlag.None,  0x0281, 0x018C, 0x01);
immutable DoorEntryA DoorEntry466 = DoorEntryA(TextDoor004, EventFlag.None,  0x828D, 0x0183, 0x01);
immutable DoorEntryA DoorEntry467 = DoorEntryA(TextDoor004, EventFlag.None,  0xC379, 0x03F9, 0x01);
immutable DoorEntryA DoorEntry468 = DoorEntryA(null, EventFlag.None,  0xC3E9, 0x032B, 0x04);
immutable DoorEntryA DoorEntry469 = DoorEntryA(null, EventFlag.None,  0xC3E9, 0x038B, 0x04);
immutable DoorEntryA DoorEntry470 = DoorEntryA(TextDoor004, EventFlag.None,  0xC1B9, 0x035C, 0x01);
immutable DoorEntryA DoorEntry471 = DoorEntryA(TextDoor004, EventFlag.None,  0xC28D, 0x019C, 0x01);
immutable DoorEntryA DoorEntry472 = DoorEntryA(TextDoor004, EventFlag.None,  0x8279, 0x0383, 0x01);
immutable DoorEntryA DoorEntry473 = DoorEntryA(TextDoor101, EventFlag.None,  0x03CC, 0x001B, 0x0A);
immutable DoorEntryA DoorEntry474 = DoorEntryA(null, EventFlag.None,  0x03C4, 0x0037, 0x0A);
immutable DoorEntryA DoorEntry475 = DoorEntryA(null, EventFlag.None,  0x03A0, 0x001B, 0x0A);
immutable DoorEntryA DoorEntry476 = DoorEntryA(null, EventFlag.None,  0x03A7, 0x0018, 0x01);
immutable DoorEntryA DoorEntry477 = DoorEntryA(null, EventFlag.None,  0x03B0, 0x0015, 0x01);
immutable DoorEntryA DoorEntry478 = DoorEntryA(null, EventFlag.None,  0x03AA, 0x002D, 0x01);
immutable DoorEntryA DoorEntry479 = DoorEntryA(null, EventFlag.None,  0x03AC, 0x0025, 0x01);
immutable DoorEntryA DoorEntry480 = DoorEntryA(null, EventFlag.None,  0xC10D, 0x03D8, 0x01);
immutable DoorEntryA DoorEntry481 = DoorEntryA(TextDoor004, EventFlag.None,  0xC00C, 0x035B, 0x01);
immutable DoorEntryA DoorEntry482 = DoorEntryA(null, EventFlag.None,  0xC0ED, 0x03F4, 0x01);
immutable DoorEntryA DoorEntry483 = DoorEntryA(TextDoor004, EventFlag.None,  0x81AC, 0x02C4, 0x01);
immutable DoorEntryA DoorEntry484 = DoorEntryA(TextDoor004, EventFlag.None,  0x81AC, 0x02C4, 0x01);
immutable DoorEntryA DoorEntry485 = DoorEntryA(TextDoor004, EventFlag.None,  0xC35A, 0x03F8, 0x01);
immutable DoorEntryA DoorEntry486 = DoorEntryA(TextDoor004, EventFlag.None,  0x0413, 0x0031, 0x01);
immutable DoorEntryA DoorEntry487 = DoorEntryA(TextDoor004, EventFlag.None,  0x0291, 0x03B8, 0x01);
immutable DoorEntryA DoorEntry488 = DoorEntryA(TextDoor004, EventFlag.None,  0x843C, 0x03C4, 0x01);
immutable DoorEntryA DoorEntry489 = DoorEntryA(TextDoor004, EventFlag.None,  0xC43C, 0x03FB, 0x01);
immutable DoorEntryC DoorEntry490 = DoorEntryC(TextDoor490);
immutable DoorEntryA DoorEntry491 = DoorEntryA(TextDoor346, EventFlag.None,  0x04B4, 0x01B3, 0x01);
immutable DoorEntryA DoorEntry492 = DoorEntryA(TextDoor346, EventFlag.None,  0x04DC, 0x00AF, 0x01);
immutable DoorEntryA DoorEntry493 = DoorEntryA(null, EventFlag.None,  0x0283, 0x038D, 0x01);
immutable DoorEntryA DoorEntry494 = DoorEntryA(null, EventFlag.None,  0x02A3, 0x03F5, 0x01);
immutable DoorEntryA DoorEntry495 = DoorEntryA(null, EventFlag.None,  0x0293, 0x0305, 0x01);
immutable DoorEntryA DoorEntry496 = DoorEntryA(null, EventFlag.None,  0x0293, 0x0339, 0x01);
immutable DoorEntryA DoorEntry497 = DoorEntryA(null, EventFlag.None,  0x02C3, 0x0335, 0x01);
immutable DoorEntryA DoorEntry498 = DoorEntryA(null, EventFlag.None,  0x84B4, 0x01CC, 0x01);
immutable DoorEntryA DoorEntry499 = DoorEntryA(null, EventFlag.None,  0x02EA, 0x03B5, 0x01);
immutable DoorEntryA DoorEntry500 = DoorEntryA(null, EventFlag.None,  0x42EC, 0x03ED, 0x01);
immutable DoorEntryA DoorEntry501 = DoorEntryA(null, EventFlag.None,  0x42A8, 0x0375, 0x01);
immutable DoorEntryA DoorEntry502 = DoorEntryA(null, EventFlag.None,  0x02CA, 0x03D5, 0x01);
immutable DoorEntryA DoorEntry503 = DoorEntryA(null, EventFlag.None,  0x4304, 0x0379, 0x01);
immutable DoorEntryA DoorEntry504 = DoorEntryA(TextDoor346, EventFlag.None,  0x04B6, 0x01C9, 0x01);
immutable DoorEntryA DoorEntry505 = DoorEntryA(null, EventFlag.None,  0x44BC, 0x00C1, 0x01);
immutable DoorEntryA DoorEntry506 = DoorEntryA(null, EventFlag.UNKNOWN_2E9 | EVENT_FLAG_UNSET,  0xC2A9, 0x0310, 0x01);
immutable DoorEntryA DoorEntry507 = DoorEntryA(null, EventFlag.None,  0xC2C9, 0x0310, 0x01);
immutable DoorEntryA DoorEntry508 = DoorEntryA(null, EventFlag.None,  0x02A8, 0x0305, 0x01);
immutable DoorEntryA DoorEntry509 = DoorEntryA(null, EventFlag.None,  0xC2E9, 0x030C, 0x01);
immutable DoorEntryA DoorEntry510 = DoorEntryA(null, EventFlag.None,  0x02C8, 0x0305, 0x01);
immutable DoorEntryA DoorEntry511 = DoorEntryA(null, EventFlag.None,  0x02C8, 0x030D, 0x01);
immutable DoorEntryA DoorEntry512 = DoorEntryA(null, EventFlag.None,  0xC309, 0x031C, 0x01);
immutable DoorEntryA DoorEntry513 = DoorEntryA(null, EventFlag.None,  0x02A8, 0x030D, 0x01);
immutable DoorEntryA DoorEntry514 = DoorEntryA(null, EventFlag.None,  0xC289, 0x032C, 0x01);
immutable DoorEntryA DoorEntry515 = DoorEntryA(null, EventFlag.None,  0x0288, 0x0329, 0x01);
immutable DoorEntryA DoorEntry516 = DoorEntryA(null, EventFlag.None,  0xC2C9, 0x0358, 0x01);
immutable DoorEntryA DoorEntry517 = DoorEntryA(null, EventFlag.None,  0x0288, 0x0325, 0x01);
immutable DoorEntryA DoorEntry518 = DoorEntryA(null, EventFlag.None,  0xC2E9, 0x03D0, 0x01);
immutable DoorEntryA DoorEntry519 = DoorEntryA(null, EventFlag.None,  0xC2C9, 0x03F4, 0x01);
immutable DoorEntryA DoorEntry520 = DoorEntryA(null, EventFlag.None,  0x02E8, 0x03CD, 0x01);
immutable DoorEntryA DoorEntry521 = DoorEntryA(null, EventFlag.UNKNOWN_1C4 | EVENT_FLAG_UNSET,  0xC2D9, 0x031C, 0x01);
immutable DoorEntryA DoorEntry522 = DoorEntryA(null, EventFlag.UNKNOWN_1C3 | EVENT_FLAG_UNSET,  0xC339, 0x031C, 0x01);
immutable DoorEntryA DoorEntry523 = DoorEntryA(null, EventFlag.None,  0x8299, 0x0383, 0x01);
immutable DoorEntryA DoorEntry524 = DoorEntryA(null, EventFlag.UNKNOWN_1C6 | EVENT_FLAG_UNSET,  0xC2F9, 0x031C, 0x01);
immutable DoorEntryA DoorEntry525 = DoorEntryA(null, EventFlag.UNKNOWN_1C5 | EVENT_FLAG_UNSET,  0xC319, 0x031C, 0x01);
immutable DoorEntryA DoorEntry526 = DoorEntryA(null, EventFlag.None,  0x82D9, 0x0303, 0x01);
immutable DoorEntryA DoorEntry527 = DoorEntryA(null, EventFlag.None,  0x82F9, 0x0303, 0x01);
immutable DoorEntryA DoorEntry528 = DoorEntryA(null, EventFlag.UNKNOWN_1CA | EVENT_FLAG_UNSET,  0xC325, 0x0308, 0x01);
immutable DoorEntryA DoorEntry529 = DoorEntryA(null, EventFlag.UNKNOWN_1C9 | EVENT_FLAG_UNSET,  0xC349, 0x0310, 0x01);
immutable DoorEntryA DoorEntry530 = DoorEntryA(null, EventFlag.None,  0x831B, 0x0303, 0x01);
immutable DoorEntryA DoorEntry531 = DoorEntryA(null, EventFlag.None,  0x0308, 0x0305, 0x01);
immutable DoorEntryA DoorEntry532 = DoorEntryA(null, EventFlag.None,  0x0308, 0x0309, 0x01);
immutable DoorEntryA DoorEntry533 = DoorEntryA(null, EventFlag.UNKNOWN_1C8 | EVENT_FLAG_UNSET,  0xC2F9, 0x035C, 0x01);
immutable DoorEntryA DoorEntry534 = DoorEntryA(null, EventFlag.UNKNOWN_1C7 | EVENT_FLAG_UNSET,  0xC359, 0x031C, 0x01);
immutable DoorEntryA DoorEntry535 = DoorEntryA(null, EventFlag.None,  0x8339, 0x0303, 0x01);
immutable DoorEntryA DoorEntry536 = DoorEntryA(null, EventFlag.UNKNOWN_1CE | EVENT_FLAG_UNSET,  0xC2E9, 0x034C, 0x01);
immutable DoorEntryA DoorEntry537 = DoorEntryA(null, EventFlag.UNKNOWN_1CD | EVENT_FLAG_UNSET,  0xC329, 0x035C, 0x01);
immutable DoorEntryA DoorEntry538 = DoorEntryA(null, EventFlag.None,  0x8359, 0x0303, 0x01);
immutable DoorEntryA DoorEntry539 = DoorEntryA(null, EventFlag.None,  0x02C8, 0x0345, 0x01);
immutable DoorEntryA DoorEntry540 = DoorEntryA(null, EventFlag.None,  0x02C8, 0x0355, 0x01);
immutable DoorEntryA DoorEntry541 = DoorEntryA(null, EventFlag.UNKNOWN_1CC | EVENT_FLAG_UNSET,  0xC309, 0x03CC, 0x01);
immutable DoorEntryA DoorEntry542 = DoorEntryA(null, EventFlag.UNKNOWN_1CB | EVENT_FLAG_UNSET,  0xC319, 0x037C, 0x01);
immutable DoorEntryA DoorEntry543 = DoorEntryA(null, EventFlag.None,  0x82F9, 0x0343, 0x01);
immutable DoorEntryA DoorEntry544 = DoorEntryA(null, EventFlag.None,  0x02E8, 0x03C5, 0x01);
immutable DoorEntryA DoorEntry545 = DoorEntryA(null, EventFlag.UNKNOWN_204 | EVENT_FLAG_UNSET,  0xC351, 0x03B4, 0x01);
immutable DoorEntryA DoorEntry546 = DoorEntryA(null, EventFlag.None,  0x8319, 0x0343, 0x01);
immutable DoorEntryA DoorEntry547 = DoorEntryA(null, EventFlag.None,  0x02C8, 0x03E5, 0x01);
immutable DoorEntryA DoorEntry548 = DoorEntryA(TextDoor548, EventFlag.None,  0xC4E6, 0x02CD, 0x01);
immutable DoorEntryA DoorEntry549 = DoorEntryA(TextDoor549, EventFlag.None,  0x827E, 0x0118, 0x01);
immutable DoorEntryA DoorEntry550 = DoorEntryA(null, EventFlag.None,  0xC4E6, 0x020D, 0x01);
immutable DoorEntryA DoorEntry551 = DoorEntryA(null, EventFlag.None,  0x84E6, 0x0232, 0x01);
immutable DoorEntryA DoorEntry552 = DoorEntryA(null, EventFlag.None,  0xC30D, 0x02DC, 0x01);
immutable DoorEntryA DoorEntry553 = DoorEntryA(null, EventFlag.None,  0x8339, 0x02A7, 0x04);
immutable DoorEntryA DoorEntry554 = DoorEntryA(TextDoor554, EventFlag.None,  0xC35D, 0x02FC, 0x04);
immutable DoorEntryA DoorEntry555 = DoorEntryA(TextDoor555, EventFlag.None,  0xC2A5, 0x02C8, 0x01);
immutable DoorEntryA DoorEntry556 = DoorEntryA(TextDoor556, EventFlag.UNKNOWN_092 | EVENT_FLAG_UNSET,  0xC357, 0x0296, 0x06);
immutable DoorEntryA DoorEntry557 = DoorEntryA(TextDoor001, EventFlag.None,  0x0184, 0x01BB, 0x01);
immutable DoorEntryA DoorEntry558 = DoorEntryA(null, EventFlag.None,  0xC2B5, 0x027C, 0x04);
immutable DoorEntryA DoorEntry559 = DoorEntryA(null, EventFlag.None,  0xC2FD, 0x02FC, 0x01);
immutable DoorEntryA DoorEntry560 = DoorEntryA(null, EventFlag.None,  0xC2AD, 0x0238, 0x06);
immutable DoorEntryA DoorEntry561 = DoorEntryA(TextDoor561, EventFlag.None,  0xC1AC, 0x0317, 0x01);
immutable DoorEntryA DoorEntry562 = DoorEntryA(null, EventFlag.None,  0x8209, 0x02A3, 0x04);
immutable DoorEntryA DoorEntry563 = DoorEntryA(null, EventFlag.None,  0x0308, 0x02B2, 0x07);
immutable DoorEntryA DoorEntry564 = DoorEntryA(null, EventFlag.None,  0x02DB, 0x02C9, 0x07);
immutable DoorEntryA DoorEntry565 = DoorEntryA(null, EventFlag.None,  0x02DB, 0x02D1, 0x07);
immutable DoorEntryA DoorEntry566 = DoorEntryA(TextDoor566, EventFlag.UNKNOWN_15E,  0x82A5, 0x02AB, 0x0D);
immutable DoorEntryA DoorEntry567 = DoorEntryA(null, EventFlag.None,  0xC281, 0x02C0, 0x07);
immutable DoorEntryA DoorEntry568 = DoorEntryA(null, EventFlag.None,  0xC2C1, 0x02C8, 0x07);
immutable DoorEntryA DoorEntry569 = DoorEntryA(null, EventFlag.None,  0x0327, 0x02ED, 0x07);
immutable DoorEntryA DoorEntry570 = DoorEntryA(null, EventFlag.None,  0xC28D, 0x0298, 0x07);
immutable DoorEntryA DoorEntry571 = DoorEntryA(null, EventFlag.None,  0x02DB, 0x02A9, 0x07);
immutable DoorEntryA DoorEntry572 = DoorEntryA(null, EventFlag.None,  0x02DB, 0x02B1, 0x07);
immutable DoorEntryA DoorEntry573 = DoorEntryA(TextDoor573, EventFlag.None,  0x830C, 0x0224, 0x07);
immutable DoorEntryA DoorEntry574 = DoorEntryA(null, EventFlag.None,  0xC28D, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry575 = DoorEntryA(null, EventFlag.None,  0xC2AD, 0x0298, 0x07);
immutable DoorEntryA DoorEntry576 = DoorEntryA(null, EventFlag.None,  0x0268, 0x02ED, 0x07);
immutable DoorEntryA DoorEntry577 = DoorEntryA(TextDoor577, EventFlag.UNKNOWN_15E,  0x832D, 0x02E3, 0x0D);
immutable DoorEntryA DoorEntry578 = DoorEntryA(null, EventFlag.None,  0x026B, 0x02AE, 0x07);
immutable DoorEntryA DoorEntry579 = DoorEntryA(null, EventFlag.None,  0x0288, 0x0290, 0x07);
immutable DoorEntryA DoorEntry580 = DoorEntryA(null, EventFlag.None,  0xC32B, 0x029A, 0x07);
immutable DoorEntryA DoorEntry581 = DoorEntryA(null, EventFlag.None,  0xC24F, 0x01AF, 0x0C);
immutable DoorEntryA DoorEntry582 = DoorEntryA(null, EventFlag.None,  0x82ED, 0x0283, 0x0F);
immutable DoorEntryA DoorEntry583 = DoorEntryA(null, EventFlag.None,  0xC2AD, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry584 = DoorEntryA(null, EventFlag.None,  0xC2CD, 0x0298, 0x07);
immutable DoorEntryA DoorEntry585 = DoorEntryA(null, EventFlag.None,  0x828D, 0x0283, 0x07);
immutable DoorEntryA DoorEntry586 = DoorEntryA(TextDoor586, EventFlag.UNKNOWN_15E,  0xC32D, 0x02F8, 0x0D);
immutable DoorEntryA DoorEntry587 = DoorEntryA(TextDoor587, EventFlag.None,  0x0278, 0x0285, 0x0D);
immutable DoorEntryA DoorEntry588 = DoorEntryA(TextDoor588, EventFlag.None,  0x0203, 0x01B0, 0x01);
immutable DoorEntryA DoorEntry589 = DoorEntryA(null, EventFlag.None,  0x02A8, 0x028A, 0x07);
immutable DoorEntryA DoorEntry590 = DoorEntryA(null, EventFlag.None,  0x8341, 0x0226, 0x07);
immutable DoorEntryA DoorEntry591 = DoorEntryA(null, EventFlag.None,  0xC2CD, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry592 = DoorEntryA(null, EventFlag.None,  0xC2ED, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry593 = DoorEntryA(null, EventFlag.None,  0x02A8, 0x0290, 0x07);
immutable DoorEntryA DoorEntry594 = DoorEntryA(TextDoor594, EventFlag.UNKNOWN_15E,  0xC30D, 0x02F8, 0x0D);
immutable DoorEntryA DoorEntry595 = DoorEntryA(null, EventFlag.None,  0x826D, 0x02E3, 0x07);
immutable DoorEntryA DoorEntry596 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry597 = DoorEntryA(null, EventFlag.None,  0x026B, 0x02C1, 0x07);
immutable DoorEntryA DoorEntry598 = DoorEntryA(null, EventFlag.None,  0x826D, 0x0283, 0x07);
immutable DoorEntryA DoorEntry599 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x0298, 0x07);
immutable DoorEntryA DoorEntry600 = DoorEntryA(null, EventFlag.None,  0x830D, 0x02E3, 0x07);
immutable DoorEntryA DoorEntry601 = DoorEntryA(null, EventFlag.None,  0x02C8, 0x0290, 0x07);
immutable DoorEntryA DoorEntry602 = DoorEntryA(null, EventFlag.None,  0x02F8, 0x02F1, 0x07);
immutable DoorEntryA DoorEntry603 = DoorEntryA(null, EventFlag.None,  0x82B1, 0x0223, 0x0F);
immutable DoorEntryA DoorEntry604 = DoorEntryA(TextDoor604, EventFlag.UNKNOWN_08F | EVENT_FLAG_UNSET,  0x82ED, 0x02E3, 0x07);
immutable DoorEntryA DoorEntry605 = DoorEntryA(null, EventFlag.UNKNOWN_298 | EVENT_FLAG_UNSET,  0xC209, 0x02BC, 0x0F);
immutable DoorEntryA DoorEntry606 = DoorEntryA(null, EventFlag.UNKNOWN_16A | EVENT_FLAG_UNSET,  0x02EC, 0x02C2, 0x07);
immutable DoorEntryA DoorEntry607 = DoorEntryA(null, EventFlag.None,  0x82CD, 0x0283, 0x07);
immutable DoorEntryA DoorEntry608 = DoorEntryA(null, EventFlag.None,  0xC2D9, 0x02E8, 0x07);
immutable DoorEntryA DoorEntry609 = DoorEntryA(null, EventFlag.None,  0xC31D, 0x02CC, 0x01);
immutable DoorEntryA DoorEntry610 = DoorEntryA(TextDoor101, EventFlag.None,  0xC24B, 0x0142, 0x01);
immutable DoorEntryA DoorEntry611 = DoorEntryA(null, EventFlag.None,  0xC27D, 0x02FC, 0x07);
immutable DoorEntryA DoorEntry612 = DoorEntryA(null, EventFlag.None,  0xC27D, 0x0238, 0x07);
immutable DoorEntryA DoorEntry613 = DoorEntryA(null, EventFlag.None,  0x832D, 0x02A3, 0x0F);
immutable DoorEntryA DoorEntry614 = DoorEntryA(null, EventFlag.None,  0xC33D, 0x02D8, 0x07);
immutable DoorEntryA DoorEntry615 = DoorEntryA(null, EventFlag.None,  0xC35D, 0x02D8, 0x07);
immutable DoorEntryA DoorEntry616 = DoorEntryA(null, EventFlag.None,  0xC1C9, 0x0173, 0x01);
immutable DoorEntryA DoorEntry617 = DoorEntryA(null, EventFlag.None,  0x82FD, 0x02E3, 0x01);
immutable DoorEntryA DoorEntry618 = DoorEntryA(null, EventFlag.None,  0xC2DD, 0x02DC, 0x07);
immutable DoorEntryA DoorEntry619 = DoorEntryA(TextDoor587, EventFlag.None,  0x02D8, 0x0285, 0x0D);
immutable DoorEntryA DoorEntry620 = DoorEntryA(null, EventFlag.None,  0x032C, 0x02C5, 0x07);
immutable DoorEntryA DoorEntry621 = DoorEntryA(null, EventFlag.None,  0x829D, 0x02E3, 0x07);
immutable DoorEntryA DoorEntry622 = DoorEntryA(null, EventFlag.None,  0x830D, 0x02A3, 0x0F);
immutable DoorEntryA DoorEntry623 = DoorEntryA(null, EventFlag.None,  0xC31D, 0x02FC, 0x07);
immutable DoorEntryA DoorEntry624 = DoorEntryA(null, EventFlag.None,  0xC34D, 0x02DC, 0x07);
immutable DoorEntryA DoorEntry625 = DoorEntryA(null, EventFlag.None,  0x0318, 0x02B1, 0x07);
immutable DoorEntryA DoorEntry626 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x02CC, 0x07);
immutable DoorEntryA DoorEntry627 = DoorEntryA(TextDoor587, EventFlag.None,  0x0298, 0x0285, 0x0D);
immutable DoorEntryA DoorEntry628 = DoorEntryA(TextDoor628, EventFlag.UNKNOWN_08E | EVENT_FLAG_UNSET,  0x02B8, 0x0285, 0x0D);
immutable DoorEntryA DoorEntry629 = DoorEntryA(null, EventFlag.None,  0xC2BD, 0x02FC, 0x07);
immutable DoorEntryA DoorEntry630 = DoorEntryA(TextDoor630, EventFlag.None,  0xC218, 0x01C2, 0x0C);
immutable DoorEntryA DoorEntry631 = DoorEntryA(null, EventFlag.None,  0x032C, 0x02D1, 0x07);
immutable DoorEntryA DoorEntry632 = DoorEntryA(null, EventFlag.None,  0x0318, 0x02BD, 0x07);
immutable DoorEntryA DoorEntry633 = DoorEntryA(TextDoor633, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x035E, 0x02BE, 0x00);
immutable DoorEntryA DoorEntry634 = DoorEntryA(null, EventFlag.UNKNOWN_03A | EVENT_FLAG_UNSET,  0xC35D, 0x02BC, 0x07);
immutable DoorEntryA DoorEntry635 = DoorEntryA(null, EventFlag.None,  0x835D, 0x02E2, 0x01);
immutable DoorEntryA DoorEntry636 = DoorEntryA(TextDoor636, EventFlag.None,  0xC2DD, 0x026C, 0x07);
immutable DoorEntryA DoorEntry637 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x023C, 0x07);
immutable DoorEntryA DoorEntry638 = DoorEntryA(TextDoor638, EventFlag.None,  0x823E, 0x0179, 0x0A);
immutable DoorEntryA DoorEntry639 = DoorEntryA(null, EventFlag.UNKNOWN_176 | EVENT_FLAG_UNSET,  0xC34D, 0x02BC, 0x07);
immutable DoorEntryA DoorEntry640 = DoorEntryA(TextDoor640, EventFlag.None,  0x02A8, 0x0259, 0x07);
immutable DoorEntryA DoorEntry641 = DoorEntryA(TextDoor641, EventFlag.None,  0xC1E2, 0x0142, 0x0A);
immutable DoorEntryA DoorEntry642 = DoorEntryA(TextDoor642, EventFlag.None,  0x82DD, 0x0233, 0x07);
immutable DoorEntryA DoorEntry643 = DoorEntryA(TextDoor004, EventFlag.None,  0x0044, 0x0283, 0x01);
immutable DoorEntryA DoorEntry644 = DoorEntryA(null, EventFlag.None,  0x8299, 0x0227, 0x07);
immutable DoorEntryA DoorEntry645 = DoorEntryA(null, EventFlag.None,  0x82AB, 0x024D, 0x07);
immutable DoorEntryA DoorEntry646 = DoorEntryA(null, EventFlag.None,  0xC297, 0x027B, 0x01);
immutable DoorEntryA DoorEntry647 = DoorEntryA(TextDoor647, EventFlag.None,  0x0217, 0x0192, 0x0A);
immutable DoorEntryA DoorEntry648 = DoorEntryA(null, EventFlag.None,  0x01D9, 0x01B0, 0x0A);
immutable DoorEntryA DoorEntry649 = DoorEntryA(null, EventFlag.None,  0x82F1, 0x02AB, 0x0F);
immutable DoorEntryA DoorEntry650 = DoorEntryA(null, EventFlag.None,  0xC0B2, 0x001D, 0x01);
immutable DoorEntryA DoorEntry651 = DoorEntryA(null, EventFlag.None,  0xC0B6, 0x001D, 0x01);
immutable DoorEntryA DoorEntry652 = DoorEntryA(null, EventFlag.None,  0x435A, 0x02AD, 0x01);
immutable DoorEntryA DoorEntry653 = DoorEntryA(null, EventFlag.None,  0xC1BC, 0x02D7, 0x07);
immutable DoorEntryA DoorEntry654 = DoorEntryA(null, EventFlag.None,  0xC22C, 0x0217, 0x07);
immutable DoorEntryA DoorEntry655 = DoorEntryA(null, EventFlag.None,  0x81B6, 0x0362, 0x01);
immutable DoorEntryA DoorEntry656 = DoorEntryA(null, EventFlag.None,  0x81BA, 0x0362, 0x01);
immutable DoorEntryA DoorEntry657 = DoorEntryA(null, EventFlag.None,  0x8056, 0x0262, 0x01);
immutable DoorEntryA DoorEntry658 = DoorEntryA(null, EventFlag.None,  0x805A, 0x0262, 0x01);
immutable DoorEntryA DoorEntry659 = DoorEntryA(null, EventFlag.None,  0x0054, 0x0299, 0x07);
immutable DoorEntryA DoorEntry660 = DoorEntryA(null, EventFlag.None,  0x004C, 0x02BD, 0x07);
immutable DoorEntryA DoorEntry661 = DoorEntryA(null, EventFlag.None,  0xC056, 0x02FD, 0x01);
immutable DoorEntryA DoorEntry662 = DoorEntryA(null, EventFlag.None,  0xC05A, 0x02FD, 0x01);
immutable DoorEntryA DoorEntry663 = DoorEntryA(null, EventFlag.None,  0xC24C, 0x0217, 0x07);
immutable DoorEntryA DoorEntry664 = DoorEntryA(null, EventFlag.None,  0x8196, 0x0182, 0x01);
immutable DoorEntryA DoorEntry665 = DoorEntryA(null, EventFlag.None,  0x819A, 0x0182, 0x01);
immutable DoorEntryA DoorEntry666 = DoorEntryA(null, EventFlag.None,  0x01AC, 0x039D, 0x07);
immutable DoorEntryA DoorEntry667 = DoorEntryA(null, EventFlag.None,  0xC1B6, 0x03FD, 0x01);
immutable DoorEntryA DoorEntry668 = DoorEntryA(null, EventFlag.None,  0xC1BA, 0x03FD, 0x01);
immutable DoorEntryA DoorEntry669 = DoorEntryA(TextDoor669, EventFlag.None,  0x4200, 0x01ED, 0x01);
immutable DoorEntryA DoorEntry670 = DoorEntryA(null, EventFlag.None,  0xC26C, 0x021B, 0x07);
immutable DoorEntryA DoorEntry671 = DoorEntryA(null, EventFlag.None,  0x0194, 0x01A9, 0x07);
immutable DoorEntryC DoorEntry672 = DoorEntryC(TextDoor672);
immutable DoorEntryC DoorEntry673 = DoorEntryC(TextDoor673);
immutable DoorEntryC DoorEntry674 = DoorEntryC(TextDoor674);
immutable DoorEntryA DoorEntry675 = DoorEntryA(TextDoor675, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x02DB, 0x02B9, 0x00);
immutable DoorEntryC DoorEntry676 = DoorEntryC(TextDoor676);
immutable DoorEntryC DoorEntry677 = DoorEntryC(TextDoor677);
immutable DoorEntryC DoorEntry678 = DoorEntryC(TextDoor678);
immutable DoorEntryC DoorEntry679 = DoorEntryC(TextDoor679);
immutable DoorEntryC DoorEntry680 = DoorEntryC(TextDoor680);
immutable DoorEntryC DoorEntry681 = DoorEntryC(TextDoor681);
immutable DoorEntryA DoorEntry682 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x035C, 0x04);
immutable DoorEntryA DoorEntry683 = DoorEntryA(TextDoor367, EventFlag.None,  0xC478, 0x03AB, 0x04);
immutable DoorEntryA DoorEntry684 = DoorEntryA(null, EventFlag.None,  0xC47D, 0x035C, 0x04);
immutable DoorEntryA DoorEntry685 = DoorEntryA(TextDoor685, EventFlag.HAVE_STOIC_CLUB_RESERVATION | EVENT_FLAG_UNSET,  0xC47A, 0x03D9, 0x01);
immutable DoorEntryA DoorEntry686 = DoorEntryA(TextDoor686, EventFlag.None,  0xC4AD, 0x037C, 0x04);
immutable DoorEntryA DoorEntry687 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x035C, 0x04);
immutable DoorEntryA DoorEntry688 = DoorEntryA(null, EventFlag.None,  0xC4CD, 0x03D4, 0x04);
immutable DoorEntryA DoorEntry689 = DoorEntryA(TextDoor367, EventFlag.None,  0xC4AD, 0x035C, 0x04);
immutable DoorEntryA DoorEntry690 = DoorEntryA(TextDoor367, EventFlag.None,  0xC4A9, 0x0390, 0x04);
immutable DoorEntryA DoorEntry691 = DoorEntryA(TextDoor367, EventFlag.None,  0xC4A9, 0x03D0, 0x04);
immutable DoorEntryA DoorEntry692 = DoorEntryA(TextDoor367, EventFlag.None,  0xC4CD, 0x0354, 0x04);
immutable DoorEntryA DoorEntry693 = DoorEntryA(TextDoor367, EventFlag.None,  0xC4CD, 0x0394, 0x04);
immutable DoorEntryA DoorEntry694 = DoorEntryA(null, EventFlag.None,  0x04BC, 0x03C9, 0x07);
immutable DoorEntryA DoorEntry695 = DoorEntryA(null, EventFlag.None,  0x04BC, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry696 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x0398, 0x07);
immutable DoorEntryA DoorEntry697 = DoorEntryA(null, EventFlag.None,  0x0157, 0x032D, 0x0A);
immutable DoorEntryA DoorEntry698 = DoorEntryA(null, EventFlag.None,  0x84BD, 0x03C3, 0x0F);
immutable DoorEntryA DoorEntry699 = DoorEntryA(null, EventFlag.None,  0x04B8, 0x0352, 0x07);
immutable DoorEntryA DoorEntry700 = DoorEntryA(null, EventFlag.None,  0xC46D, 0x0354, 0x07);
immutable DoorEntryA DoorEntry701 = DoorEntryA(null, EventFlag.None,  0xC46D, 0x03D4, 0x07);
immutable DoorEntryA DoorEntry702 = DoorEntryA(null, EventFlag.None,  0x84BD, 0x0343, 0x0F);
immutable DoorEntryA DoorEntry703 = DoorEntryA(null, EventFlag.None,  0x84AD, 0x03A3, 0x0F);
immutable DoorEntryA DoorEntry704 = DoorEntryA(TextDoor704, EventFlag.None,  0x84AD, 0x0362, 0x01);
immutable DoorEntryA DoorEntry705 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x039C, 0x07);
immutable DoorEntryA DoorEntry706 = DoorEntryA(null, EventFlag.None,  0xC470, 0x03F3, 0x0F);
immutable DoorEntryA DoorEntry707 = DoorEntryA(null, EventFlag.None,  0xC478, 0x03FB, 0x0F);
immutable DoorEntryA DoorEntry708 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x03DC, 0x07);
immutable DoorEntryA DoorEntry709 = DoorEntryA(null, EventFlag.None,  0x849D, 0x0343, 0x0F);
immutable DoorEntryA DoorEntry710 = DoorEntryA(null, EventFlag.None,  0x0154, 0x0297, 0x0A);
immutable DoorEntryA DoorEntry711 = DoorEntryA(TextDoor711, EventFlag.None,  0x0154, 0x0268, 0x0A);
immutable DoorEntryA DoorEntry712 = DoorEntryA(null, EventFlag.None,  0x0155, 0x02C2, 0x0F);
immutable DoorEntryA DoorEntry713 = DoorEntryA(null, EventFlag.None,  0x8449, 0x038B, 0x0F);
immutable DoorEntryA DoorEntry714 = DoorEntryA(null, EventFlag.None,  0x845C, 0x0384, 0x0F);
immutable DoorEntryA DoorEntry715 = DoorEntryA(null, EventFlag.None,  0xC45C, 0x03BB, 0x0F);
immutable DoorEntryA DoorEntry716 = DoorEntryA(TextDoor716, EventFlag.None,  0x0155, 0x0237, 0x0A);
immutable DoorEntryA DoorEntry717 = DoorEntryA(null, EventFlag.None,  0x0448, 0x0398, 0x07);
immutable DoorEntryA DoorEntry718 = DoorEntryA(null, EventFlag.None,  0x0448, 0x03A8, 0x07);
immutable DoorEntryA DoorEntry719 = DoorEntryA(TextDoor711, EventFlag.None,  0x0163, 0x0362, 0x0A);
immutable DoorEntryA DoorEntry720 = DoorEntryA(null, EventFlag.None,  0xC457, 0x0379, 0x01);
immutable DoorEntryA DoorEntry721 = DoorEntryA(TextDoor647, EventFlag.None,  0x0152, 0x02EE, 0x0A);
immutable DoorEntryA DoorEntry722 = DoorEntryA(TextDoor711, EventFlag.None,  0x0163, 0x0376, 0x0A);
immutable DoorEntryA DoorEntry723 = DoorEntryA(null, EventFlag.None,  0x84AD, 0x03E3, 0x07);
immutable DoorEntryA DoorEntry724 = DoorEntryA(null, EventFlag.None,  0x8455, 0x0347, 0x0F);
immutable DoorEntryA DoorEntry725 = DoorEntryA(TextDoor725, EventFlag.None,  0x0163, 0x0382, 0x0A);
immutable DoorEntryA DoorEntry726 = DoorEntryA(null, EventFlag.None,  0x04A8, 0x03AD, 0x07);
immutable DoorEntryA DoorEntry727 = DoorEntryA(TextDoor711, EventFlag.None,  0x0163, 0x0396, 0x0A);
immutable DoorEntryA DoorEntry728 = DoorEntryA(TextDoor711, EventFlag.None,  0x0163, 0x03A2, 0x0A);
immutable DoorEntryA DoorEntry729 = DoorEntryA(null, EventFlag.None,  0x015B, 0x036A, 0x0A);
immutable DoorEntryC DoorEntry730 = DoorEntryC(TextDoor730);
immutable DoorEntryC DoorEntry731 = DoorEntryC(TextDoor731);
immutable DoorEntryC DoorEntry732 = DoorEntryC(TextDoor732);
immutable DoorEntryC DoorEntry733 = DoorEntryC(TextDoor733);
immutable DoorEntryC DoorEntry734 = DoorEntryC(TextDoor734);
immutable DoorEntryC DoorEntry735 = DoorEntryC(TextDoor735);
immutable DoorEntryC DoorEntry736 = DoorEntryC(TextDoor736);
immutable DoorEntryC DoorEntry737 = DoorEntryC(TextDoor737);
immutable DoorEntryA DoorEntry738 = DoorEntryA(TextDoor738, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x015B, 0x038B, 0x00);
immutable DoorEntryA DoorEntry739 = DoorEntryA(TextDoor739, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x015B, 0x03AB, 0x00);
immutable DoorEntryC DoorEntry740 = DoorEntryC(TextDoor740);
immutable DoorEntryC DoorEntry741 = DoorEntryC(TextDoor741);
immutable DoorEntryC DoorEntry742 = DoorEntryC(TextDoor742);
immutable DoorEntryA DoorEntry743 = DoorEntryA(null, EventFlag.None,  0xC411, 0x03F8, 0x01);
immutable DoorEntryA DoorEntry744 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3C9, 0x0370, 0x01);
immutable DoorEntryA DoorEntry745 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3F9, 0x03B4, 0x01);
immutable DoorEntryA DoorEntry746 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3E9, 0x0370, 0x01);
immutable DoorEntryA DoorEntry747 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3D9, 0x03B0, 0x01);
immutable DoorEntryA DoorEntry748 = DoorEntryA(TextDoor004, EventFlag.UNKNOWN_28C | EVENT_FLAG_UNSET,  0xC396, 0x021C, 0x01);
immutable DoorEntryA DoorEntry749 = DoorEntryA(TextDoor001, EventFlag.None,  0x82B1, 0x0103, 0x01);
immutable DoorEntryA DoorEntry750 = DoorEntryA(TextDoor711, EventFlag.None,  0x01D4, 0x0220, 0x01);
immutable DoorEntryA DoorEntry751 = DoorEntryA(TextDoor711, EventFlag.None,  0x01E4, 0x0250, 0x01);
immutable DoorEntryA DoorEntry752 = DoorEntryA(TextDoor711, EventFlag.None,  0x01F4, 0x0228, 0x01);
immutable DoorEntryA DoorEntry753 = DoorEntryA(TextDoor711, EventFlag.None,  0x01EC, 0x0218, 0x01);
immutable DoorEntryA DoorEntry754 = DoorEntryA(null, EventFlag.None,  0x8411, 0x03C7, 0x01);
immutable DoorEntryA DoorEntry755 = DoorEntryA(null, EventFlag.None,  0xC411, 0x0368, 0x01);
immutable DoorEntryA DoorEntry756 = DoorEntryA(TextDoor101, EventFlag.None,  0x01BA, 0x0239, 0x01);
immutable DoorEntryA DoorEntry757 = DoorEntryA(null, EventFlag.None,  0x023A, 0x024E, 0x05);
immutable DoorEntryA DoorEntry758 = DoorEntryA(null, EventFlag.None,  0xC436, 0x023C, 0x01);
immutable DoorEntryA DoorEntry759 = DoorEntryA(null, EventFlag.None,  0x020A, 0x021D, 0x01);
immutable DoorEntryA DoorEntry760 = DoorEntryA(null, EventFlag.None,  0x0437, 0x0221, 0x05);
immutable DoorEntryA DoorEntry761 = DoorEntryA(null, EventFlag.None,  0x0437, 0x0234, 0x05);
immutable DoorEntryA DoorEntry762 = DoorEntryA(null, EventFlag.None,  0x0397, 0x01F1, 0x05);
immutable DoorEntryA DoorEntry763 = DoorEntryA(null, EventFlag.None,  0x02B7, 0x012E, 0x05);
immutable DoorEntryA DoorEntry764 = DoorEntryA(null, EventFlag.None,  0x8399, 0x01E7, 0x01);
immutable DoorEntryA DoorEntry765 = DoorEntryA(TextDoor765, EventFlag.DEFEATED_SANCTUARY_BOSS_6 | EVENT_FLAG_UNSET,  0x0306, 0x01C5, 0x01);
immutable DoorEntryA DoorEntry766 = DoorEntryA(null, EventFlag.None,  0x047A, 0x0216, 0x05);
immutable DoorEntryA DoorEntry767 = DoorEntryA(null, EventFlag.None,  0xC42D, 0x03E8, 0x01);
immutable DoorEntryA DoorEntry768 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3D9, 0x0334, 0x01);
immutable DoorEntryA DoorEntry769 = DoorEntryA(null, EventFlag.None,  0xC3B9, 0x0334, 0x01);
immutable DoorEntryA DoorEntry770 = DoorEntryA(null, EventFlag.None,  0xC36B, 0x03E6, 0x01);
immutable DoorEntryA DoorEntry771 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3F9, 0x0334, 0x01);
immutable DoorEntryA DoorEntry772 = DoorEntryA(TextDoor004, EventFlag.None,  0x8139, 0x02C7, 0x01);
immutable DoorEntryA DoorEntry773 = DoorEntryA(TextDoor773, EventFlag.UNKNOWN_2F4,  0xC1A9, 0x033C, 0x01);
immutable DoorEntryC DoorEntry774 = DoorEntryC(TextDoor774);
immutable DoorEntryB DoorEntry775 = DoorEntryB(EventFlag.SCARABA_REACHED | EVENT_FLAG_UNSET, TextDoor775);
immutable DoorEntryB DoorEntry776 = DoorEntryB(EventFlag.UNKNOWN_098 | EVENT_FLAG_UNSET, TextDoor776);
immutable DoorEntryB DoorEntry777 = DoorEntryB(EventFlag.UNKNOWN_098 | EVENT_FLAG_UNSET, TextDoor777);
immutable DoorEntryB DoorEntry778 = DoorEntryB(EventFlag.UNKNOWN_098 | EVENT_FLAG_UNSET, TextDoor778);
immutable DoorEntryB DoorEntry779 = DoorEntryB(EventFlag.UNKNOWN_098 | EVENT_FLAG_UNSET, TextDoor779);
immutable DoorEntryA DoorEntry780 = DoorEntryA(TextDoor780, EventFlag.None,  0x0205, 0x0099, 0x01);
immutable DoorEntryA DoorEntry781 = DoorEntryA(null, EventFlag.None,  0x0200, 0x00CC, 0x01);
immutable DoorEntryA DoorEntry782 = DoorEntryA(TextDoor711, EventFlag.None,  0x01F8, 0x00B8, 0x01);
immutable DoorEntryA DoorEntry783 = DoorEntryA(TextDoor711, EventFlag.None,  0x0204, 0x00AC, 0x01);
immutable DoorEntryA DoorEntry784 = DoorEntryA(null, EventFlag.None,  0x01F8, 0x00A4, 0x01);
immutable DoorEntryA DoorEntry785 = DoorEntryA(null, EventFlag.None,  0x0263, 0x00DF, 0x01);
immutable DoorEntryA DoorEntry786 = DoorEntryA(null, EventFlag.None,  0x80BD, 0x0023, 0x01);
immutable DoorEntryA DoorEntry787 = DoorEntryA(null, EventFlag.None,  0xC139, 0x02D0, 0x01);
immutable DoorEntryA DoorEntry788 = DoorEntryA(null, EventFlag.None,  0x8239, 0x0207, 0x01);
immutable DoorEntryA DoorEntry789 = DoorEntryA(null, EventFlag.None,  0xC0A9, 0x0044, 0x01);
immutable DoorEntryA DoorEntry790 = DoorEntryA(null, EventFlag.None,  0x831D, 0x0167, 0x01);
immutable DoorEntryA DoorEntry791 = DoorEntryA(null, EventFlag.None,  0x81D1, 0x0063, 0x01);
immutable DoorEntryA DoorEntry792 = DoorEntryA(null, EventFlag.None,  0xC239, 0x0214, 0x01);
immutable DoorEntryA DoorEntry793 = DoorEntryA(null, EventFlag.None,  0xC19D, 0x0208, 0x01);
immutable DoorEntryA DoorEntry794 = DoorEntryA(null, EventFlag.None,  0x84B9, 0x0223, 0x01);
immutable DoorEntryA DoorEntry795 = DoorEntryA(null, EventFlag.UNKNOWN_15B | EVENT_FLAG_UNSET,  0x02BE, 0x0206, 0x05);
immutable DoorEntryA DoorEntry796 = DoorEntryA(null, EventFlag.None,  0xC2E9, 0x01B4, 0x01);
immutable DoorEntryA DoorEntry797 = DoorEntryA(null, EventFlag.None,  0xC259, 0x020C, 0x01);
immutable DoorEntryA DoorEntry798 = DoorEntryA(null, EventFlag.None,  0x81CD, 0x0067, 0x01);
immutable DoorEntryA DoorEntry799 = DoorEntryA(null, EventFlag.None,  0x8189, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry800 = DoorEntryA(null, EventFlag.None,  0xC1CD, 0x0078, 0x01);
immutable DoorEntryA DoorEntry801 = DoorEntryA(null, EventFlag.None,  0x8279, 0x0207, 0x01);
immutable DoorEntryA DoorEntry802 = DoorEntryA(null, EventFlag.None,  0xC4CD, 0x024C, 0x01);
immutable DoorEntryA DoorEntry803 = DoorEntryA(null, EventFlag.None,  0x8429, 0x01C7, 0x01);
immutable DoorEntryA DoorEntry804 = DoorEntryA(null, EventFlag.None,  0xC279, 0x0214, 0x01);
immutable DoorEntryA DoorEntry805 = DoorEntryA(null, EventFlag.UNKNOWN_1B3 | EVENT_FLAG_UNSET,  0x8299, 0x0207, 0x01);
immutable DoorEntryA DoorEntry806 = DoorEntryA(null, EventFlag.None,  0xC45D, 0x0218, 0x01);
immutable DoorEntryA DoorEntry807 = DoorEntryA(TextDoor807, EventFlag.UNKNOWN_15C | EVENT_FLAG_UNSET,  0x81BD, 0x0283, 0x01);
immutable DoorEntryA DoorEntry808 = DoorEntryA(null, EventFlag.None,  0xC2B9, 0x0214, 0x01);
immutable DoorEntryA DoorEntry809 = DoorEntryA(null, EventFlag.None,  0x82D9, 0x0203, 0x01);
immutable DoorEntryA DoorEntry810 = DoorEntryA(null, EventFlag.None,  0xC1A9, 0x02AC, 0x01);
immutable DoorEntryA DoorEntry811 = DoorEntryA(null, EventFlag.None,  0x02F9, 0x020A, 0x05);
immutable DoorEntryA DoorEntry812 = DoorEntryA(null, EventFlag.None,  0x81BD, 0x02E3, 0x01);
immutable DoorEntryA DoorEntry813 = DoorEntryA(null, EventFlag.None,  0xC2F9, 0x0210, 0x01);
immutable DoorEntryA DoorEntry814 = DoorEntryA(TextDoor814, EventFlag.None,  0x02AC, 0x00D7, 0x01);
immutable ushort DoorEntry815 = 0x015B;
immutable DoorEntryC DoorEntry816 = DoorEntryC(TextDoor816);
immutable DoorEntryC DoorEntry817 = DoorEntryC(TextDoor817);
immutable DoorEntryA DoorEntry818 = DoorEntryA(null, EventFlag.None,  0x4048, 0x0025, 0x01);
immutable DoorEntryA DoorEntry819 = DoorEntryA(null, EventFlag.None,  0x004A, 0x0035, 0x01);
immutable DoorEntryA DoorEntry820 = DoorEntryA(null, EventFlag.None,  0x004A, 0x002D, 0x01);
immutable DoorEntryA DoorEntry821 = DoorEntryA(null, EventFlag.None,  0x4048, 0x003D, 0x01);
immutable DoorEntryA DoorEntry822 = DoorEntryA(null, EventFlag.None,  0xC34A, 0x02F8, 0x01);
immutable DoorEntryA DoorEntry823 = DoorEntryA(null, EventFlag.None,  0x8055, 0x020B, 0x01);
immutable DoorEntryA DoorEntry824 = DoorEntryA(TextDoor824, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0270, 0x00A7, 0x01);
immutable DoorEntryA DoorEntry825 = DoorEntryA(null, EventFlag.None,  0x0002, 0x0227, 0x01);
immutable DoorEntryA DoorEntry826 = DoorEntryA(null, EventFlag.None,  0x0003, 0x022D, 0x01);
immutable DoorEntryA DoorEntry827 = DoorEntryA(null, EventFlag.None,  0x0002, 0x0233, 0x01);
immutable DoorEntryA DoorEntry828 = DoorEntryA(null, EventFlag.None,  0x0003, 0x0239, 0x01);
immutable DoorEntryA DoorEntry829 = DoorEntryA(null, EventFlag.None,  0x4310, 0x01E5, 0x01);
immutable DoorEntryA DoorEntry830 = DoorEntryA(null, EventFlag.None,  0x003B, 0x023D, 0x05);
immutable DoorEntryA DoorEntry831 = DoorEntryA(null, EventFlag.None,  0x0053, 0x0234, 0x05);
immutable DoorEntryA DoorEntry832 = DoorEntryA(null, EventFlag.None,  0x0063, 0x0015, 0x01);
immutable DoorEntryA DoorEntry833 = DoorEntryA(null, EventFlag.None,  0x441C, 0x00C5, 0x01);
immutable DoorEntryA DoorEntry834 = DoorEntryA(null, EventFlag.None,  0x0075, 0x002C, 0x05);
immutable DoorEntryA DoorEntry835 = DoorEntryA(null, EventFlag.None,  0x0075, 0x0041, 0x05);
immutable DoorEntryA DoorEntry836 = DoorEntryA(null, EventFlag.None,  0x0317, 0x01F5, 0x01);
immutable DoorEntryA DoorEntry837 = DoorEntryA(null, EventFlag.None,  0x0324, 0x020A, 0x05);
immutable DoorEntryA DoorEntry838 = DoorEntryA(null, EventFlag.None,  0x0328, 0x01FA, 0x05);
immutable DoorEntryA DoorEntry839 = DoorEntryA(TextDoor839, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x000A, 0x0251, 0x00);
immutable DoorEntryC DoorEntry840 = DoorEntryC(TextDoor840);
immutable DoorEntryC DoorEntry841 = DoorEntryC(TextDoor841);
immutable DoorEntryC DoorEntry842 = DoorEntryC(TextDoor842);
immutable DoorEntryC DoorEntry843 = DoorEntryC(TextDoor843);
immutable DoorEntryC DoorEntry844 = DoorEntryC(TextDoor844);
immutable DoorEntryC DoorEntry845 = DoorEntryC(TextDoor845);
immutable DoorEntryC DoorEntry846 = DoorEntryC(TextDoor846);
immutable DoorEntryC DoorEntry847 = DoorEntryC(TextDoor847);
immutable DoorEntryC DoorEntry848 = DoorEntryC(TextDoor848);
immutable DoorEntryC DoorEntry849 = DoorEntryC(TextDoor849);
immutable DoorEntryC DoorEntry850 = DoorEntryC(TextDoor850);
immutable DoorEntryC DoorEntry851 = DoorEntryC(TextDoor851);
immutable DoorEntryC DoorEntry852 = DoorEntryC(TextDoor852);
immutable DoorEntryC DoorEntry853 = DoorEntryC(TextDoor853);
immutable DoorEntryC DoorEntry854 = DoorEntryC(TextDoor854);
immutable DoorEntryC DoorEntry855 = DoorEntryC(TextDoor855);
immutable DoorEntryC DoorEntry856 = DoorEntryC(TextDoor856);
immutable DoorEntryC DoorEntry857 = DoorEntryC(TextDoor857);
immutable DoorEntryC DoorEntry858 = DoorEntryC(TextDoor858);
immutable DoorEntryC DoorEntry859 = DoorEntryC(TextDoor859);
immutable DoorEntryC DoorEntry860 = DoorEntryC(TextDoor860);
immutable DoorEntryC DoorEntry861 = DoorEntryC(TextDoor861);
immutable DoorEntryC DoorEntry862 = DoorEntryC(TextDoor862);
immutable DoorEntryC DoorEntry863 = DoorEntryC(TextDoor863);
immutable DoorEntryC DoorEntry864 = DoorEntryC(TextDoor864);
immutable DoorEntryC DoorEntry865 = DoorEntryC(TextDoor865);
immutable DoorEntryC DoorEntry866 = DoorEntryC(TextDoor866);
immutable DoorEntryC DoorEntry867 = DoorEntryC(TextDoor867);
immutable DoorEntryC DoorEntry868 = DoorEntryC(TextDoor868);
immutable DoorEntryC DoorEntry869 = DoorEntryC(TextDoor869);
immutable DoorEntryC DoorEntry870 = DoorEntryC(TextDoor870);
immutable DoorEntryC DoorEntry871 = DoorEntryC(TextDoor871);
immutable DoorEntryC DoorEntry872 = DoorEntryC(TextDoor872);
immutable DoorEntryC DoorEntry873 = DoorEntryC(TextDoor873);
immutable DoorEntryC DoorEntry874 = DoorEntryC(TextDoor874);
immutable DoorEntryC DoorEntry875 = DoorEntryC(TextDoor875);
immutable DoorEntryC DoorEntry876 = DoorEntryC(TextDoor876);
immutable DoorEntryC DoorEntry877 = DoorEntryC(TextDoor877);
immutable DoorEntryC DoorEntry878 = DoorEntryC(TextDoor878);
immutable DoorEntryC DoorEntry879 = DoorEntryC(TextDoor879);
immutable DoorEntryC DoorEntry880 = DoorEntryC(TextDoor880);
immutable DoorEntryC DoorEntry881 = DoorEntryC(TextDoor881);
immutable DoorEntryC DoorEntry882 = DoorEntryC(TextDoor882);
immutable DoorEntryC DoorEntry883 = DoorEntryC(TextDoor883);
immutable DoorEntryA DoorEntry884 = DoorEntryA(TextDoor884, EventFlag.None,  0xC00E, 0x0054, 0x01);
immutable DoorEntryA DoorEntry885 = DoorEntryA(TextDoor885, EventFlag.DEFEATED_SANCTUARY_BOSS_7 | EVENT_FLAG_UNSET,  0x0257, 0x0392, 0x05);
immutable DoorEntryA DoorEntry886 = DoorEntryA(null, EventFlag.None,  0x010B, 0x01C9, 0x01);
immutable DoorEntryA DoorEntry887 = DoorEntryA(null, EventFlag.None,  0x0107, 0x01E1, 0x01);
immutable DoorEntryA DoorEntry888 = DoorEntryA(null, EventFlag.None,  0x0139, 0x018C, 0x05);
immutable DoorEntryA DoorEntry889 = DoorEntryA(null, EventFlag.None,  0x0143, 0x018D, 0x01);
immutable DoorEntryA DoorEntry890 = DoorEntryA(null, EventFlag.None,  0x0137, 0x01A1, 0x01);
immutable DoorEntryA DoorEntry891 = DoorEntryA(null, EventFlag.None,  0x015F, 0x01A6, 0x05);
immutable DoorEntryA DoorEntry892 = DoorEntryA(null, EventFlag.None,  0x013F, 0x01E5, 0x01);
immutable DoorEntryA DoorEntry893 = DoorEntryA(null, EventFlag.None,  0x015F, 0x018D, 0x01);
immutable DoorEntryA DoorEntry894 = DoorEntryA(null, EventFlag.None,  0x016F, 0x01CD, 0x01);
immutable DoorEntryA DoorEntry895 = DoorEntryA(null, EventFlag.None,  0x8151, 0x0087, 0x01);
immutable DoorEntryA DoorEntry896 = DoorEntryA(null, EventFlag.None,  0x4014, 0x01C7, 0x01);
immutable DoorEntryA DoorEntry897 = DoorEntryA(null, EventFlag.None,  0x4010, 0x01E1, 0x01);
immutable DoorEntryA DoorEntry898 = DoorEntryA(null, EventFlag.None,  0x4040, 0x01A3, 0x01);
immutable DoorEntryA DoorEntry899 = DoorEntryA(null, EventFlag.None,  0x404C, 0x018D, 0x01);
immutable DoorEntryA DoorEntry900 = DoorEntryA(null, EventFlag.None,  0x4068, 0x018D, 0x01);
immutable DoorEntryA DoorEntry901 = DoorEntryA(null, EventFlag.None,  0x4074, 0x01CF, 0x01);
immutable DoorEntryA DoorEntry902 = DoorEntryA(null, EventFlag.None,  0x4044, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry903 = DoorEntryA(TextDoor903, EventFlag.None,  0x0090, 0x018F, 0x21);
immutable DoorEntryA DoorEntry904 = DoorEntryA(TextDoor904, EventFlag.None,  0x0371, 0x0232, 0x01);
immutable DoorEntryA DoorEntry905 = DoorEntryA(null, EventFlag.UNKNOWN_099 | EVENT_FLAG_UNSET,  0x0142, 0x0093, 0x01);
immutable DoorEntryA DoorEntry906 = DoorEntryA(null, EventFlag.None,  0x4030, 0x0013, 0x01);
immutable DoorEntryA DoorEntry907 = DoorEntryA(TextDoor907, EventFlag.UNKNOWN_289 | EVENT_FLAG_UNSET,  0xC072, 0x01F4, 0x01);
immutable DoorEntryA DoorEntry908 = DoorEntryA(null, EventFlag.None,  0xC4BA, 0x0310, 0x01);
immutable DoorEntryA DoorEntry909 = DoorEntryA(null, EventFlag.None,  0x800E, 0x0037, 0x01);
immutable DoorEntryC DoorEntry910 = DoorEntryC(TextDoor910);
immutable DoorEntryC DoorEntry911 = DoorEntryC(TextDoor911);
immutable DoorEntryC DoorEntry912 = DoorEntryC(TextDoor912);
immutable DoorEntryA DoorEntry913 = DoorEntryA(null, EventFlag.None,  0xC011, 0x02F4, 0x01);
immutable DoorEntryA DoorEntry914 = DoorEntryA(TextDoor004, EventFlag.None,  0x8351, 0x0167, 0x01);
immutable DoorEntryA DoorEntry915 = DoorEntryA(TextDoor915, EventFlag.DEFEATED_SANCTUARY_BOSS_8 | EVENT_FLAG_UNSET,  0x04D3, 0x0319, 0x01);
immutable DoorEntryA DoorEntry916 = DoorEntryA(null, EventFlag.None,  0x813A, 0x0343, 0x01);
immutable DoorEntryA DoorEntry917 = DoorEntryA(null, EventFlag.None,  0x82AA, 0x0203, 0x01);
immutable DoorEntryA DoorEntry918 = DoorEntryA(null, EventFlag.None,  0xC2AA, 0x020C, 0x01);
immutable DoorEntryA DoorEntry919 = DoorEntryA(null, EventFlag.None,  0xC13A, 0x0364, 0x01);
immutable DoorEntryA DoorEntry920 = DoorEntryA(null, EventFlag.None,  0x813A, 0x0353, 0x01);
immutable DoorEntryA DoorEntry921 = DoorEntryA(null, EventFlag.None,  0xC2CA, 0x0210, 0x01);
immutable DoorEntryA DoorEntry922 = DoorEntryA(null, EventFlag.None,  0x82AA, 0x01C3, 0x01);
immutable DoorEntryA DoorEntry923 = DoorEntryA(null, EventFlag.None,  0x0183, 0x00EA, 0x01);
immutable DoorEntryA DoorEntry924 = DoorEntryA(null, EventFlag.None,  0xC2EA, 0x01CC, 0x01);
immutable DoorEntryA DoorEntry925 = DoorEntryA(null, EventFlag.None,  0x82CA, 0x01C3, 0x01);
immutable DoorEntryA DoorEntry926 = DoorEntryA(null, EventFlag.None,  0xC286, 0x0210, 0x01);
immutable DoorEntryA DoorEntry927 = DoorEntryA(null, EventFlag.None,  0x828A, 0x0203, 0x01);
immutable DoorEntryA DoorEntry928 = DoorEntryA(null, EventFlag.None,  0xC2CA, 0x01D8, 0x01);
immutable DoorEntryA DoorEntry929 = DoorEntryA(null, EventFlag.None,  0xC34E, 0x0170, 0x01);
immutable DoorEntryA DoorEntry930 = DoorEntryA(null, EventFlag.None,  0xC34E, 0x0194, 0x01);
immutable DoorEntryA DoorEntry931 = DoorEntryA(null, EventFlag.None,  0x8352, 0x01AF, 0x01);
immutable DoorEntryA DoorEntry932 = DoorEntryA(null, EventFlag.None,  0x8342, 0x019F, 0x01);
immutable DoorEntryA DoorEntry933 = DoorEntryA(null, EventFlag.None,  0x8342, 0x01BF, 0x01);
immutable DoorEntryA DoorEntry934 = DoorEntryA(null, EventFlag.None,  0xC346, 0x01AC, 0x01);
immutable DoorEntryA DoorEntry935 = DoorEntryA(null, EventFlag.None,  0xC33E, 0x0180, 0x01);
immutable DoorEntryA DoorEntry936 = DoorEntryA(null, EventFlag.None,  0x833E, 0x018F, 0x01);
immutable DoorEntryA DoorEntry937 = DoorEntryA(null, EventFlag.None,  0x833A, 0x01A7, 0x01);
immutable DoorEntryA DoorEntry938 = DoorEntryA(null, EventFlag.None,  0xC332, 0x018C, 0x01);
immutable DoorEntryA DoorEntry939 = DoorEntryA(null, EventFlag.None,  0xC332, 0x01A0, 0x01);
immutable DoorEntryA DoorEntry940 = DoorEntryA(null, EventFlag.None,  0x832E, 0x01B3, 0x01);
immutable DoorEntryA DoorEntry941 = DoorEntryA(null, EventFlag.None,  0x031B, 0x01A1, 0x01);
immutable DoorEntryA DoorEntry942 = DoorEntryA(null, EventFlag.None,  0x0149, 0x00F7, 0x01);
immutable DoorEntryA DoorEntry943 = DoorEntryA(TextDoor943, EventFlag.None,  0x40FE, 0x0211, 0x01);
immutable DoorEntryA DoorEntry944 = DoorEntryA(null, EventFlag.None,  0x03B8, 0x006C, 0x0E);
immutable DoorEntryA DoorEntry945 = DoorEntryA(null, EventFlag.None,  0x02EC, 0x0054, 0x0E);
immutable DoorEntryA DoorEntry946 = DoorEntryA(null, EventFlag.None,  0x031C, 0x0034, 0x0E);
immutable DoorEntryA DoorEntry947 = DoorEntryA(null, EventFlag.None,  0x0398, 0x0070, 0x0E);
immutable DoorEntryA DoorEntry948 = DoorEntryA(null, EventFlag.None,  0x02F4, 0x0018, 0x01);
immutable DoorEntryA DoorEntry949 = DoorEntryA(null, EventFlag.None,  0xC3FA, 0x03F5, 0x04);
immutable DoorEntryA DoorEntry950 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3EA, 0x03B9, 0x04);
immutable DoorEntryA DoorEntry951 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3DA, 0x03F9, 0x04);
immutable DoorEntryA DoorEntry952 = DoorEntryA(TextDoor367, EventFlag.None,  0xC3CA, 0x03B9, 0x04);
immutable DoorEntryA DoorEntry953 = DoorEntryA(TextDoor711, EventFlag.None,  0x824C, 0x02FD, 0x0A);
immutable DoorEntryA DoorEntry954 = DoorEntryA(TextDoor711, EventFlag.None,  0x8248, 0x02ED, 0x0A);
immutable DoorEntryA DoorEntry955 = DoorEntryA(TextDoor101, EventFlag.None,  0x8250, 0x0281, 0x0A);
immutable DoorEntryA DoorEntry956 = DoorEntryA(TextDoor711, EventFlag.None,  0x020C, 0x0291, 0x0A);
immutable DoorEntryC DoorEntry957 = DoorEntryC(TextDoor957);
immutable DoorEntryC DoorEntry958 = DoorEntryC(TextDoor958);
immutable DoorEntryC DoorEntry959 = DoorEntryC(TextDoor959);
immutable DoorEntryC DoorEntry960 = DoorEntryC(TextDoor960);
immutable DoorEntryC DoorEntry961 = DoorEntryC(TextDoor961);
immutable DoorEntryC DoorEntry962 = DoorEntryC(TextDoor962);
immutable DoorEntryA DoorEntry963 = DoorEntryA(null, EventFlag.None,  0x8269, 0x0327, 0x04);
immutable DoorEntryA DoorEntry964 = DoorEntryA(null, EventFlag.None,  0xC2DD, 0x033C, 0x04);
immutable DoorEntryA DoorEntry965 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x03B8, 0x04);
immutable DoorEntryA DoorEntry966 = DoorEntryA(null, EventFlag.None,  0xC211, 0x031C, 0x04);
immutable DoorEntryA DoorEntry967 = DoorEntryA(null, EventFlag.None,  0xC2DD, 0x03F8, 0x07);
immutable DoorEntryA DoorEntry968 = DoorEntryA(null, EventFlag.None,  0x01E7, 0x03EA, 0x0A);
immutable DoorEntryA DoorEntry969 = DoorEntryA(null, EventFlag.None,  0x026C, 0x039D, 0x07);
immutable DoorEntryA DoorEntry970 = DoorEntryA(null, EventFlag.None,  0xC1DE, 0x0396, 0x0A);
immutable DoorEntryA DoorEntry971 = DoorEntryA(null, EventFlag.None,  0x82D9, 0x0327, 0x07);
immutable DoorEntryA DoorEntry972 = DoorEntryA(null, EventFlag.None,  0xC32D, 0x0334, 0x07);
immutable DoorEntryA DoorEntry973 = DoorEntryA(TextDoor101, EventFlag.None,  0x01DC, 0x03DC, 0x0A);
immutable DoorEntryA DoorEntry974 = DoorEntryA(null, EventFlag.None,  0x0207, 0x03DA, 0x0A);
immutable DoorEntryC DoorEntry975 = DoorEntryC(TextDoor975);
immutable DoorEntryC DoorEntry976 = DoorEntryC(TextDoor976);
immutable DoorEntryC DoorEntry977 = DoorEntryC(TextNoProblemHere);

/// $CF58EF
immutable OverworldEventMusic[][164] OverworldEventMusicPointerTable = [
	[
		OverworldEventMusic(0, Music.None2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_174 | EVENT_FLAG_UNSET, Music.GIVE_US_STRENGTH),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_278 | EVENT_FLAG_UNSET, Music.ALIEN_INVESTIGATION),
		OverworldEventMusic(EventFlag.UNKNOWN_06B | EVENT_FLAG_UNSET, Music.None2),
		OverworldEventMusic(EventFlag.UNKNOWN_068 | EVENT_FLAG_UNSET, Music.ONETT),
		OverworldEventMusic(EventFlag.BUZZ_BUZZ_IN_PARTY | EVENT_FLAG_UNSET, Music.ONETT_AT_NIGHT_BUZZ_BUZZ),
		OverworldEventMusic(EventFlag.UNKNOWN_177 | EVENT_FLAG_UNSET, Music.ONETT_AT_NIGHT_1),
		OverworldEventMusic(EventFlag.UNKNOWN_201 | EVENT_FLAG_UNSET, Music.ONETT_AFTER_METEOR1),
		OverworldEventMusic(0, Music.ONETT_INTRO),
	],
	[
		OverworldEventMusic(EventFlag.ON_CITY_BUS | EVENT_FLAG_UNSET, Music.CITY_BUS),
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.YELLOW_SUBMARINE),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_174 | EVENT_FLAG_UNSET, Music.GIVE_US_STRENGTH),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.RUNAWAY5_TOUR_BUS),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(0, Music.BOY_MEETS_GIRL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_044 | EVENT_FLAG_UNSET, Music.BOY_MEETS_GIRL),
		OverworldEventMusic(0, Music.ZOMBIE_THREED2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.PEACEFUL_REST_VALLEY2),
		OverworldEventMusic(0, Music.PEACEFUL_REST_VALLEY),
	],
	[
		OverworldEventMusic(EventFlag.ON_CITY_BUS | EVENT_FLAG_UNSET, Music.CITY_BUS),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.ON_SKY_RUNNER | EVENT_FLAG_UNSET, Music.SKY_RUNNER),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.RUNAWAY5_TOUR_BUS),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.HAPPY_THREED),
		OverworldEventMusic(0, Music.ZOMBIE_THREED),
	],
	[
		OverworldEventMusic(EventFlag.ON_TESSIE | EVENT_FLAG_UNSET, Music.TESSIE),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.ON_SKY_RUNNER | EVENT_FLAG_UNSET, Music.SKY_RUNNER),
		OverworldEventMusic(EventFlag.UNKNOWN_158 | EVENT_FLAG_UNSET, Music.TESSIE_SIGHTING),
		OverworldEventMusic(EventFlag.UNKNOWN_220 | EVENT_FLAG_UNSET, Music.WINTERS),
		OverworldEventMusic(EventFlag.UNKNOWN_080 | EVENT_FLAG_UNSET, Music.BOARDING_SCHOOL),
		OverworldEventMusic(0, Music.WINTERS_INTRO),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_295 | EVENT_FLAG_UNSET, Music.RETURN_TO_YOUR_BODY),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_174 | EVENT_FLAG_UNSET, Music.GIVE_US_STRENGTH),
		OverworldEventMusic(EventFlag.UNKNOWN_2F8 | EVENT_FLAG_UNSET, Music.PHASE_DISTORTER_TIME_TRAVEL),
		OverworldEventMusic(0, Music.SATURN_VALLEY),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.PEACEFUL_REST_VALLEY2),
		OverworldEventMusic(0, Music.PEACEFUL_REST_VALLEY),
	],
	[
		OverworldEventMusic(EventFlag.ON_CITY_BUS | EVENT_FLAG_UNSET, Music.CITY_BUS),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.ON_SKY_RUNNER | EVENT_FLAG_UNSET, Music.SKY_RUNNER),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.RUNAWAY5_TOUR_BUS),
		OverworldEventMusic(0, Music.DUSTY_DUNES_DESERT),
	],
	[
		OverworldEventMusic(EventFlag.ON_CITY_BUS | EVENT_FLAG_UNSET, Music.CITY_BUS),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.ON_SKY_RUNNER | EVENT_FLAG_UNSET, Music.SKY_RUNNER),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.RUNAWAY5_TOUR_BUS),
		OverworldEventMusic(EventFlag.UNKNOWN_03C | EVENT_FLAG_UNSET, Music.MONOTOLI_BUILDING),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(0, Music.FOURSIDE),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.SAILING_TO_SCARABA),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_174 | EVENT_FLAG_UNSET, Music.GIVE_US_STRENGTH),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.SKY_RUNNER_FALLING),
		OverworldEventMusic(EventFlag.ON_SKY_RUNNER | EVENT_FLAG_UNSET, Music.SKY_RUNNER),
		OverworldEventMusic(EventFlag.UNKNOWN_251 | EVENT_FLAG_UNSET, Music.TeleportIn),
		OverworldEventMusic(0, Music.SUMMERS),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.SAILING_TO_SCARABA),
		OverworldEventMusic(EventFlag.UNKNOWN_21F | EVENT_FLAG_UNSET, Music.KRAKEN_DEFEATED),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.BAZAAR),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.YELLOW_SUBMARINE),
		OverworldEventMusic(EventFlag.UNKNOWN_296 | EVENT_FLAG_UNSET, Music.MEGATON_WALK),
		OverworldEventMusic(0, Music.SCARABA_DESERT),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_174 | EVENT_FLAG_UNSET, Music.GIVE_US_STRENGTH),
		OverworldEventMusic(EventFlag.DALAAM_INTRO_PLAYED | EVENT_FLAG_UNSET, Music.DALAAM),
		OverworldEventMusic(0, Music.DALAAM_INTRO),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.YELLOW_SUBMARINE),
		OverworldEventMusic(0, Music.DEEP_DARKNESS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.TENDA_VILLAGE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.LOST_UNDERWORLD),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_2F6 | EVENT_FLAG_UNSET, Music.GOING_TO_MAGICANT),
		OverworldEventMusic(0, Music.EIGHT_MELODIES),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_24B | EVENT_FLAG_UNSET, Music.FlyingMan),
		OverworldEventMusic(EventFlag.UNKNOWN_2F6 | EVENT_FLAG_UNSET, Music.GOING_TO_MAGICANT),
		OverworldEventMusic(0, Music.WELCOME_HOME),
	],
	[
		OverworldEventMusic(0, Music.SEA_OF_EDEN),
	],
	[
		OverworldEventMusic(0, Music.SEA_OF_EDEN2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_2F8 | EVENT_FLAG_UNSET, Music.PHASE_DISTORTER_TIME_TRAVEL),
		OverworldEventMusic(0, Music.FIRST_STEP_BACK),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_295 | EVENT_FLAG_UNSET, Music.RETURN_TO_YOUR_BODY),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.None2),
		OverworldEventMusic(0, Music.SECOND_STEP_BACK),
	],
	[
		OverworldEventMusic(0, Music.THE_PLACE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_06B | EVENT_FLAG_UNSET, Music.SUNRISE_ONETT),
		OverworldEventMusic(EventFlag.UNKNOWN_068 | EVENT_FLAG_UNSET, Music.ONETT),
		OverworldEventMusic(EventFlag.BUZZ_BUZZ_IN_PARTY | EVENT_FLAG_UNSET, Music.ONETT_AT_NIGHT_BUZZ_BUZZ),
		OverworldEventMusic(EventFlag.UNKNOWN_177 | EVENT_FLAG_UNSET, Music.ONETT_AT_NIGHT_1),
		OverworldEventMusic(EventFlag.UNKNOWN_201 | EVENT_FLAG_UNSET, Music.ONETT_AFTER_METEOR1),
		OverworldEventMusic(0, Music.ONETT_INTRO),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_251 | EVENT_FLAG_UNSET, Music.TeleportOut),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(0, Music.YOUR_SANCTUARY_1),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.SOUND_STONE_MELODY_4 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(0, Music.YOUR_SANCTUARY_1),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_251 | EVENT_FLAG_UNSET, Music.TeleportOut),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(0, Music.NEAR_A_BOSS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_251 | EVENT_FLAG_UNSET, Music.TeleportOut),
		OverworldEventMusic(EventFlag.SOUND_STONE_MELODY_5 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(0, Music.YOUR_SANCTUARY_1),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(0, Music.YOUR_SANCTUARY_1),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(0, Music.YOUR_SANCTUARY_1),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_251 | EVENT_FLAG_UNSET, Music.TeleportOut),
		OverworldEventMusic(EventFlag.SOUND_STONE_MELODY_8 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(0, Music.YOUR_SANCTUARY_1),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_21F | EVENT_FLAG_UNSET, Music.KRAKEN_DEFEATED),
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.SAILING_TO_SCARABA),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SAILING_TO_SCARABA),
	],
	[
		OverworldEventMusic(EventFlag.ON_CITY_BUS | EVENT_FLAG_UNSET, Music.CITY_BUS),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.RUNAWAY5_TOUR_BUS),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.HAPPY_THREED),
		OverworldEventMusic(0, Music.SPOOKY_CAVE),
	],
	[
		OverworldEventMusic(EventFlag.ON_CITY_BUS | EVENT_FLAG_UNSET, Music.CITY_BUS),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.RUNAWAY5_TOUR_BUS),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.HAPPY_THREED),
		OverworldEventMusic(0, Music.SPOOKY_CAVE),
	],
	[
		OverworldEventMusic(EventFlag.ON_CITY_BUS | EVENT_FLAG_UNSET, Music.CITY_BUS),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.RUNAWAY5_TOUR_BUS),
		OverworldEventMusic(0, Music.SPOOKY_CAVE),
	],
	[
		OverworldEventMusic(EventFlag.ON_CITY_BUS | EVENT_FLAG_UNSET, Music.CITY_BUS),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_217 | EVENT_FLAG_UNSET, Music.RUNAWAY5_TOUR_BUS),
		OverworldEventMusic(0, Music.FOURSIDE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SPOOKY_CAVE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SATURN_VALLEY_CAVE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.ONETT_AT_NIGHT_2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.CAVE_NEAR_A_BOSS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.CAVE_NEAR_A_BOSS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEAR_A_BOSS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEAR_A_BOSS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.RABBIT_CAVE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.ONETT_AT_NIGHT_1),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_004 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_2),
		OverworldEventMusic(EventFlag.UNKNOWN_003 | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(EventFlag.UNKNOWN_20C | EVENT_FLAG_UNSET, Music.YOUR_SANCTUARY_1),
		OverworldEventMusic(0, Music.FIRE_SPRINGS_HALL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.SAILING_TO_SCARABA),
		OverworldEventMusic(EventFlag.UNKNOWN_21F | EVENT_FLAG_UNSET, Music.KRAKEN_DEFEATED),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.ALIEN_INVESTIGATION),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.ALIEN_INVESTIGATION),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.ALIEN_INVESTIGATION),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.ON_SKY_RUNNER | EVENT_FLAG_UNSET, Music.SKY_RUNNER),
		OverworldEventMusic(EventFlag.UNKNOWN_080 | EVENT_FLAG_UNSET, Music.SPOOKY_CAVE),
		OverworldEventMusic(0, Music.ZOMBIE_THREED),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.BELCH_BASE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.MONKEY_CAVES),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.None2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_048 | EVENT_FLAG_UNSET, Music.DUSTY_DUNES_DESERT),
		OverworldEventMusic(0, Music.NEAR_A_BOSS),
	],
	[
		OverworldEventMusic(0, Music.MOONSIDE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.ON_TESSIE | EVENT_FLAG_UNSET, Music.TESSIE),
		OverworldEventMusic(EventFlag.UNKNOWN_080 | EVENT_FLAG_UNSET, Music.PYRAMID),
		OverworldEventMusic(0, Music.WINTERS_INTRO),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.INSIDE_THE_DUNGEON),
	],
	[
		OverworldEventMusic(0, Music.ARCADE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_214 | EVENT_FLAG_UNSET, Music.METEOR_FALL),
		OverworldEventMusic(EventFlag.UNKNOWN_215 | EVENT_FLAG_UNSET, Music.METEOR_STRIKE),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_278 | EVENT_FLAG_UNSET, Music.ONETT_AFTER_METEOR2),
		OverworldEventMusic(EventFlag.UNKNOWN_068 | EVENT_FLAG_UNSET, Music.NESSS_HOUSE),
		OverworldEventMusic(EventFlag.BUZZ_BUZZ_IN_PARTY | EVENT_FLAG_UNSET, Music.ONETT_AT_NIGHT_BUZZ_BUZZ2),
		OverworldEventMusic(EventFlag.UNKNOWN_061 | EVENT_FLAG_UNSET, Music.PokeyTheme),
		OverworldEventMusic(EventFlag.UNKNOWN_177 | EVENT_FLAG_UNSET, Music.KNOCK_KNOCK_RIGHT),
		OverworldEventMusic(EventFlag.UNKNOWN_1D9 | EVENT_FLAG_UNSET, Music.KNOCK_KNOCK),
		OverworldEventMusic(0, Music.ONETT_AFTER_METEOR2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_174 | EVENT_FLAG_UNSET, Music.GIVE_US_STRENGTH),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_068 | EVENT_FLAG_UNSET, Music.PokeysHouse),
		OverworldEventMusic(EventFlag.BUZZ_BUZZ_IN_PARTY | EVENT_FLAG_UNSET, Music.PokeysHouseBuzzBuzz),
		OverworldEventMusic(0, Music.ONETT_AFTER_METEOR2),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOTEL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_006 | EVENT_FLAG_UNSET, Music.NEAR_A_BOSS),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOSPITAL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.ON_SKY_RUNNER | EVENT_FLAG_UNSET, Music.SKY_RUNNER),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(0, Music.CHAOS_THEATRE),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOTEL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOSPITAL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_00D | EVENT_FLAG_UNSET, Music.NESSS_HOUSE),
		OverworldEventMusic(0, Music.PAULAS_THEME),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_044 | EVENT_FLAG_UNSET, Music.MONOTOLI_BUILDING),
		OverworldEventMusic(0, Music.ZOMBIE_THREED2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_044 | EVENT_FLAG_UNSET, Music.MONOTOLI_BUILDING),
		OverworldEventMusic(0, Music.ZOMBIE_THREED2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_044 | EVENT_FLAG_UNSET, Music.DEPARTMENT_STORE),
		OverworldEventMusic(0, Music.ZOMBIE_THREED2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_044 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.ZOMBIE_THREED2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_044 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.ZOMBIE_THREED2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_044 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.ZOMBIE_THREED2),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOTEL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOSPITAL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.PAULAS_THEME),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.DEPARTMENT_STORE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.DEPARTMENT_STORE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.ZOMBIE_LADY_ACTIVE | EVENT_FLAG_UNSET, Music.HOTEL_OF_THE_LIVING_DEAD),
		OverworldEventMusic(0, Music.HOTEL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.DEPARTMENT_STORE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.NEIGHBOURS_HOUSE),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_047 | EVENT_FLAG_UNSET, Music.HOSPITAL),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_174 | EVENT_FLAG_UNSET, Music.GIVE_US_STRENGTH),
		OverworldEventMusic(EventFlag.TONY_JOINED_YOU, Music.APPLE_OF_ENLIGHTENMENT),
		OverworldEventMusic(0, Music.BOARDING_SCHOOL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.ON_SKY_RUNNER | EVENT_FLAG_UNSET, Music.SKY_RUNNER),
		OverworldEventMusic(0, Music.DR_ANDONUTS_LAB),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING2),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.ON_TESSIE | EVENT_FLAG_UNSET, Music.TESSIE),
		OverworldEventMusic(EventFlag.UNKNOWN_158 | EVENT_FLAG_UNSET, Music.TESSIE_SIGHTING),
		OverworldEventMusic(0, Music.WINTERS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.NEIGHBOURS_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_039, Music.DEPARTMENT_STORE),
		OverworldEventMusic(EventFlag.UNKNOWN_039 | EVENT_FLAG_UNSET, Music.SPOOKY_CAVE),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(EventFlag.UNKNOWN_08F | EVENT_FLAG_UNSET, Music.MONOTOLI_BUILDING),
		OverworldEventMusic(0, Music.PokeysHouse),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(EventFlag.UNKNOWN_08F | EVENT_FLAG_UNSET, Music.PAULAS_THEME),
		OverworldEventMusic(0, Music.SPOOKY_CAVE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(EventFlag.UNKNOWN_08F | EVENT_FLAG_UNSET, Music.PAULAS_THEME),
		OverworldEventMusic(0, Music.SLOPPY_HOUSE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(EventFlag.UNKNOWN_00F | EVENT_FLAG_UNSET, Music.PAULAS_THEME),
		OverworldEventMusic(0, Music.None2),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(EventFlag.UNKNOWN_08F | EVENT_FLAG_UNSET, Music.PAULAS_THEME),
		OverworldEventMusic(0, Music.MONOTOLI_BUILDING),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_218 | EVENT_FLAG_UNSET, Music.RUNAWAY5_ARE_FREED),
		OverworldEventMusic(0, Music.TOPOLLA_THEATRE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.TOPOLLA_THEATRE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.YELLOW_SUBMARINE),
		OverworldEventMusic(0, Music.HOTEL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.JACKIES_CAFE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.UNKNOWN_21E | EVENT_FLAG_UNSET, Music.YELLOW_SUBMARINE),
		OverworldEventMusic(0, Music.DR_ANDONUTS_LAB),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOSPITAL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DR_ANDONUTS_LAB),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOTEL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SUMMERS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DR_ANDONUTS_LAB),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOSPITAL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.SUMMERS),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(EventFlag.DALAAM_INTRO_PLAYED | EVENT_FLAG_UNSET, Music.DALAAM),
		OverworldEventMusic(0, Music.DALAAM_INTRO),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DALAAM),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.DEPARTMENT_STORE),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING_SCARABA),
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOTEL),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.BAZAAR),
	],
	[
		OverworldEventMusic(EventFlag.USE_POSTGAME_MUSIC | EVENT_FLAG_UNSET, Music.BecauseILoveYou),
		OverworldEventMusic(0, Music.HOSPITAL),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_24B | EVENT_FLAG_UNSET, Music.FlyingMan),
		OverworldEventMusic(0, Music.PEACEFUL_REST_VALLEY2),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_24B | EVENT_FLAG_UNSET, Music.FlyingMan),
		OverworldEventMusic(0, Music.WELCOME_HOME),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_24B | EVENT_FLAG_UNSET, Music.FlyingMan),
		OverworldEventMusic(0, Music.WELCOME_HOME),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_24B | EVENT_FLAG_UNSET, Music.FlyingMan),
		OverworldEventMusic(0, Music.WELCOME_HOME),
	],
	[
		OverworldEventMusic(0, Music.FlyingMan),
	],
	[
		OverworldEventMusic(EventFlag.JUST_RESTED | EVENT_FLAG_UNSET, Music.GOOD_MORNING_MOONSIDE),
		OverworldEventMusic(0, Music.MOONSIDE),
	],
	[
		OverworldEventMusic(0, Music.SKY_RUNNER),
	],
	[
		OverworldEventMusic(EventFlag.UNKNOWN_283 | EVENT_FLAG_UNSET, Music.SMILES_AND_TEARS),
		OverworldEventMusic(EventFlag.ONETT_REACHED | EVENT_FLAG_UNSET, Music.None2),
		OverworldEventMusic(EventFlag.UNKNOWN_1DA, Music.KNOCK_KNOCK),
		OverworldEventMusic(0, Music.None2),
	]
];

/// $CF8985
immutable NPC[1584] NPCConfig = [
	NPC(NPCType.Person, OverworldSprite.Ness, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Down, ActionScript.Unknown605, EventFlag.FLG_ONET_GUARDSHARK_DISAPPEAR, NPCConfigFlagStyle.ShowIfOff, TextNPC0001, null),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Right, ActionScript.Unknown598, EventFlag.FLG_ONET_SHARK_C_DISAPPEAR, NPCConfigFlagStyle.ShowIfOff, TextNPC0002, null),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0003, null),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0004, null),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0005, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0006, null),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Up, ActionScript.Unknown598, EventFlag.UNKNOWN_2B9, NPCConfigFlagStyle.ShowIfOff, TextNPC0007, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0008, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0009, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0010, null),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0011, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.MOM, Direction.Down, ActionScript.Unknown037, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOn, TextNPC0014, null),
	NPC(NPCType.Person, OverworldSprite.MOM, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0015, null),
	NPC(NPCType.Person, OverworldSprite.NESS_DOG_SLEEPING, Direction.Down, ActionScript.Unknown627, EventFlag.UNKNOWN_013, NPCConfigFlagStyle.ShowIfOff, TextNPC0016, null),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_12D, NPCConfigFlagStyle.ShowIfOn, TextNPC0017, null),
	NPC(NPCType.Person, OverworldSprite.King, Direction.Right, ActionScript.Unknown018, EventFlag.UNKNOWN_130, NPCConfigFlagStyle.ShowIfOn, TextNPC0016, null),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Down, ActionScript.Unknown045, EventFlag.UNKNOWN_136, NPCConfigFlagStyle.ShowIfOn, TextNPC0017, null),
	NPC(NPCType.Person, OverworldSprite.TRACY, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_213, NPCConfigFlagStyle.ShowIfOn, TextNPC0020, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown040, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0021, null),
	NPC(NPCType.Object, OverworldSprite.KNOCKING_ON_DOOR, Direction.Left, ActionScript.Unknown038, EventFlag.UNKNOWN_127, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.DRAPES_CLOSED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.DRAPES_CLOSED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.TRACY, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_1D9, NPCConfigFlagStyle.ShowIfOn, TextNPC0025, null),
	NPC(NPCType.Object, OverworldSprite.NESS_SLEEPING, Direction.Down, ActionScript.Unknown624, EventFlag.UNKNOWN_1DD, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.ZZZS, Direction.Down, ActionScript.Unknown628, EventFlag.UNKNOWN_1DD, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.DRAPES_CLOSED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_CLOSED, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.TRACY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_212, NPCConfigFlagStyle.ShowIfOff, TextNPC0030, null),
	NPC(NPCType.Object, OverworldSprite.DRAPES_CLOSED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_CLOSED, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0033, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0034, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0035, null),
	NPC(NPCType.Person, OverworldSprite.FRANK, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0036, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0037, null),
	NPC(NPCType.Person, OverworldSprite.FRANK, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.HINT_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, TextNPC0039, null),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0040, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0041, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0042, null),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0043, null),
	NPC(NPCType.Person, OverworldSprite.ALOYSIUS_MINCH, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_025, NPCConfigFlagStyle.ShowIfOn, TextNPC0044, null),
	NPC(NPCType.Person, OverworldSprite.LARDNA_MINCH, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_2E6, NPCConfigFlagStyle.ShowIfOn, TextNPC0045, null),
	NPC(NPCType.Person, OverworldSprite.FLY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_12F, NPCConfigFlagStyle.ShowIfOn, TextNPC0046, null),
	NPC(NPCType.Person, OverworldSprite.Picky, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0047, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0048, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_023, NPCConfigFlagStyle.ShowIfOn, TextNPC0052, null),
	NPC(NPCType.Person, OverworldSprite.Picky, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_022, NPCConfigFlagStyle.ShowIfOn, TextNPC0053, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_CLOSED, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0058, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0059, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_06A, NPCConfigFlagStyle.ShowIfOff, TextNPC0062, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_06A, NPCConfigFlagStyle.ShowIfOff, TextNPC0063, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Left, ActionScript.Unknown010, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, TextNPC0064, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_06A, NPCConfigFlagStyle.ShowIfOn, TextNPC0065, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_06A, NPCConfigFlagStyle.ShowIfOn, TextNPC0066, null),
	NPC(NPCType.Person, OverworldSprite.CAPTAIN_STRONG, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_1C2, NPCConfigFlagStyle.ShowIfOff, TextNPC0067, null),
	NPC(NPCType.Person, OverworldSprite.THICK_GLASSES_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0068, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0069, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_027, NPCConfigFlagStyle.ShowIfOn, TextNPC0070, null),
	NPC(NPCType.Person, OverworldSprite.CAPTAIN_STRONG, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_1C1, NPCConfigFlagStyle.ShowIfOn, TextNPC0067, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0072, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_121, NPCConfigFlagStyle.ShowIfOff, TextNPC0073, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_122, NPCConfigFlagStyle.ShowIfOff, TextNPC0074, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_123, NPCConfigFlagStyle.ShowIfOff, TextNPC0075, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_124, NPCConfigFlagStyle.ShowIfOff, TextNPC0076, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_125, NPCConfigFlagStyle.ShowIfOff, TextNPC0077, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0078, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0079, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0080, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0081, null),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0082, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0083, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0084, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0085, null),
	NPC(NPCType.Person, OverworldSprite.MAYOR_PIRKLE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0086, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0087, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0088, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0089, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0090, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0091, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DERBY_HAT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0092, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0093, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE_NO_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0094, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_200, NPCConfigFlagStyle.ShowIfOff, TextNPC0095, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0096, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0097, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0098, TextNPC0098_ALT),
	NPC(NPCType.Person, OverworldSprite.OLD_FAT_GUY_WITH_HAT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0099, null),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0100, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Up, ActionScript.Unknown250, EventFlag.UNKNOWN_067, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0102, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0103, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0104, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Up, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0105, TextNPC0105_ALT),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TextDoor681+/, TextNPC0106_ALT),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0107, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0108, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0109, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0110, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0111, null),
	NPC(NPCType.Person, OverworldSprite.BIG_SMILE_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0112, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0113, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0114, null),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0115, null),
	NPC(NPCType.Person, OverworldSprite.HAPPY_GIRL_IN_RED, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0116, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0117, null),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0118, null),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_01F, NPCConfigFlagStyle.ShowIfOn, TextNPC0119, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DERBY_HAT, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0120, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DETECTIVE_HAT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0121, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Left, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0122, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown863, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.PickySitting, Direction.Left, ActionScript.Unknown055, EventFlag.UNKNOWN_1D2, NPCConfigFlagStyle.ShowIfOn, TextNPC0124, null),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_068, NPCConfigFlagStyle.ShowIfOff, TextNPC0125, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_024, NPCConfigFlagStyle.ShowIfOn, TextNPC0126, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Left, ActionScript.Unknown607, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0127, null),
	NPC(NPCType.Person, OverworldSprite.TRAVELLING_ENTERTAINER, Direction.Down, ActionScript.Unknown608, EventFlag.UNKNOWN_04E, NPCConfigFlagStyle.ShowIfOff, TextNPC0128, TextNPC0128_ALT),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Right, ActionScript.Unknown607, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0129, null),
	NPC(NPCType.Person, OverworldSprite.HELPFUL_MOLE, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_278, NPCConfigFlagStyle.ShowIfOff, TextNPC0130, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Left, ActionScript.Unknown607, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0131, null),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Right, ActionScript.Unknown607, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0132, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Right, ActionScript.Unknown608, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0133, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Left, ActionScript.Unknown609, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0134, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Right, ActionScript.Unknown609, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0135, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Left, ActionScript.Unknown609, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0136, null),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Down, ActionScript.Unknown607, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0137, null),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Down, ActionScript.Unknown608, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, TextNPC0138, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown610, EventFlag.UNKNOWN_063, NPCConfigFlagStyle.ShowIfOff, TextNPC0139, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Right, ActionScript.Unknown607, EventFlag.UNKNOWN_063, NPCConfigFlagStyle.ShowIfOn, TextNPC0140, null),
	NPC(NPCType.Person, OverworldSprite.TRUMPET_PERSON, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_278, NPCConfigFlagStyle.ShowIfOff, TextNPC0141, null),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_16B, NPCConfigFlagStyle.ShowIfOff, TextNPC0142, null),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Up, ActionScript.Unknown609, EventFlag.UNKNOWN_16C, NPCConfigFlagStyle.ShowIfOff, TextNPC0143, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Up, ActionScript.Unknown606, EventFlag.TWOSON_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC0144, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.TWOSON_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC0145, null),
	NPC(NPCType.Person, OverworldSprite.FRANK, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_084, NPCConfigFlagStyle.ShowIfOff, TextNPC0146, null),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown007, EventFlag.UNKNOWN_06C, NPCConfigFlagStyle.ShowIfOff, null /+TextDoor006+/, TextNPC0147_ALT),
	NPC(NPCType.Person, OverworldSprite.MOM, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1DA, NPCConfigFlagStyle.ShowIfOn, TextNPC0148, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0149, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0150, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0151, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0152, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0153, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0154, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0155, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0156, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0157, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0158, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0159, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0160, null),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Up, ActionScript.Unknown629, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, TextNPC0161, null),
	NPC(NPCType.Person, OverworldSprite.TRAVELLING_ENTERTAINER, Direction.Right, ActionScript.Unknown608, EventFlag.UNKNOWN_04E, NPCConfigFlagStyle.ShowIfOff, TextNPC0162, TextNPC0128_ALT),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Right, ActionScript.Unknown012, EventFlag.FLG_WIN_FRANK, NPCConfigFlagStyle.ShowIfOff, TextNPC0163, null),
	NPC(NPCType.Person, OverworldSprite.CAPTAIN_STRONG, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.HAPPY_GIRL_IN_RED, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, TextNPC0166, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, TextNPC0167, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.WHITE_DELIVERY_TRUCK, Direction.Left, ActionScript.Unknown585, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.DELIVERY_TRUCK, Direction.Left, ActionScript.Unknown586, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown862, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.DONT_ENTER_SIGN, Direction.Down, ActionScript.Unknown007, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0185, null),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown584, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1DC, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1DC, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0191, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0192, null),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.METEOR, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TextDoor150+/, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_CAR, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_CAR, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.POLICE_CAR, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.FRANKYSTEIN_MK_II, Direction.Down, ActionScript.Unknown008, EventFlag.FLG_WIN_FRANK, NPCConfigFlagStyle.ShowIfOff, TextNPC0202, null),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown057, EventFlag.UNKNOWN_020, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown058, EventFlag.UNKNOWN_021, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown059, EventFlag.UNKNOWN_132, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown060, EventFlag.UNKNOWN_133, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_134, NPCConfigFlagStyle.ShowIfOn, TextNPC0207, null),
	NPC(NPCType.Object, OverworldSprite.EVIL_MANI_MANI, Direction.Down, ActionScript.Unknown010, EventFlag.TWOSON_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC0208, null),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_1, NPCConfigFlagStyle.ShowIfOff, TextNPC0209, null),
	NPC(NPCType.Person, OverworldSprite.KING_IN_THE_FLASHBACK, Direction.Right, ActionScript.Unknown699, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.PAST_BABY_CRADLE, Direction.Down, ActionScript.Unknown694, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0212, null),
	NPC(NPCType.Person, OverworldSprite.PAULAS_MOTHER, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0213, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0214, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0215, null),
	NPC(NPCType.Person, OverworldSprite.HAPPY_GIRL_IN_RED, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0216, null),
	NPC(NPCType.Person, OverworldSprite.PAULAS_FATHER, Direction.Right, ActionScript.Unknown221, EventFlag.UNKNOWN_076, NPCConfigFlagStyle.ShowIfOff, TextNPC0217, null),
	NPC(NPCType.Person, OverworldSprite.CAT, Direction.Right, ActionScript.Unknown013, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0218, null),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_27E, NPCConfigFlagStyle.ShowIfOn, TextNPC0219, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_KID, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_02A, NPCConfigFlagStyle.ShowIfOff, TextNPC0220, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Right, ActionScript.Unknown014, EventFlag.UNKNOWN_153, NPCConfigFlagStyle.ShowIfOff, TextNPC0221, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown014, EventFlag.UNKNOWN_153, NPCConfigFlagStyle.ShowIfOff, TextNPC0222, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.TOOLS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.CAN_TENDA_VILLAGE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_029, NPCConfigFlagStyle.ShowIfOff, TextNPC0226, TextNPC0226_ALT),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0227, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_029, NPCConfigFlagStyle.ShowIfOn, TextNPC0228, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_135, NPCConfigFlagStyle.ShowIfOn, TextNPC0229, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0230, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Left, ActionScript.Unknown108, EventFlag.UNKNOWN_02B, NPCConfigFlagStyle.ShowIfOn, TextNPC0229, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0232, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DETECTIVE_HAT, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0233, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0234, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0235, null),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0236, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0237, null),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0238, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0239, null),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0240, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0241, null),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0242, null),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0243, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0244, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0245, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, TextNPC0246, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_02B, NPCConfigFlagStyle.ShowIfOff, TextNPC0247, null),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, TextNPC0248, TextNPC0248_ALT),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, TextNPC0249, TextNPC0249_ALT),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_DRUMMER, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, TextNPC0250, TextNPC0250_ALT),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_BASS_PLAYER, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, TextNPC0251, TextNPC0251_ALT),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_SAX_PLAYER, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, TextNPC0252, TextNPC0252_ALT),
	NPC(NPCType.Person, OverworldSprite.POOCHYFUD, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0253, TextNPC0253_ALT),
	NPC(NPCType.Person, OverworldSprite.EVERDRED, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_270, NPCConfigFlagStyle.ShowIfOn, TextNPC0254, null),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_STRIPED_APRON, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0255, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0256, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0257, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Right, ActionScript.Unknown605, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, TextNPC0260, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0261, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0262, null),
	NPC(NPCType.Object, OverworldSprite.LittleMushroom, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0264, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0265, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0266, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0267, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0268, TextNPC0268_ALT),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0269, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0270, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0271, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0272, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0273, null),
	NPC(NPCType.Person, OverworldSprite.BUS_DRIVER, Direction.Left, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0274, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.VENUS_MOTHER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0277, null),
	NPC(NPCType.Person, OverworldSprite.HINT_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, TextNPC0278, null),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0279, null),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, TextNPC0279, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, TextNPC0281, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, TextNPC0282, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0283, null),
	NPC(NPCType.Person, OverworldSprite.CAT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0218, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0285, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.THICK_GLASSES_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0288, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0289, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0290, null),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0291, null),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0292, null),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0293, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0294, null),
	NPC(NPCType.Person, OverworldSprite.THICK_GLASSES_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0295, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0296, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0297, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0298, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0299, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0300, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0301, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0303, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0304, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DETECTIVE_HAT, Direction.Left, ActionScript.Unknown017, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0305, null),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Left, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0306, null),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Left, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0307, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0308, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0309, null),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0310, null),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0311, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0312, null),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0313, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0314, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0315, null),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0316, null),
	NPC(NPCType.Person, OverworldSprite.ARAB_MR_T, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0317, null),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0318, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_KID, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_02A, NPCConfigFlagStyle.ShowIfOn, TextNPC0319, null),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_135, NPCConfigFlagStyle.ShowIfOn, TextNPC0320, null),
	NPC(NPCType.Person, OverworldSprite.PAULAS_FATHER, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_076, NPCConfigFlagStyle.ShowIfOn, TextNPC0217, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, TextNPC0322, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_263, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0324, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0325, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, TextNPC0326, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, TextNPC0327, null),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, TextNPC0328, null),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, TextNPC0329, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown605, EventFlag.THREED_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC0330, null),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Right, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0331, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, TextNPC0332, null),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, TextNPC0333, null),
	NPC(NPCType.Person, OverworldSprite.EVERDRED, Direction.Right, ActionScript.Unknown647, EventFlag.UNKNOWN_264, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_02A, NPCConfigFlagStyle.ShowIfOn, TextNPC0335, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_02A, NPCConfigFlagStyle.ShowIfOn, TextNPC0336, null),
	NPC(NPCType.Person, OverworldSprite.CAT_ASLEEP, Direction.Down, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0338, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0339, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Left, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0340, null),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Down, ActionScript.Unknown016, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, TextNPC0341, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0342, null),
	NPC(NPCType.Person, OverworldSprite.HELPFUL_MOLE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0343, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown087, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown088, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown089, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown090, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown085, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown086, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0352, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.CROSSROAD_SIGNS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0356, null),
	NPC(NPCType.Person, OverworldSprite.GUY_IN_COOL_RED_CAR, Direction.Right, ActionScript.Unknown588, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0357, null),
	NPC(NPCType.Object, OverworldSprite.WHITE_DELIVERY_TRUCK, Direction.Right, ActionScript.Unknown589, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BICYCLE, Direction.Down, ActionScript.Unknown864, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown590, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.APPLE_KID_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0361, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.ORANGE_KID_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0365, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown867, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0367, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BURGLIN_PARK_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0369, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BANANAS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BANANAS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.RUNAWAY_5_BUS, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_135, NPCConfigFlagStyle.ShowIfOn, TextNPC0373, null),
	NPC(NPCType.Object, OverworldSprite.RUNAWAY_5_BUS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, TextNPC0373, null),
	NPC(NPCType.Object, OverworldSprite.EVIL_MANI_MANI, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0375, null),
	NPC(NPCType.Person, OverworldSprite.MR_CARPAINTER, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0376, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0377, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0378, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0379, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0380, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0381, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0382, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0383, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0384, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_15F, NPCConfigFlagStyle.ShowIfOff, TextNPC0385, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_160, NPCConfigFlagStyle.ShowIfOff, TextNPC0386, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_161, NPCConfigFlagStyle.ShowIfOff, TextNPC0387, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_162, NPCConfigFlagStyle.ShowIfOff, TextNPC0388, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown281, EventFlag.UNKNOWN_163, NPCConfigFlagStyle.ShowIfOff, TextNPC0389, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown283, EventFlag.UNKNOWN_164, NPCConfigFlagStyle.ShowIfOff, TextNPC0390, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown282, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0391, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown280, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0392, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown279, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0393, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, TextNPC0394, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, TextNPC0395, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, TextNPC0396, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0397, null),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0398, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0399, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0400, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0401, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0402, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0403, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0404, null),
	NPC(NPCType.Person, OverworldSprite.VENUS_MOTHER, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0405, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0408, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0409, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0410, null),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_02C, NPCConfigFlagStyle.ShowIfOn, TextNPC0411, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_043, NPCConfigFlagStyle.ShowIfOff, TextNPC0412, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0413, null),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0414, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0415, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0416, null),
	NPC(NPCType.Person, OverworldSprite.TRUMPET_PERSON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0417, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0418, null),
	NPC(NPCType.Person, OverworldSprite.BLUE_COW, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0419, TextNPC0419_ALT),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Up, ActionScript.Unknown134, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0420, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0421, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0422, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0423, null),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0424, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0265, null),
	NPC(NPCType.Person, OverworldSprite.MR_CARPAINTER, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0426, null),
	NPC(NPCType.Person, OverworldSprite.HELPFUL_MOLE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0427, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BICYCLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0432, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0433, null),
	NPC(NPCType.Object, OverworldSprite.BANANAS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0435, null),
	NPC(NPCType.Person, OverworldSprite.CELL_DOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_00D, NPCConfigFlagStyle.ShowIfOff, TextNPC0436, TextNPC0436_ALT),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown240, EventFlag.UNKNOWN_00D, NPCConfigFlagStyle.ShowIfOff, TextNPC0436, null),
	NPC(NPCType.Object, OverworldSprite.TeddyBearParty, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_00D, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Up, ActionScript.Unknown273, EventFlag.UNKNOWN_02D, NPCConfigFlagStyle.ShowIfOn, TextNPC0439, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_02D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_02D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.SPITEFUL_CROW, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_02D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, TextNPC0443, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0444, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, TextNPC0445, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown865, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown866, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.HELPFUL_MOLE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0448, null),
	NPC(NPCType.Object, OverworldSprite.CROSSROAD_SIGNS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0449, null),
	NPC(NPCType.Object, OverworldSprite.PENCIL_STATUE, Direction.Down, ActionScript.Unknown107, EventFlag.UNKNOWN_11C, NPCConfigFlagStyle.ShowIfOff, TextNPC0450, TextNPC0450_ALT),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_2, NPCConfigFlagStyle.ShowIfOff, TextNPC0451, null),
	NPC(NPCType.Person, OverworldSprite.NessLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOff, TextNPC0456, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_305, NPCConfigFlagStyle.ShowIfOff, TextNPC0457, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOff, TextNPC0458, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_305, NPCConfigFlagStyle.ShowIfOff, TextNPC0459, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0460, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0461, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0462, null),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0463, null),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0464, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0460, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0461, null),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0463, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0463, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0462, null),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0470, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0471, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0472, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0463, null),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0474, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, TextNPC0475, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, TextNPC0476, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_030, NPCConfigFlagStyle.ShowIfOn, TextNPC0477, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_030, NPCConfigFlagStyle.ShowIfOn, TextNPC0478, null),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_21D, NPCConfigFlagStyle.ShowIfOff, null /+TextDoor340+/, TextNPC0479_ALT),
	NPC(NPCType.Object, OverworldSprite.SHADOW, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_030, NPCConfigFlagStyle.ShowIfOn, TextNPC0480, null),
	NPC(NPCType.Object, OverworldSprite.BROKEN_PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_02F, NPCConfigFlagStyle.ShowIfOn, TextNPC0481, null),
	NPC(NPCType.Object, OverworldSprite.SKY_RUNNER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_030, NPCConfigFlagStyle.ShowIfOn, TextNPC0480, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown605, EventFlag.ZOMBIE_LADY_ACTIVE, NPCConfigFlagStyle.ShowIfOff, TextNPC0483, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Right, ActionScript.Unknown078, EventFlag.UNKNOWN_128, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0485, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0486, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Right, ActionScript.Unknown079, EventFlag.UNKNOWN_129, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Left, ActionScript.Unknown010, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, TextNPC0490, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_24D, NPCConfigFlagStyle.ShowIfOn, TextNPC0491, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Right, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Down, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Right, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Right, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Right, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_DOG, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0498, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0499, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0500, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0501, null),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0502, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0503, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0504, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0505, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_STRIPED_APRON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0255, null),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0509, null),
	NPC(NPCType.Person, OverworldSprite.HINT_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, TextNPC0510, null),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.FOURSIDE_REACHED, NPCConfigFlagStyle.ShowIfOn, TextNPC0511, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0512, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Down, ActionScript.Unknown012, EventFlag.FOURSIDE_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC0513, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.FOURSIDE_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC0514, null),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0515, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0516, null),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_2E4, NPCConfigFlagStyle.ShowIfOff, TextNPC0517, null),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Up, ActionScript.Unknown016, EventFlag.UNKNOWN_2E4, NPCConfigFlagStyle.ShowIfOff, TextNPC0518, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOff, TextNPC0519, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_16E, NPCConfigFlagStyle.ShowIfOff, TextNPC0520, null),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Up, ActionScript.Unknown012, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, TextNPC0521, null),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.FOURSIDE_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC0522, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0523, null),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0524, null),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Left, ActionScript.Unknown013, EventFlag.UNKNOWN_2E4, NPCConfigFlagStyle.ShowIfOff, TextNPC0525, null),
	NPC(NPCType.Person, OverworldSprite.OLD_FAT_GUY_WITH_HAT, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0526, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, TextNPC0527, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0528, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0529, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0530, null),
	NPC(NPCType.Person, OverworldSprite.BOOGY_TENT_EYE, Direction.Down, ActionScript.Unknown592, EventFlag.BOOGEY_TENT_ACTIVE, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.BOOGY_TENT_EYE, Direction.Right, ActionScript.Unknown592, EventFlag.BOOGEY_TENT_ACTIVE, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.BOOGY_TENT_MOUTH, Direction.Down, ActionScript.Unknown591, EventFlag.BOOGEY_TENT_ACTIVE, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Right, ActionScript.Unknown758, EventFlag.UNKNOWN_12C, NPCConfigFlagStyle.ShowIfOff, TextNPC0534, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_12C, NPCConfigFlagStyle.ShowIfOff, TextNPC0535, null),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_2E4, NPCConfigFlagStyle.ShowIfOff, TextNPC0536, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_02E, NPCConfigFlagStyle.ShowIfOn, TextNPC0537, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Down, ActionScript.Unknown077, EventFlag.UNKNOWN_02E, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0539, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0540, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0541, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, TextNPC0542, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0470, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0471, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0474, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_DOG, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_12C, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_12C, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_24C, NPCConfigFlagStyle.ShowIfOff, TextNPC0551, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0552, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0553, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0554, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0555, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0556, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0557, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0558, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0559, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0560, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0561, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0562, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_262, NPCConfigFlagStyle.ShowIfOn, TextNPC0563, null),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_26F, NPCConfigFlagStyle.ShowIfOn, TextNPC0564, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown666, EventFlag.UNKNOWN_272, NPCConfigFlagStyle.ShowIfOn, TextNPC0475, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Left, ActionScript.Unknown666, EventFlag.UNKNOWN_272, NPCConfigFlagStyle.ShowIfOn, TextNPC0476, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown870, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown873, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.DONT_ENTER_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0185, null),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0570, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0580, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown707, EventFlag.UNKNOWN_29D, NPCConfigFlagStyle.ShowIfOn, TextNPC0582, null),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0583, null),
	NPC(NPCType.Object, OverworldSprite.CITY_BUS, Direction.Right, ActionScript.Unknown595, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown094, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown095, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown096, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown097, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown098, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0344, null),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_25B, NPCConfigFlagStyle.ShowIfOff, TextNPC0590, null),
	NPC(NPCType.Person, OverworldSprite.TonyInBed, Direction.Down, ActionScript.Unknown113, EventFlag.TONY_JOINED_YOU, NPCConfigFlagStyle.ShowIfOff, TextNPC0591, null),
	NPC(NPCType.Person, OverworldSprite.JeffInBed, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_080, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.TOOLS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0594, null),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0595, TextNPC0595_ALT),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0595, TextNPC0596_ALT),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0595, TextNPC0597_ALT),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0595, TextNPC0598_ALT),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0595, TextNPC0599_ALT),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0600, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0601, null),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0602, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0603, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0604, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0605, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0606, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0607, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0608, null),
	NPC(NPCType.Person, OverworldSprite.BubbleMonkey, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_14E, NPCConfigFlagStyle.ShowIfOff, TextNPC0609, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0610, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0612, null),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0613, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0610, null),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Down, ActionScript.Unknown178, EventFlag.UNKNOWN_17B, NPCConfigFlagStyle.ShowIfOff, TextNPC0615, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_26C, NPCConfigFlagStyle.ShowIfOn, TextNPC0616, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Up, ActionScript.Unknown008, EventFlag.UNKNOWN_26D, NPCConfigFlagStyle.ShowIfOn, TextNPC0617, null),
	NPC(NPCType.Person, OverworldSprite.BubbleMonkey, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_26D, NPCConfigFlagStyle.ShowIfOn, TextNPC0618, null),
	NPC(NPCType.Person, OverworldSprite.CAVE_BOY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, TextNPC0619, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0610, null),
	NPC(NPCType.Object, OverworldSprite.SHADOW, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2EC, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.INSTANT_REVITALIZING_DEVICE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0622, null),
	NPC(NPCType.Object, OverworldSprite.SKY_RUNNER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2EC, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOff, TextNPC0624, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOff, TextNPC0625, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Up, ActionScript.Unknown012, EventFlag.UNKNOWN_034, NPCConfigFlagStyle.ShowIfOn, TextNPC0626, null),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0627, null),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0628, null),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_034, NPCConfigFlagStyle.ShowIfOff, TextNPC0629, null),
	NPC(NPCType.Person, OverworldSprite.BubbleMonkey, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_276, NPCConfigFlagStyle.ShowIfOn, TextNPC0630, null),
	NPC(NPCType.Person, OverworldSprite.BRICK_ROAD, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_032, NPCConfigFlagStyle.ShowIfOn, TextNPC0631, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Right, ActionScript.Unknown284, EventFlag.UNKNOWN_016, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Up, ActionScript.Unknown012, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, TextNPC0633, null),
	NPC(NPCType.Person, OverworldSprite.TONY_KNEELING, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_14F, NPCConfigFlagStyle.ShowIfOn, TextNPC0634, null),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0635, null),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0636, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_26E, NPCConfigFlagStyle.ShowIfOn, TextNPC0637, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0638, null),
	NPC(NPCType.Person, OverworldSprite.Tony, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0639, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown883, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown868, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.PENCIL_STATUE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_261, NPCConfigFlagStyle.ShowIfOff, TextNPC0450, TextNPC0645_ALT),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0646, null),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.TESSIE_WATER_RIPPLES_TOP, Direction.Down, ActionScript.Unknown485, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.TESSIE_WATER_RIPPLES_BOTTOM, Direction.Down, ActionScript.Unknown486, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, TextNPC0657, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, TextNPC0658, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, TextNPC0659, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, TextNPC0660, null),
	NPC(NPCType.Person, OverworldSprite.Tony, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, TextNPC0661, null),
	NPC(NPCType.Person, OverworldSprite.Tony, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, TextNPC0662, null),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, TextNPC0664, null),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, TextNPC0665, null),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, TextNPC0666, null),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, TextNPC0668, null),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, TextNPC0669, null),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, TextNPC0670, null),
	NPC(NPCType.Object, OverworldSprite.ERASER_STATUE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_12B, NPCConfigFlagStyle.ShowIfOff, TextNPC0671, TextNPC0671_ALT),
	NPC(NPCType.Person, OverworldSprite.STARMAN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B2, NPCConfigFlagStyle.ShowIfOff, TextNPC0672, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE_NO_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0673, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_200, NPCConfigFlagStyle.ShowIfOff, TextNPC0095, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0096, null),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_4, NPCConfigFlagStyle.ShowIfOff, TextNPC0676, null),
	NPC(NPCType.Object, OverworldSprite.ROPE, Direction.Down, ActionScript.Unknown260, EventFlag.UNKNOWN_137, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.MAD_DUCK, Direction.Left, ActionScript.Unknown598, EventFlag.MAD_DUCK_1_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC0678, null),
	NPC(NPCType.Person, OverworldSprite.MAD_DUCK, Direction.Right, ActionScript.Unknown598, EventFlag.MAD_DUCK_2_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC0679, null),
	NPC(NPCType.Person, OverworldSprite.GiftBox, Direction.Up, ActionScript.Unknown601, EventFlag.WORTHLESS_PROTOPLASM_1_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC0680, null),
	NPC(NPCType.Person, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown601, EventFlag.WORTHLESS_PROTOPLASM_2_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC0681, null),
	NPC(NPCType.Person, OverworldSprite.ROWDY_MOUSE, Direction.Right, ActionScript.Unknown600, EventFlag.ROWDY_MOUSE_1_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC0682, null),
	NPC(NPCType.Person, OverworldSprite.ROWDY_MOUSE, Direction.Up, ActionScript.Unknown600, EventFlag.ROWDY_MOUSE_2_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC0683, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0610, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0685, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0686, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0687, null),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_16E, NPCConfigFlagStyle.ShowIfOff, TextNPC0688, null),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0689, null),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0690, null),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_16F, NPCConfigFlagStyle.ShowIfOff, TextNPC0691, null),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_170, NPCConfigFlagStyle.ShowIfOff, TextNPC0692, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0693, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0694, null),
	NPC(NPCType.Object, OverworldSprite.JAR_OF_FLY_HONEY, Direction.Down, ActionScript.Unknown631, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.JAR_OF_FLY_HONEY, Direction.Down, ActionScript.Unknown632, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.MASTER_BELCH, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, TextNPC0697, null),
	NPC(NPCType.Object, OverworldSprite.MR_SATURN_BALL_AND_CHAIN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MR_SATURN_BALL_AND_CHAIN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.NessLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.FOUNTAIN_OF_HEALING_MINI, Direction.Down, ActionScript.Unknown693, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_3, NPCConfigFlagStyle.ShowIfOff, TextNPC0705, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0706, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, TextNPC0707, null),
	NPC(NPCType.Person, OverworldSprite.OLD_FAT_GUY_WITH_HAT, Direction.Down, ActionScript.Unknown606, EventFlag.SATURN_VALLEY_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC0708, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown871, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0710, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0712, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0713, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown012, EventFlag.MAGICANT_COMPLETED, NPCConfigFlagStyle.ShowIfOn, TextNPC0714, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0715, null),
	NPC(NPCType.Object, OverworldSprite.SATURN_VALLEY_ATM, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, TextNPC0718, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, TextNPC0719, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0720, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, TextNPC0721, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, TextNPC0722, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0723, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0724, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown013, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0725, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown013, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0726, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Right, ActionScript.Unknown008, EventFlag.UNDERWORLD_REACHED, NPCConfigFlagStyle.ShowIfOn, TextNPC0727, null),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Up, ActionScript.Unknown010, EventFlag.UNDERWORLD_REACHED, NPCConfigFlagStyle.ShowIfOn, TextNPC0728, TextNPC0728_ALT),
	NPC(NPCType.Person, OverworldSprite.MINER, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_28B, NPCConfigFlagStyle.ShowIfOn, TextNPC0729, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown013, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0730, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0731, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, TextNPC0732, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Right, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0733, null),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown581, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0734, TextNPC0734_ALT),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown872, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0737, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0738, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0739, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0740, null),
	NPC(NPCType.Object, OverworldSprite.PHASE_DISTORTER, Direction.Down, ActionScript.Unknown286, EventFlag.MAGICANT_COMPLETED, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.SPA_SIGN, Direction.Down, ActionScript.Unknown683, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0742, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0743, null),
	NPC(NPCType.Object, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown708, EventFlag.UNKNOWN_274, NPCConfigFlagStyle.ShowIfOn, TextNPC0744, null),
	NPC(NPCType.Object, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown709, EventFlag.UNKNOWN_274, NPCConfigFlagStyle.ShowIfOn, TextNPC0745, null),
	NPC(NPCType.Object, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown710, EventFlag.UNKNOWN_274, NPCConfigFlagStyle.ShowIfOn, TextNPC0746, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0747, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0748, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0749, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Person, OverworldSprite.MINERS_BROTHER, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0752, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, TextNPC0754, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, TextNPC0755, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, TextNPC0756, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, TextNPC0757, null),
	NPC(NPCType.Person, OverworldSprite.PALM_TAN_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0758, null),
	NPC(NPCType.Person, OverworldSprite.SUN_BATHING_GIRL, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0759, null),
	NPC(NPCType.Person, OverworldSprite.MINER, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_037, NPCConfigFlagStyle.ShowIfOff, TextNPC0760, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, TextNPC0761, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, TextNPC0762, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, TextNPC0763, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, TextNPC0764, null),
	NPC(NPCType.Person, OverworldSprite.MEXICAN_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0765, null),
	NPC(NPCType.Person, OverworldSprite.MEXICAN_GUY, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0766, null),
	NPC(NPCType.Person, OverworldSprite.MEXICAN_GUY, Direction.Up, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0767, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0768, null),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0769, null),
	NPC(NPCType.Person, OverworldSprite.MINERS_BROTHER, Direction.Down, ActionScript.Unknown258, EventFlag.UNKNOWN_110, NPCConfigFlagStyle.ShowIfOn, TextNPC0770, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0771, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_266, NPCConfigFlagStyle.ShowIfOn, TextNPC0772, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_267, NPCConfigFlagStyle.ShowIfOn, TextNPC0773, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, TextNPC0774, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, TextNPC0775, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown876, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown875, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0778, null),
	NPC(NPCType.Object, OverworldSprite.SLOT_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0779, null),
	NPC(NPCType.Object, OverworldSprite.PILE_OF_BONES, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0780, null),
	NPC(NPCType.Object, OverworldSprite.PILE_OF_BONES, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0781, null),
	NPC(NPCType.Person, OverworldSprite.UNKNOWN3, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0782, null),
	NPC(NPCType.Person, OverworldSprite.SESAME_SEED, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0783, null),
	NPC(NPCType.Person, OverworldSprite.GUY_IN_COOL_RED_CAR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, TextNPC0784, null),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.RED_TRUCK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.WHITE_TRUCK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.MAGIC_TART_STAND, Direction.Down, ActionScript.Unknown008, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, TextNPC0788, null),
	NPC(NPCType.Object, OverworldSprite.DELIVERY_TRUCK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0790, null),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0791, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0792, null),
	NPC(NPCType.Object, OverworldSprite.BIG_DIRT_SCOOPER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_14D, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.CONTACT_LENSES, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_181, NPCConfigFlagStyle.ShowIfOff, TextNPC0794, null),
	NPC(NPCType.Object, OverworldSprite.BIG_DIRT_SCOOPER, Direction.Down, ActionScript.Unknown256, EventFlag.UNKNOWN_110, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.BIG_DIRT_SCOOPER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_14D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.TALAH_RAMA, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_2E9, NPCConfigFlagStyle.ShowIfOff, TextNPC0797, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_2E9, NPCConfigFlagStyle.ShowIfOff, TextNPC0798, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C4, NPCConfigFlagStyle.ShowIfOff, TextNPC0799, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C3, NPCConfigFlagStyle.ShowIfOff, TextNPC0800, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C4, NPCConfigFlagStyle.ShowIfOn, TextNPC0799, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C3, NPCConfigFlagStyle.ShowIfOn, TextNPC0800, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C6, NPCConfigFlagStyle.ShowIfOff, TextNPC0803, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C5, NPCConfigFlagStyle.ShowIfOff, TextNPC0804, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C6, NPCConfigFlagStyle.ShowIfOn, TextNPC0803, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C5, NPCConfigFlagStyle.ShowIfOn, TextNPC0804, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CA, NPCConfigFlagStyle.ShowIfOff, TextNPC0807, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C9, NPCConfigFlagStyle.ShowIfOff, TextNPC0808, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CA, NPCConfigFlagStyle.ShowIfOn, TextNPC0807, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C9, NPCConfigFlagStyle.ShowIfOn, TextNPC0808, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CF, NPCConfigFlagStyle.ShowIfOff, TextNPC0811, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CF, NPCConfigFlagStyle.ShowIfOn, TextNPC0811, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C8, NPCConfigFlagStyle.ShowIfOff, TextNPC0813, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C7, NPCConfigFlagStyle.ShowIfOff, TextNPC0814, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C8, NPCConfigFlagStyle.ShowIfOn, TextNPC0813, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C7, NPCConfigFlagStyle.ShowIfOn, TextNPC0814, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CE, NPCConfigFlagStyle.ShowIfOff, TextNPC0817, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CD, NPCConfigFlagStyle.ShowIfOff, TextNPC0818, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CE, NPCConfigFlagStyle.ShowIfOn, TextNPC0817, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CD, NPCConfigFlagStyle.ShowIfOn, TextNPC0818, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Right, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0821, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CC, NPCConfigFlagStyle.ShowIfOff, TextNPC0822, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CB, NPCConfigFlagStyle.ShowIfOff, TextNPC0823, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CC, NPCConfigFlagStyle.ShowIfOn, TextNPC0822, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CB, NPCConfigFlagStyle.ShowIfOn, TextNPC0823, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0826, null),
	NPC(NPCType.Object, OverworldSprite.PENCIL_STATUE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_204, NPCConfigFlagStyle.ShowIfOff, TextNPC0450, TextNPC0827_ALT),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Right, ActionScript.Unknown013, EventFlag.UNKNOWN_265, NPCConfigFlagStyle.ShowIfOff, TextNPC0828, null),
	NPC(NPCType.Person, OverworldSprite.TALAH_RAMA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0829, null),
	NPC(NPCType.Person, OverworldSprite.MINER, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_036, NPCConfigFlagStyle.ShowIfOn, TextNPC0830, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_115, NPCConfigFlagStyle.ShowIfOff, TextNPC0831, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_116, NPCConfigFlagStyle.ShowIfOff, TextNPC0832, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_117, NPCConfigFlagStyle.ShowIfOff, TextNPC0833, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE_NO_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0834, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_200, NPCConfigFlagStyle.ShowIfOff, TextNPC0095, null),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0096, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_118, NPCConfigFlagStyle.ShowIfOff, TextNPC0837, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_119, NPCConfigFlagStyle.ShowIfOff, TextNPC0838, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0839, TextNPC0839_ALT),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_176, NPCConfigFlagStyle.ShowIfOff, TextNPC0840, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_176, NPCConfigFlagStyle.ShowIfOn, TextNPC0841, null),
	NPC(NPCType.Person, OverworldSprite.VENUS, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOn, TextNPC0842, null),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, TextNPC0843, null),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_BASS_PLAYER, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, TextNPC0844, null),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_DRUMMER, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, TextNPC0845, null),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, TextNPC0846, null),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_SAX_PLAYER, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, TextNPC0847, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0848, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_038, NPCConfigFlagStyle.ShowIfOff, TextNPC0849, TextNPC0849_ALT),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_038, NPCConfigFlagStyle.ShowIfOn, TextNPC0850, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_2F7, NPCConfigFlagStyle.ShowIfOn, TextNPC0851, null),
	NPC(NPCType.Person, OverworldSprite.BEACH_LADY, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2F7, NPCConfigFlagStyle.ShowIfOn, TextNPC0852, null),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0853, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0854, null),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0855, TextNPC0855_ALT),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0856, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0857, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0858, null),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0859, null),
	NPC(NPCType.Person, OverworldSprite.MONOTOLI, Direction.Right, ActionScript.Unknown605, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0860, null),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0862, null),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0863, null),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0864, null),
	NPC(NPCType.Person, OverworldSprite.PokeyRich, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_08F, NPCConfigFlagStyle.ShowIfOff, TextNPC0865, null),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_08F, NPCConfigFlagStyle.ShowIfOff, TextNPC0866, null),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_08F, NPCConfigFlagStyle.ShowIfOff, TextNPC0867, null),
	NPC(NPCType.Person, OverworldSprite.ALOYSIUS_MINCH, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_08F, NPCConfigFlagStyle.ShowIfOff, TextNPC0868, null),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_08E, NPCConfigFlagStyle.ShowIfOn, TextNPC0869, null),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0870, null),
	NPC(NPCType.Person, OverworldSprite.ELECTRA, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0871, null),
	NPC(NPCType.Person, OverworldSprite.MONOTOLI, Direction.Up, ActionScript.Unknown700, EventFlag.UNKNOWN_298, NPCConfigFlagStyle.ShowIfOff, TextNPC0872, null),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_00F, NPCConfigFlagStyle.ShowIfOff, TextNPC0873, null),
	NPC(NPCType.Person, OverworldSprite.MONOTOLI, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2E5, NPCConfigFlagStyle.ShowIfOn, TextNPC0872, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0875, null),
	NPC(NPCType.Object, OverworldSprite.MIGHTY_BEAR, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0876, null),
	NPC(NPCType.Object, OverworldSprite.SECRET_DOOR_IN_MONOTOLI_BUILDING, Direction.Down, ActionScript.Unknown704, EventFlag.UNKNOWN_298, NPCConfigFlagStyle.ShowIfOff, TextNPC0877, null),
	NPC(NPCType.Object, OverworldSprite.SECRET_DOOR_IN_MONOTOLI_BUILDING, Direction.Down, ActionScript.Unknown007, EventFlag.UNKNOWN_298, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Down, ActionScript.Unknown602, EventFlag.UNKNOWN_165, NPCConfigFlagStyle.ShowIfOff, TextNPC0879, null),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Left, ActionScript.Unknown602, EventFlag.UNKNOWN_166, NPCConfigFlagStyle.ShowIfOff, TextNPC0880, null),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Left, ActionScript.Unknown602, EventFlag.UNKNOWN_167, NPCConfigFlagStyle.ShowIfOff, TextNPC0881, null),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Right, ActionScript.Unknown602, EventFlag.UNKNOWN_168, NPCConfigFlagStyle.ShowIfOff, TextNPC0882, null),
	NPC(NPCType.Person, OverworldSprite.CLUMSY_ROBOT, Direction.Down, ActionScript.Unknown602, EventFlag.UNKNOWN_16A, NPCConfigFlagStyle.ShowIfOff, TextNPC0883, null),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, TextNPC0884, null),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, TextNPC0885, null),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_DRUMMER, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, TextNPC0886, null),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_BASS_PLAYER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, TextNPC0887, null),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_SAX_PLAYER, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, TextNPC0888, null),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Right, ActionScript.Unknown602, EventFlag.UNKNOWN_169, NPCConfigFlagStyle.ShowIfOff, TextNPC0889, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0890, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0891, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0894, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Left, ActionScript.Unknown008, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, TextNPC0895, null),
	NPC(NPCType.Person, OverworldSprite.JACKIE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0896, null),
	NPC(NPCType.Person, OverworldSprite.BIG_SMILE_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_08B, NPCConfigFlagStyle.ShowIfOff, TextNPC0897, null),
	NPC(NPCType.Person, OverworldSprite.BIG_SMILE_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_08B, NPCConfigFlagStyle.ShowIfOn, TextNPC0898, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0899, null),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0900, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOff, TextNPC0901, null),
	NPC(NPCType.Person, OverworldSprite.ALOYSIUS_MINCH, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, TextNPC0902, null),
	NPC(NPCType.Object, OverworldSprite.JUKEBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0903, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0904, null),
	NPC(NPCType.Object, OverworldSprite.BROKEN_MANI_MANI_STATUE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0905, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0906, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.FOURSIDE_MUSEUM_GUY, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_03A, NPCConfigFlagStyle.ShowIfOff, TextNPC0908, TextNPC0908_ALT),
	NPC(NPCType.Person, OverworldSprite.FOURSIDE_MUSEUM_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_03A, NPCConfigFlagStyle.ShowIfOn, TextNPC0909, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0910, null),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0911, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0912, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown878, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0914, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0915, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0916, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0917, null),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0918, null),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0919, null),
	NPC(NPCType.Person, OverworldSprite.THICK_GLASSES_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0920, null),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0921, null),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0922, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0923, null),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0924, null),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0925, null),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_STRIPED_APRON, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0926, null),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0927, null),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Right, ActionScript.Unknown016, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0928, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0929, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0930, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0931, null),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0932, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0933, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0934, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown880, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, TextNPC0936, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Object, OverworldSprite.MAGIC_TART_STAND, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.DEPT_STORE_MOOK, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOn, TextNPC0941, null),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0942, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0943, null),
	NPC(NPCType.Person, OverworldSprite.TRUMPET_PERSON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0944, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0945, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0946, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0947, null),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0948, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0949, null),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0950, null),
	NPC(NPCType.Person, OverworldSprite.ELECTRA, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_03B, NPCConfigFlagStyle.ShowIfOn, TextNPC0951, null),
	NPC(NPCType.Person, OverworldSprite.EverdredLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, TextNPC0952, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, TextNPC0953, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, TextNPC0954, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, TextNPC0955, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, TextNPC0956, null),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, TextNPC0957, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, TextNPC0958, null),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0959, null),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_13D, NPCConfigFlagStyle.ShowIfOn, TextNPC0960, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0961, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_092, NPCConfigFlagStyle.ShowIfOff, TextNPC0962, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_092, NPCConfigFlagStyle.ShowIfOff, TextNPC0963, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_252, NPCConfigFlagStyle.ShowIfOn, TextNPC0964, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown605, EventFlag.DEFEATED_SANCTUARY_BOSS_5, NPCConfigFlagStyle.ShowIfOff, TextNPC0965, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Right, ActionScript.Unknown605, EventFlag.DEFEATED_SANCTUARY_BOSS_5, NPCConfigFlagStyle.ShowIfOff, TextNPC0966, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_24F, NPCConfigFlagStyle.ShowIfOn, TextNPC0967, null),
	NPC(NPCType.Person, OverworldSprite.HUMAN_CHARRED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_250, NPCConfigFlagStyle.ShowIfOn, TextNPC0968, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0969, null),
	NPC(NPCType.Person, OverworldSprite.HINT_MAN, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, TextNPC0970, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown879, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0972, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown877, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAGNET_HILL, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.CAN_TENDA_VILLAGE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.HELICOPTER, Direction.Down, ActionScript.Unknown711, EventFlag.UNKNOWN_2A0, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.HELICOPTER_BLADE, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2A0, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.HELICOPTER_BACK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2A0, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.SHADOW, Direction.Down, ActionScript.Unknown704, EventFlag.UNKNOWN_2A0, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0993, null),
	NPC(NPCType.Object, OverworldSprite.RUNAWAY_5_BUS, Direction.Down, ActionScript.Unknown190, EventFlag.UNKNOWN_13D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_5, NPCConfigFlagStyle.ShowIfOff, TextNPC0995, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0996, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0997, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0998, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0999, null),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1000, null),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1001, null),
	NPC(NPCType.Person, OverworldSprite.MAGIC_CAKE_LADY, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_269, NPCConfigFlagStyle.ShowIfOff, TextNPC1002, null),
	NPC(NPCType.Person, OverworldSprite.SHIP_CREWMAN, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1003, null),
	NPC(NPCType.Person, OverworldSprite.SHIP_CREWMAN, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1004, null),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1005, null),
	NPC(NPCType.Person, OverworldSprite.TRUMPET_PERSON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1006, null),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1007, null),
	NPC(NPCType.Person, OverworldSprite.SHIP_CAPTAIN, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1008, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1011, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1012, null),
	NPC(NPCType.Person, OverworldSprite.BEACH_LADY, Direction.Right, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1013, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1016, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1017, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1018, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Left, ActionScript.Unknown008, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, TextNPC1019, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1020, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1021, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1024, null),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1025, null),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1026, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1027, null),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.ONETT_REACHED, NPCConfigFlagStyle.ShowIfOn, TextNPC1028, null),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1029, null),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Down, ActionScript.Unknown606, EventFlag.ONETT_REACHED, NPCConfigFlagStyle.ShowIfOn, TextNPC1030, null),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.ONETT_REACHED, NPCConfigFlagStyle.ShowIfOn, TextNPC1031, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown885, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_2AF, NPCConfigFlagStyle.ShowIfOff, TextNPC1033, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1034, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1035, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1036, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_15A, NPCConfigFlagStyle.ShowIfOff, TextNPC1037, TextNPC1037_ALT),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_15A, NPCConfigFlagStyle.ShowIfOn, TextNPC1038, null),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown599, EventFlag.UNKNOWN_259, NPCConfigFlagStyle.ShowIfOff, TextNPC1039, null),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown599, EventFlag.UNKNOWN_25A, NPCConfigFlagStyle.ShowIfOff, TextNPC1040, null),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1047, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1048, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1049, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1050, null),
	NPC(NPCType.Person, OverworldSprite.WEIRDO_GUY_IN_SWIM_TRUNKS, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1051, null),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_BIKINI, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1052, null),
	NPC(NPCType.Person, OverworldSprite.GUY_IN_SWIMMING_SUIT, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1053, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1054, null),
	NPC(NPCType.Person, OverworldSprite.WEIRDO_GUY_IN_SWIM_TRUNKS, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1055, null),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Left, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1056, null),
	NPC(NPCType.Person, OverworldSprite.BEACH_LADY, Direction.Down, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1057, null),
	NPC(NPCType.Person, OverworldSprite.WEIRDO_GUY_IN_SWIM_TRUNKS, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1058, null),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1059, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1060, null),
	NPC(NPCType.Person, OverworldSprite.MEXICAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1061, null),
	NPC(NPCType.Person, OverworldSprite.BIRD_ON_PERCH, Direction.Left, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1062, null),
	NPC(NPCType.Person, OverworldSprite.SHIP_CAPTAIN, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1063, null),
	NPC(NPCType.Person, OverworldSprite.SHIP_CREWMAN, Direction.Left, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1064, null),
	NPC(NPCType.Person, OverworldSprite.SHIP_CAPTAIN, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1065, null),
	NPC(NPCType.Person, OverworldSprite.PALM_TAN_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1066, null),
	NPC(NPCType.Person, OverworldSprite.CAT, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1067, null),
	NPC(NPCType.Person, OverworldSprite.CAT, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1068, null),
	NPC(NPCType.Person, OverworldSprite.MAGIC_CAKE_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_269, NPCConfigFlagStyle.ShowIfOn, TextNPC1069, null),
	NPC(NPCType.Person, OverworldSprite.SUN_BATHING_GIRL, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1070, null),
	NPC(NPCType.Person, OverworldSprite.HINT_MAN, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, TextNPC1071, null),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_DRUMMER, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_BIKINI, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown887, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.OLD_FAT_GUY_WITH_HAT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1077, null),
	NPC(NPCType.Object, OverworldSprite.MAGIC_TART_STAND, Direction.Down, ActionScript.Unknown886, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0788, null),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.GUY_IN_COOL_RED_CAR, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1080, null),
	NPC(NPCType.Object, OverworldSprite.DELIVERY_TRUCK, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BICYCLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAGIC_TART_STAND, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0788, null),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown884, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1086, null),
	NPC(NPCType.Object, OverworldSprite.RUNAWAY_5_BUS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.SHIP, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.POOS_MASTER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1089, null),
	NPC(NPCType.Person, OverworldSprite.DALAAMESE_SERVANT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1090, null),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE_HEAD_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1091, null),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_27D, NPCConfigFlagStyle.ShowIfOn, TextNPC1092, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown881, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Right, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1094, null),
	NPC(NPCType.Person, OverworldSprite.CHINESE_MONK_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1095, null),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1096, null),
	NPC(NPCType.Person, OverworldSprite.DALAAMESE_SERVANT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1097, null),
	NPC(NPCType.Person, OverworldSprite.CHINESE_MONK_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1098, null),
	NPC(NPCType.Person, OverworldSprite.DALAAMESE_SERVANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1099, null),
	NPC(NPCType.Person, OverworldSprite.PREET_PROOT_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1100, null),
	NPC(NPCType.Person, OverworldSprite.DALAAMESE_SERVANT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1101, null),
	NPC(NPCType.Person, OverworldSprite.DALAAM_GIRL, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1102, null),
	NPC(NPCType.Person, OverworldSprite.STAR_MASTER_GUY, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_253, NPCConfigFlagStyle.ShowIfOff, TextNPC1103, null),
	NPC(NPCType.Person, OverworldSprite.DALAAM_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1104, null),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1105, null),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1106, null),
	NPC(NPCType.Object, OverworldSprite.RABBIT, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_28C, NPCConfigFlagStyle.ShowIfOff, TextNPC1107, TextNPC1107_ALT),
	NPC(NPCType.Object, OverworldSprite.RABBIT, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_28C, NPCConfigFlagStyle.ShowIfOff, TextNPC1107, TextNPC1107_ALT),
	NPC(NPCType.Object, OverworldSprite.RABBIT, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_28C, NPCConfigFlagStyle.ShowIfOff, TextNPC1107, TextNPC1107_ALT),
	NPC(NPCType.Person, OverworldSprite.DALAAM_GIRL, Direction.Up, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.DALAAM_GIRL, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1112, null),
	NPC(NPCType.Object, OverworldSprite.ORNAMENTS_ON_POOS_TEMPLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.ORNAMENTS_ON_POOS_TEMPLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.ORNAMENTS_ON_POOS_TEMPLE, Direction.Down, ActionScript.Unknown882, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.ORNAMENTS_ON_POOS_TEMPLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1117, null),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_6, NPCConfigFlagStyle.ShowIfOff, TextNPC1118, null),
	NPC(NPCType.Person, OverworldSprite.NessLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1123, null),
	NPC(NPCType.Person, OverworldSprite.HAPPY_TURBAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1124, null),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1125, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, TextNPC1126, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Person, OverworldSprite.LADY_IN_VEIL, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1129, null),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1130, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1131, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1132, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1133, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1134, null),
	NPC(NPCType.Person, OverworldSprite.HAPPY_TURBAN_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1135, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1136, null),
	NPC(NPCType.Person, OverworldSprite.LADY_IN_VEIL, Direction.Up, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1137, null),
	NPC(NPCType.Person, OverworldSprite.BIG_NOSE_ARAB_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1138, null),
	NPC(NPCType.Person, OverworldSprite.ARAB_MR_T, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1139, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1140, null),
	NPC(NPCType.Person, OverworldSprite.HAPPY_TURBAN_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1141, null),
	NPC(NPCType.Person, OverworldSprite.PREET_PROOT_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1142, null),
	NPC(NPCType.Object, OverworldSprite.PYRAMID_DOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_156, NPCConfigFlagStyle.ShowIfOff, TextNPC1143, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1144, null),
	NPC(NPCType.Person, OverworldSprite.BIG_NOSE_ARAB_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1145, null),
	NPC(NPCType.Person, OverworldSprite.BIG_NOSE_ARAB_GUY, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1146, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1147, null),
	NPC(NPCType.Person, OverworldSprite.PREET_PROOT_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1148, null),
	NPC(NPCType.Person, OverworldSprite.TRIBAL_WARRIOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1BD, NPCConfigFlagStyle.ShowIfOff, TextNPC1149, null),
	NPC(NPCType.Object, OverworldSprite.DungeonMan, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_03E, NPCConfigFlagStyle.ShowIfOff, TextNPC1150, TextNPC1150_ALT),
	NPC(NPCType.Person, OverworldSprite.TRIBAL_WARRIOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1BD, NPCConfigFlagStyle.ShowIfOn, TextNPC1151, null),
	NPC(NPCType.Person, OverworldSprite.DungeonMan, Direction.Down, ActionScript.Unknown498, EventFlag.UNKNOWN_112, NPCConfigFlagStyle.ShowIfOn, TextEvent498, null),
	NPC(NPCType.Person, OverworldSprite.HINT_MAN, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, TextNPC1153, null),
	NPC(NPCType.Object, OverworldSprite.PYRAMID_DOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_156, NPCConfigFlagStyle.ShowIfOff, TextNPC1143, null),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.DEEP_DARKNESS_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC1155, null),
	NPC(NPCType.Person, OverworldSprite.BIG_NOSE_ARAB_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1156, null),
	NPC(NPCType.Person, OverworldSprite.PREET_PROOT_GUY, Direction.Down, ActionScript.Unknown888, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1157, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown889, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown890, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.CAMEL, Direction.Left, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.CAMEL, Direction.Left, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN3, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1162, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN3, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1162, null),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1164, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1165, null),
	NPC(NPCType.Object, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_188, NPCConfigFlagStyle.ShowIfOff, TextNPC1168, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_189, NPCConfigFlagStyle.ShowIfOff, TextNPC1169, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_197, NPCConfigFlagStyle.ShowIfOff, TextNPC1170, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_198, NPCConfigFlagStyle.ShowIfOff, TextNPC1171, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_18A, NPCConfigFlagStyle.ShowIfOff, TextNPC1172, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18B, NPCConfigFlagStyle.ShowIfOff, TextNPC1173, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18C, NPCConfigFlagStyle.ShowIfOff, TextNPC1174, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_199, NPCConfigFlagStyle.ShowIfOff, TextNPC1175, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18D, NPCConfigFlagStyle.ShowIfOff, TextNPC1176, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_19A, NPCConfigFlagStyle.ShowIfOff, TextNPC1177, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18E, NPCConfigFlagStyle.ShowIfOff, TextNPC1178, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_19B, NPCConfigFlagStyle.ShowIfOff, TextNPC1179, null),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B3, NPCConfigFlagStyle.ShowIfOff, TextNPC1180, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18F, NPCConfigFlagStyle.ShowIfOff, TextNPC1181, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_190, NPCConfigFlagStyle.ShowIfOff, TextNPC1182, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_191, NPCConfigFlagStyle.ShowIfOff, TextNPC1183, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_19C, NPCConfigFlagStyle.ShowIfOff, TextNPC1184, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_192, NPCConfigFlagStyle.ShowIfOff, TextNPC1185, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_193, NPCConfigFlagStyle.ShowIfOff, TextNPC1186, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_19D, NPCConfigFlagStyle.ShowIfOff, TextNPC1187, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_194, NPCConfigFlagStyle.ShowIfOff, TextNPC1188, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_195, NPCConfigFlagStyle.ShowIfOff, TextNPC1189, null),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_196, NPCConfigFlagStyle.ShowIfOff, TextNPC1190, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_19E, NPCConfigFlagStyle.ShowIfOff, TextNPC1191, null),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_19F, NPCConfigFlagStyle.ShowIfOff, TextNPC1192, null),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15B, NPCConfigFlagStyle.ShowIfOff, TextNPC1193, null),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15B, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.HAWKS_EYE, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15C, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.BRICK_ROAD_HEAD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1196, null),
	NPC(NPCType.Object, OverworldSprite.SUBMARINE, Direction.Down, ActionScript.Unknown008, EventFlag.DEEP_DARKNESS_REACHED, NPCConfigFlagStyle.ShowIfOff, TextNPC1197, null),
	NPC(NPCType.Object, OverworldSprite.BICYCLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1200, null),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0013, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1204, null),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Object, OverworldSprite.INSTANT_REVITALIZING_DEVICE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0622, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1208, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1209, null),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1210, null),
	NPC(NPCType.Object, OverworldSprite.MAD_DUCK, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAD_DUCK, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAD_DUCK, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.GRUFF_GOAT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.GRUFF_GOAT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2FA, NPCConfigFlagStyle.ShowIfOff, TextNPC1219, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2FA, NPCConfigFlagStyle.ShowIfOn, TextNPC1219, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1221, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1133, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1132, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1131, null),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Left, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1226, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1227, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1228, null),
	NPC(NPCType.Person, OverworldSprite.MASTER_BARF, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_114, NPCConfigFlagStyle.ShowIfOff, TextNPC1229, null),
	NPC(NPCType.Person, OverworldSprite.BIRD_ON_PERCH, Direction.Right, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1230, null),
	NPC(NPCType.Person, OverworldSprite.UNKNOWN4, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_120, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1232, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1233, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1234, null),
	NPC(NPCType.Person, OverworldSprite.DEEP_DARKNESS_PHONE, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1235, null),
	NPC(NPCType.Person, OverworldSprite.ATM_GUY_UNDERWATER, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1236, null),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown891, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1238, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Right, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1239, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B7, NPCConfigFlagStyle.ShowIfOff, TextNPC1240, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B8, NPCConfigFlagStyle.ShowIfOff, TextNPC1241, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B9, NPCConfigFlagStyle.ShowIfOff, TextNPC1242, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1BA, NPCConfigFlagStyle.ShowIfOff, TextNPC1243, null),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1BB, NPCConfigFlagStyle.ShowIfOff, TextNPC1244, null),
	NPC(NPCType.Object, OverworldSprite.BROKEN_HELICOPTER, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1245, null),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_7, NPCConfigFlagStyle.ShowIfOff, TextNPC1246, null),
	NPC(NPCType.Person, OverworldSprite.TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1247, null),
	NPC(NPCType.Person, OverworldSprite.TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1248, null),
	NPC(NPCType.Person, OverworldSprite.TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1249, null),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1250, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1251, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA_CHIEF, Direction.Left, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1252, TextNPC1252_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1253, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1254, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1255, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1256, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1257, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1258, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1259, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1260, null),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1261, TextNPC1250_ALT),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Object, OverworldSprite.ROCK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_099, NPCConfigFlagStyle.ShowIfOff, null, null),
	NPC(NPCType.Object, OverworldSprite.CAN_TENDA_VILLAGE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.WEIRD_JUNK, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.SPA_SIGN, Direction.Down, ActionScript.Unknown684, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1267, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_17E, NPCConfigFlagStyle.ShowIfOn, TextNPC1268, null),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_148, NPCConfigFlagStyle.ShowIfOn, TextNPC1269, null),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_14B, NPCConfigFlagStyle.ShowIfOn, TextNPC1270, null),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Down, ActionScript.Unknown767, EventFlag.UNKNOWN_149, NPCConfigFlagStyle.ShowIfOn, TextNPC1271, null),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_14A, NPCConfigFlagStyle.ShowIfOn, TextNPC1272, null),
	NPC(NPCType.Object, OverworldSprite.BROKEN_PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_04B, NPCConfigFlagStyle.ShowIfOn, TextNPC1273, null),
	NPC(NPCType.Object, OverworldSprite.PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_14C, NPCConfigFlagStyle.ShowIfOn, TextNPC1274, null),
	NPC(NPCType.Object, OverworldSprite.PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_147, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_8, NPCConfigFlagStyle.ShowIfOff, TextNPC1276, null),
	NPC(NPCType.Person, OverworldSprite.NessLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.FLAME, Direction.Down, ActionScript.Unknown693, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1282, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown771, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1283, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1284, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1285, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1286, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1287, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1288, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1289, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1290, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1291, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1292, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1293, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1294, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TOUCAN_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1295, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TOUCAN_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1295, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TOUCAN_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1295, null),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1298, null),
	NPC(NPCType.Object, OverworldSprite.WOOD_BOX, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_28B, NPCConfigFlagStyle.ShowIfOff, null, TextNPC1299_ALT),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1300, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1301, null),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1301, null),
	NPC(NPCType.Object, OverworldSprite.BAD_PALETTE_FOUNTAIN, Direction.Down, ActionScript.Unknown672, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.RED_FOUNTAIN_LOST_UNDERWORLD, Direction.Down, ActionScript.Unknown673, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.BAD_PALETTE_FOUNTAIN, Direction.Down, ActionScript.Unknown674, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null, null),
	NPC(NPCType.Object, OverworldSprite.ROBOT_BROKEN, Direction.Right, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.ROBOT_BROKEN, Direction.Left, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.ROBOT_BROKEN, Direction.Left, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.LyingDownRobotNess, Direction.Right, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Object, OverworldSprite.PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, TextNPC1274, null),
	NPC(NPCType.Person, OverworldSprite.None, Direction.Down, ActionScript.Unknown000, EventFlag.UNKNOWN_154, NPCConfigFlagStyle.ShowIfOn, null, null),
	NPC(NPCType.Person, OverworldSprite.WEIRD_HORNED_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1312, null),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_019, NPCConfigFlagStyle.ShowIfOff, TextNPC1313, null),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_01A, NPCConfigFlagStyle.ShowIfOff, TextNPC1314, null),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_01B, NPCConfigFlagStyle.ShowIfOff, TextNPC1315, null),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Up, ActionScript.Unknown012, EventFlag.UNKNOWN_01C, NPCConfigFlagStyle.ShowIfOff, TextNPC1316, null),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_01D, NPCConfigFlagStyle.ShowIfOff, TextNPC1317, null),
	NPC(NPCType.Person, OverworldSprite.WEIRD_HORNED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1318, null),
	NPC(NPCType.Person, OverworldSprite.CHICK, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1319, null),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0012, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Person, OverworldSprite.RABBIT, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1322, null),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1323, null),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1324, null),
	NPC(NPCType.Person, OverworldSprite.MASTER_BELCH, Direction.Right, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1325, null),
	NPC(NPCType.Person, OverworldSprite.MANLY_FISH, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1326, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1327, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DERBY_HAT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1328, null),
	NPC(NPCType.Person, OverworldSprite.HAPPY_GIRL_IN_RED, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1329, null),
	NPC(NPCType.Person, OverworldSprite.Picky, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1330, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1331, null),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1332, null),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DETECTIVE_HAT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1333, null),
	NPC(NPCType.Person, OverworldSprite.RABBIT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1334, null),
	NPC(NPCType.Person, OverworldSprite.Ness, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1335, null),
	NPC(NPCType.Person, OverworldSprite.CHICK, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1336, null),
	NPC(NPCType.Person, OverworldSprite.FLOWER, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1337, null),
	NPC(NPCType.Person, OverworldSprite.FLOWER, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1337, null),
	NPC(NPCType.Person, OverworldSprite.FLOWER, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1337, null),
	NPC(NPCType.Person, OverworldSprite.STAR_MASTER_GUY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1340, null),
	NPC(NPCType.Person, OverworldSprite.STAR_MASTER_GUY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1341, null),
	NPC(NPCType.Person, OverworldSprite.MOM, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1342, null),
	NPC(NPCType.Person, OverworldSprite.TRACY, Direction.Right, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1343, null),
	NPC(NPCType.Person, OverworldSprite.King, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1344, null),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1345, null),
	NPC(NPCType.Person, OverworldSprite.EVERDRED, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_27F, NPCConfigFlagStyle.ShowIfOff, TextNPC1346, null),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan1Dead, NPCConfigFlagStyle.ShowIfOn, TextNPC1347, null),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan2Dead, NPCConfigFlagStyle.ShowIfOn, TextNPC1348, null),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan3Dead, NPCConfigFlagStyle.ShowIfOn, TextNPC1349, null),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan4Dead, NPCConfigFlagStyle.ShowIfOn, TextNPC1350, null),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan5Dead, NPCConfigFlagStyle.ShowIfOn, TextNPC1351, null),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1352, null),
	NPC(NPCType.Object, OverworldSprite.WEIRD_TAIL_THING, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1353, null),
	NPC(NPCType.Person, OverworldSprite.KRAKEN, Direction.Right, ActionScript.Unknown602, EventFlag.UNKNOWN_1B4, NPCConfigFlagStyle.ShowIfOff, TextNPC1354, null),
	NPC(NPCType.Person, OverworldSprite.KRAKEN, Direction.Left, ActionScript.Unknown602, EventFlag.UNKNOWN_1B5, NPCConfigFlagStyle.ShowIfOff, TextNPC1355, null),
	NPC(NPCType.Person, OverworldSprite.KRAKEN, Direction.Right, ActionScript.Unknown602, EventFlag.UNKNOWN_1B6, NPCConfigFlagStyle.ShowIfOff, TextNPC1356, null),
	NPC(NPCType.Object, OverworldSprite.WEIRD_TAIL_THING, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1357, null),
	NPC(NPCType.Object, OverworldSprite.EVIL_MANI_MANI, Direction.Down, ActionScript.Unknown010, EventFlag.MAGICANT_COMPLETED, NPCConfigFlagStyle.ShowIfOff, TextNPC1358, TextNPC1358_ALT),
	NPC(NPCType.Person, OverworldSprite.JACKIE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1359, null),
	NPC(NPCType.Person, OverworldSprite.BIG_SMILE_LADY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1360, null),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1361, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Up, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1362, null),
	NPC(NPCType.Person, OverworldSprite.ROBO_PUMP, Direction.Up, ActionScript.Unknown597, EventFlag.ROBO_PUMP_1_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC1363, null),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1364, null),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1365, null),
	NPC(NPCType.Person, OverworldSprite.ABSTRACT_ART, Direction.Right, ActionScript.Unknown597, EventFlag.ABSTRACT_ART_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC1366, null),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1367, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1368, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1369, null),
	NPC(NPCType.Person, OverworldSprite.FOURSIDE_MUSEUM_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1370, null),
	NPC(NPCType.Person, OverworldSprite.ROBO_PUMP, Direction.Up, ActionScript.Unknown597, EventFlag.ROBO_PUMP_2_FOUGHT, NPCConfigFlagStyle.ShowIfOff, TextNPC1371, null),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1372, null),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown008, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, TextNPC1373, null),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1374, null),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1375, TextNPC0012_ALT),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC0060, null),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1377, null),
	NPC(NPCType.Person, OverworldSprite.BAD_PALETTE_GUY_ONETT_NIGHT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_0A5, NPCConfigFlagStyle.ShowIfOff, TextNPC1378, null),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1379, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1380, null),
	NPC(NPCType.Person, OverworldSprite.BEACH_LADY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1381, null),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1382, null),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1383, null),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1384, null),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1385, null),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1386, null),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1387, null),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1388, null),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1389, null),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1390, null),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1391, null),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1392, null),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1393, null),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1394, null),
	NPC(NPCType.Person, OverworldSprite.MONOTOLI, Direction.Up, ActionScript.Unknown008, EventFlag.UNKNOWN_277, NPCConfigFlagStyle.ShowIfOff, TextNPC1395, null),
	NPC(NPCType.Person, OverworldSprite.SHIP_CAPTAIN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_03F, NPCConfigFlagStyle.ShowIfOff, TextNPC1396, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1397, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1398, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1398, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1398, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1401, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1402, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1403, null),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1404, null),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1405, null),
	NPC(NPCType.Object, OverworldSprite.EVIL_MANI_MANI, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, TextNPC1406, TextNPC1358_ALT),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_320, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x67, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_321, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_322, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_323, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x00, 0x01, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_324, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x6A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_325, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x11, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_326, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_327, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xE0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_328, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x6F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_329, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xE0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32A, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x02, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32B, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x04, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32C, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xE0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32D, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32E, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x75, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32F, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x4D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_330, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_331, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x36, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_332, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x93, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_333, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_334, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_335, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x37, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_336, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_337, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x95, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_338, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x02, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_339, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x00, 0x01, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33A, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0xE0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.CASKET, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33B, NPCConfigFlagStyle.ShowAlways, TextNPC1434, [0xE1, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.CASKET, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33C, NPCConfigFlagStyle.ShowAlways, TextNPC1434, [0x42, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33D, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33E, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33F, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_340, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_341, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_342, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_343, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_344, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x0A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_345, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x09, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_346, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x25, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_347, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x95, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_348, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_349, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x67, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34A, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x40, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34B, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x90, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34C, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34D, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x0E, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34E, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x72, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34F, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x0F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_350, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_351, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x46, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_352, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_353, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x73, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_354, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xF4, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_355, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x08, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_356, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x93, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_357, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x87, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_358, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x74, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_359, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0xBF, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35A, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35B, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x51, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35C, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x6C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35D, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x93, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35E, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x90, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35F, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x96, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_360, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_361, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x8F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_362, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x07, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_363, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x3A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_364, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x0C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_365, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0xA0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_366, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0xC3, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_367, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x64, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_368, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_369, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x5F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36A, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x7F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36B, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x5F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36C, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x8C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36D, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36E, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x6C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36F, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_370, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x5D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_371, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_372, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x91, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_373, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xE9, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_374, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xE9, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_375, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_376, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xE1, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_377, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_378, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xE8, 0x04, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_379, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37A, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37B, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xD8, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37C, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37D, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x72, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37E, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x75, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37F, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x52, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_380, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x81, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_381, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x02, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_382, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x94, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_383, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x91, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_384, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_385, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xBF, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_386, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x5D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_387, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x93, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_388, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0xFD, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_389, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38A, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x74, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38B, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x3C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38C, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x9B, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38D, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xE9, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38E, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x6C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38F, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x81, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_390, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x97, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_391, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x0D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_392, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x07, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_393, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_394, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x09, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_395, NPCConfigFlagStyle.ShowAlways, TextNPC1434, [0xA0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_396, NPCConfigFlagStyle.ShowAlways, TextNPC1434, [0x73, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_397, NPCConfigFlagStyle.ShowAlways, TextNPC1434, [0xC8, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_398, NPCConfigFlagStyle.ShowAlways, TextNPC1434, [0x45, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_399, NPCConfigFlagStyle.ShowAlways, TextNPC1434, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39A, NPCConfigFlagStyle.ShowAlways, TextNPC1434, [0x3B, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39B, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39C, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xDB, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39D, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39E, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39F, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xEE, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A0, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x5F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A1, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x03, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A2, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xC7, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A3, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x0A, 0x01, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A4, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A5, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x7F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A6, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x05, 0x01, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A7, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x64, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A8, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A9, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0xC9, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AA, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x6E, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AB, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0xEC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AC, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x7E, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AD, NPCConfigFlagStyle.ShowAlways, TextNPC1474, [0x6E, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AE, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x65, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AF, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B0, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x49, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B1, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x56, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B2, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x65, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B3, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B4, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B5, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xBE, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B6, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xF2, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B7, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x39, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B8, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B9, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x65, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BA, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x57, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BB, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x75, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BC, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xF5, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BD, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BE, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xF6, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BF, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x94, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C0, NPCConfigFlagStyle.ShowAlways, TextNPC1408, [0x2D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C1, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x64, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C2, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x82, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C3, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x3D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C4, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x72, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C5, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x3F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C6, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x2F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C7, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x82, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C8, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x47, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C9, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xA0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CA, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x73, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CB, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xA0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CC, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CD, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x48, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CE, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x18, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CF, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0xCF, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3D0, NPCConfigFlagStyle.ShowAlways, TextNPC1407, [0x19, 0x00, 0x00, 0x00]),
];
