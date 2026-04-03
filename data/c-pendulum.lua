--Make pendulums move on the ttc slow speed setting

---@param o Object
local function pendulum_init(o)
    o.oTTCPendulumAngleAccel = 15
end

hook_behavior(id_bhvTTCPendulum, OBJ_LIST_GENACTOR, false, pendulum_init, nil)