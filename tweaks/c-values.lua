gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleWarpNode = 10

gServerSettings.skipIntro = 1

gLevelValues.coinsRequiredForCoinStar = 80

gLevelValues.pssSlideStarTime = 840

gLevelValues.metalCapDuration = 750

gLevelValues.wingCapDurationTotwc = 1
gLevelValues.vanishCapDurationVcutm = 1
gLevelValues.metalCapDurationCotmc = 1

gLevelValues.mushroom1UpHeal = 1

gLevelValues.cellHeightLimit = 32767
gLevelValues.floorLowerLimit = -32768
gLevelValues.floorLowerLimitMisc = -32768
gLevelValues.floorLowerLimitShadow = -32768

gBehaviorValues.ToadStar1Requirement = 0 -- Overworld 2 Area 2 Brodute

hook_event(HOOK_MARIO_UPDATE, function (m) m.numLives = 100 m.peakHeight = m.pos.y end)
