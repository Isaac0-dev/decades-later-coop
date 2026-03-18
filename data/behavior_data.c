//bhvUnused05A8 is basically a stub.
//SPAWN_CHILD(ID,bhvUnused05A8) to spawn model parts

// const BehaviorScript bhvFlipBlock_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
// SET_INT(oAction, 0),
// SET_FLOAT(oCollisionDistance, 500),
// LOAD_COLLISION_DATA(col_FlipBlock_MOP_0x7d1a98),
// CALL_NATIVE(bhv_flip_block_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_flip_block_loop),
// SET_INT(oInteractStatus, 0),
// END_LOOP(),
// };


// const BehaviorScript bhvNoteblock_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
// SET_HOME(),
// LOAD_COLLISION_DATA(col_Noteblock_MOP_0xaa6444),
// SCALE(0,64),
// CALL_NATIVE(bhv_noteblock_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_noteblock_loop),
// CALL_NATIVE(load_object_collision_model),
// END_LOOP(),
// };

// const BehaviorScript bhvSandBlock_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE ),
// SET_HOME()
// LOAD_COLLISION_DATA(col_Sandblock_MOP_0xaa6444),
// CALL_NATIVE(bhv_sandblock_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_sandblock_loop),
// END_LOOP(),
// };

// const BehaviorScript bhvSpring_MOP[] = {
// BEGIN(OBJ_LIST_LEVEL),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE ),
// SET_HITBOX(160,160),
// SET_INTERACT_TYPE(INTERACT_COIN),
// SET_INT(oIntangibleTimer, 0),
// CALL_NATIVE(bhv_Spring_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_Spring_loop),
// END_LOOP(),
// };

// /* Allows the music to change within the same area
// const BehaviorScript bhvJukebox_MOP[] = {
// BEGIN(OBJ_LIST_UNIMPORTANT),
// DEACTIVATE(),
// };

// // Little idea what these are for but they will need to remain off, else the game crashes
// const BehaviorScript bhvShell_1_MOP[] = {
// BEGIN(OBJ_LIST_DESTRUCTIVE),
// SCALE(0,400),
// GOTO(bhvBreakableBoxSmall+1),
// };
// const BehaviorScript bhvShell_2_MOP[] = {
// BEGIN(OBJ_LIST_DESTRUCTIVE),
// SCALE(0,400),
// GOTO(bhvBreakableBoxSmall+1),
// };
// */

const BehaviorScript bhvShrink_Platform_MOP[] = {
BEGIN(OBJ_LIST_SURFACE),
ID(id_bhvNewId),
OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE ),
LOAD_COLLISION_DATA(col_Shrink_Platform_MOP_0xad3720),
//SPAWN_CHILD(0x97,bhvUnused05A8),
CALL_NATIVE(bhv_shrinkplatform_init),
BEGIN_LOOP(),
CALL_NATIVE(bhv_shrinkplatform_loop),
CALL_NATIVE(load_object_collision_model),
END_LOOP(),
};

// const BehaviorScript bhvSwitchblock_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE ),
// LOAD_COLLISION_DATA(col_Switchblock_MOP_0x7d3058),
// CALL_NATIVE(bhv_Switchblock_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_Switchblock_loop),
// END_LOOP(),
// };

// const BehaviorScript bhvSwitchblock_Switch_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
// LOAD_COLLISION_DATA(col_Switchblock_Switch_MOP_0x7d7348),
// CALL_NATIVE(bhv_Switchblock_Switch_init),
// BEGIN_LOOP(),
// CALL_NATIVE(load_object_collision_model),
// CALL_NATIVE(bhv_Switchblock_Switch_loop),
// END_LOOP(),
// };

// const BehaviorScript bhvEmitter_MOP[] = {
// BEGIN(OBJ_LIST_GENACTOR),
// ID(id_bhvNewId),
// OR_INT(oFlags,OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO),
// SET_FLOAT(oDrawingDistance,5120),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_emitter_loop),
// END_LOOP(),
// };

const BehaviorScript bhvFlipswitch_Panel_StarSpawn_MOP[] = {
BEGIN(OBJ_LIST_GENACTOR),
ID(id_bhvNewId),
CALL_NATIVE(bhv_flipswitch_panel_starspawn_init),
BEGIN_LOOP(),
CALL_NATIVE(bhv_flipswitch_panel_starspawn_loop),
END_LOOP(),
};

const BehaviorScript bhvFlipswitch_Panel_MOP[] = {
BEGIN(OBJ_LIST_SURFACE),
ID(id_bhvNewId),
OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE ),
LOAD_COLLISION_DATA(col_Flipswitch_Panel_MOP_0x7daf78),
SET_FLOAT(oCollisionDistance,1024),
CALL_NATIVE(bhv_flipswitch_panel_init),
BEGIN_LOOP(),
CALL_NATIVE(bhv_flipswitch_panel_loop),
CALL_NATIVE(load_object_collision_model),
END_LOOP(),
};

// const BehaviorScript bhvCheckpoint_Flag_MOP[] = {
// BEGIN(OBJ_LIST_GENACTOR),
// ID(id_bhvNewId),
// OR_INT(oFlags,OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE | OBJ_FLAG_COMPUTE_DIST_TO_MARIO),
// SET_INT(oInteractType,INTERACT_POLE),
// SET_HITBOX(64,650),
// SET_INT(oIntangibleTimer, -1),
// CALL_NATIVE(bhv_checkpoint_flag_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_checkpoint_flag_loop),
// END_LOOP(),
// };

// const BehaviorScript bhvFlipswap_Platform_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE ),
// SET_INT(oFaceAngleRoll,0),
// LOAD_COLLISION_DATA(col_Flipswap_Platform_MOP_0x7d9d88),
// //SPAWN_CHILD(0x30,bhvUnused05A8),
// CALL_NATIVE(bhv_flipswap_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_flipswap_loop),
// CALL_NATIVE(load_object_collision_model),
// END_LOOP(),
// };

// //bhvYellowCoin gets converted
// const BehaviorScript bhvPSwitch_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
// LOAD_COLLISION_DATA(purple_switch_seg8_collision_0800C7A8),
// CALL_NATIVE(bhv_pswitch_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_pswitch_loop),
// CALL_NATIVE(load_object_collision_model),
// END_LOOP(),
// };

// const BehaviorScript bhvMoving_Rotating_Block_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
// LOAD_COLLISION_DATA(col_Moving_Rotating_Block_MOP_0x7e3ea0),
// SET_FLOAT(oDrawingDistance,19455),
// CALL_NATIVE(bhv_move_rotate_init),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_move_rotate_loop),
// CALL_NATIVE(load_object_collision_model),
// END_LOOP(),
// };

// const BehaviorScript bhvGreen_Switchboard_MOP[] = {
// BEGIN(OBJ_LIST_SURFACE),
// ID(id_bhvNewId),
// OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE | OBJ_FLAG_MOVE_XZ_USING_FVEL),
// LOAD_COLLISION_DATA(col_Green_Switchboard_MOP_0x7ddc38),
// CALL_NATIVE(bhv_green_switchboard_init),
// SET_HOME(),
// BEGIN_LOOP(),
// CALL_NATIVE(bhv_green_switchboard_loop),
// CALL_NATIVE(load_object_collision_model),
// END_LOOP(),
// };

// const BehaviorScript bhvBlargg[] = {
//     BEGIN(OBJ_LIST_GENACTOR),
//     OR_INT(oFlags, (OBJ_FLAG_SET_FACE_YAW_TO_MOVE_YAW | OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE)),
//     LOAD_ANIMATIONS(oAnimations, blargg_seg5_anims_0500616C),
//     DROP_TO_FLOOR(),
//     SET_HOME(),
//     CALL_NATIVE(bhv_blargg_init),
//     //SCALE(/*Unused*/ 0, /*Field*/ 150),
//     BEGIN_LOOP(),
//         SET_INT(oIntangibleTimer, 0),
//         CALL_NATIVE(bhv_blargg_loop),
//     END_LOOP(),
// };

// const BehaviorScript bhvFriendlyBlargg[] = {
//     BEGIN(OBJ_LIST_LEVEL),
//     OR_INT(oFlags, OBJ_FLAG_UPDATE_GFX_POS_AND_ANGLE),
//     LOAD_ANIMATIONS(oAnimations, blargg_seg5_anims_0500616C),
//     SET_OBJ_PHYSICS(/*Wall hitbox radius*/ 30, /*Gravity*/ -400, /*Bounciness*/ -50, /*Drag strength*/ 2000, /*Friction*/ 2000, /*Buoyancy*/ 200, /*Unused*/ 0, 0),
//     DROP_TO_FLOOR(),
//     SET_HOME(),
//     CALL_NATIVE(bhv_friendly_blargg_init),
//     BEGIN_LOOP(),
//         CALL_NATIVE(bhv_blargg_friendly_loop),
//     END_LOOP(),    
// };
