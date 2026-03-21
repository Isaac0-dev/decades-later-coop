---@diagnostic disable: param-type-mismatch, assign-type-mismatch

----------------
-----Models-----
----------------

-- If any of these are needed in another file, like the exclamation box, just make models you need global
 local E_MODEL_FLIPSWITCH_PANEL = smlua_model_util_get_id("Flipswitch_Panel_MOP")
-- local E_MODEL_FLIPSWAP_PLATFORM = smlua_model_util_get_id("Flipswap_Platform_MOP")
-- local E_MODEL_FLIPSWAP_PLATFORM_BORDER = smlua_model_util_get_id("Flipswap_Platform_Border_MOP")
-- local E_MODEL_FLIPBLOCK = smlua_model_util_get_id("FlipBlock_MOP")
-- local E_MODEL_NOTEBLOCK = smlua_model_util_get_id("Noteblock_MOP")
-- local E_MODEL_SANDBLOCK = smlua_model_util_get_id("SandBlock_MOP")
-- local E_MODEL_SHELL_1 = smlua_model_util_get_id("Shell_1_MOP") -- No code
-- local E_MODEL_SHELL_2 = smlua_model_util_get_id("Shell_2_MOP") -- No code
-- local E_MODEL_SWITCHBLOCK = smlua_model_util_get_id("Switchblock_MOP")
-- local E_MODEL_SWITCHBLOCK_SWITCH = smlua_model_util_get_id("Switchblock_Switch_MOP")
-- local E_MODEL_SPRING = smlua_model_util_get_id("Spring_MOP")
-- local E_MODEL_CHECKPOINT = smlua_model_util_get_id("Checkpoint_Flag_MOP")
-- local E_MODEL_MOVING_ROATING_BLOCK = smlua_model_util_get_id("Moving_Rotating_Block_MOP")
-- local E_MODEL_BLARGG = smlua_model_util_get_id("blargg_geo")
-- local E_MODEL_FRIENDLY_BLARGG = smlua_model_util_get_id("friendly_blargg_geo")

--------------------
-----Collisions-----
--------------------

--Still unused

-- COL_FLIPBLOCK_MOP = smlua_collision_util_get("col_FlipBlock_MOP_0x7d1a98")
-- COL_NOTEBLOCK_MOP = smlua_collision_util_get("col_Noteblock_MOP_0xaa6444")
-- COL_SANDBLOCK_MOP = smlua_collision_util_get("col_Sandblock_MOP_0xaa6444")
-- COL_FLIPSWAP_PLATFORM_MOP = smlua_collision_util_get("col_Flipswap_Platform_MOP_0x7d9d88")
-- COL_FLIPSWITCH_PANEL_MOP = smlua_collision_util_get("col_Flipswitch_Panel_MOP_0x7daf78")
-- COL_SWITCHBLOCK_MOP = smlua_collision_util_get("col_Switchblock_MOP_0x7d3058")
-- COL_SWITCHBLOCK_SWITCH_MOP = smlua_collision_util_get("col_Switchblock_Switch_MOP_0x7d7348")
-- COL_MOVING_ROTATING_BLOCK_MOP = smlua_collision_util_get("col_Moving_Rotating_Block_MOP_0x7e3ea0")


-----------------
-----Actions-----
-----------------

local FLIP_BLOCK_ACT_UNINITIALIZED = 0
local FLIP_BLOCK_ACT_IDLE = 1
local FLIP_BLOCK_ACT_FLIPPING = 2

local SANDBLOCK_ACT_IDLE = 0
local SANDBLOCK_ACT_FADING = 1
local SANDBLOCK_ACT_DISAPPEARED = 2

local FLIPSWITCH_PANEL_ACT_IDLE = 0
local FLIPSWITCH_PANEL_ACT_MARIO_IS_ON = 1

local SWITCHBLOCK_ACT_ACTIVE = 0
local SWITCHBLOCK_ACT_INACTIVE = 1

local BLARGG_ACT_SWIM = 0
local BLARGG_ACT_CHASE = 1
local BLARGG_ACT_KNOCKBACK = 2
local BLARGG_ACT_BACKUP = 3

local FRIENDLY_BLARGG_ACT_IDLE = 0
local FRIENDLY_BLARGG_ACT_BEING_RIDDEN = 1

-----------------------------
-----Localized Functions-----
-----------------------------

-- Improves performance, which is needed since this is a lot of code to run
local play_sound = play_sound
local spawn_non_sync_object = spawn_non_sync_object
local obj_copy_pos_and_angle = obj_copy_pos_and_angle
local obj_set_model_extended = obj_set_model_extended
local network_init_object = network_init_object
local network_send_object = network_send_object
local obj_check_if_collided_with_object = obj_check_if_collided_with_object
local set_mario_action = set_mario_action
local cur_obj_was_attacked_or_ground_pounded = cur_obj_was_attacked_or_ground_pounded
local load_object_collision_model = load_object_collision_model
local cur_obj_is_mario_on_platform = cur_obj_is_mario_on_platform
local spawn_mist_particles = spawn_mist_particles
local cur_obj_play_sound_1 = cur_obj_play_sound_1
local cur_obj_hide = cur_obj_hide
local cur_obj_unhide = cur_obj_unhide
local coss = coss
local sins = sins
local obj_copy_pos = obj_copy_pos
local cur_obj_rotate_face_angle_using_vel = cur_obj_rotate_face_angle_using_vel
local cur_obj_move_using_vel = cur_obj_move_using_vel
local nearest_player_to_object = nearest_player_to_object
local spawn_red_coin_cutscene_star = spawn_red_coin_cutscene_star
local cur_obj_play_sound_2 = cur_obj_play_sound_2
local cur_obj_init_animation = cur_obj_init_animation
local obj_return_home_if_safe = obj_return_home_if_safe
local obj_turn_toward_object = obj_turn_toward_object
local is_point_within_radius_of_mario = is_point_within_radius_of_mario
local object_step = object_step
local obj_scale = obj_scale
local cur_obj_scale = cur_obj_scale
local cur_obj_update_floor_and_walls = cur_obj_update_floor_and_walls
local cur_obj_if_hit_wall_bounce_away = cur_obj_if_hit_wall_bounce_away
local cur_obj_move_standard = cur_obj_move_standard
local cur_obj_update_floor_height_and_get_floor = cur_obj_update_floor_height_and_get_floor
local count_objects_with_behavior = count_objects_with_behavior
-- local obj_get_nearest_object_with_behavior_id = obj_get_nearest_object_with_behavior_id
local cur_obj_become_tangible = cur_obj_become_tangible

--------------------------
-----Helper Variables-----
--------------------------

-- local id_bhvFlipswap_Platform_Border_MOP = id_bhvUnused05A8
-- local id_bhvShrink_Platform_Border_MOP = id_bhvUnused05A8
-- local id_bhvGreen_Switchboard_Gears_MOP = id_bhvUnused05A8

--------------------------
-----Helper Functions-----
--------------------------

-- ##### Switch statements are only faster when there's several different states
-- ##### This is because each lookup of the switch statement creates an entirely new function
-- ##### However the performance overhead isn't significant at all so use it whenever you feel like it
---@param param any
---@param case_table table<any, function>
---@return function?
local function switch(param, case_table)
    local case = case_table[param]
    if case then return case() end
    local def = case_table['default']
    return def and def() or nil
end

---@param m MarioState
---@return boolean
local function is_bubbled(m)
    return m.action == ACT_BUBBLED
end

---@param parent Object
---@param model ModelExtendedId
---@param behaviorId BehaviorId
local function spawn_object(parent, model, behaviorId)
    local obj = spawn_non_sync_object(behaviorId, model, 0, 0, 0, nil)
    if not obj then return nil end

    obj_copy_pos_and_angle(obj, parent)
    return obj
end

---@return boolean
local function is_current_area_sync_valid()
    local np = gNetworkPlayers
    for i = 1, MAX_PLAYERS - 1, 1 do
        if np[i] and np[i].connected and
        (not np[i].currLevelSyncValid or not np[i].currAreaSyncValid) and
        is_player_in_local_area(gMarioStates[i]) ~= 0 then
            return false
        end
    end
    return true
end

---@param start_point number
---@param end_point number
---@param time number
---@return number
local function lerp(start_point, end_point, time)
    return start_point * (1 - time) + end_point * time
end

--- @param obj Object
--- @param hitbox ObjectHitbox
local function obj_set_hitbox(obj, hitbox)
    if not obj or not hitbox then return end
    -- Sets other hitbox values once
    if (obj.oFlags & OBJ_FLAG_30) == 0 then
        obj.oFlags = obj.oFlags | OBJ_FLAG_30

        obj.oInteractType = hitbox.interactType
        obj.oDamageOrCoinValue = hitbox.damageOrCoinValue
        obj.oHealth = hitbox.health
        obj.oNumLootCoins = hitbox.numLootCoins

        cur_obj_become_tangible()
    end

    -- Set actual hitboxes
    obj.hitboxRadius = obj.header.gfx.scale.x * hitbox.radius
    obj.hitboxHeight = obj.header.gfx.scale.y * hitbox.height
    obj.hurtboxRadius = obj.header.gfx.scale.x * hitbox.hurtboxRadius
    obj.hurtboxHeight = obj.header.gfx.scale.y * hitbox.hurtboxHeight
    obj.hitboxDownOffset = obj.header.gfx.scale.y * hitbox.downOffset
end

-------------------
-----Functions-----
-------------------

------ Flipblock ------
-- Hitting this block will cause it to spin, losing its collision until it stops spinning.

local FLIP_TIMER = 210

local sFlipBlockHitbox = {
    interactType = INTERACT_BREAKABLE,
    downOffset = 0,
    damageOrCoinValue = 0,
    health = 0,
    numLootCoins = 0,
    radius = 64,
    height = 64,
    hurtboxHeight = 0,
    hurtboxRadius = 0
}

---@param obj Object
function bhv_flip_block_init(obj)
    obj.oMoveAnglePitch = obj.oFaceAnglePitch
    obj_set_model_extended(obj, E_MODEL_FLIPBLOCK)
end

---@param obj Object
function bhv_flip_block_loop(obj)
    obj.oInteractStatus = 0

    if obj.oTimer == 0 and obj.oAction == FLIP_BLOCK_ACT_UNINITIALIZED then
        obj_set_hitbox(obj, sFlipBlockHitbox)
        obj.oAction = FLIP_BLOCK_ACT_IDLE
    end
    -- Do things if it starts flipping
    if obj.oAction == FLIP_BLOCK_ACT_FLIPPING then
        obj.header.gfx.scale.y = 0.1
        -- Stop flipping and prepare it for next time
        if obj.oTimer == FLIP_TIMER then
            obj.oAction = FLIP_BLOCK_ACT_IDLE
            obj.oSubAction = 0
            -- Reset size
            obj.header.gfx.scale.y = 1
        end

        -- Flips the block
        obj.oFaceAnglePitch = obj.oFaceAnglePitch + (FLIP_TIMER - obj.oTimer) * 16
        if ((obj.oFaceAnglePitch / 0x8000) - obj.oSubAction) > 0 then
            cur_obj_play_sound_1(SOUND_GENERAL_SWISH_WATER)
            -- The subaction is basically used as a timer so the condition will eventually fail
            obj.oSubAction = obj.oSubAction + 1
        end
    else
        ---@type MarioState
        local m = gMarioStates[0]
        -- Flip whenever it becomes attacked
        local next_position = m.pos.y + m.vel.y + 160
        if not is_bubbled(m) and cur_obj_was_attacked_or_ground_pounded() ~= 0
        -- Hacky fix to allow Mario to hit flipblocks from below
        or (mario_is_within_rectangle(obj.oPosX - 100, obj.oPosX + 100, obj.oPosZ - 100, obj.oPosZ + 100) ~= 0
            and m.vel.y > 0 and (m.ceil and m.ceil.object) and m.ceil.object == obj
            and (next_position > m.ceilHeight and next_position < obj.oPosY + 100)) then

            obj.oAction = FLIP_BLOCK_ACT_FLIPPING
            obj.oIntangibleTimer = FLIP_TIMER
            m.vel.y = m.vel.y > 0 and 0 or m.vel.y

            cur_obj_play_sound_1(SOUND_GENERAL_SWISH_WATER)
        else
            obj.oFaceAnglePitch = obj.oMoveAnglePitch
            obj.header.gfx.scale.y = 1

            load_object_collision_model()
        end
    end
end

--id_bhvFlipBlock_MOP = hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_flip_block_init, bhv_flip_block_loop, "bhvFlipBlock_MOP")

------ Sandblock ------
-- Standing on this block causes it to slowly fall to pieces, eventually no longer becoming a platform.

local FADE_TIMER = 300

---@param obj Object
function bhv_sandblock_init(obj)
    obj_set_model_extended(obj, E_MODEL_SANDBLOCK)
end

---@param obj Object
function bhv_sandblock_loop(obj)
    -- Only activate collision if the sandblock has not disappeared
    if obj.oAction < SANDBLOCK_ACT_DISAPPEARED then
        load_object_collision_model()
    end
    -- Disappearing
    local action = obj.oAction
    if action == SANDBLOCK_ACT_FADING then
        if obj.oTimer == FADE_TIMER then
            obj.oAction = SANDBLOCK_ACT_DISAPPEARED
        end
        -- Causes the sandblock to become smaller and smaller on the y axis
        obj.header.gfx.scale.y = ((300 - obj.oTimer) / 300.0)
        -- Makes the sandblock not move the player vertically as it's breaking
        obj.oPosY = obj.oPosY + 1.025

        -- Spawn effects
        spawn_non_sync_object(id_bhvDirtParticleSpawner, E_MODEL_NONE, obj.oPosX, obj.oPosY, obj.oPosZ, nil)
        cur_obj_play_sound_1(SOUND_ENV_MOVINGSAND)
    elseif action == SANDBLOCK_ACT_DISAPPEARED then
        cur_obj_hide()
        if obj.oTimer == FADE_TIMER + 1 then
            obj.oPosY = obj.oHomeY
            obj.oAction = SANDBLOCK_ACT_IDLE
            obj.header.gfx.scale.y = 1.0
            cur_obj_unhide()
        end
    end

    if cur_obj_is_mario_on_platform() == 1 and obj.oAction == SANDBLOCK_ACT_IDLE and not is_bubbled(gMarioStates[0]) then
        obj.oAction = SANDBLOCK_ACT_FADING
    end
end

--id_bhvSandBlock_MOP = hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_sandblock_init, bhv_sandblock_loop, "bhvSandBlock_MOP")

------ Checkpoint flag ------
-- Dying will cause the player to respawn at this point
-- ! The 2nd byte of every checkpoint flag within different courses should be different
-- ! A good practice is to put the level ID of the level the flag is in as the 2nd byte
-- ! Not every hack uses an intangible pole. If you need to change the tangibility of this MOP,
-- find this MOP and its `SET_INT(oIntangibleTimer, -1),` in behavior_data.c and change the -1 to 0.

---@type Object
local last_touched_checkpoint = nil
local stored_2nd_byte = 0

---@param obj Object
function bhv_checkpoint_flag_init(obj)
    obj_set_model_extended(obj, E_MODEL_CHECKPOINT)
end

---@param obj Object
function bhv_checkpoint_flag_loop(obj)
    ---@type MarioState
    local m = gMarioStates[0]
    if is_bubbled(m) then return end

    if lateral_dist_between_objects(obj, m.marioObj) < 100 and obj ~= last_touched_checkpoint then
        -- Notes down this particular object and its 2nd byte
        last_touched_checkpoint = obj
        stored_2nd_byte = obj.oBehParams2ndByte

        local ltc = last_touched_checkpoint
        play_sound(SOUND_MENU_CHANGE_SELECT + (1 << 16), {x = ltc.oPosX, y = ltc.oPosY, z = ltc.oPosZ})
        spawn_non_sync_object(id_bhvSparkle, E_MODEL_SPARKLES, ltc.oPosX, ltc.oPosY, ltc.oPosZ,
        ---@param o Object
        function (o)
            obj_scale(o, 5)
        end)
    end
end

hook_event(HOOK_ON_SYNC_VALID,
function ()
    if not last_touched_checkpoint then return end

    if count_objects_with_behavior(bhvCheckpoint_Flag_MOP) > 0 then
        local ltc = last_touched_checkpoint
        local m = gMarioStates[0]
        -- Warps to the particular object noted down if it shares the same 2nd byte
        if ltc.behavior == bhvCheckpoint_Flag_MOP and ltc.oBehParams2ndByte == stored_2nd_byte then
            vec3f_set(m.pos, ltc.oPosX, ltc.oPosY, ltc.oPosZ)
        end
    end
end)

--id_bhvCheckpoint_Flag_MOP = hook_behavior(nil, OBJ_LIST_GENACTOR, false, bhv_checkpoint_flag_init, bhv_checkpoint_flag_loop, "bhvCheckpoint_Flag_MOP")

------ Flipswitch panel ------
-- Jumping onto a panel activates it. Activating all panels spawns a star. Jumping onto a panel while it's activated with deactivate it.

local StarSpawned = false

hook_event(HOOK_ON_LEVEL_INIT, function ()
    StarSpawned = false
end)

---@param obj Object
function bhv_flipswitch_panel_init(obj)
    obj_set_model_extended(obj, E_MODEL_FLIPSWITCH_PANEL)
    -- One of the only synced MOPs
    network_init_object(obj, false, {
        "oAction",
        "oAnimState"
    })
end

---@param obj Object
function bhv_flipswitch_panel_loop(obj)
    -- Always checks for the starspawn mop
    --[[local starspawn_obj = obj_get_nearest_object_with_behavior_id(obj, bhvFlipswitch_Panel_StarSpawn_MOP)
    if not starspawn_obj then return end
    if not is_current_area_sync_valid() then return end
    if obj.parentObj ~= starspawn_obj then
        obj.parentObj = starspawn_obj
    end]]

    -- Turn green and don't allow further change
    if StarSpawned then
        obj.oAnimState = 2
    else
        local action = obj.oAction
        if action == FLIPSWITCH_PANEL_ACT_IDLE then
            if cur_obj_is_mario_on_platform() == 1 and not is_bubbled(gMarioStates[0]) then
                -- Causes the panel to change colors upon being pressed multiple times
                -- Doesn't sync properly, the starspawn itself now checks each panel
                --obj.parentObj.oHiddenStarTriggerCounter = obj.parentObj.oHiddenStarTriggerCounter + 1 - (2 * obj.oAnimState)
                obj.oAnimState = obj.oAnimState ~ 1

                cur_obj_play_sound_1(SOUND_GENERAL_BIG_CLOCK)
                obj.oAction = FLIPSWITCH_PANEL_ACT_MARIO_IS_ON
                network_send_object(obj, true)
            end
        elseif action == FLIPSWITCH_PANEL_ACT_MARIO_IS_ON then
            local closest_player = nearest_player_to_object(obj)
            if not closest_player or (cur_obj_is_mario_on_platform() == 0 and closest_player.platform ~= obj) then
                obj.oAction = FLIPSWITCH_PANEL_ACT_IDLE
            end
        end
    end
end

--id_bhvFlipswitch_Panel_MOP = hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_flipswitch_panel_init, bhv_flipswitch_panel_loop, "bhvFlipswitch_Panel_MOP")

---@param obj Object
function bhv_flipswitch_panel_starspawn_init(obj)
    obj.oFlags = OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE
    obj.oHealth = 0
end

---@param obj Object
function bhv_flipswitch_panel_starspawn_loop(obj)
    local amount_of_panels = obj_count_objects_with_behavior_id(bhvFlipswitch_Panel_MOP)
    -- Prevents the starspawn mop from prematurely assume all panels have been pressed
    if amount_of_panels > obj.oHealth or obj.oHealth == 0 then
        obj.oHealth = amount_of_panels
        return
    end

    -- Force check every panel
    obj.oHiddenStarTriggerCounter = 0
    local panel = obj_get_first_with_behavior_id(bhvFlipswitch_Panel_MOP)
    while panel do
        if panel.oAnimState == 1 then
            obj.oHiddenStarTriggerCounter = obj.oHiddenStarTriggerCounter + 1
        end
        panel = obj_get_next_with_same_behavior_id(panel)
    end

    if obj.oHiddenStarTriggerCounter == obj.oHealth and not StarSpawned then
        spawn_red_coin_cutscene_star(obj.oPosX, obj.oPosY, obj.oPosZ)
        StarSpawned = true
        obj_mark_for_deletion(obj)
    end
end

hook_event(HOOK_ON_OBJECT_UNLOAD,
---@param obj Object
function (obj)
    -- Force spawn star for newly entering players
    if obj_has_behavior_id(obj, bhvFlipswitch_Panel_StarSpawn_MOP) == 1 and obj.oHiddenStarTriggerCounter ~= obj.oHealth and not StarSpawned then
        local starspawn_obj = obj_get_first_with_behavior_id(bhvFlipswitch_Panel_StarSpawn_MOP)
        spawn_red_coin_cutscene_star(starspawn_obj.oPosX, starspawn_obj.oPosY, starspawn_obj.oPosZ)
        StarSpawned = true
    end
end)

--id_bhvFlipswitch_Panel_StarSpawn_MOP = hook_behavior(nil, OBJ_LIST_GENACTOR, false, bhv_flipswitch_panel_starspawn_init, bhv_flipswitch_panel_starspawn_loop, "bhvFlipswitch_Panel_StarSpawn_MOP")

------ Switchblock ------
-- This block is either red or blue. If the corresponding switch is pressed, activate blocks of one color and deactivate blocks of another color.
-- The color of each block and switch depends on the 2nd byte.
-- Switch blocks: 2nd byte of 0 is red, 2nd byte of 2 is blue.
-- Switches: 2nd byte of 0 is red, 2nd byte of 1 is blue (Unpressed)
-- Anim state: 0 is red, 1 is red deactivated, 2 is blue, 3 is blue deactivated.
-- Switch Block State: 0 is red active, 1 is blue active

-- Determinds the starting switch block color
-- Not all romhacks start each level with the same switch active, so this will need to be adjusted
local START_STATE = 1
local switch_block_state = START_STATE

---@param obj Object
function bhv_Switchblock_init(obj)
    obj_set_model_extended(obj, E_MODEL_SWITCHBLOCK)
end

---@param obj Object
function bhv_Switchblock_loop(obj)
    -- Determines which block color this becomes
    obj.oAnimState = obj.oBehParams2ndByte + obj.oAction

    -- Only loads collision if the corresponding switch is pressed
    if switch_block_state == obj.oBehParams2ndByte >> 1 then
        load_object_collision_model()
        obj.oAction = SWITCHBLOCK_ACT_ACTIVE
    else
        obj.oAction = SWITCHBLOCK_ACT_INACTIVE
    end
end

--id_bhvSwitchblock_MOP = hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_Switchblock_init, bhv_Switchblock_loop, "bhvSwitchblock_MOP")

local scalar_timer = 0

---@param obj Object
function bhv_Switchblock_Switch_init(obj)
    obj_set_model_extended(obj, E_MODEL_SWITCHBLOCK_SWITCH)
end

---@param obj Object
function bhv_Switchblock_Switch_loop(obj)
    obj.oAnimState = obj.oBehParams2ndByte
    local old_state = switch_block_state
    if cur_obj_is_mario_on_platform() == 1 and not is_bubbled(gMarioStates[0]) then
        switch_block_state = obj.oBehParams2ndByte
    end

    local scalar = 0
    if switch_block_state ~= obj.oBehParams2ndByte then
        scalar = 1
    end

    -- Whenever the switch block state changes
    if old_state ~= switch_block_state then
        scalar_timer = 0
        local np = gNetworkPlayers
        for i = 1, MAX_PLAYERS - 1, 1 do
            if is_current_area_sync_valid() and np[0].currLevelNum == np[i].currLevelNum then
                network_send_to(i, true, { timer = 0, state = switch_block_state })
            end
        end
    end

    -- Slowly raise and lower the switch
    if scalar_timer < 100 then
        scalar_timer = scalar_timer + 1
    end

    local result = scalar * 0.9 + 0.1
    local current_scale = obj.header.gfx.scale.y

    -- Make smaller if the switch is pressed
    obj.header.gfx.scale.y = lerp(current_scale, result, scalar_timer * 0.01)
end

--id_bhvSwitchblock_Switch_MOP = hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_Switchblock_Switch_init, bhv_Switchblock_Switch_loop, "bhvSwitchblock_Switch_MOP")

hook_event(HOOK_ON_PACKET_RECEIVE,
function (datatable)
    scalar_timer = datatable.timer
    switch_block_state = datatable.state
end)

hook_event(HOOK_ON_LEVEL_INIT,
function ()
    switch_block_state = START_STATE
end)

------ Moving Rotating Block ------
-- Moves on a square path. Occationally flips.

local ZPLUS = 0
local ZMINUS = 1
local XPLUS = 2
local XMINUS = 3
local LOOP = 4

local MoveRotatePath1 = {
    ZPLUS,
    XPLUS,
    ZMINUS,
    XMINUS,
    LOOP
}

local MoveRotatePath2 = {
    ZPLUS,
    ZPLUS,
    ZPLUS,
    ZMINUS,
    ZMINUS,
    ZMINUS,
    LOOP
}

local MoveRotatePath3 = {
    XPLUS,
    XPLUS,
    XPLUS,
    XMINUS,
    XMINUS,
    XMINUS,
    LOOP
}

-- Paths 4, 5, and 6 are from SR 6.25 and may not be used by most hacks

local MoveRotatePath4 = {
    XMINUS,
    XMINUS,
    XMINUS,
    XPLUS,
    XPLUS,
    XPLUS,
    LOOP
}

local MoveRotatePath5 = {
    XMINUS,
    XPLUS,
    LOOP
}

local MoveRotatePath6 = {
    XPLUS,
    XMINUS,
    LOOP
}

local Paths = {
    MoveRotatePath1,
    MoveRotatePath2,
    MoveRotatePath3,
    MoveRotatePath4,
    MoveRotatePath5,
    MoveRotatePath6
}

--speeds are 8 in each dir
--red is bparam1 =1, offset timer by 0x80 on frame 1
--rotates every 0x110 frames aka ~9s or 272 frames
--rotate for pitch vel of 0x0400 for 0x20 frames
--advanced forward a direction every 0x3C frames

---@param obj Object
function bhv_move_rotate_init(obj)
    -- 1st byte must be 0 or 1 for this to work
    obj.oTimer = obj.oTimer + 0x80 * (obj.oBehParams >> 24)
	obj.oAnimState = (obj.oBehParams >> 24)
    obj.oUnk1A8 = 0
    -- Forces the 1st case
    obj.oUnk94 = 0

    obj_set_model_extended(obj, E_MODEL_MOVING_ROATING_BLOCK)
end

local PLAT_SPEED = 8
local PLAT_FLIP_START_TIMER = 0x110
local PLAT_FLIP_END_TIMER = 0x130
local PLAT_MOVEMENT_FRAMES = 0x3C
local PLAT_WARNING_SPEED = 0x40

---@param obj Object
function bhv_move_rotate_loop(obj)
    local direction = 0
    -- Warning
    if obj.oTimer == PLAT_FLIP_START_TIMER - 32 then
        obj.oAngleVelPitch = obj.oAngleVelPitch - PLAT_WARNING_SPEED
    -- After a while, flip the platform
    elseif obj.oTimer == PLAT_FLIP_START_TIMER then
		obj.oAngleVelPitch = obj.oAngleVelPitch + 0x400 + PLAT_WARNING_SPEED
	elseif obj.oTimer == PLAT_FLIP_END_TIMER + 2 then
		obj.oAngleVelPitch = 0
		obj.oTimer = 0
    end

    -- Adding 1 since lua uses 1 index rather than c which uses 0 index
	direction = Paths[obj.oBehParams2ndByte + 1][obj.oUnk94 + 1] -- oUnk1A4 was replaced with oSyncDeath

    -- In this case, since there's a lot of possible states, a switch is faster
	switch(direction, {
        [ZPLUS] = function ()
            obj.oUnk1A8 = obj.oUnk1A8 + 1
			obj.oVelZ = PLAT_SPEED
			obj.oVelX = 0
        end,
		[ZMINUS] = function ()
			obj.oUnk1A8 = obj.oUnk1A8 + 1
			obj.oVelZ = -PLAT_SPEED
			obj.oVelX = 0
        end,
		[XPLUS] = function ()
            obj.oUnk1A8 = obj.oUnk1A8 + 1
			obj.oVelX = PLAT_SPEED
			obj.oVelZ = 0
        end,
		[XMINUS] = function ()
            obj.oUnk1A8 = obj.oUnk1A8 + 1
			obj.oVelX = -PLAT_SPEED
			obj.oVelZ = 0
        end,
		["default"] = function ()
            obj.oUnk94 = 0
        end
	})

    -- After moving in a direction for a while, move in the next
	if obj.oUnk1A8 == PLAT_MOVEMENT_FRAMES then
		obj.oUnk94 = obj.oUnk94 + 1
		obj.oUnk1A8 = 0
    end

	cur_obj_rotate_face_angle_using_vel()
	cur_obj_move_using_vel()
end

--id_bhvMoving_Rotating_Block_MOP = hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_move_rotate_init, bhv_move_rotate_loop, "bhvMoving_Rotating_Block_MOP")

-----------------
-----Emitter-----
-----------------
-- Emits sparkles

---@param obj Object
function bhv_emitter_loop(obj)
    spawn_object(obj, E_MODEL_NONE, id_bhvSparkleSpawn)
end

--id_bhvEmitter_MOP = hook_behavior(nil, OBJ_LIST_GENACTOR, false, bhv_emitter_init, bhv_emitter_loop, "bhvEmitter_MOP")

----- Blargg -----

-- Animation ID
local ANM_swim = 0
local ANM_attack = 1

--- Enemy Blargg ---

---@type ObjectHitbox
local sBlarggHitbox = {
    interactType = INTERACT_DAMAGE,
    downOffset = 0,
    damageOrCoinValue = 1,
    health = 0,
    numLootCoins = 0,
    --[[ -- Original, however I believe they're a little too large
    radius = 300,
    height = 235,
    hurtboxRadius = 300,
    hurtboxHeight = 110
    ]]
    radius = 200,
    height = 235,
    hurtboxRadius = 200,
    hurtboxHeight = 110
}

-- Summon visual flames
---@param obj Object
local function bhv_koopa_shell_flame_spawn(obj)
    for i = 0, 2 do
        spawn_object(obj, E_MODEL_RED_FLAME, id_bhvKoopaShellFlame)
    end
end

-- Check if blargg hit Mario
---@param obj Object
local function blargg_check_mario_collision(obj)
    if obj.oInteractStatus & INT_STATUS_INTERACTED ~= 0 then
        cur_obj_play_sound_2(SOUND_MOVING_LAVA_BURN)
        obj.oInteractStatus = obj.oInteractStatus & ~INT_STATUS_INTERACTED
        obj.oAction = BLARGG_ACT_KNOCKBACK
        obj.oFlags = obj.oFlags & ~OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW
        cur_obj_init_animation(ANM_swim)
        obj.oBullyMarioCollisionAngle = obj.oMoveAngleYaw
    end
end

-- Waiting
---@param obj Object
---@param m MarioState
local function blargg_act_swim(obj, m)
    obj.oForwardVel = 5.0
    if obj_return_home_if_safe(obj, obj.oHomeX, obj.oPosY, obj.oHomeZ, 800) == 1 and m.floor.type ~= SURFACE_DEFAULT then
        obj.oAction = BLARGG_ACT_CHASE
    end
end

-- Mario found, activate chase
---@param obj Object
---@param m MarioState
local function blargg_act_chase_mario(obj, m)
    local homeX = obj.oHomeX
    local posY = obj.oPosY
    local homeZ = obj.oHomeZ

    obj.oFlags = obj.oFlags | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW
    obj.oMoveAngleYaw = obj.oFaceAngleYaw
    obj_turn_toward_object(obj, m.marioObj, 16, 4096)

    -- Mario will never ride on a hostile blargg so I don't understand this
    --obj.oForwardVel = (gMarioStates[0].riddenObj == obj) and 40 or 10
    obj.oForwardVel = 10

    bhv_koopa_shell_flame_spawn(obj)
    -- If Mario is too far or is no longer on lava, start swimming
    if is_point_within_radius_of_mario(homeX, posY, homeZ, 5000) == 0 or m.floor.type == SURFACE_DEFAULT then
        obj.oAction = BLARGG_ACT_SWIM
        cur_obj_init_animation(ANM_swim)
    end
end

-- Hit Mario, recieve the knockback
---@param obj Object
---@param m MarioState
local function blargg_act_knockback(obj, m)
    -- Only activate during BLARGG_ACT_SWIM, it appears
    if obj.oForwardVel < 10.0 and repack(obj.oVelY, "f", "L") == 0 then
        obj.oForwardVel = 1.0
        obj.oBullyKBTimerAndMinionKOCounter = obj.oBullyKBTimerAndMinionKOCounter + 1
        obj.oFlags = obj.oFlags | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW
        obj.oMoveAngleYaw = obj.oFaceAngleYaw
        obj_turn_toward_object(obj, m.marioObj, 16, 1280)
    else
        -- ! Changed from curAnim to animInfo
        obj.header.gfx.animInfo.animFrame = 0
    end

    -- After some time, start chasing again
    if obj.oBullyKBTimerAndMinionKOCounter == 18 then
        obj.oAction = BLARGG_ACT_CHASE
        obj.oBullyKBTimerAndMinionKOCounter = 0
        cur_obj_init_animation(ANM_attack)
        cur_obj_play_sound_2(SOUND_OBJ2_PIRANHA_PLANT_BITE)
    end
end

---@param obj Object
local function blargg_act_back_up(obj)
    if obj.oTimer == 0 then
        obj.oFlags = obj.oFlags & ~OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW
        obj.oMoveAngleYaw = obj.oMoveAngleYaw + 0x8000
    end

    obj.oForwardVel = 5.0

    if obj.oTimer == 15 then
        obj.oMoveAngleYaw = obj.oFaceAngleYaw
        obj.oFlags = obj.oFlags | OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW
        obj.oAction = BLARGG_ACT_SWIM
    end
end

local function blargg_backup_check(obj, collisionFlags)
    if collisionFlags & OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW == 0 and obj.oAction ~= BLARGG_ACT_KNOCKBACK then
        obj.oPosX = obj.oBullyPrevX
        obj.oPosZ = obj.oBullyPrevZ
        obj.oAction = BLARGG_ACT_BACKUP
    end
end

---@param obj Object
local function blargg_step(obj)
    local collisionFlags = 0
    collisionFlags = object_step()
    -- Possibly back up upon hitting a wall
    blargg_backup_check(obj, collisionFlags)
end

---@param obj Object
function bhv_blargg_init(obj)
    cur_obj_init_animation(ANM_swim)
    obj_set_model_extended(obj, E_MODEL_BLARGG)
    obj.oGravity = 4.0
    obj.oFriction = 0.91
    obj.oBuoyancy = 1.3

    obj_set_hitbox(obj, sBlarggHitbox)
    network_init_object(obj, true, nil)
end

---@param obj Object
function bhv_blargg_loop(obj)
    obj.oIntangibleTimer = 0
    obj.oBullyPrevX = obj.oPosX
    obj.oBullyPrevY = obj.oPosY
    obj.oBullyPrevZ = obj.oPosZ
    blargg_check_mario_collision(obj)

    ---@type MarioState
    local m = gMarioStates[0]
    -- In this case, since there's a lot of possible states, a switch is faster
    switch (obj.oAction, {
        [BLARGG_ACT_SWIM] = function ()
            blargg_act_swim(obj, m)
            blargg_step(obj)
        end,
        [BLARGG_ACT_CHASE] = function ()
            blargg_act_chase_mario(obj, m)
            blargg_step(obj)
        end,
        [BLARGG_ACT_KNOCKBACK] = function ()
            blargg_act_knockback(obj, m)
            blargg_step(obj)
        end,
        [BLARGG_ACT_BACKUP] = function ()
            obj.oForwardVel = 10.0
            blargg_act_back_up(obj)
            blargg_step(obj)
        end,
        [BULLY_ACT_DEATH_PLANE_DEATH] = function ()
            obj.activeFlags = ACTIVE_FLAG_DEACTIVATED
        end
    })
end

--id_bhvBlargg = hook_behavior(nil, OBJ_LIST_GENACTOR, false, bhv_blargg_init, bhv_blargg_loop, "bhvBlargg")

--- Friendly Blargg ---

---@type ObjectHitbox
local sBlarggFriendlyHitbox = {
    interactType = INTERACT_KOOPA_SHELL,
    downOffset = 0,
    damageOrCoinValue = 4,
    health = 1,
    numLootCoins = 1,
    radius = 50,
    height = 50,
    hurtboxRadius = 50,
    hurtboxHeight = 50,
}

---@param obj Object
---@param m MarioState
local function blargg_friendly_explode(obj, m)
    set_mario_action(m, ACT_WALKING, 0)
    mario_stop_riding_object(m)

    obj_mark_for_deletion(obj)
    if obj.oTimer < 5 then
        local scale = repack(obj.oTimer * 0.2, "I", "f")
        cur_obj_scale(scale)
    else
        local explosion = spawn_object(obj, E_MODEL_EXPLOSION, id_bhvExplosion)
        if explosion then
            explosion.oGraphYOffset = explosion.oGraphYOffset + 100
        end

        -- Some fields required for this to exist aren't exposed to lua
        --create_respawner(obj, E_MODEL_FRIENDLY_BLARGG, obj.behavior, 3000)
        spawn_non_sync_object(
            get_id_from_behavior(obj.behavior),
            E_MODEL_FRIENDLY_BLARGG,
            obj.oHomeX, obj.oHomeY, obj.oHomeZ,
            nil)
        obj.activeFlags = obj.activeFlags | ACTIVE_FLAG_DEACTIVATED
    end
end

---@param obj Object
function bhv_friendly_blargg_init(obj)
    cur_obj_init_animation(ANM_swim)
    obj_set_hitbox(obj, sBlarggFriendlyHitbox)
    obj_set_model_extended(obj, E_MODEL_FRIENDLY_BLARGG)
end

---@param obj Object
function bhv_blargg_friendly_loop(obj)
    local action = obj.oAction
    if action == FRIENDLY_BLARGG_ACT_IDLE then
        cur_obj_update_floor_and_walls()
        cur_obj_if_hit_wall_bounce_away()
        if obj.oInteractStatus & INT_STATUS_INTERACTED ~= 0 then
            obj.oAction = FRIENDLY_BLARGG_ACT_BEING_RIDDEN
        end
        cur_obj_move_standard(-20)
    elseif action == FRIENDLY_BLARGG_ACT_BEING_RIDDEN then
        ---@type MarioState
        local m = gMarioStates[0]
        obj_copy_pos(obj, m.marioObj)
        local floor = cur_obj_update_floor_height_and_get_floor()
        if 5.0 > math.abs(obj.oPosY - obj.oFloorHeight) then
            -- Explode if Mario moves onto a non-lava surface
            if floor and floor.type == SURFACE_BURNING then
                bhv_koopa_shell_flame_spawn(obj)
            else
                blargg_friendly_explode(obj, m)
            end
        else
            -- Explode if Mario is not right on the lava
            blargg_friendly_explode(obj, m)
            obj.oFaceAngleYaw = m.marioObj.oMoveAngleYaw
            -- At least blargg gets to live in this case
            if obj.oInteractStatus & INT_STATUS_STOP_RIDING ~= 0 then
                obj_mark_for_deletion(obj)
                spawn_mist_particles()
                obj.oAction = FRIENDLY_BLARGG_ACT_IDLE
            end
        end
    end
    obj.oInteractStatus = 0
end

--id_bhvFriendlyBlargg = hook_behavior(nil, OBJ_LIST_LEVEL, false, bhv_friendly_blargg_init, bhv_blargg_friendly_loop, "bhvFriendlyBlargg")

------ P Switch ------
-- Purple switch that converts coins to cork boxes and vice versa

local function Swap_Coins_Box()
	local box_obj = obj_get_first_with_behavior_id(id_bhvBreakableBox)
	local coin_obj = obj_get_first_with_behavior_id(id_bhvYellowCoin)
	-- Turn all breakable boxes into yellow coins...
	while box_obj do
        box_obj.activeFlags = ACTIVE_FLAG_DEACTIVATED
        spawn_object(box_obj , E_MODEL_YELLOW_COIN, id_bhvYellowCoin)
        box_obj = obj_get_next_with_same_behavior_id(box_obj)
	end
    -- ...and all yellow coins into breakable boxes
	while coin_obj do
        coin_obj.activeFlags = ACTIVE_FLAG_DEACTIVATED
        coin_obj.oIntangibleTimer = -1
        spawn_object(coin_obj , E_MODEL_BREAKABLE_BOX, id_bhvBreakableBox)
        coin_obj = obj_get_next_with_same_behavior_id(coin_obj)
	end
end

---@param obj Object
function bhv_pswitch_init(obj)
    obj_set_model_extended(obj, E_MODEL_PURPLE_SWITCH)
end

---@param obj Object
function bhv_pswitch_loop(obj)
    ---@type MarioState
    local m = gMarioStates[0]
    ---@type Object
    local m_obj = gMarioStates[0].marioObj
    local sound_source = {x = 0, y = 0, z = 0}
    -- In this case, since there's a lot of possible states, a switch is faster
    switch (obj.oAction, {
        --[[
         * Set the switch's model and scale. If Mario is standing near the
         * switch's middle section, transition to the pressed state.
         --]]
        [PURPLE_SWITCH_IDLE] = function ()
            cur_obj_scale(1.0)
            if m_obj.platform == obj and m.action & MARIO_UNKNOWN_13 == 0 then
                if lateral_dist_between_objects(obj, m_obj) < 127.5 then
                    obj.oAction = PURPLE_SWITCH_PRESSED
                end
            end
        end,
        --[[
         * Collapse the switch downward, play a sound, and shake the screen.
         * Immediately transition to the ticking state.
         --]]
        [PURPLE_SWITCH_PRESSED] = function ()
            cur_obj_scale_over_time(2, 3, 1.0, 0.2)
            if obj.oTimer == 3 then
                cur_obj_play_sound_2(SOUND_GENERAL2_PURPLE_SWITCH)
                obj.oAction = PURPLE_SWITCH_TICKING
                cur_obj_shake_screen(SHAKE_POS_SMALL)
				Swap_Coins_Box()
			end
        end,
        --[[
         * Play a continuous ticking sound that gets faster when time is almost
         * up. When time is up, move to a waiting-while-pressed state.
         --]]
        [PURPLE_SWITCH_TICKING] = function ()
            if obj.oTimer < 360 then
				play_sound(SOUND_GENERAL2_SWITCH_TICK_FAST, sound_source)
			else
				play_sound(SOUND_GENERAL2_SWITCH_TICK_SLOW, sound_source)
            end
			if obj.oTimer > 400 then
				obj.oAction = PURPLE_SWITCH_WAIT_FOR_MARIO_TO_GET_OFF
				Swap_Coins_Box()
            end
        end,
        --[[
         * Make the switch look unpressed again, and transition back to the
         * idle state.
         --]]
        [PURPLE_SWITCH_UNPRESSED] = function ()
            cur_obj_scale_over_time(2, 3, 0.2, 1.0)
            if obj.oTimer == 3 then
                obj.oAction = PURPLE_SWITCH_IDLE
            end
        end,
        --[[
         * Mario is standing on the switch, but time has expired. Wait for
         * him to get off the switch, and when he does so, transition to the
         * unpressed state.
         --]]
        [PURPLE_SWITCH_WAIT_FOR_MARIO_TO_GET_OFF] = function ()
            if cur_obj_is_mario_on_platform() == 0 then
                obj.oAction = PURPLE_SWITCH_UNPRESSED
            end
        end
    })
end

--id_bhvPSwitch_MOP = hook_behavior(nil, OBJ_LIST_SURFACE, false, bhv_pswitch_init, bhv_pswitch_loop, "bhvPSwitch_MOP")

------ Shell 1/2 ------
-- No idea how they're made but they seem to copy the small breakable box
-- However, since I really don't know how they work, they'll be deleted

id_bhvShell_1_MOP = hook_behavior(nil, OBJ_LIST_UNIMPORTANT, false, function (obj) obj_mark_for_deletion(obj) end, nil, "bhvShell_1_MOP")
id_bhvShell_2_MOP = hook_behavior(nil, OBJ_LIST_UNIMPORTANT, false, function (obj) obj_mark_for_deletion(obj) end, nil, "bhvShell_2_MOP")

------ Jukebox ------
-- Allows the music to change within the same area
-- Not possible in coop, or even regular pc port for that matter as far as I can tell

id_bhvJukebox_MOP = hook_behavior(nil, OBJ_LIST_UNIMPORTANT, false, function (obj) obj_mark_for_deletion(obj) end, nil, "bhvJukebox_MOP")
