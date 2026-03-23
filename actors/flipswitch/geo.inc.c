#include "src/game/envfx_snow.h"

const GeoLayout flipswitch_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),

		GEO_SWITCH_CASE(3, geo_switch_anim_state),
		GEO_OPEN_NODE(),
			GEO_DISPLAY_LIST(LAYER_OPAQUE, flipswitch_Blue_FlipSwitchPlat_mesh_layer_1),
			GEO_DISPLAY_LIST(LAYER_OPAQUE, flipswitch_Yellow_FlipSwitchPlat_mesh_layer_1),
			GEO_DISPLAY_LIST(LAYER_OPAQUE, flipswitch_Green_FlipSwitchPlat_mesh_layer_1),
		GEO_CLOSE_NODE(),

	GEO_CLOSE_NODE(),
	GEO_END(),
};