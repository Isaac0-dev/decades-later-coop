const Vtx vertex_030295E8_n4[] = {
    {{{    31,     31,      0}, 0, {   990,      0}, {255, 255, 255, 255}}},
    {{{   -30,     31,      0}, 0, {     0,      0}, {255, 255, 255, 255}}},
    {{{   -30,    -30,      0}, 0, {     0,   2012}, {255, 255, 255, 255}}},
    {{{    31,    -30,      0}, 0, {   990,   2012}, {255, 255, 255, 255}}},
};


const Gfx dl_0302A628[] = {
    gsSPCullDisplayList(/* v0 */ 0x0, /* vn */ 0x3),
    gsDPSetTextureImage(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* width */ 0x1, /* texture_record */ texture_03029628_00ADBA34_seg3),
    gsDPLoadSync(),
    gsDPLoadBlock(/* tile */ G_TX_LOADTILE, /* uls */ 0x0, /* ult */ 0x0, /* lrs */ 0x7FF, /* dxt */ 0x100),
    gsSPVertex(/* vertices */ vertex_030295E8_n4, /* count */ 0x4, /* v0 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x0, /* v01 */ 0x1, /* v02 */ 0x2, /* flag0 */ 0x0, /* v10 */ 0x0, /* v11 */ 0x2, /* v12 */ 0x3, /* flag1 */ 0x0),
    gsSPEndDisplayList(),
};


const Gfx dl_0302A660[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(/* cycle1 */ G_CC_DECALRGBA, /* cycle2 */ G_CC_DECALRGBA),
    gsSPClearGeometryMode(/* flags */ G_LIGHTING),
    gsDPSetTile(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* line */ 0x0, /* tmem */ 0x0, /* tile */ G_TX_LOADTILE, /* palette */ 0x0, /* cmt */ G_TX_WRAP, /* maskt */ 0x0, /* shiftt */ 0x0, /* cms */ G_TX_WRAP, /* masks */ 0x0, /* shifts */ 0x0),
    gsSPTexture(/* s */ 0xFFFF, /* t */ 0xFFFF, /* level */ 0x0, /* tile */ G_TX_RENDERTILE, /* on */ G_ON),
    gsDPTileSync(),
    gsDPSetTile(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* line */ 0x8, /* tmem */ 0x0, /* tile */ G_TX_RENDERTILE, /* palette */ 0x0, /* cmt */ G_TX_WRAP, /* maskt */ 0x6, /* shiftt */ 0x0, /* cms */ G_TX_WRAP, /* masks */ 0x5, /* shifts */ 0x0),
    gsDPSetTileSize(/* tile */ G_TX_RENDERTILE, /* uls */ 0x0, /* ult */ 0x0, /* lrs */ 0x7C, /* lrt */ 0xFC),
    gsSPDisplayList(/* dl */ dl_0302A628),
    gsSPTexture(/* s */ 0xFFFF, /* t */ 0xFFFF, /* level */ 0x0, /* tile */ G_TX_RENDERTILE, /* on */ G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(/* cycle1 */ G_CC_SHADE, /* cycle2 */ G_CC_SHADE),
    gsSPSetGeometryMode(/* flags */ G_LIGHTING),
    gsSPEndDisplayList(),
};


ALIGNED8 Texture texture_03029628_00ADBA34_seg3 = {
#include "actors/mushroom_1up/texture_03029628_00ADBA34_seg3.inc.c"
};


