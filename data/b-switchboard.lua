-----------
-- Utils --
-----------

local BU = require("a-bhv-utils")

-------------------------
-- Localized Functions --
-------------------------

local is_bubbled = BU.is_bubbled
local spawn_object = BU.spawn_object
local play_board_sound = BU.play_board_sound
local approach_f32_asymptotic = approach_f32_asymptotic
local approach_f32_symmetric = approach_f32_symmetric
local coss = coss
local sins = sins
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local cur_obj_set_home_once = cur_obj_set_home_once
local cur_obj_set_pos_to_home_and_stop = cur_obj_set_pos_to_home_and_stop
local load_object_collision_model = load_object_collision_model
local obj_copy_pos = obj_copy_pos
local obj_get_first_with_behavior_id = obj_get_first_with_behavior_id
local obj_get_next_with_same_behavior_id = obj_get_next_with_same_behavior_id
local spawn_mist_particles = spawn_mist_particles

-------------
-- Actions --
-------------

local ACT_BOARD_NORMAL = 0
local ACT_BOARD_RESET  = 1

local ACT_SWITCH_IDLE    = 0
local ACT_SWITCH_PRESSED = 1

-----------------------
-- Model / Collision --
-----------------------

local E_MODEL_GREEN_SWITCHBOARD         = smlua_model_util_get_id("greenboard_geo")
local E_MODEL_GREEN_SWITCHBOARD_GEARS   = smlua_model_util_get_id("greenboard_gear_geo")
local E_MODEL_GREEN_SWITCHBOARD_SWITCH  = smlua_model_util_get_id("greenboard_switch_geo")

local COL_GREEN_SWITCHBOARD_MOP         = smlua_collision_util_get("greenboard_collision")
local COL_GREEN_SWITCHBOARD_SWITCH      = smlua_collision_util_get("greenboard_switch_collision")

----------
-- Gear --
----------

---@param o Object
local function bhv_greenboard_gear(o)
    obj_set_model_extended(o, E_MODEL_GREEN_SWITCHBOARD_GEARS)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.header.gfx.skipInViewCheck = true
end

local id_bhvGreenBoardGear = hook_behavior(nil, OBJ_LIST_DEFAULT, true, bhv_greenboard_gear, nil)

------------------------
-- Green Board Switch --
------------------------

---@param o Object
local function bhv_greenboard_switch_init(o)
    obj_set_model_extended(o, E_MODEL_GREEN_SWITCHBOARD_SWITCH)
    o.collisionData = COL_GREEN_SWITCHBOARD_SWITCH
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.header.gfx.skipInViewCheck = true
    o.oAction = ACT_SWITCH_IDLE
end

---@param o Object
local function bhv_greenboard_switch_loop(o)
    load_object_collision_model()
    local m = gMarioStates[0]
    local target_scale = 1.0

    if cur_obj_is_mario_on_platform() ~= 0 and not is_bubbled(m) then
        target_scale = 0.1
        if o.oAction == ACT_SWITCH_IDLE then
            o.oAction = ACT_SWITCH_PRESSED
            cur_obj_play_sound_1(SOUND_GENERAL_DOOR_TURN_KEY)
        end
    else
        o.oAction = ACT_SWITCH_IDLE
    end

    o.header.gfx.scale.y = approach_f32_asymptotic(o.header.gfx.scale.y, target_scale, 0.18)
end

local id_bhvGreenboard_Switch_MOP = hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_greenboard_switch_init, bhv_greenboard_switch_loop, "bhvGreenboard_Switch_MOP")

-----------------
-- Green Board --
-----------------

---@param o Object
local function bhv_green_switchboard_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE | OBJ_FLAG_MOVE_XZ_USING_FVEL
    o.collisionData = COL_GREEN_SWITCHBOARD_MOP
    o.header.gfx.skipInViewCheck = true
    obj_set_model_extended(o, E_MODEL_GREEN_SWITCHBOARD)
    cur_obj_set_home_once()
    o.oIntroLakituCloud = spawn_object(o, E_MODEL_NONE, id_bhvGreenBoardGear)
    o.oAction = ACT_BOARD_NORMAL
end

---@param o Object
local function bhv_green_switchboard_loop(o)
    load_object_collision_model()

    local m = gMarioStates[0]
    local child = o.oIntroLakituCloud

    local MAX_SPEED = 14
    local SPEED_INC = 1.5
    local PITCH_TARGET = 2048
    local PITCH_SPEED = 128
    local DECEL_RATE = 0.1

    local forwardByte = (o.oBehParams >> 24) & 0xFF -- 1st byte determines how far the switchboard can go forwards
    local backwardByte = o.oBehParams2ndByte        -- 2nd byte determines how far the switchboard can go backwards
    local forwardLimit = forwardByte * 16
    local backwardLimit = backwardByte * -16

    -- Move Gears along with the platform
    if child ~= nil then
        child.oFaceAnglePitch = child.oFaceAnglePitch + (o.oForwardVel * 200)
        obj_copy_pos(child, o)
    end

    local switch = obj_get_first_with_behavior_id(id_bhvGreenboard_Switch_MOP)
    while switch ~= nil do
        if switch.oAction == ACT_SWITCH_PRESSED then
            cur_obj_set_pos_to_home_and_stop()
            if o.oAction == ACT_BOARD_NORMAL then
                spawn_mist_particles()
                o.oAction = ACT_BOARD_RESET
            end
            o.oFaceAnglePitch = 0
            return
        end
        switch = obj_get_next_with_same_behavior_id(switch)
    end

    o.oAction = ACT_BOARD_NORMAL

    local isMarioOnPlat = cur_obj_is_mario_on_platform() ~= 0 and not is_bubbled(m)

    if isMarioOnPlat or o.oForwardVel ~= 0 or o.oFaceAnglePitch ~= 0 then
        local facingZ = coss(o.oFaceAngleYaw)
        local facingX = sins(o.oFaceAngleYaw)
        local dHx = o.oPosX - o.oHomeX
        local dHz = o.oPosZ - o.oHomeZ
        local dotH = facingZ * dHz + facingX * dHx

        if isMarioOnPlat then
            local dx = m.pos.x - o.oPosX
            local dz = m.pos.z - o.oPosZ
            local dot = facingZ * dz + facingX * dx

            if dot > 0 then
                if dotH < forwardLimit then
                    o.oForwardVel = approach_f32_symmetric(o.oForwardVel, MAX_SPEED, SPEED_INC)
                    play_board_sound(o)
                else
                    o.oForwardVel = 0
                end
                o.oFaceAnglePitch = approach_f32_symmetric(o.oFaceAnglePitch, PITCH_TARGET, PITCH_SPEED)
            else
                if dotH > backwardLimit then
                    o.oForwardVel = approach_f32_symmetric(o.oForwardVel, -MAX_SPEED, SPEED_INC)
                    play_board_sound(o)
                else
                    o.oForwardVel = 0
                end
                o.oFaceAnglePitch = approach_f32_symmetric(o.oFaceAnglePitch, -PITCH_TARGET, PITCH_SPEED)
            end
        else
            -- Slowly resets the pitch and speed back to 0
            if (dotH >= forwardLimit and o.oForwardVel > 0) or (dotH <= backwardLimit and o.oForwardVel < 0) then
                o.oForwardVel = 0
            else
                o.oForwardVel = approach_f32_asymptotic(o.oForwardVel, 0, DECEL_RATE)
            end
            o.oFaceAnglePitch = approach_f32_asymptotic(o.oFaceAnglePitch, 0, DECEL_RATE)
        end
    end
end

hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_green_switchboard_init, bhv_green_switchboard_loop, "bhvGreen_Switchboard_MOP")
