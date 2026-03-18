#include "src/game/envfx_snow.h"

const GeoLayout flipswap_border_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, flipswap_border_node_001_mesh_layer_1),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
