// ; EEPROM Address - 
// ;Code for CCD Gain/ Offset adjustment
// ;Program uses two observation IDs (05 and F7)
// ;One NB (388 nm) and one BB (BB3) for upper thresholds of gain
// ;Another NB8 (396.85 nm) and NB1+BB1 combination for checking the lower thresholds 
// ;Here NB1+BB1 combination is used for lower threshold for BBFs because it is comparatively broad
// ;Four (with different filters) images are taken for each Gain settings 
// ;TBD - to be done for nominal exposure times or the lowest exposure time for flares?
// ;for now, nominal exposure times used
// ;OFFSET may be changed through TC at the end
// ;00,01 = Gain 3 (0x00)
// ;10 = Gain 1.5 (oxAA)
// ;11 = Gain 1 (0xFF)
// ;One code run will take about 20 minutes, 1.56 Gb
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - same as v8, no change
//
		SET_OBSERV_ID	05				// ;Program Observation ID
		CLEAR_CCD	01
		SET_GAIN	00					// Initial gain = 3
//
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		SET_FRAME_TYPE	00				// NORMAL 
		CLEAR_FLAG						// Clear all Flare Flags
		SET_CYCLE	0001
		SET_SEQ		0001
//		
BEGIN:	MOVE_FW1	07					// BB3+BPF3 for upper threshold for BBFs
		MOVE_FW2	07
		SET_EXP_TIME	51F8			// Address location for 165 ms for BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Home Shutter
		CCD_START
//1
		MOVE_FW1	06					// NB1+BB1; lower threshold 
		MOVE_FW2	05
		SET_EXP_TIME	51E8			// Address location for 1400 ms for NB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START
//2	
		MOVE_FW1	05					// NB8+NB8; lower threshold for NBFs
		MOVE_FW2	03
		SET_EXP_TIME	51D0			// Address location for 1400 ms for NB8
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START
//3
		MOVE_FW1	04					// NB7+BPF2; upper threshold for NBFs
		MOVE_FW2	02
		SET_EXP_TIME	51D8			// Address location for 458 ms for NB7
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START
		JNZS	AA_GAIN		
		JNZC	FF_GAIN
//4
		SET_OBSERV_ID	F7				// Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530				// wait for 1 min.
		CNC								// TC to change OFFSET values
		JMP	WAIT_LOOP
//					
AA_GAIN:	SET_GAIN	AA				// Change Gain to 1.5
		DCR_SEQ
		JMP	BEGIN
//
FF_GAIN:	SET_GAIN	FF				// Change Gain to 1
		DCR_CYCLE
		JMP	BEGIN								