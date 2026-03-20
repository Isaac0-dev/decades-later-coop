#include "src/game/envfx_snow.h"

const GeoLayout switchblockswitch_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),

		GEO_SWITCH_CASE(2, geo_switch_anim_state),
		GEO_OPEN_NODE(),
			GEO_DISPLAY_LIST(LAYER_OPAQUE, switchblockswitch_Blue_SwitchBlockSwitch_mesh_layer_1),
			GEO_DISPLAY_LIST(LAYER_OPAQUE, switchblockswitch_Red_SwitchBlockSwitch_mesh_layer_1),
		GEO_CLOSE_NODE(),

	GEO_CLOSE_NODE(),
	GEO_END(),
};