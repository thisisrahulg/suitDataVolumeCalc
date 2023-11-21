// ; EEPROM Address - 
// ; SUIT BOOT CODE SEQUENCE , Two Observation IDs [00 and F6] are used
// ; (last 16 bits) - LED_355_SET2(4:1),LED_355_SET1(4:1),LED_255_SET2(4:1),LED_255_SET1(4:1)			
// ; first 32 bits (Set1_255,Set2_255,Set1_355,Set2_355), 8 bits each per DAC
// ; SET_LED	0000	FF00	0F00	// Grp 3 LED_355 are ON, last 16 bits - D4,D3,
// ; In version-5 the LED instruction has been modified.
// ; v6 Corrected comments and indentation
// ; v6 Removed SET_GAIN instruction at the beginning
// ; v6 Remvoed SET_GAIN instruction at the beginning
// ; v7 Both Filter and Shutter electronics should be powered ON
// ;    before running this code
// ; v7 Add HOME_SHU at the beginning
// ; v7 Take 10 images of each type at each stage
// ; Added LED flat images after fully opening shutter through TCs
// ; v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ; v8 - Removed HOME_FW* instructions, done through a seperate, 15.04.2023 
// ; v8 - SET_LED parameters as per FM shutter
// ; v8 - Added MOVE_FW1 and MOVE_FW2 00 at the beginning
// ; v9 - Filter changed to FW1 04 and FW2 07 for Flat images, exp time = 100 msec 
// ; v9 - LED intensity changed to BFBF from FFFF, 100 msec exposure
// ; v9 - Added default FW1 00 and FW2 00 for normal immages after flat 
//
			SET_OBSERV_ID	00					// ;Observation ID for Boot Code
			CLEAR_FLAG							// Clear all flags to be safe
			SET_LED	2A43	022A	4427	// Update Shutter Offset value
			HOME_SHU							// Home Shutter
			HOME_SHU							// Home Shutter
			MOVE_FW1	00					// MOVE filter wheel 1 to zero position
			MOVE_FW2	00					// Move filter wheel 2 to zero position			
//
REPEAT_BOOT:	SET_FRAME_SIZE	00				// Full Frame
			SET_BIN	00							// No binning			
			CLEAR_CCD	01						// change if one is not enough
//
			SET_FRAME_TYPE	0F					// Bias Frame
			SET_SEQ		000A
//
// ;Bias images with shutter and door closed
//
BIAS_DC:	CCD_START							// Start CCD sequencer
			DCR_SEQ
			JNZS	BIAS_DC
//
			SET_FRAME_TYPE	0C					// Dark with Door Closed
			SET_SEQ		000A
//
// ;Dark images with shutter and door closed
//
DARK_DC:	SET_EXP_TIME	5048				// Address location for 10s for DARK
			CCD_START							
//
			SET_EXP_TIME	5078				// Address location for 180s for Dark
			CCD_START							
			DCR_SEQ
			JNZS	DARK_DC
//
			SET_FRAME_TYPE	0A					// LED ON, FLAT IMAGE
			MOVE_FW1	04						// BP3 and BB3
			MOVE_FW2	07						// SFs corresponding to 355 nm LED
			SET_SEQ		000A
//
// ; Flat images with shutter and door closed
//
FLAT_SC:	SET_EXP_TIME	5000				// Address location for Exp Time for Flat Image, 100 msec.
			SET_LED	0000	BFBF	5500		// MAIN 4-LEDs SET2_355 [D14,D10], SET1_355 [D06,D02] is ON
			CCD_START
			SET_LED	0000	0000	0000		// Set LEDs to default OFF state
//			
			DCR_SEQ								// Decrement sequence
			JNZS	FLAT_SC						// JUMP to FLAT_1
			CNC									// Check for new TC
//
//	;Receive PAUSE TC 
//  ;Move the shutter by 90 deg. (fully open) through TC interface
//  ; Flat images with Shutter open and main door closed  
//
			SET_SEQ		000A
//
FLAT_SO:	SET_EXP_TIME	5000				// Address location for Exp Time for Flat Image, 100 msec.
			SET_LED	0000	BFBF	5500		// MAIN 4-LEDs SET2_355 [D14,D10], SET1_355 [D06,D02] is ON
			CCD_START
			SET_LED	0000	0000	0000		// Set LEDs to default OFF state
//			
			DCR_SEQ								// Decrement sequence
			JNZS	FLAT_SO						// JUMP to FLAT_2
			CNC									// Check for new TC		
//
// ;Receive PAUSE TC (Command ID 51)
// ;Move the shutter by 90 deg. (fully closed) through TC interface 
// ;RESUME (Command ID 53) BOOT via TC
// ; Normal images with door closed
//
			SET_FRAME_TYPE	00					// Normal with Door Closed
			MOVE_FW1	00					// MOVE filter wheel 1 to zero position
			MOVE_FW2	00					// Move filter wheel 2 to zero position
			SET_SEQ		000A
NORMAL_DC:	SET_EXP_TIME	5010				// Address location for 500ms, Normal with 500ms
			SET_LED	2A43	022A	4427	// Update Shutter Offset value
			HOME_SHU
			CCD_START
//
			SET_EXP_TIME	5020				// Address location for 1s,Normal with 1s
			SET_LED	2A43	022A	4427	// Update Shutter Offset value
			HOME_SHU
			CCD_START
//
			SET_EXP_TIME	51A8				// Address location for 1.4s, Normal with  1400ms exposure
			SET_LED	2A43	022A	4427	// Update Shutter Offset value
			HOME_SHU
			CCD_START
//
			DCR_SEQ
			JNZS	NORMAL_DC
			CNC
//
// ;Receive PAUSE TC (Command ID 51)
// ;DOOR OPEN via TC_OBC
// ;RESUME (Command ID 53) BOOT via TC
//
			SET_FRAME_TYPE	0D					// 02 Dark images with Door Open
			SET_SEQ		000A
			SET_LED	2A43	022A	4427	// Update Shutter Offset value
			HOME_SHU
//
// ; Dark images with door open and shutter closed
//
DARK_DO:	SET_EXP_TIME	5048				// Address location for Exp Time for 10s 
			CCD_START
//
			SET_EXP_TIME	5078				// Address location for Exp Time for 180s
			CCD_START
			DCR_SEQ
			JNZS	DARK_DO
//
			SET_FRAME_TYPE	00					// 03 Normal images with Door Open	
			SET_SEQ		000A
//
//  ; Normal images with shutter operated as per exp. time and door open
//
NORMAL_DO:	SET_EXP_TIME	5010				// Address location for 500ms 
			SET_LED	2A43	022A	4427	// Update Shutter Offset value
			HOME_SHU
			CCD_START
//
			SET_EXP_TIME	5020				// Address location for 1s 
			SET_LED	2A43	022A	4427	// Update Shutter Offset value
			HOME_SHU
			CCD_START
//
			SET_EXP_TIME	51A8				// Address location for 1.4s
			SET_LED	2A43	022A	4427	// Update Shutter Offset value
			HOME_SHU
			CCD_START
//
			DCR_SEQ
			JNZS	NORMAL_DO
//
			SET_SEQ	001E						// 30 x 1 min wait loop
			SET_OBSERV_ID	F6					// Observation-ID (X"F6") for debugging purpose
WAIT_LOOP:	WAIT	7530
			DCR_SEQ
			CNC
			JNZS	WAIT_LOOP
//
			JMP	REPEAT_BOOT						// REPEAT the BOOT-code if no TC received durng wait time									