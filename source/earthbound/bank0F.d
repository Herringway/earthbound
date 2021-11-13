///
module earthbound.bank0F;

import earthbound.commondefs;

/// $CF0000

immutable SectorDoors[1280] doorConfig = [	SectorDoors(1, [DoorConfig(0x11, 0x15, DoorType.Type5, null/+&DoorEntry910+/)]),
	SectorDoors(2, [DoorConfig(0x0E, 0x15, DoorType.Type2, null/+&DoorEntry908+/), DoorConfig(0x19, 0x15, DoorType.Type5, null/+&DoorEntry911+/)]),
	SectorDoors(1, [DoorConfig(0x0E, 0x16, DoorType.Type2, null/+&DoorEntry904+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0F, 0x05, DoorType.Type2, null/+&DoorEntry0+/)]),
	SectorDoors(4, [DoorConfig(0x11, 0x02, DoorType.Type5, null/+&DoorEntry150+/), DoorConfig(0x11, 0x04, DoorType.Type5, null/+&DoorEntry150+/), DoorConfig(0x12, 0x03, DoorType.Type5, null/+&DoorEntry150+/), DoorConfig(0x12, 0x05, DoorType.Type5, null/+&DoorEntry150+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x0B, DoorType.Type2, null/+&DoorEntry885+/), DoorConfig(0x11, 0x0C, DoorType.Type2, null/+&DoorEntry885+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x15, 0x07, DoorType.Type2, null/+&DoorEntry886+/), DoorConfig(0x15, 0x08, DoorType.Type2, null/+&DoorEntry886+/)]),
	SectorDoors(2, [DoorConfig(0x11, 0x01, DoorType.Type2, null/+&DoorEntry887+/), DoorConfig(0x11, 0x02, DoorType.Type2, null/+&DoorEntry887+/)]),
	SectorDoors(6, [DoorConfig(0x0D, 0x06, DoorType.Type5, null/+&DoorEntry840+/), DoorConfig(0x0D, 0x0C, DoorType.Type5, null/+&DoorEntry862+/), DoorConfig(0x0D, 0x12, DoorType.Type5, null/+&DoorEntry841+/), DoorConfig(0x15, 0x0E, DoorType.Type5, null/+&DoorEntry842+/), DoorConfig(0x19, 0x0A, DoorType.Type5, null/+&DoorEntry843+/), DoorConfig(0x1D, 0x11, DoorType.Type5, null/+&DoorEntry844+/)]),
	SectorDoors(45, [DoorConfig(0x01, 0x07, DoorType.Type2, null/+&DoorEntry818+/), DoorConfig(0x01, 0x13, DoorType.Type2, null/+&DoorEntry819+/), DoorConfig(0x02, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x0D, DoorType.Type2, null/+&DoorEntry820+/), DoorConfig(0x02, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x19, DoorType.Type2, null/+&DoorEntry821+/), DoorConfig(0x03, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x07, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x05, DoorType.Type5, null/+&DoorEntry845+/), DoorConfig(0x0D, 0x0A, DoorType.Type5, null/+&DoorEntry845+/), DoorConfig(0x0D, 0x11, DoorType.Type5, null/+&DoorEntry845+/), DoorConfig(0x0D, 0x16, DoorType.Type5, null/+&DoorEntry845+/), DoorConfig(0x1A, 0x18, DoorType.Type5, null/+&DoorEntry847+/)]),
	SectorDoors(4, [DoorConfig(0x09, 0x11, DoorType.Type2, null/+&DoorEntry839+/), DoorConfig(0x0D, 0x15, DoorType.Type5, null/+&DoorEntry848+/), DoorConfig(0x15, 0x01, DoorType.Type5, null/+&DoorEntry849+/), DoorConfig(0x19, 0x06, DoorType.Type5, null/+&DoorEntry850+/)]),
	SectorDoors(5, [DoorConfig(0x1C, 0x05, DoorType.Type2, null/+&DoorEntry402+/), DoorConfig(0x1C, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x1D, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x1E, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x1F, 0x16, DoorType.Type1, 0x8000)]),
	SectorDoors(5, [DoorConfig(0x14, 0x02, DoorType.Type2, null/+&DoorEntry403+/), DoorConfig(0x1C, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x1D, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x1E, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x1F, 0x16, DoorType.Type1, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x16, DoorType.Type2, null/+&DoorEntry942+/)]),
	SectorDoors(6, [DoorConfig(0x08, 0x06, DoorType.Type2, null/+&DoorEntry345+/), DoorConfig(0x09, 0x05, DoorType.Type2, null/+&DoorEntry345+/), DoorConfig(0x0A, 0x04, DoorType.Type2, null/+&DoorEntry345+/), DoorConfig(0x0B, 0x03, DoorType.Type2, null/+&DoorEntry345+/), DoorConfig(0x0C, 0x02, DoorType.Type2, null/+&DoorEntry345+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry345+/)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x08, 0x19, DoorType.Type2, null/+&DoorEntry346+/), DoorConfig(0x09, 0x1A, DoorType.Type2, null/+&DoorEntry346+/), DoorConfig(0x0A, 0x1B, DoorType.Type2, null/+&DoorEntry346+/), DoorConfig(0x0B, 0x1C, DoorType.Type2, null/+&DoorEntry346+/), DoorConfig(0x0C, 0x1D, DoorType.Type2, null/+&DoorEntry346+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry346+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x06, DoorType.Type2, null/+&DoorEntry31+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x11, DoorType.Type2, null/+&DoorEntry32+/), DoorConfig(0x07, 0x1D, DoorType.Type2, null/+&DoorEntry33+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry34+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x0E, DoorType.Type2, null/+&DoorEntry35+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry36+/)]),
	SectorDoors(4, [DoorConfig(0x0B, 0x09, DoorType.Type2, null/+&DoorEntry151+/), DoorConfig(0x0B, 0x11, DoorType.Type2, null/+&DoorEntry152+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry37+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry38+/)]),
	SectorDoors(2, [DoorConfig(0x11, 0x13, DoorType.Type2, null/+&DoorEntry905+/), DoorConfig(0x11, 0x14, DoorType.Type2, null/+&DoorEntry905+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x11, DoorType.Type5, null/+&DoorEntry912+/)]),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x06, 0x09, DoorType.Type2, null/+&DoorEntry1+/), DoorConfig(0x19, 0x1D, DoorType.Type2, null/+&DoorEntry2+/), DoorConfig(0x1A, 0x05, DoorType.Type2, null/+&DoorEntry3+/)]),
	SectorDoors(1, [DoorConfig(0x1E, 0x11, DoorType.Type2, null/+&DoorEntry4+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x0B, DoorType.Type2, null/+&DoorEntry21+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x0B, DoorType.Type2, null/+&DoorEntry22+/), DoorConfig(0x13, 0x1A, DoorType.Type5, null/+&DoorEntry148+/), DoorConfig(0x13, 0x1C, DoorType.Type5, null/+&DoorEntry148+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x0B, DoorType.Type2, null/+&DoorEntry888+/), DoorConfig(0x11, 0x0C, DoorType.Type2, null/+&DoorEntry888+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x05, 0x04, DoorType.Type5, null/+&DoorEntry851+/)]),
	SectorDoors(1, []),
	SectorDoors(3, [DoorConfig(0x01, 0x11, DoorType.Type5, null/+&DoorEntry852+/), DoorConfig(0x0D, 0x05, DoorType.Type5, null/+&DoorEntry853+/), DoorConfig(0x11, 0x15, DoorType.Type5, null/+&DoorEntry854+/)]),
	SectorDoors(11, [DoorConfig(0x00, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x01, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x0F, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x14, DoorType.Type1, 0x8000)]),
	SectorDoors(13, [DoorConfig(0x00, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x01, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x0F, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x14, 0x1A, DoorType.Type2, null/+&DoorEntry404+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x00, 0x1C, DoorType.Type2, null/+&DoorEntry461+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.Type2, null/+&DoorEntry39+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x06, DoorType.Type2, null/+&DoorEntry40+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x04, DoorType.Type2, null/+&DoorEntry41+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry42+/)]),
	SectorDoors(4, [DoorConfig(0x0A, 0x0F, DoorType.Type2, null/+&DoorEntry43+/), DoorConfig(0x17, 0x0D, DoorType.Type2, null/+&DoorEntry44+/), DoorConfig(0x17, 0x19, DoorType.Type2, null/+&DoorEntry45+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry46+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry47+/), DoorConfig(0x1D, 0x16, DoorType.Type2, null/+&DoorEntry48+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x11, DoorType.Type5, null/+&DoorEntry863+/)]),
	SectorDoors(9, [DoorConfig(0x09, 0x05, DoorType.Type2, null/+&DoorEntry825+/), DoorConfig(0x09, 0x06, DoorType.Type2, null/+&DoorEntry825+/), DoorConfig(0x09, 0x0D, DoorType.Type2, null/+&DoorEntry826+/), DoorConfig(0x09, 0x0E, DoorType.Type2, null/+&DoorEntry826+/), DoorConfig(0x09, 0x15, DoorType.Type2, null/+&DoorEntry827+/), DoorConfig(0x09, 0x16, DoorType.Type2, null/+&DoorEntry827+/), DoorConfig(0x09, 0x1D, DoorType.Type2, null/+&DoorEntry828+/), DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry828+/), DoorConfig(0x1D, 0x01, DoorType.Type5, null/+&DoorEntry864+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x12, DoorType.Type5, null/+&DoorEntry865+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x04, 0x15, DoorType.Type2, null/+&DoorEntry5+/), DoorConfig(0x04, 0x17, DoorType.Type2, null/+&DoorEntry5+/), DoorConfig(0x07, 0x15, DoorType.Type2, null/+&DoorEntry6+/), DoorConfig(0x09, 0x19, DoorType.Type5, null/+&DoorEntry133+/), DoorConfig(0x09, 0x1A, DoorType.Type5, null/+&DoorEntry133+/)]),
	SectorDoors(2, [DoorConfig(0x1F, 0x02, DoorType.Type5, null/+&DoorEntry135+/), DoorConfig(0x1F, 0x04, DoorType.Type5, null/+&DoorEntry135+/)]),
	SectorDoors(1, [DoorConfig(0x12, 0x1C, DoorType.Type2, null/+&DoorEntry7+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x0C, 0x15, DoorType.Type2, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x17, DoorType.Type2, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x19, DoorType.Type2, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x1B, DoorType.Type2, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x1D, DoorType.Type2, null/+&DoorEntry28+/), DoorConfig(0x0C, 0x1F, DoorType.Type2, null/+&DoorEntry28+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x0D, DoorType.Type2, null/+&DoorEntry889+/), DoorConfig(0x0D, 0x0E, DoorType.Type2, null/+&DoorEntry889+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x03, DoorType.Type2, null/+&DoorEntry890+/), DoorConfig(0x01, 0x04, DoorType.Type2, null/+&DoorEntry890+/), DoorConfig(0x1D, 0x07, DoorType.Type2, null/+&DoorEntry891+/), DoorConfig(0x1D, 0x08, DoorType.Type2, null/+&DoorEntry891+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x05, 0x03, DoorType.Type2, null/+&DoorEntry892+/), DoorConfig(0x05, 0x04, DoorType.Type2, null/+&DoorEntry892+/)]),
	SectorDoors(3, [DoorConfig(0x05, 0x19, DoorType.Type5, null/+&DoorEntry855+/), DoorConfig(0x15, 0x09, DoorType.Type2, null/+&DoorEntry822+/), DoorConfig(0x19, 0x09, DoorType.Type5, null/+&DoorEntry856+/)]),
	SectorDoors(3, [DoorConfig(0x11, 0x16, DoorType.Type5, null/+&DoorEntry857+/), DoorConfig(0x19, 0x0A, DoorType.Type5, null/+&DoorEntry858+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.Type5, null/+&DoorEntry859+/), DoorConfig(0x15, 0x0C, DoorType.Type5, null/+&DoorEntry860+/)]),
	SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.Type2, null/+&DoorEntry650+/), DoorConfig(0x16, 0x11, DoorType.Type1, 0), DoorConfig(0x17, 0x00, DoorType.Type2, null/+&DoorEntry650+/), DoorConfig(0x17, 0x11, DoorType.Type1, 0), DoorConfig(0x1A, 0x00, DoorType.Type2, null/+&DoorEntry651+/), DoorConfig(0x1B, 0x00, DoorType.Type2, null/+&DoorEntry651+/)]),
	SectorDoors(13, [DoorConfig(0x03, 0x03, DoorType.Type2, null/+&DoorEntry652+/), DoorConfig(0x04, 0x03, DoorType.Type1, 0), DoorConfig(0x05, 0x03, DoorType.Type1, 0), DoorConfig(0x06, 0x03, DoorType.Type1, 0), DoorConfig(0x07, 0x03, DoorType.Type1, 0), DoorConfig(0x08, 0x03, DoorType.Type1, 0), DoorConfig(0x09, 0x03, DoorType.Type1, 0), DoorConfig(0x0A, 0x03, DoorType.Type1, 0), DoorConfig(0x0B, 0x03, DoorType.Type1, 0), DoorConfig(0x0C, 0x03, DoorType.Type1, 0), DoorConfig(0x0D, 0x03, DoorType.Type1, 0), DoorConfig(0x0E, 0x03, DoorType.Type1, 0), DoorConfig(0x13, 0x19, DoorType.Type2, null/+&DoorEntry653+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x1D, DoorType.Type2, null/+&DoorEntry654+/)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x16, 0x0D, DoorType.Type1, 0), DoorConfig(0x16, 0x1F, DoorType.Type2, null/+&DoorEntry655+/), DoorConfig(0x17, 0x0D, DoorType.Type1, 0), DoorConfig(0x17, 0x1F, DoorType.Type2, null/+&DoorEntry655+/), DoorConfig(0x1A, 0x1F, DoorType.Type2, null/+&DoorEntry656+/), DoorConfig(0x1B, 0x1F, DoorType.Type2, null/+&DoorEntry656+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x14, 0x0D, DoorType.Type2, null/+&DoorEntry432+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry49+/), DoorConfig(0x17, 0x11, DoorType.Type2, null/+&DoorEntry50+/), DoorConfig(0x17, 0x19, DoorType.Type2, null/+&DoorEntry153+/), DoorConfig(0x17, 0x1D, DoorType.Type2, null/+&DoorEntry154+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry51+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry52+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry53+/)]),
	SectorDoors(6, [DoorConfig(0x07, 0x11, DoorType.Type2, null/+&DoorEntry54+/), DoorConfig(0x07, 0x1A, DoorType.Type5, null/+&DoorEntry155+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry55+/), DoorConfig(0x15, 0x11, DoorType.Type2, null/+&DoorEntry56+/), DoorConfig(0x15, 0x12, DoorType.Type2, null/+&DoorEntry56+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry57+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x01, DoorType.Type2, null/+&DoorEntry58+/), DoorConfig(0x0D, 0x0E, DoorType.Type2, null/+&DoorEntry59+/), DoorConfig(0x19, 0x06, DoorType.Type2, null/+&DoorEntry60+/)]),
	SectorDoors(8, [DoorConfig(0x02, 0x15, DoorType.Type2, null/+&DoorEntry829+/), DoorConfig(0x03, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x18, DoorType.Type5, null/+&DoorEntry866+/), DoorConfig(0x15, 0x0C, DoorType.Type5, null/+&DoorEntry867+/)]),
	SectorDoors(5, [DoorConfig(0x01, 0x11, DoorType.Type5, null/+&DoorEntry846+/), DoorConfig(0x15, 0x16, DoorType.Type5, null/+&DoorEntry868+/), DoorConfig(0x15, 0x1D, DoorType.Type2, null/+&DoorEntry830+/), DoorConfig(0x15, 0x1E, DoorType.Type2, null/+&DoorEntry830+/)]),
	SectorDoors(3, [DoorConfig(0x09, 0x19, DoorType.Type5, null/+&DoorEntry869+/), DoorConfig(0x11, 0x10, DoorType.Type5, null/+&DoorEntry870+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x14, 0x12, DoorType.Type2, null/+&DoorEntry124+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0C, 0x0A, DoorType.Type2, null/+&DoorEntry23+/), DoorConfig(0x13, 0x1E, DoorType.Type5, null/+&DoorEntry145+/)]),
	SectorDoors(1, [DoorConfig(0x13, 0x00, DoorType.Type5, null/+&DoorEntry145+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.Type2, null/+&DoorEntry893+/), DoorConfig(0x09, 0x0E, DoorType.Type2, null/+&DoorEntry893+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x15, 0x0F, DoorType.Type2, null/+&DoorEntry894+/), DoorConfig(0x15, 0x10, DoorType.Type2, null/+&DoorEntry894+/)]),
	SectorDoors(1, [DoorConfig(0x12, 0x16, DoorType.Type2, null/+&DoorEntry895+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x15, DoorType.Type5, null/+&DoorEntry861+/), DoorConfig(0x12, 0x1A, DoorType.Type2, null/+&DoorEntry824+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry61+/), DoorConfig(0x1A, 0x13, DoorType.Type2, null/+&DoorEntry62+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry63+/), DoorConfig(0x17, 0x0A, DoorType.Type5, null/+&DoorEntry677+/), DoorConfig(0x17, 0x12, DoorType.Type2, null/+&DoorEntry64+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry66+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry65+/)]),
	SectorDoors(4, [DoorConfig(0x0A, 0x13, DoorType.Type2, null/+&DoorEntry67+/), DoorConfig(0x1B, 0x11, DoorType.Type2, null/+&DoorEntry68+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry69+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry70+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry71+/), DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry72+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry73+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry74+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry75+/)]),
	SectorDoors(5, [DoorConfig(0x00, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x01, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x14, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x06, DoorType.Type5, null/+&DoorEntry871+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x01, DoorType.Type5, null/+&DoorEntry872+/), DoorConfig(0x0D, 0x15, DoorType.Type2, null/+&DoorEntry831+/), DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry831+/), DoorConfig(0x11, 0x09, DoorType.Type5, null/+&DoorEntry873+/)]),
	SectorDoors(2, [DoorConfig(0x05, 0x05, DoorType.Type5, null/+&DoorEntry874+/), DoorConfig(0x19, 0x02, DoorType.Type5, null/+&DoorEntry875+/)]),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x0B, 0x15, DoorType.Type5, null/+&DoorEntry130+/), DoorConfig(0x0B, 0x17, DoorType.Type5, null/+&DoorEntry130+/), DoorConfig(0x0B, 0x18, DoorType.Type5, null/+&DoorEntry130+/), DoorConfig(0x0B, 0x1A, DoorType.Type5, null/+&DoorEntry130+/)]),
	SectorDoors(3, [DoorConfig(0x03, 0x02, DoorType.Type5, null/+&DoorEntry131+/), DoorConfig(0x03, 0x04, DoorType.Type5, null/+&DoorEntry131+/), DoorConfig(0x04, 0x12, DoorType.Type2, null/+&DoorEntry125+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x08, DoorType.Type2, null/+&DoorEntry8+/), DoorConfig(0x0D, 0x19, DoorType.Type2, null/+&DoorEntry9+/)]),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x0A, 0x15, DoorType.Type5, null/+&DoorEntry143+/), DoorConfig(0x0A, 0x17, DoorType.Type5, null/+&DoorEntry143+/), DoorConfig(0x0A, 0x18, DoorType.Type5, null/+&DoorEntry143+/), DoorConfig(0x0A, 0x1A, DoorType.Type5, null/+&DoorEntry143+/)]),
	SectorDoors(2, [DoorConfig(0x0B, 0x01, DoorType.Type2, null/+&DoorEntry24+/), DoorConfig(0x0B, 0x0D, DoorType.Type2, null/+&DoorEntry25+/)]),
	SectorDoors(5, [DoorConfig(0x12, 0x11, DoorType.Type5, null/+&DoorEntry147+/), DoorConfig(0x12, 0x13, DoorType.Type5, null/+&DoorEntry147+/), DoorConfig(0x12, 0x14, DoorType.Type5, null/+&DoorEntry147+/), DoorConfig(0x12, 0x16, DoorType.Type5, null/+&DoorEntry147+/), DoorConfig(0x1F, 0x11, DoorType.Type2, null/+&DoorEntry139+/)]),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0A, 0x11, DoorType.Type2, null/+&DoorEntry281+/), DoorConfig(0x0A, 0x12, DoorType.Type2, null/+&DoorEntry281+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x17, DoorType.Type2, null/+&DoorEntry277+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x06, DoorType.Type2, null/+&DoorEntry276+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(11, [DoorConfig(0x08, 0x08, DoorType.Type5, null/+&DoorEntry157+/), DoorConfig(0x08, 0x09, DoorType.Type5, null/+&DoorEntry157+/), DoorConfig(0x08, 0x0A, DoorType.Type5, null/+&DoorEntry157+/), DoorConfig(0x08, 0x0C, DoorType.Type5, null/+&DoorEntry158+/), DoorConfig(0x08, 0x0D, DoorType.Type5, null/+&DoorEntry158+/), DoorConfig(0x08, 0x0E, DoorType.Type5, null/+&DoorEntry158+/), DoorConfig(0x08, 0x10, DoorType.Type5, null/+&DoorEntry159+/), DoorConfig(0x08, 0x11, DoorType.Type5, null/+&DoorEntry159+/), DoorConfig(0x08, 0x12, DoorType.Type5, null/+&DoorEntry159+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry76+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry77+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x0A, DoorType.Type2, null/+&DoorEntry78+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry79+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x1B, DoorType.Type2, null/+&DoorEntry80+/), DoorConfig(0x1A, 0x13, DoorType.Type2, null/+&DoorEntry81+/), DoorConfig(0x1B, 0x0C, DoorType.Type2, null/+&DoorEntry82+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry83+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry84+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x04, DoorType.Type2, null/+&DoorEntry85+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry86+/)]),
	SectorDoors(4, [DoorConfig(0x12, 0x1F, DoorType.Type2, null/+&DoorEntry657+/), DoorConfig(0x13, 0x1F, DoorType.Type2, null/+&DoorEntry657+/), DoorConfig(0x16, 0x1F, DoorType.Type2, null/+&DoorEntry658+/), DoorConfig(0x17, 0x1F, DoorType.Type2, null/+&DoorEntry658+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x1D, DoorType.Type4, 0x0200), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry787+/), DoorConfig(0x1D, 0x0A, DoorType.Type4, 0x0100)]),
	SectorDoors(1, [DoorConfig(0x09, 0x06, DoorType.Type2, null/+&DoorEntry788+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x1F, DoorType.Type2, null/+&DoorEntry126+/)]),
	SectorDoors(3, [DoorConfig(0x00, 0x1A, DoorType.Type2, null/+&DoorEntry10+/), DoorConfig(0x0B, 0x09, DoorType.Type2, null/+&DoorEntry11+/), DoorConfig(0x1B, 0x05, DoorType.Type2, null/+&DoorEntry12+/)]),
	SectorDoors(4, [DoorConfig(0x02, 0x19, DoorType.Type5, null/+&DoorEntry134+/), DoorConfig(0x02, 0x1B, DoorType.Type5, null/+&DoorEntry134+/), DoorConfig(0x02, 0x1C, DoorType.Type5, null/+&DoorEntry134+/), DoorConfig(0x02, 0x1E, DoorType.Type5, null/+&DoorEntry134+/)]),
	SectorDoors(3, [DoorConfig(0x06, 0x0F, DoorType.Type2, null/+&DoorEntry13+/), DoorConfig(0x13, 0x16, DoorType.Type5, null/+&DoorEntry136+/), DoorConfig(0x13, 0x18, DoorType.Type5, null/+&DoorEntry136+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x1F, DoorType.Type2, null/+&DoorEntry14+/)]),
	SectorDoors(4, [DoorConfig(0x0D, 0x17, DoorType.Type2, null/+&DoorEntry142+/), DoorConfig(0x11, 0x0B, DoorType.Type2, null/+&DoorEntry141+/), DoorConfig(0x13, 0x19, DoorType.Type5, null/+&DoorEntry144+/), DoorConfig(0x13, 0x1A, DoorType.Type5, null/+&DoorEntry144+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0F, 0x01, DoorType.Type2, null/+&DoorEntry26+/)]),
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
	SectorDoors(12, [DoorConfig(0x08, 0x08, DoorType.Type5, null/+&DoorEntry160+/), DoorConfig(0x08, 0x09, DoorType.Type5, null/+&DoorEntry160+/), DoorConfig(0x08, 0x0A, DoorType.Type5, null/+&DoorEntry160+/), DoorConfig(0x08, 0x0C, DoorType.Type5, null/+&DoorEntry161+/), DoorConfig(0x08, 0x0D, DoorType.Type5, null/+&DoorEntry161+/), DoorConfig(0x08, 0x0E, DoorType.Type5, null/+&DoorEntry161+/), DoorConfig(0x08, 0x10, DoorType.Type5, null/+&DoorEntry162+/), DoorConfig(0x08, 0x11, DoorType.Type5, null/+&DoorEntry162+/), DoorConfig(0x08, 0x12, DoorType.Type5, null/+&DoorEntry162+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry87+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry88+/), DoorConfig(0x1A, 0x17, DoorType.Type2, null/+&DoorEntry89+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry90+/), DoorConfig(0x1B, 0x09, DoorType.Type2, null/+&DoorEntry91+/), DoorConfig(0x1B, 0x0E, DoorType.Type5, null/+&DoorEntry156+/), DoorConfig(0x1B, 0x11, DoorType.Type2, null/+&DoorEntry92+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry93+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry94+/), DoorConfig(0x18, 0x16, DoorType.Type5, null/+&DoorEntry163+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry95+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry96+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry97+/)]),
	SectorDoors(4, [DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry98+/), DoorConfig(0x17, 0x11, DoorType.Type2, null/+&DoorEntry99+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry100+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry101+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1B, 0x19, DoorType.Type2, null/+&DoorEntry15+/)]),
	SectorDoors(2, [DoorConfig(0x1B, 0x01, DoorType.Type5, null/+&DoorEntry128+/), DoorConfig(0x1B, 0x02, DoorType.Type5, null/+&DoorEntry128+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x12, 0x0F, DoorType.Type2, null/+&DoorEntry16+/), DoorConfig(0x1B, 0x05, DoorType.Type5, null/+&DoorEntry129+/), DoorConfig(0x1B, 0x07, DoorType.Type5, null/+&DoorEntry129+/), DoorConfig(0x1B, 0x08, DoorType.Type5, null/+&DoorEntry129+/), DoorConfig(0x1B, 0x0A, DoorType.Type5, null/+&DoorEntry129+/)]),
	SectorDoors(3, [DoorConfig(0x0B, 0x00, DoorType.Type5, null/+&DoorEntry132+/), DoorConfig(0x0B, 0x02, DoorType.Type5, null/+&DoorEntry132+/), DoorConfig(0x19, 0x14, DoorType.Type2, null/+&DoorEntry127+/)]),
	SectorDoors(3, [DoorConfig(0x12, 0x05, DoorType.Type2, null/+&DoorEntry17+/), DoorConfig(0x12, 0x07, DoorType.Type2, null/+&DoorEntry17+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry18+/)]),
	SectorDoors(4, [DoorConfig(0x03, 0x16, DoorType.Type5, null/+&DoorEntry138+/), DoorConfig(0x03, 0x18, DoorType.Type5, null/+&DoorEntry138+/), DoorConfig(0x15, 0x1C, DoorType.Type2, null/+&DoorEntry19+/), DoorConfig(0x19, 0x08, DoorType.Type2, null/+&DoorEntry20+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x07, 0x11, DoorType.Type2, null/+&DoorEntry27+/), DoorConfig(0x17, 0x01, DoorType.Type2, null/+&DoorEntry140+/)]),
	SectorDoors(6, [DoorConfig(0x07, 0x05, DoorType.Type5, null/+&DoorEntry146+/), DoorConfig(0x07, 0x07, DoorType.Type5, null/+&DoorEntry146+/), DoorConfig(0x07, 0x08, DoorType.Type5, null/+&DoorEntry146+/), DoorConfig(0x07, 0x0A, DoorType.Type5, null/+&DoorEntry146+/), DoorConfig(0x13, 0x11, DoorType.Type5, null/+&DoorEntry149+/), DoorConfig(0x13, 0x12, DoorType.Type5, null/+&DoorEntry149+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.Type2, null/+&DoorEntry282+/)]),
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
	SectorDoors(1, [DoorConfig(0x04, 0x09, DoorType.Type2, null/+&DoorEntry278+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry258+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry259+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry260+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry381+/), DoorConfig(0x18, 0x0D, DoorType.Type2, null/+&DoorEntry395+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry261+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry262+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry382+/), DoorConfig(0x18, 0x0D, DoorType.Type2, null/+&DoorEntry396+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry102+/), DoorConfig(0x1A, 0x04, DoorType.Type2, null/+&DoorEntry265+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry266+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x07, 0x0D, DoorType.Type5, null/+&DoorEntry137+/), DoorConfig(0x07, 0x0E, DoorType.Type5, null/+&DoorEntry137+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1F, 0x11, DoorType.Type2, null/+&DoorEntry948+/)]),
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
	SectorDoors(1, [DoorConfig(0x10, 0x02, DoorType.Type2, null/+&DoorEntry383+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry384+/), DoorConfig(0x18, 0x0D, DoorType.Type2, null/+&DoorEntry397+/)]),
	SectorDoors(1, [DoorConfig(0x12, 0x04, DoorType.Type2, null/+&DoorEntry267+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry385+/), DoorConfig(0x18, 0x0D, DoorType.Type2, null/+&DoorEntry398+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry491+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x1C, DoorType.Type2, null/+&DoorEntry365+/), DoorConfig(0x11, 0x1E, DoorType.Type2, null/+&DoorEntry365+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(14, [DoorConfig(0x0A, 0x07, DoorType.Type2, null/+&DoorEntry115+/), DoorConfig(0x0A, 0x08, DoorType.Type2, null/+&DoorEntry115+/), DoorConfig(0x12, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x13, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x14, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x15, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x16, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x17, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x18, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x19, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x1A, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x1B, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x1C, 0x0A, DoorType.Type1, 0x8000), DoorConfig(0x1D, 0x0A, DoorType.Type1, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1B, 0x05, DoorType.Type2, null/+&DoorEntry29+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x0B, DoorType.Type2, null/+&DoorEntry121+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry122+/)]),
	SectorDoors(10, [DoorConfig(0x0A, 0x09, DoorType.Type2, null/+&DoorEntry896+/), DoorConfig(0x0B, 0x09, DoorType.Type1, 0), DoorConfig(0x0C, 0x09, DoorType.Type1, 0), DoorConfig(0x0D, 0x09, DoorType.Type1, 0), DoorConfig(0x0E, 0x09, DoorType.Type1, 0), DoorConfig(0x0F, 0x09, DoorType.Type1, 0), DoorConfig(0x10, 0x09, DoorType.Type1, 0), DoorConfig(0x11, 0x09, DoorType.Type1, 0), DoorConfig(0x12, 0x09, DoorType.Type1, 0), DoorConfig(0x13, 0x09, DoorType.Type1, 0)]),
	SectorDoors(10, [DoorConfig(0x06, 0x01, DoorType.Type2, null/+&DoorEntry897+/), DoorConfig(0x07, 0x01, DoorType.Type1, 0), DoorConfig(0x08, 0x01, DoorType.Type1, 0), DoorConfig(0x09, 0x01, DoorType.Type1, 0), DoorConfig(0x0A, 0x01, DoorType.Type1, 0), DoorConfig(0x0B, 0x01, DoorType.Type1, 0), DoorConfig(0x0C, 0x01, DoorType.Type1, 0), DoorConfig(0x0D, 0x01, DoorType.Type1, 0), DoorConfig(0x0E, 0x01, DoorType.Type1, 0), DoorConfig(0x0F, 0x01, DoorType.Type1, 0)]),
	SectorDoors(2, [DoorConfig(0x18, 0x16, DoorType.Type2, null/+&DoorEntry279+/), DoorConfig(0x18, 0x17, DoorType.Type2, null/+&DoorEntry279+/)]),
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
	SectorDoors(1, [DoorConfig(0x0C, 0x09, DoorType.Type2, null/+&DoorEntry447+/)]),
	SectorDoors(2, [DoorConfig(0x1E, 0x15, DoorType.Type2, null/+&DoorEntry446+/), DoorConfig(0x1E, 0x16, DoorType.Type2, null/+&DoorEntry446+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry263+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry492+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x12, DoorType.Type2, null/+&DoorEntry264+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x02, 0x11, DoorType.Type5, null/+&DoorEntry379+/), DoorConfig(0x02, 0x13, DoorType.Type5, null/+&DoorEntry379+/), DoorConfig(0x03, 0x17, DoorType.Type2, null/+&DoorEntry366+/)]),
	SectorDoors(0, []),
	SectorDoors(21, [DoorConfig(0x04, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x0F, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x13, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x14, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x15, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x16, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x17, 0x06, DoorType.Type1, 0x8000), DoorConfig(0x19, 0x0E, DoorType.Type2, null/+&DoorEntry116+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(10, [DoorConfig(0x16, 0x01, DoorType.Type2, null/+&DoorEntry898+/), DoorConfig(0x17, 0x01, DoorType.Type1, 0), DoorConfig(0x18, 0x01, DoorType.Type1, 0), DoorConfig(0x19, 0x01, DoorType.Type1, 0), DoorConfig(0x1A, 0x01, DoorType.Type1, 0), DoorConfig(0x1B, 0x01, DoorType.Type1, 0), DoorConfig(0x1C, 0x01, DoorType.Type1, 0), DoorConfig(0x1D, 0x01, DoorType.Type1, 0), DoorConfig(0x1E, 0x01, DoorType.Type1, 0), DoorConfig(0x1F, 0x01, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x03, 0x01, DoorType.Type2, null/+&DoorEntry328+/), DoorConfig(0x03, 0x1E, DoorType.Type2, null/+&DoorEntry329+/), DoorConfig(0x1E, 0x05, DoorType.Type2, null/+&DoorEntry902+/), DoorConfig(0x1F, 0x05, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry270+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry271+/)]),
	SectorDoors(2, [DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry119+/), DoorConfig(0x1B, 0x01, DoorType.Type2, null/+&DoorEntry120+/)]),
	SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry785+/), DoorConfig(0x19, 0x12, DoorType.Type2, null/+&DoorEntry786+/)]),
	SectorDoors(2, [DoorConfig(0x18, 0x05, DoorType.Type2, null/+&DoorEntry113+/), DoorConfig(0x19, 0x17, DoorType.Type2, null/+&DoorEntry114+/)]),
	SectorDoors(2, [DoorConfig(0x04, 0x16, DoorType.Type2, null/+&DoorEntry433+/), DoorConfig(0x04, 0x17, DoorType.Type2, null/+&DoorEntry433+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1A, 0x01, DoorType.Type2, null/+&DoorEntry938+/), DoorConfig(0x1A, 0x11, DoorType.Type2, null/+&DoorEntry939+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x06, DoorType.Type2, null/+&DoorEntry940+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x02, 0x0C, DoorType.Type2, null/+&DoorEntry268+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry380+/)]),
	SectorDoors(2, [DoorConfig(0x1B, 0x11, DoorType.Type2, null/+&DoorEntry386+/), DoorConfig(0x1B, 0x1A, DoorType.Type2, null/+&DoorEntry387+/)]),
	SectorDoors(1, [DoorConfig(0x02, 0x13, DoorType.Type2, null/+&DoorEntry269+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1A, 0x03, DoorType.Type2, null/+&DoorEntry378+/)]),
	SectorDoors(0, []),
	SectorDoors(11, [DoorConfig(0x01, 0x13, DoorType.Type2, null/+&DoorEntry906+/), DoorConfig(0x02, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x13, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x05, DoorType.Type2, null/+&DoorEntry907+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x08, 0x17, DoorType.Type2, null/+&DoorEntry913+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(12, [DoorConfig(0x02, 0x0D, DoorType.Type2, null/+&DoorEntry899+/), DoorConfig(0x03, 0x0D, DoorType.Type1, 0), DoorConfig(0x04, 0x0D, DoorType.Type1, 0), DoorConfig(0x05, 0x0D, DoorType.Type1, 0), DoorConfig(0x06, 0x0D, DoorType.Type1, 0), DoorConfig(0x07, 0x0D, DoorType.Type1, 0), DoorConfig(0x08, 0x0D, DoorType.Type1, 0), DoorConfig(0x09, 0x0D, DoorType.Type1, 0), DoorConfig(0x0A, 0x0D, DoorType.Type1, 0), DoorConfig(0x0B, 0x0D, DoorType.Type1, 0), DoorConfig(0x1E, 0x0D, DoorType.Type2, null/+&DoorEntry900+/), DoorConfig(0x1F, 0x0D, DoorType.Type1, 0)]),
	SectorDoors(1, []),
	SectorDoors(0, []),
	SectorDoors(8, [DoorConfig(0x00, 0x05, DoorType.Type1, 0), DoorConfig(0x01, 0x05, DoorType.Type1, 0), DoorConfig(0x02, 0x05, DoorType.Type1, 0), DoorConfig(0x03, 0x05, DoorType.Type1, 0), DoorConfig(0x04, 0x05, DoorType.Type1, 0), DoorConfig(0x05, 0x05, DoorType.Type1, 0), DoorConfig(0x06, 0x05, DoorType.Type1, 0), DoorConfig(0x07, 0x05, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x14, 0x17, DoorType.Type2, null/+&DoorEntry682+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x13, 0x08, DoorType.Type2, null/+&DoorEntry683+/)]),
	SectorDoors(1, [DoorConfig(0x13, 0x17, DoorType.Type2, null/+&DoorEntry684+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x14, 0x02, DoorType.Type2, null/+&DoorEntry685+/), DoorConfig(0x14, 0x03, DoorType.Type2, null/+&DoorEntry685+/)]),
	SectorDoors(3, [DoorConfig(0x11, 0x0C, DoorType.Type2, null/+&DoorEntry686+/), DoorConfig(0x11, 0x0E, DoorType.Type2, null/+&DoorEntry686+/), DoorConfig(0x11, 0x10, DoorType.Type2, null/+&DoorEntry686+/)]),
	SectorDoors(3, [DoorConfig(0x17, 0x05, DoorType.Type5, null/+&DoorEntry741+/), DoorConfig(0x17, 0x07, DoorType.Type5, null/+&DoorEntry741+/), DoorConfig(0x17, 0x08, DoorType.Type5, null/+&DoorEntry741+/)]),
	SectorDoors(2, [DoorConfig(0x16, 0x0D, DoorType.Type2, null/+&DoorEntry687+/), DoorConfig(0x16, 0x0E, DoorType.Type2, null/+&DoorEntry687+/)]),
	SectorDoors(3, [DoorConfig(0x18, 0x0D, DoorType.Type5, null/+&DoorEntry742+/), DoorConfig(0x18, 0x0F, DoorType.Type5, null/+&DoorEntry742+/), DoorConfig(0x18, 0x11, DoorType.Type5, null/+&DoorEntry742+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x0A, DoorType.Type2, null/+&DoorEntry688+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x0B, DoorType.Type2, null/+&DoorEntry738+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x0B, DoorType.Type2, null/+&DoorEntry739+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x05, DoorType.Type2, null/+&DoorEntry388+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x0A, DoorType.Type2, null/+&DoorEntry389+/)]),
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
	SectorDoors(8, [DoorConfig(0x00, 0x0D, DoorType.Type1, 0), DoorConfig(0x01, 0x0D, DoorType.Type1, 0), DoorConfig(0x02, 0x0D, DoorType.Type1, 0), DoorConfig(0x03, 0x0D, DoorType.Type1, 0), DoorConfig(0x04, 0x0D, DoorType.Type1, 0), DoorConfig(0x05, 0x0D, DoorType.Type1, 0), DoorConfig(0x06, 0x0D, DoorType.Type1, 0), DoorConfig(0x07, 0x0D, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x0E, 0x0D, DoorType.Type2, null/+&DoorEntry901+/), DoorConfig(0x0F, 0x0D, DoorType.Type1, 0), DoorConfig(0x10, 0x0D, DoorType.Type1, 0), DoorConfig(0x11, 0x0D, DoorType.Type1, 0), DoorConfig(0x12, 0x0D, DoorType.Type1, 0), DoorConfig(0x13, 0x0D, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x05, 0x0D, DoorType.Type4, 0x0300), DoorConfig(0x05, 0x1E, DoorType.Type4, 0x0200), DoorConfig(0x07, 0x05, DoorType.Type4, 0x0300), DoorConfig(0x07, 0x0F, DoorType.Type4, 0), DoorConfig(0x07, 0x1C, DoorType.Type4, 0x0100), DoorConfig(0x09, 0x07, DoorType.Type4, 0)]),
	SectorDoors(2, [DoorConfig(0x07, 0x0A, DoorType.Type4, 0x0200), DoorConfig(0x09, 0x08, DoorType.Type4, 0x0100)]),
	SectorDoors(4, [DoorConfig(0x09, 0x02, DoorType.Type4, 0x0200), DoorConfig(0x0B, 0x00, DoorType.Type4, 0x0100), DoorConfig(0x0B, 0x0E, DoorType.Type4, 0x0200), DoorConfig(0x0D, 0x0C, DoorType.Type4, 0x0100)]),
	SectorDoors(6, [DoorConfig(0x09, 0x09, DoorType.Type4, 0x0300), DoorConfig(0x09, 0x1A, DoorType.Type4, 0x0200), DoorConfig(0x0B, 0x01, DoorType.Type4, 0x0300), DoorConfig(0x0B, 0x0B, DoorType.Type4, 0), DoorConfig(0x0B, 0x18, DoorType.Type4, 0x0100), DoorConfig(0x0D, 0x03, DoorType.Type4, 0)]),
	SectorDoors(10, [DoorConfig(0x08, 0x08, DoorType.Type5, null/+&DoorEntry740+/), DoorConfig(0x08, 0x09, DoorType.Type5, null/+&DoorEntry740+/), DoorConfig(0x08, 0x0A, DoorType.Type5, null/+&DoorEntry740+/), DoorConfig(0x08, 0x0C, DoorType.Type5, null/+&DoorEntry740+/), DoorConfig(0x08, 0x0D, DoorType.Type5, null/+&DoorEntry740+/), DoorConfig(0x08, 0x0E, DoorType.Type5, null/+&DoorEntry740+/), DoorConfig(0x0B, 0x02, DoorType.Type4, 0x0200), DoorConfig(0x0B, 0x19, DoorType.Type4, 0x0300), DoorConfig(0x0D, 0x00, DoorType.Type4, 0x0100), DoorConfig(0x0D, 0x1B, DoorType.Type4, 0)]),
	SectorDoors(2, [DoorConfig(0x09, 0x05, DoorType.Type4, 0x0300), DoorConfig(0x0B, 0x07, DoorType.Type4, 0)]),
	SectorDoors(6, [DoorConfig(0x05, 0x09, DoorType.Type4, 0x0300), DoorConfig(0x05, 0x1E, DoorType.Type4, 0x0200), DoorConfig(0x07, 0x01, DoorType.Type4, 0x0300), DoorConfig(0x07, 0x0B, DoorType.Type4, 0), DoorConfig(0x07, 0x1C, DoorType.Type4, 0x0100), DoorConfig(0x09, 0x03, DoorType.Type4, 0)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0A, DoorType.Type4, 0x0200), DoorConfig(0x09, 0x08, DoorType.Type4, 0x0100), DoorConfig(0x0B, 0x1E, DoorType.Type4, 0x0100)]),
	SectorDoors(1, [DoorConfig(0x09, 0x00, DoorType.Type4, 0x0200)]),
	SectorDoors(2, [DoorConfig(0x02, 0x02, DoorType.Type2, null/+&DoorEntry689+/), DoorConfig(0x02, 0x16, DoorType.Type2, null/+&DoorEntry690+/)]),
	SectorDoors(2, [DoorConfig(0x02, 0x02, DoorType.Type2, null/+&DoorEntry691+/), DoorConfig(0x02, 0x16, DoorType.Type2, null/+&DoorEntry692+/)]),
	SectorDoors(1, [DoorConfig(0x02, 0x02, DoorType.Type2, null/+&DoorEntry693+/)]),
	SectorDoors(3, [DoorConfig(0x04, 0x1E, DoorType.Type2, null/+&DoorEntry391+/), DoorConfig(0x1B, 0x11, DoorType.Type2, null/+&DoorEntry392+/), DoorConfig(0x1B, 0x1A, DoorType.Type2, null/+&DoorEntry393+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x1A, DoorType.Type2, null/+&DoorEntry390+/), DoorConfig(0x0A, 0x1B, DoorType.Type2, null/+&DoorEntry390+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0E, 0x03, DoorType.Type2, null/+&DoorEntry367+/)]),
	SectorDoors(2, [DoorConfig(0x10, 0x18, DoorType.Type2, null/+&DoorEntry30+/), DoorConfig(0x10, 0x1A, DoorType.Type2, null/+&DoorEntry30+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x02, 0x0A, DoorType.Type2, null/+&DoorEntry914+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.Type2, null/+&DoorEntry667+/), DoorConfig(0x16, 0x11, DoorType.Type1, 0), DoorConfig(0x17, 0x00, DoorType.Type2, null/+&DoorEntry667+/), DoorConfig(0x17, 0x11, DoorType.Type1, 0), DoorConfig(0x1A, 0x00, DoorType.Type2, null/+&DoorEntry668+/), DoorConfig(0x1B, 0x00, DoorType.Type2, null/+&DoorEntry668+/)]),
	SectorDoors(13, [DoorConfig(0x03, 0x1B, DoorType.Type2, null/+&DoorEntry669+/), DoorConfig(0x04, 0x1B, DoorType.Type1, 0), DoorConfig(0x05, 0x1B, DoorType.Type1, 0), DoorConfig(0x06, 0x1B, DoorType.Type1, 0), DoorConfig(0x07, 0x1B, DoorType.Type1, 0), DoorConfig(0x08, 0x1B, DoorType.Type1, 0), DoorConfig(0x09, 0x1B, DoorType.Type1, 0), DoorConfig(0x0A, 0x1B, DoorType.Type1, 0), DoorConfig(0x0B, 0x1B, DoorType.Type1, 0), DoorConfig(0x0C, 0x1B, DoorType.Type1, 0), DoorConfig(0x0D, 0x1B, DoorType.Type1, 0), DoorConfig(0x0E, 0x1B, DoorType.Type1, 0), DoorConfig(0x13, 0x09, DoorType.Type2, null/+&DoorEntry670+/)]),
	SectorDoors(2, [DoorConfig(0x16, 0x09, DoorType.Type1, 0), DoorConfig(0x17, 0x09, DoorType.Type1, 0)]),
	SectorDoors(3, [DoorConfig(0x09, 0x01, DoorType.Type2, null/+&DoorEntry797+/), DoorConfig(0x0A, 0x0A, DoorType.Type4, 0x0300), DoorConfig(0x1D, 0x1D, DoorType.Type4, 0)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x0A, DoorType.Type2, null/+&DoorEntry798+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry458+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x1F, DoorType.Type2, null/+&DoorEntry455+/), DoorConfig(0x1B, 0x01, DoorType.Type2, null/+&DoorEntry456+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x05, DoorType.Type2, null/+&DoorEntry394+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry457+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x02, 0x0B, DoorType.Type2, null/+&DoorEntry368+/), DoorConfig(0x06, 0x13, DoorType.Type2, null/+&DoorEntry369+/)]),
	SectorDoors(1, [DoorConfig(0x02, 0x07, DoorType.Type2, null/+&DoorEntry370+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x18, 0x1A, DoorType.Type2, null/+&DoorEntry400+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x01, DoorType.Type2, null/+&DoorEntry272+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry273+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x19, DoorType.Type2, null/+&DoorEntry743+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry808+/), DoorConfig(0x1D, 0x0E, DoorType.Type4, 0x0100)]),
	SectorDoors(6, [DoorConfig(0x09, 0x0E, DoorType.Type2, null/+&DoorEntry809+/), DoorConfig(0x0A, 0x01, DoorType.Type4, 0x0200), DoorConfig(0x15, 0x00, DoorType.Type2, null/+&DoorEntry330+/), DoorConfig(0x15, 0x0A, DoorType.Type4, 0x0300), DoorConfig(0x1D, 0x12, DoorType.Type4, 0), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry331+/)]),
	SectorDoors(7, [DoorConfig(0x08, 0x06, DoorType.Type2, null/+&DoorEntry548+/), DoorConfig(0x09, 0x05, DoorType.Type2, null/+&DoorEntry548+/), DoorConfig(0x0A, 0x04, DoorType.Type2, null/+&DoorEntry548+/), DoorConfig(0x0B, 0x03, DoorType.Type2, null/+&DoorEntry548+/), DoorConfig(0x0C, 0x02, DoorType.Type2, null/+&DoorEntry548+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry548+/), DoorConfig(0x1C, 0x19, DoorType.Type2, null/+&DoorEntry659+/)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry813+/)]),
	SectorDoors(7, [DoorConfig(0x08, 0x15, DoorType.Type2, null/+&DoorEntry549+/), DoorConfig(0x09, 0x16, DoorType.Type2, null/+&DoorEntry549+/), DoorConfig(0x0A, 0x17, DoorType.Type2, null/+&DoorEntry549+/), DoorConfig(0x0B, 0x18, DoorType.Type2, null/+&DoorEntry549+/), DoorConfig(0x0C, 0x19, DoorType.Type2, null/+&DoorEntry549+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry549+/), DoorConfig(0x1D, 0x1E, DoorType.Type4, 0x0100)]),
	SectorDoors(2, [DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry814+/), DoorConfig(0x0A, 0x11, DoorType.Type4, 0x0200)]),
	SectorDoors(3, [DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry478+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry459+/), DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry460+/)]),
	SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.Type2, null/+&DoorEntry661+/), DoorConfig(0x16, 0x11, DoorType.Type1, 0), DoorConfig(0x17, 0x00, DoorType.Type2, null/+&DoorEntry661+/), DoorConfig(0x17, 0x11, DoorType.Type1, 0), DoorConfig(0x1A, 0x00, DoorType.Type2, null/+&DoorEntry662+/), DoorConfig(0x1B, 0x00, DoorType.Type2, null/+&DoorEntry662+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x1D, DoorType.Type2, null/+&DoorEntry663+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x16, 0x0D, DoorType.Type1, 0), DoorConfig(0x16, 0x1F, DoorType.Type2, null/+&DoorEntry664+/), DoorConfig(0x17, 0x0D, DoorType.Type1, 0), DoorConfig(0x17, 0x1F, DoorType.Type2, null/+&DoorEntry664+/), DoorConfig(0x1A, 0x1F, DoorType.Type2, null/+&DoorEntry665+/), DoorConfig(0x1B, 0x1F, DoorType.Type2, null/+&DoorEntry665+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x0D, 0x05, DoorType.Type2, null/+&DoorEntry793+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry794+/), DoorConfig(0x0E, 0x0F, DoorType.Type2, null/+&DoorEntry795+/), DoorConfig(0x0E, 0x10, DoorType.Type2, null/+&DoorEntry795+/), DoorConfig(0x11, 0x01, DoorType.Type2, null/+&DoorEntry796+/)]),
	SectorDoors(1, [DoorConfig(0x10, 0x09, DoorType.Type2, null/+&DoorEntry401+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x08, 0x14, DoorType.Type2, null/+&DoorEntry552+/), DoorConfig(0x09, 0x15, DoorType.Type2, null/+&DoorEntry552+/), DoorConfig(0x0A, 0x16, DoorType.Type2, null/+&DoorEntry552+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x18, 0x10, DoorType.Type2, null/+&DoorEntry562+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x13, 0x00, DoorType.Type2, null/+&DoorEntry744+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1F, 0x0E, DoorType.Type1, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(13, [DoorConfig(0x0A, 0x0C, DoorType.Type2, null/+&DoorEntry423+/), DoorConfig(0x14, 0x06, DoorType.Type1, 0), DoorConfig(0x15, 0x06, DoorType.Type1, 0), DoorConfig(0x16, 0x06, DoorType.Type1, 0), DoorConfig(0x17, 0x06, DoorType.Type1, 0), DoorConfig(0x18, 0x06, DoorType.Type1, 0), DoorConfig(0x19, 0x06, DoorType.Type1, 0), DoorConfig(0x1A, 0x06, DoorType.Type1, 0), DoorConfig(0x1B, 0x06, DoorType.Type1, 0), DoorConfig(0x1C, 0x06, DoorType.Type1, 0), DoorConfig(0x1D, 0x06, DoorType.Type1, 0), DoorConfig(0x1E, 0x06, DoorType.Type1, 0), DoorConfig(0x1F, 0x06, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(13, [DoorConfig(0x04, 0x0C, DoorType.Type2, null/+&DoorEntry409+/), DoorConfig(0x05, 0x0C, DoorType.Type1, 0), DoorConfig(0x06, 0x0C, DoorType.Type1, 0), DoorConfig(0x07, 0x0C, DoorType.Type1, 0), DoorConfig(0x08, 0x0C, DoorType.Type1, 0), DoorConfig(0x09, 0x0C, DoorType.Type1, 0), DoorConfig(0x0A, 0x0C, DoorType.Type1, 0), DoorConfig(0x0B, 0x0C, DoorType.Type1, 0), DoorConfig(0x0C, 0x0C, DoorType.Type1, 0), DoorConfig(0x0D, 0x0C, DoorType.Type1, 0), DoorConfig(0x0E, 0x0C, DoorType.Type1, 0), DoorConfig(0x0F, 0x0C, DoorType.Type1, 0), DoorConfig(0x14, 0x1A, DoorType.Type2, null/+&DoorEntry410+/)]),
	SectorDoors(1, [DoorConfig(0x1E, 0x18, DoorType.Type2, null/+&DoorEntry963+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x1C, DoorType.Type2, null/+&DoorEntry964+/), DoorConfig(0x1E, 0x02, DoorType.Type5, null/+&DoorEntry976+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x00, 0x19, DoorType.Type2, null/+&DoorEntry371+/), DoorConfig(0x00, 0x1A, DoorType.Type2, null/+&DoorEntry371+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x17, 0x04, DoorType.Type2, null/+&DoorEntry767+/), DoorConfig(0x17, 0x18, DoorType.Type2, null/+&DoorEntry768+/)]),
	SectorDoors(9, [DoorConfig(0x0C, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x0F, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x13, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x1F, 0x0C, DoorType.Type2, null/+&DoorEntry769+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x02, 0x04, DoorType.Type2, null/+&DoorEntry553+/)]),
	SectorDoors(1, [DoorConfig(0x06, 0x0A, DoorType.Type5, null/+&DoorEntry672+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x18, DoorType.Type2, null/+&DoorEntry745+/)]),
	SectorDoors(1, [DoorConfig(0x13, 0x08, DoorType.Type2, null/+&DoorEntry746+/)]),
	SectorDoors(1, [DoorConfig(0x03, 0x10, DoorType.Type2, null/+&DoorEntry747+/)]),
	SectorDoors(26, [DoorConfig(0x00, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x01, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x0E, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x13, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x14, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x15, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x16, 0x0D, DoorType.Type1, 0x8000), DoorConfig(0x1A, 0x0C, DoorType.Type1, 0x8000), DoorConfig(0x1B, 0x0C, DoorType.Type1, 0x8000), DoorConfig(0x1C, 0x0C, DoorType.Type1, 0x8000), DoorConfig(0x1D, 0x0C, DoorType.Type1, 0x8000), DoorConfig(0x1E, 0x0C, DoorType.Type1, 0x8000), DoorConfig(0x1F, 0x0C, DoorType.Type1, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(7, [DoorConfig(0x00, 0x06, DoorType.Type1, 0), DoorConfig(0x01, 0x06, DoorType.Type1, 0), DoorConfig(0x02, 0x06, DoorType.Type1, 0), DoorConfig(0x03, 0x06, DoorType.Type1, 0), DoorConfig(0x04, 0x06, DoorType.Type1, 0), DoorConfig(0x05, 0x06, DoorType.Type1, 0), DoorConfig(0x06, 0x06, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(16, [DoorConfig(0x10, 0x06, DoorType.Type1, 0), DoorConfig(0x11, 0x06, DoorType.Type1, 0), DoorConfig(0x12, 0x06, DoorType.Type1, 0), DoorConfig(0x13, 0x06, DoorType.Type1, 0), DoorConfig(0x14, 0x06, DoorType.Type1, 0), DoorConfig(0x15, 0x06, DoorType.Type1, 0), DoorConfig(0x16, 0x06, DoorType.Type1, 0), DoorConfig(0x17, 0x06, DoorType.Type1, 0), DoorConfig(0x18, 0x06, DoorType.Type1, 0), DoorConfig(0x19, 0x06, DoorType.Type1, 0), DoorConfig(0x1A, 0x06, DoorType.Type1, 0), DoorConfig(0x1B, 0x06, DoorType.Type1, 0), DoorConfig(0x1C, 0x06, DoorType.Type1, 0), DoorConfig(0x1D, 0x06, DoorType.Type1, 0), DoorConfig(0x1E, 0x06, DoorType.Type1, 0), DoorConfig(0x1F, 0x06, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x04, 0x08, DoorType.Type2, null/+&DoorEntry965+/), DoorConfig(0x05, 0x09, DoorType.Type2, null/+&DoorEntry965+/), DoorConfig(0x06, 0x0A, DoorType.Type2, null/+&DoorEntry965+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x14, 0x15, DoorType.Type2, null/+&DoorEntry372+/), DoorConfig(0x14, 0x16, DoorType.Type2, null/+&DoorEntry372+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x04, 0x19, DoorType.Type2, null/+&DoorEntry770+/)]),
	SectorDoors(1, [DoorConfig(0x03, 0x0C, DoorType.Type2, null/+&DoorEntry771+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x16, 0x1A, DoorType.Type5, null/+&DoorEntry673+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x14, 0x14, DoorType.Type2, null/+&DoorEntry554+/), DoorConfig(0x16, 0x12, DoorType.Type2, null/+&DoorEntry554+/), DoorConfig(0x18, 0x10, DoorType.Type2, null/+&DoorEntry554+/)]),
	SectorDoors(1, [DoorConfig(0x02, 0x10, DoorType.Type2, null/+&DoorEntry555+/)]),
	SectorDoors(2, [DoorConfig(0x17, 0x03, DoorType.Type2, null/+&DoorEntry556+/), DoorConfig(0x18, 0x04, DoorType.Type2, null/+&DoorEntry556+/)]),
	SectorDoors(2, [DoorConfig(0x01, 0x0D, DoorType.Type2, null/+&DoorEntry557+/), DoorConfig(0x02, 0x0D, DoorType.Type2, null/+&DoorEntry557+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x1D, DoorType.Type2, null/+&DoorEntry748+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x00, 0x0C, DoorType.Type1, 0x8000), DoorConfig(0x01, 0x0C, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x0C, DoorType.Type1, 0x8000)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x11, DoorType.Type2, null/+&DoorEntry949+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.Type2, null/+&DoorEntry648+/), DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry649+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x0E, DoorType.Type5, null/+&DoorEntry975+/), DoorConfig(0x11, 0x1E, DoorType.Type2, null/+&DoorEntry974+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry430+/)]),
	SectorDoors(32, [DoorConfig(0x00, 0x06, DoorType.Type1, 0), DoorConfig(0x01, 0x06, DoorType.Type1, 0), DoorConfig(0x02, 0x06, DoorType.Type1, 0), DoorConfig(0x03, 0x06, DoorType.Type1, 0), DoorConfig(0x04, 0x06, DoorType.Type1, 0), DoorConfig(0x05, 0x06, DoorType.Type1, 0), DoorConfig(0x06, 0x06, DoorType.Type1, 0), DoorConfig(0x07, 0x06, DoorType.Type1, 0), DoorConfig(0x08, 0x06, DoorType.Type1, 0), DoorConfig(0x09, 0x06, DoorType.Type1, 0), DoorConfig(0x0A, 0x06, DoorType.Type1, 0), DoorConfig(0x0B, 0x06, DoorType.Type1, 0), DoorConfig(0x0C, 0x06, DoorType.Type1, 0), DoorConfig(0x0D, 0x06, DoorType.Type1, 0), DoorConfig(0x0E, 0x06, DoorType.Type1, 0), DoorConfig(0x0F, 0x06, DoorType.Type1, 0), DoorConfig(0x10, 0x06, DoorType.Type1, 0), DoorConfig(0x11, 0x06, DoorType.Type1, 0), DoorConfig(0x12, 0x06, DoorType.Type1, 0), DoorConfig(0x13, 0x06, DoorType.Type1, 0), DoorConfig(0x14, 0x06, DoorType.Type1, 0), DoorConfig(0x15, 0x06, DoorType.Type1, 0), DoorConfig(0x16, 0x06, DoorType.Type1, 0), DoorConfig(0x17, 0x06, DoorType.Type1, 0), DoorConfig(0x18, 0x06, DoorType.Type1, 0), DoorConfig(0x19, 0x06, DoorType.Type1, 0), DoorConfig(0x1A, 0x06, DoorType.Type1, 0), DoorConfig(0x1B, 0x06, DoorType.Type1, 0), DoorConfig(0x1C, 0x06, DoorType.Type1, 0), DoorConfig(0x1D, 0x06, DoorType.Type1, 0), DoorConfig(0x1E, 0x06, DoorType.Type1, 0), DoorConfig(0x1F, 0x06, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x04, 0x1C, DoorType.Type2, null/+&DoorEntry966+/), DoorConfig(0x06, 0x1A, DoorType.Type2, null/+&DoorEntry966+/), DoorConfig(0x08, 0x18, DoorType.Type2, null/+&DoorEntry966+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0B, 0x0A, DoorType.Type2, null/+&DoorEntry377+/), DoorConfig(0x0B, 0x0B, DoorType.Type2, null/+&DoorEntry377+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x17, 0x1E, DoorType.Type2, null/+&DoorEntry558+/), DoorConfig(0x1C, 0x19, DoorType.Type2, null/+&DoorEntry558+/), DoorConfig(0x1D, 0x18, DoorType.Type2, null/+&DoorEntry558+/), DoorConfig(0x1E, 0x17, DoorType.Type2, null/+&DoorEntry558+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x0C, 0x19, DoorType.Type2, null/+&DoorEntry660+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry789+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry790+/)]),
	SectorDoors(4, [DoorConfig(0x15, 0x09, DoorType.Type2, null/+&DoorEntry760+/), DoorConfig(0x15, 0x0A, DoorType.Type2, null/+&DoorEntry760+/), DoorConfig(0x19, 0x19, DoorType.Type2, null/+&DoorEntry761+/), DoorConfig(0x19, 0x1A, DoorType.Type2, null/+&DoorEntry761+/)]),
	SectorDoors(3, [DoorConfig(0x19, 0x15, DoorType.Type2, null/+&DoorEntry762+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry762+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x15, DoorType.Type6, null/+&DoorEntry960+/), DoorConfig(0x0D, 0x16, DoorType.Type6, null/+&DoorEntry960+/)]),
	SectorDoors(2, [DoorConfig(0x1F, 0x11, DoorType.Type5, null/+&DoorEntry957+/), DoorConfig(0x1F, 0x13, DoorType.Type5, null/+&DoorEntry957+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x11, DoorType.Type5, null/+&DoorEntry958+/), DoorConfig(0x1B, 0x13, DoorType.Type5, null/+&DoorEntry958+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry431+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x06, 0x07, DoorType.Type1, 0), DoorConfig(0x07, 0x07, DoorType.Type1, 0), DoorConfig(0x08, 0x07, DoorType.Type1, 0), DoorConfig(0x09, 0x07, DoorType.Type1, 0), DoorConfig(0x0A, 0x07, DoorType.Type1, 0)]),
	SectorDoors(1, [DoorConfig(0x0A, 0x07, DoorType.Type2, null/+&DoorEntry424+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x15, DoorType.Type2, null/+&DoorEntry374+/)]),
	SectorDoors(2, [DoorConfig(0x04, 0x01, DoorType.Type2, null/+&DoorEntry373+/), DoorConfig(0x04, 0x02, DoorType.Type2, null/+&DoorEntry373+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x04, DoorType.Type2, null/+&DoorEntry559+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x0E, 0x0D, DoorType.Type5, null/+&DoorEntry674+/), DoorConfig(0x0E, 0x10, DoorType.Type2, null/+&DoorEntry560+/), DoorConfig(0x0F, 0x11, DoorType.Type2, null/+&DoorEntry560+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0C, 0x19, DoorType.Type2, null/+&DoorEntry666+/), DoorConfig(0x19, 0x0E, DoorType.Type2, null/+&DoorEntry799+/)]),
	SectorDoors(1, [DoorConfig(0x0E, 0x0E, DoorType.Type2, null/+&DoorEntry444+/)]),
	SectorDoors(1, [DoorConfig(0x12, 0x0B, DoorType.Type2, null/+&DoorEntry445+/)]),
	SectorDoors(3, [DoorConfig(0x10, 0x1F, DoorType.Type2, null/+&DoorEntry950+/), DoorConfig(0x11, 0x15, DoorType.Type6, null/+&DoorEntry961+/), DoorConfig(0x11, 0x16, DoorType.Type6, null/+&DoorEntry961+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.Type6, null/+&DoorEntry962+/), DoorConfig(0x09, 0x0E, DoorType.Type6, null/+&DoorEntry962+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x07, 0x01, DoorType.Type6, null/+&DoorEntry959+/), DoorConfig(0x07, 0x02, DoorType.Type6, null/+&DoorEntry959+/), DoorConfig(0x08, 0x0B, DoorType.Type2, null/+&DoorEntry951+/), DoorConfig(0x0C, 0x1B, DoorType.Type2, null/+&DoorEntry952+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry903+/), DoorConfig(0x19, 0x06, DoorType.Type2, null/+&DoorEntry903+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(1, [DoorConfig(0x0A, 0x18, DoorType.Type5, null/+&DoorEntry977+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.Type2, null/+&DoorEntry429+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x02, 0x08, DoorType.Type2, null/+&DoorEntry375+/)]),
	SectorDoors(2, [DoorConfig(0x00, 0x11, DoorType.Type2, null/+&DoorEntry376+/), DoorConfig(0x00, 0x12, DoorType.Type2, null/+&DoorEntry376+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, []),
	SectorDoors(3, [DoorConfig(0x02, 0x1F, DoorType.Type2, null/+&DoorEntry772+/), DoorConfig(0x15, 0x18, DoorType.Type0, null/+&DoorEntry779+/), DoorConfig(0x1C, 0x1A, DoorType.Type0, null/+&DoorEntry778+/)]),
	SectorDoors(5, [DoorConfig(0x02, 0x00, DoorType.Type2, null/+&DoorEntry772+/), DoorConfig(0x0C, 0x00, DoorType.Type6, null/+&DoorEntry774+/), DoorConfig(0x11, 0x00, DoorType.Type0, null/+&DoorEntry775+/), DoorConfig(0x15, 0x07, DoorType.Type0, null/+&DoorEntry776+/), DoorConfig(0x1C, 0x05, DoorType.Type0, null/+&DoorEntry777+/)]),
	SectorDoors(8, [DoorConfig(0x18, 0x16, DoorType.Type2, null/+&DoorEntry561+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry561+/), DoorConfig(0x1A, 0x16, DoorType.Type2, null/+&DoorEntry561+/), DoorConfig(0x1B, 0x16, DoorType.Type2, null/+&DoorEntry561+/), DoorConfig(0x1C, 0x16, DoorType.Type2, null/+&DoorEntry561+/), DoorConfig(0x1D, 0x16, DoorType.Type2, null/+&DoorEntry561+/), DoorConfig(0x1E, 0x16, DoorType.Type2, null/+&DoorEntry561+/), DoorConfig(0x1F, 0x16, DoorType.Type2, null/+&DoorEntry561+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x17, DoorType.Type2, null/+&DoorEntry110+/)]),
	SectorDoors(3, [DoorConfig(0x0C, 0x1D, DoorType.Type2, null/+&DoorEntry671+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry802+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry803+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry645+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry563+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.Type2, null/+&DoorEntry633+/)]),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry564+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry565+/), DoorConfig(0x17, 0x05, DoorType.Type2, null/+&DoorEntry566+/)]),
	SectorDoors(1, [DoorConfig(0x0A, 0x0E, DoorType.Type2, null/+&DoorEntry567+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x01, DoorType.Type2, null/+&DoorEntry568+/), DoorConfig(0x0D, 0x0E, DoorType.Type2, null/+&DoorEntry569+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x0D, DoorType.Type2, null/+&DoorEntry570+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry571+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry572+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry573+/)]),
	SectorDoors(1, [DoorConfig(0x0C, 0x05, DoorType.Type2, null/+&DoorEntry407+/)]),
	SectorDoors(2, [DoorConfig(0x07, 0x0E, DoorType.Type5, null/+&DoorEntry677+/), DoorConfig(0x09, 0x05, DoorType.Type2, null/+&DoorEntry970+/)]),
	SectorDoors(1, [DoorConfig(0x0C, 0x1E, DoorType.Type2, null/+&DoorEntry408+/)]),
	SectorDoors(2, [DoorConfig(0x19, 0x0A, DoorType.Type4, 0x0300), DoorConfig(0x1D, 0x0E, DoorType.Type4, 0)]),
	SectorDoors(2, [DoorConfig(0x0B, 0x1D, DoorType.Type2, null/+&DoorEntry967+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry448+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0A, DoorType.Type5, null/+&DoorEntry677+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry968+/), DoorConfig(0x19, 0x1B, DoorType.Type2, null/+&DoorEntry449+/)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x00, DoorType.Type2, null/+&DoorEntry413+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x0E, DoorType.Type4, 0x0300), DoorConfig(0x05, 0x12, DoorType.Type4, 0), DoorConfig(0x05, 0x1E, DoorType.Type2, null/+&DoorEntry414+/), DoorConfig(0x1D, 0x04, DoorType.Type2, null/+&DoorEntry415+/)]),
	SectorDoors(2, [DoorConfig(0x14, 0x1E, DoorType.Type2, null/+&DoorEntry452+/), DoorConfig(0x14, 0x1F, DoorType.Type2, null/+&DoorEntry452+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x14, 0x0E, DoorType.Type2, null/+&DoorEntry453+/), DoorConfig(0x14, 0x0F, DoorType.Type2, null/+&DoorEntry453+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(10, [DoorConfig(0x00, 0x0C, DoorType.Type2, null/+&DoorEntry476+/), DoorConfig(0x01, 0x0C, DoorType.Type1, 0), DoorConfig(0x02, 0x0C, DoorType.Type1, 0), DoorConfig(0x03, 0x0C, DoorType.Type1, 0), DoorConfig(0x04, 0x0C, DoorType.Type1, 0), DoorConfig(0x05, 0x0C, DoorType.Type1, 0), DoorConfig(0x06, 0x0C, DoorType.Type1, 0), DoorConfig(0x07, 0x0C, DoorType.Type1, 0), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry477+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry479+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x03, 0x01, DoorType.Type2, null/+&DoorEntry332+/), DoorConfig(0x03, 0x1E, DoorType.Type2, null/+&DoorEntry333+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry440+/)]),
	SectorDoors(4, [DoorConfig(0x06, 0x12, DoorType.Type2, null/+&DoorEntry933+/), DoorConfig(0x0A, 0x01, DoorType.Type2, null/+&DoorEntry934+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry806+/), DoorConfig(0x1D, 0x05, DoorType.Type0, 0x20ED)]),
	SectorDoors(2, [DoorConfig(0x11, 0x1E, DoorType.Type5, null/+&DoorEntry679+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry634+/)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x16, 0x1D, DoorType.Type2, null/+&DoorEntry635+/), DoorConfig(0x17, 0x1D, DoorType.Type2, null/+&DoorEntry635+/), DoorConfig(0x18, 0x1D, DoorType.Type2, null/+&DoorEntry635+/), DoorConfig(0x19, 0x1D, DoorType.Type2, null/+&DoorEntry635+/), DoorConfig(0x1A, 0x1D, DoorType.Type2, null/+&DoorEntry635+/), DoorConfig(0x1B, 0x1D, DoorType.Type2, null/+&DoorEntry635+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x10, DoorType.Type2, null/+&DoorEntry574+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry575+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry576+/), DoorConfig(0x17, 0x05, DoorType.Type2, null/+&DoorEntry577+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x01, 0x02, DoorType.Type2, null/+&DoorEntry578+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry579+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry580+/)]),
	SectorDoors(6, [DoorConfig(0x12, 0x05, DoorType.Type2, null/+&DoorEntry499+/), DoorConfig(0x13, 0x05, DoorType.Type1, 0), DoorConfig(0x14, 0x05, DoorType.Type1, 0), DoorConfig(0x15, 0x05, DoorType.Type1, 0), DoorConfig(0x16, 0x05, DoorType.Type1, 0), DoorConfig(0x17, 0x05, DoorType.Type1, 0)]),
	SectorDoors(9, [DoorConfig(0x07, 0x05, DoorType.Type2, null/+&DoorEntry533+/), DoorConfig(0x07, 0x09, DoorType.Type2, null/+&DoorEntry534+/), DoorConfig(0x09, 0x0E, DoorType.Type2, null/+&DoorEntry535+/), DoorConfig(0x12, 0x19, DoorType.Type2, null/+&DoorEntry500+/), DoorConfig(0x13, 0x19, DoorType.Type1, 0), DoorConfig(0x14, 0x19, DoorType.Type1, 0), DoorConfig(0x15, 0x19, DoorType.Type1, 0), DoorConfig(0x16, 0x19, DoorType.Type1, 0), DoorConfig(0x17, 0x19, DoorType.Type1, 0)]),
	SectorDoors(1, [DoorConfig(0x11, 0x00, DoorType.Type2, null/+&DoorEntry419+/)]),
	SectorDoors(0, []),
	SectorDoors(7, [DoorConfig(0x02, 0x0D, DoorType.Type2, null/+&DoorEntry501+/), DoorConfig(0x03, 0x0D, DoorType.Type1, 0), DoorConfig(0x04, 0x0D, DoorType.Type1, 0), DoorConfig(0x05, 0x0D, DoorType.Type1, 0), DoorConfig(0x06, 0x0D, DoorType.Type1, 0), DoorConfig(0x07, 0x0D, DoorType.Type1, 0), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry506+/)]),
	SectorDoors(8, [DoorConfig(0x10, 0x18, DoorType.Type2, null/+&DoorEntry505+/), DoorConfig(0x11, 0x18, DoorType.Type1, 0), DoorConfig(0x12, 0x18, DoorType.Type1, 0), DoorConfig(0x13, 0x18, DoorType.Type1, 0), DoorConfig(0x14, 0x18, DoorType.Type1, 0), DoorConfig(0x15, 0x18, DoorType.Type1, 0), DoorConfig(0x16, 0x18, DoorType.Type1, 0), DoorConfig(0x17, 0x18, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1C, 0x06, DoorType.Type2, null/+&DoorEntry454+/), DoorConfig(0x1C, 0x07, DoorType.Type2, null/+&DoorEntry454+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x17, DoorType.Type2, null/+&DoorEntry773+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.Type2, null/+&DoorEntry765+/)]),
	SectorDoors(3, [DoorConfig(0x19, 0x15, DoorType.Type2, null/+&DoorEntry766+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry766+/)]),
	SectorDoors(12, [DoorConfig(0x14, 0x16, DoorType.Type1, 0), DoorConfig(0x15, 0x16, DoorType.Type1, 0), DoorConfig(0x16, 0x16, DoorType.Type1, 0), DoorConfig(0x17, 0x16, DoorType.Type1, 0), DoorConfig(0x18, 0x16, DoorType.Type1, 0), DoorConfig(0x19, 0x16, DoorType.Type1, 0), DoorConfig(0x1A, 0x16, DoorType.Type1, 0), DoorConfig(0x1B, 0x16, DoorType.Type1, 0), DoorConfig(0x1C, 0x16, DoorType.Type1, 0), DoorConfig(0x1D, 0x16, DoorType.Type1, 0), DoorConfig(0x1E, 0x16, DoorType.Type1, 0), DoorConfig(0x1F, 0x16, DoorType.Type1, 0)]),
	SectorDoors(2, [DoorConfig(0x07, 0x1E, DoorType.Type5, null/+&DoorEntry462+/), DoorConfig(0x11, 0x06, DoorType.Type2, null/+&DoorEntry434+/)]),
	SectorDoors(1, [DoorConfig(0x06, 0x04, DoorType.Type2, null/+&DoorEntry435+/)]),
	SectorDoors(21, [DoorConfig(0x09, 0x1A, DoorType.Type2, null/+&DoorEntry436+/), DoorConfig(0x0C, 0x0E, DoorType.Type1, 0), DoorConfig(0x0D, 0x0E, DoorType.Type1, 0), DoorConfig(0x0E, 0x0E, DoorType.Type1, 0), DoorConfig(0x0F, 0x0E, DoorType.Type1, 0), DoorConfig(0x10, 0x0E, DoorType.Type1, 0), DoorConfig(0x11, 0x0E, DoorType.Type1, 0), DoorConfig(0x12, 0x0E, DoorType.Type1, 0), DoorConfig(0x13, 0x0E, DoorType.Type1, 0), DoorConfig(0x14, 0x0E, DoorType.Type1, 0), DoorConfig(0x15, 0x0E, DoorType.Type1, 0), DoorConfig(0x16, 0x0E, DoorType.Type1, 0), DoorConfig(0x17, 0x0E, DoorType.Type1, 0), DoorConfig(0x18, 0x0E, DoorType.Type1, 0), DoorConfig(0x19, 0x0E, DoorType.Type1, 0), DoorConfig(0x1A, 0x0E, DoorType.Type1, 0), DoorConfig(0x1B, 0x0E, DoorType.Type1, 0), DoorConfig(0x1C, 0x0E, DoorType.Type1, 0), DoorConfig(0x1D, 0x0E, DoorType.Type1, 0), DoorConfig(0x1E, 0x0E, DoorType.Type1, 0), DoorConfig(0x1F, 0x0E, DoorType.Type1, 0)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x01, DoorType.Type2, null/+&DoorEntry929+/), DoorConfig(0x19, 0x1B, DoorType.Type2, null/+&DoorEntry111+/)]),
	SectorDoors(5, [DoorConfig(0x05, 0x15, DoorType.Type4, 0x0200), DoorConfig(0x05, 0x1E, DoorType.Type2, null/+&DoorEntry334+/), DoorConfig(0x0D, 0x00, DoorType.Type2, null/+&DoorEntry335+/), DoorConfig(0x0D, 0x0D, DoorType.Type4, 0x0100), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry441+/)]),
	SectorDoors(5, [DoorConfig(0x0A, 0x01, DoorType.Type2, null/+&DoorEntry935+/), DoorConfig(0x0A, 0x0E, DoorType.Type2, null/+&DoorEntry936+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry807+/), DoorConfig(0x1A, 0x0E, DoorType.Type5, null/+&DoorEntry817+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry581+/), DoorConfig(0x11, 0x01, DoorType.Type2, null/+&DoorEntry582+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x19, DoorType.Type2, null/+&DoorEntry636+/), DoorConfig(0x07, 0x1A, DoorType.Type2, null/+&DoorEntry636+/), DoorConfig(0x0B, 0x0B, DoorType.Type2, null/+&DoorEntry637+/)]),
	SectorDoors(1, [DoorConfig(0x15, 0x1E, DoorType.Type2, null/+&DoorEntry638+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x0A, DoorType.Type2, null/+&DoorEntry583+/), DoorConfig(0x07, 0x10, DoorType.Type2, null/+&DoorEntry584+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry585+/), DoorConfig(0x17, 0x05, DoorType.Type2, null/+&DoorEntry586+/)]),
	SectorDoors(1, [DoorConfig(0x05, 0x09, DoorType.Type2, null/+&DoorEntry587+/)]),
	SectorDoors(1, [DoorConfig(0x05, 0x0A, DoorType.Type2, null/+&DoorEntry588+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry589+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry590+/)]),
	SectorDoors(6, [DoorConfig(0x07, 0x05, DoorType.Type2, null/+&DoorEntry521+/), DoorConfig(0x07, 0x0D, DoorType.Type2, null/+&DoorEntry522+/), DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry523+/), DoorConfig(0x15, 0x00, DoorType.Type2, null/+&DoorEntry420+/), DoorConfig(0x15, 0x0E, DoorType.Type4, 0x0300), DoorConfig(0x1D, 0x16, DoorType.Type4, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.Type2, null/+&DoorEntry493+/), DoorConfig(0x09, 0x16, DoorType.Type2, null/+&DoorEntry493+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x05, 0x1E, DoorType.Type2, null/+&DoorEntry416+/)]),
	SectorDoors(1, [DoorConfig(0x05, 0x1E, DoorType.Type2, null/+&DoorEntry417+/)]),
	SectorDoors(7, [DoorConfig(0x02, 0x15, DoorType.Type2, null/+&DoorEntry502+/), DoorConfig(0x03, 0x15, DoorType.Type1, 0), DoorConfig(0x04, 0x15, DoorType.Type1, 0), DoorConfig(0x05, 0x15, DoorType.Type1, 0), DoorConfig(0x06, 0x15, DoorType.Type1, 0), DoorConfig(0x07, 0x15, DoorType.Type1, 0), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry418+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0A, 0x10, DoorType.Type2, null/+&DoorEntry437+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x00, 0x16, DoorType.Type1, 0), DoorConfig(0x01, 0x16, DoorType.Type1, 0), DoorConfig(0x02, 0x16, DoorType.Type1, 0), DoorConfig(0x03, 0x16, DoorType.Type1, 0), DoorConfig(0x0D, 0x05, DoorType.Type2, null/+&DoorEntry438+/)]),
	SectorDoors(0, []),
	SectorDoors(12, [DoorConfig(0x0C, 0x1A, DoorType.Type1, 0), DoorConfig(0x0D, 0x1A, DoorType.Type1, 0), DoorConfig(0x0E, 0x1A, DoorType.Type1, 0), DoorConfig(0x0F, 0x1A, DoorType.Type1, 0), DoorConfig(0x10, 0x1A, DoorType.Type1, 0), DoorConfig(0x11, 0x1A, DoorType.Type1, 0), DoorConfig(0x12, 0x1A, DoorType.Type1, 0), DoorConfig(0x13, 0x1A, DoorType.Type1, 0), DoorConfig(0x14, 0x1A, DoorType.Type1, 0), DoorConfig(0x15, 0x1A, DoorType.Type1, 0), DoorConfig(0x16, 0x1A, DoorType.Type1, 0), DoorConfig(0x17, 0x1A, DoorType.Type1, 0)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x0A, DoorType.Type2, null/+&DoorEntry439+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x01, DoorType.Type2, null/+&DoorEntry930+/), DoorConfig(0x0A, 0x1A, DoorType.Type2, null/+&DoorEntry931+/), DoorConfig(0x19, 0x17, DoorType.Type2, null/+&DoorEntry112+/)]),
	SectorDoors(9, [DoorConfig(0x00, 0x1C, DoorType.Type2, null/+&DoorEntry336+/), DoorConfig(0x01, 0x1C, DoorType.Type1, 0), DoorConfig(0x02, 0x1C, DoorType.Type1, 0), DoorConfig(0x03, 0x1C, DoorType.Type1, 0), DoorConfig(0x04, 0x1C, DoorType.Type1, 0), DoorConfig(0x05, 0x15, DoorType.Type4, 0x0200), DoorConfig(0x0D, 0x00, DoorType.Type2, null/+&DoorEntry337+/), DoorConfig(0x0D, 0x0D, DoorType.Type4, 0x0100), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry442+/)]),
	SectorDoors(4, [DoorConfig(0x0A, 0x12, DoorType.Type2, null/+&DoorEntry937+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry810+/), DoorConfig(0x1A, 0x09, DoorType.Type2, null/+&DoorEntry811+/), DoorConfig(0x1A, 0x0A, DoorType.Type2, null/+&DoorEntry811+/)]),
	SectorDoors(2, [DoorConfig(0x1A, 0x1E, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x1D, 0x11, DoorType.Type2, null/+&DoorEntry639+/)]),
	SectorDoors(6, [DoorConfig(0x1A, 0x04, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x09, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x0A, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x15, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x16, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x1A, 0x1C, DoorType.Type6, null/+&DoorEntry681+/)]),
	SectorDoors(2, [DoorConfig(0x1A, 0x02, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x1D, 0x0E, DoorType.Type2, null/+&DoorEntry640+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x10, DoorType.Type2, null/+&DoorEntry591+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry592+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry593+/), DoorConfig(0x17, 0x05, DoorType.Type2, null/+&DoorEntry594+/)]),
	SectorDoors(4, [DoorConfig(0x1A, 0x09, DoorType.Type2, null/+&DoorEntry595+/), DoorConfig(0x1A, 0x11, DoorType.Type2, null/+&DoorEntry596+/), DoorConfig(0x1A, 0x19, DoorType.Type2, null/+&DoorEntry675+/), DoorConfig(0x1A, 0x1D, DoorType.Type2, null/+&DoorEntry675+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x0A, DoorType.Type2, null/+&DoorEntry597+/), DoorConfig(0x1A, 0x09, DoorType.Type2, null/+&DoorEntry598+/), DoorConfig(0x1A, 0x11, DoorType.Type2, null/+&DoorEntry599+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry600+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry601+/), DoorConfig(0x19, 0x0A, DoorType.Type2, null/+&DoorEntry602+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.Type2, null/+&DoorEntry524+/), DoorConfig(0x07, 0x0D, DoorType.Type2, null/+&DoorEntry525+/), DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry526+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry507+/), DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry508+/)]),
	SectorDoors(8, [DoorConfig(0x02, 0x15, DoorType.Type2, null/+&DoorEntry503+/), DoorConfig(0x03, 0x15, DoorType.Type1, 0), DoorConfig(0x04, 0x15, DoorType.Type1, 0), DoorConfig(0x05, 0x15, DoorType.Type1, 0), DoorConfig(0x06, 0x15, DoorType.Type1, 0), DoorConfig(0x07, 0x15, DoorType.Type1, 0), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry972+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry973+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.Type2, null/+&DoorEntry536+/), DoorConfig(0x07, 0x15, DoorType.Type2, null/+&DoorEntry537+/), DoorConfig(0x09, 0x1A, DoorType.Type2, null/+&DoorEntry538+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry425+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry426+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.Type2, null/+&DoorEntry494+/), DoorConfig(0x09, 0x16, DoorType.Type2, null/+&DoorEntry494+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x05, DoorType.Type2, null/+&DoorEntry545+/), DoorConfig(0x09, 0x16, DoorType.Type2, null/+&DoorEntry546+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry969+/)]),
	SectorDoors(1, [DoorConfig(0x13, 0x18, DoorType.Type2, null/+&DoorEntry943+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0B, 0x14, DoorType.Type2, null/+&DoorEntry944+/), DoorConfig(0x0B, 0x15, DoorType.Type2, null/+&DoorEntry944+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x05, 0x0B, DoorType.Type2, null/+&DoorEntry164+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x16, DoorType.Type2, null/+&DoorEntry791+/), DoorConfig(0x0A, 0x0D, DoorType.Type4, 0x0200)]),
	SectorDoors(1, [DoorConfig(0x0A, 0x0E, DoorType.Type2, null/+&DoorEntry932+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.Type2, null/+&DoorEntry123+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry443+/)]),
	SectorDoors(3, [DoorConfig(0x08, 0x0D, DoorType.Type2, null/+&DoorEntry399+/), DoorConfig(0x19, 0x12, DoorType.Type2, null/+&DoorEntry812+/)]),
	SectorDoors(9, [DoorConfig(0x02, 0x16, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x02, 0x1C, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x0E, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x14, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x1A, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x0A, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x10, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x16, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x1C, DoorType.Type6, null/+&DoorEntry681+/)]),
	SectorDoors(13, [DoorConfig(0x02, 0x02, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x02, 0x08, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x02, 0x18, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x02, 0x1E, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x00, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x06, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x0C, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x14, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x1A, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x02, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x08, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x18, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x1E, DoorType.Type6, null/+&DoorEntry681+/)]),
	SectorDoors(10, [DoorConfig(0x02, 0x04, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x02, 0x0A, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x00, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x06, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x0C, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0A, 0x12, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x04, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x0A, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x10, DoorType.Type6, null/+&DoorEntry681+/), DoorConfig(0x0E, 0x16, DoorType.Type6, null/+&DoorEntry681+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry603+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x09, DoorType.Type2, null/+&DoorEntry605+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x02, DoorType.Type2, null/+&DoorEntry604+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry606+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry607+/), DoorConfig(0x17, 0x11, DoorType.Type2, null/+&DoorEntry608+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry609+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry610+/)]),
	SectorDoors(3, [DoorConfig(0x09, 0x0E, DoorType.Type2, null/+&DoorEntry527+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry509+/), DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry510+/)]),
	SectorDoors(3, [DoorConfig(0x05, 0x00, DoorType.Type2, null/+&DoorEntry411+/), DoorConfig(0x05, 0x06, DoorType.Type4, 0x0300), DoorConfig(0x09, 0x0A, DoorType.Type4, 0)]),
	SectorDoors(3, [DoorConfig(0x09, 0x0E, DoorType.Type2, null/+&DoorEntry539+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry518+/), DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry517+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.Type2, null/+&DoorEntry495+/), DoorConfig(0x09, 0x16, DoorType.Type2, null/+&DoorEntry495+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.Type2, null/+&DoorEntry541+/), DoorConfig(0x07, 0x0D, DoorType.Type2, null/+&DoorEntry542+/), DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry543+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry427+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry428+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x0D, DoorType.Type2, null/+&DoorEntry496+/), DoorConfig(0x0D, 0x0E, DoorType.Type2, null/+&DoorEntry496+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x14, DoorType.Type2, null/+&DoorEntry947+/), DoorConfig(0x1B, 0x15, DoorType.Type2, null/+&DoorEntry947+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x19, DoorType.Type2, null/+&DoorEntry165+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x19, DoorType.Type2, null/+&DoorEntry166+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1B, DoorType.Type2, null/+&DoorEntry179+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1D, 0x05, DoorType.Type2, null/+&DoorEntry792+/), DoorConfig(0x1D, 0x0E, DoorType.Type4, 0x0100)]),
	SectorDoors(2, [DoorConfig(0x05, 0x12, DoorType.Type4, 0x0100), DoorConfig(0x06, 0x05, DoorType.Type4, 0x0200)]),
	SectorDoors(2, [DoorConfig(0x1A, 0x01, DoorType.Type2, null/+&DoorEntry915+/), DoorConfig(0x1A, 0x02, DoorType.Type2, null/+&DoorEntry915+/)]),
	SectorDoors(1, [DoorConfig(0x05, 0x05, DoorType.Type2, null/+&DoorEntry749+/)]),
	SectorDoors(10, [DoorConfig(0x0D, 0x08, DoorType.Type5, null/+&DoorEntry876+/), DoorConfig(0x11, 0x05, DoorType.Type2, null/+&DoorEntry832+/), DoorConfig(0x11, 0x06, DoorType.Type2, null/+&DoorEntry832+/), DoorConfig(0x16, 0x15, DoorType.Type2, null/+&DoorEntry833+/), DoorConfig(0x17, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x18, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x19, 0x0A, DoorType.Type5, null/+&DoorEntry877+/), DoorConfig(0x19, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1A, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1B, 0x15, DoorType.Type1, 0x8000)]),
	SectorDoors(1, [DoorConfig(0x15, 0x06, DoorType.Type5, null/+&DoorEntry878+/)]),
	SectorDoors(1, [DoorConfig(0x0C, 0x02, DoorType.Type2, null/+&DoorEntry611+/)]),
	SectorDoors(2, [DoorConfig(0x0B, 0x13, DoorType.Type3, 0x0300), DoorConfig(0x0E, 0x10, DoorType.Type3, 0x8000)]),
	SectorDoors(1, [DoorConfig(0x1E, 0x06, DoorType.Type3, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x07, 0x0D, DoorType.Type5, null/+&DoorEntry676+/), DoorConfig(0x07, 0x12, DoorType.Type2, null/+&DoorEntry612+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry613+/), DoorConfig(0x17, 0x11, DoorType.Type2, null/+&DoorEntry614+/), DoorConfig(0x17, 0x1D, DoorType.Type2, null/+&DoorEntry615+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0E, DoorType.Type5, null/+&DoorEntry677+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry616+/), DoorConfig(0x1D, 0x0E, DoorType.Type2, null/+&DoorEntry617+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry618+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry619+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry620+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.Type2, null/+&DoorEntry528+/), DoorConfig(0x07, 0x09, DoorType.Type2, null/+&DoorEntry529+/), DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry530+/), DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry511+/), DoorConfig(0x1B, 0x01, DoorType.Type2, null/+&DoorEntry512+/)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x00, DoorType.Type2, null/+&DoorEntry412+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry519+/)]),
	SectorDoors(3, [DoorConfig(0x05, 0x19, DoorType.Type2, null/+&DoorEntry497+/), DoorConfig(0x05, 0x1A, DoorType.Type2, null/+&DoorEntry497+/), DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry520+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x0E, DoorType.Type2, null/+&DoorEntry544+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0F, 0x13, DoorType.Type5, null/+&DoorEntry241+/), DoorConfig(0x0F, 0x15, DoorType.Type5, null/+&DoorEntry241+/)]),
	SectorDoors(2, [DoorConfig(0x0E, 0x0B, DoorType.Type2, null/+&DoorEntry167+/), DoorConfig(0x0E, 0x1C, DoorType.Type2, null/+&DoorEntry168+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x12, DoorType.Type2, null/+&DoorEntry169+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x10, 0x16, DoorType.Type2, null/+&DoorEntry170+/), DoorConfig(0x11, 0x01, DoorType.Type5, null/+&DoorEntry243+/), DoorConfig(0x11, 0x03, DoorType.Type5, null/+&DoorEntry243+/), DoorConfig(0x11, 0x04, DoorType.Type5, null/+&DoorEntry243+/), DoorConfig(0x11, 0x06, DoorType.Type5, null/+&DoorEntry243+/)]),
	SectorDoors(5, [DoorConfig(0x1A, 0x09, DoorType.Type5, null/+&DoorEntry244+/), DoorConfig(0x1A, 0x0B, DoorType.Type5, null/+&DoorEntry244+/), DoorConfig(0x1A, 0x0C, DoorType.Type5, null/+&DoorEntry244+/), DoorConfig(0x1A, 0x0E, DoorType.Type5, null/+&DoorEntry244+/), DoorConfig(0x1A, 0x13, DoorType.Type2, null/+&DoorEntry180+/)]),
	SectorDoors(2, [DoorConfig(0x1B, 0x01, DoorType.Type5, null/+&DoorEntry245+/), DoorConfig(0x1B, 0x02, DoorType.Type5, null/+&DoorEntry245+/)]),
	SectorDoors(0, []),
	SectorDoors(15, [DoorConfig(0x03, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x09, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x1D, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x09, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x1D, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x09, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x1D, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x09, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x1D, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x0E, DoorType.Type2, null/+&DoorEntry916+/), DoorConfig(0x1E, 0x02, DoorType.Type2, null/+&DoorEntry917+/), DoorConfig(0x1E, 0x0D, DoorType.Type2, null/+&DoorEntry918+/)]),
	SectorDoors(12, [DoorConfig(0x0E, 0x11, DoorType.Type2, null/+&DoorEntry919+/), DoorConfig(0x0F, 0x09, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x09, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x09, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x02, DoorType.Type2, null/+&DoorEntry920+/), DoorConfig(0x12, 0x09, DoorType.Type1, 0x8000), DoorConfig(0x17, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x18, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x19, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1A, 0x05, DoorType.Type2, null/+&DoorEntry921+/), DoorConfig(0x1A, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1F, 0x05, DoorType.Type1, 0x8000)]),
	SectorDoors(4, [DoorConfig(0x1B, 0x01, DoorType.Type1, 0x8000), DoorConfig(0x1C, 0x01, DoorType.Type1, 0x8000), DoorConfig(0x1D, 0x01, DoorType.Type1, 0x8000), DoorConfig(0x1E, 0x01, DoorType.Type1, 0x8000)]),
	SectorDoors(5, [DoorConfig(0x01, 0x1D, DoorType.Type2, null/+&DoorEntry834+/), DoorConfig(0x01, 0x1E, DoorType.Type2, null/+&DoorEntry834+/), DoorConfig(0x02, 0x12, DoorType.Type5, null/+&DoorEntry879+/), DoorConfig(0x15, 0x09, DoorType.Type5, null/+&DoorEntry880+/)]),
	SectorDoors(4, [DoorConfig(0x01, 0x11, DoorType.Type2, null/+&DoorEntry835+/), DoorConfig(0x01, 0x12, DoorType.Type2, null/+&DoorEntry835+/), DoorConfig(0x0D, 0x0E, DoorType.Type5, null/+&DoorEntry881+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1A, 0x11, DoorType.Type3, 0x8000), DoorConfig(0x1D, 0x14, DoorType.Type3, 0x0100)]),
	SectorDoors(3, [DoorConfig(0x01, 0x03, DoorType.Type3, 0), DoorConfig(0x07, 0x04, DoorType.Type3, 0x0200), DoorConfig(0x0A, 0x07, DoorType.Type3, 0x8000)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x1C, DoorType.Type2, null/+&DoorEntry621+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry622+/), DoorConfig(0x17, 0x12, DoorType.Type5, null/+&DoorEntry680+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry641+/)]),
	SectorDoors(4, [DoorConfig(0x0B, 0x05, DoorType.Type2, null/+&DoorEntry623+/), DoorConfig(0x0B, 0x0D, DoorType.Type5, null/+&DoorEntry678+/), DoorConfig(0x0B, 0x11, DoorType.Type2, null/+&DoorEntry624+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry625+/)]),
	SectorDoors(3, [DoorConfig(0x06, 0x0D, DoorType.Type2, null/+&DoorEntry626+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry627+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry628+/)]),
	SectorDoors(3, [DoorConfig(0x05, 0x0A, DoorType.Type2, null/+&DoorEntry531+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry514+/), DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry513+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry971+/)]),
	SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry540+/)]),
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
	SectorDoors(1, [DoorConfig(0x1F, 0x09, DoorType.Type2, null/+&DoorEntry172+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x06, 0x0A, DoorType.Type2, null/+&DoorEntry239+/), DoorConfig(0x0E, 0x02, DoorType.Type2, null/+&DoorEntry178+/)]),
	SectorDoors(0, []),
	SectorDoors(10, [DoorConfig(0x03, 0x1D, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x1D, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x1D, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x1D, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x12, DoorType.Type2, null/+&DoorEntry922+/), DoorConfig(0x0F, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x05, DoorType.Type2, null/+&DoorEntry923+/), DoorConfig(0x11, 0x19, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x19, DoorType.Type1, 0x8000)]),
	SectorDoors(6, [DoorConfig(0x02, 0x1D, DoorType.Type2, null/+&DoorEntry924+/), DoorConfig(0x03, 0x11, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x11, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x11, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x11, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x16, DoorType.Type2, null/+&DoorEntry925+/)]),
	SectorDoors(10, [DoorConfig(0x00, 0x05, DoorType.Type1, 0x8000), DoorConfig(0x01, 0x05, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x05, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x1D, DoorType.Type2, null/+&DoorEntry926+/), DoorConfig(0x06, 0x0E, DoorType.Type2, null/+&DoorEntry927+/), DoorConfig(0x0B, 0x11, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x11, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x11, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x11, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x0D, DoorType.Type2, null/+&DoorEntry928+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x09, DoorType.Type2, null/+&DoorEntry757+/), DoorConfig(0x19, 0x0A, DoorType.Type2, null/+&DoorEntry757+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x01, 0x04, DoorType.Type2, null/+&DoorEntry629+/)]),
	SectorDoors(2, [DoorConfig(0x03, 0x13, DoorType.Type3, 0x0300), DoorConfig(0x06, 0x10, DoorType.Type3, 0x8000)]),
	SectorDoors(2, [DoorConfig(0x16, 0x06, DoorType.Type3, 0x8000), DoorConfig(0x19, 0x03, DoorType.Type3, 0)]),
	SectorDoors(3, [DoorConfig(0x16, 0x17, DoorType.Type2, null/+&DoorEntry630+/), DoorConfig(0x17, 0x18, DoorType.Type2, null/+&DoorEntry630+/), DoorConfig(0x18, 0x19, DoorType.Type2, null/+&DoorEntry630+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry642+/), DoorConfig(0x1B, 0x0D, DoorType.Type2, null/+&DoorEntry643+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry644+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry631+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry632+/)]),
	SectorDoors(5, [DoorConfig(0x0A, 0x1A, DoorType.Type2, null/+&DoorEntry823+/), DoorConfig(0x1C, 0x00, DoorType.Type2, null/+&DoorEntry646+/), DoorConfig(0x1D, 0x00, DoorType.Type2, null/+&DoorEntry646+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry647+/), DoorConfig(0x1E, 0x00, DoorType.Type2, null/+&DoorEntry646+/)]),
	SectorDoors(3, [DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry532+/), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry516+/), DoorConfig(0x19, 0x1E, DoorType.Type2, null/+&DoorEntry515+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x09, 0x0A, DoorType.Type2, null/+&DoorEntry421+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry422+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x16, DoorType.Type2, null/+&DoorEntry547+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1A, 0x1A, DoorType.Type2, null/+&DoorEntry498+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x12, 0x09, DoorType.Type2, null/+&DoorEntry176+/), DoorConfig(0x16, 0x1F, DoorType.Type2, null/+&DoorEntry175+/)]),
	SectorDoors(1, [DoorConfig(0x15, 0x15, DoorType.Type2, null/+&DoorEntry174+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x18, 0x06, DoorType.Type2, null/+&DoorEntry181+/)]),
	SectorDoors(21, [DoorConfig(0x00, 0x14, DoorType.Type2, null/+&DoorEntry117+/), DoorConfig(0x01, 0x14, DoorType.Type1, 0), DoorConfig(0x02, 0x14, DoorType.Type1, 0), DoorConfig(0x03, 0x14, DoorType.Type1, 0), DoorConfig(0x04, 0x14, DoorType.Type1, 0), DoorConfig(0x05, 0x14, DoorType.Type1, 0), DoorConfig(0x06, 0x14, DoorType.Type1, 0), DoorConfig(0x07, 0x14, DoorType.Type1, 0), DoorConfig(0x08, 0x14, DoorType.Type1, 0), DoorConfig(0x09, 0x14, DoorType.Type1, 0), DoorConfig(0x0A, 0x14, DoorType.Type1, 0), DoorConfig(0x0B, 0x14, DoorType.Type1, 0), DoorConfig(0x0C, 0x14, DoorType.Type1, 0), DoorConfig(0x0D, 0x14, DoorType.Type1, 0), DoorConfig(0x0E, 0x14, DoorType.Type1, 0), DoorConfig(0x0F, 0x14, DoorType.Type1, 0), DoorConfig(0x10, 0x14, DoorType.Type1, 0), DoorConfig(0x11, 0x14, DoorType.Type1, 0), DoorConfig(0x12, 0x14, DoorType.Type1, 0), DoorConfig(0x13, 0x14, DoorType.Type1, 0), DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry118+/)]),
	SectorDoors(13, [DoorConfig(0x03, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x1F, 0x0F, DoorType.Type1, 0x8000)]),
	SectorDoors(2, [DoorConfig(0x10, 0x12, DoorType.Type2, null/+&DoorEntry884+/), DoorConfig(0x10, 0x13, DoorType.Type2, null/+&DoorEntry884+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x04, DoorType.Type3, 0x0200), DoorConfig(0x1E, 0x07, DoorType.Type3, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry450+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0B, 0x08, DoorType.Type2, null/+&DoorEntry780+/), DoorConfig(0x19, 0x1B, DoorType.Type2, null/+&DoorEntry451+/)]),
	SectorDoors(1, [DoorConfig(0x1F, 0x1B, DoorType.Type2, null/+&DoorEntry463+/)]),
	SectorDoors(14, [DoorConfig(0x12, 0x05, DoorType.Type1, 0), DoorConfig(0x13, 0x05, DoorType.Type1, 0), DoorConfig(0x14, 0x05, DoorType.Type1, 0), DoorConfig(0x14, 0x15, DoorType.Type2, null/+&DoorEntry467+/), DoorConfig(0x15, 0x05, DoorType.Type1, 0), DoorConfig(0x16, 0x05, DoorType.Type1, 0), DoorConfig(0x17, 0x05, DoorType.Type1, 0), DoorConfig(0x18, 0x05, DoorType.Type1, 0), DoorConfig(0x19, 0x05, DoorType.Type1, 0), DoorConfig(0x1A, 0x05, DoorType.Type1, 0), DoorConfig(0x1B, 0x05, DoorType.Type1, 0), DoorConfig(0x1C, 0x05, DoorType.Type1, 0), DoorConfig(0x1D, 0x05, DoorType.Type1, 0), DoorConfig(0x1F, 0x15, DoorType.Type1, 0)]),
	SectorDoors(1, [DoorConfig(0x10, 0x05, DoorType.Type2, null/+&DoorEntry472+/)]),
	SectorDoors(2, [DoorConfig(0x17, 0x10, DoorType.Type2, null/+&DoorEntry946+/), DoorConfig(0x17, 0x11, DoorType.Type2, null/+&DoorEntry946+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x0A, 0x05, DoorType.Type5, null/+&DoorEntry242+/), DoorConfig(0x0A, 0x07, DoorType.Type5, null/+&DoorEntry242+/), DoorConfig(0x0A, 0x08, DoorType.Type5, null/+&DoorEntry242+/), DoorConfig(0x0A, 0x0A, DoorType.Type5, null/+&DoorEntry242+/), DoorConfig(0x0E, 0x17, DoorType.Type2, null/+&DoorEntry171+/), DoorConfig(0x16, 0x0F, DoorType.Type2, null/+&DoorEntry173+/)]),
	SectorDoors(3, [DoorConfig(0x0F, 0x12, DoorType.Type5, null/+&DoorEntry246+/), DoorConfig(0x0F, 0x14, DoorType.Type5, null/+&DoorEntry246+/), DoorConfig(0x16, 0x1D, DoorType.Type2, null/+&DoorEntry177+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry758+/)]),
	SectorDoors(16, [DoorConfig(0x00, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x01, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x0F, DoorType.Type1, 0x8000), DoorConfig(0x16, 0x1E, DoorType.Type2, null/+&DoorEntry759+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x0E, 0x11, DoorType.Type3, 0x8000), DoorConfig(0x11, 0x14, DoorType.Type3, 0x0100), DoorConfig(0x17, 0x13, DoorType.Type3, 0x0300), DoorConfig(0x1A, 0x10, DoorType.Type3, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x07, 0x19, DoorType.Type2, null/+&DoorEntry187+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry188+/), DoorConfig(0x17, 0x11, DoorType.Type2, null/+&DoorEntry230+/), DoorConfig(0x17, 0x12, DoorType.Type2, null/+&DoorEntry230+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry231+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry232+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.Type2, null/+&DoorEntry189+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry193+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry191+/)]),
	SectorDoors(10, [DoorConfig(0x02, 0x1B, DoorType.Type1, 0), DoorConfig(0x03, 0x1B, DoorType.Type1, 0), DoorConfig(0x04, 0x1B, DoorType.Type1, 0), DoorConfig(0x05, 0x1B, DoorType.Type1, 0), DoorConfig(0x06, 0x18, DoorType.Type2, null/+&DoorEntry465+/), DoorConfig(0x06, 0x1B, DoorType.Type1, 0), DoorConfig(0x0F, 0x15, DoorType.Type2, null/+&DoorEntry466+/), DoorConfig(0x10, 0x15, DoorType.Type1, 0), DoorConfig(0x11, 0x15, DoorType.Type1, 0), DoorConfig(0x12, 0x15, DoorType.Type1, 0)]),
	SectorDoors(7, [DoorConfig(0x00, 0x15, DoorType.Type1, 0), DoorConfig(0x01, 0x15, DoorType.Type1, 0), DoorConfig(0x09, 0x0D, DoorType.Type2, null/+&DoorEntry464+/), DoorConfig(0x0B, 0x05, DoorType.Type2, null/+&DoorEntry471+/), DoorConfig(0x0F, 0x1D, DoorType.Type1, 0), DoorConfig(0x10, 0x1D, DoorType.Type1, 0), DoorConfig(0x11, 0x1D, DoorType.Type1, 0)]),
	SectorDoors(6, [DoorConfig(0x00, 0x01, DoorType.Type1, 0), DoorConfig(0x01, 0x01, DoorType.Type1, 0), DoorConfig(0x02, 0x01, DoorType.Type1, 0), DoorConfig(0x03, 0x01, DoorType.Type1, 0), DoorConfig(0x04, 0x01, DoorType.Type1, 0), DoorConfig(0x05, 0x01, DoorType.Type1, 0)]),
	SectorDoors(2, [DoorConfig(0x17, 0x0C, DoorType.Type2, null/+&DoorEntry945+/), DoorConfig(0x17, 0x0D, DoorType.Type2, null/+&DoorEntry945+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x02, 0x0D, DoorType.Type2, null/+&DoorEntry240+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x14, 0x18, DoorType.Type2, null/+&DoorEntry249+/)]),
	SectorDoors(2, [DoorConfig(0x17, 0x0D, DoorType.Type5, null/+&DoorEntry274+/), DoorConfig(0x17, 0x0E, DoorType.Type5, null/+&DoorEntry274+/)]),
	SectorDoors(1, [DoorConfig(0x17, 0x17, DoorType.Type2, null/+&DoorEntry250+/)]),
	SectorDoors(1, [DoorConfig(0x17, 0x02, DoorType.Type2, null/+&DoorEntry251+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry781+/)]),
	SectorDoors(1, [DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry192+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x06, DoorType.Type3, 0x8000), DoorConfig(0x0D, 0x03, DoorType.Type3, 0), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry190+/)]),
	SectorDoors(4, [DoorConfig(0x0A, 0x0B, DoorType.Type2, null/+&DoorEntry194+/), DoorConfig(0x0B, 0x0C, DoorType.Type2, null/+&DoorEntry194+/), DoorConfig(0x0C, 0x0D, DoorType.Type2, null/+&DoorEntry194+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry195+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry197+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry233+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.Type2, null/+&DoorEntry196+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry198+/)]),
	SectorDoors(1, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry234+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x1B, DoorType.Type2, null/+&DoorEntry468+/)]),
	SectorDoors(1, [DoorConfig(0x03, 0x17, DoorType.Type2, null/+&DoorEntry469+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x00, 0x1E, DoorType.Type2, null/+&DoorEntry343+/), DoorConfig(0x01, 0x1E, DoorType.Type2, null/+&DoorEntry343+/), DoorConfig(0x02, 0x1E, DoorType.Type2, null/+&DoorEntry343+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x00, 0x09, DoorType.Type2, null/+&DoorEntry344+/), DoorConfig(0x01, 0x09, DoorType.Type2, null/+&DoorEntry344+/), DoorConfig(0x02, 0x09, DoorType.Type2, null/+&DoorEntry344+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x02, 0x17, DoorType.Type2, null/+&DoorEntry252+/), DoorConfig(0x1B, 0x1F, DoorType.Type2, null/+&DoorEntry253+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x04, 0x0E, DoorType.Type2, null/+&DoorEntry254+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry199+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry782+/)]),
	SectorDoors(3, [DoorConfig(0x0A, 0x04, DoorType.Type2, null/+&DoorEntry201+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry200+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry202+/)]),
	SectorDoors(4, [DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry750+/), DoorConfig(0x1B, 0x09, DoorType.Type2, null/+&DoorEntry203+/), DoorConfig(0x1B, 0x11, DoorType.Type2, null/+&DoorEntry204+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry205+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry206+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry207+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x1B, DoorType.Type2, null/+&DoorEntry953+/), DoorConfig(0x19, 0x12, DoorType.Type2, null/+&DoorEntry751+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry208+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry209+/)]),
	SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry210+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry211+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry954+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x19, DoorType.Type2, null/+&DoorEntry470+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x12, 0x1D, DoorType.Type2, null/+&DoorEntry103+/), DoorConfig(0x12, 0x1E, DoorType.Type2, null/+&DoorEntry103+/), DoorConfig(0x1C, 0x11, DoorType.Type2, null/+&DoorEntry104+/)]),
	SectorDoors(2, [DoorConfig(0x0E, 0x19, DoorType.Type2, null/+&DoorEntry105+/), DoorConfig(0x0E, 0x1A, DoorType.Type2, null/+&DoorEntry105+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x14, 0x02, DoorType.Type2, null/+&DoorEntry283+/), DoorConfig(0x14, 0x03, DoorType.Type2, null/+&DoorEntry283+/)]),
	SectorDoors(1, [DoorConfig(0x03, 0x19, DoorType.Type2, null/+&DoorEntry255+/)]),
	SectorDoors(3, [DoorConfig(0x17, 0x0A, DoorType.Type2, null/+&DoorEntry256+/), DoorConfig(0x1D, 0x15, DoorType.Type5, null/+&DoorEntry275+/), DoorConfig(0x1D, 0x16, DoorType.Type5, null/+&DoorEntry275+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x02, DoorType.Type2, null/+&DoorEntry257+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(7, [DoorConfig(0x03, 0x09, DoorType.Type1, 0), DoorConfig(0x04, 0x09, DoorType.Type1, 0), DoorConfig(0x05, 0x09, DoorType.Type1, 0), DoorConfig(0x06, 0x09, DoorType.Type1, 0), DoorConfig(0x07, 0x09, DoorType.Type1, 0), DoorConfig(0x09, 0x0D, DoorType.Type2, null/+&DoorEntry473+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry783+/)]),
	SectorDoors(4, [DoorConfig(0x07, 0x11, DoorType.Type2, null/+&DoorEntry212+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry213+/), DoorConfig(0x1A, 0x04, DoorType.Type2, null/+&DoorEntry214+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry215+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry752+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry216+/)]),
	SectorDoors(3, [DoorConfig(0x09, 0x0D, DoorType.Type2, null/+&DoorEntry474+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry217+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry218+/)]),
	SectorDoors(2, [DoorConfig(0x0A, 0x1B, DoorType.Type2, null/+&DoorEntry955+/), DoorConfig(0x19, 0x16, DoorType.Type2, null/+&DoorEntry753+/)]),
	SectorDoors(7, [DoorConfig(0x03, 0x09, DoorType.Type1, 0), DoorConfig(0x04, 0x09, DoorType.Type1, 0), DoorConfig(0x05, 0x09, DoorType.Type1, 0), DoorConfig(0x06, 0x09, DoorType.Type1, 0), DoorConfig(0x07, 0x09, DoorType.Type1, 0), DoorConfig(0x09, 0x0D, DoorType.Type2, null/+&DoorEntry475+/), DoorConfig(0x1D, 0x16, DoorType.Type2, null/+&DoorEntry219+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry220+/), DoorConfig(0x1A, 0x17, DoorType.Type2, null/+&DoorEntry956+/)]),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x12, 0x11, DoorType.Type2, null/+&DoorEntry504+/), DoorConfig(0x13, 0x11, DoorType.Type1, 0), DoorConfig(0x14, 0x11, DoorType.Type1, 0), DoorConfig(0x15, 0x11, DoorType.Type1, 0), DoorConfig(0x16, 0x11, DoorType.Type1, 0), DoorConfig(0x17, 0x11, DoorType.Type1, 0)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x19, 0x08, DoorType.Type5, null/+&DoorEntry882+/), DoorConfig(0x1D, 0x05, DoorType.Type2, null/+&DoorEntry836+/), DoorConfig(0x1D, 0x06, DoorType.Type2, null/+&DoorEntry836+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(14, [DoorConfig(0x0A, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x0F, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x1D, DoorType.Type2, null/+&DoorEntry106+/), DoorConfig(0x12, 0x1E, DoorType.Type2, null/+&DoorEntry106+/), DoorConfig(0x13, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x14, 0x16, DoorType.Type1, 0x8000), DoorConfig(0x15, 0x16, DoorType.Type1, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(10, [DoorConfig(0x00, 0x1C, DoorType.Type2, null/+&DoorEntry326+/), DoorConfig(0x01, 0x1C, DoorType.Type1, 0), DoorConfig(0x02, 0x1C, DoorType.Type1, 0), DoorConfig(0x03, 0x1C, DoorType.Type1, 0), DoorConfig(0x04, 0x1C, DoorType.Type1, 0), DoorConfig(0x05, 0x15, DoorType.Type4, 0x0200), DoorConfig(0x0D, 0x0D, DoorType.Type4, 0x0100), DoorConfig(0x11, 0x0A, DoorType.Type4, 0x0300), DoorConfig(0x1D, 0x16, DoorType.Type4, 0), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry327+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x11, 0x10, DoorType.Type2, null/+&DoorEntry284+/), DoorConfig(0x12, 0x10, DoorType.Type2, null/+&DoorEntry284+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x0A, DoorType.Type2, null/+&DoorEntry754+/)]),
	SectorDoors(1, [DoorConfig(0x0B, 0x15, DoorType.Type2, null/+&DoorEntry221+/)]),
	SectorDoors(2, [DoorConfig(0x0F, 0x09, DoorType.Type2, null/+&DoorEntry222+/), DoorConfig(0x15, 0x1A, DoorType.Type2, null/+&DoorEntry223+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.Type2, null/+&DoorEntry755+/)]),
	SectorDoors(1, [DoorConfig(0x11, 0x1A, DoorType.Type2, null/+&DoorEntry756+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x1B, 0x12, DoorType.Type5, null/+&DoorEntry247+/), DoorConfig(0x1B, 0x14, DoorType.Type5, null/+&DoorEntry247+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x09, 0x0C, DoorType.Type5, null/+&DoorEntry883+/), DoorConfig(0x09, 0x19, DoorType.Type2, null/+&DoorEntry837+/), DoorConfig(0x09, 0x1A, DoorType.Type2, null/+&DoorEntry837+/), DoorConfig(0x0D, 0x09, DoorType.Type2, null/+&DoorEntry838+/), DoorConfig(0x0D, 0x0A, DoorType.Type2, null/+&DoorEntry838+/)]),
	SectorDoors(13, [DoorConfig(0x02, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x12, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x05, DoorType.Type2, null/+&DoorEntry107+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x06, 0x09, DoorType.Type2, null/+&DoorEntry108+/), DoorConfig(0x06, 0x0A, DoorType.Type2, null/+&DoorEntry108+/)]),
	SectorDoors(1, [DoorConfig(0x14, 0x1A, DoorType.Type2, null/+&DoorEntry109+/)]),
	SectorDoors(1, [DoorConfig(0x14, 0x05, DoorType.Type2, null/+&DoorEntry405+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x18, 0x1E, DoorType.Type2, null/+&DoorEntry406+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x05, DoorType.Type2, null/+&DoorEntry804+/), DoorConfig(0x0A, 0x12, DoorType.Type4, 0x0300)]),
	SectorDoors(2, [DoorConfig(0x1D, 0x05, DoorType.Type4, 0), DoorConfig(0x1E, 0x0E, DoorType.Type4, 0x0300)]),
	SectorDoors(2, [DoorConfig(0x15, 0x0D, DoorType.Type2, null/+&DoorEntry763+/), DoorConfig(0x15, 0x0E, DoorType.Type2, null/+&DoorEntry763+/)]),
	SectorDoors(3, [DoorConfig(0x16, 0x1E, DoorType.Type2, null/+&DoorEntry764+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0E, 0x10, DoorType.Type2, null/+&DoorEntry285+/), DoorConfig(0x0F, 0x10, DoorType.Type2, null/+&DoorEntry285+/)]),
	SectorDoors(6, [DoorConfig(0x07, 0x19, DoorType.Type2, null/+&DoorEntry286+/), DoorConfig(0x09, 0x1D, DoorType.Type5, null/+&DoorEntry364+/), DoorConfig(0x09, 0x1E, DoorType.Type5, null/+&DoorEntry364+/), DoorConfig(0x1F, 0x15, DoorType.Type5, null/+&DoorEntry363+/), DoorConfig(0x1F, 0x16, DoorType.Type5, null/+&DoorEntry363+/), DoorConfig(0x1F, 0x18, DoorType.Type5, null/+&DoorEntry363+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x09, DoorType.Type2, null/+&DoorEntry235+/)]),
	SectorDoors(1, [DoorConfig(0x15, 0x1A, DoorType.Type2, null/+&DoorEntry236+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0D, 0x0A, DoorType.Type2, null/+&DoorEntry224+/)]),
	SectorDoors(6, [DoorConfig(0x18, 0x06, DoorType.Type2, null/+&DoorEntry550+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry550+/), DoorConfig(0x1A, 0x04, DoorType.Type2, null/+&DoorEntry550+/), DoorConfig(0x1B, 0x03, DoorType.Type2, null/+&DoorEntry550+/), DoorConfig(0x1C, 0x02, DoorType.Type2, null/+&DoorEntry550+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry550+/)]),
	SectorDoors(7, [DoorConfig(0x0D, 0x0A, DoorType.Type2, null/+&DoorEntry784+/), DoorConfig(0x18, 0x19, DoorType.Type2, null/+&DoorEntry551+/), DoorConfig(0x19, 0x1A, DoorType.Type2, null/+&DoorEntry551+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry551+/), DoorConfig(0x1B, 0x1C, DoorType.Type2, null/+&DoorEntry551+/), DoorConfig(0x1C, 0x1D, DoorType.Type2, null/+&DoorEntry551+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry551+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(3, [DoorConfig(0x00, 0x01, DoorType.Type2, null/+&DoorEntry182+/), DoorConfig(0x01, 0x01, DoorType.Type2, null/+&DoorEntry182+/), DoorConfig(0x02, 0x01, DoorType.Type2, null/+&DoorEntry182+/)]),
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
	SectorDoors(2, [DoorConfig(0x1D, 0x0D, DoorType.Type4, 0), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry805+/)]),
	SectorDoors(28, [DoorConfig(0x04, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0F, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x10, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x11, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x12, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x13, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x14, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x15, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x16, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x17, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x18, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x19, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1A, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1B, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1C, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1D, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1E, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x1F, 0x15, DoorType.Type1, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.Type2, null/+&DoorEntry349+/)]),
	SectorDoors(1, [DoorConfig(0x14, 0x15, DoorType.Type2, null/+&DoorEntry350+/)]),
	SectorDoors(1, [DoorConfig(0x08, 0x05, DoorType.Type2, null/+&DoorEntry351+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x12, 0x11, DoorType.Type5, null/+&DoorEntry730+/), DoorConfig(0x12, 0x1D, DoorType.Type5, null/+&DoorEntry731+/), DoorConfig(0x15, 0x05, DoorType.Type2, null/+&DoorEntry703+/), DoorConfig(0x19, 0x0F, DoorType.Type5, null/+&DoorEntry732+/), DoorConfig(0x19, 0x1B, DoorType.Type5, null/+&DoorEntry733+/)]),
	SectorDoors(6, [DoorConfig(0x12, 0x09, DoorType.Type5, null/+&DoorEntry734+/), DoorConfig(0x16, 0x1B, DoorType.Type2, null/+&DoorEntry704+/), DoorConfig(0x17, 0x1B, DoorType.Type2, null/+&DoorEntry704+/), DoorConfig(0x18, 0x1B, DoorType.Type2, null/+&DoorEntry704+/), DoorConfig(0x19, 0x07, DoorType.Type5, null/+&DoorEntry735+/), DoorConfig(0x19, 0x1B, DoorType.Type2, null/+&DoorEntry704+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x18, DoorType.Type2, null/+&DoorEntry705+/), DoorConfig(0x09, 0x09, DoorType.Type2, null/+&DoorEntry706+/), DoorConfig(0x1C, 0x02, DoorType.Type2, null/+&DoorEntry707+/)]),
	SectorDoors(2, [DoorConfig(0x07, 0x08, DoorType.Type2, null/+&DoorEntry708+/), DoorConfig(0x1C, 0x1D, DoorType.Type2, null/+&DoorEntry709+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x0E, DoorType.Type5, null/+&DoorEntry248+/), DoorConfig(0x07, 0x11, DoorType.Type2, null/+&DoorEntry225+/), DoorConfig(0x07, 0x1E, DoorType.Type5, null/+&DoorEntry677+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry226+/), DoorConfig(0x19, 0x0A, DoorType.Type2, null/+&DoorEntry227+/)]),
	SectorDoors(3, [DoorConfig(0x0C, 0x0E, DoorType.Type2, null/+&DoorEntry228+/), DoorConfig(0x0D, 0x0E, DoorType.Type2, null/+&DoorEntry228+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry229+/)]),
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
	SectorDoors(16, [DoorConfig(0x00, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x01, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x02, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x03, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x04, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x05, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x06, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x07, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x08, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x09, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0A, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0B, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0C, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0D, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0E, 0x15, DoorType.Type1, 0x8000), DoorConfig(0x0F, 0x15, DoorType.Type1, 0x8000)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0F, 0x1E, DoorType.Type5, null/+&DoorEntry356+/), DoorConfig(0x1B, 0x0D, DoorType.Type2, null/+&DoorEntry352+/)]),
	SectorDoors(1, [DoorConfig(0x0F, 0x00, DoorType.Type5, null/+&DoorEntry356+/)]),
	SectorDoors(3, [DoorConfig(0x01, 0x13, DoorType.Type2, null/+&DoorEntry287+/), DoorConfig(0x15, 0x1B, DoorType.Type2, null/+&DoorEntry288+/), DoorConfig(0x15, 0x1C, DoorType.Type2, null/+&DoorEntry288+/)]),
	SectorDoors(1, [DoorConfig(0x19, 0x13, DoorType.Type2, null/+&DoorEntry353+/)]),
	SectorDoors(6, [DoorConfig(0x03, 0x01, DoorType.Type5, null/+&DoorEntry360+/), DoorConfig(0x03, 0x02, DoorType.Type5, null/+&DoorEntry360+/), DoorConfig(0x0F, 0x0D, DoorType.Type5, null/+&DoorEntry361+/), DoorConfig(0x0F, 0x0E, DoorType.Type5, null/+&DoorEntry361+/), DoorConfig(0x0F, 0x10, DoorType.Type5, null/+&DoorEntry361+/), DoorConfig(0x17, 0x09, DoorType.Type2, null/+&DoorEntry289+/)]),
	SectorDoors(1, [DoorConfig(0x01, 0x0D, DoorType.Type2, null/+&DoorEntry354+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry694+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry710+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x16, 0x0B, DoorType.Type2, null/+&DoorEntry711+/), DoorConfig(0x18, 0x0D, DoorType.Type2, null/+&DoorEntry711+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry695+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry712+/)]),
	SectorDoors(2, [DoorConfig(0x10, 0x15, DoorType.Type2, null/+&DoorEntry713+/), DoorConfig(0x18, 0x1D, DoorType.Type2, null/+&DoorEntry714+/)]),
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
	SectorDoors(5, [DoorConfig(0x18, 0x0F, DoorType.Type2, null/+&DoorEntry290+/), DoorConfig(0x19, 0x0F, DoorType.Type2, null/+&DoorEntry290+/), DoorConfig(0x1A, 0x0F, DoorType.Type2, null/+&DoorEntry290+/), DoorConfig(0x1B, 0x0F, DoorType.Type2, null/+&DoorEntry290+/), DoorConfig(0x1C, 0x0F, DoorType.Type2, null/+&DoorEntry290+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x05, DoorType.Type2, null/+&DoorEntry291+/)]),
	SectorDoors(6, [DoorConfig(0x03, 0x14, DoorType.Type5, null/+&DoorEntry357+/), DoorConfig(0x03, 0x16, DoorType.Type5, null/+&DoorEntry357+/), DoorConfig(0x0D, 0x0D, DoorType.Type2, null/+&DoorEntry292+/), DoorConfig(0x0D, 0x0E, DoorType.Type2, null/+&DoorEntry292+/), DoorConfig(0x0D, 0x1C, DoorType.Type2, null/+&DoorEntry293+/), DoorConfig(0x0D, 0x1D, DoorType.Type2, null/+&DoorEntry293+/)]),
	SectorDoors(1, [DoorConfig(0x0C, 0x1F, DoorType.Type2, null/+&DoorEntry294+/)]),
	SectorDoors(4, [DoorConfig(0x06, 0x1F, DoorType.Type2, null/+&DoorEntry355+/), DoorConfig(0x0C, 0x01, DoorType.Type2, null/+&DoorEntry294+/), DoorConfig(0x0D, 0x11, DoorType.Type2, null/+&DoorEntry295+/), DoorConfig(0x0D, 0x12, DoorType.Type2, null/+&DoorEntry295+/)]),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x10, 0x02, DoorType.Type2, null/+&DoorEntry296+/), DoorConfig(0x16, 0x19, DoorType.Type2, null/+&DoorEntry297+/)]),
	SectorDoors(5, [DoorConfig(0x18, 0x10, DoorType.Type2, null/+&DoorEntry298+/), DoorConfig(0x19, 0x10, DoorType.Type2, null/+&DoorEntry298+/), DoorConfig(0x1A, 0x10, DoorType.Type2, null/+&DoorEntry298+/), DoorConfig(0x1B, 0x10, DoorType.Type2, null/+&DoorEntry298+/), DoorConfig(0x1C, 0x10, DoorType.Type2, null/+&DoorEntry298+/)]),
	SectorDoors(5, [DoorConfig(0x07, 0x11, DoorType.Type2, null/+&DoorEntry299+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry300+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry301+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry715+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry716+/)]),
	SectorDoors(3, [DoorConfig(0x08, 0x12, DoorType.Type5, null/+&DoorEntry347+/), DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry302+/), DoorConfig(0x1D, 0x16, DoorType.Type2, null/+&DoorEntry303+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x0A, DoorType.Type2, null/+&DoorEntry304+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry717+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry305+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry306+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0D, DoorType.Type2, null/+&DoorEntry307+/), DoorConfig(0x07, 0x15, DoorType.Type2, null/+&DoorEntry308+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry718+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.Type2, null/+&DoorEntry309+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry310+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry487+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x13, 0x13, DoorType.Type2, null/+&DoorEntry482+/)]),
	SectorDoors(2, [DoorConfig(0x14, 0x0A, DoorType.Type2, null/+&DoorEntry485+/), DoorConfig(0x15, 0x09, DoorType.Type2, null/+&DoorEntry486+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x19, 0x01, DoorType.Type2, null/+&DoorEntry800+/), DoorConfig(0x1A, 0x0E, DoorType.Type4, 0x0300)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x07, 0x11, DoorType.Type5, null/+&DoorEntry358+/), DoorConfig(0x07, 0x12, DoorType.Type5, null/+&DoorEntry358+/)]),
	SectorDoors(4, [DoorConfig(0x03, 0x11, DoorType.Type5, null/+&DoorEntry359+/), DoorConfig(0x03, 0x13, DoorType.Type5, null/+&DoorEntry359+/), DoorConfig(0x03, 0x14, DoorType.Type5, null/+&DoorEntry359+/), DoorConfig(0x03, 0x16, DoorType.Type5, null/+&DoorEntry359+/)]),
	SectorDoors(0, []),
	SectorDoors(4, [DoorConfig(0x07, 0x0D, DoorType.Type5, null/+&DoorEntry362+/), DoorConfig(0x07, 0x0F, DoorType.Type5, null/+&DoorEntry362+/), DoorConfig(0x07, 0x10, DoorType.Type5, null/+&DoorEntry362+/), DoorConfig(0x07, 0x12, DoorType.Type5, null/+&DoorEntry362+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x12, DoorType.Type2, null/+&DoorEntry909+/)]),
	SectorDoors(8, [DoorConfig(0x10, 0x1C, DoorType.Type2, null/+&DoorEntry338+/), DoorConfig(0x11, 0x1C, DoorType.Type1, 0), DoorConfig(0x12, 0x1C, DoorType.Type1, 0), DoorConfig(0x13, 0x1C, DoorType.Type1, 0), DoorConfig(0x14, 0x1C, DoorType.Type1, 0), DoorConfig(0x15, 0x11, DoorType.Type4, 0x0200), DoorConfig(0x1D, 0x00, DoorType.Type2, null/+&DoorEntry339+/), DoorConfig(0x1D, 0x09, DoorType.Type4, 0x0100)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry719+/), DoorConfig(0x17, 0x0A, DoorType.Type5, null/+&DoorEntry677+/), DoorConfig(0x17, 0x12, DoorType.Type2, null/+&DoorEntry696+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry698+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry697+/)]),
	SectorDoors(5, [DoorConfig(0x0C, 0x00, DoorType.Type2, null/+&DoorEntry720+/), DoorConfig(0x0D, 0x00, DoorType.Type2, null/+&DoorEntry720+/), DoorConfig(0x0D, 0x1E, DoorType.Type2, null/+&DoorEntry721+/), DoorConfig(0x0E, 0x00, DoorType.Type2, null/+&DoorEntry720+/), DoorConfig(0x1D, 0x16, DoorType.Type2, null/+&DoorEntry311+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry722+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry699+/)]),
	SectorDoors(3, [DoorConfig(0x07, 0x0D, DoorType.Type2, null/+&DoorEntry723+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry724+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry312+/)]),
	SectorDoors(5, [DoorConfig(0x09, 0x12, DoorType.Type2, null/+&DoorEntry725+/), DoorConfig(0x1B, 0x09, DoorType.Type2, null/+&DoorEntry700+/), DoorConfig(0x1B, 0x0E, DoorType.Type5, null/+&DoorEntry737+/), DoorConfig(0x1B, 0x11, DoorType.Type2, null/+&DoorEntry701+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry702+/)]),
	SectorDoors(3, [DoorConfig(0x0B, 0x0D, DoorType.Type5, null/+&DoorEntry736+/), DoorConfig(0x0D, 0x01, DoorType.Type2, null/+&DoorEntry726+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry313+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1B, 0x0F, DoorType.Type2, null/+&DoorEntry480+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x1E, 0x16, DoorType.Type5, null/+&DoorEntry490+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.Type4, 0), DoorConfig(0x0D, 0x0E, DoorType.Type2, null/+&DoorEntry801+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(2, [DoorConfig(0x12, 0x19, DoorType.Type2, null/+&DoorEntry941+/), DoorConfig(0x12, 0x1A, DoorType.Type2, null/+&DoorEntry941+/)]),
	SectorDoors(0, []),
	SectorDoors(5, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry727+/), DoorConfig(0x17, 0x0A, DoorType.Type5, null/+&DoorEntry677+/), DoorConfig(0x17, 0x12, DoorType.Type2, null/+&DoorEntry314+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry316+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry315+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry280+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry317+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry728+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry318+/)]),
	SectorDoors(1, [DoorConfig(0x1A, 0x17, DoorType.Type2, null/+&DoorEntry319+/)]),
	SectorDoors(5, [DoorConfig(0x0D, 0x16, DoorType.Type2, null/+&DoorEntry729+/), DoorConfig(0x1B, 0x09, DoorType.Type2, null/+&DoorEntry320+/), DoorConfig(0x1B, 0x0E, DoorType.Type5, null/+&DoorEntry348+/), DoorConfig(0x1B, 0x11, DoorType.Type2, null/+&DoorEntry321+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry322+/)]),
	SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.Type2, null/+&DoorEntry323+/), DoorConfig(0x1D, 0x1A, DoorType.Type2, null/+&DoorEntry324+/)]),
	SectorDoors(0, []),
	SectorDoors(8, [DoorConfig(0x00, 0x10, DoorType.Type2, null/+&DoorEntry481+/), DoorConfig(0x01, 0x10, DoorType.Type2, null/+&DoorEntry481+/), DoorConfig(0x02, 0x10, DoorType.Type2, null/+&DoorEntry481+/), DoorConfig(0x03, 0x10, DoorType.Type2, null/+&DoorEntry481+/), DoorConfig(0x04, 0x10, DoorType.Type2, null/+&DoorEntry481+/), DoorConfig(0x05, 0x10, DoorType.Type2, null/+&DoorEntry481+/), DoorConfig(0x06, 0x10, DoorType.Type2, null/+&DoorEntry481+/), DoorConfig(0x07, 0x10, DoorType.Type2, null/+&DoorEntry481+/)]),
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
	SectorDoors(8, [DoorConfig(0x00, 0x0F, DoorType.Type2, null/+&DoorEntry488+/), DoorConfig(0x01, 0x0F, DoorType.Type2, null/+&DoorEntry488+/), DoorConfig(0x02, 0x0F, DoorType.Type2, null/+&DoorEntry488+/), DoorConfig(0x03, 0x0F, DoorType.Type2, null/+&DoorEntry488+/), DoorConfig(0x04, 0x0F, DoorType.Type2, null/+&DoorEntry488+/), DoorConfig(0x05, 0x0F, DoorType.Type2, null/+&DoorEntry488+/), DoorConfig(0x06, 0x0F, DoorType.Type2, null/+&DoorEntry488+/), DoorConfig(0x07, 0x0F, DoorType.Type2, null/+&DoorEntry488+/)]),
	SectorDoors(14, [DoorConfig(0x00, 0x10, DoorType.Type2, null/+&DoorEntry489+/), DoorConfig(0x01, 0x10, DoorType.Type2, null/+&DoorEntry489+/), DoorConfig(0x02, 0x10, DoorType.Type2, null/+&DoorEntry489+/), DoorConfig(0x03, 0x10, DoorType.Type2, null/+&DoorEntry489+/), DoorConfig(0x04, 0x10, DoorType.Type2, null/+&DoorEntry489+/), DoorConfig(0x05, 0x10, DoorType.Type2, null/+&DoorEntry489+/), DoorConfig(0x06, 0x10, DoorType.Type2, null/+&DoorEntry489+/), DoorConfig(0x07, 0x10, DoorType.Type2, null/+&DoorEntry489+/), DoorConfig(0x18, 0x06, DoorType.Type2, null/+&DoorEntry341+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry341+/), DoorConfig(0x1A, 0x04, DoorType.Type2, null/+&DoorEntry341+/), DoorConfig(0x1B, 0x03, DoorType.Type2, null/+&DoorEntry341+/), DoorConfig(0x1C, 0x02, DoorType.Type2, null/+&DoorEntry341+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry341+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(6, [DoorConfig(0x18, 0x19, DoorType.Type2, null/+&DoorEntry342+/), DoorConfig(0x19, 0x1A, DoorType.Type2, null/+&DoorEntry342+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry342+/), DoorConfig(0x1B, 0x1C, DoorType.Type2, null/+&DoorEntry342+/), DoorConfig(0x1C, 0x1D, DoorType.Type2, null/+&DoorEntry342+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry342+/)]),
	SectorDoors(8, [DoorConfig(0x00, 0x0F, DoorType.Type2, null/+&DoorEntry484+/), DoorConfig(0x01, 0x0F, DoorType.Type2, null/+&DoorEntry484+/), DoorConfig(0x02, 0x0F, DoorType.Type2, null/+&DoorEntry484+/), DoorConfig(0x03, 0x0F, DoorType.Type2, null/+&DoorEntry484+/), DoorConfig(0x04, 0x0F, DoorType.Type2, null/+&DoorEntry484+/), DoorConfig(0x05, 0x0F, DoorType.Type2, null/+&DoorEntry484+/), DoorConfig(0x06, 0x0F, DoorType.Type2, null/+&DoorEntry484+/), DoorConfig(0x07, 0x0F, DoorType.Type2, null/+&DoorEntry484+/)]),
	SectorDoors(6, [DoorConfig(0x18, 0x06, DoorType.Type2, null/+&DoorEntry237+/), DoorConfig(0x19, 0x05, DoorType.Type2, null/+&DoorEntry237+/), DoorConfig(0x1A, 0x04, DoorType.Type2, null/+&DoorEntry237+/), DoorConfig(0x1B, 0x03, DoorType.Type2, null/+&DoorEntry237+/), DoorConfig(0x1C, 0x02, DoorType.Type2, null/+&DoorEntry237+/), DoorConfig(0x1D, 0x01, DoorType.Type2, null/+&DoorEntry237+/)]),
	SectorDoors(0, []),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x05, 0x1A, DoorType.Type2, null/+&DoorEntry340+/)]),
	SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.Type2, null/+&DoorEntry183+/), DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry184+/)]),
	SectorDoors(0, []),
	SectorDoors(1, [DoorConfig(0x0B, 0x01, DoorType.Type2, null/+&DoorEntry185+/)]),
	SectorDoors(7, [DoorConfig(0x09, 0x1E, DoorType.Type2, null/+&DoorEntry186+/), DoorConfig(0x18, 0x19, DoorType.Type2, null/+&DoorEntry238+/), DoorConfig(0x19, 0x1A, DoorType.Type2, null/+&DoorEntry238+/), DoorConfig(0x1A, 0x1B, DoorType.Type2, null/+&DoorEntry238+/), DoorConfig(0x1B, 0x1C, DoorType.Type2, null/+&DoorEntry238+/), DoorConfig(0x1C, 0x1D, DoorType.Type2, null/+&DoorEntry238+/), DoorConfig(0x1D, 0x1E, DoorType.Type2, null/+&DoorEntry238+/)]),
	SectorDoors(2, [DoorConfig(0x0F, 0x1C, DoorType.Type2, null/+&DoorEntry325+/), DoorConfig(0x10, 0x1C, DoorType.Type2, null/+&DoorEntry325+/)]),
	];

immutable DoorEntryA DoorEntry0 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_279 | EVENT_FLAG_UNSET,  0xC09A, 0x03B1, 0x04);
immutable DoorEntryA DoorEntry1 = DoorEntryA(null /+TEXT_DOOR_001+/, EventFlag.None,  0x010B, 0x0087, 0x01);
immutable DoorEntryA DoorEntry2 = DoorEntryA(null, EventFlag.None,  0x03EF, 0x0119, 0x01);
immutable DoorEntryA DoorEntry3 = DoorEntryA(null, EventFlag.None,  0x83FC, 0x00F3, 0x01);
immutable DoorEntryA DoorEntry4 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC434, 0x0158, 0x01);
immutable DoorEntryA DoorEntry5 = DoorEntryA(null, EventFlag.None,  0x80B9, 0x0367, 0x01);
immutable DoorEntryA DoorEntry6 = DoorEntryA(null /+TEXT_DOOR_006+/, EventFlag.UNKNOWN_06C | EVENT_FLAG_UNSET,  0xC0BA, 0x0375, 0x04);
immutable DoorEntryA DoorEntry7 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC0A9, 0x03F0, 0x01);
immutable DoorEntryA DoorEntry8 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC0BD, 0x03DC, 0x06);
immutable DoorEntryA DoorEntry9 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC03D, 0x03BC, 0x06);
immutable DoorEntryA DoorEntry10 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC02D, 0x03FC, 0x04);
immutable DoorEntryA DoorEntry11 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC04D, 0x03B8, 0x04);
immutable DoorEntryA DoorEntry12 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC06A, 0x03B1, 0x04);
immutable DoorEntryA DoorEntry13 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC04D, 0x03EC, 0x01);
immutable DoorEntryA DoorEntry14 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC0BD, 0x03FC, 0x01);
immutable DoorEntryA DoorEntry15 = DoorEntryA(null /+TEXT_DOOR_015+/, EventFlag.UNKNOWN_2EA | EVENT_FLAG_UNSET,  0xC0BA, 0x03B9, 0x04);
immutable DoorEntryA DoorEntry16 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC07D, 0x039C, 0x01);
immutable DoorEntryA DoorEntry17 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0x0056, 0x03D1, 0x04);
immutable DoorEntryA DoorEntry18 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC059, 0x03E4, 0x06);
immutable DoorEntryA DoorEntry19 = DoorEntryA(null /+TEXT_DOOR_019+/, EventFlag.UNKNOWN_278,  0xC031, 0x0384, 0x01);
immutable DoorEntryA DoorEntry20 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC0AD, 0x0398, 0x06);
immutable DoorEntryA DoorEntry21 = DoorEntryA(null /+TEXT_DOOR_021+/, EventFlag.UNKNOWN_1D4,  0xC06D, 0x0398, 0x04);
immutable DoorEntryA DoorEntry22 = DoorEntryA(null /+TEXT_DOOR_022+/, EventFlag.UNKNOWN_1DA,  0xC02A, 0x03CD, 0x04);
immutable DoorEntryA DoorEntry23 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC03D, 0x03F4, 0x01);
immutable DoorEntryA DoorEntry24 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC07A, 0x0371, 0x04);
immutable DoorEntryA DoorEntry25 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC09D, 0x03F8, 0x04);
immutable DoorEntryA DoorEntry26 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC08A, 0x03B9, 0x04);
immutable DoorEntryA DoorEntry27 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC09D, 0x0378, 0x04);
immutable DoorEntryA DoorEntry28 = DoorEntryA(null /+TEXT_DOOR_028+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0xC02A, 0x03CD, 0x00);
immutable DoorEntryA DoorEntry29 = DoorEntryA(null /+TEXT_DOOR_000+/, EventFlag.UNKNOWN_278,  0xC0AD, 0x03B4, 0x04);
immutable DoorEntryA DoorEntry30 = DoorEntryA(null /+TEXT_DOOR_030+/, EventFlag.None,  0x02E6, 0x008B, 0x01);
immutable DoorEntryA DoorEntry31 = DoorEntryA(null, EventFlag.None,  0x0048, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry32 = DoorEntryA(null, EventFlag.None,  0xC0AD, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry33 = DoorEntryA(null, EventFlag.None,  0xC0CD, 0x03FC, 0x07);
immutable DoorEntryA DoorEntry34 = DoorEntryA(null, EventFlag.UNKNOWN_026,  0x800D, 0x03E3, 0x07);
immutable DoorEntryA DoorEntry35 = DoorEntryA(null /+TEXT_DOOR_035+/, EventFlag.None,  0x80BD, 0x03E3, 0x01);
immutable DoorEntryA DoorEntry36 = DoorEntryA(null, EventFlag.None,  0x806D, 0x03C3, 0x0F);
immutable DoorEntryA DoorEntry37 = DoorEntryA(null, EventFlag.None,  0xC01A, 0x03B9, 0x07);
immutable DoorEntryA DoorEntry38 = DoorEntryA(null, EventFlag.None,  0x8031, 0x0363, 0x01);
immutable DoorEntryA DoorEntry39 = DoorEntryA(null, EventFlag.None,  0xC00D, 0x03FC, 0x01);
immutable DoorEntryA DoorEntry40 = DoorEntryA(null, EventFlag.None,  0x00D6, 0x00FC, 0x01);
immutable DoorEntryA DoorEntry41 = DoorEntryA(null, EventFlag.None,  0x807D, 0x03A3, 0x0F);
immutable DoorEntryA DoorEntry42 = DoorEntryA(null, EventFlag.None,  0x008E, 0x00D9, 0x0C);
immutable DoorEntryA DoorEntry43 = DoorEntryA(null /+TEXT_DOOR_043+/, EventFlag.UNKNOWN_1D3,  0x002B, 0x014B, 0x0A);
immutable DoorEntryA DoorEntry44 = DoorEntryA(null, EventFlag.None,  0xC08D, 0x037C, 0x07);
immutable DoorEntryA DoorEntry45 = DoorEntryA(null, EventFlag.None,  0xC0AD, 0x037C, 0x07);
immutable DoorEntryA DoorEntry46 = DoorEntryA(null, EventFlag.None,  0x805D, 0x0363, 0x0F);
immutable DoorEntryA DoorEntry47 = DoorEntryA(null, EventFlag.None,  0x00A1, 0x009A, 0x0A);
immutable DoorEntryA DoorEntry48 = DoorEntryA(null /+TEXT_DOOR_048+/, EventFlag.None,  0x006D, 0x010A, 0x01);
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
immutable DoorEntryA DoorEntry63 = DoorEntryA(null /+TEXT_DOOR_063+/, EventFlag.None,  0x002C, 0x012B, 0x0A);
immutable DoorEntryA DoorEntry64 = DoorEntryA(null, EventFlag.None,  0xC09D, 0x0398, 0x07);
immutable DoorEntryA DoorEntry65 = DoorEntryA(null, EventFlag.None,  0x00D3, 0x008F, 0x01);
immutable DoorEntryA DoorEntry66 = DoorEntryA(null, EventFlag.None,  0x80BD, 0x0383, 0x0F);
immutable DoorEntryA DoorEntry67 = DoorEntryA(null, EventFlag.None,  0x00BC, 0x0085, 0x0A);
immutable DoorEntryA DoorEntry68 = DoorEntryA(null, EventFlag.None,  0xC05D, 0x03BC, 0x07);
immutable DoorEntryA DoorEntry69 = DoorEntryA(null /+TEXT_DOOR_069+/, EventFlag.None,  0x802A, 0x03A6, 0x0F);
immutable DoorEntryA DoorEntry70 = DoorEntryA(null, EventFlag.None,  0x808A, 0x03E6, 0x07);
immutable DoorEntryA DoorEntry71 = DoorEntryA(null /+TEXT_DOOR_071+/, EventFlag.None,  0x801D, 0x03C3, 0x0F);
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
immutable DoorEntryA DoorEntry82 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.UNKNOWN_01F,  0x0361, 0x01F4, 0x01);
immutable DoorEntryA DoorEntry83 = DoorEntryA(null, EventFlag.None,  0x0048, 0x03E1, 0x07);
immutable DoorEntryA DoorEntry84 = DoorEntryA(null, EventFlag.None,  0x00BC, 0x0391, 0x07);
immutable DoorEntryA DoorEntry85 = DoorEntryA(null /+TEXT_DOOR_085+/, EventFlag.None,  0xC07D, 0x03BC, 0x07);
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
immutable DoorEntryA DoorEntry101 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0x00B2, 0x00FF, 0x01);
immutable DoorEntryA DoorEntry102 = DoorEntryA(null, EventFlag.None,  0x0008, 0x03BD, 0x07);
immutable DoorEntryA DoorEntry103 = DoorEntryA(null, EventFlag.None,  0xC139, 0x02F5, 0x01);
immutable DoorEntryA DoorEntry104 = DoorEntryA(null, EventFlag.None,  0x003B, 0x0085, 0x01);
immutable DoorEntryA DoorEntry105 = DoorEntryA(null, EventFlag.None,  0x003A, 0x009D, 0x01);
immutable DoorEntryA DoorEntry106 = DoorEntryA(null, EventFlag.None,  0xC2D9, 0x01D5, 0x01);
immutable DoorEntryA DoorEntry107 = DoorEntryA(null, EventFlag.None,  0xC2B9, 0x01D9, 0x01);
immutable DoorEntryA DoorEntry108 = DoorEntryA(null, EventFlag.None,  0xC279, 0x01F5, 0x01);
immutable DoorEntryA DoorEntry109 = DoorEntryA(null /+TEXT_DOOR_109+/, EventFlag.None,  0x003F, 0x00B1, 0x01);
immutable DoorEntryA DoorEntry110 = DoorEntryA(null, EventFlag.None,  0x0427, 0x0129, 0x01);
immutable DoorEntryA DoorEntry111 = DoorEntryA(null, EventFlag.None,  0x8430, 0x00E7, 0x01);
immutable DoorEntryA DoorEntry112 = DoorEntryA(null, EventFlag.None,  0x0413, 0x013D, 0x01);
immutable DoorEntryA DoorEntry113 = DoorEntryA(null, EventFlag.None,  0xC139, 0x008C, 0x01);
immutable DoorEntryA DoorEntry114 = DoorEntryA(null, EventFlag.None,  0x03F3, 0x00FD, 0x01);
immutable DoorEntryA DoorEntry115 = DoorEntryA(null /+TEXT_DOOR_115+/, EventFlag.DEFEATED_SANCTUARY_BOSS_1 | EVENT_FLAG_UNSET,  0x0027, 0x0089, 0x01);
immutable DoorEntryA DoorEntry116 = DoorEntryA(null, EventFlag.None,  0x8138, 0x02E7, 0x01);
immutable DoorEntryA DoorEntry117 = DoorEntryA(null, EventFlag.None,  0x409A, 0x03AC, 0x01);
immutable DoorEntryA DoorEntry118 = DoorEntryA(null, EventFlag.None,  0xC139, 0x02BC, 0x01);
immutable DoorEntryA DoorEntry119 = DoorEntryA(null, EventFlag.None,  0x8379, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry120 = DoorEntryA(null, EventFlag.None,  0xC109, 0x01BC, 0x01);
immutable DoorEntryA DoorEntry121 = DoorEntryA(null, EventFlag.None,  0x82E9, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry122 = DoorEntryA(null, EventFlag.None,  0x813B, 0x02A3, 0x01);
immutable DoorEntryA DoorEntry123 = DoorEntryA(null, EventFlag.None,  0xC109, 0x0189, 0x01);
immutable DoorEntryA DoorEntry124 = DoorEntryA(null /+TEXT_DOOR_124+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0075, 0x0092, 0x00);
immutable DoorEntryA DoorEntry125 = DoorEntryA(null /+TEXT_DOOR_125+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0085, 0x00B2, 0x00);
immutable DoorEntryA DoorEntry126 = DoorEntryA(null /+TEXT_DOOR_126+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00A2, 0x007F, 0x00);
immutable DoorEntryA DoorEntry127 = DoorEntryA(null /+TEXT_DOOR_127+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00DA, 0x00B4, 0x00);
immutable DoorEntryC DoorEntry128 = DoorEntryC(null /+TEXT_DOOR_128+/);
immutable DoorEntryC DoorEntry129 = DoorEntryC(null /+TEXT_DOOR_129+/);
immutable DoorEntryC DoorEntry130 = DoorEntryC(null /+TEXT_DOOR_130+/);
immutable DoorEntryC DoorEntry131 = DoorEntryC(null /+TEXT_DOOR_131+/);
immutable DoorEntryC DoorEntry132 = DoorEntryC(null /+TEXT_DOOR_132+/);
immutable DoorEntryC DoorEntry133 = DoorEntryC(null /+TEXT_DOOR_133+/);
immutable DoorEntryC DoorEntry134 = DoorEntryC(null /+TEXT_DOOR_134+/);
immutable DoorEntryC DoorEntry135 = DoorEntryC(null /+TEXT_DOOR_135+/);
immutable DoorEntryC DoorEntry136 = DoorEntryC(null /+TEXT_DOOR_136+/);
immutable DoorEntryC DoorEntry137 = DoorEntryC(null /+TEXT_DOOR_137+/);
immutable DoorEntryC DoorEntry138 = DoorEntryC(null /+TEXT_DOOR_138+/);
immutable DoorEntryA DoorEntry139 = DoorEntryA(null /+TEXT_DOOR_139+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00A0, 0x0151, 0x00);
immutable DoorEntryA DoorEntry140 = DoorEntryA(null /+TEXT_DOOR_140+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00D8, 0x0121, 0x00);
immutable DoorEntryA DoorEntry141 = DoorEntryA(null /+TEXT_DOOR_141+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00B2, 0x010B, 0x00);
immutable DoorEntryA DoorEntry142 = DoorEntryA(null /+TEXT_DOOR_142+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x00AE, 0x0117, 0x00);
immutable DoorEntryC DoorEntry143 = DoorEntryC(null /+TEXT_DOOR_143+/);
immutable DoorEntryC DoorEntry144 = DoorEntryC(null /+TEXT_DOOR_144+/);
immutable DoorEntryC DoorEntry145 = DoorEntryC(null /+TEXT_DOOR_145+/);
immutable DoorEntryC DoorEntry146 = DoorEntryC(null /+TEXT_DOOR_146+/);
immutable DoorEntryC DoorEntry147 = DoorEntryC(null /+TEXT_DOOR_147+/);
immutable DoorEntryC DoorEntry148 = DoorEntryC(null /+TEXT_DOOR_148+/);
immutable DoorEntryC DoorEntry149 = DoorEntryC(null /+TEXT_DOOR_149+/);
immutable DoorEntryC DoorEntry150 = DoorEntryC(null /+TEXT_DOOR_150+/);
immutable DoorEntryA DoorEntry151 = DoorEntryA(null /+TEXT_DOOR_151+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x000C, 0x03E9, 0x00);
immutable DoorEntryA DoorEntry152 = DoorEntryA(null /+TEXT_DOOR_152+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x000C, 0x03F1, 0x00);
immutable DoorEntryA DoorEntry153 = DoorEntryA(null /+TEXT_DOOR_153+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0058, 0x0379, 0x00);
immutable DoorEntryA DoorEntry154 = DoorEntryA(null /+TEXT_DOOR_154+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0058, 0x037D, 0x00);
immutable DoorEntryC DoorEntry155 = DoorEntryC(null /+TEXT_DOOR_155+/);
immutable DoorEntryC DoorEntry156 = DoorEntryC(null /+TEXT_DOOR_156+/);
immutable DoorEntryC DoorEntry157 = DoorEntryC(null /+TEXT_DOOR_157+/);
immutable DoorEntryC DoorEntry158 = DoorEntryC(null /+TEXT_DOOR_157+/);
immutable DoorEntryC DoorEntry159 = DoorEntryC(null /+TEXT_DOOR_157+/);
immutable DoorEntryC DoorEntry160 = DoorEntryC(null /+TEXT_DOOR_160+/);
immutable DoorEntryC DoorEntry161 = DoorEntryC(null /+TEXT_DOOR_157+/);
immutable DoorEntryC DoorEntry162 = DoorEntryC(null /+TEXT_DOOR_157+/);
immutable DoorEntryC DoorEntry163 = DoorEntryC(null /+TEXT_DOOR_163+/);
immutable DoorEntryA DoorEntry164 = DoorEntryA(null, EventFlag.None,  0x418F, 0x0098, 0x01);
immutable DoorEntryA DoorEntry165 = DoorEntryA(null, EventFlag.None,  0xC3FD, 0x0358, 0x04);
immutable DoorEntryA DoorEntry166 = DoorEntryA(null, EventFlag.None,  0xC3FD, 0x0398, 0x04);
immutable DoorEntryA DoorEntry167 = DoorEntryA(null, EventFlag.None,  0xC38D, 0x03C4, 0x01);
immutable DoorEntryA DoorEntry168 = DoorEntryA(null, EventFlag.None,  0xC3BD, 0x0378, 0x06);
immutable DoorEntryA DoorEntry169 = DoorEntryA(null, EventFlag.None,  0xC3AB, 0x038A, 0x06);
immutable DoorEntryA DoorEntry170 = DoorEntryA(null /+TEXT_DOOR_170+/, EventFlag.THREED_REACHED,  0xC39D, 0x03BC, 0x04);
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
immutable DoorEntryA DoorEntry181 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x84E9, 0x0363, 0x01);
immutable DoorEntryA DoorEntry182 = DoorEntryA(null /+TEXT_DOOR_182+/, EventFlag.None,  0x84FC, 0x02E4, 0x01);
immutable DoorEntryA DoorEntry183 = DoorEntryA(null /+TEXT_DOOR_183+/, EventFlag.None,  0xC378, 0x01C4, 0x01);
immutable DoorEntryA DoorEntry184 = DoorEntryA(null, EventFlag.None,  0x84EB, 0x03A3, 0x01);
immutable DoorEntryA DoorEntry185 = DoorEntryA(null, EventFlag.None,  0xC4E9, 0x037C, 0x01);
immutable DoorEntryA DoorEntry186 = DoorEntryA(null, EventFlag.None,  0x0119, 0x0216, 0x01);
immutable DoorEntryA DoorEntry187 = DoorEntryA(null, EventFlag.None,  0xC459, 0x03C8, 0x07);
immutable DoorEntryA DoorEntry188 = DoorEntryA(null, EventFlag.None,  0xC415, 0x03B8, 0x01);
immutable DoorEntryA DoorEntry189 = DoorEntryA(null /+TEXT_DOOR_189+/, EventFlag.None,  0x032F, 0x00AB, 0x01);
immutable DoorEntryA DoorEntry190 = DoorEntryA(null /+TEXT_DOOR_190+/, EventFlag.None,  0x032F, 0x00BC, 0x0C);
immutable DoorEntryA DoorEntry191 = DoorEntryA(null, EventFlag.None,  0x033B, 0x0133, 0x0A);
immutable DoorEntryA DoorEntry192 = DoorEntryA(null, EventFlag.None,  0x03DC, 0x0369, 0x07);
immutable DoorEntryA DoorEntry193 = DoorEntryA(null, EventFlag.None,  0x0448, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry194 = DoorEntryA(null /+TEXT_DOOR_194+/, EventFlag.None,  0x0332, 0x00D2, 0x0C);
immutable DoorEntryA DoorEntry195 = DoorEntryA(null, EventFlag.None,  0x03DC, 0x0371, 0x07);
immutable DoorEntryA DoorEntry196 = DoorEntryA(null /+TEXT_DOOR_196+/, EventFlag.None,  0x0373, 0x0109, 0x0A);
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
immutable DoorEntryA DoorEntry232 = DoorEntryA(null /+TEXT_DOOR_232+/, EventFlag.None,  0x0331, 0x0116, 0x0A);
immutable DoorEntryA DoorEntry233 = DoorEntryA(null, EventFlag.None,  0x839D, 0x03A3, 0x07);
immutable DoorEntryA DoorEntry234 = DoorEntryA(null /+TEXT_DOOR_234+/, EventFlag.None,  0x8431, 0x034B, 0x07);
immutable DoorEntryA DoorEntry235 = DoorEntryA(null /+TEXT_DOOR_235+/, EventFlag.UNKNOWN_073 | EVENT_FLAG_UNSET,  0xC3AD, 0x03FC, 0x07);
immutable DoorEntryA DoorEntry236 = DoorEntryA(null, EventFlag.None,  0x0398, 0x03B1, 0x07);
immutable DoorEntryA DoorEntry237 = DoorEntryA(null /+TEXT_DOOR_237+/, EventFlag.UNKNOWN_2F9,  0xC442, 0x009F, 0x01);
immutable DoorEntryA DoorEntry238 = DoorEntryA(null /+TEXT_DOOR_238+/, EventFlag.THREED_REACHED | EVENT_FLAG_UNSET,  0x849B, 0x0231, 0x01);
immutable DoorEntryA DoorEntry239 = DoorEntryA(null /+TEXT_DOOR_239+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0347, 0x012A, 0x00);
immutable DoorEntryA DoorEntry240 = DoorEntryA(null /+TEXT_DOOR_240+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x03A3, 0x010D, 0x00);
immutable DoorEntryC DoorEntry241 = DoorEntryC(null /+TEXT_DOOR_241+/);
immutable DoorEntryC DoorEntry242 = DoorEntryC(null /+TEXT_DOOR_242+/);
immutable DoorEntryC DoorEntry243 = DoorEntryC(null /+TEXT_DOOR_243+/);
immutable DoorEntryC DoorEntry244 = DoorEntryC(null /+TEXT_DOOR_244+/);
immutable DoorEntryC DoorEntry245 = DoorEntryC(null /+TEXT_DOOR_245+/);
immutable DoorEntryC DoorEntry246 = DoorEntryC(null /+TEXT_DOOR_246+/);
immutable DoorEntryC DoorEntry247 = DoorEntryC(null /+TEXT_DOOR_247+/);
immutable DoorEntryC DoorEntry248 = DoorEntryC(null /+TEXT_DOOR_248+/);
immutable DoorEntryA DoorEntry249 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC139, 0x029C, 0x01);
immutable DoorEntryA DoorEntry250 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC1A9, 0x021C, 0x01);
immutable DoorEntryA DoorEntry251 = DoorEntryA(null, EventFlag.None,  0xC0DD, 0x037C, 0x04);
immutable DoorEntryA DoorEntry252 = DoorEntryA(null, EventFlag.None,  0xC10D, 0x03BC, 0x04);
immutable DoorEntryA DoorEntry253 = DoorEntryA(null /+TEXT_DOOR_253+/, EventFlag.THREED_REACHED,  0xC122, 0x03F1, 0x04);
immutable DoorEntryA DoorEntry254 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x80D1, 0x0187, 0x01);
immutable DoorEntryA DoorEntry255 = DoorEntryA(null /+TEXT_DOOR_255+/, EventFlag.SATURN_VALLEY_REACHED | EVENT_FLAG_UNSET,  0xC101, 0x03F0, 0x04);
immutable DoorEntryA DoorEntry256 = DoorEntryA(null, EventFlag.None,  0xC0CD, 0x037C, 0x04);
immutable DoorEntryA DoorEntry257 = DoorEntryA(null, EventFlag.None,  0xC0DD, 0x03BC, 0x04);
immutable DoorEntryA DoorEntry258 = DoorEntryA(null, EventFlag.None,  0x80CD, 0x03A3, 0x0F);
immutable DoorEntryA DoorEntry259 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0x03F8, 0x01CA, 0x0A);
immutable DoorEntryA DoorEntry260 = DoorEntryA(null, EventFlag.None,  0x03B8, 0x0202, 0x0A);
immutable DoorEntryA DoorEntry261 = DoorEntryA(null, EventFlag.None,  0x80CD, 0x0363, 0x0F);
immutable DoorEntryA DoorEntry262 = DoorEntryA(null, EventFlag.None,  0x03EC, 0x0202, 0x0A);
immutable DoorEntryA DoorEntry263 = DoorEntryA(null, EventFlag.None,  0x03C3, 0x01D7, 0x0A);
immutable DoorEntryA DoorEntry264 = DoorEntryA(null, EventFlag.None,  0x03E4, 0x01B9, 0x0A);
immutable DoorEntryA DoorEntry265 = DoorEntryA(null, EventFlag.None,  0x80F2, 0x03A6, 0x0F);
immutable DoorEntryA DoorEntry266 = DoorEntryA(null /+TEXT_DOOR_266+/, EventFlag.None,  0x8122, 0x03AE, 0x07);
immutable DoorEntryA DoorEntry267 = DoorEntryA(null, EventFlag.None,  0x80DA, 0x03E6, 0x0F);
immutable DoorEntryA DoorEntry268 = DoorEntryA(null /+TEXT_DOOR_268+/, EventFlag.None,  0xC0DA, 0x03F9, 0x07);
immutable DoorEntryA DoorEntry269 = DoorEntryA(null /+TEXT_DOOR_269+/, EventFlag.None,  0x03DC, 0x01DF, 0x0A);
immutable DoorEntryA DoorEntry270 = DoorEntryA(null, EventFlag.None,  0x00C5, 0x02E9, 0x01);
immutable DoorEntryA DoorEntry271 = DoorEntryA(null /+TEXT_DOOR_271+/, EventFlag.None,  0x83B4, 0x01BA, 0x01);
immutable DoorEntryA DoorEntry272 = DoorEntryA(null, EventFlag.None,  0x008A, 0x02E6, 0x01);
immutable DoorEntryA DoorEntry273 = DoorEntryA(null, EventFlag.None,  0x03B8, 0x01F7, 0x01);
immutable DoorEntryC DoorEntry274 = DoorEntryC(null /+TEXT_DOOR_274+/);
immutable DoorEntryC DoorEntry275 = DoorEntryC(null /+TEXT_DOOR_275+/);
immutable DoorEntryA DoorEntry276 = DoorEntryA(null, EventFlag.None,  0x81A9, 0x01E3, 0x01);
immutable DoorEntryA DoorEntry277 = DoorEntryA(null, EventFlag.None,  0xC4CD, 0x0374, 0x04);
immutable DoorEntryA DoorEntry278 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x8139, 0x0263, 0x01);
immutable DoorEntryA DoorEntry279 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC4E9, 0x03DC, 0x01);
immutable DoorEntryA DoorEntry280 = DoorEntryA(null, EventFlag.None,  0x009A, 0x02D7, 0x0A);
immutable DoorEntryA DoorEntry281 = DoorEntryA(null /+TEXT_DOOR_281+/, EventFlag.DEFEATED_SANCTUARY_BOSS_2 | EVENT_FLAG_UNSET,  0x03F5, 0x0182, 0x01);
immutable DoorEntryA DoorEntry282 = DoorEntryA(null, EventFlag.None,  0xC3C4, 0x020C, 0x01);
immutable DoorEntryA DoorEntry283 = DoorEntryA(null /+TEXT_DOOR_001+/, EventFlag.None,  0x008B, 0x01F1, 0x01);
immutable DoorEntryA DoorEntry284 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x0401, 0x023C, 0x01);
immutable DoorEntryA DoorEntry285 = DoorEntryA(null, EventFlag.None,  0x04B1, 0x033C, 0x01);
immutable DoorEntryA DoorEntry286 = DoorEntryA(null, EventFlag.None,  0xC4CD, 0x03F8, 0x04);
immutable DoorEntryA DoorEntry287 = DoorEntryA(null, EventFlag.None,  0xC48D, 0x035C, 0x04);
immutable DoorEntryA DoorEntry288 = DoorEntryA(null, EventFlag.None,  0xC4EF, 0x03FA, 0x01);
immutable DoorEntryA DoorEntry289 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x03B8, 0x04);
immutable DoorEntryA DoorEntry290 = DoorEntryA(null /+TEXT_DOOR_290+/, EventFlag.None,  0xC4FC, 0x03DB, 0x01);
immutable DoorEntryA DoorEntry291 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x0374, 0x04);
immutable DoorEntryA DoorEntry292 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x03FC, 0x06);
immutable DoorEntryA DoorEntry293 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x0374, 0x06);
immutable DoorEntryA DoorEntry294 = DoorEntryA(null, EventFlag.None,  0xC4DD, 0x035C, 0x01);
immutable DoorEntryA DoorEntry295 = DoorEntryA(null, EventFlag.None,  0xC4DD, 0x03F8, 0x06);
immutable DoorEntryA DoorEntry296 = DoorEntryA(null, EventFlag.None,  0xC4DA, 0x0379, 0x04);
immutable DoorEntryA DoorEntry297 = DoorEntryA(null, EventFlag.None,  0xC4DA, 0x03B5, 0x04);
immutable DoorEntryA DoorEntry298 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x84FC, 0x0224, 0x01);
immutable DoorEntryA DoorEntry299 = DoorEntryA(null, EventFlag.None,  0xC489, 0x0388, 0x07);
immutable DoorEntryA DoorEntry300 = DoorEntryA(null, EventFlag.None,  0xC48D, 0x03E4, 0x01);
immutable DoorEntryA DoorEntry301 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0x0462, 0x02B3, 0x0A);
immutable DoorEntryA DoorEntry302 = DoorEntryA(null, EventFlag.None,  0x04DC, 0x03C9, 0x07);
immutable DoorEntryA DoorEntry303 = DoorEntryA(null, EventFlag.None,  0x048E, 0x029C, 0x0C);
immutable DoorEntryA DoorEntry304 = DoorEntryA(null, EventFlag.None,  0x0488, 0x0351, 0x07);
immutable DoorEntryA DoorEntry305 = DoorEntryA(null, EventFlag.None,  0x04DC, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry306 = DoorEntryA(null, EventFlag.None,  0x0488, 0x03CD, 0x07);
immutable DoorEntryA DoorEntry307 = DoorEntryA(null /+TEXT_DOOR_307+/, EventFlag.None,  0xC49D, 0x03BC, 0x07);
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
immutable DoorEntryA DoorEntry340 = DoorEntryA(null /+TEXT_DOOR_340+/, EventFlag.UNKNOWN_21D | EVENT_FLAG_UNSET,  0x84BD, 0x0322, 0x07);
immutable DoorEntryA DoorEntry341 = DoorEntryA(null, EventFlag.None,  0xC49B, 0x032E, 0x01);
immutable DoorEntryA DoorEntry342 = DoorEntryA(null /+TEXT_DOOR_342+/, EventFlag.UNKNOWN_2F9,  0x83C2, 0x0140, 0x01);
immutable DoorEntryA DoorEntry343 = DoorEntryA(null, EventFlag.None,  0xC4FC, 0x02BB, 0x01);
immutable DoorEntryA DoorEntry344 = DoorEntryA(null, EventFlag.None,  0x800C, 0x0304, 0x01);
immutable DoorEntryA DoorEntry345 = DoorEntryA(null, EventFlag.None,  0xC3C2, 0x0187, 0x01);
immutable DoorEntryA DoorEntry346 = DoorEntryA(null /+TEXT_DOOR_346+/, EventFlag.None,  0x84E6, 0x0032, 0x01);
immutable DoorEntryC DoorEntry347 = DoorEntryC(null /+TEXT_DOOR_347+/);
immutable DoorEntryC DoorEntry348 = DoorEntryC(null /+TEXT_DOOR_348+/);
immutable DoorEntryA DoorEntry349 = DoorEntryA(null /+TEXT_DOOR_349+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0452, 0x02C1, 0x00);
immutable DoorEntryA DoorEntry350 = DoorEntryA(null /+TEXT_DOOR_350+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0455, 0x02F5, 0x00);
immutable DoorEntryA DoorEntry351 = DoorEntryA(null /+TEXT_DOOR_351+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0449, 0x0305, 0x00);
immutable DoorEntryA DoorEntry352 = DoorEntryA(null /+TEXT_DOOR_352+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x047C, 0x026D, 0x00);
immutable DoorEntryA DoorEntry353 = DoorEntryA(null /+TEXT_DOOR_353+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x047A, 0x02D3, 0x00);
immutable DoorEntryA DoorEntry354 = DoorEntryA(null /+TEXT_DOOR_354+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0462, 0x030D, 0x00);
immutable DoorEntryA DoorEntry355 = DoorEntryA(null /+TEXT_DOOR_355+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0487, 0x02DF, 0x00);
immutable DoorEntryC DoorEntry356 = DoorEntryC(null /+TEXT_DOOR_356+/);
immutable DoorEntryC DoorEntry357 = DoorEntryC(null /+TEXT_DOOR_357+/);
immutable DoorEntryC DoorEntry358 = DoorEntryC(null /+TEXT_DOOR_358+/);
immutable DoorEntryC DoorEntry359 = DoorEntryC(null /+TEXT_DOOR_359+/);
immutable DoorEntryC DoorEntry360 = DoorEntryC(null /+TEXT_DOOR_360+/);
immutable DoorEntryC DoorEntry361 = DoorEntryC(null /+TEXT_DOOR_361+/);
immutable DoorEntryC DoorEntry362 = DoorEntryC(null /+TEXT_DOOR_362+/);
immutable DoorEntryC DoorEntry363 = DoorEntryC(null /+TEXT_DOOR_363+/);
immutable DoorEntryC DoorEntry364 = DoorEntryC(null /+TEXT_DOOR_364+/);
immutable DoorEntryA DoorEntry365 = DoorEntryA(null, EventFlag.None,  0xC141, 0x03E8, 0x04);
immutable DoorEntryA DoorEntry366 = DoorEntryA(null, EventFlag.None,  0xC13D, 0x03B8, 0x04);
immutable DoorEntryA DoorEntry367 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC0F8, 0x03CB, 0x01);
immutable DoorEntryA DoorEntry368 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC0D8, 0x038B, 0x01);
immutable DoorEntryA DoorEntry369 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC0D8, 0x03CB, 0x01);
immutable DoorEntryA DoorEntry370 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC0F8, 0x038B, 0x01);
immutable DoorEntryA DoorEntry371 = DoorEntryA(null /+TEXT_DOOR_001+/, EventFlag.None,  0xC014, 0x0280, 0x01);
immutable DoorEntryA DoorEntry372 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x801C, 0x0267, 0x01);
immutable DoorEntryA DoorEntry373 = DoorEntryA(null /+TEXT_DOOR_373+/, EventFlag.None,  0xC1B8, 0x00F8, 0x01);
immutable DoorEntryA DoorEntry374 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x81D0, 0x008B, 0x01);
immutable DoorEntryA DoorEntry375 = DoorEntryA(null, EventFlag.None,  0xC169, 0x03F8, 0x04);
immutable DoorEntryA DoorEntry376 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC26C, 0x035C, 0x01);
immutable DoorEntryA DoorEntry377 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x01C5, 0x036C, 0x01);
immutable DoorEntryA DoorEntry378 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC2E8, 0x020B, 0x01);
immutable DoorEntryC DoorEntry379 = DoorEntryC(null /+TEXT_DOOR_379+/);
immutable DoorEntryA DoorEntry380 = DoorEntryA(null, EventFlag.None,  0x0124, 0x0057, 0x0A);
immutable DoorEntryA DoorEntry381 = DoorEntryA(null, EventFlag.None,  0x013C, 0x03DA, 0x07);
immutable DoorEntryA DoorEntry382 = DoorEntryA(null, EventFlag.None,  0x013C, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry383 = DoorEntryA(null, EventFlag.None,  0x8164, 0x03E0, 0x0F);
immutable DoorEntryA DoorEntry384 = DoorEntryA(null, EventFlag.None,  0x017C, 0x03DA, 0x07);
immutable DoorEntryA DoorEntry385 = DoorEntryA(null, EventFlag.None,  0x017C, 0x03D1, 0x07);
immutable DoorEntryA DoorEntry386 = DoorEntryA(null, EventFlag.None,  0xC0CD, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry387 = DoorEntryA(null, EventFlag.None,  0xC0CD, 0x0394, 0x07);
immutable DoorEntryA DoorEntry388 = DoorEntryA(null, EventFlag.None,  0x8181, 0x03C7, 0x0F);
immutable DoorEntryA DoorEntry389 = DoorEntryA(null /+TEXT_DOOR_389+/, EventFlag.None,  0x0112, 0x003E, 0x0A);
immutable DoorEntryA DoorEntry390 = DoorEntryA(null, EventFlag.None,  0x0263, 0x0028, 0x0A);
immutable DoorEntryA DoorEntry391 = DoorEntryA(null, EventFlag.None,  0x80F0, 0x0364, 0x0F);
immutable DoorEntryA DoorEntry392 = DoorEntryA(null, EventFlag.None,  0xC0ED, 0x03D8, 0x07);
immutable DoorEntryA DoorEntry393 = DoorEntryA(null, EventFlag.None,  0xC0ED, 0x0398, 0x07);
immutable DoorEntryA DoorEntry394 = DoorEntryA(null, EventFlag.None,  0x8141, 0x03C7, 0x0F);
immutable DoorEntryA DoorEntry395 = DoorEntryA(null /+TEXT_DOOR_395+/, EventFlag.None,  0x01A3, 0x002B, 0x01);
immutable DoorEntryA DoorEntry396 = DoorEntryA(null /+TEXT_DOOR_395+/, EventFlag.None,  0x01A7, 0x0033, 0x01);
immutable DoorEntryA DoorEntry397 = DoorEntryA(null /+TEXT_DOOR_395+/, EventFlag.None,  0x01A3, 0x0047, 0x01);
immutable DoorEntryA DoorEntry398 = DoorEntryA(null /+TEXT_DOOR_395+/, EventFlag.None,  0x018F, 0x0063, 0x01);
immutable DoorEntryA DoorEntry399 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0x015B, 0x0043, 0x01);
immutable DoorEntryA DoorEntry400 = DoorEntryA(null, EventFlag.None,  0x0245, 0x0061, 0x01);
immutable DoorEntryA DoorEntry401 = DoorEntryA(null /+TEXT_DOOR_401+/, EventFlag.None,  0x024A, 0x0055, 0x01);
immutable DoorEntryA DoorEntry402 = DoorEntryA(null /+TEXT_DOOR_402+/, EventFlag.None,  0x0215, 0x0035, 0x01);
immutable DoorEntryA DoorEntry403 = DoorEntryA(null /+TEXT_DOOR_403+/, EventFlag.DEFEATED_SANCTUARY_BOSS_4 | EVENT_FLAG_UNSET,  0x01E1, 0x0019, 0x01);
immutable DoorEntryA DoorEntry404 = DoorEntryA(null, EventFlag.None,  0x8434, 0x0167, 0x01);
immutable DoorEntryA DoorEntry405 = DoorEntryA(null, EventFlag.None,  0xC034, 0x0298, 0x01);
immutable DoorEntryA DoorEntry406 = DoorEntryA(null, EventFlag.None,  0x826C, 0x0307, 0x01);
immutable DoorEntryA DoorEntry407 = DoorEntryA(null, EventFlag.None,  0xC438, 0x01BC, 0x01);
immutable DoorEntryA DoorEntry408 = DoorEntryA(null /+TEXT_DOOR_408+/, EventFlag.None,  0x0261, 0x0051, 0x01);
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
immutable DoorEntryA DoorEntry432 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x819B, 0x03A3, 0x01);
immutable DoorEntryA DoorEntry433 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x02C1, 0x01FC, 0x01);
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
immutable DoorEntryA DoorEntry446 = DoorEntryA(null /+TEXT_DOOR_446+/, EventFlag.DEFEATED_SANCTUARY_BOSS_3 | EVENT_FLAG_UNSET,  0x0295, 0x004E, 0x01);
immutable DoorEntryA DoorEntry447 = DoorEntryA(null /+TEXT_DOOR_447+/, EventFlag.None,  0x02BD, 0x0066, 0x01);
immutable DoorEntryA DoorEntry448 = DoorEntryA(null, EventFlag.None,  0x0391, 0x0045, 0x01);
immutable DoorEntryA DoorEntry449 = DoorEntryA(null /+TEXT_DOOR_447+/, EventFlag.None,  0x0295, 0x001E, 0x01);
immutable DoorEntryA DoorEntry450 = DoorEntryA(null, EventFlag.None,  0x024F, 0x022E, 0x01);
immutable DoorEntryA DoorEntry451 = DoorEntryA(null, EventFlag.None,  0x0395, 0x0035, 0x01);
immutable DoorEntryA DoorEntry452 = DoorEntryA(null, EventFlag.None,  0xC279, 0x03B9, 0x01);
immutable DoorEntryA DoorEntry453 = DoorEntryA(null /+TEXT_DOOR_001+/, EventFlag.None,  0x011F, 0x0395, 0x01);
immutable DoorEntryA DoorEntry454 = DoorEntryA(null, EventFlag.None,  0x810C, 0x036B, 0x01);
immutable DoorEntryA DoorEntry455 = DoorEntryA(null, EventFlag.None,  0x8199, 0x0343, 0x01);
immutable DoorEntryA DoorEntry456 = DoorEntryA(null, EventFlag.None,  0x0055, 0x034D, 0x01);
immutable DoorEntryA DoorEntry457 = DoorEntryA(null, EventFlag.None,  0x81B9, 0x0343, 0x01);
immutable DoorEntryA DoorEntry458 = DoorEntryA(null, EventFlag.None,  0xC199, 0x03BD, 0x01);
immutable DoorEntryA DoorEntry459 = DoorEntryA(null, EventFlag.None,  0xC199, 0x03FC, 0x01);
immutable DoorEntryA DoorEntry460 = DoorEntryA(null /+TEXT_DOOR_460+/, EventFlag.None,  0x03E2, 0x0019, 0x01);
immutable DoorEntryA DoorEntry461 = DoorEntryA(null /+TEXT_DOOR_461+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0021, 0x031C, 0x01);
immutable DoorEntryC DoorEntry462 = DoorEntryC(null /+TEXT_DOOR_462+/);
immutable DoorEntryA DoorEntry463 = DoorEntryA(null, EventFlag.None,  0xC3E9, 0x03CB, 0x04);
immutable DoorEntryA DoorEntry464 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC1A9, 0x0350, 0x01);
immutable DoorEntryA DoorEntry465 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x0281, 0x018C, 0x01);
immutable DoorEntryA DoorEntry466 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x828D, 0x0183, 0x01);
immutable DoorEntryA DoorEntry467 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC379, 0x03F9, 0x01);
immutable DoorEntryA DoorEntry468 = DoorEntryA(null, EventFlag.None,  0xC3E9, 0x032B, 0x04);
immutable DoorEntryA DoorEntry469 = DoorEntryA(null, EventFlag.None,  0xC3E9, 0x038B, 0x04);
immutable DoorEntryA DoorEntry470 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC1B9, 0x035C, 0x01);
immutable DoorEntryA DoorEntry471 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC28D, 0x019C, 0x01);
immutable DoorEntryA DoorEntry472 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x8279, 0x0383, 0x01);
immutable DoorEntryA DoorEntry473 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0x03CC, 0x001B, 0x0A);
immutable DoorEntryA DoorEntry474 = DoorEntryA(null, EventFlag.None,  0x03C4, 0x0037, 0x0A);
immutable DoorEntryA DoorEntry475 = DoorEntryA(null, EventFlag.None,  0x03A0, 0x001B, 0x0A);
immutable DoorEntryA DoorEntry476 = DoorEntryA(null, EventFlag.None,  0x03A7, 0x0018, 0x01);
immutable DoorEntryA DoorEntry477 = DoorEntryA(null, EventFlag.None,  0x03B0, 0x0015, 0x01);
immutable DoorEntryA DoorEntry478 = DoorEntryA(null, EventFlag.None,  0x03AA, 0x002D, 0x01);
immutable DoorEntryA DoorEntry479 = DoorEntryA(null, EventFlag.None,  0x03AC, 0x0025, 0x01);
immutable DoorEntryA DoorEntry480 = DoorEntryA(null, EventFlag.None,  0xC10D, 0x03D8, 0x01);
immutable DoorEntryA DoorEntry481 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC00C, 0x035B, 0x01);
immutable DoorEntryA DoorEntry482 = DoorEntryA(null, EventFlag.None,  0xC0ED, 0x03F4, 0x01);
immutable DoorEntryA DoorEntry483 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x81AC, 0x02C4, 0x01);
immutable DoorEntryA DoorEntry484 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x81AC, 0x02C4, 0x01);
immutable DoorEntryA DoorEntry485 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC35A, 0x03F8, 0x01);
immutable DoorEntryA DoorEntry486 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x0413, 0x0031, 0x01);
immutable DoorEntryA DoorEntry487 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x0291, 0x03B8, 0x01);
immutable DoorEntryA DoorEntry488 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x843C, 0x03C4, 0x01);
immutable DoorEntryA DoorEntry489 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0xC43C, 0x03FB, 0x01);
immutable DoorEntryC DoorEntry490 = DoorEntryC(null /+TEXT_DOOR_490+/);
immutable DoorEntryA DoorEntry491 = DoorEntryA(null /+TEXT_DOOR_346+/, EventFlag.None,  0x04B4, 0x01B3, 0x01);
immutable DoorEntryA DoorEntry492 = DoorEntryA(null /+TEXT_DOOR_346+/, EventFlag.None,  0x04DC, 0x00AF, 0x01);
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
immutable DoorEntryA DoorEntry504 = DoorEntryA(null /+TEXT_DOOR_346+/, EventFlag.None,  0x04B6, 0x01C9, 0x01);
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
immutable DoorEntryA DoorEntry548 = DoorEntryA(null /+TEXT_DOOR_548+/, EventFlag.None,  0xC4E6, 0x02CD, 0x01);
immutable DoorEntryA DoorEntry549 = DoorEntryA(null /+TEXT_DOOR_549+/, EventFlag.None,  0x827E, 0x0118, 0x01);
immutable DoorEntryA DoorEntry550 = DoorEntryA(null, EventFlag.None,  0xC4E6, 0x020D, 0x01);
immutable DoorEntryA DoorEntry551 = DoorEntryA(null, EventFlag.None,  0x84E6, 0x0232, 0x01);
immutable DoorEntryA DoorEntry552 = DoorEntryA(null, EventFlag.None,  0xC30D, 0x02DC, 0x01);
immutable DoorEntryA DoorEntry553 = DoorEntryA(null, EventFlag.None,  0x8339, 0x02A7, 0x04);
immutable DoorEntryA DoorEntry554 = DoorEntryA(null /+TEXT_DOOR_554+/, EventFlag.None,  0xC35D, 0x02FC, 0x04);
immutable DoorEntryA DoorEntry555 = DoorEntryA(null /+TEXT_DOOR_555+/, EventFlag.None,  0xC2A5, 0x02C8, 0x01);
immutable DoorEntryA DoorEntry556 = DoorEntryA(null /+TEXT_DOOR_556+/, EventFlag.UNKNOWN_092 | EVENT_FLAG_UNSET,  0xC357, 0x0296, 0x06);
immutable DoorEntryA DoorEntry557 = DoorEntryA(null /+TEXT_DOOR_001+/, EventFlag.None,  0x0184, 0x01BB, 0x01);
immutable DoorEntryA DoorEntry558 = DoorEntryA(null, EventFlag.None,  0xC2B5, 0x027C, 0x04);
immutable DoorEntryA DoorEntry559 = DoorEntryA(null, EventFlag.None,  0xC2FD, 0x02FC, 0x01);
immutable DoorEntryA DoorEntry560 = DoorEntryA(null, EventFlag.None,  0xC2AD, 0x0238, 0x06);
immutable DoorEntryA DoorEntry561 = DoorEntryA(null /+TEXT_DOOR_561+/, EventFlag.None,  0xC1AC, 0x0317, 0x01);
immutable DoorEntryA DoorEntry562 = DoorEntryA(null, EventFlag.None,  0x8209, 0x02A3, 0x04);
immutable DoorEntryA DoorEntry563 = DoorEntryA(null, EventFlag.None,  0x0308, 0x02B2, 0x07);
immutable DoorEntryA DoorEntry564 = DoorEntryA(null, EventFlag.None,  0x02DB, 0x02C9, 0x07);
immutable DoorEntryA DoorEntry565 = DoorEntryA(null, EventFlag.None,  0x02DB, 0x02D1, 0x07);
immutable DoorEntryA DoorEntry566 = DoorEntryA(null /+TEXT_DOOR_566+/, EventFlag.UNKNOWN_15E,  0x82A5, 0x02AB, 0x0D);
immutable DoorEntryA DoorEntry567 = DoorEntryA(null, EventFlag.None,  0xC281, 0x02C0, 0x07);
immutable DoorEntryA DoorEntry568 = DoorEntryA(null, EventFlag.None,  0xC2C1, 0x02C8, 0x07);
immutable DoorEntryA DoorEntry569 = DoorEntryA(null, EventFlag.None,  0x0327, 0x02ED, 0x07);
immutable DoorEntryA DoorEntry570 = DoorEntryA(null, EventFlag.None,  0xC28D, 0x0298, 0x07);
immutable DoorEntryA DoorEntry571 = DoorEntryA(null, EventFlag.None,  0x02DB, 0x02A9, 0x07);
immutable DoorEntryA DoorEntry572 = DoorEntryA(null, EventFlag.None,  0x02DB, 0x02B1, 0x07);
immutable DoorEntryA DoorEntry573 = DoorEntryA(null /+TEXT_DOOR_573+/, EventFlag.None,  0x830C, 0x0224, 0x07);
immutable DoorEntryA DoorEntry574 = DoorEntryA(null, EventFlag.None,  0xC28D, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry575 = DoorEntryA(null, EventFlag.None,  0xC2AD, 0x0298, 0x07);
immutable DoorEntryA DoorEntry576 = DoorEntryA(null, EventFlag.None,  0x0268, 0x02ED, 0x07);
immutable DoorEntryA DoorEntry577 = DoorEntryA(null /+TEXT_DOOR_577+/, EventFlag.UNKNOWN_15E,  0x832D, 0x02E3, 0x0D);
immutable DoorEntryA DoorEntry578 = DoorEntryA(null, EventFlag.None,  0x026B, 0x02AE, 0x07);
immutable DoorEntryA DoorEntry579 = DoorEntryA(null, EventFlag.None,  0x0288, 0x0290, 0x07);
immutable DoorEntryA DoorEntry580 = DoorEntryA(null, EventFlag.None,  0xC32B, 0x029A, 0x07);
immutable DoorEntryA DoorEntry581 = DoorEntryA(null, EventFlag.None,  0xC24F, 0x01AF, 0x0C);
immutable DoorEntryA DoorEntry582 = DoorEntryA(null, EventFlag.None,  0x82ED, 0x0283, 0x0F);
immutable DoorEntryA DoorEntry583 = DoorEntryA(null, EventFlag.None,  0xC2AD, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry584 = DoorEntryA(null, EventFlag.None,  0xC2CD, 0x0298, 0x07);
immutable DoorEntryA DoorEntry585 = DoorEntryA(null, EventFlag.None,  0x828D, 0x0283, 0x07);
immutable DoorEntryA DoorEntry586 = DoorEntryA(null /+TEXT_DOOR_586+/, EventFlag.UNKNOWN_15E,  0xC32D, 0x02F8, 0x0D);
immutable DoorEntryA DoorEntry587 = DoorEntryA(null /+TEXT_DOOR_587+/, EventFlag.None,  0x0278, 0x0285, 0x0D);
immutable DoorEntryA DoorEntry588 = DoorEntryA(null /+TEXT_DOOR_588+/, EventFlag.None,  0x0203, 0x01B0, 0x01);
immutable DoorEntryA DoorEntry589 = DoorEntryA(null, EventFlag.None,  0x02A8, 0x028A, 0x07);
immutable DoorEntryA DoorEntry590 = DoorEntryA(null, EventFlag.None,  0x8341, 0x0226, 0x07);
immutable DoorEntryA DoorEntry591 = DoorEntryA(null, EventFlag.None,  0xC2CD, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry592 = DoorEntryA(null, EventFlag.None,  0xC2ED, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry593 = DoorEntryA(null, EventFlag.None,  0x02A8, 0x0290, 0x07);
immutable DoorEntryA DoorEntry594 = DoorEntryA(null /+TEXT_DOOR_594+/, EventFlag.UNKNOWN_15E,  0xC30D, 0x02F8, 0x0D);
immutable DoorEntryA DoorEntry595 = DoorEntryA(null, EventFlag.None,  0x826D, 0x02E3, 0x07);
immutable DoorEntryA DoorEntry596 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x02F8, 0x07);
immutable DoorEntryA DoorEntry597 = DoorEntryA(null, EventFlag.None,  0x026B, 0x02C1, 0x07);
immutable DoorEntryA DoorEntry598 = DoorEntryA(null, EventFlag.None,  0x826D, 0x0283, 0x07);
immutable DoorEntryA DoorEntry599 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x0298, 0x07);
immutable DoorEntryA DoorEntry600 = DoorEntryA(null, EventFlag.None,  0x830D, 0x02E3, 0x07);
immutable DoorEntryA DoorEntry601 = DoorEntryA(null, EventFlag.None,  0x02C8, 0x0290, 0x07);
immutable DoorEntryA DoorEntry602 = DoorEntryA(null, EventFlag.None,  0x02F8, 0x02F1, 0x07);
immutable DoorEntryA DoorEntry603 = DoorEntryA(null, EventFlag.None,  0x82B1, 0x0223, 0x0F);
immutable DoorEntryA DoorEntry604 = DoorEntryA(null /+TEXT_DOOR_604+/, EventFlag.UNKNOWN_08F | EVENT_FLAG_UNSET,  0x82ED, 0x02E3, 0x07);
immutable DoorEntryA DoorEntry605 = DoorEntryA(null, EventFlag.UNKNOWN_298 | EVENT_FLAG_UNSET,  0xC209, 0x02BC, 0x0F);
immutable DoorEntryA DoorEntry606 = DoorEntryA(null, EventFlag.UNKNOWN_16A | EVENT_FLAG_UNSET,  0x02EC, 0x02C2, 0x07);
immutable DoorEntryA DoorEntry607 = DoorEntryA(null, EventFlag.None,  0x82CD, 0x0283, 0x07);
immutable DoorEntryA DoorEntry608 = DoorEntryA(null, EventFlag.None,  0xC2D9, 0x02E8, 0x07);
immutable DoorEntryA DoorEntry609 = DoorEntryA(null, EventFlag.None,  0xC31D, 0x02CC, 0x01);
immutable DoorEntryA DoorEntry610 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0xC24B, 0x0142, 0x01);
immutable DoorEntryA DoorEntry611 = DoorEntryA(null, EventFlag.None,  0xC27D, 0x02FC, 0x07);
immutable DoorEntryA DoorEntry612 = DoorEntryA(null, EventFlag.None,  0xC27D, 0x0238, 0x07);
immutable DoorEntryA DoorEntry613 = DoorEntryA(null, EventFlag.None,  0x832D, 0x02A3, 0x0F);
immutable DoorEntryA DoorEntry614 = DoorEntryA(null, EventFlag.None,  0xC33D, 0x02D8, 0x07);
immutable DoorEntryA DoorEntry615 = DoorEntryA(null, EventFlag.None,  0xC35D, 0x02D8, 0x07);
immutable DoorEntryA DoorEntry616 = DoorEntryA(null, EventFlag.None,  0xC1C9, 0x0173, 0x01);
immutable DoorEntryA DoorEntry617 = DoorEntryA(null, EventFlag.None,  0x82FD, 0x02E3, 0x01);
immutable DoorEntryA DoorEntry618 = DoorEntryA(null, EventFlag.None,  0xC2DD, 0x02DC, 0x07);
immutable DoorEntryA DoorEntry619 = DoorEntryA(null /+TEXT_DOOR_587+/, EventFlag.None,  0x02D8, 0x0285, 0x0D);
immutable DoorEntryA DoorEntry620 = DoorEntryA(null, EventFlag.None,  0x032C, 0x02C5, 0x07);
immutable DoorEntryA DoorEntry621 = DoorEntryA(null, EventFlag.None,  0x829D, 0x02E3, 0x07);
immutable DoorEntryA DoorEntry622 = DoorEntryA(null, EventFlag.None,  0x830D, 0x02A3, 0x0F);
immutable DoorEntryA DoorEntry623 = DoorEntryA(null, EventFlag.None,  0xC31D, 0x02FC, 0x07);
immutable DoorEntryA DoorEntry624 = DoorEntryA(null, EventFlag.None,  0xC34D, 0x02DC, 0x07);
immutable DoorEntryA DoorEntry625 = DoorEntryA(null, EventFlag.None,  0x0318, 0x02B1, 0x07);
immutable DoorEntryA DoorEntry626 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x02CC, 0x07);
immutable DoorEntryA DoorEntry627 = DoorEntryA(null /+TEXT_DOOR_587+/, EventFlag.None,  0x0298, 0x0285, 0x0D);
immutable DoorEntryA DoorEntry628 = DoorEntryA(null /+TEXT_DOOR_628+/, EventFlag.UNKNOWN_08E | EVENT_FLAG_UNSET,  0x02B8, 0x0285, 0x0D);
immutable DoorEntryA DoorEntry629 = DoorEntryA(null, EventFlag.None,  0xC2BD, 0x02FC, 0x07);
immutable DoorEntryA DoorEntry630 = DoorEntryA(null /+TEXT_DOOR_630+/, EventFlag.None,  0xC218, 0x01C2, 0x0C);
immutable DoorEntryA DoorEntry631 = DoorEntryA(null, EventFlag.None,  0x032C, 0x02D1, 0x07);
immutable DoorEntryA DoorEntry632 = DoorEntryA(null, EventFlag.None,  0x0318, 0x02BD, 0x07);
immutable DoorEntryA DoorEntry633 = DoorEntryA(null /+TEXT_DOOR_633+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x035E, 0x02BE, 0x00);
immutable DoorEntryA DoorEntry634 = DoorEntryA(null, EventFlag.UNKNOWN_03A | EVENT_FLAG_UNSET,  0xC35D, 0x02BC, 0x07);
immutable DoorEntryA DoorEntry635 = DoorEntryA(null, EventFlag.None,  0x835D, 0x02E2, 0x01);
immutable DoorEntryA DoorEntry636 = DoorEntryA(null /+TEXT_DOOR_636+/, EventFlag.None,  0xC2DD, 0x026C, 0x07);
immutable DoorEntryA DoorEntry637 = DoorEntryA(null, EventFlag.None,  0xC26D, 0x023C, 0x07);
immutable DoorEntryA DoorEntry638 = DoorEntryA(null /+TEXT_DOOR_638+/, EventFlag.None,  0x823E, 0x0179, 0x0A);
immutable DoorEntryA DoorEntry639 = DoorEntryA(null, EventFlag.UNKNOWN_176 | EVENT_FLAG_UNSET,  0xC34D, 0x02BC, 0x07);
immutable DoorEntryA DoorEntry640 = DoorEntryA(null /+TEXT_DOOR_640+/, EventFlag.None,  0x02A8, 0x0259, 0x07);
immutable DoorEntryA DoorEntry641 = DoorEntryA(null /+TEXT_DOOR_641+/, EventFlag.None,  0xC1E2, 0x0142, 0x0A);
immutable DoorEntryA DoorEntry642 = DoorEntryA(null /+TEXT_DOOR_642+/, EventFlag.None,  0x82DD, 0x0233, 0x07);
immutable DoorEntryA DoorEntry643 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x0044, 0x0283, 0x01);
immutable DoorEntryA DoorEntry644 = DoorEntryA(null, EventFlag.None,  0x8299, 0x0227, 0x07);
immutable DoorEntryA DoorEntry645 = DoorEntryA(null, EventFlag.None,  0x82AB, 0x024D, 0x07);
immutable DoorEntryA DoorEntry646 = DoorEntryA(null, EventFlag.None,  0xC297, 0x027B, 0x01);
immutable DoorEntryA DoorEntry647 = DoorEntryA(null /+TEXT_DOOR_647+/, EventFlag.None,  0x0217, 0x0192, 0x0A);
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
immutable DoorEntryA DoorEntry669 = DoorEntryA(null /+TEXT_DOOR_669+/, EventFlag.None,  0x4200, 0x01ED, 0x01);
immutable DoorEntryA DoorEntry670 = DoorEntryA(null, EventFlag.None,  0xC26C, 0x021B, 0x07);
immutable DoorEntryA DoorEntry671 = DoorEntryA(null, EventFlag.None,  0x0194, 0x01A9, 0x07);
immutable DoorEntryC DoorEntry672 = DoorEntryC(null /+TEXT_DOOR_672+/);
immutable DoorEntryC DoorEntry673 = DoorEntryC(null /+TEXT_DOOR_673+/);
immutable DoorEntryC DoorEntry674 = DoorEntryC(null /+TEXT_DOOR_674+/);
immutable DoorEntryA DoorEntry675 = DoorEntryA(null /+TEXT_DOOR_675+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x02DB, 0x02B9, 0x00);
immutable DoorEntryC DoorEntry676 = DoorEntryC(null /+TEXT_DOOR_676+/);
immutable DoorEntryC DoorEntry677 = DoorEntryC(null /+TEXT_DOOR_677+/);
immutable DoorEntryC DoorEntry678 = DoorEntryC(null /+TEXT_DOOR_678+/);
immutable DoorEntryC DoorEntry679 = DoorEntryC(null /+TEXT_DOOR_679+/);
immutable DoorEntryC DoorEntry680 = DoorEntryC(null /+TEXT_DOOR_680+/);
immutable DoorEntryC DoorEntry681 = DoorEntryC(null /+TEXT_DOOR_681+/);
immutable DoorEntryA DoorEntry682 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x035C, 0x04);
immutable DoorEntryA DoorEntry683 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC478, 0x03AB, 0x04);
immutable DoorEntryA DoorEntry684 = DoorEntryA(null, EventFlag.None,  0xC47D, 0x035C, 0x04);
immutable DoorEntryA DoorEntry685 = DoorEntryA(null /+TEXT_DOOR_685+/, EventFlag.HAVE_STOIC_CLUB_RESERVATION | EVENT_FLAG_UNSET,  0xC47A, 0x03D9, 0x01);
immutable DoorEntryA DoorEntry686 = DoorEntryA(null /+TEXT_DOOR_686+/, EventFlag.None,  0xC4AD, 0x037C, 0x04);
immutable DoorEntryA DoorEntry687 = DoorEntryA(null, EventFlag.None,  0xC4BD, 0x035C, 0x04);
immutable DoorEntryA DoorEntry688 = DoorEntryA(null, EventFlag.None,  0xC4CD, 0x03D4, 0x04);
immutable DoorEntryA DoorEntry689 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC4AD, 0x035C, 0x04);
immutable DoorEntryA DoorEntry690 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC4A9, 0x0390, 0x04);
immutable DoorEntryA DoorEntry691 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC4A9, 0x03D0, 0x04);
immutable DoorEntryA DoorEntry692 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC4CD, 0x0354, 0x04);
immutable DoorEntryA DoorEntry693 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC4CD, 0x0394, 0x04);
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
immutable DoorEntryA DoorEntry704 = DoorEntryA(null /+TEXT_DOOR_704+/, EventFlag.None,  0x84AD, 0x0362, 0x01);
immutable DoorEntryA DoorEntry705 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x039C, 0x07);
immutable DoorEntryA DoorEntry706 = DoorEntryA(null, EventFlag.None,  0xC470, 0x03F3, 0x0F);
immutable DoorEntryA DoorEntry707 = DoorEntryA(null, EventFlag.None,  0xC478, 0x03FB, 0x0F);
immutable DoorEntryA DoorEntry708 = DoorEntryA(null, EventFlag.None,  0xC49D, 0x03DC, 0x07);
immutable DoorEntryA DoorEntry709 = DoorEntryA(null, EventFlag.None,  0x849D, 0x0343, 0x0F);
immutable DoorEntryA DoorEntry710 = DoorEntryA(null, EventFlag.None,  0x0154, 0x0297, 0x0A);
immutable DoorEntryA DoorEntry711 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x0154, 0x0268, 0x0A);
immutable DoorEntryA DoorEntry712 = DoorEntryA(null, EventFlag.None,  0x0155, 0x02C2, 0x0F);
immutable DoorEntryA DoorEntry713 = DoorEntryA(null, EventFlag.None,  0x8449, 0x038B, 0x0F);
immutable DoorEntryA DoorEntry714 = DoorEntryA(null, EventFlag.None,  0x845C, 0x0384, 0x0F);
immutable DoorEntryA DoorEntry715 = DoorEntryA(null, EventFlag.None,  0xC45C, 0x03BB, 0x0F);
immutable DoorEntryA DoorEntry716 = DoorEntryA(null /+TEXT_DOOR_716+/, EventFlag.None,  0x0155, 0x0237, 0x0A);
immutable DoorEntryA DoorEntry717 = DoorEntryA(null, EventFlag.None,  0x0448, 0x0398, 0x07);
immutable DoorEntryA DoorEntry718 = DoorEntryA(null, EventFlag.None,  0x0448, 0x03A8, 0x07);
immutable DoorEntryA DoorEntry719 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x0163, 0x0362, 0x0A);
immutable DoorEntryA DoorEntry720 = DoorEntryA(null, EventFlag.None,  0xC457, 0x0379, 0x01);
immutable DoorEntryA DoorEntry721 = DoorEntryA(null /+TEXT_DOOR_647+/, EventFlag.None,  0x0152, 0x02EE, 0x0A);
immutable DoorEntryA DoorEntry722 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x0163, 0x0376, 0x0A);
immutable DoorEntryA DoorEntry723 = DoorEntryA(null, EventFlag.None,  0x84AD, 0x03E3, 0x07);
immutable DoorEntryA DoorEntry724 = DoorEntryA(null, EventFlag.None,  0x8455, 0x0347, 0x0F);
immutable DoorEntryA DoorEntry725 = DoorEntryA(null /+TEXT_DOOR_725+/, EventFlag.None,  0x0163, 0x0382, 0x0A);
immutable DoorEntryA DoorEntry726 = DoorEntryA(null, EventFlag.None,  0x04A8, 0x03AD, 0x07);
immutable DoorEntryA DoorEntry727 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x0163, 0x0396, 0x0A);
immutable DoorEntryA DoorEntry728 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x0163, 0x03A2, 0x0A);
immutable DoorEntryA DoorEntry729 = DoorEntryA(null, EventFlag.None,  0x015B, 0x036A, 0x0A);
immutable DoorEntryC DoorEntry730 = DoorEntryC(null /+TEXT_DOOR_730+/);
immutable DoorEntryC DoorEntry731 = DoorEntryC(null /+TEXT_DOOR_731+/);
immutable DoorEntryC DoorEntry732 = DoorEntryC(null /+TEXT_DOOR_732+/);
immutable DoorEntryC DoorEntry733 = DoorEntryC(null /+TEXT_DOOR_733+/);
immutable DoorEntryC DoorEntry734 = DoorEntryC(null /+TEXT_DOOR_734+/);
immutable DoorEntryC DoorEntry735 = DoorEntryC(null /+TEXT_DOOR_735+/);
immutable DoorEntryC DoorEntry736 = DoorEntryC(null /+TEXT_DOOR_736+/);
immutable DoorEntryC DoorEntry737 = DoorEntryC(null /+TEXT_DOOR_737+/);
immutable DoorEntryA DoorEntry738 = DoorEntryA(null /+TEXT_DOOR_738+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x015B, 0x038B, 0x00);
immutable DoorEntryA DoorEntry739 = DoorEntryA(null /+TEXT_DOOR_739+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x015B, 0x03AB, 0x00);
immutable DoorEntryC DoorEntry740 = DoorEntryC(null /+TEXT_DOOR_740+/);
immutable DoorEntryC DoorEntry741 = DoorEntryC(null /+TEXT_DOOR_741+/);
immutable DoorEntryC DoorEntry742 = DoorEntryC(null /+TEXT_DOOR_742+/);
immutable DoorEntryA DoorEntry743 = DoorEntryA(null, EventFlag.None,  0xC411, 0x03F8, 0x01);
immutable DoorEntryA DoorEntry744 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3C9, 0x0370, 0x01);
immutable DoorEntryA DoorEntry745 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3F9, 0x03B4, 0x01);
immutable DoorEntryA DoorEntry746 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3E9, 0x0370, 0x01);
immutable DoorEntryA DoorEntry747 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3D9, 0x03B0, 0x01);
immutable DoorEntryA DoorEntry748 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.UNKNOWN_28C | EVENT_FLAG_UNSET,  0xC396, 0x021C, 0x01);
immutable DoorEntryA DoorEntry749 = DoorEntryA(null /+TEXT_DOOR_001+/, EventFlag.None,  0x82B1, 0x0103, 0x01);
immutable DoorEntryA DoorEntry750 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x01D4, 0x0220, 0x01);
immutable DoorEntryA DoorEntry751 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x01E4, 0x0250, 0x01);
immutable DoorEntryA DoorEntry752 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x01F4, 0x0228, 0x01);
immutable DoorEntryA DoorEntry753 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x01EC, 0x0218, 0x01);
immutable DoorEntryA DoorEntry754 = DoorEntryA(null, EventFlag.None,  0x8411, 0x03C7, 0x01);
immutable DoorEntryA DoorEntry755 = DoorEntryA(null, EventFlag.None,  0xC411, 0x0368, 0x01);
immutable DoorEntryA DoorEntry756 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0x01BA, 0x0239, 0x01);
immutable DoorEntryA DoorEntry757 = DoorEntryA(null, EventFlag.None,  0x023A, 0x024E, 0x05);
immutable DoorEntryA DoorEntry758 = DoorEntryA(null, EventFlag.None,  0xC436, 0x023C, 0x01);
immutable DoorEntryA DoorEntry759 = DoorEntryA(null, EventFlag.None,  0x020A, 0x021D, 0x01);
immutable DoorEntryA DoorEntry760 = DoorEntryA(null, EventFlag.None,  0x0437, 0x0221, 0x05);
immutable DoorEntryA DoorEntry761 = DoorEntryA(null, EventFlag.None,  0x0437, 0x0234, 0x05);
immutable DoorEntryA DoorEntry762 = DoorEntryA(null, EventFlag.None,  0x0397, 0x01F1, 0x05);
immutable DoorEntryA DoorEntry763 = DoorEntryA(null, EventFlag.None,  0x02B7, 0x012E, 0x05);
immutable DoorEntryA DoorEntry764 = DoorEntryA(null, EventFlag.None,  0x8399, 0x01E7, 0x01);
immutable DoorEntryA DoorEntry765 = DoorEntryA(null /+TEXT_DOOR_765+/, EventFlag.DEFEATED_SANCTUARY_BOSS_6 | EVENT_FLAG_UNSET,  0x0306, 0x01C5, 0x01);
immutable DoorEntryA DoorEntry766 = DoorEntryA(null, EventFlag.None,  0x047A, 0x0216, 0x05);
immutable DoorEntryA DoorEntry767 = DoorEntryA(null, EventFlag.None,  0xC42D, 0x03E8, 0x01);
immutable DoorEntryA DoorEntry768 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3D9, 0x0334, 0x01);
immutable DoorEntryA DoorEntry769 = DoorEntryA(null, EventFlag.None,  0xC3B9, 0x0334, 0x01);
immutable DoorEntryA DoorEntry770 = DoorEntryA(null, EventFlag.None,  0xC36B, 0x03E6, 0x01);
immutable DoorEntryA DoorEntry771 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3F9, 0x0334, 0x01);
immutable DoorEntryA DoorEntry772 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x8139, 0x02C7, 0x01);
immutable DoorEntryA DoorEntry773 = DoorEntryA(null /+TEXT_DOOR_773+/, EventFlag.UNKNOWN_2F4,  0xC1A9, 0x033C, 0x01);
immutable DoorEntryC DoorEntry774 = DoorEntryC(null /+TEXT_DOOR_774+/);
immutable DoorEntryB DoorEntry775 = DoorEntryB(EventFlag.SCARABA_REACHED | EVENT_FLAG_UNSET, null /+TEXT_DOOR_775+/);
immutable DoorEntryB DoorEntry776 = DoorEntryB(EventFlag.UNKNOWN_098 | EVENT_FLAG_UNSET, null /+TEXT_DOOR_776+/);
immutable DoorEntryB DoorEntry777 = DoorEntryB(EventFlag.UNKNOWN_098 | EVENT_FLAG_UNSET, null /+TEXT_DOOR_777+/);
immutable DoorEntryB DoorEntry778 = DoorEntryB(EventFlag.UNKNOWN_098 | EVENT_FLAG_UNSET, null /+TEXT_DOOR_778+/);
immutable DoorEntryB DoorEntry779 = DoorEntryB(EventFlag.UNKNOWN_098 | EVENT_FLAG_UNSET, null /+TEXT_DOOR_779+/);
immutable DoorEntryA DoorEntry780 = DoorEntryA(null /+TEXT_DOOR_780+/, EventFlag.None,  0x0205, 0x0099, 0x01);
immutable DoorEntryA DoorEntry781 = DoorEntryA(null, EventFlag.None,  0x0200, 0x00CC, 0x01);
immutable DoorEntryA DoorEntry782 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x01F8, 0x00B8, 0x01);
immutable DoorEntryA DoorEntry783 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x0204, 0x00AC, 0x01);
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
immutable DoorEntryA DoorEntry807 = DoorEntryA(null /+TEXT_DOOR_807+/, EventFlag.UNKNOWN_15C | EVENT_FLAG_UNSET,  0x81BD, 0x0283, 0x01);
immutable DoorEntryA DoorEntry808 = DoorEntryA(null, EventFlag.None,  0xC2B9, 0x0214, 0x01);
immutable DoorEntryA DoorEntry809 = DoorEntryA(null, EventFlag.None,  0x82D9, 0x0203, 0x01);
immutable DoorEntryA DoorEntry810 = DoorEntryA(null, EventFlag.None,  0xC1A9, 0x02AC, 0x01);
immutable DoorEntryA DoorEntry811 = DoorEntryA(null, EventFlag.None,  0x02F9, 0x020A, 0x05);
immutable DoorEntryA DoorEntry812 = DoorEntryA(null, EventFlag.None,  0x81BD, 0x02E3, 0x01);
immutable DoorEntryA DoorEntry813 = DoorEntryA(null, EventFlag.None,  0xC2F9, 0x0210, 0x01);
immutable DoorEntryA DoorEntry814 = DoorEntryA(null /+TEXT_DOOR_814+/, EventFlag.None,  0x02AC, 0x00D7, 0x01);
immutable ushort DoorEntry815 = 0x015B;
immutable DoorEntryC DoorEntry816 = DoorEntryC(null /+TEXT_DOOR_816+/);
immutable DoorEntryC DoorEntry817 = DoorEntryC(null /+TEXT_DOOR_817+/);
immutable DoorEntryA DoorEntry818 = DoorEntryA(null, EventFlag.None,  0x4048, 0x0025, 0x01);
immutable DoorEntryA DoorEntry819 = DoorEntryA(null, EventFlag.None,  0x004A, 0x0035, 0x01);
immutable DoorEntryA DoorEntry820 = DoorEntryA(null, EventFlag.None,  0x004A, 0x002D, 0x01);
immutable DoorEntryA DoorEntry821 = DoorEntryA(null, EventFlag.None,  0x4048, 0x003D, 0x01);
immutable DoorEntryA DoorEntry822 = DoorEntryA(null, EventFlag.None,  0xC34A, 0x02F8, 0x01);
immutable DoorEntryA DoorEntry823 = DoorEntryA(null, EventFlag.None,  0x8055, 0x020B, 0x01);
immutable DoorEntryA DoorEntry824 = DoorEntryA(null /+TEXT_DOOR_824+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x0270, 0x00A7, 0x01);
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
immutable DoorEntryA DoorEntry839 = DoorEntryA(null /+TEXT_DOOR_839+/, EventFlag.UNKNOWN_154 | EVENT_FLAG_UNSET,  0x000A, 0x0251, 0x00);
immutable DoorEntryC DoorEntry840 = DoorEntryC(null /+TEXT_DOOR_840+/);
immutable DoorEntryC DoorEntry841 = DoorEntryC(null /+TEXT_DOOR_841+/);
immutable DoorEntryC DoorEntry842 = DoorEntryC(null /+TEXT_DOOR_842+/);
immutable DoorEntryC DoorEntry843 = DoorEntryC(null /+TEXT_DOOR_843+/);
immutable DoorEntryC DoorEntry844 = DoorEntryC(null /+TEXT_DOOR_844+/);
immutable DoorEntryC DoorEntry845 = DoorEntryC(null /+TEXT_DOOR_845+/);
immutable DoorEntryC DoorEntry846 = DoorEntryC(null /+TEXT_DOOR_846+/);
immutable DoorEntryC DoorEntry847 = DoorEntryC(null /+TEXT_DOOR_847+/);
immutable DoorEntryC DoorEntry848 = DoorEntryC(null /+TEXT_DOOR_848+/);
immutable DoorEntryC DoorEntry849 = DoorEntryC(null /+TEXT_DOOR_849+/);
immutable DoorEntryC DoorEntry850 = DoorEntryC(null /+TEXT_DOOR_850+/);
immutable DoorEntryC DoorEntry851 = DoorEntryC(null /+TEXT_DOOR_851+/);
immutable DoorEntryC DoorEntry852 = DoorEntryC(null /+TEXT_DOOR_852+/);
immutable DoorEntryC DoorEntry853 = DoorEntryC(null /+TEXT_DOOR_853+/);
immutable DoorEntryC DoorEntry854 = DoorEntryC(null /+TEXT_DOOR_854+/);
immutable DoorEntryC DoorEntry855 = DoorEntryC(null /+TEXT_DOOR_855+/);
immutable DoorEntryC DoorEntry856 = DoorEntryC(null /+TEXT_DOOR_856+/);
immutable DoorEntryC DoorEntry857 = DoorEntryC(null /+TEXT_DOOR_857+/);
immutable DoorEntryC DoorEntry858 = DoorEntryC(null /+TEXT_DOOR_858+/);
immutable DoorEntryC DoorEntry859 = DoorEntryC(null /+TEXT_DOOR_859+/);
immutable DoorEntryC DoorEntry860 = DoorEntryC(null /+TEXT_DOOR_860+/);
immutable DoorEntryC DoorEntry861 = DoorEntryC(null /+TEXT_DOOR_861+/);
immutable DoorEntryC DoorEntry862 = DoorEntryC(null /+TEXT_DOOR_862+/);
immutable DoorEntryC DoorEntry863 = DoorEntryC(null /+TEXT_DOOR_863+/);
immutable DoorEntryC DoorEntry864 = DoorEntryC(null /+TEXT_DOOR_864+/);
immutable DoorEntryC DoorEntry865 = DoorEntryC(null /+TEXT_DOOR_865+/);
immutable DoorEntryC DoorEntry866 = DoorEntryC(null /+TEXT_DOOR_866+/);
immutable DoorEntryC DoorEntry867 = DoorEntryC(null /+TEXT_DOOR_867+/);
immutable DoorEntryC DoorEntry868 = DoorEntryC(null /+TEXT_DOOR_868+/);
immutable DoorEntryC DoorEntry869 = DoorEntryC(null /+TEXT_DOOR_869+/);
immutable DoorEntryC DoorEntry870 = DoorEntryC(null /+TEXT_DOOR_870+/);
immutable DoorEntryC DoorEntry871 = DoorEntryC(null /+TEXT_DOOR_871+/);
immutable DoorEntryC DoorEntry872 = DoorEntryC(null /+TEXT_DOOR_872+/);
immutable DoorEntryC DoorEntry873 = DoorEntryC(null /+TEXT_DOOR_873+/);
immutable DoorEntryC DoorEntry874 = DoorEntryC(null /+TEXT_DOOR_874+/);
immutable DoorEntryC DoorEntry875 = DoorEntryC(null /+TEXT_DOOR_875+/);
immutable DoorEntryC DoorEntry876 = DoorEntryC(null /+TEXT_DOOR_876+/);
immutable DoorEntryC DoorEntry877 = DoorEntryC(null /+TEXT_DOOR_877+/);
immutable DoorEntryC DoorEntry878 = DoorEntryC(null /+TEXT_DOOR_878+/);
immutable DoorEntryC DoorEntry879 = DoorEntryC(null /+TEXT_DOOR_879+/);
immutable DoorEntryC DoorEntry880 = DoorEntryC(null /+TEXT_DOOR_880+/);
immutable DoorEntryC DoorEntry881 = DoorEntryC(null /+TEXT_DOOR_881+/);
immutable DoorEntryC DoorEntry882 = DoorEntryC(null /+TEXT_DOOR_882+/);
immutable DoorEntryC DoorEntry883 = DoorEntryC(null /+TEXT_DOOR_883+/);
immutable DoorEntryA DoorEntry884 = DoorEntryA(null /+TEXT_DOOR_884+/, EventFlag.None,  0xC00E, 0x0054, 0x01);
immutable DoorEntryA DoorEntry885 = DoorEntryA(null /+TEXT_DOOR_885+/, EventFlag.DEFEATED_SANCTUARY_BOSS_7 | EVENT_FLAG_UNSET,  0x0257, 0x0392, 0x05);
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
immutable DoorEntryA DoorEntry903 = DoorEntryA(null /+TEXT_DOOR_903+/, EventFlag.None,  0x0090, 0x018F, 0x21);
immutable DoorEntryA DoorEntry904 = DoorEntryA(null /+TEXT_DOOR_904+/, EventFlag.None,  0x0371, 0x0232, 0x01);
immutable DoorEntryA DoorEntry905 = DoorEntryA(null, EventFlag.UNKNOWN_099 | EVENT_FLAG_UNSET,  0x0142, 0x0093, 0x01);
immutable DoorEntryA DoorEntry906 = DoorEntryA(null, EventFlag.None,  0x4030, 0x0013, 0x01);
immutable DoorEntryA DoorEntry907 = DoorEntryA(null /+TEXT_DOOR_907+/, EventFlag.UNKNOWN_289 | EVENT_FLAG_UNSET,  0xC072, 0x01F4, 0x01);
immutable DoorEntryA DoorEntry908 = DoorEntryA(null, EventFlag.None,  0xC4BA, 0x0310, 0x01);
immutable DoorEntryA DoorEntry909 = DoorEntryA(null, EventFlag.None,  0x800E, 0x0037, 0x01);
immutable DoorEntryC DoorEntry910 = DoorEntryC(null /+TEXT_DOOR_910+/);
immutable DoorEntryC DoorEntry911 = DoorEntryC(null /+TEXT_DOOR_911+/);
immutable DoorEntryC DoorEntry912 = DoorEntryC(null /+TEXT_DOOR_912+/);
immutable DoorEntryA DoorEntry913 = DoorEntryA(null, EventFlag.None,  0xC011, 0x02F4, 0x01);
immutable DoorEntryA DoorEntry914 = DoorEntryA(null /+TEXT_DOOR_004+/, EventFlag.None,  0x8351, 0x0167, 0x01);
immutable DoorEntryA DoorEntry915 = DoorEntryA(null /+TEXT_DOOR_915+/, EventFlag.DEFEATED_SANCTUARY_BOSS_8 | EVENT_FLAG_UNSET,  0x04D3, 0x0319, 0x01);
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
immutable DoorEntryA DoorEntry943 = DoorEntryA(null /+TEXT_DOOR_943+/, EventFlag.None,  0x40FE, 0x0211, 0x01);
immutable DoorEntryA DoorEntry944 = DoorEntryA(null, EventFlag.None,  0x03B8, 0x006C, 0x0E);
immutable DoorEntryA DoorEntry945 = DoorEntryA(null, EventFlag.None,  0x02EC, 0x0054, 0x0E);
immutable DoorEntryA DoorEntry946 = DoorEntryA(null, EventFlag.None,  0x031C, 0x0034, 0x0E);
immutable DoorEntryA DoorEntry947 = DoorEntryA(null, EventFlag.None,  0x0398, 0x0070, 0x0E);
immutable DoorEntryA DoorEntry948 = DoorEntryA(null, EventFlag.None,  0x02F4, 0x0018, 0x01);
immutable DoorEntryA DoorEntry949 = DoorEntryA(null, EventFlag.None,  0xC3FA, 0x03F5, 0x04);
immutable DoorEntryA DoorEntry950 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3EA, 0x03B9, 0x04);
immutable DoorEntryA DoorEntry951 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3DA, 0x03F9, 0x04);
immutable DoorEntryA DoorEntry952 = DoorEntryA(null /+TEXT_DOOR_367+/, EventFlag.None,  0xC3CA, 0x03B9, 0x04);
immutable DoorEntryA DoorEntry953 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x824C, 0x02FD, 0x0A);
immutable DoorEntryA DoorEntry954 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x8248, 0x02ED, 0x0A);
immutable DoorEntryA DoorEntry955 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0x8250, 0x0281, 0x0A);
immutable DoorEntryA DoorEntry956 = DoorEntryA(null /+TEXT_DOOR_711+/, EventFlag.None,  0x020C, 0x0291, 0x0A);
immutable DoorEntryC DoorEntry957 = DoorEntryC(null /+TEXT_DOOR_957+/);
immutable DoorEntryC DoorEntry958 = DoorEntryC(null /+TEXT_DOOR_958+/);
immutable DoorEntryC DoorEntry959 = DoorEntryC(null /+TEXT_DOOR_959+/);
immutable DoorEntryC DoorEntry960 = DoorEntryC(null /+TEXT_DOOR_960+/);
immutable DoorEntryC DoorEntry961 = DoorEntryC(null /+TEXT_DOOR_961+/);
immutable DoorEntryC DoorEntry962 = DoorEntryC(null /+TEXT_DOOR_962+/);
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
immutable DoorEntryA DoorEntry973 = DoorEntryA(null /+TEXT_DOOR_101+/, EventFlag.None,  0x01DC, 0x03DC, 0x0A);
immutable DoorEntryA DoorEntry974 = DoorEntryA(null, EventFlag.None,  0x0207, 0x03DA, 0x0A);
immutable DoorEntryC DoorEntry975 = DoorEntryC(null /+TEXT_DOOR_975+/);
immutable DoorEntryC DoorEntry976 = DoorEntryC(null /+TEXT_DOOR_976+/);
immutable DoorEntryC DoorEntry977 = DoorEntryC(null /+TEXT_NO_PROBLEM_HERE+/);

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
	NPC(NPCType.Person, OverworldSprite.Ness, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Down, ActionScript.Unknown605, EventFlag.FLG_ONET_GUARDSHARK_DISAPPEAR, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0001+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Right, ActionScript.Unknown598, EventFlag.FLG_ONET_SHARK_C_DISAPPEAR, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0002+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0003+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0004+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0005+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0006+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Up, ActionScript.Unknown598, EventFlag.UNKNOWN_2B9, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0007+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0008+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0009+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0010+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0011+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MOM, Direction.Down, ActionScript.Unknown037, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0014+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MOM, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0015+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NESS_DOG_SLEEPING, Direction.Down, ActionScript.Unknown627, EventFlag.UNKNOWN_013, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0016+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_12D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0017+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.King, Direction.Right, ActionScript.Unknown018, EventFlag.UNKNOWN_130, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0016+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Down, ActionScript.Unknown045, EventFlag.UNKNOWN_136, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0017+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRACY, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_213, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0020+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown040, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0021+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.KNOCKING_ON_DOOR, Direction.Left, ActionScript.Unknown038, EventFlag.UNKNOWN_127, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DRAPES_CLOSED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DRAPES_CLOSED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRACY, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_1D9, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0025+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.NESS_SLEEPING, Direction.Down, ActionScript.Unknown624, EventFlag.UNKNOWN_1DD, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ZZZS, Direction.Down, ActionScript.Unknown628, EventFlag.UNKNOWN_1DD, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DRAPES_CLOSED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_CLOSED, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRACY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_212, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0030+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DRAPES_CLOSED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_CLOSED, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0033+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0034+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0035+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FRANK, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0036+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0037+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FRANK, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HINT_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0039+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0040+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0041+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0042+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0043+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ALOYSIUS_MINCH, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_025, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0044+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LARDNA_MINCH, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_2E6, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0045+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FLY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_12F, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0046+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Picky, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0047+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0048+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_023, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0052+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Picky, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_022, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0053+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_OPEN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.YELLOW_DRAPES_CLOSED, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0058+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0059+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_06A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0062+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_06A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0063+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Left, ActionScript.Unknown010, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0064+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_06A, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0065+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_06A, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0066+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAPTAIN_STRONG, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_1C2, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0067+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.THICK_GLASSES_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0068+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0069+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_027, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0070+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAPTAIN_STRONG, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_1C1, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0067+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0072+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_121, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0073+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_122, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0074+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_123, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0075+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_124, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0076+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_125, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0077+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0078+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0079+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0080+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0081+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0082+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0083+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0084+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0085+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MAYOR_PIRKLE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0086+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0087+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0088+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0089+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0090+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0091+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DERBY_HAT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0092+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0093+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE_NO_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0094+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_200, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0095+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0096+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0097+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0098+/, null /+TEXT_NPC_0098_ALT+/),
	NPC(NPCType.Person, OverworldSprite.OLD_FAT_GUY_WITH_HAT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0099+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0100+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Up, ActionScript.Unknown250, EventFlag.UNKNOWN_067, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0102+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0103+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0104+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Up, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0105+/, null /+TEXT_NPC_0105_ALT+/),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_DOOR_681+/, null /+TEXT_NPC_0106_ALT+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0107+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0108+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0109+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0110+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0111+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIG_SMILE_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0112+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0113+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0114+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0115+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HAPPY_GIRL_IN_RED, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0116+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0117+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0118+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_01F, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0119+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DERBY_HAT, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0120+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DETECTIVE_HAT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0121+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Left, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0122+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown863, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PickySitting, Direction.Left, ActionScript.Unknown055, EventFlag.UNKNOWN_1D2, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0124+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_068, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0125+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_024, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0126+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Left, ActionScript.Unknown607, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0127+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRAVELLING_ENTERTAINER, Direction.Down, ActionScript.Unknown608, EventFlag.UNKNOWN_04E, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0128+/, null /+TEXT_NPC_0128_ALT+/),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Right, ActionScript.Unknown607, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0129+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HELPFUL_MOLE, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_278, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0130+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Left, ActionScript.Unknown607, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0131+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Right, ActionScript.Unknown607, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0132+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Right, ActionScript.Unknown608, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0133+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Left, ActionScript.Unknown609, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0134+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Right, ActionScript.Unknown609, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0135+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Left, ActionScript.Unknown609, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0136+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Down, ActionScript.Unknown607, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0137+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Down, ActionScript.Unknown608, EventFlag.UNKNOWN_177, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0138+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown610, EventFlag.UNKNOWN_063, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0139+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Right, ActionScript.Unknown607, EventFlag.UNKNOWN_063, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0140+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRUMPET_PERSON, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_278, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0141+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_16B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0142+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SkatePunk, Direction.Up, ActionScript.Unknown609, EventFlag.UNKNOWN_16C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0143+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Up, ActionScript.Unknown606, EventFlag.TWOSON_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0144+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.TWOSON_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0145+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FRANK, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_084, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0146+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown007, EventFlag.UNKNOWN_06C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_DOOR_006+/, null /+TEXT_NPC_0147_ALT+/),
	NPC(NPCType.Person, OverworldSprite.MOM, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1DA, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0148+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0149+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0150+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0151+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0152+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0153+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0154+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0155+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0156+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0157+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0158+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0159+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0160+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Up, ActionScript.Unknown629, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0161+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRAVELLING_ENTERTAINER, Direction.Right, ActionScript.Unknown608, EventFlag.UNKNOWN_04E, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0162+/, null /+TEXT_NPC_0128_ALT+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Right, ActionScript.Unknown012, EventFlag.FLG_WIN_FRANK, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0163+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAPTAIN_STRONG, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HAPPY_GIRL_IN_RED, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0166+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0167+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.WHITE_DELIVERY_TRUCK, Direction.Left, ActionScript.Unknown585, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DELIVERY_TRUCK, Direction.Left, ActionScript.Unknown586, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_069, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown862, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DONT_ENTER_SIGN, Direction.Down, ActionScript.Unknown007, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0185+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown584, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1DC, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1DC, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_BARRIER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0191+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0192+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.OVAL_CLOUD, Direction.Down, ActionScript.Unknown784, EventFlag.UNKNOWN_1A6, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.METEOR, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_DOOR_150+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_CAR, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_CAR, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.POLICE_CAR, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_1D5, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.FRANKYSTEIN_MK_II, Direction.Down, ActionScript.Unknown008, EventFlag.FLG_WIN_FRANK, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0202+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown057, EventFlag.UNKNOWN_020, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown058, EventFlag.UNKNOWN_021, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown059, EventFlag.UNKNOWN_132, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Right, ActionScript.Unknown060, EventFlag.UNKNOWN_133, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIER_X_AGERATE, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_134, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0207+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.EVIL_MANI_MANI, Direction.Down, ActionScript.Unknown010, EventFlag.TWOSON_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0208+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_1, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0209+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KING_IN_THE_FLASHBACK, Direction.Right, ActionScript.Unknown699, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PAST_BABY_CRADLE, Direction.Down, ActionScript.Unknown694, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0212+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PAULAS_MOTHER, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0213+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0214+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0215+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HAPPY_GIRL_IN_RED, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0216+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PAULAS_FATHER, Direction.Right, ActionScript.Unknown221, EventFlag.UNKNOWN_076, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0217+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAT, Direction.Right, ActionScript.Unknown013, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0218+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_27E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0219+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_KID, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_02A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0220+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Right, ActionScript.Unknown014, EventFlag.UNKNOWN_153, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0221+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown014, EventFlag.UNKNOWN_153, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0222+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TOOLS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CAN_TENDA_VILLAGE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_029, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0226+/, null /+TEXT_NPC_0226_ALT+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0227+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_029, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0228+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_135, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0229+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0230+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Left, ActionScript.Unknown108, EventFlag.UNKNOWN_02B, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0229+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0232+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DETECTIVE_HAT, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0233+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0234+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0235+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0236+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0237+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0238+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0239+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0240+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0241+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0242+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0243+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0244+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0245+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_2EF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0246+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_02B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0247+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0248+/, null /+TEXT_NPC_0248_ALT+/),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0249+/, null /+TEXT_NPC_0249_ALT+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_DRUMMER, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0250+/, null /+TEXT_NPC_0250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_BASS_PLAYER, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0251+/, null /+TEXT_NPC_0251_ALT+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_SAX_PLAYER, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0252+/, null /+TEXT_NPC_0252_ALT+/),
	NPC(NPCType.Person, OverworldSprite.POOCHYFUD, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0253+/, null /+TEXT_NPC_0253_ALT+/),
	NPC(NPCType.Person, OverworldSprite.EVERDRED, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_270, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0254+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_STRIPED_APRON, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0255+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0256+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0257+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Right, ActionScript.Unknown605, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0260+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0261+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0262+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.LITTLE_MUSHROOM, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0264+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0265+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0266+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0267+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0268+/, null /+TEXT_NPC_0268_ALT+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0269+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0270+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0271+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0272+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0273+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BUS_DRIVER, Direction.Left, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0274+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.VENUS_MOTHER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0277+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HINT_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0278+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0279+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0279+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0281+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0282+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0283+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0218+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0285+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.THICK_GLASSES_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0288+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0289+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0290+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0291+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0292+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0293+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0294+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.THICK_GLASSES_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0295+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0296+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0297+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0298+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0299+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0300+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0301+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0303+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0304+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DETECTIVE_HAT, Direction.Left, ActionScript.Unknown017, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0305+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Left, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0306+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Left, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0307+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0308+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0309+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0310+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0311+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0312+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0313+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0314+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0315+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0316+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ARAB_MR_T, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0317+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0318+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_KID, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_02A, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0319+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_135, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0320+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PAULAS_FATHER, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_076, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0217+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0322+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_263, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0324+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0325+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0326+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0327+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0328+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_225, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0329+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown605, EventFlag.THREED_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0330+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Right, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0331+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0332+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0333+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EVERDRED, Direction.Right, ActionScript.Unknown647, EventFlag.UNKNOWN_264, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_02A, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0335+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_02A, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0336+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAT_ASLEEP, Direction.Down, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0338+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0339+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Left, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0340+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Down, ActionScript.Unknown016, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0341+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0342+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HELPFUL_MOLE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0343+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown087, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown088, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown089, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown090, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown085, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Left, ActionScript.Unknown086, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0352+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CROSSROAD_SIGNS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0356+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUY_IN_COOL_RED_CAR, Direction.Right, ActionScript.Unknown588, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0357+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.WHITE_DELIVERY_TRUCK, Direction.Right, ActionScript.Unknown589, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BICYCLE, Direction.Down, ActionScript.Unknown864, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown590, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.APPLE_KID_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0361+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ORANGE_KID_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0365+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown867, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0367+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BURGLIN_PARK_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0369+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BANANAS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BANANAS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.RUNAWAY_5_BUS, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_135, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0373+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.RUNAWAY_5_BUS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_077, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0373+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.EVIL_MANI_MANI, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0375+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_CARPAINTER, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0376+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0377+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0378+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0379+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0380+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0381+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0382+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0383+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0384+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_15F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0385+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_160, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0386+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_161, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0387+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_162, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0388+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown281, EventFlag.UNKNOWN_163, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0389+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown283, EventFlag.UNKNOWN_164, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0390+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown282, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0391+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown280, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0392+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown279, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0393+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0394+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0395+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0396+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0397+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0398+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0399+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0400+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0401+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0402+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0403+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0404+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.VENUS_MOTHER, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0405+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0408+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0409+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0410+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_02C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0411+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_043, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0412+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0413+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0414+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0415+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0416+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRUMPET_PERSON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0417+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0418+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLUE_COW, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0419+/, null /+TEXT_NPC_0419_ALT+/),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Up, ActionScript.Unknown134, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0420+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0421+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0422+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0423+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0424+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0265+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_CARPAINTER, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0426+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HELPFUL_MOLE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0427+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BICYCLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0432+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0433+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BANANAS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0435+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CELL_DOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_00D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0436+/, null /+TEXT_NPC_0436_ALT+/),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown240, EventFlag.UNKNOWN_00D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0436+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TeddyBearParty, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_00D, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Up, ActionScript.Unknown273, EventFlag.UNKNOWN_02D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0439+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_02D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INSANE_CULTIST, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_02D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SPITEFUL_CROW, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_02D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0443+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0444+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_044, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0445+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown865, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown866, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HELPFUL_MOLE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0448+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CROSSROAD_SIGNS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0449+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PENCIL_STATUE, Direction.Down, ActionScript.Unknown107, EventFlag.UNKNOWN_11C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0450+/, null /+TEXT_NPC_0450_ALT+/),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_2, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0451+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NessLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0456+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_305, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0457+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0458+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_305, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0459+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0460+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0461+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0462+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0463+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0464+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0460+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0461+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0463+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0463+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0462+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0470+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0471+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0472+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_GLUED_TO_FLOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0463+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZombieLyingDown, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0474+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0475+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0476+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_030, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0477+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_030, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0478+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_21D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_DOOR_340+/, null /+TEXT_NPC_0479_ALT+/),
	NPC(NPCType.Object, OverworldSprite.SHADOW, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_030, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0480+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BROKEN_PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_02F, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0481+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SKY_RUNNER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_030, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0480+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown605, EventFlag.ZOMBIE_LADY_ACTIVE, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0483+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Right, ActionScript.Unknown078, EventFlag.UNKNOWN_128, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0485+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0486+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Right, ActionScript.Unknown079, EventFlag.UNKNOWN_129, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Left, ActionScript.Unknown010, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0490+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_24D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0491+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Right, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Down, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Right, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Right, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Right, ActionScript.Unknown080, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_DOG, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_12A, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0498+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0499+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0500+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0501+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0502+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0503+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0504+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0505+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_STRIPED_APRON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0255+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0509+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HINT_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0510+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.FOURSIDE_REACHED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0511+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0512+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Down, ActionScript.Unknown012, EventFlag.FOURSIDE_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0513+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown012, EventFlag.FOURSIDE_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0514+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0515+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0516+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_2E4, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0517+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Up, ActionScript.Unknown016, EventFlag.UNKNOWN_2E4, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0518+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0519+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_16E, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0520+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Up, ActionScript.Unknown012, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0521+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.FOURSIDE_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0522+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0523+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0524+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Left, ActionScript.Unknown013, EventFlag.UNKNOWN_2E4, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0525+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_FAT_GUY_WITH_HAT, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0526+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0527+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0528+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0529+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0530+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BOOGY_TENT_EYE, Direction.Down, ActionScript.Unknown592, EventFlag.BOOGEY_TENT_ACTIVE, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BOOGY_TENT_EYE, Direction.Right, ActionScript.Unknown592, EventFlag.BOOGEY_TENT_ACTIVE, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BOOGY_TENT_MOUTH, Direction.Down, ActionScript.Unknown591, EventFlag.BOOGEY_TENT_ACTIVE, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Right, ActionScript.Unknown758, EventFlag.UNKNOWN_12C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0534+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_12C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0535+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_2E4, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0536+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_02E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0537+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Down, ActionScript.Unknown077, EventFlag.UNKNOWN_02E, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0539+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0540+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0541+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_07D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0542+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0470+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0471+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0474+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_DOG, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_12C, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_12C, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_24C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0551+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0552+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0553+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0554+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0555+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0556+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0557+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0558+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0559+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0560+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0561+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0562+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_262, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0563+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_26F, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0564+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Right, ActionScript.Unknown666, EventFlag.UNKNOWN_272, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0475+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Left, ActionScript.Unknown666, EventFlag.UNKNOWN_272, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0476+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown870, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown873, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DONT_ENTER_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0185+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0570+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0580+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown707, EventFlag.UNKNOWN_29D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0582+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0583+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CITY_BUS, Direction.Right, ActionScript.Unknown595, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown094, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown095, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown096, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown097, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_POSSESSOR, Direction.Down, ActionScript.Unknown098, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_25B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0590+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TonyInBed, Direction.Down, ActionScript.Unknown113, EventFlag.TONY_JOINED_YOU, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0591+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.JeffInBed, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_080, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TOOLS, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0594+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0595+/, null /+TEXT_NPC_0595_ALT+/),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0595+/, null /+TEXT_NPC_0596_ALT+/),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0595+/, null /+TEXT_NPC_0597_ALT+/),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0595+/, null /+TEXT_NPC_0598_ALT+/),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0595+/, null /+TEXT_NPC_0599_ALT+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0600+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_BLUE_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0601+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0602+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0603+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0604+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0605+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0606+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0607+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0608+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BubbleMonkey, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_14E, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0609+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0610+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0612+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0613+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0610+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Down, ActionScript.Unknown178, EventFlag.UNKNOWN_17B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0615+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_26C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0616+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Up, ActionScript.Unknown008, EventFlag.UNKNOWN_26D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0617+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BubbleMonkey, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_26D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0618+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAVE_BOY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_00E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0619+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0610+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SHADOW, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2EC, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.INSTANT_REVITALIZING_DEVICE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0622+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SKY_RUNNER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2EC, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SOME_BRUNETTE_KID, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0624+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0625+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Up, ActionScript.Unknown012, EventFlag.UNKNOWN_034, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0626+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0627+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0628+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_034, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0629+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BubbleMonkey, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_276, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0630+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BRICK_ROAD, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_032, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0631+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Right, ActionScript.Unknown284, EventFlag.UNKNOWN_016, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Up, ActionScript.Unknown012, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0633+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TONY_KNEELING, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_14F, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0634+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0635+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0636+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_26E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0637+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0638+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Tony, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0639+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown883, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown868, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PENCIL_STATUE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_261, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0450+/, null /+TEXT_NPC_0645_ALT+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0646+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNDERWATER_NPC, Direction.Down, ActionScript.Unknown769, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TESSIE_WATER_RIPPLES_TOP, Direction.Down, ActionScript.Unknown485, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TESSIE_WATER_RIPPLES_BOTTOM, Direction.Down, ActionScript.Unknown486, EventFlag.UNKNOWN_158, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0657+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0658+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0659+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0660+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Tony, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0661+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Tony, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0662+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TESSIE_WATCHER, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0664+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0665+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0666+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_033, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0668+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0669+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NEW_AGE_RETRO_HIPPIE, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_046, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0670+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ERASER_STATUE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_12B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0671+/, null /+TEXT_NPC_0671_ALT+/),
	NPC(NPCType.Person, OverworldSprite.STARMAN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B2, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0672+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE_NO_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0673+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_200, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0095+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0096+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_4, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0676+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ROPE, Direction.Down, ActionScript.Unknown260, EventFlag.UNKNOWN_137, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MAD_DUCK, Direction.Left, ActionScript.Unknown598, EventFlag.MAD_DUCK_1_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0678+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MAD_DUCK, Direction.Right, ActionScript.Unknown598, EventFlag.MAD_DUCK_2_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0679+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GiftBox, Direction.Up, ActionScript.Unknown601, EventFlag.WORTHLESS_PROTOPLASM_1_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0680+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown601, EventFlag.WORTHLESS_PROTOPLASM_2_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0681+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ROWDY_MOUSE, Direction.Right, ActionScript.Unknown600, EventFlag.ROWDY_MOUSE_1_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0682+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ROWDY_MOUSE, Direction.Up, ActionScript.Unknown600, EventFlag.ROWDY_MOUSE_2_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0683+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0610+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0685+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0686+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0687+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_16E, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0688+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0689+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0690+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_16F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0691+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_170, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0692+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0693+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0694+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.JAR_OF_FLY_HONEY, Direction.Down, ActionScript.Unknown631, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.JAR_OF_FLY_HONEY, Direction.Down, ActionScript.Unknown632, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MASTER_BELCH, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0697+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MR_SATURN_BALL_AND_CHAIN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MR_SATURN_BALL_AND_CHAIN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NessLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.FOUNTAIN_OF_HEALING_MINI, Direction.Down, ActionScript.Unknown693, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_3, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0705+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0706+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_24E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0707+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_FAT_GUY_WITH_HAT, Direction.Down, ActionScript.Unknown606, EventFlag.SATURN_VALLEY_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0708+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown871, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0710+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0712+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0713+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown012, EventFlag.MAGICANT_COMPLETED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0714+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0715+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SATURN_VALLEY_ATM, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0718+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0719+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0720+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0721+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0722+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0723+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0724+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown013, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0725+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown013, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0726+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Right, ActionScript.Unknown008, EventFlag.UNDERWORLD_REACHED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0727+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Up, ActionScript.Unknown010, EventFlag.UNDERWORLD_REACHED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0728+/, null /+TEXT_NPC_0728_ALT+/),
	NPC(NPCType.Person, OverworldSprite.MINER, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_28B, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0729+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown013, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0730+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0731+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_047, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0732+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Right, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0733+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown581, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0734+/, null /+TEXT_NPC_0734_ALT+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown872, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0737+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0738+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0739+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0740+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHASE_DISTORTER, Direction.Down, ActionScript.Unknown286, EventFlag.MAGICANT_COMPLETED, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SPA_SIGN, Direction.Down, ActionScript.Unknown683, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0742+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0743+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown708, EventFlag.UNKNOWN_274, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0744+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown709, EventFlag.UNKNOWN_274, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0745+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown710, EventFlag.UNKNOWN_274, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0746+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0747+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0748+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0749+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MINERS_BROTHER, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0752+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0754+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0755+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0756+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0757+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PALM_TAN_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0758+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SUN_BATHING_GIRL, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0759+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MINER, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_037, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0760+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0761+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_BLONDE_GIRL, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0762+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0763+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0764+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MEXICAN_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0765+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MEXICAN_GUY, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0766+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MEXICAN_GUY, Direction.Up, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0767+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0768+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0769+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MINERS_BROTHER, Direction.Down, ActionScript.Unknown258, EventFlag.UNKNOWN_110, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0770+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0771+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_266, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0772+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_267, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0773+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0774+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0775+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown876, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown875, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0778+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SLOT_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0779+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PILE_OF_BONES, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0780+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PILE_OF_BONES, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0781+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNKNOWN3, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0782+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SESAME_SEED, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0783+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUY_IN_COOL_RED_CAR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0784+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.RED_TRUCK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.WHITE_TRUCK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAGIC_TART_STAND, Direction.Down, ActionScript.Unknown008, EventFlag.MINE_EXPANDED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0788+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DELIVERY_TRUCK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_088, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0790+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0791+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0792+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BIG_DIRT_SCOOPER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_14D, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CONTACT_LENSES, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_181, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0794+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BIG_DIRT_SCOOPER, Direction.Down, ActionScript.Unknown256, EventFlag.UNKNOWN_110, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BIG_DIRT_SCOOPER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_14D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TALAH_RAMA, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_2E9, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0797+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_2E9, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0798+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C4, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0799+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C3, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0800+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C4, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0799+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C3, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0800+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C6, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0803+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0804+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C6, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0803+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C5, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0804+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CA, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0807+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C9, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0808+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CA, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0807+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C9, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0808+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0811+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CF, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0811+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C8, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0813+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C7, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0814+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C8, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0813+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1C7, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0814+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CE, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0817+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CD, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0818+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CE, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0817+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CD, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0818+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Right, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0821+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CC, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0822+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CB, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0823+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0822+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1CB, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0823+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0826+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PENCIL_STATUE, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_204, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0450+/, null /+TEXT_NPC_0827_ALT+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Right, ActionScript.Unknown013, EventFlag.UNKNOWN_265, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0828+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TALAH_RAMA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0829+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MINER, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_036, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0830+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_115, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0831+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_116, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0832+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_117, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0833+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE_NO_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0834+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_200, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0095+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EXIT_MOUSE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0096+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_118, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0837+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_DIGGER, Direction.Down, ActionScript.Unknown600, EventFlag.UNKNOWN_119, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0838+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0839+/, null /+TEXT_NPC_0839_ALT+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_176, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0840+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_176, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0841+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.VENUS, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0842+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0843+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_BASS_PLAYER, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0844+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_DRUMMER, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0845+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0846+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_SAX_PLAYER, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_093, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0847+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0848+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_038, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0849+/, null /+TEXT_NPC_0849_ALT+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_038, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0850+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_2F7, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0851+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BEACH_LADY, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2F7, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0852+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0853+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0854+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0855+/, null /+TEXT_NPC_0855_ALT+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0856+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0857+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0858+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0859+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONOTOLI, Direction.Right, ActionScript.Unknown605, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0860+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0862+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0863+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0864+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PokeyRich, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_08F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0865+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_08F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0866+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_08F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0867+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ALOYSIUS_MINCH, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_08F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0868+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_08E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0869+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0870+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELECTRA, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0871+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONOTOLI, Direction.Up, ActionScript.Unknown700, EventFlag.UNKNOWN_298, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0872+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_00F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0873+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONOTOLI, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2E5, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0872+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0875+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MIGHTY_BEAR, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0876+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SECRET_DOOR_IN_MONOTOLI_BUILDING, Direction.Down, ActionScript.Unknown704, EventFlag.UNKNOWN_298, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0877+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SECRET_DOOR_IN_MONOTOLI_BUILDING, Direction.Down, ActionScript.Unknown007, EventFlag.UNKNOWN_298, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Down, ActionScript.Unknown602, EventFlag.UNKNOWN_165, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0879+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Left, ActionScript.Unknown602, EventFlag.UNKNOWN_166, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0880+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Left, ActionScript.Unknown602, EventFlag.UNKNOWN_167, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0881+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Right, ActionScript.Unknown602, EventFlag.UNKNOWN_168, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0882+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CLUMSY_ROBOT, Direction.Down, ActionScript.Unknown602, EventFlag.UNKNOWN_16A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0883+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0884+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0885+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_DRUMMER, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0886+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_BASS_PLAYER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0887+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_SAX_PLAYER, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_13E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0888+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SENTRY_ROBOT, Direction.Right, ActionScript.Unknown602, EventFlag.UNKNOWN_169, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0889+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0890+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0891+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0894+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Left, ActionScript.Unknown008, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0895+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.JACKIE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0896+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIG_SMILE_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_08B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0897+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIG_SMILE_LADY, Direction.Left, ActionScript.Unknown605, EventFlag.UNKNOWN_08B, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0898+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0899+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0900+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0901+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ALOYSIUS_MINCH, Direction.Down, ActionScript.Unknown606, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0902+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.JUKEBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0903+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0904+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BROKEN_MANI_MANI_STATUE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0905+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0906+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FOURSIDE_MUSEUM_GUY, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_03A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0908+/, null /+TEXT_NPC_0908_ALT+/),
	NPC(NPCType.Person, OverworldSprite.FOURSIDE_MUSEUM_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_03A, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0909+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0910+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PIGTAIL_DARK_HAIRED_GIRL, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0911+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0912+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown878, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0914+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0915+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0916+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0917+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0918+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0919+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.THICK_GLASSES_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0920+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0921+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELEVATOR_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0922+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0923+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0924+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0925+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_STRIPED_APRON, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0926+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0927+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YELLOW_CLOTHES_BLONDE, Direction.Right, ActionScript.Unknown016, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0928+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0929+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0930+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KIDS_MOUSE, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0931+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0932+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0933+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0934+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown880, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Down, ActionScript.Unknown013, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0936+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAGIC_TART_STAND, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.DEPT_STORE_MOOK, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_039, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0941+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GuyInBlueClothes, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0942+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_BLUE_DRESS, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0943+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRUMPET_PERSON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0944+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0945+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0946+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0947+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0948+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0949+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.COP_IN_SUNGLASSES, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0950+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ELECTRA, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_03B, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0951+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EverdredLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0952+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0953+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0954+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Up, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0955+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Up, ActionScript.Unknown605, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0956+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0957+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_03C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0958+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0959+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_13D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0960+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0961+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Right, ActionScript.Unknown605, EventFlag.UNKNOWN_092, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0962+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Up, ActionScript.Unknown013, EventFlag.UNKNOWN_092, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0963+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_252, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0964+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Down, ActionScript.Unknown605, EventFlag.DEFEATED_SANCTUARY_BOSS_5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0965+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Right, ActionScript.Unknown605, EventFlag.DEFEATED_SANCTUARY_BOSS_5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0966+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Right, ActionScript.Unknown008, EventFlag.UNKNOWN_24F, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0967+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HUMAN_CHARRED, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_250, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_0968+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0969+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HINT_MAN, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0970+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown879, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BUS_STOP_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0972+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREETLIGHT, Direction.Down, ActionScript.Unknown877, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.STREET_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAGNET_HILL, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CAN_TENDA_VILLAGE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HELICOPTER, Direction.Down, ActionScript.Unknown711, EventFlag.UNKNOWN_2A0, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HELICOPTER_BLADE, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2A0, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HELICOPTER_BACK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2A0, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SHADOW, Direction.Down, ActionScript.Unknown704, EventFlag.UNKNOWN_2A0, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0993+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.RUNAWAY_5_BUS, Direction.Down, ActionScript.Unknown190, EventFlag.UNKNOWN_13D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_0995+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0996+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0997+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0998+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0999+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1000+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1001+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MAGIC_CAKE_LADY, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_269, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1002+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHIP_CREWMAN, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1003+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHIP_CREWMAN, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1004+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1005+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRUMPET_PERSON, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1006+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOG, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1007+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHIP_CAPTAIN, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1008+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1011+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1012+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BEACH_LADY, Direction.Right, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1013+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1016+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1017+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_SHOPPING_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1018+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Left, ActionScript.Unknown008, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1019+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1020+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1021+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUNG_BLONDE_GUY_IN_BLUE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1024+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BAKER, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1025+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WAITRESS, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1026+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1027+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BRUNETTE_SHOPPING_LADY, Direction.Down, ActionScript.Unknown606, EventFlag.ONETT_REACHED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1028+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FAT_GUY_IN_RED_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1029+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_LADY_WITH_CANE, Direction.Down, ActionScript.Unknown606, EventFlag.ONETT_REACHED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1030+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.ONETT_REACHED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1031+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown885, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_2AF, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1033+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1034+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1035+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1036+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_15A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1037+/, null /+TEXT_NPC_1037_ALT+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_15A, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1038+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown599, EventFlag.UNKNOWN_259, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1039+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown599, EventFlag.UNKNOWN_25A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1040+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1047+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1048+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1049+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1050+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WEIRDO_GUY_IN_SWIM_TRUNKS, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1051+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_BIKINI, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1052+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUY_IN_SWIMMING_SUIT, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1053+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1054+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WEIRDO_GUY_IN_SWIM_TRUNKS, Direction.Left, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1055+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ZOMBIE_LADY, Direction.Left, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1056+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BEACH_LADY, Direction.Down, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1057+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WEIRDO_GUY_IN_SWIM_TRUNKS, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1058+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.I_LOVE_QOWGA_SHIRT_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1059+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1060+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MEXICAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1061+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIRD_ON_PERCH, Direction.Left, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1062+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHIP_CAPTAIN, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1063+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHIP_CREWMAN, Direction.Left, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1064+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHIP_CAPTAIN, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1065+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PALM_TAN_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1066+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAT, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1067+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAT, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1068+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MAGIC_CAKE_LADY, Direction.Down, ActionScript.Unknown605, EventFlag.UNKNOWN_269, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1069+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SUN_BATHING_GIRL, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1070+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HINT_MAN, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1071+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LUCKY, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GORGEOUS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RUNAWAY_FIVE_DRUMMER, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GIRL_IN_BIKINI, Direction.Up, ActionScript.Unknown010, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown887, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OLD_FAT_GUY_WITH_HAT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1077+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAGIC_TART_STAND, Direction.Down, ActionScript.Unknown886, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0788+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUY_IN_COOL_RED_CAR, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1080+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DELIVERY_TRUCK, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BICYCLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAGIC_TART_STAND, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0788+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown884, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1086+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.RUNAWAY_5_BUS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SHIP, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.POOS_MASTER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1089+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DALAAMESE_SERVANT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1090+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE_HEAD_GUY, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1091+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_27D, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1092+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown881, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Right, ActionScript.Unknown016, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1094+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHINESE_MONK_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1095+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1096+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DALAAMESE_SERVANT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1097+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHINESE_MONK_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1098+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DALAAMESE_SERVANT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1099+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PREET_PROOT_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1100+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DALAAMESE_SERVANT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1101+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DALAAM_GIRL, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1102+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.STAR_MASTER_GUY, Direction.Left, ActionScript.Unknown010, EventFlag.UNKNOWN_253, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1103+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DALAAM_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1104+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1105+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1106+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.RABBIT, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_28C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1107+/, null /+TEXT_NPC_1107_ALT+/),
	NPC(NPCType.Object, OverworldSprite.RABBIT, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_28C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1107+/, null /+TEXT_NPC_1107_ALT+/),
	NPC(NPCType.Object, OverworldSprite.RABBIT, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_28C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1107+/, null /+TEXT_NPC_1107_ALT+/),
	NPC(NPCType.Person, OverworldSprite.DALAAM_GIRL, Direction.Up, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DALAAM_GIRL, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1112+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ORNAMENTS_ON_POOS_TEMPLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ORNAMENTS_ON_POOS_TEMPLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ORNAMENTS_ON_POOS_TEMPLE, Direction.Down, ActionScript.Unknown882, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ORNAMENTS_ON_POOS_TEMPLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1117+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_6, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1118+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NessLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1123+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HAPPY_TURBAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1124+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1125+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1126+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LADY_IN_VEIL, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1129+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.OldGuyWithCane, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1130+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1131+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1132+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1133+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1134+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HAPPY_TURBAN_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1135+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1136+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LADY_IN_VEIL, Direction.Up, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1137+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIG_NOSE_ARAB_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1138+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ARAB_MR_T, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1139+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1140+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HAPPY_TURBAN_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1141+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PREET_PROOT_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1142+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PYRAMID_DOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_156, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1143+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1144+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIG_NOSE_ARAB_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1145+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIG_NOSE_ARAB_GUY, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1146+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1147+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PREET_PROOT_GUY, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1148+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRIBAL_WARRIOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1BD, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1149+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.DungeonMan, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_03E, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1150+/, null /+TEXT_NPC_1150_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TRIBAL_WARRIOR, Direction.Down, ActionScript.Unknown010, EventFlag.UNKNOWN_1BD, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1151+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DungeonMan, Direction.Down, ActionScript.Unknown498, EventFlag.UNKNOWN_112, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_Unknown498+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HINT_MAN, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_2F0, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1153+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PYRAMID_DOOR, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_156, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1143+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MUSTACHE_ARAB_TURBAN_GUY, Direction.Right, ActionScript.Unknown606, EventFlag.DEEP_DARKNESS_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1155+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIG_NOSE_ARAB_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1156+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PREET_PROOT_GUY, Direction.Down, ActionScript.Unknown888, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1157+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown889, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown890, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAMEL, Direction.Left, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CAMEL, Direction.Left, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN3, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1162+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN3, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1162+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1164+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1165+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_188, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1168+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_189, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1169+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_197, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1170+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_198, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1171+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_18A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1172+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1173+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1174+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_199, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1175+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1176+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_19A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1177+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18E, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1178+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_19B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1179+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B3, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1180+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_18F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1181+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_190, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1182+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_191, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1183+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_19C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1184+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_192, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1185+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_193, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1186+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_19D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1187+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_194, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1188+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_195, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1189+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.GUARDIAN_HIEROGLYPH, Direction.Left, ActionScript.Unknown599, EventFlag.UNKNOWN_196, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1190+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_19E, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1191+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LETHAL_ASP_HIEROGLYPH, Direction.Right, ActionScript.Unknown599, EventFlag.UNKNOWN_19F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1192+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1193+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHARAOH_CASKET, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15B, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HAWKS_EYE, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15C, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BRICK_ROAD_HEAD, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1196+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SUBMARINE, Direction.Down, ActionScript.Unknown008, EventFlag.DEEP_DARKNESS_REACHED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1197+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BICYCLE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.REAL_TAXI, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1200+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PAY_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0013+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1204+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Object, OverworldSprite.INSTANT_REVITALIZING_DEVICE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0622+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1208+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1209+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BENCH, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1210+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAD_DUCK, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAD_DUCK, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAD_DUCK, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SLIMY_LITTLE_PILE, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.GRUFF_GOAT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.GRUFF_GOAT, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2FA, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1219+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_2FA, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1219+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1221+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1133+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1132+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1131+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.TREE_IN_POT, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Left, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1226+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1227+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1228+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MASTER_BARF, Direction.Right, ActionScript.Unknown010, EventFlag.UNKNOWN_114, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1229+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIRD_ON_PERCH, Direction.Right, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1230+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNKNOWN4, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_120, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HIDDEN_ARMS_DEALER, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1232+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1233+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Right, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1234+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DEEP_DARKNESS_PHONE, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1235+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ATM_GUY_UNDERWATER, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1236+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown891, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FEMALE_MONKEY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1238+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Right, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1239+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B7, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1240+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B8, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1241+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1B9, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1242+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1BA, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1243+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.UNKNOWN2, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_1BB, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1244+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BROKEN_HELICOPTER, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1245+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_7, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1246+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1247+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1248+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1249+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1250+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1251+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA_CHIEF, Direction.Left, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1252+/, null /+TEXT_NPC_1252_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1253+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1254+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1255+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1256+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1257+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1258+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1259+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1260+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TENDA, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1261+/, null /+TEXT_NPC_1250_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ROCK, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_099, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CAN_TENDA_VILLAGE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.MAILBOX, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.WEIRD_JUNK, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SPA_SIGN, Direction.Down, ActionScript.Unknown684, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1267+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Left, ActionScript.Unknown606, EventFlag.UNKNOWN_17E, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1268+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_148, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1269+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DR_ANDONUTS, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_14B, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1270+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.APPLE_KID, Direction.Down, ActionScript.Unknown767, EventFlag.UNKNOWN_149, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1271+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MR_SATURN, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_14A, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1272+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BROKEN_PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_04B, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1273+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_14C, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1274+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_147, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.YOUR_SANCTUARY_POINT_BOSS, Direction.Down, ActionScript.Unknown693, EventFlag.DEFEATED_SANCTUARY_BOSS_8, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1276+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NessLyingDown, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Paula, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Jeff, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Poo, Direction.Left, ActionScript.Unknown008, EventFlag.UNKNOWN_15D, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FLAME, Direction.Down, ActionScript.Unknown693, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1282+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown771, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1283+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1284+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1285+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1286+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1287+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1288+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Left, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1289+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1290+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1291+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TALKING_STONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1292+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1293+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1294+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TOUCAN_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1295+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TOUCAN_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1295+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TOUCAN_PHONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1295+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LIL_TENDA, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1298+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.WOOD_BOX, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_28B, NPCConfigFlagStyle.ShowIfOff, null /+NULL+/, null /+TEXT_NPC_1299_ALT+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1300+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1301+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1301+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BAD_PALETTE_FOUNTAIN, Direction.Down, ActionScript.Unknown672, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.RED_FOUNTAIN_LOST_UNDERWORLD, Direction.Down, ActionScript.Unknown673, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.BAD_PALETTE_FOUNTAIN, Direction.Down, ActionScript.Unknown674, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ROBOT_BROKEN, Direction.Right, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ROBOT_BROKEN, Direction.Left, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ROBOT_BROKEN, Direction.Left, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.LyingDownRobotNess, Direction.Right, ActionScript.Unknown008, EventFlag.USE_POSTGAME_MUSIC, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.PHASE_DISTORTER, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_174, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1274+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.None, Direction.Down, ActionScript.Unknown000, EventFlag.UNKNOWN_154, NPCConfigFlagStyle.ShowIfOn, null /+NULL+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WEIRD_HORNED_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1312+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_019, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1313+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_01A, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1314+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Right, ActionScript.Unknown012, EventFlag.UNKNOWN_01B, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1315+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Up, ActionScript.Unknown012, EventFlag.UNKNOWN_01C, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1316+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FlyingMan, Direction.Right, ActionScript.Unknown606, EventFlag.UNKNOWN_01D, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1317+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.WEIRD_HORNED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1318+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHICK, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1319+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0012+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.INVISIBLE_2, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RABBIT, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1322+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.LITTLE_KID_IN_BLUE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1323+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.URBAN_ZOMBIE, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1324+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MASTER_BELCH, Direction.Right, ActionScript.Unknown013, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1325+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MANLY_FISH, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1326+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_BASEBALL_HELMET, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1327+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DERBY_HAT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1328+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HAPPY_GIRL_IN_RED, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1329+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Picky, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1330+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_PONYTAIL_GIRL, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1331+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONKEY, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1332+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KID_IN_DETECTIVE_HAT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1333+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RABBIT, Direction.Right, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1334+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Ness, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1335+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHICK, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1336+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FLOWER, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1337+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FLOWER, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1337+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FLOWER, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1337+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.STAR_MASTER_GUY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1340+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.STAR_MASTER_GUY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1341+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MOM, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1342+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TRACY, Direction.Right, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1343+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.King, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1344+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.Pokey, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1345+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.EVERDRED, Direction.Down, ActionScript.Unknown606, EventFlag.UNKNOWN_27F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1346+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan1Dead, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1347+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan2Dead, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1348+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan3Dead, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1349+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan4Dead, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1350+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.FlyingMan5Dead, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1351+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.CROSS_GRAVESTONE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1352+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.WEIRD_TAIL_THING, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1353+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KRAKEN, Direction.Right, ActionScript.Unknown602, EventFlag.UNKNOWN_1B4, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1354+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KRAKEN, Direction.Left, ActionScript.Unknown602, EventFlag.UNKNOWN_1B5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1355+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.KRAKEN, Direction.Right, ActionScript.Unknown602, EventFlag.UNKNOWN_1B6, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1356+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.WEIRD_TAIL_THING, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1357+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.EVIL_MANI_MANI, Direction.Down, ActionScript.Unknown010, EventFlag.MAGICANT_COMPLETED, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1358+/, null /+TEXT_NPC_1358_ALT+/),
	NPC(NPCType.Person, OverworldSprite.JACKIE, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1359+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BIG_SMILE_LADY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1360+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DRINKING_GUY, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1361+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_LADY_RED_DRESS, Direction.Up, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1362+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ROBO_PUMP, Direction.Up, ActionScript.Unknown597, EventFlag.ROBO_PUMP_1_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1363+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NURSE, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1364+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DOCTOR, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1365+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ABSTRACT_ART, Direction.Right, ActionScript.Unknown597, EventFlag.ABSTRACT_ART_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1366+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HEALER, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1367+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_HAPPY_LADY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1368+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Up, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1369+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.FOURSIDE_MUSEUM_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1370+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ROBO_PUMP, Direction.Up, ActionScript.Unknown597, EventFlag.ROBO_PUMP_2_FOUGHT, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1371+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SORTA_BALD_GUY_IN_SUIT, Direction.Down, ActionScript.Unknown605, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1372+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.HOTEL_ATTENDANT, Direction.Down, ActionScript.Unknown008, EventFlag.JUST_RESTED, NPCConfigFlagStyle.ShowIfOn, null /+TEXT_NPC_1373+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown606, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1374+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.ATM_MACHINE, Direction.Right, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1375+/, null /+TEXT_NPC_0012_ALT+/),
	NPC(NPCType.Person, OverworldSprite.TELEPHONE, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_0060+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MrT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1377+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BAD_PALETTE_GUY_ONETT_NIGHT, Direction.Down, ActionScript.Unknown012, EventFlag.UNKNOWN_0A5, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1378+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SNEAKY_GUY_WITH_A_HAT, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1379+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1380+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BEACH_LADY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1381+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.TOUGH_GUY_W__SUNGLASSES, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1382+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.DARK_HAIRED_GUY_IN_A_SUIT, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1383+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.UNASSUMING_LOCAL_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1384+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.NERDY_RED_HAIRED_GUY, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1385+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SCUZZY_GUY, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1386+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.CHINESE_GIRL, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1387+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.PUNK_GUY, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1388+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BODYGUARD, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1389+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHY_GUY, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1390+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.BLONDE_GUY_IN_A_SUIT, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1391+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.ORANGE_HAIRED_NERD_KID, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1392+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.RED_CLOTHES_PERSON, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1393+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.JamaicanGuy, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1394+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.MONOTOLI, Direction.Up, ActionScript.Unknown008, EventFlag.UNKNOWN_277, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1395+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SHIP_CAPTAIN, Direction.Down, ActionScript.Unknown008, EventFlag.UNKNOWN_03F, NPCConfigFlagStyle.ShowIfOff, null /+TEXT_NPC_1396+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1397+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1398+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Left, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1398+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Right, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1398+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1401+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1402+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Down, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1403+/, null /+NULL+/),
	NPC(NPCType.Person, OverworldSprite.SURFER, Direction.Up, ActionScript.Unknown012, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1404+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.HOTEL_SIGN, Direction.Down, ActionScript.Unknown008, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1405+/, null /+NULL+/),
	NPC(NPCType.Object, OverworldSprite.EVIL_MANI_MANI, Direction.Down, ActionScript.Unknown010, EventFlag.None, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1406+/, null /+TEXT_NPC_1358_ALT+/),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_320, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x67, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_321, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_322, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_323, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x00, 0x01, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_324, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x6A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_325, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x11, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_326, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_327, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xE0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_328, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x6F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_329, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xE0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32A, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x02, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32B, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x04, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32C, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xE0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32D, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32E, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x75, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_32F, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x4D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_330, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_331, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x36, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_332, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x93, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_333, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_334, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_335, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x37, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_336, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_337, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x95, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_338, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x02, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_339, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x00, 0x01, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33A, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0xE0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.CASKET, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33B, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1434+/, [0xE1, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.CASKET, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33C, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1434+/, [0x42, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33D, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33E, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_33F, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_340, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_341, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_342, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_343, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x58, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_344, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x0A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_345, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x09, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_346, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x25, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_347, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x95, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_348, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_349, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x67, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34A, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x40, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34B, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x90, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34C, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34D, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x0E, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34E, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x72, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_34F, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x0F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_350, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_351, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x46, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_352, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_353, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x73, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_354, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xF4, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_355, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x08, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_356, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x93, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_357, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x87, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_358, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x74, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_359, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0xBF, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35A, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35B, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x51, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35C, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x6C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35D, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x93, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35E, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x90, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_35F, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x96, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_360, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_361, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x8F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_362, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x07, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_363, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x3A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_364, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x0C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_365, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0xA0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_366, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0xC3, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_367, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x64, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_368, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_369, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x5F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36A, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x7F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36B, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x5F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36C, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x8C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36D, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36E, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x6C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_36F, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_370, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x5D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_371, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x5A, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_372, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x91, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_373, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xE9, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_374, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xE9, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_375, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_376, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xE1, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_377, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_378, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xE8, 0x04, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_379, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37A, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37B, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xD8, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37C, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37D, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x72, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37E, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x75, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_37F, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x52, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_380, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x81, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_381, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x02, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_382, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x94, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_383, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x91, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_384, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_385, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xBF, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_386, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x5D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_387, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x93, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_388, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0xFD, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_389, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38A, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x74, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38B, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x3C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38C, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x9B, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38D, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xE9, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38E, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x6C, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_38F, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x81, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_390, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x97, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_391, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x0D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_392, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x07, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_393, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x66, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_394, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x09, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_395, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1434+/, [0xA0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_396, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1434+/, [0x73, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_397, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1434+/, [0xC8, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_398, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1434+/, [0x45, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_399, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1434+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.PETRIFIED_ROYAL_GUARD, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39A, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1434+/, [0x3B, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39B, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39C, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xDB, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39D, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39E, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_39F, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xEE, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A0, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x5F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A1, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x03, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A2, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xC7, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A3, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x0A, 0x01, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A4, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A5, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x7F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A6, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x05, 0x01, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A7, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x64, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A8, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3A9, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0xC9, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AA, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x6E, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AB, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0xEC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AC, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x7E, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.DALAAM_PRESENT, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AD, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1474+/, [0x6E, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AE, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x65, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3AF, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x9F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B0, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x49, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B1, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x56, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B2, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x65, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B3, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B4, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B5, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xBE, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B6, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xF2, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B7, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x39, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B8, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xFC, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3B9, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x65, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BA, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x57, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BB, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x75, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BC, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xF5, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BD, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x71, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BE, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xF6, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3BF, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x94, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.TRASH_CAN, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C0, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1408+/, [0x2D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C1, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x64, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C2, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x82, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C3, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x3D, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C4, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x72, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.LilGiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C5, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x3F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C6, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x2F, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C7, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x82, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C8, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x47, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3C9, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xA0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CA, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x73, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CB, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xA0, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CC, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x62, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CD, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x48, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CE, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x18, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3CF, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0xCF, 0x00, 0x00, 0x00]),
	NPC(NPCType.ItemBox, OverworldSprite.GiftBox, Direction.Down, ActionScript.Unknown009, EventFlag.UNKNOWN_3D0, NPCConfigFlagStyle.ShowAlways, null /+TEXT_NPC_1407+/, [0x19, 0x00, 0x00, 0x00]),
];
