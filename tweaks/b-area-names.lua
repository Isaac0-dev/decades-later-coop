-- Area Names
local sAreaNames = {
    [LEVEL_CASTLE_GROUNDS] = {
        [2] = { name = "2nd Basement" },
        [3] = { name = "2nd Basement" }
    },
    [LEVEL_CASTLE] = {
        [1] = { name = "1st Floor" },
        [2] = { name = "Castle Grounds" }
    },
    [LEVEL_CASTLE_COURTYARD] = {
        [1] = { name = "1st Basement" },
        [2] = { name = "2nd Floor" },
        [3] = { name = "2nd Floor" }
    },
    [LEVEL_BITDW] = {
        [2] = { name = "The End #1" },
        [3] = { name = "The End #2" }
    },
    [LEVEL_ENDING] = {
        [1] = { name = "Fire Field" },
        [2] = { name = "Fire Field" },
        [3] = { name = "Fire Field" },
        [4] = { name = "Fire Field" },
        [5] = { name = "The End #3" }
    }
}

local sOverriding = false

---@param m MarioState
local function area_names(m)
    local np = gNetworkPlayers[m.playerIndex]
    if not np.connected then return end

    local level = np.currLevelNum
    local area = np.currAreaIndex

    if not sAreaNames[level] or not sAreaNames[level][area] then
        if sOverriding then
            sOverriding = false
            network_player_set_override_location(np, "")
        end
        return
    end

    network_player_set_override_location(np, sAreaNames[level][area].name)
    sOverriding = true
end

hook_event(HOOK_MARIO_UPDATE, area_names)
