local smlua_audio_utils_replace_sequence = smlua_audio_utils_replace_sequence

-- Overall fixed and tweaked so players actually don't notice any difference in instruments when playing
-- Some songs still need tweaks

smlua_audio_utils_replace_sequence(0x01, 0x2A, 75, 'seq_01')
smlua_audio_utils_replace_sequence(0x02, 0x2A, 75, 'SEQ_0x02 - Secret 2')           -- SECRET 2 (WMOTR)  -- perfect
smlua_audio_utils_replace_sequence(0x03, 0x2A, 75, 'seq_03')
smlua_audio_utils_replace_sequence(0x04, 0x2A, 75, 'seq_04')
smlua_audio_utils_replace_sequence(0x05, 0x13, 75, 'seq_05')
smlua_audio_utils_replace_sequence(0x06, 0x2A, 75, 'seq_06')
smlua_audio_utils_replace_sequence(0x07, 0x2A, 75, 'seq_07')
smlua_audio_utils_replace_sequence(0x08, 0x2A, 75, 'seq_08')
smlua_audio_utils_replace_sequence(0x09, 0x2A, 75, 'seq_09')
smlua_audio_utils_replace_sequence(0x0A, 0x21, 75, 'seq_0A')
smlua_audio_utils_replace_sequence(0x0B, 0x14, 75, 'seq_0B')
smlua_audio_utils_replace_sequence(0x0C, 0x2A, 75, 'seq_0C')
smlua_audio_utils_replace_sequence(0x0D, 0x2A, 75, 'seq_0D')
smlua_audio_utils_replace_sequence(0x0E, 0x2A, 75, 'seq_0E')
smlua_audio_utils_replace_sequence(0x0F, 0x2A, 75, 'seq_0F')
smlua_audio_utils_replace_sequence(0x10, 0x12, 75, 'seq_10')
smlua_audio_utils_replace_sequence(0x11, 0x2A, 75, 'SEQ_0x11 - B2F')                -- B2F             -- broken Lead Square, Accordion, Piano
smlua_audio_utils_replace_sequence(0x12, 0x2A, 75, 'seq_12')
smlua_audio_utils_replace_sequence(0x13, 0x21, 75, 'seq_13')
smlua_audio_utils_replace_sequence(0x14, 0x1A, 75, 'seq_14')
smlua_audio_utils_replace_sequence(0x15, 0x2A, 75, 'seq_15')
smlua_audio_utils_replace_sequence(0x16, 0x19, 75, 'seq_16')
smlua_audio_utils_replace_sequence(0x17, 0x1A, 75, 'seq_17')
smlua_audio_utils_replace_sequence(0x18, 0x1C, 75, 'seq_18')
smlua_audio_utils_replace_sequence(0x19, 0x2A, 75, 'SEQ_0x19 - B3F')                -- B3F             -- broken Lead Square, Piano
smlua_audio_utils_replace_sequence(0x1A, 0x25, 75, 'seq_1A')
smlua_audio_utils_replace_sequence(0x1B, 0x14, 75, 'seq_1B')
smlua_audio_utils_replace_sequence(0x1C, 0x20, 75, 'seq_1C')
smlua_audio_utils_replace_sequence(0x1D, 0x1E, 75, 'seq_1D')
smlua_audio_utils_replace_sequence(0x1E, 0x1B, 75, 'seq_1E')
smlua_audio_utils_replace_sequence(0x1F, 0x1A, 75, 'seq_1F')
smlua_audio_utils_replace_sequence(0x20, 0x23, 75, 'seq_20')
smlua_audio_utils_replace_sequence(0x21, 0x2A, 75, 'seq_21')
smlua_audio_utils_replace_sequence(0x22, 0x1B, 75, 'seq_22')
smlua_audio_utils_replace_sequence(0x23, 0x2A, 75, 'SEQ_0x23 - Course 1')           -- COURSE 1        -- since Piano is broken in the 2A Bank it was replaced with the Nylon Guitar inst, after that all instruments are correct
smlua_audio_utils_replace_sequence(0x24, 0x2A, 75, 'SEQ_0x24 - Course 2')           -- COURSE 2        -- same as SEQ_0x23 (COURSE 1)
smlua_audio_utils_replace_sequence(0x25, 0x2A, 75, 'SEQ_0x25 - Course 12 Area 3')   -- C12 A3          -- perfect
smlua_audio_utils_replace_sequence(0x26, 0x2A, 75, 'SEQ_0x26 - Overworld 1')        -- OVERWORLD 1
smlua_audio_utils_replace_sequence(0x27, 0x25, 75, 'seq_27')
smlua_audio_utils_replace_sequence(0x28, 0x2A, 75, 'SEQ_0x28 - Course 3')           -- COURSE 3        -- same as SEQ_0x23 (COURSE 1)
smlua_audio_utils_replace_sequence(0x29, 0x2A, 75, 'SEQ_0x29 - Course 4')           -- COURSE 4        -- broken Lead Square and Synth Bass these were replaced with Percussive Organ and Rhodes Bass
smlua_audio_utils_replace_sequence(0x2A, 0x2A, 75, 'SEQ_0x2A - Course 5')           -- COURSE 5        -- broken Piano replaced with Nylon Guitar
smlua_audio_utils_replace_sequence(0x2B, 0x25, 75, 'SEQ_0x2B - Course 6')           -- COURSE 6        -- this contains mostly instruments from the credits bank that are broken in 2A, only 2 are extended here which would be Acoustic Bass and Drum Machine these were replaced with Slap Bass and Percussion
smlua_audio_utils_replace_sequence(0x2C, 0x2A, 120, 'SEQ_0x2C - Course 7')          -- COURSE 7        -- perfect
smlua_audio_utils_replace_sequence(0x2D, 0x2A, 75, 'SEQ_0x2D - Course 8')           -- COURSE 8        -- broken Synth Bass replaced with Rhodes Bass
smlua_audio_utils_replace_sequence(0x2E, 0x2A, 75, 'SEQ_0x2E - Course 8 Area 3')    -- A3 / A4         -- perfect
smlua_audio_utils_replace_sequence(0x2F, 0x2A, 75, 'SEQ_0x2F - Course 9')           -- COURSE 9        -- broken Synth Bass replaced with Rhodes Bass
smlua_audio_utils_replace_sequence(0x30, 0x2A, 75, 'SEQ_0x30 - Course 10')          -- COURSE 10       -- broken Accordion, Synth Bass, Pan Flute
smlua_audio_utils_replace_sequence(0x31, 0x2A, 75, 'SEQ_0x31 - Course 11')          -- COURSE 11       -- broken Synth Bass, Piano
smlua_audio_utils_replace_sequence(0x32, 0x2A, 75, 'SEQ_0x32 - Course 12')          -- COURSE 12       -- broken Accordion, Piano
smlua_audio_utils_replace_sequence(0x33, 0x2A, 75, 'SEQ_0x33 - Course 12 Area 2')   -- C12 A2          -- perfect
smlua_audio_utils_replace_sequence(0x34, 0x25, 75, 'SEQ_0x34 - Course 13')          -- COURSE 13       -- Credits Bank, Perfect
smlua_audio_utils_replace_sequence(0x35, 0x2A, 75, 'SEQ_0x35 - Course 14')          -- COURSE 14       -- broken Piano, Lead Square, Synth Bass replaced with Nylon Guitar, Percussive Organ, Rhodes Bass
smlua_audio_utils_replace_sequence(0x36, 0x2A, 75, 'SEQ_0x36 - Course 15')          -- COURSE 15       -- perfect
smlua_audio_utils_replace_sequence(0x37, 0x2A, 75, 'SEQ_0x37 - Totwc')              -- TOTWC           -- broken Synth Bass replaced with Rhodes Bass
smlua_audio_utils_replace_sequence(0x38, 0x2A, 75, 'SEQ_0x38 - Course 13 Area 2')   -- C13 A2 / A3     -- broken Lead Square, Accordion
smlua_audio_utils_replace_sequence(0x39, 0x2A, 75, 'seq_39')
smlua_audio_utils_replace_sequence(0x3A, 0x2A, 75, 'seq_3A')
smlua_audio_utils_replace_sequence(0x3B, 0x2A, 75, 'seq_3B')
smlua_audio_utils_replace_sequence(0x3C, 0x2A, 75, 'SEQ_0x3C - Secret 3')           -- SECRET 3 (SA)   -- broken Accordion
smlua_audio_utils_replace_sequence(0x3D, 0x2A, 75, 'SEQ_0x3D - Cotmc')              -- COTMC           -- broken Synth Bass
smlua_audio_utils_replace_sequence(0x3E, 0x2A, 75, 'SEQ_0x3E - BITDW')              -- BITDW           -- broken Piano replaced with French Horn
smlua_audio_utils_replace_sequence(0x3F, 0x2A, 75, 'SEQ_0x3F - BITFS')              -- BITFS           -- broken Lead Square, Accordion
smlua_audio_utils_replace_sequence(0x40, 0x2A, 75, 'SEQ_0x40 - BITS')               -- BITS            -- broken Accordion
smlua_audio_utils_replace_sequence(0x41, 0x2A, 75, 'SEQ_0x41 - Secret 1')           -- SECRET 1 (PSS)  -- broken Piano
smlua_audio_utils_replace_sequence(0x42, 0x2A, 75, 'seq_42')
smlua_audio_utils_replace_sequence(0x43, 0x2A, 75, 'SEQ_0x43 - Course 14 Area 2')   -- C14 A2          -- perfect
smlua_audio_utils_replace_sequence(0x44, 0x2A, 120, 'SEQ_0x44 - B1F')               -- B1F             -- broken Lead Square, Accordion, 
smlua_audio_utils_replace_sequence(0x45, 0x2A, 75, 'SEQ_0x45 - Secret 4')           -- SECRET 4 (ED)   -- broken Lead Square