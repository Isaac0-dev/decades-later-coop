-------------------------
-- Localized Functions --
-------------------------

local play_transition = play_transition
local set_camera_mode = set_camera_mode
local set_mario_action = set_mario_action
local soft_reset_camera = soft_reset_camera
local vec3f_copy = vec3f_copy
local vec3f_set = vec3f_set

-------------
-- Respawn --
-------------

local safePos = {
    x = 0,
    y = 0,
    z = 0,
    yaw = 0,
    level = 0,
    area = 0
}

local unsafeSurfaces = {
    [SURFACE_BURNING] = true,
    [SURFACE_DEATH_PLANE] = true,
    [SURFACE_NOISE_DEFAULT] = true,
    [SURFACE_SLIPPERY] = true,
    [SURFACE_VERY_SLIPPERY] = true,
    [SURFACE_HORIZONTAL_WIND] = true,

    [SURFACE_QUICKSAND] = true,
    [SURFACE_SHALLOW_QUICKSAND] = true,
    [SURFACE_DEEP_QUICKSAND] = true,
    [SURFACE_MOVING_QUICKSAND] = true,
    [SURFACE_SHALLOW_MOVING_QUICKSAND] = true,
    [SURFACE_DEEP_MOVING_QUICKSAND] = true,
    [SURFACE_INSTANT_QUICKSAND] = true,
    [SURFACE_INSTANT_MOVING_QUICKSAND] = true,

    [SURFACE_LOOK_UP_WARP] = true,
    [SURFACE_WOBBLING_WARP] = true,
    [SURFACE_INSTANT_WARP_1B] = true,
    [SURFACE_INSTANT_WARP_1C] = true,
    [SURFACE_INSTANT_WARP_1D] = true,
    [SURFACE_INSTANT_WARP_1E] = true,
}

for i = 0x00A6, 0x00FC do -- Painting
    unsafeSurfaces[i] = true
end

local isRespawning = false
local respawnTimer = 0

---@param m MarioState
local function set_safe_pos(m)
    local np = gNetworkPlayers[0]
    safePos.x = m.pos.x
    safePos.y = m.floorHeight
    safePos.z = m.pos.z
    safePos.yaw = m.faceAngle.y
    safePos.area = np.currAreaIndex
    safePos.level = np.currLevelNum
end

---@param m MarioState
local function update_safe_position(m)
    if m.playerIndex ~= 0 then return end
    if not m.floor then return end

    if m.floor.object ~= nil then return end

    local np = gNetworkPlayers[0]
    local currLevel = np.currLevelNum
    local currArea = np.currAreaIndex

    if safePos.area ~= currArea or safePos.level ~= currLevel then
        set_safe_pos(m)
        return
    end

    if (m.area.terrainType & TERRAIN_MASK) == TERRAIN_SLIDE then
        return
    end

    local type = m.floor.type
    if not unsafeSurfaces[type] and m.floor.normal.y >= 0.8 then
        set_safe_pos(m)
    end
end

---@param m MarioState
local function on_death(m)
    if m.playerIndex ~= 0 then return end
    if isRespawning then return false end

    local damage = 0
    local noReturn = 0
    local currLevel = gNetworkPlayers[0].currLevelNum

    if currLevel == LEVEL_COTMC or currLevel == LEVEL_VCUTM or currLevel == LEVEL_ENDING then
        damage = 0x100
        noReturn = 0x180
    else
        damage = 0x400
        noReturn = 0x480
    end

    local isSubmerged = (m.action & ACT_GROUP_MASK) == ACT_GROUP_SUBMERGED
    local tolerance = isSubmerged and 0x100 or 0

    if m.health <= (noReturn + tolerance) then
        return true
    end

    isRespawning = true
    respawnTimer = 15

    m.hurtCounter = damage / 0x40

    play_transition(WARP_TRANSITION_FADE_INTO_COLOR, 15, 0, 0, 0)

    return false
end

local function handle_respawn()
    ---@type MarioState
    local m = gMarioStates[0]

    if not isRespawning then
        update_safe_position(m)
        return
    end

    respawnTimer = respawnTimer - 1

    if respawnTimer <= 0 then
        isRespawning = false

        play_transition(WARP_TRANSITION_FADE_FROM_STAR, 15, 0, 0, 0)

        vec3f_set(m.pos, safePos.x, safePos.y, safePos.z)
        vec3f_copy(m.marioObj.header.gfx.pos, m.pos)
        m.faceAngle.y = safePos.yaw

        set_mario_action(m, ACT_IDLE, 0)

        vec3f_set(m.vel, -5, -5, -5)
        m.forwardVel = -5
        m.slideVelX = -5
        m.slideVelZ = -5

        if m.area and m.area.camera then
            set_camera_mode(m.area.camera, CAMERA_MODE_8_DIRECTIONS, 1)
            soft_reset_camera(m.area.camera)
        end
    end
end

--Prevents Mario respawning by getting eaten
function bubba_death(m)
    if m.action == ACT_EATEN_BY_BUBBA then
       m.health = 0
    end
end

hook_event(HOOK_MARIO_UPDATE, bubba_death)
hook_event(HOOK_ON_DEATH, on_death)
hook_event(HOOK_UPDATE, handle_respawn)
