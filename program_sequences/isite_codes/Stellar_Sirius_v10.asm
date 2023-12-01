// ;EEPROM Address - 
// ;Stellar calibration with Sirius A
// ;Composite exposure times are used to achieve longer times.
// ;01 sec is taken as the longest exposure at one go.
// ;The exposures are achieved with permutation and combination of times as per 
// ;Calibration done for 9 locations on CCD; All filters to be taken at a given point on CCD; 
// ;then moved to another location on CCD
// ;It uses two observation IDs (04) and (F7) for infinite wait loop
// ;One run will complete in 127 minutes.
// ;TBD - Final exposures depending on BPF profiles
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Exposures adjusted to make multiple of 30 secs.
// ;v10- All the exposures are 01 sec long and tallied with Soumya's calculation 
//
		SET_OBSERV_ID	04				// ;Program Observation ID
		SET_FRAME_SIZE	01				// ROI Frame
		CLEAR_FLAG						// Clear All flare flags
		CLEAR_CCD	01					// clear CCD before imaging Sirius A
		SET_BIN	00						// No binning
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
////		
////
//		ROI_UpdateEn
//		SET_FRAME_TYPE	0E				// BIAS
//		CCD_START						// start CCD sequencer
//		CCD_START						// start CCD sequencer		
//		CNC
//		SET_FRAME_TYPE	0D				// DARK
//		SET_EXP_TIME	5058			// LUT address, 30 sec exposure
//		CCD_START						// Start CCD sequencer
//		CNC
//		SET_EXP_TIME	5088			// LUT address, 05 min exposure
//		CCD_START						// Start CCD sequencer
//		CNC
////		
////		
		SET_FRAME_TYPE	01				// Stellar Cal 1: Sirius		
////
//// ;Sirius Observation starts
////
////  ;Repeats for NB4 to take 05 mins of observation, resolution 01 sec	
//		MOVE_FW1	00					// NB4 is at position 00 on FW1
//		MOVE_FW2	00					// BPF1 is at position 00 on FW2 
//		SET_SEQ	012C					// Set sequence for 300 loops
//		SET_EXP_TIME	5020			// Address location for 01 sec
//REPEAT_NB4:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
//		ROI_UpdateEn
//		HOME_SHU
//		CCD_START						// start CCD sequencer
//		CNC								// Check and Execute TC
//		DCR_SEQ							// Decrement sequence
//		JNZS	REPEAT_NB4				// To capture 05 mins of observation
////
////  ;Repeats for NB3 to take 06 mins of observation, resolution 01 sec	
//		MOVE_FW1	01					// NB3 is at position 01 on FW1
//		SET_SEQ	0168					// Set sequence for 360 loops
//		SET_EXP_TIME	5020			// Address location for 01 sec
//REPEAT_NB3:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
//		ROI_UpdateEn
//		HOME_SHU
//		CCD_START						// start CCD sequencer
//		CNC								// Check and Execute TC
//		DCR_SEQ							// Decrement sequence
//		JNZS	REPEAT_NB3				// To capture 06 mins of observation
////
////  ;Repeats for NB2 to take 06 mins of observation, resolution 01 sec	
//		MOVE_FW1	02					// NB2 is at position 02 on FW1
//		SET_SEQ	0168					// Set sequence for 360 loops
//		SET_EXP_TIME	5020			// Address location for 01 sec
//REPEAT_NB2:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
//		ROI_UpdateEn
//		HOME_SHU
//		CCD_START						// start CCD sequencer
//		CNC								// Check and Execute TC
//		DCR_SEQ							// Decrement sequence
//		JNZS	REPEAT_NB2				// To capture 06 mins of observation
////
////  ;Repeats for NB5 to take 04 mins of observation, resolution 01 sec	
//		MOVE_FW1	03					// NB5 is at position 03 on FW1
//		SET_SEQ	00F0					// Set sequence for 240 loops
//		SET_EXP_TIME	5020			// Address location for 01 sec
//REPEAT_NB5:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
//		ROI_UpdateEn
//		HOME_SHU
//		CCD_START						// start CCD sequencer
//		CNC								// Check and Execute TC
//		DCR_SEQ							// Decrement sequence
//		JNZS	REPEAT_NB5				// To capture 04 mins of observation
////
////  ;Repeats for NB6 to take 03.5 mins of observation, resolution 01 sec	
//		MOVE_FW1	04					// BPF2 is at position 04 on FW1
//		MOVE_FW2	01					// NB6 is at position 01 on FW2 
//		SET_SEQ	00D2					// Set sequence for 210 loops
//		SET_EXP_TIME	5020			// Address location for 01 sec
//REPEAT_NB6:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
//		ROI_UpdateEn
//		HOME_SHU
//		CCD_START						// start CCD sequencer
//		CNC								// Check and Execute TC
//		DCR_SEQ							// Decrement sequence
//		JNZS	REPEAT_NB6				// To capture 03.5 mins of observation
////
////  ;Repeats for NB7 to take 03 mins of observation, resolution 01 sec	
//		MOVE_FW2	02					// NB7 is at position 02 on FW2 
//		SET_SEQ	00B4					// Set sequence for 180 loops
//		SET_EXP_TIME	5020			// Address location for 01 sec
//REPEAT_NB7:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
//		ROI_UpdateEn
//		HOME_SHU
//		CCD_START						// start CCD sequencer
//		CNC								// Check and Execute TC
//		DCR_SEQ							// Decrement sequence
//		JNZS	REPEAT_NB7				// To capture 03 mins of observation
////
////  ;Repeats for NB8 to take 30 mins of observation, resolution 01 sec	
//		MOVE_FW1	05					// NB8 is at position 05 on FW1
//		MOVE_FW2	03					// NB8 is at position 03 on FW2 
//		SET_SEQ	0708					// Set sequence for 1800 loops
//		SET_EXP_TIME	5020			// Address location for 01 sec
//REPEAT_NB8:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
//		ROI_UpdateEn
//		HOME_SHU
//		CCD_START						// start CCD sequencer
//		CNC								// Check and Execute TC
//		DCR_SEQ							// Decrement sequence
//		JNZS	REPEAT_NB8				// To capture 90 mins of observation
//
//  ;Repeats for BB1 to take 0.5 mins of observation, resolution 01 sec	
		MOVE_FW1	06					// BB1 is at position 06 on FW1
		MOVE_FW2	04					// BB1 is at position 04 on FW2 
		SET_SEQ	001E					// Set sequence for 30 loops
		SET_EXP_TIME	5020			// Address location for 01 sec
REPEAT_BB1:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		ROI_UpdateEn
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		DCR_SEQ							// Decrement sequence
		JNZS	REPEAT_BB1				// To capture 0.5 mins of observation
//
//  ;Repeats for NB1 to take 02 mins of observation, resolution 01 sec	
		MOVE_FW2	05					// NB1 is at position 05 on FW2 
		SET_SEQ	0078					// Set sequence for 120 loops
		SET_EXP_TIME	5020			// Address location for 01 sec
REPEAT_NB1:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		ROI_UpdateEn
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		DCR_SEQ							// Decrement sequence
		JNZS	REPEAT_NB1				// To capture 02 mins of observation
//
//  ;Repeats for BB2 to take 05 mins of observation, resolution 01 sec	
		MOVE_FW1	07					// BPF3 is at position 07 on FW1
		MOVE_FW2	06					// BB2 is at position 04 on FW2 
		SET_SEQ	012C					// Set sequence for 300 loops
		SET_EXP_TIME	5020			// Address location for 01 sec
REPEAT_BB2:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		ROI_UpdateEn
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		DCR_SEQ							// Decrement sequence
		JNZS	REPEAT_BB2				// To capture 05 mins of observation
//
//  ;Repeats for BB3 to take 03 mins of observation, resolution 01 sec	
		MOVE_FW2	07					// BB3 is at position 04 on FW2 
		SET_SEQ	00B4					// Set sequence for 180 loops
		SET_EXP_TIME	5020			// Address location for 01 sec
REPEAT_BB3:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		ROI_UpdateEn
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		DCR_SEQ							// Decrement sequence
		JNZS	REPEAT_BB3				// To capture 03 mins of observation
//
		SET_OBSERV_ID	F7				// Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530				// wait for 1 min.
		CNC								// TC to go to regular Synoptic Mode
		JMP	WAIT_LOOP
