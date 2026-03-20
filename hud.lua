--template hud mod, accurate hud but still wip

timer = false
dl_hud = true
ts = false
stationarymeter = false



-- checks for cs
-- local charSelectOn = false
-- hook_event(HOOK_ON_MODS_LOADED, function(m)
--     charSelectOn = _G.charSelectExists
-- end)



--[[local powerMeters = {
    ["left"] = {
        [1] = get_texture_info("*left power meter*")
    },
    ["right"] = {
        [1] = get_texture_info("*right power meter*")
    },
    [1] = {
        [1] = get_texture_info("*1*")
    },
    [2] = {
        [1] = get_texture_info(*2*")
    },
    [3] = {
        [1] = get_texture_info("*3*")
    },
    [4] = {
        [1] = get_texture_info("*4*")
    },
    [5] = {
        [1] = get_texture_info("*5*")
    },
    [6] = {
        [1] = get_texture_info("*6*")
    },
    [7] = {
        [1] = get_texture_info("*7*")
    },
    [8] = {
        [1] = get_texture_info("*8*")
    }
}]]



function render_coins_segment(x, y, scaleW, scaleH)
    if ts then
        coins = tostring(string.format("%02d", hud_get_value(HUD_DISPLAY_COINS))):gsub("-", "M")
    else
        coins = tostring(string.format(hud_get_value(HUD_DISPLAY_COINS))):gsub("-", "M")
    end

    if gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_COURTYARD and gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE then     -- Hides coin display in certain areas
        djui_hud_render_texture(gTextures.coin, x, y, scaleW, scaleH)
        djui_hud_print_text("@", x + 16, y, scaleW)
        djui_hud_print_text(coins, x + 30, y, scaleW)
    end
end

function render_stars_segment(x, y, scaleW, scaleH)
    if ts then
        stars = tostring(string.format("%02d", hud_get_value(HUD_DISPLAY_STARS))):gsub("-", "M")
    else
        stars = tostring(string.format(hud_get_value(HUD_DISPLAY_STARS))):gsub("-", "M")
    end

    if charSelectOn then
        _G.charSelect.character_render_star_icon(0, x, y, 1)
    else
        djui_hud_render_texture(gTextures.star, x, y, 1, 1)
    end
    if gMarioStates[0].numStars < 100 then 
        djui_hud_print_text("@", x + 16, y, scaleW) 
        djui_hud_print_text(stars, x + 30, y, scaleW) 
    else
        djui_hud_print_text(stars, x + 16, y, scaleW)
    end
end
	

local timerup = 0
local ascend = 0
local once = true
function render_power_meter(x, y, scaleW, scaleH)
    local health = math.ceil(gMarioStates[0].health / 256) - 1

    local renderPowerMeter = health < 8 or gMarioStates[0].action & ACT_GROUP_MASK == ACT_GROUP_SUBMERGED or stationarymeter
    if not stationarymeter then
        if timerup > 0 then
            timerup = timerup - 2.5
        elseif renderPowerMeter then
            if ascend < -1 then
                ascend = 35
            end
            if ascend >= 31 then ascend = ascend - 5
            elseif ascend >= 21 then ascend = ascend - 3
            elseif ascend >= 10 then ascend = ascend - 2
            elseif ascend >= 0 then ascend = ascend - 1 end
        else
            if ascend == -1 and not once then
                timerup = 90
                once = true
            end
            if ascend > 0 - 100 and timerup == 0 then
                ascend = ascend - 20
                once = false
            end
        end
    end


    djui_hud_set_color(255, 255, 255, 255)
    hud_render_power_meter_interpolated(gMarioStates[0].health, x, y + ascend, scaleW, scaleH, x, y + ascend, scaleW, scaleH)
end


seconds = 0
milliseconds = 0
function render_timer(timer, x, y)
    djui_hud_set_color(255, 255, 255, 255)

    if hud_get_value(HUD_DISPLAY_FLAGS) & HUD_DISPLAY_FLAGS_TIMER ~= 0 then
        if timer then 
            minutes = math.floor(timer/30/60%60)
            seconds = math.floor(timer/30)%60
            milliseconds = math.floor(timer/30%1 * 100)

            djui_hud_print_text(string.format("%02d", minutes), x + 12, y, 1)
            djui_hud_print_text("'", x + 36, y - 7, 1)
            djui_hud_print_text(string.format("%02d", seconds), x + 47, y, 1)
            djui_hud_print_text('"', x + 73, y - 7, 1)
            djui_hud_print_text(string.format("%02d", milliseconds), x + 87, y, 1)

        elseif not timer then
            minutes = math.floor(timer/30/60%60)
            seconds = math.floor(timer/30)%60
            milliseconds = math.floor(timer/30%1 * 10)

            djui_hud_print_text(string.format("%d", minutes), x + 12, y, 1)
            djui_hud_print_text("'", x + 22, y - 7, 1)
            djui_hud_print_text(string.format("%02d", seconds), x + 32, y, 1)
            djui_hud_print_text('"', x + 57, y - 7, 1)
            djui_hud_print_text(string.format("%d", milliseconds), x + 66, y, 1)
        end
    end
end


local function on_hud_render() 
    if not dl_hud then return end
    hud_hide()
    if obj_get_first_with_behavior_id(id_bhvActSelector) ~= nil then return end 
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_color(255, 255, 255, 255)
    screenWidth = djui_hud_get_screen_width() 
    screenHeight = djui_hud_get_screen_height()
    halfScreenWidth = djui_hud_get_screen_width() / 2
    halfScreenHeight = djui_hud_get_screen_height() / 2
    djui_hud_set_font(FONT_HUD)

    if dl_hud then 
        render_stars_segment(15, 20, 1, 1)
		render_coins_segment(15, 40, 1, 1)
		render_power_meter(screenWidth - 65, 2, 65, 65)
        if timer then
            render_timer(hud_get_value(HUD_DISPLAY_TIMER), halfScreenWidth - 47, screenHeight * 0.85)
        else
            render_timer(hud_get_value(HUD_DISPLAY_TIMER), halfScreenWidth + 54, 39)
        end
    end
end

hook_event(HOOK_ON_HUD_RENDER_BEHIND, on_hud_render)
