
-- These sequences crash on older versions of coop
-- get the latest update to prevent crashes
if SM64COOPDX_VERSION < "v1.4.2" then
    return
end
--I think we might have all finale levels but hard to tell if this goes on for both sections or just one
--Also note its often to crash using v1.4.2 because of the insturments are not being played right
smlua_audio_utils_replace_sequence(0x01, 0x2A, 75, 'seq_01')-- Star Dance Celebration
smlua_audio_utils_replace_sequence(0x02, 0x2A, 75, 'seq_02')-- Finale Level Section 1  
smlua_audio_utils_replace_sequence(0x03, 0x2A, 75, 'seq_03')-- 333 Star Completion (The End #3)
smlua_audio_utils_replace_sequence(0x04, 0x2A, 75, 'seq_04')-- Inside Castle
smlua_audio_utils_replace_sequence(0x06, 0x2A, 75, 'seq_06')-- Finale Level Section 6
smlua_audio_utils_replace_sequence(0x07, 0x2A, 75, 'seq_07')-- Finale Level Section 3
smlua_audio_utils_replace_sequence(0x08, 0x2A, 75, 'seq_08')-- Course #10 (Can be played by using the Jukebox at spawn)
smlua_audio_utils_replace_sequence(0x09, 0x2A, 75, 'seq_09')-- Koopa Race
smlua_audio_utils_replace_sequence(0x0C, 0x2A, 75, 'seq_0C')-- Finale Level Section 5
smlua_audio_utils_replace_sequence(0x0D, 0x2A, 75, 'seq_0D')-- Act Select
smlua_audio_utils_replace_sequence(0x0E, 0x2A, 75, 'seq_0E')-- F-Zero Silence
smlua_audio_utils_replace_sequence(0x0F, 0x2A, 75, 'seq_0F')-- Metal Cap Theme
smlua_audio_utils_replace_sequence(0x11, 0x2A, 75, 'seq_11')-- Bowser 2
smlua_audio_utils_replace_sequence(0x12, 0x2A, 75, 'seq_12')-- Splatoon Celebration (Star Get)
smlua_audio_utils_replace_sequence(0x15, 0x2A, 75, 'seq_15')-- Star Spawn
smlua_audio_utils_replace_sequence(0x16, 0x19, 75, 'seq_16')-- Eyerok Boss Theme
smlua_audio_utils_replace_sequence(0x19, 0x2A, 75, 'seq_19')-- The Final Battle
smlua_audio_utils_replace_sequence(0x21, 0x2A, 75, 'seq_21')-- File Select
smlua_audio_utils_replace_sequence(0x23, 0x2A, 75, 'seq_23')-- Course #1
smlua_audio_utils_replace_sequence(0x24, 0x2A, 75, 'seq_24')-- Course #2
smlua_audio_utils_replace_sequence(0x25, 0x2A, 75, 'seq_25')-- BoB Cave and TTM Slide Music
smlua_audio_utils_replace_sequence(0x26, 0x2A, 75, 'seq_26')-- Castle Grounds
smlua_audio_utils_replace_sequence(0x27, 0x25, 75, 'seq_27')-- BroDute Star Constructions
smlua_audio_utils_replace_sequence(0x28, 0x2A, 75, 'seq_28')-- Course #3
smlua_audio_utils_replace_sequence(0x29, 0x2A, 75, 'seq_29')-- Course #4
smlua_audio_utils_replace_sequence(0x2A, 0x2A, 75, 'seq_2A')-- Course #5
smlua_audio_utils_replace_sequence(0x2B, 0x2A, 75, 'seq_2B')-- Course #6
smlua_audio_utils_replace_sequence(0x2C, 0x2A, 75, 'seq_2C')-- Course #7
smlua_audio_utils_replace_sequence(0x2D, 0x2A, 75, 'seq_2D')-- Course #8
smlua_audio_utils_replace_sequence(0x2E, 0x2A, 75, 'seq_2E')-- Course #8 (Pyramid)
smlua_audio_utils_replace_sequence(0x2F, 0x2A, 75, 'seq_2F')-- Course #9
smlua_audio_utils_replace_sequence(0x30, 0x2A, 75, 'seq_30')-- Course #10
smlua_audio_utils_replace_sequence(0x31, 0x2A, 75, 'seq_31')-- Course #11
smlua_audio_utils_replace_sequence(0x32, 0x2A, 75, 'seq_32')-- Course #12 (Autumn)
smlua_audio_utils_replace_sequence(0x33, 0x2A, 75, 'seq_33')-- Course #12 (Winter)
smlua_audio_utils_replace_sequence(0x34, 0x2A, 75, 'seq_34')-- Course #13
smlua_audio_utils_replace_sequence(0x35, 0x2A, 75, 'seq_35')-- Course #14
smlua_audio_utils_replace_sequence(0x36, 0x2A, 75, 'seq_36')-- Course #15
smlua_audio_utils_replace_sequence(0x37, 0x2A, 75, 'seq_37')-- TotWC
smlua_audio_utils_replace_sequence(0x38, 0x2A, 75, 'seq_38')-- CotMC
smlua_audio_utils_replace_sequence(0x39, 0x2A, 75, 'seq_39')-- VCutm
smlua_audio_utils_replace_sequence(0x3A, 0x2A, 75, 'seq_3A')-- Wing Cap
smlua_audio_utils_replace_sequence(0x3B, 0x2A, 75, 'seq_3B')-- Vanish Cap
smlua_audio_utils_replace_sequence(0x3C, 0x2A, 75, 'seq_3C')-- Wet Dry City Big Run
smlua_audio_utils_replace_sequence(0x3D, 0x2A, 75, 'seq_3D')-- Death Wind
smlua_audio_utils_replace_sequence(0x3E, 0x2A, 75, 'seq_3E')-- BitDW
smlua_audio_utils_replace_sequence(0x3F, 0x2A, 75, 'seq_3F')-- BitFS
smlua_audio_utils_replace_sequence(0x40, 0x2A, 75, 'seq_40')-- Bits
smlua_audio_utils_replace_sequence(0x41, 0x2A, 75, 'seq_41')-- Slide Metropolis (PSS)
smlua_audio_utils_replace_sequence(0x42, 0x2A, 75, 'seq_42')-- Sunken Ship (Course #3)
smlua_audio_utils_replace_sequence(0x43, 0x2A, 75, 'seq_43')-- Icy Caves Slide (Course #4)
smlua_audio_utils_replace_sequence(0x44, 0x2A, 75, 'seq_44')-- Bowser 1
smlua_audio_utils_replace_sequence(0x45, 0x2A, 75, 'seq_45')-- F-Zero Fire Field
