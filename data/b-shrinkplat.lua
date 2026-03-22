-----------
-- Utils --
-----------

local BU = require("a-bhv-utils")

-------------------------
-- Localized Functions --
-------------------------

local is_bubbled = BU.is_bubbled
local spawn_object = BU.spawn_object
local cur_obj_hide = cur_obj_hide
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local cur_obj_unhide = cur_obj_unhide
local load_object_collision_model = load_object_collision_model
local obj_set_model_extended = obj_set_model_extended
local smlua_collision_util_get = smlua_collision_util_get
local smlua_model_util_get_id = smlua_model_util_get_id

-----------------------
-- Model / Collision --
-----------------------

local E_MODEL_SHRINK_PLATFORM           = smlua_model_util_get_id("shrinkplat_geo")
local E_MODEL_SHRINK_PLATFORM_BORDER    = smlua_model_util_get_id("shrinkplat_border_geo")
local COL_SHRINK_PLATFORM               = smlua_collision_util_get("shrinkplat_collision")

-------------
-- Actions --
-------------

local SHRINK_PLATFORM_ACT_IDLE = 0
local SHRINK_PLATFORM_ACT_SHRINKING = 1
local SHRINK_PLATFORM_ACT_DISAPPEARED = 2

-------------------
-- Shrink Border --
-------------------

---@param o Object
local function bhv_shrinkplat_border(o)
    obj_set_model_extended(o, E_MODEL_SHRINK_PLATFORM_BORDER)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.header.gfx.skipInViewCheck = true
end

local id_bhvShrinkPlatBorder = hook_behavior(nil, OBJ_LIST_DEFAULT, false, bhv_shrinkplat_border, nil)

------------
-- Shrink --
------------

-- this bhv probably needs to be synced since its main function is to make the platform shrink if a player is on it
-- however, there can be some levels where it's frustrating to have another player step on the platform

local SHRINK_TIME = 150
local RESPAWN_TIME = 120

---@param o Object
local function bhv_shrinkplatform_init(o)
    obj_set_model_extended(o, E_MODEL_SHRINK_PLATFORM)
    o.collisionData = COL_SHRINK_PLATFORM
    o.header.gfx.skipInViewCheck = true
    spawn_object(o, E_MODEL_NONE, id_bhvShrinkPlatBorder)
end

---@param o Object
local function bhv_shrinkplatform_loop(o)
    local m = gMarioStates[0]
    local action = o.oAction

    if action < SHRINK_PLATFORM_ACT_DISAPPEARED then
        load_object_collision_model()
    end

    if action == SHRINK_PLATFORM_ACT_IDLE then
        if cur_obj_is_mario_on_platform() ~= 0 and not is_bubbled(m) then
            o.oAction = SHRINK_PLATFORM_ACT_SHRINKING
            cur_obj_play_sound_1(SOUND_OBJ_UNK23)
        end

    elseif action == SHRINK_PLATFORM_ACT_SHRINKING then
        local scale = (SHRINK_TIME - o.oTimer) / SHRINK_TIME
        o.header.gfx.scale.x = scale
        o.header.gfx.scale.z = scale
        o.header.gfx.scale.y = scale

        if o.oTimer >= SHRINK_TIME then
            o.oAction = SHRINK_PLATFORM_ACT_DISAPPEARED
            cur_obj_hide()
        end

    elseif action == SHRINK_PLATFORM_ACT_DISAPPEARED then
        if o.oTimer >= RESPAWN_TIME then
            o.oAction = SHRINK_PLATFORM_ACT_IDLE
            o.header.gfx.scale.x = 1
            o.header.gfx.scale.z = 1
            o.header.gfx.scale.y = 1
            cur_obj_unhide()
        end
    end
end

-- Shrink Plat originally overrides "bhvWFBreakableWallRight"
hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_shrinkplatform_init, bhv_shrinkplatform_loop, "bhvShrinkPlatform")