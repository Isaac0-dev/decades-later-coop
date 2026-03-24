-----------
-- Utils --
-----------

local BU = require("a-bhv-utils")

-------------------------
-- Localized Functions --
-------------------------

local spawn_object = BU.spawn_object
local approach_f32_asymptotic = approach_f32_asymptotic
local cur_obj_hide = cur_obj_hide
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local cur_obj_unhide = cur_obj_unhide
local is_player_active = is_player_active
local is_player_in_local_area = is_player_in_local_area
local load_object_collision_model = load_object_collision_model
local network_local_index_from_global = network_local_index_from_global
local obj_has_behavior_id = obj_has_behavior_id

-----------------------
-- Model / Collision --
-----------------------

local E_MODEL_SWITCHBLOCK           = smlua_model_util_get_id("switchblock_geo")
local E_MODEL_SWITCHBLOCK_SWITCH    = smlua_model_util_get_id("switchblockswitch_geo")
local E_MODEL_SWITCHBLOCK_SIGN      = smlua_model_util_get_id("switchblocksign_geo")

local COL_SWITCHBLOCK_MOP           = smlua_collision_util_get("switchblock_collision")
local COL_SWITCHBLOCK_SWITCH_MOP    = smlua_collision_util_get("switchblockswitch_collision")

-----------------
-- Anim States --
-----------------

local SWITCH_BLOCK_ANIM_STATE_RED   = 0
local SWITCH_BLOCK_ANIM_STATE_BLUE  = 1
local SWITCH_BLOCK_ANIM_STATE_EMPTY = 2

local SWITCH_ANIM_STATE_BLUE  = 0
local SWITCH_ANIM_STATE_RED   = 1

local SWITCH_SIGN_ANIM_STATE_RED  = 0
local SWITCH_SIGN_ANIM_STATE_BLUE = 1

-------------
-- Actions --
-------------

local SWITCHBLOCK_ACT_ACTIVE    = 0
local SWITCHBLOCK_ACT_INACTIVE  = 1

------------------
-- Switch State --
------------------

local CURR_SWITCH_STATE         = 0 -- switch state -this updates on level init

-------------
-- Helpers --
-------------

local id_bhvSwitchBlockSwitch

---@return boolean
local function is_switch_locked()
    for i = 0, MAX_PLAYERS - 1 do
        local m = gMarioStates[i]
        if is_player_in_local_area(m) ~= 0 then
            if m and m.marioObj then
                local platform = m.marioObj.platform
                if platform ~= nil and obj_has_behavior_id(platform, id_bhvSwitchBlockSwitch) ~= 0 then
                    if platform.oBehParams2ndByte == CURR_SWITCH_STATE then
                        return true
                    end
                end
            end
        end
    end
    return false
end

-------------
-- Packets --
-------------

local PACKET_TYPE_SWITCH = 0
local PACKET_TYPE_SWITCH_REQUEST = 1

local function network_send_on_same_level(packetType, data)
    for i = 1, MAX_PLAYERS - 1 do
        local m = gMarioStates[i]

        if is_player_in_local_area(m) ~= 0 then
            network_send_to(i, true, { type = packetType, data = data })
        end
    end
end

local function on_packet_receive(p)
    if p.type == PACKET_TYPE_SWITCH then
        CURR_SWITCH_STATE = p.data -- sync the switch state

    elseif p.type == PACKET_TYPE_SWITCH_REQUEST then
        local requesterGlobalIndex = p.data
        local requesterLocalIndex = network_local_index_from_global(requesterGlobalIndex)

        -- send the packet to the player who requested it
        if requesterLocalIndex ~= nil and requesterLocalIndex >= 0 then
            network_send_to(requesterLocalIndex, true, { type = PACKET_TYPE_SWITCH, data = CURR_SWITCH_STATE })
        end
    end
end

hook_event(HOOK_ON_PACKET_RECEIVE, on_packet_receive)

-----------
-- Setup --
-----------

-- 0 = Blue Start
-- 1 = Red Start
local LEVEL_START_STATES = {
    [LEVEL_BOWSER_2] = { [1] = 0 },
    [LEVEL_BBH]      = { [1] = 0 },
    [LEVEL_LLL]      = { [1] = 1 },
    [LEVEL_RR]       = { [1] = 0 },
    [LEVEL_TOTWC]    = { [1] = 1, [3] = 0 },
    [LEVEL_SA]       = { [1] = 1 },
    [LEVEL_SSL]      = { [1] = 1, [3] = 0, [4] = 0, },
    [LEVEL_SL]       = { [1] = 0 },
    [LEVEL_THI]      = { [1] = 0 },
    [LEVEL_TTC]      = { [1] = 0 },
    [LEVEL_WDW]      = { [1] = 0 },
    [LEVEL_WMOTR]    = { [1] = 0 },
}

----------------------
-- Switchblock Sign --
----------------------

---@param o Object
local function bhv_switchblock_sign(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.header.gfx.skipInViewCheck = true
    o.oPosY = o.oPosY + 80
    obj_set_model_extended(o, E_MODEL_SWITCHBLOCK_SIGN)
end

---@param o Object
local function bhv_switchblock_sign_loop(o)

    o.oFaceAngleYaw = o.oFaceAngleYaw + 0x100

    if o.parentObj ~= nil then
        -- state (parent block bparam2: 0 = Blue, 2 = Red)
        local EXPECTED_STATE = o.parentObj.oBehParams2ndByte >> 1

        if EXPECTED_STATE == 0 then
            o.oAnimState = SWITCH_SIGN_ANIM_STATE_RED
        else
            o.oAnimState = SWITCH_SIGN_ANIM_STATE_BLUE
        end

        if CURR_SWITCH_STATE == EXPECTED_STATE then
            cur_obj_hide()
        else
            cur_obj_unhide()
        end
    end
end

local id_bhvSwitchBlockSign = hook_behavior(nil, OBJ_LIST_DEFAULT, true, bhv_switchblock_sign, bhv_switchblock_sign_loop)

-----------------
-- Switchblock --
-----------------

---@param o Object
local function bhv_Switchblock_init(o)
    o.collisionData = COL_SWITCHBLOCK_MOP
    o.header.gfx.skipInViewCheck = true
    obj_set_model_extended(o, E_MODEL_SWITCHBLOCK)
    spawn_object(o, E_MODEL_SWITCHBLOCK_SIGN, id_bhvSwitchBlockSign)
end

---@param o Object
local function bhv_Switchblock_loop(o)
    -- state (bparam2: 0 = Blue, 2 = Red)
    local EXPECTED_STATE = o.oBehParams2ndByte >> 1

    if CURR_SWITCH_STATE == EXPECTED_STATE then
        -- active
        load_object_collision_model()
        o.oAction = SWITCHBLOCK_ACT_ACTIVE

        if EXPECTED_STATE == 0 then
            o.oAnimState = SWITCH_BLOCK_ANIM_STATE_RED
        else
            o.oAnimState = SWITCH_BLOCK_ANIM_STATE_BLUE
        end
    else
        -- inactive
        o.oAction = SWITCHBLOCK_ACT_INACTIVE
        o.oAnimState = SWITCH_BLOCK_ANIM_STATE_EMPTY
    end
end

hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_Switchblock_init, bhv_Switchblock_loop, "bhvSwitchBlock")

------------------------
-- Switchblock Switch --
------------------------

---@param o Object
local function bhv_Switchblock_Switch_init(o)
    o.collisionData = COL_SWITCHBLOCK_SWITCH_MOP
    o.header.gfx.skipInViewCheck = true
    obj_set_model_extended(o, E_MODEL_SWITCHBLOCK_SWITCH)
end

---@param o Object
local function bhv_Switchblock_Switch_loop(o)
    load_object_collision_model()
    local m = gMarioStates[0]

    -- switch color (bparam2: 0 = Blue, 1 = Red)
    if o.oBehParams2ndByte == 0 then
        o.oAnimState = SWITCH_ANIM_STATE_BLUE
    else
        o.oAnimState = SWITCH_ANIM_STATE_RED
    end

    -- update switch state and send a packet
    if cur_obj_is_mario_on_platform() ~= 0 and is_player_active(m) ~= 0 then
        if CURR_SWITCH_STATE ~= o.oBehParams2ndByte then
            if not is_switch_locked() then
                CURR_SWITCH_STATE = o.oBehParams2ndByte
                cur_obj_play_sound_1(SOUND_GENERAL_DOOR_TURN_KEY)
                network_send_on_same_level(PACKET_TYPE_SWITCH, CURR_SWITCH_STATE)
            end
        end
    end

    -- squish anim
    local target_scale = 1.0
    if CURR_SWITCH_STATE == o.oBehParams2ndByte then
        target_scale = 0.1
    end

    o.header.gfx.scale.y = approach_f32_asymptotic(o.header.gfx.scale.y, target_scale, 0.09)
end

id_bhvSwitchBlockSwitch = hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_Switchblock_Switch_init, bhv_Switchblock_Switch_loop, "bhvSwitchBlockSwitch")

----------------
-- Level Init --
----------------

local function on_level_init()

    local switchExists = obj_get_first_with_behavior_id(id_bhvSwitchBlockSwitch)
    if not switchExists then
        return
    end

    local np = gNetworkPlayers[0]
    local currLevel = np.currLevelNum
    local currArea = np.currAreaIndex

    -- fallback
    CURR_SWITCH_STATE = 0

    -- specific start for level and area
    local levelData = LEVEL_START_STATES[currLevel]
    if levelData and levelData[currArea] then
        CURR_SWITCH_STATE = levelData[currArea]
    end

    -- find the first player on the same level and area then request the switch state
    for i = 1, MAX_PLAYERS - 1 do
        local m = gMarioStates[i]
        if is_player_in_local_area(m) ~= 0 then
            network_send_to(i, true, { type = PACKET_TYPE_SWITCH_REQUEST, data = np.globalIndex})
            break
        end
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)
