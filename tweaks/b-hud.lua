-- Tweaked version of OneCalledRPG Custom Hud Template v1.3

-------------------------
-- Localized Functions --
-------------------------

local cam_select_alt_mode = cam_select_alt_mode
local camera_is_frozen = camera_is_frozen
local djui_hud_get_screen_height = djui_hud_get_screen_height
local djui_hud_get_screen_width = djui_hud_get_screen_width
local djui_hud_measure_text = djui_hud_measure_text
local djui_hud_print_text = djui_hud_print_text
local djui_hud_render_texture = djui_hud_render_texture
local djui_hud_set_color = djui_hud_set_color
local djui_hud_set_font = djui_hud_set_font
local djui_hud_set_resolution = djui_hud_set_resolution
local hud_get_value = hud_get_value
local hud_hide = hud_hide
local hud_render_power_meter_interpolated = hud_render_power_meter_interpolated
local hud_show = hud_show
local obj_get_first_with_behavior_id = obj_get_first_with_behavior_id
local play_sound = play_sound
local set_cam_angle = set_cam_angle

---------
-- Hud --
---------

local CUSTOM_HUD = true                     -- Toggle on/off the HUD with "/custom-hud". On by default

local charSelectOn = false                  -- Checks for Character Select
hook_event(HOOK_ON_MODS_LOADED, function(m)
    charSelectOn = _G.charSelectExists
end)

-- Vanilla Life Icons
local LIFE_ICONS = {
    [CT_MARIO]    = gTextures.mario_head,
    [CT_LUIGI]    = gTextures.luigi_head,
    [CT_TOAD]     = gTextures.toad_head,
    [CT_WALUIGI]  = gTextures.waluigi_head,
    [CT_WARIO]    = gTextures.wario_head,
}

-- This section handles the lives, coins, and star sections separately, to make it easier to deal with the HUD layouts
-- If you want to change the spacing or content of the functions themselves, do it here. For simple placement, do it in the HUD rendering function
-- Note, in the event the parameter only asks for 4 inputs instead of 5, the horizontal scale (scaleW) becomes the single value for the scale (notable for rendering text or the CS icons)

-----------
-- Lives --
-----------

-- unused

--[[ local function render_lives_segment(x, y, scaleW, scaleH)
    local lifeVal = hud_get_value(HUD_DISPLAY_LIVES)
    local livesStr = tostring(math.abs(lifeVal))

    if lifeVal < 0 then
        livesStr = "M" .. livesStr
    end

    local m = gMarioStates[0]

    if charSelectOn then
        _G.charSelect.character_render_life_icon(0, x, y, 1)
    else
        djui_hud_render_texture(LIFE_ICONS[m.character.type], x, y, 1, 1)
    end

    djui_hud_print_text("@", x + 16, y, scaleW)
    djui_hud_print_text(livesStr, x + 32, y, scaleW)
end --]]

-----------
-- Coins --
-----------

local function render_coins_segment(x, y, scaleW, scaleH)
    local np = gNetworkPlayers[0]
    local level = np.currLevelNum
    if level == LEVEL_CASTLE_GROUNDS or level == LEVEL_CASTLE_COURTYARD or level == LEVEL_CASTLE then
        return
    end

    local coinVal = hud_get_value(HUD_DISPLAY_COINS)
    local coinsStr = tostring(math.abs(coinVal))

    if coinVal < 0 then
        coinsStr = "M" .. coinsStr
    end

    djui_hud_render_texture(gTextures.coin, x, y, scaleW, scaleH)
    djui_hud_print_text("@", x + 16, y, scaleW)
    djui_hud_print_text(coinsStr, x + 30, y, scaleW)
end

-----------
-- Stars --
-----------

local function render_stars_segment(x, y, scaleW, scaleH)
    local starVal = hud_get_value(HUD_DISPLAY_STARS)
    local starsStr = tostring(math.abs(starVal))

    if starVal < 0 then
        starsStr = "M" .. starsStr
    end

    if charSelectOn then
        _G.charSelect.character_render_star_icon(0, x, y, 1)
    else
        djui_hud_render_texture(gTextures.star, x, y, 1, 1)
    end

    local m = gMarioStates[0]
    if m.numStars < 100 then
        djui_hud_print_text("@", x + 16, y, scaleW)
        djui_hud_print_text(starsStr, x + 30, y, scaleW)
    else
        djui_hud_print_text(starsStr, x + 16, y, scaleW)
    end
end

-----------------
-- Power Meter --
-----------------

local pmTimer = 0
local ascendValue = 0
local doOnce = true
local function render_power_meter(x, y, scaleW, scaleH)
    local m = gMarioStates[0]

    local prevAscendValue = ascendValue
    local renderPowerMeter = (math.ceil(m.health / 256) - 1 < 8) or (m.action & ACT_GROUP_MASK == ACT_GROUP_SUBMERGED)

    if pmTimer > 0 then
        pmTimer = pmTimer - 1
    elseif renderPowerMeter then
        if ascendValue < -1 then
            ascendValue = 35
            prevAscendValue = 35
        end

        if ascendValue >= 31 then
            ascendValue = ascendValue - 5
        elseif ascendValue >= 21 then
            ascendValue = ascendValue - 3
        elseif ascendValue >= 10 then
            ascendValue = ascendValue - 2
        elseif ascendValue >= 0 then
            ascendValue = ascendValue - 1
        end
    else
        if ascendValue == -1 and not doOnce then
            pmTimer = 90
            doOnce = true
        end

        if ascendValue > -100 and pmTimer == 0 then
            ascendValue = ascendValue - 20
            doOnce = false
        end
    end

    local prevY = y + prevAscendValue
    local currY = y + ascendValue

    djui_hud_set_color(255, 255, 255, 255)
    hud_render_power_meter_interpolated(m.health, x, prevY, scaleW, scaleH, x, currY, scaleW, scaleH)
end

---------------
-- Cap Timer --
---------------

local TEX_WING     = get_texture_info("wing")
local TEX_METAL    = get_texture_info("metal")
local TEX_VANISH   = get_texture_info("vanish")
local TEX_WMCAP    = get_texture_info("wmcap")
local TEX_VMCAP    = get_texture_info("vmcap")
local TEX_WVCAP    = get_texture_info("wvcap")
local TEX_THREECAP = get_texture_info("threecap")

local ALL_CAPS_MASK = MARIO_WING_CAP | MARIO_METAL_CAP | MARIO_VANISH_CAP

local CAP_TEXTURE_MAP = {
    [MARIO_WING_CAP]                                      = TEX_WING,
    [MARIO_METAL_CAP]                                     = TEX_METAL,
    [MARIO_VANISH_CAP]                                    = TEX_VANISH,
    [MARIO_WING_CAP | MARIO_METAL_CAP]                    = TEX_WMCAP,
    [MARIO_WING_CAP | MARIO_VANISH_CAP]                   = TEX_WVCAP,
    [MARIO_VANISH_CAP | MARIO_METAL_CAP]                  = TEX_VMCAP,
    [MARIO_WING_CAP | MARIO_METAL_CAP | MARIO_VANISH_CAP] = TEX_THREECAP,
}

local function render_cap_timer(timer, x, y)
    local m = gMarioStates[0]
    local currentCaps = m.flags & ALL_CAPS_MASK
    if currentCaps == 0 then return end

    local curCapTex = CAP_TEXTURE_MAP[currentCaps]
    if not curCapTex then return end

    djui_hud_print_text("@", x + 16, y, 1)
    djui_hud_print_text(tostring(timer), x + 32, y, 1)
    djui_hud_render_texture(curCapTex, x, y, 1, 1)
end

-----------
-- Timer --
-----------

local function render_timer(timer, x, y)
    djui_hud_set_color(255, 255, 255, 255)

    if hud_get_value(HUD_DISPLAY_FLAGS) & HUD_DISPLAY_FLAGS_TIMER ~= 0 then
        local minutes       = math.floor(timer/30/60%60)
        local seconds       = math.floor(timer/30)%60
        local milliseconds  = math.floor(timer/30%1 * 10)

        local minStr = string.format("%d", minutes)
        local secStr = string.format("%02d", seconds)
        local msStr  = string.format("%d", milliseconds)

        local msWidth = djui_hud_measure_text(msStr)

        local totalWidth = (66 + msWidth) - 12

        local baseX = x - (totalWidth / 2) - 12

        djui_hud_print_text(minStr, baseX + 12, y, 1)
        djui_hud_print_text(secStr, baseX + 32, y, 1)
        djui_hud_print_text('"', baseX + 57, y - 7, 1)
        djui_hud_print_text(msStr, baseX + 66, y, 1)
    end
end

------------
-- Camera --
------------

local is_cam_cdown = false
local function render_camera(x, y, scaleW, scaleH)
    local m = gMarioStates[0]
    local c = m.area and m.area.camera or nil
    if not c then return end

    if c.cutscene ~= 0 or (m.controller.buttonDown & R_TRIG ~= 0 and cam_select_alt_mode(0) == CAM_SELECTION_FIXED) or camera_is_frozen() then
        djui_hud_render_texture(gTextures.no_camera, x, y, scaleW, scaleH)
    elseif set_cam_angle(0) == CAM_ANGLE_MARIO then
        if charSelectOn then
            _G.charSelect.character_render_life_icon(0, x, y, 1)
        else
            djui_hud_render_texture(LIFE_ICONS[m.character.type], x, y, 1, 1)
        end
    else
        djui_hud_render_texture(gTextures.lakitu, x, y, scaleW, scaleH)
    end

    djui_hud_render_texture(gTextures.camera, x - 16, y, scaleW, scaleH)

    if c.mode == CAMERA_MODE_C_UP then
        djui_hud_render_texture(gTextures.arrow_up, x - 12, y - 8, scaleW, scaleH)
    end

    if c.cutscene == 0 and c.mode ~= CAMERA_MODE_C_UP and c.mode ~= CAMERA_MODE_BEHIND_MARIO then
        local pressed = m.controller.buttonPressed

        if pressed & D_CBUTTONS ~= 0 then
            is_cam_cdown = true
        elseif pressed & U_CBUTTONS ~= 0 then
            is_cam_cdown = false
        end
    end

    if is_cam_cdown then
        djui_hud_render_texture(gTextures.arrow_down, x - 12, y + 16, scaleW, scaleH)
    end
end

------------
-- Render --
------------

local function on_hud_render_behind()
    if not CUSTOM_HUD then return end

    hud_hide()                                                                      -- Hides base HUD
    if obj_get_first_with_behavior_id(id_bhvActSelector) ~= nil then return end     -- Hides HUD during star select
    if gNetworkPlayers[0].currActNum == 99 then return end                          -- Hides HUD during Act 99, aka credits

    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_color(255, 255, 255, 255)
    djui_hud_set_font(FONT_HUD)

    local m = gMarioStates[0]
    local screenWidth       = djui_hud_get_screen_width()
    local screenHeight      = djui_hud_get_screen_height()
    local halfScreenWidth   = djui_hud_get_screen_width() / 2
    local halfScreenHeight  = djui_hud_get_screen_height() / 2

    local capTimer          = math.ceil(m.capTimer / 30)

    if CUSTOM_HUD then
        --render_lives_segment(22, 15, 1, 1)
        render_stars_segment(15, 15, 1, 1)
        render_coins_segment(15, 35, 1, 1)
        render_power_meter(screenWidth - 65, 2, 65, 65)
        render_camera(screenWidth - 38, screenHeight - 35, 1, 1)
        render_cap_timer(capTimer, 15, screenHeight - 35)
        render_timer(hud_get_value(HUD_DISPLAY_TIMER), halfScreenWidth, 15)
    end
end

hook_event(HOOK_ON_HUD_RENDER_BEHIND, on_hud_render_behind)

-- Chat commands
hook_chat_command("custom-hud", "to toggle between custom and vanilla HUDs, /custom-hud [hide/show] to hide or show the HUD altogether",
function (msg)
    local m = gMarioStates[0]
    play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.pos)

    if msg == "hide" then
        CUSTOM_HUD = false
        hud_hide()

    elseif msg == "unhide" or msg == "show" then
        CUSTOM_HUD = true

    elseif msg == "base" or msg == "vanilla" or msg == "off" then
        CUSTOM_HUD = false
        hud_show()
    else
        CUSTOM_HUD = not CUSTOM_HUD
        if not CUSTOM_HUD then
            hud_show()
        end
    end
    return true
end)
