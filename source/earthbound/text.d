module earthbound.text;

import earthbound.actionscripts;
import earthbound.commondefs;

const(ubyte)* getTextBlock(string label) {
	import std.experimental.logger : tracef;
	tracef("Looking for text: %s", label);
	static immutable ubyte[1] r = [2];
	return &r[0];
}

ubyte[] textCommand(T...)(ubyte command, T args) {
	return allBytes(command, args);
}

ubyte[] textSubCommand(T...)(ubyte command, ubyte subCommand, T args) {
	return allBytes(command, subCommand, args);
}

ubyte[] EBTEXT_LINE_BREAK() {
	return textCommand(0x00);
}

ubyte[] EBTEXT_START_NEW_LINE() {
	return textCommand(0x01);
}

ubyte[] EBTEXT_END_BLOCK() {
	return textCommand(0x02);
}

ubyte[] EBTEXT_HALT_WITH_PROMPT() {
	return textCommand(0x03);
}

ubyte[] EBTEXT_SET_EVENT_FLAG(short arg) {
	return textCommand(0x04, arg);
}

ubyte[] EBTEXT_CLEAR_EVENT_FLAG(short arg) {
	return textCommand(0x05, arg);
}

ubyte[] EBTEXT_JUMP_IF_FLAG_SET(const(ubyte)* dest, short flag) {
	return textCommand(0x06, flag, dest);
}

ubyte[] EBTEXT_CHECK_EVENT_FLAG(short arg) {
	return textCommand(0x07, arg);
}

ubyte[] EBTEXT_CALL_TEXT(const(ubyte)* arg) {
	return textCommand(0x08, arg);
}

ubyte[] EBTEXT_JUMP_MULTI(T...)(T args) {
	return textCommand(0x09, cast(ubyte)T.length, args);
}

ubyte[] EBTEXT_JUMP(const(ubyte)* dest) {
	return textCommand(0x0A, dest);
}

ubyte[] EBTEXT_TEST_IF_WORKMEM_TRUE(ubyte arg) {
	return textCommand(0x0B, arg);
}

ubyte[] EBTEXT_TEST_IF_WORKMEM_FALSE(ubyte arg) {
	return textCommand(0x0C, arg);
}

ubyte[] EBTEXT_COPY_TO_ARGMEM(ubyte arg) {
	return textCommand(0x0D, arg);
}

ubyte[] EBTEXT_STORE_TO_ARGMEM(ubyte arg) {
	return textCommand(0x0E, arg);
}

ubyte[] EBTEXT_INCREMENT_WORKMEM() {
	return textCommand(0x0F);
}

ubyte[] EBTEXT_PAUSE(ubyte arg) {
	return textCommand(0x10, arg);
}

ubyte[] EBTEXT_CREATE_SELECTION_MENU() {
	return textCommand(0x11);
}

ubyte[] EBTEXT_CLEAR_TEXT_LINE() {
	return textCommand(0x12);
}

ubyte[] EBTEXT_HALT_WITHOUT_PROMPT() {
	return textCommand(0x13);
}

ubyte[] EBTEXT_HALT_WITH_PROMPT_ALWAYS() {
	return textCommand(0x14);
}

ubyte[] EBTEXT_COMPRESSED_BANK_1(ubyte arg) {
	return textCommand(0x15, arg);
}

ubyte[] EBTEXT_COMPRESSED_BANK_2(ubyte arg) {
	return textCommand(0x16, arg);
}

ubyte[] EBTEXT_COMPRESSED_BANK_3(ubyte arg) {
	return textCommand(0x17, arg);
}

ubyte[] EBTEXT_CLOSE_WINDOW() {
	return textSubCommand(0x18, 0x00);
}

ubyte[] EBTEXT_OPEN_WINDOW(ubyte arg) {
	return textSubCommand(0x18, 0x01, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_18_02() {
	return textSubCommand(0x18, 0x02);
}

ubyte[] EBTEXT_SWITCH_TO_WINDOW(ubyte arg) {
	return textSubCommand(0x18, 0x03, arg);
}

ubyte[] EBTEXT_CLOSE_ALL_WINDOWS() {
	return textSubCommand(0x18, 0x04);
}

ubyte[] EBTEXT_FORCE_TEXT_ALIGNMENT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x18, 0x05, arg, arg2);
}

ubyte[] EBTEXT_CLEAR_WINDOW() {
	return textSubCommand(0x18, 0x06);
}

ubyte[] EBTEXT_CHECK_FOR_INEQUALITY(ubyte arg, ubyte arg2) {
	return textSubCommand(0x18, 0x07, arg, arg2);
}

ubyte[] EBTEXT_UNKNOWN_CC_18_08(const(ubyte)* arg) {
	return textSubCommand(0x18, 0x08, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_18_09() {
	return textSubCommand(0x18, 0x09);
}

ubyte[] EBTEXT_SHOW_WALLET_WINDOW() {
	return textSubCommand(0x18, 0x0A);
}



ubyte[] EBTEXT_LOAD_STRING_TO_MEMORY(string str) {
	return textSubCommand(0x19, 0x02, ebString(str), 0x02);
}

ubyte[] EBTEXT_CLEAR_LOADED_STRINGS() {
	return textSubCommand(0x19, 0x04);
}

ubyte[] EBTEXT_INFLICT_STATUS(ubyte arg, ubyte arg2, ubyte arg3) {
	return textSubCommand(0x19, 0x05, arg, arg2, arg3);
}

ubyte[] EBTEXT_GET_CHARACTER_NUMBER(ubyte arg) {
	return textSubCommand(0x19, 0x10, arg);
}

ubyte[] EBTEXT_GET_CHARACTER_NAME_LETTER(ubyte arg) {
	return textSubCommand(0x19, 0x11, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_14() {
	return textSubCommand(0x19, 0x14);
}

ubyte[] EBTEXT_GET_CHARACTER_STATUS(ubyte arg, ubyte arg2) {
	return textSubCommand(0x19, 0x16, arg, arg2);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_18(ubyte arg) {
	return textSubCommand(0x19, 0x18, arg);
}

ubyte[] EBTEXT_ADD_ITEM_ID_TO_WORK_MEMORY(ubyte arg, ubyte arg2) {
	return textSubCommand(0x19, 0x19, arg, arg2);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_1A(ubyte arg) {
	return textSubCommand(0x19, 0x1A, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_1B(ubyte arg) {
	return textSubCommand(0x19, 0x1B, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_1C(ubyte arg, ubyte arg2) {
	return textSubCommand(0x19, 0x1C, arg, arg2);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_1D(ubyte arg, ubyte arg2) {
	return textSubCommand(0x19, 0x1D, arg, arg2);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_1E() {
	return textSubCommand(0x19, 0x1E);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_1F() {
	return textSubCommand(0x19, 0x1F);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_20() {
	return textSubCommand(0x19, 0x20);
}

ubyte[] EBTEXT_IS_ITEM_DRINK(ubyte arg) {
	return textSubCommand(0x19, 0x21, arg);
}

ubyte[] EBTEXT_GET_DIRECTION_OF_OBJECT_FROM_CHARACTER(ubyte arg, ubyte arg2, short arg3) {
	return textSubCommand(0x19, 0x22, arg, arg2, arg3);
}

ubyte[] EBTEXT_GET_DIRECTION_OF_OBJECT_FROM_NPC(short arg, ushort arg2, ubyte arg3) {
	return textSubCommand(0x19, 0x23, arg, arg2, arg3);
}

ubyte[] EBTEXT_GET_DIRECTION_OF_OBJECT_FROM_SPRITE(short arg, short arg2) {
	return textSubCommand(0x19, 0x24, arg, arg2);
}

ubyte[] EBTEXT_IS_ITEM_CONDIMENT(ubyte arg) {
	return textSubCommand(0x19, 0x25, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_26(ubyte arg) {
	return textSubCommand(0x19, 0x26, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_27(ubyte arg) {
	return textSubCommand(0x19, 0x27, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_19_28(ubyte arg) {
	return textSubCommand(0x19, 0x28, arg);
}



ubyte[] EBTEXT_PARTY_MEMBER_SELECTION_MENU_UNCANCELLABLE(const(ubyte)* arg, const(ubyte)* arg2, const(ubyte)* arg3, const(ubyte)* arg4, ubyte arg5) {
	return textSubCommand(0x1A, 0x01, arg, arg2, arg3, arg4, arg5);
}

ubyte[] EBTEXT_SHOW_CHARACTER_INVENTORY(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1A, 0x05, arg, arg2);
}

ubyte[] EBTEXT_DISPLAY_SHOP_MENU(ubyte arg) {
	return textSubCommand(0x1A, 0x06, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1A_07() {
	return textSubCommand(0x1A, 0x07);
}

ubyte[] EBTEXT_OPEN_PHONE_MENU() {
	return textSubCommand(0x1A, 0x0A);
}



ubyte[] EBTEXT_COPY_ACTIVE_MEMORY_TO_STORAGE() {
	return textSubCommand(0x1B, 0x00);
}

ubyte[] EBTEXT_COPY_STORAGE_MEMORY_TO_ACTIVE() {
	return textSubCommand(0x1B, 0x01);
}

ubyte[] EBTEXT_JUMP_IF_FALSE(const(ubyte)* arg) {
	return textSubCommand(0x1B, 0x02, arg);
}

ubyte[] EBTEXT_JUMP_IF_TRUE(const(ubyte)* arg) {
	return textSubCommand(0x1B, 0x03, arg);
}

ubyte[] EBTEXT_SWAP_WORKING_AND_ARG_MEMORY() {
	return textSubCommand(0x1B, 0x04);
}

ubyte[] EBTEXT_COPY_ACTIVE_MEMORY_TO_WORKING_MEMORY() {
	return textSubCommand(0x1B, 0x05);
}

ubyte[] EBTEXT_COPY_WORKING_MEMORY_TO_ACTIVE_MEMORY() {
	return textSubCommand(0x1B, 0x06);
}



ubyte[] EBTEXT_TEXT_COLOUR_EFFECTS(ubyte arg) {
	return textSubCommand(0x1C, 0x00, arg);
}

ubyte[] EBTEXT_PRINT_STAT(ubyte arg) {
	return textSubCommand(0x1C, 0x01, arg);
}

ubyte[] EBTEXT_PRINT_CHAR_NAME(ubyte arg) {
	return textSubCommand(0x1C, 0x02, arg);
}

ubyte[] EBTEXT_PRINT_CHAR(ubyte arg) {
	return textSubCommand(0x1C, 0x03, arg);
}

ubyte[] EBTEXT_OPEN_HP_PP_WINDOWS() {
	return textSubCommand(0x1C, 0x04);
}

ubyte[] EBTEXT_PRINT_ITEM_NAME(ubyte arg) {
	return textSubCommand(0x1C, 0x05, arg);
}

ubyte[] EBTEXT_PRINT_TELEPORT_DESTINATION_NAME(ubyte arg) {
	return textSubCommand(0x1C, 0x06, arg);
}

ubyte[] EBTEXT_PRINT_HORIZONTAL_TEXT_STRING(ubyte arg) {
	return textSubCommand(0x1C, 0x07, arg);
}

ubyte[] EBTEXT_PRINT_SPECIAL_GFX(ubyte arg) {
	return textSubCommand(0x1C, 0x08, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1C_09() {
	return textSubCommand(0x1C, 0x09);
}

ubyte[] EBTEXT_PRINT_NUMBER(int arg) {
	return textSubCommand(0x1C, 0x0A, arg);
}

ubyte[] EBTEXT_PRINT_MONEY_AMOUNT(int arg) {
	return textSubCommand(0x1C, 0x0B, arg);
}

ubyte[] EBTEXT_PRINT_VERTICAL_TEXT_STRING(ubyte arg) {
	return textSubCommand(0x1C, 0x0C, arg);
}

ubyte[] EBTEXT_PRINT_ACTION_USER_NAME() {
	return textSubCommand(0x1C, 0x0D);
}

ubyte[] EBTEXT_PRINT_ACTION_TARGET_NAME() {
	return textSubCommand(0x1C, 0x0E);
}

ubyte[] EBTEXT_PRINT_ACTION_AMOUNT() {
	return textSubCommand(0x1C, 0x0F);
}

ubyte[] EBTEXT_UNKNOWN_CC_1C_11(ubyte arg) {
	return textSubCommand(0x1C, 0x11, arg);
}

ubyte[] EBTEXT_PRINT_PSI_NAME(ubyte arg) {
	return textSubCommand(0x1C, 0x12, arg);
}

ubyte[] EBTEXT_DISPLAY_PSI_ANIMATION(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1C, 0x13, arg, arg2);
}

ubyte[] EBTEXT_LOAD_SPECIAL(ubyte arg) {
	return textSubCommand(0x1C, 0x14, arg);
}

ubyte[] EBTEXT_LOAD_SPECIAL_FOR_JUMP_MULTI(ubyte arg) {
	return textSubCommand(0x1C, 0x15, arg);
}



ubyte[] EBTEXT_GIVE_ITEM_TO_CHARACTER(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1D, 0x00, arg, arg2);
}

ubyte[] EBTEXT_TAKE_ITEM_FROM_CHARACTER(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1D, 0x01, arg, arg2);
}

ubyte[] EBTEXT_GET_PLAYER_HAS_INVENTORY_FULL(ubyte arg) {
	return textSubCommand(0x1D, 0x02, arg);
}

ubyte[] EBTEXT_GET_PLAYER_HAS_INVENTORY_ROOM(ubyte arg) {
	return textSubCommand(0x1D, 0x03, arg);
}

ubyte [] EBTEXT_CHECK_IF_CHARACTER_DOESNT_HAVE_ITEM(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1D, 0x04, arg, arg2);
}

ubyte [] EBTEXT_CHECK_IF_CHARACTER_HAS_ITEM(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1D, 0x05, arg, arg2);
}

ubyte[] EBTEXT_ADD_TO_ATM(int arg) {
	return textSubCommand(0x1D, 0x06, arg);
}

ubyte[] EBTEXT_TAKE_FROM_ATM(int arg) {
	return textSubCommand(0x1D, 0x07, arg);
}

ubyte[] EBTEXT_ADD_TO_WALLET(short arg) {
	return textSubCommand(0x1D, 0x08, arg);
}

ubyte[] EBTEXT_TAKE_FROM_WALLET(short arg) {
	return textSubCommand(0x1D, 0x09, arg);
}

ubyte[] EBTEXT_GET_BUY_PRICE_OF_ITEM(ubyte arg) {
	return textSubCommand(0x1D, 0x0A, arg);
}

ubyte[] EBTEXT_GET_SELL_PRICE_OF_ITEM(ubyte arg) {
	return textSubCommand(0x1D, 0x0B, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_0C(short arg) {
	return textSubCommand(0x1D, 0x0C, arg);
}

ubyte[] EBTEXT_CHARACTER_HAS_AILMENT(ubyte arg, ubyte arg2, ubyte arg3) {
	return textSubCommand(0x1D, 0x0D, arg, cast(ubyte)(arg2 + 1), arg3);
}

ubyte[] EBTEXT_GIVE_ITEM_TO_CHARACTER_B(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1D, 0x0E, arg, arg2);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_0F(short arg) {
	return textSubCommand(0x1D, 0x0F, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_10(short arg) {
	return textSubCommand(0x1D, 0x10, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_11(short arg) {
	return textSubCommand(0x1D, 0x11, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_12(short arg) {
	return textSubCommand(0x1D, 0x12, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_13(short arg) {
	return textSubCommand(0x1D, 0x13, arg);
}

ubyte[] EBTEXT_HAVE_ENOUGH_MONEY(int arg) {
	return textSubCommand(0x1D, 0x14, arg);
}

ubyte[] EBTEXT_PUT_VAL_IN_ARGMEM(short arg) {
	return textSubCommand(0x1D, 0x15, arg);
}

ubyte[] EBTEXT_HAVE_ENOUGH_MONEY_IN_ATM(int arg) {
	return textSubCommand(0x1D, 0x17, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_18(ubyte arg) {
	return textSubCommand(0x1D, 0x18, arg);
}

ubyte[] EBTEXT_HAVE_X_PARTY_MEMBERS(ubyte arg) {
	return textSubCommand(0x1D, 0x19, arg);
}

ubyte[] EBTEXT_TEST_IS_USER_TARGETTING_SELF() {
	return textSubCommand(0x1D, 0x20);
}

ubyte[] EBTEXT_GENERATE_RANDOM_NUMBER(ubyte arg) {
	return textSubCommand(0x1D, 0x21, arg);
}

ubyte[] EBTEXT_TEST_IF_EXIT_MOUSE_USABLE() {
	return textSubCommand(0x1D, 0x22);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_23(ubyte arg) {
	return textSubCommand(0x1D, 0x23, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1D_24(ubyte arg) {
	return textSubCommand(0x1D, 0x24, arg);
}



ubyte[] EBTEXT_RECOVER_HP_PERCENT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x00, arg, arg2);
}

ubyte[] EBTEXT_DEPLETE_HP_PERCENT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x01, arg, arg2);
}

ubyte[] EBTEXT_RECOVER_HP_AMOUNT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x02, arg, arg2);
}

ubyte[] EBTEXT_DEPLETE_HP_AMOUNT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x03, arg, arg2);
}

ubyte[] EBTEXT_RECOVER_PP_PERCENT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x04, arg, arg2);
}

ubyte[] EBTEXT_DEPLETE_PP_PERCENT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x05, arg, arg2);
}

ubyte[] EBTEXT_RECOVER_PP_AMOUNT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x06, arg, arg2);
}

ubyte[] EBTEXT_DEPLETE_PP_AMOUNT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x07, arg, arg2);
}

ubyte[] EBTEXT_SET_CHARACTER_LEVEL(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1E, 0x08, arg, arg2);
}

ubyte[] EBTEXT_GIVE_EXPERIENCE(ubyte arg, int arg2) {
	return textSubCommand(0x1E, 0x09, arg, arg2);
}

ubyte[] EBTEXT_BOOST_IQ(ubyte arg, short arg2) {
	return textSubCommand(0x1E, 0x0A, arg, arg2);
}

ubyte[] EBTEXT_BOOST_GUTS(ubyte arg, short arg2) {
	return textSubCommand(0x1E, 0x0B, arg, arg2);
}

ubyte[] EBTEXT_BOOST_SPEED(ubyte arg, short arg2) {
	return textSubCommand(0x1E, 0x0C, arg, arg2);
}

ubyte[] EBTEXT_BOOST_VITALITY(ubyte arg, short arg2) {
	return textSubCommand(0x1E, 0x0D, arg, arg2);
}

ubyte[] EBTEXT_BOOST_LUCK(ubyte arg, short arg2) {
	return textSubCommand(0x1E, 0x0E, arg, arg2);
}



ubyte[] EBTEXT_PLAY_MUSIC(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x00, arg, arg2);
}

ubyte[] EBTEXT_UNKNOWN_CC_1F_01(ubyte arg) {
	return textSubCommand(0x1F, 0x01, arg);
}

ubyte[] EBTEXT_PLAY_SOUND(ubyte arg) {
	return textSubCommand(0x1F, 0x02, arg);
}

ubyte[] EBTEXT_RESTORE_DEFAULT_MUSIC() {
	return textSubCommand(0x1F, 0x03);
}

ubyte[] EBTEXT_SET_TEXT_PRINTING_SOUND(ubyte arg) {
	return textSubCommand(0x1F, 0x04, arg);
}

ubyte[] EBTEXT_DISABLE_SECTOR_MUSIC_CHANGE() {
	return textSubCommand(0x1F, 0x05);
}

ubyte[] EBTEXT_ENABLE_SECTOR_MUSIC_CHANGE() {
	return textSubCommand(0x1F, 0x06);
}

ubyte[] EBTEXT_APPLY_MUSIC_EFFECT(ubyte arg) {
	return textSubCommand(0x1F, 0x07, arg);
}

ubyte[] EBTEXT_ADD_PARTY_MEMBER(ubyte arg) {
	return textSubCommand(0x1F, 0x11, arg);
}

ubyte[] EBTEXT_REMOVE_PARTY_MEMBER(ubyte arg) {
	return textSubCommand(0x1F, 0x12, arg);
}

ubyte[] EBTEXT_CHANGE_CHARACTER_DIRECTION(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x13, arg, arg2);
}

ubyte[] EBTEXT_CHANGE_PARTY_DIRECTION(ubyte arg) {
	return textSubCommand(0x1F, 0x14, arg);
}

ubyte[] EBTEXT_GENERATE_ACTIVE_SPRITE(short arg, short arg2, ubyte arg3) {
	return textSubCommand(0x1F, 0x15, arg, arg2, arg3);
}

ubyte[] EBTEXT_CHANGE_TPT_ENTRY_DIRECTION(short arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x16, arg, arg2);
}

ubyte[] EBTEXT_CREATE_ENTITY(short arg, short arg2, ubyte arg3) {
	return textSubCommand(0x1F, 0x17, arg, arg2, arg3);
}

ubyte[] EBTEXT_CREATE_FLOATING_SPRITE_NEAR_TPT_ENTRY(short arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x1A, arg, arg2);
}

ubyte[] EBTEXT_DELETE_FLOATING_SPRITE_NEAR_TPT_ENTRY(short arg) {
	return textSubCommand(0x1F, 0x1B, arg);
}

ubyte[] EBTEXT_CREATE_FLOATING_SPRITE_NEAR_CHARACTER(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x1C, arg, arg2);
}

ubyte[] EBTEXT_DELETE_FLOATING_SPRITE_NEAR_CHARACTER(ubyte arg) {
	return textSubCommand(0x1F, 0x1D, arg);
}

ubyte[] EBTEXT_DELETE_TPT_INSTANCE(short arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x1E, arg, arg2);
}

ubyte[] EBTEXT_DELETE_GENERATED_SPRITE(short arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x1F, arg, arg2);
}

ubyte[] EBTEXT_TRIGGER_PSI_TELEPORT(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x20, arg, arg2);
}

ubyte[] EBTEXT_TELEPORT_TO(ubyte arg) {
	return textSubCommand(0x1F, 0x21, arg);
}

ubyte[] EBTEXT_TRIGGER_BATTLE(short arg) {
	return textSubCommand(0x1F, 0x23, arg);
}

ubyte[] EBTEXT_USE_NORMAL_FONT() {
	return textSubCommand(0x1F, 0x30);
}

ubyte[] EBTEXT_USE_MR_SATURN_FONT() {
	return textSubCommand(0x1F, 0x31);
}

ubyte[] EBTEXT_TRIGGER_EVENT(ubyte arg) {
	return textSubCommand(0x1F, 0x41, arg);
}

ubyte[] EBTEXT_DISABLE_CONTROLLER_INPUT() {
	return textSubCommand(0x1F, 0x50);
}

ubyte[] EBTEXT_ENABLE_CONTROLLER_INPUT() {
	return textSubCommand(0x1F, 0x51);
}

ubyte[] EBTEXT_CREATE_NUMBER_SELECTOR(ubyte arg) {
	return textSubCommand(0x1F, 0x52, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1F_60() {
	return textSubCommand(0x1F, 0x60);
}

ubyte[] EBTEXT_TRIGGER_MOVEMENT_CODE() {
	return textSubCommand(0x1F, 0x61);
}

ubyte[] EBTEXT_UNKNOWN_CC_1F_62(ubyte arg) {
	return textSubCommand(0x1F, 0x62, arg);
}

ubyte[] EBTEXT_SCREEN_RELOAD_PTR(const(ubyte)* arg) {
	return textSubCommand(0x1F, 0x63, arg);
}

ubyte[] EBTEXT_DELETE_ALL_NPCS() {
	return textSubCommand(0x1F, 0x64);
}

ubyte[] EBTEXT_DELETE_FIRST_NPC() {
	return textSubCommand(0x1F, 0x65);
}

ubyte[] EBTEXT_ACTIVATE_HOTSPOT(ubyte arg, ubyte arg2, const(ubyte)* arg3) {
	return textSubCommand(0x1F, 0x66, arg, arg2, arg3);
}

ubyte[] EBTEXT_DEACTIVATE_HOTSPOT(ubyte arg) {
	return textSubCommand(0x1F, 0x67, arg);
}

ubyte[] EBTEXT_STORE_COORDINATES_TO_MEMORY() {
	return textSubCommand(0x1F, 0x68);
}

ubyte[] EBTEXT_TELEPORT_TO_STORED_COORDINATES() {
	return textSubCommand(0x1F, 0x69);
}

ubyte[] EBTEXT_REALIZE_PSI(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x71, arg, arg2);
}

ubyte[] EBTEXT_EQUIP_ITEM_TO_CHARACTER(ubyte arg, ubyte arg2) {
	return textSubCommand(0x1F, 0x83, arg, arg2);
}

ubyte[] EBTEXT_SET_TPT_DIRECTION_UP() {
	return textSubCommand(0x1F, 0xA0);
}

ubyte[] EBTEXT_SET_TPT_DIRECTION_DOWN() {
	return textSubCommand(0x1F, 0xA1);
}

ubyte[] EBTEXT_UNKNOWN_CC_1F_A2() {
	return textSubCommand(0x1F, 0xA2);
}

ubyte[] EBTEXT_SAVE_GAME() {
	return textSubCommand(0x1F, 0xB0);
}

ubyte[] EBTEXT_JUMP_MULTI2(T...)(T args) {
	return textSubCommand(0x1F, 0xC0, cast(ubyte)T.length, args);
}

ubyte[] EBTEXT_TRY_FIX_ITEM(ubyte arg) {
	return textSubCommand(0x1F, 0xD0, arg);
}

ubyte[] EBTEXT_GET_DIRECTION_OF_NEARBY_TRUFFLE() {
	return textSubCommand(0x1F, 0xD1);
}

ubyte[] EBTEXT_SUMMON_WANDERING_PHOTOGRAPHER(ubyte arg) {
	return textSubCommand(0x1F, 0xD2, arg);
}

ubyte[] EBTEXT_TRIGGER_TIMED_EVENT(ubyte arg) {
	return textSubCommand(0x1F, 0xD3, arg);
}

ubyte[] EBTEXT_CHANGE_MAP_PALETTE(short arg, ubyte arg2) {
	return textSubCommand(0x1F, 0xE1, arg, arg2);
}

ubyte[] EBTEXT_CHANGE_GENERATED_SPRITE_DIRECTION(short arg, ubyte arg2) {
	return textSubCommand(0x1F, 0xE4, arg, arg2);
}

ubyte[] EBTEXT_SET_PLAYER_LOCK(ubyte arg) {
	return textSubCommand(0x1F, 0xE5, arg);
}

ubyte[] EBTEXT_DELAY_TPT_APPEARANCE(short arg) {
	return textSubCommand(0x1F, 0xE6, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1F_E7(short arg) {
	return textSubCommand(0x1F, 0xE7, arg);
}

ubyte[] EBTEXT_RESTRICT_PLAYER_MOVEMENT_WHEN_CAMERA_REPOSITIONED(ubyte arg) {
	return textSubCommand(0x1F, 0xE8, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1F_E9(short arg) {
	return textSubCommand(0x1F, 0xE9, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1F_EA(short arg) {
	return textSubCommand(0x1F, 0xEA, arg);
}

ubyte[] EBTEXT_MAKE_INVISIBLE(short arg, short arg2) {
	return textSubCommand(0x1F, 0xEB, arg, arg2);
}

ubyte[] EBTEXT_MAKE_VISIBLE(short arg, short arg2) {
	return textSubCommand(0x1F, 0xEC, arg, arg2);
}

ubyte[] EBTEXT_RESTORE_MOVEMENT() {
	return textSubCommand(0x1F, 0xED);
}

ubyte[] EBTEXT_WARP_PARTY_TO_TPT_ENTRY(short arg) {
	return textSubCommand(0x1F, 0xEE, arg);
}

ubyte[] EBTEXT_UNKNOWN_CC_1F_EF(short arg) {
	return textSubCommand(0x1F, 0xEF, arg);
}

ubyte[] EBTEXT_RIDE_BICYCLE() {
	return textSubCommand(0x1F, 0xF0);
}

ubyte[] EBTEXT_SET_TPT_MOVEMENT_CODE(short arg, short arg2) {
	return textSubCommand(0x1F, 0xF1, arg, arg2);
}

ubyte[] EBTEXT_SET_SPRITE_MOVEMENT_CODE(short arg, short arg2) {
	return textSubCommand(0x1F, 0xF2, arg, arg2);
}

ubyte[] EBTEXT_CREATE_FLOATING_SPRITE_NEAR_ENTITY(short arg, ubyte arg2) {
	return textSubCommand(0x1F, 0xF3, arg, arg2);
}

ubyte[] EBTEXT_DELETE_FLOATING_SPRITE_NEAR_ENTITY(short arg) {
	return textSubCommand(0x1F, 0xF4, arg);
}

T getCCParameters(T)(ubyte lastValue) {
	import earthbound.globals : ccArgumentStorage;
	static assert(T.sizeof - 1 <= ccArgumentStorage.length);
	union Raw {
		ubyte[T.sizeof] raw;
		T structure;
	}
	Raw raw;
	raw.raw[0 .. $ - 1] = ccArgumentStorage[T.sizeof - 1];
	raw.raw[$- 1] = lastValue;
	return raw.structure;
}

T useVariableIfZero(T,U)(T value, U variable) {
	return value == 0 ? (cast(T)variable) : value;
}

enum ReadParameters(T)  = "
	alias ArgType = "~T.stringof~";
	if (ArgType.sizeof - 1 < ccArgumentGatheringLoopCounter) {
		ccArgumentStorage[ccArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &mixin(__FUNCTION__);
	}";

align(1) struct CC1805Arguments {
	align(1):
	ubyte alignment;
	ubyte unused;
}

align(1) struct CC1807Arguments {
	align(1):
	uint value;
	ubyte register;
}

align(1) struct CC180DArguments {
	align(1):
	ubyte character;
	ubyte unknown;
}

align(1) struct CC1905Arguments {
	align(1):
	ubyte character;
	ubyte statusGroup;
	ubyte status;
}

align(1) struct CC1916Arguments {
	align(1):
	ubyte character;
	ubyte statusGroup;
}

align(1) struct CC1A00Arguments {
	align(1):
	ubyte*[4] partyScripts;
	ubyte display;
}

align(1) struct CC1A05Arguments {
	align(1):
	ubyte character;
	ubyte window;
}

align(1) struct CC1D00Arguments {
	align(1):
	ubyte character;
	ubyte item;
}

align(1) struct CC1EArguments {
	align(1):
	ubyte character;
	ubyte amount;
}

align(1) struct CC1E09Arguments {
	align(1):
	ubyte character;
	uint amount;
}

align(1) struct CC1F00Arguments {
	align(1):
	ubyte track;
	ubyte unused;
}

align(1) struct CC1F20Arguments {
	align(1):
	ubyte p1;
	ubyte p2;
}
