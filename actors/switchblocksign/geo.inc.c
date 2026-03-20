#include "src/game/envfx_snow.h"

const GeoLayout switchblocksign_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),

		GEO_SWITCH_CASE(2, geo_switch_anim_state),
		GEO_OPEN_NODE(),
			GEO_DISPLAY_LIST(LAYER_OPAQUE, switchblocksign_Blue_Sign_mesh_layer_1),
			GEO_DISPLAY_LIST(LAYER_OPAQUE, switchblocksign_Red_Sign_mesh_layer_1),
		GEO_CLOSE_NODE(),

	GEO_CLOSE_NODE(),
	GEO_END(),
};