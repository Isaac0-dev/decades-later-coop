#include "src/game/envfx_snow.h"

const GeoLayout switchblock_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),

		GEO_OPEN_NODE(),
			GEO_SWITCH_CASE(3, geo_switch_anim_state),
			GEO_OPEN_NODE(),
				GEO_DISPLAY_LIST(LAYER_OPAQUE, switchblock_Blue_SwitchBlock_mesh_layer_1),
				GEO_DISPLAY_LIST(LAYER_OPAQUE, switchblock_Red_SwitchBlock_mesh_layer_1),
				GEO_DISPLAY_LIST(LAYER_OPAQUE, switchblock_Empty_SwitchBlock_mesh_layer_1),
			GEO_CLOSE_NODE(),
		GEO_CLOSE_NODE(),

	GEO_CLOSE_NODE(),
	GEO_END(),
};
