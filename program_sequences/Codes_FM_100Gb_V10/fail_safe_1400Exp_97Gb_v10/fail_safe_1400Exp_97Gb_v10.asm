// ; EEPROM Address - 
// ;Fail safe four output mode program sequence 
// ;for 97 Gb data throughput
// ;This program uses two observation IDs [17,18]
// ;To be used when filter is stuck 
// ;to compensate for filter motion RoI seq 468 times, FF seq 6 times
// ;Maybe used for NB3,NB2,NB5,NB1,NB8
// ;v6 - CLEAR_CCD decreased by 1
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Adjusted cycles and seq for less than 100 Gib data
//
REPEAT_CAL:	SET_CYCLE	0022			// Set for 34 cycles in a day
//		
		CLEAR_FLAG						// Clear all Flare Flags 	
		CLEAR_CCD	02					// Clears CCD to ensure no trapped charges
//
		SET_OBSERV_ID	17				// Observation ID for the BIAS & DARK
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
//		
		SET_FRAME_TYPE	0E				// BIAS; two BIAS frames
		CCD_START						// start CCD sequencer
		CCD_START						
		CNC
//
		SET_FRAME_TYPE	0D				// DARK
		SET_EXP_TIME	5058			// LUT address, 30 sec in HEX
		CCD_START						// Start CCD sequencer
		CNC
//		
		SET_EXP_TIME	5068			// LUT address, 01 min exposure
		CCD_START						// Start CCD sequencer
		CNC
//
		SET_OBSERV_ID	18				// Observation ID for NORMAL Mode
		SET_FRAME_TYPE	00				// NORMAL 
		CLEAR_CCD	00					// No extra CCD dumps
//
//	; Take 468 ROI frames in chosen single filter
//
NORMAL_MODE:	SET_SEQ	01D4			// Repeat 468 times
//
REPEAT_ROI:	SET_FRAME_SIZE	01			// ROI frame size
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_EXP_TIME	51D0			// LUT address, 1400 ms- 
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//	
		DCR_SEQ							// Decrement sequence		
		JNZS	REPEAT_ROI				// Jump if sequence is not zero
//
//  ; Take 6 FULL-FRAMEs in chosen single filter
//		
		SET_SEQ	0006					// 6 times
		SET_FRAME_SIZE	00				// FULL-FRAME
//
REPEAT_FF:	ROI_UpdateEn				// Update ROI coordinate if new TC received
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//
		DCR_SEQ							// Decrement sequence		
		JNZS	REPEAT_FF				// Jump if sequence is not zero
//
		DCR_CYCLE						// Decrement cycle 
		JNZC	NORMAL_MODE				// Jump if cycle is not zero		
		JMP	REPEAT_CAL					// Jump to REPEAT_CAL after 24 hours. 