--------------------------
-- Fix Collision Levels --
--------------------------

gLevelValues.fixCollisionBugsRoundedCorners = 1
gLevelValues.fixCollisionBugsGroundPoundBonks = 0

-- default value for fixCollisionBugs is false
-- [LEVEL_XX] = { [1] = true, [3] = true, ...},

local fixCollisionLevels = {
    [LEVEL_CASTLE_GROUNDS]   = true,
    [LEVEL_CASTLE]           = { [1] = true }, -- here only area 1 will be true
    [LEVEL_CASTLE_COURTYARD] = true,

    [LEVEL_BOB] = true,
    [LEVEL_WF]  = true,
    [LEVEL_JRB] = true,
    --[LEVEL_CCM] = false,
    [LEVEL_BBH] = true,
    [LEVEL_HMC] = true,
    [LEVEL_LLL] = true,
    [LEVEL_SSL] = true,
    --[LEVEL_DDD] = false,
    [LEVEL_SL]  = true,
    [LEVEL_WDW] = true,
    [LEVEL_TTM] = true,
    [LEVEL_THI] = true,
    [LEVEL_TTC] = true,
    [LEVEL_RR]  = true,

    [LEVEL_BITDW] = true,
    [LEVEL_BITFS] = true,
    [LEVEL_BITS]  = true,

    [LEVEL_BOWSER_1] = true,
    [LEVEL_BOWSER_2] = true,
    [LEVEL_BOWSER_3] = true,

    [LEVEL_PSS]    = true,
    [LEVEL_SA]     = true,
    [LEVEL_TOTWC]  = true,
    --[LEVEL_COTMC]  = false,
    --[LEVEL_VCUTM]  = false,
    [LEVEL_WMOTR]  = true,
    [LEVEL_ENDING] = true,
}

local lastLevel = -1
local lastArea = -1

---@param m MarioState
local function fix_level_collisions(m)
    if m.playerIndex ~= 0 then return end

    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]

    if lastLevel == np.currLevelNum and lastArea == np.currAreaIndex then
        return
    end

    lastLevel = np.currLevelNum
    lastArea = np.currAreaIndex

    local levelConfig = fixCollisionLevels[np.currLevelNum]
    local fix = false

    if type(levelConfig) == "boolean" then
        fix = levelConfig
    elseif type(levelConfig) == "table" then
        if levelConfig[np.currAreaIndex] ~= nil then
            fix = levelConfig[np.currAreaIndex]
        end
    end

    gLevelValues.fixCollisionBugs = fix

end

hook_event(HOOK_MARIO_UPDATE, fix_level_collisions)
