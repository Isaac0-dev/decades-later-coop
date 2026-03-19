-------------------------
-- Localized Functions --
-------------------------

local approach_f32_symmetric = approach_f32_symmetric
local coss = coss
local sins = sins
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local cur_obj_set_home_once = cur_obj_set_home_once
local load_object_collision_model = load_object_collision_model
local obj_copy_pos = obj_copy_pos
local obj_copy_pos_and_angle = obj_copy_pos_and_angle
local obj_set_model_extended = obj_set_model_extended
local smlua_collision_util_get = smlua_collision_util_get
local smlua_model_util_get_id = smlua_model_util_get_id
local spawn_non_sync_object = spawn_non_sync_object

-----------------------
-- Model / Collision --
-----------------------

local E_MODEL_GREEN_SWITCHBOARD         = smlua_model_util_get_id("greenboard_geo")
local E_MODEL_GREEN_SWITCHBOARD_GEARS   = smlua_model_util_get_id("greenboard_gear_geo")
local COL_GREEN_SWITCHBOARD_MOP         = smlua_collision_util_get("greenboard_collision")

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

---@param m MarioState
---@return boolean
local function is_bubbled(m)
    return m.action == ACT_BUBBLED
end

---@param o Object
local function play_board_sound(o)
    if o.oTimer % 2 == 0 then
        cur_obj_play_sound_1(SOUND_OBJ_KOOPA_WALK)
    end
end

----------
-- Gear --
----------

---@param o Object
local function bhv_greenboard_gear(o)
    obj_set_model_extended(o, E_MODEL_GREEN_SWITCHBOARD_GEARS)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
end

local id_bhvGreenBoardGear = hook_behavior(nil, OBJ_LIST_DEFAULT, false, bhv_greenboard_gear, nil)

-----------------
-- Green Board --
-----------------

---@param o Object
local function bhv_green_switchboard_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE | OBJ_FLAG_MOVE_XZ_USING_FVEL
    o.collisionData = COL_GREEN_SWITCHBOARD_MOP
    obj_set_model_extended(o, E_MODEL_GREEN_SWITCHBOARD)
    cur_obj_set_home_once()
    o.oIntroLakituCloud = spawn_object(o, E_MODEL_NONE, id_bhvGreenBoardGear)
end

---@param o Object
local function bhv_green_switchboard_loop(o)

    load_object_collision_model()
    local m = gMarioStates[0]

    local MAX_SPEED = 12
    local SPEED_INC = 2

    local child = o.oIntroLakituCloud

    local dot = 0
    local dotH = 0

    local forwardByte = (o.oBehParams >> 24) & 0xFF -- 1st byte determines how far the switchboard can go forwards
    local backwardByte = o.oBehParams2ndByte        -- 2nd byte determines how far the switchboard can go backwards
    local forwardLimit = forwardByte * 16
    local backwardLimit = backwardByte * -16

    -- Move Gears along with the platform
    if child ~= nil then
        child.oFaceAnglePitch = child.oFaceAnglePitch + (o.oForwardVel * 200)
        obj_copy_pos(child, o)
    end

    if cur_obj_is_mario_on_platform() ~= 0 and not is_bubbled(m) then

        local dx = m.pos.x - o.oPosX
        local dz = m.pos.z - o.oPosZ
        local dHx = o.oPosX - o.oHomeX
        local dHz = o.oPosZ - o.oHomeZ
        local facingZ = coss(o.oFaceAngleYaw)
        local facingX = sins(o.oFaceAngleYaw)

        dot = facingZ * dz + facingX * dx
        dotH = facingZ * dHz + facingX * dHx

        if dot > 0 then
            if dotH < forwardLimit then
                o.oForwardVel = approach_f32_symmetric(o.oForwardVel, MAX_SPEED, SPEED_INC)
                play_board_sound(o)
            else
                o.oForwardVel = 0
            end
            o.oFaceAnglePitch = approach_f32_symmetric(o.oFaceAnglePitch, 2048, 128)
        else
            if dotH > backwardLimit then
                o.oForwardVel = approach_f32_symmetric(o.oForwardVel, -MAX_SPEED, SPEED_INC)
                play_board_sound(o)
            else
                o.oForwardVel = 0
            end
            o.oFaceAnglePitch = approach_f32_symmetric(o.oFaceAnglePitch, -2048, 128)
        end
    else
        -- Slowly resets the pitch and speed back to 0
        o.oForwardVel = approach_f32_symmetric(o.oForwardVel, 0, SPEED_INC)
        o.oFaceAnglePitch = approach_f32_symmetric(o.oFaceAnglePitch, 0, 128)
    end
end

hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_green_switchboard_init, bhv_green_switchboard_loop, "bhvGreenSwitchboard")