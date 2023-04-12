///
module earthbound.bank0F;

import earthbound.commondefs;
import earthbound.text;

/// $CF0000
immutable SectorDoors[32][40] doorConfig = [
	[
		SectorDoors(1, [DoorConfig(0x11, 0x15, DoorType.object, &doorEntry910)]),
		SectorDoors(2, [DoorConfig(0x0E, 0x15, DoorType.door, &doorEntry908), DoorConfig(0x19, 0x15, DoorType.object, &doorEntry911)]),
		SectorDoors(1, [DoorConfig(0x0E, 0x16, DoorType.door, &doorEntry904)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0F, 0x05, DoorType.door, &doorEntry0)]),
		SectorDoors(4, [DoorConfig(0x11, 0x02, DoorType.object, &doorEntry150), DoorConfig(0x11, 0x04, DoorType.object, &doorEntry150), DoorConfig(0x12, 0x03, DoorType.object, &doorEntry150), DoorConfig(0x12, 0x05, DoorType.object, &doorEntry150)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x11, 0x0B, DoorType.door, &doorEntry885), DoorConfig(0x11, 0x0C, DoorType.door, &doorEntry885)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x15, 0x07, DoorType.door, &doorEntry886), DoorConfig(0x15, 0x08, DoorType.door, &doorEntry886)]),
		SectorDoors(2, [DoorConfig(0x11, 0x01, DoorType.door, &doorEntry887), DoorConfig(0x11, 0x02, DoorType.door, &doorEntry887)]),
		SectorDoors(6, [DoorConfig(0x0D, 0x06, DoorType.object, &doorEntry840), DoorConfig(0x0D, 0x0C, DoorType.object, &doorEntry862), DoorConfig(0x0D, 0x12, DoorType.object, &doorEntry841), DoorConfig(0x15, 0x0E, DoorType.object, &doorEntry842), DoorConfig(0x19, 0x0A, DoorType.object, &doorEntry843), DoorConfig(0x1D, 0x11, DoorType.object, &doorEntry844)]),
		SectorDoors(45, [DoorConfig(0x01, 0x07, DoorType.door, &doorEntry818), DoorConfig(0x01, 0x13, DoorType.door, &doorEntry819), DoorConfig(0x02, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x0D, DoorType.door, &doorEntry820), DoorConfig(0x02, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x19, DoorType.door, &doorEntry821), DoorConfig(0x03, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x07, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x05, DoorType.object, &doorEntry845), DoorConfig(0x0D, 0x0A, DoorType.object, &doorEntry845), DoorConfig(0x0D, 0x11, DoorType.object, &doorEntry845), DoorConfig(0x0D, 0x16, DoorType.object, &doorEntry845), DoorConfig(0x1A, 0x18, DoorType.object, &doorEntry847)]),
		SectorDoors(4, [DoorConfig(0x09, 0x11, DoorType.door, &doorEntry839), DoorConfig(0x0D, 0x15, DoorType.object, &doorEntry848), DoorConfig(0x15, 0x01, DoorType.object, &doorEntry849), DoorConfig(0x19, 0x06, DoorType.object, &doorEntry850)]),
		SectorDoors(5, [DoorConfig(0x1C, 0x05, DoorType.door, &doorEntry402), DoorConfig(0x1C, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x1D, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x1E, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x1F, 0x16, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(5, [DoorConfig(0x14, 0x02, DoorType.door, &doorEntry403), DoorConfig(0x1C, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x1D, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x1E, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x1F, 0x16, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x16, DoorType.door, &doorEntry942)]),
		SectorDoors(6, [DoorConfig(0x08, 0x06, DoorType.door, &doorEntry345), DoorConfig(0x09, 0x05, DoorType.door, &doorEntry345), DoorConfig(0x0A, 0x04, DoorType.door, &doorEntry345), DoorConfig(0x0B, 0x03, DoorType.door, &doorEntry345), DoorConfig(0x0C, 0x02, DoorType.door, &doorEntry345), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry345)]),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x08, 0x19, DoorType.door, &doorEntry346), DoorConfig(0x09, 0x1A, DoorType.door, &doorEntry346), DoorConfig(0x0A, 0x1B, DoorType.door, &doorEntry346), DoorConfig(0x0B, 0x1C, DoorType.door, &doorEntry346), DoorConfig(0x0C, 0x1D, DoorType.door, &doorEntry346), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry346)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x06, DoorType.door, &doorEntry31)]),
		SectorDoors(3, [DoorConfig(0x07, 0x11, DoorType.door, &doorEntry32), DoorConfig(0x07, 0x1D, DoorType.door, &doorEntry33), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry34)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x0E, DoorType.door, &doorEntry35), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry36)]),
		SectorDoors(4, [DoorConfig(0x0B, 0x09, DoorType.door, &doorEntry151), DoorConfig(0x0B, 0x11, DoorType.door, &doorEntry152), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry37), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry38)]),
	], [
		SectorDoors(2, [DoorConfig(0x11, 0x13, DoorType.door, &doorEntry905), DoorConfig(0x11, 0x14, DoorType.door, &doorEntry905)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x09, 0x11, DoorType.object, &doorEntry912)]),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x06, 0x09, DoorType.door, &doorEntry1), DoorConfig(0x19, 0x1D, DoorType.door, &doorEntry2), DoorConfig(0x1A, 0x05, DoorType.door, &doorEntry3)]),
		SectorDoors(1, [DoorConfig(0x1E, 0x11, DoorType.door, &doorEntry4)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0B, 0x0B, DoorType.door, &doorEntry21)]),
		SectorDoors(3, [DoorConfig(0x0A, 0x0B, DoorType.door, &doorEntry22), DoorConfig(0x13, 0x1A, DoorType.object, &doorEntry148), DoorConfig(0x13, 0x1C, DoorType.object, &doorEntry148)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x11, 0x0B, DoorType.door, &doorEntry888), DoorConfig(0x11, 0x0C, DoorType.door, &doorEntry888)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x05, 0x04, DoorType.object, &doorEntry851)]),
		SectorDoors(1, []),
		SectorDoors(3, [DoorConfig(0x01, 0x11, DoorType.object, &doorEntry852), DoorConfig(0x0D, 0x05, DoorType.object, &doorEntry853), DoorConfig(0x11, 0x15, DoorType.object, &doorEntry854)]),
		SectorDoors(11, [DoorConfig(0x00, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x01, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x0F, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x14, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(13, [DoorConfig(0x00, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x01, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x0F, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x14, 0x1A, DoorType.door, &doorEntry404)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x00, 0x1C, DoorType.door, &doorEntry461)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.door, &doorEntry39)]),
		SectorDoors(1, [DoorConfig(0x11, 0x06, DoorType.door, &doorEntry40)]),
		SectorDoors(2, [DoorConfig(0x0A, 0x04, DoorType.door, &doorEntry41), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry42)]),
		SectorDoors(4, [DoorConfig(0x0A, 0x0F, DoorType.door, &doorEntry43), DoorConfig(0x17, 0x0D, DoorType.door, &doorEntry44), DoorConfig(0x17, 0x19, DoorType.door, &doorEntry45), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry46)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry47), DoorConfig(0x1D, 0x16, DoorType.door, &doorEntry48)]),
	], [
		SectorDoors(1, [DoorConfig(0x0D, 0x11, DoorType.object, &doorEntry863)]),
		SectorDoors(9, [DoorConfig(0x09, 0x05, DoorType.door, &doorEntry825), DoorConfig(0x09, 0x06, DoorType.door, &doorEntry825), DoorConfig(0x09, 0x0D, DoorType.door, &doorEntry826), DoorConfig(0x09, 0x0E, DoorType.door, &doorEntry826), DoorConfig(0x09, 0x15, DoorType.door, &doorEntry827), DoorConfig(0x09, 0x16, DoorType.door, &doorEntry827), DoorConfig(0x09, 0x1D, DoorType.door, &doorEntry828), DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry828), DoorConfig(0x1D, 0x01, DoorType.object, &doorEntry864)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x12, DoorType.object, &doorEntry865)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x04, 0x15, DoorType.door, &doorEntry5), DoorConfig(0x04, 0x17, DoorType.door, &doorEntry5), DoorConfig(0x07, 0x15, DoorType.door, &doorEntry6), DoorConfig(0x09, 0x19, DoorType.object, &doorEntry133), DoorConfig(0x09, 0x1A, DoorType.object, &doorEntry133)]),
		SectorDoors(2, [DoorConfig(0x1F, 0x02, DoorType.object, &doorEntry135), DoorConfig(0x1F, 0x04, DoorType.object, &doorEntry135)]),
		SectorDoors(1, [DoorConfig(0x12, 0x1C, DoorType.door, &doorEntry7)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x0C, 0x15, DoorType.door, &doorEntry28), DoorConfig(0x0C, 0x17, DoorType.door, &doorEntry28), DoorConfig(0x0C, 0x19, DoorType.door, &doorEntry28), DoorConfig(0x0C, 0x1B, DoorType.door, &doorEntry28), DoorConfig(0x0C, 0x1D, DoorType.door, &doorEntry28), DoorConfig(0x0C, 0x1F, DoorType.door, &doorEntry28)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0D, 0x0D, DoorType.door, &doorEntry889), DoorConfig(0x0D, 0x0E, DoorType.door, &doorEntry889)]),
		SectorDoors(4, [DoorConfig(0x01, 0x03, DoorType.door, &doorEntry890), DoorConfig(0x01, 0x04, DoorType.door, &doorEntry890), DoorConfig(0x1D, 0x07, DoorType.door, &doorEntry891), DoorConfig(0x1D, 0x08, DoorType.door, &doorEntry891)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x05, 0x03, DoorType.door, &doorEntry892), DoorConfig(0x05, 0x04, DoorType.door, &doorEntry892)]),
		SectorDoors(3, [DoorConfig(0x05, 0x19, DoorType.object, &doorEntry855), DoorConfig(0x15, 0x09, DoorType.door, &doorEntry822), DoorConfig(0x19, 0x09, DoorType.object, &doorEntry856)]),
		SectorDoors(3, [DoorConfig(0x11, 0x16, DoorType.object, &doorEntry857), DoorConfig(0x19, 0x0A, DoorType.object, &doorEntry858)]),
		SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.object, &doorEntry859), DoorConfig(0x15, 0x0C, DoorType.object, &doorEntry860)]),
		SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.door, &doorEntry650), DoorConfig(0x16, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x00, DoorType.door, &doorEntry650), DoorConfig(0x17, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x00, DoorType.door, &doorEntry651), DoorConfig(0x1B, 0x00, DoorType.door, &doorEntry651)]),
		SectorDoors(13, [DoorConfig(0x03, 0x03, DoorType.door, &doorEntry652), DoorConfig(0x04, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x08, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x0A, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x0B, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x0C, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x03, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x19, DoorType.door, &doorEntry653)]),
		SectorDoors(1, [DoorConfig(0x0B, 0x1D, DoorType.door, &doorEntry654)]),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x16, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x1F, DoorType.door, &doorEntry655), DoorConfig(0x17, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x1F, DoorType.door, &doorEntry655), DoorConfig(0x1A, 0x1F, DoorType.door, &doorEntry656), DoorConfig(0x1B, 0x1F, DoorType.door, &doorEntry656)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x14, 0x0D, DoorType.door, &doorEntry432)]),
		SectorDoors(5, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry49), DoorConfig(0x17, 0x11, DoorType.door, &doorEntry50), DoorConfig(0x17, 0x19, DoorType.door, &doorEntry153), DoorConfig(0x17, 0x1D, DoorType.door, &doorEntry154), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry51)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry52), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry53)]),
		SectorDoors(6, [DoorConfig(0x07, 0x11, DoorType.door, &doorEntry54), DoorConfig(0x07, 0x1A, DoorType.object, &doorEntry155), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry55), DoorConfig(0x15, 0x11, DoorType.door, &doorEntry56), DoorConfig(0x15, 0x12, DoorType.door, &doorEntry56), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry57)]),
		SectorDoors(3, [DoorConfig(0x07, 0x01, DoorType.door, &doorEntry58), DoorConfig(0x0D, 0x0E, DoorType.door, &doorEntry59), DoorConfig(0x19, 0x06, DoorType.door, &doorEntry60)]),
	], [
		SectorDoors(8, [DoorConfig(0x02, 0x15, DoorType.door, &doorEntry829), DoorConfig(0x03, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x18, DoorType.object, &doorEntry866), DoorConfig(0x15, 0x0C, DoorType.object, &doorEntry867)]),
		SectorDoors(5, [DoorConfig(0x01, 0x11, DoorType.object, &doorEntry846), DoorConfig(0x15, 0x16, DoorType.object, &doorEntry868), DoorConfig(0x15, 0x1D, DoorType.door, &doorEntry830), DoorConfig(0x15, 0x1E, DoorType.door, &doorEntry830)]),
		SectorDoors(3, [DoorConfig(0x09, 0x19, DoorType.object, &doorEntry869), DoorConfig(0x11, 0x10, DoorType.object, &doorEntry870)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x14, 0x12, DoorType.door, &doorEntry124)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0C, 0x0A, DoorType.door, &doorEntry23), DoorConfig(0x13, 0x1E, DoorType.object, &doorEntry145)]),
		SectorDoors(1, [DoorConfig(0x13, 0x00, DoorType.object, &doorEntry145)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.door, &doorEntry893), DoorConfig(0x09, 0x0E, DoorType.door, &doorEntry893)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x15, 0x0F, DoorType.door, &doorEntry894), DoorConfig(0x15, 0x10, DoorType.door, &doorEntry894)]),
		SectorDoors(1, [DoorConfig(0x12, 0x16, DoorType.door, &doorEntry895)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x11, 0x15, DoorType.object, &doorEntry861), DoorConfig(0x12, 0x1A, DoorType.door, &doorEntry824)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry61), DoorConfig(0x1A, 0x13, DoorType.door, &doorEntry62)]),
		SectorDoors(5, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry63), DoorConfig(0x17, 0x0A, DoorType.object, &doorEntry677), DoorConfig(0x17, 0x12, DoorType.door, &doorEntry64), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry66), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry65)]),
		SectorDoors(4, [DoorConfig(0x0A, 0x13, DoorType.door, &doorEntry67), DoorConfig(0x1B, 0x11, DoorType.door, &doorEntry68), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry69), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry70)]),
		SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry71), DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry72), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry73)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry74), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry75)]),
	], [
		SectorDoors(5, [DoorConfig(0x00, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x01, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x14, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x06, DoorType.object, &doorEntry871)]),
		SectorDoors(4, [DoorConfig(0x01, 0x01, DoorType.object, &doorEntry872), DoorConfig(0x0D, 0x15, DoorType.door, &doorEntry831), DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry831), DoorConfig(0x11, 0x09, DoorType.object, &doorEntry873)]),
		SectorDoors(2, [DoorConfig(0x05, 0x05, DoorType.object, &doorEntry874), DoorConfig(0x19, 0x02, DoorType.object, &doorEntry875)]),
		SectorDoors(0, []),
		SectorDoors(4, [DoorConfig(0x0B, 0x15, DoorType.object, &doorEntry130), DoorConfig(0x0B, 0x17, DoorType.object, &doorEntry130), DoorConfig(0x0B, 0x18, DoorType.object, &doorEntry130), DoorConfig(0x0B, 0x1A, DoorType.object, &doorEntry130)]),
		SectorDoors(3, [DoorConfig(0x03, 0x02, DoorType.object, &doorEntry131), DoorConfig(0x03, 0x04, DoorType.object, &doorEntry131), DoorConfig(0x04, 0x12, DoorType.door, &doorEntry125)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x08, DoorType.door, &doorEntry8), DoorConfig(0x0D, 0x19, DoorType.door, &doorEntry9)]),
		SectorDoors(0, []),
		SectorDoors(4, [DoorConfig(0x0A, 0x15, DoorType.object, &doorEntry143), DoorConfig(0x0A, 0x17, DoorType.object, &doorEntry143), DoorConfig(0x0A, 0x18, DoorType.object, &doorEntry143), DoorConfig(0x0A, 0x1A, DoorType.object, &doorEntry143)]),
		SectorDoors(2, [DoorConfig(0x0B, 0x01, DoorType.door, &doorEntry24), DoorConfig(0x0B, 0x0D, DoorType.door, &doorEntry25)]),
		SectorDoors(5, [DoorConfig(0x12, 0x11, DoorType.object, &doorEntry147), DoorConfig(0x12, 0x13, DoorType.object, &doorEntry147), DoorConfig(0x12, 0x14, DoorType.object, &doorEntry147), DoorConfig(0x12, 0x16, DoorType.object, &doorEntry147), DoorConfig(0x1F, 0x11, DoorType.door, &doorEntry139)]),
		SectorDoors(0, []),
		SectorDoors(1, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0A, 0x11, DoorType.door, &doorEntry281), DoorConfig(0x0A, 0x12, DoorType.door, &doorEntry281)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x19, 0x17, DoorType.door, &doorEntry277)]),
		SectorDoors(1, [DoorConfig(0x09, 0x06, DoorType.door, &doorEntry276)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(11, [DoorConfig(0x08, 0x08, DoorType.object, &doorEntry157), DoorConfig(0x08, 0x09, DoorType.object, &doorEntry157), DoorConfig(0x08, 0x0A, DoorType.object, &doorEntry157), DoorConfig(0x08, 0x0C, DoorType.object, &doorEntry158), DoorConfig(0x08, 0x0D, DoorType.object, &doorEntry158), DoorConfig(0x08, 0x0E, DoorType.object, &doorEntry158), DoorConfig(0x08, 0x10, DoorType.object, &doorEntry159), DoorConfig(0x08, 0x11, DoorType.object, &doorEntry159), DoorConfig(0x08, 0x12, DoorType.object, &doorEntry159), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry76), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry77)]),
		SectorDoors(2, [DoorConfig(0x09, 0x0A, DoorType.door, &doorEntry78), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry79)]),
		SectorDoors(3, [DoorConfig(0x0A, 0x1B, DoorType.door, &doorEntry80), DoorConfig(0x1A, 0x13, DoorType.door, &doorEntry81), DoorConfig(0x1B, 0x0C, DoorType.door, &doorEntry82)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry83), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry84)]),
		SectorDoors(2, [DoorConfig(0x0A, 0x04, DoorType.door, &doorEntry85), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry86)]),
	], [
		SectorDoors(4, [DoorConfig(0x12, 0x1F, DoorType.door, &doorEntry657), DoorConfig(0x13, 0x1F, DoorType.door, &doorEntry657), DoorConfig(0x16, 0x1F, DoorType.door, &doorEntry658), DoorConfig(0x17, 0x1F, DoorType.door, &doorEntry658)]),
		SectorDoors(3, [DoorConfig(0x0A, 0x1D, DoorType.stairway, 0x0200), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry787), DoorConfig(0x1D, 0x0A, DoorType.stairway, 0x0100)]),
		SectorDoors(1, [DoorConfig(0x09, 0x06, DoorType.door, &doorEntry788)]),
		SectorDoors(1, [DoorConfig(0x01, 0x1F, DoorType.door, &doorEntry126)]),
		SectorDoors(3, [DoorConfig(0x00, 0x1A, DoorType.door, &doorEntry10), DoorConfig(0x0B, 0x09, DoorType.door, &doorEntry11), DoorConfig(0x1B, 0x05, DoorType.door, &doorEntry12)]),
		SectorDoors(4, [DoorConfig(0x02, 0x19, DoorType.object, &doorEntry134), DoorConfig(0x02, 0x1B, DoorType.object, &doorEntry134), DoorConfig(0x02, 0x1C, DoorType.object, &doorEntry134), DoorConfig(0x02, 0x1E, DoorType.object, &doorEntry134)]),
		SectorDoors(3, [DoorConfig(0x06, 0x0F, DoorType.door, &doorEntry13), DoorConfig(0x13, 0x16, DoorType.object, &doorEntry136), DoorConfig(0x13, 0x18, DoorType.object, &doorEntry136)]),
		SectorDoors(1, [DoorConfig(0x11, 0x1F, DoorType.door, &doorEntry14)]),
		SectorDoors(4, [DoorConfig(0x0D, 0x17, DoorType.door, &doorEntry142), DoorConfig(0x11, 0x0B, DoorType.door, &doorEntry141), DoorConfig(0x13, 0x19, DoorType.object, &doorEntry144), DoorConfig(0x13, 0x1A, DoorType.object, &doorEntry144)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0F, 0x01, DoorType.door, &doorEntry26)]),
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
		SectorDoors(12, [DoorConfig(0x08, 0x08, DoorType.object, &doorEntry160), DoorConfig(0x08, 0x09, DoorType.object, &doorEntry160), DoorConfig(0x08, 0x0A, DoorType.object, &doorEntry160), DoorConfig(0x08, 0x0C, DoorType.object, &doorEntry161), DoorConfig(0x08, 0x0D, DoorType.object, &doorEntry161), DoorConfig(0x08, 0x0E, DoorType.object, &doorEntry161), DoorConfig(0x08, 0x10, DoorType.object, &doorEntry162), DoorConfig(0x08, 0x11, DoorType.object, &doorEntry162), DoorConfig(0x08, 0x12, DoorType.object, &doorEntry162), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry87), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry88), DoorConfig(0x1A, 0x17, DoorType.door, &doorEntry89)]),
		SectorDoors(5, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry90), DoorConfig(0x1B, 0x09, DoorType.door, &doorEntry91), DoorConfig(0x1B, 0x0E, DoorType.object, &doorEntry156), DoorConfig(0x1B, 0x11, DoorType.door, &doorEntry92), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry93)]),
		SectorDoors(3, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry94), DoorConfig(0x18, 0x16, DoorType.object, &doorEntry163), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry95)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry96), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry97)]),
		SectorDoors(4, [DoorConfig(0x09, 0x12, DoorType.door, &doorEntry98), DoorConfig(0x17, 0x11, DoorType.door, &doorEntry99), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry100), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry101)]),
	], [
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1B, 0x19, DoorType.door, &doorEntry15)]),
		SectorDoors(2, [DoorConfig(0x1B, 0x01, DoorType.object, &doorEntry128), DoorConfig(0x1B, 0x02, DoorType.object, &doorEntry128)]),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x12, 0x0F, DoorType.door, &doorEntry16), DoorConfig(0x1B, 0x05, DoorType.object, &doorEntry129), DoorConfig(0x1B, 0x07, DoorType.object, &doorEntry129), DoorConfig(0x1B, 0x08, DoorType.object, &doorEntry129), DoorConfig(0x1B, 0x0A, DoorType.object, &doorEntry129)]),
		SectorDoors(3, [DoorConfig(0x0B, 0x00, DoorType.object, &doorEntry132), DoorConfig(0x0B, 0x02, DoorType.object, &doorEntry132), DoorConfig(0x19, 0x14, DoorType.door, &doorEntry127)]),
		SectorDoors(3, [DoorConfig(0x12, 0x05, DoorType.door, &doorEntry17), DoorConfig(0x12, 0x07, DoorType.door, &doorEntry17), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry18)]),
		SectorDoors(4, [DoorConfig(0x03, 0x16, DoorType.object, &doorEntry138), DoorConfig(0x03, 0x18, DoorType.object, &doorEntry138), DoorConfig(0x15, 0x1C, DoorType.door, &doorEntry19), DoorConfig(0x19, 0x08, DoorType.door, &doorEntry20)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x07, 0x11, DoorType.door, &doorEntry27), DoorConfig(0x17, 0x01, DoorType.door, &doorEntry140)]),
		SectorDoors(6, [DoorConfig(0x07, 0x05, DoorType.object, &doorEntry146), DoorConfig(0x07, 0x07, DoorType.object, &doorEntry146), DoorConfig(0x07, 0x08, DoorType.object, &doorEntry146), DoorConfig(0x07, 0x0A, DoorType.object, &doorEntry146), DoorConfig(0x13, 0x11, DoorType.object, &doorEntry149), DoorConfig(0x13, 0x12, DoorType.object, &doorEntry149)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.door, &doorEntry282)]),
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
		SectorDoors(1, [DoorConfig(0x04, 0x09, DoorType.door, &doorEntry278)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry258), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry259), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry260)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry381), DoorConfig(0x18, 0x0D, DoorType.door, &doorEntry395)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry261), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry262)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry382), DoorConfig(0x18, 0x0D, DoorType.door, &doorEntry396)]),
		SectorDoors(3, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry102), DoorConfig(0x1A, 0x04, DoorType.door, &doorEntry265), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry266)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x07, 0x0D, DoorType.object, &doorEntry137), DoorConfig(0x07, 0x0E, DoorType.object, &doorEntry137)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1F, 0x11, DoorType.door, &doorEntry948)]),
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
		SectorDoors(1, [DoorConfig(0x10, 0x02, DoorType.door, &doorEntry383)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry384), DoorConfig(0x18, 0x0D, DoorType.door, &doorEntry397)]),
		SectorDoors(1, [DoorConfig(0x12, 0x04, DoorType.door, &doorEntry267)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry385), DoorConfig(0x18, 0x0D, DoorType.door, &doorEntry398)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry491)]),
	], [
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x11, 0x1C, DoorType.door, &doorEntry365), DoorConfig(0x11, 0x1E, DoorType.door, &doorEntry365)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(14, [DoorConfig(0x0A, 0x07, DoorType.door, &doorEntry115), DoorConfig(0x0A, 0x08, DoorType.door, &doorEntry115), DoorConfig(0x12, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x13, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x14, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x15, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x16, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x17, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x18, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x19, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x1A, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x1B, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x1C, 0x0A, DoorType.ropeLadder, 0x8000), DoorConfig(0x1D, 0x0A, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1B, 0x05, DoorType.door, &doorEntry29)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x09, 0x0B, DoorType.door, &doorEntry121)]),
		SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry122)]),
		SectorDoors(10, [DoorConfig(0x0A, 0x09, DoorType.door, &doorEntry896), DoorConfig(0x0B, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x0C, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x0F, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x10, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x09, DoorType.ropeLadder, 0)]),
		SectorDoors(10, [DoorConfig(0x06, 0x01, DoorType.door, &doorEntry897), DoorConfig(0x07, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x08, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x0A, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x0B, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x0C, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x0F, 0x01, DoorType.ropeLadder, 0)]),
		SectorDoors(2, [DoorConfig(0x18, 0x16, DoorType.door, &doorEntry279), DoorConfig(0x18, 0x17, DoorType.door, &doorEntry279)]),
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
		SectorDoors(1, [DoorConfig(0x0C, 0x09, DoorType.door, &doorEntry447)]),
		SectorDoors(2, [DoorConfig(0x1E, 0x15, DoorType.door, &doorEntry446), DoorConfig(0x1E, 0x16, DoorType.door, &doorEntry446)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry263)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry492)]),
		SectorDoors(1, [DoorConfig(0x01, 0x12, DoorType.door, &doorEntry264)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x02, 0x11, DoorType.object, &doorEntry379), DoorConfig(0x02, 0x13, DoorType.object, &doorEntry379), DoorConfig(0x03, 0x17, DoorType.door, &doorEntry366)]),
		SectorDoors(0, []),
		SectorDoors(21, [DoorConfig(0x04, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x0F, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x13, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x14, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x15, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x16, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x17, 0x06, DoorType.ropeLadder, 0x8000), DoorConfig(0x19, 0x0E, DoorType.door, &doorEntry116)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, []),
		SectorDoors(10, [DoorConfig(0x16, 0x01, DoorType.door, &doorEntry898), DoorConfig(0x17, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x18, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x1B, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x1C, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x1D, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x1E, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x1F, 0x01, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(4, [DoorConfig(0x03, 0x01, DoorType.door, &doorEntry328), DoorConfig(0x03, 0x1E, DoorType.door, &doorEntry329), DoorConfig(0x1E, 0x05, DoorType.door, &doorEntry902), DoorConfig(0x1F, 0x05, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.door, &doorEntry270)]),
		SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry271)]),
		SectorDoors(2, [DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry119), DoorConfig(0x1B, 0x01, DoorType.door, &doorEntry120)]),
		SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.door, &doorEntry785), DoorConfig(0x19, 0x12, DoorType.door, &doorEntry786)]),
		SectorDoors(2, [DoorConfig(0x18, 0x05, DoorType.door, &doorEntry113), DoorConfig(0x19, 0x17, DoorType.door, &doorEntry114)]),
		SectorDoors(2, [DoorConfig(0x04, 0x16, DoorType.door, &doorEntry433), DoorConfig(0x04, 0x17, DoorType.door, &doorEntry433)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1A, 0x01, DoorType.door, &doorEntry938), DoorConfig(0x1A, 0x11, DoorType.door, &doorEntry939)]),
		SectorDoors(1, [DoorConfig(0x1A, 0x06, DoorType.door, &doorEntry940)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x02, 0x0C, DoorType.door, &doorEntry268), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry380)]),
		SectorDoors(2, [DoorConfig(0x1B, 0x11, DoorType.door, &doorEntry386), DoorConfig(0x1B, 0x1A, DoorType.door, &doorEntry387)]),
		SectorDoors(1, [DoorConfig(0x02, 0x13, DoorType.door, &doorEntry269)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1A, 0x03, DoorType.door, &doorEntry378)]),
		SectorDoors(0, []),
		SectorDoors(11, [DoorConfig(0x01, 0x13, DoorType.door, &doorEntry906), DoorConfig(0x02, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x13, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x05, DoorType.door, &doorEntry907)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x08, 0x17, DoorType.door, &doorEntry913)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(12, [DoorConfig(0x02, 0x0D, DoorType.door, &doorEntry899), DoorConfig(0x03, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x08, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x0A, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x0B, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x1E, 0x0D, DoorType.door, &doorEntry900), DoorConfig(0x1F, 0x0D, DoorType.ropeLadder, 0)]),
		SectorDoors(1, []),
		SectorDoors(0, []),
		SectorDoors(8, [DoorConfig(0x00, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x01, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x05, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x14, 0x17, DoorType.door, &doorEntry682)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x13, 0x08, DoorType.door, &doorEntry683)]),
		SectorDoors(1, [DoorConfig(0x13, 0x17, DoorType.door, &doorEntry684)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x14, 0x02, DoorType.door, &doorEntry685), DoorConfig(0x14, 0x03, DoorType.door, &doorEntry685)]),
		SectorDoors(3, [DoorConfig(0x11, 0x0C, DoorType.door, &doorEntry686), DoorConfig(0x11, 0x0E, DoorType.door, &doorEntry686), DoorConfig(0x11, 0x10, DoorType.door, &doorEntry686)]),
		SectorDoors(3, [DoorConfig(0x17, 0x05, DoorType.object, &doorEntry741), DoorConfig(0x17, 0x07, DoorType.object, &doorEntry741), DoorConfig(0x17, 0x08, DoorType.object, &doorEntry741)]),
		SectorDoors(2, [DoorConfig(0x16, 0x0D, DoorType.door, &doorEntry687), DoorConfig(0x16, 0x0E, DoorType.door, &doorEntry687)]),
		SectorDoors(3, [DoorConfig(0x18, 0x0D, DoorType.object, &doorEntry742), DoorConfig(0x18, 0x0F, DoorType.object, &doorEntry742), DoorConfig(0x18, 0x11, DoorType.object, &doorEntry742)]),
		SectorDoors(1, [DoorConfig(0x1A, 0x0A, DoorType.door, &doorEntry688)]),
		SectorDoors(1, [DoorConfig(0x1A, 0x0B, DoorType.door, &doorEntry738)]),
		SectorDoors(1, [DoorConfig(0x1A, 0x0B, DoorType.door, &doorEntry739)]),
		SectorDoors(1, [DoorConfig(0x01, 0x05, DoorType.door, &doorEntry388)]),
		SectorDoors(1, [DoorConfig(0x01, 0x0A, DoorType.door, &doorEntry389)]),
	], [
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
		SectorDoors(8, [DoorConfig(0x00, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x01, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x0D, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x0E, 0x0D, DoorType.door, &doorEntry901), DoorConfig(0x0F, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x10, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x0D, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x05, 0x0D, DoorType.stairway, 0x0300), DoorConfig(0x05, 0x1E, DoorType.stairway, 0x0200), DoorConfig(0x07, 0x05, DoorType.stairway, 0x0300), DoorConfig(0x07, 0x0F, DoorType.stairway, 0), DoorConfig(0x07, 0x1C, DoorType.stairway, 0x0100), DoorConfig(0x09, 0x07, DoorType.stairway, 0)]),
		SectorDoors(2, [DoorConfig(0x07, 0x0A, DoorType.stairway, 0x0200), DoorConfig(0x09, 0x08, DoorType.stairway, 0x0100)]),
		SectorDoors(4, [DoorConfig(0x09, 0x02, DoorType.stairway, 0x0200), DoorConfig(0x0B, 0x00, DoorType.stairway, 0x0100), DoorConfig(0x0B, 0x0E, DoorType.stairway, 0x0200), DoorConfig(0x0D, 0x0C, DoorType.stairway, 0x0100)]),
		SectorDoors(6, [DoorConfig(0x09, 0x09, DoorType.stairway, 0x0300), DoorConfig(0x09, 0x1A, DoorType.stairway, 0x0200), DoorConfig(0x0B, 0x01, DoorType.stairway, 0x0300), DoorConfig(0x0B, 0x0B, DoorType.stairway, 0), DoorConfig(0x0B, 0x18, DoorType.stairway, 0x0100), DoorConfig(0x0D, 0x03, DoorType.stairway, 0)]),
		SectorDoors(10, [DoorConfig(0x08, 0x08, DoorType.object, &doorEntry740), DoorConfig(0x08, 0x09, DoorType.object, &doorEntry740), DoorConfig(0x08, 0x0A, DoorType.object, &doorEntry740), DoorConfig(0x08, 0x0C, DoorType.object, &doorEntry740), DoorConfig(0x08, 0x0D, DoorType.object, &doorEntry740), DoorConfig(0x08, 0x0E, DoorType.object, &doorEntry740), DoorConfig(0x0B, 0x02, DoorType.stairway, 0x0200), DoorConfig(0x0B, 0x19, DoorType.stairway, 0x0300), DoorConfig(0x0D, 0x00, DoorType.stairway, 0x0100), DoorConfig(0x0D, 0x1B, DoorType.stairway, 0)]),
		SectorDoors(2, [DoorConfig(0x09, 0x05, DoorType.stairway, 0x0300), DoorConfig(0x0B, 0x07, DoorType.stairway, 0)]),
		SectorDoors(6, [DoorConfig(0x05, 0x09, DoorType.stairway, 0x0300), DoorConfig(0x05, 0x1E, DoorType.stairway, 0x0200), DoorConfig(0x07, 0x01, DoorType.stairway, 0x0300), DoorConfig(0x07, 0x0B, DoorType.stairway, 0), DoorConfig(0x07, 0x1C, DoorType.stairway, 0x0100), DoorConfig(0x09, 0x03, DoorType.stairway, 0)]),
		SectorDoors(3, [DoorConfig(0x07, 0x0A, DoorType.stairway, 0x0200), DoorConfig(0x09, 0x08, DoorType.stairway, 0x0100), DoorConfig(0x0B, 0x1E, DoorType.stairway, 0x0100)]),
		SectorDoors(1, [DoorConfig(0x09, 0x00, DoorType.stairway, 0x0200)]),
		SectorDoors(2, [DoorConfig(0x02, 0x02, DoorType.door, &doorEntry689), DoorConfig(0x02, 0x16, DoorType.door, &doorEntry690)]),
		SectorDoors(2, [DoorConfig(0x02, 0x02, DoorType.door, &doorEntry691), DoorConfig(0x02, 0x16, DoorType.door, &doorEntry692)]),
		SectorDoors(1, [DoorConfig(0x02, 0x02, DoorType.door, &doorEntry693)]),
		SectorDoors(3, [DoorConfig(0x04, 0x1E, DoorType.door, &doorEntry391), DoorConfig(0x1B, 0x11, DoorType.door, &doorEntry392), DoorConfig(0x1B, 0x1A, DoorType.door, &doorEntry393)]),
		SectorDoors(2, [DoorConfig(0x09, 0x1A, DoorType.door, &doorEntry390), DoorConfig(0x0A, 0x1B, DoorType.door, &doorEntry390)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0E, 0x03, DoorType.door, &doorEntry367)]),
		SectorDoors(2, [DoorConfig(0x10, 0x18, DoorType.door, &doorEntry30), DoorConfig(0x10, 0x1A, DoorType.door, &doorEntry30)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x02, 0x0A, DoorType.door, &doorEntry914)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, []),
		SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.door, &doorEntry667), DoorConfig(0x16, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x00, DoorType.door, &doorEntry667), DoorConfig(0x17, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x00, DoorType.door, &doorEntry668), DoorConfig(0x1B, 0x00, DoorType.door, &doorEntry668)]),
		SectorDoors(13, [DoorConfig(0x03, 0x1B, DoorType.door, &doorEntry669), DoorConfig(0x04, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x08, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x0A, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x0B, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x0C, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x09, DoorType.door, &doorEntry670)]),
		SectorDoors(2, [DoorConfig(0x16, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x09, DoorType.ropeLadder, 0)]),
		SectorDoors(3, [DoorConfig(0x09, 0x01, DoorType.door, &doorEntry797), DoorConfig(0x0A, 0x0A, DoorType.stairway, 0x0300), DoorConfig(0x1D, 0x1D, DoorType.stairway, 0)]),
		SectorDoors(1, [DoorConfig(0x1D, 0x0A, DoorType.door, &doorEntry798)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.door, &doorEntry458)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x19, 0x1F, DoorType.door, &doorEntry455), DoorConfig(0x1B, 0x01, DoorType.door, &doorEntry456)]),
		SectorDoors(1, [DoorConfig(0x01, 0x05, DoorType.door, &doorEntry394)]),
		SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry457)]),
	], [
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x02, 0x0B, DoorType.door, &doorEntry368), DoorConfig(0x06, 0x13, DoorType.door, &doorEntry369)]),
		SectorDoors(1, [DoorConfig(0x02, 0x07, DoorType.door, &doorEntry370)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x18, 0x1A, DoorType.door, &doorEntry400)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x09, 0x01, DoorType.door, &doorEntry272)]),
		SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry273)]),
		SectorDoors(1, [DoorConfig(0x19, 0x19, DoorType.door, &doorEntry743)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry808), DoorConfig(0x1D, 0x0E, DoorType.stairway, 0x0100)]),
		SectorDoors(6, [DoorConfig(0x09, 0x0E, DoorType.door, &doorEntry809), DoorConfig(0x0A, 0x01, DoorType.stairway, 0x0200), DoorConfig(0x15, 0x00, DoorType.door, &doorEntry330), DoorConfig(0x15, 0x0A, DoorType.stairway, 0x0300), DoorConfig(0x1D, 0x12, DoorType.stairway, 0), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry331)]),
		SectorDoors(7, [DoorConfig(0x08, 0x06, DoorType.door, &doorEntry548), DoorConfig(0x09, 0x05, DoorType.door, &doorEntry548), DoorConfig(0x0A, 0x04, DoorType.door, &doorEntry548), DoorConfig(0x0B, 0x03, DoorType.door, &doorEntry548), DoorConfig(0x0C, 0x02, DoorType.door, &doorEntry548), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry548), DoorConfig(0x1C, 0x19, DoorType.door, &doorEntry659)]),
		SectorDoors(1, [DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry813)]),
		SectorDoors(7, [DoorConfig(0x08, 0x15, DoorType.door, &doorEntry549), DoorConfig(0x09, 0x16, DoorType.door, &doorEntry549), DoorConfig(0x0A, 0x17, DoorType.door, &doorEntry549), DoorConfig(0x0B, 0x18, DoorType.door, &doorEntry549), DoorConfig(0x0C, 0x19, DoorType.door, &doorEntry549), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry549), DoorConfig(0x1D, 0x1E, DoorType.stairway, 0x0100)]),
		SectorDoors(2, [DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry814), DoorConfig(0x0A, 0x11, DoorType.stairway, 0x0200)]),
		SectorDoors(3, [DoorConfig(0x09, 0x12, DoorType.door, &doorEntry478), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry459), DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry460)]),
		SectorDoors(6, [DoorConfig(0x16, 0x00, DoorType.door, &doorEntry661), DoorConfig(0x16, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x00, DoorType.door, &doorEntry661), DoorConfig(0x17, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x00, DoorType.door, &doorEntry662), DoorConfig(0x1B, 0x00, DoorType.door, &doorEntry662)]),
		SectorDoors(1, [DoorConfig(0x0B, 0x1D, DoorType.door, &doorEntry663)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x16, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x1F, DoorType.door, &doorEntry664), DoorConfig(0x17, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x1F, DoorType.door, &doorEntry664), DoorConfig(0x1A, 0x1F, DoorType.door, &doorEntry665), DoorConfig(0x1B, 0x1F, DoorType.door, &doorEntry665)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x0D, 0x05, DoorType.door, &doorEntry793), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry794), DoorConfig(0x0E, 0x0F, DoorType.door, &doorEntry795), DoorConfig(0x0E, 0x10, DoorType.door, &doorEntry795), DoorConfig(0x11, 0x01, DoorType.door, &doorEntry796)]),
		SectorDoors(1, [DoorConfig(0x10, 0x09, DoorType.door, &doorEntry401)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x08, 0x14, DoorType.door, &doorEntry552), DoorConfig(0x09, 0x15, DoorType.door, &doorEntry552), DoorConfig(0x0A, 0x16, DoorType.door, &doorEntry552)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x18, 0x10, DoorType.door, &doorEntry562)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x13, 0x00, DoorType.door, &doorEntry744)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1F, 0x0E, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(13, [DoorConfig(0x0A, 0x0C, DoorType.door, &doorEntry423), DoorConfig(0x14, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x18, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1B, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1C, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1D, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1E, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1F, 0x06, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(13, [DoorConfig(0x04, 0x0C, DoorType.door, &doorEntry409), DoorConfig(0x05, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x08, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x0A, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x0B, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x0C, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x0F, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x1A, DoorType.door, &doorEntry410)]),
		SectorDoors(1, [DoorConfig(0x1E, 0x18, DoorType.door, &doorEntry963)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1B, 0x1C, DoorType.door, &doorEntry964), DoorConfig(0x1E, 0x02, DoorType.object, &doorEntry976)]),
		SectorDoors(0, []),
	], [
		SectorDoors(2, [DoorConfig(0x00, 0x19, DoorType.door, &doorEntry371), DoorConfig(0x00, 0x1A, DoorType.door, &doorEntry371)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x17, 0x04, DoorType.door, &doorEntry767), DoorConfig(0x17, 0x18, DoorType.door, &doorEntry768)]),
		SectorDoors(9, [DoorConfig(0x0C, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0F, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x13, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x1F, 0x0C, DoorType.door, &doorEntry769)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x02, 0x04, DoorType.door, &doorEntry553)]),
		SectorDoors(1, [DoorConfig(0x06, 0x0A, DoorType.object, &doorEntry672)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0B, 0x18, DoorType.door, &doorEntry745)]),
		SectorDoors(1, [DoorConfig(0x13, 0x08, DoorType.door, &doorEntry746)]),
		SectorDoors(1, [DoorConfig(0x03, 0x10, DoorType.door, &doorEntry747)]),
		SectorDoors(26, [DoorConfig(0x00, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x01, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x0E, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x13, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x14, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x15, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x16, 0x0D, DoorType.ropeLadder, 0x8000), DoorConfig(0x1A, 0x0C, DoorType.ropeLadder, 0x8000), DoorConfig(0x1B, 0x0C, DoorType.ropeLadder, 0x8000), DoorConfig(0x1C, 0x0C, DoorType.ropeLadder, 0x8000), DoorConfig(0x1D, 0x0C, DoorType.ropeLadder, 0x8000), DoorConfig(0x1E, 0x0C, DoorType.ropeLadder, 0x8000), DoorConfig(0x1F, 0x0C, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(7, [DoorConfig(0x00, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x01, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x06, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(16, [DoorConfig(0x10, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x18, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1B, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1C, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1D, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1E, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1F, 0x06, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x04, 0x08, DoorType.door, &doorEntry965), DoorConfig(0x05, 0x09, DoorType.door, &doorEntry965), DoorConfig(0x06, 0x0A, DoorType.door, &doorEntry965)]),
	], [
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x14, 0x15, DoorType.door, &doorEntry372), DoorConfig(0x14, 0x16, DoorType.door, &doorEntry372)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x04, 0x19, DoorType.door, &doorEntry770)]),
		SectorDoors(1, [DoorConfig(0x03, 0x0C, DoorType.door, &doorEntry771)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x16, 0x1A, DoorType.object, &doorEntry673)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x14, 0x14, DoorType.door, &doorEntry554), DoorConfig(0x16, 0x12, DoorType.door, &doorEntry554), DoorConfig(0x18, 0x10, DoorType.door, &doorEntry554)]),
		SectorDoors(1, [DoorConfig(0x02, 0x10, DoorType.door, &doorEntry555)]),
		SectorDoors(2, [DoorConfig(0x17, 0x03, DoorType.door, &doorEntry556), DoorConfig(0x18, 0x04, DoorType.door, &doorEntry556)]),
		SectorDoors(2, [DoorConfig(0x01, 0x0D, DoorType.door, &doorEntry557), DoorConfig(0x02, 0x0D, DoorType.door, &doorEntry557)]),
		SectorDoors(1, [DoorConfig(0x09, 0x1D, DoorType.door, &doorEntry748)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x00, 0x0C, DoorType.ropeLadder, 0x8000), DoorConfig(0x01, 0x0C, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x0C, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(1, [DoorConfig(0x0B, 0x11, DoorType.door, &doorEntry949)]),
		SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.door, &doorEntry648), DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry649)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x11, 0x0E, DoorType.object, &doorEntry975), DoorConfig(0x11, 0x1E, DoorType.door, &doorEntry974)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry430)]),
		SectorDoors(32, [DoorConfig(0x00, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x01, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x08, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x0A, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x0B, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x0C, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x0F, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x10, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x18, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1B, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1C, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1D, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1E, 0x06, DoorType.ropeLadder, 0), DoorConfig(0x1F, 0x06, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x04, 0x1C, DoorType.door, &doorEntry966), DoorConfig(0x06, 0x1A, DoorType.door, &doorEntry966), DoorConfig(0x08, 0x18, DoorType.door, &doorEntry966)]),
		SectorDoors(0, []),
	], [
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0B, 0x0A, DoorType.door, &doorEntry377), DoorConfig(0x0B, 0x0B, DoorType.door, &doorEntry377)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(4, [DoorConfig(0x17, 0x1E, DoorType.door, &doorEntry558), DoorConfig(0x1C, 0x19, DoorType.door, &doorEntry558), DoorConfig(0x1D, 0x18, DoorType.door, &doorEntry558), DoorConfig(0x1E, 0x17, DoorType.door, &doorEntry558)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x0C, 0x19, DoorType.door, &doorEntry660), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry789), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry790)]),
		SectorDoors(4, [DoorConfig(0x15, 0x09, DoorType.door, &doorEntry760), DoorConfig(0x15, 0x0A, DoorType.door, &doorEntry760), DoorConfig(0x19, 0x19, DoorType.door, &doorEntry761), DoorConfig(0x19, 0x1A, DoorType.door, &doorEntry761)]),
		SectorDoors(3, [DoorConfig(0x19, 0x15, DoorType.door, &doorEntry762), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry762)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x15, DoorType.person, &doorEntry960), DoorConfig(0x0D, 0x16, DoorType.person, &doorEntry960)]),
		SectorDoors(2, [DoorConfig(0x1F, 0x11, DoorType.object, &doorEntry957), DoorConfig(0x1F, 0x13, DoorType.object, &doorEntry957)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1B, 0x11, DoorType.object, &doorEntry958), DoorConfig(0x1B, 0x13, DoorType.object, &doorEntry958)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.door, &doorEntry431)]),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x06, 0x07, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x07, DoorType.ropeLadder, 0), DoorConfig(0x08, 0x07, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x07, DoorType.ropeLadder, 0), DoorConfig(0x0A, 0x07, DoorType.ropeLadder, 0)]),
		SectorDoors(1, [DoorConfig(0x0A, 0x07, DoorType.door, &doorEntry424)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x09, 0x15, DoorType.door, &doorEntry374)]),
		SectorDoors(2, [DoorConfig(0x04, 0x01, DoorType.door, &doorEntry373), DoorConfig(0x04, 0x02, DoorType.door, &doorEntry373)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0B, 0x04, DoorType.door, &doorEntry559)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x0E, 0x0D, DoorType.object, &doorEntry674), DoorConfig(0x0E, 0x10, DoorType.door, &doorEntry560), DoorConfig(0x0F, 0x11, DoorType.door, &doorEntry560)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0C, 0x19, DoorType.door, &doorEntry666), DoorConfig(0x19, 0x0E, DoorType.door, &doorEntry799)]),
		SectorDoors(1, [DoorConfig(0x0E, 0x0E, DoorType.door, &doorEntry444)]),
		SectorDoors(1, [DoorConfig(0x12, 0x0B, DoorType.door, &doorEntry445)]),
		SectorDoors(3, [DoorConfig(0x10, 0x1F, DoorType.door, &doorEntry950), DoorConfig(0x11, 0x15, DoorType.person, &doorEntry961), DoorConfig(0x11, 0x16, DoorType.person, &doorEntry961)]),
		SectorDoors(2, [DoorConfig(0x09, 0x0D, DoorType.person, &doorEntry962), DoorConfig(0x09, 0x0E, DoorType.person, &doorEntry962)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(4, [DoorConfig(0x07, 0x01, DoorType.person, &doorEntry959), DoorConfig(0x07, 0x02, DoorType.person, &doorEntry959), DoorConfig(0x08, 0x0B, DoorType.door, &doorEntry951), DoorConfig(0x0C, 0x1B, DoorType.door, &doorEntry952)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.door, &doorEntry903), DoorConfig(0x19, 0x06, DoorType.door, &doorEntry903)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, []),
		SectorDoors(1, [DoorConfig(0x0A, 0x18, DoorType.object, &doorEntry977)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.door, &doorEntry429)]),
	], [
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x02, 0x08, DoorType.door, &doorEntry375)]),
		SectorDoors(2, [DoorConfig(0x00, 0x11, DoorType.door, &doorEntry376), DoorConfig(0x00, 0x12, DoorType.door, &doorEntry376)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, []),
		SectorDoors(3, [DoorConfig(0x02, 0x1F, DoorType.door, &doorEntry772), DoorConfig(0x15, 0x18, DoorType.switch_, &doorEntry779), DoorConfig(0x1C, 0x1A, DoorType.switch_, &doorEntry778)]),
		SectorDoors(5, [DoorConfig(0x02, 0x00, DoorType.door, &doorEntry772), DoorConfig(0x0C, 0x00, DoorType.person, &doorEntry774), DoorConfig(0x11, 0x00, DoorType.switch_, &doorEntry775), DoorConfig(0x15, 0x07, DoorType.switch_, &doorEntry776), DoorConfig(0x1C, 0x05, DoorType.switch_, &doorEntry777)]),
		SectorDoors(8, [DoorConfig(0x18, 0x16, DoorType.door, &doorEntry561), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry561), DoorConfig(0x1A, 0x16, DoorType.door, &doorEntry561), DoorConfig(0x1B, 0x16, DoorType.door, &doorEntry561), DoorConfig(0x1C, 0x16, DoorType.door, &doorEntry561), DoorConfig(0x1D, 0x16, DoorType.door, &doorEntry561), DoorConfig(0x1E, 0x16, DoorType.door, &doorEntry561), DoorConfig(0x1F, 0x16, DoorType.door, &doorEntry561)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x19, 0x17, DoorType.door, &doorEntry110)]),
		SectorDoors(3, [DoorConfig(0x0C, 0x1D, DoorType.door, &doorEntry671), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry802), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry803)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry645), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry563)]),
		SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.door, &doorEntry633)]),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry564), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry565), DoorConfig(0x17, 0x05, DoorType.door, &doorEntry566)]),
		SectorDoors(1, [DoorConfig(0x0A, 0x0E, DoorType.door, &doorEntry567)]),
		SectorDoors(2, [DoorConfig(0x0A, 0x01, DoorType.door, &doorEntry568), DoorConfig(0x0D, 0x0E, DoorType.door, &doorEntry569)]),
		SectorDoors(4, [DoorConfig(0x07, 0x0D, DoorType.door, &doorEntry570), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry571), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry572), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry573)]),
		SectorDoors(1, [DoorConfig(0x0C, 0x05, DoorType.door, &doorEntry407)]),
		SectorDoors(2, [DoorConfig(0x07, 0x0E, DoorType.object, &doorEntry677), DoorConfig(0x09, 0x05, DoorType.door, &doorEntry970)]),
		SectorDoors(1, [DoorConfig(0x0C, 0x1E, DoorType.door, &doorEntry408)]),
		SectorDoors(2, [DoorConfig(0x19, 0x0A, DoorType.stairway, 0x0300), DoorConfig(0x1D, 0x0E, DoorType.stairway, 0)]),
		SectorDoors(2, [DoorConfig(0x0B, 0x1D, DoorType.door, &doorEntry967), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry448)]),
		SectorDoors(3, [DoorConfig(0x07, 0x0A, DoorType.object, &doorEntry677), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry968), DoorConfig(0x19, 0x1B, DoorType.door, &doorEntry449)]),
		SectorDoors(1, [DoorConfig(0x1D, 0x00, DoorType.door, &doorEntry413)]),
		SectorDoors(4, [DoorConfig(0x01, 0x0E, DoorType.stairway, 0x0300), DoorConfig(0x05, 0x12, DoorType.stairway, 0), DoorConfig(0x05, 0x1E, DoorType.door, &doorEntry414), DoorConfig(0x1D, 0x04, DoorType.door, &doorEntry415)]),
	], [
		SectorDoors(2, [DoorConfig(0x14, 0x1E, DoorType.door, &doorEntry452), DoorConfig(0x14, 0x1F, DoorType.door, &doorEntry452)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x14, 0x0E, DoorType.door, &doorEntry453), DoorConfig(0x14, 0x0F, DoorType.door, &doorEntry453)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(10, [DoorConfig(0x00, 0x0C, DoorType.door, &doorEntry476), DoorConfig(0x01, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x0C, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry477), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry479)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x03, 0x01, DoorType.door, &doorEntry332), DoorConfig(0x03, 0x1E, DoorType.door, &doorEntry333), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry440)]),
		SectorDoors(4, [DoorConfig(0x06, 0x12, DoorType.door, &doorEntry933), DoorConfig(0x0A, 0x01, DoorType.door, &doorEntry934), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry806), DoorConfig(0x1D, 0x05, DoorType.switch_, 0x20ED)]),
		SectorDoors(2, [DoorConfig(0x11, 0x1E, DoorType.object, &doorEntry679), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry634)]),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x16, 0x1D, DoorType.door, &doorEntry635), DoorConfig(0x17, 0x1D, DoorType.door, &doorEntry635), DoorConfig(0x18, 0x1D, DoorType.door, &doorEntry635), DoorConfig(0x19, 0x1D, DoorType.door, &doorEntry635), DoorConfig(0x1A, 0x1D, DoorType.door, &doorEntry635), DoorConfig(0x1B, 0x1D, DoorType.door, &doorEntry635)]),
		SectorDoors(4, [DoorConfig(0x07, 0x10, DoorType.door, &doorEntry574), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry575), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry576), DoorConfig(0x17, 0x05, DoorType.door, &doorEntry577)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x01, 0x02, DoorType.door, &doorEntry578)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry579), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry580)]),
		SectorDoors(6, [DoorConfig(0x12, 0x05, DoorType.door, &doorEntry499), DoorConfig(0x13, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x05, DoorType.ropeLadder, 0)]),
		SectorDoors(9, [DoorConfig(0x07, 0x05, DoorType.door, &doorEntry533), DoorConfig(0x07, 0x09, DoorType.door, &doorEntry534), DoorConfig(0x09, 0x0E, DoorType.door, &doorEntry535), DoorConfig(0x12, 0x19, DoorType.door, &doorEntry500), DoorConfig(0x13, 0x19, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x19, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x19, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x19, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x19, DoorType.ropeLadder, 0)]),
		SectorDoors(1, [DoorConfig(0x11, 0x00, DoorType.door, &doorEntry419)]),
		SectorDoors(0, []),
		SectorDoors(7, [DoorConfig(0x02, 0x0D, DoorType.door, &doorEntry501), DoorConfig(0x03, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x0D, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry506)]),
		SectorDoors(8, [DoorConfig(0x10, 0x18, DoorType.door, &doorEntry505), DoorConfig(0x11, 0x18, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x18, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x18, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x18, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x18, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x18, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x18, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1C, 0x06, DoorType.door, &doorEntry454), DoorConfig(0x1C, 0x07, DoorType.door, &doorEntry454)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0B, 0x17, DoorType.door, &doorEntry773)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.door, &doorEntry765)]),
		SectorDoors(3, [DoorConfig(0x19, 0x15, DoorType.door, &doorEntry766), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry766)]),
		SectorDoors(12, [DoorConfig(0x14, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x18, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x1B, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x1C, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x1D, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x1E, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x1F, 0x16, DoorType.ropeLadder, 0)]),
		SectorDoors(2, [DoorConfig(0x07, 0x1E, DoorType.object, &doorEntry462), DoorConfig(0x11, 0x06, DoorType.door, &doorEntry434)]),
		SectorDoors(1, [DoorConfig(0x06, 0x04, DoorType.door, &doorEntry435)]),
		SectorDoors(21, [DoorConfig(0x09, 0x1A, DoorType.door, &doorEntry436), DoorConfig(0x0C, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x0F, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x10, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x18, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x1B, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x1C, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x1D, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x1E, 0x0E, DoorType.ropeLadder, 0), DoorConfig(0x1F, 0x0E, DoorType.ropeLadder, 0)]),
		SectorDoors(2, [DoorConfig(0x0A, 0x01, DoorType.door, &doorEntry929), DoorConfig(0x19, 0x1B, DoorType.door, &doorEntry111)]),
		SectorDoors(5, [DoorConfig(0x05, 0x15, DoorType.stairway, 0x0200), DoorConfig(0x05, 0x1E, DoorType.door, &doorEntry334), DoorConfig(0x0D, 0x00, DoorType.door, &doorEntry335), DoorConfig(0x0D, 0x0D, DoorType.stairway, 0x0100), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry441)]),
		SectorDoors(5, [DoorConfig(0x0A, 0x01, DoorType.door, &doorEntry935), DoorConfig(0x0A, 0x0E, DoorType.door, &doorEntry936), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry807), DoorConfig(0x1A, 0x0E, DoorType.object, &doorEntry817)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry581), DoorConfig(0x11, 0x01, DoorType.door, &doorEntry582)]),
		SectorDoors(3, [DoorConfig(0x07, 0x19, DoorType.door, &doorEntry636), DoorConfig(0x07, 0x1A, DoorType.door, &doorEntry636), DoorConfig(0x0B, 0x0B, DoorType.door, &doorEntry637)]),
		SectorDoors(1, [DoorConfig(0x15, 0x1E, DoorType.door, &doorEntry638)]),
		SectorDoors(4, [DoorConfig(0x07, 0x0A, DoorType.door, &doorEntry583), DoorConfig(0x07, 0x10, DoorType.door, &doorEntry584), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry585), DoorConfig(0x17, 0x05, DoorType.door, &doorEntry586)]),
		SectorDoors(1, [DoorConfig(0x05, 0x09, DoorType.door, &doorEntry587)]),
		SectorDoors(1, [DoorConfig(0x05, 0x0A, DoorType.door, &doorEntry588)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry589), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry590)]),
		SectorDoors(6, [DoorConfig(0x07, 0x05, DoorType.door, &doorEntry521), DoorConfig(0x07, 0x0D, DoorType.door, &doorEntry522), DoorConfig(0x09, 0x12, DoorType.door, &doorEntry523), DoorConfig(0x15, 0x00, DoorType.door, &doorEntry420), DoorConfig(0x15, 0x0E, DoorType.stairway, 0x0300), DoorConfig(0x1D, 0x16, DoorType.stairway, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.door, &doorEntry493), DoorConfig(0x09, 0x16, DoorType.door, &doorEntry493)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x05, 0x1E, DoorType.door, &doorEntry416)]),
		SectorDoors(1, [DoorConfig(0x05, 0x1E, DoorType.door, &doorEntry417)]),
		SectorDoors(7, [DoorConfig(0x02, 0x15, DoorType.door, &doorEntry502), DoorConfig(0x03, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry418)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0A, 0x10, DoorType.door, &doorEntry437)]),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x00, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x01, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x16, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x05, DoorType.door, &doorEntry438)]),
		SectorDoors(0, []),
		SectorDoors(12, [DoorConfig(0x0C, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x0F, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x10, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x1A, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x1A, DoorType.ropeLadder, 0)]),
		SectorDoors(1, [DoorConfig(0x1D, 0x0A, DoorType.door, &doorEntry439)]),
		SectorDoors(3, [DoorConfig(0x0A, 0x01, DoorType.door, &doorEntry930), DoorConfig(0x0A, 0x1A, DoorType.door, &doorEntry931), DoorConfig(0x19, 0x17, DoorType.door, &doorEntry112)]),
		SectorDoors(9, [DoorConfig(0x00, 0x1C, DoorType.door, &doorEntry336), DoorConfig(0x01, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x15, DoorType.stairway, 0x0200), DoorConfig(0x0D, 0x00, DoorType.door, &doorEntry337), DoorConfig(0x0D, 0x0D, DoorType.stairway, 0x0100), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry442)]),
		SectorDoors(4, [DoorConfig(0x0A, 0x12, DoorType.door, &doorEntry937), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry810), DoorConfig(0x1A, 0x09, DoorType.door, &doorEntry811), DoorConfig(0x1A, 0x0A, DoorType.door, &doorEntry811)]),
		SectorDoors(2, [DoorConfig(0x1A, 0x1E, DoorType.person, &doorEntry681), DoorConfig(0x1D, 0x11, DoorType.door, &doorEntry639)]),
		SectorDoors(6, [DoorConfig(0x1A, 0x04, DoorType.person, &doorEntry681), DoorConfig(0x1A, 0x09, DoorType.person, &doorEntry681), DoorConfig(0x1A, 0x0A, DoorType.person, &doorEntry681), DoorConfig(0x1A, 0x15, DoorType.person, &doorEntry681), DoorConfig(0x1A, 0x16, DoorType.person, &doorEntry681), DoorConfig(0x1A, 0x1C, DoorType.person, &doorEntry681)]),
		SectorDoors(2, [DoorConfig(0x1A, 0x02, DoorType.person, &doorEntry681), DoorConfig(0x1D, 0x0E, DoorType.door, &doorEntry640)]),
		SectorDoors(4, [DoorConfig(0x07, 0x10, DoorType.door, &doorEntry591), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry592), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry593), DoorConfig(0x17, 0x05, DoorType.door, &doorEntry594)]),
		SectorDoors(4, [DoorConfig(0x1A, 0x09, DoorType.door, &doorEntry595), DoorConfig(0x1A, 0x11, DoorType.door, &doorEntry596), DoorConfig(0x1A, 0x19, DoorType.door, &doorEntry675), DoorConfig(0x1A, 0x1D, DoorType.door, &doorEntry675)]),
		SectorDoors(4, [DoorConfig(0x01, 0x0A, DoorType.door, &doorEntry597), DoorConfig(0x1A, 0x09, DoorType.door, &doorEntry598), DoorConfig(0x1A, 0x11, DoorType.door, &doorEntry599), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry600)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry601), DoorConfig(0x19, 0x0A, DoorType.door, &doorEntry602)]),
		SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.door, &doorEntry524), DoorConfig(0x07, 0x0D, DoorType.door, &doorEntry525), DoorConfig(0x09, 0x12, DoorType.door, &doorEntry526), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry507), DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry508)]),
		SectorDoors(8, [DoorConfig(0x02, 0x15, DoorType.door, &doorEntry503), DoorConfig(0x03, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry972), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry973)]),
		SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.door, &doorEntry536), DoorConfig(0x07, 0x15, DoorType.door, &doorEntry537), DoorConfig(0x09, 0x1A, DoorType.door, &doorEntry538), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry425), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry426)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.door, &doorEntry494), DoorConfig(0x09, 0x16, DoorType.door, &doorEntry494)]),
		SectorDoors(3, [DoorConfig(0x07, 0x05, DoorType.door, &doorEntry545), DoorConfig(0x09, 0x16, DoorType.door, &doorEntry546), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry969)]),
	], [
		SectorDoors(1, [DoorConfig(0x13, 0x18, DoorType.door, &doorEntry943)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0B, 0x14, DoorType.door, &doorEntry944), DoorConfig(0x0B, 0x15, DoorType.door, &doorEntry944)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x05, 0x0B, DoorType.door, &doorEntry164)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x09, 0x16, DoorType.door, &doorEntry791), DoorConfig(0x0A, 0x0D, DoorType.stairway, 0x0200)]),
		SectorDoors(1, [DoorConfig(0x0A, 0x0E, DoorType.door, &doorEntry932)]),
		SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.door, &doorEntry123), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry443)]),
		SectorDoors(3, [DoorConfig(0x08, 0x0D, DoorType.door, &doorEntry399), DoorConfig(0x19, 0x12, DoorType.door, &doorEntry812)]),
		SectorDoors(9, [DoorConfig(0x02, 0x16, DoorType.person, &doorEntry681), DoorConfig(0x02, 0x1C, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x0E, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x14, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x1A, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x0A, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x10, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x16, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x1C, DoorType.person, &doorEntry681)]),
		SectorDoors(13, [DoorConfig(0x02, 0x02, DoorType.person, &doorEntry681), DoorConfig(0x02, 0x08, DoorType.person, &doorEntry681), DoorConfig(0x02, 0x18, DoorType.person, &doorEntry681), DoorConfig(0x02, 0x1E, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x00, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x06, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x0C, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x14, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x1A, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x02, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x08, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x18, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x1E, DoorType.person, &doorEntry681)]),
		SectorDoors(10, [DoorConfig(0x02, 0x04, DoorType.person, &doorEntry681), DoorConfig(0x02, 0x0A, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x00, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x06, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x0C, DoorType.person, &doorEntry681), DoorConfig(0x0A, 0x12, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x04, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x0A, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x10, DoorType.person, &doorEntry681), DoorConfig(0x0E, 0x16, DoorType.person, &doorEntry681)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry603)]),
		SectorDoors(1, [DoorConfig(0x11, 0x09, DoorType.door, &doorEntry605)]),
		SectorDoors(1, [DoorConfig(0x0B, 0x02, DoorType.door, &doorEntry604)]),
		SectorDoors(5, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry606), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry607), DoorConfig(0x17, 0x11, DoorType.door, &doorEntry608), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry609), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry610)]),
		SectorDoors(3, [DoorConfig(0x09, 0x0E, DoorType.door, &doorEntry527), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry509), DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry510)]),
		SectorDoors(3, [DoorConfig(0x05, 0x00, DoorType.door, &doorEntry411), DoorConfig(0x05, 0x06, DoorType.stairway, 0x0300), DoorConfig(0x09, 0x0A, DoorType.stairway, 0)]),
		SectorDoors(3, [DoorConfig(0x09, 0x0E, DoorType.door, &doorEntry539), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry518), DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry517)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x09, 0x15, DoorType.door, &doorEntry495), DoorConfig(0x09, 0x16, DoorType.door, &doorEntry495)]),
		SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.door, &doorEntry541), DoorConfig(0x07, 0x0D, DoorType.door, &doorEntry542), DoorConfig(0x09, 0x12, DoorType.door, &doorEntry543), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry427), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry428)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x0D, DoorType.door, &doorEntry496), DoorConfig(0x0D, 0x0E, DoorType.door, &doorEntry496)]),
	], [
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1B, 0x14, DoorType.door, &doorEntry947), DoorConfig(0x1B, 0x15, DoorType.door, &doorEntry947)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0B, 0x19, DoorType.door, &doorEntry165)]),
		SectorDoors(1, [DoorConfig(0x0B, 0x19, DoorType.door, &doorEntry166)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x1B, DoorType.door, &doorEntry179)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1D, 0x05, DoorType.door, &doorEntry792), DoorConfig(0x1D, 0x0E, DoorType.stairway, 0x0100)]),
		SectorDoors(2, [DoorConfig(0x05, 0x12, DoorType.stairway, 0x0100), DoorConfig(0x06, 0x05, DoorType.stairway, 0x0200)]),
		SectorDoors(2, [DoorConfig(0x1A, 0x01, DoorType.door, &doorEntry915), DoorConfig(0x1A, 0x02, DoorType.door, &doorEntry915)]),
		SectorDoors(1, [DoorConfig(0x05, 0x05, DoorType.door, &doorEntry749)]),
		SectorDoors(10, [DoorConfig(0x0D, 0x08, DoorType.object, &doorEntry876), DoorConfig(0x11, 0x05, DoorType.door, &doorEntry832), DoorConfig(0x11, 0x06, DoorType.door, &doorEntry832), DoorConfig(0x16, 0x15, DoorType.door, &doorEntry833), DoorConfig(0x17, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x18, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x19, 0x0A, DoorType.object, &doorEntry877), DoorConfig(0x19, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1A, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1B, 0x15, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(1, [DoorConfig(0x15, 0x06, DoorType.object, &doorEntry878)]),
		SectorDoors(1, [DoorConfig(0x0C, 0x02, DoorType.door, &doorEntry611)]),
		SectorDoors(2, [DoorConfig(0x0B, 0x13, DoorType.escalator, 0x0300), DoorConfig(0x0E, 0x10, DoorType.escalator, 0x8000)]),
		SectorDoors(1, [DoorConfig(0x1E, 0x06, DoorType.escalator, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x07, 0x0D, DoorType.object, &doorEntry676), DoorConfig(0x07, 0x12, DoorType.door, &doorEntry612), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry613), DoorConfig(0x17, 0x11, DoorType.door, &doorEntry614), DoorConfig(0x17, 0x1D, DoorType.door, &doorEntry615)]),
		SectorDoors(3, [DoorConfig(0x07, 0x0E, DoorType.object, &doorEntry677), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry616), DoorConfig(0x1D, 0x0E, DoorType.door, &doorEntry617)]),
		SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry618), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry619), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry620)]),
		SectorDoors(5, [DoorConfig(0x07, 0x05, DoorType.door, &doorEntry528), DoorConfig(0x07, 0x09, DoorType.door, &doorEntry529), DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry530), DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry511), DoorConfig(0x1B, 0x01, DoorType.door, &doorEntry512)]),
		SectorDoors(1, [DoorConfig(0x1D, 0x00, DoorType.door, &doorEntry412)]),
		SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.door, &doorEntry519)]),
		SectorDoors(3, [DoorConfig(0x05, 0x19, DoorType.door, &doorEntry497), DoorConfig(0x05, 0x1A, DoorType.door, &doorEntry497), DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry520)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x09, 0x0E, DoorType.door, &doorEntry544)]),
		SectorDoors(0, []),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0F, 0x13, DoorType.object, &doorEntry241), DoorConfig(0x0F, 0x15, DoorType.object, &doorEntry241)]),
		SectorDoors(2, [DoorConfig(0x0E, 0x0B, DoorType.door, &doorEntry167), DoorConfig(0x0E, 0x1C, DoorType.door, &doorEntry168)]),
		SectorDoors(1, [DoorConfig(0x11, 0x12, DoorType.door, &doorEntry169)]),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x10, 0x16, DoorType.door, &doorEntry170), DoorConfig(0x11, 0x01, DoorType.object, &doorEntry243), DoorConfig(0x11, 0x03, DoorType.object, &doorEntry243), DoorConfig(0x11, 0x04, DoorType.object, &doorEntry243), DoorConfig(0x11, 0x06, DoorType.object, &doorEntry243)]),
		SectorDoors(5, [DoorConfig(0x1A, 0x09, DoorType.object, &doorEntry244), DoorConfig(0x1A, 0x0B, DoorType.object, &doorEntry244), DoorConfig(0x1A, 0x0C, DoorType.object, &doorEntry244), DoorConfig(0x1A, 0x0E, DoorType.object, &doorEntry244), DoorConfig(0x1A, 0x13, DoorType.door, &doorEntry180)]),
		SectorDoors(2, [DoorConfig(0x1B, 0x01, DoorType.object, &doorEntry245), DoorConfig(0x1B, 0x02, DoorType.object, &doorEntry245)]),
		SectorDoors(0, []),
		SectorDoors(15, [DoorConfig(0x03, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x09, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x1D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x09, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x1D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x09, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x1D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x09, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x1D, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x0E, DoorType.door, &doorEntry916), DoorConfig(0x1E, 0x02, DoorType.door, &doorEntry917), DoorConfig(0x1E, 0x0D, DoorType.door, &doorEntry918)]),
		SectorDoors(12, [DoorConfig(0x0E, 0x11, DoorType.door, &doorEntry919), DoorConfig(0x0F, 0x09, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x09, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x09, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x02, DoorType.door, &doorEntry920), DoorConfig(0x12, 0x09, DoorType.ropeLadder, 0x8000), DoorConfig(0x17, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x18, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x19, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1A, 0x05, DoorType.door, &doorEntry921), DoorConfig(0x1A, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1F, 0x05, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(4, [DoorConfig(0x1B, 0x01, DoorType.ropeLadder, 0x8000), DoorConfig(0x1C, 0x01, DoorType.ropeLadder, 0x8000), DoorConfig(0x1D, 0x01, DoorType.ropeLadder, 0x8000), DoorConfig(0x1E, 0x01, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(5, [DoorConfig(0x01, 0x1D, DoorType.door, &doorEntry834), DoorConfig(0x01, 0x1E, DoorType.door, &doorEntry834), DoorConfig(0x02, 0x12, DoorType.object, &doorEntry879), DoorConfig(0x15, 0x09, DoorType.object, &doorEntry880)]),
		SectorDoors(4, [DoorConfig(0x01, 0x11, DoorType.door, &doorEntry835), DoorConfig(0x01, 0x12, DoorType.door, &doorEntry835), DoorConfig(0x0D, 0x0E, DoorType.object, &doorEntry881)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1A, 0x11, DoorType.escalator, 0x8000), DoorConfig(0x1D, 0x14, DoorType.escalator, 0x0100)]),
		SectorDoors(3, [DoorConfig(0x01, 0x03, DoorType.escalator, 0), DoorConfig(0x07, 0x04, DoorType.escalator, 0x0200), DoorConfig(0x0A, 0x07, DoorType.escalator, 0x8000)]),
		SectorDoors(1, [DoorConfig(0x0B, 0x1C, DoorType.door, &doorEntry621)]),
		SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry622), DoorConfig(0x17, 0x12, DoorType.object, &doorEntry680), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry641)]),
		SectorDoors(4, [DoorConfig(0x0B, 0x05, DoorType.door, &doorEntry623), DoorConfig(0x0B, 0x0D, DoorType.object, &doorEntry678), DoorConfig(0x0B, 0x11, DoorType.door, &doorEntry624), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry625)]),
		SectorDoors(3, [DoorConfig(0x06, 0x0D, DoorType.door, &doorEntry626), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry627), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry628)]),
		SectorDoors(3, [DoorConfig(0x05, 0x0A, DoorType.door, &doorEntry531), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry514), DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry513)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry971)]),
		SectorDoors(1, [DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry540)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1F, 0x09, DoorType.door, &doorEntry172)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x06, 0x0A, DoorType.door, &doorEntry239), DoorConfig(0x0E, 0x02, DoorType.door, &doorEntry178)]),
		SectorDoors(0, []),
		SectorDoors(10, [DoorConfig(0x03, 0x1D, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x1D, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x1D, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x1D, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x12, DoorType.door, &doorEntry922), DoorConfig(0x0F, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x05, DoorType.door, &doorEntry923), DoorConfig(0x11, 0x19, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x19, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(6, [DoorConfig(0x02, 0x1D, DoorType.door, &doorEntry924), DoorConfig(0x03, 0x11, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x11, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x11, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x11, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x16, DoorType.door, &doorEntry925)]),
		SectorDoors(10, [DoorConfig(0x00, 0x05, DoorType.ropeLadder, 0x8000), DoorConfig(0x01, 0x05, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x05, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x1D, DoorType.door, &doorEntry926), DoorConfig(0x06, 0x0E, DoorType.door, &doorEntry927), DoorConfig(0x0B, 0x11, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x11, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x11, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x11, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x0D, DoorType.door, &doorEntry928)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x19, 0x09, DoorType.door, &doorEntry757), DoorConfig(0x19, 0x0A, DoorType.door, &doorEntry757)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x01, 0x04, DoorType.door, &doorEntry629)]),
		SectorDoors(2, [DoorConfig(0x03, 0x13, DoorType.escalator, 0x0300), DoorConfig(0x06, 0x10, DoorType.escalator, 0x8000)]),
		SectorDoors(2, [DoorConfig(0x16, 0x06, DoorType.escalator, 0x8000), DoorConfig(0x19, 0x03, DoorType.escalator, 0)]),
		SectorDoors(3, [DoorConfig(0x16, 0x17, DoorType.door, &doorEntry630), DoorConfig(0x17, 0x18, DoorType.door, &doorEntry630), DoorConfig(0x18, 0x19, DoorType.door, &doorEntry630)]),
		SectorDoors(3, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry642), DoorConfig(0x1B, 0x0D, DoorType.door, &doorEntry643), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry644)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry631), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry632)]),
		SectorDoors(5, [DoorConfig(0x0A, 0x1A, DoorType.door, &doorEntry823), DoorConfig(0x1C, 0x00, DoorType.door, &doorEntry646), DoorConfig(0x1D, 0x00, DoorType.door, &doorEntry646), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry647), DoorConfig(0x1E, 0x00, DoorType.door, &doorEntry646)]),
		SectorDoors(3, [DoorConfig(0x09, 0x12, DoorType.door, &doorEntry532), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry516), DoorConfig(0x19, 0x1E, DoorType.door, &doorEntry515)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x09, 0x0A, DoorType.door, &doorEntry421)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry422)]),
		SectorDoors(1, [DoorConfig(0x11, 0x16, DoorType.door, &doorEntry547)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1A, 0x1A, DoorType.door, &doorEntry498)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x12, 0x09, DoorType.door, &doorEntry176), DoorConfig(0x16, 0x1F, DoorType.door, &doorEntry175)]),
		SectorDoors(1, [DoorConfig(0x15, 0x15, DoorType.door, &doorEntry174)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x18, 0x06, DoorType.door, &doorEntry181)]),
		SectorDoors(21, [DoorConfig(0x00, 0x14, DoorType.door, &doorEntry117), DoorConfig(0x01, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x08, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x0A, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x0B, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x0C, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x0D, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x0E, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x0F, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x10, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x14, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x01, DoorType.door, &doorEntry118)]),
		SectorDoors(13, [DoorConfig(0x03, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x1F, 0x0F, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(2, [DoorConfig(0x10, 0x12, DoorType.door, &doorEntry884), DoorConfig(0x10, 0x13, DoorType.door, &doorEntry884)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1B, 0x04, DoorType.escalator, 0x0200), DoorConfig(0x1E, 0x07, DoorType.escalator, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x19, 0x01, DoorType.door, &doorEntry450)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0B, 0x08, DoorType.door, &doorEntry780), DoorConfig(0x19, 0x1B, DoorType.door, &doorEntry451)]),
	], [
		SectorDoors(1, [DoorConfig(0x1F, 0x1B, DoorType.door, &doorEntry463)]),
		SectorDoors(14, [DoorConfig(0x12, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x15, DoorType.door, &doorEntry467), DoorConfig(0x15, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x18, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x19, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x1A, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x1B, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x1C, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x1D, 0x05, DoorType.ropeLadder, 0), DoorConfig(0x1F, 0x15, DoorType.ropeLadder, 0)]),
		SectorDoors(1, [DoorConfig(0x10, 0x05, DoorType.door, &doorEntry472)]),
		SectorDoors(2, [DoorConfig(0x17, 0x10, DoorType.door, &doorEntry946), DoorConfig(0x17, 0x11, DoorType.door, &doorEntry946)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x0A, 0x05, DoorType.object, &doorEntry242), DoorConfig(0x0A, 0x07, DoorType.object, &doorEntry242), DoorConfig(0x0A, 0x08, DoorType.object, &doorEntry242), DoorConfig(0x0A, 0x0A, DoorType.object, &doorEntry242), DoorConfig(0x0E, 0x17, DoorType.door, &doorEntry171), DoorConfig(0x16, 0x0F, DoorType.door, &doorEntry173)]),
		SectorDoors(3, [DoorConfig(0x0F, 0x12, DoorType.object, &doorEntry246), DoorConfig(0x0F, 0x14, DoorType.object, &doorEntry246), DoorConfig(0x16, 0x1D, DoorType.door, &doorEntry177)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x19, 0x05, DoorType.door, &doorEntry758)]),
		SectorDoors(16, [DoorConfig(0x00, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x01, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x0F, DoorType.ropeLadder, 0x8000), DoorConfig(0x16, 0x1E, DoorType.door, &doorEntry759)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(4, [DoorConfig(0x0E, 0x11, DoorType.escalator, 0x8000), DoorConfig(0x11, 0x14, DoorType.escalator, 0x0100), DoorConfig(0x17, 0x13, DoorType.escalator, 0x0300), DoorConfig(0x1A, 0x10, DoorType.escalator, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x07, 0x19, DoorType.door, &doorEntry187), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry188), DoorConfig(0x17, 0x11, DoorType.door, &doorEntry230), DoorConfig(0x17, 0x12, DoorType.door, &doorEntry230), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry231), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry232)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.door, &doorEntry189), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry193)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry191)]),
	], [
		SectorDoors(10, [DoorConfig(0x02, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x18, DoorType.door, &doorEntry465), DoorConfig(0x06, 0x1B, DoorType.ropeLadder, 0), DoorConfig(0x0F, 0x15, DoorType.door, &doorEntry466), DoorConfig(0x10, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x15, DoorType.ropeLadder, 0)]),
		SectorDoors(7, [DoorConfig(0x00, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x01, 0x15, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x0D, DoorType.door, &doorEntry464), DoorConfig(0x0B, 0x05, DoorType.door, &doorEntry471), DoorConfig(0x0F, 0x1D, DoorType.ropeLadder, 0), DoorConfig(0x10, 0x1D, DoorType.ropeLadder, 0), DoorConfig(0x11, 0x1D, DoorType.ropeLadder, 0)]),
		SectorDoors(6, [DoorConfig(0x00, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x01, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x01, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x01, DoorType.ropeLadder, 0)]),
		SectorDoors(2, [DoorConfig(0x17, 0x0C, DoorType.door, &doorEntry945), DoorConfig(0x17, 0x0D, DoorType.door, &doorEntry945)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x02, 0x0D, DoorType.door, &doorEntry240)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x14, 0x18, DoorType.door, &doorEntry249)]),
		SectorDoors(2, [DoorConfig(0x17, 0x0D, DoorType.object, &doorEntry274), DoorConfig(0x17, 0x0E, DoorType.object, &doorEntry274)]),
		SectorDoors(1, [DoorConfig(0x17, 0x17, DoorType.door, &doorEntry250)]),
		SectorDoors(1, [DoorConfig(0x17, 0x02, DoorType.door, &doorEntry251)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x19, 0x16, DoorType.door, &doorEntry781)]),
		SectorDoors(1, [DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry192)]),
		SectorDoors(3, [DoorConfig(0x0A, 0x06, DoorType.escalator, 0x8000), DoorConfig(0x0D, 0x03, DoorType.escalator, 0), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry190)]),
		SectorDoors(4, [DoorConfig(0x0A, 0x0B, DoorType.door, &doorEntry194), DoorConfig(0x0B, 0x0C, DoorType.door, &doorEntry194), DoorConfig(0x0C, 0x0D, DoorType.door, &doorEntry194), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry195)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry197), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry233)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.door, &doorEntry196), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry198)]),
		SectorDoors(1, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry234)]),
	], [
		SectorDoors(1, [DoorConfig(0x0B, 0x1B, DoorType.door, &doorEntry468)]),
		SectorDoors(1, [DoorConfig(0x03, 0x17, DoorType.door, &doorEntry469)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x00, 0x1E, DoorType.door, &doorEntry343), DoorConfig(0x01, 0x1E, DoorType.door, &doorEntry343), DoorConfig(0x02, 0x1E, DoorType.door, &doorEntry343)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x00, 0x09, DoorType.door, &doorEntry344), DoorConfig(0x01, 0x09, DoorType.door, &doorEntry344), DoorConfig(0x02, 0x09, DoorType.door, &doorEntry344)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x02, 0x17, DoorType.door, &doorEntry252), DoorConfig(0x1B, 0x1F, DoorType.door, &doorEntry253)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x04, 0x0E, DoorType.door, &doorEntry254)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry199), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry782)]),
		SectorDoors(3, [DoorConfig(0x0A, 0x04, DoorType.door, &doorEntry201), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry200), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry202)]),
		SectorDoors(4, [DoorConfig(0x09, 0x12, DoorType.door, &doorEntry750), DoorConfig(0x1B, 0x09, DoorType.door, &doorEntry203), DoorConfig(0x1B, 0x11, DoorType.door, &doorEntry204), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry205)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry206), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry207)]),
		SectorDoors(2, [DoorConfig(0x0A, 0x1B, DoorType.door, &doorEntry953), DoorConfig(0x19, 0x12, DoorType.door, &doorEntry751)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry208), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry209)]),
		SectorDoors(3, [DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry210), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry211), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry954)]),
	], [
		SectorDoors(1, [DoorConfig(0x01, 0x19, DoorType.door, &doorEntry470)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x12, 0x1D, DoorType.door, &doorEntry103), DoorConfig(0x12, 0x1E, DoorType.door, &doorEntry103), DoorConfig(0x1C, 0x11, DoorType.door, &doorEntry104)]),
		SectorDoors(2, [DoorConfig(0x0E, 0x19, DoorType.door, &doorEntry105), DoorConfig(0x0E, 0x1A, DoorType.door, &doorEntry105)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x14, 0x02, DoorType.door, &doorEntry283), DoorConfig(0x14, 0x03, DoorType.door, &doorEntry283)]),
		SectorDoors(1, [DoorConfig(0x03, 0x19, DoorType.door, &doorEntry255)]),
		SectorDoors(3, [DoorConfig(0x17, 0x0A, DoorType.door, &doorEntry256), DoorConfig(0x1D, 0x15, DoorType.object, &doorEntry275), DoorConfig(0x1D, 0x16, DoorType.object, &doorEntry275)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0B, 0x02, DoorType.door, &doorEntry257)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(7, [DoorConfig(0x03, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x0D, DoorType.door, &doorEntry473), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry783)]),
		SectorDoors(4, [DoorConfig(0x07, 0x11, DoorType.door, &doorEntry212), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry213), DoorConfig(0x1A, 0x04, DoorType.door, &doorEntry214), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry215)]),
		SectorDoors(2, [DoorConfig(0x09, 0x12, DoorType.door, &doorEntry752), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry216)]),
		SectorDoors(3, [DoorConfig(0x09, 0x0D, DoorType.door, &doorEntry474), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry217), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry218)]),
		SectorDoors(2, [DoorConfig(0x0A, 0x1B, DoorType.door, &doorEntry955), DoorConfig(0x19, 0x16, DoorType.door, &doorEntry753)]),
		SectorDoors(7, [DoorConfig(0x03, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x06, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x07, 0x09, DoorType.ropeLadder, 0), DoorConfig(0x09, 0x0D, DoorType.door, &doorEntry475), DoorConfig(0x1D, 0x16, DoorType.door, &doorEntry219)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry220), DoorConfig(0x1A, 0x17, DoorType.door, &doorEntry956)]),
	], [
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x12, 0x11, DoorType.door, &doorEntry504), DoorConfig(0x13, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x16, 0x11, DoorType.ropeLadder, 0), DoorConfig(0x17, 0x11, DoorType.ropeLadder, 0)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x19, 0x08, DoorType.object, &doorEntry882), DoorConfig(0x1D, 0x05, DoorType.door, &doorEntry836), DoorConfig(0x1D, 0x06, DoorType.door, &doorEntry836)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(14, [DoorConfig(0x0A, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x0F, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x1D, DoorType.door, &doorEntry106), DoorConfig(0x12, 0x1E, DoorType.door, &doorEntry106), DoorConfig(0x13, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x14, 0x16, DoorType.ropeLadder, 0x8000), DoorConfig(0x15, 0x16, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(10, [DoorConfig(0x00, 0x1C, DoorType.door, &doorEntry326), DoorConfig(0x01, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x02, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x03, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x04, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x05, 0x15, DoorType.stairway, 0x0200), DoorConfig(0x0D, 0x0D, DoorType.stairway, 0x0100), DoorConfig(0x11, 0x0A, DoorType.stairway, 0x0300), DoorConfig(0x1D, 0x16, DoorType.stairway, 0), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry327)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x11, 0x10, DoorType.door, &doorEntry284), DoorConfig(0x12, 0x10, DoorType.door, &doorEntry284)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x0A, DoorType.door, &doorEntry754)]),
		SectorDoors(1, [DoorConfig(0x0B, 0x15, DoorType.door, &doorEntry221)]),
		SectorDoors(2, [DoorConfig(0x0F, 0x09, DoorType.door, &doorEntry222), DoorConfig(0x15, 0x1A, DoorType.door, &doorEntry223)]),
		SectorDoors(1, [DoorConfig(0x11, 0x05, DoorType.door, &doorEntry755)]),
		SectorDoors(1, [DoorConfig(0x11, 0x1A, DoorType.door, &doorEntry756)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x1B, 0x12, DoorType.object, &doorEntry247), DoorConfig(0x1B, 0x14, DoorType.object, &doorEntry247)]),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x09, 0x0C, DoorType.object, &doorEntry883), DoorConfig(0x09, 0x19, DoorType.door, &doorEntry837), DoorConfig(0x09, 0x1A, DoorType.door, &doorEntry837), DoorConfig(0x0D, 0x09, DoorType.door, &doorEntry838), DoorConfig(0x0D, 0x0A, DoorType.door, &doorEntry838)]),
		SectorDoors(13, [DoorConfig(0x02, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x12, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x05, DoorType.door, &doorEntry107)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x06, 0x09, DoorType.door, &doorEntry108), DoorConfig(0x06, 0x0A, DoorType.door, &doorEntry108)]),
		SectorDoors(1, [DoorConfig(0x14, 0x1A, DoorType.door, &doorEntry109)]),
		SectorDoors(1, [DoorConfig(0x14, 0x05, DoorType.door, &doorEntry405)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x18, 0x1E, DoorType.door, &doorEntry406)]),
		SectorDoors(2, [DoorConfig(0x09, 0x05, DoorType.door, &doorEntry804), DoorConfig(0x0A, 0x12, DoorType.stairway, 0x0300)]),
		SectorDoors(2, [DoorConfig(0x1D, 0x05, DoorType.stairway, 0), DoorConfig(0x1E, 0x0E, DoorType.stairway, 0x0300)]),
		SectorDoors(2, [DoorConfig(0x15, 0x0D, DoorType.door, &doorEntry763), DoorConfig(0x15, 0x0E, DoorType.door, &doorEntry763)]),
		SectorDoors(3, [DoorConfig(0x16, 0x1E, DoorType.door, &doorEntry764)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0E, 0x10, DoorType.door, &doorEntry285), DoorConfig(0x0F, 0x10, DoorType.door, &doorEntry285)]),
		SectorDoors(6, [DoorConfig(0x07, 0x19, DoorType.door, &doorEntry286), DoorConfig(0x09, 0x1D, DoorType.object, &doorEntry364), DoorConfig(0x09, 0x1E, DoorType.object, &doorEntry364), DoorConfig(0x1F, 0x15, DoorType.object, &doorEntry363), DoorConfig(0x1F, 0x16, DoorType.object, &doorEntry363), DoorConfig(0x1F, 0x18, DoorType.object, &doorEntry363)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x09, DoorType.door, &doorEntry235)]),
		SectorDoors(1, [DoorConfig(0x15, 0x1A, DoorType.door, &doorEntry236)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0D, 0x0A, DoorType.door, &doorEntry224)]),
		SectorDoors(6, [DoorConfig(0x18, 0x06, DoorType.door, &doorEntry550), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry550), DoorConfig(0x1A, 0x04, DoorType.door, &doorEntry550), DoorConfig(0x1B, 0x03, DoorType.door, &doorEntry550), DoorConfig(0x1C, 0x02, DoorType.door, &doorEntry550), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry550)]),
		SectorDoors(7, [DoorConfig(0x0D, 0x0A, DoorType.door, &doorEntry784), DoorConfig(0x18, 0x19, DoorType.door, &doorEntry551), DoorConfig(0x19, 0x1A, DoorType.door, &doorEntry551), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry551), DoorConfig(0x1B, 0x1C, DoorType.door, &doorEntry551), DoorConfig(0x1C, 0x1D, DoorType.door, &doorEntry551), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry551)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(3, [DoorConfig(0x00, 0x01, DoorType.door, &doorEntry182), DoorConfig(0x01, 0x01, DoorType.door, &doorEntry182), DoorConfig(0x02, 0x01, DoorType.door, &doorEntry182)]),
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
		SectorDoors(2, [DoorConfig(0x1D, 0x0D, DoorType.stairway, 0), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry805)]),
		SectorDoors(28, [DoorConfig(0x04, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0F, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x10, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x11, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x12, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x13, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x14, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x15, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x16, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x17, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x18, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x19, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1A, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1B, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1C, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1D, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1E, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x1F, 0x15, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x11, 0x01, DoorType.door, &doorEntry349)]),
		SectorDoors(1, [DoorConfig(0x14, 0x15, DoorType.door, &doorEntry350)]),
		SectorDoors(1, [DoorConfig(0x08, 0x05, DoorType.door, &doorEntry351)]),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x12, 0x11, DoorType.object, &doorEntry730), DoorConfig(0x12, 0x1D, DoorType.object, &doorEntry731), DoorConfig(0x15, 0x05, DoorType.door, &doorEntry703), DoorConfig(0x19, 0x0F, DoorType.object, &doorEntry732), DoorConfig(0x19, 0x1B, DoorType.object, &doorEntry733)]),
		SectorDoors(6, [DoorConfig(0x12, 0x09, DoorType.object, &doorEntry734), DoorConfig(0x16, 0x1B, DoorType.door, &doorEntry704), DoorConfig(0x17, 0x1B, DoorType.door, &doorEntry704), DoorConfig(0x18, 0x1B, DoorType.door, &doorEntry704), DoorConfig(0x19, 0x07, DoorType.object, &doorEntry735), DoorConfig(0x19, 0x1B, DoorType.door, &doorEntry704)]),
		SectorDoors(3, [DoorConfig(0x07, 0x18, DoorType.door, &doorEntry705), DoorConfig(0x09, 0x09, DoorType.door, &doorEntry706), DoorConfig(0x1C, 0x02, DoorType.door, &doorEntry707)]),
		SectorDoors(2, [DoorConfig(0x07, 0x08, DoorType.door, &doorEntry708), DoorConfig(0x1C, 0x1D, DoorType.door, &doorEntry709)]),
		SectorDoors(5, [DoorConfig(0x07, 0x0E, DoorType.object, &doorEntry248), DoorConfig(0x07, 0x11, DoorType.door, &doorEntry225), DoorConfig(0x07, 0x1E, DoorType.object, &doorEntry677), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry226), DoorConfig(0x19, 0x0A, DoorType.door, &doorEntry227)]),
		SectorDoors(3, [DoorConfig(0x0C, 0x0E, DoorType.door, &doorEntry228), DoorConfig(0x0D, 0x0E, DoorType.door, &doorEntry228), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry229)]),
	], [
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
		SectorDoors(16, [DoorConfig(0x00, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x01, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x02, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x03, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x04, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x05, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x06, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x07, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x08, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x09, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0A, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0B, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0C, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0D, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0E, 0x15, DoorType.ropeLadder, 0x8000), DoorConfig(0x0F, 0x15, DoorType.ropeLadder, 0x8000)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0F, 0x1E, DoorType.object, &doorEntry356), DoorConfig(0x1B, 0x0D, DoorType.door, &doorEntry352)]),
		SectorDoors(1, [DoorConfig(0x0F, 0x00, DoorType.object, &doorEntry356)]),
		SectorDoors(3, [DoorConfig(0x01, 0x13, DoorType.door, &doorEntry287), DoorConfig(0x15, 0x1B, DoorType.door, &doorEntry288), DoorConfig(0x15, 0x1C, DoorType.door, &doorEntry288)]),
		SectorDoors(1, [DoorConfig(0x19, 0x13, DoorType.door, &doorEntry353)]),
		SectorDoors(6, [DoorConfig(0x03, 0x01, DoorType.object, &doorEntry360), DoorConfig(0x03, 0x02, DoorType.object, &doorEntry360), DoorConfig(0x0F, 0x0D, DoorType.object, &doorEntry361), DoorConfig(0x0F, 0x0E, DoorType.object, &doorEntry361), DoorConfig(0x0F, 0x10, DoorType.object, &doorEntry361), DoorConfig(0x17, 0x09, DoorType.door, &doorEntry289)]),
		SectorDoors(1, [DoorConfig(0x01, 0x0D, DoorType.door, &doorEntry354)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry694), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry710)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x16, 0x0B, DoorType.door, &doorEntry711), DoorConfig(0x18, 0x0D, DoorType.door, &doorEntry711)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry695), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry712)]),
		SectorDoors(2, [DoorConfig(0x10, 0x15, DoorType.door, &doorEntry713), DoorConfig(0x18, 0x1D, DoorType.door, &doorEntry714)]),
	], [
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
		SectorDoors(5, [DoorConfig(0x18, 0x0F, DoorType.door, &doorEntry290), DoorConfig(0x19, 0x0F, DoorType.door, &doorEntry290), DoorConfig(0x1A, 0x0F, DoorType.door, &doorEntry290), DoorConfig(0x1B, 0x0F, DoorType.door, &doorEntry290), DoorConfig(0x1C, 0x0F, DoorType.door, &doorEntry290)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0B, 0x05, DoorType.door, &doorEntry291)]),
		SectorDoors(6, [DoorConfig(0x03, 0x14, DoorType.object, &doorEntry357), DoorConfig(0x03, 0x16, DoorType.object, &doorEntry357), DoorConfig(0x0D, 0x0D, DoorType.door, &doorEntry292), DoorConfig(0x0D, 0x0E, DoorType.door, &doorEntry292), DoorConfig(0x0D, 0x1C, DoorType.door, &doorEntry293), DoorConfig(0x0D, 0x1D, DoorType.door, &doorEntry293)]),
		SectorDoors(1, [DoorConfig(0x0C, 0x1F, DoorType.door, &doorEntry294)]),
		SectorDoors(4, [DoorConfig(0x06, 0x1F, DoorType.door, &doorEntry355), DoorConfig(0x0C, 0x01, DoorType.door, &doorEntry294), DoorConfig(0x0D, 0x11, DoorType.door, &doorEntry295), DoorConfig(0x0D, 0x12, DoorType.door, &doorEntry295)]),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x10, 0x02, DoorType.door, &doorEntry296), DoorConfig(0x16, 0x19, DoorType.door, &doorEntry297)]),
		SectorDoors(5, [DoorConfig(0x18, 0x10, DoorType.door, &doorEntry298), DoorConfig(0x19, 0x10, DoorType.door, &doorEntry298), DoorConfig(0x1A, 0x10, DoorType.door, &doorEntry298), DoorConfig(0x1B, 0x10, DoorType.door, &doorEntry298), DoorConfig(0x1C, 0x10, DoorType.door, &doorEntry298)]),
		SectorDoors(5, [DoorConfig(0x07, 0x11, DoorType.door, &doorEntry299), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry300), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry301), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry715), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry716)]),
		SectorDoors(3, [DoorConfig(0x08, 0x12, DoorType.object, &doorEntry347), DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry302), DoorConfig(0x1D, 0x16, DoorType.door, &doorEntry303)]),
		SectorDoors(2, [DoorConfig(0x09, 0x0A, DoorType.door, &doorEntry304), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry717)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry305), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry306)]),
		SectorDoors(3, [DoorConfig(0x07, 0x0D, DoorType.door, &doorEntry307), DoorConfig(0x07, 0x15, DoorType.door, &doorEntry308), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry718)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x06, DoorType.door, &doorEntry309), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry310)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry487)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x13, 0x13, DoorType.door, &doorEntry482)]),
		SectorDoors(2, [DoorConfig(0x14, 0x0A, DoorType.door, &doorEntry485), DoorConfig(0x15, 0x09, DoorType.door, &doorEntry486)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x19, 0x01, DoorType.door, &doorEntry800), DoorConfig(0x1A, 0x0E, DoorType.stairway, 0x0300)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x07, 0x11, DoorType.object, &doorEntry358), DoorConfig(0x07, 0x12, DoorType.object, &doorEntry358)]),
		SectorDoors(4, [DoorConfig(0x03, 0x11, DoorType.object, &doorEntry359), DoorConfig(0x03, 0x13, DoorType.object, &doorEntry359), DoorConfig(0x03, 0x14, DoorType.object, &doorEntry359), DoorConfig(0x03, 0x16, DoorType.object, &doorEntry359)]),
		SectorDoors(0, []),
		SectorDoors(4, [DoorConfig(0x07, 0x0D, DoorType.object, &doorEntry362), DoorConfig(0x07, 0x0F, DoorType.object, &doorEntry362), DoorConfig(0x07, 0x10, DoorType.object, &doorEntry362), DoorConfig(0x07, 0x12, DoorType.object, &doorEntry362)]),
		SectorDoors(1, [DoorConfig(0x1A, 0x12, DoorType.door, &doorEntry909)]),
		SectorDoors(8, [DoorConfig(0x10, 0x1C, DoorType.door, &doorEntry338), DoorConfig(0x11, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x12, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x13, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x14, 0x1C, DoorType.ropeLadder, 0), DoorConfig(0x15, 0x11, DoorType.stairway, 0x0200), DoorConfig(0x1D, 0x00, DoorType.door, &doorEntry339), DoorConfig(0x1D, 0x09, DoorType.stairway, 0x0100)]),
		SectorDoors(5, [DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry719), DoorConfig(0x17, 0x0A, DoorType.object, &doorEntry677), DoorConfig(0x17, 0x12, DoorType.door, &doorEntry696), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry698), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry697)]),
		SectorDoors(5, [DoorConfig(0x0C, 0x00, DoorType.door, &doorEntry720), DoorConfig(0x0D, 0x00, DoorType.door, &doorEntry720), DoorConfig(0x0D, 0x1E, DoorType.door, &doorEntry721), DoorConfig(0x0E, 0x00, DoorType.door, &doorEntry720), DoorConfig(0x1D, 0x16, DoorType.door, &doorEntry311)]),
		SectorDoors(2, [DoorConfig(0x09, 0x12, DoorType.door, &doorEntry722), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry699)]),
		SectorDoors(3, [DoorConfig(0x07, 0x0D, DoorType.door, &doorEntry723), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry724), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry312)]),
		SectorDoors(5, [DoorConfig(0x09, 0x12, DoorType.door, &doorEntry725), DoorConfig(0x1B, 0x09, DoorType.door, &doorEntry700), DoorConfig(0x1B, 0x0E, DoorType.object, &doorEntry737), DoorConfig(0x1B, 0x11, DoorType.door, &doorEntry701), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry702)]),
		SectorDoors(3, [DoorConfig(0x0B, 0x0D, DoorType.object, &doorEntry736), DoorConfig(0x0D, 0x01, DoorType.door, &doorEntry726), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry313)]),
	], [
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1B, 0x0F, DoorType.door, &doorEntry480)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x1E, 0x16, DoorType.object, &doorEntry490)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x0D, 0x01, DoorType.stairway, 0), DoorConfig(0x0D, 0x0E, DoorType.door, &doorEntry801)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(2, [DoorConfig(0x12, 0x19, DoorType.door, &doorEntry941), DoorConfig(0x12, 0x1A, DoorType.door, &doorEntry941)]),
		SectorDoors(0, []),
		SectorDoors(5, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry727), DoorConfig(0x17, 0x0A, DoorType.object, &doorEntry677), DoorConfig(0x17, 0x12, DoorType.door, &doorEntry314), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry316), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry315)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry280), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry317)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry728), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry318)]),
		SectorDoors(1, [DoorConfig(0x1A, 0x17, DoorType.door, &doorEntry319)]),
		SectorDoors(5, [DoorConfig(0x0D, 0x16, DoorType.door, &doorEntry729), DoorConfig(0x1B, 0x09, DoorType.door, &doorEntry320), DoorConfig(0x1B, 0x0E, DoorType.object, &doorEntry348), DoorConfig(0x1B, 0x11, DoorType.door, &doorEntry321), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry322)]),
		SectorDoors(2, [DoorConfig(0x0D, 0x1A, DoorType.door, &doorEntry323), DoorConfig(0x1D, 0x1A, DoorType.door, &doorEntry324)]),
	], [
		SectorDoors(0, []),
		SectorDoors(8, [DoorConfig(0x00, 0x10, DoorType.door, &doorEntry481), DoorConfig(0x01, 0x10, DoorType.door, &doorEntry481), DoorConfig(0x02, 0x10, DoorType.door, &doorEntry481), DoorConfig(0x03, 0x10, DoorType.door, &doorEntry481), DoorConfig(0x04, 0x10, DoorType.door, &doorEntry481), DoorConfig(0x05, 0x10, DoorType.door, &doorEntry481), DoorConfig(0x06, 0x10, DoorType.door, &doorEntry481), DoorConfig(0x07, 0x10, DoorType.door, &doorEntry481)]),
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
		SectorDoors(8, [DoorConfig(0x00, 0x0F, DoorType.door, &doorEntry488), DoorConfig(0x01, 0x0F, DoorType.door, &doorEntry488), DoorConfig(0x02, 0x0F, DoorType.door, &doorEntry488), DoorConfig(0x03, 0x0F, DoorType.door, &doorEntry488), DoorConfig(0x04, 0x0F, DoorType.door, &doorEntry488), DoorConfig(0x05, 0x0F, DoorType.door, &doorEntry488), DoorConfig(0x06, 0x0F, DoorType.door, &doorEntry488), DoorConfig(0x07, 0x0F, DoorType.door, &doorEntry488)]),
		SectorDoors(14, [DoorConfig(0x00, 0x10, DoorType.door, &doorEntry489), DoorConfig(0x01, 0x10, DoorType.door, &doorEntry489), DoorConfig(0x02, 0x10, DoorType.door, &doorEntry489), DoorConfig(0x03, 0x10, DoorType.door, &doorEntry489), DoorConfig(0x04, 0x10, DoorType.door, &doorEntry489), DoorConfig(0x05, 0x10, DoorType.door, &doorEntry489), DoorConfig(0x06, 0x10, DoorType.door, &doorEntry489), DoorConfig(0x07, 0x10, DoorType.door, &doorEntry489), DoorConfig(0x18, 0x06, DoorType.door, &doorEntry341), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry341), DoorConfig(0x1A, 0x04, DoorType.door, &doorEntry341), DoorConfig(0x1B, 0x03, DoorType.door, &doorEntry341), DoorConfig(0x1C, 0x02, DoorType.door, &doorEntry341), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry341)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(6, [DoorConfig(0x18, 0x19, DoorType.door, &doorEntry342), DoorConfig(0x19, 0x1A, DoorType.door, &doorEntry342), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry342), DoorConfig(0x1B, 0x1C, DoorType.door, &doorEntry342), DoorConfig(0x1C, 0x1D, DoorType.door, &doorEntry342), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry342)]),
		SectorDoors(8, [DoorConfig(0x00, 0x0F, DoorType.door, &doorEntry484), DoorConfig(0x01, 0x0F, DoorType.door, &doorEntry484), DoorConfig(0x02, 0x0F, DoorType.door, &doorEntry484), DoorConfig(0x03, 0x0F, DoorType.door, &doorEntry484), DoorConfig(0x04, 0x0F, DoorType.door, &doorEntry484), DoorConfig(0x05, 0x0F, DoorType.door, &doorEntry484), DoorConfig(0x06, 0x0F, DoorType.door, &doorEntry484), DoorConfig(0x07, 0x0F, DoorType.door, &doorEntry484)]),
		SectorDoors(6, [DoorConfig(0x18, 0x06, DoorType.door, &doorEntry237), DoorConfig(0x19, 0x05, DoorType.door, &doorEntry237), DoorConfig(0x1A, 0x04, DoorType.door, &doorEntry237), DoorConfig(0x1B, 0x03, DoorType.door, &doorEntry237), DoorConfig(0x1C, 0x02, DoorType.door, &doorEntry237), DoorConfig(0x1D, 0x01, DoorType.door, &doorEntry237)]),
		SectorDoors(0, []),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x05, 0x1A, DoorType.door, &doorEntry340)]),
		SectorDoors(2, [DoorConfig(0x09, 0x01, DoorType.door, &doorEntry183), DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry184)]),
		SectorDoors(0, []),
		SectorDoors(1, [DoorConfig(0x0B, 0x01, DoorType.door, &doorEntry185)]),
		SectorDoors(7, [DoorConfig(0x09, 0x1E, DoorType.door, &doorEntry186), DoorConfig(0x18, 0x19, DoorType.door, &doorEntry238), DoorConfig(0x19, 0x1A, DoorType.door, &doorEntry238), DoorConfig(0x1A, 0x1B, DoorType.door, &doorEntry238), DoorConfig(0x1B, 0x1C, DoorType.door, &doorEntry238), DoorConfig(0x1C, 0x1D, DoorType.door, &doorEntry238), DoorConfig(0x1D, 0x1E, DoorType.door, &doorEntry238)]),
		SectorDoors(2, [DoorConfig(0x0F, 0x1C, DoorType.door, &doorEntry325), DoorConfig(0x10, 0x1C, DoorType.door, &doorEntry325)]),
	]
];

immutable DoorEntryA doorEntry0 = DoorEntryA("textDoor000", EventFlag.onetMizunoDoorOpen | eventFlagUnset, 0xC09A, 0x03B1, 0x04);
immutable DoorEntryA doorEntry1 = DoorEntryA("textDoor001", EventFlag.none, 0x010B, 0x0087, 0x01);
immutable DoorEntryA doorEntry2 = DoorEntryA(null, EventFlag.none, 0x03EF, 0x0119, 0x01);
immutable DoorEntryA doorEntry3 = DoorEntryA(null, EventFlag.none, 0x83FC, 0x00F3, 0x01);
immutable DoorEntryA doorEntry4 = DoorEntryA("textDoor004", EventFlag.none, 0xC434, 0x0158, 0x01);
immutable DoorEntryA doorEntry5 = DoorEntryA(null, EventFlag.none, 0x80B9, 0x0367, 0x01);
immutable DoorEntryA doorEntry6 = DoorEntryA("textDoor006", EventFlag.openTabigoya | eventFlagUnset, 0xC0BA, 0x0375, 0x04);
immutable DoorEntryA doorEntry7 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC0A9, 0x03F0, 0x01);
immutable DoorEntryA doorEntry8 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC0BD, 0x03DC, 0x06);
immutable DoorEntryA doorEntry9 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC03D, 0x03BC, 0x06);
immutable DoorEntryA doorEntry10 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC02D, 0x03FC, 0x04);
immutable DoorEntryA doorEntry11 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC04D, 0x03B8, 0x04);
immutable DoorEntryA doorEntry12 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC06A, 0x03B1, 0x04);
immutable DoorEntryA doorEntry13 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC04D, 0x03EC, 0x01);
immutable DoorEntryA doorEntry14 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC0BD, 0x03FC, 0x01);
immutable DoorEntryA doorEntry15 = DoorEntryA("textDoor015", EventFlag.onetEstateDoorOpen | eventFlagUnset, 0xC0BA, 0x03B9, 0x04);
immutable DoorEntryA doorEntry16 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC07D, 0x039C, 0x01);
immutable DoorEntryA doorEntry17 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0x0056, 0x03D1, 0x04);
immutable DoorEntryA doorEntry18 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC059, 0x03E4, 0x06);
immutable DoorEntryA doorEntry19 = DoorEntryA("textDoor019", EventFlag.onetDoorClose, 0xC031, 0x0384, 0x01);
immutable DoorEntryA doorEntry20 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC0AD, 0x0398, 0x06);
immutable DoorEntryA doorEntry21 = DoorEntryA("textDoor021", EventFlag.onetPokeyDoorClose, 0xC06D, 0x0398, 0x04);
immutable DoorEntryA doorEntry22 = DoorEntryA("textDoor022", EventFlag.genkanMamaAppear, 0xC02A, 0x03CD, 0x04);
immutable DoorEntryA doorEntry23 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC03D, 0x03F4, 0x01);
immutable DoorEntryA doorEntry24 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC07A, 0x0371, 0x04);
immutable DoorEntryA doorEntry25 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC09D, 0x03F8, 0x04);
immutable DoorEntryA doorEntry26 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC08A, 0x03B9, 0x04);
immutable DoorEntryA doorEntry27 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC09D, 0x0378, 0x04);
immutable DoorEntryA doorEntry28 = DoorEntryA("textDoor028", EventFlag.unknown0340 | eventFlagUnset, 0xC02A, 0x03CD, 0x00);
immutable DoorEntryA doorEntry29 = DoorEntryA("textDoor000", EventFlag.onetDoorClose, 0xC0AD, 0x03B4, 0x04);
immutable DoorEntryA doorEntry30 = DoorEntryA("textDoor030", EventFlag.none, 0x02E6, 0x008B, 0x01);
immutable DoorEntryA doorEntry31 = DoorEntryA(null, EventFlag.none, 0x0048, 0x03D1, 0x07);
immutable DoorEntryA doorEntry32 = DoorEntryA(null, EventFlag.none, 0xC0AD, 0x03D8, 0x07);
immutable DoorEntryA doorEntry33 = DoorEntryA(null, EventFlag.none, 0xC0CD, 0x03FC, 0x07);
immutable DoorEntryA doorEntry34 = DoorEntryA(null, EventFlag.onetMincesAppear, 0x800D, 0x03E3, 0x07);
immutable DoorEntryA doorEntry35 = DoorEntryA("textDoor035", EventFlag.none, 0x80BD, 0x03E3, 0x01);
immutable DoorEntryA doorEntry36 = DoorEntryA(null, EventFlag.none, 0x806D, 0x03C3, 0x0F);
immutable DoorEntryA doorEntry37 = DoorEntryA(null, EventFlag.none, 0xC01A, 0x03B9, 0x07);
immutable DoorEntryA doorEntry38 = DoorEntryA(null, EventFlag.none, 0x8031, 0x0363, 0x01);
immutable DoorEntryA doorEntry39 = DoorEntryA(null, EventFlag.none, 0xC00D, 0x03FC, 0x01);
immutable DoorEntryA doorEntry40 = DoorEntryA(null, EventFlag.none, 0x00D6, 0x00FC, 0x01);
immutable DoorEntryA doorEntry41 = DoorEntryA(null, EventFlag.none, 0x807D, 0x03A3, 0x0F);
immutable DoorEntryA doorEntry42 = DoorEntryA(null, EventFlag.none, 0x008E, 0x00D9, 0x0C);
immutable DoorEntryA doorEntry43 = DoorEntryA("textDoor043", EventFlag.myHomeDoorClose, 0x002B, 0x014B, 0x0A);
immutable DoorEntryA doorEntry44 = DoorEntryA(null, EventFlag.none, 0xC08D, 0x037C, 0x07);
immutable DoorEntryA doorEntry45 = DoorEntryA(null, EventFlag.none, 0xC0AD, 0x037C, 0x07);
immutable DoorEntryA doorEntry46 = DoorEntryA(null, EventFlag.none, 0x805D, 0x0363, 0x0F);
immutable DoorEntryA doorEntry47 = DoorEntryA(null, EventFlag.none, 0x00A1, 0x009A, 0x0A);
immutable DoorEntryA doorEntry48 = DoorEntryA("textDoor048", EventFlag.none, 0x006D, 0x010A, 0x01);
immutable DoorEntryA doorEntry49 = DoorEntryA(null, EventFlag.none, 0x806D, 0x0363, 0x0F);
immutable DoorEntryA doorEntry50 = DoorEntryA(null, EventFlag.none, 0xC06D, 0x03FC, 0x07);
immutable DoorEntryA doorEntry51 = DoorEntryA(null, EventFlag.none, 0x803D, 0x03C3, 0x0F);
immutable DoorEntryA doorEntry52 = DoorEntryA(null, EventFlag.none, 0x00AC, 0x0089, 0x0A);
immutable DoorEntryA doorEntry53 = DoorEntryA(null, EventFlag.none, 0x007C, 0x03B1, 0x07);
immutable DoorEntryA doorEntry54 = DoorEntryA(null, EventFlag.none, 0xC011, 0x0384, 0x07);
immutable DoorEntryA doorEntry55 = DoorEntryA(null, EventFlag.none, 0xC06D, 0x03D4, 0x07);
immutable DoorEntryA doorEntry56 = DoorEntryA(null, EventFlag.onetGuardSharkDisappear | eventFlagUnset, 0x40D1, 0x00C5, 0x0A);
immutable DoorEntryA doorEntry57 = DoorEntryA(null, EventFlag.none, 0x8079, 0x03E7, 0x0F);
immutable DoorEntryA doorEntry58 = DoorEntryA(null, EventFlag.none, 0xC08D, 0x03DC, 0x07);
immutable DoorEntryA doorEntry59 = DoorEntryA(null, EventFlag.none, 0x00A7, 0x00CF, 0x01);
immutable DoorEntryA doorEntry60 = DoorEntryA(null, EventFlag.none, 0x00DA, 0x00C5, 0x0C);
immutable DoorEntryA doorEntry61 = DoorEntryA(null, EventFlag.none, 0x804D, 0x0363, 0x0F);
immutable DoorEntryA doorEntry62 = DoorEntryA(null, EventFlag.none, 0x008C, 0x0121, 0x0A);
immutable DoorEntryA doorEntry63 = DoorEntryA("textDoor063", EventFlag.none, 0x002C, 0x012B, 0x0A);
immutable DoorEntryA doorEntry64 = DoorEntryA(null, EventFlag.none, 0xC09D, 0x0398, 0x07);
immutable DoorEntryA doorEntry65 = DoorEntryA(null, EventFlag.none, 0x00D3, 0x008F, 0x01);
immutable DoorEntryA doorEntry66 = DoorEntryA(null, EventFlag.none, 0x80BD, 0x0383, 0x0F);
immutable DoorEntryA doorEntry67 = DoorEntryA(null, EventFlag.none, 0x00BC, 0x0085, 0x0A);
immutable DoorEntryA doorEntry68 = DoorEntryA(null, EventFlag.none, 0xC05D, 0x03BC, 0x07);
immutable DoorEntryA doorEntry69 = DoorEntryA("textDoor069", EventFlag.none, 0x802A, 0x03A6, 0x0F);
immutable DoorEntryA doorEntry70 = DoorEntryA(null, EventFlag.none, 0x808A, 0x03E6, 0x07);
immutable DoorEntryA doorEntry71 = DoorEntryA("textDoor071", EventFlag.none, 0x801D, 0x03C3, 0x0F);
immutable DoorEntryA doorEntry72 = DoorEntryA(null, EventFlag.none, 0x804D, 0x03C3, 0x07);
immutable DoorEntryA doorEntry73 = DoorEntryA(null, EventFlag.none, 0x00BC, 0x0389, 0x07);
immutable DoorEntryA doorEntry74 = DoorEntryA(null, EventFlag.none, 0x0058, 0x0371, 0x07);
immutable DoorEntryA doorEntry75 = DoorEntryA(null, EventFlag.none, 0x8059, 0x03C7, 0x0F);
immutable DoorEntryA doorEntry76 = DoorEntryA(null, EventFlag.none, 0x0038, 0x03CD, 0x07);
immutable DoorEntryA doorEntry77 = DoorEntryA(null, EventFlag.none, 0x00C8, 0x0131, 0x0A);
immutable DoorEntryA doorEntry78 = DoorEntryA(null, EventFlag.none, 0x00B8, 0x03F1, 0x07);
immutable DoorEntryA doorEntry79 = DoorEntryA(null, EventFlag.none, 0x0078, 0x0392, 0x07);
immutable DoorEntryA doorEntry80 = DoorEntryA(null, EventFlag.none, 0x00B0, 0x0141, 0x0A);
immutable DoorEntryA doorEntry81 = DoorEntryA(null, EventFlag.none, 0x0010, 0x00E5, 0x0A);
immutable DoorEntryA doorEntry82 = DoorEntryA("textDoor004", EventFlag._1fMizunoAppear, 0x0361, 0x01F4, 0x01);
immutable DoorEntryA doorEntry83 = DoorEntryA(null, EventFlag.none, 0x0048, 0x03E1, 0x07);
immutable DoorEntryA doorEntry84 = DoorEntryA(null, EventFlag.none, 0x00BC, 0x0391, 0x07);
immutable DoorEntryA doorEntry85 = DoorEntryA("textDoor085", EventFlag.none, 0xC07D, 0x03BC, 0x07);
immutable DoorEntryA doorEntry86 = DoorEntryA(null, EventFlag.none, 0x008C, 0x012D, 0x0A);
immutable DoorEntryA doorEntry87 = DoorEntryA(null, EventFlag.none, 0x0038, 0x03D9, 0x07);
immutable DoorEntryA doorEntry88 = DoorEntryA(null, EventFlag.none, 0x4043, 0x00B5, 0x01);
immutable DoorEntryA doorEntry89 = DoorEntryA(null, EventFlag.none, 0x0048, 0x00B5, 0x0A);
immutable DoorEntryA doorEntry90 = DoorEntryA(null, EventFlag.none, 0x00DA, 0x00E8, 0x0C);
immutable DoorEntryA doorEntry91 = DoorEntryA(null, EventFlag.none, 0xC07D, 0x03D8, 0x07);
immutable DoorEntryA doorEntry92 = DoorEntryA(null, EventFlag.none, 0xC09D, 0x03D8, 0x07);
immutable DoorEntryA doorEntry93 = DoorEntryA(null, EventFlag.none, 0x807D, 0x0383, 0x0F);
immutable DoorEntryA doorEntry94 = DoorEntryA(null, EventFlag.none, 0x011C, 0x00C5, 0x0A);
immutable DoorEntryA doorEntry95 = DoorEntryA(null, EventFlag.none, 0x00DC, 0x0039, 0x0A);
immutable DoorEntryA doorEntry96 = DoorEntryA(null, EventFlag.none, 0x0008, 0x03B1, 0x07);
immutable DoorEntryA doorEntry97 = DoorEntryA(null, EventFlag.none, 0x008E, 0x00C8, 0x0C);
immutable DoorEntryA doorEntry98 = DoorEntryA(null, EventFlag.none, 0x0053, 0x00FC, 0x01);
immutable DoorEntryA doorEntry99 = DoorEntryA(null, EventFlag.none, 0xC089, 0x0388, 0x07);
immutable DoorEntryA doorEntry100 = DoorEntryA(null, EventFlag.none, 0xC00D, 0x03CC, 0x01);
immutable DoorEntryA doorEntry101 = DoorEntryA("textDoor101", EventFlag.none, 0x00B2, 0x00FF, 0x01);
immutable DoorEntryA doorEntry102 = DoorEntryA(null, EventFlag.none, 0x0008, 0x03BD, 0x07);
immutable DoorEntryA doorEntry103 = DoorEntryA(null, EventFlag.none, 0xC139, 0x02F5, 0x01);
immutable DoorEntryA doorEntry104 = DoorEntryA(null, EventFlag.none, 0x003B, 0x0085, 0x01);
immutable DoorEntryA doorEntry105 = DoorEntryA(null, EventFlag.none, 0x003A, 0x009D, 0x01);
immutable DoorEntryA doorEntry106 = DoorEntryA(null, EventFlag.none, 0xC2D9, 0x01D5, 0x01);
immutable DoorEntryA doorEntry107 = DoorEntryA(null, EventFlag.none, 0xC2B9, 0x01D9, 0x01);
immutable DoorEntryA doorEntry108 = DoorEntryA(null, EventFlag.none, 0xC279, 0x01F5, 0x01);
immutable DoorEntryA doorEntry109 = DoorEntryA("textDoor109", EventFlag.none, 0x003F, 0x00B1, 0x01);
immutable DoorEntryA doorEntry110 = DoorEntryA(null, EventFlag.none, 0x0427, 0x0129, 0x01);
immutable DoorEntryA doorEntry111 = DoorEntryA(null, EventFlag.none, 0x8430, 0x00E7, 0x01);
immutable DoorEntryA doorEntry112 = DoorEntryA(null, EventFlag.none, 0x0413, 0x013D, 0x01);
immutable DoorEntryA doorEntry113 = DoorEntryA(null, EventFlag.none, 0xC139, 0x008C, 0x01);
immutable DoorEntryA doorEntry114 = DoorEntryA(null, EventFlag.none, 0x03F3, 0x00FD, 0x01);
immutable DoorEntryA doorEntry115 = DoorEntryA("textDoor115", EventFlag.winGianBoss | eventFlagUnset, 0x0027, 0x0089, 0x01);
immutable DoorEntryA doorEntry116 = DoorEntryA(null, EventFlag.none, 0x8138, 0x02E7, 0x01);
immutable DoorEntryA doorEntry117 = DoorEntryA(null, EventFlag.none, 0x409A, 0x03AC, 0x01);
immutable DoorEntryA doorEntry118 = DoorEntryA(null, EventFlag.none, 0xC139, 0x02BC, 0x01);
immutable DoorEntryA doorEntry119 = DoorEntryA(null, EventFlag.none, 0x8379, 0x01E3, 0x01);
immutable DoorEntryA doorEntry120 = DoorEntryA(null, EventFlag.none, 0xC109, 0x01BC, 0x01);
immutable DoorEntryA doorEntry121 = DoorEntryA(null, EventFlag.none, 0x82E9, 0x01E3, 0x01);
immutable DoorEntryA doorEntry122 = DoorEntryA(null, EventFlag.none, 0x813B, 0x02A3, 0x01);
immutable DoorEntryA doorEntry123 = DoorEntryA(null, EventFlag.none, 0xC109, 0x0189, 0x01);
immutable DoorEntryA doorEntry124 = DoorEntryA("textDoor124", EventFlag.unknown0340 | eventFlagUnset, 0x0075, 0x0092, 0x00);
immutable DoorEntryA doorEntry125 = DoorEntryA("textDoor125", EventFlag.unknown0340 | eventFlagUnset, 0x0085, 0x00B2, 0x00);
immutable DoorEntryA doorEntry126 = DoorEntryA("textDoor126", EventFlag.unknown0340 | eventFlagUnset, 0x00A2, 0x007F, 0x00);
immutable DoorEntryA doorEntry127 = DoorEntryA("textDoor127", EventFlag.unknown0340 | eventFlagUnset, 0x00DA, 0x00B4, 0x00);
immutable DoorEntryC doorEntry128 = DoorEntryC("textDoor128");
immutable DoorEntryC doorEntry129 = DoorEntryC("textDoor129");
immutable DoorEntryC doorEntry130 = DoorEntryC("textDoor130");
immutable DoorEntryC doorEntry131 = DoorEntryC("textDoor131");
immutable DoorEntryC doorEntry132 = DoorEntryC("textDoor132");
immutable DoorEntryC doorEntry133 = DoorEntryC("textDoor133");
immutable DoorEntryC doorEntry134 = DoorEntryC("textDoor134");
immutable DoorEntryC doorEntry135 = DoorEntryC("textDoor135");
immutable DoorEntryC doorEntry136 = DoorEntryC("textDoor136");
immutable DoorEntryC doorEntry137 = DoorEntryC("textDoor137");
immutable DoorEntryC doorEntry138 = DoorEntryC("textDoor138");
immutable DoorEntryA doorEntry139 = DoorEntryA("textDoor139", EventFlag.unknown0340 | eventFlagUnset, 0x00A0, 0x0151, 0x00);
immutable DoorEntryA doorEntry140 = DoorEntryA("textDoor140", EventFlag.unknown0340 | eventFlagUnset, 0x00D8, 0x0121, 0x00);
immutable DoorEntryA doorEntry141 = DoorEntryA("textDoor141", EventFlag.unknown0340 | eventFlagUnset, 0x00B2, 0x010B, 0x00);
immutable DoorEntryA doorEntry142 = DoorEntryA("textDoor142", EventFlag.unknown0340 | eventFlagUnset, 0x00AE, 0x0117, 0x00);
immutable DoorEntryC doorEntry143 = DoorEntryC("textDoor143");
immutable DoorEntryC doorEntry144 = DoorEntryC("textDoor144");
immutable DoorEntryC doorEntry145 = DoorEntryC("textDoor145");
immutable DoorEntryC doorEntry146 = DoorEntryC("textDoor146");
immutable DoorEntryC doorEntry147 = DoorEntryC("textDoor147");
immutable DoorEntryC doorEntry148 = DoorEntryC("textDoor148");
immutable DoorEntryC doorEntry149 = DoorEntryC("textDoor149");
immutable DoorEntryC doorEntry150 = DoorEntryC("textDoor150");
immutable DoorEntryA doorEntry151 = DoorEntryA("textDoor151", EventFlag.unknown0340 | eventFlagUnset, 0x000C, 0x03E9, 0x00);
immutable DoorEntryA doorEntry152 = DoorEntryA("textDoor152", EventFlag.unknown0340 | eventFlagUnset, 0x000C, 0x03F1, 0x00);
immutable DoorEntryA doorEntry153 = DoorEntryA("textDoor153", EventFlag.unknown0340 | eventFlagUnset, 0x0058, 0x0379, 0x00);
immutable DoorEntryA doorEntry154 = DoorEntryA("textDoor154", EventFlag.unknown0340 | eventFlagUnset, 0x0058, 0x037D, 0x00);
immutable DoorEntryC doorEntry155 = DoorEntryC("textDoor155");
immutable DoorEntryC doorEntry156 = DoorEntryC("textDoor156");
immutable DoorEntryC doorEntry157 = DoorEntryC("textDoor157");
immutable DoorEntryC doorEntry158 = DoorEntryC("textDoor157");
immutable DoorEntryC doorEntry159 = DoorEntryC("textDoor157");
immutable DoorEntryC doorEntry160 = DoorEntryC("textDoor160");
immutable DoorEntryC doorEntry161 = DoorEntryC("textDoor157");
immutable DoorEntryC doorEntry162 = DoorEntryC("textDoor157");
immutable DoorEntryC doorEntry163 = DoorEntryC("textDoor163");
immutable DoorEntryA doorEntry164 = DoorEntryA(null, EventFlag.none, 0x418F, 0x0098, 0x01);
immutable DoorEntryA doorEntry165 = DoorEntryA(null, EventFlag.none, 0xC3FD, 0x0358, 0x04);
immutable DoorEntryA doorEntry166 = DoorEntryA(null, EventFlag.none, 0xC3FD, 0x0398, 0x04);
immutable DoorEntryA doorEntry167 = DoorEntryA(null, EventFlag.none, 0xC38D, 0x03C4, 0x01);
immutable DoorEntryA doorEntry168 = DoorEntryA(null, EventFlag.none, 0xC3BD, 0x0378, 0x06);
immutable DoorEntryA doorEntry169 = DoorEntryA(null, EventFlag.none, 0xC3AB, 0x038A, 0x06);
immutable DoorEntryA doorEntry170 = DoorEntryA("textDoor170", EventFlag.tlptThrk , 0xC39D, 0x03BC, 0x04);
immutable DoorEntryA doorEntry171 = DoorEntryA(null, EventFlag.none, 0xC3BD, 0x03D8, 0x04);
immutable DoorEntryA doorEntry172 = DoorEntryA(null, EventFlag.none, 0xC3FD, 0x03D4, 0x04);
immutable DoorEntryA doorEntry173 = DoorEntryA(null, EventFlag.none, 0xC3DD, 0x03D8, 0x04);
immutable DoorEntryA doorEntry174 = DoorEntryA(null, EventFlag.none, 0xC42D, 0x03A8, 0x06);
immutable DoorEntryA doorEntry175 = DoorEntryA(null, EventFlag.none, 0xC3CD, 0x0334, 0x06);
immutable DoorEntryA doorEntry176 = DoorEntryA(null, EventFlag.none, 0xC3AD, 0x03C4, 0x04);
immutable DoorEntryA doorEntry177 = DoorEntryA(null, EventFlag.none, 0xC3FD, 0x037C, 0x04);
immutable DoorEntryA doorEntry178 = DoorEntryA(null, EventFlag.none, 0xC3CD, 0x03F8, 0x04);
immutable DoorEntryA doorEntry179 = DoorEntryA(null, EventFlag.none, 0xC44D, 0x03EC, 0x01);
immutable DoorEntryA doorEntry180 = DoorEntryA(null, EventFlag.none, 0xC38D, 0x03F8, 0x04);
immutable DoorEntryA doorEntry181 = DoorEntryA("textDoor004", EventFlag.none, 0x84E9, 0x0363, 0x01);
immutable DoorEntryA doorEntry182 = DoorEntryA("textDoor182", EventFlag.none, 0x84FC, 0x02E4, 0x01);
immutable DoorEntryA doorEntry183 = DoorEntryA("textDoor183", EventFlag.none, 0xC378, 0x01C4, 0x01);
immutable DoorEntryA doorEntry184 = DoorEntryA(null, EventFlag.none, 0x84EB, 0x03A3, 0x01);
immutable DoorEntryA doorEntry185 = DoorEntryA(null, EventFlag.none, 0xC4E9, 0x037C, 0x01);
immutable DoorEntryA doorEntry186 = DoorEntryA(null, EventFlag.none, 0x0119, 0x0216, 0x01);
immutable DoorEntryA doorEntry187 = DoorEntryA(null, EventFlag.none, 0xC459, 0x03C8, 0x07);
immutable DoorEntryA doorEntry188 = DoorEntryA(null, EventFlag.none, 0xC415, 0x03B8, 0x01);
immutable DoorEntryA doorEntry189 = DoorEntryA("textDoor189", EventFlag.none, 0x032F, 0x00AB, 0x01);
immutable DoorEntryA doorEntry190 = DoorEntryA("textDoor190", EventFlag.none, 0x032F, 0x00BC, 0x0C);
immutable DoorEntryA doorEntry191 = DoorEntryA(null, EventFlag.none, 0x033B, 0x0133, 0x0A);
immutable DoorEntryA doorEntry192 = DoorEntryA(null, EventFlag.none, 0x03DC, 0x0369, 0x07);
immutable DoorEntryA doorEntry193 = DoorEntryA(null, EventFlag.none, 0x0448, 0x03D1, 0x07);
immutable DoorEntryA doorEntry194 = DoorEntryA("textDoor194", EventFlag.none, 0x0332, 0x00D2, 0x0C);
immutable DoorEntryA doorEntry195 = DoorEntryA(null, EventFlag.none, 0x03DC, 0x0371, 0x07);
immutable DoorEntryA doorEntry196 = DoorEntryA("textDoor196", EventFlag.none, 0x0373, 0x0109, 0x0A);
immutable DoorEntryA doorEntry197 = DoorEntryA(null, EventFlag.none, 0xC3CD, 0x035C, 0x07);
immutable DoorEntryA doorEntry198 = DoorEntryA(null, EventFlag.none, 0x038F, 0x00F7, 0x0A);
immutable DoorEntryA doorEntry199 = DoorEntryA(null, EventFlag.none, 0x0377, 0x011F, 0x0A);
immutable DoorEntryA doorEntry200 = DoorEntryA(null, EventFlag.none, 0x83AD, 0x03A3, 0x07);
immutable DoorEntryA doorEntry201 = DoorEntryA(null, EventFlag.none, 0x83ED, 0x0343, 0x0F);
immutable DoorEntryA doorEntry202 = DoorEntryA(null, EventFlag.none, 0x83FA, 0x0346, 0x0F);
immutable DoorEntryA doorEntry203 = DoorEntryA(null, EventFlag.none, 0xC3BD, 0x035C, 0x07);
immutable DoorEntryA doorEntry204 = DoorEntryA(null, EventFlag.none, 0xC3BD, 0x039C, 0x07);
immutable DoorEntryA doorEntry205 = DoorEntryA(null, EventFlag.none, 0x844D, 0x03C3, 0x0F);
immutable DoorEntryA doorEntry206 = DoorEntryA(null, EventFlag.none, 0x040C, 0x0395, 0x07);
immutable DoorEntryA doorEntry207 = DoorEntryA(null, EventFlag.none, 0x83FD, 0x0383, 0x0F);
immutable DoorEntryA doorEntry208 = DoorEntryA(null, EventFlag.none, 0x0410, 0x03A9, 0x07);
immutable DoorEntryA doorEntry209 = DoorEntryA(null, EventFlag.warpAppleTwsn, 0x0397, 0x00EF, 0x0A);
immutable DoorEntryA doorEntry210 = DoorEntryA(null, EventFlag.none, 0xC3ED, 0x03F8, 0x07);
immutable DoorEntryA doorEntry211 = DoorEntryA(null, EventFlag.none, 0x034F, 0x0122, 0x0A);
immutable DoorEntryA doorEntry212 = DoorEntryA(null, EventFlag.none, 0xC45D, 0x03F8, 0x07);
immutable DoorEntryA doorEntry213 = DoorEntryA(null, EventFlag.none, 0x83CA, 0x0346, 0x0F);
immutable DoorEntryA doorEntry214 = DoorEntryA(null, EventFlag.none, 0x83DD, 0x0343, 0x0F);
immutable DoorEntryA doorEntry215 = DoorEntryA(null, EventFlag.none, 0x030C, 0x00D9, 0x0A);
immutable DoorEntryA doorEntry216 = DoorEntryA(null, EventFlag.none, 0x0397, 0x011D, 0x0A);
immutable DoorEntryA doorEntry217 = DoorEntryA(null, EventFlag.none, 0x83DD, 0x0383, 0x0F);
immutable DoorEntryA doorEntry218 = DoorEntryA(null, EventFlag.none, 0x030C, 0x00F9, 0x0A);
immutable DoorEntryA doorEntry219 = DoorEntryA(null, EventFlag.none, 0x0360, 0x00A9, 0x0A);
immutable DoorEntryA doorEntry220 = DoorEntryA(null, EventFlag.none, 0x83CD, 0x03E3, 0x07);
immutable DoorEntryA doorEntry221 = DoorEntryA(null, EventFlag.none, 0xC3CD, 0x039C, 0x07);
immutable DoorEntryA doorEntry222 = DoorEntryA(null, EventFlag.none, 0xC3CD, 0x03DC, 0x07);
immutable DoorEntryA doorEntry223 = DoorEntryA(null, EventFlag.none, 0x838D, 0x03A3, 0x01);
immutable DoorEntryA doorEntry224 = DoorEntryA(null, EventFlag.none, 0x0376, 0x0135, 0x0C);
immutable DoorEntryA doorEntry225 = DoorEntryA(null, EventFlag.none, 0xC39D, 0x03D8, 0x07);
immutable DoorEntryA doorEntry226 = DoorEntryA(null, EventFlag.none, 0x83DD, 0x0363, 0x0F);
immutable DoorEntryA doorEntry227 = DoorEntryA(null, EventFlag.none, 0x0388, 0x03B9, 0x07);
immutable DoorEntryA doorEntry228 = DoorEntryA(null, EventFlag.none, 0x030E, 0x011B, 0x01);
immutable DoorEntryA doorEntry229 = DoorEntryA(null, EventFlag.none, 0x03E8, 0x0351, 0x07);
immutable DoorEntryA doorEntry230 = DoorEntryA(null, EventFlag.twsnTonzuraBusAppear, 0xC435, 0x0378, 0x07);
immutable DoorEntryA doorEntry231 = DoorEntryA(null, EventFlag.none, 0xC3BD, 0x03BC, 0x07);
immutable DoorEntryA doorEntry232 = DoorEntryA("textDoor232", EventFlag.none, 0x0331, 0x0116, 0x0A);
immutable DoorEntryA doorEntry233 = DoorEntryA(null, EventFlag.none, 0x839D, 0x03A3, 0x07);
immutable DoorEntryA doorEntry234 = DoorEntryA("textDoor234", EventFlag.none, 0x8431, 0x034B, 0x07);
immutable DoorEntryA doorEntry235 = DoorEntryA("textDoor235", EventFlag.twsnMichikoThankYou | eventFlagUnset, 0xC3AD, 0x03FC, 0x07);
immutable DoorEntryA doorEntry236 = DoorEntryA(null, EventFlag.none, 0x0398, 0x03B1, 0x07);
immutable DoorEntryA doorEntry237 = DoorEntryA("textDoor237", EventFlag.thrkTunnelClose, 0xC442, 0x009F, 0x01);
immutable DoorEntryA doorEntry238 = DoorEntryA("textDoor238", EventFlag.tlptThrk  | eventFlagUnset, 0x849B, 0x0231, 0x01);
immutable DoorEntryA doorEntry239 = DoorEntryA("textDoor239", EventFlag.unknown0340 | eventFlagUnset, 0x0347, 0x012A, 0x00);
immutable DoorEntryA doorEntry240 = DoorEntryA("textDoor240", EventFlag.unknown0340 | eventFlagUnset, 0x03A3, 0x010D, 0x00);
immutable DoorEntryC doorEntry241 = DoorEntryC("textDoor241");
immutable DoorEntryC doorEntry242 = DoorEntryC("textDoor242");
immutable DoorEntryC doorEntry243 = DoorEntryC("textDoor243");
immutable DoorEntryC doorEntry244 = DoorEntryC("textDoor244");
immutable DoorEntryC doorEntry245 = DoorEntryC("textDoor245");
immutable DoorEntryC doorEntry246 = DoorEntryC("textDoor246");
immutable DoorEntryC doorEntry247 = DoorEntryC("textDoor247");
immutable DoorEntryC doorEntry248 = DoorEntryC("textDoor248");
immutable DoorEntryA doorEntry249 = DoorEntryA("textDoor004", EventFlag.none, 0xC139, 0x029C, 0x01);
immutable DoorEntryA doorEntry250 = DoorEntryA("textDoor004", EventFlag.none, 0xC1A9, 0x021C, 0x01);
immutable DoorEntryA doorEntry251 = DoorEntryA(null, EventFlag.none, 0xC0DD, 0x037C, 0x04);
immutable DoorEntryA doorEntry252 = DoorEntryA(null, EventFlag.none, 0xC10D, 0x03BC, 0x04);
immutable DoorEntryA doorEntry253 = DoorEntryA("textDoor253", EventFlag.tlptThrk , 0xC122, 0x03F1, 0x04);
immutable DoorEntryA doorEntry254 = DoorEntryA("textDoor004", EventFlag.none, 0x80D1, 0x0187, 0x01);
immutable DoorEntryA doorEntry255 = DoorEntryA("textDoor255", EventFlag.tlptBaka | eventFlagUnset, 0xC101, 0x03F0, 0x04);
immutable DoorEntryA doorEntry256 = DoorEntryA(null, EventFlag.none, 0xC0CD, 0x037C, 0x04);
immutable DoorEntryA doorEntry257 = DoorEntryA(null, EventFlag.none, 0xC0DD, 0x03BC, 0x04);
immutable DoorEntryA doorEntry258 = DoorEntryA(null, EventFlag.none, 0x80CD, 0x03A3, 0x0F);
immutable DoorEntryA doorEntry259 = DoorEntryA("textDoor101", EventFlag.none, 0x03F8, 0x01CA, 0x0A);
immutable DoorEntryA doorEntry260 = DoorEntryA(null, EventFlag.none, 0x03B8, 0x0202, 0x0A);
immutable DoorEntryA doorEntry261 = DoorEntryA(null, EventFlag.none, 0x80CD, 0x0363, 0x0F);
immutable DoorEntryA doorEntry262 = DoorEntryA(null, EventFlag.none, 0x03EC, 0x0202, 0x0A);
immutable DoorEntryA doorEntry263 = DoorEntryA(null, EventFlag.none, 0x03C3, 0x01D7, 0x0A);
immutable DoorEntryA doorEntry264 = DoorEntryA(null, EventFlag.none, 0x03E4, 0x01B9, 0x0A);
immutable DoorEntryA doorEntry265 = DoorEntryA(null, EventFlag.none, 0x80F2, 0x03A6, 0x0F);
immutable DoorEntryA doorEntry266 = DoorEntryA("textDoor266", EventFlag.none, 0x8122, 0x03AE, 0x07);
immutable DoorEntryA doorEntry267 = DoorEntryA(null, EventFlag.none, 0x80DA, 0x03E6, 0x0F);
immutable DoorEntryA doorEntry268 = DoorEntryA("textDoor268", EventFlag.none, 0xC0DA, 0x03F9, 0x07);
immutable DoorEntryA doorEntry269 = DoorEntryA("textDoor269", EventFlag.none, 0x03DC, 0x01DF, 0x0A);
immutable DoorEntryA doorEntry270 = DoorEntryA(null, EventFlag.none, 0x00C5, 0x02E9, 0x01);
immutable DoorEntryA doorEntry271 = DoorEntryA("textDoor271", EventFlag.none, 0x83B4, 0x01BA, 0x01);
immutable DoorEntryA doorEntry272 = DoorEntryA(null, EventFlag.none, 0x008A, 0x02E6, 0x01);
immutable DoorEntryA doorEntry273 = DoorEntryA(null, EventFlag.none, 0x03B8, 0x01F7, 0x01);
immutable DoorEntryC doorEntry274 = DoorEntryC("textDoor274");
immutable DoorEntryC doorEntry275 = DoorEntryC("textDoor275");
immutable DoorEntryA doorEntry276 = DoorEntryA(null, EventFlag.none, 0x81A9, 0x01E3, 0x01);
immutable DoorEntryA doorEntry277 = DoorEntryA(null, EventFlag.none, 0xC4CD, 0x0374, 0x04);
immutable DoorEntryA doorEntry278 = DoorEntryA("textDoor004", EventFlag.none, 0x8139, 0x0263, 0x01);
immutable DoorEntryA doorEntry279 = DoorEntryA("textDoor004", EventFlag.none, 0xC4E9, 0x03DC, 0x01);
immutable DoorEntryA doorEntry280 = DoorEntryA(null, EventFlag.none, 0x009A, 0x02D7, 0x0A);
immutable DoorEntryA doorEntry281 = DoorEntryA("textDoor281", EventFlag.winLlptBoss | eventFlagUnset, 0x03F5, 0x0182, 0x01);
immutable DoorEntryA doorEntry282 = DoorEntryA(null, EventFlag.none, 0xC3C4, 0x020C, 0x01);
immutable DoorEntryA doorEntry283 = DoorEntryA("textDoor001", EventFlag.none, 0x008B, 0x01F1, 0x01);
immutable DoorEntryA doorEntry284 = DoorEntryA("textDoor004", EventFlag.none, 0x0401, 0x023C, 0x01);
immutable DoorEntryA doorEntry285 = DoorEntryA(null, EventFlag.none, 0x04B1, 0x033C, 0x01);
immutable DoorEntryA doorEntry286 = DoorEntryA(null, EventFlag.none, 0xC4CD, 0x03F8, 0x04);
immutable DoorEntryA doorEntry287 = DoorEntryA(null, EventFlag.none, 0xC48D, 0x035C, 0x04);
immutable DoorEntryA doorEntry288 = DoorEntryA(null, EventFlag.none, 0xC4EF, 0x03FA, 0x01);
immutable DoorEntryA doorEntry289 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x03B8, 0x04);
immutable DoorEntryA doorEntry290 = DoorEntryA("textDoor290", EventFlag.none, 0xC4FC, 0x03DB, 0x01);
immutable DoorEntryA doorEntry291 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x0374, 0x04);
immutable DoorEntryA doorEntry292 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x03FC, 0x06);
immutable DoorEntryA doorEntry293 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x0374, 0x06);
immutable DoorEntryA doorEntry294 = DoorEntryA(null, EventFlag.none, 0xC4DD, 0x035C, 0x01);
immutable DoorEntryA doorEntry295 = DoorEntryA(null, EventFlag.none, 0xC4DD, 0x03F8, 0x06);
immutable DoorEntryA doorEntry296 = DoorEntryA(null, EventFlag.none, 0xC4DA, 0x0379, 0x04);
immutable DoorEntryA doorEntry297 = DoorEntryA(null, EventFlag.none, 0xC4DA, 0x03B5, 0x04);
immutable DoorEntryA doorEntry298 = DoorEntryA("textDoor004", EventFlag.none, 0x84FC, 0x0224, 0x01);
immutable DoorEntryA doorEntry299 = DoorEntryA(null, EventFlag.none, 0xC489, 0x0388, 0x07);
immutable DoorEntryA doorEntry300 = DoorEntryA(null, EventFlag.none, 0xC48D, 0x03E4, 0x01);
immutable DoorEntryA doorEntry301 = DoorEntryA("textDoor101", EventFlag.none, 0x0462, 0x02B3, 0x0A);
immutable DoorEntryA doorEntry302 = DoorEntryA(null, EventFlag.none, 0x04DC, 0x03C9, 0x07);
immutable DoorEntryA doorEntry303 = DoorEntryA(null, EventFlag.none, 0x048E, 0x029C, 0x0C);
immutable DoorEntryA doorEntry304 = DoorEntryA(null, EventFlag.none, 0x0488, 0x0351, 0x07);
immutable DoorEntryA doorEntry305 = DoorEntryA(null, EventFlag.none, 0x04DC, 0x03D1, 0x07);
immutable DoorEntryA doorEntry306 = DoorEntryA(null, EventFlag.none, 0x0488, 0x03CD, 0x07);
immutable DoorEntryA doorEntry307 = DoorEntryA("textDoor307", EventFlag.none, 0xC49D, 0x03BC, 0x07);
immutable DoorEntryA doorEntry308 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x03FC, 0x07);
immutable DoorEntryA doorEntry309 = DoorEntryA(null, EventFlag.none, 0x848D, 0x0343, 0x01);
immutable DoorEntryA doorEntry310 = DoorEntryA(null, EventFlag.none, 0x0488, 0x03D5, 0x07);
immutable DoorEntryA doorEntry311 = DoorEntryA(null, EventFlag.none, 0x048C, 0x0265, 0x0A);
immutable DoorEntryA doorEntry312 = DoorEntryA(null, EventFlag.none, 0x0478, 0x02E9, 0x0A);
immutable DoorEntryA doorEntry313 = DoorEntryA(null, EventFlag.none, 0x048E, 0x028D, 0x0C);
immutable DoorEntryA doorEntry314 = DoorEntryA(null, EventFlag.none, 0xC4DD, 0x0398, 0x07);
immutable DoorEntryA doorEntry315 = DoorEntryA(null, EventFlag.none, 0x048D, 0x02BF, 0x01);
immutable DoorEntryA doorEntry316 = DoorEntryA(null, EventFlag.none, 0x84DD, 0x03C3, 0x0F);
immutable DoorEntryA doorEntry317 = DoorEntryA(null, EventFlag.none, 0x0491, 0x0302, 0x0A);
immutable DoorEntryA doorEntry318 = DoorEntryA(null, EventFlag.none, 0x04D8, 0x0352, 0x07);
immutable DoorEntryA doorEntry319 = DoorEntryA(null, EventFlag.none, 0x0497, 0x0319, 0x0A);
immutable DoorEntryA doorEntry320 = DoorEntryA(null, EventFlag.none, 0xC48D, 0x0378, 0x07);
immutable DoorEntryA doorEntry321 = DoorEntryA(null, EventFlag.none, 0xC48D, 0x03B8, 0x07);
immutable DoorEntryA doorEntry322 = DoorEntryA(null, EventFlag.none, 0x84DD, 0x0343, 0x0F);
immutable DoorEntryA doorEntry323 = DoorEntryA(null, EventFlag.none, 0x0428, 0x0319, 0x0A);
immutable DoorEntryA doorEntry324 = DoorEntryA(null, EventFlag.none, 0x048E, 0x02D1, 0x0C);
immutable DoorEntryA doorEntry325 = DoorEntryA(null, EventFlag.none, 0x0476, 0x02BB, 0x01);
immutable DoorEntryA doorEntry326 = DoorEntryA(null, EventFlag.none, 0x0413, 0x0290, 0x01);
immutable DoorEntryA doorEntry327 = DoorEntryA(null, EventFlag.none, 0x8123, 0x01E3, 0x01);
immutable DoorEntryA doorEntry328 = DoorEntryA(null, EventFlag.none, 0xC41D, 0x023C, 0x01);
immutable DoorEntryA doorEntry329 = DoorEntryA(null, EventFlag.none, 0x81B5, 0x02A2, 0x01);
immutable DoorEntryA doorEntry330 = DoorEntryA(null, EventFlag.none, 0xC123, 0x01FC, 0x01);
immutable DoorEntryA doorEntry331 = DoorEntryA(null, EventFlag.none, 0x8283, 0x01E3, 0x01);
immutable DoorEntryA doorEntry332 = DoorEntryA(null, EventFlag.none, 0xC1BD, 0x02BC, 0x01);
immutable DoorEntryA doorEntry333 = DoorEntryA(null, EventFlag.none, 0x82AD, 0x01E2, 0x01);
immutable DoorEntryA doorEntry334 = DoorEntryA(null, EventFlag.none, 0x82CD, 0x01E2, 0x01);
immutable DoorEntryA doorEntry335 = DoorEntryA(null, EventFlag.none, 0xC283, 0x01FC, 0x01);
immutable DoorEntryA doorEntry336 = DoorEntryA(null, EventFlag.none, 0x0125, 0x0316, 0x01);
immutable DoorEntryA doorEntry337 = DoorEntryA(null, EventFlag.none, 0xC2A5, 0x01FC, 0x01);
immutable DoorEntryA doorEntry338 = DoorEntryA(null, EventFlag.none, 0x0430, 0x02F0, 0x01);
immutable DoorEntryA doorEntry339 = DoorEntryA(null, EventFlag.none, 0xC4E5, 0x0358, 0x07);
immutable DoorEntryA doorEntry340 = DoorEntryA("textDoor340", EventFlag.thrkPrisonOpen | eventFlagUnset, 0x84BD, 0x0322, 0x07);
immutable DoorEntryA doorEntry341 = DoorEntryA(null, EventFlag.none, 0xC49B, 0x032E, 0x01);
immutable DoorEntryA doorEntry342 = DoorEntryA("textDoor342", EventFlag.thrkTunnelClose, 0x83C2, 0x0140, 0x01);
immutable DoorEntryA doorEntry343 = DoorEntryA(null, EventFlag.none, 0xC4FC, 0x02BB, 0x01);
immutable DoorEntryA doorEntry344 = DoorEntryA(null, EventFlag.none, 0x800C, 0x0304, 0x01);
immutable DoorEntryA doorEntry345 = DoorEntryA(null, EventFlag.none, 0xC3C2, 0x0187, 0x01);
immutable DoorEntryA doorEntry346 = DoorEntryA("textDoor346", EventFlag.none, 0x84E6, 0x0032, 0x01);
immutable DoorEntryC doorEntry347 = DoorEntryC("textDoor347");
immutable DoorEntryC doorEntry348 = DoorEntryC("textDoor348");
immutable DoorEntryA doorEntry349 = DoorEntryA("textDoor349", EventFlag.unknown0340 | eventFlagUnset, 0x0452, 0x02C1, 0x00);
immutable DoorEntryA doorEntry350 = DoorEntryA("textDoor350", EventFlag.unknown0340 | eventFlagUnset, 0x0455, 0x02F5, 0x00);
immutable DoorEntryA doorEntry351 = DoorEntryA("textDoor351", EventFlag.unknown0340 | eventFlagUnset, 0x0449, 0x0305, 0x00);
immutable DoorEntryA doorEntry352 = DoorEntryA("textDoor352", EventFlag.unknown0340 | eventFlagUnset, 0x047C, 0x026D, 0x00);
immutable DoorEntryA doorEntry353 = DoorEntryA("textDoor353", EventFlag.unknown0340 | eventFlagUnset, 0x047A, 0x02D3, 0x00);
immutable DoorEntryA doorEntry354 = DoorEntryA("textDoor354", EventFlag.unknown0340 | eventFlagUnset, 0x0462, 0x030D, 0x00);
immutable DoorEntryA doorEntry355 = DoorEntryA("textDoor355", EventFlag.unknown0340 | eventFlagUnset, 0x0487, 0x02DF, 0x00);
immutable DoorEntryC doorEntry356 = DoorEntryC("textDoor356");
immutable DoorEntryC doorEntry357 = DoorEntryC("textDoor357");
immutable DoorEntryC doorEntry358 = DoorEntryC("textDoor358");
immutable DoorEntryC doorEntry359 = DoorEntryC("textDoor359");
immutable DoorEntryC doorEntry360 = DoorEntryC("textDoor360");
immutable DoorEntryC doorEntry361 = DoorEntryC("textDoor361");
immutable DoorEntryC doorEntry362 = DoorEntryC("textDoor362");
immutable DoorEntryC doorEntry363 = DoorEntryC("textDoor363");
immutable DoorEntryC doorEntry364 = DoorEntryC("textDoor364");
immutable DoorEntryA doorEntry365 = DoorEntryA(null, EventFlag.none, 0xC141, 0x03E8, 0x04);
immutable DoorEntryA doorEntry366 = DoorEntryA(null, EventFlag.none, 0xC13D, 0x03B8, 0x04);
immutable DoorEntryA doorEntry367 = DoorEntryA("textDoor367", EventFlag.none, 0xC0F8, 0x03CB, 0x01);
immutable DoorEntryA doorEntry368 = DoorEntryA("textDoor367", EventFlag.none, 0xC0D8, 0x038B, 0x01);
immutable DoorEntryA doorEntry369 = DoorEntryA("textDoor367", EventFlag.none, 0xC0D8, 0x03CB, 0x01);
immutable DoorEntryA doorEntry370 = DoorEntryA("textDoor367", EventFlag.none, 0xC0F8, 0x038B, 0x01);
immutable DoorEntryA doorEntry371 = DoorEntryA("textDoor001", EventFlag.none, 0xC014, 0x0280, 0x01);
immutable DoorEntryA doorEntry372 = DoorEntryA("textDoor004", EventFlag.none, 0x801C, 0x0267, 0x01);
immutable DoorEntryA doorEntry373 = DoorEntryA("textDoor373", EventFlag.none, 0xC1B8, 0x00F8, 0x01);
immutable DoorEntryA doorEntry374 = DoorEntryA("textDoor004", EventFlag.none, 0x81D0, 0x008B, 0x01);
immutable DoorEntryA doorEntry375 = DoorEntryA(null, EventFlag.none, 0xC169, 0x03F8, 0x04);
immutable DoorEntryA doorEntry376 = DoorEntryA("textDoor004", EventFlag.none, 0xC26C, 0x035C, 0x01);
immutable DoorEntryA doorEntry377 = DoorEntryA("textDoor004", EventFlag.none, 0x01C5, 0x036C, 0x01);
immutable DoorEntryA doorEntry378 = DoorEntryA("textDoor367", EventFlag.none, 0xC2E8, 0x020B, 0x01);
immutable DoorEntryC doorEntry379 = DoorEntryC("textDoor379");
immutable DoorEntryA doorEntry380 = DoorEntryA(null, EventFlag.none, 0x0124, 0x0057, 0x0A);
immutable DoorEntryA doorEntry381 = DoorEntryA(null, EventFlag.none, 0x013C, 0x03DA, 0x07);
immutable DoorEntryA doorEntry382 = DoorEntryA(null, EventFlag.none, 0x013C, 0x03D1, 0x07);
immutable DoorEntryA doorEntry383 = DoorEntryA(null, EventFlag.none, 0x8164, 0x03E0, 0x0F);
immutable DoorEntryA doorEntry384 = DoorEntryA(null, EventFlag.none, 0x017C, 0x03DA, 0x07);
immutable DoorEntryA doorEntry385 = DoorEntryA(null, EventFlag.none, 0x017C, 0x03D1, 0x07);
immutable DoorEntryA doorEntry386 = DoorEntryA(null, EventFlag.none, 0xC0CD, 0x03D8, 0x07);
immutable DoorEntryA doorEntry387 = DoorEntryA(null, EventFlag.none, 0xC0CD, 0x0394, 0x07);
immutable DoorEntryA doorEntry388 = DoorEntryA(null, EventFlag.none, 0x8181, 0x03C7, 0x0F);
immutable DoorEntryA doorEntry389 = DoorEntryA("textDoor389", EventFlag.none, 0x0112, 0x003E, 0x0A);
immutable DoorEntryA doorEntry390 = DoorEntryA(null, EventFlag.none, 0x0263, 0x0028, 0x0A);
immutable DoorEntryA doorEntry391 = DoorEntryA(null, EventFlag.none, 0x80F0, 0x0364, 0x0F);
immutable DoorEntryA doorEntry392 = DoorEntryA(null, EventFlag.none, 0xC0ED, 0x03D8, 0x07);
immutable DoorEntryA doorEntry393 = DoorEntryA(null, EventFlag.none, 0xC0ED, 0x0398, 0x07);
immutable DoorEntryA doorEntry394 = DoorEntryA(null, EventFlag.none, 0x8141, 0x03C7, 0x0F);
immutable DoorEntryA doorEntry395 = DoorEntryA("textDoor395", EventFlag.none, 0x01A3, 0x002B, 0x01);
immutable DoorEntryA doorEntry396 = DoorEntryA("textDoor395", EventFlag.none, 0x01A7, 0x0033, 0x01);
immutable DoorEntryA doorEntry397 = DoorEntryA("textDoor395", EventFlag.none, 0x01A3, 0x0047, 0x01);
immutable DoorEntryA doorEntry398 = DoorEntryA("textDoor395", EventFlag.none, 0x018F, 0x0063, 0x01);
immutable DoorEntryA doorEntry399 = DoorEntryA("textDoor101", EventFlag.none, 0x015B, 0x0043, 0x01);
immutable DoorEntryA doorEntry400 = DoorEntryA(null, EventFlag.none, 0x0245, 0x0061, 0x01);
immutable DoorEntryA doorEntry401 = DoorEntryA("textDoor401", EventFlag.none, 0x024A, 0x0055, 0x01);
immutable DoorEntryA doorEntry402 = DoorEntryA("textDoor402", EventFlag.none, 0x0215, 0x0035, 0x01);
immutable DoorEntryA doorEntry403 = DoorEntryA("textDoor403", EventFlag.winRainBoss | eventFlagUnset, 0x01E1, 0x0019, 0x01);
immutable DoorEntryA doorEntry404 = DoorEntryA(null, EventFlag.none, 0x8434, 0x0167, 0x01);
immutable DoorEntryA doorEntry405 = DoorEntryA(null, EventFlag.none, 0xC034, 0x0298, 0x01);
immutable DoorEntryA doorEntry406 = DoorEntryA(null, EventFlag.none, 0x826C, 0x0307, 0x01);
immutable DoorEntryA doorEntry407 = DoorEntryA(null, EventFlag.none, 0xC438, 0x01BC, 0x01);
immutable DoorEntryA doorEntry408 = DoorEntryA("textDoor408", EventFlag.none, 0x0261, 0x0051, 0x01);
immutable DoorEntryA doorEntry409 = DoorEntryA(null, EventFlag.none, 0x422A, 0x002A, 0x01);
immutable DoorEntryA doorEntry410 = DoorEntryA(null, EventFlag.none, 0x82E5, 0x0322, 0x01);
immutable DoorEntryA doorEntry411 = DoorEntryA(null, EventFlag.none, 0xC1D4, 0x0378, 0x01);
immutable DoorEntryA doorEntry412 = DoorEntryA(null, EventFlag.none, 0xC265, 0x03FC, 0x01);
immutable DoorEntryA doorEntry413 = DoorEntryA(null, EventFlag.none, 0xC2A5, 0x03BC, 0x01);
immutable DoorEntryA doorEntry414 = DoorEntryA(null, EventFlag.none, 0x831D, 0x0322, 0x01);
immutable DoorEntryA doorEntry415 = DoorEntryA(null, EventFlag.none, 0xC2A5, 0x03DC, 0x01);
immutable DoorEntryA doorEntry416 = DoorEntryA(null, EventFlag.none, 0x827D, 0x03C2, 0x01);
immutable DoorEntryA doorEntry417 = DoorEntryA(null, EventFlag.none, 0x827D, 0x03E6, 0x01);
immutable DoorEntryA doorEntry418 = DoorEntryA(null, EventFlag.none, 0x8291, 0x0342, 0x01);
immutable DoorEntryA doorEntry419 = DoorEntryA(null, EventFlag.none, 0xC2BD, 0x03FC, 0x01);
immutable DoorEntryA doorEntry420 = DoorEntryA(null, EventFlag.none, 0xC349, 0x0348, 0x01);
immutable DoorEntryA doorEntry421 = DoorEntryA(null, EventFlag.none, 0x82B5, 0x0302, 0x01);
immutable DoorEntryA doorEntry422 = DoorEntryA(null, EventFlag.none, 0x01CB, 0x030C, 0x01);
immutable DoorEntryA doorEntry423 = DoorEntryA(null, EventFlag.none, 0xC35D, 0x039C, 0x01);
immutable DoorEntryA doorEntry424 = DoorEntryA(null, EventFlag.none, 0x82DD, 0x0343, 0x04);
immutable DoorEntryA doorEntry425 = DoorEntryA(null, EventFlag.none, 0xC22A, 0x0385, 0x07);
immutable DoorEntryA doorEntry426 = DoorEntryA(null, EventFlag.none, 0x8239, 0x0323, 0x07);
immutable DoorEntryA doorEntry427 = DoorEntryA(null, EventFlag.none, 0xC219, 0x035C, 0x07);
immutable DoorEntryA doorEntry428 = DoorEntryA(null, EventFlag.none, 0x8251, 0x03E3, 0x07);
immutable DoorEntryA doorEntry429 = DoorEntryA(null, EventFlag.none, 0xC2FD, 0x03DC, 0x07);
immutable DoorEntryA doorEntry430 = DoorEntryA(null, EventFlag.none, 0x82FD, 0x03C3, 0x07);
immutable DoorEntryA doorEntry431 = DoorEntryA(null, EventFlag.none, 0xC2DD, 0x0358, 0x07);
immutable DoorEntryA doorEntry432 = DoorEntryA("textDoor004", EventFlag.none, 0x819B, 0x03A3, 0x01);
immutable DoorEntryA doorEntry433 = DoorEntryA("textDoor004", EventFlag.none, 0x02C1, 0x01FC, 0x01);
immutable DoorEntryA doorEntry434 = DoorEntryA(null, EventFlag.none, 0x82D9, 0x01E3, 0x07);
immutable DoorEntryA doorEntry435 = DoorEntryA(null, EventFlag.none, 0x0021, 0x031C, 0x01);
immutable DoorEntryA doorEntry436 = DoorEntryA(null, EventFlag.none, 0x8299, 0x01E3, 0x07);
immutable DoorEntryA doorEntry437 = DoorEntryA(null, EventFlag.none, 0xC252, 0x0249, 0x01);
immutable DoorEntryA doorEntry438 = DoorEntryA(null, EventFlag.none, 0xC2F9, 0x01F4, 0x07);
immutable DoorEntryA doorEntry439 = DoorEntryA(null, EventFlag.none, 0x82B9, 0x01E3, 0x07);
immutable DoorEntryA doorEntry440 = DoorEntryA(null, EventFlag.none, 0xC2A9, 0x01B8, 0x07);
immutable DoorEntryA doorEntry441 = DoorEntryA(null, EventFlag.none, 0xC2DD, 0x01A8, 0x07);
immutable DoorEntryA doorEntry442 = DoorEntryA(null, EventFlag.none, 0xC2B1, 0x0164, 0x07);
immutable DoorEntryA doorEntry443 = DoorEntryA(null, EventFlag.none, 0x82CD, 0x0147, 0x07);
immutable DoorEntryA doorEntry444 = DoorEntryA(null, EventFlag.none, 0x8379, 0x03A3, 0x01);
immutable DoorEntryA doorEntry445 = DoorEntryA(null, EventFlag.none, 0x02CB, 0x0110, 0x01);
immutable DoorEntryA doorEntry446 = DoorEntryA("textDoor446", EventFlag.winMlkyBoss | eventFlagUnset, 0x0295, 0x004E, 0x01);
immutable DoorEntryA doorEntry447 = DoorEntryA("textDoor447", EventFlag.none, 0x02BD, 0x0066, 0x01);
immutable DoorEntryA doorEntry448 = DoorEntryA(null, EventFlag.none, 0x0391, 0x0045, 0x01);
immutable DoorEntryA doorEntry449 = DoorEntryA("textDoor447", EventFlag.none, 0x0295, 0x001E, 0x01);
immutable DoorEntryA doorEntry450 = DoorEntryA(null, EventFlag.none, 0x024F, 0x022E, 0x01);
immutable DoorEntryA doorEntry451 = DoorEntryA(null, EventFlag.none, 0x0395, 0x0035, 0x01);
immutable DoorEntryA doorEntry452 = DoorEntryA(null, EventFlag.none, 0xC279, 0x03B9, 0x01);
immutable DoorEntryA doorEntry453 = DoorEntryA("textDoor001", EventFlag.none, 0x011F, 0x0395, 0x01);
immutable DoorEntryA doorEntry454 = DoorEntryA(null, EventFlag.none, 0x810C, 0x036B, 0x01);
immutable DoorEntryA doorEntry455 = DoorEntryA(null, EventFlag.none, 0x8199, 0x0343, 0x01);
immutable DoorEntryA doorEntry456 = DoorEntryA(null, EventFlag.none, 0x0055, 0x034D, 0x01);
immutable DoorEntryA doorEntry457 = DoorEntryA(null, EventFlag.none, 0x81B9, 0x0343, 0x01);
immutable DoorEntryA doorEntry458 = DoorEntryA(null, EventFlag.none, 0xC199, 0x03BD, 0x01);
immutable DoorEntryA doorEntry459 = DoorEntryA(null, EventFlag.none, 0xC199, 0x03FC, 0x01);
immutable DoorEntryA doorEntry460 = DoorEntryA("textDoor460", EventFlag.none, 0x03E2, 0x0019, 0x01);
immutable DoorEntryA doorEntry461 = DoorEntryA("textDoor461", EventFlag.unknown0340 | eventFlagUnset, 0x0021, 0x031C, 0x01);
immutable DoorEntryC doorEntry462 = DoorEntryC("textDoor462");
immutable DoorEntryA doorEntry463 = DoorEntryA(null, EventFlag.none, 0xC3E9, 0x03CB, 0x04);
immutable DoorEntryA doorEntry464 = DoorEntryA("textDoor004", EventFlag.none, 0xC1A9, 0x0350, 0x01);
immutable DoorEntryA doorEntry465 = DoorEntryA("textDoor004", EventFlag.none, 0x0281, 0x018C, 0x01);
immutable DoorEntryA doorEntry466 = DoorEntryA("textDoor004", EventFlag.none, 0x828D, 0x0183, 0x01);
immutable DoorEntryA doorEntry467 = DoorEntryA("textDoor004", EventFlag.none, 0xC379, 0x03F9, 0x01);
immutable DoorEntryA doorEntry468 = DoorEntryA(null, EventFlag.none, 0xC3E9, 0x032B, 0x04);
immutable DoorEntryA doorEntry469 = DoorEntryA(null, EventFlag.none, 0xC3E9, 0x038B, 0x04);
immutable DoorEntryA doorEntry470 = DoorEntryA("textDoor004", EventFlag.none, 0xC1B9, 0x035C, 0x01);
immutable DoorEntryA doorEntry471 = DoorEntryA("textDoor004", EventFlag.none, 0xC28D, 0x019C, 0x01);
immutable DoorEntryA doorEntry472 = DoorEntryA("textDoor004", EventFlag.none, 0x8279, 0x0383, 0x01);
immutable DoorEntryA doorEntry473 = DoorEntryA("textDoor101", EventFlag.none, 0x03CC, 0x001B, 0x0A);
immutable DoorEntryA doorEntry474 = DoorEntryA(null, EventFlag.none, 0x03C4, 0x0037, 0x0A);
immutable DoorEntryA doorEntry475 = DoorEntryA(null, EventFlag.none, 0x03A0, 0x001B, 0x0A);
immutable DoorEntryA doorEntry476 = DoorEntryA(null, EventFlag.none, 0x03A7, 0x0018, 0x01);
immutable DoorEntryA doorEntry477 = DoorEntryA(null, EventFlag.none, 0x03B0, 0x0015, 0x01);
immutable DoorEntryA doorEntry478 = DoorEntryA(null, EventFlag.none, 0x03AA, 0x002D, 0x01);
immutable DoorEntryA doorEntry479 = DoorEntryA(null, EventFlag.none, 0x03AC, 0x0025, 0x01);
immutable DoorEntryA doorEntry480 = DoorEntryA(null, EventFlag.none, 0xC10D, 0x03D8, 0x01);
immutable DoorEntryA doorEntry481 = DoorEntryA("textDoor004", EventFlag.none, 0xC00C, 0x035B, 0x01);
immutable DoorEntryA doorEntry482 = DoorEntryA(null, EventFlag.none, 0xC0ED, 0x03F4, 0x01);
immutable DoorEntryA doorEntry483 = DoorEntryA("textDoor004", EventFlag.none, 0x81AC, 0x02C4, 0x01);
immutable DoorEntryA doorEntry484 = DoorEntryA("textDoor004", EventFlag.none, 0x81AC, 0x02C4, 0x01);
immutable DoorEntryA doorEntry485 = DoorEntryA("textDoor004", EventFlag.none, 0xC35A, 0x03F8, 0x01);
immutable DoorEntryA doorEntry486 = DoorEntryA("textDoor004", EventFlag.none, 0x0413, 0x0031, 0x01);
immutable DoorEntryA doorEntry487 = DoorEntryA("textDoor004", EventFlag.none, 0x0291, 0x03B8, 0x01);
immutable DoorEntryA doorEntry488 = DoorEntryA("textDoor004", EventFlag.none, 0x843C, 0x03C4, 0x01);
immutable DoorEntryA doorEntry489 = DoorEntryA("textDoor004", EventFlag.none, 0xC43C, 0x03FB, 0x01);
immutable DoorEntryC doorEntry490 = DoorEntryC("textDoor490");
immutable DoorEntryA doorEntry491 = DoorEntryA("textDoor346", EventFlag.none, 0x04B4, 0x01B3, 0x01);
immutable DoorEntryA doorEntry492 = DoorEntryA("textDoor346", EventFlag.none, 0x04DC, 0x00AF, 0x01);
immutable DoorEntryA doorEntry493 = DoorEntryA(null, EventFlag.none, 0x0283, 0x038D, 0x01);
immutable DoorEntryA doorEntry494 = DoorEntryA(null, EventFlag.none, 0x02A3, 0x03F5, 0x01);
immutable DoorEntryA doorEntry495 = DoorEntryA(null, EventFlag.none, 0x0293, 0x0305, 0x01);
immutable DoorEntryA doorEntry496 = DoorEntryA(null, EventFlag.none, 0x0293, 0x0339, 0x01);
immutable DoorEntryA doorEntry497 = DoorEntryA(null, EventFlag.none, 0x02C3, 0x0335, 0x01);
immutable DoorEntryA doorEntry498 = DoorEntryA(null, EventFlag.none, 0x84B4, 0x01CC, 0x01);
immutable DoorEntryA doorEntry499 = DoorEntryA(null, EventFlag.none, 0x02EA, 0x03B5, 0x01);
immutable DoorEntryA doorEntry500 = DoorEntryA(null, EventFlag.none, 0x42EC, 0x03ED, 0x01);
immutable DoorEntryA doorEntry501 = DoorEntryA(null, EventFlag.none, 0x42A8, 0x0375, 0x01);
immutable DoorEntryA doorEntry502 = DoorEntryA(null, EventFlag.none, 0x02CA, 0x03D5, 0x01);
immutable DoorEntryA doorEntry503 = DoorEntryA(null, EventFlag.none, 0x4304, 0x0379, 0x01);
immutable DoorEntryA doorEntry504 = DoorEntryA("textDoor346", EventFlag.none, 0x04B6, 0x01C9, 0x01);
immutable DoorEntryA doorEntry505 = DoorEntryA(null, EventFlag.none, 0x44BC, 0x00C1, 0x01);
immutable DoorEntryA doorEntry506 = DoorEntryA(null, EventFlag.dsrtTjabMove | eventFlagUnset, 0xC2A9, 0x0310, 0x01);
immutable DoorEntryA doorEntry507 = DoorEntryA(null, EventFlag.none, 0xC2C9, 0x0310, 0x01);
immutable DoorEntryA doorEntry508 = DoorEntryA(null, EventFlag.none, 0x02A8, 0x0305, 0x01);
immutable DoorEntryA doorEntry509 = DoorEntryA(null, EventFlag.none, 0xC2E9, 0x030C, 0x01);
immutable DoorEntryA doorEntry510 = DoorEntryA(null, EventFlag.none, 0x02C8, 0x0305, 0x01);
immutable DoorEntryA doorEntry511 = DoorEntryA(null, EventFlag.none, 0x02C8, 0x030D, 0x01);
immutable DoorEntryA doorEntry512 = DoorEntryA(null, EventFlag.none, 0xC309, 0x031C, 0x01);
immutable DoorEntryA doorEntry513 = DoorEntryA(null, EventFlag.none, 0x02A8, 0x030D, 0x01);
immutable DoorEntryA doorEntry514 = DoorEntryA(null, EventFlag.none, 0xC289, 0x032C, 0x01);
immutable DoorEntryA doorEntry515 = DoorEntryA(null, EventFlag.none, 0x0288, 0x0329, 0x01);
immutable DoorEntryA doorEntry516 = DoorEntryA(null, EventFlag.none, 0xC2C9, 0x0358, 0x01);
immutable DoorEntryA doorEntry517 = DoorEntryA(null, EventFlag.none, 0x0288, 0x0325, 0x01);
immutable DoorEntryA doorEntry518 = DoorEntryA(null, EventFlag.none, 0xC2E9, 0x03D0, 0x01);
immutable DoorEntryA doorEntry519 = DoorEntryA(null, EventFlag.none, 0xC2C9, 0x03F4, 0x01);
immutable DoorEntryA doorEntry520 = DoorEntryA(null, EventFlag.none, 0x02E8, 0x03CD, 0x01);
immutable DoorEntryA doorEntry521 = DoorEntryA(null, EventFlag.sarudungeonBOK | eventFlagUnset, 0xC2D9, 0x031C, 0x01);
immutable DoorEntryA doorEntry522 = DoorEntryA(null, EventFlag.sarudungeonAOK | eventFlagUnset, 0xC339, 0x031C, 0x01);
immutable DoorEntryA doorEntry523 = DoorEntryA(null, EventFlag.none, 0x8299, 0x0383, 0x01);
immutable DoorEntryA doorEntry524 = DoorEntryA(null, EventFlag.sarudungeonDOK | eventFlagUnset, 0xC2F9, 0x031C, 0x01);
immutable DoorEntryA doorEntry525 = DoorEntryA(null, EventFlag.sarudungeonCOK | eventFlagUnset, 0xC319, 0x031C, 0x01);
immutable DoorEntryA doorEntry526 = DoorEntryA(null, EventFlag.none, 0x82D9, 0x0303, 0x01);
immutable DoorEntryA doorEntry527 = DoorEntryA(null, EventFlag.none, 0x82F9, 0x0303, 0x01);
immutable DoorEntryA doorEntry528 = DoorEntryA(null, EventFlag.sarudungeonHOK | eventFlagUnset, 0xC325, 0x0308, 0x01);
immutable DoorEntryA doorEntry529 = DoorEntryA(null, EventFlag.sarudungeonGOK | eventFlagUnset, 0xC349, 0x0310, 0x01);
immutable DoorEntryA doorEntry530 = DoorEntryA(null, EventFlag.none, 0x831B, 0x0303, 0x01);
immutable DoorEntryA doorEntry531 = DoorEntryA(null, EventFlag.none, 0x0308, 0x0305, 0x01);
immutable DoorEntryA doorEntry532 = DoorEntryA(null, EventFlag.none, 0x0308, 0x0309, 0x01);
immutable DoorEntryA doorEntry533 = DoorEntryA(null, EventFlag.sarudungeonFOK | eventFlagUnset, 0xC2F9, 0x035C, 0x01);
immutable DoorEntryA doorEntry534 = DoorEntryA(null, EventFlag.sarudungeonEOK | eventFlagUnset, 0xC359, 0x031C, 0x01);
immutable DoorEntryA doorEntry535 = DoorEntryA(null, EventFlag.none, 0x8339, 0x0303, 0x01);
immutable DoorEntryA doorEntry536 = DoorEntryA(null, EventFlag.sarudungeonLOK | eventFlagUnset, 0xC2E9, 0x034C, 0x01);
immutable DoorEntryA doorEntry537 = DoorEntryA(null, EventFlag.sarudungeonKOK | eventFlagUnset, 0xC329, 0x035C, 0x01);
immutable DoorEntryA doorEntry538 = DoorEntryA(null, EventFlag.none, 0x8359, 0x0303, 0x01);
immutable DoorEntryA doorEntry539 = DoorEntryA(null, EventFlag.none, 0x02C8, 0x0345, 0x01);
immutable DoorEntryA doorEntry540 = DoorEntryA(null, EventFlag.none, 0x02C8, 0x0355, 0x01);
immutable DoorEntryA doorEntry541 = DoorEntryA(null, EventFlag.sarudungeonJOK | eventFlagUnset, 0xC309, 0x03CC, 0x01);
immutable DoorEntryA doorEntry542 = DoorEntryA(null, EventFlag.sarudungeonIOK | eventFlagUnset, 0xC319, 0x037C, 0x01);
immutable DoorEntryA doorEntry543 = DoorEntryA(null, EventFlag.none, 0x82F9, 0x0343, 0x01);
immutable DoorEntryA doorEntry544 = DoorEntryA(null, EventFlag.none, 0x02E8, 0x03C5, 0x01);
immutable DoorEntryA doorEntry545 = DoorEntryA(null, EventFlag.dsrtSaruTacoDisappear | eventFlagUnset, 0xC351, 0x03B4, 0x01);
immutable DoorEntryA doorEntry546 = DoorEntryA(null, EventFlag.none, 0x8319, 0x0343, 0x01);
immutable DoorEntryA doorEntry547 = DoorEntryA(null, EventFlag.none, 0x02C8, 0x03E5, 0x01);
immutable DoorEntryA doorEntry548 = DoorEntryA("textDoor548", EventFlag.none, 0xC4E6, 0x02CD, 0x01);
immutable DoorEntryA doorEntry549 = DoorEntryA("textDoor549", EventFlag.none, 0x827E, 0x0118, 0x01);
immutable DoorEntryA doorEntry550 = DoorEntryA(null, EventFlag.none, 0xC4E6, 0x020D, 0x01);
immutable DoorEntryA doorEntry551 = DoorEntryA(null, EventFlag.none, 0x84E6, 0x0232, 0x01);
immutable DoorEntryA doorEntry552 = DoorEntryA(null, EventFlag.none, 0xC30D, 0x02DC, 0x01);
immutable DoorEntryA doorEntry553 = DoorEntryA(null, EventFlag.none, 0x8339, 0x02A7, 0x04);
immutable DoorEntryA doorEntry554 = DoorEntryA("textDoor554", EventFlag.none, 0xC35D, 0x02FC, 0x04);
immutable DoorEntryA doorEntry555 = DoorEntryA("textDoor555", EventFlag.none, 0xC2A5, 0x02C8, 0x01);
immutable DoorEntryA doorEntry556 = DoorEntryA("textDoor556", EventFlag.fourTonzuraFree | eventFlagUnset, 0xC357, 0x0296, 0x06);
immutable DoorEntryA doorEntry557 = DoorEntryA("textDoor001", EventFlag.none, 0x0184, 0x01BB, 0x01);
immutable DoorEntryA doorEntry558 = DoorEntryA(null, EventFlag.none, 0xC2B5, 0x027C, 0x04);
immutable DoorEntryA doorEntry559 = DoorEntryA(null, EventFlag.none, 0xC2FD, 0x02FC, 0x01);
immutable DoorEntryA doorEntry560 = DoorEntryA(null, EventFlag.none, 0xC2AD, 0x0238, 0x06);
immutable DoorEntryA doorEntry561 = DoorEntryA("textDoor561", EventFlag.none, 0xC1AC, 0x0317, 0x01);
immutable DoorEntryA doorEntry562 = DoorEntryA(null, EventFlag.none, 0x8209, 0x02A3, 0x04);
immutable DoorEntryA doorEntry563 = DoorEntryA(null, EventFlag.none, 0x0308, 0x02B2, 0x07);
immutable DoorEntryA doorEntry564 = DoorEntryA(null, EventFlag.none, 0x02DB, 0x02C9, 0x07);
immutable DoorEntryA doorEntry565 = DoorEntryA(null, EventFlag.none, 0x02DB, 0x02D1, 0x07);
immutable DoorEntryA doorEntry566 = DoorEntryA("textDoor566", EventFlag.fourElev, 0x82A5, 0x02AB, 0x0D);
immutable DoorEntryA doorEntry567 = DoorEntryA(null, EventFlag.none, 0xC281, 0x02C0, 0x07);
immutable DoorEntryA doorEntry568 = DoorEntryA(null, EventFlag.none, 0xC2C1, 0x02C8, 0x07);
immutable DoorEntryA doorEntry569 = DoorEntryA(null, EventFlag.none, 0x0327, 0x02ED, 0x07);
immutable DoorEntryA doorEntry570 = DoorEntryA(null, EventFlag.none, 0xC28D, 0x0298, 0x07);
immutable DoorEntryA doorEntry571 = DoorEntryA(null, EventFlag.none, 0x02DB, 0x02A9, 0x07);
immutable DoorEntryA doorEntry572 = DoorEntryA(null, EventFlag.none, 0x02DB, 0x02B1, 0x07);
immutable DoorEntryA doorEntry573 = DoorEntryA("textDoor573", EventFlag.none, 0x830C, 0x0224, 0x07);
immutable DoorEntryA doorEntry574 = DoorEntryA(null, EventFlag.none, 0xC28D, 0x02F8, 0x07);
immutable DoorEntryA doorEntry575 = DoorEntryA(null, EventFlag.none, 0xC2AD, 0x0298, 0x07);
immutable DoorEntryA doorEntry576 = DoorEntryA(null, EventFlag.none, 0x0268, 0x02ED, 0x07);
immutable DoorEntryA doorEntry577 = DoorEntryA("textDoor577", EventFlag.fourElev, 0x832D, 0x02E3, 0x0D);
immutable DoorEntryA doorEntry578 = DoorEntryA(null, EventFlag.none, 0x026B, 0x02AE, 0x07);
immutable DoorEntryA doorEntry579 = DoorEntryA(null, EventFlag.none, 0x0288, 0x0290, 0x07);
immutable DoorEntryA doorEntry580 = DoorEntryA(null, EventFlag.none, 0xC32B, 0x029A, 0x07);
immutable DoorEntryA doorEntry581 = DoorEntryA(null, EventFlag.none, 0xC24F, 0x01AF, 0x0C);
immutable DoorEntryA doorEntry582 = DoorEntryA(null, EventFlag.none, 0x82ED, 0x0283, 0x0F);
immutable DoorEntryA doorEntry583 = DoorEntryA(null, EventFlag.none, 0xC2AD, 0x02F8, 0x07);
immutable DoorEntryA doorEntry584 = DoorEntryA(null, EventFlag.none, 0xC2CD, 0x0298, 0x07);
immutable DoorEntryA doorEntry585 = DoorEntryA(null, EventFlag.none, 0x828D, 0x0283, 0x07);
immutable DoorEntryA doorEntry586 = DoorEntryA("textDoor586", EventFlag.fourElev, 0xC32D, 0x02F8, 0x0D);
immutable DoorEntryA doorEntry587 = DoorEntryA("textDoor587", EventFlag.none, 0x0278, 0x0285, 0x0D);
immutable DoorEntryA doorEntry588 = DoorEntryA("textDoor588", EventFlag.none, 0x0203, 0x01B0, 0x01);
immutable DoorEntryA doorEntry589 = DoorEntryA(null, EventFlag.none, 0x02A8, 0x028A, 0x07);
immutable DoorEntryA doorEntry590 = DoorEntryA(null, EventFlag.none, 0x8341, 0x0226, 0x07);
immutable DoorEntryA doorEntry591 = DoorEntryA(null, EventFlag.none, 0xC2CD, 0x02F8, 0x07);
immutable DoorEntryA doorEntry592 = DoorEntryA(null, EventFlag.none, 0xC2ED, 0x02F8, 0x07);
immutable DoorEntryA doorEntry593 = DoorEntryA(null, EventFlag.none, 0x02A8, 0x0290, 0x07);
immutable DoorEntryA doorEntry594 = DoorEntryA("textDoor594", EventFlag.fourElev, 0xC30D, 0x02F8, 0x0D);
immutable DoorEntryA doorEntry595 = DoorEntryA(null, EventFlag.none, 0x826D, 0x02E3, 0x07);
immutable DoorEntryA doorEntry596 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x02F8, 0x07);
immutable DoorEntryA doorEntry597 = DoorEntryA(null, EventFlag.none, 0x026B, 0x02C1, 0x07);
immutable DoorEntryA doorEntry598 = DoorEntryA(null, EventFlag.none, 0x826D, 0x0283, 0x07);
immutable DoorEntryA doorEntry599 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x0298, 0x07);
immutable DoorEntryA doorEntry600 = DoorEntryA(null, EventFlag.none, 0x830D, 0x02E3, 0x07);
immutable DoorEntryA doorEntry601 = DoorEntryA(null, EventFlag.none, 0x02C8, 0x0290, 0x07);
immutable DoorEntryA doorEntry602 = DoorEntryA(null, EventFlag.none, 0x02F8, 0x02F1, 0x07);
immutable DoorEntryA doorEntry603 = DoorEntryA(null, EventFlag.none, 0x82B1, 0x0223, 0x0F);
immutable DoorEntryA doorEntry604 = DoorEntryA("textDoor604", EventFlag.fourOK | eventFlagUnset, 0x82ED, 0x02E3, 0x07);
immutable DoorEntryA doorEntry605 = DoorEntryA(null, EventFlag.fourStairwayAppear | eventFlagUnset, 0xC209, 0x02BC, 0x0F);
immutable DoorEntryA doorEntry606 = DoorEntryA(null, EventFlag.fourYudanRoboDisappear | eventFlagUnset, 0x02EC, 0x02C2, 0x07);
immutable DoorEntryA doorEntry607 = DoorEntryA(null, EventFlag.none, 0x82CD, 0x0283, 0x07);
immutable DoorEntryA doorEntry608 = DoorEntryA(null, EventFlag.none, 0xC2D9, 0x02E8, 0x07);
immutable DoorEntryA doorEntry609 = DoorEntryA(null, EventFlag.none, 0xC31D, 0x02CC, 0x01);
immutable DoorEntryA doorEntry610 = DoorEntryA("textDoor101", EventFlag.none, 0xC24B, 0x0142, 0x01);
immutable DoorEntryA doorEntry611 = DoorEntryA(null, EventFlag.none, 0xC27D, 0x02FC, 0x07);
immutable DoorEntryA doorEntry612 = DoorEntryA(null, EventFlag.none, 0xC27D, 0x0238, 0x07);
immutable DoorEntryA doorEntry613 = DoorEntryA(null, EventFlag.none, 0x832D, 0x02A3, 0x0F);
immutable DoorEntryA doorEntry614 = DoorEntryA(null, EventFlag.none, 0xC33D, 0x02D8, 0x07);
immutable DoorEntryA doorEntry615 = DoorEntryA(null, EventFlag.none, 0xC35D, 0x02D8, 0x07);
immutable DoorEntryA doorEntry616 = DoorEntryA(null, EventFlag.none, 0xC1C9, 0x0173, 0x01);
immutable DoorEntryA doorEntry617 = DoorEntryA(null, EventFlag.none, 0x82FD, 0x02E3, 0x01);
immutable DoorEntryA doorEntry618 = DoorEntryA(null, EventFlag.none, 0xC2DD, 0x02DC, 0x07);
immutable DoorEntryA doorEntry619 = DoorEntryA("textDoor587", EventFlag.none, 0x02D8, 0x0285, 0x0D);
immutable DoorEntryA doorEntry620 = DoorEntryA(null, EventFlag.none, 0x032C, 0x02C5, 0x07);
immutable DoorEntryA doorEntry621 = DoorEntryA(null, EventFlag.none, 0x829D, 0x02E3, 0x07);
immutable DoorEntryA doorEntry622 = DoorEntryA(null, EventFlag.none, 0x830D, 0x02A3, 0x0F);
immutable DoorEntryA doorEntry623 = DoorEntryA(null, EventFlag.none, 0xC31D, 0x02FC, 0x07);
immutable DoorEntryA doorEntry624 = DoorEntryA(null, EventFlag.none, 0xC34D, 0x02DC, 0x07);
immutable DoorEntryA doorEntry625 = DoorEntryA(null, EventFlag.none, 0x0318, 0x02B1, 0x07);
immutable DoorEntryA doorEntry626 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x02CC, 0x07);
immutable DoorEntryA doorEntry627 = DoorEntryA("textDoor587", EventFlag.none, 0x0298, 0x0285, 0x0D);
immutable DoorEntryA doorEntry628 = DoorEntryA("textDoor628", EventFlag.fourMaidThanks | eventFlagUnset, 0x02B8, 0x0285, 0x0D);
immutable DoorEntryA doorEntry629 = DoorEntryA(null, EventFlag.none, 0xC2BD, 0x02FC, 0x07);
immutable DoorEntryA doorEntry630 = DoorEntryA("textDoor630", EventFlag.none, 0xC218, 0x01C2, 0x0C);
immutable DoorEntryA doorEntry631 = DoorEntryA(null, EventFlag.none, 0x032C, 0x02D1, 0x07);
immutable DoorEntryA doorEntry632 = DoorEntryA(null, EventFlag.none, 0x0318, 0x02BD, 0x07);
immutable DoorEntryA doorEntry633 = DoorEntryA("textDoor633", EventFlag.unknown0340 | eventFlagUnset, 0x035E, 0x02BE, 0x00);
immutable DoorEntryA doorEntry634 = DoorEntryA(null, EventFlag.fourKomoritaAppear | eventFlagUnset, 0xC35D, 0x02BC, 0x07);
immutable DoorEntryA doorEntry635 = DoorEntryA(null, EventFlag.none, 0x835D, 0x02E2, 0x01);
immutable DoorEntryA doorEntry636 = DoorEntryA("textDoor636", EventFlag.none, 0xC2DD, 0x026C, 0x07);
immutable DoorEntryA doorEntry637 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x023C, 0x07);
immutable DoorEntryA doorEntry638 = DoorEntryA("textDoor638", EventFlag.none, 0x823E, 0x0179, 0x0A);
immutable DoorEntryA doorEntry639 = DoorEntryA(null, EventFlag.fourTopoloBoyBAppear | eventFlagUnset, 0xC34D, 0x02BC, 0x07);
immutable DoorEntryA doorEntry640 = DoorEntryA("textDoor640", EventFlag.none, 0x02A8, 0x0259, 0x07);
immutable DoorEntryA doorEntry641 = DoorEntryA("textDoor641", EventFlag.none, 0xC1E2, 0x0142, 0x0A);
immutable DoorEntryA doorEntry642 = DoorEntryA("textDoor642", EventFlag.none, 0x82DD, 0x0233, 0x07);
immutable DoorEntryA doorEntry643 = DoorEntryA("textDoor004", EventFlag.none, 0x0044, 0x0283, 0x01);
immutable DoorEntryA doorEntry644 = DoorEntryA(null, EventFlag.none, 0x8299, 0x0227, 0x07);
immutable DoorEntryA doorEntry645 = DoorEntryA(null, EventFlag.none, 0x82AB, 0x024D, 0x07);
immutable DoorEntryA doorEntry646 = DoorEntryA(null, EventFlag.none, 0xC297, 0x027B, 0x01);
immutable DoorEntryA doorEntry647 = DoorEntryA("textDoor647", EventFlag.none, 0x0217, 0x0192, 0x0A);
immutable DoorEntryA doorEntry648 = DoorEntryA(null, EventFlag.none, 0x01D9, 0x01B0, 0x0A);
immutable DoorEntryA doorEntry649 = DoorEntryA(null, EventFlag.none, 0x82F1, 0x02AB, 0x0F);
immutable DoorEntryA doorEntry650 = DoorEntryA(null, EventFlag.none, 0xC0B2, 0x001D, 0x01);
immutable DoorEntryA doorEntry651 = DoorEntryA(null, EventFlag.none, 0xC0B6, 0x001D, 0x01);
immutable DoorEntryA doorEntry652 = DoorEntryA(null, EventFlag.none, 0x435A, 0x02AD, 0x01);
immutable DoorEntryA doorEntry653 = DoorEntryA(null, EventFlag.none, 0xC1BC, 0x02D7, 0x07);
immutable DoorEntryA doorEntry654 = DoorEntryA(null, EventFlag.none, 0xC22C, 0x0217, 0x07);
immutable DoorEntryA doorEntry655 = DoorEntryA(null, EventFlag.none, 0x81B6, 0x0362, 0x01);
immutable DoorEntryA doorEntry656 = DoorEntryA(null, EventFlag.none, 0x81BA, 0x0362, 0x01);
immutable DoorEntryA doorEntry657 = DoorEntryA(null, EventFlag.none, 0x8056, 0x0262, 0x01);
immutable DoorEntryA doorEntry658 = DoorEntryA(null, EventFlag.none, 0x805A, 0x0262, 0x01);
immutable DoorEntryA doorEntry659 = DoorEntryA(null, EventFlag.none, 0x0054, 0x0299, 0x07);
immutable DoorEntryA doorEntry660 = DoorEntryA(null, EventFlag.none, 0x004C, 0x02BD, 0x07);
immutable DoorEntryA doorEntry661 = DoorEntryA(null, EventFlag.none, 0xC056, 0x02FD, 0x01);
immutable DoorEntryA doorEntry662 = DoorEntryA(null, EventFlag.none, 0xC05A, 0x02FD, 0x01);
immutable DoorEntryA doorEntry663 = DoorEntryA(null, EventFlag.none, 0xC24C, 0x0217, 0x07);
immutable DoorEntryA doorEntry664 = DoorEntryA(null, EventFlag.none, 0x8196, 0x0182, 0x01);
immutable DoorEntryA doorEntry665 = DoorEntryA(null, EventFlag.none, 0x819A, 0x0182, 0x01);
immutable DoorEntryA doorEntry666 = DoorEntryA(null, EventFlag.none, 0x01AC, 0x039D, 0x07);
immutable DoorEntryA doorEntry667 = DoorEntryA(null, EventFlag.none, 0xC1B6, 0x03FD, 0x01);
immutable DoorEntryA doorEntry668 = DoorEntryA(null, EventFlag.none, 0xC1BA, 0x03FD, 0x01);
immutable DoorEntryA doorEntry669 = DoorEntryA("textDoor669", EventFlag.none, 0x4200, 0x01ED, 0x01);
immutable DoorEntryA doorEntry670 = DoorEntryA(null, EventFlag.none, 0xC26C, 0x021B, 0x07);
immutable DoorEntryA doorEntry671 = DoorEntryA(null, EventFlag.none, 0x0194, 0x01A9, 0x07);
immutable DoorEntryC doorEntry672 = DoorEntryC("textDoor672");
immutable DoorEntryC doorEntry673 = DoorEntryC("textDoor673");
immutable DoorEntryC doorEntry674 = DoorEntryC("textDoor674");
immutable DoorEntryA doorEntry675 = DoorEntryA("textDoor675", EventFlag.unknown0340 | eventFlagUnset, 0x02DB, 0x02B9, 0x00);
immutable DoorEntryC doorEntry676 = DoorEntryC("textDoor676");
immutable DoorEntryC doorEntry677 = DoorEntryC("textDoor677");
immutable DoorEntryC doorEntry678 = DoorEntryC("textDoor678");
immutable DoorEntryC doorEntry679 = DoorEntryC("textDoor679");
immutable DoorEntryC doorEntry680 = DoorEntryC("textDoor680");
immutable DoorEntryC doorEntry681 = DoorEntryC("textDoor681");
immutable DoorEntryA doorEntry682 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x035C, 0x04);
immutable DoorEntryA doorEntry683 = DoorEntryA("textDoor367", EventFlag.none, 0xC478, 0x03AB, 0x04);
immutable DoorEntryA doorEntry684 = DoorEntryA(null, EventFlag.none, 0xC47D, 0x035C, 0x04);
immutable DoorEntryA doorEntry685 = DoorEntryA("textDoor685", EventFlag.sumsStoicReserved | eventFlagUnset, 0xC47A, 0x03D9, 0x01);
immutable DoorEntryA doorEntry686 = DoorEntryA("textDoor686", EventFlag.none, 0xC4AD, 0x037C, 0x04);
immutable DoorEntryA doorEntry687 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x035C, 0x04);
immutable DoorEntryA doorEntry688 = DoorEntryA(null, EventFlag.none, 0xC4CD, 0x03D4, 0x04);
immutable DoorEntryA doorEntry689 = DoorEntryA("textDoor367", EventFlag.none, 0xC4AD, 0x035C, 0x04);
immutable DoorEntryA doorEntry690 = DoorEntryA("textDoor367", EventFlag.none, 0xC4A9, 0x0390, 0x04);
immutable DoorEntryA doorEntry691 = DoorEntryA("textDoor367", EventFlag.none, 0xC4A9, 0x03D0, 0x04);
immutable DoorEntryA doorEntry692 = DoorEntryA("textDoor367", EventFlag.none, 0xC4CD, 0x0354, 0x04);
immutable DoorEntryA doorEntry693 = DoorEntryA("textDoor367", EventFlag.none, 0xC4CD, 0x0394, 0x04);
immutable DoorEntryA doorEntry694 = DoorEntryA(null, EventFlag.none, 0x04BC, 0x03C9, 0x07);
immutable DoorEntryA doorEntry695 = DoorEntryA(null, EventFlag.none, 0x04BC, 0x03D1, 0x07);
immutable DoorEntryA doorEntry696 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x0398, 0x07);
immutable DoorEntryA doorEntry697 = DoorEntryA(null, EventFlag.none, 0x0157, 0x032D, 0x0A);
immutable DoorEntryA doorEntry698 = DoorEntryA(null, EventFlag.none, 0x84BD, 0x03C3, 0x0F);
immutable DoorEntryA doorEntry699 = DoorEntryA(null, EventFlag.none, 0x04B8, 0x0352, 0x07);
immutable DoorEntryA doorEntry700 = DoorEntryA(null, EventFlag.none, 0xC46D, 0x0354, 0x07);
immutable DoorEntryA doorEntry701 = DoorEntryA(null, EventFlag.none, 0xC46D, 0x03D4, 0x07);
immutable DoorEntryA doorEntry702 = DoorEntryA(null, EventFlag.none, 0x84BD, 0x0343, 0x0F);
immutable DoorEntryA doorEntry703 = DoorEntryA(null, EventFlag.none, 0x84AD, 0x03A3, 0x0F);
immutable DoorEntryA doorEntry704 = DoorEntryA("textDoor704", EventFlag.none, 0x84AD, 0x0362, 0x01);
immutable DoorEntryA doorEntry705 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x039C, 0x07);
immutable DoorEntryA doorEntry706 = DoorEntryA(null, EventFlag.none, 0xC470, 0x03F3, 0x0F);
immutable DoorEntryA doorEntry707 = DoorEntryA(null, EventFlag.none, 0xC478, 0x03FB, 0x0F);
immutable DoorEntryA doorEntry708 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x03DC, 0x07);
immutable DoorEntryA doorEntry709 = DoorEntryA(null, EventFlag.none, 0x849D, 0x0343, 0x0F);
immutable DoorEntryA doorEntry710 = DoorEntryA(null, EventFlag.none, 0x0154, 0x0297, 0x0A);
immutable DoorEntryA doorEntry711 = DoorEntryA("textDoor711", EventFlag.none, 0x0154, 0x0268, 0x0A);
immutable DoorEntryA doorEntry712 = DoorEntryA(null, EventFlag.none, 0x0155, 0x02C2, 0x0F);
immutable DoorEntryA doorEntry713 = DoorEntryA(null, EventFlag.none, 0x8449, 0x038B, 0x0F);
immutable DoorEntryA doorEntry714 = DoorEntryA(null, EventFlag.none, 0x845C, 0x0384, 0x0F);
immutable DoorEntryA doorEntry715 = DoorEntryA(null, EventFlag.none, 0xC45C, 0x03BB, 0x0F);
immutable DoorEntryA doorEntry716 = DoorEntryA("textDoor716", EventFlag.none, 0x0155, 0x0237, 0x0A);
immutable DoorEntryA doorEntry717 = DoorEntryA(null, EventFlag.none, 0x0448, 0x0398, 0x07);
immutable DoorEntryA doorEntry718 = DoorEntryA(null, EventFlag.none, 0x0448, 0x03A8, 0x07);
immutable DoorEntryA doorEntry719 = DoorEntryA("textDoor711", EventFlag.none, 0x0163, 0x0362, 0x0A);
immutable DoorEntryA doorEntry720 = DoorEntryA(null, EventFlag.none, 0xC457, 0x0379, 0x01);
immutable DoorEntryA doorEntry721 = DoorEntryA("textDoor647", EventFlag.none, 0x0152, 0x02EE, 0x0A);
immutable DoorEntryA doorEntry722 = DoorEntryA("textDoor711", EventFlag.none, 0x0163, 0x0376, 0x0A);
immutable DoorEntryA doorEntry723 = DoorEntryA(null, EventFlag.none, 0x84AD, 0x03E3, 0x07);
immutable DoorEntryA doorEntry724 = DoorEntryA(null, EventFlag.none, 0x8455, 0x0347, 0x0F);
immutable DoorEntryA doorEntry725 = DoorEntryA("textDoor725", EventFlag.none, 0x0163, 0x0382, 0x0A);
immutable DoorEntryA doorEntry726 = DoorEntryA(null, EventFlag.none, 0x04A8, 0x03AD, 0x07);
immutable DoorEntryA doorEntry727 = DoorEntryA("textDoor711", EventFlag.none, 0x0163, 0x0396, 0x0A);
immutable DoorEntryA doorEntry728 = DoorEntryA("textDoor711", EventFlag.none, 0x0163, 0x03A2, 0x0A);
immutable DoorEntryA doorEntry729 = DoorEntryA(null, EventFlag.none, 0x015B, 0x036A, 0x0A);
immutable DoorEntryC doorEntry730 = DoorEntryC("textDoor730");
immutable DoorEntryC doorEntry731 = DoorEntryC("textDoor731");
immutable DoorEntryC doorEntry732 = DoorEntryC("textDoor732");
immutable DoorEntryC doorEntry733 = DoorEntryC("textDoor733");
immutable DoorEntryC doorEntry734 = DoorEntryC("textDoor734");
immutable DoorEntryC doorEntry735 = DoorEntryC("textDoor735");
immutable DoorEntryC doorEntry736 = DoorEntryC("textDoor736");
immutable DoorEntryC doorEntry737 = DoorEntryC("textDoor737");
immutable DoorEntryA doorEntry738 = DoorEntryA("textDoor738", EventFlag.unknown0340 | eventFlagUnset, 0x015B, 0x038B, 0x00);
immutable DoorEntryA doorEntry739 = DoorEntryA("textDoor739", EventFlag.unknown0340 | eventFlagUnset, 0x015B, 0x03AB, 0x00);
immutable DoorEntryC doorEntry740 = DoorEntryC("textDoor740");
immutable DoorEntryC doorEntry741 = DoorEntryC("textDoor741");
immutable DoorEntryC doorEntry742 = DoorEntryC("textDoor742");
immutable DoorEntryA doorEntry743 = DoorEntryA(null, EventFlag.none, 0xC411, 0x03F8, 0x01);
immutable DoorEntryA doorEntry744 = DoorEntryA("textDoor367", EventFlag.none, 0xC3C9, 0x0370, 0x01);
immutable DoorEntryA doorEntry745 = DoorEntryA("textDoor367", EventFlag.none, 0xC3F9, 0x03B4, 0x01);
immutable DoorEntryA doorEntry746 = DoorEntryA("textDoor367", EventFlag.none, 0xC3E9, 0x0370, 0x01);
immutable DoorEntryA doorEntry747 = DoorEntryA("textDoor367", EventFlag.none, 0xC3D9, 0x03B0, 0x01);
immutable DoorEntryA doorEntry748 = DoorEntryA("textDoor004", EventFlag.ramaRabbitDisappear | eventFlagUnset, 0xC396, 0x021C, 0x01);
immutable DoorEntryA doorEntry749 = DoorEntryA("textDoor001", EventFlag.none, 0x82B1, 0x0103, 0x01);
immutable DoorEntryA doorEntry750 = DoorEntryA("textDoor711", EventFlag.none, 0x01D4, 0x0220, 0x01);
immutable DoorEntryA doorEntry751 = DoorEntryA("textDoor711", EventFlag.none, 0x01E4, 0x0250, 0x01);
immutable DoorEntryA doorEntry752 = DoorEntryA("textDoor711", EventFlag.none, 0x01F4, 0x0228, 0x01);
immutable DoorEntryA doorEntry753 = DoorEntryA("textDoor711", EventFlag.none, 0x01EC, 0x0218, 0x01);
immutable DoorEntryA doorEntry754 = DoorEntryA(null, EventFlag.none, 0x8411, 0x03C7, 0x01);
immutable DoorEntryA doorEntry755 = DoorEntryA(null, EventFlag.none, 0xC411, 0x0368, 0x01);
immutable DoorEntryA doorEntry756 = DoorEntryA("textDoor101", EventFlag.none, 0x01BA, 0x0239, 0x01);
immutable DoorEntryA doorEntry757 = DoorEntryA(null, EventFlag.none, 0x023A, 0x024E, 0x05);
immutable DoorEntryA doorEntry758 = DoorEntryA(null, EventFlag.none, 0xC436, 0x023C, 0x01);
immutable DoorEntryA doorEntry759 = DoorEntryA(null, EventFlag.none, 0x020A, 0x021D, 0x01);
immutable DoorEntryA doorEntry760 = DoorEntryA(null, EventFlag.none, 0x0437, 0x0221, 0x05);
immutable DoorEntryA doorEntry761 = DoorEntryA(null, EventFlag.none, 0x0437, 0x0234, 0x05);
immutable DoorEntryA doorEntry762 = DoorEntryA(null, EventFlag.none, 0x0397, 0x01F1, 0x05);
immutable DoorEntryA doorEntry763 = DoorEntryA(null, EventFlag.none, 0x02B7, 0x012E, 0x05);
immutable DoorEntryA doorEntry764 = DoorEntryA(null, EventFlag.none, 0x8399, 0x01E7, 0x01);
immutable DoorEntryA doorEntry765 = DoorEntryA("textDoor765", EventFlag.winPinkBoss | eventFlagUnset, 0x0306, 0x01C5, 0x01);
immutable DoorEntryA doorEntry766 = DoorEntryA(null, EventFlag.none, 0x047A, 0x0216, 0x05);
immutable DoorEntryA doorEntry767 = DoorEntryA(null, EventFlag.none, 0xC42D, 0x03E8, 0x01);
immutable DoorEntryA doorEntry768 = DoorEntryA("textDoor367", EventFlag.none, 0xC3D9, 0x0334, 0x01);
immutable DoorEntryA doorEntry769 = DoorEntryA(null, EventFlag.none, 0xC3B9, 0x0334, 0x01);
immutable DoorEntryA doorEntry770 = DoorEntryA(null, EventFlag.none, 0xC36B, 0x03E6, 0x01);
immutable DoorEntryA doorEntry771 = DoorEntryA("textDoor367", EventFlag.none, 0xC3F9, 0x0334, 0x01);
immutable DoorEntryA doorEntry772 = DoorEntryA("textDoor004", EventFlag.none, 0x8139, 0x02C7, 0x01);
immutable DoorEntryA doorEntry773 = DoorEntryA("textDoor773", EventFlag.dungeonMan, 0xC1A9, 0x033C, 0x01);
immutable DoorEntryC doorEntry774 = DoorEntryC("textDoor774");
immutable DoorEntryB doorEntry775 = DoorEntryB(EventFlag.tlptSkrb | eventFlagUnset, "textDoor775");
immutable DoorEntryB doorEntry776 = DoorEntryB(EventFlag.sphinx | eventFlagUnset, "textDoor776");
immutable DoorEntryB doorEntry777 = DoorEntryB(EventFlag.sphinx | eventFlagUnset, "textDoor777");
immutable DoorEntryB doorEntry778 = DoorEntryB(EventFlag.sphinx | eventFlagUnset, "textDoor778");
immutable DoorEntryB doorEntry779 = DoorEntryB(EventFlag.sphinx | eventFlagUnset, "textDoor779");
immutable DoorEntryA doorEntry780 = DoorEntryA("textDoor780", EventFlag.none, 0x0205, 0x0099, 0x01);
immutable DoorEntryA doorEntry781 = DoorEntryA(null, EventFlag.none, 0x0200, 0x00CC, 0x01);
immutable DoorEntryA doorEntry782 = DoorEntryA("textDoor711", EventFlag.none, 0x01F8, 0x00B8, 0x01);
immutable DoorEntryA doorEntry783 = DoorEntryA("textDoor711", EventFlag.none, 0x0204, 0x00AC, 0x01);
immutable DoorEntryA doorEntry784 = DoorEntryA(null, EventFlag.none, 0x01F8, 0x00A4, 0x01);
immutable DoorEntryA doorEntry785 = DoorEntryA(null, EventFlag.none, 0x0263, 0x00DF, 0x01);
immutable DoorEntryA doorEntry786 = DoorEntryA(null, EventFlag.none, 0x80BD, 0x0023, 0x01);
immutable DoorEntryA doorEntry787 = DoorEntryA(null, EventFlag.none, 0xC139, 0x02D0, 0x01);
immutable DoorEntryA doorEntry788 = DoorEntryA(null, EventFlag.none, 0x8239, 0x0207, 0x01);
immutable DoorEntryA doorEntry789 = DoorEntryA(null, EventFlag.none, 0xC0A9, 0x0044, 0x01);
immutable DoorEntryA doorEntry790 = DoorEntryA(null, EventFlag.none, 0x831D, 0x0167, 0x01);
immutable DoorEntryA doorEntry791 = DoorEntryA(null, EventFlag.none, 0x81D1, 0x0063, 0x01);
immutable DoorEntryA doorEntry792 = DoorEntryA(null, EventFlag.none, 0xC239, 0x0214, 0x01);
immutable DoorEntryA doorEntry793 = DoorEntryA(null, EventFlag.none, 0xC19D, 0x0208, 0x01);
immutable DoorEntryA doorEntry794 = DoorEntryA(null, EventFlag.none, 0x84B9, 0x0223, 0x01);
immutable DoorEntryA doorEntry795 = DoorEntryA(null, EventFlag.skrbPyramidOK | eventFlagUnset, 0x02BE, 0x0206, 0x05);
immutable DoorEntryA doorEntry796 = DoorEntryA(null, EventFlag.none, 0xC2E9, 0x01B4, 0x01);
immutable DoorEntryA doorEntry797 = DoorEntryA(null, EventFlag.none, 0xC259, 0x020C, 0x01);
immutable DoorEntryA doorEntry798 = DoorEntryA(null, EventFlag.none, 0x81CD, 0x0067, 0x01);
immutable DoorEntryA doorEntry799 = DoorEntryA(null, EventFlag.none, 0x8189, 0x01E3, 0x01);
immutable DoorEntryA doorEntry800 = DoorEntryA(null, EventFlag.none, 0xC1CD, 0x0078, 0x01);
immutable DoorEntryA doorEntry801 = DoorEntryA(null, EventFlag.none, 0x8279, 0x0207, 0x01);
immutable DoorEntryA doorEntry802 = DoorEntryA(null, EventFlag.none, 0xC4CD, 0x024C, 0x01);
immutable DoorEntryA doorEntry803 = DoorEntryA(null, EventFlag.none, 0x8429, 0x01C7, 0x01);
immutable DoorEntryA doorEntry804 = DoorEntryA(null, EventFlag.none, 0xC279, 0x0214, 0x01);
immutable DoorEntryA doorEntry805 = DoorEntryA(null, EventFlag.fmonPyraBossDisappear | eventFlagUnset, 0x8299, 0x0207, 0x01);
immutable DoorEntryA doorEntry806 = DoorEntryA(null, EventFlag.none, 0xC45D, 0x0218, 0x01);
immutable DoorEntryA doorEntry807 = DoorEntryA("textDoor807", EventFlag.itemTakanome | eventFlagUnset, 0x81BD, 0x0283, 0x01);
immutable DoorEntryA doorEntry808 = DoorEntryA(null, EventFlag.none, 0xC2B9, 0x0214, 0x01);
immutable DoorEntryA doorEntry809 = DoorEntryA(null, EventFlag.none, 0x82D9, 0x0203, 0x01);
immutable DoorEntryA doorEntry810 = DoorEntryA(null, EventFlag.none, 0xC1A9, 0x02AC, 0x01);
immutable DoorEntryA doorEntry811 = DoorEntryA(null, EventFlag.none, 0x02F9, 0x020A, 0x05);
immutable DoorEntryA doorEntry812 = DoorEntryA(null, EventFlag.none, 0x81BD, 0x02E3, 0x01);
immutable DoorEntryA doorEntry813 = DoorEntryA(null, EventFlag.none, 0xC2F9, 0x0210, 0x01);
immutable DoorEntryA doorEntry814 = DoorEntryA("textDoor814", EventFlag.none, 0x02AC, 0x00D7, 0x01);
immutable ushort doorEntry815 = 0x015B;
immutable DoorEntryC doorEntry816 = DoorEntryC("textDoor816");
immutable DoorEntryC doorEntry817 = DoorEntryC("textDoor817");
immutable DoorEntryA doorEntry818 = DoorEntryA(null, EventFlag.none, 0x4048, 0x0025, 0x01);
immutable DoorEntryA doorEntry819 = DoorEntryA(null, EventFlag.none, 0x004A, 0x0035, 0x01);
immutable DoorEntryA doorEntry820 = DoorEntryA(null, EventFlag.none, 0x004A, 0x002D, 0x01);
immutable DoorEntryA doorEntry821 = DoorEntryA(null, EventFlag.none, 0x4048, 0x003D, 0x01);
immutable DoorEntryA doorEntry822 = DoorEntryA(null, EventFlag.none, 0xC34A, 0x02F8, 0x01);
immutable DoorEntryA doorEntry823 = DoorEntryA(null, EventFlag.none, 0x8055, 0x020B, 0x01);
immutable DoorEntryA doorEntry824 = DoorEntryA("textDoor824", EventFlag.unknown0340 | eventFlagUnset, 0x0270, 0x00A7, 0x01);
immutable DoorEntryA doorEntry825 = DoorEntryA(null, EventFlag.none, 0x0002, 0x0227, 0x01);
immutable DoorEntryA doorEntry826 = DoorEntryA(null, EventFlag.none, 0x0003, 0x022D, 0x01);
immutable DoorEntryA doorEntry827 = DoorEntryA(null, EventFlag.none, 0x0002, 0x0233, 0x01);
immutable DoorEntryA doorEntry828 = DoorEntryA(null, EventFlag.none, 0x0003, 0x0239, 0x01);
immutable DoorEntryA doorEntry829 = DoorEntryA(null, EventFlag.none, 0x4310, 0x01E5, 0x01);
immutable DoorEntryA doorEntry830 = DoorEntryA(null, EventFlag.none, 0x003B, 0x023D, 0x05);
immutable DoorEntryA doorEntry831 = DoorEntryA(null, EventFlag.none, 0x0053, 0x0234, 0x05);
immutable DoorEntryA doorEntry832 = DoorEntryA(null, EventFlag.none, 0x0063, 0x0015, 0x01);
immutable DoorEntryA doorEntry833 = DoorEntryA(null, EventFlag.none, 0x441C, 0x00C5, 0x01);
immutable DoorEntryA doorEntry834 = DoorEntryA(null, EventFlag.none, 0x0075, 0x002C, 0x05);
immutable DoorEntryA doorEntry835 = DoorEntryA(null, EventFlag.none, 0x0075, 0x0041, 0x05);
immutable DoorEntryA doorEntry836 = DoorEntryA(null, EventFlag.none, 0x0317, 0x01F5, 0x01);
immutable DoorEntryA doorEntry837 = DoorEntryA(null, EventFlag.none, 0x0324, 0x020A, 0x05);
immutable DoorEntryA doorEntry838 = DoorEntryA(null, EventFlag.none, 0x0328, 0x01FA, 0x05);
immutable DoorEntryA doorEntry839 = DoorEntryA("textDoor839", EventFlag.unknown0340 | eventFlagUnset, 0x000A, 0x0251, 0x00);
immutable DoorEntryC doorEntry840 = DoorEntryC("textDoor840");
immutable DoorEntryC doorEntry841 = DoorEntryC("textDoor841");
immutable DoorEntryC doorEntry842 = DoorEntryC("textDoor842");
immutable DoorEntryC doorEntry843 = DoorEntryC("textDoor843");
immutable DoorEntryC doorEntry844 = DoorEntryC("textDoor844");
immutable DoorEntryC doorEntry845 = DoorEntryC("textDoor845");
immutable DoorEntryC doorEntry846 = DoorEntryC("textDoor846");
immutable DoorEntryC doorEntry847 = DoorEntryC("textDoor847");
immutable DoorEntryC doorEntry848 = DoorEntryC("textDoor848");
immutable DoorEntryC doorEntry849 = DoorEntryC("textDoor849");
immutable DoorEntryC doorEntry850 = DoorEntryC("textDoor850");
immutable DoorEntryC doorEntry851 = DoorEntryC("textDoor851");
immutable DoorEntryC doorEntry852 = DoorEntryC("textDoor852");
immutable DoorEntryC doorEntry853 = DoorEntryC("textDoor853");
immutable DoorEntryC doorEntry854 = DoorEntryC("textDoor854");
immutable DoorEntryC doorEntry855 = DoorEntryC("textDoor855");
immutable DoorEntryC doorEntry856 = DoorEntryC("textDoor856");
immutable DoorEntryC doorEntry857 = DoorEntryC("textDoor857");
immutable DoorEntryC doorEntry858 = DoorEntryC("textDoor858");
immutable DoorEntryC doorEntry859 = DoorEntryC("textDoor859");
immutable DoorEntryC doorEntry860 = DoorEntryC("textDoor860");
immutable DoorEntryC doorEntry861 = DoorEntryC("textDoor861");
immutable DoorEntryC doorEntry862 = DoorEntryC("textDoor862");
immutable DoorEntryC doorEntry863 = DoorEntryC("textDoor863");
immutable DoorEntryC doorEntry864 = DoorEntryC("textDoor864");
immutable DoorEntryC doorEntry865 = DoorEntryC("textDoor865");
immutable DoorEntryC doorEntry866 = DoorEntryC("textDoor866");
immutable DoorEntryC doorEntry867 = DoorEntryC("textDoor867");
immutable DoorEntryC doorEntry868 = DoorEntryC("textDoor868");
immutable DoorEntryC doorEntry869 = DoorEntryC("textDoor869");
immutable DoorEntryC doorEntry870 = DoorEntryC("textDoor870");
immutable DoorEntryC doorEntry871 = DoorEntryC("textDoor871");
immutable DoorEntryC doorEntry872 = DoorEntryC("textDoor872");
immutable DoorEntryC doorEntry873 = DoorEntryC("textDoor873");
immutable DoorEntryC doorEntry874 = DoorEntryC("textDoor874");
immutable DoorEntryC doorEntry875 = DoorEntryC("textDoor875");
immutable DoorEntryC doorEntry876 = DoorEntryC("textDoor876");
immutable DoorEntryC doorEntry877 = DoorEntryC("textDoor877");
immutable DoorEntryC doorEntry878 = DoorEntryC("textDoor878");
immutable DoorEntryC doorEntry879 = DoorEntryC("textDoor879");
immutable DoorEntryC doorEntry880 = DoorEntryC("textDoor880");
immutable DoorEntryC doorEntry881 = DoorEntryC("textDoor881");
immutable DoorEntryC doorEntry882 = DoorEntryC("textDoor882");
immutable DoorEntryC doorEntry883 = DoorEntryC("textDoor883");
immutable DoorEntryA doorEntry884 = DoorEntryA("textDoor884", EventFlag.none, 0xC00E, 0x0054, 0x01);
immutable DoorEntryA doorEntry885 = DoorEntryA("textDoor885", EventFlag.winLumiBoss | eventFlagUnset, 0x0257, 0x0392, 0x05);
immutable DoorEntryA doorEntry886 = DoorEntryA(null, EventFlag.none, 0x010B, 0x01C9, 0x01);
immutable DoorEntryA doorEntry887 = DoorEntryA(null, EventFlag.none, 0x0107, 0x01E1, 0x01);
immutable DoorEntryA doorEntry888 = DoorEntryA(null, EventFlag.none, 0x0139, 0x018C, 0x05);
immutable DoorEntryA doorEntry889 = DoorEntryA(null, EventFlag.none, 0x0143, 0x018D, 0x01);
immutable DoorEntryA doorEntry890 = DoorEntryA(null, EventFlag.none, 0x0137, 0x01A1, 0x01);
immutable DoorEntryA doorEntry891 = DoorEntryA(null, EventFlag.none, 0x015F, 0x01A6, 0x05);
immutable DoorEntryA doorEntry892 = DoorEntryA(null, EventFlag.none, 0x013F, 0x01E5, 0x01);
immutable DoorEntryA doorEntry893 = DoorEntryA(null, EventFlag.none, 0x015F, 0x018D, 0x01);
immutable DoorEntryA doorEntry894 = DoorEntryA(null, EventFlag.none, 0x016F, 0x01CD, 0x01);
immutable DoorEntryA doorEntry895 = DoorEntryA(null, EventFlag.none, 0x8151, 0x0087, 0x01);
immutable DoorEntryA doorEntry896 = DoorEntryA(null, EventFlag.none, 0x4014, 0x01C7, 0x01);
immutable DoorEntryA doorEntry897 = DoorEntryA(null, EventFlag.none, 0x4010, 0x01E1, 0x01);
immutable DoorEntryA doorEntry898 = DoorEntryA(null, EventFlag.none, 0x4040, 0x01A3, 0x01);
immutable DoorEntryA doorEntry899 = DoorEntryA(null, EventFlag.none, 0x404C, 0x018D, 0x01);
immutable DoorEntryA doorEntry900 = DoorEntryA(null, EventFlag.none, 0x4068, 0x018D, 0x01);
immutable DoorEntryA doorEntry901 = DoorEntryA(null, EventFlag.none, 0x4074, 0x01CF, 0x01);
immutable DoorEntryA doorEntry902 = DoorEntryA(null, EventFlag.none, 0x4044, 0x01E3, 0x01);
immutable DoorEntryA doorEntry903 = DoorEntryA("textDoor903", EventFlag.none, 0x0090, 0x018F, 0x21);
immutable DoorEntryA doorEntry904 = DoorEntryA("textDoor904", EventFlag.none, 0x0371, 0x0232, 0x01);
immutable DoorEntryA doorEntry905 = DoorEntryA(null, EventFlag.gumiCaveOpen | eventFlagUnset, 0x0142, 0x0093, 0x01);
immutable DoorEntryA doorEntry906 = DoorEntryA(null, EventFlag.none, 0x4030, 0x0013, 0x01);
immutable DoorEntryA doorEntry907 = DoorEntryA("textDoor907", EventFlag.gumiTalkerStone | eventFlagUnset, 0xC072, 0x01F4, 0x01);
immutable DoorEntryA doorEntry908 = DoorEntryA(null, EventFlag.none, 0xC4BA, 0x0310, 0x01);
immutable DoorEntryA doorEntry909 = DoorEntryA(null, EventFlag.none, 0x800E, 0x0037, 0x01);
immutable DoorEntryC doorEntry910 = DoorEntryC("textDoor910");
immutable DoorEntryC doorEntry911 = DoorEntryC("textDoor911");
immutable DoorEntryC doorEntry912 = DoorEntryC("textDoor912");
immutable DoorEntryA doorEntry913 = DoorEntryA(null, EventFlag.none, 0xC011, 0x02F4, 0x01);
immutable DoorEntryA doorEntry914 = DoorEntryA("textDoor004", EventFlag.none, 0x8351, 0x0167, 0x01);
immutable DoorEntryA doorEntry915 = DoorEntryA("textDoor915", EventFlag.winFireBoss | eventFlagUnset, 0x04D3, 0x0319, 0x01);
immutable DoorEntryA doorEntry916 = DoorEntryA(null, EventFlag.none, 0x813A, 0x0343, 0x01);
immutable DoorEntryA doorEntry917 = DoorEntryA(null, EventFlag.none, 0x82AA, 0x0203, 0x01);
immutable DoorEntryA doorEntry918 = DoorEntryA(null, EventFlag.none, 0xC2AA, 0x020C, 0x01);
immutable DoorEntryA doorEntry919 = DoorEntryA(null, EventFlag.none, 0xC13A, 0x0364, 0x01);
immutable DoorEntryA doorEntry920 = DoorEntryA(null, EventFlag.none, 0x813A, 0x0353, 0x01);
immutable DoorEntryA doorEntry921 = DoorEntryA(null, EventFlag.none, 0xC2CA, 0x0210, 0x01);
immutable DoorEntryA doorEntry922 = DoorEntryA(null, EventFlag.none, 0x82AA, 0x01C3, 0x01);
immutable DoorEntryA doorEntry923 = DoorEntryA(null, EventFlag.none, 0x0183, 0x00EA, 0x01);
immutable DoorEntryA doorEntry924 = DoorEntryA(null, EventFlag.none, 0xC2EA, 0x01CC, 0x01);
immutable DoorEntryA doorEntry925 = DoorEntryA(null, EventFlag.none, 0x82CA, 0x01C3, 0x01);
immutable DoorEntryA doorEntry926 = DoorEntryA(null, EventFlag.none, 0xC286, 0x0210, 0x01);
immutable DoorEntryA doorEntry927 = DoorEntryA(null, EventFlag.none, 0x828A, 0x0203, 0x01);
immutable DoorEntryA doorEntry928 = DoorEntryA(null, EventFlag.none, 0xC2CA, 0x01D8, 0x01);
immutable DoorEntryA doorEntry929 = DoorEntryA(null, EventFlag.none, 0xC34E, 0x0170, 0x01);
immutable DoorEntryA doorEntry930 = DoorEntryA(null, EventFlag.none, 0xC34E, 0x0194, 0x01);
immutable DoorEntryA doorEntry931 = DoorEntryA(null, EventFlag.none, 0x8352, 0x01AF, 0x01);
immutable DoorEntryA doorEntry932 = DoorEntryA(null, EventFlag.none, 0x8342, 0x019F, 0x01);
immutable DoorEntryA doorEntry933 = DoorEntryA(null, EventFlag.none, 0x8342, 0x01BF, 0x01);
immutable DoorEntryA doorEntry934 = DoorEntryA(null, EventFlag.none, 0xC346, 0x01AC, 0x01);
immutable DoorEntryA doorEntry935 = DoorEntryA(null, EventFlag.none, 0xC33E, 0x0180, 0x01);
immutable DoorEntryA doorEntry936 = DoorEntryA(null, EventFlag.none, 0x833E, 0x018F, 0x01);
immutable DoorEntryA doorEntry937 = DoorEntryA(null, EventFlag.none, 0x833A, 0x01A7, 0x01);
immutable DoorEntryA doorEntry938 = DoorEntryA(null, EventFlag.none, 0xC332, 0x018C, 0x01);
immutable DoorEntryA doorEntry939 = DoorEntryA(null, EventFlag.none, 0xC332, 0x01A0, 0x01);
immutable DoorEntryA doorEntry940 = DoorEntryA(null, EventFlag.none, 0x832E, 0x01B3, 0x01);
immutable DoorEntryA doorEntry941 = DoorEntryA(null, EventFlag.none, 0x031B, 0x01A1, 0x01);
immutable DoorEntryA doorEntry942 = DoorEntryA(null, EventFlag.none, 0x0149, 0x00F7, 0x01);
immutable DoorEntryA doorEntry943 = DoorEntryA("textDoor943", EventFlag.none, 0x40FE, 0x0211, 0x01);
immutable DoorEntryA doorEntry944 = DoorEntryA(null, EventFlag.none, 0x03B8, 0x006C, 0x0E);
immutable DoorEntryA doorEntry945 = DoorEntryA(null, EventFlag.none, 0x02EC, 0x0054, 0x0E);
immutable DoorEntryA doorEntry946 = DoorEntryA(null, EventFlag.none, 0x031C, 0x0034, 0x0E);
immutable DoorEntryA doorEntry947 = DoorEntryA(null, EventFlag.none, 0x0398, 0x0070, 0x0E);
immutable DoorEntryA doorEntry948 = DoorEntryA(null, EventFlag.none, 0x02F4, 0x0018, 0x01);
immutable DoorEntryA doorEntry949 = DoorEntryA(null, EventFlag.none, 0xC3FA, 0x03F5, 0x04);
immutable DoorEntryA doorEntry950 = DoorEntryA("textDoor367", EventFlag.none, 0xC3EA, 0x03B9, 0x04);
immutable DoorEntryA doorEntry951 = DoorEntryA("textDoor367", EventFlag.none, 0xC3DA, 0x03F9, 0x04);
immutable DoorEntryA doorEntry952 = DoorEntryA("textDoor367", EventFlag.none, 0xC3CA, 0x03B9, 0x04);
immutable DoorEntryA doorEntry953 = DoorEntryA("textDoor711", EventFlag.none, 0x824C, 0x02FD, 0x0A);
immutable DoorEntryA doorEntry954 = DoorEntryA("textDoor711", EventFlag.none, 0x8248, 0x02ED, 0x0A);
immutable DoorEntryA doorEntry955 = DoorEntryA("textDoor101", EventFlag.none, 0x8250, 0x0281, 0x0A);
immutable DoorEntryA doorEntry956 = DoorEntryA("textDoor711", EventFlag.none, 0x020C, 0x0291, 0x0A);
immutable DoorEntryC doorEntry957 = DoorEntryC("textDoor957");
immutable DoorEntryC doorEntry958 = DoorEntryC("textDoor958");
immutable DoorEntryC doorEntry959 = DoorEntryC("textDoor959");
immutable DoorEntryC doorEntry960 = DoorEntryC("textDoor960");
immutable DoorEntryC doorEntry961 = DoorEntryC("textDoor961");
immutable DoorEntryC doorEntry962 = DoorEntryC("textDoor962");
immutable DoorEntryA doorEntry963 = DoorEntryA(null, EventFlag.none, 0x8269, 0x0327, 0x04);
immutable DoorEntryA doorEntry964 = DoorEntryA(null, EventFlag.none, 0xC2DD, 0x033C, 0x04);
immutable DoorEntryA doorEntry965 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x03B8, 0x04);
immutable DoorEntryA doorEntry966 = DoorEntryA(null, EventFlag.none, 0xC211, 0x031C, 0x04);
immutable DoorEntryA doorEntry967 = DoorEntryA(null, EventFlag.none, 0xC2DD, 0x03F8, 0x07);
immutable DoorEntryA doorEntry968 = DoorEntryA(null, EventFlag.none, 0x01E7, 0x03EA, 0x0A);
immutable DoorEntryA doorEntry969 = DoorEntryA(null, EventFlag.none, 0x026C, 0x039D, 0x07);
immutable DoorEntryA doorEntry970 = DoorEntryA(null, EventFlag.none, 0xC1DE, 0x0396, 0x0A);
immutable DoorEntryA doorEntry971 = DoorEntryA(null, EventFlag.none, 0x82D9, 0x0327, 0x07);
immutable DoorEntryA doorEntry972 = DoorEntryA(null, EventFlag.none, 0xC32D, 0x0334, 0x07);
immutable DoorEntryA doorEntry973 = DoorEntryA("textDoor101", EventFlag.none, 0x01DC, 0x03DC, 0x0A);
immutable DoorEntryA doorEntry974 = DoorEntryA(null, EventFlag.none, 0x0207, 0x03DA, 0x0A);
immutable DoorEntryC doorEntry975 = DoorEntryC("textDoor975");
immutable DoorEntryC doorEntry976 = DoorEntryC("textDoor976");
immutable DoorEntryC doorEntry977 = DoorEntryC("textNoProblemHere");

/// $CF58EF
immutable OverworldEventMusic[][165] overworldEventMusicPointerTable = [
	[],
	[
		OverworldEventMusic(0, Music.none2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.stepPast | eventFlagUnset, Music.giveUsStrength),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.onetDoorClose | eventFlagUnset, Music.alienInvestigation),
		OverworldEventMusic(EventFlag.onetLardna | eventFlagUnset, Music.none2),
		OverworldEventMusic(EventFlag.onetAmbrami | eventFlagUnset, Music.onett),
		OverworldEventMusic(EventFlag.bunbun | eventFlagUnset, Music.onettAtNightBuzzBuzz),
		OverworldEventMusic(EventFlag.myHomeStart | eventFlagUnset, Music.onettAtNight1),
		OverworldEventMusic(EventFlag.myHome2F1F | eventFlagUnset, Music.onettAfterMeteor1),
		OverworldEventMusic(0, Music.onettIntro),
	],
	[
		OverworldEventMusic(EventFlag.bgmBus | eventFlagUnset, Music.cityBus),
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.yellowSubmarine),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.stepPast | eventFlagUnset, Music.giveUsStrength),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.runaway5TourBus),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(0, Music.boyMeetsGirl),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winCarpainter | eventFlagUnset, Music.boyMeetsGirl),
		OverworldEventMusic(0, Music.zombieThreed2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.peacefulRestValley2),
		OverworldEventMusic(0, Music.peacefulRestValley),
	],
	[
		OverworldEventMusic(EventFlag.bgmBus | eventFlagUnset, Music.cityBus),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmSW | eventFlagUnset, Music.skyRunner),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.runaway5TourBus),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.happyThreed),
		OverworldEventMusic(0, Music.zombieThreed),
	],
	[
		OverworldEventMusic(EventFlag.bgmTassy | eventFlagUnset, Music.tessie),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.bgmSW | eventFlagUnset, Music.skyRunner),
		OverworldEventMusic(EventFlag.winsTassiEnter | eventFlagUnset, Music.tessieSighting),
		OverworldEventMusic(EventFlag.bgmWint1 | eventFlagUnset, Music.winters),
		OverworldEventMusic(EventFlag.winsStart | eventFlagUnset, Music.boardingSchool),
		OverworldEventMusic(0, Music.wintersIntro),
	],
	[
		OverworldEventMusic(EventFlag.bgmSoul | eventFlagUnset, Music.returnToYourBody),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.stepPast | eventFlagUnset, Music.giveUsStrength),
		OverworldEventMusic(EventFlag.bgmPublWarp | eventFlagUnset, Music.phaseDistorterTimeTravel),
		OverworldEventMusic(0, Music.saturnValley),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.peacefulRestValley2),
		OverworldEventMusic(0, Music.peacefulRestValley),
	],
	[
		OverworldEventMusic(EventFlag.bgmBus | eventFlagUnset, Music.cityBus),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmSW | eventFlagUnset, Music.skyRunner),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.runaway5TourBus),
		OverworldEventMusic(0, Music.dustyDunesDesert),
	],
	[
		OverworldEventMusic(EventFlag.bgmBus | eventFlagUnset, Music.cityBus),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.bgmSW | eventFlagUnset, Music.skyRunner),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.runaway5TourBus),
		OverworldEventMusic(EventFlag.fourTonchikiAppear | eventFlagUnset, Music.monotoliBuilding),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(0, Music.fourside),
	],
	[
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.sailingToScaraba),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.stepPast | eventFlagUnset, Music.giveUsStrength),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.skyRunnerFalling),
		OverworldEventMusic(EventFlag.bgmSW | eventFlagUnset, Music.skyRunner),
		OverworldEventMusic(EventFlag.bgmTeleport | eventFlagUnset, Music.teleportIn),
		OverworldEventMusic(0, Music.summers),
	],
	[
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.sailingToScaraba),
		OverworldEventMusic(EventFlag.bgmFune2 | eventFlagUnset, Music.krakenDefeated),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.bazaar),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.yellowSubmarine),
		OverworldEventMusic(EventFlag.bgmDungeonMan | eventFlagUnset, Music.megatonWalk),
		OverworldEventMusic(0, Music.scarabaDesert),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.stepPast | eventFlagUnset, Music.giveUsStrength),
		OverworldEventMusic(EventFlag.sumsRammaStart | eventFlagUnset, Music.dalaam),
		OverworldEventMusic(0, Music.dalaamIntro),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.yellowSubmarine),
		OverworldEventMusic(0, Music.deepDarkness),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.tendaVillage),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.lostUnderworld),
	],
	[
		OverworldEventMusic(EventFlag.bgmMgktIn | eventFlagUnset, Music.goingToMagicant),
		OverworldEventMusic(0, Music.eightMelodies),
	],
	[
		OverworldEventMusic(EventFlag.bgmFlyingMan | eventFlagUnset, Music.flyingMan),
		OverworldEventMusic(EventFlag.bgmMgktIn | eventFlagUnset, Music.goingToMagicant),
		OverworldEventMusic(0, Music.welcomeHome),
	],
	[
		OverworldEventMusic(0, Music.seaOfEden),
	],
	[
		OverworldEventMusic(0, Music.seaOfEden2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmPublWarp | eventFlagUnset, Music.phaseDistorterTimeTravel),
		OverworldEventMusic(0, Music.firstStepBack),
	],
	[
		OverworldEventMusic(EventFlag.bgmSoul | eventFlagUnset, Music.returnToYourBody),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.none2),
		OverworldEventMusic(0, Music.secondStepBack),
	],
	[
		OverworldEventMusic(0, Music.thePlace),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.onetLardna | eventFlagUnset, Music.sunriseOnett),
		OverworldEventMusic(EventFlag.onetAmbrami | eventFlagUnset, Music.onett),
		OverworldEventMusic(EventFlag.bunbun | eventFlagUnset, Music.onettAtNightBuzzBuzz),
		OverworldEventMusic(EventFlag.myHomeStart | eventFlagUnset, Music.onettAtNight1),
		OverworldEventMusic(EventFlag.myHome2F1F | eventFlagUnset, Music.onettAfterMeteor1),
		OverworldEventMusic(0, Music.onettIntro),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTeleport | eventFlagUnset, Music.teleportOut),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(0, Music.yourSanctuary1),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.powrRain | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(0, Music.yourSanctuary1),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTeleport | eventFlagUnset, Music.teleportOut),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(0, Music.nearABoss),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTeleport | eventFlagUnset, Music.teleportOut),
		OverworldEventMusic(EventFlag.powrMgnt | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(0, Music.yourSanctuary1),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(0, Music.yourSanctuary1),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(0, Music.yourSanctuary1),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTeleport | eventFlagUnset, Music.teleportOut),
		OverworldEventMusic(EventFlag.powrFire | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(0, Music.yourSanctuary1),
	],
	[
		OverworldEventMusic(EventFlag.bgmFune2 | eventFlagUnset, Music.krakenDefeated),
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.sailingToScaraba),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.sailingToScaraba),
	],
	[
		OverworldEventMusic(EventFlag.bgmBus | eventFlagUnset, Music.cityBus),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.runaway5TourBus),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.happyThreed),
		OverworldEventMusic(0, Music.spookyCave),
	],
	[
		OverworldEventMusic(EventFlag.bgmBus | eventFlagUnset, Music.cityBus),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.runaway5TourBus),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.happyThreed),
		OverworldEventMusic(0, Music.spookyCave),
	],
	[
		OverworldEventMusic(EventFlag.bgmBus | eventFlagUnset, Music.cityBus),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.runaway5TourBus),
		OverworldEventMusic(0, Music.spookyCave),
	],
	[
		OverworldEventMusic(EventFlag.bgmBus | eventFlagUnset, Music.cityBus),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTBus | eventFlagUnset, Music.runaway5TourBus),
		OverworldEventMusic(0, Music.fourside),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.spookyCave),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.saturnValleyCave),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.onettAtNight2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.caveNearABoss),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.caveNearABoss),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.nearABoss),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.nearABoss),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.rabbitCave),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.onettAtNight1),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.temp3 | eventFlagUnset, Music.yourSanctuary2),
		OverworldEventMusic(EventFlag.temp2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(EventFlag.animPort2 | eventFlagUnset, Music.yourSanctuary1),
		OverworldEventMusic(0, Music.fireSpringsHall),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.sailingToScaraba),
		OverworldEventMusic(EventFlag.bgmFune2 | eventFlagUnset, Music.krakenDefeated),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.alienInvestigation),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.alienInvestigation),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.alienInvestigation),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmSW | eventFlagUnset, Music.skyRunner),
		OverworldEventMusic(EventFlag.winsStart | eventFlagUnset, Music.spookyCave),
		OverworldEventMusic(0, Music.zombieThreed),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.belchBase),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.monkeyCaves),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.none2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winDsrtBoss | eventFlagUnset, Music.dustyDunesDesert),
		OverworldEventMusic(0, Music.nearABoss),
	],
	[
		OverworldEventMusic(0, Music.moonside),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTassy | eventFlagUnset, Music.tessie),
		OverworldEventMusic(EventFlag.winsStart | eventFlagUnset, Music.pyramid),
		OverworldEventMusic(0, Music.wintersIntro),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.insideTheDungeon),
	],
	[
		OverworldEventMusic(0, Music.arcade),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.bgmInsekiFallA | eventFlagUnset, Music.meteorFall),
		OverworldEventMusic(EventFlag.bgmInsekiFallB | eventFlagUnset, Music.meteorStrike),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.onetDoorClose | eventFlagUnset, Music.onettAfterMeteor2),
		OverworldEventMusic(EventFlag.onetAmbrami | eventFlagUnset, Music.nesssHouse),
		OverworldEventMusic(EventFlag.bunbun | eventFlagUnset, Music.onettAtNightBuzzBuzz2),
		OverworldEventMusic(EventFlag.myHomePokeyEnter | eventFlagUnset, Music.pokeyTheme),
		OverworldEventMusic(EventFlag.myHomeStart | eventFlagUnset, Music.knockKnockRight),
		OverworldEventMusic(EventFlag.kaidanTracyAppear | eventFlagUnset, Music.knockKnock),
		OverworldEventMusic(0, Music.onettAfterMeteor2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.stepPast | eventFlagUnset, Music.giveUsStrength),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.onetAmbrami | eventFlagUnset, Music.pokeysHouse),
		OverworldEventMusic(EventFlag.bunbun | eventFlagUnset, Music.pokeysHouseBuzzBuzz),
		OverworldEventMusic(0, Music.onettAfterMeteor2),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorning),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hotel),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.temp5 | eventFlagUnset, Music.nearABoss),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hospital),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmSW | eventFlagUnset, Music.skyRunner),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(0, Music.chaosTheatre),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorning),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hotel),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hospital),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.polaGrfd | eventFlagUnset, Music.nesssHouse),
		OverworldEventMusic(0, Music.paulasTheme),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winCarpainter | eventFlagUnset, Music.monotoliBuilding),
		OverworldEventMusic(0, Music.zombieThreed2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winCarpainter | eventFlagUnset, Music.monotoliBuilding),
		OverworldEventMusic(0, Music.zombieThreed2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winCarpainter | eventFlagUnset, Music.departmentStore),
		OverworldEventMusic(0, Music.zombieThreed2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winCarpainter | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.zombieThreed2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winCarpainter | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.zombieThreed2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winCarpainter | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.zombieThreed2),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorning),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hotel),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hospital),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.paulasTheme),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.departmentStore),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.departmentStore),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorning),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.thrkHotelManDisappear | eventFlagUnset, Music.hotelOfTheLivingDead),
		OverworldEventMusic(0, Music.hotel),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.departmentStore),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.neighboursHouse),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.winGeppu | eventFlagUnset, Music.hospital),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.stepPast | eventFlagUnset, Music.giveUsStrength),
		OverworldEventMusic(EventFlag.winsTony, Music.appleOfEnlightenment),
		OverworldEventMusic(0, Music.boardingSchool),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmSW | eventFlagUnset, Music.skyRunner),
		OverworldEventMusic(0, Music.drAndonutsLab),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorning2),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTassy | eventFlagUnset, Music.tessie),
		OverworldEventMusic(EventFlag.winsTassiEnter | eventFlagUnset, Music.tessieSighting),
		OverworldEventMusic(0, Music.winters),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.neighboursHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.fourDeptBossAppear, Music.departmentStore),
		OverworldEventMusic(EventFlag.fourDeptBossAppear | eventFlagUnset, Music.spookyCave),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(EventFlag.fourOK | eventFlagUnset, Music.monotoliBuilding),
		OverworldEventMusic(0, Music.pokeysHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(EventFlag.fourOK | eventFlagUnset, Music.paulasTheme),
		OverworldEventMusic(0, Music.spookyCave),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(EventFlag.fourOK | eventFlagUnset, Music.paulasTheme),
		OverworldEventMusic(0, Music.sloppyHouse),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(EventFlag.pola1 | eventFlagUnset, Music.paulasTheme),
		OverworldEventMusic(0, Music.none2),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(EventFlag.fourOK | eventFlagUnset, Music.paulasTheme),
		OverworldEventMusic(0, Music.monotoliBuilding),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmTonzuraFree | eventFlagUnset, Music.runaway5AreFreed),
		OverworldEventMusic(0, Music.topollaTheatre),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.topollaTheatre),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorning),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.yellowSubmarine),
		OverworldEventMusic(0, Music.hotel),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.jackiesCafe),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.bgmFune1 | eventFlagUnset, Music.yellowSubmarine),
		OverworldEventMusic(0, Music.drAndonutsLab),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hospital),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.drAndonutsLab),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorning),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hotel),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.summers),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.drAndonutsLab),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hospital),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.summers),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(EventFlag.sumsRammaStart | eventFlagUnset, Music.dalaam),
		OverworldEventMusic(0, Music.dalaamIntro),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.dalaam),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.departmentStore),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorningScaraba),
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hotel),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.bazaar),
	],
	[
		OverworldEventMusic(EventFlag.winGiegu | eventFlagUnset, Music.becauseILoveYou),
		OverworldEventMusic(0, Music.hospital),
	],
	[
		OverworldEventMusic(EventFlag.bgmFlyingMan | eventFlagUnset, Music.flyingMan),
		OverworldEventMusic(0, Music.peacefulRestValley2),
	],
	[
		OverworldEventMusic(EventFlag.bgmFlyingMan | eventFlagUnset, Music.flyingMan),
		OverworldEventMusic(0, Music.welcomeHome),
	],
	[
		OverworldEventMusic(EventFlag.bgmFlyingMan | eventFlagUnset, Music.flyingMan),
		OverworldEventMusic(0, Music.welcomeHome),
	],
	[
		OverworldEventMusic(EventFlag.bgmFlyingMan | eventFlagUnset, Music.flyingMan),
		OverworldEventMusic(0, Music.welcomeHome),
	],
	[
		OverworldEventMusic(0, Music.flyingMan),
	],
	[
		OverworldEventMusic(EventFlag.hotelPaperboyAppear | eventFlagUnset, Music.goodMorningMoonside),
		OverworldEventMusic(0, Music.moonside),
	],
	[
		OverworldEventMusic(0, Music.skyRunner),
	],
	[
		OverworldEventMusic(EventFlag.onetMyMomeEndMama | eventFlagUnset, Music.smilesAndTears),
		OverworldEventMusic(EventFlag.tlptOnet | eventFlagUnset, Music.none2),
		OverworldEventMusic(EventFlag.genkanMamaAppear, Music.knockKnock),
		OverworldEventMusic(0, Music.none2),
	]
];

/// $CF61E7
immutable SpritePlacementEntry*[32][40] spritePlacementPointerTable = [
	[
		&spritePlacementEntry0,
		&spritePlacementEntry1,
		&spritePlacementEntry2,
		null,
		null,
		null,
		&spritePlacementEntry3,
		&spritePlacementEntry4,
		&spritePlacementEntry5,
		null,
		null,
		null,
		null,
		&spritePlacementEntry6,
		null,
		null,
		&spritePlacementEntry7,
		&spritePlacementEntry8,
		null,
		null,
		&spritePlacementEntry9,
		null,
		&spritePlacementEntry10,
		&spritePlacementEntry11,
		null,
		&spritePlacementEntry12,
		null,
		&spritePlacementEntry13,
		null,
		&spritePlacementEntry14,
		&spritePlacementEntry15,
		&spritePlacementEntry16,
	], [
		&spritePlacementEntry17,
		&spritePlacementEntry18,
		&spritePlacementEntry19,
		null,
		null,
		&spritePlacementEntry20,
		null,
		&spritePlacementEntry21,
		&spritePlacementEntry22,
		&spritePlacementEntry23,
		&spritePlacementEntry24,
		null,
		&spritePlacementEntry25,
		&spritePlacementEntry26,
		null,
		null,
		&spritePlacementEntry27,
		&spritePlacementEntry28,
		&spritePlacementEntry29,
		&spritePlacementEntry30,
		null,
		&spritePlacementEntry31,
		null,
		&spritePlacementEntry32,
		null,
		null,
		null,
		&spritePlacementEntry33,
		null,
		&spritePlacementEntry34,
		&spritePlacementEntry35,
		&spritePlacementEntry36,
	], [
		&spritePlacementEntry37,
		null,
		null,
		null,
		null,
		&spritePlacementEntry38,
		null,
		null,
		&spritePlacementEntry39,
		&spritePlacementEntry40,
		&spritePlacementEntry41,
		null,
		null,
		null,
		null,
		&spritePlacementEntry42,
		&spritePlacementEntry43,
		null,
		&spritePlacementEntry44,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry45,
		&spritePlacementEntry46,
		&spritePlacementEntry47,
		&spritePlacementEntry48,
		null,
	], [
		&spritePlacementEntry49,
		&spritePlacementEntry50,
		null,
		null,
		null,
		null,
		&spritePlacementEntry51,
		&spritePlacementEntry52,
		&spritePlacementEntry53,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry54,
		null,
		null,
		null,
		null,
		&spritePlacementEntry55,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry56,
		null,
		&spritePlacementEntry57,
		&spritePlacementEntry58,
		&spritePlacementEntry59,
		&spritePlacementEntry60,
		&spritePlacementEntry61,
	], [
		&spritePlacementEntry62,
		&spritePlacementEntry63,
		&spritePlacementEntry64,
		null,
		null,
		&spritePlacementEntry65,
		&spritePlacementEntry66,
		&spritePlacementEntry67,
		&spritePlacementEntry68,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry69,
		&spritePlacementEntry70,
		null,
		null,
		null,
		&spritePlacementEntry71,
		&spritePlacementEntry72,
		null,
		&spritePlacementEntry73,
		null,
		null,
		null,
		null,
		&spritePlacementEntry74,
		&spritePlacementEntry75,
		&spritePlacementEntry76,
		&spritePlacementEntry77,
		&spritePlacementEntry78,
	], [
		&spritePlacementEntry79,
		null,
		&spritePlacementEntry80,
		null,
		&spritePlacementEntry81,
		&spritePlacementEntry82,
		&spritePlacementEntry83,
		&spritePlacementEntry84,
		&spritePlacementEntry85,
		&spritePlacementEntry86,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry87,
		null,
		null,
		null,
		&spritePlacementEntry88,
		null,
		null,
		null,
		null,
		&spritePlacementEntry89,
		&spritePlacementEntry90,
		&spritePlacementEntry91,
		&spritePlacementEntry92,
		&spritePlacementEntry93,
	], [
		null,
		&spritePlacementEntry94,
		&spritePlacementEntry95,
		null,
		&spritePlacementEntry96,
		&spritePlacementEntry97,
		&spritePlacementEntry98,
		&spritePlacementEntry99,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry100,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry101,
		null,
		&spritePlacementEntry102,
		&spritePlacementEntry103,
		&spritePlacementEntry104,
		&spritePlacementEntry105,
		&spritePlacementEntry106,
	], [
		null,
		&spritePlacementEntry107,
		null,
		null,
		null,
		null,
		&spritePlacementEntry108,
		&spritePlacementEntry109,
		null,
		null,
		null,
		null,
		&spritePlacementEntry110,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry111,
		&spritePlacementEntry112,
		null,
		null,
		&spritePlacementEntry113,
		null,
		null,
		null,
		null,
		&spritePlacementEntry114,
		&spritePlacementEntry115,
		&spritePlacementEntry116,
		&spritePlacementEntry117,
		&spritePlacementEntry118,
	], [
		null,
		&spritePlacementEntry119,
		&spritePlacementEntry120,
		null,
		&spritePlacementEntry121,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry122,
		&spritePlacementEntry123,
		null,
		null,
		null,
		&spritePlacementEntry124,
		&spritePlacementEntry125,
		null,
		&spritePlacementEntry126,
		null,
		null,
		&spritePlacementEntry127,
		&spritePlacementEntry128,
		null,
		null,
		&spritePlacementEntry129,
		null,
		&spritePlacementEntry130,
		&spritePlacementEntry131,
		&spritePlacementEntry132,
	], [
		null,
		&spritePlacementEntry133,
		&spritePlacementEntry134,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry135,
		null,
		&spritePlacementEntry136,
		&spritePlacementEntry137,
		&spritePlacementEntry138,
		&spritePlacementEntry139,
		&spritePlacementEntry140,
		&spritePlacementEntry141,
		null,
		null,
		null,
		null,
		&spritePlacementEntry142,
		&spritePlacementEntry143,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry144,
		&spritePlacementEntry145,
		&spritePlacementEntry146,
		&spritePlacementEntry147,
	], [
		null,
		null,
		null,
		null,
		&spritePlacementEntry148,
		null,
		&spritePlacementEntry149,
		null,
		&spritePlacementEntry150,
		&spritePlacementEntry151,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry152,
		null,
		&spritePlacementEntry153,
		&spritePlacementEntry154,
		&spritePlacementEntry155,
		&spritePlacementEntry156,
		&spritePlacementEntry157,
		null,
		&spritePlacementEntry158,
		&spritePlacementEntry159,
		null,
		null,
		&spritePlacementEntry160,
		null,
		null,
		null,
		null,
	], [
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry161,
		&spritePlacementEntry162,
		&spritePlacementEntry163,
		&spritePlacementEntry164,
		&spritePlacementEntry165,
		&spritePlacementEntry166,
		&spritePlacementEntry167,
		null,
		null,
		&spritePlacementEntry168,
		null,
		&spritePlacementEntry169,
		&spritePlacementEntry170,
		&spritePlacementEntry171,
		&spritePlacementEntry172,
		&spritePlacementEntry173,
		&spritePlacementEntry174,
		null,
		&spritePlacementEntry175,
		&spritePlacementEntry176,
		&spritePlacementEntry177,
		&spritePlacementEntry178,
		&spritePlacementEntry179,
		&spritePlacementEntry180,
	], [
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry181,
		&spritePlacementEntry182,
		null,
		null,
		null,
		null,
		&spritePlacementEntry183,
		null,
		null,
		&spritePlacementEntry184,
		null,
		&spritePlacementEntry185,
		null,
		&spritePlacementEntry186,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry187,
		null,
		null,
		null,
		null,
		&spritePlacementEntry188,
	], [
		null,
		&spritePlacementEntry189,
		&spritePlacementEntry190,
		null,
		null,
		&spritePlacementEntry191,
		&spritePlacementEntry192,
		&spritePlacementEntry193,
		null,
		null,
		&spritePlacementEntry194,
		null,
		null,
		&spritePlacementEntry195,
		null,
		null,
		null,
		&spritePlacementEntry196,
		&spritePlacementEntry197,
		null,
		null,
		&spritePlacementEntry198,
		&spritePlacementEntry199,
		&spritePlacementEntry200,
		&spritePlacementEntry201,
		&spritePlacementEntry202,
		&spritePlacementEntry203,
		null,
		&spritePlacementEntry204,
		null,
		null,
		null,
	], [
		null,
		&spritePlacementEntry205,
		null,
		&spritePlacementEntry206,
		&spritePlacementEntry207,
		&spritePlacementEntry208,
		&spritePlacementEntry209,
		null,
		null,
		null,
		null,
		&spritePlacementEntry210,
		null,
		&spritePlacementEntry211,
		null,
		&spritePlacementEntry212,
		null,
		&spritePlacementEntry213,
		null,
		null,
		null,
		&spritePlacementEntry214,
		null,
		&spritePlacementEntry215,
		null,
		null,
		&spritePlacementEntry216,
		null,
		&spritePlacementEntry217,
		null,
		&spritePlacementEntry218,
		&spritePlacementEntry219,
	], [
		null,
		&spritePlacementEntry220,
		null,
		null,
		null,
		&spritePlacementEntry221,
		&spritePlacementEntry222,
		&spritePlacementEntry223,
		null,
		&spritePlacementEntry224,
		&spritePlacementEntry225,
		&spritePlacementEntry226,
		&spritePlacementEntry227,
		&spritePlacementEntry228,
		&spritePlacementEntry229,
		null,
		&spritePlacementEntry230,
		&spritePlacementEntry231,
		null,
		null,
		&spritePlacementEntry232,
		&spritePlacementEntry233,
		null,
		&spritePlacementEntry234,
		null,
		&spritePlacementEntry235,
		null,
		null,
		&spritePlacementEntry236,
		&spritePlacementEntry237,
		&spritePlacementEntry238,
		&spritePlacementEntry239,
	], [
		null,
		&spritePlacementEntry240,
		null,
		null,
		null,
		&spritePlacementEntry241,
		&spritePlacementEntry242,
		null,
		null,
		null,
		null,
		&spritePlacementEntry243,
		&spritePlacementEntry244,
		&spritePlacementEntry245,
		&spritePlacementEntry246,
		&spritePlacementEntry247,
		&spritePlacementEntry248,
		&spritePlacementEntry249,
		null,
		&spritePlacementEntry250,
		&spritePlacementEntry251,
		&spritePlacementEntry252,
		null,
		null,
		&spritePlacementEntry253,
		&spritePlacementEntry254,
		&spritePlacementEntry255,
		null,
		&spritePlacementEntry256,
		&spritePlacementEntry257,
		null,
		&spritePlacementEntry258,
	], [
		null,
		&spritePlacementEntry259,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry260,
		null,
		&spritePlacementEntry261,
		null,
		&spritePlacementEntry262,
		null,
		&spritePlacementEntry263,
		null,
		&spritePlacementEntry264,
		&spritePlacementEntry265,
		&spritePlacementEntry266,
		&spritePlacementEntry267,
		&spritePlacementEntry268,
		&spritePlacementEntry269,
		&spritePlacementEntry270,
		null,
		&spritePlacementEntry271,
		null,
		null,
		&spritePlacementEntry272,
		&spritePlacementEntry273,
		&spritePlacementEntry274,
	], [
		null,
		null,
		&spritePlacementEntry275,
		&spritePlacementEntry276,
		null,
		&spritePlacementEntry277,
		&spritePlacementEntry278,
		&spritePlacementEntry279,
		null,
		null,
		&spritePlacementEntry280,
		&spritePlacementEntry281,
		null,
		&spritePlacementEntry282,
		null,
		null,
		&spritePlacementEntry283,
		&spritePlacementEntry284,
		null,
		&spritePlacementEntry285,
		&spritePlacementEntry286,
		null,
		&spritePlacementEntry287,
		&spritePlacementEntry288,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry289,
		&spritePlacementEntry290,
		&spritePlacementEntry291,
	], [
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry292,
		&spritePlacementEntry293,
		&spritePlacementEntry294,
		null,
		&spritePlacementEntry295,
		&spritePlacementEntry296,
		null,
		null,
		null,
		null,
		&spritePlacementEntry297,
		&spritePlacementEntry298,
		&spritePlacementEntry299,
		&spritePlacementEntry300,
		null,
		&spritePlacementEntry301,
		null,
		null,
		&spritePlacementEntry302,
		&spritePlacementEntry303,
		&spritePlacementEntry304,
		null,
		&spritePlacementEntry305,
		&spritePlacementEntry306,
		&spritePlacementEntry307,
		null,
		null,
	], [
		null,
		null,
		&spritePlacementEntry308,
		&spritePlacementEntry309,
		null,
		null,
		&spritePlacementEntry310,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry311,
		null,
		null,
		&spritePlacementEntry312,
		&spritePlacementEntry313,
		&spritePlacementEntry314,
		&spritePlacementEntry315,
		null,
		&spritePlacementEntry316,
		&spritePlacementEntry317,
		null,
		&spritePlacementEntry318,
		&spritePlacementEntry319,
		&spritePlacementEntry320,
		null,
		null,
		&spritePlacementEntry321,
		null,
		&spritePlacementEntry322,
		&spritePlacementEntry323,
	], [
		null,
		null,
		null,
		null,
		&spritePlacementEntry324,
		null,
		&spritePlacementEntry325,
		null,
		&spritePlacementEntry326,
		null,
		&spritePlacementEntry327,
		null,
		&spritePlacementEntry328,
		null,
		&spritePlacementEntry329,
		&spritePlacementEntry330,
		&spritePlacementEntry331,
		&spritePlacementEntry332,
		&spritePlacementEntry333,
		&spritePlacementEntry334,
		&spritePlacementEntry335,
		&spritePlacementEntry336,
		&spritePlacementEntry337,
		&spritePlacementEntry338,
		&spritePlacementEntry339,
		null,
		null,
		null,
		&spritePlacementEntry340,
		&spritePlacementEntry341,
		null,
		null,
	], [
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry342,
		&spritePlacementEntry343,
		null,
		&spritePlacementEntry344,
		null,
		null,
		null,
		&spritePlacementEntry345,
		null,
		&spritePlacementEntry346,
		&spritePlacementEntry347,
		&spritePlacementEntry348,
		&spritePlacementEntry349,
		null,
		null,
		&spritePlacementEntry350,
		&spritePlacementEntry351,
		&spritePlacementEntry352,
		&spritePlacementEntry353,
		&spritePlacementEntry354,
		&spritePlacementEntry355,
		&spritePlacementEntry356,
		null,
		&spritePlacementEntry357,
		&spritePlacementEntry358,
		null,
		&spritePlacementEntry359,
	], [
		&spritePlacementEntry360,
		&spritePlacementEntry361,
		null,
		null,
		&spritePlacementEntry362,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry363,
		null,
		&spritePlacementEntry364,
		&spritePlacementEntry365,
		null,
		&spritePlacementEntry366,
		null,
		&spritePlacementEntry367,
		&spritePlacementEntry368,
		&spritePlacementEntry369,
		&spritePlacementEntry370,
		&spritePlacementEntry371,
		&spritePlacementEntry372,
		&spritePlacementEntry373,
		null,
		&spritePlacementEntry374,
		null,
		&spritePlacementEntry375,
		null,
	], [
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry376,
		&spritePlacementEntry377,
		null,
		null,
		null,
		null,
		&spritePlacementEntry378,
		&spritePlacementEntry379,
		&spritePlacementEntry380,
		&spritePlacementEntry381,
		&spritePlacementEntry382,
		&spritePlacementEntry383,
		&spritePlacementEntry384,
		&spritePlacementEntry385,
		null,
		&spritePlacementEntry386,
		&spritePlacementEntry387,
		&spritePlacementEntry388,
		&spritePlacementEntry389,
		null,
		&spritePlacementEntry390,
		null,
		null,
		null,
		&spritePlacementEntry391,
		null,
	], [
		null,
		null,
		null,
		null,
		&spritePlacementEntry392,
		&spritePlacementEntry393,
		&spritePlacementEntry394,
		&spritePlacementEntry395,
		&spritePlacementEntry396,
		&spritePlacementEntry397,
		null,
		null,
		null,
		&spritePlacementEntry398,
		null,
		&spritePlacementEntry399,
		&spritePlacementEntry400,
		&spritePlacementEntry401,
		&spritePlacementEntry402,
		&spritePlacementEntry403,
		null,
		&spritePlacementEntry404,
		null,
		&spritePlacementEntry405,
		&spritePlacementEntry406,
		&spritePlacementEntry407,
		&spritePlacementEntry408,
		null,
		&spritePlacementEntry409,
		&spritePlacementEntry410,
		null,
		null,
	], [
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry411,
		&spritePlacementEntry412,
		&spritePlacementEntry413,
		&spritePlacementEntry414,
		&spritePlacementEntry415,
		null,
		null,
		&spritePlacementEntry416,
		null,
		&spritePlacementEntry417,
		null,
		null,
		null,
		&spritePlacementEntry418,
		&spritePlacementEntry419,
		&spritePlacementEntry420,
		&spritePlacementEntry421,
		null,
		&spritePlacementEntry422,
		&spritePlacementEntry423,
		null,
		null,
		null,
		&spritePlacementEntry424,
		&spritePlacementEntry425,
		null,
		&spritePlacementEntry426,
	], [
		null,
		null,
		&spritePlacementEntry427,
		null,
		&spritePlacementEntry428,
		&spritePlacementEntry429,
		&spritePlacementEntry430,
		&spritePlacementEntry431,
		&spritePlacementEntry432,
		&spritePlacementEntry433,
		&spritePlacementEntry434,
		null,
		null,
		null,
		&spritePlacementEntry435,
		&spritePlacementEntry436,
		null,
		null,
		null,
		&spritePlacementEntry437,
		null,
		null,
		&spritePlacementEntry438,
		&spritePlacementEntry439,
		&spritePlacementEntry440,
		null,
		null,
		&spritePlacementEntry441,
		null,
		&spritePlacementEntry442,
		&spritePlacementEntry443,
		&spritePlacementEntry444,
	], [
		null,
		&spritePlacementEntry445,
		&spritePlacementEntry446,
		null,
		null,
		null,
		null,
		&spritePlacementEntry447,
		&spritePlacementEntry448,
		&spritePlacementEntry449,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry450,
		&spritePlacementEntry451,
		&spritePlacementEntry452,
		&spritePlacementEntry453,
		&spritePlacementEntry454,
		&spritePlacementEntry455,
		null,
		null,
		&spritePlacementEntry456,
		&spritePlacementEntry457,
		&spritePlacementEntry458,
	], [
		&spritePlacementEntry459,
		&spritePlacementEntry460,
		&spritePlacementEntry461,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry462,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry463,
		null,
		&spritePlacementEntry464,
		null,
		&spritePlacementEntry465,
		&spritePlacementEntry466,
		null,
		&spritePlacementEntry467,
		null,
		&spritePlacementEntry468,
		null,
		&spritePlacementEntry469,
		&spritePlacementEntry470,
		&spritePlacementEntry471,
		&spritePlacementEntry472,
		&spritePlacementEntry473,
		&spritePlacementEntry474,
		&spritePlacementEntry475,
	], [
		&spritePlacementEntry476,
		&spritePlacementEntry477,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry478,
		&spritePlacementEntry479,
		&spritePlacementEntry480,
		null,
		null,
		&spritePlacementEntry481,
		&spritePlacementEntry482,
		&spritePlacementEntry483,
		null,
		&spritePlacementEntry484,
		null,
		&spritePlacementEntry485,
		&spritePlacementEntry486,
		&spritePlacementEntry487,
		&spritePlacementEntry488,
		&spritePlacementEntry489,
		&spritePlacementEntry490,
		&spritePlacementEntry491,
	], [
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry492,
		&spritePlacementEntry493,
		&spritePlacementEntry494,
		&spritePlacementEntry495,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry496,
		null,
		&spritePlacementEntry497,
		&spritePlacementEntry498,
		&spritePlacementEntry499,
		&spritePlacementEntry500,
		&spritePlacementEntry501,
		&spritePlacementEntry502,
		&spritePlacementEntry503,
	], [
		null,
		null,
		null,
		&spritePlacementEntry504,
		null,
		null,
		&spritePlacementEntry505,
		null,
		&spritePlacementEntry506,
		null,
		null,
		null,
		&spritePlacementEntry507,
		null,
		&spritePlacementEntry508,
		null,
		&spritePlacementEntry509,
		null,
		null,
		&spritePlacementEntry510,
		&spritePlacementEntry511,
		null,
		&spritePlacementEntry512,
		null,
		null,
		null,
		&spritePlacementEntry513,
		&spritePlacementEntry514,
		&spritePlacementEntry515,
		null,
		null,
		&spritePlacementEntry516,
	], [
		null,
		null,
		null,
		null,
		&spritePlacementEntry517,
		null,
		&spritePlacementEntry518,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry519,
		null,
		&spritePlacementEntry520,
		null,
		null,
		&spritePlacementEntry521,
		null,
		&spritePlacementEntry522,
		&spritePlacementEntry523,
		null,
		&spritePlacementEntry524,
		null,
		&spritePlacementEntry525,
		&spritePlacementEntry526,
		&spritePlacementEntry527,
		&spritePlacementEntry528,
		&spritePlacementEntry529,
		&spritePlacementEntry530,
	], [
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry531,
		&spritePlacementEntry532,
		&spritePlacementEntry533,
		null,
		null,
		&spritePlacementEntry534,
		&spritePlacementEntry535,
		null,
		&spritePlacementEntry536,
		null,
		&spritePlacementEntry537,
		null,
		null,
		null,
		&spritePlacementEntry538,
		&spritePlacementEntry539,
		&spritePlacementEntry540,
		&spritePlacementEntry541,
		&spritePlacementEntry542,
		null,
		&spritePlacementEntry543,
		&spritePlacementEntry544,
		&spritePlacementEntry545,
		&spritePlacementEntry546,
		&spritePlacementEntry547,
		&spritePlacementEntry548,
	], [
		null,
		&spritePlacementEntry549,
		&spritePlacementEntry550,
		null,
		null,
		&spritePlacementEntry551,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry552,
		null,
		null,
		null,
		null,
		&spritePlacementEntry553,
		null,
		null,
		null,
		&spritePlacementEntry554,
		&spritePlacementEntry555,
		&spritePlacementEntry556,
		&spritePlacementEntry557,
		&spritePlacementEntry558,
		null,
		&spritePlacementEntry559,
		&spritePlacementEntry560,
		&spritePlacementEntry561,
		&spritePlacementEntry562,
		&spritePlacementEntry563,
		null,
	], [
		null,
		null,
		&spritePlacementEntry564,
		null,
		null,
		null,
		null,
		&spritePlacementEntry565,
		&spritePlacementEntry566,
		&spritePlacementEntry567,
		null,
		null,
		&spritePlacementEntry568,
		null,
		null,
		&spritePlacementEntry569,
		null,
		null,
		null,
		&spritePlacementEntry570,
		&spritePlacementEntry571,
		&spritePlacementEntry572,
		&spritePlacementEntry573,
		&spritePlacementEntry574,
		&spritePlacementEntry575,
		null,
		&spritePlacementEntry576,
		&spritePlacementEntry577,
		&spritePlacementEntry578,
		&spritePlacementEntry579,
		&spritePlacementEntry580,
		&spritePlacementEntry581,
	], [
		null,
		&spritePlacementEntry582,
		null,
		&spritePlacementEntry583,
		null,
		&spritePlacementEntry584,
		&spritePlacementEntry585,
		null,
		null,
		null,
		null,
		&spritePlacementEntry586,
		&spritePlacementEntry587,
		&spritePlacementEntry588,
		&spritePlacementEntry589,
		null,
		null,
		&spritePlacementEntry590,
		null,
		&spritePlacementEntry591,
		&spritePlacementEntry592,
		&spritePlacementEntry593,
		null,
		null,
		null,
		null,
		&spritePlacementEntry594,
		&spritePlacementEntry595,
		&spritePlacementEntry596,
		&spritePlacementEntry597,
		&spritePlacementEntry598,
		&spritePlacementEntry599,
	], [
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry600,
		&spritePlacementEntry601,
		null,
		null,
		null,
		&spritePlacementEntry602,
		null,
		&spritePlacementEntry603,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry604,
		&spritePlacementEntry605,
		&spritePlacementEntry606,
		&spritePlacementEntry607,
		null,
		&spritePlacementEntry608,
		&spritePlacementEntry609,
		&spritePlacementEntry610,
		&spritePlacementEntry611,
		&spritePlacementEntry612,
		&spritePlacementEntry613,
	], [
		null,
		null,
		null,
		null,
		&spritePlacementEntry614,
		&spritePlacementEntry615,
		&spritePlacementEntry616,
		&spritePlacementEntry617,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		null,
		&spritePlacementEntry618,
		&spritePlacementEntry619,
		&spritePlacementEntry620,
		null,
		null,
		null,
		&spritePlacementEntry621,
		&spritePlacementEntry622,
		&spritePlacementEntry623,
		&spritePlacementEntry624,
		null,
		&spritePlacementEntry625,
		null,
		&spritePlacementEntry626
	]
];

/// $CF6BE7
immutable SpritePlacementEntry spritePlacementEntry0 = SpritePlacementEntry(1, [
	SpritePlacement(0x04E6, 0x70, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry1 = SpritePlacementEntry(4, [
	SpritePlacement(0x04E3, 0x70, 0xD0),
	SpritePlacement(0x04F3, 0xA0, 0x30),
	SpritePlacement(0x04EB, 0xB0, 0x48),
	SpritePlacement(0x04E8, 0xF0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry2 = SpritePlacementEntry(2, [
	SpritePlacement(0x04E5, 0x88, 0x80),
	SpritePlacement(0x04E2, 0xC0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry3 = SpritePlacementEntry(4, [
	SpritePlacement(0x00C5, 0x18, 0xE8),
	SpritePlacement(0x00C4, 0x30, 0xB8),
	SpritePlacement(0x00C3, 0xB0, 0x40),
	SpritePlacement(0x00C2, 0xC0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry4 = SpritePlacementEntry(5, [
	SpritePlacement(0x00C1, 0x38, 0xF0),
	SpritePlacement(0x007C, 0x70, 0xD8),
	SpritePlacement(0x007D, 0x80, 0x30),
	SpritePlacement(0x00C0, 0x80, 0x48),
	SpritePlacement(0x00A0, 0xE8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry5 = SpritePlacementEntry(9, [
	SpritePlacement(0x00C6, 0x90, 0x20),
	SpritePlacement(0x00A4, 0x98, 0x38),
	SpritePlacement(0x00A5, 0xA0, 0x20),
	SpritePlacement(0x00BB, 0xE0, 0x60),
	SpritePlacement(0x00C9, 0xE8, 0x88),
	SpritePlacement(0x009E, 0xF0, 0x48),
	SpritePlacement(0x009D, 0xF0, 0x78),
	SpritePlacement(0x00A1, 0xF8, 0x58),
	SpritePlacement(0x00BC, 0xF8, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry6 = SpritePlacementEntry(1, [
	SpritePlacement(0x04DE, 0xC8, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry7 = SpritePlacementEntry(4, [
	SpritePlacement(0x04AD, 0x58, 0x48),
	SpritePlacement(0x04B7, 0x58, 0x70),
	SpritePlacement(0x04AE, 0x60, 0x90),
	SpritePlacement(0x04AF, 0x98, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry8 = SpritePlacementEntry(1, [
	SpritePlacement(0x05FA, 0xC8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry9 = SpritePlacementEntry(2, [
	SpritePlacement(0x02A4, 0xA8, 0x08),
	SpritePlacement(0x05A9, 0xB0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry10 = SpritePlacementEntry(1, [
	SpritePlacement(0x04F6, 0xB0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry11 = SpritePlacementEntry(2, [
	SpritePlacement(0x04F5, 0xD0, 0x38),
	SpritePlacement(0x04F7, 0xF8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry12 = SpritePlacementEntry(1, [
	SpritePlacement(0x02C5, 0xF8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry13 = SpritePlacementEntry(4, [
	SpritePlacement(0x004F, 0x60, 0x60),
	SpritePlacement(0x0050, 0x60, 0xA8),
	SpritePlacement(0x0051, 0x78, 0x48),
	SpritePlacement(0x0052, 0x88, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry14 = SpritePlacementEntry(6, [
	SpritePlacement(0x003E, 0x48, 0xB0),
	SpritePlacement(0x0049, 0xC0, 0x48),
	SpritePlacement(0x004A, 0xC0, 0x58),
	SpritePlacement(0x004B, 0xC0, 0x68),
	SpritePlacement(0x004C, 0xC0, 0x78),
	SpritePlacement(0x004D, 0xC0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry15 = SpritePlacementEntry(5, [
	SpritePlacement(0x0040, 0x40, 0x10),
	SpritePlacement(0x003F, 0x60, 0x08),
	SpritePlacement(0x0056, 0xC8, 0xC0),
	SpritePlacement(0x0057, 0xD0, 0x98),
	SpritePlacement(0x0058, 0xF0, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry16 = SpritePlacementEntry(1, [
	SpritePlacement(0x0048, 0x60, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry17 = SpritePlacementEntry(4, [
	SpritePlacement(0x04E7, 0x08, 0xA0),
	SpritePlacement(0x04EA, 0x90, 0x88),
	SpritePlacement(0x04EF, 0x90, 0xA0),
	SpritePlacement(0x04ED, 0xA0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry18 = SpritePlacementEntry(2, [
	SpritePlacement(0x04E9, 0x48, 0x60),
	SpritePlacement(0x04E4, 0x50, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry19 = SpritePlacementEntry(5, [
	SpritePlacement(0x04F2, 0x30, 0x88),
	SpritePlacement(0x061F, 0x50, 0x60),
	SpritePlacement(0x04F0, 0x60, 0x60),
	SpritePlacement(0x04EE, 0x68, 0x98),
	SpritePlacement(0x04F1, 0x70, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry20 = SpritePlacementEntry(2, [
	SpritePlacement(0x009C, 0x90, 0xF8),
	SpritePlacement(0x007E, 0xF8, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry21 = SpritePlacementEntry(1, [
	SpritePlacement(0x057F, 0xA8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry22 = SpritePlacementEntry(1, [
	SpritePlacement(0x009F, 0x18, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry23 = SpritePlacementEntry(2, [
	SpritePlacement(0x00B6, 0x70, 0x30),
	SpritePlacement(0x0095, 0xA0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry24 = SpritePlacementEntry(3, [
	SpritePlacement(0x0094, 0x58, 0x60),
	SpritePlacement(0x00B7, 0x70, 0x68),
	SpritePlacement(0x0098, 0xF0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry25 = SpritePlacementEntry(1, [
	SpritePlacement(0x0617, 0x80, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry26 = SpritePlacementEntry(1, [
	SpritePlacement(0x0616, 0x70, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry27 = SpritePlacementEntry(1, [
	SpritePlacement(0x04B1, 0x18, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry28 = SpritePlacementEntry(2, [
	SpritePlacement(0x0600, 0x00, 0xC8),
	SpritePlacement(0x0601, 0xC0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry29 = SpritePlacementEntry(3, [
	SpritePlacement(0x04B2, 0x00, 0x60),
	SpritePlacement(0x04B0, 0x00, 0x78),
	SpritePlacement(0x05FE, 0x68, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry30 = SpritePlacementEntry(2, [
	SpritePlacement(0x02A5, 0x50, 0xA4),
	SpritePlacement(0x05AA, 0xB8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry31 = SpritePlacementEntry(1, [
	SpritePlacement(0x04FA, 0x30, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry32 = SpritePlacementEntry(4, [
	SpritePlacement(0x04F9, 0x10, 0xB0),
	SpritePlacement(0x04FB, 0x18, 0x58),
	SpritePlacement(0x04F8, 0x20, 0x90),
	SpritePlacement(0x04F4, 0x28, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry33 = SpritePlacementEntry(5, [
	SpritePlacement(0x0043, 0x48, 0x90),
	SpritePlacement(0x0045, 0x60, 0x78),
	SpritePlacement(0x0044, 0x60, 0xC8),
	SpritePlacement(0x0047, 0x88, 0xA0),
	SpritePlacement(0x0046, 0x88, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry34 = SpritePlacementEntry(12, [
	SpritePlacement(0x0018, 0x30, 0x70),
	SpritePlacement(0x0015, 0x38, 0xF0),
	SpritePlacement(0x0014, 0x50, 0x58),
	SpritePlacement(0x000E, 0x58, 0xA0),
	SpritePlacement(0x000F, 0x68, 0xD8),
	SpritePlacement(0x0012, 0x70, 0x74),
	SpritePlacement(0x0024, 0xC0, 0x58),
	SpritePlacement(0x0021, 0xC0, 0x88),
	SpritePlacement(0x0022, 0xE0, 0x50),
	SpritePlacement(0x0023, 0xE8, 0x60),
	SpritePlacement(0x0026, 0xE8, 0x78),
	SpritePlacement(0x0025, 0xE8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry35 = SpritePlacementEntry(7, [
	SpritePlacement(0x0017, 0x30, 0x30),
	SpritePlacement(0x0010, 0x50, 0x04),
	SpritePlacement(0x0013, 0x50, 0x28),
	SpritePlacement(0x0011, 0x50, 0x70),
	SpritePlacement(0x0016, 0x58, 0x70),
	SpritePlacement(0x0063, 0xC8, 0x90),
	SpritePlacement(0x0064, 0xD8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry36 = SpritePlacementEntry(2, [
	SpritePlacement(0x0059, 0x40, 0x68),
	SpritePlacement(0x0062, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry37 = SpritePlacementEntry(1, [
	SpritePlacement(0x05FD, 0xC8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry38 = SpritePlacementEntry(4, [
	SpritePlacement(0x00B9, 0x30, 0x80),
	SpritePlacement(0x0093, 0x38, 0xB0),
	SpritePlacement(0x0080, 0x58, 0xA0),
	SpritePlacement(0x00A2, 0x60, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry39 = SpritePlacementEntry(3, [
	SpritePlacement(0x009B, 0x30, 0x48),
	SpritePlacement(0x00C8, 0x48, 0xF8),
	SpritePlacement(0x009A, 0x50, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry40 = SpritePlacementEntry(1, [
	SpritePlacement(0x0099, 0x90, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry41 = SpritePlacementEntry(5, [
	SpritePlacement(0x0097, 0x10, 0xF0),
	SpritePlacement(0x0096, 0x20, 0xC0),
	SpritePlacement(0x00BE, 0x28, 0xF0),
	SpritePlacement(0x00BD, 0x30, 0xB8),
	SpritePlacement(0x00C7, 0x38, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry42 = SpritePlacementEntry(1, [
	SpritePlacement(0x061A, 0x88, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry43 = SpritePlacementEntry(6, [
	SpritePlacement(0x0605, 0x40, 0xB8),
	SpritePlacement(0x04B6, 0x98, 0x80),
	SpritePlacement(0x04B3, 0xA8, 0xD0),
	SpritePlacement(0x04B5, 0xB0, 0xA0),
	SpritePlacement(0x04B4, 0xB0, 0xB8),
	SpritePlacement(0x04B8, 0xB8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry44 = SpritePlacementEntry(1, [
	SpritePlacement(0x05FB, 0x78, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry45 = SpritePlacementEntry(4, [
	SpritePlacement(0x0036, 0x38, 0x70),
	SpritePlacement(0x0037, 0x38, 0xB0),
	SpritePlacement(0x0034, 0x58, 0xA8),
	SpritePlacement(0x0065, 0xD8, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry46 = SpritePlacementEntry(3, [
	SpritePlacement(0x0038, 0x38, 0x10),
	SpritePlacement(0x0039, 0x50, 0x70),
	SpritePlacement(0x0035, 0x60, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry47 = SpritePlacementEntry(5, [
	SpritePlacement(0x005A, 0x60, 0x80),
	SpritePlacement(0x001F, 0xB0, 0x90),
	SpritePlacement(0x0020, 0xD0, 0x10),
	SpritePlacement(0x001E, 0xD8, 0x90),
	SpritePlacement(0x0584, 0xE8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry48 = SpritePlacementEntry(4, [
	SpritePlacement(0x004E, 0x50, 0xA8),
	SpritePlacement(0x0001, 0xB0, 0x90),
	SpritePlacement(0x0002, 0xE0, 0xD0),
	SpritePlacement(0x0003, 0xF0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry49 = SpritePlacementEntry(1, [
	SpritePlacement(0x05FC, 0x90, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry50 = SpritePlacementEntry(1, [
	SpritePlacement(0x0602, 0x30, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry51 = SpritePlacementEntry(1, [
	SpritePlacement(0x0082, 0x08, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry52 = SpritePlacementEntry(1, [
	SpritePlacement(0x007F, 0x08, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry53 = SpritePlacementEntry(1, [
	SpritePlacement(0x0081, 0xC0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry54 = SpritePlacementEntry(1, [
	SpritePlacement(0x0619, 0xB8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry55 = SpritePlacementEntry(1, [
	SpritePlacement(0x058E, 0xB0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry56 = SpritePlacementEntry(1, [
	SpritePlacement(0x05BB, 0x40, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry57 = SpritePlacementEntry(6, [
	SpritePlacement(0x0033, 0x38, 0x70),
	SpritePlacement(0x0032, 0x38, 0xB0),
	SpritePlacement(0x002C, 0x50, 0x90),
	SpritePlacement(0x002D, 0x60, 0xD8),
	SpritePlacement(0x002E, 0x68, 0xC8),
	SpritePlacement(0x005B, 0xD0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry58 = SpritePlacementEntry(6, [
	SpritePlacement(0x0031, 0x38, 0x70),
	SpritePlacement(0x0030, 0x50, 0x68),
	SpritePlacement(0x002F, 0x58, 0x98),
	SpritePlacement(0x006E, 0xC0, 0x50),
	SpritePlacement(0x006F, 0xE8, 0x50),
	SpritePlacement(0x0070, 0xE8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry59 = SpritePlacementEntry(1, [
	SpritePlacement(0x0019, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry60 = SpritePlacementEntry(2, [
	SpritePlacement(0x0055, 0x48, 0x58),
	SpritePlacement(0x0073, 0xD8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry61 = SpritePlacementEntry(6, [
	SpritePlacement(0x006D, 0x40, 0xA0),
	SpritePlacement(0x006C, 0x48, 0x50),
	SpritePlacement(0x0006, 0xB8, 0x78),
	SpritePlacement(0x0004, 0xE0, 0x98),
	SpritePlacement(0x0005, 0xF0, 0x48),
	SpritePlacement(0x0007, 0xF0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry62 = SpritePlacementEntry(1, [
	SpritePlacement(0x05FF, 0x68, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry63 = SpritePlacementEntry(1, [
	SpritePlacement(0x0603, 0x48, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry64 = SpritePlacementEntry(1, [
	SpritePlacement(0x04B9, 0x00, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry65 = SpritePlacementEntry(1, [
	SpritePlacement(0x0084, 0x70, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry66 = SpritePlacementEntry(1, [
	SpritePlacement(0x00A8, 0xA0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry67 = SpritePlacementEntry(3, [
	SpritePlacement(0x0580, 0x68, 0x20),
	SpritePlacement(0x00AF, 0x88, 0xD0),
	SpritePlacement(0x0083, 0x90, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry68 = SpritePlacementEntry(2, [
	SpritePlacement(0x0086, 0x68, 0xC0),
	SpritePlacement(0x00AD, 0xA0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry69 = SpritePlacementEntry(1, [
	SpritePlacement(0x0593, 0x78, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry70 = SpritePlacementEntry(1, [
	SpritePlacement(0x01C3, 0x60, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry71 = SpritePlacementEntry(1, [
	SpritePlacement(0x01BE, 0x98, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry72 = SpritePlacementEntry(1, [
	SpritePlacement(0x0590, 0xF8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry73 = SpritePlacementEntry(1, [
	SpritePlacement(0x01BF, 0xC0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry74 = SpritePlacementEntry(5, [
	SpritePlacement(0x0069, 0x48, 0x80),
	SpritePlacement(0x0067, 0x60, 0xC0),
	SpritePlacement(0x0066, 0x68, 0x30),
	SpritePlacement(0x0068, 0x68, 0x70),
	SpritePlacement(0x005D, 0xE0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry75 = SpritePlacementEntry(3, [
	SpritePlacement(0x003D, 0x40, 0x30),
	SpritePlacement(0x0071, 0xC8, 0x60),
	SpritePlacement(0x0072, 0xD0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry76 = SpritePlacementEntry(2, [
	SpritePlacement(0x005C, 0x48, 0x40),
	SpritePlacement(0x0077, 0xD0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry77 = SpritePlacementEntry(4, [
	SpritePlacement(0x0053, 0x48, 0x78),
	SpritePlacement(0x0054, 0x68, 0x50),
	SpritePlacement(0x0075, 0xD8, 0x78),
	SpritePlacement(0x0074, 0xE0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry78 = SpritePlacementEntry(5, [
	SpritePlacement(0x001C, 0x30, 0x90),
	SpritePlacement(0x001B, 0x38, 0xD8),
	SpritePlacement(0x001A, 0x40, 0xC8),
	SpritePlacement(0x001D, 0x50, 0xF0),
	SpritePlacement(0x0027, 0xC8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry79 = SpritePlacementEntry(1, [
	SpritePlacement(0x05F2, 0x80, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry80 = SpritePlacementEntry(1, [
	SpritePlacement(0x048F, 0x38, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry81 = SpritePlacementEntry(1, [
	SpritePlacement(0x00B5, 0x78, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry82 = SpritePlacementEntry(1, [
	SpritePlacement(0x0089, 0x90, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry83 = SpritePlacementEntry(2, [
	SpritePlacement(0x0087, 0xB0, 0x50),
	SpritePlacement(0x00A9, 0xE0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry84 = SpritePlacementEntry(3, [
	SpritePlacement(0x008A, 0x60, 0x1C),
	SpritePlacement(0x00BF, 0xA0, 0xD8),
	SpritePlacement(0x00AA, 0xE0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry85 = SpritePlacementEntry(2, [
	SpritePlacement(0x0582, 0x80, 0xA0),
	SpritePlacement(0x00BA, 0xD8, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry86 = SpritePlacementEntry(3, [
	SpritePlacement(0x00B8, 0xA0, 0xF8),
	SpritePlacement(0x00AE, 0xB0, 0x40),
	SpritePlacement(0x0088, 0xB0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry87 = SpritePlacementEntry(1, [
	SpritePlacement(0x01C2, 0x78, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry88 = SpritePlacementEntry(4, [
	SpritePlacement(0x01B7, 0x20, 0xB8),
	SpritePlacement(0x01B8, 0x30, 0xA0),
	SpritePlacement(0x01BA, 0x38, 0x90),
	SpritePlacement(0x01B9, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry89 = SpritePlacementEntry(2, [
	SpritePlacement(0x006B, 0x60, 0xB0),
	SpritePlacement(0x006A, 0x68, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry90 = SpritePlacementEntry(5, [
	SpritePlacement(0x0028, 0x40, 0x68),
	SpritePlacement(0x0029, 0x58, 0x80),
	SpritePlacement(0x002B, 0x60, 0x40),
	SpritePlacement(0x002A, 0x68, 0x18),
	SpritePlacement(0x0076, 0xF0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry91 = SpritePlacementEntry(5, [
	SpritePlacement(0x0060, 0x48, 0x68),
	SpritePlacement(0x0061, 0x50, 0x80),
	SpritePlacement(0x005F, 0x60, 0x40),
	SpritePlacement(0x005E, 0x68, 0x60),
	SpritePlacement(0x007B, 0x90, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry92 = SpritePlacementEntry(8, [
	SpritePlacement(0x0041, 0x60, 0x50),
	SpritePlacement(0x0042, 0x60, 0x60),
	SpritePlacement(0x000C, 0xC0, 0x68),
	SpritePlacement(0x000B, 0xC8, 0x4C),
	SpritePlacement(0x0008, 0xC8, 0xA8),
	SpritePlacement(0x0009, 0xC8, 0xC0),
	SpritePlacement(0x000D, 0xF0, 0x78),
	SpritePlacement(0x000A, 0xF8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry93 = SpritePlacementEntry(6, [
	SpritePlacement(0x0079, 0x30, 0x50),
	SpritePlacement(0x0078, 0x48, 0x30),
	SpritePlacement(0x007A, 0x50, 0x68),
	SpritePlacement(0x003C, 0xC0, 0x40),
	SpritePlacement(0x003A, 0xC0, 0x58),
	SpritePlacement(0x003B, 0xD8, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry94 = SpritePlacementEntry(1, [
	SpritePlacement(0x008B, 0xE0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry95 = SpritePlacementEntry(1, [
	SpritePlacement(0x008C, 0xF0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry96 = SpritePlacementEntry(1, [
	SpritePlacement(0x0085, 0xB0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry97 = SpritePlacementEntry(3, [
	SpritePlacement(0x0583, 0xC0, 0xF8),
	SpritePlacement(0x00AB, 0xD0, 0x20),
	SpritePlacement(0x008E, 0xD0, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry98 = SpritePlacementEntry(4, [
	SpritePlacement(0x00CA, 0x48, 0x78),
	SpritePlacement(0x0092, 0x50, 0x50),
	SpritePlacement(0x00A3, 0x80, 0x90),
	SpritePlacement(0x00AC, 0xD0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry99 = SpritePlacementEntry(1, [
	SpritePlacement(0x00B0, 0xE8, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry100 = SpritePlacementEntry(1, [
	SpritePlacement(0x0595, 0x48, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry101 = SpritePlacementEntry(1, [
	SpritePlacement(0x05BC, 0x78, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry102 = SpritePlacementEntry(6, [
	SpritePlacement(0x0198, 0x50, 0xB0),
	SpritePlacement(0x0196, 0xC0, 0x68),
	SpritePlacement(0x0195, 0xC8, 0x48),
	SpritePlacement(0x0194, 0xC8, 0xA8),
	SpritePlacement(0x0193, 0xC8, 0xC0),
	SpritePlacement(0x0197, 0xF0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry103 = SpritePlacementEntry(6, [
	SpritePlacement(0x0254, 0x40, 0x48),
	SpritePlacement(0x0253, 0x40, 0x60),
	SpritePlacement(0x0257, 0x60, 0x20),
	SpritePlacement(0x0256, 0x60, 0x38),
	SpritePlacement(0x0255, 0x60, 0x50),
	SpritePlacement(0x0264, 0xC8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry104 = SpritePlacementEntry(2, [
	SpritePlacement(0x0199, 0xD0, 0x98),
	SpritePlacement(0x019A, 0xD8, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry105 = SpritePlacementEntry(1, [
	SpritePlacement(0x0252, 0x48, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry106 = SpritePlacementEntry(1, [
	SpritePlacement(0x0179, 0xC0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry107 = SpritePlacementEntry(1, [
	SpritePlacement(0x008D, 0x00, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry108 = SpritePlacementEntry(7, [
	SpritePlacement(0x008F, 0x00, 0x20),
	SpritePlacement(0x0090, 0xC0, 0xB0),
	SpritePlacement(0x0091, 0xC8, 0x98),
	SpritePlacement(0x00B1, 0xD0, 0x80),
	SpritePlacement(0x00B3, 0xD0, 0xB8),
	SpritePlacement(0x00B2, 0xD8, 0x98),
	SpritePlacement(0x00B4, 0xD8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry109 = SpritePlacementEntry(2, [
	SpritePlacement(0x00A6, 0x40, 0x78),
	SpritePlacement(0x00A7, 0xA0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry110 = SpritePlacementEntry(1, [
	SpritePlacement(0x0594, 0xB0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry111 = SpritePlacementEntry(1, [
	SpritePlacement(0x01C1, 0x40, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry112 = SpritePlacementEntry(3, [
	SpritePlacement(0x058D, 0x00, 0xD0),
	SpritePlacement(0x01BD, 0x40, 0x28),
	SpritePlacement(0x01BB, 0x40, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry113 = SpritePlacementEntry(1, [
	SpritePlacement(0x0592, 0x80, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry114 = SpritePlacementEntry(1, [
	SpritePlacement(0x05A3, 0x78, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry115 = SpritePlacementEntry(5, [
	SpritePlacement(0x0250, 0x48, 0x40),
	SpritePlacement(0x024F, 0x60, 0x28),
	SpritePlacement(0x0251, 0x60, 0xA0),
	SpritePlacement(0x0266, 0xB8, 0x30),
	SpritePlacement(0x0265, 0xD0, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry116 = SpritePlacementEntry(2, [
	SpritePlacement(0x0177, 0x60, 0x80),
	SpritePlacement(0x0178, 0x70, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry117 = SpritePlacementEntry(9, [
	SpritePlacement(0x059C, 0x40, 0x60),
	SpritePlacement(0x025D, 0x40, 0x78),
	SpritePlacement(0x059D, 0x50, 0x98),
	SpritePlacement(0x059E, 0x58, 0x50),
	SpritePlacement(0x059F, 0x58, 0x80),
	SpritePlacement(0x05A0, 0x58, 0xA8),
	SpritePlacement(0x05A1, 0x60, 0x40),
	SpritePlacement(0x025C, 0x70, 0x28),
	SpritePlacement(0x05A2, 0x70, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry118 = SpritePlacementEntry(3, [
	SpritePlacement(0x02F1, 0x68, 0x68),
	SpritePlacement(0x02F0, 0x70, 0x50),
	SpritePlacement(0x0192, 0xF8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry119 = SpritePlacementEntry(1, [
	SpritePlacement(0x027A, 0xE8, 0xEC),
]);

immutable SpritePlacementEntry spritePlacementEntry120 = SpritePlacementEntry(1, [
	SpritePlacement(0x027F, 0xF8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry121 = SpritePlacementEntry(1, [
	SpritePlacement(0x00D1, 0x60, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry122 = SpritePlacementEntry(1, [
	SpritePlacement(0x00CE, 0x60, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry123 = SpritePlacementEntry(1, [
	SpritePlacement(0x00CD, 0x60, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry124 = SpritePlacementEntry(1, [
	SpritePlacement(0x01C0, 0xB0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry125 = SpritePlacementEntry(1, [
	SpritePlacement(0x058F, 0x10, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry126 = SpritePlacementEntry(1, [
	SpritePlacement(0x0591, 0x38, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry127 = SpritePlacementEntry(1, [
	SpritePlacement(0x00D3, 0x60, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry128 = SpritePlacementEntry(1, [
	SpritePlacement(0x02C4, 0xF8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry129 = SpritePlacementEntry(1, [
	SpritePlacement(0x05BA, 0x58, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry130 = SpritePlacementEntry(6, [
	SpritePlacement(0x0191, 0x40, 0x90),
	SpritePlacement(0x0190, 0x58, 0x80),
	SpritePlacement(0x018F, 0x58, 0x98),
	SpritePlacement(0x018E, 0x68, 0x50),
	SpritePlacement(0x018D, 0x70, 0x40),
	SpritePlacement(0x0189, 0xF0, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry131 = SpritePlacementEntry(8, [
	SpritePlacement(0x02EE, 0x40, 0xA0),
	SpritePlacement(0x02EB, 0x48, 0x70),
	SpritePlacement(0x02EF, 0x48, 0x88),
	SpritePlacement(0x02EC, 0x68, 0x28),
	SpritePlacement(0x02ED, 0x68, 0x58),
	SpritePlacement(0x0184, 0xD8, 0x58),
	SpritePlacement(0x0188, 0xF0, 0x38),
	SpritePlacement(0x058B, 0xF0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry132 = SpritePlacementEntry(2, [
	SpritePlacement(0x0181, 0xE8, 0x18),
	SpritePlacement(0x018C, 0xE8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry133 = SpritePlacementEntry(2, [
	SpritePlacement(0x027E, 0x00, 0xE8),
	SpritePlacement(0x0272, 0x68, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry134 = SpritePlacementEntry(1, [
	SpritePlacement(0x027D, 0x00, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry135 = SpritePlacementEntry(3, [
	SpritePlacement(0x0623, 0x70, 0xF8),
	SpritePlacement(0x0518, 0xB0, 0x10),
	SpritePlacement(0x050A, 0xB0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry136 = SpritePlacementEntry(1, [
	SpritePlacement(0x0622, 0xA0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry137 = SpritePlacementEntry(1, [
	SpritePlacement(0x04E1, 0xC8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry138 = SpritePlacementEntry(1, [
	SpritePlacement(0x061B, 0x68, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry139 = SpritePlacementEntry(1, [
	SpritePlacement(0x061D, 0xF0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry140 = SpritePlacementEntry(1, [
	SpritePlacement(0x059A, 0x70, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry141 = SpritePlacementEntry(1, [
	SpritePlacement(0x01BC, 0x00, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry142 = SpritePlacementEntry(1, [
	SpritePlacement(0x00CC, 0xE0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry143 = SpritePlacementEntry(1, [
	SpritePlacement(0x048E, 0xB8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry144 = SpritePlacementEntry(1, [
	SpritePlacement(0x02C1, 0x00, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry145 = SpritePlacementEntry(7, [
	SpritePlacement(0x0186, 0x30, 0xC0),
	SpritePlacement(0x025F, 0xC8, 0x60),
	SpritePlacement(0x0262, 0xC8, 0x88),
	SpritePlacement(0x025E, 0xC8, 0xA0),
	SpritePlacement(0x0261, 0xE0, 0xB8),
	SpritePlacement(0x0263, 0xF0, 0x58),
	SpritePlacement(0x0260, 0xF8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry146 = SpritePlacementEntry(8, [
	SpritePlacement(0x018A, 0x10, 0x10),
	SpritePlacement(0x0180, 0x18, 0xA8),
	SpritePlacement(0x018B, 0x28, 0x28),
	SpritePlacement(0x0183, 0x28, 0xA8),
	SpritePlacement(0x017F, 0x28, 0xD8),
	SpritePlacement(0x0185, 0x38, 0x60),
	SpritePlacement(0x0182, 0x58, 0xB8),
	SpritePlacement(0x0187, 0x70, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry147 = SpritePlacementEntry(6, [
	SpritePlacement(0x017B, 0x18, 0x48),
	SpritePlacement(0x017E, 0x38, 0x08),
	SpritePlacement(0x017D, 0x48, 0x08),
	SpritePlacement(0x017C, 0x48, 0x48),
	SpritePlacement(0x017A, 0x48, 0x88),
	SpritePlacement(0x058C, 0x58, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry148 = SpritePlacementEntry(1, [
	SpritePlacement(0x04EC, 0xA0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry149 = SpritePlacementEntry(1, [
	SpritePlacement(0x0581, 0x70, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry150 = SpritePlacementEntry(1, [
	SpritePlacement(0x050B, 0x18, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry151 = SpritePlacementEntry(15, [
	SpritePlacement(0x0514, 0x10, 0x18),
	SpritePlacement(0x0505, 0x18, 0x30),
	SpritePlacement(0x0506, 0x20, 0x38),
	SpritePlacement(0x0508, 0x30, 0x10),
	SpritePlacement(0x050C, 0x30, 0x40),
	SpritePlacement(0x0502, 0x38, 0x00),
	SpritePlacement(0x0509, 0x40, 0x48),
	SpritePlacement(0x0504, 0x48, 0x38),
	SpritePlacement(0x0512, 0x58, 0x18),
	SpritePlacement(0x0503, 0x58, 0x30),
	SpritePlacement(0x0511, 0x60, 0x08),
	SpritePlacement(0x0513, 0x78, 0x20),
	SpritePlacement(0x0620, 0xE8, 0x68),
	SpritePlacement(0x0507, 0xE8, 0xF0),
	SpritePlacement(0x050D, 0xF8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry152 = SpritePlacementEntry(1, [
	SpritePlacement(0x04DF, 0x68, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry153 = SpritePlacementEntry(2, [
	SpritePlacement(0x043E, 0xC0, 0x78),
	SpritePlacement(0x0437, 0xE8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry154 = SpritePlacementEntry(1, [
	SpritePlacement(0x0422, 0xC0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry155 = SpritePlacementEntry(1, [
	SpritePlacement(0x043B, 0xB8, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry156 = SpritePlacementEntry(4, [
	SpritePlacement(0x043A, 0xB8, 0xF0),
	SpritePlacement(0x041E, 0xC0, 0x18),
	SpritePlacement(0x0438, 0xE8, 0x08),
	SpritePlacement(0x0439, 0xF0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry157 = SpritePlacementEntry(5, [
	SpritePlacement(0x043F, 0xB0, 0x68),
	SpritePlacement(0x043C, 0xB8, 0x08),
	SpritePlacement(0x0430, 0xB8, 0x18),
	SpritePlacement(0x0431, 0xB8, 0x30),
	SpritePlacement(0x0432, 0xF0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry158 = SpritePlacementEntry(1, [
	SpritePlacement(0x0423, 0xC0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry159 = SpritePlacementEntry(2, [
	SpritePlacement(0x042F, 0x78, 0x90),
	SpritePlacement(0x0424, 0xC0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry160 = SpritePlacementEntry(1, [
	SpritePlacement(0x042B, 0xF8, 0x74),
]);

immutable SpritePlacementEntry spritePlacementEntry161 = SpritePlacementEntry(1, [
	SpritePlacement(0x0624, 0x08, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry162 = SpritePlacementEntry(2, [
	SpritePlacement(0x050F, 0x08, 0xD8),
	SpritePlacement(0x0515, 0x20, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry163 = SpritePlacementEntry(1, [
	SpritePlacement(0x0517, 0xB0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry164 = SpritePlacementEntry(1, [
	SpritePlacement(0x0621, 0x50, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry165 = SpritePlacementEntry(1, [
	SpritePlacement(0x061C, 0xB8, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry166 = SpritePlacementEntry(2, [
	SpritePlacement(0x061E, 0x18, 0x00),
	SpritePlacement(0x04E0, 0x38, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry167 = SpritePlacementEntry(1, [
	SpritePlacement(0x0618, 0x20, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry168 = SpritePlacementEntry(1, [
	SpritePlacement(0x042E, 0xB8, 0x84),
]);

immutable SpritePlacementEntry spritePlacementEntry169 = SpritePlacementEntry(1, [
	SpritePlacement(0x041D, 0x98, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry170 = SpritePlacementEntry(2, [
	SpritePlacement(0x043D, 0x28, 0x30),
	SpritePlacement(0x042D, 0x30, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry171 = SpritePlacementEntry(1, [
	SpritePlacement(0x0433, 0x08, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry172 = SpritePlacementEntry(2, [
	SpritePlacement(0x0426, 0x50, 0x88),
	SpritePlacement(0x0420, 0xF8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry173 = SpritePlacementEntry(3, [
	SpritePlacement(0x0436, 0x78, 0x80),
	SpritePlacement(0x0425, 0x78, 0x98),
	SpritePlacement(0x041F, 0xD0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry174 = SpritePlacementEntry(1, [
	SpritePlacement(0x042A, 0xB8, 0xD4),
]);

immutable SpritePlacementEntry spritePlacementEntry175 = SpritePlacementEntry(2, [
	SpritePlacement(0x0435, 0x18, 0x98),
	SpritePlacement(0x0434, 0x78, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry176 = SpritePlacementEntry(1, [
	SpritePlacement(0x0427, 0x38, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry177 = SpritePlacementEntry(3, [
	SpritePlacement(0x042C, 0x20, 0x7C),
	SpritePlacement(0x0429, 0x70, 0x60),
	SpritePlacement(0x0440, 0xA8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry178 = SpritePlacementEntry(1, [
	SpritePlacement(0x0428, 0x30, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry179 = SpritePlacementEntry(4, [
	SpritePlacement(0x026D, 0x30, 0x90),
	SpritePlacement(0x026F, 0x30, 0x90),
	SpritePlacement(0x0269, 0x68, 0x98),
	SpritePlacement(0x026A, 0x70, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry180 = SpritePlacementEntry(5, [
	SpritePlacement(0x026E, 0x10, 0x40),
	SpritePlacement(0x026B, 0x20, 0x70),
	SpritePlacement(0x026C, 0x48, 0x58),
	SpritePlacement(0x0267, 0x50, 0x30),
	SpritePlacement(0x0268, 0x58, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry181 = SpritePlacementEntry(1, [
	SpritePlacement(0x0516, 0x80, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry182 = SpritePlacementEntry(3, [
	SpritePlacement(0x0519, 0x70, 0x70),
	SpritePlacement(0x0510, 0x90, 0x18),
	SpritePlacement(0x050E, 0x90, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry183 = SpritePlacementEntry(1, [
	SpritePlacement(0x03E3, 0x80, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry184 = SpritePlacementEntry(2, [
	SpritePlacement(0x0496, 0xD8, 0x08),
	SpritePlacement(0x0497, 0xD8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry185 = SpritePlacementEntry(1, [
	SpritePlacement(0x0421, 0x00, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry186 = SpritePlacementEntry(2, [
	SpritePlacement(0x041C, 0x68, 0x58),
	SpritePlacement(0x041B, 0x68, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry187 = SpritePlacementEntry(1, [
	SpritePlacement(0x05BD, 0xD8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry188 = SpritePlacementEntry(4, [
	SpritePlacement(0x0259, 0x18, 0x30),
	SpritePlacement(0x0258, 0x20, 0x10),
	SpritePlacement(0x025A, 0x30, 0x48),
	SpritePlacement(0x025B, 0x38, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry189 = SpritePlacementEntry(3, [
	SpritePlacement(0x0274, 0x40, 0x30),
	SpritePlacement(0x0273, 0x50, 0x90),
	SpritePlacement(0x0275, 0x50, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry190 = SpritePlacementEntry(10, [
	SpritePlacement(0x027B, 0x08, 0x70),
	SpritePlacement(0x027C, 0x10, 0xF8),
	SpritePlacement(0x0281, 0x68, 0x50),
	SpritePlacement(0x0276, 0x78, 0x98),
	SpritePlacement(0x028F, 0x98, 0x58),
	SpritePlacement(0x0290, 0xA8, 0x58),
	SpritePlacement(0x0282, 0xB0, 0x58),
	SpritePlacement(0x0283, 0xC0, 0x58),
	SpritePlacement(0x0284, 0xD0, 0x58),
	SpritePlacement(0x028E, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry191 = SpritePlacementEntry(1, [
	SpritePlacement(0x02A9, 0xC0, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry192 = SpritePlacementEntry(3, [
	SpritePlacement(0x02AE, 0xC0, 0x30),
	SpritePlacement(0x02AA, 0xC0, 0x98),
	SpritePlacement(0x05A8, 0xC8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry193 = SpritePlacementEntry(1, [
	SpritePlacement(0x02AD, 0xC0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry194 = SpritePlacementEntry(1, [
	SpritePlacement(0x03B4, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry195 = SpritePlacementEntry(2, [
	SpritePlacement(0x03DC, 0x80, 0xB8),
	SpritePlacement(0x03C9, 0x80, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry196 = SpritePlacementEntry(4, [
	SpritePlacement(0x045A, 0x58, 0xC0),
	SpritePlacement(0x0459, 0x88, 0x98),
	SpritePlacement(0x0456, 0x90, 0x28),
	SpritePlacement(0x0457, 0xF0, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry197 = SpritePlacementEntry(3, [
	SpritePlacement(0x045C, 0x58, 0x40),
	SpritePlacement(0x045B, 0x88, 0x18),
	SpritePlacement(0x044D, 0xB8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry198 = SpritePlacementEntry(2, [
	SpritePlacement(0x049F, 0x38, 0x30),
	SpritePlacement(0x04A0, 0x38, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry199 = SpritePlacementEntry(1, [
	SpritePlacement(0x05F3, 0xE8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry200 = SpritePlacementEntry(1, [
	SpritePlacement(0x04A4, 0xD8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry201 = SpritePlacementEntry(3, [
	SpritePlacement(0x04A7, 0xD8, 0x58),
	SpritePlacement(0x04A5, 0xD8, 0xB0),
	SpritePlacement(0x04A6, 0xD8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry202 = SpritePlacementEntry(1, [
	SpritePlacement(0x04A8, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry203 = SpritePlacementEntry(3, [
	SpritePlacement(0x05C0, 0x48, 0x30),
	SpritePlacement(0x05C1, 0x58, 0x18),
	SpritePlacement(0x05BF, 0x58, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry204 = SpritePlacementEntry(1, [
	SpritePlacement(0x05EF, 0xA0, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry205 = SpritePlacementEntry(4, [
	SpritePlacement(0x0287, 0xF0, 0x38),
	SpritePlacement(0x0288, 0xF0, 0x50),
	SpritePlacement(0x0289, 0xF8, 0x28),
	SpritePlacement(0x028A, 0xF8, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry206 = SpritePlacementEntry(4, [
	SpritePlacement(0x0494, 0x58, 0x48),
	SpritePlacement(0x0495, 0x58, 0xA8),
	SpritePlacement(0x04A9, 0x70, 0x80),
	SpritePlacement(0x04AA, 0x70, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry207 = SpritePlacementEntry(4, [
	SpritePlacement(0x02AB, 0x50, 0xD8),
	SpritePlacement(0x05A5, 0x60, 0xD0),
	SpritePlacement(0x02AF, 0x80, 0x78),
	SpritePlacement(0x02AC, 0x88, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry208 = SpritePlacementEntry(2, [
	SpritePlacement(0x02A7, 0x20, 0xD0),
	SpritePlacement(0x05A7, 0x48, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry209 = SpritePlacementEntry(4, [
	SpritePlacement(0x02A6, 0x68, 0x48),
	SpritePlacement(0x05A6, 0x80, 0x30),
	SpritePlacement(0x05A4, 0x80, 0xB0),
	SpritePlacement(0x02A8, 0x98, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry210 = SpritePlacementEntry(1, [
	SpritePlacement(0x03D6, 0xA0, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry211 = SpritePlacementEntry(4, [
	SpritePlacement(0x03DE, 0xD8, 0x80),
	SpritePlacement(0x03DF, 0xE0, 0x98),
	SpritePlacement(0x03E0, 0xF0, 0x80),
	SpritePlacement(0x03DD, 0xF0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry212 = SpritePlacementEntry(1, [
	SpritePlacement(0x03BF, 0xA8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry213 = SpritePlacementEntry(2, [
	SpritePlacement(0x044C, 0x90, 0xD0),
	SpritePlacement(0x0450, 0xA8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry214 = SpritePlacementEntry(1, [
	SpritePlacement(0x062D, 0x30, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry215 = SpritePlacementEntry(1, [
	SpritePlacement(0x062C, 0xF0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry216 = SpritePlacementEntry(1, [
	SpritePlacement(0x05AE, 0x60, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry217 = SpritePlacementEntry(2, [
	SpritePlacement(0x0572, 0x38, 0xB8),
	SpritePlacement(0x0563, 0xB8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry218 = SpritePlacementEntry(1, [
	SpritePlacement(0x056C, 0xB8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry219 = SpritePlacementEntry(1, [
	SpritePlacement(0x05EC, 0xE0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry220 = SpritePlacementEntry(3, [
	SpritePlacement(0x028B, 0x00, 0x60),
	SpritePlacement(0x028C, 0x08, 0x38),
	SpritePlacement(0x028D, 0x10, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry221 = SpritePlacementEntry(1, [
	SpritePlacement(0x046E, 0x20, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry222 = SpritePlacementEntry(2, [
	SpritePlacement(0x047C, 0x58, 0x70),
	SpritePlacement(0x0483, 0x80, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry223 = SpritePlacementEntry(2, [
	SpritePlacement(0x048A, 0x88, 0x10),
	SpritePlacement(0x048B, 0x90, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry224 = SpritePlacementEntry(1, [
	SpritePlacement(0x03C7, 0x08, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry225 = SpritePlacementEntry(9, [
	SpritePlacement(0x03C8, 0x30, 0x30),
	SpritePlacement(0x03B8, 0x30, 0x74),
	SpritePlacement(0x03BD, 0x40, 0x48),
	SpritePlacement(0x03BE, 0x48, 0x40),
	SpritePlacement(0x03B9, 0x50, 0x48),
	SpritePlacement(0x03BA, 0x58, 0x58),
	SpritePlacement(0x03BC, 0x58, 0x78),
	SpritePlacement(0x03BB, 0x60, 0x68),
	SpritePlacement(0x03D7, 0xC0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry226 = SpritePlacementEntry(3, [
	SpritePlacement(0x03CF, 0x70, 0xA0),
	SpritePlacement(0x03CE, 0xA8, 0xC8),
	SpritePlacement(0x03D1, 0xC8, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry227 = SpritePlacementEntry(2, [
	SpritePlacement(0x03D0, 0x78, 0x28),
	SpritePlacement(0x03D2, 0xF0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry228 = SpritePlacementEntry(2, [
	SpritePlacement(0x03CB, 0x78, 0xD0),
	SpritePlacement(0x03B6, 0xD0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry229 = SpritePlacementEntry(2, [
	SpritePlacement(0x03C6, 0xB8, 0x78),
	SpritePlacement(0x03C5, 0xD8, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry230 = SpritePlacementEntry(2, [
	SpritePlacement(0x045D, 0x60, 0xE0),
	SpritePlacement(0x0452, 0x80, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry231 = SpritePlacementEntry(2, [
	SpritePlacement(0x0451, 0x20, 0xC8),
	SpritePlacement(0x044E, 0xC0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry232 = SpritePlacementEntry(1, [
	SpritePlacement(0x062E, 0x80, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry233 = SpritePlacementEntry(1, [
	SpritePlacement(0x0549, 0x48, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry234 = SpritePlacementEntry(2, [
	SpritePlacement(0x062A, 0xE8, 0x70),
	SpritePlacement(0x0537, 0xE8, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry235 = SpritePlacementEntry(1, [
	SpritePlacement(0x05AF, 0x68, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry236 = SpritePlacementEntry(4, [
	SpritePlacement(0x056F, 0x28, 0x60),
	SpritePlacement(0x0569, 0x48, 0xF0),
	SpritePlacement(0x0575, 0xA0, 0x68),
	SpritePlacement(0x0564, 0xF0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry237 = SpritePlacementEntry(3, [
	SpritePlacement(0x0579, 0x48, 0xF0),
	SpritePlacement(0x0578, 0x98, 0x90),
	SpritePlacement(0x0577, 0xF8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry238 = SpritePlacementEntry(1, [
	SpritePlacement(0x056E, 0x18, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry239 = SpritePlacementEntry(3, [
	SpritePlacement(0x057D, 0x08, 0x10),
	SpritePlacement(0x057A, 0x48, 0x38),
	SpritePlacement(0x0568, 0x78, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry240 = SpritePlacementEntry(1, [
	SpritePlacement(0x0278, 0xD0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry241 = SpritePlacementEntry(4, [
	SpritePlacement(0x048C, 0x28, 0x18),
	SpritePlacement(0x0478, 0x28, 0x48),
	SpritePlacement(0x0479, 0xA0, 0x68),
	SpritePlacement(0x0488, 0xA0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry242 = SpritePlacementEntry(11, [
	SpritePlacement(0x048D, 0x00, 0x80),
	SpritePlacement(0x0473, 0x28, 0x48),
	SpritePlacement(0x046F, 0x30, 0x28),
	SpritePlacement(0x0470, 0x38, 0x38),
	SpritePlacement(0x0471, 0x38, 0x60),
	SpritePlacement(0x0476, 0x48, 0x98),
	SpritePlacement(0x0484, 0x50, 0x28),
	SpritePlacement(0x0475, 0x78, 0x48),
	SpritePlacement(0x0472, 0x80, 0x70),
	SpritePlacement(0x0474, 0x88, 0x08),
	SpritePlacement(0x0485, 0xA8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry243 = SpritePlacementEntry(3, [
	SpritePlacement(0x03B3, 0x10, 0x98),
	SpritePlacement(0x03D3, 0x88, 0xB8),
	SpritePlacement(0x03AF, 0xC0, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry244 = SpritePlacementEntry(1, [
	SpritePlacement(0x03D5, 0xB0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry245 = SpritePlacementEntry(4, [
	SpritePlacement(0x03C0, 0x20, 0xA8),
	SpritePlacement(0x03E2, 0x30, 0xC0),
	SpritePlacement(0x03B7, 0x70, 0xC0),
	SpritePlacement(0x03D8, 0x78, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry246 = SpritePlacementEntry(3, [
	SpritePlacement(0x05E7, 0x38, 0xE8),
	SpritePlacement(0x03C2, 0xC8, 0x00),
	SpritePlacement(0x03C3, 0xF0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry247 = SpritePlacementEntry(1, [
	SpritePlacement(0x03DB, 0x28, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry248 = SpritePlacementEntry(2, [
	SpritePlacement(0x0453, 0x50, 0xE0),
	SpritePlacement(0x0454, 0x58, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry249 = SpritePlacementEntry(1, [
	SpritePlacement(0x0455, 0x50, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry250 = SpritePlacementEntry(2, [
	SpritePlacement(0x0458, 0x20, 0x48),
	SpritePlacement(0x044F, 0x20, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry251 = SpritePlacementEntry(6, [
	SpritePlacement(0x0544, 0x60, 0x40),
	SpritePlacement(0x0546, 0x60, 0x60),
	SpritePlacement(0x0543, 0x68, 0x30),
	SpritePlacement(0x0545, 0x68, 0x50),
	SpritePlacement(0x0547, 0x68, 0x70),
	SpritePlacement(0x0548, 0x68, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry252 = SpritePlacementEntry(2, [
	SpritePlacement(0x052E, 0x98, 0x10),
	SpritePlacement(0x053C, 0xA0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry253 = SpritePlacementEntry(3, [
	SpritePlacement(0x0559, 0x80, 0x38),
	SpritePlacement(0x055B, 0x90, 0x60),
	SpritePlacement(0x055A, 0x90, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry254 = SpritePlacementEntry(1, [
	SpritePlacement(0x05B0, 0xF0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry255 = SpritePlacementEntry(1, [
	SpritePlacement(0x05B2, 0x10, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry256 = SpritePlacementEntry(1, [
	SpritePlacement(0x05ED, 0x68, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry257 = SpritePlacementEntry(2, [
	SpritePlacement(0x0566, 0x20, 0x38),
	SpritePlacement(0x0576, 0x58, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry258 = SpritePlacementEntry(2, [
	SpritePlacement(0x056D, 0x38, 0xD0),
	SpritePlacement(0x0571, 0x68, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry259 = SpritePlacementEntry(2, [
	SpritePlacement(0x0280, 0x08, 0x58),
	SpritePlacement(0x0279, 0xD8, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry260 = SpritePlacementEntry(1, [
	SpritePlacement(0x03CA, 0x60, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry261 = SpritePlacementEntry(5, [
	SpritePlacement(0x03D4, 0x00, 0x88),
	SpritePlacement(0x03B2, 0x48, 0x70),
	SpritePlacement(0x03D9, 0x98, 0x28),
	SpritePlacement(0x03C1, 0xB0, 0xB0),
	SpritePlacement(0x03C4, 0xE8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry262 = SpritePlacementEntry(1, [
	SpritePlacement(0x03B5, 0xF8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry263 = SpritePlacementEntry(3, [
	SpritePlacement(0x05F1, 0x40, 0x50),
	SpritePlacement(0x0490, 0xB8, 0x68),
	SpritePlacement(0x05F6, 0xC0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry264 = SpritePlacementEntry(1, [
	SpritePlacement(0x060E, 0xA8, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry265 = SpritePlacementEntry(4, [
	SpritePlacement(0x052F, 0xF0, 0xC8),
	SpritePlacement(0x0531, 0xF0, 0xE8),
	SpritePlacement(0x0530, 0xF8, 0xD8),
	SpritePlacement(0x0532, 0xF8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry266 = SpritePlacementEntry(1, [
	SpritePlacement(0x0541, 0x60, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry267 = SpritePlacementEntry(3, [
	SpritePlacement(0x0561, 0x58, 0x48),
	SpritePlacement(0x0562, 0x68, 0x80),
	SpritePlacement(0x052D, 0xA8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry268 = SpritePlacementEntry(1, [
	SpritePlacement(0x0542, 0xA8, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry269 = SpritePlacementEntry(2, [
	SpritePlacement(0x053D, 0x50, 0xD0),
	SpritePlacement(0x052A, 0xA0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry270 = SpritePlacementEntry(4, [
	SpritePlacement(0x053E, 0x40, 0xA8),
	SpritePlacement(0x053F, 0x50, 0x78),
	SpritePlacement(0x0540, 0x50, 0xC4),
	SpritePlacement(0x0538, 0xC8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry271 = SpritePlacementEntry(1, [
	SpritePlacement(0x05AC, 0x20, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry272 = SpritePlacementEntry(3, [
	SpritePlacement(0x05EE, 0x38, 0x38),
	SpritePlacement(0x0567, 0x58, 0x28),
	SpritePlacement(0x0565, 0xB0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry273 = SpritePlacementEntry(2, [
	SpritePlacement(0x0570, 0x08, 0xA0),
	SpritePlacement(0x0574, 0xF8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry274 = SpritePlacementEntry(1, [
	SpritePlacement(0x056A, 0xA0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry275 = SpritePlacementEntry(1, [
	SpritePlacement(0x0277, 0x60, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry276 = SpritePlacementEntry(2, [
	SpritePlacement(0x0286, 0x38, 0x28),
	SpritePlacement(0x0285, 0x80, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry277 = SpritePlacementEntry(1, [
	SpritePlacement(0x0481, 0x40, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry278 = SpritePlacementEntry(1, [
	SpritePlacement(0x047A, 0x98, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry279 = SpritePlacementEntry(1, [
	SpritePlacement(0x0486, 0xF0, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry280 = SpritePlacementEntry(2, [
	SpritePlacement(0x03E1, 0x80, 0x50),
	SpritePlacement(0x03DA, 0xF8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry281 = SpritePlacementEntry(1, [
	SpritePlacement(0x03B1, 0x88, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry282 = SpritePlacementEntry(1, [
	SpritePlacement(0x03B0, 0x18, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry283 = SpritePlacementEntry(1, [
	SpritePlacement(0x05F4, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry284 = SpritePlacementEntry(1, [
	SpritePlacement(0x02B9, 0x88, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry285 = SpritePlacementEntry(1, [
	SpritePlacement(0x062B, 0x30, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry286 = SpritePlacementEntry(5, [
	SpritePlacement(0x0533, 0x00, 0x08),
	SpritePlacement(0x0534, 0x08, 0x18),
	SpritePlacement(0x0536, 0x08, 0x38),
	SpritePlacement(0x0535, 0x10, 0x28),
	SpritePlacement(0x052B, 0x68, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry287 = SpritePlacementEntry(1, [
	SpritePlacement(0x052C, 0x40, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry288 = SpritePlacementEntry(3, [
	SpritePlacement(0x0539, 0x90, 0x70),
	SpritePlacement(0x053A, 0xA0, 0x68),
	SpritePlacement(0x053B, 0xA0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry289 = SpritePlacementEntry(4, [
	SpritePlacement(0x057E, 0x60, 0xC8),
	SpritePlacement(0x0573, 0x68, 0xC8),
	SpritePlacement(0x057B, 0xB8, 0x10),
	SpritePlacement(0x05EA, 0xE8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry290 = SpritePlacementEntry(3, [
	SpritePlacement(0x05EB, 0x50, 0xD0),
	SpritePlacement(0x056B, 0x98, 0xC8),
	SpritePlacement(0x057C, 0xB8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry291 = SpritePlacementEntry(1, [
	SpritePlacement(0x02A0, 0x68, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry292 = SpritePlacementEntry(1, [
	SpritePlacement(0x047E, 0x78, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry293 = SpritePlacementEntry(1, [
	SpritePlacement(0x0477, 0x18, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry294 = SpritePlacementEntry(1, [
	SpritePlacement(0x0482, 0x18, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry295 = SpritePlacementEntry(2, [
	SpritePlacement(0x03CC, 0xB0, 0xA8),
	SpritePlacement(0x03CD, 0xB0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry296 = SpritePlacementEntry(1, [
	SpritePlacement(0x03AE, 0x18, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry297 = SpritePlacementEntry(1, [
	SpritePlacement(0x0586, 0xD8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry298 = SpritePlacementEntry(4, [
	SpritePlacement(0x05F0, 0x58, 0x38),
	SpritePlacement(0x049A, 0xB8, 0x90),
	SpritePlacement(0x05F5, 0xC0, 0x60),
	SpritePlacement(0x05F8, 0xC0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry299 = SpritePlacementEntry(3, [
	SpritePlacement(0x0347, 0x48, 0x60),
	SpritePlacement(0x0394, 0xC8, 0x60),
	SpritePlacement(0x0395, 0xE0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry300 = SpritePlacementEntry(2, [
	SpritePlacement(0x0388, 0x68, 0x68),
	SpritePlacement(0x0389, 0xA0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry301 = SpritePlacementEntry(1, [
	SpritePlacement(0x0358, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry302 = SpritePlacementEntry(2, [
	SpritePlacement(0x036F, 0x60, 0x70),
	SpritePlacement(0x03AD, 0xC8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry303 = SpritePlacementEntry(1, [
	SpritePlacement(0x05AB, 0x58, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry304 = SpritePlacementEntry(5, [
	SpritePlacement(0x054F, 0x40, 0x60),
	SpritePlacement(0x0550, 0x60, 0x78),
	SpritePlacement(0x0553, 0x68, 0x28),
	SpritePlacement(0x0551, 0x68, 0xA0),
	SpritePlacement(0x0552, 0x78, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry305 = SpritePlacementEntry(1, [
	SpritePlacement(0x05AD, 0x28, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry306 = SpritePlacementEntry(3, [
	SpritePlacement(0x0555, 0x40, 0x90),
	SpritePlacement(0x0557, 0x48, 0x60),
	SpritePlacement(0x0556, 0x70, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry307 = SpritePlacementEntry(1, [
	SpritePlacement(0x0554, 0x40, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry308 = SpritePlacementEntry(1, [
	SpritePlacement(0x02C0, 0xC0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry309 = SpritePlacementEntry(4, [
	SpritePlacement(0x02BD, 0xC8, 0x08),
	SpritePlacement(0x02BE, 0xC8, 0x18),
	SpritePlacement(0x02BC, 0xD0, 0x14),
	SpritePlacement(0x02BF, 0xD0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry310 = SpritePlacementEntry(2, [
	SpritePlacement(0x047B, 0xD0, 0x90),
	SpritePlacement(0x0489, 0xD0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry311 = SpritePlacementEntry(4, [
	SpritePlacement(0x02E4, 0x48, 0x80),
	SpritePlacement(0x02E3, 0x60, 0x90),
	SpritePlacement(0x02E2, 0x70, 0xD0),
	SpritePlacement(0x02E1, 0x80, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry312 = SpritePlacementEntry(2, [
	SpritePlacement(0x059B, 0x50, 0x98),
	SpritePlacement(0x05B5, 0xD0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry313 = SpritePlacementEntry(2, [
	SpritePlacement(0x049D, 0xB8, 0x78),
	SpritePlacement(0x05F9, 0xC0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry314 = SpritePlacementEntry(2, [
	SpritePlacement(0x038D, 0xB0, 0x70),
	SpritePlacement(0x038C, 0xC8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry315 = SpritePlacementEntry(4, [
	SpritePlacement(0x0391, 0x70, 0x30),
	SpritePlacement(0x0390, 0x98, 0x10),
	SpritePlacement(0x038F, 0xA8, 0x38),
	SpritePlacement(0x038E, 0xB8, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry316 = SpritePlacementEntry(1, [
	SpritePlacement(0x0360, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry317 = SpritePlacementEntry(1, [
	SpritePlacement(0x0364, 0x18, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry318 = SpritePlacementEntry(2, [
	SpritePlacement(0x05E8, 0x68, 0x30),
	SpritePlacement(0x0370, 0x68, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry319 = SpritePlacementEntry(2, [
	SpritePlacement(0x05DB, 0x38, 0x68),
	SpritePlacement(0x0345, 0x40, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry320 = SpritePlacementEntry(4, [
	SpritePlacement(0x032F, 0x40, 0x20),
	SpritePlacement(0x032D, 0x40, 0x30),
	SpritePlacement(0x032E, 0x40, 0x50),
	SpritePlacement(0x0330, 0x40, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry321 = SpritePlacementEntry(2, [
	SpritePlacement(0x031D, 0xC8, 0x18),
	SpritePlacement(0x031E, 0xD0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry322 = SpritePlacementEntry(1, [
	SpritePlacement(0x05E4, 0xC8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry323 = SpritePlacementEntry(2, [
	SpritePlacement(0x05DE, 0x50, 0xB8),
	SpritePlacement(0x0346, 0x78, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry324 = SpritePlacementEntry(1, [
	SpritePlacement(0x0487, 0x18, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry325 = SpritePlacementEntry(1, [
	SpritePlacement(0x047D, 0x20, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry326 = SpritePlacementEntry(1, [
	SpritePlacement(0x045E, 0x88, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry327 = SpritePlacementEntry(1, [
	SpritePlacement(0x02B4, 0x80, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry328 = SpritePlacementEntry(1, [
	SpritePlacement(0x02B0, 0x80, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry329 = SpritePlacementEntry(1, [
	SpritePlacement(0x0629, 0x50, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry330 = SpritePlacementEntry(2, [
	SpritePlacement(0x05B9, 0xC0, 0x88),
	SpritePlacement(0x05B4, 0xE0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry331 = SpritePlacementEntry(2, [
	SpritePlacement(0x049E, 0xB8, 0x90),
	SpritePlacement(0x04AB, 0xC0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry332 = SpritePlacementEntry(2, [
	SpritePlacement(0x0355, 0x40, 0x88),
	SpritePlacement(0x0356, 0x70, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry333 = SpritePlacementEntry(2, [
	SpritePlacement(0x0354, 0x88, 0xB0),
	SpritePlacement(0x0353, 0x90, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry334 = SpritePlacementEntry(3, [
	SpritePlacement(0x0351, 0x90, 0x78),
	SpritePlacement(0x0352, 0x90, 0x90),
	SpritePlacement(0x0350, 0x90, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry335 = SpritePlacementEntry(2, [
	SpritePlacement(0x0379, 0x60, 0x60),
	SpritePlacement(0x0365, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry336 = SpritePlacementEntry(7, [
	SpritePlacement(0x035B, 0x00, 0xD0),
	SpritePlacement(0x035D, 0x08, 0x78),
	SpritePlacement(0x035C, 0x20, 0x68),
	SpritePlacement(0x035A, 0x28, 0xB0),
	SpritePlacement(0x0359, 0x58, 0xF8),
	SpritePlacement(0x0362, 0xE8, 0xB8),
	SpritePlacement(0x0361, 0xF0, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry337 = SpritePlacementEntry(1, [
	SpritePlacement(0x0363, 0xE8, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry338 = SpritePlacementEntry(2, [
	SpritePlacement(0x05E9, 0x70, 0x60),
	SpritePlacement(0x03A8, 0xD0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry339 = SpritePlacementEntry(4, [
	SpritePlacement(0x031F, 0x40, 0x30),
	SpritePlacement(0x0321, 0x40, 0x40),
	SpritePlacement(0x0322, 0x40, 0x60),
	SpritePlacement(0x0320, 0x40, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry340 = SpritePlacementEntry(2, [
	SpritePlacement(0x05DC, 0x50, 0xB0),
	SpritePlacement(0x033F, 0x58, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry341 = SpritePlacementEntry(1, [
	SpritePlacement(0x05B3, 0x88, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry342 = SpritePlacementEntry(1, [
	SpritePlacement(0x0480, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry343 = SpritePlacementEntry(1, [
	SpritePlacement(0x047F, 0x98, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry344 = SpritePlacementEntry(1, [
	SpritePlacement(0x02B3, 0x70, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry345 = SpritePlacementEntry(8, [
	SpritePlacement(0x02B5, 0x10, 0x10),
	SpritePlacement(0x02BA, 0x10, 0x20),
	SpritePlacement(0x02B6, 0x10, 0x48),
	SpritePlacement(0x02BB, 0x10, 0x58),
	SpritePlacement(0x02B7, 0x18, 0x78),
	SpritePlacement(0x02B8, 0x18, 0x88),
	SpritePlacement(0x02B1, 0x48, 0x38),
	SpritePlacement(0x02B2, 0x60, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry346 = SpritePlacementEntry(1, [
	SpritePlacement(0x0587, 0xD8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry347 = SpritePlacementEntry(4, [
	SpritePlacement(0x024E, 0x28, 0xD0),
	SpritePlacement(0x05B7, 0xC8, 0x78),
	SpritePlacement(0x05B6, 0xD8, 0x90),
	SpritePlacement(0x05B8, 0xF0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry348 = SpritePlacementEntry(3, [
	SpritePlacement(0x0626, 0x50, 0x20),
	SpritePlacement(0x04A1, 0xB8, 0x48),
	SpritePlacement(0x05F7, 0xC0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry349 = SpritePlacementEntry(2, [
	SpritePlacement(0x0349, 0xD8, 0xA8),
	SpritePlacement(0x0348, 0xE8, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry350 = SpritePlacementEntry(1, [
	SpritePlacement(0x0366, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry351 = SpritePlacementEntry(1, [
	SpritePlacement(0x0372, 0xE8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry352 = SpritePlacementEntry(1, [
	SpritePlacement(0x0371, 0xF0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry353 = SpritePlacementEntry(2, [
	SpritePlacement(0x0367, 0x60, 0x50),
	SpritePlacement(0x037D, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry354 = SpritePlacementEntry(5, [
	SpritePlacement(0x0323, 0x40, 0x30),
	SpritePlacement(0x0325, 0x40, 0x40),
	SpritePlacement(0x0326, 0x40, 0x60),
	SpritePlacement(0x0324, 0x40, 0x70),
	SpritePlacement(0x05C8, 0xE8, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry355 = SpritePlacementEntry(6, [
	SpritePlacement(0x05E1, 0x60, 0x38),
	SpritePlacement(0x055D, 0xC0, 0x50),
	SpritePlacement(0x055F, 0xC0, 0xB8),
	SpritePlacement(0x055E, 0xC8, 0x80),
	SpritePlacement(0x055C, 0xC8, 0x98),
	SpritePlacement(0x0560, 0xC8, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry356 = SpritePlacementEntry(7, [
	SpritePlacement(0x0331, 0x40, 0x30),
	SpritePlacement(0x0333, 0x40, 0x40),
	SpritePlacement(0x0334, 0x40, 0xA0),
	SpritePlacement(0x0332, 0x40, 0xB0),
	SpritePlacement(0x02A2, 0xC0, 0x70),
	SpritePlacement(0x02A3, 0xD0, 0x98),
	SpritePlacement(0x02A1, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry357 = SpritePlacementEntry(1, [
	SpritePlacement(0x05E0, 0x58, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry358 = SpritePlacementEntry(1, [
	SpritePlacement(0x05DF, 0x58, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry359 = SpritePlacementEntry(3, [
	SpritePlacement(0x033B, 0x40, 0x30),
	SpritePlacement(0x033A, 0x50, 0x70),
	SpritePlacement(0x0558, 0xD8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry360 = SpritePlacementEntry(4, [
	SpritePlacement(0x051A, 0xC0, 0xC4),
	SpritePlacement(0x051B, 0xC8, 0xD4),
	SpritePlacement(0x051C, 0xD0, 0xB4),
	SpritePlacement(0x051D, 0xD8, 0xC4),
]);

immutable SpritePlacementEntry spritePlacementEntry361 = SpritePlacementEntry(1, [
	SpritePlacement(0x062F, 0xF8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry362 = SpritePlacementEntry(1, [
	SpritePlacement(0x0157, 0xB0, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry363 = SpritePlacementEntry(1, [
	SpritePlacement(0x0493, 0x38, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry364 = SpritePlacementEntry(2, [
	SpritePlacement(0x00D0, 0x50, 0xA0),
	SpritePlacement(0x00CF, 0x58, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry365 = SpritePlacementEntry(4, [
	SpritePlacement(0x0270, 0x48, 0x48),
	SpritePlacement(0x0271, 0x50, 0x38),
	SpritePlacement(0x04A3, 0xB8, 0x48),
	SpritePlacement(0x04A2, 0xB8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry366 = SpritePlacementEntry(1, [
	SpritePlacement(0x03A6, 0xF0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry367 = SpritePlacementEntry(1, [
	SpritePlacement(0x0357, 0x50, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry368 = SpritePlacementEntry(6, [
	SpritePlacement(0x036C, 0x60, 0xF0),
	SpritePlacement(0x036B, 0x68, 0xB0),
	SpritePlacement(0x036E, 0x70, 0x50),
	SpritePlacement(0x036A, 0x80, 0xA8),
	SpritePlacement(0x0369, 0x80, 0xB8),
	SpritePlacement(0x036D, 0x90, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry369 = SpritePlacementEntry(1, [
	SpritePlacement(0x0368, 0x78, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry370 = SpritePlacementEntry(9, [
	SpritePlacement(0x0377, 0x48, 0x70),
	SpritePlacement(0x0375, 0x50, 0x48),
	SpritePlacement(0x0373, 0x58, 0x70),
	SpritePlacement(0x0374, 0x68, 0x28),
	SpritePlacement(0x0376, 0x68, 0x58),
	SpritePlacement(0x0378, 0x68, 0x88),
	SpritePlacement(0x037C, 0xC0, 0x40),
	SpritePlacement(0x037A, 0xC0, 0x58),
	SpritePlacement(0x037B, 0xD0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry371 = SpritePlacementEntry(3, [
	SpritePlacement(0x032C, 0x48, 0x28),
	SpritePlacement(0x032B, 0x48, 0x38),
	SpritePlacement(0x05CA, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry372 = SpritePlacementEntry(1, [
	SpritePlacement(0x029F, 0xB0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry373 = SpritePlacementEntry(2, [
	SpritePlacement(0x0335, 0x48, 0x30),
	SpritePlacement(0x05CD, 0xE8, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry374 = SpritePlacementEntry(5, [
	SpritePlacement(0x05E5, 0x48, 0x88),
	SpritePlacement(0x05E3, 0x60, 0x98),
	SpritePlacement(0x0344, 0x68, 0x58),
	SpritePlacement(0x0343, 0x88, 0x48),
	SpritePlacement(0x0342, 0x90, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry375 = SpritePlacementEntry(18, [
	SpritePlacement(0x0336, 0x40, 0x30),
	SpritePlacement(0x0338, 0x40, 0x40),
	SpritePlacement(0x0339, 0x40, 0x60),
	SpritePlacement(0x0337, 0x40, 0x70),
	SpritePlacement(0x029B, 0xA0, 0x78),
	SpritePlacement(0x0297, 0xB0, 0x58),
	SpritePlacement(0x0293, 0xC0, 0x68),
	SpritePlacement(0x029D, 0xC0, 0x88),
	SpritePlacement(0x0295, 0xC8, 0x58),
	SpritePlacement(0x0291, 0xC8, 0x98),
	SpritePlacement(0x029E, 0xC8, 0xA8),
	SpritePlacement(0x0296, 0xD0, 0x68),
	SpritePlacement(0x0298, 0xD0, 0xC8),
	SpritePlacement(0x029A, 0xE0, 0x38),
	SpritePlacement(0x029C, 0xE0, 0x90),
	SpritePlacement(0x0299, 0xE8, 0x58),
	SpritePlacement(0x0292, 0xE8, 0xA8),
	SpritePlacement(0x0294, 0xE8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry376 = SpritePlacementEntry(1, [
	SpritePlacement(0x0165, 0xD8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry377 = SpritePlacementEntry(2, [
	SpritePlacement(0x014B, 0xB0, 0x30),
	SpritePlacement(0x016A, 0xE0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry378 = SpritePlacementEntry(2, [
	SpritePlacement(0x0492, 0x18, 0x50),
	SpritePlacement(0x0491, 0x18, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry379 = SpritePlacementEntry(4, [
	SpritePlacement(0x0460, 0x30, 0xE8),
	SpritePlacement(0x0461, 0x30, 0xF8),
	SpritePlacement(0x045F, 0x40, 0xF4),
	SpritePlacement(0x04FC, 0xE0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry380 = SpritePlacementEntry(1, [
	SpritePlacement(0x0462, 0x40, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry381 = SpritePlacementEntry(1, [
	SpritePlacement(0x04BB, 0xF8, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry382 = SpritePlacementEntry(2, [
	SpritePlacement(0x04C2, 0x70, 0x88),
	SpritePlacement(0x04C1, 0x88, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry383 = SpritePlacementEntry(4, [
	SpritePlacement(0x03A5, 0x00, 0xA8),
	SpritePlacement(0x03A7, 0x00, 0xD8),
	SpritePlacement(0x03A0, 0x18, 0xD0),
	SpritePlacement(0x03A1, 0x48, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry384 = SpritePlacementEntry(2, [
	SpritePlacement(0x03AC, 0x20, 0x98),
	SpritePlacement(0x03A2, 0x60, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry385 = SpritePlacementEntry(2, [
	SpritePlacement(0x039B, 0xB8, 0x98),
	SpritePlacement(0x039A, 0xB8, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry386 = SpritePlacementEntry(2, [
	SpritePlacement(0x0393, 0x48, 0xD0),
	SpritePlacement(0x037E, 0xE0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry387 = SpritePlacementEntry(2, [
	SpritePlacement(0x0392, 0x40, 0x70),
	SpritePlacement(0x037F, 0xC0, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry388 = SpritePlacementEntry(2, [
	SpritePlacement(0x0396, 0xD8, 0x48),
	SpritePlacement(0x0397, 0xE8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry389 = SpritePlacementEntry(6, [
	SpritePlacement(0x0329, 0x40, 0x20),
	SpritePlacement(0x0327, 0x40, 0x30),
	SpritePlacement(0x0328, 0x40, 0x50),
	SpritePlacement(0x032A, 0x40, 0x60),
	SpritePlacement(0x05CC, 0xD0, 0x88),
	SpritePlacement(0x05CB, 0xD8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry390 = SpritePlacementEntry(4, [
	SpritePlacement(0x0340, 0x40, 0x60),
	SpritePlacement(0x05D9, 0x48, 0x40),
	SpritePlacement(0x05D0, 0xC8, 0xF8),
	SpritePlacement(0x05CF, 0xD0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry391 = SpritePlacementEntry(1, [
	SpritePlacement(0x05C4, 0x48, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry392 = SpritePlacementEntry(1, [
	SpritePlacement(0x012F, 0x28, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry393 = SpritePlacementEntry(3, [
	SpritePlacement(0x0167, 0x80, 0xD0),
	SpritePlacement(0x016F, 0x90, 0x88),
	SpritePlacement(0x0168, 0xB8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry394 = SpritePlacementEntry(3, [
	SpritePlacement(0x0132, 0x98, 0xE8),
	SpritePlacement(0x016C, 0xC0, 0x50),
	SpritePlacement(0x0133, 0xD0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry395 = SpritePlacementEntry(2, [
	SpritePlacement(0x016B, 0x90, 0x80),
	SpritePlacement(0x0166, 0xA8, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry396 = SpritePlacementEntry(7, [
	SpritePlacement(0x0146, 0x90, 0x80),
	SpritePlacement(0x0154, 0x90, 0xD0),
	SpritePlacement(0x0142, 0x98, 0x60),
	SpritePlacement(0x0147, 0x98, 0x70),
	SpritePlacement(0x0175, 0xA8, 0x80),
	SpritePlacement(0x0140, 0xB0, 0xB0),
	SpritePlacement(0x016E, 0xC0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry397 = SpritePlacementEntry(3, [
	SpritePlacement(0x0149, 0x70, 0x30),
	SpritePlacement(0x0176, 0x78, 0x00),
	SpritePlacement(0x0148, 0x80, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry398 = SpritePlacementEntry(1, [
	SpritePlacement(0x0625, 0x90, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry399 = SpritePlacementEntry(4, [
	SpritePlacement(0x04BC, 0x10, 0x68),
	SpritePlacement(0x04BD, 0x38, 0x70),
	SpritePlacement(0x04BA, 0xB0, 0x68),
	SpritePlacement(0x0604, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry400 = SpritePlacementEntry(3, [
	SpritePlacement(0x04BE, 0x78, 0xC0),
	SpritePlacement(0x04BF, 0xA0, 0x98),
	SpritePlacement(0x04C0, 0xA8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry401 = SpritePlacementEntry(1, [
	SpritePlacement(0x039D, 0xA8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry402 = SpritePlacementEntry(2, [
	SpritePlacement(0x03A4, 0x90, 0x20),
	SpritePlacement(0x039C, 0xF0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry403 = SpritePlacementEntry(1, [
	SpritePlacement(0x039F, 0x28, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry404 = SpritePlacementEntry(8, [
	SpritePlacement(0x0387, 0xC0, 0x50),
	SpritePlacement(0x0380, 0xC0, 0x78),
	SpritePlacement(0x0381, 0xC8, 0xA0),
	SpritePlacement(0x0382, 0xD8, 0xB8),
	SpritePlacement(0x0383, 0xE0, 0x50),
	SpritePlacement(0x0386, 0xE0, 0x88),
	SpritePlacement(0x0385, 0xE0, 0x98),
	SpritePlacement(0x0384, 0xF0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry405 = SpritePlacementEntry(2, [
	SpritePlacement(0x035E, 0x58, 0x58),
	SpritePlacement(0x035F, 0x60, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry406 = SpritePlacementEntry(2, [
	SpritePlacement(0x05C3, 0x20, 0x30),
	SpritePlacement(0x05C9, 0xD0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry407 = SpritePlacementEntry(3, [
	SpritePlacement(0x0341, 0xC0, 0x80),
	SpritePlacement(0x05DD, 0xC8, 0x60),
	SpritePlacement(0x05DA, 0xD8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry408 = SpritePlacementEntry(1, [
	SpritePlacement(0x05C5, 0x48, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry409 = SpritePlacementEntry(1, [
	SpritePlacement(0x05E6, 0x28, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry410 = SpritePlacementEntry(1, [
	SpritePlacement(0x05E2, 0xB8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry411 = SpritePlacementEntry(2, [
	SpritePlacement(0x0144, 0xC0, 0xF0),
	SpritePlacement(0x014E, 0xD8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry412 = SpritePlacementEntry(5, [
	SpritePlacement(0x0152, 0xB0, 0x48),
	SpritePlacement(0x0145, 0xB8, 0xF0),
	SpritePlacement(0x0156, 0xC0, 0x58),
	SpritePlacement(0x013A, 0xE0, 0x08),
	SpritePlacement(0x013D, 0xE0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry413 = SpritePlacementEntry(1, [
	SpritePlacement(0x0171, 0xF8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry414 = SpritePlacementEntry(1, [
	SpritePlacement(0x0136, 0x40, 0x9C),
]);

immutable SpritePlacementEntry spritePlacementEntry415 = SpritePlacementEntry(1, [
	SpritePlacement(0x0161, 0x38, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry416 = SpritePlacementEntry(1, [
	SpritePlacement(0x0628, 0x30, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry417 = SpritePlacementEntry(1, [
	SpritePlacement(0x0627, 0xC0, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry418 = SpritePlacementEntry(2, [
	SpritePlacement(0x03AB, 0x08, 0x00),
	SpritePlacement(0x039E, 0x08, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry419 = SpritePlacementEntry(4, [
	SpritePlacement(0x03A9, 0x70, 0x88),
	SpritePlacement(0x03AA, 0x70, 0xA0),
	SpritePlacement(0x0398, 0x80, 0xF8),
	SpritePlacement(0x03A3, 0x98, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry420 = SpritePlacementEntry(1, [
	SpritePlacement(0x0399, 0x80, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry421 = SpritePlacementEntry(6, [
	SpritePlacement(0x034F, 0x48, 0x50),
	SpritePlacement(0x034A, 0x48, 0x90),
	SpritePlacement(0x034D, 0x50, 0x70),
	SpritePlacement(0x034C, 0x58, 0x40),
	SpritePlacement(0x034B, 0x70, 0x60),
	SpritePlacement(0x034E, 0x70, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry422 = SpritePlacementEntry(6, [
	SpritePlacement(0x04C7, 0x20, 0x70),
	SpritePlacement(0x04C9, 0x30, 0x58),
	SpritePlacement(0x04C8, 0x30, 0x90),
	SpritePlacement(0x04C6, 0x50, 0x38),
	SpritePlacement(0x038B, 0xC0, 0x60),
	SpritePlacement(0x038A, 0xC8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry423 = SpritePlacementEntry(2, [
	SpritePlacement(0x05C2, 0x40, 0x50),
	SpritePlacement(0x05CE, 0xE0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry424 = SpritePlacementEntry(1, [
	SpritePlacement(0x05B1, 0x30, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry425 = SpritePlacementEntry(4, [
	SpritePlacement(0x033D, 0xA0, 0x80),
	SpritePlacement(0x05C6, 0xA8, 0x58),
	SpritePlacement(0x033C, 0xA8, 0x68),
	SpritePlacement(0x05C7, 0xB0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry426 = SpritePlacementEntry(1, [
	SpritePlacement(0x033E, 0xB0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry427 = SpritePlacementEntry(1, [
	SpritePlacement(0x051E, 0x18, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry428 = SpritePlacementEntry(1, [
	SpritePlacement(0x014F, 0xB0, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry429 = SpritePlacementEntry(6, [
	SpritePlacement(0x0137, 0x28, 0xC8),
	SpritePlacement(0x0139, 0x50, 0x70),
	SpritePlacement(0x013E, 0x80, 0xA0),
	SpritePlacement(0x0173, 0x88, 0x90),
	SpritePlacement(0x0174, 0x88, 0xB0),
	SpritePlacement(0x0150, 0xA0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry430 = SpritePlacementEntry(3, [
	SpritePlacement(0x013B, 0x00, 0xC0),
	SpritePlacement(0x0138, 0x28, 0x18),
	SpritePlacement(0x013C, 0x40, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry431 = SpritePlacementEntry(2, [
	SpritePlacement(0x0130, 0x00, 0x78),
	SpritePlacement(0x0170, 0xD0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry432 = SpritePlacementEntry(6, [
	SpritePlacement(0x0151, 0x60, 0x4C),
	SpritePlacement(0x015F, 0x98, 0x30),
	SpritePlacement(0x0143, 0xA0, 0x18),
	SpritePlacement(0x0141, 0xB0, 0x28),
	SpritePlacement(0x0162, 0xC0, 0x08),
	SpritePlacement(0x0155, 0xD0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry433 = SpritePlacementEntry(1, [
	SpritePlacement(0x0153, 0xC0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry434 = SpritePlacementEntry(4, [
	SpritePlacement(0x0131, 0xA8, 0xD0),
	SpritePlacement(0x0134, 0xD8, 0x68),
	SpritePlacement(0x0164, 0xD8, 0xC8),
	SpritePlacement(0x0135, 0xF8, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry435 = SpritePlacementEntry(1, [
	SpritePlacement(0x01B0, 0xB8, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry436 = SpritePlacementEntry(1, [
	SpritePlacement(0x00CB, 0xC8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry437 = SpritePlacementEntry(1, [
	SpritePlacement(0x04DC, 0x98, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry438 = SpritePlacementEntry(2, [
	SpritePlacement(0x04D6, 0xD8, 0x50),
	SpritePlacement(0x04D2, 0xD8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry439 = SpritePlacementEntry(1, [
	SpritePlacement(0x04D1, 0xB0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry440 = SpritePlacementEntry(1, [
	SpritePlacement(0x04CA, 0xE8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry441 = SpritePlacementEntry(6, [
	SpritePlacement(0x0127, 0x68, 0x70),
	SpritePlacement(0x0128, 0x68, 0x88),
	SpritePlacement(0x012E, 0x80, 0xB8),
	SpritePlacement(0x012A, 0x90, 0xD8),
	SpritePlacement(0x012C, 0xA0, 0x48),
	SpritePlacement(0x0129, 0xD0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry442 = SpritePlacementEntry(3, [
	SpritePlacement(0x0465, 0x38, 0x58),
	SpritePlacement(0x0466, 0x60, 0xF8),
	SpritePlacement(0x02C2, 0xD8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry443 = SpritePlacementEntry(3, [
	SpritePlacement(0x0468, 0x38, 0xC0),
	SpritePlacement(0x0464, 0x38, 0xD8),
	SpritePlacement(0x0467, 0x48, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry444 = SpritePlacementEntry(1, [
	SpritePlacement(0x02C3, 0xC8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry445 = SpritePlacementEntry(3, [
	SpritePlacement(0x02D2, 0x88, 0x30),
	SpritePlacement(0x02D0, 0xB0, 0x90),
	SpritePlacement(0x02DC, 0xB0, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry446 = SpritePlacementEntry(4, [
	SpritePlacement(0x02E7, 0x90, 0x18),
	SpritePlacement(0x02E6, 0xD0, 0x10),
	SpritePlacement(0x02E0, 0xD0, 0x78),
	SpritePlacement(0x02D3, 0xF0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry447 = SpritePlacementEntry(5, [
	SpritePlacement(0x014D, 0x18, 0xA0),
	SpritePlacement(0x014C, 0x18, 0xB8),
	SpritePlacement(0x016D, 0x58, 0xF0),
	SpritePlacement(0x013F, 0x78, 0xD0),
	SpritePlacement(0x0169, 0xD0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry448 = SpritePlacementEntry(1, [
	SpritePlacement(0x0172, 0x00, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry449 = SpritePlacementEntry(2, [
	SpritePlacement(0x015E, 0x00, 0x88),
	SpritePlacement(0x0160, 0x00, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry450 = SpritePlacementEntry(2, [
	SpritePlacement(0x04D3, 0x50, 0x80),
	SpritePlacement(0x04CC, 0xB0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry451 = SpritePlacementEntry(3, [
	SpritePlacement(0x04D7, 0x18, 0x08),
	SpritePlacement(0x04CB, 0x28, 0xB0),
	SpritePlacement(0x04D9, 0xD8, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry452 = SpritePlacementEntry(1, [
	SpritePlacement(0x04D0, 0xA8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry453 = SpritePlacementEntry(1, [
	SpritePlacement(0x04D8, 0x60, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry454 = SpritePlacementEntry(2, [
	SpritePlacement(0x0123, 0x78, 0xA8),
	SpritePlacement(0x0125, 0xC0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry455 = SpritePlacementEntry(3, [
	SpritePlacement(0x0124, 0x48, 0x40),
	SpritePlacement(0x012B, 0x60, 0x60),
	SpritePlacement(0x0126, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry456 = SpritePlacementEntry(7, [
	SpritePlacement(0x0102, 0x40, 0x80),
	SpritePlacement(0x0100, 0x40, 0x98),
	SpritePlacement(0x00E5, 0xC0, 0x90),
	SpritePlacement(0x00E2, 0xD0, 0x98),
	SpritePlacement(0x00E4, 0xD0, 0xB0),
	SpritePlacement(0x00E6, 0xD8, 0x28),
	SpritePlacement(0x00E3, 0xE8, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry457 = SpritePlacementEntry(3, [
	SpritePlacement(0x0101, 0x50, 0x00),
	SpritePlacement(0x010A, 0xC8, 0x60),
	SpritePlacement(0x010B, 0xD8, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry458 = SpritePlacementEntry(1, [
	SpritePlacement(0x0116, 0x48, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry459 = SpritePlacementEntry(1, [
	SpritePlacement(0x02DA, 0xC0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry460 = SpritePlacementEntry(14, [
	SpritePlacement(0x02D4, 0x38, 0xF8),
	SpritePlacement(0x05BE, 0x70, 0xF0),
	SpritePlacement(0x02E8, 0x80, 0x88),
	SpritePlacement(0x02DB, 0x90, 0xA8),
	SpritePlacement(0x02E9, 0xA8, 0x40),
	SpritePlacement(0x02D9, 0xB8, 0x50),
	SpritePlacement(0x02DF, 0xB8, 0x60),
	SpritePlacement(0x02E5, 0xC0, 0x80),
	SpritePlacement(0x02EA, 0xC8, 0xD0),
	SpritePlacement(0x02DD, 0xD0, 0x38),
	SpritePlacement(0x02D7, 0xD8, 0x60),
	SpritePlacement(0x02CF, 0xD8, 0xA8),
	SpritePlacement(0x02D8, 0xE0, 0x80),
	SpritePlacement(0x02DE, 0xE0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry461 = SpritePlacementEntry(2, [
	SpritePlacement(0x02D1, 0x60, 0x38),
	SpritePlacement(0x02D5, 0xC8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry462 = SpritePlacementEntry(1, [
	SpritePlacement(0x0163, 0x38, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry463 = SpritePlacementEntry(1, [
	SpritePlacement(0x01AB, 0x70, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry464 = SpritePlacementEntry(2, [
	SpritePlacement(0x01B3, 0xC0, 0x00),
	SpritePlacement(0x01AF, 0xD0, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry465 = SpritePlacementEntry(1, [
	SpritePlacement(0x0611, 0x08, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry466 = SpritePlacementEntry(1, [
	SpritePlacement(0x04CD, 0xB8, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry467 = SpritePlacementEntry(2, [
	SpritePlacement(0x04DA, 0x50, 0x28),
	SpritePlacement(0x0615, 0xB0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry468 = SpritePlacementEntry(1, [
	SpritePlacement(0x0614, 0x90, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry469 = SpritePlacementEntry(1, [
	SpritePlacement(0x0463, 0xB8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry470 = SpritePlacementEntry(1, [
	SpritePlacement(0x010C, 0xD0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry471 = SpritePlacementEntry(7, [
	SpritePlacement(0x011E, 0x20, 0x78),
	SpritePlacement(0x0120, 0x20, 0xB0),
	SpritePlacement(0x0121, 0x20, 0xD0),
	SpritePlacement(0x011F, 0x30, 0x50),
	SpritePlacement(0x012D, 0x38, 0x68),
	SpritePlacement(0x0122, 0x58, 0x90),
	SpritePlacement(0x00D4, 0xC8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry472 = SpritePlacementEntry(1, [
	SpritePlacement(0x010D, 0xC0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry473 = SpritePlacementEntry(5, [
	SpritePlacement(0x00D8, 0x48, 0xD8),
	SpritePlacement(0x00D5, 0x50, 0x50),
	SpritePlacement(0x00D6, 0x58, 0x98),
	SpritePlacement(0x00D7, 0x68, 0x78),
	SpritePlacement(0x00FD, 0xC8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry474 = SpritePlacementEntry(1, [
	SpritePlacement(0x00DC, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry475 = SpritePlacementEntry(6, [
	SpritePlacement(0x00FB, 0x48, 0x48),
	SpritePlacement(0x00FC, 0x50, 0x60),
	SpritePlacement(0x00F8, 0x50, 0x90),
	SpritePlacement(0x00F9, 0x58, 0xA8),
	SpritePlacement(0x00FA, 0x68, 0x38),
	SpritePlacement(0x00F7, 0x70, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry476 = SpritePlacementEntry(1, [
	SpritePlacement(0x02D6, 0x00, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry477 = SpritePlacementEntry(1, [
	SpritePlacement(0x02CE, 0x68, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry478 = SpritePlacementEntry(4, [
	SpritePlacement(0x01AC, 0x10, 0xE0),
	SpritePlacement(0x019D, 0x60, 0x98),
	SpritePlacement(0x01A4, 0x78, 0x38),
	SpritePlacement(0x019B, 0xB0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry479 = SpritePlacementEntry(6, [
	SpritePlacement(0x01B2, 0x28, 0x90),
	SpritePlacement(0x01B1, 0x38, 0x90),
	SpritePlacement(0x01A6, 0x50, 0x50),
	SpritePlacement(0x019C, 0x60, 0xC8),
	SpritePlacement(0x01A1, 0xD0, 0xE0),
	SpritePlacement(0x01A2, 0xF0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry480 = SpritePlacementEntry(2, [
	SpritePlacement(0x01A5, 0x18, 0x58),
	SpritePlacement(0x01A0, 0x58, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry481 = SpritePlacementEntry(1, [
	SpritePlacement(0x04DB, 0xD0, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry482 = SpritePlacementEntry(3, [
	SpritePlacement(0x04CE, 0x00, 0x78),
	SpritePlacement(0x0612, 0x20, 0x78),
	SpritePlacement(0x04D5, 0x28, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry483 = SpritePlacementEntry(2, [
	SpritePlacement(0x0613, 0x70, 0x28),
	SpritePlacement(0x04DD, 0xC8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry484 = SpritePlacementEntry(1, [
	SpritePlacement(0x04D4, 0x30, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry485 = SpritePlacementEntry(2, [
	SpritePlacement(0x00FF, 0x50, 0x80),
	SpritePlacement(0x0469, 0xD0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry486 = SpritePlacementEntry(2, [
	SpritePlacement(0x00D9, 0x50, 0x78),
	SpritePlacement(0x0117, 0xD0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry487 = SpritePlacementEntry(3, [
	SpritePlacement(0x0447, 0x38, 0x60),
	SpritePlacement(0x0609, 0x50, 0x18),
	SpritePlacement(0x010E, 0xE8, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry488 = SpritePlacementEntry(1, [
	SpritePlacement(0x011B, 0xE0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry489 = SpritePlacementEntry(2, [
	SpritePlacement(0x0520, 0x48, 0x90),
	SpritePlacement(0x0448, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry490 = SpritePlacementEntry(8, [
	SpritePlacement(0x0107, 0x30, 0x90),
	SpritePlacement(0x0106, 0x40, 0x90),
	SpritePlacement(0x00DF, 0xC8, 0x58),
	SpritePlacement(0x00E1, 0xD0, 0x40),
	SpritePlacement(0x00DD, 0xD8, 0x78),
	SpritePlacement(0x00E0, 0xD8, 0x98),
	SpritePlacement(0x058A, 0xE8, 0x30),
	SpritePlacement(0x00DE, 0xF0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry491 = SpritePlacementEntry(4, [
	SpritePlacement(0x0115, 0x58, 0x80),
	SpritePlacement(0x0528, 0xC0, 0x90),
	SpritePlacement(0x0529, 0xC0, 0xA8),
	SpritePlacement(0x0527, 0xE8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry492 = SpritePlacementEntry(4, [
	SpritePlacement(0x019E, 0x40, 0x08),
	SpritePlacement(0x01AA, 0xB8, 0xA8),
	SpritePlacement(0x01A3, 0xB8, 0xC0),
	SpritePlacement(0x01AE, 0xD8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry493 = SpritePlacementEntry(1, [
	SpritePlacement(0x019F, 0xC8, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry494 = SpritePlacementEntry(2, [
	SpritePlacement(0x01A9, 0x50, 0x50),
	SpritePlacement(0x01AD, 0x68, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry495 = SpritePlacementEntry(1, [
	SpritePlacement(0x0610, 0x58, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry496 = SpritePlacementEntry(1, [
	SpritePlacement(0x04CF, 0x18, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry497 = SpritePlacementEntry(3, [
	SpritePlacement(0x02C7, 0x10, 0x50),
	SpritePlacement(0x02C6, 0x60, 0x30),
	SpritePlacement(0x046A, 0xC0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry498 = SpritePlacementEntry(4, [
	SpritePlacement(0x00DA, 0x60, 0xA4),
	SpritePlacement(0x011A, 0xD8, 0x78),
	SpritePlacement(0x0119, 0xE0, 0x58),
	SpritePlacement(0x0118, 0xE0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry499 = SpritePlacementEntry(4, [
	SpritePlacement(0x060B, 0x38, 0x70),
	SpritePlacement(0x0449, 0x48, 0x38),
	SpritePlacement(0x011C, 0xE0, 0x84),
	SpritePlacement(0x011D, 0xE8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry500 = SpritePlacementEntry(1, [
	SpritePlacement(0x02C8, 0x38, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry501 = SpritePlacementEntry(5, [
	SpritePlacement(0x0526, 0x48, 0x78),
	SpritePlacement(0x060C, 0xB8, 0x40),
	SpritePlacement(0x060A, 0xB8, 0x58),
	SpritePlacement(0x044B, 0xB8, 0x90),
	SpritePlacement(0x044A, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry502 = SpritePlacementEntry(6, [
	SpritePlacement(0x02CD, 0x10, 0x38),
	SpritePlacement(0x02CB, 0x40, 0x40),
	SpritePlacement(0x02CC, 0x48, 0x20),
	SpritePlacement(0x02CA, 0x60, 0x28),
	SpritePlacement(0x02C9, 0x60, 0x50),
	SpritePlacement(0x00FE, 0xC8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry503 = SpritePlacementEntry(5, [
	SpritePlacement(0x0522, 0xC0, 0x68),
	SpritePlacement(0x0523, 0xD8, 0x48),
	SpritePlacement(0x0521, 0xE0, 0x90),
	SpritePlacement(0x0525, 0xF0, 0x28),
	SpritePlacement(0x0524, 0xF0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry504 = SpritePlacementEntry(1, [
	SpritePlacement(0x0588, 0xC8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry505 = SpritePlacementEntry(2, [
	SpritePlacement(0x04AC, 0x20, 0x80),
	SpritePlacement(0x04C5, 0x48, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry506 = SpritePlacementEntry(1, [
	SpritePlacement(0x0585, 0x18, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry507 = SpritePlacementEntry(4, [
	SpritePlacement(0x01C5, 0x00, 0x18),
	SpritePlacement(0x01C6, 0x00, 0x28),
	SpritePlacement(0x01C4, 0x10, 0x24),
	SpritePlacement(0x01C7, 0x10, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry508 = SpritePlacementEntry(1, [
	SpritePlacement(0x01A8, 0x18, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry509 = SpritePlacementEntry(1, [
	SpritePlacement(0x01A7, 0x28, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry510 = SpritePlacementEntry(4, [
	SpritePlacement(0x0229, 0xC8, 0x18),
	SpritePlacement(0x0228, 0xC8, 0x30),
	SpritePlacement(0x022A, 0xF0, 0x38),
	SpritePlacement(0x022B, 0xF8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry511 = SpritePlacementEntry(4, [
	SpritePlacement(0x0216, 0xB0, 0x38),
	SpritePlacement(0x0217, 0xB8, 0x48),
	SpritePlacement(0x0225, 0xC0, 0x58),
	SpritePlacement(0x0226, 0xC8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry512 = SpritePlacementEntry(1, [
	SpritePlacement(0x0237, 0x90, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry513 = SpritePlacementEntry(7, [
	SpritePlacement(0x0445, 0x50, 0xC0),
	SpritePlacement(0x0441, 0x68, 0xA8),
	SpritePlacement(0x0444, 0x70, 0xC0),
	SpritePlacement(0x0606, 0x88, 0x50),
	SpritePlacement(0x0607, 0xA0, 0x58),
	SpritePlacement(0x0442, 0xA0, 0x80),
	SpritePlacement(0x0608, 0xA8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry514 = SpritePlacementEntry(1, [
	SpritePlacement(0x0443, 0x78, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry515 = SpritePlacementEntry(2, [
	SpritePlacement(0x0104, 0x60, 0x98),
	SpritePlacement(0x0105, 0xA0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry516 = SpritePlacementEntry(1, [
	SpritePlacement(0x0446, 0xA0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry517 = SpritePlacementEntry(1, [
	SpritePlacement(0x014A, 0xF0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry518 = SpritePlacementEntry(2, [
	SpritePlacement(0x04C3, 0x58, 0xD0),
	SpritePlacement(0x04C4, 0x70, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry519 = SpritePlacementEntry(1, [
	SpritePlacement(0x049B, 0x38, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry520 = SpritePlacementEntry(1, [
	SpritePlacement(0x060D, 0x90, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry521 = SpritePlacementEntry(2, [
	SpritePlacement(0x0596, 0x58, 0x00),
	SpritePlacement(0x0231, 0x58, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry522 = SpritePlacementEntry(1, [
	SpritePlacement(0x022C, 0xE8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry523 = SpritePlacementEntry(2, [
	SpritePlacement(0x0239, 0xD0, 0x00),
	SpritePlacement(0x023C, 0xF0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry524 = SpritePlacementEntry(1, [
	SpritePlacement(0x0597, 0x40, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry525 = SpritePlacementEntry(9, [
	SpritePlacement(0x00F6, 0x80, 0x98),
	SpritePlacement(0x00F5, 0x80, 0xA8),
	SpritePlacement(0x00ED, 0x90, 0xE0),
	SpritePlacement(0x00EE, 0x90, 0xF8),
	SpritePlacement(0x00E7, 0xA0, 0x80),
	SpritePlacement(0x00EC, 0xB0, 0x58),
	SpritePlacement(0x00EB, 0xB0, 0xD0),
	SpritePlacement(0x00E9, 0xB8, 0xA0),
	SpritePlacement(0x00E8, 0xD0, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry526 = SpritePlacementEntry(7, [
	SpritePlacement(0x00F3, 0x80, 0x60),
	SpritePlacement(0x00EA, 0x98, 0x20),
	SpritePlacement(0x00F2, 0x98, 0x70),
	SpritePlacement(0x00F4, 0xB0, 0x40),
	SpritePlacement(0x00F0, 0xB0, 0xA0),
	SpritePlacement(0x00EF, 0xB8, 0xB8),
	SpritePlacement(0x00F1, 0xC8, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry527 = SpritePlacementEntry(4, [
	SpritePlacement(0x0114, 0x40, 0xB0),
	SpritePlacement(0x0111, 0x48, 0x70),
	SpritePlacement(0x0112, 0x48, 0xF0),
	SpritePlacement(0x0110, 0x68, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry528 = SpritePlacementEntry(2, [
	SpritePlacement(0x0113, 0x40, 0x18),
	SpritePlacement(0x010F, 0x88, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry529 = SpritePlacementEntry(2, [
	SpritePlacement(0x046C, 0x40, 0x90),
	SpritePlacement(0x046D, 0x50, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry530 = SpritePlacementEntry(1, [
	SpritePlacement(0x046B, 0x48, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry531 = SpritePlacementEntry(1, [
	SpritePlacement(0x00D2, 0x78, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry532 = SpritePlacementEntry(1, [
	SpritePlacement(0x030E, 0xE8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry533 = SpritePlacementEntry(1, [
	SpritePlacement(0x05D4, 0x78, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry534 = SpritePlacementEntry(1, [
	SpritePlacement(0x031A, 0xE8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry535 = SpritePlacementEntry(1, [
	SpritePlacement(0x05D3, 0x70, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry536 = SpritePlacementEntry(1, [
	SpritePlacement(0x05D6, 0xB0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry537 = SpritePlacementEntry(1, [
	SpritePlacement(0x049C, 0xF0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry538 = SpritePlacementEntry(1, [
	SpritePlacement(0x023E, 0xD0, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry539 = SpritePlacementEntry(4, [
	SpritePlacement(0x023D, 0x18, 0x18),
	SpritePlacement(0x022E, 0x30, 0x60),
	SpritePlacement(0x0230, 0x50, 0x68),
	SpritePlacement(0x022F, 0x80, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry540 = SpritePlacementEntry(1, [
	SpritePlacement(0x023F, 0xF0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry541 = SpritePlacementEntry(3, [
	SpritePlacement(0x0240, 0x28, 0x68),
	SpritePlacement(0x0206, 0xC0, 0x88),
	SpritePlacement(0x020B, 0xC0, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry542 = SpritePlacementEntry(1, [
	SpritePlacement(0x0233, 0x58, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry543 = SpritePlacementEntry(5, [
	SpritePlacement(0x0411, 0x78, 0x90),
	SpritePlacement(0x0412, 0x78, 0xF0),
	SpritePlacement(0x0414, 0xB0, 0x80),
	SpritePlacement(0x0415, 0xB0, 0xE0),
	SpritePlacement(0x040C, 0xD0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry544 = SpritePlacementEntry(3, [
	SpritePlacement(0x0413, 0x78, 0x50),
	SpritePlacement(0x040B, 0xA0, 0x20),
	SpritePlacement(0x0416, 0xB0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry545 = SpritePlacementEntry(1, [
	SpritePlacement(0x03FA, 0xD8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry546 = SpritePlacementEntry(3, [
	SpritePlacement(0x03F8, 0x40, 0x10),
	SpritePlacement(0x03FB, 0x40, 0x68),
	SpritePlacement(0x03F9, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry547 = SpritePlacementEntry(3, [
	SpritePlacement(0x0108, 0x40, 0xF0),
	SpritePlacement(0x0109, 0x58, 0x58),
	SpritePlacement(0x0103, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry548 = SpritePlacementEntry(2, [
	SpritePlacement(0x00DB, 0xD0, 0x78),
	SpritePlacement(0x0589, 0xD0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry549 = SpritePlacementEntry(1, [
	SpritePlacement(0x054E, 0xA8, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry550 = SpritePlacementEntry(1, [
	SpritePlacement(0x054C, 0xD8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry551 = SpritePlacementEntry(1, [
	SpritePlacement(0x05D2, 0xC8, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry552 = SpritePlacementEntry(1, [
	SpritePlacement(0x030A, 0x50, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry553 = SpritePlacementEntry(1, [
	SpritePlacement(0x060F, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry554 = SpritePlacementEntry(4, [
	SpritePlacement(0x0219, 0x08, 0xD8),
	SpritePlacement(0x0232, 0x48, 0x18),
	SpritePlacement(0x0208, 0x98, 0xF8),
	SpritePlacement(0x0205, 0xA8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry555 = SpritePlacementEntry(12, [
	SpritePlacement(0x0247, 0x10, 0x78),
	SpritePlacement(0x023A, 0x18, 0x50),
	SpritePlacement(0x0227, 0x20, 0xC0),
	SpritePlacement(0x021A, 0x28, 0x88),
	SpritePlacement(0x0245, 0x48, 0x78),
	SpritePlacement(0x0244, 0x48, 0x98),
	SpritePlacement(0x0238, 0x98, 0xE0),
	SpritePlacement(0x021B, 0xB8, 0xC0),
	SpritePlacement(0x020A, 0xC8, 0x48),
	SpritePlacement(0x0235, 0xC8, 0xB8),
	SpritePlacement(0x021D, 0xC8, 0xF0),
	SpritePlacement(0x021C, 0xD0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry556 = SpritePlacementEntry(3, [
	SpritePlacement(0x0248, 0x38, 0xA0),
	SpritePlacement(0x021E, 0xC0, 0x00),
	SpritePlacement(0x0236, 0xD0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry557 = SpritePlacementEntry(2, [
	SpritePlacement(0x0209, 0x60, 0xC0),
	SpritePlacement(0x0204, 0xD8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry558 = SpritePlacementEntry(2, [
	SpritePlacement(0x0234, 0x10, 0x70),
	SpritePlacement(0x0241, 0xE0, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry559 = SpritePlacementEntry(5, [
	SpritePlacement(0x03F6, 0xC0, 0xB8),
	SpritePlacement(0x03F3, 0xC8, 0xA0),
	SpritePlacement(0x03F7, 0xE0, 0x60),
	SpritePlacement(0x03F4, 0xE8, 0x30),
	SpritePlacement(0x03F5, 0xE8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry560 = SpritePlacementEntry(4, [
	SpritePlacement(0x0408, 0x38, 0xD0),
	SpritePlacement(0x0404, 0x78, 0x90),
	SpritePlacement(0x0403, 0x90, 0x80),
	SpritePlacement(0x0406, 0xB8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry561 = SpritePlacementEntry(3, [
	SpritePlacement(0x0407, 0x78, 0x10),
	SpritePlacement(0x0402, 0x80, 0x48),
	SpritePlacement(0x0405, 0x98, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry562 = SpritePlacementEntry(1, [
	SpritePlacement(0x0401, 0x88, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry563 = SpritePlacementEntry(7, [
	SpritePlacement(0x03E8, 0xC8, 0x40),
	SpritePlacement(0x03E4, 0xC8, 0xB0),
	SpritePlacement(0x03E7, 0xD8, 0x58),
	SpritePlacement(0x03E5, 0xD8, 0x88),
	SpritePlacement(0x03E6, 0xD8, 0xA0),
	SpritePlacement(0x03E9, 0xF0, 0x30),
	SpritePlacement(0x03EA, 0xF0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry564 = SpritePlacementEntry(1, [
	SpritePlacement(0x054B, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry565 = SpritePlacementEntry(2, [
	SpritePlacement(0x02F6, 0x00, 0xFC),
	SpritePlacement(0x030C, 0xA8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry566 = SpritePlacementEntry(1, [
	SpritePlacement(0x02F7, 0x10, 0x0C),
]);

immutable SpritePlacementEntry spritePlacementEntry567 = SpritePlacementEntry(2, [
	SpritePlacement(0x05D5, 0x50, 0x70),
	SpritePlacement(0x0300, 0x88, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry568 = SpritePlacementEntry(1, [
	SpritePlacement(0x030D, 0x80, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry569 = SpritePlacementEntry(1, [
	SpritePlacement(0x05D8, 0x58, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry570 = SpritePlacementEntry(1, [
	SpritePlacement(0x020D, 0xC0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry571 = SpritePlacementEntry(4, [
	SpritePlacement(0x0207, 0x30, 0x20),
	SpritePlacement(0x0598, 0x70, 0x98),
	SpritePlacement(0x0203, 0xA8, 0x68),
	SpritePlacement(0x0242, 0xA8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry572 = SpritePlacementEntry(1, [
	SpritePlacement(0x0218, 0x20, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry573 = SpritePlacementEntry(2, [
	SpritePlacement(0x0243, 0x70, 0xC0),
	SpritePlacement(0x0210, 0xE0, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry574 = SpritePlacementEntry(5, [
	SpritePlacement(0x0599, 0x88, 0xB8),
	SpritePlacement(0x023B, 0xB0, 0xF8),
	SpritePlacement(0x0211, 0xE8, 0x08),
	SpritePlacement(0x020E, 0xE8, 0x80),
	SpritePlacement(0x0212, 0xF8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry575 = SpritePlacementEntry(1, [
	SpritePlacement(0x022D, 0xB0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry576 = SpritePlacementEntry(9, [
	SpritePlacement(0x01E7, 0x40, 0x40),
	SpritePlacement(0x01E3, 0x40, 0x58),
	SpritePlacement(0x01E6, 0x50, 0xA8),
	SpritePlacement(0x01E5, 0x60, 0x70),
	SpritePlacement(0x01E4, 0x68, 0x48),
	SpritePlacement(0x03FF, 0xC0, 0x40),
	SpritePlacement(0x03FE, 0xC0, 0xB8),
	SpritePlacement(0x03FC, 0xC8, 0x70),
	SpritePlacement(0x03FD, 0xE0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry577 = SpritePlacementEntry(1, [
	SpritePlacement(0x01FC, 0xD0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry578 = SpritePlacementEntry(2, [
	SpritePlacement(0x01E8, 0x40, 0x30),
	SpritePlacement(0x0400, 0xD8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry579 = SpritePlacementEntry(7, [
	SpritePlacement(0x01F6, 0x58, 0x58),
	SpritePlacement(0x01ED, 0xD8, 0xD0),
	SpritePlacement(0x01EC, 0xE0, 0x98),
	SpritePlacement(0x01EE, 0xE0, 0xC0),
	SpritePlacement(0x01F1, 0xE8, 0x88),
	SpritePlacement(0x01EF, 0xF0, 0xB8),
	SpritePlacement(0x01F0, 0xF8, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry580 = SpritePlacementEntry(2, [
	SpritePlacement(0x01EA, 0x40, 0x88),
	SpritePlacement(0x01E9, 0x58, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry581 = SpritePlacementEntry(2, [
	SpritePlacement(0x01EB, 0x58, 0x08),
	SpritePlacement(0x01F2, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry582 = SpritePlacementEntry(1, [
	SpritePlacement(0x054D, 0x80, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry583 = SpritePlacementEntry(1, [
	SpritePlacement(0x054A, 0xB8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry584 = SpritePlacementEntry(1, [
	SpritePlacement(0x0304, 0xE0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry585 = SpritePlacementEntry(1, [
	SpritePlacement(0x0303, 0xC8, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry586 = SpritePlacementEntry(1, [
	SpritePlacement(0x030F, 0x80, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry587 = SpritePlacementEntry(1, [
	SpritePlacement(0x05D1, 0xA0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry588 = SpritePlacementEntry(2, [
	SpritePlacement(0x0318, 0xB0, 0x78),
	SpritePlacement(0x02F8, 0xC0, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry589 = SpritePlacementEntry(10, [
	SpritePlacement(0x0314, 0x30, 0xC0),
	SpritePlacement(0x0307, 0x38, 0xD0),
	SpritePlacement(0x02FB, 0x48, 0x80),
	SpritePlacement(0x02FA, 0x50, 0x70),
	SpritePlacement(0x0306, 0x50, 0xB0),
	SpritePlacement(0x02F9, 0x70, 0x58),
	SpritePlacement(0x02FC, 0x70, 0xD0),
	SpritePlacement(0x0309, 0x78, 0x90),
	SpritePlacement(0x0319, 0xE0, 0x20),
	SpritePlacement(0x031C, 0xE0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry590 = SpritePlacementEntry(2, [
	SpritePlacement(0x0498, 0xB8, 0x30),
	SpritePlacement(0x0499, 0xB8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry591 = SpritePlacementEntry(2, [
	SpritePlacement(0x021F, 0x58, 0xC0),
	SpritePlacement(0x0222, 0xE8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry592 = SpritePlacementEntry(3, [
	SpritePlacement(0x0220, 0xC8, 0x60),
	SpritePlacement(0x0221, 0xC8, 0x90),
	SpritePlacement(0x020C, 0xE0, 0xDC),
]);

immutable SpritePlacementEntry spritePlacementEntry593 = SpritePlacementEntry(6, [
	SpritePlacement(0x020F, 0x20, 0x90),
	SpritePlacement(0x0246, 0x88, 0x20),
	SpritePlacement(0x0213, 0x98, 0x10),
	SpritePlacement(0x0214, 0x98, 0x30),
	SpritePlacement(0x0215, 0xB8, 0x20),
	SpritePlacement(0x0223, 0xD8, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry594 = SpritePlacementEntry(3, [
	SpritePlacement(0x03EB, 0x58, 0x80),
	SpritePlacement(0x0417, 0xC0, 0x50),
	SpritePlacement(0x0418, 0xD8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry595 = SpritePlacementEntry(3, [
	SpritePlacement(0x0409, 0x48, 0x70),
	SpritePlacement(0x040A, 0x48, 0x90),
	SpritePlacement(0x0200, 0xD8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry596 = SpritePlacementEntry(3, [
	SpritePlacement(0x03EC, 0x60, 0x50),
	SpritePlacement(0x0419, 0xC8, 0x60),
	SpritePlacement(0x041A, 0xD0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry597 = SpritePlacementEntry(2, [
	SpritePlacement(0x040D, 0x40, 0x68),
	SpritePlacement(0x0201, 0xC8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry598 = SpritePlacementEntry(1, [
	SpritePlacement(0x03ED, 0x50, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry599 = SpritePlacementEntry(7, [
	SpritePlacement(0x040E, 0x58, 0x50),
	SpritePlacement(0x040F, 0x60, 0x98),
	SpritePlacement(0x0410, 0x68, 0xA8),
	SpritePlacement(0x01FA, 0xC0, 0x68),
	SpritePlacement(0x01F9, 0xC8, 0xA8),
	SpritePlacement(0x01F8, 0xC8, 0xC0),
	SpritePlacement(0x01FB, 0xF0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry600 = SpritePlacementEntry(1, [
	SpritePlacement(0x0301, 0x68, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry601 = SpritePlacementEntry(1, [
	SpritePlacement(0x0316, 0xF8, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry602 = SpritePlacementEntry(1, [
	SpritePlacement(0x05D7, 0x70, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry603 = SpritePlacementEntry(4, [
	SpritePlacement(0x02FD, 0xB8, 0x70),
	SpritePlacement(0x02FE, 0xB8, 0x88),
	SpritePlacement(0x02FF, 0xB8, 0xA0),
	SpritePlacement(0x030B, 0xD8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry604 = SpritePlacementEntry(1, [
	SpritePlacement(0x0224, 0x08, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry605 = SpritePlacementEntry(1, [
	SpritePlacement(0x0308, 0xE8, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry606 = SpritePlacementEntry(1, [
	SpritePlacement(0x0501, 0x20, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry607 = SpritePlacementEntry(4, [
	SpritePlacement(0x04FF, 0x40, 0x10),
	SpritePlacement(0x04FE, 0x40, 0x20),
	SpritePlacement(0x04FD, 0x48, 0x1C),
	SpritePlacement(0x0500, 0x48, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry608 = SpritePlacementEntry(3, [
	SpritePlacement(0x01F3, 0xC0, 0x50),
	SpritePlacement(0x01F5, 0xD0, 0xB8),
	SpritePlacement(0x01F4, 0xE8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry609 = SpritePlacementEntry(4, [
	SpritePlacement(0x01B5, 0x40, 0x48),
	SpritePlacement(0x01B6, 0x40, 0x80),
	SpritePlacement(0x01B4, 0x50, 0x58),
	SpritePlacement(0x0202, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry610 = SpritePlacementEntry(3, [
	SpritePlacement(0x03EE, 0x60, 0x50),
	SpritePlacement(0x03EF, 0x68, 0x7C),
	SpritePlacement(0x01F7, 0xC8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry611 = SpritePlacementEntry(1, [
	SpritePlacement(0x01FF, 0xD0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry612 = SpritePlacementEntry(3, [
	SpritePlacement(0x03F0, 0x48, 0x68),
	SpritePlacement(0x03F1, 0x58, 0x30),
	SpritePlacement(0x03F2, 0x68, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry613 = SpritePlacementEntry(2, [
	SpritePlacement(0x01FE, 0x48, 0x70),
	SpritePlacement(0x01FD, 0xC0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry614 = SpritePlacementEntry(1, [
	SpritePlacement(0x0305, 0x10, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry615 = SpritePlacementEntry(1, [
	SpritePlacement(0x0317, 0x40, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry616 = SpritePlacementEntry(1, [
	SpritePlacement(0x02F2, 0x60, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry617 = SpritePlacementEntry(8, [
	SpritePlacement(0x02F5, 0x08, 0x30),
	SpritePlacement(0x0310, 0x10, 0x08),
	SpritePlacement(0x0312, 0x10, 0x58),
	SpritePlacement(0x0311, 0x10, 0xA0),
	SpritePlacement(0x02F3, 0x18, 0x58),
	SpritePlacement(0x02F4, 0x30, 0x38),
	SpritePlacement(0x0313, 0x38, 0x78),
	SpritePlacement(0x0315, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry618 = SpritePlacementEntry(1, [
	SpritePlacement(0x0249, 0xC0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry619 = SpritePlacementEntry(5, [
	SpritePlacement(0x031B, 0x10, 0x90),
	SpritePlacement(0x0302, 0x18, 0x88),
	SpritePlacement(0x024B, 0xC0, 0xB8),
	SpritePlacement(0x024A, 0xE8, 0x00),
	SpritePlacement(0x024C, 0xE8, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry620 = SpritePlacementEntry(1, [
	SpritePlacement(0x024D, 0xC0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry621 = SpritePlacementEntry(1, [
	SpritePlacement(0x015C, 0xC0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry622 = SpritePlacementEntry(1, [
	SpritePlacement(0x015D, 0xE8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry623 = SpritePlacementEntry(7, [
	SpritePlacement(0x01DF, 0x28, 0xD8),
	SpritePlacement(0x01E0, 0x30, 0x68),
	SpritePlacement(0x01E2, 0x30, 0x68),
	SpritePlacement(0x01DE, 0x38, 0x40),
	SpritePlacement(0x01E1, 0x40, 0x38),
	SpritePlacement(0x01DD, 0x50, 0x80),
	SpritePlacement(0x0159, 0xE8, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry624 = SpritePlacementEntry(1, [
	SpritePlacement(0x0158, 0xC0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry625 = SpritePlacementEntry(2, [
	SpritePlacement(0x015B, 0xC0, 0x80),
	SpritePlacement(0x015A, 0xE8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry626 = SpritePlacementEntry(21, [
	SpritePlacement(0x01DC, 0x60, 0x70),
	SpritePlacement(0x01D2, 0x70, 0x9C),
	SpritePlacement(0x01CD, 0x78, 0x28),
	SpritePlacement(0x01CF, 0x78, 0x7C),
	SpritePlacement(0x01CE, 0x80, 0x30),
	SpritePlacement(0x01CC, 0x88, 0x18),
	SpritePlacement(0x01C8, 0x98, 0x88),
	SpritePlacement(0x01D1, 0x98, 0x8C),
	SpritePlacement(0x01D0, 0x98, 0xBC),
	SpritePlacement(0x01D3, 0xA8, 0x5C),
	SpritePlacement(0x01C9, 0xA8, 0x68),
	SpritePlacement(0x01D4, 0xA8, 0xB4),
	SpritePlacement(0x01D5, 0xB0, 0x4C),
	SpritePlacement(0x01CB, 0xB0, 0x98),
	SpritePlacement(0x01DB, 0xB8, 0x18),
	SpritePlacement(0x01CA, 0xB8, 0x80),
	SpritePlacement(0x01D6, 0xB8, 0x94),
	SpritePlacement(0x01D7, 0xC0, 0x6C),
	SpritePlacement(0x01DA, 0xD8, 0x64),
	SpritePlacement(0x01D8, 0xD8, 0xCC),
	SpritePlacement(0x01D9, 0xE0, 0x9C),
]);

/// $CF8985
immutable NPC[1584] npcConfig = [
	NPC(NPCType.person, OverworldSprite.ness, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.skatePunk, Direction.down, ActionScript.animMapObjTBack, EventFlag.onetGuardSharkDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0001", null),
	NPC(NPCType.person, OverworldSprite.skatePunk, Direction.right, ActionScript.walkTowardsPlayer, EventFlag.onetSharkCDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0002", null),
	NPC(NPCType.person, OverworldSprite.skatePunk, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0003", null),
	NPC(NPCType.person, OverworldSprite.skatePunk, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0004", null),
	NPC(NPCType.person, OverworldSprite.skatePunk, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0005", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0006", null),
	NPC(NPCType.person, OverworldSprite.skatePunk, Direction.up, ActionScript.walkTowardsPlayer, EventFlag.onetShark2FDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0007", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0008", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0009", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0010", null),
	NPC(NPCType.person, OverworldSprite.dog, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0011", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.mom, Direction.down, ActionScript.mom1, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOn, "textNPC0014", null),
	NPC(NPCType.person, OverworldSprite.mom, Direction.right, ActionScript.animPeopleWalk1, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0015", null),
	NPC(NPCType.person, OverworldSprite.nessDogSleeping, Direction.down, ActionScript.animPeopleSleep, EventFlag.dog, NPCConfigFlagStyle.showIfOff, "textNPC0016", null),
	NPC(NPCType.person, OverworldSprite.pokey, Direction.left, ActionScript.animPeopleWalk0, EventFlag.myHomePokeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0017", null),
	NPC(NPCType.person, OverworldSprite.king, Direction.right, ActionScript.king1, EventFlag.dogLaterAppear, NPCConfigFlagStyle.showIfOn, "textNPC0016", null),
	NPC(NPCType.person, OverworldSprite.pokey, Direction.down, ActionScript.pokey1, EventFlag.myHomePokey2Appear, NPCConfigFlagStyle.showIfOn, "textNPC0017", null),
	NPC(NPCType.person, OverworldSprite.tracy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.myHome1FTracyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0020", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.homeTelephone, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0021", null),
	NPC(NPCType.object, OverworldSprite.knockingOnDoor, Direction.left, ActionScript.animKnockDoor, EventFlag.myHomeKnockAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.drapesClosed, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.drapesClosed, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.tracy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.kaidanTracyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0025", null),
	NPC(NPCType.object, OverworldSprite.nessSleeping, Direction.down, ActionScript.sleepingNess, EventFlag.myhomeSleepNesAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.zzz, Direction.down, ActionScript.sleepEmote, EventFlag.myhomeSleepNesAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.drapesClosed, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesClosed, Direction.left, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.tracy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.myHomeTracyDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0030", null),
	NPC(NPCType.object, OverworldSprite.drapesClosed, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesClosed, Direction.right, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.waitress, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0033", null),
	NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0034", null),
	NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0035", null),
	NPC(NPCType.person, OverworldSprite.frank, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0036", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0037", null),
	NPC(NPCType.person, OverworldSprite.frank, Direction.right, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.hintGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "textNPC0039", null),
	NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0040", null),
	NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0041", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0042", null),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0043", null),
	NPC(NPCType.person, OverworldSprite.aloysiusMinch, Direction.down, ActionScript.animMapObjTBack, EventFlag.onetMincesAppear, NPCConfigFlagStyle.showIfOn, "textNPC0044", null),
	NPC(NPCType.person, OverworldSprite.lardnaMinch, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.onetLardnaAppear, NPCConfigFlagStyle.showIfOn, "textNPC0045", null),
	NPC(NPCType.person, OverworldSprite.fly, Direction.down, ActionScript.animPeopleWalk0, EventFlag.onetMyHomeBunbunAppear, NPCConfigFlagStyle.showIfOn, "textNPC0046", null),
	NPC(NPCType.person, OverworldSprite.picky, Direction.down, ActionScript.animPeopleWalk1, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0047", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0048", null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.pokey, Direction.left, ActionScript.animPeopleWalk1, EventFlag.onet2FPokeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0052", null),
	NPC(NPCType.person, OverworldSprite.picky, Direction.up, ActionScript.animPeopleTBack, EventFlag.onet2FPickeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0053", null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.yellowDrapesClosed, Direction.left, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0058", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0059", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.down, ActionScript.animPeopleWalk0, EventFlag.unknown0106, NPCConfigFlagStyle.showIfOff, "textNPC0062", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.unknown0106, NPCConfigFlagStyle.showIfOff, "textNPC0063", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.left, ActionScript.animPeopleWalk0, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0064", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.right, ActionScript.animPeopleWalk1, EventFlag.unknown0106, NPCConfigFlagStyle.showIfOn, "textNPC0065", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.unknown0106, NPCConfigFlagStyle.showIfOn, "textNPC0066", null),
	NPC(NPCType.person, OverworldSprite.captainStrong, Direction.down, ActionScript.animMapObjTBack, EventFlag.policeStrongDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0067", null),
	NPC(NPCType.person, OverworldSprite.thickGlassesLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0068", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0069", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animMapObjTBack, EventFlag.policeKanbanCopAppear, NPCConfigFlagStyle.showIfOn, "textNPC0070", null),
	NPC(NPCType.person, OverworldSprite.captainStrong, Direction.right, ActionScript.animMapObjTBack, EventFlag.policeStrongBAppear, NPCConfigFlagStyle.showIfOn, "textNPC0067", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0072", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animMapObjStill, EventFlag.onetCopADisappear, NPCConfigFlagStyle.showIfOff, "textNPC0073", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animMapObjStill, EventFlag.onetCopBDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0074", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animMapObjStill, EventFlag.onetCopCDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0075", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.right, ActionScript.animMapObjStill, EventFlag.onetCopDDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0076", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.right, ActionScript.animMapObjStill, EventFlag.onetCopEDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0077", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0078", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0079", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0080", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0081", null),
	NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0082", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0083", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0084", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0085", null),
	NPC(NPCType.person, OverworldSprite.mayorPirkle, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0086", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0087", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0088", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0089", null),
	NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0090", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0091", null),
	NPC(NPCType.person, OverworldSprite.kidInDerbyHat, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0092", null),
	NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0093", null),
	NPC(NPCType.person, OverworldSprite.exitMouseNoSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0094", null),
	NPC(NPCType.person, OverworldSprite.exitMouse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.itemEscapeMouse, NPCConfigFlagStyle.showIfOff, "textNPC0095", null),
	NPC(NPCType.person, OverworldSprite.exitMouse, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0096", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0097", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0098", "textNPC0098Alt"),
	NPC(NPCType.person, OverworldSprite.oldFatGuyWithHat, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0099", null),
	NPC(NPCType.person, OverworldSprite.shyGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0100", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.up, ActionScript.unknown250, EventFlag.libraryToilet, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0102", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0103", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0104", null),
	NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.up, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0105", "textNPC0105Alt"),
	NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textDoor681", "textNPC0106Alt"),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0107", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0108", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0109", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0110", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0111", null),
	NPC(NPCType.person, OverworldSprite.bigSmileLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0112", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0113", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0114", null),
	NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0115", null),
	NPC(NPCType.person, OverworldSprite.happyGirlInRed, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0116", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0117", null),
	NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0118", null),
	NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.animMapObjStill, EventFlag._1fMizunoAppear, NPCConfigFlagStyle.showIfOn, "textNPC0119", null),
	NPC(NPCType.person, OverworldSprite.kidInDerbyHat, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0120", null),
	NPC(NPCType.person, OverworldSprite.kidInDetectiveHat, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0121", null),
	NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.left, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0122", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown863, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.pickySitting, Direction.left, ActionScript.unknown055, EventFlag.insekiPickeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0124", null),
	NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.down, ActionScript.animMapObjStill, EventFlag.onetAmbrami, NPCConfigFlagStyle.showIfOff, "textNPC0125", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleWalk0, EventFlag.onetKanbanCopAppear, NPCConfigFlagStyle.showIfOn, "textNPC0126", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.left, ActionScript.unknown607, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0127", null),
	NPC(NPCType.person, OverworldSprite.travellingEntertainer, Direction.down, ActionScript.unknown608, EventFlag.itemPretz, NPCConfigFlagStyle.showIfOff, "textNPC0128", "textNPC0128Alt"),
	NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.right, ActionScript.unknown607, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0129", null),
	NPC(NPCType.person, OverworldSprite.helpfulMole, Direction.down, ActionScript.animPeopleTBack, EventFlag.onetDoorClose, NPCConfigFlagStyle.showIfOff, "textNPC0130", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.left, ActionScript.unknown607, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0131", null),
	NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.right, ActionScript.unknown607, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0132", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.right, ActionScript.unknown608, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0133", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.left, ActionScript.unknown609, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0134", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.right, ActionScript.unknown609, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0135", null),
	NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.left, ActionScript.unknown609, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0136", null),
	NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.down, ActionScript.unknown607, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0137", null),
	NPC(NPCType.person, OverworldSprite.dog, Direction.down, ActionScript.unknown608, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "textNPC0138", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.unknown610, EventFlag.gotCapeEstate, NPCConfigFlagStyle.showIfOff, "textNPC0139", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.right, ActionScript.unknown607, EventFlag.gotCapeEstate, NPCConfigFlagStyle.showIfOn, "textNPC0140", null),
	NPC(NPCType.person, OverworldSprite.trumpetPerson, Direction.left, ActionScript.animPeopleTBack, EventFlag.onetDoorClose, NPCConfigFlagStyle.showIfOff, "textNPC0141", null),
	NPC(NPCType.person, OverworldSprite.skatePunk, Direction.down, ActionScript.animPeopleTBack, EventFlag.onetSharkADisappear, NPCConfigFlagStyle.showIfOff, "textNPC0142", null),
	NPC(NPCType.person, OverworldSprite.skatePunk, Direction.up, ActionScript.unknown609, EventFlag.onetSharkBDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0143", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.up, ActionScript.animPeopleTBack, EventFlag.tlptTwsn, NPCConfigFlagStyle.showIfOff, "textNPC0144", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptTwsn, NPCConfigFlagStyle.showIfOff, "textNPC0145", null),
	NPC(NPCType.person, OverworldSprite.frank, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.infoXyz, NPCConfigFlagStyle.showIfOff, "textNPC0146", null),
	NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animBillboard, EventFlag.openTabigoya, NPCConfigFlagStyle.showIfOff, "textDoor006", "textNPC0147Alt"),
	NPC(NPCType.person, OverworldSprite.mom, Direction.down, ActionScript.animMapObjStill, EventFlag.genkanMamaAppear, NPCConfigFlagStyle.showIfOn, "textNPC0148", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.left, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0149", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.right, ActionScript.animMapObjStill, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0150", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.up, ActionScript.animMapObjTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0151", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0152", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleWalk1, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0153", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0154", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0155", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0156", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0157", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.up, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0158", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animMapObjTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0159", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.up, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0160", null),
	NPC(NPCType.person, OverworldSprite.pokey, Direction.up, ActionScript.unknown629, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0161", null),
	NPC(NPCType.person, OverworldSprite.travellingEntertainer, Direction.right, ActionScript.unknown608, EventFlag.itemPretz, NPCConfigFlagStyle.showIfOff, "textNPC0162", "textNPC0128Alt"),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winFrank, NPCConfigFlagStyle.showIfOff, "textNPC0163", null),
	NPC(NPCType.person, OverworldSprite.captainStrong, Direction.left, ActionScript.animMapObjStill, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animPeopleWalk0, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.happyGirlInRed, Direction.up, ActionScript.animPeopleTBack, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, "textNPC0166", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.left, ActionScript.animPeopleTBack, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, "textNPC0167", null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.whiteDeliveryTruck, Direction.left, ActionScript.unknown585, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.deliveryTruck, Direction.left, ActionScript.unknown586, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.unknown862, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.dontEnterSign, Direction.down, ActionScript.animBillboard, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0185", null),
	NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.unknown584, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.insekiStopperAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.insekiStopperAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0191", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0192", null),
	NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.meteor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textDoor150", null),
	NPC(NPCType.object, OverworldSprite.policeCar, Direction.right, ActionScript.animPeopleWalk0, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.policeCar, Direction.left, ActionScript.animPeopleWalk0, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.policeCar, Direction.right, ActionScript.animPeopleWalk0, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.frankysteinMarkII, Direction.down, ActionScript.animMapObjStill, EventFlag.winFrank, NPCConfigFlagStyle.showIfOff, "textNPC0202", null),
	NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.unknown057, EventFlag.b1MizunoAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.unknown058, EventFlag.b2MizunoAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.unknown059, EventFlag.b3mizunoAAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.unknown060, EventFlag.b3mizunoBAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.up, ActionScript.animMapObjTBack, EventFlag.b4mizunoAppear, NPCConfigFlagStyle.showIfOn, "textNPC0207", null),
	NPC(NPCType.object, OverworldSprite.evilManiMani, Direction.down, ActionScript.animPeopleWalk0, EventFlag.tlptTwsn, NPCConfigFlagStyle.showIfOff, "textNPC0208", null),
	NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winGianBoss, NPCConfigFlagStyle.showIfOff, "textNPC0209", null),
	NPC(NPCType.person, OverworldSprite.kingInTheFlashback, Direction.right, ActionScript.unknown699, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.pastBabyCradle, Direction.down, ActionScript.unknown694, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0212", null),
	NPC(NPCType.person, OverworldSprite.paulasMother, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0213", null),
	NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0214", null),
	NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0215", null),
	NPC(NPCType.person, OverworldSprite.happyGirlInRed, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0216", null),
	NPC(NPCType.person, OverworldSprite.paulasFather, Direction.right, ActionScript.unknown221, EventFlag.twsnPaulUpset, NPCConfigFlagStyle.showIfOff, "textNPC0217", null),
	NPC(NPCType.person, OverworldSprite.cat, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0218", null),
	NPC(NPCType.person, OverworldSprite.paula, Direction.right, ActionScript.animPeopleWalk1, EventFlag.twsnPolaAppear, NPCConfigFlagStyle.showIfOn, "textNPC0219", null),
	NPC(NPCType.person, OverworldSprite.orangeKid, Direction.down, ActionScript.animMapObjStill, EventFlag.twsnChaosAppleAppear, NPCConfigFlagStyle.showIfOff, "textNPC0220", null),
	NPC(NPCType.person, OverworldSprite.appleKid, Direction.right, ActionScript.unknown014, EventFlag.twsnAppleDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0221", null),
	NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.unknown014, EventFlag.twsnAppleDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0222", null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.tools, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.can, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0041, NPCConfigFlagStyle.showIfOff, "textNPC0226", "textNPC0226Alt"),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0227", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0041, NPCConfigFlagStyle.showIfOn, "textNPC0228", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.right, ActionScript.animMapObjStill, EventFlag.twsnTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, "textNPC0229", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0230", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.left, ActionScript.unknown108, EventFlag.twsnMichikoAppear, NPCConfigFlagStyle.showIfOn, "textNPC0229", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0232", null),
	NPC(NPCType.person, OverworldSprite.kidInDetectiveHat, Direction.right, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0233", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.up, ActionScript.animMapObjTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0234", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0235", null),
	NPC(NPCType.person, OverworldSprite.mrT, Direction.right, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0236", null),
	NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0237", null),
	NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0238", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.left, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0239", null),
	NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0240", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.right, ActionScript.animMapObjTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0241", null),
	NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.left, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0242", null),
	NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.left, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0243", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0244", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.left, ActionScript.animMapObjTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0245", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.right, ActionScript.animMapObjTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "textNPC0246", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.up, ActionScript.animPeopleWalk0, EventFlag.twsnMichikoAppear, NPCConfigFlagStyle.showIfOff, "textNPC0247", null),
	NPC(NPCType.person, OverworldSprite.gorgeous, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "textNPC0248", "textNPC0248Alt"),
	NPC(NPCType.person, OverworldSprite.lucky, Direction.left, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "textNPC0249", "textNPC0249Alt"),
	NPC(NPCType.person, OverworldSprite.runawayFiveDrummer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "textNPC0250", "textNPC0250Alt"),
	NPC(NPCType.person, OverworldSprite.runawayFiveBassPlayer, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "textNPC0251", "textNPC0251Alt"),
	NPC(NPCType.person, OverworldSprite.runawayFiveSaxPlayer, Direction.right, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "textNPC0252", "textNPC0252Alt"),
	NPC(NPCType.person, OverworldSprite.poochyfud, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0253", "textNPC0253Alt"),
	NPC(NPCType.person, OverworldSprite.everdred, Direction.left, ActionScript.animPeopleWalk1, EventFlag.twsnTonchikiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0254", null),
	NPC(NPCType.person, OverworldSprite.girlInStripedApron, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0255", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0256", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0257", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.right, ActionScript.animMapObjTBack, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0260", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0261", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0262", null),
	NPC(NPCType.object, OverworldSprite.littleMushroom, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0264", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0265", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0266", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0267", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0268", "textNPC0268Alt"),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0269", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0270", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0271", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0272", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0273", null),
	NPC(NPCType.person, OverworldSprite.busDriver, Direction.left, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0274", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.venusMother, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0277", null),
	NPC(NPCType.person, OverworldSprite.hintGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "textNPC0278", null),
	NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0279", null),
	NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "textNPC0279", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "textNPC0281", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "textNPC0282", null),
	NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0283", null),
	NPC(NPCType.person, OverworldSprite.cat, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0218", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0285", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.thickGlassesLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0288", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0289", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0290", null),
	NPC(NPCType.person, OverworldSprite.waitress, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0291", null),
	NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0292", null),
	NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0293", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0294", null),
	NPC(NPCType.person, OverworldSprite.thickGlassesLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0295", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0296", null),
	NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0297", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0298", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0299", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0300", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0301", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0303", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0304", null),
	NPC(NPCType.person, OverworldSprite.kidInDetectiveHat, Direction.left, ActionScript.unknown017, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0305", null),
	NPC(NPCType.person, OverworldSprite.mrT, Direction.left, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0306", null),
	NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.left, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0307", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0308", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0309", null),
	NPC(NPCType.person, OverworldSprite.dog, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0310", null),
	NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0311", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0312", null),
	NPC(NPCType.person, OverworldSprite.shyGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0313", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0314", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0315", null),
	NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0316", null),
	NPC(NPCType.person, OverworldSprite.arabMrT, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0317", null),
	NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0318", null),
	NPC(NPCType.person, OverworldSprite.orangeKid, Direction.down, ActionScript.animMapObjStill, EventFlag.twsnChaosAppleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0319", null),
	NPC(NPCType.person, OverworldSprite.gorgeous, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, "textNPC0320", null),
	NPC(NPCType.person, OverworldSprite.paulasFather, Direction.down, ActionScript.animPeopleWalk0, EventFlag.twsnPaulUpset, NPCConfigFlagStyle.showIfOn, "textNPC0217", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0322", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animMapObjStill, EventFlag.twsnMessengerAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.mrT, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0324", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0325", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0326", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.right, ActionScript.animMapObjTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0327", null),
	NPC(NPCType.person, OverworldSprite.gorgeous, Direction.right, ActionScript.animMapObjTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0328", null),
	NPC(NPCType.person, OverworldSprite.lucky, Direction.down, ActionScript.animMapObjTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0329", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animMapObjTBack, EventFlag.tlptThrk , NPCConfigFlagStyle.showIfOff, "textNPC0330", null),
	NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.right, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0331", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.left, ActionScript.animPeopleTBack, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "textNPC0332", null),
	NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.right, ActionScript.animPeopleTBack, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "textNPC0333", null),
	NPC(NPCType.person, OverworldSprite.everdred, Direction.right, ActionScript.unknown647, EventFlag.twsnTonchikiRDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.animPeopleWalk1, EventFlag.twsnChaosAppleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0335", null),
	NPC(NPCType.person, OverworldSprite.appleKid, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnChaosAppleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0336", null),
	NPC(NPCType.person, OverworldSprite.catAsleep, Direction.down, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0338", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0339", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.left, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0340", null),
	NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.down, ActionScript.unknown016, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "textNPC0341", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0342", null),
	NPC(NPCType.person, OverworldSprite.helpfulMole, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0343", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown087, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown088, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown089, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown090, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown085, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown086, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0352", null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.crossroadSigns, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0356", null),
	NPC(NPCType.person, OverworldSprite.guyInCoolRedCar, Direction.right, ActionScript.unknown588, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0357", null),
	NPC(NPCType.object, OverworldSprite.whiteDeliveryTruck, Direction.right, ActionScript.unknown589, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.bicycle, Direction.down, ActionScript.unknown864, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.unknown590, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.appleKidSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0361", null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.orangeKidSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0365", null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.unknown867, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0367", null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.burglinParkSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0369", null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.bananas, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.bananas, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.runaway5Bus, Direction.left, ActionScript.animMapObjStill, EventFlag.twsnTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, "textNPC0373", null),
	NPC(NPCType.object, OverworldSprite.runaway5Bus, Direction.down, ActionScript.animMapObjStill, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "textNPC0373", null),
	NPC(NPCType.object, OverworldSprite.evilManiMani, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0375", null),
	NPC(NPCType.person, OverworldSprite.mrCarpainter, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0376", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0377", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0378", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0379", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0380", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0381", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0382", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0383", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0384", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.happyUpright1Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0385", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.happyUpright2Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0386", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.happyUpright3Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0387", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.happyUpright4Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0388", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistEast, EventFlag.happyUpright5Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0389", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistWest, EventFlag.happyUpright6Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0390", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistSouth, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0391", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistNortheast, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0392", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistNorthwest, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0393", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "textNPC0394", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "textNPC0395", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "textNPC0396", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0397", null),
	NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0398", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.up, ActionScript.animPeopleTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0399", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.up, ActionScript.animPeopleTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0400", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animMapObjTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0401", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0402", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0403", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0404", null),
	NPC(NPCType.person, OverworldSprite.venusMother, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0405", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0408", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0409", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0410", null),
	NPC(NPCType.person, OverworldSprite.pokey, Direction.down, ActionScript.animMapObjStill, EventFlag.happyPokeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0411", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.up, ActionScript.animMapObjTBack, EventFlag.happyWinGuard, NPCConfigFlagStyle.showIfOff, "textNPC0412", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0413", null),
	NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0414", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0415", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0416", null),
	NPC(NPCType.person, OverworldSprite.trumpetPerson, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0417", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0418", null),
	NPC(NPCType.person, OverworldSprite.blueCow, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0419", "textNPC0419Alt"),
	NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.up, ActionScript.unknown134, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0420", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0421", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0422", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0423", null),
	NPC(NPCType.person, OverworldSprite.shyGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0424", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0265", null),
	NPC(NPCType.person, OverworldSprite.mrCarpainter, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0426", null),
	NPC(NPCType.person, OverworldSprite.helpfulMole, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0427", null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.bicycle, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0432", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0433", null),
	NPC(NPCType.object, OverworldSprite.bananas, Direction.down, ActionScript.animMapObjStill, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0435", null),
	NPC(NPCType.person, OverworldSprite.cellDoor, Direction.down, ActionScript.animMapObjStill, EventFlag.polaGrfd, NPCConfigFlagStyle.showIfOff, "textNPC0436", "textNPC0436Alt"),
	NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.unknown240, EventFlag.polaGrfd, NPCConfigFlagStyle.showIfOff, "textNPC0436", null),
	NPC(NPCType.object, OverworldSprite.teddyBearParty, Direction.right, ActionScript.animMapObjStill, EventFlag.polaGrfd, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.pokey, Direction.up, ActionScript.unknown273, EventFlag.grfdPokeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0439", null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.up, ActionScript.animPeopleWalk0, EventFlag.grfdPokeyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.up, ActionScript.animPeopleWalk0, EventFlag.grfdPokeyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.spitefulCrow, Direction.up, ActionScript.animPeopleWalk0, EventFlag.grfdPokeyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.left, ActionScript.animPeopleTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "textNPC0443", null),
	NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0444", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "textNPC0445", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown865, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown866, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.helpfulMole, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0448", null),
	NPC(NPCType.object, OverworldSprite.crossroadSigns, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0449", null),
	NPC(NPCType.object, OverworldSprite.pencilStatue, Direction.down, ActionScript.unknown107, EventFlag.grfdLlptTacoDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0450", "textNPC0450Alt"),
	NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winLlptBoss, NPCConfigFlagStyle.showIfOff, "textNPC0451", null),
	NPC(NPCType.person, OverworldSprite.nessLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.poo, Direction.left, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.down, ActionScript.animPeopleTBack, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOff, "textNPC0456", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.thrkOzisanDDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0457", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.up, ActionScript.animMapObjTBack, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOff, "textNPC0458", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.left, ActionScript.animPeopleTBack, EventFlag.thrkOzisanDDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0459", null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0460", null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0461", null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0462", null),
	NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0463", null),
	NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0464", null),
	NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0460", null),
	NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0461", null),
	NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0463", null),
	NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0463", null),
	NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0462", null),
	NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0470", null),
	NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0471", null),
	NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0472", null),
	NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0463", null),
	NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0474", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animPeopleTBack, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "textNPC0475", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "textNPC0476", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.up, ActionScript.animPeopleTBack, EventFlag.thrkFixedSkyWAppear, NPCConfigFlagStyle.showIfOn, "textNPC0477", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.thrkFixedSkyWAppear, NPCConfigFlagStyle.showIfOn, "textNPC0478", null),
	NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkPrisonOpen, NPCConfigFlagStyle.showIfOff, "textDoor340", "textNPC0479Alt"),
	NPC(NPCType.object, OverworldSprite.shadow, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkFixedSkyWAppear, NPCConfigFlagStyle.showIfOn, "textNPC0480", null),
	NPC(NPCType.object, OverworldSprite.brokenPhaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkBrokenSkyWAppear, NPCConfigFlagStyle.showIfOn, "textNPC0481", null),
	NPC(NPCType.object, OverworldSprite.skyRunner, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkFixedSkyWAppear, NPCConfigFlagStyle.showIfOn, "textNPC0480", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animMapObjTBack, EventFlag.thrkHotelManDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0483", null),
	NPC(NPCType.person, OverworldSprite.zombieLady, Direction.right, ActionScript.unknown078, EventFlag.thrkBikiniZombiFAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0485", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0486", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.zombieLady, Direction.right, ActionScript.unknown079, EventFlag.thrkBikiniZombiPAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.left, ActionScript.animPeopleWalk0, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0490", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkHotelBoyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0491", null),
	NPC(NPCType.person, OverworldSprite.zombieLady, Direction.right, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.down, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.right, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.right, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.right, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.zombieDog, Direction.right, ActionScript.animMapObjStill, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0498", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0499", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0500", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0501", null),
	NPC(NPCType.person, OverworldSprite.shyGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0502", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0503", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0504", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0505", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.girlInStripedApron, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0255", null),
	NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0509", null),
	NPC(NPCType.person, OverworldSprite.hintGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "textNPC0510", null),
	NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.tlptFour, NPCConfigFlagStyle.showIfOn, "textNPC0511", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0512", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.down, ActionScript.animPeopleWalk1, EventFlag.tlptFour, NPCConfigFlagStyle.showIfOff, "textNPC0513", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.tlptFour, NPCConfigFlagStyle.showIfOff, "textNPC0514", null),
	NPC(NPCType.person, OverworldSprite.shyGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0515", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0516", null),
	NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.right, ActionScript.animPeopleWalk1, EventFlag.thrkPeopleDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0517", null),
	NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.up, ActionScript.unknown016, EventFlag.thrkPeopleDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0518", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOff, "textNPC0519", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.gpftMinigeppuADisappear, NPCConfigFlagStyle.showIfOff, "textNPC0520", null),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.up, ActionScript.animPeopleWalk1, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "textNPC0521", null),
	NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.tlptFour, NPCConfigFlagStyle.showIfOff, "textNPC0522", null),
	NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0523", null),
	NPC(NPCType.person, OverworldSprite.dog, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0524", null),
	NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.thrkPeopleDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0525", null),
	NPC(NPCType.person, OverworldSprite.oldFatGuyWithHat, Direction.right, ActionScript.animMapObjTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0526", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "textNPC0527", null),
	NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.right, ActionScript.animMapObjTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0528", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0529", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.up, ActionScript.animPeopleTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0530", null),
	NPC(NPCType.person, OverworldSprite.boogeyTentEye, Direction.down, ActionScript.unknown592, EventFlag.thrkMaTentAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.boogeyTentEye, Direction.right, ActionScript.unknown592, EventFlag.thrkMaTentAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.boogeyTentMouth, Direction.down, ActionScript.unknown591, EventFlag.thrkMaTentAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.right, ActionScript.unknown758, EventFlag.thrkGraveZombiDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0534", null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.up, ActionScript.animMapObjTBack, EventFlag.thrkGraveZombiDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0535", null),
	NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.right, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0536", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.right, ActionScript.animPeopleTBack, EventFlag.thrkBikiniZombiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0537", null),
	NPC(NPCType.person, OverworldSprite.zombieLady, Direction.down, ActionScript.unknown077, EventFlag.thrkBikiniZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.right, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0539", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0540", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.up, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0541", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.left, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "textNPC0542", null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0470", null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0471", null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.left, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0474", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.runawayDog, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkGraveZombiDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkGraveZombiDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.thrkInfoDDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0551", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0552", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0553", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.up, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0554", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.up, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0555", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0556", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0557", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.left, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0558", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.up, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0559", null),
	NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.left, ActionScript.animPeopleWalk1, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0560", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animPeopleWalk1, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0561", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0562", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleWalk0, EventFlag.unknown0610, NPCConfigFlagStyle.showIfOn, "textNPC0563", null),
	NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkBuilBManAppear, NPCConfigFlagStyle.showIfOn, "textNPC0564", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.unknown666, EventFlag.thrkEscaperAppear, NPCConfigFlagStyle.showIfOn, "textNPC0475", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.left, ActionScript.unknown666, EventFlag.thrkEscaperAppear, NPCConfigFlagStyle.showIfOn, "textNPC0476", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown870, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown873, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.dontEnterSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0185", null),
	NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0570", null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0580", null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.trashCan, Direction.down, ActionScript.unknown707, EventFlag.boxThrkMaTent, NPCConfigFlagStyle.showIfOn, "textNPC0582", null),
	NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0583", null),
	NPC(NPCType.object, OverworldSprite.cityBus, Direction.right, ActionScript.unknown595, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown094, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown095, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown096, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown097, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown098, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0344", null),
	NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.left, ActionScript.unknown599, EventFlag.fmonBossGraveDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0590", null),
	NPC(NPCType.person, OverworldSprite.tonyInBed, Direction.down, ActionScript.unknown113, EventFlag.winsTony, NPCConfigFlagStyle.showIfOff, "textNPC0591", null),
	NPC(NPCType.person, OverworldSprite.jeffInBed, Direction.down, ActionScript.animMapObjStill, EventFlag.winsStart, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.tools, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0594", null),
	NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0595", "textNPC0595Alt"),
	NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0595", "textNPC0596Alt"),
	NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0595", "textNPC0597Alt"),
	NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0595", "textNPC0598Alt"),
	NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0595", "textNPC0599Alt"),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0600", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0601", null),
	NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0602", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0603", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0604", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0605", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0606", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0607", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0608", null),
	NPC(NPCType.person, OverworldSprite.bubbleMonkey, Direction.left, ActionScript.animPeopleWalk0, EventFlag.winsBMonkeyDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0609", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0610", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0612", null),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0613", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0610", null),
	NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.down, ActionScript.unknown178, EventFlag.phoneGumiApple, NPCConfigFlagStyle.showIfOff, "textNPC0615", null),
	NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winsLaboMouseAppear, NPCConfigFlagStyle.showIfOn, "textNPC0616", null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.up, ActionScript.animMapObjStill, EventFlag.winsLaboMonkeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0617", null),
	NPC(NPCType.person, OverworldSprite.bubbleMonkey, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.winsLaboMonkeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0618", null),
	NPC(NPCType.person, OverworldSprite.caveBoy, Direction.down, ActionScript.animPeopleTBack, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "textNPC0619", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0610", null),
	NPC(NPCType.object, OverworldSprite.shadow, Direction.down, ActionScript.animMapObjStill, EventFlag.winsSkyWDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.instantRevitalizingDevice, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0622", null),
	NPC(NPCType.object, OverworldSprite.skyRunner, Direction.down, ActionScript.animMapObjStill, EventFlag.winsSkyWDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOff, "textNPC0624", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOff, "textNPC0625", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.sebastianDisappear, NPCConfigFlagStyle.showIfOn, "textNPC0626", null),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0627", null),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0628", null),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.left, ActionScript.animPeopleWalk1, EventFlag.sebastianDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0629", null),
	NPC(NPCType.person, OverworldSprite.bubbleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsTassBMonkeyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0630", null),
	NPC(NPCType.person, OverworldSprite.brickRoad, Direction.left, ActionScript.animMapObjStill, EventFlag.winsBrickThanksAppear, NPCConfigFlagStyle.showIfOn, "textNPC0631", null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.right, ActionScript.unknown284, EventFlag.balloonMonkey, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.up, ActionScript.animPeopleWalk1, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "textNPC0633", null),
	NPC(NPCType.person, OverworldSprite.tonyKneeling, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTonyCrouchAppear, NPCConfigFlagStyle.showIfOn, "textNPC0634", null),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0635", null),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0636", null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleTBack, EventFlag.winsKanaiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0637", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0638", null),
	NPC(NPCType.person, OverworldSprite.tony, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0639", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown883, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown868, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.unknown, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.unknown, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.unknown, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.pencilStatue, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsTacoDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0450", "textNPC0645Alt"),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0646", null),
	NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.unknown, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.tessieWaterRipplesTop, Direction.down, ActionScript.animUzu1, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.tessieWaterRipplesBottom, Direction.down, ActionScript.animUzu2, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.appleKid, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "textNPC0657", null),
	NPC(NPCType.person, OverworldSprite.appleKid, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0658", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "textNPC0659", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0660", null),
	NPC(NPCType.person, OverworldSprite.tony, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "textNPC0661", null),
	NPC(NPCType.person, OverworldSprite.tony, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0662", null),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0664", null),
	NPC(NPCType.person, OverworldSprite.mrT, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0665", null),
	NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0666", null),
	NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0668", null),
	NPC(NPCType.person, OverworldSprite.mrT, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "textNPC0669", null),
	NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "textNPC0670", null),
	NPC(NPCType.object, OverworldSprite.eraserStatue, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsStoneTacoDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0671", "textNPC0671Alt"),
	NPC(NPCType.person, OverworldSprite.starman, Direction.down, ActionScript.animMapObjStill, EventFlag.fmonStoneBossDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0672", null),
	NPC(NPCType.person, OverworldSprite.exitMouseNoSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0673", null),
	NPC(NPCType.person, OverworldSprite.exitMouse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.itemEscapeMouse, NPCConfigFlagStyle.showIfOff, "textNPC0095", null),
	NPC(NPCType.person, OverworldSprite.exitMouse, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0096", null),
	NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winRainBoss, NPCConfigFlagStyle.showIfOff, "textNPC0676", null),
	NPC(NPCType.object, OverworldSprite.rope, Direction.down, ActionScript.unknown260, EventFlag.winsRopeSwitch, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.madDuck, Direction.left, ActionScript.walkTowardsPlayer, EventFlag.fmonBrickAADisappear, NPCConfigFlagStyle.showIfOff, "textNPC0678", null),
	NPC(NPCType.person, OverworldSprite.madDuck, Direction.right, ActionScript.walkTowardsPlayer, EventFlag.fmonBrickABDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0679", null),
	NPC(NPCType.person, OverworldSprite.giftBox, Direction.up, ActionScript.unknown601, EventFlag.fmonBrickBADisappear, NPCConfigFlagStyle.showIfOff, "textNPC0680", null),
	NPC(NPCType.person, OverworldSprite.giftBox, Direction.down, ActionScript.unknown601, EventFlag.fmonBrickBBDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0681", null),
	NPC(NPCType.person, OverworldSprite.rowdyMouse, Direction.right, ActionScript.unknown600, EventFlag.fmonBrickCADisappear, NPCConfigFlagStyle.showIfOff, "textNPC0682", null),
	NPC(NPCType.person, OverworldSprite.rowdyMouse, Direction.up, ActionScript.unknown600, EventFlag.fmonBrickCBDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0683", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0610", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0685", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0686", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0687", null),
	NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.unknown600, EventFlag.gpftMinigeppuADisappear, NPCConfigFlagStyle.showIfOff, "textNPC0688", null),
	NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0689", null),
	NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0690", null),
	NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.unknown600, EventFlag.gpftMinigeppuDDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0691", null),
	NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.unknown600, EventFlag.gpftMinigeppuEDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0692", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0693", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0694", null),
	NPC(NPCType.object, OverworldSprite.jarOfFlyHoney, Direction.down, ActionScript.unknown631, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.jarOfFlyHoney, Direction.down, ActionScript.unknown632, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.masterBelch, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "textNPC0697", null),
	NPC(NPCType.object, OverworldSprite.mrSaturnBallAndChain, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mrSaturnBallAndChain, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.nessLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.poo, Direction.left, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.fountainOfHealingMini, Direction.down, ActionScript.unknown693, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winMlkyBoss, NPCConfigFlagStyle.showIfOff, "textNPC0705", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0706", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleTBack, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "textNPC0707", null),
	NPC(NPCType.person, OverworldSprite.oldFatGuyWithHat, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptBaka, NPCConfigFlagStyle.showIfOff, "textNPC0708", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown871, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0710", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0712", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0713", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winOscar, NPCConfigFlagStyle.showIfOn, "textNPC0714", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0715", null),
	NPC(NPCType.object, OverworldSprite.saturnValleyATM, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "textNPC0718", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "textNPC0719", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0720", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk0, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "textNPC0721", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk1, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "textNPC0722", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0723", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0724", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0725", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0726", null),
	NPC(NPCType.person, OverworldSprite.appleKid, Direction.right, ActionScript.animMapObjStill, EventFlag.tlptDkfd, NPCConfigFlagStyle.showIfOn, "textNPC0727", null),
	NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.up, ActionScript.animPeopleWalk0, EventFlag.tlptDkfd, NPCConfigFlagStyle.showIfOn, "textNPC0728", "textNPC0728Alt"),
	NPC(NPCType.person, OverworldSprite.miner, Direction.right, ActionScript.animMapObjStill, EventFlag.dkfdDoorDisappear, NPCConfigFlagStyle.showIfOn, "textNPC0729", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0730", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0731", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "textNPC0732", null),
	NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.right, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0733", null),
	NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.unknown581, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0734", "textNPC0734Alt"),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk0, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown872, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0737", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0738", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0739", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0740", null),
	NPC(NPCType.object, OverworldSprite.phaseDistorter, Direction.down, ActionScript.unknown286, EventFlag.winOscar, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.spaSign, Direction.down, ActionScript.unknown683, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0742", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0743", null),
	NPC(NPCType.object, OverworldSprite.giftBox, Direction.down, ActionScript.unknown708, EventFlag.doseiPuBoxAppear, NPCConfigFlagStyle.showIfOn, "textNPC0744", null),
	NPC(NPCType.object, OverworldSprite.giftBox, Direction.down, ActionScript.unknown709, EventFlag.doseiPuBoxAppear, NPCConfigFlagStyle.showIfOn, "textNPC0745", null),
	NPC(NPCType.object, OverworldSprite.giftBox, Direction.down, ActionScript.unknown710, EventFlag.doseiPuBoxAppear, NPCConfigFlagStyle.showIfOn, "textNPC0746", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0747", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0748", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0749", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.person, OverworldSprite.minersBrother, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0752", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "textNPC0754", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleTBack, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "textNPC0755", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.left, ActionScript.animMapObjTBack, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "textNPC0756", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.down, ActionScript.animPeopleWalk1, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "textNPC0757", null),
	NPC(NPCType.person, OverworldSprite.palmTanGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0758", null),
	NPC(NPCType.person, OverworldSprite.sunBathingGirl, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0759", null),
	NPC(NPCType.person, OverworldSprite.miner, Direction.down, ActionScript.animPeopleWalk0, EventFlag.dsrtSyoziDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0760", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "textNPC0761", null),
	NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "textNPC0762", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "textNPC0763", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "textNPC0764", null),
	NPC(NPCType.person, OverworldSprite.mexicanGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0765", null),
	NPC(NPCType.person, OverworldSprite.mexicanGuy, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0766", null),
	NPC(NPCType.person, OverworldSprite.mexicanGuy, Direction.up, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0767", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0768", null),
	NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0769", null),
	NPC(NPCType.person, OverworldSprite.minersBrother, Direction.down, ActionScript.unknown258, EventFlag.dsrtYumboShigeAppear, NPCConfigFlagStyle.showIfOn, "textNPC0770", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0771", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtTsaruAAppear, NPCConfigFlagStyle.showIfOn, "textNPC0772", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtTsaruBAppear, NPCConfigFlagStyle.showIfOn, "textNPC0773", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "textNPC0774", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "textNPC0775", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown876, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown875, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0778", null),
	NPC(NPCType.object, OverworldSprite.slotMachine, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0779", null),
	NPC(NPCType.object, OverworldSprite.pileOfBones, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0780", null),
	NPC(NPCType.object, OverworldSprite.pileOfBones, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0781", null),
	NPC(NPCType.person, OverworldSprite.unknown3, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0782", null),
	NPC(NPCType.person, OverworldSprite.sesameSeed, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0783", null),
	NPC(NPCType.person, OverworldSprite.guyInCoolRedCar, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "textNPC0784", null),
	NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.redTruck, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.whiteTruck, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.magicTartStand, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "textNPC0788", null),
	NPC(NPCType.object, OverworldSprite.deliveryTruck, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0790", null),
	NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0791", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0792", null),
	NPC(NPCType.object, OverworldSprite.bigDirtScooper, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtYumboBAppear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.contactLenses, Direction.down, ActionScript.animPeopleWalk0, EventFlag.itemContactLens, NPCConfigFlagStyle.showIfOff, "textNPC0794", null),
	NPC(NPCType.object, OverworldSprite.bigDirtScooper, Direction.down, ActionScript.unknown256, EventFlag.dsrtYumboShigeAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.bigDirtScooper, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtYumboBAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.talahRama, Direction.down, ActionScript.animPeopleWalk0, EventFlag.dsrtTjabMove, NPCConfigFlagStyle.showIfOff, "textNPC0797", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk1, EventFlag.dsrtTjabMove, NPCConfigFlagStyle.showIfOff, "textNPC0798", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonBOK, NPCConfigFlagStyle.showIfOff, "textNPC0799", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonAOK, NPCConfigFlagStyle.showIfOff, "textNPC0800", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonBOK, NPCConfigFlagStyle.showIfOn, "textNPC0799", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonAOK, NPCConfigFlagStyle.showIfOn, "textNPC0800", null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonDOK, NPCConfigFlagStyle.showIfOff, "textNPC0803", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonCOK, NPCConfigFlagStyle.showIfOff, "textNPC0804", null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonDOK, NPCConfigFlagStyle.showIfOn, "textNPC0803", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonCOK, NPCConfigFlagStyle.showIfOn, "textNPC0804", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonHOK, NPCConfigFlagStyle.showIfOff, "textNPC0807", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonGOK, NPCConfigFlagStyle.showIfOff, "textNPC0808", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonHOK, NPCConfigFlagStyle.showIfOn, "textNPC0807", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonGOK, NPCConfigFlagStyle.showIfOn, "textNPC0808", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonMOK, NPCConfigFlagStyle.showIfOff, "textNPC0811", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonMOK, NPCConfigFlagStyle.showIfOn, "textNPC0811", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonFOK, NPCConfigFlagStyle.showIfOff, "textNPC0813", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonEOK, NPCConfigFlagStyle.showIfOff, "textNPC0814", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonFOK, NPCConfigFlagStyle.showIfOn, "textNPC0813", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonEOK, NPCConfigFlagStyle.showIfOn, "textNPC0814", null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonLOK, NPCConfigFlagStyle.showIfOff, "textNPC0817", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonKOK, NPCConfigFlagStyle.showIfOff, "textNPC0818", null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonLOK, NPCConfigFlagStyle.showIfOn, "textNPC0817", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonKOK, NPCConfigFlagStyle.showIfOn, "textNPC0818", null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0821", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonJOK, NPCConfigFlagStyle.showIfOff, "textNPC0822", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonIOK, NPCConfigFlagStyle.showIfOff, "textNPC0823", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonJOK, NPCConfigFlagStyle.showIfOn, "textNPC0822", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonIOK, NPCConfigFlagStyle.showIfOn, "textNPC0823", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0826", null),
	NPC(NPCType.object, OverworldSprite.pencilStatue, Direction.down, ActionScript.animPeopleWalk0, EventFlag.dsrtSaruTacoDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0450", "textNPC0827Alt"),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.dsrtTsaruDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0828", null),
	NPC(NPCType.person, OverworldSprite.talahRama, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0829", null),
	NPC(NPCType.person, OverworldSprite.miner, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.dsrtSyoziDungeonAppear, NPCConfigFlagStyle.showIfOn, "textNPC0830", null),
	NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossA, NPCConfigFlagStyle.showIfOff, "textNPC0831", null),
	NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossB, NPCConfigFlagStyle.showIfOff, "textNPC0832", null),
	NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossC, NPCConfigFlagStyle.showIfOff, "textNPC0833", null),
	NPC(NPCType.person, OverworldSprite.exitMouseNoSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0834", null),
	NPC(NPCType.person, OverworldSprite.exitMouse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.itemEscapeMouse, NPCConfigFlagStyle.showIfOff, "textNPC0095", null),
	NPC(NPCType.person, OverworldSprite.exitMouse, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0096", null),
	NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossD, NPCConfigFlagStyle.showIfOff, "textNPC0837", null),
	NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossE, NPCConfigFlagStyle.showIfOff, "textNPC0838", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0839", "textNPC0839Alt"),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animMapObjStill, EventFlag.fourTopoloBoyBAppear, NPCConfigFlagStyle.showIfOff, "textNPC0840", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animMapObjStill, EventFlag.fourTopoloBoyBAppear, NPCConfigFlagStyle.showIfOn, "textNPC0841", null),
	NPC(NPCType.person, OverworldSprite.venus, Direction.up, ActionScript.animMapObjTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOn, "textNPC0842", null),
	NPC(NPCType.person, OverworldSprite.gorgeous, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "textNPC0843", null),
	NPC(NPCType.person, OverworldSprite.runawayFiveBassPlayer, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "textNPC0844", null),
	NPC(NPCType.person, OverworldSprite.runawayFiveDrummer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "textNPC0845", null),
	NPC(NPCType.person, OverworldSprite.lucky, Direction.left, ActionScript.animPeopleTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "textNPC0846", null),
	NPC(NPCType.person, OverworldSprite.runawayFiveSaxPlayer, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "textNPC0847", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0848", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0056, NPCConfigFlagStyle.showIfOff, "textNPC0849", "textNPC0849Alt"),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0056, NPCConfigFlagStyle.showIfOn, "textNPC0850", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTopoloAbAppear, NPCConfigFlagStyle.showIfOn, "textNPC0851", null),
	NPC(NPCType.person, OverworldSprite.beachLady, Direction.down, ActionScript.animMapObjStill, EventFlag.fourTopoloAbAppear, NPCConfigFlagStyle.showIfOn, "textNPC0852", null),
	NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0853", null),
	NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0854", null),
	NPC(NPCType.person, OverworldSprite.mrT, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0855", "textNPC0855Alt"),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0856", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0857", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0858", null),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0859", null),
	NPC(NPCType.person, OverworldSprite.monotoli, Direction.right, ActionScript.animMapObjTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0860", null),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.bodyguard, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0862", null),
	NPC(NPCType.person, OverworldSprite.bodyguard, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0863", null),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0864", null),
	NPC(NPCType.person, OverworldSprite.pokeyRich, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourOK, NPCConfigFlagStyle.showIfOff, "textNPC0865", null),
	NPC(NPCType.person, OverworldSprite.bodyguard, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourOK, NPCConfigFlagStyle.showIfOff, "textNPC0866", null),
	NPC(NPCType.person, OverworldSprite.bodyguard, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourOK, NPCConfigFlagStyle.showIfOff, "textNPC0867", null),
	NPC(NPCType.person, OverworldSprite.aloysiusMinch, Direction.right, ActionScript.animPeopleWalk1, EventFlag.fourOK, NPCConfigFlagStyle.showIfOff, "textNPC0868", null),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.fourMaidThanks, NPCConfigFlagStyle.showIfOn, "textNPC0869", null),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0870", null),
	NPC(NPCType.person, OverworldSprite.electra, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0871", null),
	NPC(NPCType.person, OverworldSprite.monotoli, Direction.up, ActionScript.unknown700, EventFlag.fourStairwayAppear, NPCConfigFlagStyle.showIfOff, "textNPC0872", null),
	NPC(NPCType.person, OverworldSprite.paula, Direction.right, ActionScript.animMapObjStill, EventFlag.pola1, NPCConfigFlagStyle.showIfOff, "textNPC0873", null),
	NPC(NPCType.person, OverworldSprite.monotoli, Direction.down, ActionScript.animMapObjStill, EventFlag.fourMonotolyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0872", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0875", null),
	NPC(NPCType.object, OverworldSprite.mightyBear, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0876", null),
	NPC(NPCType.object, OverworldSprite.secretDoorInMonotoliBuilding, Direction.down, ActionScript.unknown704, EventFlag.fourStairwayAppear, NPCConfigFlagStyle.showIfOff, "textNPC0877", null),
	NPC(NPCType.object, OverworldSprite.secretDoorInMonotoliBuilding, Direction.down, ActionScript.animBillboard, EventFlag.fourStairwayAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.down, ActionScript.unknown602, EventFlag.fourMihari1Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0879", null),
	NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.left, ActionScript.unknown602, EventFlag.fourMihari2Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0880", null),
	NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.left, ActionScript.unknown602, EventFlag.fourMihari3Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0881", null),
	NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.right, ActionScript.unknown602, EventFlag.fourMihari4Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0882", null),
	NPC(NPCType.person, OverworldSprite.clumsyRobot, Direction.down, ActionScript.unknown602, EventFlag.fourYudanRoboDisappear, NPCConfigFlagStyle.showIfOff, "textNPC0883", null),
	NPC(NPCType.person, OverworldSprite.gorgeous, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "textNPC0884", null),
	NPC(NPCType.person, OverworldSprite.lucky, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "textNPC0885", null),
	NPC(NPCType.person, OverworldSprite.runawayFiveDrummer, Direction.up, ActionScript.animPeopleTBack, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "textNPC0886", null),
	NPC(NPCType.person, OverworldSprite.runawayFiveBassPlayer, Direction.down, ActionScript.animMapObjStill, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "textNPC0887", null),
	NPC(NPCType.person, OverworldSprite.runawayFiveSaxPlayer, Direction.left, ActionScript.animPeopleTBack, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "textNPC0888", null),
	NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.right, ActionScript.unknown602, EventFlag.fourMihari5Disappear, NPCConfigFlagStyle.showIfOff, "textNPC0889", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0890", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0891", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0894", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.left, ActionScript.animMapObjStill, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "textNPC0895", null),
	NPC(NPCType.person, OverworldSprite.jackie, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0896", null),
	NPC(NPCType.person, OverworldSprite.bigSmileLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptOK, NPCConfigFlagStyle.showIfOff, "textNPC0897", null),
	NPC(NPCType.person, OverworldSprite.bigSmileLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.fourDeptOK, NPCConfigFlagStyle.showIfOn, "textNPC0898", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0899", null),
	NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0900", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOff, "textNPC0901", null),
	NPC(NPCType.person, OverworldSprite.aloysiusMinch, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "textNPC0902", null),
	NPC(NPCType.object, OverworldSprite.jukebox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0903", null),
	NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0904", null),
	NPC(NPCType.object, OverworldSprite.brokenManiManiStatue, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0905", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0906", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.foursideMuseumGuy, Direction.right, ActionScript.animMapObjStill, EventFlag.fourKomoritaAppear, NPCConfigFlagStyle.showIfOff, "textNPC0908", "textNPC0908Alt"),
	NPC(NPCType.person, OverworldSprite.foursideMuseumGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.fourKomoritaAppear, NPCConfigFlagStyle.showIfOn, "textNPC0909", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0910", null),
	NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0911", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0912", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown878, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0914", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0915", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0916", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0917", null),
	NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0918", null),
	NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0919", null),
	NPC(NPCType.person, OverworldSprite.thickGlassesLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0920", null),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0921", null),
	NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0922", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0923", null),
	NPC(NPCType.person, OverworldSprite.bodyguard, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0924", null),
	NPC(NPCType.person, OverworldSprite.waitress, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0925", null),
	NPC(NPCType.person, OverworldSprite.girlInStripedApron, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0926", null),
	NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0927", null),
	NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.right, ActionScript.unknown016, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0928", null),
	NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.up, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0929", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0930", null),
	NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0931", null),
	NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleWalk1, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0932", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0933", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleWalk1, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0934", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown880, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "textNPC0936", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.object, OverworldSprite.magicTartStand, Direction.down, ActionScript.animMapObjStill, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.deptStoreMook, Direction.down, ActionScript.animPeopleWalk0, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOn, "textNPC0941", null),
	NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0942", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0943", null),
	NPC(NPCType.person, OverworldSprite.trumpetPerson, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0944", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0945", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0946", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0947", null),
	NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0948", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0949", null),
	NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0950", null),
	NPC(NPCType.person, OverworldSprite.electra, Direction.down, ActionScript.animPeopleWalk0, EventFlag.fourMaidAppear, NPCConfigFlagStyle.showIfOn, "textNPC0951", null),
	NPC(NPCType.person, OverworldSprite.everdredLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0952", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0953", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0954", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.up, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0955", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.up, ActionScript.animMapObjTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0956", null),
	NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0957", null),
	NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "textNPC0958", null),
	NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0959", null),
	NPC(NPCType.person, OverworldSprite.gorgeous, Direction.down, ActionScript.animMapObjStill, EventFlag.fourTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, "textNPC0960", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0961", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.fourTonzuraFree, NPCConfigFlagStyle.showIfOff, "textNPC0962", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.fourTonzuraFree, NPCConfigFlagStyle.showIfOff, "textNPC0963", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.fourInfoDAppear, NPCConfigFlagStyle.showIfOn, "textNPC0964", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animMapObjTBack, EventFlag.winMgntBoss, NPCConfigFlagStyle.showIfOff, "textNPC0965", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.right, ActionScript.animMapObjTBack, EventFlag.winMgntBoss, NPCConfigFlagStyle.showIfOff, "textNPC0966", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.right, ActionScript.animMapObjStill, EventFlag.fourSaruBAppear, NPCConfigFlagStyle.showIfOn, "textNPC0967", null),
	NPC(NPCType.person, OverworldSprite.humanCharred, Direction.down, ActionScript.animMapObjStill, EventFlag.fourSaruKAppear, NPCConfigFlagStyle.showIfOn, "textNPC0968", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0969", null),
	NPC(NPCType.person, OverworldSprite.hintMan, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "textNPC0970", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown879, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0972", null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.unknown877, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.magnetHill, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.can, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.helicopter, Direction.down, ActionScript.unknown711, EventFlag.fourHeliDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.helicopterBlade, Direction.down, ActionScript.animMapObjStill, EventFlag.fourHeliDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.helicopterBack, Direction.down, ActionScript.animMapObjStill, EventFlag.fourHeliDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.shadow, Direction.down, ActionScript.unknown704, EventFlag.fourHeliDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0993", null),
	NPC(NPCType.object, OverworldSprite.runaway5Bus, Direction.down, ActionScript.unknown190, EventFlag.fourTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winMgntBoss, NPCConfigFlagStyle.showIfOff, "textNPC0995", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0996", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0997", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0998", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0999", null),
	NPC(NPCType.person, OverworldSprite.mrT, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1000", null),
	NPC(NPCType.person, OverworldSprite.waitress, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1001", null),
	NPC(NPCType.person, OverworldSprite.magicCakeLady, Direction.left, ActionScript.animPeopleTBack, EventFlag.sumsStoicWifeDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1002", null),
	NPC(NPCType.person, OverworldSprite.shipCrewman, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1003", null),
	NPC(NPCType.person, OverworldSprite.shipCrewman, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1004", null),
	NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1005", null),
	NPC(NPCType.person, OverworldSprite.trumpetPerson, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1006", null),
	NPC(NPCType.person, OverworldSprite.dog, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1007", null),
	NPC(NPCType.person, OverworldSprite.shipCaptain, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1008", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1011", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1012", null),
	NPC(NPCType.person, OverworldSprite.beachLady, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1013", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1016", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1017", null),
	NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1018", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.left, ActionScript.animMapObjStill, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "textNPC1019", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1020", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1021", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1024", null),
	NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1025", null),
	NPC(NPCType.person, OverworldSprite.waitress, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1026", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1027", null),
	NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptOnet, NPCConfigFlagStyle.showIfOn, "textNPC1028", null),
	NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1029", null),
	NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptOnet, NPCConfigFlagStyle.showIfOn, "textNPC1030", null),
	NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptOnet, NPCConfigFlagStyle.showIfOn, "textNPC1031", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown885, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.sumsMuseumPhoneRing, NPCConfigFlagStyle.showIfOff, "textNPC1033", null),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1034", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1035", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1036", null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.sumsOmarBAppear, NPCConfigFlagStyle.showIfOff, "textNPC1037", "textNPC1037Alt"),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.sumsOmarBAppear, NPCConfigFlagStyle.showIfOn, "textNPC1038", null),
	NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown599, EventFlag.fmonHieroglyphADisappear, NPCConfigFlagStyle.showIfOff, "textNPC1039", null),
	NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown599, EventFlag.fmonHieroglyphBDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1040", null),
	NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1047", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1048", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1049", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1050", null),
	NPC(NPCType.person, OverworldSprite.weirdoGuyInSwimTrunks, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1051", null),
	NPC(NPCType.person, OverworldSprite.girlInBikini, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1052", null),
	NPC(NPCType.person, OverworldSprite.guyInSwimmingSuit, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1053", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1054", null),
	NPC(NPCType.person, OverworldSprite.weirdoGuyInSwimTrunks, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1055", null),
	NPC(NPCType.person, OverworldSprite.zombieLady, Direction.left, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1056", null),
	NPC(NPCType.person, OverworldSprite.beachLady, Direction.down, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1057", null),
	NPC(NPCType.person, OverworldSprite.weirdoGuyInSwimTrunks, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1058", null),
	NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1059", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1060", null),
	NPC(NPCType.person, OverworldSprite.mexicanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1061", null),
	NPC(NPCType.person, OverworldSprite.birdOnPerch, Direction.left, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1062", null),
	NPC(NPCType.person, OverworldSprite.shipCaptain, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1063", null),
	NPC(NPCType.person, OverworldSprite.shipCrewman, Direction.left, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1064", null),
	NPC(NPCType.person, OverworldSprite.shipCaptain, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1065", null),
	NPC(NPCType.person, OverworldSprite.palmTanGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1066", null),
	NPC(NPCType.person, OverworldSprite.cat, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1067", null),
	NPC(NPCType.person, OverworldSprite.cat, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1068", null),
	NPC(NPCType.person, OverworldSprite.magicCakeLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.sumsStoicWifeDisappear, NPCConfigFlagStyle.showIfOn, "textNPC1069", null),
	NPC(NPCType.person, OverworldSprite.sunBathingGirl, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1070", null),
	NPC(NPCType.person, OverworldSprite.hintMan, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "textNPC1071", null),
	NPC(NPCType.person, OverworldSprite.lucky, Direction.left, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.gorgeous, Direction.down, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.runawayFiveDrummer, Direction.down, ActionScript.animPeopleWalk0, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.girlInBikini, Direction.up, ActionScript.animPeopleWalk0, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown887, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.oldFatGuyWithHat, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1077", null),
	NPC(NPCType.object, OverworldSprite.magicTartStand, Direction.down, ActionScript.unknown886, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0788", null),
	NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.guyInCoolRedCar, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1080", null),
	NPC(NPCType.object, OverworldSprite.deliveryTruck, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.bicycle, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.magicTartStand, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0788", null),
	NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.unknown884, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1086", null),
	NPC(NPCType.object, OverworldSprite.runaway5Bus, Direction.down, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.ship, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.starMaster, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1089", null),
	NPC(NPCType.person, OverworldSprite.dalaameseServant, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1090", null),
	NPC(NPCType.person, OverworldSprite.telephoneHeadGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1091", null),
	NPC(NPCType.person, OverworldSprite.poo, Direction.down, ActionScript.animPeopleWalk1, EventFlag.ramaPuAppear, NPCConfigFlagStyle.showIfOn, "textNPC1092", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown881, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.right, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1094", null),
	NPC(NPCType.person, OverworldSprite.chineseMonkGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1095", null),
	NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1096", null),
	NPC(NPCType.person, OverworldSprite.dalaameseServant, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1097", null),
	NPC(NPCType.person, OverworldSprite.chineseMonkGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1098", null),
	NPC(NPCType.person, OverworldSprite.dalaameseServant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1099", null),
	NPC(NPCType.person, OverworldSprite.preetProotGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1100", null),
	NPC(NPCType.person, OverworldSprite.dalaameseServant, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1101", null),
	NPC(NPCType.person, OverworldSprite.dalaamGirl, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1102", null),
	NPC(NPCType.person, OverworldSprite.starMaster, Direction.left, ActionScript.animPeopleWalk0, EventFlag.rama258Disappear, NPCConfigFlagStyle.showIfOff, "textNPC1103", null),
	NPC(NPCType.person, OverworldSprite.dalaamGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1104", null),
	NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1105", null),
	NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1106", null),
	NPC(NPCType.object, OverworldSprite.rabbit, Direction.down, ActionScript.animMapObjStill, EventFlag.ramaRabbitDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1107", "textNPC1107Alt"),
	NPC(NPCType.object, OverworldSprite.rabbit, Direction.down, ActionScript.animMapObjStill, EventFlag.ramaRabbitDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1107", "textNPC1107Alt"),
	NPC(NPCType.object, OverworldSprite.rabbit, Direction.down, ActionScript.animMapObjStill, EventFlag.ramaRabbitDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1107", "textNPC1107Alt"),
	NPC(NPCType.person, OverworldSprite.dalaamGirl, Direction.up, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.dalaamGirl, Direction.left, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1112", null),
	NPC(NPCType.object, OverworldSprite.ornamentsOnPoosTemple, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.ornamentsOnPoosTemple, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.ornamentsOnPoosTemple, Direction.down, ActionScript.unknown882, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.ornamentsOnPoosTemple, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1117", null),
	NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winPinkBoss, NPCConfigFlagStyle.showIfOff, "textNPC1118", null),
	NPC(NPCType.person, OverworldSprite.nessLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.poo, Direction.left, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1123", null),
	NPC(NPCType.person, OverworldSprite.happyTurbanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1124", null),
	NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1125", null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "textNPC1126", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.person, OverworldSprite.ladyInVeil, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1129", null),
	NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1130", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1131", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1132", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1133", null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1134", null),
	NPC(NPCType.person, OverworldSprite.happyTurbanGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1135", null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1136", null),
	NPC(NPCType.person, OverworldSprite.ladyInVeil, Direction.up, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1137", null),
	NPC(NPCType.person, OverworldSprite.bigNoseArabGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1138", null),
	NPC(NPCType.person, OverworldSprite.arabMrT, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1139", null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1140", null),
	NPC(NPCType.person, OverworldSprite.happyTurbanGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1141", null),
	NPC(NPCType.person, OverworldSprite.preetProotGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1142", null),
	NPC(NPCType.object, OverworldSprite.pyramidDoor, Direction.down, ActionScript.animMapObjStill, EventFlag.sphinxOK, NPCConfigFlagStyle.showIfOff, "textNPC1143", null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1144", null),
	NPC(NPCType.person, OverworldSprite.bigNoseArabGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1145", null),
	NPC(NPCType.person, OverworldSprite.bigNoseArabGuy, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1146", null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1147", null),
	NPC(NPCType.person, OverworldSprite.preetProotGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1148", null),
	NPC(NPCType.person, OverworldSprite.tribalWarrior, Direction.down, ActionScript.animPeopleWalk0, EventFlag.skrbYarimanBAppear, NPCConfigFlagStyle.showIfOff, "textNPC1149", null),
	NPC(NPCType.object, OverworldSprite.dungeonMan, Direction.down, ActionScript.animMapObjStill, EventFlag.skrbBrickRoadDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1150", "textNPC1150Alt"),
	NPC(NPCType.person, OverworldSprite.tribalWarrior, Direction.down, ActionScript.animPeopleWalk0, EventFlag.skrbYarimanBAppear, NPCConfigFlagStyle.showIfOn, "textNPC1151", null),
	NPC(NPCType.person, OverworldSprite.dungeonMan, Direction.down, ActionScript.unknown498, EventFlag.skrbBrickRoadMakyoAppear, NPCConfigFlagStyle.showIfOn, "textEvent498", null),
	NPC(NPCType.person, OverworldSprite.hintMan, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "textNPC1153", null),
	NPC(NPCType.object, OverworldSprite.pyramidDoor, Direction.down, ActionScript.animMapObjStill, EventFlag.sphinxOK, NPCConfigFlagStyle.showIfOff, "textNPC1143", null),
	NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.tlptMaky, NPCConfigFlagStyle.showIfOff, "textNPC1155", null),
	NPC(NPCType.person, OverworldSprite.bigNoseArabGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1156", null),
	NPC(NPCType.person, OverworldSprite.preetProotGuy, Direction.down, ActionScript.unknown888, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1157", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown889, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown890, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.camel, Direction.left, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.camel, Direction.left, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.unknown3, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1162", null),
	NPC(NPCType.object, OverworldSprite.unknown3, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1162", null),
	NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1164", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1165", null),
	NPC(NPCType.object, OverworldSprite.guardianHieroglyph, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.guardianHieroglyph, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraACDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1168", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraADDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1169", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBADisappear, NPCConfigFlagStyle.showIfOff, "textNPC1170", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBBDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1171", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraAEDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1172", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAFDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1173", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAGDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1174", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBCDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1175", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAHDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1176", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraBDDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1177", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAIDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1178", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraBEDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1179", null),
	NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.animMapObjStill, EventFlag.fmonPyraBossDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1180", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAJDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1181", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAKDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1182", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraALDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1183", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraBFDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1184", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAMDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1185", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraANDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1186", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBGDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1187", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraAODisappear, NPCConfigFlagStyle.showIfOff, "textNPC1188", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraAPDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1189", null),
	NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAQDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1190", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBHDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1191", null),
	NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBIDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1192", null),
	NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.skrbPyramidOK, NPCConfigFlagStyle.showIfOff, "textNPC1193", null),
	NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.skrbPyramidOK, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.hawksEye, Direction.down, ActionScript.animMapObjStill, EventFlag.itemTakanome, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.brickRoadHead, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1196", null),
	NPC(NPCType.object, OverworldSprite.submarine, Direction.down, ActionScript.animMapObjStill, EventFlag.tlptMaky, NPCConfigFlagStyle.showIfOff, "textNPC1197", null),
	NPC(NPCType.object, OverworldSprite.bicycle, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1200", null),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0013", null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1204", null),
	NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.object, OverworldSprite.instantRevitalizingDevice, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0622", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1208", null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1209", null),
	NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1210", null),
	NPC(NPCType.object, OverworldSprite.madDuck, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.madDuck, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.madDuck, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.gruffGoat, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.gruffGoat, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtKanban44Move, NPCConfigFlagStyle.showIfOff, "textNPC1219", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtKanban44Move, NPCConfigFlagStyle.showIfOn, "textNPC1219", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1221", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1133", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1132", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1131", null),
	NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.left, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1226", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1227", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1228", null),
	NPC(NPCType.person, OverworldSprite.masterBarf, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeropp, NPCConfigFlagStyle.showIfOff, "textNPC1229", null),
	NPC(NPCType.person, OverworldSprite.birdOnPerch, Direction.right, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1230", null),
	NPC(NPCType.person, OverworldSprite.unknown4, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoUseTakanome, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1232", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1233", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1234", null),
	NPC(NPCType.person, OverworldSprite.deepDarknessPhone, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1235", null),
	NPC(NPCType.person, OverworldSprite.atmGuyUnderwater, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1236", null),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown891, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1238", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.right, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1239", null),
	NPC(NPCType.object, OverworldSprite.unknown2, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle1Disappear, NPCConfigFlagStyle.showIfOff, "textNPC1240", null),
	NPC(NPCType.object, OverworldSprite.unknown2, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle2Disappear, NPCConfigFlagStyle.showIfOff, "textNPC1241", null),
	NPC(NPCType.object, OverworldSprite.unknown2, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle3Disappear, NPCConfigFlagStyle.showIfOff, "textNPC1242", null),
	NPC(NPCType.object, OverworldSprite.unknown2, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle4Disappear, NPCConfigFlagStyle.showIfOff, "textNPC1243", null),
	NPC(NPCType.object, OverworldSprite.unknown2, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle5Disappear, NPCConfigFlagStyle.showIfOff, "textNPC1244", null),
	NPC(NPCType.object, OverworldSprite.brokenHelicopter, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1245", null),
	NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winLumiBoss, NPCConfigFlagStyle.showIfOff, "textNPC1246", null),
	NPC(NPCType.person, OverworldSprite.talkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1247", null),
	NPC(NPCType.person, OverworldSprite.talkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1248", null),
	NPC(NPCType.person, OverworldSprite.talkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1249", null),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1250", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1251", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.tendaChief, Direction.left, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1252", "textNPC1252Alt"),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1253", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1254", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1255", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1256", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1257", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1258", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1259", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.talkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1260", null),
	NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1261", "textNPC1250Alt"),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.object, OverworldSprite.rock, Direction.down, ActionScript.animMapObjStill, EventFlag.gumiCaveOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPC(NPCType.object, OverworldSprite.can, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.weirdJunk, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.spaSign, Direction.down, ActionScript.unknown684, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1267", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.dkfdDoseiSt1Appear, NPCConfigFlagStyle.showIfOn, "textNPC1268", null),
	NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.down, ActionScript.animMapObjStill, EventFlag.dkfdAndonutAAppear, NPCConfigFlagStyle.showIfOn, "textNPC1269", null),
	NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.left, ActionScript.animMapObjStill, EventFlag.dkfdAndonutBAppear, NPCConfigFlagStyle.showIfOn, "textNPC1270", null),
	NPC(NPCType.person, OverworldSprite.appleKid, Direction.down, ActionScript.unknown767, EventFlag.dkfdAppleAAppear, NPCConfigFlagStyle.showIfOn, "textNPC1271", null),
	NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleTBack, EventFlag.dkfdDoseiAAppear, NPCConfigFlagStyle.showIfOn, "textNPC1272", null),
	NPC(NPCType.object, OverworldSprite.brokenPhaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.winManimani, NPCConfigFlagStyle.showIfOn, "textNPC1273", null),
	NPC(NPCType.object, OverworldSprite.phaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.dkfdSt2Appear, NPCConfigFlagStyle.showIfOn, "textNPC1274", null),
	NPC(NPCType.object, OverworldSprite.phaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.dkfdSt3Appear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winFireBoss, NPCConfigFlagStyle.showIfOff, "textNPC1276", null),
	NPC(NPCType.person, OverworldSprite.nessLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.poo, Direction.left, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.flame, Direction.down, ActionScript.unknown693, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1282", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.unknown771, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1283", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1284", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1285", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1286", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1287", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1288", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1289", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1290", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1291", null),
	NPC(NPCType.person, OverworldSprite.lilTalkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1292", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1293", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1294", null),
	NPC(NPCType.person, OverworldSprite.lilToucanPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1295", null),
	NPC(NPCType.person, OverworldSprite.lilToucanPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1295", null),
	NPC(NPCType.person, OverworldSprite.lilToucanPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1295", null),
	NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1298", null),
	NPC(NPCType.object, OverworldSprite.woodBox, Direction.down, ActionScript.animMapObjStill, EventFlag.dkfdDoorDisappear, NPCConfigFlagStyle.showIfOff, null, "textNPC1299Alt"),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1300", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1301", null),
	NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1301", null),
	NPC(NPCType.object, OverworldSprite.badPaletteFountain, Direction.down, ActionScript.unknown672, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.redFountainLostUnderworld, Direction.down, ActionScript.unknown673, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.badPaletteFountain, Direction.down, ActionScript.unknown674, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPC(NPCType.object, OverworldSprite.robotBroken, Direction.right, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.robotBroken, Direction.left, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.robotBroken, Direction.left, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.lyingDownRobotNess, Direction.right, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.object, OverworldSprite.phaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, "textNPC1274", null),
	NPC(NPCType.person, OverworldSprite.none, Direction.down, ActionScript.unknown000, EventFlag.unknown0340, NPCConfigFlagStyle.showIfOn, null, null),
	NPC(NPCType.person, OverworldSprite.weirdHornedGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1312", null),
	NPC(NPCType.person, OverworldSprite.flyingMan, Direction.right, ActionScript.animPeopleWalk1, EventFlag.flyingMan1, NPCConfigFlagStyle.showIfOff, "textNPC1313", null),
	NPC(NPCType.person, OverworldSprite.flyingMan, Direction.down, ActionScript.animPeopleTBack, EventFlag.flyingMan2, NPCConfigFlagStyle.showIfOff, "textNPC1314", null),
	NPC(NPCType.person, OverworldSprite.flyingMan, Direction.right, ActionScript.animPeopleWalk1, EventFlag.flyingMan3, NPCConfigFlagStyle.showIfOff, "textNPC1315", null),
	NPC(NPCType.person, OverworldSprite.flyingMan, Direction.up, ActionScript.animPeopleWalk1, EventFlag.flyingMan4, NPCConfigFlagStyle.showIfOff, "textNPC1316", null),
	NPC(NPCType.person, OverworldSprite.flyingMan, Direction.right, ActionScript.animPeopleTBack, EventFlag.flyingMan5, NPCConfigFlagStyle.showIfOff, "textNPC1317", null),
	NPC(NPCType.person, OverworldSprite.weirdHornedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1318", null),
	NPC(NPCType.person, OverworldSprite.chick, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1319", null),
	NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0012", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.person, OverworldSprite.rabbit, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1322", null),
	NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1323", null),
	NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1324", null),
	NPC(NPCType.person, OverworldSprite.masterBelch, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1325", null),
	NPC(NPCType.person, OverworldSprite.manlyFish, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1326", null),
	NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1327", null),
	NPC(NPCType.person, OverworldSprite.kidInDerbyHat, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1328", null),
	NPC(NPCType.person, OverworldSprite.happyGirlInRed, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1329", null),
	NPC(NPCType.person, OverworldSprite.picky, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1330", null),
	NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1331", null),
	NPC(NPCType.person, OverworldSprite.monkey, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1332", null),
	NPC(NPCType.person, OverworldSprite.kidInDetectiveHat, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1333", null),
	NPC(NPCType.person, OverworldSprite.rabbit, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1334", null),
	NPC(NPCType.person, OverworldSprite.ness, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1335", null),
	NPC(NPCType.person, OverworldSprite.chick, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1336", null),
	NPC(NPCType.person, OverworldSprite.flower, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1337", null),
	NPC(NPCType.person, OverworldSprite.flower, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1337", null),
	NPC(NPCType.person, OverworldSprite.flower, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1337", null),
	NPC(NPCType.person, OverworldSprite.starMasterGuy, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1340", null),
	NPC(NPCType.person, OverworldSprite.starMasterGuy, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1341", null),
	NPC(NPCType.person, OverworldSprite.mom, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1342", null),
	NPC(NPCType.person, OverworldSprite.tracy, Direction.right, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1343", null),
	NPC(NPCType.person, OverworldSprite.king, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1344", null),
	NPC(NPCType.person, OverworldSprite.pokey, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1345", null),
	NPC(NPCType.person, OverworldSprite.everdred, Direction.down, ActionScript.animPeopleTBack, EventFlag.mgktTonchikiDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1346", null),
	NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadA, NPCConfigFlagStyle.showIfOn, "textNPC1347", null),
	NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadB, NPCConfigFlagStyle.showIfOn, "textNPC1348", null),
	NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadC, NPCConfigFlagStyle.showIfOn, "textNPC1349", null),
	NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadD, NPCConfigFlagStyle.showIfOn, "textNPC1350", null),
	NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadE, NPCConfigFlagStyle.showIfOn, "textNPC1351", null),
	NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1352", null),
	NPC(NPCType.object, OverworldSprite.weirdTailThing, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1353", null),
	NPC(NPCType.person, OverworldSprite.kraken, Direction.right, ActionScript.unknown602, EventFlag.fmonKraken2ADisappear, NPCConfigFlagStyle.showIfOff, "textNPC1354", null),
	NPC(NPCType.person, OverworldSprite.kraken, Direction.left, ActionScript.unknown602, EventFlag.fmonKraken2BDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1355", null),
	NPC(NPCType.person, OverworldSprite.kraken, Direction.right, ActionScript.unknown602, EventFlag.fmonKraken2CDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1356", null),
	NPC(NPCType.object, OverworldSprite.weirdTailThing, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1357", null),
	NPC(NPCType.object, OverworldSprite.evilManiMani, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winOscar, NPCConfigFlagStyle.showIfOff, "textNPC1358", "textNPC1358Alt"),
	NPC(NPCType.person, OverworldSprite.jackie, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1359", null),
	NPC(NPCType.person, OverworldSprite.bigSmileLady, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1360", null),
	NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1361", null),
	NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.up, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1362", null),
	NPC(NPCType.person, OverworldSprite.roboPump, Direction.up, ActionScript.unknown597, EventFlag.fmonMoonBDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1363", null),
	NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1364", null),
	NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1365", null),
	NPC(NPCType.person, OverworldSprite.abstractArt, Direction.right, ActionScript.unknown597, EventFlag.fmonMoonCDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1366", null),
	NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1367", null),
	NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1368", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1369", null),
	NPC(NPCType.person, OverworldSprite.foursideMuseumGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1370", null),
	NPC(NPCType.person, OverworldSprite.roboPump, Direction.up, ActionScript.unknown597, EventFlag.fmonMoonB2Disappear, NPCConfigFlagStyle.showIfOff, "textNPC1371", null),
	NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1372", null),
	NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animMapObjStill, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "textNPC1373", null),
	NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1374", null),
	NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1375", "textNPC0012Alt"),
	NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC0060", null),
	NPC(NPCType.person, OverworldSprite.mrT, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1377", null),
	NPC(NPCType.person, OverworldSprite.badPaletteGuyOnettNight, Direction.down, ActionScript.animPeopleWalk1, EventFlag.moonInvisibleman, NPCConfigFlagStyle.showIfOff, "textNPC1378", null),
	NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1379", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1380", null),
	NPC(NPCType.person, OverworldSprite.beachLady, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1381", null),
	NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1382", null),
	NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1383", null),
	NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1384", null),
	NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1385", null),
	NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1386", null),
	NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1387", null),
	NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1388", null),
	NPC(NPCType.person, OverworldSprite.bodyguard, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1389", null),
	NPC(NPCType.person, OverworldSprite.shyGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1390", null),
	NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1391", null),
	NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1392", null),
	NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1393", null),
	NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1394", null),
	NPC(NPCType.person, OverworldSprite.monotoli, Direction.up, ActionScript.animMapObjStill, EventFlag.moonMonotolyDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1395", null),
	NPC(NPCType.person, OverworldSprite.shipCaptain, Direction.down, ActionScript.animMapObjStill, EventFlag.moonRDisappear, NPCConfigFlagStyle.showIfOff, "textNPC1396", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1397", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1398", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1398", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1398", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1401", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1402", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1403", null),
	NPC(NPCType.person, OverworldSprite.surfer, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1404", null),
	NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1405", null),
	NPC(NPCType.object, OverworldSprite.evilManiMani, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "textNPC1406", "textNPC1358Alt"),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0800, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.breadRoll),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0801, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.hamburger),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0802, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.hamburger),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0803, NPCConfigFlagStyle.showAlways, "textNPC1408", Money(0)),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0804, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.canOfFruitJuice),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0805, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.crackedBat),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0806, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.hamburger),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0807, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.skipSandwich),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0808, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.coldRemedy),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0809, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.skipSandwich),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0810, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.teddyBear),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0811, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.brokenMachine),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0812, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.skipSandwich),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0813, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.croissant),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0814, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.luckCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0815, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.hardHat),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0816, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.croissant),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0817, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.travelCharm),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0818, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bomb),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0819, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0820, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.psiCaramel),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0821, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.greatCharm),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0822, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.croissant),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0823, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.insecticideSpray),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0824, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.teddyBear),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0825, NPCConfigFlagStyle.showAlways, "textNPC1408", Money(0)),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0826, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.skipSandwich),
	NPC(NPCType.itemBox, OverworldSprite.casket, Direction.down, ActionScript.unknown009, EventFlag.unknown0827, NPCConfigFlagStyle.showAlways, "textNPC1434", ItemID.skipSandwichDX),
	NPC(NPCType.itemBox, OverworldSprite.casket, Direction.down, ActionScript.unknown009, EventFlag.unknown0828, NPCConfigFlagStyle.showAlways, "textNPC1434", ItemID.silverBracelet),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0829, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cookie),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0830, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cookie),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0831, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cookie),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0832, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cookie),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0833, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cookie),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0834, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cookie),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0835, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cookie),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0836, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.brokenPipe),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0837, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.brokenIron),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0838, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.stunGun),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0839, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.insecticideSpray),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0840, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.croissant),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0841, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.breadRoll),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0842, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cheapBracelet),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0843, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bottleRocket),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0844, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.hamburger),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0845, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.brokenTrumpet),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0846, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.gutsCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0847, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.brokenHarmonica),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0848, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.psiCaramel),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0849, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.pixiesBracelet),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0850, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0851, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.speedCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0852, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.spicyJerky),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0853, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.brokenLaser),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0854, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.bomb),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0855, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.hpSucker),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0856, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.vitalCapsule),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0857, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.calorieStick),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0858, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.iqCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0859, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.coinOfSlumber),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0860, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.proteinDrink),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0861, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bomb),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0862, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bottleRocket),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0863, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.rustPromoter),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0864, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.suddenGutsPill),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0865, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.protractor),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0866, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.brokenSprayCan),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0867, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.flamePendant),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0868, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.brokenTube),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0869, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.bagOfDragonite),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0870, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.neutralizer),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0871, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.brainFoodLunch),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0872, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0873, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.pizza),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0874, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.wetTowel),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0875, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.pizza),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0876, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.ruler),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0877, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.hamburger),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0878, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.proteinDrink),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0879, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.hamburger),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0880, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.picnicLunch),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0881, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.hamburger),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0882, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bigBottleRocket),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0883, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.doubleBurger),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0884, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.doubleBurger),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0885, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0886, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.skipSandwichDX),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0887, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.psiCaramel),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0888, NPCConfigFlagStyle.showAlways, "textNPC1407", Money(1000)),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0889, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.suddenGutsPill),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0890, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.psiCaramel),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0891, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.platinumBand2),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0892, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.iqCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0893, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.gutsCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0894, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.luckCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0895, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.coinOfDefense),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0896, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.secretHerb),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0897, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.teddyBear),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0898, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.superBomb),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0899, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bigBottleRocket),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0900, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.croissant),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0901, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.calorieStick),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0902, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.picnicLunch),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0903, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bomb),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0904, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.carrotKey),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0905, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.suddenGutsPill),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0906, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.vitalCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0907, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.nightPendant),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0908, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.handbagStrap),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0909, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.doubleBurger),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0910, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.proteinDrink),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0911, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.secretHerb),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0912, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.rustPromoterDX),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0913, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.brokenBazooka),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0914, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.brokenSprayCan),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0915, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.croissant),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0916, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.brokenIron),
	NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown009, EventFlag.unknown0917, NPCConfigFlagStyle.showAlways, "textNPC1434", ItemID.bagOfDragonite),
	NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown009, EventFlag.unknown0918, NPCConfigFlagStyle.showAlways, "textNPC1434", ItemID.speedCapsule),
	NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown009, EventFlag.unknown0919, NPCConfigFlagStyle.showAlways, "textNPC1434", ItemID.viper),
	NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown009, EventFlag.unknown0920, NPCConfigFlagStyle.showAlways, "textNPC1434", ItemID.diamondBand),
	NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown009, EventFlag.unknown0921, NPCConfigFlagStyle.showAlways, "textNPC1434", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown009, EventFlag.unknown0922, NPCConfigFlagStyle.showAlways, "textNPC1434", ItemID.rainPendant),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0923, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0924, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.talismanRibbon),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0925, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.suddenGutsPill),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0926, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.psiCaramel),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0927, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.molokheiyaSoup),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0928, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.pizza),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0929, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.superPlushBear),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0930, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.snake),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0931, NPCConfigFlagStyle.showAlways, "textNPC1407", Money(10)),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0932, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.iqCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0933, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.wetTowel),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0934, NPCConfigFlagStyle.showAlways, "textNPC1407", Money(5)),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0935, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.brainFoodLunch),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0936, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0937, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.brainStone),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0938, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.bottleOfWater),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0939, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.bowlOfRiceGruel),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0940, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.jarOfDelisauce),
	NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.unknown009, EventFlag.unknown0941, NPCConfigFlagStyle.showAlways, "textNPC1474", ItemID.bottleOfWater),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0942, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.rockCandy),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0943, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.suddenGutsPill),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0944, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bracerOfKings),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0945, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.souvenirCoin),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0946, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.rockCandy),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0947, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.iqCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0948, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0949, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.banana),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0950, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.beefJerky),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0951, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.rabbitsFoot),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0952, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cupOfLifenoodles),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0953, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.rockCandy),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0954, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.diademOfKings),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0955, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.luckCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0956, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.luxuryJerky),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0957, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.iqCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0958, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bottleOfDXWater),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0959, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.superBomb),
	NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.unknown009, EventFlag.unknown0960, NPCConfigFlagStyle.showAlways, "textNPC1408", ItemID.deathRay),
	NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0961, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.brainFoodLunch),
	NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0962, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.hornOfLife),
	NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0963, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.seaPendant),
	NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0964, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.gutsCapsule),
	NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0965, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cloakOfKings),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0966, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.moonBeamGun),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0967, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.hornOfLife),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0968, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.cherubsBand),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0969, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bagOfDragonite),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0970, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.speedCapsule),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0971, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.bagOfDragonite),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0972, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.psiCaramel),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0973, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.goddessBand),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0974, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.magicantBat),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0975, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.magicTart),
	NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.unknown009, EventFlag.unknown0976, NPCConfigFlagStyle.showAlways, "textNPC1407", ItemID.legendaryBat),
];