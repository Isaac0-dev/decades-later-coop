-- Area Names
local names = {
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

---@param m MarioState
local function area_names(m)
    local np = gNetworkPlayers[m.playerIndex]
    if not np.connected then return end

    local level = np.currLevelNum
    local area = np.currAreaIndex

    if not names[level] or not names[level][area] then
        return
    end

    network_player_set_override_location(np, names[level][area].name)
end

hook_event(HOOK_MARIO_UPDATE, area_names)
