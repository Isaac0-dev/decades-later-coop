-------------------------
-- Localized Functions --
-------------------------

local load_object_collision_model = load_object_collision_model
local obj_copy_pos_and_angle = obj_copy_pos_and_angle
local obj_set_model_extended = obj_set_model_extended
local smlua_collision_util_get = smlua_collision_util_get
local smlua_model_util_get_id = smlua_model_util_get_id
local spawn_non_sync_object = spawn_non_sync_object

-----------------------
-- Model / Collision --
-----------------------

local E_MODEL_FLIPSWAP_PLATFORM         = smlua_model_util_get_id("flipswap_geo")
local E_MODEL_FLIPSWAP_PLATFORM_BORDER  = smlua_model_util_get_id("flipswap_border_geo")
local COL_FLIPSWAP_PLATFORM_MOP         = smlua_collision_util_get("flipswap_collision")

-------------
-- Helpers --
-------------

---@param parent Object
---@param model ModelExtendedId
---@param behaviorId BehaviorId
local function spawn_object(parent, model, behaviorId)
    local obj = spawn_non_sync_object(behaviorId, model, 0, 0, 0, nil)
    if not obj then return nil end

    obj_copy_pos_and_angle(obj, parent)
    return obj
end

---@param o Object
local function bhv_flipswap_border(o)
    obj_set_model_extended(o, E_MODEL_FLIPSWAP_PLATFORM_BORDER)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.header.gfx.skipInViewCheck = true
end

local id_bhvFlipswapBorder = hook_behavior(nil, OBJ_LIST_DEFAULT, false, bhv_flipswap_border, nil)

-------------
-- Actions --
-------------

local FLIPSWAP_PLATFORM_ACT_IDLE = 0
local FLIPSWAP_PLATFORM_ACT_FLIPPING = 1

--------------
-- FlipSwap --
--------------

local FLIP_SPEED_MULTIPLIER = 1

---@param o Object
local function bhv_flipswap_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.collisionData = COL_FLIPSWAP_PLATFORM_MOP
    o.header.gfx.skipInViewCheck = true
    obj_set_model_extended(o, E_MODEL_FLIPSWAP_PLATFORM)
    spawn_object(o, E_MODEL_NONE, id_bhvFlipswapBorder)
end

---@param o Object
local function bhv_flipswap_loop(o)
    local m = gMarioStates[0]
    load_object_collision_model()

    local action = o.oAction

    if action == FLIPSWAP_PLATFORM_ACT_IDLE then
        -- If Mario enters an air action, start flipping
        if m.prevAction & ACT_GROUP_MASK ~= ACT_GROUP_AIRBORNE and m.action & ACT_GROUP_MASK == ACT_GROUP_AIRBORNE then
            --sloth brain it
            if o.oFaceAngleRoll == 0 then
                o.oMoveAngleRoll = -2048 * FLIP_SPEED_MULTIPLIER
            else
                o.oMoveAngleRoll = 2048 * FLIP_SPEED_MULTIPLIER
            end
            o.oAction = FLIPSWAP_PLATFORM_ACT_FLIPPING
        end
    elseif action == FLIPSWAP_PLATFORM_ACT_FLIPPING then
        -- Flip the platform
        if o.oTimer < 16 * FLIP_SPEED_MULTIPLIER ^ -1 then
            o.oFaceAngleRoll = o.oFaceAngleRoll + o.oMoveAngleRoll
        -- Disallow flipping again until Mario lands
        elseif m.action & ACT_GROUP_MASK ~= ACT_GROUP_AIRBORNE then
            o.oAction = FLIPSWAP_PLATFORM_ACT_IDLE
        end
    end
end

hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_flipswap_init, bhv_flipswap_loop, "bhvFlipswap_Platform_MOP")