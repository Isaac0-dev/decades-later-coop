-----------
-- Utils --
-----------

local BU = require("a-bhv-utils")

-------------------------
-- Localized Functions --
-------------------------

local spawn_object = BU.spawn_object
local obj_check_hitbox_overlap = obj_check_hitbox_overlap
local get_current_background_music = get_current_background_music
local set_background_music = set_background_music

-----------
-- Music --
-----------

local savedJukeboxMusic = nil

-------------
-- Jukebox --
-------------

---@param o Object
local function bhv_jukebox_init(o)
    o.hitboxHeight = 160
    o.hitboxRadius = 160
    o.oIntangibleTimer = 0

    if savedJukeboxMusic == nil then
        savedJukeboxMusic = get_current_background_music()
    end

    set_background_music(0, savedJukeboxMusic, 0)
end

---@param o Object
local function bhv_jukebox_loop(o)
    ---@type MarioState
    local m = gMarioStates[0]

    if o.oTimer % 4 == 0 then
        spawn_object(o, E_MODEL_NONE, id_bhvSparkleSpawn)
    end

    if m.action == ACT_TELEPORT_FADE_IN then
        if savedJukeboxMusic ~= nil then
            set_background_music(0, savedJukeboxMusic, 0)
        end
    end

    local isTouching = obj_check_hitbox_overlap(o, m.marioObj)
    local buttonPressed = (m.controller.buttonPressed & L_TRIG) ~= 0

    if isTouching and buttonPressed then
        if savedJukeboxMusic == 0x08 then
            savedJukeboxMusic = 0x30
        else
            savedJukeboxMusic = 0x08
        end

        set_background_music(0, savedJukeboxMusic, 0)
    end
end

hook_behavior(nil, OBJ_LIST_GENACTOR, false, bhv_jukebox_init, bhv_jukebox_loop, "bhvSLJukebox")