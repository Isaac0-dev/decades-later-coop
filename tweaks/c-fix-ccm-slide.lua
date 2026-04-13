-------------------
-- Fix CCM Slide --
-------------------

-- Prevents CCM Slide to spawn the slide star
local function fix_slide_timer()
    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    local CCM_TIME = 1
    local PSS_TIME = 840

    gLevelValues.pssSlideStarTime = (np.currLevelNum == LEVEL_CCM) and CCM_TIME or PSS_TIME
end

hook_event(HOOK_ON_LEVEL_INIT, fix_slide_timer)
