static Movtex sl_area_1_movtex_water_0[] = {
    MOV_TEX_INIT_LOAD(1),
    MOV_TEX_ROT_SPEED(15),
    MOV_TEX_ROT_SCALE(16),
    MOV_TEX_4_BOX_TRIS(-32767, -32767),
    MOV_TEX_4_BOX_TRIS(32767, -32767),
    MOV_TEX_4_BOX_TRIS(32767, 32767),
    MOV_TEX_4_BOX_TRIS(-32767, 32767),
    MOV_TEX_ROT(ROTATE_COUNTER_CLOCKWISE),
    MOV_TEX_ALPHA(120),
    MOV_TEX_DEFINE(TEXTURE_WATER),
    MOV_TEX_END(),
};

const struct MovtexQuadCollection sl_area_1_water_manual_collection[] = {
    { 0, sl_area_1_movtex_water_0 },
    { -1, NULL },
};

