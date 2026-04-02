smlua_text_utils_course_acts_replace(COURSE_BOB, " 1 BOB-OMB VALLEY", ("CHOMP-PROTECTED TOWN"), ("KOOPA THE QUICK'S RETURN"), ("TO THE LOOKOUT"), ("ONTO THE FLOATING ISLE"), ("REDS IN THE CAVERN"), ("MARIO WINGS TO THE SKY -WC-"))
smlua_text_utils_course_acts_replace(COURSE_WF, " 2 WHOMP'S NEW FORTRESS", ("TOP OF THE FORTRESS"), ("THE SIDE TOWER"), ("SHOOT INTO THE WILD BLUE"), ("POLES, AMPS AND BUMPERS"), ("CAGE OF THE SECRET DOORS"), ("IN THE PRISON -VC-"))
smlua_text_utils_course_acts_replace(COURSE_JRB, " 3 JOLLY ROGER BAY", ("TREASURE OF THE OCEAN CAVE"), ("ON BOARD THE DORMANT SHIP"), ("PLUMBER IN THE SUNKEN SHIP"), ("THE LIGHTHOUSE'S POLE REDS"), ("THE 5 OCEAN FLOWERS"), ("PRESS THE DROWNED SWITCH -MC-"))
smlua_text_utils_course_acts_replace(COURSE_CCM, " 4 COOL, COOL MOUNTAIN", ("SLIP SLIDIN' AWAY"), ("TOP OF THE MOUNTAIN"), ("LI'L PENGUIN LOST"), ("WALLJUMPS WILL WORK"), ("SNOWMAN'S AMAZING HAT"), ("FROSTY SLIDE FOR 8 REDS"))
smlua_text_utils_course_acts_replace(COURSE_BBH, " 5 BIG BOO'S FOREST", ("TOXIC SWAMP REDS"), ("MERRY-GO-ROUND'S GHOST PROBLEM"), ("SECRET OF THE HAUNTED BOOKS"), ("BIG BOO'S BALCONY"), ("RED RENT OF THE MANSION"), ("FORGOTTEN HALLS -VC-"))
smlua_text_utils_course_acts_replace(COURSE_HMC, " 6 HAZY MAZE SEWERS", ("SWIMMING BEAST IN THE CAVERN"), ("GREEN RIDES ATOP THE SEWERS"), ("WHERE THE ROLLING ROCKS CAME FROM"), ("A-MAZE-ING EMERGENCY EXIT"), ("TOXIC MAZE RED COINS"), ("METAL-HEAD MARIO CAN MOVE! -MC-"))
smlua_text_utils_course_acts_replace(COURSE_LLL, " 7 LETHAL LAVA LAND", ("BOIL THE BIG BULLY"), ("BULLY THE 3 BULLIES OF THE ARENA"), ("RED-HOT LOG PLATFORMING"), ("SECRETS OF THE FORGOTTEN FORT"), ("COIN PUZZLE CAVE"), ("INSIDE THE VOLCANO"))
smlua_text_utils_course_acts_replace(COURSE_SSL, " 8 SHIFTING SAND LAND", ("IN THE TALONS OF THE BIG BIRD"), ("TOX BOX PILLAR CANYON"), ("CLIMB THE SKYWARD RUINS"), ("PANELS INSIDE THE ANCIENT PYRAMID"), ("FLOORLESS SWITCH DUNGEON"), ("THE PYRAMID'S GUARDIAN"))
smlua_text_utils_course_acts_replace(COURSE_DDD, " 9 LUDWIG'S HARBOR", ("DEPOWER THE LUDSHIP MK2"), ("TIME-CONSUMING CONSTRUCTION"), ("SECRETS OF THE BACKDOOR ISLES"), ("REDS IN THE HARBOR"), ("POLES TO THE UPPER DECK"), ("DANGEROUS HARBOR ATHLETICS -WC-VC-"))
smlua_text_utils_course_acts_replace(COURSE_SL, " 10 SNOWMAN'S ISLAND", ("SNOWMAN'S BIG HEAD"), ("ICY HOUSE WARP"), ("SNOWSLOPE DUNGEON"), ("CHILL WITH THE BULLY"), ("SHELL SHREDDIN' FOR REDS"), ("STAR BEHIND ICY WALLS -VC-"))
smlua_text_utils_course_acts_replace(COURSE_WDW, " 11 WET-DRY CITY", ("PANELS AT THE TOP"), ("CANNON TO THE UNDERGROUND REDS"), ("EXPRESS ELEVATOR--HURRY UP!"), ("SWITCHES AND DIAMONDS"), ("DRAINING, WARPING PATHWAYS"), ("DOWNTOWN CAP ACTION -MC-VC-"))
smlua_text_utils_course_acts_replace(COURSE_TTM, " 12 SEASONAL MOUNTAIN", ("SCALE THE FALL MOUNTAIN"), ("POISONOUS MOUNTAIN SLIDE"), ("REDS TO THE NOT SO LONELY SHROOM"), ("SECRETS OF THE TUNNELS"), ("STAR BEHIND THE ICEFALL -VC-"), ("MISTY MOUNTAIN AIRPANELS -WC-"))
smlua_text_utils_course_acts_replace(COURSE_THI, " 13 SWEET SWEET ISLAND", ("PLUCK THE PIRANHAS"), ("OPEN THE CHOCO DOG HOUSE"), ("REMATCH WITH KOOPA THE QUICK"), ("MINTY PANEL DEMISE"), ("RED, BLUE AND GREEN SWITCHES"), ("REDS IN THE HOLLOW CAKE"))
smlua_text_utils_course_acts_replace(COURSE_TTC, " 14 TICK TOCK CORE", ("F1 CUBES TO THE CLOCK ARM"), ("F2 HEXAGON MADNESS"), ("F3 SIMPLE MOTION DELAY"), ("F4 AGAINST THE CLOCKWORK"), ("F5 THE ELEVATOR'S TOP"), ("F6 BLOCKY SPIRAL CLIMB"))
smlua_text_utils_course_acts_replace(COURSE_RR, " 15 TRANQUIL MOON", ("B- TILTED PLATFORMING"), ("R- MOVING SPONGE GARDENS"), ("B- WATER-LIFTED CRUISER"), ("R- ATOP THE RAINBOW SPIRE"), ("B- COINS AMASSED IN A MAZE"), ("R- CANNON TO THE LAVA PILLARS -MC-"))
smlua_text_utils_secret_star_replace(16, "MARIO IN THE DARK WORLD")
smlua_text_utils_secret_star_replace(17, "PANDORA PALACE")
smlua_text_utils_secret_star_replace(18, "DARK STAR DOMAIN")
smlua_text_utils_secret_star_replace(19, "SLIDE METROPOLIS")
smlua_text_utils_secret_star_replace(20, "DEATH WIND")
smlua_text_utils_secret_star_replace(21, "SWITCH PALACE")
smlua_text_utils_secret_star_replace(22, "SILENCE")
smlua_text_utils_secret_star_replace(23, "FAREWELL")
smlua_text_utils_secret_star_replace(24, "WET-DRY CITY BIG RUN")
smlua_text_utils_secret_star_replace(25, "FIRE FIELD")
smlua_text_utils_castle_secret_stars_replace("CASTLE SECRET STARS")

--Area Names
local names = {
     [LEVEL_CASTLE_GROUNDS] = {
        [1] = {name = "Castle Grounds"},
        [2] = {name = "2nd Basement"},
        [3] = {name = "2nd Basement"}
     },
     [LEVEL_CASTLE] = {
        [1] = {name = "1st Floor"},
        [2] = {name = "Castle Grounds"}
     },
     [LEVEL_CASTLE_COURTYARD] = {
        [1] = {name = "1st Basement"},
        [2] = {name = "2nd Floor"},
        [3] = {name = "2nd Floor"}
     },
     [LEVEL_BITDW] = {
         [1] = {name = "Mario In The Dark World"},
         [2] = {name = "The End #1"},
         [3] = {name = "The End #2"}
     },
     [LEVEL_ENDING] = {
        [1] = {name = "Fire Field"},
        [2] = {name = "Fire Field"},
        [3] = {name = "Fire Field"},
        [4] = {name = "Fire Field"},
        [5] = {name = "The End #3"}
     }
}

local function area_names()
    for i = 0, MAX_PLAYERS - 1 do
        local np = gNetworkPlayers[i]
        local m = gMarioStates[i]
        local defaultAreaName = get_level_name(gNetworkPlayers[m.playerIndex].currCourseNum, gNetworkPlayers[m.playerIndex].currLevelNum, gNetworkPlayers[m.playerIndex].currAreaIndex)
            if names[gNetworkPlayers[m.playerIndex].currLevelNum] ~= nil then
                gPlayerSyncTable[m.playerIndex].location = names[gNetworkPlayers[m.playerIndex].currLevelNum][gNetworkPlayers[m.playerIndex].currAreaIndex].name
            else
                gPlayerSyncTable[m.playerIndex].location = defaultAreaName
            end
            network_player_set_override_location(np, gPlayerSyncTable[m.playerIndex].location)
        end
    end
    
hook_event(HOOK_UPDATE, area_names)
