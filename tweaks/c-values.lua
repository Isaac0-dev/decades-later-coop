gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleWarpNode = 10

gServerSettings.skipIntro = 1

gBehaviorValues.starsNeededForDialog.dialog1 = 10
gBehaviorValues.starsNeededForDialog.dialog2 = 35
gBehaviorValues.starsNeededForDialog.dialog3 = 80
gBehaviorValues.starsNeededForDialog.dialog4 = 94
gBehaviorValues.starsNeededForDialog.dialog5 = 141
gBehaviorValues.starsNeededForDialog.dialog6 = 144

gBehaviorValues.MipsStar1Requirement = 0 
gBehaviorValues.MipsStar2Requirement = 141

gBehaviorValues.ToadStar1Requirement = 0   -- Overworld 2 Area 2 Brodute
gBehaviorValues.ToadStar2Requirement = 0
gBehaviorValues.ToadStar3Requirement = 0

gLevelValues.coinsRequiredForCoinStar = 80

gLevelValues.pssSlideStarTime = 840

gLevelValues.metalCapDuration = 750

gLevelValues.wingCapDurationTotwc = 1
gLevelValues.vanishCapDurationVcutm = 1
gLevelValues.metalCapDurationCotmc = 1

gLevelValues.wingCapSequence = 0x3A
gLevelValues.vanishCapSequence = 0x3B

gLevelValues.mushroom1UpHeal = 1

gLevelValues.previewBlueCoins = 1

gLevelValues.cellHeightLimit = 32767
gLevelValues.floorLowerLimit = -32768
gLevelValues.floorLowerLimitMisc = -32768
gLevelValues.floorLowerLimitShadow = -32768

hook_event(HOOK_MARIO_UPDATE, function (m) m.numLives = 100 m.peakHeight = m.pos.y end)

--useful list for choosing levels giving fixed collision
local courses = {
[LEVEL_BBH] = true,
[LEVEL_CCM] = false,
[LEVEL_CASTLE] = true,
[LEVEL_HMC] = true,
[LEVEL_SSL] = true,
[LEVEL_BOB] = true,
[LEVEL_SL] = true,
[LEVEL_WDW] = true,
[LEVEL_JRB] = true,
[LEVEL_THI] = true,
[LEVEL_TTC] = true,
[LEVEL_RR] = true,
[LEVEL_CASTLE_GROUNDS] = true,
[LEVEL_BITDW] = true,
[LEVEL_VCUTM] = true,
[LEVEL_BITFS] = true,
[LEVEL_SA] = true,
[LEVEL_BITS] = true,
[LEVEL_LLL] = true,
[LEVEL_DDD] = false,
[LEVEL_WF] = true,
[LEVEL_ENDING] = true,
[LEVEL_CASTLE_COURTYARD] = true,
[LEVEL_PSS] = true,
[LEVEL_COTMC] = false,
[LEVEL_TOTWC] = true,
[LEVEL_BOWSER_1] = true,
[LEVEL_WMOTR] = true,
[LEVEL_BOWSER_2] = true,
[LEVEL_BOWSER_3] = true,
[LEVEL_TTM] = true
}

local function fix_collision()
    gLevelValues.fixCollisionBugs = courses[gNetworkPlayers[0].currLevelNum] or false
end
gLevelValues.fixCollisionBugsRoundedCorners = 1
gLevelValues.fixCollisionBugsGroundPoundBonks = 0

hook_event(HOOK_ON_LEVEL_INIT, fix_collision)
