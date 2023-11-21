// ; ; EEPROM Address - 
// ;Stellar calibration with Sirius A
// ;Composite exposure times are used to achieve longer times.
// ;5 mins is taken as the longest exposure at one go.
// ;The exposures are achieved with permutation and combination of times as per 
// ;Calibration done for 9 locations on CCD; All filters to be taken at a given point on CCD; 
// ;then moved to another location on CCD
// ;It uses two observation IDs (04) and (F7) for infinite wait loop
// ; One run will complete in 127 minutes.
// ;TBD - Final exposures depending on BPF profiles
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Exposures adjusted to make multiple of 30 secs. 
//
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		CLEAR_FLAG						// Clear All flare flags
		SET_OBSERV_ID	04				// ;Program Observation ID
		SET_FRAME_TYPE	01				// Stellar Cal 1: Sirius
		CLEAR_CCD	01					// clear CCD before imaging Sirius A
//
// ;Sirius Observation starts
//		
		SET_EXP_TIME	5088			// Address location of 5 mins for NB4
		MOVE_FW1	00					// NB4 is at position 00 on FW1
		MOVE_FW2	00					// say BPF1 is at position 00 on FW2 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Home Shutter
		CCD_START						// start CCD sequencer
		CNC
//
		MOVE_FW1	01					// NB3 is at position 01 on FW1, 6.0 mins exposure
		SET_EXP_TIME	5088			// Address location for 5 mins for NB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		SET_EXP_TIME	5068			// Address location for 1 min
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
//
		MOVE_FW1	02					// NB2 is at position 02 on FW1, 6.0 mins exposure
		SET_EXP_TIME	5088			// Address location for 5 mins for NB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
		SET_EXP_TIME	5068			// Address location for 1 min
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
//
		MOVE_FW1	03					// NB5 is at position 03 on FW1, 4.0 mins
		SET_EXP_TIME	5080			// Address location for 4 mins for NB5
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
//
		MOVE_FW1	04					// BPF2 is at position 04 on FW1
		MOVE_FW2	01					// NB6 is at position 01 on FW2. 3.50 mins
		SET_EXP_TIME	5078			// Address location for 3 mins for NB6
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		SET_EXP_TIME	5058			// Address location for 30 secs for NB6
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//
		MOVE_FW2	02					// NB7 is at position 02 on FW2, 3.00 mins
		SET_EXP_TIME	5078			// Address location for 3 mins for  NB7
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
//
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// NB8 is at position 03 on FW2
//
//  ;18 repeats for NB8 to take 90 mins of observation, each 5 mins
//
		SET_SEQ	0012					// Set sequence 
		SET_EXP_TIME	5088			// Address location for 5 mins for NB8
//
REPEAT_NB8:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		DCR_SEQ							// Decrement sequence
		JNZS	REPEAT_NB8				// To capture 90 mins of observation
//
		MOVE_FW1	06					// BB1, 0.5 mins = 30 secs
		MOVE_FW2	04					// BB1
		SET_EXP_TIME	5058			// Address location for 30 secs for BB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
//
		MOVE_FW2	05					// NB1, 2.0 mins
		SET_EXP_TIME	5070			// Address location for 2 min for NB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
//
		MOVE_FW1	07					// BPF3 on FW1, 5.0 mins
		MOVE_FW2	06					// BB2 ON FW2
		SET_EXP_TIME	5088			// Address location for 5 mins for BB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
//
		MOVE_FW2	07					// BB3, 3.00 mins		
		SET_EXP_TIME	5078			// Address location for 3 mins for BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
//
		SET_OBSERV_ID	F7				// Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530				// wait for 1 min.
		CNC								// TC to go to regular Synoptic Mode
		JMP	WAIT_LOOP