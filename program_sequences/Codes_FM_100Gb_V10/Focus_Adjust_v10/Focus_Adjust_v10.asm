// ; EEPROM Address - 
// ;CALIBRATION CODE (To be used as : Focus Adjustement Code and/or Sun-Center positioning Code)
// ;FF Images are taken in all 11 filters at different focus positions
// ;initial start phase time 25 msec 
// ;100 msec per step piezo motion time (10 Hz freq.)
// ;100 msec parking sequence time
// ;any other electronics time extra
// ;last encoder value will have to be reloaded after power cycle
// ;Resolution 7-8 micron per step, 7 in one direction and 8 in other direction
// ;Move in forward direction 10 times, 6 steps (48 microns) each time
// ;Move in reverse direction 20 times, 6 steps (48 microns) each time
// ;Move in forward direction 10 times, 6 steps (48 micron) each time to get back to same position
// ;At each position, take images in all filters
// ;Total 440 (40 x 11) images, ~146 minutes, ~15 GBytes
// ;This program uses two observation IDs [02 and F7]
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - same as v8, no change
//
		SET_OBSERV_ID	02				// Program Observation ID		
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		CLEAR_FLAG						// Clear all Flare Flags
//
		SET_FRAME_TYPE	04				// Engineering mode, images to know focus position
		CLEAR_CCD	01					// One extra CCD dump
		SET_CYCLE	0002
//
BEGIN:	SET_SEQ	000A					// Move focus 10 times in forward direction
IMAGES_FORWARD:	MOVE_FW1	00			// NB4 
		MOVE_FW2	00					// BPF1 
		SET_EXP_TIME	51A8			// Address location for NB4 on LUT
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//1
		MOVE_FW1	01					// NB3 is at position 01 on FW1
		SET_EXP_TIME	51B0			// Address location for NB3 on LUT
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//2	
		MOVE_FW1	02					// NB2 is at position 03 on FW1
		SET_EXP_TIME	51B8			// Address location for NB2 on LUT
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START								
		CNC
//3		
		MOVE_FW1	03					// NB5 is at position 03 on FW1
		SET_EXP_TIME	51C0			// Address location for NB5 on LUT
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START
		CNC
//4
		MOVE_FW1	04					// BPF2 is at position 04 on FW1
		MOVE_FW2	01					// NB6 is at position 01 on FW2
		SET_EXP_TIME	51C8			// Address location for NB6
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//5		
		MOVE_FW2	02					// NB7 is at position 02 on FW2
		SET_EXP_TIME	51D8			// Address location for NB7
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//6		
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// another NB8 is at position 03 on FW2
		SET_EXP_TIME	51D0			// Address location for NB8
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//7		
		MOVE_FW1	06					// BB1 is at position 06 on FW1
		MOVE_FW2	04					// another BB1 is at position 04 on FW2
		SET_EXP_TIME	51E0			// Address location for BB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//8		
		MOVE_FW2	05					// another NB1 is at position 05 on FW2
		SET_EXP_TIME	51E8			// Address location for NB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START
		CNC
//9		
		MOVE_FW1	07					// BPF3 is at position 07 on FW1
		MOVE_FW2	06					// BB2 is at position 06 on FW2
		SET_EXP_TIME	51F0			// Address location for BB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//10		
		MOVE_FW2	07					// BB3 is at position 07 on FW2
		SET_EXP_TIME	51F8			// Address location for 165 ms for BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//11		
		DCR_SEQ							// 
		MOVE_FOCUS	080655				// Move focus by six steps(~48 microns)
		WAIT	01F4					// Wait for 1 sec. for focus to move
		JNZS	IMAGES_FORWARD			// Go back and repeat until SEQ becomes 0
		DCR_CYCLE		
		JNZC	START_NEW
//
		SET_OBSERV_ID	F7				// Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530				// wait for 1 minute
		CNC								// Check for new TC
		JMP	WAIT_LOOP
//
// Move in reverse direction 20 times
START_NEW:	SET_SEQ	0014	
IMAGES_REVERSE:	MOVE_FW1	00			// NB4 is at position 00 on FW1
		MOVE_FW2	00					// BPF1 is at position 00 on FW2
		SET_EXP_TIME	51A8			// Address location for NB4 on LUT
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//1		
		MOVE_FW1	01					// NB3 is at position 01 on FW1
		SET_EXP_TIME	51B0			// Address location for NB3 on LUT
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//2		
		MOVE_FW1	02					// NB2 is at position 03 on FW1
		SET_EXP_TIME	51B8			// Address location for NB2 on LUT
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START								
		CNC
//3		
		MOVE_FW1	03					// NB5 is at position 03 on FW1
		SET_EXP_TIME	51C0			// Address location for NB5 on LUT
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START
		CNC
//4		
		MOVE_FW1	04					// BPF2 is at position 04 on FW1
		MOVE_FW2	01					// NB6 is at position 01 on FW2
		SET_EXP_TIME	51C8			// Address location for NB6
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//5		
		MOVE_FW2	02					// NB7 is at position 02 on FW2
		SET_EXP_TIME	51D8					// Address location for NB7
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//6		
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// another NB8 is at position 03 on FW2
		SET_EXP_TIME	51D0			// Address location for NB8
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//7		
		MOVE_FW1	06					// BB1 is at position 06 on FW1
		MOVE_FW2	04					// another BB1 is at position 04 on FW2
		SET_EXP_TIME	51E0			// Address location for BB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//8		
		MOVE_FW2	05					// another NB1 is at position 05 on FW2
		SET_EXP_TIME	51E8			// Address location for NB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START
		CNC
//9		
		MOVE_FW1	07					// BPF3 is at position 07 on FW1
		MOVE_FW2	06					// BB2 is at position 06 on FW2
		SET_EXP_TIME	51F0			// Address location for BB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//10		
		MOVE_FW2	07					// BB3 is at position 07 on FW2
		SET_EXP_TIME	51F8			// Address location for 165 ms for BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// Start CCD sequencer
		CNC
//11	
		DCR_SEQ							// 
		MOVE_FOCUS	000655				// Move by 6 steps (~ 48 microns)
		WAIT	01F4					// wait for 1 sec. for focus to move
		JNZS	IMAGES_REVERSE			// Go back and repeat until SEQ becomes
		JMP		BEGIN