-- name: SM64 Decades Later
-- description: Extracted with rom-decomp-64.
-- incompatible: romhack

require("data/a-bhv-loader")

-- Bowser dialog

function bowser_dialog(m)

    ---@type NetworkPlayer
    local np = gNetworkPlayers[0]
    if np.currLevelNum == LEVEL_BOWSER_1 or LEVEL_BOWSER_2 or LEVEL_BOWSER_3 and m.area.camera.cutscene == CUTSCENE_ENTER_BOWSER_ARENA then
        m.area.camera.cutscene = 0
    end
end

hook_event(HOOK_MARIO_UPDATE, bowser_dialog)
