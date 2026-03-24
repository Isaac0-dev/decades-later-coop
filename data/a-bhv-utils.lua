local BU = {}

-------------------------
-- Localized Functions --
-------------------------

local string_pack = string.pack
local string_unpack = string.unpack
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local cur_obj_play_sound_2 = cur_obj_play_sound_2
local obj_copy_pos_and_angle = obj_copy_pos_and_angle
local spawn_non_sync_object = spawn_non_sync_object

-------------
-- Helpers --
-------------

---@param parent Object
---@param model ModelExtendedId
---@param behaviorId BehaviorId
---@return Object|nil
function BU.spawn_object(parent, model, behaviorId)
    local obj = spawn_non_sync_object(behaviorId, model, 0, 0, 0, nil)
    if not obj then return nil end

    obj.parentObj = parent
    obj_copy_pos_and_angle(obj, parent)
    return obj
end

---@param m MarioState
---@return boolean
function BU.is_bubbled(m)
    return m.action == ACT_BUBBLED
end

---@param m MarioState
function BU.spawn_noteblock_particles(m)
    spawn_non_sync_object(id_bhvHorStarParticleSpawner, E_MODEL_NONE, m.pos.x, m.pos.y, m.pos.z, nil)
    spawn_non_sync_object(id_bhvMistCircParticleSpawner, E_MODEL_NONE, m.pos.x, m.pos.y, m.pos.z, nil)
end

---@param value number
---@param pack_fmt string
---@param unpack_fmt string
---@return number
function BU.repack(value, pack_fmt, unpack_fmt)
    return string_unpack(unpack_fmt, string_pack(pack_fmt, value))
end

---@param m MarioState
---@param o Object
---@param velY number
---@param forwardVel number
function BU.bounce_off_object(m, o, velY, forwardVel)
    m.pos.y = o.oPosY + o.hitboxHeight
    m.faceAngle.y = o.oFaceAngleYaw
    m.vel.y = velY
    m.forwardVel = forwardVel
    m.flags = m.flags & ~MARIO_UNKNOWN_08
    cur_obj_play_sound_2(SOUND_ACTION_BOUNCE_OFF_OBJECT)
end

---@param o Object
function BU.play_board_sound(o)
    if o.oTimer % 2 == 0 then
        cur_obj_play_sound_1(SOUND_OBJ_KOOPA_WALK)
    end
end

return BU
