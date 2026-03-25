local function bhv_star_init(obj)
    if obj.oBehParams & 0xFF == 0 then return end

    -- TODO: Implement blue stars
    -- https://github.com/BroDute/sm64asm/blob/2ca66f06fe72edfdef2c5143432caea39671f202/dl/src/blue_stars_compat.cpp#L187
    obj_mark_for_deletion(obj)
end

hook_behavior(id_bhvStar, OBJ_LIST_LEVEL, false, bhv_star_init, nil, "bhvStar")
