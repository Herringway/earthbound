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

immutable DoorEntryA doorEntry0 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetMizunoDoorOpen | eventFlagUnset, 0xC09A, 0x03B1, 0x04);
immutable DoorEntryA doorEntry1 = DoorEntryA("TEXT_DOOR_001", EventFlag.none, 0x010B, 0x0087, 0x01);
immutable DoorEntryA doorEntry2 = DoorEntryA(null, EventFlag.none, 0x03EF, 0x0119, 0x01);
immutable DoorEntryA doorEntry3 = DoorEntryA(null, EventFlag.none, 0x83FC, 0x00F3, 0x01);
immutable DoorEntryA doorEntry4 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC434, 0x0158, 0x01);
immutable DoorEntryA doorEntry5 = DoorEntryA(null, EventFlag.none, 0x80B9, 0x0367, 0x01);
immutable DoorEntryA doorEntry6 = DoorEntryA("MSG_ONET_TABIGOYA", EventFlag.openTabigoya | eventFlagUnset, 0xC0BA, 0x0375, 0x04);
immutable DoorEntryA doorEntry7 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC0A9, 0x03F0, 0x01);
immutable DoorEntryA doorEntry8 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC0BD, 0x03DC, 0x06);
immutable DoorEntryA doorEntry9 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC03D, 0x03BC, 0x06);
immutable DoorEntryA doorEntry10 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC02D, 0x03FC, 0x04);
immutable DoorEntryA doorEntry11 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC04D, 0x03B8, 0x04);
immutable DoorEntryA doorEntry12 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC06A, 0x03B1, 0x04);
immutable DoorEntryA doorEntry13 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC04D, 0x03EC, 0x01);
immutable DoorEntryA doorEntry14 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC0BD, 0x03FC, 0x01);
immutable DoorEntryA doorEntry15 = DoorEntryA("TEXT_DOOR_015", EventFlag.onetEstateDoorOpen | eventFlagUnset, 0xC0BA, 0x03B9, 0x04);
immutable DoorEntryA doorEntry16 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC07D, 0x039C, 0x01);
immutable DoorEntryA doorEntry17 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0x0056, 0x03D1, 0x04);
immutable DoorEntryA doorEntry18 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC059, 0x03E4, 0x06);
immutable DoorEntryA doorEntry19 = DoorEntryA("TEXT_DOOR_019", EventFlag.onetDoorClose, 0xC031, 0x0384, 0x01);
immutable DoorEntryA doorEntry20 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC0AD, 0x0398, 0x06);
immutable DoorEntryA doorEntry21 = DoorEntryA("TEXT_DOOR_021", EventFlag.onetPokeyDoorClose, 0xC06D, 0x0398, 0x04);
immutable DoorEntryA doorEntry22 = DoorEntryA("TEXT_DOOR_022", EventFlag.genkanMamaAppear, 0xC02A, 0x03CD, 0x04);
immutable DoorEntryA doorEntry23 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC03D, 0x03F4, 0x01);
immutable DoorEntryA doorEntry24 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC07A, 0x0371, 0x04);
immutable DoorEntryA doorEntry25 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC09D, 0x03F8, 0x04);
immutable DoorEntryA doorEntry26 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC08A, 0x03B9, 0x04);
immutable DoorEntryA doorEntry27 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC09D, 0x0378, 0x04);
immutable DoorEntryA doorEntry28 = DoorEntryA("MSG_INSEKI_POKEY_ONET", EventFlag.unknown0340 | eventFlagUnset, 0xC02A, 0x03CD, 0x00);
immutable DoorEntryA doorEntry29 = DoorEntryA("TEXT_DOOR_000", EventFlag.onetDoorClose, 0xC0AD, 0x03B4, 0x04);
immutable DoorEntryA doorEntry30 = DoorEntryA("TEXT_DOOR_030", EventFlag.none, 0x02E6, 0x008B, 0x01);
immutable DoorEntryA doorEntry31 = DoorEntryA(null, EventFlag.none, 0x0048, 0x03D1, 0x07);
immutable DoorEntryA doorEntry32 = DoorEntryA(null, EventFlag.none, 0xC0AD, 0x03D8, 0x07);
immutable DoorEntryA doorEntry33 = DoorEntryA(null, EventFlag.none, 0xC0CD, 0x03FC, 0x07);
immutable DoorEntryA doorEntry34 = DoorEntryA(null, EventFlag.onetMincesAppear, 0x800D, 0x03E3, 0x07);
immutable DoorEntryA doorEntry35 = DoorEntryA("TEXT_DOOR_035", EventFlag.none, 0x80BD, 0x03E3, 0x01);
immutable DoorEntryA doorEntry36 = DoorEntryA(null, EventFlag.none, 0x806D, 0x03C3, 0x0F);
immutable DoorEntryA doorEntry37 = DoorEntryA(null, EventFlag.none, 0xC01A, 0x03B9, 0x07);
immutable DoorEntryA doorEntry38 = DoorEntryA(null, EventFlag.none, 0x8031, 0x0363, 0x01);
immutable DoorEntryA doorEntry39 = DoorEntryA(null, EventFlag.none, 0xC00D, 0x03FC, 0x01);
immutable DoorEntryA doorEntry40 = DoorEntryA(null, EventFlag.none, 0x00D6, 0x00FC, 0x01);
immutable DoorEntryA doorEntry41 = DoorEntryA(null, EventFlag.none, 0x807D, 0x03A3, 0x0F);
immutable DoorEntryA doorEntry42 = DoorEntryA(null, EventFlag.none, 0x008E, 0x00D9, 0x0C);
immutable DoorEntryA doorEntry43 = DoorEntryA("TEXT_DOOR_043", EventFlag.myHomeDoorClose, 0x002B, 0x014B, 0x0A);
immutable DoorEntryA doorEntry44 = DoorEntryA(null, EventFlag.none, 0xC08D, 0x037C, 0x07);
immutable DoorEntryA doorEntry45 = DoorEntryA(null, EventFlag.none, 0xC0AD, 0x037C, 0x07);
immutable DoorEntryA doorEntry46 = DoorEntryA(null, EventFlag.none, 0x805D, 0x0363, 0x0F);
immutable DoorEntryA doorEntry47 = DoorEntryA(null, EventFlag.none, 0x00A1, 0x009A, 0x0A);
immutable DoorEntryA doorEntry48 = DoorEntryA("TEXT_DOOR_048", EventFlag.none, 0x006D, 0x010A, 0x01);
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
immutable DoorEntryA doorEntry63 = DoorEntryA("TEXT_DOOR_063", EventFlag.none, 0x002C, 0x012B, 0x0A);
immutable DoorEntryA doorEntry64 = DoorEntryA(null, EventFlag.none, 0xC09D, 0x0398, 0x07);
immutable DoorEntryA doorEntry65 = DoorEntryA(null, EventFlag.none, 0x00D3, 0x008F, 0x01);
immutable DoorEntryA doorEntry66 = DoorEntryA(null, EventFlag.none, 0x80BD, 0x0383, 0x0F);
immutable DoorEntryA doorEntry67 = DoorEntryA(null, EventFlag.none, 0x00BC, 0x0085, 0x0A);
immutable DoorEntryA doorEntry68 = DoorEntryA(null, EventFlag.none, 0xC05D, 0x03BC, 0x07);
immutable DoorEntryA doorEntry69 = DoorEntryA("TEXT_DOOR_069", EventFlag.none, 0x802A, 0x03A6, 0x0F);
immutable DoorEntryA doorEntry70 = DoorEntryA(null, EventFlag.none, 0x808A, 0x03E6, 0x07);
immutable DoorEntryA doorEntry71 = DoorEntryA("TEXT_DOOR_071", EventFlag.none, 0x801D, 0x03C3, 0x0F);
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
immutable DoorEntryA doorEntry82 = DoorEntryA("TEXT_DOOR_004", EventFlag._1fMizunoAppear, 0x0361, 0x01F4, 0x01);
immutable DoorEntryA doorEntry83 = DoorEntryA(null, EventFlag.none, 0x0048, 0x03E1, 0x07);
immutable DoorEntryA doorEntry84 = DoorEntryA(null, EventFlag.none, 0x00BC, 0x0391, 0x07);
immutable DoorEntryA doorEntry85 = DoorEntryA("TEXT_DOOR_085", EventFlag.none, 0xC07D, 0x03BC, 0x07);
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
immutable DoorEntryA doorEntry101 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0x00B2, 0x00FF, 0x01);
immutable DoorEntryA doorEntry102 = DoorEntryA(null, EventFlag.none, 0x0008, 0x03BD, 0x07);
immutable DoorEntryA doorEntry103 = DoorEntryA(null, EventFlag.none, 0xC139, 0x02F5, 0x01);
immutable DoorEntryA doorEntry104 = DoorEntryA(null, EventFlag.none, 0x003B, 0x0085, 0x01);
immutable DoorEntryA doorEntry105 = DoorEntryA(null, EventFlag.none, 0x003A, 0x009D, 0x01);
immutable DoorEntryA doorEntry106 = DoorEntryA(null, EventFlag.none, 0xC2D9, 0x01D5, 0x01);
immutable DoorEntryA doorEntry107 = DoorEntryA(null, EventFlag.none, 0xC2B9, 0x01D9, 0x01);
immutable DoorEntryA doorEntry108 = DoorEntryA(null, EventFlag.none, 0xC279, 0x01F5, 0x01);
immutable DoorEntryA doorEntry109 = DoorEntryA("TEXT_DOOR_109", EventFlag.none, 0x003F, 0x00B1, 0x01);
immutable DoorEntryA doorEntry110 = DoorEntryA(null, EventFlag.none, 0x0427, 0x0129, 0x01);
immutable DoorEntryA doorEntry111 = DoorEntryA(null, EventFlag.none, 0x8430, 0x00E7, 0x01);
immutable DoorEntryA doorEntry112 = DoorEntryA(null, EventFlag.none, 0x0413, 0x013D, 0x01);
immutable DoorEntryA doorEntry113 = DoorEntryA(null, EventFlag.none, 0xC139, 0x008C, 0x01);
immutable DoorEntryA doorEntry114 = DoorEntryA(null, EventFlag.none, 0x03F3, 0x00FD, 0x01);
immutable DoorEntryA doorEntry115 = DoorEntryA("TEXT_DOOR_115", EventFlag.winGianBoss | eventFlagUnset, 0x0027, 0x0089, 0x01);
immutable DoorEntryA doorEntry116 = DoorEntryA(null, EventFlag.none, 0x8138, 0x02E7, 0x01);
immutable DoorEntryA doorEntry117 = DoorEntryA(null, EventFlag.none, 0x409A, 0x03AC, 0x01);
immutable DoorEntryA doorEntry118 = DoorEntryA(null, EventFlag.none, 0xC139, 0x02BC, 0x01);
immutable DoorEntryA doorEntry119 = DoorEntryA(null, EventFlag.none, 0x8379, 0x01E3, 0x01);
immutable DoorEntryA doorEntry120 = DoorEntryA(null, EventFlag.none, 0xC109, 0x01BC, 0x01);
immutable DoorEntryA doorEntry121 = DoorEntryA(null, EventFlag.none, 0x82E9, 0x01E3, 0x01);
immutable DoorEntryA doorEntry122 = DoorEntryA(null, EventFlag.none, 0x813B, 0x02A3, 0x01);
immutable DoorEntryA doorEntry123 = DoorEntryA(null, EventFlag.none, 0xC109, 0x0189, 0x01);
immutable DoorEntryA doorEntry124 = DoorEntryA("TEXT_DOOR_124", EventFlag.unknown0340 | eventFlagUnset, 0x0075, 0x0092, 0x00);
immutable DoorEntryA doorEntry125 = DoorEntryA("TEXT_DOOR_125", EventFlag.unknown0340 | eventFlagUnset, 0x0085, 0x00B2, 0x00);
immutable DoorEntryA doorEntry126 = DoorEntryA("TEXT_DOOR_126", EventFlag.unknown0340 | eventFlagUnset, 0x00A2, 0x007F, 0x00);
immutable DoorEntryA doorEntry127 = DoorEntryA("TEXT_DOOR_127", EventFlag.unknown0340 | eventFlagUnset, 0x00DA, 0x00B4, 0x00);
immutable DoorEntryC doorEntry128 = DoorEntryC("MSG_ONET_KANBAN_1");
immutable DoorEntryC doorEntry129 = DoorEntryC("MSG_ONET_KANBAN_2");
immutable DoorEntryC doorEntry130 = DoorEntryC("MSG_ONET_KANBAN_3");
immutable DoorEntryC doorEntry131 = DoorEntryC("MSG_ONET_KANBAN_4");
immutable DoorEntryC doorEntry132 = DoorEntryC("MSG_ONET_KANBAN_5");
immutable DoorEntryC doorEntry133 = DoorEntryC("MSG_ONET_KANBAN_6");
immutable DoorEntryC doorEntry134 = DoorEntryC("MSG_ONET_KANBAN_7");
immutable DoorEntryC doorEntry135 = DoorEntryC("MSG_ONET_KANBAN_8");
immutable DoorEntryC doorEntry136 = DoorEntryC("MSG_ONET_KANBAN_9");
immutable DoorEntryC doorEntry137 = DoorEntryC("MSG_ONET_KANBAN_10");
immutable DoorEntryC doorEntry138 = DoorEntryC("MSG_ONET_KANBAN_11");
immutable DoorEntryA doorEntry139 = DoorEntryA("TEXT_DOOR_139", EventFlag.unknown0340 | eventFlagUnset, 0x00A0, 0x0151, 0x00);
immutable DoorEntryA doorEntry140 = DoorEntryA("TEXT_DOOR_140", EventFlag.unknown0340 | eventFlagUnset, 0x00D8, 0x0121, 0x00);
immutable DoorEntryA doorEntry141 = DoorEntryA("TEXT_DOOR_141", EventFlag.unknown0340 | eventFlagUnset, 0x00B2, 0x010B, 0x00);
immutable DoorEntryA doorEntry142 = DoorEntryA("TEXT_DOOR_142", EventFlag.unknown0340 | eventFlagUnset, 0x00AE, 0x0117, 0x00);
immutable DoorEntryC doorEntry143 = DoorEntryC("MSG_ONET_KANBAN_12");
immutable DoorEntryC doorEntry144 = DoorEntryC("MSG_ONET_KANBAN_13");
immutable DoorEntryC doorEntry145 = DoorEntryC("MSG_ONET_KANBAN_14");
immutable DoorEntryC doorEntry146 = DoorEntryC("MSG_ONET_KANBAN_15");
immutable DoorEntryC doorEntry147 = DoorEntryC("MSG_ONET_KANBAN_16");
immutable DoorEntryC doorEntry148 = DoorEntryC("MSG_ONET_KANBAN_17");
immutable DoorEntryC doorEntry149 = DoorEntryC("MSG_ONET_KANBAN_18");
immutable DoorEntryC doorEntry150 = DoorEntryC("MSG_INSEKI_CHECK");
immutable DoorEntryA doorEntry151 = DoorEntryA("TEXT_DOOR_151", EventFlag.unknown0340 | eventFlagUnset, 0x000C, 0x03E9, 0x00);
immutable DoorEntryA doorEntry152 = DoorEntryA("TEXT_DOOR_152", EventFlag.unknown0340 | eventFlagUnset, 0x000C, 0x03F1, 0x00);
immutable DoorEntryA doorEntry153 = DoorEntryA("TEXT_DOOR_153", EventFlag.unknown0340 | eventFlagUnset, 0x0058, 0x0379, 0x00);
immutable DoorEntryA doorEntry154 = DoorEntryA("TEXT_DOOR_154", EventFlag.unknown0340 | eventFlagUnset, 0x0058, 0x037D, 0x00);
immutable DoorEntryC doorEntry155 = DoorEntryC("MSG_READ_ONET_HALL_FRONT_SGN1");
immutable DoorEntryC doorEntry156 = DoorEntryC("MSG_READ_ONET_HOSP_PSSG_SGN3");
immutable DoorEntryC doorEntry157 = DoorEntryC("MSG_CHECK_BOOKSHELF1");
immutable DoorEntryC doorEntry158 = DoorEntryC("MSG_CHECK_BOOKSHELF1");
immutable DoorEntryC doorEntry159 = DoorEntryC("MSG_CHECK_BOOKSHELF1");
immutable DoorEntryC doorEntry160 = DoorEntryC("MSG_CHECK_BOOKSHELF4");
immutable DoorEntryC doorEntry161 = DoorEntryC("MSG_CHECK_BOOKSHELF1");
immutable DoorEntryC doorEntry162 = DoorEntryC("MSG_CHECK_BOOKSHELF1");
immutable DoorEntryC doorEntry163 = DoorEntryC("MSG_CHECK_FUDOUSAN_SHELF");
immutable DoorEntryA doorEntry164 = DoorEntryA(null, EventFlag.none, 0x418F, 0x0098, 0x01);
immutable DoorEntryA doorEntry165 = DoorEntryA(null, EventFlag.none, 0xC3FD, 0x0358, 0x04);
immutable DoorEntryA doorEntry166 = DoorEntryA(null, EventFlag.none, 0xC3FD, 0x0398, 0x04);
immutable DoorEntryA doorEntry167 = DoorEntryA(null, EventFlag.none, 0xC38D, 0x03C4, 0x01);
immutable DoorEntryA doorEntry168 = DoorEntryA(null, EventFlag.none, 0xC3BD, 0x0378, 0x06);
immutable DoorEntryA doorEntry169 = DoorEntryA(null, EventFlag.none, 0xC3AB, 0x038A, 0x06);
immutable DoorEntryA doorEntry170 = DoorEntryA("TEXT_DOOR_170", EventFlag.tlptThrk , 0xC39D, 0x03BC, 0x04);
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
immutable DoorEntryA doorEntry181 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x84E9, 0x0363, 0x01);
immutable DoorEntryA doorEntry182 = DoorEntryA("TEXT_DOOR_182", EventFlag.none, 0x84FC, 0x02E4, 0x01);
immutable DoorEntryA doorEntry183 = DoorEntryA("TEXT_DOOR_183", EventFlag.none, 0xC378, 0x01C4, 0x01);
immutable DoorEntryA doorEntry184 = DoorEntryA(null, EventFlag.none, 0x84EB, 0x03A3, 0x01);
immutable DoorEntryA doorEntry185 = DoorEntryA(null, EventFlag.none, 0xC4E9, 0x037C, 0x01);
immutable DoorEntryA doorEntry186 = DoorEntryA(null, EventFlag.none, 0x0119, 0x0216, 0x01);
immutable DoorEntryA doorEntry187 = DoorEntryA(null, EventFlag.none, 0xC459, 0x03C8, 0x07);
immutable DoorEntryA doorEntry188 = DoorEntryA(null, EventFlag.none, 0xC415, 0x03B8, 0x01);
immutable DoorEntryA doorEntry189 = DoorEntryA("TEXT_DOOR_189", EventFlag.none, 0x032F, 0x00AB, 0x01);
immutable DoorEntryA doorEntry190 = DoorEntryA("TEXT_DOOR_190", EventFlag.none, 0x032F, 0x00BC, 0x0C);
immutable DoorEntryA doorEntry191 = DoorEntryA(null, EventFlag.none, 0x033B, 0x0133, 0x0A);
immutable DoorEntryA doorEntry192 = DoorEntryA(null, EventFlag.none, 0x03DC, 0x0369, 0x07);
immutable DoorEntryA doorEntry193 = DoorEntryA(null, EventFlag.none, 0x0448, 0x03D1, 0x07);
immutable DoorEntryA doorEntry194 = DoorEntryA("TEXT_DOOR_194", EventFlag.none, 0x0332, 0x00D2, 0x0C);
immutable DoorEntryA doorEntry195 = DoorEntryA(null, EventFlag.none, 0x03DC, 0x0371, 0x07);
immutable DoorEntryA doorEntry196 = DoorEntryA("TEXT_DOOR_196", EventFlag.none, 0x0373, 0x0109, 0x0A);
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
immutable DoorEntryA doorEntry232 = DoorEntryA("TEXT_DOOR_232", EventFlag.none, 0x0331, 0x0116, 0x0A);
immutable DoorEntryA doorEntry233 = DoorEntryA(null, EventFlag.none, 0x839D, 0x03A3, 0x07);
immutable DoorEntryA doorEntry234 = DoorEntryA("TEXT_DOOR_234", EventFlag.none, 0x8431, 0x034B, 0x07);
immutable DoorEntryA doorEntry235 = DoorEntryA("TEXT_DOOR_235", EventFlag.twsnMichikoThankYou | eventFlagUnset, 0xC3AD, 0x03FC, 0x07);
immutable DoorEntryA doorEntry236 = DoorEntryA(null, EventFlag.none, 0x0398, 0x03B1, 0x07);
immutable DoorEntryA doorEntry237 = DoorEntryA("TEXT_DOOR_237", EventFlag.thrkTunnelClose, 0xC442, 0x009F, 0x01);
immutable DoorEntryA doorEntry238 = DoorEntryA("TEXT_DOOR_238", EventFlag.tlptThrk | eventFlagUnset, 0x849B, 0x0231, 0x01);
immutable DoorEntryA doorEntry239 = DoorEntryA("TEXT_DOOR_239", EventFlag.unknown0340 | eventFlagUnset, 0x0347, 0x012A, 0x00);
immutable DoorEntryA doorEntry240 = DoorEntryA("TEXT_DOOR_240", EventFlag.unknown0340 | eventFlagUnset, 0x03A3, 0x010D, 0x00);
immutable DoorEntryC doorEntry241 = DoorEntryC("MSG_READ_TWSN_SIGN1");
immutable DoorEntryC doorEntry242 = DoorEntryC("MSG_READ_TWSN_SIGN5");
immutable DoorEntryC doorEntry243 = DoorEntryC("MSG_READ_TWSN_SIGN6");
immutable DoorEntryC doorEntry244 = DoorEntryC("MSG_READ_TWSN_SIGN7");
immutable DoorEntryC doorEntry245 = DoorEntryC("MSG_READ_TWSN_SIGN8");
immutable DoorEntryC doorEntry246 = DoorEntryC("MSG_READ_TWSN_SIGN9");
immutable DoorEntryC doorEntry247 = DoorEntryC("MSG_READ_TWSN_SIGN10");
immutable DoorEntryC doorEntry248 = DoorEntryC("MSG_READ_TWSN_HOSP_FRONT_SGN1");
immutable DoorEntryA doorEntry249 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC139, 0x029C, 0x01);
immutable DoorEntryA doorEntry250 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC1A9, 0x021C, 0x01);
immutable DoorEntryA doorEntry251 = DoorEntryA(null, EventFlag.none, 0xC0DD, 0x037C, 0x04);
immutable DoorEntryA doorEntry252 = DoorEntryA(null, EventFlag.none, 0xC10D, 0x03BC, 0x04);
immutable DoorEntryA doorEntry253 = DoorEntryA("TEXT_DOOR_253", EventFlag.tlptThrk , 0xC122, 0x03F1, 0x04);
immutable DoorEntryA doorEntry254 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x80D1, 0x0187, 0x01);
immutable DoorEntryA doorEntry255 = DoorEntryA("TEXT_DOOR_255", EventFlag.tlptBaka | eventFlagUnset, 0xC101, 0x03F0, 0x04);
immutable DoorEntryA doorEntry256 = DoorEntryA(null, EventFlag.none, 0xC0CD, 0x037C, 0x04);
immutable DoorEntryA doorEntry257 = DoorEntryA(null, EventFlag.none, 0xC0DD, 0x03BC, 0x04);
immutable DoorEntryA doorEntry258 = DoorEntryA(null, EventFlag.none, 0x80CD, 0x03A3, 0x0F);
immutable DoorEntryA doorEntry259 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0x03F8, 0x01CA, 0x0A);
immutable DoorEntryA doorEntry260 = DoorEntryA(null, EventFlag.none, 0x03B8, 0x0202, 0x0A);
immutable DoorEntryA doorEntry261 = DoorEntryA(null, EventFlag.none, 0x80CD, 0x0363, 0x0F);
immutable DoorEntryA doorEntry262 = DoorEntryA(null, EventFlag.none, 0x03EC, 0x0202, 0x0A);
immutable DoorEntryA doorEntry263 = DoorEntryA(null, EventFlag.none, 0x03C3, 0x01D7, 0x0A);
immutable DoorEntryA doorEntry264 = DoorEntryA(null, EventFlag.none, 0x03E4, 0x01B9, 0x0A);
immutable DoorEntryA doorEntry265 = DoorEntryA(null, EventFlag.none, 0x80F2, 0x03A6, 0x0F);
immutable DoorEntryA doorEntry266 = DoorEntryA("TEXT_DOOR_266", EventFlag.none, 0x8122, 0x03AE, 0x07);
immutable DoorEntryA doorEntry267 = DoorEntryA(null, EventFlag.none, 0x80DA, 0x03E6, 0x0F);
immutable DoorEntryA doorEntry268 = DoorEntryA("TEXT_DOOR_268", EventFlag.none, 0xC0DA, 0x03F9, 0x07);
immutable DoorEntryA doorEntry269 = DoorEntryA("TEXT_DOOR_269", EventFlag.none, 0x03DC, 0x01DF, 0x0A);
immutable DoorEntryA doorEntry270 = DoorEntryA(null, EventFlag.none, 0x00C5, 0x02E9, 0x01);
immutable DoorEntryA doorEntry271 = DoorEntryA("TEXT_DOOR_271", EventFlag.none, 0x83B4, 0x01BA, 0x01);
immutable DoorEntryA doorEntry272 = DoorEntryA(null, EventFlag.none, 0x008A, 0x02E6, 0x01);
immutable DoorEntryA doorEntry273 = DoorEntryA(null, EventFlag.none, 0x03B8, 0x01F7, 0x01);
immutable DoorEntryC doorEntry274 = DoorEntryC("MSG_HAPPY_SIGN1");
immutable DoorEntryC doorEntry275 = DoorEntryC("MSG_HAPPY_SIGN2");
immutable DoorEntryA doorEntry276 = DoorEntryA(null, EventFlag.none, 0x81A9, 0x01E3, 0x01);
immutable DoorEntryA doorEntry277 = DoorEntryA(null, EventFlag.none, 0xC4CD, 0x0374, 0x04);
immutable DoorEntryA doorEntry278 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x8139, 0x0263, 0x01);
immutable DoorEntryA doorEntry279 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC4E9, 0x03DC, 0x01);
immutable DoorEntryA doorEntry280 = DoorEntryA(null, EventFlag.none, 0x009A, 0x02D7, 0x0A);
immutable DoorEntryA doorEntry281 = DoorEntryA("TEXT_DOOR_281", EventFlag.winLlptBoss | eventFlagUnset, 0x03F5, 0x0182, 0x01);
immutable DoorEntryA doorEntry282 = DoorEntryA(null, EventFlag.none, 0xC3C4, 0x020C, 0x01);
immutable DoorEntryA doorEntry283 = DoorEntryA("TEXT_DOOR_001", EventFlag.none, 0x008B, 0x01F1, 0x01);
immutable DoorEntryA doorEntry284 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x0401, 0x023C, 0x01);
immutable DoorEntryA doorEntry285 = DoorEntryA(null, EventFlag.none, 0x04B1, 0x033C, 0x01);
immutable DoorEntryA doorEntry286 = DoorEntryA(null, EventFlag.none, 0xC4CD, 0x03F8, 0x04);
immutable DoorEntryA doorEntry287 = DoorEntryA(null, EventFlag.none, 0xC48D, 0x035C, 0x04);
immutable DoorEntryA doorEntry288 = DoorEntryA(null, EventFlag.none, 0xC4EF, 0x03FA, 0x01);
immutable DoorEntryA doorEntry289 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x03B8, 0x04);
immutable DoorEntryA doorEntry290 = DoorEntryA("TEXT_DOOR_290", EventFlag.none, 0xC4FC, 0x03DB, 0x01);
immutable DoorEntryA doorEntry291 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x0374, 0x04);
immutable DoorEntryA doorEntry292 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x03FC, 0x06);
immutable DoorEntryA doorEntry293 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x0374, 0x06);
immutable DoorEntryA doorEntry294 = DoorEntryA(null, EventFlag.none, 0xC4DD, 0x035C, 0x01);
immutable DoorEntryA doorEntry295 = DoorEntryA(null, EventFlag.none, 0xC4DD, 0x03F8, 0x06);
immutable DoorEntryA doorEntry296 = DoorEntryA(null, EventFlag.none, 0xC4DA, 0x0379, 0x04);
immutable DoorEntryA doorEntry297 = DoorEntryA(null, EventFlag.none, 0xC4DA, 0x03B5, 0x04);
immutable DoorEntryA doorEntry298 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x84FC, 0x0224, 0x01);
immutable DoorEntryA doorEntry299 = DoorEntryA(null, EventFlag.none, 0xC489, 0x0388, 0x07);
immutable DoorEntryA doorEntry300 = DoorEntryA(null, EventFlag.none, 0xC48D, 0x03E4, 0x01);
immutable DoorEntryA doorEntry301 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0x0462, 0x02B3, 0x0A);
immutable DoorEntryA doorEntry302 = DoorEntryA(null, EventFlag.none, 0x04DC, 0x03C9, 0x07);
immutable DoorEntryA doorEntry303 = DoorEntryA(null, EventFlag.none, 0x048E, 0x029C, 0x0C);
immutable DoorEntryA doorEntry304 = DoorEntryA(null, EventFlag.none, 0x0488, 0x0351, 0x07);
immutable DoorEntryA doorEntry305 = DoorEntryA(null, EventFlag.none, 0x04DC, 0x03D1, 0x07);
immutable DoorEntryA doorEntry306 = DoorEntryA(null, EventFlag.none, 0x0488, 0x03CD, 0x07);
immutable DoorEntryA doorEntry307 = DoorEntryA("TEXT_DOOR_307", EventFlag.none, 0xC49D, 0x03BC, 0x07);
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
immutable DoorEntryA doorEntry340 = DoorEntryA("MSG_THRK_PRISON", EventFlag.thrkPrisonOpen | eventFlagUnset, 0x84BD, 0x0322, 0x07);
immutable DoorEntryA doorEntry341 = DoorEntryA(null, EventFlag.none, 0xC49B, 0x032E, 0x01);
immutable DoorEntryA doorEntry342 = DoorEntryA("TEXT_DOOR_342", EventFlag.thrkTunnelClose, 0x83C2, 0x0140, 0x01);
immutable DoorEntryA doorEntry343 = DoorEntryA(null, EventFlag.none, 0xC4FC, 0x02BB, 0x01);
immutable DoorEntryA doorEntry344 = DoorEntryA(null, EventFlag.none, 0x800C, 0x0304, 0x01);
immutable DoorEntryA doorEntry345 = DoorEntryA(null, EventFlag.none, 0xC3C2, 0x0187, 0x01);
immutable DoorEntryA doorEntry346 = DoorEntryA("TEXT_DOOR_346", EventFlag.none, 0x84E6, 0x0032, 0x01);
immutable DoorEntryC doorEntry347 = DoorEntryC("MSG_CHECK_THRK_HOSP_ROOM1_SHELF");
immutable DoorEntryC doorEntry348 = DoorEntryC("MSG_READ_THRK_HOSP_PSSG_SGN1");
immutable DoorEntryA doorEntry349 = DoorEntryA("TEXT_DOOR_349", EventFlag.unknown0340 | eventFlagUnset, 0x0452, 0x02C1, 0x00);
immutable DoorEntryA doorEntry350 = DoorEntryA("TEXT_DOOR_350", EventFlag.unknown0340 | eventFlagUnset, 0x0455, 0x02F5, 0x00);
immutable DoorEntryA doorEntry351 = DoorEntryA("TEXT_DOOR_351", EventFlag.unknown0340 | eventFlagUnset, 0x0449, 0x0305, 0x00);
immutable DoorEntryA doorEntry352 = DoorEntryA("TEXT_DOOR_352", EventFlag.unknown0340 | eventFlagUnset, 0x047C, 0x026D, 0x00);
immutable DoorEntryA doorEntry353 = DoorEntryA("TEXT_DOOR_353", EventFlag.unknown0340 | eventFlagUnset, 0x047A, 0x02D3, 0x00);
immutable DoorEntryA doorEntry354 = DoorEntryA("TEXT_DOOR_354", EventFlag.unknown0340 | eventFlagUnset, 0x0462, 0x030D, 0x00);
immutable DoorEntryA doorEntry355 = DoorEntryA("TEXT_DOOR_355", EventFlag.unknown0340 | eventFlagUnset, 0x0487, 0x02DF, 0x00);
immutable DoorEntryC doorEntry356 = DoorEntryC("MSG_READ_THRK_SIGN1");
immutable DoorEntryC doorEntry357 = DoorEntryC("MSG_READ_THRK_SIGN2");
immutable DoorEntryC doorEntry358 = DoorEntryC("MSG_READ_THRK_SIGN3");
immutable DoorEntryC doorEntry359 = DoorEntryC("MSG_READ_THRK_SIGN4");
immutable DoorEntryC doorEntry360 = DoorEntryC("MSG_READ_THRK_SIGN5");
immutable DoorEntryC doorEntry361 = DoorEntryC("MSG_READ_THRK_SIGN6");
immutable DoorEntryC doorEntry362 = DoorEntryC("MSG_READ_THRK_SIGN7");
immutable DoorEntryC doorEntry363 = DoorEntryC("MSG_READ_THRK_SIGN8");
immutable DoorEntryC doorEntry364 = DoorEntryC("MSG_READ_THRK_SIGN9");
immutable DoorEntryA doorEntry365 = DoorEntryA(null, EventFlag.none, 0xC141, 0x03E8, 0x04);
immutable DoorEntryA doorEntry366 = DoorEntryA(null, EventFlag.none, 0xC13D, 0x03B8, 0x04);
immutable DoorEntryA doorEntry367 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC0F8, 0x03CB, 0x01);
immutable DoorEntryA doorEntry368 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC0D8, 0x038B, 0x01);
immutable DoorEntryA doorEntry369 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC0D8, 0x03CB, 0x01);
immutable DoorEntryA doorEntry370 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC0F8, 0x038B, 0x01);
immutable DoorEntryA doorEntry371 = DoorEntryA("TEXT_DOOR_001", EventFlag.none, 0xC014, 0x0280, 0x01);
immutable DoorEntryA doorEntry372 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x801C, 0x0267, 0x01);
immutable DoorEntryA doorEntry373 = DoorEntryA("TEXT_DOOR_373", EventFlag.none, 0xC1B8, 0x00F8, 0x01);
immutable DoorEntryA doorEntry374 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x81D0, 0x008B, 0x01);
immutable DoorEntryA doorEntry375 = DoorEntryA(null, EventFlag.none, 0xC169, 0x03F8, 0x04);
immutable DoorEntryA doorEntry376 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC26C, 0x035C, 0x01);
immutable DoorEntryA doorEntry377 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x01C5, 0x036C, 0x01);
immutable DoorEntryA doorEntry378 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC2E8, 0x020B, 0x01);
immutable DoorEntryC doorEntry379 = DoorEntryC("MSG_WINS_CHECK_DRUG");
immutable DoorEntryA doorEntry380 = DoorEntryA(null, EventFlag.none, 0x0124, 0x0057, 0x0A);
immutable DoorEntryA doorEntry381 = DoorEntryA(null, EventFlag.none, 0x013C, 0x03DA, 0x07);
immutable DoorEntryA doorEntry382 = DoorEntryA(null, EventFlag.none, 0x013C, 0x03D1, 0x07);
immutable DoorEntryA doorEntry383 = DoorEntryA(null, EventFlag.none, 0x8164, 0x03E0, 0x0F);
immutable DoorEntryA doorEntry384 = DoorEntryA(null, EventFlag.none, 0x017C, 0x03DA, 0x07);
immutable DoorEntryA doorEntry385 = DoorEntryA(null, EventFlag.none, 0x017C, 0x03D1, 0x07);
immutable DoorEntryA doorEntry386 = DoorEntryA(null, EventFlag.none, 0xC0CD, 0x03D8, 0x07);
immutable DoorEntryA doorEntry387 = DoorEntryA(null, EventFlag.none, 0xC0CD, 0x0394, 0x07);
immutable DoorEntryA doorEntry388 = DoorEntryA(null, EventFlag.none, 0x8181, 0x03C7, 0x0F);
immutable DoorEntryA doorEntry389 = DoorEntryA("TEXT_DOOR_389", EventFlag.none, 0x0112, 0x003E, 0x0A);
immutable DoorEntryA doorEntry390 = DoorEntryA(null, EventFlag.none, 0x0263, 0x0028, 0x0A);
immutable DoorEntryA doorEntry391 = DoorEntryA(null, EventFlag.none, 0x80F0, 0x0364, 0x0F);
immutable DoorEntryA doorEntry392 = DoorEntryA(null, EventFlag.none, 0xC0ED, 0x03D8, 0x07);
immutable DoorEntryA doorEntry393 = DoorEntryA(null, EventFlag.none, 0xC0ED, 0x0398, 0x07);
immutable DoorEntryA doorEntry394 = DoorEntryA(null, EventFlag.none, 0x8141, 0x03C7, 0x0F);
immutable DoorEntryA doorEntry395 = DoorEntryA("TEXT_DOOR_395", EventFlag.none, 0x01A3, 0x002B, 0x01);
immutable DoorEntryA doorEntry396 = DoorEntryA("TEXT_DOOR_395", EventFlag.none, 0x01A7, 0x0033, 0x01);
immutable DoorEntryA doorEntry397 = DoorEntryA("TEXT_DOOR_395", EventFlag.none, 0x01A3, 0x0047, 0x01);
immutable DoorEntryA doorEntry398 = DoorEntryA("TEXT_DOOR_395", EventFlag.none, 0x018F, 0x0063, 0x01);
immutable DoorEntryA doorEntry399 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0x015B, 0x0043, 0x01);
immutable DoorEntryA doorEntry400 = DoorEntryA(null, EventFlag.none, 0x0245, 0x0061, 0x01);
immutable DoorEntryA doorEntry401 = DoorEntryA("TEXT_DOOR_401", EventFlag.none, 0x024A, 0x0055, 0x01);
immutable DoorEntryA doorEntry402 = DoorEntryA("TEXT_DOOR_402", EventFlag.none, 0x0215, 0x0035, 0x01);
immutable DoorEntryA doorEntry403 = DoorEntryA("TEXT_DOOR_403", EventFlag.winRainBoss | eventFlagUnset, 0x01E1, 0x0019, 0x01);
immutable DoorEntryA doorEntry404 = DoorEntryA(null, EventFlag.none, 0x8434, 0x0167, 0x01);
immutable DoorEntryA doorEntry405 = DoorEntryA(null, EventFlag.none, 0xC034, 0x0298, 0x01);
immutable DoorEntryA doorEntry406 = DoorEntryA(null, EventFlag.none, 0x826C, 0x0307, 0x01);
immutable DoorEntryA doorEntry407 = DoorEntryA(null, EventFlag.none, 0xC438, 0x01BC, 0x01);
immutable DoorEntryA doorEntry408 = DoorEntryA("TEXT_DOOR_408", EventFlag.none, 0x0261, 0x0051, 0x01);
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
immutable DoorEntryA doorEntry432 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x819B, 0x03A3, 0x01);
immutable DoorEntryA doorEntry433 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x02C1, 0x01FC, 0x01);
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
immutable DoorEntryA doorEntry446 = DoorEntryA("TEXT_DOOR_446", EventFlag.winMlkyBoss | eventFlagUnset, 0x0295, 0x004E, 0x01);
immutable DoorEntryA doorEntry447 = DoorEntryA("TEXT_DOOR_447", EventFlag.none, 0x02BD, 0x0066, 0x01);
immutable DoorEntryA doorEntry448 = DoorEntryA(null, EventFlag.none, 0x0391, 0x0045, 0x01);
immutable DoorEntryA doorEntry449 = DoorEntryA("TEXT_DOOR_447", EventFlag.none, 0x0295, 0x001E, 0x01);
immutable DoorEntryA doorEntry450 = DoorEntryA(null, EventFlag.none, 0x024F, 0x022E, 0x01);
immutable DoorEntryA doorEntry451 = DoorEntryA(null, EventFlag.none, 0x0395, 0x0035, 0x01);
immutable DoorEntryA doorEntry452 = DoorEntryA(null, EventFlag.none, 0xC279, 0x03B9, 0x01);
immutable DoorEntryA doorEntry453 = DoorEntryA("TEXT_DOOR_001", EventFlag.none, 0x011F, 0x0395, 0x01);
immutable DoorEntryA doorEntry454 = DoorEntryA(null, EventFlag.none, 0x810C, 0x036B, 0x01);
immutable DoorEntryA doorEntry455 = DoorEntryA(null, EventFlag.none, 0x8199, 0x0343, 0x01);
immutable DoorEntryA doorEntry456 = DoorEntryA(null, EventFlag.none, 0x0055, 0x034D, 0x01);
immutable DoorEntryA doorEntry457 = DoorEntryA(null, EventFlag.none, 0x81B9, 0x0343, 0x01);
immutable DoorEntryA doorEntry458 = DoorEntryA(null, EventFlag.none, 0xC199, 0x03BD, 0x01);
immutable DoorEntryA doorEntry459 = DoorEntryA(null, EventFlag.none, 0xC199, 0x03FC, 0x01);
immutable DoorEntryA doorEntry460 = DoorEntryA("TEXT_DOOR_460", EventFlag.none, 0x03E2, 0x0019, 0x01);
immutable DoorEntryA doorEntry461 = DoorEntryA("TEXT_DOOR_461", EventFlag.unknown0340 | eventFlagUnset, 0x0021, 0x031C, 0x01);
immutable DoorEntryC doorEntry462 = DoorEntryC("MSG_READ_DGPM1_SIGN1");
immutable DoorEntryA doorEntry463 = DoorEntryA(null, EventFlag.none, 0xC3E9, 0x03CB, 0x04);
immutable DoorEntryA doorEntry464 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC1A9, 0x0350, 0x01);
immutable DoorEntryA doorEntry465 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x0281, 0x018C, 0x01);
immutable DoorEntryA doorEntry466 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x828D, 0x0183, 0x01);
immutable DoorEntryA doorEntry467 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC379, 0x03F9, 0x01);
immutable DoorEntryA doorEntry468 = DoorEntryA(null, EventFlag.none, 0xC3E9, 0x032B, 0x04);
immutable DoorEntryA doorEntry469 = DoorEntryA(null, EventFlag.none, 0xC3E9, 0x038B, 0x04);
immutable DoorEntryA doorEntry470 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC1B9, 0x035C, 0x01);
immutable DoorEntryA doorEntry471 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC28D, 0x019C, 0x01);
immutable DoorEntryA doorEntry472 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x8279, 0x0383, 0x01);
immutable DoorEntryA doorEntry473 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0x03CC, 0x001B, 0x0A);
immutable DoorEntryA doorEntry474 = DoorEntryA(null, EventFlag.none, 0x03C4, 0x0037, 0x0A);
immutable DoorEntryA doorEntry475 = DoorEntryA(null, EventFlag.none, 0x03A0, 0x001B, 0x0A);
immutable DoorEntryA doorEntry476 = DoorEntryA(null, EventFlag.none, 0x03A7, 0x0018, 0x01);
immutable DoorEntryA doorEntry477 = DoorEntryA(null, EventFlag.none, 0x03B0, 0x0015, 0x01);
immutable DoorEntryA doorEntry478 = DoorEntryA(null, EventFlag.none, 0x03AA, 0x002D, 0x01);
immutable DoorEntryA doorEntry479 = DoorEntryA(null, EventFlag.none, 0x03AC, 0x0025, 0x01);
immutable DoorEntryA doorEntry480 = DoorEntryA(null, EventFlag.none, 0xC10D, 0x03D8, 0x01);
immutable DoorEntryA doorEntry481 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC00C, 0x035B, 0x01);
immutable DoorEntryA doorEntry482 = DoorEntryA(null, EventFlag.none, 0xC0ED, 0x03F4, 0x01);
immutable DoorEntryA doorEntry483 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x81AC, 0x02C4, 0x01);
immutable DoorEntryA doorEntry484 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x81AC, 0x02C4, 0x01);
immutable DoorEntryA doorEntry485 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC35A, 0x03F8, 0x01);
immutable DoorEntryA doorEntry486 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x0413, 0x0031, 0x01);
immutable DoorEntryA doorEntry487 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x0291, 0x03B8, 0x01);
immutable DoorEntryA doorEntry488 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x843C, 0x03C4, 0x01);
immutable DoorEntryA doorEntry489 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0xC43C, 0x03FB, 0x01);
immutable DoorEntryC doorEntry490 = DoorEntryC("MSG_CHECK_DESERT_SIGN");
immutable DoorEntryA doorEntry491 = DoorEntryA("TEXT_DOOR_346", EventFlag.none, 0x04B4, 0x01B3, 0x01);
immutable DoorEntryA doorEntry492 = DoorEntryA("TEXT_DOOR_346", EventFlag.none, 0x04DC, 0x00AF, 0x01);
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
immutable DoorEntryA doorEntry504 = DoorEntryA("TEXT_DOOR_346", EventFlag.none, 0x04B6, 0x01C9, 0x01);
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
immutable DoorEntryA doorEntry548 = DoorEntryA("TEXT_DOOR_548", EventFlag.none, 0xC4E6, 0x02CD, 0x01);
immutable DoorEntryA doorEntry549 = DoorEntryA("MSG_WARP_STEP_FOUR", EventFlag.none, 0x827E, 0x0118, 0x01);
immutable DoorEntryA doorEntry550 = DoorEntryA(null, EventFlag.none, 0xC4E6, 0x020D, 0x01);
immutable DoorEntryA doorEntry551 = DoorEntryA(null, EventFlag.none, 0x84E6, 0x0232, 0x01);
immutable DoorEntryA doorEntry552 = DoorEntryA(null, EventFlag.none, 0xC30D, 0x02DC, 0x01);
immutable DoorEntryA doorEntry553 = DoorEntryA(null, EventFlag.none, 0x8339, 0x02A7, 0x04);
immutable DoorEntryA doorEntry554 = DoorEntryA("TEXT_DOOR_554", EventFlag.none, 0xC35D, 0x02FC, 0x04);
immutable DoorEntryA doorEntry555 = DoorEntryA("TEXT_DOOR_555", EventFlag.none, 0xC2A5, 0x02C8, 0x01);
immutable DoorEntryA doorEntry556 = DoorEntryA("TEXT_DOOR_556", EventFlag.fourTonzuraFree | eventFlagUnset, 0xC357, 0x0296, 0x06);
immutable DoorEntryA doorEntry557 = DoorEntryA("TEXT_DOOR_001", EventFlag.none, 0x0184, 0x01BB, 0x01);
immutable DoorEntryA doorEntry558 = DoorEntryA(null, EventFlag.none, 0xC2B5, 0x027C, 0x04);
immutable DoorEntryA doorEntry559 = DoorEntryA(null, EventFlag.none, 0xC2FD, 0x02FC, 0x01);
immutable DoorEntryA doorEntry560 = DoorEntryA(null, EventFlag.none, 0xC2AD, 0x0238, 0x06);
immutable DoorEntryA doorEntry561 = DoorEntryA("TEXT_DOOR_561", EventFlag.none, 0xC1AC, 0x0317, 0x01);
immutable DoorEntryA doorEntry562 = DoorEntryA(null, EventFlag.none, 0x8209, 0x02A3, 0x04);
immutable DoorEntryA doorEntry563 = DoorEntryA(null, EventFlag.none, 0x0308, 0x02B2, 0x07);
immutable DoorEntryA doorEntry564 = DoorEntryA(null, EventFlag.none, 0x02DB, 0x02C9, 0x07);
immutable DoorEntryA doorEntry565 = DoorEntryA(null, EventFlag.none, 0x02DB, 0x02D1, 0x07);
immutable DoorEntryA doorEntry566 = DoorEntryA("TEXT_DOOR_566", EventFlag.fourElev, 0x82A5, 0x02AB, 0x0D);
immutable DoorEntryA doorEntry567 = DoorEntryA(null, EventFlag.none, 0xC281, 0x02C0, 0x07);
immutable DoorEntryA doorEntry568 = DoorEntryA(null, EventFlag.none, 0xC2C1, 0x02C8, 0x07);
immutable DoorEntryA doorEntry569 = DoorEntryA(null, EventFlag.none, 0x0327, 0x02ED, 0x07);
immutable DoorEntryA doorEntry570 = DoorEntryA(null, EventFlag.none, 0xC28D, 0x0298, 0x07);
immutable DoorEntryA doorEntry571 = DoorEntryA(null, EventFlag.none, 0x02DB, 0x02A9, 0x07);
immutable DoorEntryA doorEntry572 = DoorEntryA(null, EventFlag.none, 0x02DB, 0x02B1, 0x07);
immutable DoorEntryA doorEntry573 = DoorEntryA("TEXT_DOOR_573", EventFlag.none, 0x830C, 0x0224, 0x07);
immutable DoorEntryA doorEntry574 = DoorEntryA(null, EventFlag.none, 0xC28D, 0x02F8, 0x07);
immutable DoorEntryA doorEntry575 = DoorEntryA(null, EventFlag.none, 0xC2AD, 0x0298, 0x07);
immutable DoorEntryA doorEntry576 = DoorEntryA(null, EventFlag.none, 0x0268, 0x02ED, 0x07);
immutable DoorEntryA doorEntry577 = DoorEntryA("TEXT_DOOR_577", EventFlag.fourElev, 0x832D, 0x02E3, 0x0D);
immutable DoorEntryA doorEntry578 = DoorEntryA(null, EventFlag.none, 0x026B, 0x02AE, 0x07);
immutable DoorEntryA doorEntry579 = DoorEntryA(null, EventFlag.none, 0x0288, 0x0290, 0x07);
immutable DoorEntryA doorEntry580 = DoorEntryA(null, EventFlag.none, 0xC32B, 0x029A, 0x07);
immutable DoorEntryA doorEntry581 = DoorEntryA(null, EventFlag.none, 0xC24F, 0x01AF, 0x0C);
immutable DoorEntryA doorEntry582 = DoorEntryA(null, EventFlag.none, 0x82ED, 0x0283, 0x0F);
immutable DoorEntryA doorEntry583 = DoorEntryA(null, EventFlag.none, 0xC2AD, 0x02F8, 0x07);
immutable DoorEntryA doorEntry584 = DoorEntryA(null, EventFlag.none, 0xC2CD, 0x0298, 0x07);
immutable DoorEntryA doorEntry585 = DoorEntryA(null, EventFlag.none, 0x828D, 0x0283, 0x07);
immutable DoorEntryA doorEntry586 = DoorEntryA("TEXT_DOOR_586", EventFlag.fourElev, 0xC32D, 0x02F8, 0x0D);
immutable DoorEntryA doorEntry587 = DoorEntryA("TEXT_DOOR_587", EventFlag.none, 0x0278, 0x0285, 0x0D);
immutable DoorEntryA doorEntry588 = DoorEntryA("TEXT_DOOR_588", EventFlag.none, 0x0203, 0x01B0, 0x01);
immutable DoorEntryA doorEntry589 = DoorEntryA(null, EventFlag.none, 0x02A8, 0x028A, 0x07);
immutable DoorEntryA doorEntry590 = DoorEntryA(null, EventFlag.none, 0x8341, 0x0226, 0x07);
immutable DoorEntryA doorEntry591 = DoorEntryA(null, EventFlag.none, 0xC2CD, 0x02F8, 0x07);
immutable DoorEntryA doorEntry592 = DoorEntryA(null, EventFlag.none, 0xC2ED, 0x02F8, 0x07);
immutable DoorEntryA doorEntry593 = DoorEntryA(null, EventFlag.none, 0x02A8, 0x0290, 0x07);
immutable DoorEntryA doorEntry594 = DoorEntryA("TEXT_DOOR_594", EventFlag.fourElev, 0xC30D, 0x02F8, 0x0D);
immutable DoorEntryA doorEntry595 = DoorEntryA(null, EventFlag.none, 0x826D, 0x02E3, 0x07);
immutable DoorEntryA doorEntry596 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x02F8, 0x07);
immutable DoorEntryA doorEntry597 = DoorEntryA(null, EventFlag.none, 0x026B, 0x02C1, 0x07);
immutable DoorEntryA doorEntry598 = DoorEntryA(null, EventFlag.none, 0x826D, 0x0283, 0x07);
immutable DoorEntryA doorEntry599 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x0298, 0x07);
immutable DoorEntryA doorEntry600 = DoorEntryA(null, EventFlag.none, 0x830D, 0x02E3, 0x07);
immutable DoorEntryA doorEntry601 = DoorEntryA(null, EventFlag.none, 0x02C8, 0x0290, 0x07);
immutable DoorEntryA doorEntry602 = DoorEntryA(null, EventFlag.none, 0x02F8, 0x02F1, 0x07);
immutable DoorEntryA doorEntry603 = DoorEntryA(null, EventFlag.none, 0x82B1, 0x0223, 0x0F);
immutable DoorEntryA doorEntry604 = DoorEntryA("TEXT_DOOR_604", EventFlag.fourOK | eventFlagUnset, 0x82ED, 0x02E3, 0x07);
immutable DoorEntryA doorEntry605 = DoorEntryA(null, EventFlag.fourStairwayAppear | eventFlagUnset, 0xC209, 0x02BC, 0x0F);
immutable DoorEntryA doorEntry606 = DoorEntryA(null, EventFlag.fourYudanRoboDisappear | eventFlagUnset, 0x02EC, 0x02C2, 0x07);
immutable DoorEntryA doorEntry607 = DoorEntryA(null, EventFlag.none, 0x82CD, 0x0283, 0x07);
immutable DoorEntryA doorEntry608 = DoorEntryA(null, EventFlag.none, 0xC2D9, 0x02E8, 0x07);
immutable DoorEntryA doorEntry609 = DoorEntryA(null, EventFlag.none, 0xC31D, 0x02CC, 0x01);
immutable DoorEntryA doorEntry610 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0xC24B, 0x0142, 0x01);
immutable DoorEntryA doorEntry611 = DoorEntryA(null, EventFlag.none, 0xC27D, 0x02FC, 0x07);
immutable DoorEntryA doorEntry612 = DoorEntryA(null, EventFlag.none, 0xC27D, 0x0238, 0x07);
immutable DoorEntryA doorEntry613 = DoorEntryA(null, EventFlag.none, 0x832D, 0x02A3, 0x0F);
immutable DoorEntryA doorEntry614 = DoorEntryA(null, EventFlag.none, 0xC33D, 0x02D8, 0x07);
immutable DoorEntryA doorEntry615 = DoorEntryA(null, EventFlag.none, 0xC35D, 0x02D8, 0x07);
immutable DoorEntryA doorEntry616 = DoorEntryA(null, EventFlag.none, 0xC1C9, 0x0173, 0x01);
immutable DoorEntryA doorEntry617 = DoorEntryA(null, EventFlag.none, 0x82FD, 0x02E3, 0x01);
immutable DoorEntryA doorEntry618 = DoorEntryA(null, EventFlag.none, 0xC2DD, 0x02DC, 0x07);
immutable DoorEntryA doorEntry619 = DoorEntryA("TEXT_DOOR_587", EventFlag.none, 0x02D8, 0x0285, 0x0D);
immutable DoorEntryA doorEntry620 = DoorEntryA(null, EventFlag.none, 0x032C, 0x02C5, 0x07);
immutable DoorEntryA doorEntry621 = DoorEntryA(null, EventFlag.none, 0x829D, 0x02E3, 0x07);
immutable DoorEntryA doorEntry622 = DoorEntryA(null, EventFlag.none, 0x830D, 0x02A3, 0x0F);
immutable DoorEntryA doorEntry623 = DoorEntryA(null, EventFlag.none, 0xC31D, 0x02FC, 0x07);
immutable DoorEntryA doorEntry624 = DoorEntryA(null, EventFlag.none, 0xC34D, 0x02DC, 0x07);
immutable DoorEntryA doorEntry625 = DoorEntryA(null, EventFlag.none, 0x0318, 0x02B1, 0x07);
immutable DoorEntryA doorEntry626 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x02CC, 0x07);
immutable DoorEntryA doorEntry627 = DoorEntryA("TEXT_DOOR_587", EventFlag.none, 0x0298, 0x0285, 0x0D);
immutable DoorEntryA doorEntry628 = DoorEntryA("TEXT_DOOR_628", EventFlag.fourMaidThanks | eventFlagUnset, 0x02B8, 0x0285, 0x0D);
immutable DoorEntryA doorEntry629 = DoorEntryA(null, EventFlag.none, 0xC2BD, 0x02FC, 0x07);
immutable DoorEntryA doorEntry630 = DoorEntryA("TEXT_DOOR_630", EventFlag.none, 0xC218, 0x01C2, 0x0C);
immutable DoorEntryA doorEntry631 = DoorEntryA(null, EventFlag.none, 0x032C, 0x02D1, 0x07);
immutable DoorEntryA doorEntry632 = DoorEntryA(null, EventFlag.none, 0x0318, 0x02BD, 0x07);
immutable DoorEntryA doorEntry633 = DoorEntryA("TEXT_DOOR_633", EventFlag.unknown0340 | eventFlagUnset, 0x035E, 0x02BE, 0x00);
immutable DoorEntryA doorEntry634 = DoorEntryA(null, EventFlag.fourKomoritaAppear | eventFlagUnset, 0xC35D, 0x02BC, 0x07);
immutable DoorEntryA doorEntry635 = DoorEntryA(null, EventFlag.none, 0x835D, 0x02E2, 0x01);
immutable DoorEntryA doorEntry636 = DoorEntryA("TEXT_DOOR_636", EventFlag.none, 0xC2DD, 0x026C, 0x07);
immutable DoorEntryA doorEntry637 = DoorEntryA(null, EventFlag.none, 0xC26D, 0x023C, 0x07);
immutable DoorEntryA doorEntry638 = DoorEntryA("TEXT_DOOR_638", EventFlag.none, 0x823E, 0x0179, 0x0A);
immutable DoorEntryA doorEntry639 = DoorEntryA(null, EventFlag.fourTopoloBoyBAppear | eventFlagUnset, 0xC34D, 0x02BC, 0x07);
immutable DoorEntryA doorEntry640 = DoorEntryA("TEXT_DOOR_640", EventFlag.none, 0x02A8, 0x0259, 0x07);
immutable DoorEntryA doorEntry641 = DoorEntryA("TEXT_DOOR_641", EventFlag.none, 0xC1E2, 0x0142, 0x0A);
immutable DoorEntryA doorEntry642 = DoorEntryA("TEXT_DOOR_642", EventFlag.none, 0x82DD, 0x0233, 0x07);
immutable DoorEntryA doorEntry643 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x0044, 0x0283, 0x01);
immutable DoorEntryA doorEntry644 = DoorEntryA(null, EventFlag.none, 0x8299, 0x0227, 0x07);
immutable DoorEntryA doorEntry645 = DoorEntryA(null, EventFlag.none, 0x82AB, 0x024D, 0x07);
immutable DoorEntryA doorEntry646 = DoorEntryA(null, EventFlag.none, 0xC297, 0x027B, 0x01);
immutable DoorEntryA doorEntry647 = DoorEntryA("TEXT_DOOR_647", EventFlag.none, 0x0217, 0x0192, 0x0A);
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
immutable DoorEntryA doorEntry669 = DoorEntryA("TEXT_DOOR_669", EventFlag.none, 0x4200, 0x01ED, 0x01);
immutable DoorEntryA doorEntry670 = DoorEntryA(null, EventFlag.none, 0xC26C, 0x021B, 0x07);
immutable DoorEntryA doorEntry671 = DoorEntryA(null, EventFlag.none, 0x0194, 0x01A9, 0x07);
immutable DoorEntryC doorEntry672 = DoorEntryC("MSG_READ_FOUR_SIGN1");
immutable DoorEntryC doorEntry673 = DoorEntryC("MSG_READ_FOUR_SIGN2");
immutable DoorEntryC doorEntry674 = DoorEntryC("MSG_READ_FOUR_SIGN3");
immutable DoorEntryA doorEntry675 = DoorEntryA("TEXT_DOOR_675", EventFlag.unknown0340 | eventFlagUnset, 0x02DB, 0x02B9, 0x00);
immutable DoorEntryC doorEntry676 = DoorEntryC("MSG_READ_FOUR_HOSP_FRONT_SGN1");
immutable DoorEntryC doorEntry677 = DoorEntryC("MSG_READ_NO_DOCUMENT");
immutable DoorEntryC doorEntry678 = DoorEntryC("MSG_READ_FOUR_HOSP_PSSG_SGN2");
immutable DoorEntryC doorEntry679 = DoorEntryC("MSG_READ_FOUR_MUSE_EXHI_SGN1");
immutable DoorEntryC doorEntry680 = DoorEntryC("MSG_SEARCH_FOUR_BRGS_BAR_SDOR");
immutable DoorEntryC doorEntry681 = DoorEntryC("MSG_LIBRARY_PEOPLE_D");
immutable DoorEntryA doorEntry682 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x035C, 0x04);
immutable DoorEntryA doorEntry683 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC478, 0x03AB, 0x04);
immutable DoorEntryA doorEntry684 = DoorEntryA(null, EventFlag.none, 0xC47D, 0x035C, 0x04);
immutable DoorEntryA doorEntry685 = DoorEntryA("TEXT_DOOR_685", EventFlag.sumsStoicReserved | eventFlagUnset, 0xC47A, 0x03D9, 0x01);
immutable DoorEntryA doorEntry686 = DoorEntryA("TEXT_DOOR_686", EventFlag.none, 0xC4AD, 0x037C, 0x04);
immutable DoorEntryA doorEntry687 = DoorEntryA(null, EventFlag.none, 0xC4BD, 0x035C, 0x04);
immutable DoorEntryA doorEntry688 = DoorEntryA(null, EventFlag.none, 0xC4CD, 0x03D4, 0x04);
immutable DoorEntryA doorEntry689 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC4AD, 0x035C, 0x04);
immutable DoorEntryA doorEntry690 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC4A9, 0x0390, 0x04);
immutable DoorEntryA doorEntry691 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC4A9, 0x03D0, 0x04);
immutable DoorEntryA doorEntry692 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC4CD, 0x0354, 0x04);
immutable DoorEntryA doorEntry693 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC4CD, 0x0394, 0x04);
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
immutable DoorEntryA doorEntry704 = DoorEntryA("TEXT_DOOR_704", EventFlag.none, 0x84AD, 0x0362, 0x01);
immutable DoorEntryA doorEntry705 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x039C, 0x07);
immutable DoorEntryA doorEntry706 = DoorEntryA(null, EventFlag.none, 0xC470, 0x03F3, 0x0F);
immutable DoorEntryA doorEntry707 = DoorEntryA(null, EventFlag.none, 0xC478, 0x03FB, 0x0F);
immutable DoorEntryA doorEntry708 = DoorEntryA(null, EventFlag.none, 0xC49D, 0x03DC, 0x07);
immutable DoorEntryA doorEntry709 = DoorEntryA(null, EventFlag.none, 0x849D, 0x0343, 0x0F);
immutable DoorEntryA doorEntry710 = DoorEntryA(null, EventFlag.none, 0x0154, 0x0297, 0x0A);
immutable DoorEntryA doorEntry711 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x0154, 0x0268, 0x0A);
immutable DoorEntryA doorEntry712 = DoorEntryA(null, EventFlag.none, 0x0155, 0x02C2, 0x0F);
immutable DoorEntryA doorEntry713 = DoorEntryA(null, EventFlag.none, 0x8449, 0x038B, 0x0F);
immutable DoorEntryA doorEntry714 = DoorEntryA(null, EventFlag.none, 0x845C, 0x0384, 0x0F);
immutable DoorEntryA doorEntry715 = DoorEntryA(null, EventFlag.none, 0xC45C, 0x03BB, 0x0F);
immutable DoorEntryA doorEntry716 = DoorEntryA("TEXT_DOOR_716", EventFlag.none, 0x0155, 0x0237, 0x0A);
immutable DoorEntryA doorEntry717 = DoorEntryA(null, EventFlag.none, 0x0448, 0x0398, 0x07);
immutable DoorEntryA doorEntry718 = DoorEntryA(null, EventFlag.none, 0x0448, 0x03A8, 0x07);
immutable DoorEntryA doorEntry719 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x0163, 0x0362, 0x0A);
immutable DoorEntryA doorEntry720 = DoorEntryA(null, EventFlag.none, 0xC457, 0x0379, 0x01);
immutable DoorEntryA doorEntry721 = DoorEntryA("TEXT_DOOR_647", EventFlag.none, 0x0152, 0x02EE, 0x0A);
immutable DoorEntryA doorEntry722 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x0163, 0x0376, 0x0A);
immutable DoorEntryA doorEntry723 = DoorEntryA(null, EventFlag.none, 0x84AD, 0x03E3, 0x07);
immutable DoorEntryA doorEntry724 = DoorEntryA(null, EventFlag.none, 0x8455, 0x0347, 0x0F);
immutable DoorEntryA doorEntry725 = DoorEntryA("TEXT_DOOR_725", EventFlag.none, 0x0163, 0x0382, 0x0A);
immutable DoorEntryA doorEntry726 = DoorEntryA(null, EventFlag.none, 0x04A8, 0x03AD, 0x07);
immutable DoorEntryA doorEntry727 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x0163, 0x0396, 0x0A);
immutable DoorEntryA doorEntry728 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x0163, 0x03A2, 0x0A);
immutable DoorEntryA doorEntry729 = DoorEntryA(null, EventFlag.none, 0x015B, 0x036A, 0x0A);
immutable DoorEntryC doorEntry730 = DoorEntryC("MSG_READ_SUMS_HIER_EXHI1_SGN1");
immutable DoorEntryC doorEntry731 = DoorEntryC("MSG_READ_SUMS_HIER_EXHI1_SGN2");
immutable DoorEntryC doorEntry732 = DoorEntryC("MSG_READ_SUMS_HIER_EXHI1_SGN4");
immutable DoorEntryC doorEntry733 = DoorEntryC("MSG_READ_SUMS_HIER_EXHI1_SGN5");
immutable DoorEntryC doorEntry734 = DoorEntryC("MSG_READ_SUMS_HIER_EXHI1_SGN3");
immutable DoorEntryC doorEntry735 = DoorEntryC("MSG_READ_SUMS_HIER_EXHI1_SGN6");
immutable DoorEntryC doorEntry736 = DoorEntryC("MSG_READ_SUMS_HIER_EXHI2_SGN1");
immutable DoorEntryC doorEntry737 = DoorEntryC("MSG_READ_SUMS_HOSP_PSSG_SGN1");
immutable DoorEntryA doorEntry738 = DoorEntryA("TEXT_DOOR_738", EventFlag.unknown0340 | eventFlagUnset, 0x015B, 0x038B, 0x00);
immutable DoorEntryA doorEntry739 = DoorEntryA("TEXT_DOOR_739", EventFlag.unknown0340 | eventFlagUnset, 0x015B, 0x03AB, 0x00);
immutable DoorEntryC doorEntry740 = DoorEntryC("MSG_READ_SUMMERS_SIGN3");
immutable DoorEntryC doorEntry741 = DoorEntryC("MSG_READ_SUMMERS_SIGN4");
immutable DoorEntryC doorEntry742 = DoorEntryC("MSG_READ_SUMMERS_SIGN5");
immutable DoorEntryA doorEntry743 = DoorEntryA(null, EventFlag.none, 0xC411, 0x03F8, 0x01);
immutable DoorEntryA doorEntry744 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3C9, 0x0370, 0x01);
immutable DoorEntryA doorEntry745 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3F9, 0x03B4, 0x01);
immutable DoorEntryA doorEntry746 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3E9, 0x0370, 0x01);
immutable DoorEntryA doorEntry747 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3D9, 0x03B0, 0x01);
immutable DoorEntryA doorEntry748 = DoorEntryA("TEXT_DOOR_004", EventFlag.ramaRabbitDisappear | eventFlagUnset, 0xC396, 0x021C, 0x01);
immutable DoorEntryA doorEntry749 = DoorEntryA("TEXT_DOOR_001", EventFlag.none, 0x82B1, 0x0103, 0x01);
immutable DoorEntryA doorEntry750 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x01D4, 0x0220, 0x01);
immutable DoorEntryA doorEntry751 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x01E4, 0x0250, 0x01);
immutable DoorEntryA doorEntry752 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x01F4, 0x0228, 0x01);
immutable DoorEntryA doorEntry753 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x01EC, 0x0218, 0x01);
immutable DoorEntryA doorEntry754 = DoorEntryA(null, EventFlag.none, 0x8411, 0x03C7, 0x01);
immutable DoorEntryA doorEntry755 = DoorEntryA(null, EventFlag.none, 0xC411, 0x0368, 0x01);
immutable DoorEntryA doorEntry756 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0x01BA, 0x0239, 0x01);
immutable DoorEntryA doorEntry757 = DoorEntryA(null, EventFlag.none, 0x023A, 0x024E, 0x05);
immutable DoorEntryA doorEntry758 = DoorEntryA(null, EventFlag.none, 0xC436, 0x023C, 0x01);
immutable DoorEntryA doorEntry759 = DoorEntryA(null, EventFlag.none, 0x020A, 0x021D, 0x01);
immutable DoorEntryA doorEntry760 = DoorEntryA(null, EventFlag.none, 0x0437, 0x0221, 0x05);
immutable DoorEntryA doorEntry761 = DoorEntryA(null, EventFlag.none, 0x0437, 0x0234, 0x05);
immutable DoorEntryA doorEntry762 = DoorEntryA(null, EventFlag.none, 0x0397, 0x01F1, 0x05);
immutable DoorEntryA doorEntry763 = DoorEntryA(null, EventFlag.none, 0x02B7, 0x012E, 0x05);
immutable DoorEntryA doorEntry764 = DoorEntryA(null, EventFlag.none, 0x8399, 0x01E7, 0x01);
immutable DoorEntryA doorEntry765 = DoorEntryA("TEXT_DOOR_765", EventFlag.winPinkBoss | eventFlagUnset, 0x0306, 0x01C5, 0x01);
immutable DoorEntryA doorEntry766 = DoorEntryA(null, EventFlag.none, 0x047A, 0x0216, 0x05);
immutable DoorEntryA doorEntry767 = DoorEntryA(null, EventFlag.none, 0xC42D, 0x03E8, 0x01);
immutable DoorEntryA doorEntry768 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3D9, 0x0334, 0x01);
immutable DoorEntryA doorEntry769 = DoorEntryA(null, EventFlag.none, 0xC3B9, 0x0334, 0x01);
immutable DoorEntryA doorEntry770 = DoorEntryA(null, EventFlag.none, 0xC36B, 0x03E6, 0x01);
immutable DoorEntryA doorEntry771 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3F9, 0x0334, 0x01);
immutable DoorEntryA doorEntry772 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x8139, 0x02C7, 0x01);
immutable DoorEntryA doorEntry773 = DoorEntryA("TEXT_DOOR_773", EventFlag.dungeonMan, 0xC1A9, 0x033C, 0x01);
immutable DoorEntryC doorEntry774 = DoorEntryC("MSG_SKRB_SPHINX");
immutable DoorEntryB doorEntry775 = DoorEntryB(EventFlag.tlptSkrb | eventFlagUnset, "MSG_SKRB_SWITCH_01");
immutable DoorEntryB doorEntry776 = DoorEntryB(EventFlag.sphinx | eventFlagUnset, "MSG_SKRB_SWITCH_03");
immutable DoorEntryB doorEntry777 = DoorEntryB(EventFlag.sphinx | eventFlagUnset, "MSG_SKRB_SWITCH_05");
immutable DoorEntryB doorEntry778 = DoorEntryB(EventFlag.sphinx | eventFlagUnset, "MSG_SKRB_SWITCH_02");
immutable DoorEntryB doorEntry779 = DoorEntryB(EventFlag.sphinx | eventFlagUnset, "MSG_SKRB_SWITCH_04");
immutable DoorEntryA doorEntry780 = DoorEntryA("TEXT_DOOR_780", EventFlag.none, 0x0205, 0x0099, 0x01);
immutable DoorEntryA doorEntry781 = DoorEntryA(null, EventFlag.none, 0x0200, 0x00CC, 0x01);
immutable DoorEntryA doorEntry782 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x01F8, 0x00B8, 0x01);
immutable DoorEntryA doorEntry783 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x0204, 0x00AC, 0x01);
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
immutable DoorEntryA doorEntry807 = DoorEntryA("TEXT_DOOR_807", EventFlag.itemTakanome | eventFlagUnset, 0x81BD, 0x0283, 0x01);
immutable DoorEntryA doorEntry808 = DoorEntryA(null, EventFlag.none, 0xC2B9, 0x0214, 0x01);
immutable DoorEntryA doorEntry809 = DoorEntryA(null, EventFlag.none, 0x82D9, 0x0203, 0x01);
immutable DoorEntryA doorEntry810 = DoorEntryA(null, EventFlag.none, 0xC1A9, 0x02AC, 0x01);
immutable DoorEntryA doorEntry811 = DoorEntryA(null, EventFlag.none, 0x02F9, 0x020A, 0x05);
immutable DoorEntryA doorEntry812 = DoorEntryA(null, EventFlag.none, 0x81BD, 0x02E3, 0x01);
immutable DoorEntryA doorEntry813 = DoorEntryA(null, EventFlag.none, 0xC2F9, 0x0210, 0x01);
immutable DoorEntryA doorEntry814 = DoorEntryA("TEXT_DOOR_814", EventFlag.none, 0x02AC, 0x00D7, 0x01);
immutable ushort doorEntry815 = 0x015B;
immutable DoorEntryC doorEntry816 = DoorEntryC("MSG_SKRB_PYRAMID_SWITCH");
immutable DoorEntryC doorEntry817 = DoorEntryC("MSG_SKRB_PYRAMID_TAKANOME");
immutable DoorEntryA doorEntry818 = DoorEntryA(null, EventFlag.none, 0x4048, 0x0025, 0x01);
immutable DoorEntryA doorEntry819 = DoorEntryA(null, EventFlag.none, 0x004A, 0x0035, 0x01);
immutable DoorEntryA doorEntry820 = DoorEntryA(null, EventFlag.none, 0x004A, 0x002D, 0x01);
immutable DoorEntryA doorEntry821 = DoorEntryA(null, EventFlag.none, 0x4048, 0x003D, 0x01);
immutable DoorEntryA doorEntry822 = DoorEntryA(null, EventFlag.none, 0xC34A, 0x02F8, 0x01);
immutable DoorEntryA doorEntry823 = DoorEntryA(null, EventFlag.none, 0x8055, 0x020B, 0x01);
immutable DoorEntryA doorEntry824 = DoorEntryA("TEXT_DOOR_824", EventFlag.unknown0340 | eventFlagUnset, 0x0270, 0x00A7, 0x01);
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
immutable DoorEntryA doorEntry839 = DoorEntryA("TEXT_DOOR_839", EventFlag.unknown0340 | eventFlagUnset, 0x000A, 0x0251, 0x00);
immutable DoorEntryC doorEntry840 = DoorEntryC("MSG_READ_DDMM1_SIGN19");
immutable DoorEntryC doorEntry841 = DoorEntryC("MSG_READ_DDMM1_SIGN21");
immutable DoorEntryC doorEntry842 = DoorEntryC("MSG_READ_DDMM1_SIGN20");
immutable DoorEntryC doorEntry843 = DoorEntryC("MSG_READ_DDMM1_SIGN18");
immutable DoorEntryC doorEntry844 = DoorEntryC("MSG_READ_DDMM1_SIGN10");
immutable DoorEntryC doorEntry845 = DoorEntryC("MSG_READ_DDMM1_SIGN11");
immutable DoorEntryC doorEntry846 = DoorEntryC("MSG_READ_DDMM1_SIGN12");
immutable DoorEntryC doorEntry847 = DoorEntryC("MSG_READ_DDMM1_SIGN17");
immutable DoorEntryC doorEntry848 = DoorEntryC("MSG_READ_DDMM1_SIGN16");
immutable DoorEntryC doorEntry849 = DoorEntryC("MSG_READ_DDMM1_SIGN14");
immutable DoorEntryC doorEntry850 = DoorEntryC("MSG_READ_DDMM1_SIGN15");
immutable DoorEntryC doorEntry851 = DoorEntryC("MSG_READ_DDMM1_SIGN22");
immutable DoorEntryC doorEntry852 = DoorEntryC("MSG_READ_DDMM1_SIGN13");
immutable DoorEntryC doorEntry853 = DoorEntryC("MSG_READ_DDMM1_SIGN8");
immutable DoorEntryC doorEntry854 = DoorEntryC("MSG_READ_DDMM1_SIGN7");
immutable DoorEntryC doorEntry855 = DoorEntryC("MSG_READ_DDMM1_SIGN9");
immutable DoorEntryC doorEntry856 = DoorEntryC("MSG_READ_DDMM1_SIGN3");
immutable DoorEntryC doorEntry857 = DoorEntryC("MSG_READ_DDMM1_SIGN4");
immutable DoorEntryC doorEntry858 = DoorEntryC("MSG_READ_DDMM1_SIGN2");
immutable DoorEntryC doorEntry859 = DoorEntryC("MSG_READ_DDMM1_SIGN6");
immutable DoorEntryC doorEntry860 = DoorEntryC("MSG_READ_DDMM1_SIGN5");
immutable DoorEntryC doorEntry861 = DoorEntryC("MSG_READ_DDMM1_SIGN1");
immutable DoorEntryC doorEntry862 = DoorEntryC("MSG_READ_DDMM1_SIGN44");
immutable DoorEntryC doorEntry863 = DoorEntryC("MSG_READ_DDMM2_SIGN23");
immutable DoorEntryC doorEntry864 = DoorEntryC("MSG_READ_DDMM2_SIGN24");
immutable DoorEntryC doorEntry865 = DoorEntryC("MSG_READ_DDMM2_SIGN25");
immutable DoorEntryC doorEntry866 = DoorEntryC("MSG_READ_DDMM2_SIGN35");
immutable DoorEntryC doorEntry867 = DoorEntryC("MSG_READ_DDMM2_SIGN34");
immutable DoorEntryC doorEntry868 = DoorEntryC("MSG_READ_DDMM2_SIGN29");
immutable DoorEntryC doorEntry869 = DoorEntryC("MSG_READ_DDMM2_SIGN26");
immutable DoorEntryC doorEntry870 = DoorEntryC("MSG_READ_DDMM2_SIGN27");
immutable DoorEntryC doorEntry871 = DoorEntryC("MSG_READ_DDMM2_SIGN33");
immutable DoorEntryC doorEntry872 = DoorEntryC("MSG_READ_DDMM2_SIGN32");
immutable DoorEntryC doorEntry873 = DoorEntryC("MSG_READ_DDMM2_SIGN31");
immutable DoorEntryC doorEntry874 = DoorEntryC("MSG_READ_DDMM2_SIGN28");
immutable DoorEntryC doorEntry875 = DoorEntryC("MSG_READ_DDMM2_SIGN30");
immutable DoorEntryC doorEntry876 = DoorEntryC("MSG_READ_DDMM3_SIGN36");
immutable DoorEntryC doorEntry877 = DoorEntryC("MSG_READ_DDMM3_SIGN39");
immutable DoorEntryC doorEntry878 = DoorEntryC("MSG_READ_DDMM3_SIGN37");
immutable DoorEntryC doorEntry879 = DoorEntryC("MSG_READ_DDMM3_SIGN41");
immutable DoorEntryC doorEntry880 = DoorEntryC("MSG_READ_DDMM3_SIGN40");
immutable DoorEntryC doorEntry881 = DoorEntryC("MSG_READ_DDMM3_SIGN38");
immutable DoorEntryC doorEntry882 = DoorEntryC("MSG_READ_DDMM4_SIGN42");
immutable DoorEntryC doorEntry883 = DoorEntryC("MSG_READ_DDMM4_SIGN43");
immutable DoorEntryA doorEntry884 = DoorEntryA("TEXT_DOOR_884", EventFlag.none, 0xC00E, 0x0054, 0x01);
immutable DoorEntryA doorEntry885 = DoorEntryA("TEXT_DOOR_885", EventFlag.winLumiBoss | eventFlagUnset, 0x0257, 0x0392, 0x05);
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
immutable DoorEntryA doorEntry903 = DoorEntryA("TEXT_DOOR_903", EventFlag.none, 0x0090, 0x018F, 0x21);
immutable DoorEntryA doorEntry904 = DoorEntryA("TEXT_DOOR_904", EventFlag.none, 0x0371, 0x0232, 0x01);
immutable DoorEntryA doorEntry905 = DoorEntryA(null, EventFlag.gumiCaveOpen | eventFlagUnset, 0x0142, 0x0093, 0x01);
immutable DoorEntryA doorEntry906 = DoorEntryA(null, EventFlag.none, 0x4030, 0x0013, 0x01);
immutable DoorEntryA doorEntry907 = DoorEntryA("TEXT_DOOR_907", EventFlag.gumiTalkerStone | eventFlagUnset, 0xC072, 0x01F4, 0x01);
immutable DoorEntryA doorEntry908 = DoorEntryA(null, EventFlag.none, 0xC4BA, 0x0310, 0x01);
immutable DoorEntryA doorEntry909 = DoorEntryA(null, EventFlag.none, 0x800E, 0x0037, 0x01);
immutable DoorEntryC doorEntry910 = DoorEntryC("MSG_READ_GMIM0_SIGN3");
immutable DoorEntryC doorEntry911 = DoorEntryC("MSG_READ_GMIM0_SIGN1");
immutable DoorEntryC doorEntry912 = DoorEntryC("MSG_READ_GMIM0_SIGN4");
immutable DoorEntryA doorEntry913 = DoorEntryA(null, EventFlag.none, 0xC011, 0x02F4, 0x01);
immutable DoorEntryA doorEntry914 = DoorEntryA("TEXT_DOOR_004", EventFlag.none, 0x8351, 0x0167, 0x01);
immutable DoorEntryA doorEntry915 = DoorEntryA("TEXT_DOOR_915", EventFlag.winFireBoss | eventFlagUnset, 0x04D3, 0x0319, 0x01);
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
immutable DoorEntryA doorEntry943 = DoorEntryA("TEXT_DOOR_943", EventFlag.none, 0x40FE, 0x0211, 0x01);
immutable DoorEntryA doorEntry944 = DoorEntryA(null, EventFlag.none, 0x03B8, 0x006C, 0x0E);
immutable DoorEntryA doorEntry945 = DoorEntryA(null, EventFlag.none, 0x02EC, 0x0054, 0x0E);
immutable DoorEntryA doorEntry946 = DoorEntryA(null, EventFlag.none, 0x031C, 0x0034, 0x0E);
immutable DoorEntryA doorEntry947 = DoorEntryA(null, EventFlag.none, 0x0398, 0x0070, 0x0E);
immutable DoorEntryA doorEntry948 = DoorEntryA(null, EventFlag.none, 0x02F4, 0x0018, 0x01);
immutable DoorEntryA doorEntry949 = DoorEntryA(null, EventFlag.none, 0xC3FA, 0x03F5, 0x04);
immutable DoorEntryA doorEntry950 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3EA, 0x03B9, 0x04);
immutable DoorEntryA doorEntry951 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3DA, 0x03F9, 0x04);
immutable DoorEntryA doorEntry952 = DoorEntryA("TEXT_DOOR_367", EventFlag.none, 0xC3CA, 0x03B9, 0x04);
immutable DoorEntryA doorEntry953 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x824C, 0x02FD, 0x0A);
immutable DoorEntryA doorEntry954 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x8248, 0x02ED, 0x0A);
immutable DoorEntryA doorEntry955 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0x8250, 0x0281, 0x0A);
immutable DoorEntryA doorEntry956 = DoorEntryA("TEXT_DOOR_711", EventFlag.none, 0x020C, 0x0291, 0x0A);
immutable DoorEntryC doorEntry957 = DoorEntryC("MSG_READ_MGKT_SIGN1");
immutable DoorEntryC doorEntry958 = DoorEntryC("MSG_READ_MGKT_SIGN2");
immutable DoorEntryC doorEntry959 = DoorEntryC("MSG_CHECK_MGKT_CLOCK");
immutable DoorEntryC doorEntry960 = DoorEntryC("MSG_CHECK_MGKT_SNOWMAN_1");
immutable DoorEntryC doorEntry961 = DoorEntryC("MSG_CHECK_MGKT_SNOWMAN_2");
immutable DoorEntryC doorEntry962 = DoorEntryC("MSG_CHECK_MGKT_SNOWMAN_3");
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
immutable DoorEntryA doorEntry973 = DoorEntryA("TEXT_DOOR_101", EventFlag.none, 0x01DC, 0x03DC, 0x0A);
immutable DoorEntryA doorEntry974 = DoorEntryA(null, EventFlag.none, 0x0207, 0x03DA, 0x0A);
immutable DoorEntryC doorEntry975 = DoorEntryC("MSG_MOON_MUSEUM_PLATE");
immutable DoorEntryC doorEntry976 = DoorEntryC("MSG_READ_MOON_SIGN1");
immutable DoorEntryC doorEntry977 = DoorEntryC("MSG_SYS_NOPROBLEM");

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
	SpritePlacement(NPCID.unknown1254, 0x70, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry1 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1251, 0x70, 0xD0),
	SpritePlacement(NPCID.unknown1267, 0xA0, 0x30),
	SpritePlacement(NPCID.unknown1259, 0xB0, 0x48),
	SpritePlacement(NPCID.unknown1256, 0xF0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry2 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1253, 0x88, 0x80),
	SpritePlacement(NPCID.unknown1250, 0xC0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry3 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0197, 0x18, 0xE8),
	SpritePlacement(NPCID.unknown0196, 0x30, 0xB8),
	SpritePlacement(NPCID.unknown0195, 0xB0, 0x40),
	SpritePlacement(NPCID.unknown0194, 0xC0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry4 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0193, 0x38, 0xF0),
	SpritePlacement(NPCID.unknown0124, 0x70, 0xD8),
	SpritePlacement(NPCID.unknown0125, 0x80, 0x30),
	SpritePlacement(NPCID.unknown0192, 0x80, 0x48),
	SpritePlacement(NPCID.unknown0160, 0xE8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry5 = SpritePlacementEntry(9, [
	SpritePlacement(NPCID.unknown0198, 0x90, 0x20),
	SpritePlacement(NPCID.unknown0164, 0x98, 0x38),
	SpritePlacement(NPCID.unknown0165, 0xA0, 0x20),
	SpritePlacement(NPCID.unknown0187, 0xE0, 0x60),
	SpritePlacement(NPCID.unknown0201, 0xE8, 0x88),
	SpritePlacement(NPCID.unknown0158, 0xF0, 0x48),
	SpritePlacement(NPCID.unknown0157, 0xF0, 0x78),
	SpritePlacement(NPCID.unknown0161, 0xF8, 0x58),
	SpritePlacement(NPCID.unknown0188, 0xF8, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry6 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1246, 0xC8, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry7 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1197, 0x58, 0x48),
	SpritePlacement(NPCID.unknown1207, 0x58, 0x70),
	SpritePlacement(NPCID.unknown1198, 0x60, 0x90),
	SpritePlacement(NPCID.unknown1199, 0x98, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry8 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1530, 0xC8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry9 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0676, 0xA8, 0x08),
	SpritePlacement(NPCID.unknown1449, 0xB0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry10 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1270, 0xB0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry11 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1269, 0xD0, 0x38),
	SpritePlacement(NPCID.unknown1271, 0xF8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry12 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0709, 0xF8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry13 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0079, 0x60, 0x60),
	SpritePlacement(NPCID.unknown0080, 0x60, 0xA8),
	SpritePlacement(NPCID.unknown0081, 0x78, 0x48),
	SpritePlacement(NPCID.unknown0082, 0x88, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry14 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0062, 0x48, 0xB0),
	SpritePlacement(NPCID.unknown0073, 0xC0, 0x48),
	SpritePlacement(NPCID.unknown0074, 0xC0, 0x58),
	SpritePlacement(NPCID.unknown0075, 0xC0, 0x68),
	SpritePlacement(NPCID.unknown0076, 0xC0, 0x78),
	SpritePlacement(NPCID.unknown0077, 0xC0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry15 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0064, 0x40, 0x10),
	SpritePlacement(NPCID.unknown0063, 0x60, 0x08),
	SpritePlacement(NPCID.unknown0086, 0xC8, 0xC0),
	SpritePlacement(NPCID.unknown0087, 0xD0, 0x98),
	SpritePlacement(NPCID.unknown0088, 0xF0, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry16 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0072, 0x60, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry17 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1255, 0x08, 0xA0),
	SpritePlacement(NPCID.unknown1258, 0x90, 0x88),
	SpritePlacement(NPCID.unknown1263, 0x90, 0xA0),
	SpritePlacement(NPCID.unknown1261, 0xA0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry18 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1257, 0x48, 0x60),
	SpritePlacement(NPCID.unknown1252, 0x50, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry19 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1266, 0x30, 0x88),
	SpritePlacement(NPCID.unknown1567, 0x50, 0x60),
	SpritePlacement(NPCID.unknown1264, 0x60, 0x60),
	SpritePlacement(NPCID.unknown1262, 0x68, 0x98),
	SpritePlacement(NPCID.unknown1265, 0x70, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry20 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0156, 0x90, 0xF8),
	SpritePlacement(NPCID.unknown0126, 0xF8, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry21 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1407, 0xA8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry22 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0159, 0x18, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry23 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0182, 0x70, 0x30),
	SpritePlacement(NPCID.unknown0149, 0xA0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry24 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0148, 0x58, 0x60),
	SpritePlacement(NPCID.unknown0183, 0x70, 0x68),
	SpritePlacement(NPCID.unknown0152, 0xF0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry25 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1559, 0x80, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry26 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1558, 0x70, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry27 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1201, 0x18, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry28 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1536, 0x00, 0xC8),
	SpritePlacement(NPCID.unknown1537, 0xC0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry29 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1202, 0x00, 0x60),
	SpritePlacement(NPCID.unknown1200, 0x00, 0x78),
	SpritePlacement(NPCID.unknown1534, 0x68, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry30 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0677, 0x50, 0xA4),
	SpritePlacement(NPCID.unknown1450, 0xB8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry31 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1274, 0x30, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry32 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1273, 0x10, 0xB0),
	SpritePlacement(NPCID.unknown1275, 0x18, 0x58),
	SpritePlacement(NPCID.unknown1272, 0x20, 0x90),
	SpritePlacement(NPCID.unknown1268, 0x28, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry33 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0067, 0x48, 0x90),
	SpritePlacement(NPCID.unknown0069, 0x60, 0x78),
	SpritePlacement(NPCID.unknown0068, 0x60, 0xC8),
	SpritePlacement(NPCID.unknown0071, 0x88, 0xA0),
	SpritePlacement(NPCID.unknown0070, 0x88, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry34 = SpritePlacementEntry(12, [
	SpritePlacement(NPCID.unknown0024, 0x30, 0x70),
	SpritePlacement(NPCID.unknown0021, 0x38, 0xF0),
	SpritePlacement(NPCID.unknown0020, 0x50, 0x58),
	SpritePlacement(NPCID.unknown0014, 0x58, 0xA0),
	SpritePlacement(NPCID.unknown0015, 0x68, 0xD8),
	SpritePlacement(NPCID.unknown0018, 0x70, 0x74),
	SpritePlacement(NPCID.unknown0036, 0xC0, 0x58),
	SpritePlacement(NPCID.unknown0033, 0xC0, 0x88),
	SpritePlacement(NPCID.unknown0034, 0xE0, 0x50),
	SpritePlacement(NPCID.unknown0035, 0xE8, 0x60),
	SpritePlacement(NPCID.unknown0038, 0xE8, 0x78),
	SpritePlacement(NPCID.unknown0037, 0xE8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry35 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0023, 0x30, 0x30),
	SpritePlacement(NPCID.unknown0016, 0x50, 0x04),
	SpritePlacement(NPCID.unknown0019, 0x50, 0x28),
	SpritePlacement(NPCID.unknown0017, 0x50, 0x70),
	SpritePlacement(NPCID.unknown0022, 0x58, 0x70),
	SpritePlacement(NPCID.unknown0099, 0xC8, 0x90),
	SpritePlacement(NPCID.unknown0100, 0xD8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry36 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0089, 0x40, 0x68),
	SpritePlacement(NPCID.unknown0098, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry37 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1533, 0xC8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry38 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0185, 0x30, 0x80),
	SpritePlacement(NPCID.unknown0147, 0x38, 0xB0),
	SpritePlacement(NPCID.unknown0128, 0x58, 0xA0),
	SpritePlacement(NPCID.unknown0162, 0x60, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry39 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0155, 0x30, 0x48),
	SpritePlacement(NPCID.unknown0200, 0x48, 0xF8),
	SpritePlacement(NPCID.unknown0154, 0x50, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry40 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0153, 0x90, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry41 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0151, 0x10, 0xF0),
	SpritePlacement(NPCID.unknown0150, 0x20, 0xC0),
	SpritePlacement(NPCID.unknown0190, 0x28, 0xF0),
	SpritePlacement(NPCID.unknown0189, 0x30, 0xB8),
	SpritePlacement(NPCID.unknown0199, 0x38, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry42 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1562, 0x88, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry43 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown1541, 0x40, 0xB8),
	SpritePlacement(NPCID.unknown1206, 0x98, 0x80),
	SpritePlacement(NPCID.unknown1203, 0xA8, 0xD0),
	SpritePlacement(NPCID.unknown1205, 0xB0, 0xA0),
	SpritePlacement(NPCID.unknown1204, 0xB0, 0xB8),
	SpritePlacement(NPCID.unknown1208, 0xB8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry44 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1531, 0x78, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry45 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0054, 0x38, 0x70),
	SpritePlacement(NPCID.unknown0055, 0x38, 0xB0),
	SpritePlacement(NPCID.unknown0052, 0x58, 0xA8),
	SpritePlacement(NPCID.unknown0101, 0xD8, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry46 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0056, 0x38, 0x10),
	SpritePlacement(NPCID.unknown0057, 0x50, 0x70),
	SpritePlacement(NPCID.unknown0053, 0x60, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry47 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0090, 0x60, 0x80),
	SpritePlacement(NPCID.unknown0031, 0xB0, 0x90),
	SpritePlacement(NPCID.unknown0032, 0xD0, 0x10),
	SpritePlacement(NPCID.unknown0030, 0xD8, 0x90),
	SpritePlacement(NPCID.unknown1412, 0xE8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry48 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0078, 0x50, 0xA8),
	SpritePlacement(NPCID.unknown0001, 0xB0, 0x90),
	SpritePlacement(NPCID.unknown0002, 0xE0, 0xD0),
	SpritePlacement(NPCID.unknown0003, 0xF0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry49 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1532, 0x90, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry50 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1538, 0x30, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry51 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0130, 0x08, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry52 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0127, 0x08, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry53 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0129, 0xC0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry54 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1561, 0xB8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry55 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1422, 0xB0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry56 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1467, 0x40, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry57 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0051, 0x38, 0x70),
	SpritePlacement(NPCID.unknown0050, 0x38, 0xB0),
	SpritePlacement(NPCID.unknown0044, 0x50, 0x90),
	SpritePlacement(NPCID.unknown0045, 0x60, 0xD8),
	SpritePlacement(NPCID.unknown0046, 0x68, 0xC8),
	SpritePlacement(NPCID.unknown0091, 0xD0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry58 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0049, 0x38, 0x70),
	SpritePlacement(NPCID.unknown0048, 0x50, 0x68),
	SpritePlacement(NPCID.unknown0047, 0x58, 0x98),
	SpritePlacement(NPCID.unknown0110, 0xC0, 0x50),
	SpritePlacement(NPCID.unknown0111, 0xE8, 0x50),
	SpritePlacement(NPCID.unknown0112, 0xE8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry59 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0025, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry60 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0085, 0x48, 0x58),
	SpritePlacement(NPCID.unknown0115, 0xD8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry61 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0109, 0x40, 0xA0),
	SpritePlacement(NPCID.unknown0108, 0x48, 0x50),
	SpritePlacement(NPCID.unknown0006, 0xB8, 0x78),
	SpritePlacement(NPCID.unknown0004, 0xE0, 0x98),
	SpritePlacement(NPCID.unknown0005, 0xF0, 0x48),
	SpritePlacement(NPCID.unknown0007, 0xF0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry62 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1535, 0x68, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry63 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1539, 0x48, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry64 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1209, 0x00, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry65 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0132, 0x70, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry66 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0168, 0xA0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry67 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1408, 0x68, 0x20),
	SpritePlacement(NPCID.unknown0175, 0x88, 0xD0),
	SpritePlacement(NPCID.unknown0131, 0x90, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry68 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0134, 0x68, 0xC0),
	SpritePlacement(NPCID.unknown0173, 0xA0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry69 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1427, 0x78, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry70 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0451, 0x60, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry71 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0446, 0x98, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry72 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1424, 0xF8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry73 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0447, 0xC0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry74 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0105, 0x48, 0x80),
	SpritePlacement(NPCID.unknown0103, 0x60, 0xC0),
	SpritePlacement(NPCID.unknown0102, 0x68, 0x30),
	SpritePlacement(NPCID.unknown0104, 0x68, 0x70),
	SpritePlacement(NPCID.unknown0093, 0xE0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry75 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0061, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0113, 0xC8, 0x60),
	SpritePlacement(NPCID.unknown0114, 0xD0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry76 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0092, 0x48, 0x40),
	SpritePlacement(NPCID.unknown0119, 0xD0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry77 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0083, 0x48, 0x78),
	SpritePlacement(NPCID.unknown0084, 0x68, 0x50),
	SpritePlacement(NPCID.unknown0117, 0xD8, 0x78),
	SpritePlacement(NPCID.unknown0116, 0xE0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry78 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0028, 0x30, 0x90),
	SpritePlacement(NPCID.unknown0027, 0x38, 0xD8),
	SpritePlacement(NPCID.unknown0026, 0x40, 0xC8),
	SpritePlacement(NPCID.unknown0029, 0x50, 0xF0),
	SpritePlacement(NPCID.unknown0039, 0xC8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry79 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1522, 0x80, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry80 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1167, 0x38, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry81 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0181, 0x78, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry82 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0137, 0x90, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry83 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0135, 0xB0, 0x50),
	SpritePlacement(NPCID.unknown0169, 0xE0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry84 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0138, 0x60, 0x1C),
	SpritePlacement(NPCID.unknown0191, 0xA0, 0xD8),
	SpritePlacement(NPCID.unknown0170, 0xE0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry85 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1410, 0x80, 0xA0),
	SpritePlacement(NPCID.unknown0186, 0xD8, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry86 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0184, 0xA0, 0xF8),
	SpritePlacement(NPCID.unknown0174, 0xB0, 0x40),
	SpritePlacement(NPCID.unknown0136, 0xB0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry87 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0450, 0x78, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry88 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0439, 0x20, 0xB8),
	SpritePlacement(NPCID.unknown0440, 0x30, 0xA0),
	SpritePlacement(NPCID.unknown0442, 0x38, 0x90),
	SpritePlacement(NPCID.unknown0441, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry89 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0107, 0x60, 0xB0),
	SpritePlacement(NPCID.unknown0106, 0x68, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry90 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0040, 0x40, 0x68),
	SpritePlacement(NPCID.unknown0041, 0x58, 0x80),
	SpritePlacement(NPCID.unknown0043, 0x60, 0x40),
	SpritePlacement(NPCID.unknown0042, 0x68, 0x18),
	SpritePlacement(NPCID.unknown0118, 0xF0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry91 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0096, 0x48, 0x68),
	SpritePlacement(NPCID.unknown0097, 0x50, 0x80),
	SpritePlacement(NPCID.unknown0095, 0x60, 0x40),
	SpritePlacement(NPCID.unknown0094, 0x68, 0x60),
	SpritePlacement(NPCID.unknown0123, 0x90, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry92 = SpritePlacementEntry(8, [
	SpritePlacement(NPCID.unknown0065, 0x60, 0x50),
	SpritePlacement(NPCID.unknown0066, 0x60, 0x60),
	SpritePlacement(NPCID.unknown0012, 0xC0, 0x68),
	SpritePlacement(NPCID.unknown0011, 0xC8, 0x4C),
	SpritePlacement(NPCID.unknown0008, 0xC8, 0xA8),
	SpritePlacement(NPCID.unknown0009, 0xC8, 0xC0),
	SpritePlacement(NPCID.unknown0013, 0xF0, 0x78),
	SpritePlacement(NPCID.unknown0010, 0xF8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry93 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0121, 0x30, 0x50),
	SpritePlacement(NPCID.unknown0120, 0x48, 0x30),
	SpritePlacement(NPCID.unknown0122, 0x50, 0x68),
	SpritePlacement(NPCID.unknown0060, 0xC0, 0x40),
	SpritePlacement(NPCID.unknown0058, 0xC0, 0x58),
	SpritePlacement(NPCID.unknown0059, 0xD8, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry94 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0139, 0xE0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry95 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0140, 0xF0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry96 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0133, 0xB0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry97 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1411, 0xC0, 0xF8),
	SpritePlacement(NPCID.unknown0171, 0xD0, 0x20),
	SpritePlacement(NPCID.unknown0142, 0xD0, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry98 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0202, 0x48, 0x78),
	SpritePlacement(NPCID.unknown0146, 0x50, 0x50),
	SpritePlacement(NPCID.unknown0163, 0x80, 0x90),
	SpritePlacement(NPCID.unknown0172, 0xD0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry99 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0176, 0xE8, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry100 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1429, 0x48, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry101 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1468, 0x78, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry102 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0408, 0x50, 0xB0),
	SpritePlacement(NPCID.unknown0406, 0xC0, 0x68),
	SpritePlacement(NPCID.unknown0405, 0xC8, 0x48),
	SpritePlacement(NPCID.unknown0404, 0xC8, 0xA8),
	SpritePlacement(NPCID.unknown0403, 0xC8, 0xC0),
	SpritePlacement(NPCID.unknown0407, 0xF0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry103 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0596, 0x40, 0x48),
	SpritePlacement(NPCID.unknown0595, 0x40, 0x60),
	SpritePlacement(NPCID.unknown0599, 0x60, 0x20),
	SpritePlacement(NPCID.unknown0598, 0x60, 0x38),
	SpritePlacement(NPCID.unknown0597, 0x60, 0x50),
	SpritePlacement(NPCID.unknown0612, 0xC8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry104 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0409, 0xD0, 0x98),
	SpritePlacement(NPCID.unknown0410, 0xD8, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry105 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0594, 0x48, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry106 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0377, 0xC0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry107 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0141, 0x00, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry108 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0143, 0x00, 0x20),
	SpritePlacement(NPCID.unknown0144, 0xC0, 0xB0),
	SpritePlacement(NPCID.unknown0145, 0xC8, 0x98),
	SpritePlacement(NPCID.unknown0177, 0xD0, 0x80),
	SpritePlacement(NPCID.unknown0179, 0xD0, 0xB8),
	SpritePlacement(NPCID.unknown0178, 0xD8, 0x98),
	SpritePlacement(NPCID.unknown0180, 0xD8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry109 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0166, 0x40, 0x78),
	SpritePlacement(NPCID.unknown0167, 0xA0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry110 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1428, 0xB0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry111 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0449, 0x40, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry112 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1421, 0x00, 0xD0),
	SpritePlacement(NPCID.unknown0445, 0x40, 0x28),
	SpritePlacement(NPCID.unknown0443, 0x40, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry113 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1426, 0x80, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry114 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1443, 0x78, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry115 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0592, 0x48, 0x40),
	SpritePlacement(NPCID.unknown0591, 0x60, 0x28),
	SpritePlacement(NPCID.unknown0593, 0x60, 0xA0),
	SpritePlacement(NPCID.unknown0614, 0xB8, 0x30),
	SpritePlacement(NPCID.unknown0613, 0xD0, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry116 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0375, 0x60, 0x80),
	SpritePlacement(NPCID.unknown0376, 0x70, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry117 = SpritePlacementEntry(9, [
	SpritePlacement(NPCID.unknown1436, 0x40, 0x60),
	SpritePlacement(NPCID.unknown0605, 0x40, 0x78),
	SpritePlacement(NPCID.unknown1437, 0x50, 0x98),
	SpritePlacement(NPCID.unknown1438, 0x58, 0x50),
	SpritePlacement(NPCID.unknown1439, 0x58, 0x80),
	SpritePlacement(NPCID.unknown1440, 0x58, 0xA8),
	SpritePlacement(NPCID.unknown1441, 0x60, 0x40),
	SpritePlacement(NPCID.unknown0604, 0x70, 0x28),
	SpritePlacement(NPCID.unknown1442, 0x70, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry118 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0753, 0x68, 0x68),
	SpritePlacement(NPCID.unknown0752, 0x70, 0x50),
	SpritePlacement(NPCID.unknown0402, 0xF8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry119 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0634, 0xE8, 0xEC),
]);

immutable SpritePlacementEntry spritePlacementEntry120 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0639, 0xF8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry121 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0209, 0x60, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry122 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0206, 0x60, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry123 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0205, 0x60, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry124 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0448, 0xB0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry125 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1423, 0x10, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry126 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1425, 0x38, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry127 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0211, 0x60, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry128 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0708, 0xF8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry129 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1466, 0x58, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry130 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0401, 0x40, 0x90),
	SpritePlacement(NPCID.unknown0400, 0x58, 0x80),
	SpritePlacement(NPCID.unknown0399, 0x58, 0x98),
	SpritePlacement(NPCID.unknown0398, 0x68, 0x50),
	SpritePlacement(NPCID.unknown0397, 0x70, 0x40),
	SpritePlacement(NPCID.unknown0393, 0xF0, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry131 = SpritePlacementEntry(8, [
	SpritePlacement(NPCID.unknown0750, 0x40, 0xA0),
	SpritePlacement(NPCID.unknown0747, 0x48, 0x70),
	SpritePlacement(NPCID.unknown0751, 0x48, 0x88),
	SpritePlacement(NPCID.unknown0748, 0x68, 0x28),
	SpritePlacement(NPCID.unknown0749, 0x68, 0x58),
	SpritePlacement(NPCID.unknown0388, 0xD8, 0x58),
	SpritePlacement(NPCID.unknown0392, 0xF0, 0x38),
	SpritePlacement(NPCID.unknown1419, 0xF0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry132 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0385, 0xE8, 0x18),
	SpritePlacement(NPCID.unknown0396, 0xE8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry133 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0638, 0x00, 0xE8),
	SpritePlacement(NPCID.unknown0626, 0x68, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry134 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0637, 0x00, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry135 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1571, 0x70, 0xF8),
	SpritePlacement(NPCID.unknown1304, 0xB0, 0x10),
	SpritePlacement(NPCID.unknown1290, 0xB0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry136 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1570, 0xA0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry137 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1249, 0xC8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry138 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1563, 0x68, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry139 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1565, 0xF0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry140 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1434, 0x70, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry141 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0444, 0x00, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry142 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0204, 0xE0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry143 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1166, 0xB8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry144 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0705, 0x00, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry145 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0390, 0x30, 0xC0),
	SpritePlacement(NPCID.unknown0607, 0xC8, 0x60),
	SpritePlacement(NPCID.unknown0610, 0xC8, 0x88),
	SpritePlacement(NPCID.unknown0606, 0xC8, 0xA0),
	SpritePlacement(NPCID.unknown0609, 0xE0, 0xB8),
	SpritePlacement(NPCID.unknown0611, 0xF0, 0x58),
	SpritePlacement(NPCID.unknown0608, 0xF8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry146 = SpritePlacementEntry(8, [
	SpritePlacement(NPCID.unknown0394, 0x10, 0x10),
	SpritePlacement(NPCID.unknown0384, 0x18, 0xA8),
	SpritePlacement(NPCID.unknown0395, 0x28, 0x28),
	SpritePlacement(NPCID.unknown0387, 0x28, 0xA8),
	SpritePlacement(NPCID.unknown0383, 0x28, 0xD8),
	SpritePlacement(NPCID.unknown0389, 0x38, 0x60),
	SpritePlacement(NPCID.unknown0386, 0x58, 0xB8),
	SpritePlacement(NPCID.unknown0391, 0x70, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry147 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0379, 0x18, 0x48),
	SpritePlacement(NPCID.unknown0382, 0x38, 0x08),
	SpritePlacement(NPCID.unknown0381, 0x48, 0x08),
	SpritePlacement(NPCID.unknown0380, 0x48, 0x48),
	SpritePlacement(NPCID.unknown0378, 0x48, 0x88),
	SpritePlacement(NPCID.unknown1420, 0x58, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry148 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1260, 0xA0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry149 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1409, 0x70, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry150 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1291, 0x18, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry151 = SpritePlacementEntry(15, [
	SpritePlacement(NPCID.unknown1300, 0x10, 0x18),
	SpritePlacement(NPCID.unknown1285, 0x18, 0x30),
	SpritePlacement(NPCID.unknown1286, 0x20, 0x38),
	SpritePlacement(NPCID.unknown1288, 0x30, 0x10),
	SpritePlacement(NPCID.unknown1292, 0x30, 0x40),
	SpritePlacement(NPCID.unknown1282, 0x38, 0x00),
	SpritePlacement(NPCID.unknown1289, 0x40, 0x48),
	SpritePlacement(NPCID.unknown1284, 0x48, 0x38),
	SpritePlacement(NPCID.unknown1298, 0x58, 0x18),
	SpritePlacement(NPCID.unknown1283, 0x58, 0x30),
	SpritePlacement(NPCID.unknown1297, 0x60, 0x08),
	SpritePlacement(NPCID.unknown1299, 0x78, 0x20),
	SpritePlacement(NPCID.unknown1568, 0xE8, 0x68),
	SpritePlacement(NPCID.unknown1287, 0xE8, 0xF0),
	SpritePlacement(NPCID.unknown1293, 0xF8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry152 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1247, 0x68, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry153 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1086, 0xC0, 0x78),
	SpritePlacement(NPCID.unknown1079, 0xE8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry154 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1058, 0xC0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry155 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1083, 0xB8, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry156 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1082, 0xB8, 0xF0),
	SpritePlacement(NPCID.unknown1054, 0xC0, 0x18),
	SpritePlacement(NPCID.unknown1080, 0xE8, 0x08),
	SpritePlacement(NPCID.unknown1081, 0xF0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry157 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1087, 0xB0, 0x68),
	SpritePlacement(NPCID.unknown1084, 0xB8, 0x08),
	SpritePlacement(NPCID.unknown1072, 0xB8, 0x18),
	SpritePlacement(NPCID.unknown1073, 0xB8, 0x30),
	SpritePlacement(NPCID.unknown1074, 0xF0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry158 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1059, 0xC0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry159 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1071, 0x78, 0x90),
	SpritePlacement(NPCID.unknown1060, 0xC0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry160 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1067, 0xF8, 0x74),
]);

immutable SpritePlacementEntry spritePlacementEntry161 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1572, 0x08, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry162 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1295, 0x08, 0xD8),
	SpritePlacement(NPCID.unknown1301, 0x20, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry163 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1303, 0xB0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry164 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1569, 0x50, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry165 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1564, 0xB8, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry166 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1566, 0x18, 0x00),
	SpritePlacement(NPCID.unknown1248, 0x38, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry167 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1560, 0x20, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry168 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1070, 0xB8, 0x84),
]);

immutable SpritePlacementEntry spritePlacementEntry169 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1053, 0x98, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry170 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1085, 0x28, 0x30),
	SpritePlacement(NPCID.unknown1069, 0x30, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry171 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1075, 0x08, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry172 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1062, 0x50, 0x88),
	SpritePlacement(NPCID.unknown1056, 0xF8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry173 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1078, 0x78, 0x80),
	SpritePlacement(NPCID.unknown1061, 0x78, 0x98),
	SpritePlacement(NPCID.unknown1055, 0xD0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry174 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1066, 0xB8, 0xD4),
]);

immutable SpritePlacementEntry spritePlacementEntry175 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1077, 0x18, 0x98),
	SpritePlacement(NPCID.unknown1076, 0x78, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry176 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1063, 0x38, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry177 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1068, 0x20, 0x7C),
	SpritePlacement(NPCID.unknown1065, 0x70, 0x60),
	SpritePlacement(NPCID.unknown1088, 0xA8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry178 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1064, 0x30, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry179 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0621, 0x30, 0x90),
	SpritePlacement(NPCID.unknown0623, 0x30, 0x90),
	SpritePlacement(NPCID.unknown0617, 0x68, 0x98),
	SpritePlacement(NPCID.unknown0618, 0x70, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry180 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0622, 0x10, 0x40),
	SpritePlacement(NPCID.unknown0619, 0x20, 0x70),
	SpritePlacement(NPCID.unknown0620, 0x48, 0x58),
	SpritePlacement(NPCID.unknown0615, 0x50, 0x30),
	SpritePlacement(NPCID.unknown0616, 0x58, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry181 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1302, 0x80, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry182 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1305, 0x70, 0x70),
	SpritePlacement(NPCID.unknown1296, 0x90, 0x18),
	SpritePlacement(NPCID.unknown1294, 0x90, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry183 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0995, 0x80, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry184 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1174, 0xD8, 0x08),
	SpritePlacement(NPCID.unknown1175, 0xD8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry185 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1057, 0x00, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry186 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1052, 0x68, 0x58),
	SpritePlacement(NPCID.unknown1051, 0x68, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry187 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1469, 0xD8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry188 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0601, 0x18, 0x30),
	SpritePlacement(NPCID.unknown0600, 0x20, 0x10),
	SpritePlacement(NPCID.unknown0602, 0x30, 0x48),
	SpritePlacement(NPCID.unknown0603, 0x38, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry189 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0628, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0627, 0x50, 0x90),
	SpritePlacement(NPCID.unknown0629, 0x50, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry190 = SpritePlacementEntry(10, [
	SpritePlacement(NPCID.unknown0635, 0x08, 0x70),
	SpritePlacement(NPCID.unknown0636, 0x10, 0xF8),
	SpritePlacement(NPCID.unknown0641, 0x68, 0x50),
	SpritePlacement(NPCID.unknown0630, 0x78, 0x98),
	SpritePlacement(NPCID.unknown0655, 0x98, 0x58),
	SpritePlacement(NPCID.unknown0656, 0xA8, 0x58),
	SpritePlacement(NPCID.unknown0642, 0xB0, 0x58),
	SpritePlacement(NPCID.unknown0643, 0xC0, 0x58),
	SpritePlacement(NPCID.unknown0644, 0xD0, 0x58),
	SpritePlacement(NPCID.unknown0654, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry191 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0681, 0xC0, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry192 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0686, 0xC0, 0x30),
	SpritePlacement(NPCID.unknown0682, 0xC0, 0x98),
	SpritePlacement(NPCID.unknown1448, 0xC8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry193 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0685, 0xC0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry194 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0948, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry195 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0988, 0x80, 0xB8),
	SpritePlacement(NPCID.unknown0969, 0x80, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry196 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1114, 0x58, 0xC0),
	SpritePlacement(NPCID.unknown1113, 0x88, 0x98),
	SpritePlacement(NPCID.unknown1110, 0x90, 0x28),
	SpritePlacement(NPCID.unknown1111, 0xF0, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry197 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1116, 0x58, 0x40),
	SpritePlacement(NPCID.unknown1115, 0x88, 0x18),
	SpritePlacement(NPCID.unknown1101, 0xB8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry198 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1183, 0x38, 0x30),
	SpritePlacement(NPCID.unknown1184, 0x38, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry199 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1523, 0xE8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry200 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1188, 0xD8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry201 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1191, 0xD8, 0x58),
	SpritePlacement(NPCID.unknown1189, 0xD8, 0xB0),
	SpritePlacement(NPCID.unknown1190, 0xD8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry202 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1192, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry203 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1472, 0x48, 0x30),
	SpritePlacement(NPCID.unknown1473, 0x58, 0x18),
	SpritePlacement(NPCID.unknown1471, 0x58, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry204 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1519, 0xA0, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry205 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0647, 0xF0, 0x38),
	SpritePlacement(NPCID.unknown0648, 0xF0, 0x50),
	SpritePlacement(NPCID.unknown0649, 0xF8, 0x28),
	SpritePlacement(NPCID.unknown0650, 0xF8, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry206 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1172, 0x58, 0x48),
	SpritePlacement(NPCID.unknown1173, 0x58, 0xA8),
	SpritePlacement(NPCID.unknown1193, 0x70, 0x80),
	SpritePlacement(NPCID.unknown1194, 0x70, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry207 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0683, 0x50, 0xD8),
	SpritePlacement(NPCID.unknown1445, 0x60, 0xD0),
	SpritePlacement(NPCID.unknown0687, 0x80, 0x78),
	SpritePlacement(NPCID.unknown0684, 0x88, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry208 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0679, 0x20, 0xD0),
	SpritePlacement(NPCID.unknown1447, 0x48, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry209 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0678, 0x68, 0x48),
	SpritePlacement(NPCID.unknown1446, 0x80, 0x30),
	SpritePlacement(NPCID.unknown1444, 0x80, 0xB0),
	SpritePlacement(NPCID.unknown0680, 0x98, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry210 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0982, 0xA0, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry211 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0990, 0xD8, 0x80),
	SpritePlacement(NPCID.unknown0991, 0xE0, 0x98),
	SpritePlacement(NPCID.unknown0992, 0xF0, 0x80),
	SpritePlacement(NPCID.unknown0989, 0xF0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry212 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0959, 0xA8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry213 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1100, 0x90, 0xD0),
	SpritePlacement(NPCID.unknown1104, 0xA8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry214 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1581, 0x30, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry215 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1580, 0xF0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry216 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1454, 0x60, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry217 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1394, 0x38, 0xB8),
	SpritePlacement(NPCID.unknown1379, 0xB8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry218 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1388, 0xB8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry219 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1516, 0xE0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry220 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0651, 0x00, 0x60),
	SpritePlacement(NPCID.unknown0652, 0x08, 0x38),
	SpritePlacement(NPCID.unknown0653, 0x10, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry221 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1134, 0x20, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry222 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1148, 0x58, 0x70),
	SpritePlacement(NPCID.unknown1155, 0x80, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry223 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1162, 0x88, 0x10),
	SpritePlacement(NPCID.unknown1163, 0x90, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry224 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0967, 0x08, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry225 = SpritePlacementEntry(9, [
	SpritePlacement(NPCID.unknown0968, 0x30, 0x30),
	SpritePlacement(NPCID.unknown0952, 0x30, 0x74),
	SpritePlacement(NPCID.unknown0957, 0x40, 0x48),
	SpritePlacement(NPCID.unknown0958, 0x48, 0x40),
	SpritePlacement(NPCID.unknown0953, 0x50, 0x48),
	SpritePlacement(NPCID.unknown0954, 0x58, 0x58),
	SpritePlacement(NPCID.unknown0956, 0x58, 0x78),
	SpritePlacement(NPCID.unknown0955, 0x60, 0x68),
	SpritePlacement(NPCID.unknown0983, 0xC0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry226 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0975, 0x70, 0xA0),
	SpritePlacement(NPCID.unknown0974, 0xA8, 0xC8),
	SpritePlacement(NPCID.unknown0977, 0xC8, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry227 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0976, 0x78, 0x28),
	SpritePlacement(NPCID.unknown0978, 0xF0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry228 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0971, 0x78, 0xD0),
	SpritePlacement(NPCID.unknown0950, 0xD0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry229 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0966, 0xB8, 0x78),
	SpritePlacement(NPCID.unknown0965, 0xD8, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry230 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1117, 0x60, 0xE0),
	SpritePlacement(NPCID.unknown1106, 0x80, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry231 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1105, 0x20, 0xC8),
	SpritePlacement(NPCID.unknown1102, 0xC0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry232 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1582, 0x80, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry233 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1353, 0x48, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry234 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1578, 0xE8, 0x70),
	SpritePlacement(NPCID.unknown1335, 0xE8, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry235 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1455, 0x68, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry236 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1391, 0x28, 0x60),
	SpritePlacement(NPCID.unknown1385, 0x48, 0xF0),
	SpritePlacement(NPCID.unknown1397, 0xA0, 0x68),
	SpritePlacement(NPCID.unknown1380, 0xF0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry237 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1401, 0x48, 0xF0),
	SpritePlacement(NPCID.unknown1400, 0x98, 0x90),
	SpritePlacement(NPCID.unknown1399, 0xF8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry238 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1390, 0x18, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry239 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1405, 0x08, 0x10),
	SpritePlacement(NPCID.unknown1402, 0x48, 0x38),
	SpritePlacement(NPCID.unknown1384, 0x78, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry240 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0632, 0xD0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry241 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1164, 0x28, 0x18),
	SpritePlacement(NPCID.unknown1144, 0x28, 0x48),
	SpritePlacement(NPCID.unknown1145, 0xA0, 0x68),
	SpritePlacement(NPCID.unknown1160, 0xA0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry242 = SpritePlacementEntry(11, [
	SpritePlacement(NPCID.unknown1165, 0x00, 0x80),
	SpritePlacement(NPCID.unknown1139, 0x28, 0x48),
	SpritePlacement(NPCID.unknown1135, 0x30, 0x28),
	SpritePlacement(NPCID.unknown1136, 0x38, 0x38),
	SpritePlacement(NPCID.unknown1137, 0x38, 0x60),
	SpritePlacement(NPCID.unknown1142, 0x48, 0x98),
	SpritePlacement(NPCID.unknown1156, 0x50, 0x28),
	SpritePlacement(NPCID.unknown1141, 0x78, 0x48),
	SpritePlacement(NPCID.unknown1138, 0x80, 0x70),
	SpritePlacement(NPCID.unknown1140, 0x88, 0x08),
	SpritePlacement(NPCID.unknown1157, 0xA8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry243 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0947, 0x10, 0x98),
	SpritePlacement(NPCID.unknown0979, 0x88, 0xB8),
	SpritePlacement(NPCID.unknown0943, 0xC0, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry244 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0981, 0xB0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry245 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0960, 0x20, 0xA8),
	SpritePlacement(NPCID.unknown0994, 0x30, 0xC0),
	SpritePlacement(NPCID.unknown0951, 0x70, 0xC0),
	SpritePlacement(NPCID.unknown0984, 0x78, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry246 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1511, 0x38, 0xE8),
	SpritePlacement(NPCID.unknown0962, 0xC8, 0x00),
	SpritePlacement(NPCID.unknown0963, 0xF0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry247 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0987, 0x28, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry248 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1107, 0x50, 0xE0),
	SpritePlacement(NPCID.unknown1108, 0x58, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry249 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1109, 0x50, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry250 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1112, 0x20, 0x48),
	SpritePlacement(NPCID.unknown1103, 0x20, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry251 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown1348, 0x60, 0x40),
	SpritePlacement(NPCID.unknown1350, 0x60, 0x60),
	SpritePlacement(NPCID.unknown1347, 0x68, 0x30),
	SpritePlacement(NPCID.unknown1349, 0x68, 0x50),
	SpritePlacement(NPCID.unknown1351, 0x68, 0x70),
	SpritePlacement(NPCID.unknown1352, 0x68, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry252 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1326, 0x98, 0x10),
	SpritePlacement(NPCID.unknown1340, 0xA0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry253 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1369, 0x80, 0x38),
	SpritePlacement(NPCID.unknown1371, 0x90, 0x60),
	SpritePlacement(NPCID.unknown1370, 0x90, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry254 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1456, 0xF0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry255 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1458, 0x10, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry256 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1517, 0x68, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry257 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1382, 0x20, 0x38),
	SpritePlacement(NPCID.unknown1398, 0x58, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry258 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1389, 0x38, 0xD0),
	SpritePlacement(NPCID.unknown1393, 0x68, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry259 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0640, 0x08, 0x58),
	SpritePlacement(NPCID.unknown0633, 0xD8, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry260 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0970, 0x60, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry261 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0980, 0x00, 0x88),
	SpritePlacement(NPCID.unknown0946, 0x48, 0x70),
	SpritePlacement(NPCID.unknown0985, 0x98, 0x28),
	SpritePlacement(NPCID.unknown0961, 0xB0, 0xB0),
	SpritePlacement(NPCID.unknown0964, 0xE8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry262 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0949, 0xF8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry263 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1521, 0x40, 0x50),
	SpritePlacement(NPCID.unknown1168, 0xB8, 0x68),
	SpritePlacement(NPCID.unknown1526, 0xC0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry264 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1550, 0xA8, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry265 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1327, 0xF0, 0xC8),
	SpritePlacement(NPCID.unknown1329, 0xF0, 0xE8),
	SpritePlacement(NPCID.unknown1328, 0xF8, 0xD8),
	SpritePlacement(NPCID.unknown1330, 0xF8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry266 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1345, 0x60, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry267 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1377, 0x58, 0x48),
	SpritePlacement(NPCID.unknown1378, 0x68, 0x80),
	SpritePlacement(NPCID.unknown1325, 0xA8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry268 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1346, 0xA8, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry269 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1341, 0x50, 0xD0),
	SpritePlacement(NPCID.unknown1322, 0xA0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry270 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1342, 0x40, 0xA8),
	SpritePlacement(NPCID.unknown1343, 0x50, 0x78),
	SpritePlacement(NPCID.unknown1344, 0x50, 0xC4),
	SpritePlacement(NPCID.unknown1336, 0xC8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry271 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1452, 0x20, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry272 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1518, 0x38, 0x38),
	SpritePlacement(NPCID.unknown1383, 0x58, 0x28),
	SpritePlacement(NPCID.unknown1381, 0xB0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry273 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1392, 0x08, 0xA0),
	SpritePlacement(NPCID.unknown1396, 0xF8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry274 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1386, 0xA0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry275 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0631, 0x60, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry276 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0646, 0x38, 0x28),
	SpritePlacement(NPCID.unknown0645, 0x80, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry277 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1153, 0x40, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry278 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1146, 0x98, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry279 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1158, 0xF0, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry280 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0993, 0x80, 0x50),
	SpritePlacement(NPCID.unknown0986, 0xF8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry281 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0945, 0x88, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry282 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0944, 0x18, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry283 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1524, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry284 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0697, 0x88, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry285 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1579, 0x30, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry286 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1331, 0x00, 0x08),
	SpritePlacement(NPCID.unknown1332, 0x08, 0x18),
	SpritePlacement(NPCID.unknown1334, 0x08, 0x38),
	SpritePlacement(NPCID.unknown1333, 0x10, 0x28),
	SpritePlacement(NPCID.unknown1323, 0x68, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry287 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1324, 0x40, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry288 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1337, 0x90, 0x70),
	SpritePlacement(NPCID.unknown1338, 0xA0, 0x68),
	SpritePlacement(NPCID.unknown1339, 0xA0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry289 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1406, 0x60, 0xC8),
	SpritePlacement(NPCID.unknown1395, 0x68, 0xC8),
	SpritePlacement(NPCID.unknown1403, 0xB8, 0x10),
	SpritePlacement(NPCID.unknown1514, 0xE8, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry290 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1515, 0x50, 0xD0),
	SpritePlacement(NPCID.unknown1387, 0x98, 0xC8),
	SpritePlacement(NPCID.unknown1404, 0xB8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry291 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0672, 0x68, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry292 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1150, 0x78, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry293 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1143, 0x18, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry294 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1154, 0x18, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry295 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0972, 0xB0, 0xA8),
	SpritePlacement(NPCID.unknown0973, 0xB0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry296 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0942, 0x18, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry297 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1414, 0xD8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry298 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1520, 0x58, 0x38),
	SpritePlacement(NPCID.unknown1178, 0xB8, 0x90),
	SpritePlacement(NPCID.unknown1525, 0xC0, 0x60),
	SpritePlacement(NPCID.unknown1528, 0xC0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry299 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0839, 0x48, 0x60),
	SpritePlacement(NPCID.unknown0916, 0xC8, 0x60),
	SpritePlacement(NPCID.unknown0917, 0xE0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry300 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0904, 0x68, 0x68),
	SpritePlacement(NPCID.unknown0905, 0xA0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry301 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0856, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry302 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0879, 0x60, 0x70),
	SpritePlacement(NPCID.unknown0941, 0xC8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry303 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1451, 0x58, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry304 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1359, 0x40, 0x60),
	SpritePlacement(NPCID.unknown1360, 0x60, 0x78),
	SpritePlacement(NPCID.unknown1363, 0x68, 0x28),
	SpritePlacement(NPCID.unknown1361, 0x68, 0xA0),
	SpritePlacement(NPCID.unknown1362, 0x78, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry305 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1453, 0x28, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry306 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1365, 0x40, 0x90),
	SpritePlacement(NPCID.unknown1367, 0x48, 0x60),
	SpritePlacement(NPCID.unknown1366, 0x70, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry307 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1364, 0x40, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry308 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0704, 0xC0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry309 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0701, 0xC8, 0x08),
	SpritePlacement(NPCID.unknown0702, 0xC8, 0x18),
	SpritePlacement(NPCID.unknown0700, 0xD0, 0x14),
	SpritePlacement(NPCID.unknown0703, 0xD0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry310 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1147, 0xD0, 0x90),
	SpritePlacement(NPCID.unknown1161, 0xD0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry311 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0740, 0x48, 0x80),
	SpritePlacement(NPCID.unknown0739, 0x60, 0x90),
	SpritePlacement(NPCID.unknown0738, 0x70, 0xD0),
	SpritePlacement(NPCID.unknown0737, 0x80, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry312 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1435, 0x50, 0x98),
	SpritePlacement(NPCID.unknown1461, 0xD0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry313 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1181, 0xB8, 0x78),
	SpritePlacement(NPCID.unknown1529, 0xC0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry314 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0909, 0xB0, 0x70),
	SpritePlacement(NPCID.unknown0908, 0xC8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry315 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0913, 0x70, 0x30),
	SpritePlacement(NPCID.unknown0912, 0x98, 0x10),
	SpritePlacement(NPCID.unknown0911, 0xA8, 0x38),
	SpritePlacement(NPCID.unknown0910, 0xB8, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry316 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0864, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry317 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0868, 0x18, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry318 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1512, 0x68, 0x30),
	SpritePlacement(NPCID.unknown0880, 0x68, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry319 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1499, 0x38, 0x68),
	SpritePlacement(NPCID.unknown0837, 0x40, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry320 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0815, 0x40, 0x20),
	SpritePlacement(NPCID.unknown0813, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0814, 0x40, 0x50),
	SpritePlacement(NPCID.unknown0816, 0x40, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry321 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0797, 0xC8, 0x18),
	SpritePlacement(NPCID.unknown0798, 0xD0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry322 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1508, 0xC8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry323 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1502, 0x50, 0xB8),
	SpritePlacement(NPCID.unknown0838, 0x78, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry324 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1159, 0x18, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry325 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1149, 0x20, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry326 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1118, 0x88, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry327 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0692, 0x80, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry328 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0688, 0x80, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry329 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1577, 0x50, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry330 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1465, 0xC0, 0x88),
	SpritePlacement(NPCID.unknown1460, 0xE0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry331 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1182, 0xB8, 0x90),
	SpritePlacement(NPCID.unknown1195, 0xC0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry332 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0853, 0x40, 0x88),
	SpritePlacement(NPCID.unknown0854, 0x70, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry333 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0852, 0x88, 0xB0),
	SpritePlacement(NPCID.unknown0851, 0x90, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry334 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0849, 0x90, 0x78),
	SpritePlacement(NPCID.unknown0850, 0x90, 0x90),
	SpritePlacement(NPCID.unknown0848, 0x90, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry335 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0889, 0x60, 0x60),
	SpritePlacement(NPCID.unknown0869, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry336 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0859, 0x00, 0xD0),
	SpritePlacement(NPCID.unknown0861, 0x08, 0x78),
	SpritePlacement(NPCID.unknown0860, 0x20, 0x68),
	SpritePlacement(NPCID.unknown0858, 0x28, 0xB0),
	SpritePlacement(NPCID.unknown0857, 0x58, 0xF8),
	SpritePlacement(NPCID.unknown0866, 0xE8, 0xB8),
	SpritePlacement(NPCID.unknown0865, 0xF0, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry337 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0867, 0xE8, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry338 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1513, 0x70, 0x60),
	SpritePlacement(NPCID.unknown0936, 0xD0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry339 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0799, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0801, 0x40, 0x40),
	SpritePlacement(NPCID.unknown0802, 0x40, 0x60),
	SpritePlacement(NPCID.unknown0800, 0x40, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry340 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1500, 0x50, 0xB0),
	SpritePlacement(NPCID.unknown0831, 0x58, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry341 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1459, 0x88, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry342 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1152, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry343 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1151, 0x98, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry344 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0691, 0x70, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry345 = SpritePlacementEntry(8, [
	SpritePlacement(NPCID.unknown0693, 0x10, 0x10),
	SpritePlacement(NPCID.unknown0698, 0x10, 0x20),
	SpritePlacement(NPCID.unknown0694, 0x10, 0x48),
	SpritePlacement(NPCID.unknown0699, 0x10, 0x58),
	SpritePlacement(NPCID.unknown0695, 0x18, 0x78),
	SpritePlacement(NPCID.unknown0696, 0x18, 0x88),
	SpritePlacement(NPCID.unknown0689, 0x48, 0x38),
	SpritePlacement(NPCID.unknown0690, 0x60, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry346 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1415, 0xD8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry347 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0590, 0x28, 0xD0),
	SpritePlacement(NPCID.unknown1463, 0xC8, 0x78),
	SpritePlacement(NPCID.unknown1462, 0xD8, 0x90),
	SpritePlacement(NPCID.unknown1464, 0xF0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry348 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1574, 0x50, 0x20),
	SpritePlacement(NPCID.unknown1185, 0xB8, 0x48),
	SpritePlacement(NPCID.unknown1527, 0xC0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry349 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0841, 0xD8, 0xA8),
	SpritePlacement(NPCID.unknown0840, 0xE8, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry350 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0870, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry351 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0882, 0xE8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry352 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0881, 0xF0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry353 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0871, 0x60, 0x50),
	SpritePlacement(NPCID.unknown0893, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry354 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0803, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0805, 0x40, 0x40),
	SpritePlacement(NPCID.unknown0806, 0x40, 0x60),
	SpritePlacement(NPCID.unknown0804, 0x40, 0x70),
	SpritePlacement(NPCID.unknown1480, 0xE8, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry355 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown1505, 0x60, 0x38),
	SpritePlacement(NPCID.unknown1373, 0xC0, 0x50),
	SpritePlacement(NPCID.unknown1375, 0xC0, 0xB8),
	SpritePlacement(NPCID.unknown1374, 0xC8, 0x80),
	SpritePlacement(NPCID.unknown1372, 0xC8, 0x98),
	SpritePlacement(NPCID.unknown1376, 0xC8, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry356 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0817, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0819, 0x40, 0x40),
	SpritePlacement(NPCID.unknown0820, 0x40, 0xA0),
	SpritePlacement(NPCID.unknown0818, 0x40, 0xB0),
	SpritePlacement(NPCID.unknown0674, 0xC0, 0x70),
	SpritePlacement(NPCID.unknown0675, 0xD0, 0x98),
	SpritePlacement(NPCID.unknown0673, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry357 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1504, 0x58, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry358 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1503, 0x58, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry359 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0827, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0826, 0x50, 0x70),
	SpritePlacement(NPCID.unknown1368, 0xD8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry360 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1306, 0xC0, 0xC4),
	SpritePlacement(NPCID.unknown1307, 0xC8, 0xD4),
	SpritePlacement(NPCID.unknown1308, 0xD0, 0xB4),
	SpritePlacement(NPCID.unknown1309, 0xD8, 0xC4),
]);

immutable SpritePlacementEntry spritePlacementEntry361 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1583, 0xF8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry362 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0343, 0xB0, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry363 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1171, 0x38, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry364 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0208, 0x50, 0xA0),
	SpritePlacement(NPCID.unknown0207, 0x58, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry365 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0624, 0x48, 0x48),
	SpritePlacement(NPCID.unknown0625, 0x50, 0x38),
	SpritePlacement(NPCID.unknown1187, 0xB8, 0x48),
	SpritePlacement(NPCID.unknown1186, 0xB8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry366 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0934, 0xF0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry367 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0855, 0x50, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry368 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0876, 0x60, 0xF0),
	SpritePlacement(NPCID.unknown0875, 0x68, 0xB0),
	SpritePlacement(NPCID.unknown0878, 0x70, 0x50),
	SpritePlacement(NPCID.unknown0874, 0x80, 0xA8),
	SpritePlacement(NPCID.unknown0873, 0x80, 0xB8),
	SpritePlacement(NPCID.unknown0877, 0x90, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry369 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0872, 0x78, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry370 = SpritePlacementEntry(9, [
	SpritePlacement(NPCID.unknown0887, 0x48, 0x70),
	SpritePlacement(NPCID.unknown0885, 0x50, 0x48),
	SpritePlacement(NPCID.unknown0883, 0x58, 0x70),
	SpritePlacement(NPCID.unknown0884, 0x68, 0x28),
	SpritePlacement(NPCID.unknown0886, 0x68, 0x58),
	SpritePlacement(NPCID.unknown0888, 0x68, 0x88),
	SpritePlacement(NPCID.unknown0892, 0xC0, 0x40),
	SpritePlacement(NPCID.unknown0890, 0xC0, 0x58),
	SpritePlacement(NPCID.unknown0891, 0xD0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry371 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0812, 0x48, 0x28),
	SpritePlacement(NPCID.unknown0811, 0x48, 0x38),
	SpritePlacement(NPCID.unknown1482, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry372 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0671, 0xB0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry373 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0821, 0x48, 0x30),
	SpritePlacement(NPCID.unknown1485, 0xE8, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry374 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1509, 0x48, 0x88),
	SpritePlacement(NPCID.unknown1507, 0x60, 0x98),
	SpritePlacement(NPCID.unknown0836, 0x68, 0x58),
	SpritePlacement(NPCID.unknown0835, 0x88, 0x48),
	SpritePlacement(NPCID.unknown0834, 0x90, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry375 = SpritePlacementEntry(18, [
	SpritePlacement(NPCID.unknown0822, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0824, 0x40, 0x40),
	SpritePlacement(NPCID.unknown0825, 0x40, 0x60),
	SpritePlacement(NPCID.unknown0823, 0x40, 0x70),
	SpritePlacement(NPCID.unknown0667, 0xA0, 0x78),
	SpritePlacement(NPCID.unknown0663, 0xB0, 0x58),
	SpritePlacement(NPCID.unknown0659, 0xC0, 0x68),
	SpritePlacement(NPCID.unknown0669, 0xC0, 0x88),
	SpritePlacement(NPCID.unknown0661, 0xC8, 0x58),
	SpritePlacement(NPCID.unknown0657, 0xC8, 0x98),
	SpritePlacement(NPCID.unknown0670, 0xC8, 0xA8),
	SpritePlacement(NPCID.unknown0662, 0xD0, 0x68),
	SpritePlacement(NPCID.unknown0664, 0xD0, 0xC8),
	SpritePlacement(NPCID.unknown0666, 0xE0, 0x38),
	SpritePlacement(NPCID.unknown0668, 0xE0, 0x90),
	SpritePlacement(NPCID.unknown0665, 0xE8, 0x58),
	SpritePlacement(NPCID.unknown0658, 0xE8, 0xA8),
	SpritePlacement(NPCID.unknown0660, 0xE8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry376 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0357, 0xD8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry377 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0331, 0xB0, 0x30),
	SpritePlacement(NPCID.unknown0362, 0xE0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry378 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1170, 0x18, 0x50),
	SpritePlacement(NPCID.unknown1169, 0x18, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry379 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1120, 0x30, 0xE8),
	SpritePlacement(NPCID.unknown1121, 0x30, 0xF8),
	SpritePlacement(NPCID.unknown1119, 0x40, 0xF4),
	SpritePlacement(NPCID.unknown1276, 0xE0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry380 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1122, 0x40, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry381 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1211, 0xF8, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry382 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1218, 0x70, 0x88),
	SpritePlacement(NPCID.unknown1217, 0x88, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry383 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0933, 0x00, 0xA8),
	SpritePlacement(NPCID.unknown0935, 0x00, 0xD8),
	SpritePlacement(NPCID.unknown0928, 0x18, 0xD0),
	SpritePlacement(NPCID.unknown0929, 0x48, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry384 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0940, 0x20, 0x98),
	SpritePlacement(NPCID.unknown0930, 0x60, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry385 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0923, 0xB8, 0x98),
	SpritePlacement(NPCID.unknown0922, 0xB8, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry386 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0915, 0x48, 0xD0),
	SpritePlacement(NPCID.unknown0894, 0xE0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry387 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0914, 0x40, 0x70),
	SpritePlacement(NPCID.unknown0895, 0xC0, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry388 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0918, 0xD8, 0x48),
	SpritePlacement(NPCID.unknown0919, 0xE8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry389 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0809, 0x40, 0x20),
	SpritePlacement(NPCID.unknown0807, 0x40, 0x30),
	SpritePlacement(NPCID.unknown0808, 0x40, 0x50),
	SpritePlacement(NPCID.unknown0810, 0x40, 0x60),
	SpritePlacement(NPCID.unknown1484, 0xD0, 0x88),
	SpritePlacement(NPCID.unknown1483, 0xD8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry390 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0832, 0x40, 0x60),
	SpritePlacement(NPCID.unknown1497, 0x48, 0x40),
	SpritePlacement(NPCID.unknown1488, 0xC8, 0xF8),
	SpritePlacement(NPCID.unknown1487, 0xD0, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry391 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1476, 0x48, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry392 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0303, 0x28, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry393 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0359, 0x80, 0xD0),
	SpritePlacement(NPCID.unknown0367, 0x90, 0x88),
	SpritePlacement(NPCID.unknown0360, 0xB8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry394 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0306, 0x98, 0xE8),
	SpritePlacement(NPCID.unknown0364, 0xC0, 0x50),
	SpritePlacement(NPCID.unknown0307, 0xD0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry395 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0363, 0x90, 0x80),
	SpritePlacement(NPCID.unknown0358, 0xA8, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry396 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0326, 0x90, 0x80),
	SpritePlacement(NPCID.unknown0340, 0x90, 0xD0),
	SpritePlacement(NPCID.unknown0322, 0x98, 0x60),
	SpritePlacement(NPCID.unknown0327, 0x98, 0x70),
	SpritePlacement(NPCID.unknown0373, 0xA8, 0x80),
	SpritePlacement(NPCID.unknown0320, 0xB0, 0xB0),
	SpritePlacement(NPCID.unknown0366, 0xC0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry397 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0329, 0x70, 0x30),
	SpritePlacement(NPCID.unknown0374, 0x78, 0x00),
	SpritePlacement(NPCID.unknown0328, 0x80, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry398 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1573, 0x90, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry399 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1212, 0x10, 0x68),
	SpritePlacement(NPCID.unknown1213, 0x38, 0x70),
	SpritePlacement(NPCID.unknown1210, 0xB0, 0x68),
	SpritePlacement(NPCID.unknown1540, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry400 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1214, 0x78, 0xC0),
	SpritePlacement(NPCID.unknown1215, 0xA0, 0x98),
	SpritePlacement(NPCID.unknown1216, 0xA8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry401 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0925, 0xA8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry402 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0932, 0x90, 0x20),
	SpritePlacement(NPCID.unknown0924, 0xF0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry403 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0927, 0x28, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry404 = SpritePlacementEntry(8, [
	SpritePlacement(NPCID.unknown0903, 0xC0, 0x50),
	SpritePlacement(NPCID.unknown0896, 0xC0, 0x78),
	SpritePlacement(NPCID.unknown0897, 0xC8, 0xA0),
	SpritePlacement(NPCID.unknown0898, 0xD8, 0xB8),
	SpritePlacement(NPCID.unknown0899, 0xE0, 0x50),
	SpritePlacement(NPCID.unknown0902, 0xE0, 0x88),
	SpritePlacement(NPCID.unknown0901, 0xE0, 0x98),
	SpritePlacement(NPCID.unknown0900, 0xF0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry405 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0862, 0x58, 0x58),
	SpritePlacement(NPCID.unknown0863, 0x60, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry406 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1475, 0x20, 0x30),
	SpritePlacement(NPCID.unknown1481, 0xD0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry407 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0833, 0xC0, 0x80),
	SpritePlacement(NPCID.unknown1501, 0xC8, 0x60),
	SpritePlacement(NPCID.unknown1498, 0xD8, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry408 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1477, 0x48, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry409 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1510, 0x28, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry410 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1506, 0xB8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry411 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0324, 0xC0, 0xF0),
	SpritePlacement(NPCID.unknown0334, 0xD8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry412 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0338, 0xB0, 0x48),
	SpritePlacement(NPCID.unknown0325, 0xB8, 0xF0),
	SpritePlacement(NPCID.unknown0342, 0xC0, 0x58),
	SpritePlacement(NPCID.unknown0314, 0xE0, 0x08),
	SpritePlacement(NPCID.unknown0317, 0xE0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry413 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0369, 0xF8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry414 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0310, 0x40, 0x9C),
]);

immutable SpritePlacementEntry spritePlacementEntry415 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0353, 0x38, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry416 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1576, 0x30, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry417 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1575, 0xC0, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry418 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0939, 0x08, 0x00),
	SpritePlacement(NPCID.unknown0926, 0x08, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry419 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0937, 0x70, 0x88),
	SpritePlacement(NPCID.unknown0938, 0x70, 0xA0),
	SpritePlacement(NPCID.unknown0920, 0x80, 0xF8),
	SpritePlacement(NPCID.unknown0931, 0x98, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry420 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0921, 0x80, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry421 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0847, 0x48, 0x50),
	SpritePlacement(NPCID.unknown0842, 0x48, 0x90),
	SpritePlacement(NPCID.unknown0845, 0x50, 0x70),
	SpritePlacement(NPCID.unknown0844, 0x58, 0x40),
	SpritePlacement(NPCID.unknown0843, 0x70, 0x60),
	SpritePlacement(NPCID.unknown0846, 0x70, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry422 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown1223, 0x20, 0x70),
	SpritePlacement(NPCID.unknown1225, 0x30, 0x58),
	SpritePlacement(NPCID.unknown1224, 0x30, 0x90),
	SpritePlacement(NPCID.unknown1222, 0x50, 0x38),
	SpritePlacement(NPCID.unknown0907, 0xC0, 0x60),
	SpritePlacement(NPCID.unknown0906, 0xC8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry423 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1474, 0x40, 0x50),
	SpritePlacement(NPCID.unknown1486, 0xE0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry424 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1457, 0x30, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry425 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0829, 0xA0, 0x80),
	SpritePlacement(NPCID.unknown1478, 0xA8, 0x58),
	SpritePlacement(NPCID.unknown0828, 0xA8, 0x68),
	SpritePlacement(NPCID.unknown1479, 0xB0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry426 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0830, 0xB0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry427 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1310, 0x18, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry428 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0335, 0xB0, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry429 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0311, 0x28, 0xC8),
	SpritePlacement(NPCID.unknown0313, 0x50, 0x70),
	SpritePlacement(NPCID.unknown0318, 0x80, 0xA0),
	SpritePlacement(NPCID.unknown0371, 0x88, 0x90),
	SpritePlacement(NPCID.unknown0372, 0x88, 0xB0),
	SpritePlacement(NPCID.unknown0336, 0xA0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry430 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0315, 0x00, 0xC0),
	SpritePlacement(NPCID.unknown0312, 0x28, 0x18),
	SpritePlacement(NPCID.unknown0316, 0x40, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry431 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0304, 0x00, 0x78),
	SpritePlacement(NPCID.unknown0368, 0xD0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry432 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0337, 0x60, 0x4C),
	SpritePlacement(NPCID.unknown0351, 0x98, 0x30),
	SpritePlacement(NPCID.unknown0323, 0xA0, 0x18),
	SpritePlacement(NPCID.unknown0321, 0xB0, 0x28),
	SpritePlacement(NPCID.unknown0354, 0xC0, 0x08),
	SpritePlacement(NPCID.unknown0341, 0xD0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry433 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0339, 0xC0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry434 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0305, 0xA8, 0xD0),
	SpritePlacement(NPCID.unknown0308, 0xD8, 0x68),
	SpritePlacement(NPCID.unknown0356, 0xD8, 0xC8),
	SpritePlacement(NPCID.unknown0309, 0xF8, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry435 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0432, 0xB8, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry436 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0203, 0xC8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry437 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1244, 0x98, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry438 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1238, 0xD8, 0x50),
	SpritePlacement(NPCID.unknown1234, 0xD8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry439 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1233, 0xB0, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry440 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1226, 0xE8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry441 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0295, 0x68, 0x70),
	SpritePlacement(NPCID.unknown0296, 0x68, 0x88),
	SpritePlacement(NPCID.unknown0302, 0x80, 0xB8),
	SpritePlacement(NPCID.unknown0298, 0x90, 0xD8),
	SpritePlacement(NPCID.unknown0300, 0xA0, 0x48),
	SpritePlacement(NPCID.unknown0297, 0xD0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry442 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1125, 0x38, 0x58),
	SpritePlacement(NPCID.unknown1126, 0x60, 0xF8),
	SpritePlacement(NPCID.unknown0706, 0xD8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry443 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1128, 0x38, 0xC0),
	SpritePlacement(NPCID.unknown1124, 0x38, 0xD8),
	SpritePlacement(NPCID.unknown1127, 0x48, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry444 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0707, 0xC8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry445 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0722, 0x88, 0x30),
	SpritePlacement(NPCID.unknown0720, 0xB0, 0x90),
	SpritePlacement(NPCID.unknown0732, 0xB0, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry446 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0743, 0x90, 0x18),
	SpritePlacement(NPCID.unknown0742, 0xD0, 0x10),
	SpritePlacement(NPCID.unknown0736, 0xD0, 0x78),
	SpritePlacement(NPCID.unknown0723, 0xF0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry447 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0333, 0x18, 0xA0),
	SpritePlacement(NPCID.unknown0332, 0x18, 0xB8),
	SpritePlacement(NPCID.unknown0365, 0x58, 0xF0),
	SpritePlacement(NPCID.unknown0319, 0x78, 0xD0),
	SpritePlacement(NPCID.unknown0361, 0xD0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry448 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0370, 0x00, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry449 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0350, 0x00, 0x88),
	SpritePlacement(NPCID.unknown0352, 0x00, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry450 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1235, 0x50, 0x80),
	SpritePlacement(NPCID.unknown1228, 0xB0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry451 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1239, 0x18, 0x08),
	SpritePlacement(NPCID.unknown1227, 0x28, 0xB0),
	SpritePlacement(NPCID.unknown1241, 0xD8, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry452 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1232, 0xA8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry453 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1240, 0x60, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry454 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0291, 0x78, 0xA8),
	SpritePlacement(NPCID.unknown0293, 0xC0, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry455 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0292, 0x48, 0x40),
	SpritePlacement(NPCID.unknown0299, 0x60, 0x60),
	SpritePlacement(NPCID.unknown0294, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry456 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0258, 0x40, 0x80),
	SpritePlacement(NPCID.unknown0256, 0x40, 0x98),
	SpritePlacement(NPCID.unknown0229, 0xC0, 0x90),
	SpritePlacement(NPCID.unknown0226, 0xD0, 0x98),
	SpritePlacement(NPCID.unknown0228, 0xD0, 0xB0),
	SpritePlacement(NPCID.unknown0230, 0xD8, 0x28),
	SpritePlacement(NPCID.unknown0227, 0xE8, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry457 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0257, 0x50, 0x00),
	SpritePlacement(NPCID.unknown0266, 0xC8, 0x60),
	SpritePlacement(NPCID.unknown0267, 0xD8, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry458 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0278, 0x48, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry459 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0730, 0xC0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry460 = SpritePlacementEntry(14, [
	SpritePlacement(NPCID.unknown0724, 0x38, 0xF8),
	SpritePlacement(NPCID.unknown1470, 0x70, 0xF0),
	SpritePlacement(NPCID.unknown0744, 0x80, 0x88),
	SpritePlacement(NPCID.unknown0731, 0x90, 0xA8),
	SpritePlacement(NPCID.unknown0745, 0xA8, 0x40),
	SpritePlacement(NPCID.unknown0729, 0xB8, 0x50),
	SpritePlacement(NPCID.unknown0735, 0xB8, 0x60),
	SpritePlacement(NPCID.unknown0741, 0xC0, 0x80),
	SpritePlacement(NPCID.unknown0746, 0xC8, 0xD0),
	SpritePlacement(NPCID.unknown0733, 0xD0, 0x38),
	SpritePlacement(NPCID.unknown0727, 0xD8, 0x60),
	SpritePlacement(NPCID.unknown0719, 0xD8, 0xA8),
	SpritePlacement(NPCID.unknown0728, 0xE0, 0x80),
	SpritePlacement(NPCID.unknown0734, 0xE0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry461 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0721, 0x60, 0x38),
	SpritePlacement(NPCID.unknown0725, 0xC8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry462 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0355, 0x38, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry463 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0427, 0x70, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry464 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0435, 0xC0, 0x00),
	SpritePlacement(NPCID.unknown0431, 0xD0, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry465 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1553, 0x08, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry466 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1229, 0xB8, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry467 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1242, 0x50, 0x28),
	SpritePlacement(NPCID.unknown1557, 0xB0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry468 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1556, 0x90, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry469 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1123, 0xB8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry470 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0268, 0xD0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry471 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0286, 0x20, 0x78),
	SpritePlacement(NPCID.unknown0288, 0x20, 0xB0),
	SpritePlacement(NPCID.unknown0289, 0x20, 0xD0),
	SpritePlacement(NPCID.unknown0287, 0x30, 0x50),
	SpritePlacement(NPCID.unknown0301, 0x38, 0x68),
	SpritePlacement(NPCID.unknown0290, 0x58, 0x90),
	SpritePlacement(NPCID.unknown0212, 0xC8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry472 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0269, 0xC0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry473 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0216, 0x48, 0xD8),
	SpritePlacement(NPCID.unknown0213, 0x50, 0x50),
	SpritePlacement(NPCID.unknown0214, 0x58, 0x98),
	SpritePlacement(NPCID.unknown0215, 0x68, 0x78),
	SpritePlacement(NPCID.unknown0253, 0xC8, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry474 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0220, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry475 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0251, 0x48, 0x48),
	SpritePlacement(NPCID.unknown0252, 0x50, 0x60),
	SpritePlacement(NPCID.unknown0248, 0x50, 0x90),
	SpritePlacement(NPCID.unknown0249, 0x58, 0xA8),
	SpritePlacement(NPCID.unknown0250, 0x68, 0x38),
	SpritePlacement(NPCID.unknown0247, 0x70, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry476 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0726, 0x00, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry477 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0718, 0x68, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry478 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0428, 0x10, 0xE0),
	SpritePlacement(NPCID.unknown0413, 0x60, 0x98),
	SpritePlacement(NPCID.unknown0420, 0x78, 0x38),
	SpritePlacement(NPCID.unknown0411, 0xB0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry479 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0434, 0x28, 0x90),
	SpritePlacement(NPCID.unknown0433, 0x38, 0x90),
	SpritePlacement(NPCID.unknown0422, 0x50, 0x50),
	SpritePlacement(NPCID.unknown0412, 0x60, 0xC8),
	SpritePlacement(NPCID.unknown0417, 0xD0, 0xE0),
	SpritePlacement(NPCID.unknown0418, 0xF0, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry480 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0421, 0x18, 0x58),
	SpritePlacement(NPCID.unknown0416, 0x58, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry481 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1243, 0xD0, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry482 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1230, 0x00, 0x78),
	SpritePlacement(NPCID.unknown1554, 0x20, 0x78),
	SpritePlacement(NPCID.unknown1237, 0x28, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry483 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1555, 0x70, 0x28),
	SpritePlacement(NPCID.unknown1245, 0xC8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry484 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1236, 0x30, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry485 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0255, 0x50, 0x80),
	SpritePlacement(NPCID.unknown1129, 0xD0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry486 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0217, 0x50, 0x78),
	SpritePlacement(NPCID.unknown0279, 0xD0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry487 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1095, 0x38, 0x60),
	SpritePlacement(NPCID.unknown1545, 0x50, 0x18),
	SpritePlacement(NPCID.unknown0270, 0xE8, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry488 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0283, 0xE0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry489 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1312, 0x48, 0x90),
	SpritePlacement(NPCID.unknown1096, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry490 = SpritePlacementEntry(8, [
	SpritePlacement(NPCID.unknown0263, 0x30, 0x90),
	SpritePlacement(NPCID.unknown0262, 0x40, 0x90),
	SpritePlacement(NPCID.unknown0223, 0xC8, 0x58),
	SpritePlacement(NPCID.unknown0225, 0xD0, 0x40),
	SpritePlacement(NPCID.unknown0221, 0xD8, 0x78),
	SpritePlacement(NPCID.unknown0224, 0xD8, 0x98),
	SpritePlacement(NPCID.unknown1418, 0xE8, 0x30),
	SpritePlacement(NPCID.unknown0222, 0xF0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry491 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0277, 0x58, 0x80),
	SpritePlacement(NPCID.unknown1320, 0xC0, 0x90),
	SpritePlacement(NPCID.unknown1321, 0xC0, 0xA8),
	SpritePlacement(NPCID.unknown1319, 0xE8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry492 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0414, 0x40, 0x08),
	SpritePlacement(NPCID.unknown0426, 0xB8, 0xA8),
	SpritePlacement(NPCID.unknown0419, 0xB8, 0xC0),
	SpritePlacement(NPCID.unknown0430, 0xD8, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry493 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0415, 0xC8, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry494 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0425, 0x50, 0x50),
	SpritePlacement(NPCID.unknown0429, 0x68, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry495 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1552, 0x58, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry496 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1231, 0x18, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry497 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0711, 0x10, 0x50),
	SpritePlacement(NPCID.unknown0710, 0x60, 0x30),
	SpritePlacement(NPCID.unknown1130, 0xC0, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry498 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0218, 0x60, 0xA4),
	SpritePlacement(NPCID.unknown0282, 0xD8, 0x78),
	SpritePlacement(NPCID.unknown0281, 0xE0, 0x58),
	SpritePlacement(NPCID.unknown0280, 0xE0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry499 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1547, 0x38, 0x70),
	SpritePlacement(NPCID.unknown1097, 0x48, 0x38),
	SpritePlacement(NPCID.unknown0284, 0xE0, 0x84),
	SpritePlacement(NPCID.unknown0285, 0xE8, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry500 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0712, 0x38, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry501 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1318, 0x48, 0x78),
	SpritePlacement(NPCID.unknown1548, 0xB8, 0x40),
	SpritePlacement(NPCID.unknown1546, 0xB8, 0x58),
	SpritePlacement(NPCID.unknown1099, 0xB8, 0x90),
	SpritePlacement(NPCID.unknown1098, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry502 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0717, 0x10, 0x38),
	SpritePlacement(NPCID.unknown0715, 0x40, 0x40),
	SpritePlacement(NPCID.unknown0716, 0x48, 0x20),
	SpritePlacement(NPCID.unknown0714, 0x60, 0x28),
	SpritePlacement(NPCID.unknown0713, 0x60, 0x50),
	SpritePlacement(NPCID.unknown0254, 0xC8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry503 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1314, 0xC0, 0x68),
	SpritePlacement(NPCID.unknown1315, 0xD8, 0x48),
	SpritePlacement(NPCID.unknown1313, 0xE0, 0x90),
	SpritePlacement(NPCID.unknown1317, 0xF0, 0x28),
	SpritePlacement(NPCID.unknown1316, 0xF0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry504 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1416, 0xC8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry505 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1196, 0x20, 0x80),
	SpritePlacement(NPCID.unknown1221, 0x48, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry506 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1413, 0x18, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry507 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0453, 0x00, 0x18),
	SpritePlacement(NPCID.unknown0454, 0x00, 0x28),
	SpritePlacement(NPCID.unknown0452, 0x10, 0x24),
	SpritePlacement(NPCID.unknown0455, 0x10, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry508 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0424, 0x18, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry509 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0423, 0x28, 0x38),
]);

immutable SpritePlacementEntry spritePlacementEntry510 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0553, 0xC8, 0x18),
	SpritePlacement(NPCID.unknown0552, 0xC8, 0x30),
	SpritePlacement(NPCID.unknown0554, 0xF0, 0x38),
	SpritePlacement(NPCID.unknown0555, 0xF8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry511 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0534, 0xB0, 0x38),
	SpritePlacement(NPCID.unknown0535, 0xB8, 0x48),
	SpritePlacement(NPCID.unknown0549, 0xC0, 0x58),
	SpritePlacement(NPCID.unknown0550, 0xC8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry512 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0567, 0x90, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry513 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown1093, 0x50, 0xC0),
	SpritePlacement(NPCID.unknown1089, 0x68, 0xA8),
	SpritePlacement(NPCID.unknown1092, 0x70, 0xC0),
	SpritePlacement(NPCID.unknown1542, 0x88, 0x50),
	SpritePlacement(NPCID.unknown1543, 0xA0, 0x58),
	SpritePlacement(NPCID.unknown1090, 0xA0, 0x80),
	SpritePlacement(NPCID.unknown1544, 0xA8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry514 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1091, 0x78, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry515 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0260, 0x60, 0x98),
	SpritePlacement(NPCID.unknown0261, 0xA0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry516 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1094, 0xA0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry517 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0330, 0xF0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry518 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1219, 0x58, 0xD0),
	SpritePlacement(NPCID.unknown1220, 0x70, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry519 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1179, 0x38, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry520 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1549, 0x90, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry521 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1430, 0x58, 0x00),
	SpritePlacement(NPCID.unknown0561, 0x58, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry522 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0556, 0xE8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry523 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0569, 0xD0, 0x00),
	SpritePlacement(NPCID.unknown0572, 0xF0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry524 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1431, 0x40, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry525 = SpritePlacementEntry(9, [
	SpritePlacement(NPCID.unknown0246, 0x80, 0x98),
	SpritePlacement(NPCID.unknown0245, 0x80, 0xA8),
	SpritePlacement(NPCID.unknown0237, 0x90, 0xE0),
	SpritePlacement(NPCID.unknown0238, 0x90, 0xF8),
	SpritePlacement(NPCID.unknown0231, 0xA0, 0x80),
	SpritePlacement(NPCID.unknown0236, 0xB0, 0x58),
	SpritePlacement(NPCID.unknown0235, 0xB0, 0xD0),
	SpritePlacement(NPCID.unknown0233, 0xB8, 0xA0),
	SpritePlacement(NPCID.unknown0232, 0xD0, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry526 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0243, 0x80, 0x60),
	SpritePlacement(NPCID.unknown0234, 0x98, 0x20),
	SpritePlacement(NPCID.unknown0242, 0x98, 0x70),
	SpritePlacement(NPCID.unknown0244, 0xB0, 0x40),
	SpritePlacement(NPCID.unknown0240, 0xB0, 0xA0),
	SpritePlacement(NPCID.unknown0239, 0xB8, 0xB8),
	SpritePlacement(NPCID.unknown0241, 0xC8, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry527 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0276, 0x40, 0xB0),
	SpritePlacement(NPCID.unknown0273, 0x48, 0x70),
	SpritePlacement(NPCID.unknown0274, 0x48, 0xF0),
	SpritePlacement(NPCID.unknown0272, 0x68, 0xB0),
]);

immutable SpritePlacementEntry spritePlacementEntry528 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0275, 0x40, 0x18),
	SpritePlacement(NPCID.unknown0271, 0x88, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry529 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1132, 0x40, 0x90),
	SpritePlacement(NPCID.unknown1133, 0x50, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry530 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1131, 0x48, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry531 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0210, 0x78, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry532 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0782, 0xE8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry533 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1492, 0x78, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry534 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0794, 0xE8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry535 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1491, 0x70, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry536 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1494, 0xB0, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry537 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1180, 0xF0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry538 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0574, 0xD0, 0xB8),
]);

immutable SpritePlacementEntry spritePlacementEntry539 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0573, 0x18, 0x18),
	SpritePlacement(NPCID.unknown0558, 0x30, 0x60),
	SpritePlacement(NPCID.unknown0560, 0x50, 0x68),
	SpritePlacement(NPCID.unknown0559, 0x80, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry540 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0575, 0xF0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry541 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0576, 0x28, 0x68),
	SpritePlacement(NPCID.unknown0518, 0xC0, 0x88),
	SpritePlacement(NPCID.unknown0523, 0xC0, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry542 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0563, 0x58, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry543 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1041, 0x78, 0x90),
	SpritePlacement(NPCID.unknown1042, 0x78, 0xF0),
	SpritePlacement(NPCID.unknown1044, 0xB0, 0x80),
	SpritePlacement(NPCID.unknown1045, 0xB0, 0xE0),
	SpritePlacement(NPCID.unknown1036, 0xD0, 0x88),
]);

immutable SpritePlacementEntry spritePlacementEntry544 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1043, 0x78, 0x50),
	SpritePlacement(NPCID.unknown1035, 0xA0, 0x20),
	SpritePlacement(NPCID.unknown1046, 0xB0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry545 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1018, 0xD8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry546 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1016, 0x40, 0x10),
	SpritePlacement(NPCID.unknown1019, 0x40, 0x68),
	SpritePlacement(NPCID.unknown1017, 0xC0, 0x40),
]);

immutable SpritePlacementEntry spritePlacementEntry547 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0264, 0x40, 0xF0),
	SpritePlacement(NPCID.unknown0265, 0x58, 0x58),
	SpritePlacement(NPCID.unknown0259, 0xC0, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry548 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0219, 0xD0, 0x78),
	SpritePlacement(NPCID.unknown1417, 0xD0, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry549 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1358, 0xA8, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry550 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1356, 0xD8, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry551 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1490, 0xC8, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry552 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0778, 0x50, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry553 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1551, 0xD0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry554 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0537, 0x08, 0xD8),
	SpritePlacement(NPCID.unknown0562, 0x48, 0x18),
	SpritePlacement(NPCID.unknown0520, 0x98, 0xF8),
	SpritePlacement(NPCID.unknown0517, 0xA8, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry555 = SpritePlacementEntry(12, [
	SpritePlacement(NPCID.unknown0583, 0x10, 0x78),
	SpritePlacement(NPCID.unknown0570, 0x18, 0x50),
	SpritePlacement(NPCID.unknown0551, 0x20, 0xC0),
	SpritePlacement(NPCID.unknown0538, 0x28, 0x88),
	SpritePlacement(NPCID.unknown0581, 0x48, 0x78),
	SpritePlacement(NPCID.unknown0580, 0x48, 0x98),
	SpritePlacement(NPCID.unknown0568, 0x98, 0xE0),
	SpritePlacement(NPCID.unknown0539, 0xB8, 0xC0),
	SpritePlacement(NPCID.unknown0522, 0xC8, 0x48),
	SpritePlacement(NPCID.unknown0565, 0xC8, 0xB8),
	SpritePlacement(NPCID.unknown0541, 0xC8, 0xF0),
	SpritePlacement(NPCID.unknown0540, 0xD0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry556 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0584, 0x38, 0xA0),
	SpritePlacement(NPCID.unknown0542, 0xC0, 0x00),
	SpritePlacement(NPCID.unknown0566, 0xD0, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry557 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0521, 0x60, 0xC0),
	SpritePlacement(NPCID.unknown0516, 0xD8, 0x20),
]);

immutable SpritePlacementEntry spritePlacementEntry558 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0564, 0x10, 0x70),
	SpritePlacement(NPCID.unknown0577, 0xE0, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry559 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1014, 0xC0, 0xB8),
	SpritePlacement(NPCID.unknown1011, 0xC8, 0xA0),
	SpritePlacement(NPCID.unknown1015, 0xE0, 0x60),
	SpritePlacement(NPCID.unknown1012, 0xE8, 0x30),
	SpritePlacement(NPCID.unknown1013, 0xE8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry560 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1032, 0x38, 0xD0),
	SpritePlacement(NPCID.unknown1028, 0x78, 0x90),
	SpritePlacement(NPCID.unknown1027, 0x90, 0x80),
	SpritePlacement(NPCID.unknown1030, 0xB8, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry561 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1031, 0x78, 0x10),
	SpritePlacement(NPCID.unknown1026, 0x80, 0x48),
	SpritePlacement(NPCID.unknown1029, 0x98, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry562 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1025, 0x88, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry563 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown1000, 0xC8, 0x40),
	SpritePlacement(NPCID.unknown0996, 0xC8, 0xB0),
	SpritePlacement(NPCID.unknown0999, 0xD8, 0x58),
	SpritePlacement(NPCID.unknown0997, 0xD8, 0x88),
	SpritePlacement(NPCID.unknown0998, 0xD8, 0xA0),
	SpritePlacement(NPCID.unknown1001, 0xF0, 0x30),
	SpritePlacement(NPCID.unknown1002, 0xF0, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry564 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1355, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry565 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0758, 0x00, 0xFC),
	SpritePlacement(NPCID.unknown0780, 0xA8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry566 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0759, 0x10, 0x0C),
]);

immutable SpritePlacementEntry spritePlacementEntry567 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1493, 0x50, 0x70),
	SpritePlacement(NPCID.unknown0768, 0x88, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry568 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0781, 0x80, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry569 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1496, 0x58, 0xE0),
]);

immutable SpritePlacementEntry spritePlacementEntry570 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0525, 0xC0, 0xA0),
]);

immutable SpritePlacementEntry spritePlacementEntry571 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0519, 0x30, 0x20),
	SpritePlacement(NPCID.unknown1432, 0x70, 0x98),
	SpritePlacement(NPCID.unknown0515, 0xA8, 0x68),
	SpritePlacement(NPCID.unknown0578, 0xA8, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry572 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0536, 0x20, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry573 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0579, 0x70, 0xC0),
	SpritePlacement(NPCID.unknown0528, 0xE0, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry574 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown1433, 0x88, 0xB8),
	SpritePlacement(NPCID.unknown0571, 0xB0, 0xF8),
	SpritePlacement(NPCID.unknown0529, 0xE8, 0x08),
	SpritePlacement(NPCID.unknown0526, 0xE8, 0x80),
	SpritePlacement(NPCID.unknown0530, 0xF8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry575 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0557, 0xB0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry576 = SpritePlacementEntry(9, [
	SpritePlacement(NPCID.unknown0487, 0x40, 0x40),
	SpritePlacement(NPCID.unknown0483, 0x40, 0x58),
	SpritePlacement(NPCID.unknown0486, 0x50, 0xA8),
	SpritePlacement(NPCID.unknown0485, 0x60, 0x70),
	SpritePlacement(NPCID.unknown0484, 0x68, 0x48),
	SpritePlacement(NPCID.unknown1023, 0xC0, 0x40),
	SpritePlacement(NPCID.unknown1022, 0xC0, 0xB8),
	SpritePlacement(NPCID.unknown1020, 0xC8, 0x70),
	SpritePlacement(NPCID.unknown1021, 0xE0, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry577 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0508, 0xD0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry578 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0488, 0x40, 0x30),
	SpritePlacement(NPCID.unknown1024, 0xD8, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry579 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0502, 0x58, 0x58),
	SpritePlacement(NPCID.unknown0493, 0xD8, 0xD0),
	SpritePlacement(NPCID.unknown0492, 0xE0, 0x98),
	SpritePlacement(NPCID.unknown0494, 0xE0, 0xC0),
	SpritePlacement(NPCID.unknown0497, 0xE8, 0x88),
	SpritePlacement(NPCID.unknown0495, 0xF0, 0xB8),
	SpritePlacement(NPCID.unknown0496, 0xF8, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry580 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0490, 0x40, 0x88),
	SpritePlacement(NPCID.unknown0489, 0x58, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry581 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0491, 0x58, 0x08),
	SpritePlacement(NPCID.unknown0498, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry582 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1357, 0x80, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry583 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1354, 0xB8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry584 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0772, 0xE0, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry585 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0771, 0xC8, 0x10),
]);

immutable SpritePlacementEntry spritePlacementEntry586 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0783, 0x80, 0x68),
]);

immutable SpritePlacementEntry spritePlacementEntry587 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1489, 0xA0, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry588 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0792, 0xB0, 0x78),
	SpritePlacement(NPCID.unknown0760, 0xC0, 0xF0),
]);

immutable SpritePlacementEntry spritePlacementEntry589 = SpritePlacementEntry(10, [
	SpritePlacement(NPCID.unknown0788, 0x30, 0xC0),
	SpritePlacement(NPCID.unknown0775, 0x38, 0xD0),
	SpritePlacement(NPCID.unknown0763, 0x48, 0x80),
	SpritePlacement(NPCID.unknown0762, 0x50, 0x70),
	SpritePlacement(NPCID.unknown0774, 0x50, 0xB0),
	SpritePlacement(NPCID.unknown0761, 0x70, 0x58),
	SpritePlacement(NPCID.unknown0764, 0x70, 0xD0),
	SpritePlacement(NPCID.unknown0777, 0x78, 0x90),
	SpritePlacement(NPCID.unknown0793, 0xE0, 0x20),
	SpritePlacement(NPCID.unknown0796, 0xE0, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry590 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1176, 0xB8, 0x30),
	SpritePlacement(NPCID.unknown1177, 0xB8, 0x50),
]);

immutable SpritePlacementEntry spritePlacementEntry591 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0543, 0x58, 0xC0),
	SpritePlacement(NPCID.unknown0546, 0xE8, 0xF8),
]);

immutable SpritePlacementEntry spritePlacementEntry592 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0544, 0xC8, 0x60),
	SpritePlacement(NPCID.unknown0545, 0xC8, 0x90),
	SpritePlacement(NPCID.unknown0524, 0xE0, 0xDC),
]);

immutable SpritePlacementEntry spritePlacementEntry593 = SpritePlacementEntry(6, [
	SpritePlacement(NPCID.unknown0527, 0x20, 0x90),
	SpritePlacement(NPCID.unknown0582, 0x88, 0x20),
	SpritePlacement(NPCID.unknown0531, 0x98, 0x10),
	SpritePlacement(NPCID.unknown0532, 0x98, 0x30),
	SpritePlacement(NPCID.unknown0533, 0xB8, 0x20),
	SpritePlacement(NPCID.unknown0547, 0xD8, 0x98),
]);

immutable SpritePlacementEntry spritePlacementEntry594 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1003, 0x58, 0x80),
	SpritePlacement(NPCID.unknown1047, 0xC0, 0x50),
	SpritePlacement(NPCID.unknown1048, 0xD8, 0xA8),
]);

immutable SpritePlacementEntry spritePlacementEntry595 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1033, 0x48, 0x70),
	SpritePlacement(NPCID.unknown1034, 0x48, 0x90),
	SpritePlacement(NPCID.unknown0512, 0xD8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry596 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1004, 0x60, 0x50),
	SpritePlacement(NPCID.unknown1049, 0xC8, 0x60),
	SpritePlacement(NPCID.unknown1050, 0xD0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry597 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown1037, 0x40, 0x68),
	SpritePlacement(NPCID.unknown0513, 0xC8, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry598 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1005, 0x50, 0x48),
]);

immutable SpritePlacementEntry spritePlacementEntry599 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown1038, 0x58, 0x50),
	SpritePlacement(NPCID.unknown1039, 0x60, 0x98),
	SpritePlacement(NPCID.unknown1040, 0x68, 0xA8),
	SpritePlacement(NPCID.unknown0506, 0xC0, 0x68),
	SpritePlacement(NPCID.unknown0505, 0xC8, 0xA8),
	SpritePlacement(NPCID.unknown0504, 0xC8, 0xC0),
	SpritePlacement(NPCID.unknown0507, 0xF0, 0x78),
]);

immutable SpritePlacementEntry spritePlacementEntry600 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0769, 0x68, 0xC0),
]);

immutable SpritePlacementEntry spritePlacementEntry601 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0790, 0xF8, 0x08),
]);

immutable SpritePlacementEntry spritePlacementEntry602 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1495, 0x70, 0x28),
]);

immutable SpritePlacementEntry spritePlacementEntry603 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0765, 0xB8, 0x70),
	SpritePlacement(NPCID.unknown0766, 0xB8, 0x88),
	SpritePlacement(NPCID.unknown0767, 0xB8, 0xA0),
	SpritePlacement(NPCID.unknown0779, 0xD8, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry604 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0548, 0x08, 0xD8),
]);

immutable SpritePlacementEntry spritePlacementEntry605 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0776, 0xE8, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry606 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown1281, 0x20, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry607 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown1279, 0x40, 0x10),
	SpritePlacement(NPCID.unknown1278, 0x40, 0x20),
	SpritePlacement(NPCID.unknown1277, 0x48, 0x1C),
	SpritePlacement(NPCID.unknown1280, 0x48, 0x30),
]);

immutable SpritePlacementEntry spritePlacementEntry608 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown0499, 0xC0, 0x50),
	SpritePlacement(NPCID.unknown0501, 0xD0, 0xB8),
	SpritePlacement(NPCID.unknown0500, 0xE8, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry609 = SpritePlacementEntry(4, [
	SpritePlacement(NPCID.unknown0437, 0x40, 0x48),
	SpritePlacement(NPCID.unknown0438, 0x40, 0x80),
	SpritePlacement(NPCID.unknown0436, 0x50, 0x58),
	SpritePlacement(NPCID.unknown0514, 0xE0, 0x58),
]);

immutable SpritePlacementEntry spritePlacementEntry610 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1006, 0x60, 0x50),
	SpritePlacement(NPCID.unknown1007, 0x68, 0x7C),
	SpritePlacement(NPCID.unknown0503, 0xC8, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry611 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0511, 0xD0, 0x60),
]);

immutable SpritePlacementEntry spritePlacementEntry612 = SpritePlacementEntry(3, [
	SpritePlacement(NPCID.unknown1008, 0x48, 0x68),
	SpritePlacement(NPCID.unknown1009, 0x58, 0x30),
	SpritePlacement(NPCID.unknown1010, 0x68, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry613 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0510, 0x48, 0x70),
	SpritePlacement(NPCID.unknown0509, 0xC0, 0x70),
]);

immutable SpritePlacementEntry spritePlacementEntry614 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0773, 0x10, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry615 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0791, 0x40, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry616 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0754, 0x60, 0xC8),
]);

immutable SpritePlacementEntry spritePlacementEntry617 = SpritePlacementEntry(8, [
	SpritePlacement(NPCID.unknown0757, 0x08, 0x30),
	SpritePlacement(NPCID.unknown0784, 0x10, 0x08),
	SpritePlacement(NPCID.unknown0786, 0x10, 0x58),
	SpritePlacement(NPCID.unknown0785, 0x10, 0xA0),
	SpritePlacement(NPCID.unknown0755, 0x18, 0x58),
	SpritePlacement(NPCID.unknown0756, 0x30, 0x38),
	SpritePlacement(NPCID.unknown0787, 0x38, 0x78),
	SpritePlacement(NPCID.unknown0789, 0x38, 0xD0),
]);

immutable SpritePlacementEntry spritePlacementEntry618 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0585, 0xC0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry619 = SpritePlacementEntry(5, [
	SpritePlacement(NPCID.unknown0795, 0x10, 0x90),
	SpritePlacement(NPCID.unknown0770, 0x18, 0x88),
	SpritePlacement(NPCID.unknown0587, 0xC0, 0xB8),
	SpritePlacement(NPCID.unknown0586, 0xE8, 0x00),
	SpritePlacement(NPCID.unknown0588, 0xE8, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry620 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0589, 0xC0, 0x90),
]);

immutable SpritePlacementEntry spritePlacementEntry621 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0348, 0xC0, 0x80),
]);

immutable SpritePlacementEntry spritePlacementEntry622 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0349, 0xE8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry623 = SpritePlacementEntry(7, [
	SpritePlacement(NPCID.unknown0479, 0x28, 0xD8),
	SpritePlacement(NPCID.unknown0480, 0x30, 0x68),
	SpritePlacement(NPCID.unknown0482, 0x30, 0x68),
	SpritePlacement(NPCID.unknown0478, 0x38, 0x40),
	SpritePlacement(NPCID.unknown0481, 0x40, 0x38),
	SpritePlacement(NPCID.unknown0477, 0x50, 0x80),
	SpritePlacement(NPCID.unknown0345, 0xE8, 0xE8),
]);

immutable SpritePlacementEntry spritePlacementEntry624 = SpritePlacementEntry(1, [
	SpritePlacement(NPCID.unknown0344, 0xC0, 0x18),
]);

immutable SpritePlacementEntry spritePlacementEntry625 = SpritePlacementEntry(2, [
	SpritePlacement(NPCID.unknown0347, 0xC0, 0x80),
	SpritePlacement(NPCID.unknown0346, 0xE8, 0x00),
]);

immutable SpritePlacementEntry spritePlacementEntry626 = SpritePlacementEntry(21, [
	SpritePlacement(NPCID.unknown0476, 0x60, 0x70),
	SpritePlacement(NPCID.unknown0466, 0x70, 0x9C),
	SpritePlacement(NPCID.unknown0461, 0x78, 0x28),
	SpritePlacement(NPCID.unknown0463, 0x78, 0x7C),
	SpritePlacement(NPCID.unknown0462, 0x80, 0x30),
	SpritePlacement(NPCID.unknown0460, 0x88, 0x18),
	SpritePlacement(NPCID.unknown0456, 0x98, 0x88),
	SpritePlacement(NPCID.unknown0465, 0x98, 0x8C),
	SpritePlacement(NPCID.unknown0464, 0x98, 0xBC),
	SpritePlacement(NPCID.unknown0467, 0xA8, 0x5C),
	SpritePlacement(NPCID.unknown0457, 0xA8, 0x68),
	SpritePlacement(NPCID.unknown0468, 0xA8, 0xB4),
	SpritePlacement(NPCID.unknown0469, 0xB0, 0x4C),
	SpritePlacement(NPCID.unknown0459, 0xB0, 0x98),
	SpritePlacement(NPCID.unknown0475, 0xB8, 0x18),
	SpritePlacement(NPCID.unknown0458, 0xB8, 0x80),
	SpritePlacement(NPCID.unknown0470, 0xB8, 0x94),
	SpritePlacement(NPCID.unknown0471, 0xC0, 0x6C),
	SpritePlacement(NPCID.unknown0474, 0xD8, 0x64),
	SpritePlacement(NPCID.unknown0472, 0xD8, 0xCC),
	SpritePlacement(NPCID.unknown0473, 0xE0, 0x9C),
]);

/// $CF8985
immutable NPC[1584] npcConfig = [
	NPCID.unknown0000: NPC(NPCType.person, OverworldSprite.ness, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0001: NPC(NPCType.person, OverworldSprite.skatePunk, Direction.down, ActionScript.animMapObjTBack, EventFlag.onetGuardSharkDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_SHARK_D", null),
	NPCID.unknown0002: NPC(NPCType.person, OverworldSprite.skatePunk, Direction.right, ActionScript.walkTowardsPlayer, EventFlag.onetSharkCDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_SHARK_C", null),
	NPCID.unknown0003: NPC(NPCType.person, OverworldSprite.skatePunk, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SHARK_F", null),
	NPCID.unknown0004: NPC(NPCType.person, OverworldSprite.skatePunk, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SHARK_E", null),
	NPCID.unknown0005: NPC(NPCType.person, OverworldSprite.skatePunk, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SHARK_G", null),
	NPCID.unknown0006: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SHARK_GOROTUKI", null),
	NPCID.unknown0007: NPC(NPCType.person, OverworldSprite.skatePunk, Direction.up, ActionScript.walkTowardsPlayer, EventFlag.onetShark2FDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_SHARK_SYSINFO_BTL", null),
	NPCID.unknown0008: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_DRUG2", null),
	NPCID.unknown0009: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_DRUG1", null),
	NPCID.unknown0010: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_DRUG_BOY", null),
	NPCID.unknown0011: NPC(NPCType.person, OverworldSprite.dog, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SYSMSG_EQUIP", null),
	NPCID.unknown0012: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0013: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown0014: NPC(NPCType.person, OverworldSprite.mom, Direction.down, ActionScript.mom1, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOn, "MSG_MYHOME_MAMA_0", null),
	NPCID.unknown0015: NPC(NPCType.person, OverworldSprite.mom, Direction.right, ActionScript.animPeopleWalk1, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_MAMA", null),
	NPCID.unknown0016: NPC(NPCType.person, OverworldSprite.nessDogSleeping, Direction.down, ActionScript.animPeopleSleep, EventFlag.dog, NPCConfigFlagStyle.showIfOff, "MSG_MYHOME_DOG", null),
	NPCID.unknown0017: NPC(NPCType.person, OverworldSprite.pokey, Direction.left, ActionScript.animPeopleWalk0, EventFlag.myHomePokeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_MYHOME_POKEY", null),
	NPCID.unknown0018: NPC(NPCType.person, OverworldSprite.king, Direction.right, ActionScript.king1, EventFlag.dogLaterAppear, NPCConfigFlagStyle.showIfOn, "MSG_MYHOME_DOG", null),
	NPCID.unknown0019: NPC(NPCType.person, OverworldSprite.pokey, Direction.down, ActionScript.pokey1, EventFlag.myHomePokey2Appear, NPCConfigFlagStyle.showIfOn, "MSG_MYHOME_POKEY", null),
	NPCID.unknown0020: NPC(NPCType.person, OverworldSprite.tracy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.myHome1FTracyAppear, NPCConfigFlagStyle.showIfOn, "MSG_MYHOME_TRACY", null),
	NPCID.unknown0021: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.homeTelephone, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TELE_PAPA_MYHOME", null),
	NPCID.unknown0022: NPC(NPCType.object, OverworldSprite.knockingOnDoor, Direction.left, ActionScript.animKnockDoor, EventFlag.myHomeKnockAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0023: NPC(NPCType.object, OverworldSprite.drapesClosed, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0024: NPC(NPCType.object, OverworldSprite.drapesClosed, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0025: NPC(NPCType.person, OverworldSprite.tracy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.kaidanTracyAppear, NPCConfigFlagStyle.showIfOn, "MSG_KAIDAN_TRACY", null),
	NPCID.unknown0026: NPC(NPCType.object, OverworldSprite.nessSleeping, Direction.down, ActionScript.sleepingNess, EventFlag.myhomeSleepNesAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0027: NPC(NPCType.object, OverworldSprite.zzz, Direction.down, ActionScript.sleepEmote, EventFlag.myhomeSleepNesAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0028: NPC(NPCType.object, OverworldSprite.drapesClosed, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0029: NPC(NPCType.object, OverworldSprite.yellowDrapesClosed, Direction.left, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0030: NPC(NPCType.person, OverworldSprite.tracy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.myHomeTracyDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_TRACY", null),
	NPCID.unknown0031: NPC(NPCType.object, OverworldSprite.drapesClosed, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0032: NPC(NPCType.object, OverworldSprite.yellowDrapesClosed, Direction.right, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0033: NPC(NPCType.person, OverworldSprite.waitress, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HAMBURGER_WAITRESSA", null),
	NPCID.unknown0034: NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HAMBURGER_OBASAN", null),
	NPCID.unknown0035: NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HAMBURGER_GIRL", null),
	NPCID.unknown0036: NPC(NPCType.person, OverworldSprite.frank, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_ONET_FRANK_LATER", null),
	NPCID.unknown0037: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SYSINFO_PRICE", null),
	NPCID.unknown0038: NPC(NPCType.person, OverworldSprite.frank, Direction.right, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0039: NPC(NPCType.person, OverworldSprite.hintGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "MSG_ONET_HINTMAN", null),
	NPCID.unknown0040: NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_BAKERY_CLERK", null),
	NPCID.unknown0041: NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_BAKERY_OBASAN", null),
	NPCID.unknown0042: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_BAKERY_MADAM", null),
	NPCID.unknown0043: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SYSINFO_LUCKY", null),
	NPCID.unknown0044: NPC(NPCType.person, OverworldSprite.aloysiusMinch, Direction.down, ActionScript.animMapObjTBack, EventFlag.onetMincesAppear, NPCConfigFlagStyle.showIfOn, "MSG_AMBRAMI_MINCE", null),
	NPCID.unknown0045: NPC(NPCType.person, OverworldSprite.lardnaMinch, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.onetLardnaAppear, NPCConfigFlagStyle.showIfOn, "MSG_LARDNA_MINCE", null),
	NPCID.unknown0046: NPC(NPCType.person, OverworldSprite.fly, Direction.down, ActionScript.animPeopleWalk0, EventFlag.onetMyHomeBunbunAppear, NPCConfigFlagStyle.showIfOn, "MSG_BUNBUN_SINI", null),
	NPCID.unknown0047: NPC(NPCType.person, OverworldSprite.picky, Direction.down, ActionScript.animPeopleWalk1, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_RUSUBAN_PICKEY", null),
	NPCID.unknown0048: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_ONET_MINCE_COLORMAN", null),
	NPCID.unknown0049: NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0050: NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0051: NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0052: NPC(NPCType.person, OverworldSprite.pokey, Direction.left, ActionScript.animPeopleWalk1, EventFlag.onet2FPokeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_ONET_POKEY", null),
	NPCID.unknown0053: NPC(NPCType.person, OverworldSprite.picky, Direction.up, ActionScript.animPeopleTBack, EventFlag.onet2FPickeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_ONET_PICKEY", null),
	NPCID.unknown0054: NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0055: NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0056: NPC(NPCType.object, OverworldSprite.yellowDrapesOpen, Direction.down, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0057: NPC(NPCType.object, OverworldSprite.yellowDrapesClosed, Direction.left, ActionScript.animMapObjStill, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0058: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HOTEL_ONET", null),
	NPCID.unknown0059: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOTELPORTER", null),
	NPCID.unknown0060: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown0061: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0062: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.down, ActionScript.animPeopleWalk0, EventFlag.unknown0106, NPCConfigFlagStyle.showIfOff, "MSG_ONET_HOTEL_WOMAN", null),
	NPCID.unknown0063: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.unknown0106, NPCConfigFlagStyle.showIfOff, "MSG_ONET_HOTEL_MAN", null),
	NPCID.unknown0064: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.left, ActionScript.animPeopleWalk0, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "MSG_HOTEL_ONET_PAPERBOY", null),
	NPCID.unknown0065: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.right, ActionScript.animPeopleWalk1, EventFlag.unknown0106, NPCConfigFlagStyle.showIfOn, "MSG_ONET_HOTEL_WOMAN2", null),
	NPCID.unknown0066: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.unknown0106, NPCConfigFlagStyle.showIfOn, "MSG_ONET_HOTEL_MAN2", null),
	NPCID.unknown0067: NPC(NPCType.person, OverworldSprite.captainStrong, Direction.down, ActionScript.animMapObjTBack, EventFlag.policeStrongDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_POLICEOFFICER_A", null),
	NPCID.unknown0068: NPC(NPCType.person, OverworldSprite.thickGlassesLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_POLICEOFFICER_C", null),
	NPCID.unknown0069: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_POLICEOFFICER_B", null),
	NPCID.unknown0070: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animMapObjTBack, EventFlag.policeKanbanCopAppear, NPCConfigFlagStyle.showIfOn, "MSG_ONET_POLICE_KANBAN_LATER", null),
	NPCID.unknown0071: NPC(NPCType.person, OverworldSprite.captainStrong, Direction.right, ActionScript.animMapObjTBack, EventFlag.policeStrongBAppear, NPCConfigFlagStyle.showIfOn, "MSG_ONET_POLICEOFFICER_A", null),
	NPCID.unknown0072: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_POLICE_GANG", null),
	NPCID.unknown0073: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animMapObjStill, EventFlag.onetCopADisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_COPA", null),
	NPCID.unknown0074: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animMapObjStill, EventFlag.onetCopBDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_COPB", null),
	NPCID.unknown0075: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animMapObjStill, EventFlag.onetCopCDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_COPC", null),
	NPCID.unknown0076: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.right, ActionScript.animMapObjStill, EventFlag.onetCopDDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_COPD", null),
	NPCID.unknown0077: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.right, ActionScript.animMapObjStill, EventFlag.onetCopEDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_COPE", null),
	NPCID.unknown0078: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_TOWNHALL_OZISAN_A", null),
	NPCID.unknown0079: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_TOWNHALL_A", null),
	NPCID.unknown0080: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_TOWNHALL_C", null),
	NPCID.unknown0081: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_TOWNHALL_OLDMAN", null),
	NPCID.unknown0082: NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_TOWNHALL_WOMAN", null),
	NPCID.unknown0083: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_TOWNHALL_B", null),
	NPCID.unknown0084: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_TOWNHALL_OZISAN_B", null),
	NPCID.unknown0085: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_DONNA", null),
	NPCID.unknown0086: NPC(NPCType.person, OverworldSprite.mayorPirkle, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_PIKARL", null),
	NPCID.unknown0087: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_MAYOR_OZISAN", null),
	NPCID.unknown0088: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_MAYOR_COP", null),
	NPCID.unknown0089: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOUSE_B", null),
	NPCID.unknown0090: NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOUSE_C", null),
	NPCID.unknown0091: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOUSE_E", null),
	NPCID.unknown0092: NPC(NPCType.person, OverworldSprite.kidInDerbyHat, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOUSE_G", null),
	NPCID.unknown0093: NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOUSE_H", null),
	NPCID.unknown0094: NPC(NPCType.person, OverworldSprite.exitMouseNoSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_NHOUSE_MOUSE_MOTHER", null),
	NPCID.unknown0095: NPC(NPCType.person, OverworldSprite.exitMouse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.itemEscapeMouse, NPCConfigFlagStyle.showIfOff, "MSG_ONET_NHOUSE_MOUSE_CHILD1", null),
	NPCID.unknown0096: NPC(NPCType.person, OverworldSprite.exitMouse, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_NHOUSE_MOUSE_CHILD2", null),
	NPCID.unknown0097: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SYSMSG_ESCAPE_MOUSE", null),
	NPCID.unknown0098: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_LUCY", "MSG_LIBRARY_LUCY_RECEIVE"),
	NPCID.unknown0099: NPC(NPCType.person, OverworldSprite.oldFatGuyWithHat, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_LIBRARY_OLDMAN", null),
	NPCID.unknown0100: NPC(NPCType.person, OverworldSprite.shyGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_MUKUCHI", null),
	NPCID.unknown0101: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.up, ActionScript.unknown250, EventFlag.libraryToilet, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0102: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_SYSMSG_TEL_PLACE", null),
	NPCID.unknown0103: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_PEOPLE_C", null),
	NPCID.unknown0104: NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_SYSMSG_CD_PLACE", null),
	NPCID.unknown0105: NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.up, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_PEOPLE_A", "MSG_LIBRARY_A_RECEIVE"),
	NPCID.unknown0106: NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_PEOPLE_D", "MSG_LIBRARY_D_RECEIVE"),
	NPCID.unknown0107: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_SYSMSG_PP_0", null),
	NPCID.unknown0108: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_PEOPLE_B", null),
	NPCID.unknown0109: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_LIBRARY_SYSMSG_BUTTERFLY", null),
	NPCID.unknown0110: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOSPITAL_USHER", null),
	NPCID.unknown0111: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_ONET", null),
	NPCID.unknown0112: NPC(NPCType.person, OverworldSprite.bigSmileLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_SYSMSG_HEALER", null),
	NPCID.unknown0113: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOSPITAL_DOCTOR", null),
	NPCID.unknown0114: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOSPITAL_NURSE", null),
	NPCID.unknown0115: NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HPTL_ROOM1_A", null),
	NPCID.unknown0116: NPC(NPCType.person, OverworldSprite.happyGirlInRed, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HPTL_ROOM2_A", null),
	NPCID.unknown0117: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HPTL_ROOM2_B", null),
	NPCID.unknown0118: NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_HOSPITAL_PATIENT", null),
	NPCID.unknown0119: NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.animMapObjStill, EventFlag._1fMizunoAppear, NPCConfigFlagStyle.showIfOn, "MSG_INSEKI_MIZUNO_1F", null),
	NPCID.unknown0120: NPC(NPCType.person, OverworldSprite.kidInDerbyHat, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_KAKUREGA_A", null),
	NPCID.unknown0121: NPC(NPCType.person, OverworldSprite.kidInDetectiveHat, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_KAKUREGA_B", null),
	NPCID.unknown0122: NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.left, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_KAKUREGA_C", null),
	NPCID.unknown0123: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown863, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0124: NPC(NPCType.person, OverworldSprite.pickySitting, Direction.left, ActionScript.unknown055, EventFlag.insekiPickeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_INSEKI_PICKEY", null),
	NPCID.unknown0125: NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.down, ActionScript.animMapObjStill, EventFlag.onetAmbrami, NPCConfigFlagStyle.showIfOff, "MSG_INSEKI_MIZUNO", null),
	NPCID.unknown0126: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleWalk0, EventFlag.onetKanbanCopAppear, NPCConfigFlagStyle.showIfOn, "MSG_ONET_POLICE_KANBAN", null),
	NPCID.unknown0127: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.left, ActionScript.unknown607, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_KAKUREGA_GUARD", null),
	NPCID.unknown0128: NPC(NPCType.person, OverworldSprite.travellingEntertainer, Direction.down, ActionScript.unknown608, EventFlag.itemPretz, NPCConfigFlagStyle.showIfOff, "MSG_ONET_PRETZ", "MSG_ONET_PRETZ_RECEIVE"),
	NPCID.unknown0129: NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.right, ActionScript.unknown607, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_GIRL", null),
	NPCID.unknown0130: NPC(NPCType.person, OverworldSprite.helpfulMole, Direction.down, ActionScript.animPeopleTBack, EventFlag.onetDoorClose, NPCConfigFlagStyle.showIfOff, "MSG_ONET_SYSMSG_ENCOUNTER", null),
	NPCID.unknown0131: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.left, ActionScript.unknown607, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_C", null),
	NPCID.unknown0132: NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.right, ActionScript.unknown607, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_F", null),
	NPCID.unknown0133: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.right, ActionScript.unknown608, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_D", null),
	NPCID.unknown0134: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.left, ActionScript.unknown609, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_B", null),
	NPCID.unknown0135: NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.right, ActionScript.unknown609, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_A", null),
	NPCID.unknown0136: NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.left, ActionScript.unknown609, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_E", null),
	NPCID.unknown0137: NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.down, ActionScript.unknown607, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_OLDWOMAN", null),
	NPCID.unknown0138: NPC(NPCType.person, OverworldSprite.dog, Direction.down, ActionScript.unknown608, EventFlag.myHomeStart, NPCConfigFlagStyle.showIfOn, "MSG_ONET_STRAYDOG", null),
	NPCID.unknown0139: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.unknown610, EventFlag.gotCapeEstate, NPCConfigFlagStyle.showIfOff, "MSG_ONET_CAPEESTATE", null),
	NPCID.unknown0140: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.right, ActionScript.unknown607, EventFlag.gotCapeEstate, NPCConfigFlagStyle.showIfOn, "MSG_ONET_REALTOR", null),
	NPCID.unknown0141: NPC(NPCType.person, OverworldSprite.trumpetPerson, Direction.left, ActionScript.animPeopleTBack, EventFlag.onetDoorClose, NPCConfigFlagStyle.showIfOff, "MSG_ONET_TRUMPETER", null),
	NPCID.unknown0142: NPC(NPCType.person, OverworldSprite.skatePunk, Direction.down, ActionScript.animPeopleTBack, EventFlag.onetSharkADisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_SHARK_A", null),
	NPCID.unknown0143: NPC(NPCType.person, OverworldSprite.skatePunk, Direction.up, ActionScript.unknown609, EventFlag.onetSharkBDisappear, NPCConfigFlagStyle.showIfOff, "MSG_ONET_SHARK_B", null),
	NPCID.unknown0144: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.up, ActionScript.animPeopleTBack, EventFlag.tlptTwsn, NPCConfigFlagStyle.showIfOff, "MSG_ONET_GATE_A", null),
	NPCID.unknown0145: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptTwsn, NPCConfigFlagStyle.showIfOff, "MSG_ONET_GATE_B", null),
	NPCID.unknown0146: NPC(NPCType.person, OverworldSprite.frank, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.infoXyz, NPCConfigFlagStyle.showIfOff, "MSG_ONET_FRANK", null),
	NPCID.unknown0147: NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animBillboard, EventFlag.openTabigoya, NPCConfigFlagStyle.showIfOff, "MSG_ONET_TABIGOYA", "MSG_ONET_TABIGOYA_RECEIVE"),
	NPCID.unknown0148: NPC(NPCType.person, OverworldSprite.mom, Direction.down, ActionScript.animMapObjStill, EventFlag.genkanMamaAppear, NPCConfigFlagStyle.showIfOn, "MSG_GENKAN_MAMA", null),
	NPCID.unknown0149: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.left, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_MAN2", null),
	NPCID.unknown0150: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.right, ActionScript.animMapObjStill, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP2", null),
	NPCID.unknown0151: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.up, ActionScript.animMapObjTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP3", null),
	NPCID.unknown0152: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_MAN1", null),
	NPCID.unknown0153: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleWalk1, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP1", null),
	NPCID.unknown0154: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP4", null),
	NPCID.unknown0155: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP5", null),
	NPCID.unknown0156: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP6", null),
	NPCID.unknown0157: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP7", null),
	NPCID.unknown0158: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.up, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP8", null),
	NPCID.unknown0159: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animMapObjTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP9", null),
	NPCID.unknown0160: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.up, ActionScript.animPeopleTBack, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_COP10", null),
	NPCID.unknown0161: NPC(NPCType.person, OverworldSprite.pokey, Direction.up, ActionScript.unknown629, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, "MSG_YAZIUMA_POKEY", null),
	NPCID.unknown0162: NPC(NPCType.person, OverworldSprite.travellingEntertainer, Direction.right, ActionScript.unknown608, EventFlag.itemPretz, NPCConfigFlagStyle.showIfOff, "MSG_ONET_PRETZ_2", "MSG_ONET_PRETZ_RECEIVE"),
	NPCID.unknown0163: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winFrank, NPCConfigFlagStyle.showIfOff, "MSG_ONET_SHARK_INFO_FRANK", null),
	NPCID.unknown0164: NPC(NPCType.person, OverworldSprite.captainStrong, Direction.left, ActionScript.animMapObjStill, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0165: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animPeopleWalk0, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0166: NPC(NPCType.person, OverworldSprite.happyGirlInRed, Direction.up, ActionScript.animPeopleTBack, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, "MSG_ONET_G", null),
	NPCID.unknown0167: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.left, ActionScript.animPeopleTBack, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, "MSG_ONET_H", null),
	NPCID.unknown0168: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0169: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0170: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0171: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0172: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0173: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0174: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0175: NPC(NPCType.object, OverworldSprite.whiteDeliveryTruck, Direction.left, ActionScript.unknown585, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0176: NPC(NPCType.object, OverworldSprite.deliveryTruck, Direction.left, ActionScript.unknown586, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0177: NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0178: NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0179: NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0180: NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.onetGateOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0181: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0182: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0183: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.unknown862, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0184: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0185: NPC(NPCType.object, OverworldSprite.dontEnterSign, Direction.down, ActionScript.animBillboard, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_CHECK_DONTENTER", null),
	NPCID.unknown0186: NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.unknown584, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0187: NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.insekiStopperAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0188: NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.insekiStopperAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0189: NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0190: NPC(NPCType.object, OverworldSprite.policeBarrier, Direction.down, ActionScript.animMapObjStill, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0191: NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_CHECK_HOTEL_KANBAN", null),
	NPCID.unknown0192: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_CHECK_MIZUNO", null),
	NPCID.unknown0193: NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0194: NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0195: NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0196: NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0197: NPC(NPCType.object, OverworldSprite.ovalCloud, Direction.down, ActionScript.unknown784, EventFlag.onetDayBreak, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0198: NPC(NPCType.object, OverworldSprite.meteor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "TEXT_DOOR_150", null),
	NPCID.unknown0199: NPC(NPCType.object, OverworldSprite.policeCar, Direction.right, ActionScript.animPeopleWalk0, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0200: NPC(NPCType.object, OverworldSprite.policeCar, Direction.left, ActionScript.animPeopleWalk0, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0201: NPC(NPCType.object, OverworldSprite.policeCar, Direction.right, ActionScript.animPeopleWalk0, EventFlag.yaziumaDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0202: NPC(NPCType.object, OverworldSprite.frankysteinMarkII, Direction.down, ActionScript.animMapObjStill, EventFlag.winFrank, NPCConfigFlagStyle.showIfOff, "MSG_ONET_CHECK_STEIN2", null),
	NPCID.unknown0203: NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.unknown057, EventFlag.b1MizunoAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0204: NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.unknown058, EventFlag.b2MizunoAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0205: NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.unknown059, EventFlag.b3mizunoAAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0206: NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.right, ActionScript.unknown060, EventFlag.b3mizunoBAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0207: NPC(NPCType.person, OverworldSprite.lierXAgerate, Direction.up, ActionScript.animMapObjTBack, EventFlag.b4mizunoAppear, NPCConfigFlagStyle.showIfOn, "MSG_INSEKI_MIZUNO_B2", null),
	NPCID.unknown0208: NPC(NPCType.object, OverworldSprite.evilManiMani, Direction.down, ActionScript.animPeopleWalk0, EventFlag.tlptTwsn, NPCConfigFlagStyle.showIfOff, "MSG_ONET_CHECK_MANIMANI", null),
	NPCID.unknown0209: NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winGianBoss, NPCConfigFlagStyle.showIfOff, "MSG_ONET_GIAN_BOSS", null),
	NPCID.unknown0210: NPC(NPCType.person, OverworldSprite.kingInTheFlashback, Direction.right, ActionScript.unknown699, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0211: NPC(NPCType.person, OverworldSprite.pastBabyCradle, Direction.down, ActionScript.unknown694, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0212: NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_CYCLE_WELCOME", null),
	NPCID.unknown0213: NPC(NPCType.person, OverworldSprite.paulasMother, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_ISABELLA", null),
	NPCID.unknown0214: NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_POLESTAR_C", null),
	NPCID.unknown0215: NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_POLESTAR_B", null),
	NPCID.unknown0216: NPC(NPCType.person, OverworldSprite.happyGirlInRed, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_POLESTAR_D", null),
	NPCID.unknown0217: NPC(NPCType.person, OverworldSprite.paulasFather, Direction.right, ActionScript.unknown221, EventFlag.twsnPaulUpset, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_PAUL", null),
	NPCID.unknown0218: NPC(NPCType.person, OverworldSprite.cat, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_HOUSE_E_CAT", null),
	NPCID.unknown0219: NPC(NPCType.person, OverworldSprite.paula, Direction.right, ActionScript.animPeopleWalk1, EventFlag.twsnPolaAppear, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_POLESTAR_POLA", null),
	NPCID.unknown0220: NPC(NPCType.person, OverworldSprite.orangeKid, Direction.down, ActionScript.animMapObjStill, EventFlag.twsnChaosAppleAppear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_ORANGE", null),
	NPCID.unknown0221: NPC(NPCType.person, OverworldSprite.appleKid, Direction.right, ActionScript.unknown014, EventFlag.twsnAppleDisappear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_APPLEKID", null),
	NPCID.unknown0222: NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.unknown014, EventFlag.twsnAppleDisappear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_MOUSE_0", null),
	NPCID.unknown0223: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0224: NPC(NPCType.object, OverworldSprite.tools, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0225: NPC(NPCType.object, OverworldSprite.can, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0226: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0041, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CARROT", "MSG_TWSN_CARROT_RECEIVE"),
	NPCID.unknown0227: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_CHAOS_F", null),
	NPCID.unknown0228: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0041, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_CARROT_B", null),
	NPCID.unknown0229: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.right, ActionScript.animMapObjStill, EventFlag.twsnTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_MICHIKO", null),
	NPCID.unknown0230: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_CHAOS_GUARDMAN", null),
	NPCID.unknown0231: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.left, ActionScript.unknown108, EventFlag.twsnMichikoAppear, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_MICHIKO", null),
	NPCID.unknown0232: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_A", null),
	NPCID.unknown0233: NPC(NPCType.person, OverworldSprite.kidInDetectiveHat, Direction.right, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_B", null),
	NPCID.unknown0234: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.up, ActionScript.animMapObjTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_C", null),
	NPCID.unknown0235: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_D", null),
	NPCID.unknown0236: NPC(NPCType.person, OverworldSprite.mrT, Direction.right, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_MOHIKAN", null),
	NPCID.unknown0237: NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_E", null),
	NPCID.unknown0238: NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_F", null),
	NPCID.unknown0239: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.left, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_G", null),
	NPCID.unknown0240: NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_H", null),
	NPCID.unknown0241: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.right, ActionScript.animMapObjTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_I", null),
	NPCID.unknown0242: NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.left, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_J", null),
	NPCID.unknown0243: NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.left, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_K", null),
	NPCID.unknown0244: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_L", null),
	NPCID.unknown0245: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.left, ActionScript.animMapObjTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_M", null),
	NPCID.unknown0246: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.right, ActionScript.animMapObjTBack, EventFlag.twsnChaosOnStage, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_HALL_N", null),
	NPCID.unknown0247: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.up, ActionScript.animPeopleWalk0, EventFlag.twsnMichikoAppear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_MICHIKO_EXCITED", null),
	NPCID.unknown0248: NPC(NPCType.person, OverworldSprite.gorgeous, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TONZURA_GORGEOUS", "MSG_TWSN_GORGEOUS_RECEIVE"),
	NPCID.unknown0249: NPC(NPCType.person, OverworldSprite.lucky, Direction.left, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TONZURA_LUCKY", "MSG_TWSN_LUCKY_RECEIVE"),
	NPCID.unknown0250: NPC(NPCType.person, OverworldSprite.runawayFiveDrummer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TONZURA_NICE", "MSG_TWSN_NICE_RECEIVE"),
	NPCID.unknown0251: NPC(NPCType.person, OverworldSprite.runawayFiveBassPlayer, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TONZURA_GROOVY", "MSG_TWSN_GROOVY_RECEIVE"),
	NPCID.unknown0252: NPC(NPCType.person, OverworldSprite.runawayFiveSaxPlayer, Direction.right, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TONZURA_OKEY", "MSG_TWSN_OKEY_RECEIVE"),
	NPCID.unknown0253: NPC(NPCType.person, OverworldSprite.poochyfud, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_CHAOS", "MSG_TWSN_CHAOS_RECEIVE"),
	NPCID.unknown0254: NPC(NPCType.person, OverworldSprite.everdred, Direction.left, ActionScript.animPeopleWalk1, EventFlag.twsnTonchikiAppear, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_TONCHIKI", null),
	NPCID.unknown0255: NPC(NPCType.person, OverworldSprite.girlInStripedApron, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_MACH", null),
	NPCID.unknown0256: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HOTEL_TWSN", null),
	NPCID.unknown0257: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HOTELPORTER", null),
	NPCID.unknown0258: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown0259: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0260: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.right, ActionScript.animMapObjTBack, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "MSG_HOTEL_TWSN_PAPERBOY", null),
	NPCID.unknown0261: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HOTEL_A", null),
	NPCID.unknown0262: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HOTEL_KINOKO", null),
	NPCID.unknown0263: NPC(NPCType.object, OverworldSprite.littleMushroom, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0264: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HOSPITAL_USHER", null),
	NPCID.unknown0265: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_TWSN", null),
	NPCID.unknown0266: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HOSPITAL_DOCTOR", null),
	NPCID.unknown0267: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HOSP_GIRL", null),
	NPCID.unknown0268: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HPTL_2F_A", "MSG_TWSN_HPTL_2F_A_RECEIVE"),
	NPCID.unknown0269: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HPTL_2F_B", null),
	NPCID.unknown0270: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HPTL_2F_C", null),
	NPCID.unknown0271: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_BUS_BU", null),
	NPCID.unknown0272: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_BUS_C", null),
	NPCID.unknown0273: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_BUS_INFO", null),
	NPCID.unknown0274: NPC(NPCType.person, OverworldSprite.busDriver, Direction.left, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_BUS_D", null),
	NPCID.unknown0275: NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0276: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown0277: NPC(NPCType.person, OverworldSprite.venusMother, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_VENUSMOM", null),
	NPCID.unknown0278: NPC(NPCType.person, OverworldSprite.hintGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_HINTMAN", null),
	NPCID.unknown0279: NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_HOUSE_A", null),
	NPCID.unknown0280: NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_HOUSE_A", null),
	NPCID.unknown0281: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_HOUSE_A_PAPA", null),
	NPCID.unknown0282: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_HOUSE_A_MAMA", null),
	NPCID.unknown0283: NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HOUSE_B", null),
	NPCID.unknown0284: NPC(NPCType.person, OverworldSprite.cat, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HOUSE_E_CAT", null),
	NPCID.unknown0285: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_SYSINFO_REPAIR", null),
	NPCID.unknown0286: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0287: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown0288: NPC(NPCType.person, OverworldSprite.thickGlassesLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPART_RETURNGOODS", null),
	NPCID.unknown0289: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPART_TICKETPIA", null),
	NPCID.unknown0290: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPT_A", null),
	NPCID.unknown0291: NPC(NPCType.person, OverworldSprite.waitress, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPART_GROCERY_A", null),
	NPCID.unknown0292: NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPART_GROCERY_B", null),
	NPCID.unknown0293: NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPT_B", null),
	NPCID.unknown0294: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPT_C", null),
	NPCID.unknown0295: NPC(NPCType.person, OverworldSprite.thickGlassesLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPT_DRUG2", null),
	NPCID.unknown0296: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPT_DRUG1", null),
	NPCID.unknown0297: NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_DEPT_D", null),
	NPCID.unknown0298: NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_DEPT_E", null),
	NPCID.unknown0299: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_SYSINFO_SKIP", null),
	NPCID.unknown0300: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_SYSMSG_NUIGURUMI", null),
	NPCID.unknown0301: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_SYSINFO_HOMESICK", null),
	NPCID.unknown0302: NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0303: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_SHERRY", null),
	NPCID.unknown0304: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_N", null),
	NPCID.unknown0305: NPC(NPCType.person, OverworldSprite.kidInDetectiveHat, Direction.left, ActionScript.unknown017, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_PO", null),
	NPCID.unknown0306: NPC(NPCType.person, OverworldSprite.mrT, Direction.left, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_P", null),
	NPCID.unknown0307: NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.left, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_A", null),
	NPCID.unknown0308: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HAPPY_1", null),
	NPCID.unknown0309: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_HAPPY_2", null),
	NPCID.unknown0310: NPC(NPCType.person, OverworldSprite.dog, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_STRAY_DOG", null),
	NPCID.unknown0311: NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_GARAKUTA", null),
	NPCID.unknown0312: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_OGATA", null),
	NPCID.unknown0313: NPC(NPCType.person, OverworldSprite.shyGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_MONOSASI", null),
	NPCID.unknown0314: NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_EGGMAN", null),
	NPCID.unknown0315: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_CHINPIRA", null),
	NPCID.unknown0316: NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_AKANBAKERY", null),
	NPCID.unknown0317: NPC(NPCType.person, OverworldSprite.arabMrT, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_URN_SHOP", null),
	NPCID.unknown0318: NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_FRUIT_SHOP", null),
	NPCID.unknown0319: NPC(NPCType.person, OverworldSprite.orangeKid, Direction.down, ActionScript.animMapObjStill, EventFlag.twsnChaosAppleAppear, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_ORANGE_DOOR", null),
	NPCID.unknown0320: NPC(NPCType.person, OverworldSprite.gorgeous, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_TONZ_RIDE", null),
	NPCID.unknown0321: NPC(NPCType.person, OverworldSprite.paulasFather, Direction.down, ActionScript.animPeopleWalk0, EventFlag.twsnPaulUpset, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_PAUL", null),
	NPCID.unknown0322: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_QUEUE_C", null),
	NPCID.unknown0323: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animMapObjStill, EventFlag.twsnMessengerAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0324: NPC(NPCType.person, OverworldSprite.mrT, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_KOBUN_A", null),
	NPCID.unknown0325: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_KOBUN_B", null),
	NPCID.unknown0326: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_QUEUE_A", null),
	NPCID.unknown0327: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.right, ActionScript.animMapObjTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_CHAOS_QUEUE_B", null),
	NPCID.unknown0328: NPC(NPCType.person, OverworldSprite.gorgeous, Direction.right, ActionScript.animMapObjTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TONZURA_A", null),
	NPCID.unknown0329: NPC(NPCType.person, OverworldSprite.lucky, Direction.down, ActionScript.animMapObjTBack, EventFlag.twsnFieldTonzDisappear, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TONZURA_B", null),
	NPCID.unknown0330: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animMapObjTBack, EventFlag.tlptThrk , NPCConfigFlagStyle.showIfOff, "MSG_TWSN_INFORMER_E", null),
	NPCID.unknown0331: NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.right, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_INFORMER_A", null),
	NPCID.unknown0332: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.left, ActionScript.animPeopleTBack, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_INFORMER_B", null),
	NPCID.unknown0333: NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.right, ActionScript.animPeopleTBack, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_INFORMER_C", null),
	NPCID.unknown0334: NPC(NPCType.person, OverworldSprite.everdred, Direction.right, ActionScript.unknown647, EventFlag.twsnTonchikiRDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0335: NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.animPeopleWalk1, EventFlag.twsnChaosAppleAppear, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_CHAOS_MOUSE", null),
	NPCID.unknown0336: NPC(NPCType.person, OverworldSprite.appleKid, Direction.down, ActionScript.animPeopleTBack, EventFlag.twsnChaosAppleAppear, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_APPLE_CHAOS", null),
	NPCID.unknown0337: NPC(NPCType.person, OverworldSprite.catAsleep, Direction.down, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0338: NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_FURIKAKE", null),
	NPCID.unknown0339: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_BUS_B", null),
	NPCID.unknown0340: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.left, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_TWSN_CHAOS_E_LATER", null),
	NPCID.unknown0341: NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.down, ActionScript.unknown016, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_POLESTAR_A", null),
	NPCID.unknown0342: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_SYSMSG_FURIKAKE", null),
	NPCID.unknown0343: NPC(NPCType.person, OverworldSprite.helpfulMole, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_MOLEHOLLY", null),
	NPCID.unknown0344: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown087, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0345: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown088, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0346: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown089, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0347: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown090, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0348: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown085, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0349: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.left, ActionScript.unknown086, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0350: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0351: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0352: NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_READ_TWSN_BUSSTOP", null),
	NPCID.unknown0353: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0354: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0355: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0356: NPC(NPCType.object, OverworldSprite.crossroadSigns, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_KANBAN_TO_HAPPY", null),
	NPCID.unknown0357: NPC(NPCType.person, OverworldSprite.guyInCoolRedCar, Direction.right, ActionScript.unknown588, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_SPORTSCAR", null),
	NPCID.unknown0358: NPC(NPCType.object, OverworldSprite.whiteDeliveryTruck, Direction.right, ActionScript.unknown589, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0359: NPC(NPCType.object, OverworldSprite.bicycle, Direction.down, ActionScript.unknown864, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0360: NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.unknown590, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0361: NPC(NPCType.object, OverworldSprite.appleKidSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_KANBAN_APPLE", null),
	NPCID.unknown0362: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0363: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0364: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0365: NPC(NPCType.object, OverworldSprite.orangeKidSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_KANBAN_ORANGE", null),
	NPCID.unknown0366: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.unknown867, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0367: NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_CHECK_HOTEL_KANBAN", null),
	NPCID.unknown0368: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0369: NPC(NPCType.object, OverworldSprite.burglinParkSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_CHECK_NUSUTTO", null),
	NPCID.unknown0370: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0371: NPC(NPCType.object, OverworldSprite.bananas, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0372: NPC(NPCType.object, OverworldSprite.bananas, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0373: NPC(NPCType.object, OverworldSprite.runaway5Bus, Direction.left, ActionScript.animMapObjStill, EventFlag.twsnTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, "MSG_CHECK_TWSN_TONZURABUS", null),
	NPCID.unknown0374: NPC(NPCType.object, OverworldSprite.runaway5Bus, Direction.down, ActionScript.animMapObjStill, EventFlag.twsnTonzuraFree, NPCConfigFlagStyle.showIfOff, "MSG_CHECK_TWSN_TONZURABUS", null),
	NPCID.unknown0375: NPC(NPCType.object, OverworldSprite.evilManiMani, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_CHECK_MANIMANI", null),
	NPCID.unknown0376: NPC(NPCType.person, OverworldSprite.mrCarpainter, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_CARPAINTER", null),
	NPCID.unknown0377: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_RECEPTION", null),
	NPCID.unknown0378: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_BLOCKER_1", null),
	NPCID.unknown0379: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_BLOCKER_2", null),
	NPCID.unknown0380: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_BLOCKER_3", null),
	NPCID.unknown0381: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_BLOCKER_4", null),
	NPCID.unknown0382: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_BLOCKER_5", null),
	NPCID.unknown0383: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_BLOCKER_6", null),
	NPCID.unknown0384: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_BLOCKER_7", null),
	NPCID.unknown0385: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.happyUpright1Disappear, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_UPRIGHT_1", null),
	NPCID.unknown0386: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.happyUpright2Disappear, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_UPRIGHT_2", null),
	NPCID.unknown0387: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.happyUpright3Disappear, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_UPRIGHT_3", null),
	NPCID.unknown0388: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk0, EventFlag.happyUpright4Disappear, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_UPRIGHT_4", null),
	NPCID.unknown0389: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistEast, EventFlag.happyUpright5Disappear, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_WANDER_1", null),
	NPCID.unknown0390: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistWest, EventFlag.happyUpright6Disappear, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_WANDER_2", null),
	NPCID.unknown0391: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistSouth, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_WANDER_3", null),
	NPCID.unknown0392: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistNortheast, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_WANDER_4", null),
	NPCID.unknown0393: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.circleCultistNorthwest, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_HONBU_WANDER_5", null),
	NPCID.unknown0394: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "MSG_HAPPY_MDUNGEON_AFTER_A", null),
	NPCID.unknown0395: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "MSG_HAPPY_MDUNGEON_AFTER_B", null),
	NPCID.unknown0396: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "MSG_HAPPY_MDUNGEON_AFTER_C", null),
	NPCID.unknown0397: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_B", null),
	NPCID.unknown0398: NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_E", null),
	NPCID.unknown0399: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.up, ActionScript.animPeopleTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_KIFU_A", null),
	NPCID.unknown0400: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.up, ActionScript.animPeopleTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_KIFU_B", null),
	NPCID.unknown0401: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.down, ActionScript.animMapObjTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_KIFU_C", null),
	NPCID.unknown0402: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_DOSEI", null),
	NPCID.unknown0403: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_DRUGSTORE_CLERK", null),
	NPCID.unknown0404: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_DRUGSTORE", null),
	NPCID.unknown0405: NPC(NPCType.person, OverworldSprite.venusMother, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SYSINFO_HERB", null),
	NPCID.unknown0406: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0407: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown0408: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_INN", null),
	NPCID.unknown0409: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_HOSPITAL_DOCTOR", null),
	NPCID.unknown0410: NPC(NPCType.person, OverworldSprite.nurse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_HOSPITAL_USHER", null),
	NPCID.unknown0411: NPC(NPCType.person, OverworldSprite.pokey, Direction.down, ActionScript.animMapObjStill, EventFlag.happyPokeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_GRFD_POKEY_LATER", null),
	NPCID.unknown0412: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.up, ActionScript.animMapObjTBack, EventFlag.happyWinGuard, NPCConfigFlagStyle.showIfOff, "MSG_HAPPY_AUTOSHOP_GUARD", null),
	NPCID.unknown0413: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_A", null),
	NPCID.unknown0414: NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_C", null),
	NPCID.unknown0415: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_G", null),
	NPCID.unknown0416: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_H", null),
	NPCID.unknown0417: NPC(NPCType.person, OverworldSprite.trumpetPerson, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_I", null),
	NPCID.unknown0418: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_J", null),
	NPCID.unknown0419: NPC(NPCType.person, OverworldSprite.blueCow, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_USHI", "MSG_HAPPY_USHI_RECEIVE"),
	NPCID.unknown0420: NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.up, ActionScript.unknown134, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_KIFU", null),
	NPCID.unknown0421: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_PEOPLE_LLPT_A", null),
	NPCID.unknown0422: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_PEOPLE_LLPT_B", null),
	NPCID.unknown0423: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_D", null),
	NPCID.unknown0424: NPC(NPCType.person, OverworldSprite.shyGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SHINTO_F", null),
	NPCID.unknown0425: NPC(NPCType.person, OverworldSprite.healer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_TWSN", null),
	NPCID.unknown0426: NPC(NPCType.person, OverworldSprite.mrCarpainter, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_HAPPY_CARPAINTER_END", null),
	NPCID.unknown0427: NPC(NPCType.person, OverworldSprite.helpfulMole, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_SYSMSG_EASY_BATTLE", null),
	NPCID.unknown0428: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0429: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0430: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0431: NPC(NPCType.object, OverworldSprite.bicycle, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0432: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_KANBAN_TO_GRFD", null),
	NPCID.unknown0433: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_CHECK_AUTOSHOP", null),
	NPCID.unknown0434: NPC(NPCType.object, OverworldSprite.bananas, Direction.down, ActionScript.animMapObjStill, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0435: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HAPPY_CHECK_DRUGSHOP", null),
	NPCID.unknown0436: NPC(NPCType.person, OverworldSprite.cellDoor, Direction.down, ActionScript.animMapObjStill, EventFlag.polaGrfd, NPCConfigFlagStyle.showIfOff, "MSG_GRFD_POLA", "MSG_GRFD_YAMAGOYA_RECEIVE"),
	NPCID.unknown0437: NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.unknown240, EventFlag.polaGrfd, NPCConfigFlagStyle.showIfOff, "MSG_GRFD_POLA", null),
	NPCID.unknown0438: NPC(NPCType.object, OverworldSprite.teddyBearParty, Direction.right, ActionScript.animMapObjStill, EventFlag.polaGrfd, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0439: NPC(NPCType.person, OverworldSprite.pokey, Direction.up, ActionScript.unknown273, EventFlag.grfdPokeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_GRFD_POKEY", null),
	NPCID.unknown0440: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.up, ActionScript.animPeopleWalk0, EventFlag.grfdPokeyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0441: NPC(NPCType.person, OverworldSprite.insaneCultist, Direction.up, ActionScript.animPeopleWalk0, EventFlag.grfdPokeyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0442: NPC(NPCType.person, OverworldSprite.spitefulCrow, Direction.up, ActionScript.animPeopleWalk0, EventFlag.grfdPokeyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0443: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.left, ActionScript.animPeopleTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOff, "MSG_GRFD_SHINTO_A", null),
	NPCID.unknown0444: NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GRFD_KINOKO_GIRL", null),
	NPCID.unknown0445: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.winCarpainter, NPCConfigFlagStyle.showIfOn, "MSG_HAPPY_PEOPLE_BRIDGE", null),
	NPCID.unknown0446: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown865, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0447: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown866, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0448: NPC(NPCType.person, OverworldSprite.helpfulMole, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GRFD_SYSMSG_GUTS", null),
	NPCID.unknown0449: NPC(NPCType.object, OverworldSprite.crossroadSigns, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GRFD_SIGNPOST_A", null),
	NPCID.unknown0450: NPC(NPCType.object, OverworldSprite.pencilStatue, Direction.down, ActionScript.unknown107, EventFlag.grfdLlptTacoDisappear, NPCConfigFlagStyle.showIfOff, "MSG_GRFD_LLPT_TACO", "MSG_GRFD_LLPT_TACO_RECEIVE"),
	NPCID.unknown0451: NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winLlptBoss, NPCConfigFlagStyle.showIfOff, "MSG_GRFD_LLPT_BOSS", null),
	NPCID.unknown0452: NPC(NPCType.person, OverworldSprite.nessLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0453: NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0454: NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0455: NPC(NPCType.person, OverworldSprite.poo, Direction.left, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0456: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.down, ActionScript.animPeopleTBack, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOff, "MSG_THRK_TENT_1", null),
	NPCID.unknown0457: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.thrkOzisanDDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_TENT_2", null),
	NPCID.unknown0458: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.up, ActionScript.animMapObjTBack, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOff, "MSG_THRK_TENT_3", null),
	NPCID.unknown0459: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.left, ActionScript.animPeopleTBack, EventFlag.thrkOzisanDDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_TENT_4", null),
	NPCID.unknown0460: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_B", null),
	NPCID.unknown0461: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_C", null),
	NPCID.unknown0462: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_D", null),
	NPCID.unknown0463: NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_NO_RESPONSE", null),
	NPCID.unknown0464: NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_A", null),
	NPCID.unknown0465: NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_B", null),
	NPCID.unknown0466: NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_C", null),
	NPCID.unknown0467: NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_NO_RESPONSE", null),
	NPCID.unknown0468: NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_NO_RESPONSE", null),
	NPCID.unknown0469: NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_D", null),
	NPCID.unknown0470: NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_E", null),
	NPCID.unknown0471: NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_F", null),
	NPCID.unknown0472: NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_G", null),
	NPCID.unknown0473: NPC(NPCType.person, OverworldSprite.zombieGluedToFloor, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_NO_RESPONSE", null),
	NPCID.unknown0474: NPC(NPCType.person, OverworldSprite.zombieLyingDown, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_H", null),
	NPCID.unknown0475: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.animPeopleTBack, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_5", null),
	NPCID.unknown0476: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_6", null),
	NPCID.unknown0477: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.up, ActionScript.animPeopleTBack, EventFlag.thrkFixedSkyWAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_SENDOFF_A", null),
	NPCID.unknown0478: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.thrkFixedSkyWAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_SENDOFF_B", null),
	NPCID.unknown0479: NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkPrisonOpen, NPCConfigFlagStyle.showIfOff, "MSG_THRK_PRISON", "MSG_THRK_PRISON_RECEIVE"),
	NPCID.unknown0480: NPC(NPCType.object, OverworldSprite.shadow, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkFixedSkyWAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_JEFF_FIX", null),
	NPCID.unknown0481: NPC(NPCType.object, OverworldSprite.brokenPhaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkBrokenSkyWAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_BROKEN_SKYW", null),
	NPCID.unknown0482: NPC(NPCType.object, OverworldSprite.skyRunner, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkFixedSkyWAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_JEFF_FIX", null),
	NPCID.unknown0483: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animMapObjTBack, EventFlag.thrkHotelManDisappear, NPCConfigFlagStyle.showIfOff, "MSG_HOTEL_THRK", null),
	NPCID.unknown0484: NPC(NPCType.person, OverworldSprite.zombieLady, Direction.right, ActionScript.unknown078, EventFlag.thrkBikiniZombiFAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0485: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_INFORMER_E", null),
	NPCID.unknown0486: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_INFORMER_F", null),
	NPCID.unknown0487: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown0488: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0489: NPC(NPCType.person, OverworldSprite.zombieLady, Direction.right, ActionScript.unknown079, EventFlag.thrkBikiniZombiPAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0490: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.left, ActionScript.animPeopleWalk0, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "MSG_HOTEL_THRK_PAPERBOY", null),
	NPCID.unknown0491: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkHotelBoyAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_HOTEL_BOY", null),
	NPCID.unknown0492: NPC(NPCType.person, OverworldSprite.zombieLady, Direction.right, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0493: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.down, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0494: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.right, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0495: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.right, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0496: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.right, ActionScript.unknown080, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0497: NPC(NPCType.person, OverworldSprite.zombieDog, Direction.right, ActionScript.animMapObjStill, EventFlag.thrkHotelZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0498: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_HOTEL_A", null),
	NPCID.unknown0499: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_HOSPITAL_USHER", null),
	NPCID.unknown0500: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_HOSP_A", null),
	NPCID.unknown0501: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_THRK", null),
	NPCID.unknown0502: NPC(NPCType.person, OverworldSprite.shyGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_HOSP_B", null),
	NPCID.unknown0503: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_HOSPITAL_DOCTOR", null),
	NPCID.unknown0504: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_DRUG1", null),
	NPCID.unknown0505: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_DRUG2", null),
	NPCID.unknown0506: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0507: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown0508: NPC(NPCType.person, OverworldSprite.girlInStripedApron, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TWSN_MACH", null),
	NPCID.unknown0509: NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_BAKERY_CLERK", null),
	NPCID.unknown0510: NPC(NPCType.person, OverworldSprite.hintGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "MSG_THRK_HINTMAN", null),
	NPCID.unknown0511: NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.tlptFour, NPCConfigFlagStyle.showIfOn, "MSG_THRK_FIELD_KID_LATER", null),
	NPCID.unknown0512: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_THRK_INFORMER_C", null),
	NPCID.unknown0513: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.down, ActionScript.animPeopleWalk1, EventFlag.tlptFour, NPCConfigFlagStyle.showIfOff, "MSG_THRK_INFORMER_A", null),
	NPCID.unknown0514: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleWalk1, EventFlag.tlptFour, NPCConfigFlagStyle.showIfOff, "MSG_THRK_INFORMER_B", null),
	NPCID.unknown0515: NPC(NPCType.person, OverworldSprite.shyGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_Z", null),
	NPCID.unknown0516: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_THRK_A", null),
	NPCID.unknown0517: NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.right, ActionScript.animPeopleWalk1, EventFlag.thrkPeopleDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_K", null),
	NPCID.unknown0518: NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.up, ActionScript.unknown016, EventFlag.thrkPeopleDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_G", null),
	NPCID.unknown0519: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOff, "MSG_THRK_M", null),
	NPCID.unknown0520: NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.gpftMinigeppuADisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_GRAVE", null),
	NPCID.unknown0521: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.up, ActionScript.animPeopleWalk1, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "MSG_THRK_MATENT", null),
	NPCID.unknown0522: NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.tlptFour, NPCConfigFlagStyle.showIfOff, "MSG_THRK_FIELD_KID", null),
	NPCID.unknown0523: NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_THRK_FIELD_MOUSE", null),
	NPCID.unknown0524: NPC(NPCType.person, OverworldSprite.dog, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_FIELD_STRAYDOG", null),
	NPCID.unknown0525: NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.thrkPeopleDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_FIELD_OLDWOMAN", null),
	NPCID.unknown0526: NPC(NPCType.person, OverworldSprite.oldFatGuyWithHat, Direction.right, ActionScript.animMapObjTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_THRK_HIGHWAY", null),
	NPCID.unknown0527: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "MSG_THRK_BATCHY", null),
	NPCID.unknown0528: NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.right, ActionScript.animMapObjTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_DEPTD", null),
	NPCID.unknown0529: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_DEPTD_BF", null),
	NPCID.unknown0530: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.up, ActionScript.animPeopleTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_DEPTD_GF", null),
	NPCID.unknown0531: NPC(NPCType.person, OverworldSprite.boogeyTentEye, Direction.down, ActionScript.unknown592, EventFlag.thrkMaTentAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0532: NPC(NPCType.person, OverworldSprite.boogeyTentEye, Direction.right, ActionScript.unknown592, EventFlag.thrkMaTentAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0533: NPC(NPCType.person, OverworldSprite.boogeyTentMouth, Direction.down, ActionScript.unknown591, EventFlag.thrkMaTentAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0534: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.right, ActionScript.unknown758, EventFlag.thrkGraveZombiDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_GATEKEEPER_A", null),
	NPCID.unknown0535: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.up, ActionScript.animMapObjTBack, EventFlag.thrkGraveZombiDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_GATEKEEPER_B", null),
	NPCID.unknown0536: NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.right, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_WEAPON", null),
	NPCID.unknown0537: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.right, ActionScript.animPeopleTBack, EventFlag.thrkBikiniZombiAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_INFO_BIKINIZOMBI", null),
	NPCID.unknown0538: NPC(NPCType.person, OverworldSprite.zombieLady, Direction.down, ActionScript.unknown077, EventFlag.thrkBikiniZombiAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0539: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.right, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_4_CAPTURED", null),
	NPCID.unknown0540: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.right, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_2_CAPTURED", null),
	NPCID.unknown0541: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.up, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_3_CAPTURED", null),
	NPCID.unknown0542: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.left, ActionScript.animPeopleWalk0, EventFlag.thrkZombiCaptured, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_1_CAPTURED", null),
	NPCID.unknown0543: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_E", null),
	NPCID.unknown0544: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_F", null),
	NPCID.unknown0545: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.left, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_ZOMBI_H", null),
	NPCID.unknown0546: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0547: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0548: NPC(NPCType.person, OverworldSprite.runawayDog, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0549: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkGraveZombiDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0550: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.thrkGraveZombiDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0551: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.thrkInfoDDisappear, NPCConfigFlagStyle.showIfOff, "MSG_THRK_INFORMER_D", null),
	NPCID.unknown0552: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_A", null),
	NPCID.unknown0553: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_B", null),
	NPCID.unknown0554: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.up, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_C", null),
	NPCID.unknown0555: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.up, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_D", null),
	NPCID.unknown0556: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_E", null),
	NPCID.unknown0557: NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_F", null),
	NPCID.unknown0558: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.left, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_G", null),
	NPCID.unknown0559: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.up, ActionScript.animPeopleWalk0, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_H", null),
	NPCID.unknown0560: NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.left, ActionScript.animPeopleWalk1, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_I", null),
	NPCID.unknown0561: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animPeopleWalk1, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_THANKS_J", null),
	NPCID.unknown0562: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_THRK_INFORMER_G", null),
	NPCID.unknown0563: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleWalk0, EventFlag.unknown0610, NPCConfigFlagStyle.showIfOn, "MSG_THRK_INFORMER_COP", null),
	NPCID.unknown0564: NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animPeopleWalk0, EventFlag.thrkBuilBManAppear, NPCConfigFlagStyle.showIfOn, "TEXT_NPC_0564", null),
	NPCID.unknown0565: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.right, ActionScript.unknown666, EventFlag.thrkEscaperAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_5", null),
	NPCID.unknown0566: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.left, ActionScript.unknown666, EventFlag.thrkEscaperAppear, NPCConfigFlagStyle.showIfOn, "MSG_THRK_TENT_6", null),
	NPCID.unknown0567: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown870, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0568: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown873, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0569: NPC(NPCType.object, OverworldSprite.dontEnterSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_CHECK_DONTENTER", null),
	NPCID.unknown0570: NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_BUSSTOP_TWSN", null),
	NPCID.unknown0571: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0572: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0573: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0574: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0575: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0576: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0577: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0578: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0579: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0580: NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_BUSSTOP_FOUR", null),
	NPCID.unknown0581: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0582: NPC(NPCType.object, OverworldSprite.trashCan, Direction.down, ActionScript.unknown707, EventFlag.boxThrkMaTent, NPCConfigFlagStyle.showIfOn, "MSG_TBOX_GOMIBAKO_HAEMITSU", null),
	NPCID.unknown0583: NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_THRK_CHECK_HOTEL_KANBAN", null),
	NPCID.unknown0584: NPC(NPCType.object, OverworldSprite.cityBus, Direction.right, ActionScript.unknown595, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0585: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown094, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0586: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown095, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0587: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown096, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0588: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown097, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0589: NPC(NPCType.person, OverworldSprite.zombiePossessor, Direction.down, ActionScript.unknown098, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_TWSN_TUNNELGHOST", null),
	NPCID.unknown0590: NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.left, ActionScript.unknown599, EventFlag.fmonBossGraveDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_BOSS_GRAVE", null),
	NPCID.unknown0591: NPC(NPCType.person, OverworldSprite.tonyInBed, Direction.down, ActionScript.unknown113, EventFlag.winsTony, NPCConfigFlagStyle.showIfOff, "MSG_WINS_TONY_IN_BED", null),
	NPCID.unknown0592: NPC(NPCType.person, OverworldSprite.jeffInBed, Direction.down, ActionScript.animMapObjStill, EventFlag.winsStart, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0593: NPC(NPCType.object, OverworldSprite.tools, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0594: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_GAUS", null),
	NPCID.unknown0595: NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_LOCKER", "MSG_WINS_LOCKER_RECEIVE"),
	NPCID.unknown0596: NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_LOCKER", "MSG_WINS_LOCKER_C_RECEIVE"),
	NPCID.unknown0597: NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_LOCKER", "MSG_WINS_LOCKER_D_RECEIVE"),
	NPCID.unknown0598: NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_LOCKER", "MSG_WINS_LOCKER_E_RECEIVE"),
	NPCID.unknown0599: NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_LOCKER", "MSG_WINS_LOCKER_B_RECEIVE"),
	NPCID.unknown0600: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_PUPIL_A", null),
	NPCID.unknown0601: NPC(NPCType.person, OverworldSprite.blondeGuyInBlueSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_PUPIL_B", null),
	NPCID.unknown0602: NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_PUPIL_C", null),
	NPCID.unknown0603: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_PUPIL_D", null),
	NPCID.unknown0604: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_PUPIL_E", null),
	NPCID.unknown0605: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_PUPIL_H", null),
	NPCID.unknown0606: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_DRUGSTORE", null),
	NPCID.unknown0607: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_NANCY", null),
	NPCID.unknown0608: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_A", null),
	NPCID.unknown0609: NPC(NPCType.person, OverworldSprite.bubbleMonkey, Direction.left, ActionScript.animPeopleWalk0, EventFlag.winsBMonkeyDisappear, NPCConfigFlagStyle.showIfOff, "MSG_WINS_BALLOONMONKEY_YEAH", null),
	NPCID.unknown0610: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_WINS", null),
	NPCID.unknown0611: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0612: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_WATCHERS_C", null),
	NPCID.unknown0613: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_WATCHERS_D", null),
	NPCID.unknown0614: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_WINS", null),
	NPCID.unknown0615: NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.down, ActionScript.unknown178, EventFlag.phoneGumiApple, NPCConfigFlagStyle.showIfOff, "MSG_WINS_ANDONUT", null),
	NPCID.unknown0616: NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winsLaboMouseAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_LABO_MOUSE", null),
	NPCID.unknown0617: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.up, ActionScript.animMapObjStill, EventFlag.winsLaboMonkeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_EVT_WINS_LABO_KANAI", null),
	NPCID.unknown0618: NPC(NPCType.person, OverworldSprite.bubbleMonkey, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.winsLaboMonkeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_EVT_WINS_LABO_BMONKEY", null),
	NPCID.unknown0619: NPC(NPCType.person, OverworldSprite.caveBoy, Direction.down, ActionScript.animPeopleTBack, EventFlag.jeff, NPCConfigFlagStyle.showIfOn, "MSG_WINS_STONEHENGE_B", null),
	NPCID.unknown0620: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_WINS", null),
	NPCID.unknown0621: NPC(NPCType.object, OverworldSprite.shadow, Direction.down, ActionScript.animMapObjStill, EventFlag.winsSkyWDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0622: NPC(NPCType.object, OverworldSprite.instantRevitalizingDevice, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_RECOVER", null),
	NPCID.unknown0623: NPC(NPCType.object, OverworldSprite.skyRunner, Direction.down, ActionScript.animMapObjStill, EventFlag.winsSkyWDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0624: NPC(NPCType.person, OverworldSprite.someBrunetteKid, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOff, "MSG_WINS_PUPIL_F", null),
	NPCID.unknown0625: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOff, "MSG_WINS_PUPIL_G", null),
	NPCID.unknown0626: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.sebastianDisappear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_GAUS_B", null),
	NPCID.unknown0627: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_WATCHERS_A", null),
	NPCID.unknown0628: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_WATCHERS_B", null),
	NPCID.unknown0629: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.left, ActionScript.animPeopleWalk1, EventFlag.sebastianDisappear, NPCConfigFlagStyle.showIfOff, "MSG_WINS_WATCHERS_GUM", null),
	NPCID.unknown0630: NPC(NPCType.person, OverworldSprite.bubbleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsTassBMonkeyAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_BALLOONMONKEY_WATCHERS", null),
	NPCID.unknown0631: NPC(NPCType.person, OverworldSprite.brickRoad, Direction.left, ActionScript.animMapObjStill, EventFlag.winsBrickThanksAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_BRICKROAD_OK", null),
	NPCID.unknown0632: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.right, ActionScript.unknown284, EventFlag.balloonMonkey, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0633: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.up, ActionScript.animPeopleWalk1, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "MSG_WINS_STONEHENGE_A", null),
	NPCID.unknown0634: NPC(NPCType.person, OverworldSprite.tonyKneeling, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTonyCrouchAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_TONY_WALL_GO", null),
	NPCID.unknown0635: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_WATCHERS_E", null),
	NPCID.unknown0636: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_WATCHERS_F", null),
	NPCID.unknown0637: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleTBack, EventFlag.winsKanaiAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_KANAI", null),
	NPCID.unknown0638: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_WINS_GAUS_END", null),
	NPCID.unknown0639: NPC(NPCType.person, OverworldSprite.tony, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_WINS_TONY_END", null),
	NPCID.unknown0640: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown883, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0641: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown868, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0642: NPC(NPCType.object, OverworldSprite.unknown, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0643: NPC(NPCType.object, OverworldSprite.unknown, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0644: NPC(NPCType.object, OverworldSprite.unknown, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0645: NPC(NPCType.object, OverworldSprite.pencilStatue, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsTacoDisappear, NPCConfigFlagStyle.showIfOff, "MSG_GRFD_LLPT_TACO", "MSG_WINS_TACO_RECEIVE"),
	NPCID.unknown0646: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_CHECK_WINS_BRICKROAD", null),
	NPCID.unknown0647: NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0648: NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0649: NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0650: NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0651: NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0652: NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0653: NPC(NPCType.object, OverworldSprite.underwaterNPC, Direction.down, ActionScript.unknown769, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0654: NPC(NPCType.object, OverworldSprite.unknown, Direction.down, ActionScript.animMapObjStill, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0655: NPC(NPCType.object, OverworldSprite.tessieWaterRipplesTop, Direction.down, ActionScript.animUzu1, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0656: NPC(NPCType.object, OverworldSprite.tessieWaterRipplesBottom, Direction.down, ActionScript.animUzu2, EventFlag.winsTassiEnter, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0657: NPC(NPCType.person, OverworldSprite.appleKid, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "MSG_WINS_CAPSULE_IN_APPLE", null),
	NPCID.unknown0658: NPC(NPCType.person, OverworldSprite.appleKid, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_APPLE", null),
	NPCID.unknown0659: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "MSG_WINS_CAPSULE_IN_DOSEI", null),
	NPCID.unknown0660: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_DOSEI", null),
	NPCID.unknown0661: NPC(NPCType.person, OverworldSprite.tony, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "MSG_WINS_CAPSULE_IN_TONY", null),
	NPCID.unknown0662: NPC(NPCType.person, OverworldSprite.tony, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_TONY", null),
	NPCID.unknown0663: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0664: NPC(NPCType.person, OverworldSprite.tessieWatcher, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_WATCHERS", null),
	NPCID.unknown0665: NPC(NPCType.person, OverworldSprite.mrT, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_A", null),
	NPCID.unknown0666: NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_B", null),
	NPCID.unknown0667: NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0668: NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winsCapsulePeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_WINS_CAPSULE_ANDONUT", null),
	NPCID.unknown0669: NPC(NPCType.person, OverworldSprite.mrT, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "MSG_WINS_CAPSULE_IN_A", null),
	NPCID.unknown0670: NPC(NPCType.person, OverworldSprite.newAgeRetroHippie, Direction.down, ActionScript.animMapObjStill, EventFlag.winGansekiman, NPCConfigFlagStyle.showIfOff, "MSG_WINS_CAPSULE_IN_B", null),
	NPCID.unknown0671: NPC(NPCType.object, OverworldSprite.eraserStatue, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winsStoneTacoDisappear, NPCConfigFlagStyle.showIfOff, "MSG_WINS_STONE_KOKESHI", "MSG_WINS_STONE_KOKESHI_RECEIVE"),
	NPCID.unknown0672: NPC(NPCType.person, OverworldSprite.starman, Direction.down, ActionScript.animMapObjStill, EventFlag.fmonStoneBossDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_STONE_BOSS", null),
	NPCID.unknown0673: NPC(NPCType.person, OverworldSprite.exitMouseNoSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_NHOUSE_MOUSE_MOTHER", null),
	NPCID.unknown0674: NPC(NPCType.person, OverworldSprite.exitMouse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.itemEscapeMouse, NPCConfigFlagStyle.showIfOff, "MSG_ONET_NHOUSE_MOUSE_CHILD1", null),
	NPCID.unknown0675: NPC(NPCType.person, OverworldSprite.exitMouse, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_NHOUSE_MOUSE_CHILD2", null),
	NPCID.unknown0676: NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winRainBoss, NPCConfigFlagStyle.showIfOff, "MSG_WINS_RAIN_BOSS", null),
	NPCID.unknown0677: NPC(NPCType.object, OverworldSprite.rope, Direction.down, ActionScript.unknown260, EventFlag.winsRopeSwitch, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0678: NPC(NPCType.person, OverworldSprite.madDuck, Direction.left, ActionScript.walkTowardsPlayer, EventFlag.fmonBrickAADisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_BRICK_A_A", null),
	NPCID.unknown0679: NPC(NPCType.person, OverworldSprite.madDuck, Direction.right, ActionScript.walkTowardsPlayer, EventFlag.fmonBrickABDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_BRICK_A_B", null),
	NPCID.unknown0680: NPC(NPCType.person, OverworldSprite.giftBox, Direction.up, ActionScript.unknown601, EventFlag.fmonBrickBADisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_BRICK_B_A", null),
	NPCID.unknown0681: NPC(NPCType.person, OverworldSprite.giftBox, Direction.down, ActionScript.unknown601, EventFlag.fmonBrickBBDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_BRICK_B_B", null),
	NPCID.unknown0682: NPC(NPCType.person, OverworldSprite.rowdyMouse, Direction.right, ActionScript.unknown600, EventFlag.fmonBrickCADisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_BRICK_C_A", null),
	NPCID.unknown0683: NPC(NPCType.person, OverworldSprite.rowdyMouse, Direction.up, ActionScript.unknown600, EventFlag.fmonBrickCBDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_BRICK_C_B", null),
	NPCID.unknown0684: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_WINS", null),
	NPCID.unknown0685: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_BRICK_SIGN_46", null),
	NPCID.unknown0686: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_BRICK_SIGN_47", null),
	NPCID.unknown0687: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_BRICK_SIGN_48", null),
	NPCID.unknown0688: NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.unknown600, EventFlag.gpftMinigeppuADisappear, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_MINIGEPPU_A", null),
	NPCID.unknown0689: NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_MINIGEPPU_B", null),
	NPCID.unknown0690: NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_MINIGEPPU_C", null),
	NPCID.unknown0691: NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.unknown600, EventFlag.gpftMinigeppuDDisappear, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_MINIGEPPU_D", null),
	NPCID.unknown0692: NPC(NPCType.person, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.unknown600, EventFlag.gpftMinigeppuEDisappear, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_MINIGEPPU_E", null),
	NPCID.unknown0693: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_DOSEI_A", null),
	NPCID.unknown0694: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_DOSEI_B", null),
	NPCID.unknown0695: NPC(NPCType.object, OverworldSprite.jarOfFlyHoney, Direction.down, ActionScript.unknown631, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0696: NPC(NPCType.object, OverworldSprite.jarOfFlyHoney, Direction.down, ActionScript.unknown632, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0697: NPC(NPCType.person, OverworldSprite.masterBelch, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_GEPPU", null),
	NPCID.unknown0698: NPC(NPCType.object, OverworldSprite.mrSaturnBallAndChain, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0699: NPC(NPCType.object, OverworldSprite.mrSaturnBallAndChain, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0700: NPC(NPCType.person, OverworldSprite.nessLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0701: NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0702: NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0703: NPC(NPCType.person, OverworldSprite.poo, Direction.left, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0704: NPC(NPCType.object, OverworldSprite.fountainOfHealingMini, Direction.down, ActionScript.unknown693, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0705: NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winMlkyBoss, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_MLKY_BOSS", null),
	NPCID.unknown0706: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_GPFT_DOSEI_C", null),
	NPCID.unknown0707: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleTBack, EventFlag.thrkPeopleAppear, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_11", null),
	NPCID.unknown0708: NPC(NPCType.person, OverworldSprite.oldFatGuyWithHat, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptBaka, NPCConfigFlagStyle.showIfOff, "MSG_GPFT_HAKAMORI", null),
	NPCID.unknown0709: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown871, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0710: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_HOTEL", null),
	NPCID.unknown0711: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown0712: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_HOSPITAL", null),
	NPCID.unknown0713: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_SHOP", null),
	NPCID.unknown0714: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleWalk1, EventFlag.winOscar, NPCConfigFlagStyle.showIfOn, "MSG_SHOP_DOSEI_BAKA2", null),
	NPCID.unknown0715: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SHOP_DOSEI_BAKA3", null),
	NPCID.unknown0716: NPC(NPCType.object, OverworldSprite.saturnValleyATM, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0717: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown0718: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "MSG_DOSEI_1", null),
	NPCID.unknown0719: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "MSG_DOSEI_2", null),
	NPCID.unknown0720: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk1, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_3", null),
	NPCID.unknown0721: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk0, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "MSG_DOSEI_6", null),
	NPCID.unknown0722: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk1, EventFlag.stepPast, NPCConfigFlagStyle.showIfOff, "MSG_DOSEI_7", null),
	NPCID.unknown0723: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleTBack, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_GPFT_CAFE", null),
	NPCID.unknown0724: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_A", null),
	NPCID.unknown0725: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_B", null),
	NPCID.unknown0726: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_C", null),
	NPCID.unknown0727: NPC(NPCType.person, OverworldSprite.appleKid, Direction.right, ActionScript.animMapObjStill, EventFlag.tlptDkfd, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_APPLE", null),
	NPCID.unknown0728: NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.up, ActionScript.animPeopleWalk0, EventFlag.tlptDkfd, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_ANDONUT_0", "MSG_EVENT_XYZ_ANDONUT_RECEIVE"),
	NPCID.unknown0729: NPC(NPCType.person, OverworldSprite.miner, Direction.right, ActionScript.animMapObjStill, EventFlag.dkfdDoorDisappear, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_END_SYOZI", null),
	NPCID.unknown0730: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_9", null),
	NPCID.unknown0731: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_10", null),
	NPCID.unknown0732: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winGeppu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_12", null),
	NPCID.unknown0733: NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.right, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_MOUSE", null),
	NPCID.unknown0734: NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.unknown581, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_DOSEI_JEFF_LATER", "MSG_DOSEI_JEFF_RECEIVE"),
	NPCID.unknown0735: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk0, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0736: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown872, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0737: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_4", null),
	NPCID.unknown0738: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_5", null),
	NPCID.unknown0739: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_8", null),
	NPCID.unknown0740: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_SYSMSG_COMEBACKITEM", null),
	NPCID.unknown0741: NPC(NPCType.object, OverworldSprite.phaseDistorter, Direction.down, ActionScript.unknown286, EventFlag.winOscar, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0742: NPC(NPCType.object, OverworldSprite.spaSign, Direction.down, ActionScript.unknown683, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_KANBAN_ONSEN", null),
	NPCID.unknown0743: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DOSEI_KANBAN_MILKY", null),
	NPCID.unknown0744: NPC(NPCType.object, OverworldSprite.giftBox, Direction.down, ActionScript.unknown708, EventFlag.doseiPuBoxAppear, NPCConfigFlagStyle.showIfOn, "MSG_TBOX_PRESENT_LETTER1", null),
	NPCID.unknown0745: NPC(NPCType.object, OverworldSprite.giftBox, Direction.down, ActionScript.unknown709, EventFlag.doseiPuBoxAppear, NPCConfigFlagStyle.showIfOn, "MSG_TBOX_PRESENT_LETTER2", null),
	NPCID.unknown0746: NPC(NPCType.object, OverworldSprite.giftBox, Direction.down, ActionScript.unknown710, EventFlag.doseiPuBoxAppear, NPCConfigFlagStyle.showIfOn, "MSG_TBOX_PRESENT_LETTER3", null),
	NPCID.unknown0747: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_SHOP", null),
	NPCID.unknown0748: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HOTEL_DSRT", null),
	NPCID.unknown0749: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_SHOP2", null),
	NPCID.unknown0750: NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0751: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown0752: NPC(NPCType.person, OverworldSprite.minersBrother, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_HOTEL", null),
	NPCID.unknown0753: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown0754: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_HIGHWAY_A", null),
	NPCID.unknown0755: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleTBack, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_HIGHWAY_B", null),
	NPCID.unknown0756: NPC(NPCType.person, OverworldSprite.surfer, Direction.left, ActionScript.animMapObjTBack, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_HIGHWAY_C", null),
	NPCID.unknown0757: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.down, ActionScript.animPeopleWalk1, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_HIGHWAY_D", null),
	NPCID.unknown0758: NPC(NPCType.person, OverworldSprite.palmTanGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_SUNTANMAN", null),
	NPCID.unknown0759: NPC(NPCType.person, OverworldSprite.sunBathingGirl, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_SUNTANGAL", null),
	NPCID.unknown0760: NPC(NPCType.person, OverworldSprite.miner, Direction.down, ActionScript.animPeopleWalk0, EventFlag.dsrtSyoziDisappear, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_SYOZI_START", null),
	NPCID.unknown0761: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "MSG_DSRT_A", null),
	NPCID.unknown0762: NPC(NPCType.person, OverworldSprite.pigtailBlondeGirl, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "MSG_DSRT_B", null),
	NPCID.unknown0763: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "MSG_DSRT_C", null),
	NPCID.unknown0764: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "MSG_DSRT_D", null),
	NPCID.unknown0765: NPC(NPCType.person, OverworldSprite.mexicanGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_SLOTBROS_A", null),
	NPCID.unknown0766: NPC(NPCType.person, OverworldSprite.mexicanGuy, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_SLOTBROS_B", null),
	NPCID.unknown0767: NPC(NPCType.person, OverworldSprite.mexicanGuy, Direction.up, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_SLOTBROS_C", null),
	NPCID.unknown0768: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_MONKEY_A", null),
	NPCID.unknown0769: NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_WEAPON", null),
	NPCID.unknown0770: NPC(NPCType.person, OverworldSprite.minersBrother, Direction.down, ActionScript.unknown258, EventFlag.dsrtYumboShigeAppear, NPCConfigFlagStyle.showIfOn, "MSG_DSRT_SHIGE", null),
	NPCID.unknown0771: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_MONKEY_SARUDUNGEON", null),
	NPCID.unknown0772: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtTsaruAAppear, NPCConfigFlagStyle.showIfOn, "MSG_EVT_LEAD_SARUSENSEI", null),
	NPCID.unknown0773: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtTsaruBAppear, NPCConfigFlagStyle.showIfOn, "MSG_EVT_LESSON_TELEPORT", null),
	NPCID.unknown0774: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "MSG_HEALER_DSRT", null),
	NPCID.unknown0775: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "MSG_DSRT_BENTOU", null),
	NPCID.unknown0776: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown876, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0777: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown875, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0778: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_CHECK_CONTACTLENS", null),
	NPCID.unknown0779: NPC(NPCType.object, OverworldSprite.slotMachine, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_SLOTMACHINE", null),
	NPCID.unknown0780: NPC(NPCType.object, OverworldSprite.pileOfBones, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_HORSEBONE", null),
	NPCID.unknown0781: NPC(NPCType.object, OverworldSprite.pileOfBones, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_COWBONE", null),
	NPCID.unknown0782: NPC(NPCType.person, OverworldSprite.unknown3, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_BLACKSESAME", null),
	NPCID.unknown0783: NPC(NPCType.person, OverworldSprite.sesameSeed, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_WHITESESAME", null),
	NPCID.unknown0784: NPC(NPCType.person, OverworldSprite.guyInCoolRedCar, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_HIGHWAY_E", null),
	NPCID.unknown0785: NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0786: NPC(NPCType.object, OverworldSprite.redTruck, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0787: NPC(NPCType.object, OverworldSprite.whiteTruck, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0788: NPC(NPCType.object, OverworldSprite.magicTartStand, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtSwitch, NPCConfigFlagStyle.showIfOn, "MSG_SUMS_MAGICCAKE_WAGON", null),
	NPCID.unknown0789: NPC(NPCType.object, OverworldSprite.deliveryTruck, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtClear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0790: NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_BUSSTOP_THRK", null),
	NPCID.unknown0791: NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_BUSSTOP_FOUR", null),
	NPCID.unknown0792: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_CHECK_SYOZI", null),
	NPCID.unknown0793: NPC(NPCType.object, OverworldSprite.bigDirtScooper, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtYumboBAppear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0794: NPC(NPCType.object, OverworldSprite.contactLenses, Direction.down, ActionScript.animPeopleWalk0, EventFlag.itemContactLens, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_CONTACTLENS", null),
	NPCID.unknown0795: NPC(NPCType.object, OverworldSprite.bigDirtScooper, Direction.down, ActionScript.unknown256, EventFlag.dsrtYumboShigeAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0796: NPC(NPCType.object, OverworldSprite.bigDirtScooper, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtYumboBAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0797: NPC(NPCType.person, OverworldSprite.talahRama, Direction.down, ActionScript.animPeopleWalk0, EventFlag.dsrtTjabMove, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_TJAB", null),
	NPCID.unknown0798: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk1, EventFlag.dsrtTjabMove, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_MONKEY_TJAB", null),
	NPCID.unknown0799: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonBOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_B", null),
	NPCID.unknown0800: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonAOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_A", null),
	NPCID.unknown0801: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonBOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_B", null),
	NPCID.unknown0802: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonAOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_A", null),
	NPCID.unknown0803: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonDOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_D", null),
	NPCID.unknown0804: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonCOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_C", null),
	NPCID.unknown0805: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonDOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_D", null),
	NPCID.unknown0806: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonCOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_C", null),
	NPCID.unknown0807: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonHOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_H", null),
	NPCID.unknown0808: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonGOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_G", null),
	NPCID.unknown0809: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonHOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_H", null),
	NPCID.unknown0810: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonGOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_G", null),
	NPCID.unknown0811: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonMOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_M", null),
	NPCID.unknown0812: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonMOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_M", null),
	NPCID.unknown0813: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonFOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_F", null),
	NPCID.unknown0814: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonEOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_E", null),
	NPCID.unknown0815: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonFOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_F", null),
	NPCID.unknown0816: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonEOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_E", null),
	NPCID.unknown0817: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonLOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_L", null),
	NPCID.unknown0818: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonKOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_K", null),
	NPCID.unknown0819: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonLOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_L", null),
	NPCID.unknown0820: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonKOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_K", null),
	NPCID.unknown0821: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SARUDUNGEON_N", null),
	NPCID.unknown0822: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonJOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_J", null),
	NPCID.unknown0823: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonIOK, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_I", null),
	NPCID.unknown0824: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonJOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_J", null),
	NPCID.unknown0825: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.sarudungeonIOK, NPCConfigFlagStyle.showIfOn, "MSG_SARUDUNGEON_I", null),
	NPCID.unknown0826: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SARUDUNGEON_O", null),
	NPCID.unknown0827: NPC(NPCType.object, OverworldSprite.pencilStatue, Direction.down, ActionScript.animPeopleWalk0, EventFlag.dsrtSaruTacoDisappear, NPCConfigFlagStyle.showIfOff, "MSG_GRFD_LLPT_TACO", "MSG_DSRT_SARUD_TACO_RECEIVE"),
	NPCID.unknown0828: NPC(NPCType.person, OverworldSprite.monkey, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.dsrtTsaruDisappear, NPCConfigFlagStyle.showIfOff, "MSG_SARUDUNGEON_P", null),
	NPCID.unknown0829: NPC(NPCType.person, OverworldSprite.talahRama, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_TARAIJAB", null),
	NPCID.unknown0830: NPC(NPCType.person, OverworldSprite.miner, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.dsrtSyoziDungeonAppear, NPCConfigFlagStyle.showIfOn, "MSG_DSRT_SYOZI_DUNGEON", null),
	NPCID.unknown0831: NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossA, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_DSRT_BOSS_A", null),
	NPCID.unknown0832: NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossB, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_DSRT_BOSS_B", null),
	NPCID.unknown0833: NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossC, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_DSRT_BOSS_C", null),
	NPCID.unknown0834: NPC(NPCType.person, OverworldSprite.exitMouseNoSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DSRT_NHOUSE_MOUSE_MOTHER", null),
	NPCID.unknown0835: NPC(NPCType.person, OverworldSprite.exitMouse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.itemEscapeMouse, NPCConfigFlagStyle.showIfOff, "MSG_ONET_NHOUSE_MOUSE_CHILD1", null),
	NPCID.unknown0836: NPC(NPCType.person, OverworldSprite.exitMouse, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_ONET_NHOUSE_MOUSE_CHILD2", null),
	NPCID.unknown0837: NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossD, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_DSRT_BOSS_D", null),
	NPCID.unknown0838: NPC(NPCType.person, OverworldSprite.guardianDigger, Direction.down, ActionScript.unknown600, EventFlag.winDsrtBossE, NPCConfigFlagStyle.showIfOff, "MSG_DSRT_DSRT_BOSS_E", null),
	NPCID.unknown0839: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MISSFAKE", "MSG_FOUR_MISSFAKE_RECEIVE"),
	NPCID.unknown0840: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animMapObjStill, EventFlag.fourTopoloBoyBAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_THEATERBOY", null),
	NPCID.unknown0841: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animMapObjStill, EventFlag.fourTopoloBoyBAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_THEATERBOY_B", null),
	NPCID.unknown0842: NPC(NPCType.person, OverworldSprite.venus, Direction.up, ActionScript.animMapObjTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_VENUS", null),
	NPCID.unknown0843: NPC(NPCType.person, OverworldSprite.gorgeous, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_TONZURA_GORGEOUS", null),
	NPCID.unknown0844: NPC(NPCType.person, OverworldSprite.runawayFiveBassPlayer, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_TONZURA_OKEY", null),
	NPCID.unknown0845: NPC(NPCType.person, OverworldSprite.runawayFiveDrummer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_TONZURA_NICE", null),
	NPCID.unknown0846: NPC(NPCType.person, OverworldSprite.lucky, Direction.left, ActionScript.animPeopleTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_TONZURA_LUCKY", null),
	NPCID.unknown0847: NPC(NPCType.person, OverworldSprite.runawayFiveSaxPlayer, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourTonzuraThanks, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_TONZURA_GROOVY", null),
	NPCID.unknown0848: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_THEATER_TICKETPIA", null),
	NPCID.unknown0849: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0056, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_THEATER_USHER", "MSG_FOUR_CARROT_RECEIVE"),
	NPCID.unknown0850: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0056, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_THEATER_USHER_B", null),
	NPCID.unknown0851: NPC(NPCType.person, OverworldSprite.surfer, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTopoloAbAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_THEATER_VISITOR_A", null),
	NPCID.unknown0852: NPC(NPCType.person, OverworldSprite.beachLady, Direction.down, ActionScript.animMapObjStill, EventFlag.fourTopoloAbAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_THEATER_VISITOR_B", null),
	NPCID.unknown0853: NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_BAKERY_BAKER", null),
	NPCID.unknown0854: NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_BAKERY_OWNER", null),
	NPCID.unknown0855: NPC(NPCType.person, OverworldSprite.mrT, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_PETENERA", "MSG_FOUR_PETENERA_RECEIVE"),
	NPCID.unknown0856: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_ELEVGIRL", null),
	NPCID.unknown0857: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MONOBLDG_A", null),
	NPCID.unknown0858: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MONOBLDG_B", null),
	NPCID.unknown0859: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MONOBLDG_RECEPTION", null),
	NPCID.unknown0860: NPC(NPCType.person, OverworldSprite.monotoli, Direction.right, ActionScript.animMapObjTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_MONOTOLY_END", null),
	NPCID.unknown0861: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown0862: NPC(NPCType.person, OverworldSprite.bodyguard, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_GUARD_MONOTOLY_A", null),
	NPCID.unknown0863: NPC(NPCType.person, OverworldSprite.bodyguard, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_GUARD_MONOTOLY_B", null),
	NPCID.unknown0864: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_ELEVGIRL_DOWN", null),
	NPCID.unknown0865: NPC(NPCType.person, OverworldSprite.pokeyRich, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourOK, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_POKEY", null),
	NPCID.unknown0866: NPC(NPCType.person, OverworldSprite.bodyguard, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourOK, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_GUARD_47_A", null),
	NPCID.unknown0867: NPC(NPCType.person, OverworldSprite.bodyguard, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourOK, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_GUARD_47_B", null),
	NPCID.unknown0868: NPC(NPCType.person, OverworldSprite.aloysiusMinch, Direction.right, ActionScript.animPeopleWalk1, EventFlag.fourOK, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_POKEY_OYAZI", null),
	NPCID.unknown0869: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.fourMaidThanks, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_ELEVGIRL_PRIVATE", null),
	NPCID.unknown0870: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_ELEVGIRL_48PRIVATE", null),
	NPCID.unknown0871: NPC(NPCType.person, OverworldSprite.electra, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MAID_48", null),
	NPCID.unknown0872: NPC(NPCType.person, OverworldSprite.monotoli, Direction.up, ActionScript.unknown700, EventFlag.fourStairwayAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_MONOTOLY_1", null),
	NPCID.unknown0873: NPC(NPCType.person, OverworldSprite.paula, Direction.right, ActionScript.animMapObjStill, EventFlag.pola1, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_POLA", null),
	NPCID.unknown0874: NPC(NPCType.person, OverworldSprite.monotoli, Direction.down, ActionScript.animMapObjStill, EventFlag.fourMonotolyAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_MONOTOLY_1", null),
	NPCID.unknown0875: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_ENRICH_END", null),
	NPCID.unknown0876: NPC(NPCType.object, OverworldSprite.mightyBear, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MONOBLDG_BEAR", null),
	NPCID.unknown0877: NPC(NPCType.object, OverworldSprite.secretDoorInMonotoliBuilding, Direction.down, ActionScript.unknown704, EventFlag.fourStairwayAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_CHECK_HELIDOOR", null),
	NPCID.unknown0878: NPC(NPCType.object, OverworldSprite.secretDoorInMonotoliBuilding, Direction.down, ActionScript.animBillboard, EventFlag.fourStairwayAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0879: NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.down, ActionScript.unknown602, EventFlag.fourMihari1Disappear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_GUARD_ROBOT_1", null),
	NPCID.unknown0880: NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.left, ActionScript.unknown602, EventFlag.fourMihari2Disappear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_GUARD_ROBOT_2", null),
	NPCID.unknown0881: NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.left, ActionScript.unknown602, EventFlag.fourMihari3Disappear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_GUARD_ROBOT_3", null),
	NPCID.unknown0882: NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.right, ActionScript.unknown602, EventFlag.fourMihari4Disappear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_GUARD_ROBOT_4", null),
	NPCID.unknown0883: NPC(NPCType.person, OverworldSprite.clumsyRobot, Direction.down, ActionScript.unknown602, EventFlag.fourYudanRoboDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_GUARD_YUDANROBO", null),
	NPCID.unknown0884: NPC(NPCType.person, OverworldSprite.gorgeous, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_BLDG_GORGEOUS", null),
	NPCID.unknown0885: NPC(NPCType.person, OverworldSprite.lucky, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_BLDG_LUCKY", null),
	NPCID.unknown0886: NPC(NPCType.person, OverworldSprite.runawayFiveDrummer, Direction.up, ActionScript.animPeopleTBack, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_BLDG_NICE", null),
	NPCID.unknown0887: NPC(NPCType.person, OverworldSprite.runawayFiveBassPlayer, Direction.down, ActionScript.animMapObjStill, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_BLDG_OKEY", null),
	NPCID.unknown0888: NPC(NPCType.person, OverworldSprite.runawayFiveSaxPlayer, Direction.left, ActionScript.animPeopleTBack, EventFlag.fourBldgTonzuraAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_BLDG_GROOVY", null),
	NPCID.unknown0889: NPC(NPCType.person, OverworldSprite.sentryRobot, Direction.right, ActionScript.unknown602, EventFlag.fourMihari5Disappear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_GUARD_ROBOT_5", null),
	NPCID.unknown0890: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HOTEL_FOUR", null),
	NPCID.unknown0891: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_HOTELPORTER", null),
	NPCID.unknown0892: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown0893: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0894: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_HOTEL_A", null),
	NPCID.unknown0895: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.left, ActionScript.animMapObjStill, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "MSG_HOTEL_FOUR_PAPERBOY", null),
	NPCID.unknown0896: NPC(NPCType.person, OverworldSprite.jackie, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_BAR_ONEEYEDJACK", null),
	NPCID.unknown0897: NPC(NPCType.person, OverworldSprite.bigSmileLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptOK, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_BAR_BETTY", null),
	NPCID.unknown0898: NPC(NPCType.person, OverworldSprite.bigSmileLady, Direction.left, ActionScript.animMapObjTBack, EventFlag.fourDeptOK, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_BAR_BETTY_1", null),
	NPCID.unknown0899: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_BAR_JIMMY", null),
	NPCID.unknown0900: NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_BAR_KNOCK", null),
	NPCID.unknown0901: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_BAR_ENRICH", null),
	NPCID.unknown0902: NPC(NPCType.person, OverworldSprite.aloysiusMinch, Direction.down, ActionScript.animPeopleTBack, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_BORGES_AMBRAMI", null),
	NPCID.unknown0903: NPC(NPCType.object, OverworldSprite.jukebox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_BAR_JUKEBOX", null),
	NPCID.unknown0904: NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_BRGS_WARE_RAT", null),
	NPCID.unknown0905: NPC(NPCType.object, OverworldSprite.brokenManiManiStatue, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_CHECK_FOUR_MANIMANI", null),
	NPCID.unknown0906: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MUSEUM_RECEPTION", null),
	NPCID.unknown0907: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0908: NPC(NPCType.person, OverworldSprite.foursideMuseumGuy, Direction.right, ActionScript.animMapObjStill, EventFlag.fourKomoritaAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_MUSEUM_KOMORITA", "MSG_FOUR_KOMORITA_RECEIVE"),
	NPCID.unknown0909: NPC(NPCType.person, OverworldSprite.foursideMuseumGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.fourKomoritaAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_MUSEUM_KOMORITA_B", null),
	NPCID.unknown0910: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MUSEUM_A", null),
	NPCID.unknown0911: NPC(NPCType.person, OverworldSprite.pigtailDarkHairedGirl, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MUSEUM_B", null),
	NPCID.unknown0912: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_MUSEUM_C", null),
	NPCID.unknown0913: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown878, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0914: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_HOSPITAL_USHER", null),
	NPCID.unknown0915: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_FOUR", null),
	NPCID.unknown0916: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_HOSPITAL_DOCTOR", null),
	NPCID.unknown0917: NPC(NPCType.person, OverworldSprite.nurse, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_HOSP_GIRL", null),
	NPCID.unknown0918: NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_HOSP_OLDWOMAN", null),
	NPCID.unknown0919: NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_HOSP_CAP", null),
	NPCID.unknown0920: NPC(NPCType.person, OverworldSprite.thickGlassesLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_HENPIN", null),
	NPCID.unknown0921: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_TICKETPIA", null),
	NPCID.unknown0922: NPC(NPCType.person, OverworldSprite.elevatorLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_DRUG1", null),
	NPCID.unknown0923: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_DRUG2", null),
	NPCID.unknown0924: NPC(NPCType.person, OverworldSprite.bodyguard, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_A", null),
	NPCID.unknown0925: NPC(NPCType.person, OverworldSprite.waitress, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_SHOP_FOUR_HAMBURGER", null),
	NPCID.unknown0926: NPC(NPCType.person, OverworldSprite.girlInStripedApron, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_FURIKAKE", null),
	NPCID.unknown0927: NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_B", null),
	NPCID.unknown0928: NPC(NPCType.person, OverworldSprite.yellowClothesBlonde, Direction.right, ActionScript.unknown016, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_C", null),
	NPCID.unknown0929: NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.up, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_D", null),
	NPCID.unknown0930: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_E", null),
	NPCID.unknown0931: NPC(NPCType.person, OverworldSprite.appleKidsMouse, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_MOUSE", null),
	NPCID.unknown0932: NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animPeopleWalk1, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_DEPT_FOOD", null),
	NPCID.unknown0933: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.down, ActionScript.animPeopleTBack, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_SHOP_FOUR_TOYSHOP", null),
	NPCID.unknown0934: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.right, ActionScript.animPeopleWalk1, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_SHOP_FOUR_SPORT", null),
	NPCID.unknown0935: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown880, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0936: NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_WEAPON", null),
	NPCID.unknown0937: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0938: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown0939: NPC(NPCType.object, OverworldSprite.magicTartStand, Direction.down, ActionScript.animMapObjStill, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0940: NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown0941: NPC(NPCType.person, OverworldSprite.deptStoreMook, Direction.down, ActionScript.animPeopleWalk0, EventFlag.fourDeptBossAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_DEPT_BOSS", null),
	NPCID.unknown0942: NPC(NPCType.person, OverworldSprite.guyInBlueClothes, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_A", null),
	NPCID.unknown0943: NPC(NPCType.person, OverworldSprite.blondeLadyBlueDress, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_B", null),
	NPCID.unknown0944: NPC(NPCType.person, OverworldSprite.trumpetPerson, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_C", null),
	NPCID.unknown0945: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_D", null),
	NPCID.unknown0946: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_E", null),
	NPCID.unknown0947: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_F", null),
	NPCID.unknown0948: NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_G", null),
	NPCID.unknown0949: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_COP_1", null),
	NPCID.unknown0950: NPC(NPCType.person, OverworldSprite.copInSunglasses, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_COP_2", null),
	NPCID.unknown0951: NPC(NPCType.person, OverworldSprite.electra, Direction.down, ActionScript.animPeopleWalk0, EventFlag.fourMaidAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_MAID", null),
	NPCID.unknown0952: NPC(NPCType.person, OverworldSprite.everdredLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_TONCHIKI", null),
	NPCID.unknown0953: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_CROWD_A", null),
	NPCID.unknown0954: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.up, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_CROWD_B", null),
	NPCID.unknown0955: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.up, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_CROWD_C", null),
	NPCID.unknown0956: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.up, ActionScript.animMapObjTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_CROWD_D", null),
	NPCID.unknown0957: NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_CROWD_E", null),
	NPCID.unknown0958: NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.right, ActionScript.animPeopleTBack, EventFlag.fourTonchikiAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_CROWD_F", null),
	NPCID.unknown0959: NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_JUNK", null),
	NPCID.unknown0960: NPC(NPCType.person, OverworldSprite.gorgeous, Direction.down, ActionScript.animMapObjStill, EventFlag.fourTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_TONZURABUS_GORGEOUS", null),
	NPCID.unknown0961: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_INFORMER_A", null),
	NPCID.unknown0962: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.right, ActionScript.animMapObjTBack, EventFlag.fourTonzuraFree, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_INFORMER_B", null),
	NPCID.unknown0963: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.up, ActionScript.animPeopleWalk1Narrow, EventFlag.fourTonzuraFree, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_INFORMER_C", null),
	NPCID.unknown0964: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.fourInfoDAppear, NPCConfigFlagStyle.showIfOn, "MSG_FOUR_INFORMER_D", null),
	NPCID.unknown0965: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.down, ActionScript.animMapObjTBack, EventFlag.winMgntBoss, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_INFORMER_E", null),
	NPCID.unknown0966: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.right, ActionScript.animMapObjTBack, EventFlag.winMgntBoss, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_INFORMER_F", null),
	NPCID.unknown0967: NPC(NPCType.person, OverworldSprite.monkey, Direction.right, ActionScript.animMapObjStill, EventFlag.fourSaruBAppear, NPCConfigFlagStyle.showIfOn, "MSG_EVT_BUTUKARIZARU", null),
	NPCID.unknown0968: NPC(NPCType.person, OverworldSprite.humanCharred, Direction.down, ActionScript.animMapObjStill, EventFlag.fourSaruKAppear, NPCConfigFlagStyle.showIfOn, "MSG_EVT_KUROKOGEZARU", null),
	NPCID.unknown0969: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_FIELD_KOZIKI", null),
	NPCID.unknown0970: NPC(NPCType.person, OverworldSprite.hintMan, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_HINTMAN", null),
	NPCID.unknown0971: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown879, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0972: NPC(NPCType.object, OverworldSprite.busStopSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_BUSSTOP_THRK", null),
	NPCID.unknown0973: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0974: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0975: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0976: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0977: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0978: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0979: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0980: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0981: NPC(NPCType.object, OverworldSprite.streetLight, Direction.down, ActionScript.unknown877, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0982: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0983: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0984: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0985: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0986: NPC(NPCType.object, OverworldSprite.streetSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0987: NPC(NPCType.object, OverworldSprite.magnetHill, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0988: NPC(NPCType.object, OverworldSprite.can, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown0989: NPC(NPCType.object, OverworldSprite.helicopter, Direction.down, ActionScript.unknown711, EventFlag.fourHeliDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0990: NPC(NPCType.object, OverworldSprite.helicopterBlade, Direction.down, ActionScript.animMapObjStill, EventFlag.fourHeliDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0991: NPC(NPCType.object, OverworldSprite.helicopterBack, Direction.down, ActionScript.animMapObjStill, EventFlag.fourHeliDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0992: NPC(NPCType.object, OverworldSprite.shadow, Direction.down, ActionScript.unknown704, EventFlag.fourHeliDisappear, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown0993: NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_FOUR_CHECK_HOTEL_KANBAN", null),
	NPCID.unknown0994: NPC(NPCType.object, OverworldSprite.runaway5Bus, Direction.down, ActionScript.unknown190, EventFlag.fourTonzuraBusAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown0995: NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winMgntBoss, NPCConfigFlagStyle.showIfOff, "MSG_FOUR_MGNT_BOSS", null),
	NPCID.unknown0996: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_CLUB_A", null),
	NPCID.unknown0997: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_CLUB_B", null),
	NPCID.unknown0998: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_CLUB_C", null),
	NPCID.unknown0999: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_CLUB_D", null),
	NPCID.unknown1000: NPC(NPCType.person, OverworldSprite.mrT, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_CLUB_OWNER", null),
	NPCID.unknown1001: NPC(NPCType.person, OverworldSprite.waitress, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_CLUB_WAITRESS", null),
	NPCID.unknown1002: NPC(NPCType.person, OverworldSprite.magicCakeLady, Direction.left, ActionScript.animPeopleTBack, EventFlag.sumsStoicWifeDisappear, NPCConfigFlagStyle.showIfOff, "MSG_SUMS_STOIC_WIFE", null),
	NPCID.unknown1003: NPC(NPCType.person, OverworldSprite.shipCrewman, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_HOUSE_A", null),
	NPCID.unknown1004: NPC(NPCType.person, OverworldSprite.shipCrewman, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_B", null),
	NPCID.unknown1005: NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_D", null),
	NPCID.unknown1006: NPC(NPCType.person, OverworldSprite.trumpetPerson, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_HOUSE_G", null),
	NPCID.unknown1007: NPC(NPCType.person, OverworldSprite.dog, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_HOUSE_GDOG", null),
	NPCID.unknown1008: NPC(NPCType.person, OverworldSprite.shipCaptain, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_GROCER", null),
	NPCID.unknown1009: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown1010: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown1011: NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_DRUGSTORE", null),
	NPCID.unknown1012: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SOUVENIR_A", null),
	NPCID.unknown1013: NPC(NPCType.person, OverworldSprite.beachLady, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SOUVENIR_B", null),
	NPCID.unknown1014: NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown1015: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown1016: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_HOTEL_A", null),
	NPCID.unknown1017: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_HOTEL_B", null),
	NPCID.unknown1018: NPC(NPCType.person, OverworldSprite.blondeShoppingLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_HOTEL_C", null),
	NPCID.unknown1019: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.left, ActionScript.animMapObjStill, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "MSG_HOTEL_SUMS_PAPERBOY", null),
	NPCID.unknown1020: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HOTEL_SUMS", null),
	NPCID.unknown1021: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_HOTELPORTER", null),
	NPCID.unknown1022: NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown1023: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown1024: NPC(NPCType.person, OverworldSprite.youngBlondeGuyInBlue, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_HOTEL_D", null),
	NPCID.unknown1025: NPC(NPCType.person, OverworldSprite.baker, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_DINER", null),
	NPCID.unknown1026: NPC(NPCType.person, OverworldSprite.waitress, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_RESTAURANT_WAITRESS", null),
	NPCID.unknown1027: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_RESTAURANT_A", null),
	NPCID.unknown1028: NPC(NPCType.person, OverworldSprite.brunetteShoppingLady, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptOnet, NPCConfigFlagStyle.showIfOn, "MSG_SUMS_RESTAURANT_B", null),
	NPCID.unknown1029: NPC(NPCType.person, OverworldSprite.fatguyInRedSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_RESTAURANT_C", null),
	NPCID.unknown1030: NPC(NPCType.person, OverworldSprite.oldLadyWithCane, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptOnet, NPCConfigFlagStyle.showIfOn, "MSG_SUMS_RESTAURANT_D", null),
	NPCID.unknown1031: NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.tlptOnet, NPCConfigFlagStyle.showIfOn, "MSG_SUMS_RESTAURANT_E", null),
	NPCID.unknown1032: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown885, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1033: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.sumsMuseumPhoneRing, NPCConfigFlagStyle.showIfOff, "MSG_SUMS_MUSEUM_AUDREY", null),
	NPCID.unknown1034: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_SUMS_MUSEUM", null),
	NPCID.unknown1035: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_MUSEUM_KOMORITA", null),
	NPCID.unknown1036: NPC(NPCType.person, OverworldSprite.surfer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_MUSEUM_A", null),
	NPCID.unknown1037: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.sumsOmarBAppear, NPCConfigFlagStyle.showIfOff, "MSG_SUMS_MUSEUM_OMAR", "MSG_SUMS_MUSEUM_OMAR_RECEIVE"),
	NPCID.unknown1038: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.sumsOmarBAppear, NPCConfigFlagStyle.showIfOn, "MSG_SUMS_OMAR_B", null),
	NPCID.unknown1039: NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown599, EventFlag.fmonHieroglyphADisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_HIEROGLYPH_A", null),
	NPCID.unknown1040: NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.unknown599, EventFlag.fmonHieroglyphBDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_HIEROGLYPH_B", null),
	NPCID.unknown1041: NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1042: NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1043: NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1044: NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1045: NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1046: NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1047: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_HOSPITAL_USHER", null),
	NPCID.unknown1048: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_SUMS", null),
	NPCID.unknown1049: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_HOSPITAL_DOCTOR", null),
	NPCID.unknown1050: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_HOSP_GIRL", null),
	NPCID.unknown1051: NPC(NPCType.person, OverworldSprite.weirdoGuyInSwimTrunks, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SWIMSUITMAN_A", null),
	NPCID.unknown1052: NPC(NPCType.person, OverworldSprite.girlInBikini, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SWIMSUITGAL_A", null),
	NPCID.unknown1053: NPC(NPCType.person, OverworldSprite.guyInSwimmingSuit, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SWIMSUITMAN_B", null),
	NPCID.unknown1054: NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SWIMSUITMAN_C", null),
	NPCID.unknown1055: NPC(NPCType.person, OverworldSprite.weirdoGuyInSwimTrunks, Direction.left, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SWIMSUITMAN_D", null),
	NPCID.unknown1056: NPC(NPCType.person, OverworldSprite.zombieLady, Direction.left, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SWIMSUITGAL_B", null),
	NPCID.unknown1057: NPC(NPCType.person, OverworldSprite.beachLady, Direction.down, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_RESORT_A", null),
	NPCID.unknown1058: NPC(NPCType.person, OverworldSprite.weirdoGuyInSwimTrunks, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_RESORT_B", null),
	NPCID.unknown1059: NPC(NPCType.person, OverworldSprite.iLoveQowgaShirtGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_1", null),
	NPCID.unknown1060: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_2", null),
	NPCID.unknown1061: NPC(NPCType.person, OverworldSprite.mexicanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SHOP_SUMS_ICE", null),
	NPCID.unknown1062: NPC(NPCType.person, OverworldSprite.birdOnPerch, Direction.left, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_BIRD", null),
	NPCID.unknown1063: NPC(NPCType.person, OverworldSprite.shipCaptain, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_A", null),
	NPCID.unknown1064: NPC(NPCType.person, OverworldSprite.shipCrewman, Direction.left, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_C", null),
	NPCID.unknown1065: NPC(NPCType.person, OverworldSprite.shipCaptain, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_SAILOR_A", null),
	NPCID.unknown1066: NPC(NPCType.person, OverworldSprite.palmTanGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SWIMSUITMAN_E", null),
	NPCID.unknown1067: NPC(NPCType.person, OverworldSprite.cat, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_CAT_1", null),
	NPCID.unknown1068: NPC(NPCType.person, OverworldSprite.cat, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_CAT_2", null),
	NPCID.unknown1069: NPC(NPCType.person, OverworldSprite.magicCakeLady, Direction.down, ActionScript.animMapObjTBack, EventFlag.sumsStoicWifeDisappear, NPCConfigFlagStyle.showIfOn, "MSG_SUMS_OILMASSAGE", null),
	NPCID.unknown1070: NPC(NPCType.person, OverworldSprite.sunBathingGirl, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_SWIMSUITGAL_C", null),
	NPCID.unknown1071: NPC(NPCType.person, OverworldSprite.hintMan, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "MSG_SUMS_HINTMAN", null),
	NPCID.unknown1072: NPC(NPCType.person, OverworldSprite.lucky, Direction.left, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1073: NPC(NPCType.person, OverworldSprite.gorgeous, Direction.down, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1074: NPC(NPCType.person, OverworldSprite.runawayFiveDrummer, Direction.down, ActionScript.animPeopleWalk0, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1075: NPC(NPCType.person, OverworldSprite.girlInBikini, Direction.up, ActionScript.animPeopleWalk0, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1076: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown887, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1077: NPC(NPCType.person, OverworldSprite.oldFatGuyWithHat, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_TOTO_WELCOME", null),
	NPCID.unknown1078: NPC(NPCType.object, OverworldSprite.magicTartStand, Direction.down, ActionScript.unknown886, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_MAGICCAKE_WAGON", null),
	NPCID.unknown1079: NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1080: NPC(NPCType.person, OverworldSprite.guyInCoolRedCar, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_OPENCAR", null),
	NPCID.unknown1081: NPC(NPCType.object, OverworldSprite.deliveryTruck, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1082: NPC(NPCType.object, OverworldSprite.bicycle, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1083: NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1084: NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1085: NPC(NPCType.object, OverworldSprite.magicTartStand, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_MAGICCAKE_WAGON", null),
	NPCID.unknown1086: NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.unknown884, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SUMS_CHECK_HOTEL_KANBAN", null),
	NPCID.unknown1087: NPC(NPCType.object, OverworldSprite.runaway5Bus, Direction.down, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1088: NPC(NPCType.object, OverworldSprite.ship, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1089: NPC(NPCType.person, OverworldSprite.starMaster, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_MASTER", null),
	NPCID.unknown1090: NPC(NPCType.person, OverworldSprite.dalaameseServant, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_A", null),
	NPCID.unknown1091: NPC(NPCType.person, OverworldSprite.telephoneHeadGuy, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_PHONEMASTER", null),
	NPCID.unknown1092: NPC(NPCType.person, OverworldSprite.poo, Direction.down, ActionScript.animPeopleWalk1, EventFlag.ramaPuAppear, NPCConfigFlagStyle.showIfOn, "MSG_RAMA_PU", null),
	NPCID.unknown1093: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown881, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1094: NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.right, ActionScript.unknown016, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_B", null),
	NPCID.unknown1095: NPC(NPCType.person, OverworldSprite.chineseMonkGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_HOUSE_A", null),
	NPCID.unknown1096: NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_HOUSE_B", null),
	NPCID.unknown1097: NPC(NPCType.person, OverworldSprite.dalaameseServant, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_HOUSE_C", null),
	NPCID.unknown1098: NPC(NPCType.person, OverworldSprite.chineseMonkGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_OKAYU", null),
	NPCID.unknown1099: NPC(NPCType.person, OverworldSprite.dalaameseServant, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_SYSMSG_PU_ITEM", null),
	NPCID.unknown1100: NPC(NPCType.person, OverworldSprite.preetProotGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_FIELD_A", null),
	NPCID.unknown1101: NPC(NPCType.person, OverworldSprite.dalaameseServant, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_FIELD_B", null),
	NPCID.unknown1102: NPC(NPCType.person, OverworldSprite.dalaamGirl, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_FIELD_C", null),
	NPCID.unknown1103: NPC(NPCType.person, OverworldSprite.starMaster, Direction.left, ActionScript.animPeopleWalk0, EventFlag.rama258Disappear, NPCConfigFlagStyle.showIfOff, "MSG_RAMA_MABOROSHI", null),
	NPCID.unknown1104: NPC(NPCType.person, OverworldSprite.dalaamGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_GIRL_A", null),
	NPCID.unknown1105: NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_GIRL_B", null),
	NPCID.unknown1106: NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_GIRL_C", null),
	NPCID.unknown1107: NPC(NPCType.object, OverworldSprite.rabbit, Direction.down, ActionScript.animMapObjStill, EventFlag.ramaRabbitDisappear, NPCConfigFlagStyle.showIfOff, "MSG_RAMA_RABBIT", "MSG_RAMA_RABBIT_RECEIVE"),
	NPCID.unknown1108: NPC(NPCType.object, OverworldSprite.rabbit, Direction.down, ActionScript.animMapObjStill, EventFlag.ramaRabbitDisappear, NPCConfigFlagStyle.showIfOff, "MSG_RAMA_RABBIT", "MSG_RAMA_RABBIT_RECEIVE"),
	NPCID.unknown1109: NPC(NPCType.object, OverworldSprite.rabbit, Direction.down, ActionScript.animMapObjStill, EventFlag.ramaRabbitDisappear, NPCConfigFlagStyle.showIfOff, "MSG_RAMA_RABBIT", "MSG_RAMA_RABBIT_RECEIVE"),
	NPCID.unknown1110: NPC(NPCType.person, OverworldSprite.dalaamGirl, Direction.up, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1111: NPC(NPCType.person, OverworldSprite.dalaamGirl, Direction.left, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1112: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_CHECK_MU", null),
	NPCID.unknown1113: NPC(NPCType.object, OverworldSprite.ornamentsOnPoosTemple, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1114: NPC(NPCType.object, OverworldSprite.ornamentsOnPoosTemple, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1115: NPC(NPCType.object, OverworldSprite.ornamentsOnPoosTemple, Direction.down, ActionScript.unknown882, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1116: NPC(NPCType.object, OverworldSprite.ornamentsOnPoosTemple, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1117: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_RAMA_CHECK_SHOP", null),
	NPCID.unknown1118: NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winPinkBoss, NPCConfigFlagStyle.showIfOff, "MSG_RAMA_PINK_BOSS", null),
	NPCID.unknown1119: NPC(NPCType.person, OverworldSprite.nessLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1120: NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1121: NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1122: NPC(NPCType.person, OverworldSprite.poo, Direction.left, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1123: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_DRUG", null),
	NPCID.unknown1124: NPC(NPCType.person, OverworldSprite.happyTurbanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HOTEL_SKRB", null),
	NPCID.unknown1125: NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_WEAPON", null),
	NPCID.unknown1126: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "MSG_HOTEL_SKRB_PAPERBOY", null),
	NPCID.unknown1127: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown1128: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown1129: NPC(NPCType.person, OverworldSprite.ladyInVeil, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_HOUSE_B", null),
	NPCID.unknown1130: NPC(NPCType.person, OverworldSprite.oldGuyWithCane, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_HOUSE_C", null),
	NPCID.unknown1131: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_HOSPITAL_USHER", null),
	NPCID.unknown1132: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_HOSPITAL_DOCTOR", null),
	NPCID.unknown1133: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_SKRB", null),
	NPCID.unknown1134: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_HARBOR", null),
	NPCID.unknown1135: NPC(NPCType.person, OverworldSprite.happyTurbanGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_SNAKESHOP_A", null),
	NPCID.unknown1136: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_SNAKESHOP_B", null),
	NPCID.unknown1137: NPC(NPCType.person, OverworldSprite.ladyInVeil, Direction.up, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_SNAKESHOP_C", null),
	NPCID.unknown1138: NPC(NPCType.person, OverworldSprite.bigNoseArabGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_SNAKESHOP_D", null),
	NPCID.unknown1139: NPC(NPCType.person, OverworldSprite.arabMrT, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_SNAKESHOP_PANCHO", null),
	NPCID.unknown1140: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_GOZAR", null),
	NPCID.unknown1141: NPC(NPCType.person, OverworldSprite.happyTurbanGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_BAZAR_A", null),
	NPCID.unknown1142: NPC(NPCType.person, OverworldSprite.preetProotGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_FORTUNETELLER", null),
	NPCID.unknown1143: NPC(NPCType.object, OverworldSprite.pyramidDoor, Direction.down, ActionScript.animMapObjStill, EventFlag.sphinxOK, NPCConfigFlagStyle.showIfOff, "MSG_SKRB_PYRAMID_DOOR", null),
	NPCID.unknown1144: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_A", null),
	NPCID.unknown1145: NPC(NPCType.person, OverworldSprite.bigNoseArabGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_B", null),
	NPCID.unknown1146: NPC(NPCType.person, OverworldSprite.bigNoseArabGuy, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_WATER", null),
	NPCID.unknown1147: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SHOP_SKRB_OASIS", null),
	NPCID.unknown1148: NPC(NPCType.person, OverworldSprite.preetProotGuy, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_PUPUKA", null),
	NPCID.unknown1149: NPC(NPCType.person, OverworldSprite.tribalWarrior, Direction.down, ActionScript.animPeopleWalk0, EventFlag.skrbYarimanBAppear, NPCConfigFlagStyle.showIfOff, "MSG_SKRB_YARIMAN", null),
	NPCID.unknown1150: NPC(NPCType.object, OverworldSprite.dungeonMan, Direction.down, ActionScript.animMapObjStill, EventFlag.skrbBrickRoadDisappear, NPCConfigFlagStyle.showIfOff, "MSG_SKRB_FIELD_DUNGEONMAN", "MSG_SKRB_FIELD_DUNGEONMAN_RECEIVE"),
	NPCID.unknown1151: NPC(NPCType.person, OverworldSprite.tribalWarrior, Direction.down, ActionScript.animPeopleWalk0, EventFlag.skrbYarimanBAppear, NPCConfigFlagStyle.showIfOn, "MSG_SKRB_YARIMAN_2", null),
	NPCID.unknown1152: NPC(NPCType.person, OverworldSprite.dungeonMan, Direction.down, ActionScript.unknown498, EventFlag.skrbBrickRoadMakyoAppear, NPCConfigFlagStyle.showIfOn, "MSG_EVT_90_DUNGEONMAN", null),
	NPCID.unknown1153: NPC(NPCType.person, OverworldSprite.hintMan, Direction.down, ActionScript.animPeopleTBack, EventFlag.unknown0752, NPCConfigFlagStyle.showIfOff, "MSG_SKRB_HINTMAN", null),
	NPCID.unknown1154: NPC(NPCType.object, OverworldSprite.pyramidDoor, Direction.down, ActionScript.animMapObjStill, EventFlag.sphinxOK, NPCConfigFlagStyle.showIfOff, "MSG_SKRB_PYRAMID_DOOR", null),
	NPCID.unknown1155: NPC(NPCType.person, OverworldSprite.mustacheArabTurbanGuy, Direction.right, ActionScript.animPeopleTBack, EventFlag.tlptMaky, NPCConfigFlagStyle.showIfOff, "MSG_SKRB_INFO_POKEY", null),
	NPCID.unknown1156: NPC(NPCType.person, OverworldSprite.bigNoseArabGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_FURIKAKE", null),
	NPCID.unknown1157: NPC(NPCType.person, OverworldSprite.preetProotGuy, Direction.down, ActionScript.unknown888, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_BAZAR_B", null),
	NPCID.unknown1158: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown889, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1159: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown890, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1160: NPC(NPCType.person, OverworldSprite.camel, Direction.left, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1161: NPC(NPCType.person, OverworldSprite.camel, Direction.left, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1162: NPC(NPCType.object, OverworldSprite.unknown3, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_UNKO_POKEY", null),
	NPCID.unknown1163: NPC(NPCType.object, OverworldSprite.unknown3, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_UNKO_POKEY", null),
	NPCID.unknown1164: NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_CHECK_HOTEL_KANBAN", null),
	NPCID.unknown1165: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_CHECK_SHOP", null),
	NPCID.unknown1166: NPC(NPCType.object, OverworldSprite.guardianHieroglyph, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1167: NPC(NPCType.object, OverworldSprite.guardianHieroglyph, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1168: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraACDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_C", null),
	NPCID.unknown1169: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraADDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_D", null),
	NPCID.unknown1170: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBADisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_A", null),
	NPCID.unknown1171: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBBDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_B", null),
	NPCID.unknown1172: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraAEDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_E", null),
	NPCID.unknown1173: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAFDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_F", null),
	NPCID.unknown1174: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAGDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_G", null),
	NPCID.unknown1175: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBCDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_C", null),
	NPCID.unknown1176: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAHDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_H", null),
	NPCID.unknown1177: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraBDDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_D", null),
	NPCID.unknown1178: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAIDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_I", null),
	NPCID.unknown1179: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraBEDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_E", null),
	NPCID.unknown1180: NPC(NPCType.object, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.animMapObjStill, EventFlag.fmonPyraBossDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_BOSS", null),
	NPCID.unknown1181: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAJDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_J", null),
	NPCID.unknown1182: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAKDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_K", null),
	NPCID.unknown1183: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraALDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_L", null),
	NPCID.unknown1184: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraBFDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_F", null),
	NPCID.unknown1185: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAMDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_M", null),
	NPCID.unknown1186: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraANDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_N", null),
	NPCID.unknown1187: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBGDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_G", null),
	NPCID.unknown1188: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraAODisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_O", null),
	NPCID.unknown1189: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraAPDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_P", null),
	NPCID.unknown1190: NPC(NPCType.person, OverworldSprite.guardianHieroglyph, Direction.left, ActionScript.unknown599, EventFlag.fmonPyraAQDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_A_Q", null),
	NPCID.unknown1191: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBHDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_H", null),
	NPCID.unknown1192: NPC(NPCType.person, OverworldSprite.lethalAspHieroglyph, Direction.right, ActionScript.unknown599, EventFlag.fmonPyraBIDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_PYRA_B_I", null),
	NPCID.unknown1193: NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.skrbPyramidOK, NPCConfigFlagStyle.showIfOff, "MSG_SKRB_PRYAMID_BIGCOFFIN", null),
	NPCID.unknown1194: NPC(NPCType.object, OverworldSprite.pharaohCasket, Direction.down, ActionScript.animMapObjStill, EventFlag.skrbPyramidOK, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1195: NPC(NPCType.object, OverworldSprite.hawksEye, Direction.down, ActionScript.animMapObjStill, EventFlag.itemTakanome, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown1196: NPC(NPCType.person, OverworldSprite.brickRoadHead, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_BRICKROAD", null),
	NPCID.unknown1197: NPC(NPCType.object, OverworldSprite.submarine, Direction.down, ActionScript.animMapObjStill, EventFlag.tlptMaky, NPCConfigFlagStyle.showIfOff, "MSG_SKRB_BRICK_SUBMARINE", null),
	NPCID.unknown1198: NPC(NPCType.object, OverworldSprite.bicycle, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1199: NPC(NPCType.object, OverworldSprite.realTaxi, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1200: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_DMAN_BENCH_1A", null),
	NPCID.unknown1201: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown1202: NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1203: NPC(NPCType.person, OverworldSprite.payPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE_2", null),
	NPCID.unknown1204: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_DMAN_BENCH_1B", null),
	NPCID.unknown1205: NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1206: NPC(NPCType.object, OverworldSprite.atm, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown1207: NPC(NPCType.object, OverworldSprite.instantRevitalizingDevice, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_WINS_RECOVER", null),
	NPCID.unknown1208: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_BRICK_SIGN_45", null),
	NPCID.unknown1209: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_DMAN_BENCH_2", null),
	NPCID.unknown1210: NPC(NPCType.object, OverworldSprite.bench, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_DMAN_BENCH_3", null),
	NPCID.unknown1211: NPC(NPCType.object, OverworldSprite.madDuck, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1212: NPC(NPCType.object, OverworldSprite.madDuck, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1213: NPC(NPCType.object, OverworldSprite.madDuck, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1214: NPC(NPCType.object, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1215: NPC(NPCType.object, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1216: NPC(NPCType.object, OverworldSprite.slimyLittlePile, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1217: NPC(NPCType.object, OverworldSprite.gruffGoat, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1218: NPC(NPCType.object, OverworldSprite.gruffGoat, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1219: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtKanban44Move, NPCConfigFlagStyle.showIfOff, "MSG_BRICK_SIGN_44", null),
	NPCID.unknown1220: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.dsrtKanban44Move, NPCConfigFlagStyle.showIfOn, "MSG_BRICK_SIGN_44", null),
	NPCID.unknown1221: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_BRICK_SIGN_FACE", null),
	NPCID.unknown1222: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_SKRB", null),
	NPCID.unknown1223: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_HOSPITAL_DOCTOR", null),
	NPCID.unknown1224: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SKRB_HOSPITAL_USHER", null),
	NPCID.unknown1225: NPC(NPCType.object, OverworldSprite.treeInPot, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1226: NPC(NPCType.person, OverworldSprite.monkey, Direction.left, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_MONKEY_TELEPORT", null),
	NPCID.unknown1227: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_MONKEY_A", null),
	NPCID.unknown1228: NPC(NPCType.person, OverworldSprite.monkey, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_MONKEY_INN", null),
	NPCID.unknown1229: NPC(NPCType.person, OverworldSprite.masterBarf, Direction.right, ActionScript.animPeopleWalk0, EventFlag.winGeropp, NPCConfigFlagStyle.showIfOff, "MSG_MAKYO_GEROPP", null),
	NPCID.unknown1230: NPC(NPCType.person, OverworldSprite.birdOnPerch, Direction.right, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_BIRD", null),
	NPCID.unknown1231: NPC(NPCType.person, OverworldSprite.unknown4, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoUseTakanome, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown1232: NPC(NPCType.person, OverworldSprite.hiddenArmsDealer, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SHOP_MAKYO_WEAPON", null),
	NPCID.unknown1233: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_TRADER", null),
	NPCID.unknown1234: NPC(NPCType.person, OverworldSprite.doctor, Direction.right, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_DOCTOR", null),
	NPCID.unknown1235: NPC(NPCType.person, OverworldSprite.deepDarknessPhone, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_BIRD_PHONE", null),
	NPCID.unknown1236: NPC(NPCType.person, OverworldSprite.atmGuyUnderwater, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_YAMI", null),
	NPCID.unknown1237: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.unknown891, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1238: NPC(NPCType.person, OverworldSprite.femaleMonkey, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_MONKEY_B", null),
	NPCID.unknown1239: NPC(NPCType.person, OverworldSprite.monkey, Direction.right, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_MONKEY_C", null),
	NPCID.unknown1240: NPC(NPCType.object, OverworldSprite.magicTruffle, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle1Disappear, NPCConfigFlagStyle.showIfOff, "MSG_MAKYO_MTRUFFLE_1", null),
	NPCID.unknown1241: NPC(NPCType.object, OverworldSprite.magicTruffle, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle2Disappear, NPCConfigFlagStyle.showIfOff, "MSG_MAKYO_MTRUFFLE_2", null),
	NPCID.unknown1242: NPC(NPCType.object, OverworldSprite.magicTruffle, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle3Disappear, NPCConfigFlagStyle.showIfOff, "MSG_MAKYO_MTRUFFLE_3", null),
	NPCID.unknown1243: NPC(NPCType.object, OverworldSprite.magicTruffle, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle4Disappear, NPCConfigFlagStyle.showIfOff, "MSG_MAKYO_MTRUFFLE_4", null),
	NPCID.unknown1244: NPC(NPCType.object, OverworldSprite.magicTruffle, Direction.down, ActionScript.animMapObjStill, EventFlag.makyoMTruffle5Disappear, NPCConfigFlagStyle.showIfOff, "MSG_MAKYO_MTRUFFLE_5", null),
	NPCID.unknown1245: NPC(NPCType.object, OverworldSprite.brokenHelicopter, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MAKYO_HELI", null),
	NPCID.unknown1246: NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winLumiBoss, NPCConfigFlagStyle.showIfOff, "MSG_MAKYO_LUMI_BOSS", null),
	NPCID.unknown1247: NPC(NPCType.person, OverworldSprite.talkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_ROCK_A", null),
	NPCID.unknown1248: NPC(NPCType.person, OverworldSprite.talkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_ROCK_B", null),
	NPCID.unknown1249: NPC(NPCType.person, OverworldSprite.talkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_ROCK_C", null),
	NPCID.unknown1250: NPC(NPCType.person, OverworldSprite.tenda, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_1", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1251: NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_2", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1252: NPC(NPCType.person, OverworldSprite.tendaChief, Direction.left, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_OLDMAN", "MSG_GUMI_OLDMAN_RECEIVE"),
	NPCID.unknown1253: NPC(NPCType.person, OverworldSprite.tenda, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_3", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1254: NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_4", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1255: NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_5", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1256: NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_6", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1257: NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_7", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1258: NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_SPEAKER", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1259: NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_COMEBACK", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1260: NPC(NPCType.person, OverworldSprite.talkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_TALKERSTONE", null),
	NPCID.unknown1261: NPC(NPCType.person, OverworldSprite.tenda, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GUMI_SPEAKER_NEW", "MSG_GUMI_RECEIVE"),
	NPCID.unknown1262: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown1263: NPC(NPCType.object, OverworldSprite.rock, Direction.down, ActionScript.animMapObjStill, EventFlag.gumiCaveOpen, NPCConfigFlagStyle.showIfOff, null, null),
	NPCID.unknown1264: NPC(NPCType.object, OverworldSprite.can, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1265: NPC(NPCType.object, OverworldSprite.mailbox, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1266: NPC(NPCType.object, OverworldSprite.weirdJunk, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1267: NPC(NPCType.object, OverworldSprite.spaSign, Direction.down, ActionScript.unknown684, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_READ_GMIM0_SIGN2", null),
	NPCID.unknown1268: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.left, ActionScript.animPeopleTBack, EventFlag.dkfdDoseiSt1Appear, NPCConfigFlagStyle.showIfOn, "MSG_DKFD_DOSEI", null),
	NPCID.unknown1269: NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.down, ActionScript.animMapObjStill, EventFlag.dkfdAndonutAAppear, NPCConfigFlagStyle.showIfOn, "MSG_DKFD_ANDONUT_A", null),
	NPCID.unknown1270: NPC(NPCType.person, OverworldSprite.drAndonuts, Direction.left, ActionScript.animMapObjStill, EventFlag.dkfdAndonutBAppear, NPCConfigFlagStyle.showIfOn, "MSG_DKFD_END_ANDONUT_2", null),
	NPCID.unknown1271: NPC(NPCType.person, OverworldSprite.appleKid, Direction.down, ActionScript.unknown767, EventFlag.dkfdAppleAAppear, NPCConfigFlagStyle.showIfOn, "MSG_DKFD_END_APPLEKID", null),
	NPCID.unknown1272: NPC(NPCType.person, OverworldSprite.mrSaturn, Direction.right, ActionScript.animPeopleTBack, EventFlag.dkfdDoseiAAppear, NPCConfigFlagStyle.showIfOn, "MSG_DKFD_END_DOSEI", null),
	NPCID.unknown1273: NPC(NPCType.object, OverworldSprite.brokenPhaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.winManimani, NPCConfigFlagStyle.showIfOn, "MSG_DKFD_SKYWALKER", null),
	NPCID.unknown1274: NPC(NPCType.object, OverworldSprite.phaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.dkfdSt2Appear, NPCConfigFlagStyle.showIfOn, "MSG_SPACETNL", null),
	NPCID.unknown1275: NPC(NPCType.object, OverworldSprite.phaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.dkfdSt3Appear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1276: NPC(NPCType.person, OverworldSprite.yourSanctuaryPointBoss, Direction.down, ActionScript.unknown693, EventFlag.winFireBoss, NPCConfigFlagStyle.showIfOff, "MSG_DKFD_FIRE_BOSS", null),
	NPCID.unknown1277: NPC(NPCType.person, OverworldSprite.nessLyingDown, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1278: NPC(NPCType.person, OverworldSprite.paula, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1279: NPC(NPCType.person, OverworldSprite.jeff, Direction.down, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1280: NPC(NPCType.person, OverworldSprite.poo, Direction.left, ActionScript.animMapObjStill, EventFlag.firePartyAppear, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1281: NPC(NPCType.person, OverworldSprite.flame, Direction.down, ActionScript.unknown693, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1282: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_SHOP_GUMI_B_DRUG", null),
	NPCID.unknown1283: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.unknown771, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_A", null),
	NPCID.unknown1284: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_BOSS", null),
	NPCID.unknown1285: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_C", null),
	NPCID.unknown1286: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_D", null),
	NPCID.unknown1287: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_E", null),
	NPCID.unknown1288: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_F", null),
	NPCID.unknown1289: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.left, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_G", null),
	NPCID.unknown1290: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_H", null),
	NPCID.unknown1291: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_I", null),
	NPCID.unknown1292: NPC(NPCType.person, OverworldSprite.lilTalkingStone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_ROCK_INFO_POWER", null),
	NPCID.unknown1293: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_K", null),
	NPCID.unknown1294: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_L", null),
	NPCID.unknown1295: NPC(NPCType.person, OverworldSprite.lilToucanPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_BIRD_PHONE", null),
	NPCID.unknown1296: NPC(NPCType.person, OverworldSprite.lilToucanPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_BIRD_PHONE", null),
	NPCID.unknown1297: NPC(NPCType.person, OverworldSprite.lilToucanPhone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_BIRD_PHONE", null),
	NPCID.unknown1298: NPC(NPCType.person, OverworldSprite.lilTenda, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_DKFD_GUMI_HOTEL", null),
	NPCID.unknown1299: NPC(NPCType.object, OverworldSprite.woodBox, Direction.down, ActionScript.animMapObjStill, EventFlag.dkfdDoorDisappear, NPCConfigFlagStyle.showIfOff, null, "MSG_DKFD_GUMI_DOOR_RECEIVE"),
	NPCID.unknown1300: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_READ_DKFD_GUMI_1", null),
	NPCID.unknown1301: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_READ_DKFD_GUMI_3", null),
	NPCID.unknown1302: NPC(NPCType.object, OverworldSprite.sign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_READ_DKFD_GUMI_3", null),
	NPCID.unknown1303: NPC(NPCType.object, OverworldSprite.badPaletteFountain, Direction.down, ActionScript.unknown672, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1304: NPC(NPCType.object, OverworldSprite.redFountainLostUnderworld, Direction.down, ActionScript.unknown673, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1305: NPC(NPCType.object, OverworldSprite.badPaletteFountain, Direction.down, ActionScript.unknown674, EventFlag.none, NPCConfigFlagStyle.showAlways, null, null),
	NPCID.unknown1306: NPC(NPCType.object, OverworldSprite.robotBroken, Direction.right, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1307: NPC(NPCType.object, OverworldSprite.robotBroken, Direction.left, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1308: NPC(NPCType.object, OverworldSprite.robotBroken, Direction.left, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1309: NPC(NPCType.object, OverworldSprite.lyingDownRobotNess, Direction.right, ActionScript.animMapObjStill, EventFlag.winGiegu, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1310: NPC(NPCType.object, OverworldSprite.phaseDistorter, Direction.down, ActionScript.animMapObjStill, EventFlag.stepPast, NPCConfigFlagStyle.showIfOn, "MSG_SPACETNL", null),
	NPCID.unknown1311: NPC(NPCType.person, OverworldSprite.none, Direction.down, ActionScript.unknown000, EventFlag.unknown0340, NPCConfigFlagStyle.showIfOn, null, null),
	NPCID.unknown1312: NPC(NPCType.person, OverworldSprite.weirdHornedGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_B", null),
	NPCID.unknown1313: NPC(NPCType.person, OverworldSprite.flyingMan, Direction.right, ActionScript.animPeopleWalk1, EventFlag.flyingMan1, NPCConfigFlagStyle.showIfOff, "MSG_MGKT_FLYINGMAN_1", null),
	NPCID.unknown1314: NPC(NPCType.person, OverworldSprite.flyingMan, Direction.down, ActionScript.animPeopleTBack, EventFlag.flyingMan2, NPCConfigFlagStyle.showIfOff, "MSG_MGKT_FLYINGMAN_2", null),
	NPCID.unknown1315: NPC(NPCType.person, OverworldSprite.flyingMan, Direction.right, ActionScript.animPeopleWalk1, EventFlag.flyingMan3, NPCConfigFlagStyle.showIfOff, "MSG_MGKT_FLYINGMAN_3", null),
	NPCID.unknown1316: NPC(NPCType.person, OverworldSprite.flyingMan, Direction.up, ActionScript.animPeopleWalk1, EventFlag.flyingMan4, NPCConfigFlagStyle.showIfOff, "MSG_MGKT_FLYINGMAN_4", null),
	NPCID.unknown1317: NPC(NPCType.person, OverworldSprite.flyingMan, Direction.right, ActionScript.animPeopleTBack, EventFlag.flyingMan5, NPCConfigFlagStyle.showIfOff, "MSG_MGKT_FLYINGMAN_5", null),
	NPCID.unknown1318: NPC(NPCType.person, OverworldSprite.weirdHornedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_C", null),
	NPCID.unknown1319: NPC(NPCType.person, OverworldSprite.chick, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_BIRD_A", null),
	NPCID.unknown1320: NPC(NPCType.object, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_CASHDISPENSER", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown1321: NPC(NPCType.person, OverworldSprite.invisible2, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown1322: NPC(NPCType.person, OverworldSprite.rabbit, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_A", null),
	NPCID.unknown1323: NPC(NPCType.person, OverworldSprite.littleKidInBlue, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_D", null),
	NPCID.unknown1324: NPC(NPCType.person, OverworldSprite.urbanZombie, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_G", null),
	NPCID.unknown1325: NPC(NPCType.person, OverworldSprite.masterBelch, Direction.right, ActionScript.animPeopleWalk1Narrow, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_H", null),
	NPCID.unknown1326: NPC(NPCType.person, OverworldSprite.manlyFish, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_J", null),
	NPCID.unknown1327: NPC(NPCType.person, OverworldSprite.kidInBaseballHelmet, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_K_1", null),
	NPCID.unknown1328: NPC(NPCType.person, OverworldSprite.kidInDerbyHat, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_K_2", null),
	NPCID.unknown1329: NPC(NPCType.person, OverworldSprite.happyGirlInRed, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_K_3", null),
	NPCID.unknown1330: NPC(NPCType.person, OverworldSprite.picky, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_K_4", null),
	NPCID.unknown1331: NPC(NPCType.person, OverworldSprite.blondePonytailGirl, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_K_5", null),
	NPCID.unknown1332: NPC(NPCType.person, OverworldSprite.monkey, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_K_6", null),
	NPCID.unknown1333: NPC(NPCType.person, OverworldSprite.kidInDetectiveHat, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_K_7", null),
	NPCID.unknown1334: NPC(NPCType.person, OverworldSprite.rabbit, Direction.right, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_K_8", null),
	NPCID.unknown1335: NPC(NPCType.person, OverworldSprite.ness, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_L", null),
	NPCID.unknown1336: NPC(NPCType.person, OverworldSprite.chick, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_BIRD_B", null),
	NPCID.unknown1337: NPC(NPCType.person, OverworldSprite.flower, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_FLOWER", null),
	NPCID.unknown1338: NPC(NPCType.person, OverworldSprite.flower, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_FLOWER", null),
	NPCID.unknown1339: NPC(NPCType.person, OverworldSprite.flower, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_FLOWER", null),
	NPCID.unknown1340: NPC(NPCType.person, OverworldSprite.starMasterGuy, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_OLDMAN_A", null),
	NPCID.unknown1341: NPC(NPCType.person, OverworldSprite.starMasterGuy, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_OLDMAN_B", null),
	NPCID.unknown1342: NPC(NPCType.person, OverworldSprite.mom, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_E", null),
	NPCID.unknown1343: NPC(NPCType.person, OverworldSprite.tracy, Direction.right, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_F", null),
	NPCID.unknown1344: NPC(NPCType.person, OverworldSprite.king, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_I", null),
	NPCID.unknown1345: NPC(NPCType.person, OverworldSprite.pokey, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_POKEY", null),
	NPCID.unknown1346: NPC(NPCType.person, OverworldSprite.everdred, Direction.down, ActionScript.animPeopleTBack, EventFlag.mgktTonchikiDisappear, NPCConfigFlagStyle.showIfOff, "MSG_MGKT_TONCHIKI", null),
	NPCID.unknown1347: NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadA, NPCConfigFlagStyle.showIfOn, "MSG_MGKT_TOMB1", null),
	NPCID.unknown1348: NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadB, NPCConfigFlagStyle.showIfOn, "MSG_MGKT_TOMB2", null),
	NPCID.unknown1349: NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadC, NPCConfigFlagStyle.showIfOn, "MSG_MGKT_TOMB3", null),
	NPCID.unknown1350: NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadD, NPCConfigFlagStyle.showIfOn, "MSG_MGKT_TOMB4", null),
	NPCID.unknown1351: NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.sysFlyingManDeadE, NPCConfigFlagStyle.showIfOn, "MSG_MGKT_TOMB5", null),
	NPCID.unknown1352: NPC(NPCType.object, OverworldSprite.crossGravestone, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MGKT_TOMB6", null),
	NPCID.unknown1353: NPC(NPCType.object, OverworldSprite.weirdTailThing, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_CHECK_MGKT_DOKAN", null),
	NPCID.unknown1354: NPC(NPCType.person, OverworldSprite.kraken, Direction.right, ActionScript.unknown602, EventFlag.fmonKraken2ADisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_KRAKEN2_A", null),
	NPCID.unknown1355: NPC(NPCType.person, OverworldSprite.kraken, Direction.left, ActionScript.unknown602, EventFlag.fmonKraken2BDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_KRAKEN2_B", null),
	NPCID.unknown1356: NPC(NPCType.person, OverworldSprite.kraken, Direction.right, ActionScript.unknown602, EventFlag.fmonKraken2CDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_KRAKEN2_C", null),
	NPCID.unknown1357: NPC(NPCType.object, OverworldSprite.weirdTailThing, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_CHECK_MGKT_DOKAN_B", null),
	NPCID.unknown1358: NPC(NPCType.object, OverworldSprite.evilManiMani, Direction.down, ActionScript.animPeopleWalk0, EventFlag.winOscar, NPCConfigFlagStyle.showIfOff, "MSG_MGKT_OSCAR", "MSG_MANIMANI_RECEIVE"),
	NPCID.unknown1359: NPC(NPCType.person, OverworldSprite.jackie, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_BAR_MASTER", null),
	NPCID.unknown1360: NPC(NPCType.person, OverworldSprite.bigSmileLady, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_BAR_BETTY", null),
	NPCID.unknown1361: NPC(NPCType.person, OverworldSprite.drinkingGuy, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_BAR_A", null),
	NPCID.unknown1362: NPC(NPCType.person, OverworldSprite.blondeLadyRedDress, Direction.up, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_BAR_B", null),
	NPCID.unknown1363: NPC(NPCType.person, OverworldSprite.roboPump, Direction.up, ActionScript.unknown597, EventFlag.fmonMoonBDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_MOON_B", null),
	NPCID.unknown1364: NPC(NPCType.person, OverworldSprite.nurse, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_HOSPITAL_USHER", null),
	NPCID.unknown1365: NPC(NPCType.person, OverworldSprite.doctor, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_HOSPITAL_DOCTOR", null),
	NPCID.unknown1366: NPC(NPCType.person, OverworldSprite.abstractArt, Direction.right, ActionScript.unknown597, EventFlag.fmonMoonCDisappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_MOON_C", null),
	NPCID.unknown1367: NPC(NPCType.person, OverworldSprite.healer, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HEALER_MOON", null),
	NPCID.unknown1368: NPC(NPCType.person, OverworldSprite.blondeHappyLady, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_E", null),
	NPCID.unknown1369: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.up, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_MUSEUM_A", null),
	NPCID.unknown1370: NPC(NPCType.person, OverworldSprite.foursideMuseumGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_MUSEUM_B", null),
	NPCID.unknown1371: NPC(NPCType.person, OverworldSprite.roboPump, Direction.up, ActionScript.unknown597, EventFlag.fmonMoonB2Disappear, NPCConfigFlagStyle.showIfOff, "MSG_FMON_MOON_B_2", null),
	NPCID.unknown1372: NPC(NPCType.person, OverworldSprite.sortaBaldGuyInSuit, Direction.down, ActionScript.animMapObjTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HOTEL_MOON", null),
	NPCID.unknown1373: NPC(NPCType.person, OverworldSprite.hotelAttendant, Direction.down, ActionScript.animMapObjStill, EventFlag.hotelPaperboyAppear, NPCConfigFlagStyle.showIfOn, "MSG_HOTEL_MOON_PAPERBOY", null),
	NPCID.unknown1374: NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animPeopleTBack, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_HOTEL_MOON_SHOP", null),
	NPCID.unknown1375: NPC(NPCType.object, OverworldSprite.atm, Direction.right, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_CD", "MSG_GLOBAL_CD_RECEIVE"),
	NPCID.unknown1376: NPC(NPCType.person, OverworldSprite.telephone, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_GLOBAL_TELEPHONE", null),
	NPCID.unknown1377: NPC(NPCType.person, OverworldSprite.mrT, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_VISIBLEMAN", null),
	NPCID.unknown1378: NPC(NPCType.person, OverworldSprite.badPaletteGuyOnettNight, Direction.down, ActionScript.animPeopleWalk1, EventFlag.moonInvisibleman, NPCConfigFlagStyle.showIfOff, "MSG_MOON_INVISIBLEMAN", null),
	NPCID.unknown1379: NPC(NPCType.person, OverworldSprite.sneakyGuyWithAHat, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_A", null),
	NPCID.unknown1380: NPC(NPCType.person, OverworldSprite.surfer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_B", null),
	NPCID.unknown1381: NPC(NPCType.person, OverworldSprite.beachLady, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_C", null),
	NPCID.unknown1382: NPC(NPCType.person, OverworldSprite.toughGuyWithSunglasses, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_D", null),
	NPCID.unknown1383: NPC(NPCType.person, OverworldSprite.darkHairedGuyInSuit, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_F", null),
	NPCID.unknown1384: NPC(NPCType.person, OverworldSprite.unassumingLocalGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_G", null),
	NPCID.unknown1385: NPC(NPCType.person, OverworldSprite.nerdyRedHairedGuy, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_H", null),
	NPCID.unknown1386: NPC(NPCType.person, OverworldSprite.scuzzyGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_J_NUMBERMAN_B", null),
	NPCID.unknown1387: NPC(NPCType.person, OverworldSprite.chineseGirl, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_K", null),
	NPCID.unknown1388: NPC(NPCType.person, OverworldSprite.punkGuy, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_L", null),
	NPCID.unknown1389: NPC(NPCType.person, OverworldSprite.bodyguard, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_M", null),
	NPCID.unknown1390: NPC(NPCType.person, OverworldSprite.shyGuy, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_N", null),
	NPCID.unknown1391: NPC(NPCType.person, OverworldSprite.blondeGuyInASuit, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_O", null),
	NPCID.unknown1392: NPC(NPCType.person, OverworldSprite.orangeHairedNerdKid, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_P", null),
	NPCID.unknown1393: NPC(NPCType.person, OverworldSprite.redClothesPerson, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_Q", null),
	NPCID.unknown1394: NPC(NPCType.person, OverworldSprite.jamaicanGuy, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_I", null),
	NPCID.unknown1395: NPC(NPCType.person, OverworldSprite.monotoli, Direction.up, ActionScript.animMapObjStill, EventFlag.moonMonotolyDisappear, NPCConfigFlagStyle.showIfOff, "MSG_MOON_MONOTOLY", null),
	NPCID.unknown1396: NPC(NPCType.person, OverworldSprite.shipCaptain, Direction.down, ActionScript.animMapObjStill, EventFlag.moonRDisappear, NPCConfigFlagStyle.showIfOff, "MSG_MOON_R", null),
	NPCID.unknown1397: NPC(NPCType.person, OverworldSprite.surfer, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_S", null),
	NPCID.unknown1398: NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_T", null),
	NPCID.unknown1399: NPC(NPCType.person, OverworldSprite.surfer, Direction.left, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_T", null),
	NPCID.unknown1400: NPC(NPCType.person, OverworldSprite.surfer, Direction.right, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_T", null),
	NPCID.unknown1401: NPC(NPCType.person, OverworldSprite.surfer, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_W", null),
	NPCID.unknown1402: NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_X", null),
	NPCID.unknown1403: NPC(NPCType.person, OverworldSprite.surfer, Direction.down, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_Y", null),
	NPCID.unknown1404: NPC(NPCType.person, OverworldSprite.surfer, Direction.up, ActionScript.animPeopleWalk1, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_Z", null),
	NPCID.unknown1405: NPC(NPCType.object, OverworldSprite.hotelSign, Direction.down, ActionScript.animMapObjStill, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_CHECK_HOTEL_KANBAN", null),
	NPCID.unknown1406: NPC(NPCType.object, OverworldSprite.evilManiMani, Direction.down, ActionScript.animPeopleWalk0, EventFlag.none, NPCConfigFlagStyle.showAlways, "MSG_MOON_MANIMANI", "MSG_MANIMANI_RECEIVE"),
	NPCID.unknown1407: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0800, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.breadRoll),
	NPCID.unknown1408: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0801, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.hamburger),
	NPCID.unknown1409: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0802, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.hamburger),
	NPCID.unknown1410: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0803, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", Money(0)),
	NPCID.unknown1411: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0804, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.canOfFruitJuice),
	NPCID.unknown1412: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0805, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.crackedBat),
	NPCID.unknown1413: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0806, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.hamburger),
	NPCID.unknown1414: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0807, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.skipSandwich),
	NPCID.unknown1415: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0808, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.coldRemedy),
	NPCID.unknown1416: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0809, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.skipSandwich),
	NPCID.unknown1417: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0810, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.teddyBear),
	NPCID.unknown1418: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0811, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.brokenMachine),
	NPCID.unknown1419: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0812, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.skipSandwich),
	NPCID.unknown1420: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0813, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.croissant),
	NPCID.unknown1421: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0814, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.luckCapsule),
	NPCID.unknown1422: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0815, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.hardHat),
	NPCID.unknown1423: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0816, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.croissant),
	NPCID.unknown1424: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0817, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.travelCharm),
	NPCID.unknown1425: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0818, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bomb),
	NPCID.unknown1426: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0819, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cupOfLifenoodles),
	NPCID.unknown1427: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0820, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.psiCaramel),
	NPCID.unknown1428: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0821, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.greatCharm),
	NPCID.unknown1429: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0822, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.croissant),
	NPCID.unknown1430: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0823, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.insecticideSpray),
	NPCID.unknown1431: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0824, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.teddyBear),
	NPCID.unknown1432: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0825, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", Money(0)),
	NPCID.unknown1433: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0826, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.skipSandwich),
	NPCID.unknown1434: NPC(NPCType.itemBox, OverworldSprite.casket, Direction.down, ActionScript.present, EventFlag.unknown0827, NPCConfigFlagStyle.showAlways, "MSG_TBOX_HITSUGI", ItemID.skipSandwichDX),
	NPCID.unknown1435: NPC(NPCType.itemBox, OverworldSprite.casket, Direction.down, ActionScript.present, EventFlag.unknown0828, NPCConfigFlagStyle.showAlways, "MSG_TBOX_HITSUGI", ItemID.silverBracelet),
	NPCID.unknown1436: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0829, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cookie),
	NPCID.unknown1437: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0830, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cookie),
	NPCID.unknown1438: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0831, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cookie),
	NPCID.unknown1439: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0832, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cookie),
	NPCID.unknown1440: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0833, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cookie),
	NPCID.unknown1441: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0834, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cookie),
	NPCID.unknown1442: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0835, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cookie),
	NPCID.unknown1443: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0836, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.brokenPipe),
	NPCID.unknown1444: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0837, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.brokenIron),
	NPCID.unknown1445: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0838, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.stunGun),
	NPCID.unknown1446: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0839, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.insecticideSpray),
	NPCID.unknown1447: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0840, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.croissant),
	NPCID.unknown1448: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0841, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.breadRoll),
	NPCID.unknown1449: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0842, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cheapBracelet),
	NPCID.unknown1450: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0843, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bottleRocket),
	NPCID.unknown1451: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0844, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.hamburger),
	NPCID.unknown1452: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0845, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.brokenTrumpet),
	NPCID.unknown1453: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0846, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.gutsCapsule),
	NPCID.unknown1454: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0847, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.brokenHarmonica),
	NPCID.unknown1455: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0848, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.psiCaramel),
	NPCID.unknown1456: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0849, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.pixiesBracelet),
	NPCID.unknown1457: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0850, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cupOfLifenoodles),
	NPCID.unknown1458: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0851, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.speedCapsule),
	NPCID.unknown1459: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0852, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.spicyJerky),
	NPCID.unknown1460: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0853, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.brokenLaser),
	NPCID.unknown1461: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0854, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.bomb),
	NPCID.unknown1462: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0855, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.hpSucker),
	NPCID.unknown1463: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0856, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.vitalCapsule),
	NPCID.unknown1464: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0857, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.calorieStick),
	NPCID.unknown1465: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0858, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.iqCapsule),
	NPCID.unknown1466: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0859, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.coinOfSlumber),
	NPCID.unknown1467: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0860, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.proteinDrink),
	NPCID.unknown1468: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0861, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bomb),
	NPCID.unknown1469: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0862, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bottleRocket),
	NPCID.unknown1470: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0863, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.rustPromoter),
	NPCID.unknown1471: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0864, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.suddenGutsPill),
	NPCID.unknown1472: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0865, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.protractor),
	NPCID.unknown1473: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0866, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.brokenSprayCan),
	NPCID.unknown1474: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0867, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.flamePendant),
	NPCID.unknown1475: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0868, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.brokenTube),
	NPCID.unknown1476: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0869, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.bagOfDragonite),
	NPCID.unknown1477: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0870, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.neutralizer),
	NPCID.unknown1478: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0871, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.brainFoodLunch),
	NPCID.unknown1479: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0872, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.cupOfLifenoodles),
	NPCID.unknown1480: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0873, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.pizza),
	NPCID.unknown1481: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0874, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.wetTowel),
	NPCID.unknown1482: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0875, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.pizza),
	NPCID.unknown1483: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0876, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.ruler),
	NPCID.unknown1484: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0877, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.hamburger),
	NPCID.unknown1485: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0878, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.proteinDrink),
	NPCID.unknown1486: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0879, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.hamburger),
	NPCID.unknown1487: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0880, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.picnicLunch),
	NPCID.unknown1488: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0881, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.hamburger),
	NPCID.unknown1489: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0882, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bigBottleRocket),
	NPCID.unknown1490: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0883, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.doubleBurger),
	NPCID.unknown1491: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0884, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.doubleBurger),
	NPCID.unknown1492: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0885, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cupOfLifenoodles),
	NPCID.unknown1493: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0886, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.skipSandwichDX),
	NPCID.unknown1494: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0887, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.psiCaramel),
	NPCID.unknown1495: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0888, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", Money(1000)),
	NPCID.unknown1496: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0889, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.suddenGutsPill),
	NPCID.unknown1497: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0890, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.psiCaramel),
	NPCID.unknown1498: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0891, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.platinumBand2),
	NPCID.unknown1499: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0892, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.iqCapsule),
	NPCID.unknown1500: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0893, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.gutsCapsule),
	NPCID.unknown1501: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0894, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.luckCapsule),
	NPCID.unknown1502: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0895, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.coinOfDefense),
	NPCID.unknown1503: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0896, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.secretHerb),
	NPCID.unknown1504: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0897, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.teddyBear),
	NPCID.unknown1505: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0898, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.superBomb),
	NPCID.unknown1506: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0899, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bigBottleRocket),
	NPCID.unknown1507: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0900, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.croissant),
	NPCID.unknown1508: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0901, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.calorieStick),
	NPCID.unknown1509: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0902, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.picnicLunch),
	NPCID.unknown1510: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0903, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bomb),
	NPCID.unknown1511: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0904, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.carrotKey),
	NPCID.unknown1512: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0905, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.suddenGutsPill),
	NPCID.unknown1513: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0906, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.vitalCapsule),
	NPCID.unknown1514: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0907, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.nightPendant),
	NPCID.unknown1515: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0908, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.handbagStrap),
	NPCID.unknown1516: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0909, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.doubleBurger),
	NPCID.unknown1517: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0910, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.proteinDrink),
	NPCID.unknown1518: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0911, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.secretHerb),
	NPCID.unknown1519: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0912, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.rustPromoterDX),
	NPCID.unknown1520: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0913, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.brokenBazooka),
	NPCID.unknown1521: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0914, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.brokenSprayCan),
	NPCID.unknown1522: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0915, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.croissant),
	NPCID.unknown1523: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0916, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.brokenIron),
	NPCID.unknown1524: NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.present, EventFlag.unknown0917, NPCConfigFlagStyle.showAlways, "MSG_TBOX_HITSUGI", ItemID.bagOfDragonite),
	NPCID.unknown1525: NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.present, EventFlag.unknown0918, NPCConfigFlagStyle.showAlways, "MSG_TBOX_HITSUGI", ItemID.speedCapsule),
	NPCID.unknown1526: NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.present, EventFlag.unknown0919, NPCConfigFlagStyle.showAlways, "MSG_TBOX_HITSUGI", ItemID.viper),
	NPCID.unknown1527: NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.present, EventFlag.unknown0920, NPCConfigFlagStyle.showAlways, "MSG_TBOX_HITSUGI", ItemID.diamondBand),
	NPCID.unknown1528: NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.present, EventFlag.unknown0921, NPCConfigFlagStyle.showAlways, "MSG_TBOX_HITSUGI", ItemID.cupOfLifenoodles),
	NPCID.unknown1529: NPC(NPCType.itemBox, OverworldSprite.petrifiedRoyalGuard, Direction.down, ActionScript.present, EventFlag.unknown0922, NPCConfigFlagStyle.showAlways, "MSG_TBOX_HITSUGI", ItemID.rainPendant),
	NPCID.unknown1530: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0923, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cupOfLifenoodles),
	NPCID.unknown1531: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0924, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.talismanRibbon),
	NPCID.unknown1532: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0925, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.suddenGutsPill),
	NPCID.unknown1533: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0926, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.psiCaramel),
	NPCID.unknown1534: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0927, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.molokheiyaSoup),
	NPCID.unknown1535: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0928, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.pizza),
	NPCID.unknown1536: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0929, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.superPlushBear),
	NPCID.unknown1537: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0930, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.snake),
	NPCID.unknown1538: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0931, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", Money(10)),
	NPCID.unknown1539: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0932, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.iqCapsule),
	NPCID.unknown1540: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0933, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.wetTowel),
	NPCID.unknown1541: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0934, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", Money(5)),
	NPCID.unknown1542: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0935, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.brainFoodLunch),
	NPCID.unknown1543: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0936, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.cupOfLifenoodles),
	NPCID.unknown1544: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0937, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.brainStone),
	NPCID.unknown1545: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0938, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.bottleOfWater),
	NPCID.unknown1546: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0939, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.bowlOfRiceGruel),
	NPCID.unknown1547: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0940, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.jarOfDelisauce),
	NPCID.unknown1548: NPC(NPCType.itemBox, OverworldSprite.dalaamPresent, Direction.down, ActionScript.present, EventFlag.unknown0941, NPCConfigFlagStyle.showAlways, "MSG_TBOX_TAMATEBAKO", ItemID.bottleOfWater),
	NPCID.unknown1549: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0942, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.rockCandy),
	NPCID.unknown1550: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0943, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.suddenGutsPill),
	NPCID.unknown1551: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0944, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bracerOfKings),
	NPCID.unknown1552: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0945, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.souvenirCoin),
	NPCID.unknown1553: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0946, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.rockCandy),
	NPCID.unknown1554: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0947, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.iqCapsule),
	NPCID.unknown1555: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0948, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cupOfLifenoodles),
	NPCID.unknown1556: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0949, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.banana),
	NPCID.unknown1557: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0950, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.beefJerky),
	NPCID.unknown1558: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0951, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.rabbitsFoot),
	NPCID.unknown1559: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0952, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cupOfLifenoodles),
	NPCID.unknown1560: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0953, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.rockCandy),
	NPCID.unknown1561: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0954, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.diademOfKings),
	NPCID.unknown1562: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0955, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.luckCapsule),
	NPCID.unknown1563: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0956, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.luxuryJerky),
	NPCID.unknown1564: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0957, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.iqCapsule),
	NPCID.unknown1565: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0958, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bottleOfDXWater),
	NPCID.unknown1566: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0959, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.superBomb),
	NPCID.unknown1567: NPC(NPCType.itemBox, OverworldSprite.trashCan, Direction.down, ActionScript.present, EventFlag.unknown0960, NPCConfigFlagStyle.showAlways, "MSG_TBOX_GOMIBAKO", ItemID.deathRay),
	NPCID.unknown1568: NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.present, EventFlag.unknown0961, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.brainFoodLunch),
	NPCID.unknown1569: NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.present, EventFlag.unknown0962, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.hornOfLife),
	NPCID.unknown1570: NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.present, EventFlag.unknown0963, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.seaPendant),
	NPCID.unknown1571: NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.present, EventFlag.unknown0964, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.gutsCapsule),
	NPCID.unknown1572: NPC(NPCType.itemBox, OverworldSprite.lilGiftBox, Direction.down, ActionScript.present, EventFlag.unknown0965, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cloakOfKings),
	NPCID.unknown1573: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0966, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.moonBeamGun),
	NPCID.unknown1574: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0967, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.hornOfLife),
	NPCID.unknown1575: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0968, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.cherubsBand),
	NPCID.unknown1576: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0969, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bagOfDragonite),
	NPCID.unknown1577: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0970, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.speedCapsule),
	NPCID.unknown1578: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0971, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.bagOfDragonite),
	NPCID.unknown1579: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0972, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.psiCaramel),
	NPCID.unknown1580: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0973, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.goddessBand),
	NPCID.unknown1581: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0974, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.magicantBat),
	NPCID.unknown1582: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0975, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.magicTart),
	NPCID.unknown1583: NPC(NPCType.itemBox, OverworldSprite.giftBox, Direction.down, ActionScript.present, EventFlag.unknown0976, NPCConfigFlagStyle.showAlways, "MSG_TBOX_PRESENT", ItemID.legendaryBat),
];
