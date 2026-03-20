function hide_lives()
	    local hudDisplayFlags = hud_get_value(HUD_DISPLAY_FLAGS)
		hud_set_value(HUD_DISPLAY_FLAGS, hudDisplayFlags & ~HUD_DISPLAY_FLAGS_LIVES)
	end

hook_event(HOOK_ON_HUD_RENDER, hide_lives)
