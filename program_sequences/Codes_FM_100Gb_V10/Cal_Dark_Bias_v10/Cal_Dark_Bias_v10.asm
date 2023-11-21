// ; EEPROM Address - 
// ;To take Calibration (BIAS and DARK) images whenever required
// ;Cycle number may be adjusted if we need more images
// ;~ 4 minutes duration
// ;Prgram uses two observation IDs [07 and F7]
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - same as v8, no change
//
		SET_CYCLE	0001				// ;Set cycle
//		
		CLEAR_FLAG						// Clear all Flare Flags 	
		CLEAR_CCD	02					// Clears CCD to ensure no trapped charges
//
		SET_OBSERV_ID	07				// ;Observation ID for the BIAS & DARK
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
//
REPEAT_CAL:	SET_FRAME_TYPE	0E			// BIAS
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CCD_START						
		CNC
//
		SET_FRAME_TYPE	0D				// DARK
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		CCD_START						// Start CCD sequencer
		CNC
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		CCD_START						// Start CCD sequencer
		CNC
//		
		DCR_CYCLE						// Decrement cycle
		JNZC	REPEAT_CAL				// Jump if cycle not zero
//
		SET_OBSERV_ID	F7				// ;Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530				// wait for 1 min.		
		CNC
		JMP	WAIT_LOOP	