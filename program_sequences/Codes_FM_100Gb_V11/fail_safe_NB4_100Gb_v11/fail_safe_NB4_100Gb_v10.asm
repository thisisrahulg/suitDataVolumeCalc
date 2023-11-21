// ; EEPROM Address - 
// ;Fail safe NB4, four output mode program sequence 
// ;for 100 Gb data throughput
// ;This program uses four observation IDs [BA,BB,BC,BD]
// ;Only NB4 filter combination, RoI seq = 344, Cycles = 4
// ;flare routine time corrected by setting seq = 120 (0x78)
// ;v6 - CLEAR_CCD decreased by 1
// ;v6 - Corrected comments and indentation
// ;v7 - Added FULL-FRAME after BEGIN label
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Adjusted cycles and seq for less than 100 Gib data
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
REPEAT_CAL:	SET_CYCLE	0004			// ;Set for 4 cycles in a day
//		
		CLEAR_FLAG						// Clear all Flare Flags 	
		CLEAR_CCD	02					// Clears CCD to ensure no trapped charges
//
		SET_OBSERV_ID	BA				// Observation ID for the BIAS & DARK
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
//
		SET_FRAME_TYPE	0E				// BIAS; two BIAS frames
		CCD_START						// start CCD sequencer
		CCD_START						
		CNC
		SET_BIN	01						// 2X2 Binning
		CCD_START						// start CCD sequencer
		CCD_START						// start CCD sequencer
		CNC
//
		SET_FRAME_TYPE	0D				// DARK
		SET_BIN	00						// No Binning
		SET_EXP_TIME	5058			// LUT address, 30 sec exposure
		CCD_START						// Start CCD sequencer
		CNC
		SET_EXP_TIME	5068			// LUT address, 01 min exposure
		CCD_START						// Start CCD sequencer
		CNC
		SET_BIN	01						// 2X2 Binning
		SET_EXP_TIME	5058			// LUT address, 30 sec exposure
		CCD_START						// 01 min dark, 2x2 binned image
		CNC
		SET_EXP_TIME	5068			// LUT address, 01 min exposure
		CCD_START						// 01 min dark, 2x2 binned image
		CNC
//
BEGIN:	SET_OBSERV_ID	BB				// Observation ID for NORMAL Mode
		SET_FRAME_TYPE	00				// NORMAL 
		SET_FRAME_SIZE	00				// Full Frame
		CLEAR_CCD	02					// Two extra CCD dumps
//		
		SET_SEQ	0003					// 3 Mg II NB4 2K images to be taken
		SET_BIN	01						// 2X2 Binning
		SET_EXP_TIME	5018			// LUT address, 700 ms
//
INIT_FRAMES:	SET_LED	2A43	022A	4427		// Update Shutter Offset value	
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
		DCR_SEQ							// Decrement seq.
		JNZS	INIT_FRAMES				// Repeat until Seq counter goes to zero
//
//  ;NORMAL MODE = 344 ROI  +  1 FF set in 36 Minutes duration
//  ;ROI SEQUENCE STARTS with check for EXT FLARE Trigger after every frame 
//	;SELF FLARE Trigger check done after one full set ~ 77s 
//
NORMAL_MODE:	SET_SEQ	0158			// 344 ROI seq.
		CLEAR_CCD	00					// No extra CCD dump
//
REPEAT_ROI:	SET_FRAME_SIZE	01			// ROI
		ROI_UpdateEn					// Update ROI coordinate if new TC received 
		SET_BIN	00						// No Binning
		SET_EXP_TIME	51A8			// LUT address, 1400 ms
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//1	
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//2									
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer			
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//3									
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer//				
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//4									
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//5									
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger 
//6							
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//7									
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// Start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//8
		SET_BIN	01						// 2X2 Binning for NB4 image for self-trigger check
		SET_FRAME_SIZE	00				// Full-frame
//		
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms 
		CCD_START						// start CCD sequencer
//1B
		FIND_FLARE_SELF					// Call flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		CNC								// check and execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//		
		DCR_SEQ							// Decrement seq.		
		JNZS	REPEAT_ROI				// Jump if seq. is not zero
//
//	;FULL-FRAME SEQUENCE STARTS
//		
		SET_FRAME_SIZE	00				// Full-frame
		SET_BIN	00						// No Binning
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//1		
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START		
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//2
		SET_BIN	01						// 2k binned image in NB4
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//1B
		FIND_FLARE_SELF					// Call flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address, NB2
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//3	
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//4
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//5
		SET_BIN	01						// 2k binned image in NB4
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//2B
		FIND_FLARE_SELF					// Call flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn
//
		SET_BIN	00						// Full Frame images
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//6
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer		
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//7
		SET_BIN	01						// 2k binned image in NB4
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//3B
		FIND_FLARE_SELF					// Call flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn
//
		SET_BIN	00						// Full Frame images
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//8
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC	
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//9
		SET_BIN	01						// 2k binned image in NB4
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	5018			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//4B
		FIND_FLARE_SELF					// Call flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn
//
		SET_BIN	00						// Full Frame images
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address, 1400 ms
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC		
		JIF	JUMP_EXT					// Jump to flare detect routine
//10									
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC
//11
		SET_BIN	01						// 2k binned image in NB4
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address
		CCD_START						// start CCD sequencer	
		CNC								// check and execute TC
//5B
		FIND_FLARE_SELF					// Call flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		DCR_CYCLE						// Decrement cycle
		JNZC	NORMAL_MODE				// Jump if cycle not zero		
		JMP	REPEAT_CAL					// Jump to REPEAT_CAL after 24 hours,
//
//  ;Routine to localize flare based on EXT FLARE trigger
//
JUMP_EXT:	SET_FRAME_SIZE	00			// Full-frame
//
		SET_BIN	01						// 2k binned image in NB4
//
		SET_EXP_TIME	5018			// LUT address
//
		SET_SEQ		003C				// Set 10 min. loop for flare localization
//
LOC_FLR:	SET_LED	2A43	022A	4427		// Update Shutter Offset value	
		HOME_SHU					// Shutter homing
		CCD_START						// start CCD sequencer
		CNC
//
		ROI_UpdateEn
//
		FIND_FLARE_EXT					// Self-Trigger
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		DCR_SEQ
		JNZS	LOC_FLR					// Jump if seq not zero
//		
		CLEAR_FLAG						// Clear all flags if flare not found
		JMP	NORMAL_MODE					// Jump back to normal routine 
//
//  ; Start of the routine to observe normal flares
//
NORM_FLARE:	SET_OBSERV_ID	BC			// ;Observation ID for Normal Flare
//
		SET_FRAME_SIZE	01				// ROI
//
		ROI_UpdateEn
		SET_BIN	00						// Unbinned image in NB4
//
		SET_SEQ	0078					// set sequence for time equivalent to 7200 secs
//
		CHK_ADU	FF						// Enable Auto-exposure module
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	51A8			// Manual mode exposure	
		CCD_START						// start CCD sequencer
		CNC	
		CHK_ADU		00					// Auto Exposure module disable
//
REPEAT_FLARE:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
		CCD_START						// NB4 image with auto exposure
//1
		CHK_ADU		00					// Auto Exposure module disable
//
		ROI_UpdateEn
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC	
//2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC	
//3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC	
//4	
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//5									
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//6		
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//7									
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//8
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// Start CCD sequencer
		CNC								// Check and Execute TC
//9
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//10		
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC
//11
		DCR_SEQ
//
		CHK_ADU	FF						// Enable Auto-exposure module
//
		JNZS	REPEAT_FLARE
//
		JMP	EXIT_FLARE
//	
//	; Start of the Prominence flare observation routine
//							
PROM_FLARE:	SET_OBSERV_ID	BD			// ;Observation ID for Prom. Flare
		SET_FRAME_SIZE	01				// ROI
		ROI_UpdateEn
//
		SET_BIN	00						// No binning
		SET_SEQ	0078					// To be repeated for 7200 secs
//
		CHK_ADU	FF						// Enable Auto-exposure module
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// Manual Exposure
//
		CCD_START						// start CCD sequencer
//
		CNC	
		CHK_ADU		00					// Disable Auto Exposure module
//
REPEAT_PROM:	SET_LED	2A43	022A	4427		// Update Shutter Offset value	
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
		CCD_START						// NB4 image with auto exposure
//1
		CHK_ADU	00						// Disable Auto Exposure module
//
		ROI_UpdateEn
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC	
//2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC	
//3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC	
//4		
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//5	
		DCR_SEQ
//
		CHK_ADU	FF						// Enable Auto Exposure Module
//
		JNZS	REPEAT_PROM				// Jump if seq zero
//
		JMP	EXIT_FLARE
//
EXIT_FLARE:	CHK_ADU	00					// Disable Auto Exposure Module
		CLEAR_FLAG						// Clear all flare flags
		JMP	BEGIN						// Start fresh after flare