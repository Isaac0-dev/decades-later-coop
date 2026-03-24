// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x1ce020
const LevelScript level_script_0x1ce020_entry[] = {
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2a6238 -> level_script_0x2a62e0
const LevelScript level_script_0x2a62e0_entry[] = {
    EXIT(),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2a6238
const LevelScript level_script_0x2a6238_entry[] = {
    CALL(/* arg */ 0x0000, /* func */ 0x8024be14),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000000, level_script_0x2a62e0_entry),
    INIT_LEVEL(),
    // FIXED_LOAD(/* loadAddr */ 0x8016f000, /* start */ 0x0021f4c0, /* end */ 0x00269ea0),
    // LOAD_RAW(/* seg */ 0x0007, /* start */ 0x00b1f8b5, /* end */ 0x00b2d715),
    ALLOC_LEVEL_POOL(),
    AREA(2, area_2_geo_14000408),
        OBJECT(MODEL_NONE, /* posX */ 0, /* posY */ -100, /* posZ */ 0, /* angleX */ 0, /* angleY */ 0, /* angleZ */ 0, /* behParam */ 0x04000000, bhvActSelector),
        TERRAIN(area_1_collision_0x0700DE30),
    END_AREA(),
    FREE_LEVEL_POOL(),
    LOAD_AREA(/* area */ 0x02),
    TRANSITION(/* transType */ 0x00, /* time */ 0x10, /* colorR */ 0xff, /* colorG */ 0xff, /* colorB */ 0xff),
    SLEEP(/* frames */ 0x0010),
    SET_MENU_MUSIC(/* seq */ 0x000d),
    CALL(/* arg */ 0x0000, /* func */ 0x80177560),
    CALL_LOOP(/* arg */ 0x0000, /* func */ 0x80177610),
    GET_OR_SET(/* op */ 0x00, /* var */ 0x02),
    STOP_MUSIC(/* fadeOutTime */ 0x00be),
    TRANSITION(/* transType */ 0x01, /* time */ 0x10, /* colorR */ 0xff, /* colorG */ 0xff, /* colorB */ 0xff),
    SLEEP(/* frames */ 0x0010),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/* frames */ 0x0001),
    EXIT(),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> script_exec_level_table
const LevelScript level_script_0x2abf18_entry[] = {
    GET_OR_SET(/* op */ 0x01, /* var */ 0x03),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000004, bbh_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000005, ccm_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000006, castle_inside_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000007, hmc_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000008, ssl_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000009, bob_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000000a, sl_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000000b, wdw_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000000c, jrb_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000000d, thi_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000000e, ttc_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000000f, rr_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000010, castle_grounds_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000011, bitdw_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000012, vcutm_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000013, bitfs_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000014, sa_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000015, bits_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000016, lll_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000017, ddd_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000018, wf_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000019, ending_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000001a, castle_courtyard_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000001b, pss_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000001c, cotmc_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000001d, totwc_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000001e, bowser_1_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x0000001f, wmotr_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000021, bowser_2_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000022, bowser_3_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0x00000024, ttm_entry),
    EXIT(),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abed8 -> level_script_0x4ac4b0
const LevelScript level_script_0x4ac4b0_entry[] = {
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abed8
const LevelScript level_script_0x2abed8_entry[] = {
    EXIT_AND_EXECUTE(/* seg */ 0x000e, /* start */ 0x004ac4b0, /* end */ 0x004ac570, level_script_0x4ac4b0_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abee8
const LevelScript level_script_0x2abee8_entry[] = {
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x269f18_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abef8 -> level_script_0x269fa4
const LevelScript level_script_0x269fa4_entry[] = {
    INIT_LEVEL(),
    BLACKOUT(/* active */ 0x01),
    // FIXED_LOAD(/* loadAddr */ 0x8016f000, /* start */ 0x0021f4c0, /* end */ 0x00269ea0),
    LOAD_MARIO_HEAD(/* sethead */ 0x0003),
    // LOAD_RAW(/* seg */ 0x0013, /* start */ 0x00219e00, /* end */ 0x0021f4c0),
    LOAD_MIO0_TEXTURE(/* seg */ 0x0a, /* start */ 0x00b105fc, /* end */ 0x00b178b5),
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x26a0ac_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abef8
const LevelScript level_script_0x2abef8_entry[] = {
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x269fa4_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abec8
const LevelScript level_script_0x2abec8_entry[] = {
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x269ea0_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abf08 -> level_script_0x26a030 -> level_script_0x26a148
const LevelScript level_script_0x26a148_entry[] = {
    STOP_MUSIC(/* fadeOutTime */ 0x00be),
    TRANSITION(/* transType */ 0x01, /* time */ 0x10, /* colorR */ 0x00, /* colorG */ 0x00, /* colorB */ 0x00),
    SLEEP(/* frames */ 0x0010),
    CLEAR_LEVEL(),
    SLEEP(/* frames */ 0x0002),
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x269ea0_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abf08 -> level_script_0x26a030 -> level_script_0x26a0fc
const LevelScript level_script_0x26a0fc_entry[] = {
    STOP_MUSIC(/* fadeOutTime */ 0x00be),
    TRANSITION(/* transType */ 0x01, /* time */ 0x10, /* colorR */ 0xff, /* colorG */ 0xff, /* colorB */ 0xff),
    SLEEP(/* frames */ 0x0010),
    CLEAR_LEVEL(),
    SLEEP(/* frames */ 0x0002),
    EXIT_AND_EXECUTE(/* seg */ 0x0015, /* start */ 0x002abca0, /* end */ 0x002ac6b0, level_script_0x2abca0_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abf08 -> level_script_0x26a030
const LevelScript level_script_0x26a030_entry[] = {
    INIT_LEVEL(),
    // LOAD_RAW(/* seg */ 0x0013, /* start */ 0x00219e00, /* end */ 0x0021f4c0),
    LOAD_MIO0_TEXTURE(/* seg */ 0x0a, /* start */ 0x00b105fc, /* end */ 0x00b178b5),
    // LOAD_RAW(/* seg */ 0x0007, /* start */ 0x00b02054, /* end */ 0x00b085fc),
    // FIXED_LOAD(/* loadAddr */ 0x8016f000, /* start */ 0x0021f4c0, /* end */ 0x00269ea0),
    ALLOC_LEVEL_POOL(),
    AREA(1, area_1_geo_14000414),
    END_AREA(),
    FREE_LEVEL_POOL(),
    LOAD_AREA(/* area */ 0x01),
    SET_MENU_MUSIC(/* seq */ 0x0002),
    TRANSITION(/* transType */ 0x00, /* time */ 0x10, /* colorR */ 0xff, /* colorG */ 0xff, /* colorB */ 0xff),
    SLEEP(/* frames */ 0x0010),
    CALL_LOOP(/* arg */ 0x0003, /* func */ 0x8016f5b0),
    JUMP_IF(/* op */ 0x02, /* arg */ 0xffffffff, level_script_0x26a148_entry),
    JUMP(level_script_0x26a0fc_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58 -> level_script_0x2abf08
const LevelScript level_script_0x2abf08_entry[] = {
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x26a030_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20 -> level_script_0x2abe58
const LevelScript level_script_0x2abe58_entry[] = {
    FREE_LEVEL_POOL(),
    CALL(/* arg */ 0x0000, /* func */ 0x8024bd5c),
    LOOP_BEGIN(),
        EXECUTE(/* seg */ 0x0014, /* start */ 0x002a6120, /* end */ 0x002a65b0, level_script_0x2a6238_entry),
        JUMP_LINK(level_script_0x2abf18_entry),
        SLEEP(/* frames */ 0x0001),
    LOOP_UNTIL(/* op */ 0x04, /* arg */ 0x00000000),
    JUMP_IF(/* op */ 0x02, /* arg */ 0xffffffff, level_script_0x2abed8_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0xfffffffe, level_script_0x2abee8_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0xfffffffd, level_script_0x2abef8_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0xfffffff8, level_script_0x2abec8_entry),
    JUMP_IF(/* op */ 0x02, /* arg */ 0xfffffff7, level_script_0x2abf08_entry),
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x269ea0_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0 -> level_script_0xad4a20
const LevelScript level_script_0xad4a20_entry[] = {
    LOAD_MODEL_FROM_GEO(MODEL_DIRT_ANIMATION, geo_16000ED4),
    LOAD_MODEL_FROM_GEO(MODEL_CARTOON_STAR, geo_16000F24),
    LOAD_MODEL_FROM_GEO(MODEL_TTM_SLIDE_EXIT_PODIUM, geo_0301DBF8),
    // LOAD_MODEL_FROM_DL(0x92, dl_04074010, 0x00),
    // LOAD_MODEL_FROM_DL(0x97, dl_04070E80, 0x00),
    LOAD_MODEL_FROM_GEO(0x98, geo_030212F4),
    LOAD_MODEL_FROM_GEO(0x99, geo_030225E4),
    LOAD_MODEL_FROM_GEO(0xf1, geo_0405FE00),
    LOAD_MODEL_FROM_GEO(0xf0, geo_0302272C),
    LOAD_MODEL_FROM_GEO(0xf2, geo_03022708),
    // LOAD_MODEL_FROM_DL(0x30, dl_0406BEC0, 0x00),
    // LOAD_MODEL_FROM_DL(MODEL_WF_TOWER_SQUARE_PLATORM_ELEVATOR, dl_0406AB70, 0x00),
    LOAD_MODEL_FROM_GEO(MODEL_UNKNOWN_DOOR_2A, geo_04075550),
    // LOAD_MODEL_FROM_DL(MODEL_UNKNOWN_DOOR_2B, dl_0406CF10, 0x00),
    // LOAD_MODEL_FROM_DL(MODEL_WF_TOWER_TRAPEZOID_PLATORM, dl_0406EEE0, 0x00),
    LOAD_MODEL_FROM_GEO(MODEL_WF_TOWER_SQUARE_PLATORM, geo_00603670),
    // LOAD_MODEL_FROM_DL(MODEL_WF_TOWER_SQUARE_PLATORM_UNUSED, dl_00606660, 0x00),
    JUMP_LINK(level_script_0x1ce020_entry),
    // LOAD_MODEL_FROM_DL(0xe3, dl_040843E0, 0x00),
    JUMP(level_script_0x2abe58_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120 -> level_script_0x2abca0
const LevelScript level_script_0x2abca0_entry[] = {
    // LOAD_RAW(/* seg */ 0x0004, /* start */ 0x03f00000, /* end */ 0x03f91400),
    // LOAD_RAW(/* seg */ 0x0003, /* start */ 0x00ab240c, /* end */ 0x00ae5714),
    // LOAD_RAW(/* seg */ 0x0017, /* start */ 0x001279b0, /* end */ 0x0012a7e0),
    // LOAD_RAW(/* seg */ 0x0016, /* start */ 0x00218da0, /* end */ 0x00219e00),
    // LOAD_RAW(/* seg */ 0x0013, /* start */ 0x00219e00, /* end */ 0x0021f4c0),
    ALLOC_LEVEL_POOL(),
    LOAD_MODEL_FROM_GEO(MODEL_MARIO, geo_17002DD4),
    LOAD_MODEL_FROM_GEO(MODEL_SMOKE, geo_17000038),
    LOAD_MODEL_FROM_GEO(MODEL_SPARKLES, geo_170001BC),
    LOAD_MODEL_FROM_GEO(MODEL_BUBBLE, geo_17000000),
    LOAD_MODEL_FROM_GEO(MODEL_SMALL_WATER_SPLASH, geo_1700009C),
    LOAD_MODEL_FROM_GEO(MODEL_IDLE_WATER_WAVE, geo_17000124),
    LOAD_MODEL_FROM_GEO(MODEL_WATER_SPLASH, geo_17000230),
    LOAD_MODEL_FROM_GEO(MODEL_WAVE_TRAIL, geo_17000168),
    LOAD_MODEL_FROM_GEO(MODEL_YELLOW_COIN, geo_1600013C),
    LOAD_MODEL_FROM_GEO(MODEL_STAR, geo_16000EA0),
    LOAD_MODEL_FROM_GEO(MODEL_TRANSPARENT_STAR, geo_16000F6C),
    LOAD_MODEL_FROM_GEO(MODEL_WOODEN_SIGNPOST, geo_16000FB4),
    // LOAD_MODEL_FROM_DL(MODEL_WHITE_PARTICLE_SMALL, dl_04032A18, 0x04),
    LOAD_MODEL_FROM_GEO(MODEL_RED_FLAME, geo_16000B2C),
    LOAD_MODEL_FROM_GEO(MODEL_BLUE_FLAME, geo_16000B8C),
    LOAD_MODEL_FROM_GEO(MODEL_BURN_SMOKE, geo_17000084),
    LOAD_MODEL_FROM_GEO(MODEL_LEAVES, geo_16000C8C),
    LOAD_MODEL_FROM_GEO(MODEL_PURPLE_MARBLE, geo_1700001C),
    LOAD_MODEL_FROM_GEO(MODEL_FISH, geo_16000C44),
    LOAD_MODEL_FROM_GEO(MODEL_FISH_SHADOW, geo_16000BEC),
    LOAD_MODEL_FROM_GEO(MODEL_SPARKLES_ANIMATION, geo_17000284),
    // LOAD_MODEL_FROM_DL(MODEL_SAND_DUST, dl_0302BCD0, 0x04),
    LOAD_MODEL_FROM_GEO(MODEL_BUTTERFLY, geo_160000A8),
    LOAD_MODEL_FROM_GEO(MODEL_BURN_SMOKE_UNUSED, geo_17000084),
    // LOAD_MODEL_FROM_DL(MODEL_PEBBLE, dl_0301CB00, 0x04),
    LOAD_MODEL_FROM_GEO(MODEL_MIST, geo_16000000),
    LOAD_MODEL_FROM_GEO(MODEL_WHITE_PUFF, geo_16000020),
    // LOAD_MODEL_FROM_DL(MODEL_WHITE_PARTICLE_DL, dl_0302C8A0, 0x04),
    LOAD_MODEL_FROM_GEO(MODEL_WHITE_PARTICLE, geo_16000F98),
    LOAD_MODEL_FROM_GEO(MODEL_YELLOW_COIN_NO_SHADOW, geo_160001A0),
    LOAD_MODEL_FROM_GEO(MODEL_BLUE_COIN, geo_16000200),
    LOAD_MODEL_FROM_GEO(MODEL_BLUE_COIN_NO_SHADOW, geo_16000264),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_WINGED_METAL_CAP, geo_16000DA8),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_METAL_CAP, geo_16000CF0),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_WING_CAP, geo_16000D3C),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_CAP, geo_16000CA4),
    LOAD_MODEL_FROM_GEO(MODEL_MARIOS_CAP, geo_16000CA4),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_KEY_CUTSCENE, geo_16000AB0),
    LOAD_MODEL_FROM_GEO(MODEL_BOWSER_KEY, geo_16000A84),
    LOAD_MODEL_FROM_GEO(MODEL_RED_FLAME_SHADOW, geo_16000B10),
    LOAD_MODEL_FROM_GEO(MODEL_1UP, geo_16000E84),
    LOAD_MODEL_FROM_GEO(MODEL_RED_COIN, geo_160002C4),
    LOAD_MODEL_FROM_GEO(MODEL_RED_COIN_NO_SHADOW, geo_16000328),
    LOAD_MODEL_FROM_GEO(MODEL_NUMBER, geo_16000E14),
    LOAD_MODEL_FROM_GEO(MODEL_EXPLOSION, geo_16000040),
    CALL(/* arg */ 0x0000, /* func */ 0x8030c4b0),
    JUMP(level_script_0xad4a20_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac -> level_script_0x2a6120
const LevelScript level_script_0x2a6120_entry[] = {
    INIT_LEVEL(),
    // FIXED_LOAD(/* loadAddr */ 0x8016f000, /* start */ 0x0021f4c0, /* end */ 0x00269ea0),
    // LOAD_RAW(/* seg */ 0x0007, /* start */ 0x00b1f8b5, /* end */ 0x00b2d715),
    // LOAD_RAW(/* seg */ 0x0013, /* start */ 0x00219e00, /* end */ 0x0021f4c0),
    ALLOC_LEVEL_POOL(),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_03 /* or MODEL_MAIN_MENU_MARIO_SAVE_BUTTON */, geo_140001D0),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_04 /* or MODEL_MAIN_MENU_RED_ERASE_BUTTON */, geo_14000290),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_05 /* or MODEL_MAIN_MENU_BLUE_COPY_BUTTON */, geo_140002B8),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_06 /* or MODEL_MAIN_MENU_YELLOW_FILE_BUTTON */, geo_140002E0),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_07 /* or MODEL_MAIN_MENU_GREEN_SCORE_BUTTON */, geo_14000308),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_08 /* or MODEL_MAIN_MENU_MARIO_SAVE_BUTTON_FADE */, geo_14000200),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_09 /* or MODEL_MAIN_MENU_MARIO_NEW_BUTTON, MODEL_LLL_ROTATING_HEXAGONAL_PLATFORM */, geo_14000230),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_0A /* or MODEL_MAIN_MENU_MARIO_NEW_BUTTON_FADE */, geo_14000260),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_0B /* or MODEL_MAIN_MENU_PURPLE_SOUND_BUTTON */, geo_14000330),
    LOAD_MODEL_FROM_GEO(MODEL_LEVEL_GEOMETRY_0C /* or MODEL_MAIN_MENU_GENERIC_BUTTON */, geo_14000358),
    AREA(1, area_1_geo_14000380),
        OBJECT(MODEL_NONE, /* posX */ 0, /* posY */ 0, /* posZ */ -19000, /* angleX */ 0, /* angleY */ 0, /* angleZ */ 0, /* behParam */ 0x04000000, bhvMenuButtonManager),
        OBJECT(MODEL_LEVEL_GEOMETRY_06 /* or MODEL_MAIN_MENU_YELLOW_FILE_BUTTON */, /* posX */ 0, /* posY */ 0, /* posZ */ -19000, /* angleX */ 0, /* angleY */ 0, /* angleZ */ 0, /* behParam */ 0x04000000, bhvYellowBackgroundInMenu),
        TERRAIN(area_1_collision_0x0700DE30),
    END_AREA(),
    FREE_LEVEL_POOL(),
    LOAD_AREA(/* area */ 0x01),
    SET_MENU_MUSIC(/* seq */ 0x0021),
    TRANSITION(/* transType */ 0x00, /* time */ 0x10, /* colorR */ 0xff, /* colorG */ 0xff, /* colorB */ 0xff),
    CALL(/* arg */ 0x0000, /* func */ 0x801766dc),
    CALL_LOOP(/* arg */ 0x0000, /* func */ 0x801768a0),
    GET_OR_SET(/* op */ 0x00, /* var */ 0x00),
    STOP_MUSIC(/* fadeOutTime */ 0x00be),
    TRANSITION(/* transType */ 0x01, /* time */ 0x10, /* colorR */ 0xff, /* colorG */ 0xff, /* colorB */ 0xff),
    SLEEP(/* frames */ 0x0010),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/* frames */ 0x0001),
    SET_REG(/* value */ 0x0010),
    EXIT_AND_EXECUTE(/* seg */ 0x0015, /* start */ 0x002abca0, /* end */ 0x002ac6b0, level_script_0x2abca0_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18 -> level_script_0x26a0ac
const LevelScript level_script_0x26a0ac_entry[] = {
    STOP_MUSIC(/* fadeOutTime */ 0x00be),
    TRANSITION(/* transType */ 0x01, /* time */ 0x10, /* colorR */ 0xff, /* colorG */ 0xff, /* colorB */ 0xff),
    SLEEP(/* frames */ 0x0010),
    CLEAR_LEVEL(),
    SLEEP(/* frames */ 0x0002),
    SET_REG(/* value */ 0x0010),
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x002a6120, /* end */ 0x002a65b0, level_script_0x2a6120_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0 -> level_script_0x269f18
const LevelScript level_script_0x269f18_entry[] = {
    INIT_LEVEL(),
    BLACKOUT(/* active */ 0x01),
    // FIXED_LOAD(/* loadAddr */ 0x8016f000, /* start */ 0x0021f4c0, /* end */ 0x00269ea0),
    LOAD_MARIO_HEAD(/* sethead */ 0x0002),
    // LOAD_RAW(/* seg */ 0x0013, /* start */ 0x00219e00, /* end */ 0x0021f4c0),
    LOAD_MIO0_TEXTURE(/* seg */ 0x0a, /* start */ 0x00b105fc, /* end */ 0x00b178b5),
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x26a0ac_entry),
};


// level_script_0x108a10 -> level_script_0x269ea0
const LevelScript level_script_0x269ea0_entry[] = {
    INIT_LEVEL(),
    // FIXED_LOAD(/* loadAddr */ 0x8016f000, /* start */ 0x0021f4c0, /* end */ 0x00269ea0),
    // LOAD_RAW(/* seg */ 0x0013, /* start */ 0x00219e00, /* end */ 0x0021f4c0),
    // LOAD_RAW(/* seg */ 0x0007, /* start */ 0x0049e710, /* end */ 0x00501d84),
    ALLOC_LEVEL_POOL(),
    AREA(1, area_1_geo_140002D0),
    END_AREA(),
    FREE_LEVEL_POOL(),
    LOAD_AREA(/* area */ 0x01),
    CALL(/* arg */ 0x0000, /* func */ 0x8016f5b0),
    SLEEP(/* frames */ 0x004b),
    TRANSITION(/* transType */ 0x01, /* time */ 0x10, /* colorR */ 0x00, /* colorG */ 0x00, /* colorB */ 0x00),
    SLEEP(/* frames */ 0x0010),
    CMD2A(/* unk2 */ 0x01),
    CLEAR_LEVEL(),
    SLEEP(/* frames */ 0x0002),
    EXIT_AND_EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x269f18_entry),
};


// level_script_0x108a10 -> level_script_0x0
const LevelScript level_script_0x0_entry[] = {
};


// level_script_0x108a10
const LevelScript level_script_0x108a10_entry[] = {
    INIT_LEVEL(),
    SLEEP(/* frames */ 0x0002),
    BLACKOUT(/* active */ 0x00),
    SET_REG(/* value */ 0x0000),
    EXECUTE(/* seg */ 0x0014, /* start */ 0x00269ea0, /* end */ 0x0026a3a0, level_script_0x269ea0_entry),
    JUMP(level_script_0x0_entry),
};
