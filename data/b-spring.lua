-------------------------
-- Localized Functions --
-------------------------

local cur_obj_play_sound_2 = cur_obj_play_sound_2
local obj_check_hitbox_overlap = obj_check_hitbox_overlap
local obj_set_model_extended = obj_set_model_extended
local set_mario_action = set_mario_action
local smlua_model_util_get_id = smlua_model_util_get_id
local string_pack = string.pack
local string_unpack = string.unpack

-----------
-- Model --
-----------

local E_MODEL_SPRING = smlua_model_util_get_id("spring_geo")

-------------
-- Helpers --
-------------

---@param m MarioState
---@return boolean
local function is_bubbled(m)
    return m.action == ACT_BUBBLED
end

---@param value number
---@param pack_fmt string
---@param unpack_fmt string
local function repack(value, pack_fmt, unpack_fmt)
    return string_unpack(unpack_fmt, string_pack(pack_fmt, value))
end

---@param m MarioState
---@param o Object
---@param velY number
---@param forwardVel number
local function bounce_off_object(m, o, velY, forwardVel)
    m.pos.y = o.oPosY + o.hitboxHeight
    m.faceAngle.y = o.oFaceAngleYaw
    m.vel.y = velY
    m.forwardVel = forwardVel
    m.flags = m.flags & ~MARIO_UNKNOWN_08
    cur_obj_play_sound_2(SOUND_ACTION_BOUNCE_OFF_OBJECT)
end

-------------
-- Actions --
-------------

local SPRING_ACT_READY = 0
local SPRING_ACT_USED = 1

------------
-- Spring --
------------

---@param o Object
local function bhv_spring_init(o)
    obj_set_model_extended(o, E_MODEL_SPRING)
    o.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE

    o.hitboxRadius = 160
    o.hitboxHeight = 160

    o.oInteractType = INTERACT_COIN
    o.oIntangibleTimer = 0
    o.oAction = SPRING_ACT_READY

    o.header.gfx.skipInViewCheck = true
end

---@param o Object
local function bhv_spring_loop(o)
    local m = gMarioStates[0]
    if is_bubbled(m) then return end

    if o.oAction == SPRING_ACT_READY then
        local isTouching = obj_check_hitbox_overlap(o, m.marioObj)
        if isTouching then
            set_mario_action(m, ACT_DOUBLE_JUMP, 0)

            local baseYVel = repack(56.0, "f", "I")

            local bparam1 = (o.oBehParams >> 24) & 0xFF
            local bparam2 = o.oBehParams2ndByte

            local forwardVelInt = baseYVel + (bparam2 << 16)
            local forwardVel    = repack(forwardVelInt, "I", "f")

            local yVelInt = baseYVel + (bparam1 << 16)
            local yVel    = repack(yVelInt, "I", "f")

            bounce_off_object(m, o, yVel, forwardVel)

            o.oAction = SPRING_ACT_USED
        end

    elseif o.oAction == SPRING_ACT_USED then
        if o.oTimer >= 15 then
            o.oAction = SPRING_ACT_READY
        end
    end
end

hook_behavior(nil, OBJ_LIST_LEVEL, true, bhv_spring_init, bhv_spring_loop, "bhvSpring")