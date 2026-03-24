static Movtex hmc_area_1_movtex_water_0[] = {
    MOV_TEX_INIT_LOAD(1),
    MOV_TEX_ROT_SPEED(15),
    MOV_TEX_ROT_SCALE(16),
    MOV_TEX_4_BOX_TRIS(-51, 8115),
    MOV_TEX_4_BOX_TRIS(14826, 8115),
    MOV_TEX_4_BOX_TRIS(14826, 21964),
    MOV_TEX_4_BOX_TRIS(-51, 21964),
    MOV_TEX_ROT(ROTATE_COUNTER_CLOCKWISE),
    MOV_TEX_ALPHA(120),
    MOV_TEX_DEFINE(TEXTURE_WATER),
    MOV_TEX_END(),
};

static Movtex hmc_area_1_movtex_water_1[] = {
    MOV_TEX_INIT_LOAD(1),
    MOV_TEX_ROT_SPEED(15),
    MOV_TEX_ROT_SCALE(10),
    MOV_TEX_4_BOX_TRIS(-14446, -14949),
    MOV_TEX_4_BOX_TRIS(1543, -14949),
    MOV_TEX_4_BOX_TRIS(1543, -7867),
    MOV_TEX_4_BOX_TRIS(-14446, -7867),
    MOV_TEX_ROT(ROTATE_COUNTER_CLOCKWISE),
    MOV_TEX_ALPHA(120),
    MOV_TEX_DEFINE(TEXTURE_WATER),
    MOV_TEX_END(),
};

const struct MovtexQuadCollection hmc_area_1_water_type_0_collection[] = {
    { 0, hmc_area_1_movtex_water_0 },
    { 1, hmc_area_1_movtex_water_1 },
    { -1, NULL },
};

