#include "src/game/envfx_snow.h"

const GeoLayout shrinkplat_geo[] = {
	GEO_NODE_START(),
	GEO_OPEN_NODE(),
		GEO_DISPLAY_LIST(LAYER_OPAQUE, shrinkplat_SHRINK_mesh_layer_1),
	GEO_CLOSE_NODE(),
	GEO_END(),
};
