-- name: SM64 Decades Later
-- description: Extracted with rom-decomp-64.
-- incompatible: romhack

require("data/a-bhv-loader")

--this kinda sucks, works
--improve this code well as well since i skill issue a lot

function bowser_dialog_entry(m)
    if gNetworkPlayers[0] and m.area.camera.cutscene == CUTSCENE_ENTER_BOWSER_ARENA then
        m.area.camera.cutscene = 0
    end
end

hook_event(HOOK_MARIO_UPDATE, bowser_dialog_entry)
