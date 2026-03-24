static Movtex wdw_area_1_movtex_water_0[] = {
    MOV_TEX_INIT_LOAD(1),
    MOV_TEX_ROT_SPEED(15),
    MOV_TEX_ROT_SCALE(7),
    MOV_TEX_4_BOX_TRIS(-9000, -9000),
    MOV_TEX_4_BOX_TRIS(5550, -9000),
    MOV_TEX_4_BOX_TRIS(5550, 3900),
    MOV_TEX_4_BOX_TRIS(-9000, 3900),
    MOV_TEX_ROT(ROTATE_COUNTER_CLOCKWISE),
    MOV_TEX_ALPHA(120),
    MOV_TEX_DEFINE(TEXTURE_WATER),
    MOV_TEX_END(),
};

const struct MovtexQuadCollection wdw_area_1_water_type_0_collection[] = {
    { 0, wdw_area_1_movtex_water_0 },
    { -1, NULL },
};

