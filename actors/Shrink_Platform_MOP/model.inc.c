ALIGNED8 Texture texture_0406F618_03F6F618_seg4 = {
#include "actors/Shrink_Platform_MOP/texture_0406F618_03F6F618_seg4.inc.c"
};

const Vtx vertex_0406FE20_n11[] = {
    {{{  -148,      0,   -148}, 0, {  1008,  -1040}, {129,  0,  0, 255}}},
    {{{  -148,     -7,    148}, 0, {  1008,    -16}, {129,  0,  0, 255}}},
    {{{  -148,      0,    148}, 0, {  1008,    -16}, {129,  0,  0, 255}}},
    {{{  -148,     -7,   -148}, 0, {  1008,  -1040}, {129,  0,  0, 255}}},
    {{{   148,     -7,   -148}, 0, {  2032,  -1040}, {127,  0,  0, 255}}},
    {{{   148,      0,    148}, 0, {  2032,    -16}, {127,  0,  0, 255}}},
    {{{   148,     -7,    148}, 0, {  2032,    -16}, {127,  0,  0, 255}}},
    {{{   148,      0,   -148}, 0, {  2032,  -1040}, {127,  0,  0, 255}}},
    {{{   148,      0,    148}, 0, {  2032,    -16}, { 0, 127,  0, 255}}},
    {{{  -148,      0,   -148}, 0, {  1008,  -1040}, { 0, 127,  0, 255}}},
    {{{  -148,      0,    148}, 0, {  1008,    -16}, { 0, 127,  0, 255}}},
};


const Vtx vertex_0406FED0_n11[] = {
    {{{  -148,      0,   -148}, 0, {  1008,  -1040}, { 0, 127,  0, 255}}},
    {{{   148,      0,    148}, 0, {  2032,    -16}, { 0, 127,  0, 255}}},
    {{{   148,      0,   -148}, 0, {  2032,  -1040}, { 0, 127,  0, 255}}},
    {{{   148,      0,    148}, 0, {  2032,    -16}, { 0,  0, 127, 255}}},
    {{{  -148,     -7,    148}, 0, {  1008,    -16}, { 0,  0, 127, 255}}},
    {{{   148,     -7,    148}, 0, {  2032,    -16}, { 0,  0, 127, 255}}},
    {{{  -148,      0,    148}, 0, {  1008,    -16}, { 0,  0, 127, 255}}},
    {{{  -148,      0,   -148}, 0, {  1008,   1008}, { 0,  0, 129, 255}}},
    {{{   148,     -7,   -148}, 0, {  2032,   1008}, { 0,  0, 129, 255}}},
    {{{  -148,     -7,   -148}, 0, {  1008,   1008}, { 0,  0, 129, 255}}},
    {{{   148,      0,   -148}, 0, {  2032,   1008}, { 0,  0, 129, 255}}},
};


const Vtx vertex_0406FF80_n4[] = {
    {{{   148,     -7,   -148}, 0, {  2032,  -1040}, { 0, 129,  0, 255}}},
    {{{  -148,     -7,    148}, 0, {  1008,    -16}, { 0, 129,  0, 255}}},
    {{{  -148,     -7,   -148}, 0, {  1008,  -1040}, { 0, 129,  0, 255}}},
    {{{   148,     -7,    148}, 0, {  2032,    -16}, { 0, 129,  0, 255}}},
};


Light_t light_0406F600 = {
    { 127, 127, 127 }, 0, { 127, 127, 127 }, 0, { -1, -1, -1 }, 0
};


Light_t light_0406F608 = {
    { 255, 255, 255 }, 0, { 255, 255, 255 }, 0, { 73, 73, 73 }, 0
};


const Gfx dl_0406FFC0[] = {
    gsSPCullDisplayList(/* v0 */ 0x0, /* vn */ 0xA),
    gsDPPipeSync(),
    gsSPSetGeometryMode(/* flags */ 0),
    gsSPTexture(/* s */ 0xFFFF, /* t */ 0xFFFF, /* level */ 0x0, /* tile */ G_TX_RENDERTILE, /* on */ G_ON),
    gsDPTileSync(),
    gsDPLoadSync(),
    gsSPLight(/* light */ &light_0406F600.col, /* idx */ 2),
    gsSPLight(/* light */ &light_0406F608.col, /* idx */ 1),
    gsDPSetCombineLERP(/* cycle1 */ TEXEL0, 0, SHADE, 0, 0, 0, 0, 1, /* cycle2 */ TEXEL0, 0, SHADE, 0, 0, 0, 0, 1),
    gsDPSetTextureFilter(/* value */ G_TF_BILERP),
    gsDPSetTextureImage(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* width */ 0x1, /* texture_record */ texture_0406F618_03F6F618_seg4),
    gsDPSetTile(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* line */ 0x0, /* tmem */ 0x0, /* tile */ G_TX_LOADTILE, /* palette */ 0x0, /* cmt */ G_TX_WRAP, /* maskt */ 0x0, /* shiftt */ 0x0, /* cms */ G_TX_WRAP, /* masks */ 0x0, /* shifts */ 0x0),
    gsDPLoadSync(),
    gsDPLoadBlock(/* tile */ G_TX_LOADTILE, /* uls */ 0x0, /* ult */ 0x0, /* lrs */ 0x3FF, /* dxt */ 0x100),
    gsDPPipeSync(),
    gsDPSetTile(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* line */ 0x8, /* tmem */ 0x0, /* tile */ G_TX_RENDERTILE, /* palette */ 0x0, /* cmt */ G_TX_WRAP, /* maskt */ 0x5, /* shiftt */ 0x0, /* cms */ G_TX_WRAP, /* masks */ 0x5, /* shifts */ 0x0),
    gsDPSetTileSize(/* tile */ G_TX_RENDERTILE, /* uls */ 0x0, /* ult */ 0x0, /* lrs */ 0x7C, /* lrt */ 0x7C),
    gsSPVertex(/* vertices */ vertex_0406FE20_n11, /* count */ 0xB, /* v0 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x0, /* v01 */ 0x1, /* v02 */ 0x2, /* flag0 */ 0x0, /* v10 */ 0x1, /* v11 */ 0x0, /* v12 */ 0x3, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x4, /* v01 */ 0x5, /* v02 */ 0x6, /* flag0 */ 0x0, /* v10 */ 0x5, /* v11 */ 0x4, /* v12 */ 0x7, /* flag1 */ 0x0),
    gsSP1Triangle(/* v0 */ 0x8, /* v1 */ 0x9, /* v2 */ 0xA, /* flag */ 0x0),
    gsSPVertex(/* vertices */ vertex_0406FED0_n11, /* count */ 0xB, /* v0 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x0, /* v01 */ 0x1, /* v02 */ 0x2, /* flag0 */ 0x0, /* v10 */ 0x3, /* v11 */ 0x4, /* v12 */ 0x5, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x4, /* v01 */ 0x3, /* v02 */ 0x6, /* flag0 */ 0x0, /* v10 */ 0x7, /* v11 */ 0x8, /* v12 */ 0x9, /* flag1 */ 0x0),
    gsSP1Triangle(/* v0 */ 0x8, /* v1 */ 0x7, /* v2 */ 0xA, /* flag */ 0x0),
    gsSPVertex(/* vertices */ vertex_0406FF80_n4, /* count */ 0x4, /* v0 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x0, /* v01 */ 0x1, /* v02 */ 0x2, /* flag0 */ 0x0, /* v10 */ 0x1, /* v11 */ 0x0, /* v12 */ 0x3, /* flag1 */ 0x0),
    gsDPSetCombineMode(/* cycle1 */ G_CC_SHADE, /* cycle2 */ G_CC_SHADE),
    gsSPTexture(/* s */ 0xFFFF, /* t */ 0xFFFF, /* level */ 0x0, /* tile */ G_TX_RENDERTILE, /* on */ G_OFF),
    gsSPEndDisplayList(),
};





