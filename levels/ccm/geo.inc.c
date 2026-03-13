const GeoLayout ccm_geo_0C000000[] = {
    GEO_SHADOW(1, 150, 100),
    GEO_OPEN_NODE(),
        GEO_SCALE(0, 0x00008000),
        GEO_OPEN_NODE(),
            GEO_ANIMATED_PART(1, 0, 0, 0, NULL),
            GEO_OPEN_NODE(),
                GEO_ANIMATED_PART(4, 0, 0, 0, ccm_dl_05002900),
                GEO_OPEN_NODE(),
                    GEO_ANIMATED_PART(1, 100, 0, 0, ccm_dl_05000328),
                    GEO_ANIMATED_PART(4, 100, 0, 0, ccm_dl_05002A20),
                    GEO_ANIMATED_PART(4, 100, 0, 0, ccm_dl_05002B30),
                    GEO_ANIMATED_PART(1, -88, 65504, 0, NULL),
                    GEO_OPEN_NODE(),
                        GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_050002A0),
                        GEO_ANIMATED_PART(4, 0, 0, 0, ccm_dl_05002D08),
                        GEO_ANIMATED_PART(1, 0, 0, 0, NULL),
                        GEO_ANIMATED_PART(1, 0, 0, 0, NULL),
                        GEO_ANIMATED_PART(1, 0, 0, 0, NULL),
                        GEO_ANIMATED_PART(1, 0, 0, 0, NULL),
                        GEO_CLOSE_NODE(),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(1, 0, 0, 0, NULL),
                GEO_OPEN_NODE(),
                    GEO_BILLBOARD_WITH_PARAMS(0, 0, 0, 0),
                    GEO_OPEN_NODE(),
                        GEO_DISPLAY_LIST(4, ccm_dl_05002748),
                        GEO_CLOSE_NODE(),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(4, 0, 0, 0, ccm_dl_05002830),
                GEO_CLOSE_NODE(),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_0C00021C[] = {
    GEO_SCALE(0, 0x00004000),
    GEO_OPEN_NODE(),
        GEO_ANIMATED_PART(1, 0, 0, 0, NULL),
        GEO_OPEN_NODE(),
            GEO_ANIMATED_PART(1, 0, 0, 0, NULL),
            GEO_OPEN_NODE(),
                GEO_BILLBOARD_WITH_PARAMS(0, 0, 0, 0),
                GEO_OPEN_NODE(),
                    GEO_DISPLAY_LIST(4, ccm_dl_0500C620),
                    GEO_CLOSE_NODE(),
                GEO_CLOSE_NODE(),
            GEO_OPEN_NODE(),
                GEO_ANIMATED_PART(1, 356, 0, 0, NULL),
                GEO_OPEN_NODE(),
                    GEO_BILLBOARD_WITH_PARAMS(0, 0, 0, 0),
                    GEO_OPEN_NODE(),
                        GEO_DISPLAY_LIST(4, ccm_dl_0500CBF8),
                        GEO_CLOSE_NODE(),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(4, 356, 0, 0, ccm_dl_0500CCE8),
                GEO_ANIMATED_PART(4, 356, 0, 0, ccm_dl_0500C760),
                GEO_SWITCH_CASE(2, geo_switch_anim_state),
                GEO_OPEN_NODE(),
                    GEO_NODE_START(),
                    GEO_NODE_START(),
                    GEO_OPEN_NODE(),
                        GEO_SCALE(0, 0x00010000),
                        GEO_OPEN_NODE(),
                            GEO_TRANSLATE_ROTATE_WITH_DL(1, 490, 14, 43, 305, 0, 248, dl_03022F48),
                            GEO_CLOSE_NODE(),
                        GEO_CLOSE_NODE(),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(1, 89, 0, 65307, NULL),
                GEO_OPEN_NODE(),
                    GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_0500C500),
                    GEO_OPEN_NODE(),
                        GEO_ANIMATED_PART(1, 68, 0, 0, ccm_dl_0500CAA8),
                        GEO_ASM(0, geo_update_projectile_pos_from_parent),
                        GEO_CLOSE_NODE(),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(1, 356, 0, 0, NULL),
                GEO_CLOSE_NODE(),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_0C000348[] = {
    GEO_SHADOW(1, 180, 160),
    GEO_OPEN_NODE(),
        GEO_BRANCH_AND_LINK(ccm_geo_0C00021C),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_0C000104[] = {
    GEO_SHADOW(1, 150, 100),
    GEO_OPEN_NODE(),
        GEO_SCALE(0, 0x00004000),
        GEO_OPEN_NODE(),
            GEO_ANIMATED_PART(1, 0, 0, 40, ccm_dl_05007540),
            GEO_OPEN_NODE(),
                GEO_ANIMATED_PART(1, -51, 84, 65523, NULL),
                GEO_OPEN_NODE(),
                    GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_05007198),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(1, 51, 84, 65523, NULL),
                GEO_OPEN_NODE(),
                    GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_050071E8),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(1, -38, 65482, 65523, NULL),
                GEO_OPEN_NODE(),
                    GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_05007238),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(1, 38, 65482, 65523, NULL),
                GEO_OPEN_NODE(),
                    GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_050072C8),
                    GEO_CLOSE_NODE(),
                GEO_ANIMATED_PART(1, 0, 111, 65517, NULL),
                GEO_OPEN_NODE(),
                    GEO_SWITCH_CASE(5, NULL),
                    GEO_OPEN_NODE(),
                        GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_05006428),
                        GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_05006458),
                        GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_05006488),
                        GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_050064B8),
                        GEO_ANIMATED_PART(1, 0, 0, 0, ccm_dl_050064E8),
                        GEO_CLOSE_NODE(),
                    GEO_CLOSE_NODE(),
                GEO_CLOSE_NODE(),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000660[] = {
    GEO_CULLING_RADIUS(3000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07002CC8),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000678[] = {
    GEO_CULLING_RADIUS(1000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(4, ccm_dl_07002E80),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000690[] = {
    GEO_CULLING_RADIUS(3000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07004A98),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120006A8[] = {
    GEO_CULLING_RADIUS(3000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07005C80),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120006C0[] = {
    GEO_CULLING_RADIUS(3500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07007E60),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120006D8[] = {
    GEO_CULLING_RADIUS(3500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07008258),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120006F0[] = {
    GEO_CULLING_RADIUS(2800),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07008E20),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000708[] = {
    GEO_CULLING_RADIUS(4000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0700BB48),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000720[] = {
    GEO_CULLING_RADIUS(3000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0700CA38),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000738[] = {
    GEO_CULLING_RADIUS(4000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0700DBD8),
        GEO_DISPLAY_LIST(4, ccm_dl_0700DE88),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000758[] = {
    GEO_CULLING_RADIUS(1500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(4, ccm_dl_0700E178),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000770[] = {
    GEO_CULLING_RADIUS(1500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(5, ccm_dl_0700E830),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000788[] = {
    GEO_CULLING_RADIUS(4000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07018720),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120007A0[] = {
    GEO_CULLING_RADIUS(3500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07014340),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120007B8[] = {
    GEO_CULLING_RADIUS(1600),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07014D68),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120007D0[] = {
    GEO_CULLING_RADIUS(3800),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(4, ccm_dl_070154F0),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120007E8[] = {
    GEO_CULLING_RADIUS(2500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(5, ccm_dl_07015AA0),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000800[] = {
    GEO_CULLING_RADIUS(4500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(5, ccm_dl_07017368),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000818[] = {
    GEO_CULLING_RADIUS(5000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(5, ccm_dl_07018990),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000830[] = {
    GEO_CULLING_RADIUS(3000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(4, ccm_dl_07018FD8),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120008C0[] = {
    GEO_CULLING_RADIUS(700),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701AC30),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000848[] = {
    GEO_CULLING_RADIUS(500),
    GEO_OPEN_NODE(),
        GEO_ASM(0, geo_exec_flying_carpet_create),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120008A8[] = {
    GEO_CULLING_RADIUS(1300),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701A9B0),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000878[] = {
    GEO_CULLING_RADIUS(1500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701A3A0),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120008D8[] = {
    GEO_CULLING_RADIUS(700),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701ADD8),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000890[] = {
    GEO_CULLING_RADIUS(1200),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(4, ccm_dl_0701A4B8),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000908[] = {
    GEO_CULLING_RADIUS(1000),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701B2D8),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000940[] = {
    GEO_CULLING_RADIUS(1100),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701BB20),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000860[] = {
    GEO_CULLING_RADIUS(1300),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07019918),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000920[] = {
    GEO_CULLING_RADIUS(420),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701B660),
        GEO_DISPLAY_LIST(4, ccm_dl_0701B798),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120008F0[] = {
    GEO_CULLING_RADIUS(500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701B058),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000958[] = {
    GEO_CULLING_RADIUS(1500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_0701DAE0),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000970[] = {
    GEO_CULLING_RADIUS(1500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07020F18),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_12000988[] = {
    GEO_CULLING_RADIUS(1500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_070239A8),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120009A0[] = {
    GEO_CULLING_RADIUS(1500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07026448),
        GEO_CLOSE_NODE(),
    GEO_END(),
};


const GeoLayout ccm_geo_120009B8[] = {
    GEO_CULLING_RADIUS(1500),
    GEO_OPEN_NODE(),
        GEO_DISPLAY_LIST(1, ccm_dl_07028DC0),
        GEO_CLOSE_NODE(),
    GEO_END(),
};
