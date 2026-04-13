---------------
-- Inf Lives --
---------------

local function inf_lives()
    ---@type MarioState
    local m = gMarioStates[0]
    m.numLives = 100
end

hook_event(HOOK_ON_WARP, inf_lives)
