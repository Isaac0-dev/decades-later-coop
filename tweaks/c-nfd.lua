--------------------
-- No Fall Damage --
--------------------

---@param m MarioState
local function no_fall_damage(m)
    if m.playerIndex ~= 0 then return end

    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    if np.currLevelNum == LEVEL_SL and np.currAreaIndex == 1 then return end

    if m.action & ACT_FLAG_AIR ~= 0 then
        m.peakHeight = m.pos.y
    end
end

hook_event(HOOK_BEFORE_PHYS_STEP, no_fall_damage)
