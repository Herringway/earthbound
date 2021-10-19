module earthbound.commondefs;

enum MAX_ENTITIES = 30;

enum PAD_R =      0x0010;
enum PAD_L =      0x0020;
enum PAD_X =      0x0040;
enum PAD_A =      0x0080;
enum PAD_RIGHT =  0x0100;
enum PAD_LEFT =   0x0200;
enum PAD_DOWN =   0x0400;
enum PAD_UP =     0x0800;
enum PAD_START =  0x1000;
enum PAD_SELECT = 0x2000;
enum PAD_Y =      0x4000;
enum PAD_B =      0x8000;


enum PATH_FB = 0xFB;
enum PATH_FC = 0xFC;
enum PATH_UNWALKABLE = 0xFD;
enum PATH_MAYBE_START = 0xFE; // Is this even correct?
enum PATH_START = 0xFF; // Is this even correct?

enum JPN = false;
enum USA = true;
enum USAPROTOTYPE = false;


enum AFFLICTION_GROUP_COUNT = 7;

enum PLAYER_CHAR_COUNT = 4;
enum NONPLAYER_CHAR_COUNT = 2;
enum TOTAL_PARTY_COUNT = PLAYER_CHAR_COUNT + NONPLAYER_CHAR_COUNT;
enum FIRST_ENEMY_INDEX = TOTAL_PARTY_COUNT + 2; //the +2 might be space for bad "party members" like the tiny lil ghost. unsure.


enum OBJECT_TICK_DISABLED = 0x8000;
enum OBJECT_MOVE_DISABLED = 0x4000;

enum WalkingStyle {
	Normal = 0,

	Bicycle = 3,
	Ghost = 4,

	Slower = 6,
	Ladder = 7,
	Rope = 8,

	Slowest = 10,

	Escalator = 12,
	Stairs = 13,
}

enum TeleportStyle {
	None = 0,
	PSIAlpha = 1,
	PSIBeta = 2,
	Instant = 3,
	PSIBetter = 4,
	Unknown = 5
}

enum Direction {
	Up = 0,
	UpRight = 1,
	Right = 2,
	DownRight = 3,
	Down = 4,
	DownLeft = 5,
	Left = 6,
	UpLeft = 7,
	None = 8,
}

enum DirectionMask {
	Up = 1<<0,
	UpRight = 1<<1,
	Right = 1<<2,
	DownRight = 1<<3,
	Down = 1<<4,
	DownLeft = 1<<5,
	Left = 1<<6,
	UpLeft = 1<<7,
}

enum Music {
	None = 0,
	TeleportOut = 13,
}

struct Game_State {
	ubyte[12] mother2PlayerName;
	ubyte[24] earthboundPlayerName;
	ubyte[6] petName;
	ubyte[6] favouriteFood;
	ubyte[12] favouriteThing;
	uint moneyCarried;
	uint bankBalance;
	ubyte partyPSI;
	ubyte partyNPC1;
	ubyte partyNPC2;
	ushort partyNPC1HP;
	ushort partyNPC2HP;
	ubyte partyStatus;
	ubyte partyNPC1Copy;
	ubyte partyNPC2Copy;
	ushort partyNPC1HPCopy;
	ushort partyNPC2HPCopy;
	uint walletScratch;
	ubyte[36] escargoExpressItems;
	ubyte[6] partyMembers;
	ushort unknown80;
	short leaderXCoordinate;
	ushort unknown84;
	short leaderYCoordinate;
	ushort unknown88;
	ushort leaderDirection;
	ushort troddenTileType;
	ushort walkingStyle;
	ushort unknown90;
	ushort unknown92;
	ushort currentPartyMembers;
	ubyte[6] unknown96;
	ubyte[6] playerControlledPartyMembers;
	ubyte[12] unknownA2;
	ubyte partyCount;
	ubyte playerControlledPartyMemberCount;
	ushort unknownB0;
	ushort unknownB2;
	ubyte[2] unknownB4;
	ubyte[3] unknownB6;
	ubyte[3] unknownB8;
	ubyte autoFightEnable;
	ushort exitMouseXCoordinate;
	ushort exitMouseYCoordinate;
	ubyte textSpeed;
	ubyte soundSetting;
	ubyte unknownC3;
	ubyte[4] unknownC4;
	ubyte[12] unknownC8;
	PhotoState[32] savedPhotoStates;
	uint timer;
	ubyte textFlavour;
}
struct PartyCharacter {
	static if (JPN) {
		ubyte[4] name;
	} else {
		ubyte[5] name;
	}
	ubyte level;
	uint exp;
	ushort max_hp;
	ushort max_pp;
	ubyte[AFFLICTION_GROUP_COUNT] afflictions;
	ubyte offense;
	ubyte defense;
	ubyte speed;
	ubyte guts;
	ubyte luck;
	ubyte vitality;
	ubyte iq;
	ubyte base_offense;
	ubyte base_defense;
	ubyte base_speed;
	ubyte base_guts;
	ubyte base_luck;
	ubyte base_vitality;
	ubyte base_iq;
	ubyte[14] items;
	ubyte[4] equipment;
	ushort unknown53;
	ushort unknown55;
	ushort unknown57;
	ushort unknown59;
	ushort position_index;
	ushort unknown63;
	ushort unknown65;
	ushort unknown67;
	ushort current_hp;
	ushort current_hp_target;
	ushort unknown73;
	ushort current_pp;
	ushort current_pp_target;
	ushort hp_pp_window_options;
	ubyte miss_rate;
	ubyte fire_resist;
	ubyte freeze_resist;
	ubyte flash_resist;
	ubyte paralysis_resist;
	ubyte hypnosis_brainshock_resist;
	ubyte boosted_speed;
	ubyte boosted_guts;
	ubyte boosted_vitality;
	ubyte boosted_iq;
	ubyte boosted_luck;
	ubyte unknown92;
	ubyte unknown93;
	ubyte unknown94;
}


struct PhotoState {
	ushort unknown;
	ubyte[6] partyMembers;
}

struct WinStat {
    short   next;                 // [00]
    short   prev;                 // [02]
    short   window_id;            // [04]
    short   x;                    // [06]
    short   y;                    // [08]
    short   width;                // [0A]
    short   height;               // [0C]
    short   text_x;               // [0E]
    short   text_y;               // [10]
    ubyte   num_padding;          // [12]
    ushort  tile_attr;            // [13]
    short   font;                 // [15]
    uint  result;               // [17]
    uint  argument;             // [1B]
    ushort  counter;              // [1F]
    uint  result_bak;           // [21]
    uint  argument_bak;         // [25]
    ushort  counter_bak;          // [29]
    short   current_option;       // [2B]
    short   option_count;         // [2D]
    short   selected_option;      // [2F]
    short   menu_columns;         // [31]
    short   menu_page;            // [33]
    ushort *tilemap_buffer;       // [35] 16-bit pointer
    void function(short) menu_callback; // [37] 32-bit pointer
    ubyte   title_id;             // [3B]
    ubyte[32]   title;            // [3C]
}

struct MenuOpt {
    short  field00;     // [00]
    short  next;        // [02]
    short  prev;        // [04]
    short  page;        // [06]
    short  text_x;      // [08]
    short  text_y;      // [0A]
    short  field0C;     // [0C]
    ubyte  sfx;         // [0E]
    ubyte *script;      // [0F] 32-bit pointer
    ubyte[25]  label;   // [13]
    ubyte  pixel_align; // [2C]
}
struct VecYX {
    short y;
    short x;
}

struct Pather {
    int    from_offscreen; // [00] Starts off-screen flag
    VecYX  hitbox;         // [02] ??? some sort of hitbox??? (Old notes, I have no idea why I labeled this "hitbox")
    VecYX  origin;         // [06] Origin point in the collision map?
    int    field0A;        // [0A] ??? unknown index
    VecYX *points;         // [0C] Goal points
    int    point_count;    // [0E] Amount of goal points
    int    obj_index;      // [10] Object index
}

struct PathCtx {
    // Up until offset 0x78 is unused??

    VecYX  radius;         // [78] Pathfinder radius
    VecYX[8]  targets_pos; // [7C] Positions for all targets (row, col)
    int    target_count;   // [9C] Amount of targets
    int    pather_count;   // [9E] Amount of pathers
    Pather[8] pathers;     // [A0] Data for all pathers
}

struct PlayerPositionBufferEntry {
	short x_coord;
	short y_coord;
	short tile_flags;
	short walking_style;
	short direction;
	short unknown10;
}

struct Unknown4DD6 {
	ubyte[4] unknown0; //0
	ubyte[4] unknown4; //4
	ubyte[4] unknown8; //8
	ubyte[4] unknown12; //12
	ubyte[4] unknown16; //16
	ubyte[4] unknown20; //20
	ubyte[4] unknown24; //24
	ubyte[356] unknown28; //28
	ubyte[64] unknown384; //384
}

struct QueuedInteraction {
	ushort type; //0
	union { //2
		void* text_ptr;
		void* door_ptr;
	}
}
