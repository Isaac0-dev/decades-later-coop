const Vtx totwc_vertex_05002CC8_n12[] = {
    {{{  -118,    262,   -203}, 0, {  -130,    364}, { 0, 54, 142, 255}}},
    {{{   130,      0,   -224}, 0, {  1144,   2144}, { 0, 10, 130, 255}}},
    {{{  -129,      0,   -224}, 0, {  -184,   2144}, { 0, 10, 130, 255}}},
    {{{   119,    262,   -203}, 0, {  1088,    364}, { 0, 54, 142, 255}}},
    {{{   109,    352,   -108}, 0, {  1034,   -252}, { 0, 92, 169, 255}}},
    {{{  -108,    352,   -108}, 0, {   -74,   -252}, { 0, 92, 169, 255}}},
    {{{  -129,      0,    225}, 0, {  -184,   2144}, { 0, 10, 126, 255}}},
    {{{   119,    262,    204}, 0, {  1088,    364}, { 0, 54, 114, 255}}},
    {{{  -118,    262,    204}, 0, {  -130,    364}, { 0, 54, 114, 255}}},
    {{{  -108,    352,    109}, 0, {   -74,   -252}, { 0, 92, 87, 255}}},
    {{{   130,      0,    225}, 0, {  1144,   2144}, { 0, 10, 126, 255}}},
    {{{   109,    352,    109}, 0, {  1034,   -252}, { 0, 92, 87, 255}}},
};



const Vtx totwc_vertex_05002E60_n16[] = {
    {{{   147,      0,   -253}, 0, {     0,    499}, {41,  0, 136, 255}}},
    {{{  -146,      0,   -253}, 0, {     0,   -436}, {173,  0, 161, 255}}},
    {{{  -146,    137,   -253}, 0, {   407,   -436}, {211, 72, 163, 255}}},
    {{{  -146,      0,    254}, 0, {     0,   -436}, {215,  0, 119, 255}}},
    {{{   147,      0,    254}, 0, {     0,    499}, {83,  0, 95, 255}}},
    {{{   147,    137,    254}, 0, {   407,    499}, {45, 72, 93, 255}}},
    {{{   293,    137,      0}, 0, {   407,    967}, {104, 72,  7, 255}}},
    {{{   293,      0,      0}, 0, {     0,    967}, {124,  0, 232, 255}}},
    {{{   147,    137,   -253}, 0, {   407,    499}, {58, 71, 170, 255}}},
    {{{   111,    170,   -192}, 0, {   510,    386}, {35, 114, 215, 255}}},
    {{{   222,    170,      0}, 0, {   510,    741}, {53, 114, 10, 255}}},
    {{{  -146,    137,    254}, 0, {   407,   -436}, {198, 71, 86, 255}}},
    {{{   111,    170,    193}, 0, {   510,    386}, {17, 114, 51, 255}}},
    {{{  -292,    137,      0}, 0, {   407,   -904}, {152, 72, 249, 255}}},
    {{{  -110,    170,    193}, 0, {   510,   -323}, {221, 114, 41, 255}}},
    {{{  -221,    170,      0}, 0, {   510,   -678}, {203, 114, 246, 255}}},
};



const Vtx totwc_vertex_05002F60_n12[] = {
    {{{  -146,      0,   -253}, 0, {     0,   -436}, {173,  0, 161, 255}}},
    {{{  -292,      0,      0}, 0, {     0,   -904}, {132,  0, 23, 255}}},
    {{{  -292,    137,      0}, 0, {   407,   -904}, {152, 72, 249, 255}}},
    {{{   147,    137,   -253}, 0, {   407,    499}, {58, 71, 170, 255}}},
    {{{  -146,    137,   -253}, 0, {   407,   -436}, {211, 72, 163, 255}}},
    {{{  -110,    170,   -192}, 0, {   510,   -323}, {239, 114, 205, 255}}},
    {{{  -221,    170,      0}, 0, {   510,   -678}, {203, 114, 246, 255}}},
    {{{   111,    170,   -192}, 0, {   510,    386}, {35, 114, 215, 255}}},
    {{{  -146,    137,    254}, 0, {   407,   -436}, {198, 71, 86, 255}}},
    {{{   111,    170,    193}, 0, {   510,    386}, {17, 114, 51, 255}}},
    {{{  -110,    170,    193}, 0, {   510,   -323}, {221, 114, 41, 255}}},
    {{{  -146,      0,    254}, 0, {     0,   -436}, {215,  0, 119, 255}}},
};



Light_t totwc_light_05001BC0 = {
    { 255, 255, 255 }, 0, { 255, 255, 255 }, 0, { 40, 40, 40 }, 0
};


Light_t totwc_light_05001BB8 = {
    { 63, 63, 63 }, 0, { 63, 63, 63 }, 0, { -1, -1, -1 }, 0
};


Light_t totwc_light_05001BD8 = {
    { 255, 255, 255 }, 0, { 255, 255, 255 }, 0, { 40, 40, 40 }, 0
};


Light_t totwc_light_05001BD0 = {
    { 63, 63, 63 }, 0, { 63, 63, 63 }, 0, { -1, -1, -1 }, 0
};


const Gfx totwc_dl_05002D88[] = {
    gsSPCullDisplayList(/* v0 */ 0x0, /* vn */ 0xB),
    gsDPSetTextureImage(/* fmt */ G_IM_FMT_IA, /* siz */ G_IM_SIZ_16b, /* width */ 0x1, /* texture_record */ totwc_texture_05001C48_0091260C_seg5),
    gsDPLoadSync(),
    gsDPLoadBlock(/* tile */ G_TX_LOADTILE, /* uls */ 0x0, /* ult */ 0x0, /* lrs */ 0x7FF, /* dxt */ 0x100),
    gsSPLight(/* light */ &totwc_light_05001BC0.col, /* idx */ 1),
    gsSPLight(/* light */ &totwc_light_05001BB8.col, /* idx */ 2),
    gsSPVertex(/* vertices */ totwc_vertex_05002CC8_n12, /* count */ 0xC, /* v0 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x0, /* v01 */ 0x1, /* v02 */ 0x2, /* flag0 */ 0x0, /* v10 */ 0x1, /* v11 */ 0x0, /* v12 */ 0x3, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x4, /* v01 */ 0x3, /* v02 */ 0x0, /* flag0 */ 0x0, /* v10 */ 0x5, /* v11 */ 0x4, /* v12 */ 0x0, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x6, /* v01 */ 0x7, /* v02 */ 0x8, /* flag0 */ 0x0, /* v10 */ 0x8, /* v11 */ 0x7, /* v12 */ 0x9, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x7, /* v01 */ 0x6, /* v02 */ 0xA, /* flag0 */ 0x0, /* v10 */ 0xB, /* v11 */ 0x9, /* v12 */ 0x7, /* flag1 */ 0x0),
    gsSPEndDisplayList(),
};

const Gfx totwc_dl_05002E00[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(/* cycle1 */ G_CC_MODULATEIA, /* cycle2 */ G_CC_MODULATEIA),
    gsDPSetTile(/* fmt */ G_IM_FMT_IA, /* siz */ G_IM_SIZ_16b, /* line */ 0x0, /* tmem */ 0x0, /* tile */ G_TX_LOADTILE, /* palette */ 0x0, /* cmt */ G_TX_WRAP, /* maskt */ 0x0, /* shiftt */ 0x0, /* cms */ G_TX_WRAP, /* masks */ 0x0, /* shifts */ 0x0),
    gsSPTexture(/* s */ 0xFFFF, /* t */ 0xFFFF, /* level */ 0x0, /* tile */ G_TX_RENDERTILE, /* on */ G_ON),
    gsDPTileSync(),
    gsDPSetTile(/* fmt */ G_IM_FMT_IA, /* siz */ G_IM_SIZ_16b, /* line */ 0x8, /* tmem */ 0x0, /* tile */ G_TX_RENDERTILE, /* palette */ 0x0, /* cmt */ G_TX_CLAMP, /* maskt */ 0x6, /* shiftt */ 0x0, /* cms */ G_TX_CLAMP, /* masks */ 0x5, /* shifts */ 0x0),
    gsDPSetTileSize(/* tile */ G_TX_RENDERTILE, /* uls */ 0x0, /* ult */ 0x0, /* lrs */ 0x7C, /* lrt */ 0xFC),
    gsSPDisplayList(/* dl */ totwc_dl_05002D88),
    gsSPTexture(/* s */ 0xFFFF, /* t */ 0xFFFF, /* level */ 0x0, /* tile */ G_TX_RENDERTILE, /* on */ G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(/* cycle1 */ G_CC_SHADE, /* cycle2 */ G_CC_SHADE),
    gsSPEndDisplayList(),
};

const Gfx totwc_dl_05003020[] = {
    gsSPCullDisplayList(/* v0 */ 0x0, /* vn */ 0xF),
    gsDPSetTextureImage(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* width */ 0x1, /* texture_record */ totwc_texture_05002C48_0091360C_seg5),
    gsDPLoadSync(),
    gsDPLoadBlock(/* tile */ G_TX_LOADTILE, /* uls */ 0x0, /* ult */ 0x0, /* lrs */ 0x3F, /* dxt */ 0x200),
    gsSPLight(/* light */ &totwc_light_05001BD8.col, /* idx */ 1),
    gsSPLight(/* light */ &totwc_light_05001BD0.col, /* idx */ 2),
    gsSPVertex(/* vertices */ totwc_vertex_05002E60_n16, /* count */ 0x10, /* v0 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x0, /* v01 */ 0x1, /* v02 */ 0x2, /* flag0 */ 0x0, /* v10 */ 0x3, /* v11 */ 0x4, /* v12 */ 0x5, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x4, /* v01 */ 0x6, /* v02 */ 0x5, /* flag0 */ 0x0, /* v10 */ 0x4, /* v11 */ 0x7, /* v12 */ 0x6, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x7, /* v01 */ 0x8, /* v02 */ 0x6, /* flag0 */ 0x0, /* v10 */ 0x6, /* v11 */ 0x9, /* v12 */ 0xA, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x6, /* v01 */ 0x8, /* v02 */ 0x9, /* flag0 */ 0x0, /* v10 */ 0x5, /* v11 */ 0x6, /* v12 */ 0xA, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0xB, /* v01 */ 0x5, /* v02 */ 0xC, /* flag0 */ 0x0, /* v10 */ 0x3, /* v11 */ 0x5, /* v12 */ 0xB, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x5, /* v01 */ 0xA, /* v02 */ 0xC, /* flag0 */ 0x0, /* v10 */ 0x7, /* v11 */ 0x0, /* v12 */ 0x8, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x0, /* v01 */ 0x2, /* v02 */ 0x8, /* flag0 */ 0x0, /* v10 */ 0xD, /* v11 */ 0xE, /* v12 */ 0xF, /* flag1 */ 0x0),
    gsSP1Triangle(/* v0 */ 0x1, /* v1 */ 0xD, /* v2 */ 0x2, /* flag */ 0x0),
    gsSPVertex(/* vertices */ totwc_vertex_05002F60_n12, /* count */ 0xC, /* v0 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x0, /* v01 */ 0x1, /* v02 */ 0x2, /* flag0 */ 0x0, /* v10 */ 0x3, /* v11 */ 0x4, /* v12 */ 0x5, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x4, /* v01 */ 0x6, /* v02 */ 0x5, /* flag0 */ 0x0, /* v10 */ 0x4, /* v11 */ 0x2, /* v12 */ 0x6, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x3, /* v01 */ 0x5, /* v02 */ 0x7, /* flag0 */ 0x0, /* v10 */ 0x8, /* v11 */ 0x9, /* v12 */ 0xA, /* flag1 */ 0x0),
    gsSP2Triangles(/* v00 */ 0x1, /* v01 */ 0x8, /* v02 */ 0x2, /* flag0 */ 0x0, /* v10 */ 0x1, /* v11 */ 0xB, /* v12 */ 0x8, /* flag1 */ 0x0),
    gsSP1Triangle(/* v0 */ 0x2, /* v1 */ 0x8, /* v2 */ 0xA, /* flag */ 0x0),
    gsSPEndDisplayList(),
};

const Gfx totwc_dl_05003120[] = {
    gsDPPipeSync(),
    gsDPSetCombineMode(/* cycle1 */ G_CC_MODULATEI, /* cycle2 */ G_CC_MODULATEI),
    gsDPSetTile(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* line */ 0x0, /* tmem */ 0x0, /* tile */ G_TX_LOADTILE, /* palette */ 0x0, /* cmt */ G_TX_WRAP, /* maskt */ 0x0, /* shiftt */ 0x0, /* cms */ G_TX_WRAP, /* masks */ 0x0, /* shifts */ 0x0),
    gsSPTexture(/* s */ 0xFFFF, /* t */ 0xFFFF, /* level */ 0x0, /* tile */ G_TX_RENDERTILE, /* on */ G_ON),
    gsDPTileSync(),
    gsDPSetTile(/* fmt */ G_IM_FMT_RGBA, /* siz */ G_IM_SIZ_16b, /* line */ 0x4, /* tmem */ 0x0, /* tile */ G_TX_RENDERTILE, /* palette */ 0x0, /* cmt */ G_TX_WRAP, /* maskt */ 0x2, /* shiftt */ 0x0, /* cms */ G_TX_WRAP, /* masks */ 0x4, /* shifts */ 0x0),
    gsDPSetTileSize(/* tile */ G_TX_RENDERTILE, /* uls */ 0x0, /* ult */ 0x0, /* lrs */ 0x3C, /* lrt */ 0xC),
    gsSPDisplayList(/* dl */ totwc_dl_05003020),
    gsSPTexture(/* s */ 0xFFFF, /* t */ 0xFFFF, /* level */ 0x0, /* tile */ G_TX_RENDERTILE, /* on */ G_OFF),
    gsDPPipeSync(),
    gsDPSetCombineMode(/* cycle1 */ G_CC_SHADE, /* cycle2 */ G_CC_SHADE),
    gsSPEndDisplayList(),
};

ALIGNED8 Texture totwc_texture_05001C48_0091260C_seg5 = {
#include "totwc/totwc_texture_05001C48_0091260C_seg5.inc.c"
};



ALIGNED8 Texture totwc_texture_05002C48_0091360C_seg5 = {
#include "totwc/totwc_texture_05002C48_0091360C_seg5.inc.c"
};

