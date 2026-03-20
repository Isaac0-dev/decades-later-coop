
-------------------------
-- Localized Functions --
-------------------------

local approach_f32_asymptotic = approach_f32_asymptotic
local cur_obj_hide = cur_obj_hide
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local cur_obj_unhide = cur_obj_unhide
local load_object_collision_model = load_object_collision_model
local obj_copy_pos_and_angle = obj_copy_pos_and_angle
local obj_set_model_extended = obj_set_model_extended
local smlua_collision_util_get = smlua_collision_util_get
local smlua_model_util_get_id = smlua_model_util_get_id
local spawn_non_sync_object = spawn_non_sync_object
local define_custom_obj_fields = define_custom_obj_fields

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

----------------
-- Obj Fields --
----------------

---@class Object
---@field oSwitchSyncState number
---@field oSwitchOldSyncState number
define_custom_obj_fields({
    oSwitchSyncState     = 'u32', -- current  sync state
    oSwitchOldSyncState  = 'u32', -- previous sync state
})

-------------
-- Helpers --
-------------

---@param m MarioState
---@return boolean
local function is_bubbled(m)
    return m.action == ACT_BUBBLED
end

---@param parent Object
---@param model ModelExtendedId
---@param behaviorId BehaviorId
local function spawn_object(parent, model, behaviorId)
    local obj = spawn_non_sync_object(behaviorId, model, 0, 0, 0, nil)
    if not obj then return nil end

    obj.parentObj = parent
    obj_copy_pos_and_angle(obj, parent)
    return obj
end

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
    o.collisionData         = COL_SWITCHBLOCK_SWITCH_MOP
    o.oSwitchSyncState      = CURR_SWITCH_STATE
    o.oSwitchOldSyncState   = CURR_SWITCH_STATE
    o.header.gfx.skipInViewCheck = true
    obj_set_model_extended(o, E_MODEL_SWITCHBLOCK_SWITCH)
    network_init_object(o, false, { "oSwitchSyncState" })
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
    if cur_obj_is_mario_on_platform() == 1 and not is_bubbled(m) then
        if CURR_SWITCH_STATE ~= o.oBehParams2ndByte then
            CURR_SWITCH_STATE = o.oBehParams2ndByte
            o.oSwitchSyncState = CURR_SWITCH_STATE
            o.oSwitchOldSyncState = CURR_SWITCH_STATE
            cur_obj_play_sound_1(SOUND_GENERAL_DOOR_TURN_KEY)
            network_send_object(o, true)
        end
    end

    -- compare the old state with the new one if it changed then sync
    if o.oSwitchOldSyncState ~= o.oSwitchSyncState then
        CURR_SWITCH_STATE     = o.oSwitchSyncState
        o.oSwitchOldSyncState = o.oSwitchSyncState
    else
        o.oSwitchSyncState    = CURR_SWITCH_STATE
        o.oSwitchOldSyncState = CURR_SWITCH_STATE
    end

    -- squish anim
    local target_scale = 1.0
    if CURR_SWITCH_STATE == o.oBehParams2ndByte then
        target_scale = 0.1
    end

    o.header.gfx.scale.y = approach_f32_asymptotic(o.header.gfx.scale.y, target_scale, 0.09)
end

hook_behavior(nil, OBJ_LIST_SURFACE, true, bhv_Switchblock_Switch_init, bhv_Switchblock_Switch_loop, "bhvSwitchBlockSwitch")

----------------
-- Level Init --
----------------

local function on_level_init()
    local np = gNetworkPlayers[0]
    local currLevel = np.currLevelNum
    local currArea = np.currAreaIndex

    -- fallback
    CURR_SWITCH_STATE = 0

    -- specific start for level and area
    if LEVEL_START_STATES[currLevel] ~= nil and LEVEL_START_STATES[currLevel][currArea] ~= nil then
        CURR_SWITCH_STATE = LEVEL_START_STATES[currLevel][currArea]
    end
end

hook_event(HOOK_ON_LEVEL_INIT, on_level_init)