-- name: L Trigger
-- description: L Button Triggers Camera Mode while Flying or Swimming

local L_Cam = false

---@param m MarioState
local function mario_update(m)
    if m.playerIndex ~= 0 then return end
    if camera_config_is_free_cam_enabled() then return end

    local camMode = gLakituState.mode
    local swimFly = (m.action & ACT_FLAG_SWIMMING_OR_FLYING) ~= 0
    local lPressed = (m.controller.buttonPressed & L_TRIG) ~= 0
    local isCamMode = (camMode == CAMERA_MODE_BEHIND_MARIO or camMode == CAMERA_MODE_WATER_SURFACE)

    if lPressed and swimFly then
        L_Cam = not L_Cam
    end

    if isCamMode and (
        (L_Cam and swimFly) or
        (not swimFly and m.action == ACT_EMERGE_FROM_PIPE)) then
        gLakituState.mode = CAMERA_MODE_ROM_HACK
    end
end

hook_event(HOOK_MARIO_UPDATE, mario_update)
