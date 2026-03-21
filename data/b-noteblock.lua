-------------------------
-- Localized Functions --
-------------------------

local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local load_object_collision_model = load_object_collision_model
local obj_scale = obj_scale
local obj_set_model_extended = obj_set_model_extended
local set_mario_action = set_mario_action
local smlua_collision_util_get = smlua_collision_util_get
local smlua_model_util_get_id = smlua_model_util_get_id
local spawn_non_sync_object = spawn_non_sync_object

-----------------------
-- Model / Collision --
-----------------------

local E_MODEL_NOTEBLOCK = smlua_model_util_get_id("noteblock_geo")
local COL_NOTEBLOCK_MOP = smlua_collision_util_get("noteblock_collision")

-------------
-- Helpers --
-------------

---@param m MarioState
---@return boolean
local function is_bubbled(m)
    return m.action == ACT_BUBBLED
end

---@param m MarioState
local function spawn_noteblock_particles(m)
    spawn_non_sync_object(id_bhvHorStarParticleSpawner, E_MODEL_NONE, m.pos.x, m.pos.y, m.pos.z, nil)
    spawn_non_sync_object(id_bhvMistCircParticleSpawner, E_MODEL_NONE, m.pos.x, m.pos.y, m.pos.z, nil)
end

-------------
-- Actions --
-------------

local NOTEBLOCK_ACT_IDLE = 0
local NOTEBLOCK_ACT_BOUNCING = 1

---------------
-- Noteblock --
---------------

---@param o Object
local function bhv_noteblock_init(o)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    o.collisionData = COL_NOTEBLOCK_MOP
    o.oHomeY = o.oPosY
    o.header.gfx.skipInViewCheck = true
    obj_set_model_extended(o, E_MODEL_NOTEBLOCK)
end

---@param o Object
local function bhv_noteblock_loop(o)
    local m = gMarioStates[0]
    load_object_collision_model()

    if o.oAction == NOTEBLOCK_ACT_IDLE then
        if cur_obj_is_mario_on_platform() ~= 0 and not is_bubbled(m) then
            local y_spd = 64

            if (m.controller.buttonDown & A_BUTTON) ~= 0 then
                y_spd = y_spd + 12
                spawn_noteblock_particles(m)
            end

            set_mario_action(m, ACT_DOUBLE_JUMP, 0)

            y_spd = y_spd + (o.oBehParams2ndByte * 0.5)
            m.vel.y = y_spd

            o.oAction = NOTEBLOCK_ACT_BOUNCING
            o.oTimer = 0
        end

    elseif o.oAction == NOTEBLOCK_ACT_BOUNCING then
        if o.oTimer == 5 then
            o.oAction = NOTEBLOCK_ACT_IDLE
            o.oPosY = o.oHomeY
        else
            -- Moves the noteblock slightly up and down, to give it a "bounce"
            if o.oTimer <= 2 then
                o.oPosY = o.oHomeY - (o.oTimer * 15)
            else
                o.oPosY = o.oHomeY - ((5 - o.oTimer) * 10)
            end
        end
    end
end

-- Noteblock overrides this behavior
hook_behavior(id_bhvExitPodiumWarp, OBJ_LIST_SURFACE, true, bhv_noteblock_init, bhv_noteblock_loop, "bhvExitPodiumWarp")