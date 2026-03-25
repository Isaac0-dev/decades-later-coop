gLevelValues.entryLevel = LEVEL_CASTLE_GROUNDS
gLevelValues.exitCastleWarpNode = 10

gLevelValues.coinsRequiredForCoinStar = 80

gLevelValues.pssSlideStarTime = 840

gLevelValues.wingCapDuration = 1770
gLevelValues.vanishCapDuration = 570
gLevelValues.metalCapDuration = 720

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

vec3f_set(gLevelValues.starPositions.KoopaBobStarPos, 4665, 4503, 11006)
vec3f_set(gLevelValues.starPositions.PssSlideStarPos, 15118, -7303, 212)
vec3f_set(gLevelValues.starPositions.TuxieMotherStarPos, 366, -5336, 9379)
vec3f_set(gLevelValues.starPositions.WigglerStarPos, 0, 400, 0)
vec3f_set(gLevelValues.starPositions.GhostHuntBooStarPos, 150, -2210, -4260)
vec3f_set(gLevelValues.starPositions.BalconyBooStarPos, 4090, 5060, -2360)
vec3f_set(gLevelValues.starPositions.KingWhompStarPos, 0, 500, -1200)

gBehaviorValues.trajectories.KoopaBobTrajectory = get_trajectory('KoopaBoB_path')
