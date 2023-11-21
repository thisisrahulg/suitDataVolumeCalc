// ; EEPROM Address - 
// ;Fail safe NB8, Four output mode program sequence 
// ;for  97 Gb data throughput
// ;This program uses two observation IDs [15,16]
// ;RoI 468 times followed by FF 6 times 
// ;In case FW develops any problem, this code will
// ;allow us to run SUIT with single NB8 filter 
// ;v6 - CLEAR_CCD decreased by 1
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Adjusted cycles and seq for less than 100 Gib data
//
		MOVE_FW1	05					// NB8
		MOVE_FW2	03					// NB8
REPEAT_CAL:	SET_CYCLE	0022			// ;Set for 34 cycles in a day
//		
		CLEAR_FLAG						// Clear all Flare Flags 	
		CLEAR_CCD	02					// Clears CCD to ensure no trapped charges
//
		SET_OBSERV_ID	15				// ;Observation ID for the BIAS & DARK
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
//
		SET_FRAME_TYPE	0E				// BIAS
		CCD_START						// start CCD sequencer
		CCD_START						
		CNC
//
		SET_FRAME_TYPE	0D				// DARK
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		CCD_START						// Start CCD sequencer
		CNC
//		
		SET_EXP_TIME	5078			// LUT address, 180000ms in HEX
		CCD_START						// Start CCD sequencer
		CNC
//
		SET_OBSERV_ID	16				// ;Observation ID for NORMAL Mode
		SET_FRAME_TYPE	00				// NORMAL 
		CLEAR_CCD	00					// No extra CCD dumps
//
//	; Take 468 ROI frames in NB8 filter
//
NORMAL_MODE:	SET_SEQ	01D4			// ;Repeat 468 times for 25 minutes	
//
REPEAT_ROI:	SET_FRAME_SIZE	01			// ROI frame size
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_EXP_TIME	51D0			// LUT address, 1400 ms exposure
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Home shutter
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//	
		DCR_SEQ		
		JNZS	REPEAT_ROI
//
//	; Take 6 Full Frames in NB8 filter
//		
		SET_SEQ	0006					//; 6 times, i.e 5 minutes
		SET_FRAME_SIZE	00
//
REPEAT_FF:	ROI_UpdateEn
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//
		DCR_SEQ							// Decrement Sequence		
		JNZS	REPEAT_FF				// Jump if sequence is not zero
//
		DCR_CYCLE						// Decrement cycle 
		JNZC	NORMAL_MODE				// Jump if cycle is not zero		
		JMP	REPEAT_CAL					// Jump after 24 hours.