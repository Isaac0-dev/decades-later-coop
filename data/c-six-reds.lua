-------------------
-- Six Red Coins --
-------------------

---@param o Object
local function six_reds(o)
    local act = o.oAction
    if act <= 0 then
        local m = gMarioStates[0]
        if o.oHiddenStarTriggerCounter >= (m.area.numRedCoins - 2) then
            o.oAction = 1
        end
    end
end

hook_behavior(id_bhvHiddenRedCoinStar, OBJ_LIST_LEVEL, false, nil, six_reds)
hook_behavior(id_bhvBowserCourseRedCoinStar, OBJ_LIST_LEVEL, false, nil, six_reds)