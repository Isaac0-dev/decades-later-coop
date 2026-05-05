-- Allow exclamation boxes to load the extra states
hook_behavior(id_bhvExclamationBox, OBJ_LIST_SURFACE, false, function (o)
    if o.oBehParams2ndByte < 3 then return end -- It's a normal exclamation box
    o.oAnimState = (o.oBehParams & 0xF) - 1
end, nil)
