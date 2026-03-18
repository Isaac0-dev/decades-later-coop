const GeoLayout Flipswitch_Panel_MOP[] = {
    GEO_CULLING_RADIUS(4000),
    GEO_OPEN_NODE(),
        GEO_SWITCH_CASE(3, geo_switch_anim_state),
        GEO_OPEN_NODE(),
            GEO_DISPLAY_LIST(1, dl_04077040),
            GEO_DISPLAY_LIST(1, dl_04076240),
            GEO_DISPLAY_LIST(1, dl_040751E0),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
    GEO_END(),
};
