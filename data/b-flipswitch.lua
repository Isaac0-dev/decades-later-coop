-------------------------
-- Localized Functions --
-------------------------

local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local cur_obj_is_any_player_on_platform = cur_obj_is_any_player_on_platform
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local is_player_active = is_player_active
local load_object_collision_model = load_object_collision_model
local network_init_object = network_init_object
local network_send_object = network_send_object
local obj_count_objects_with_behavior_id = obj_count_objects_with_behavior_id
local obj_get_first_with_behavior_id = obj_get_first_with_behavior_id
local obj_get_next_with_same_behavior_id = obj_get_next_with_same_behavior_id
local obj_mark_for_deletion = obj_mark_for_deletion
local obj_set_model_extended = obj_set_model_extended
local smlua_collision_util_get = smlua_collision_util_get
local smlua_model_util_get_id = smlua_model_util_get_id
local spawn_red_coin_cutscene_star = spawn_red_coin_cutscene_star

-----------------------
-- Model / Collision --
-----------------------

local E_MODEL_FLIPSWITCH_PANEL = smlua_model_util_get_id("flipswitch_geo")
local COL_FLIPSWITCH_PANEL     = smlua_collision_util_get("flipswitch_collision")

-------------
-- Actions --
-------------

local FLIPSWITCH_PANEL_ACT_IDLE    = 0
local FLIPSWITCH_PANEL_ACT_PRESSED = 1

----------------------
-- Flipswitch Panel --
----------------------

---@param o Object
local function bhv_flipswitch_panel_init(o)
    o.collisionData = COL_FLIPSWITCH_PANEL
    o.header.gfx.skipInViewCheck = true
    obj_set_model_extended(o, E_MODEL_FLIPSWITCH_PANEL)
    network_init_object(o, false, { "oAction", "oAnimState" })
end

---@param o Object
local function bhv_flipswitch_panel_loop(o)
    load_object_collision_model()

    if o.oAnimState == 2 then
        return
    end

    local m = gMarioStates[0]
    local oldState = o.oAnimState

    if o.oAction == FLIPSWITCH_PANEL_ACT_IDLE then
        if cur_obj_is_mario_on_platform() ~= 0 and is_player_active(m) ~= 0 then
            o.oAnimState = o.oAnimState ~ 1 -- XOR
            cur_obj_play_sound_1(SOUND_GENERAL_BIG_CLOCK)
            o.oAction = FLIPSWITCH_PANEL_ACT_PRESSED
        end
    elseif o.oAction == FLIPSWITCH_PANEL_ACT_PRESSED then
        if cur_obj_is_any_player_on_platform() == 0 then
            o.oAction = FLIPSWITCH_PANEL_ACT_IDLE
        end
    end

    if oldState ~= o.oAnimState then
        network_send_object(o, true)
    end
end

local id_bhvFlipswitchPanel = hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_flipswitch_panel_init, bhv_flipswitch_panel_loop, "bhvFlipSwitchPanel")

--------------------------
-- Flipswitch StarSpawn --
--------------------------

---@param o Object
local function bhv_flipswitch_starspawn_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.oHealth = 0
end

---@param o Object
local function bhv_flipswitch_starspawn_loop(o)
    local totalPanels = obj_count_objects_with_behavior_id(id_bhvFlipswitchPanel)
    if totalPanels <= 0 then
        return
    end

    if totalPanels > o.oHealth or o.oHealth == 0 then
        o.oHealth = totalPanels
        return
    end

    local pressCount = 0
    local panel = obj_get_first_with_behavior_id(id_bhvFlipswitchPanel)

    while panel do
        if panel.oAnimState == 2 then
            obj_mark_for_deletion(o)
            return
        end

        if panel.oAnimState == 1 then
            pressCount = pressCount + 1
        end
        panel = obj_get_next_with_same_behavior_id(panel)
    end

    if pressCount == o.oHealth then
        local p = obj_get_first_with_behavior_id(id_bhvFlipswitchPanel)

        while p do
            p.oAnimState = 2
            network_send_object(p, true)
            p = obj_get_next_with_same_behavior_id(p)
        end

        spawn_red_coin_cutscene_star(o.oPosX, o.oPosY, o.oPosZ)
        obj_mark_for_deletion(o)
    end
end

hook_behavior(nil, OBJ_LIST_GENACTOR, false, bhv_flipswitch_starspawn_init, bhv_flipswitch_starspawn_loop, "bhvFlipSwitchStarSpawn")