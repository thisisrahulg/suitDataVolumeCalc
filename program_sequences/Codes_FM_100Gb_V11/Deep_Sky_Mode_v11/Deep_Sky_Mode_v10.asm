// ; EEPROM Address - 
// ;To take images during Deep-Sky mode of VELC
// ;Program will run in infinite loop
// ;May be stopped / paused anytime through TC
// ;All are Long exposure images
// ; One code run will take about 60 mins.
// ; Program uses one observation ID [06]
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - same as v8, no change
		SET_FRAME_TYPE	03				// Off pointing Deep sky
		SET_OBSERV_ID	06				// Observation ID
//
		CLEAR_FLAG						// Clear all Flare Flags 	
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		CLEAR_CCD	01					// Clears CCD to ensure no trapped charges
//
// ;  These all are long exposure deep sky images 
//
BEGIN:	MOVE_FW1	00					// NB4 
		MOVE_FW2	00					// BPF1  
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//1
		MOVE_FW1	01					// NB3 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//2									
		MOVE_FW1	02					// NB2 
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//3									
		MOVE_FW1	03					// NB5 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//4									
		MOVE_FW1	04					// BPF2 
		MOVE_FW2	01					// NB6 
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//5							
		MOVE_FW2	02					// NB7 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//6							
		MOVE_FW1	05					// NB8 
		MOVE_FW2	03					// NB8 
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//7									
		MOVE_FW1	06					// BB1 
		MOVE_FW2	05					// NB1 
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms in exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//8
		MOVE_FW1	06					// BB1
		MOVE_FW2	04					// BB1
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//9
		MOVE_FW2	05					// NB1
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//10
		MOVE_FW1	07					// BPF3 
		MOVE_FW2	06					// BB2 
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//11			
		MOVE_FW2	07					// BB3
		SET_EXP_TIME	5048			// LUT address, 10000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		SET_EXP_TIME	5078			// LUT address, 180000ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//12
		JMP	BEGIN						// Jump to BEGIN