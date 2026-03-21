#include "src/game/envfx_snow.h"

const GeoLayout greenboard_switch_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, greenboard_switch_Green_Switch_mesh_layer_1),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
