#include "src/game/envfx_snow.h"

const GeoLayout Flipswap_Platform_MOP[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, Flipswap_Platform_MOP_node_mesh_layer_1),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
