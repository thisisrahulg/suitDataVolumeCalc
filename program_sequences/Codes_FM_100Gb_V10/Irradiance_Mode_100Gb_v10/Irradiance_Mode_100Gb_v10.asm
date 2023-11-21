// ; EEPROM Address - 
// ;Irradiance mode program sequence 
// ;100 Gb data throughput in 24 hours
// ;This program uses three observation IDs [68,69,6A]
// ;flare routine time corrected by setting seq = 120 (0x78)
// ;Program has only one common flare routine for both P and N flares
// ;v6 - CLEAR_CCD decreased by 1
// ;v6 - Corrected comments and indentation
// ;v7 - Added FULL-FRAME after BEGIN label
// ;v8 - Added SET_LED instruction before every HOME_SHU, 16.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Adjusted cycles and seq for less than 100 Gib data
//
REPEAT_CAL:	SET_CYCLE	000D			// ;Set for 13 cycles in a day
//		
		CLEAR_FLAG						// Clear all Flare Flags 	
		CLEAR_CCD	02					// Clears CCD to ensure no trapped charges
//
		SET_OBSERV_ID	68				// Program Sequence ID for the BIAS & DARK frames
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
//
		SET_FRAME_TYPE	0E				// BIAS
		CCD_START						// start CCD sequencer
		CCD_START						// start CCD sequencer		
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
BEGIN:	SET_OBSERV_ID	69				// Program Observation ID for NORMAL Mode
		SET_FRAME_TYPE	00				// NORMAL 
		SET_FRAME_SIZE	00				// Full Frame
		CLEAR_CCD	02
//		
		SET_SEQ	0003					// 3 Mg II NB4 2K images to be taken
		SET_BIN	01						// 2X2 Binning
		MOVE_FW1	00					// NB4 
		MOVE_FW2	00					// BPF1  
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
//
INIT_FRAMES:	SET_LED	2A43	022A	4427		// Update Shutter Offset value	
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
		DCR_SEQ
		JNZS	INIT_FRAMES				// Repeat until Seq counter goes to zero
//
//	// NORMAL MODE STARTS = 88 ROI sets +  1 FF set in 30 Minutes duration
//
//	// ROI SEQUENCE STARTS with check for EXT FLARE Trigger after every frame 
//	// SELF FLARE Trigger check done after one full set ~ 77s 
//
NORMAL_MODE:	SET_SEQ	0058			// ;88 ROI sequences
		CLEAR_CCD	00					// No extra CCD dumps
//
REPEAT_ROI:	SET_FRAME_SIZE	01			// ROI 
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_BIN	00						// No Binning
		SET_EXP_TIME	51A8			// LUT address, 1400 ms exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//1		
		MOVE_FW1	01					// NB3 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B0			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//2									
		MOVE_FW1	02					// NB2 is at position 02 on FW1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B8			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//3									
		MOVE_FW1	03					// NB5 is at position 03 on FW1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51C0			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//4									
		MOVE_FW1	04					// BPF2 is at position 04 on FW1
		MOVE_FW2	01					// NB6 is at position 01 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51C8			// LUT address, 683 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//5									
		MOVE_FW2	02					//  NB7 is at position 03 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D8			// LUT address, 458ms  exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger 
//6							
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// NB8 is at position 03 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D0			// LUT address, 1.4s exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//7									
		MOVE_FW1	06					// BB1 is at position 06 on FW1
		MOVE_FW2	05					// NB1 is at position 05 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51E8			// LUT address, 1.4s exposure
		CCD_START						// Start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//8
		SET_BIN	01						// 2X2 Binning 
//
		SET_FRAME_SIZE	00				// Full-frame
//		
		MOVE_FW1	00					// NB4 is at position 00 on FW1
		MOVE_FW2	00					// BPF1 is at position 00 on FW2 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//1B
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	IRAD_FLARE				// Jump If Normal Flare
		JIPF	IRAD_FLARE				// Jump If Prominence Flare
//
		CNC								// check and execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//		
		DCR_SEQ							// Decrement sequence
		JNZS	REPEAT_ROI				// Jump if seq. is not zero
//
//  ;FULL-FRAME SEQUENCE
//		
		SET_FRAME_SIZE	00				// FULL-FRAME
		SET_BIN	00						// No Binning
		ROI_UpdateEn
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
//1		
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B0			// LUT address, 1400 ms exposure
		CCD_START
//2		
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//1B
		CNC								// check and execute TC
//
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	IRAD_FLARE				// Jump If Normal Flare
		JIPF	IRAD_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
//
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B8			// LUT address
		CCD_START
//3
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//	
		MOVE_FW1	03					// NB5
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51C0			// LUT address
		CCD_START
//4
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//
		MOVE_FW1	04					// BPF2
		MOVE_FW2	01					// NB6
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	51C8			// LUT address, 683 ms exposure
		CCD_START
//5
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//2B
		CNC								// check and execute TC
//
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	IRAD_FLARE				// Jump If Normal Flare
		JIPF	IRAD_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn
//
		SET_BIN	00						// Full Frame images
//
		MOVE_FW1	05					// NB8
		MOVE_FW2	03					// NB8
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D0			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
//6
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//
		MOVE_FW1	04					// BPF2
		MOVE_FW2	02					// NB7
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D8			// LUT address, 458 ms exposure 
		CCD_START						// start CCD sequencer
//7		
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//3B
		CNC								// check and execute TC
//
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	IRAD_FLARE				// Jump If Normal Flare
		JIPF	IRAD_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn
//
		SET_BIN	00						// Full Frame images
//
		MOVE_FW1	06					// BB1
		MOVE_FW2	04					// BB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51E0			// LUT address, 608 ms exposure
		CCD_START						// start CCD sequencer
//8
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//
		MOVE_FW2	05					// NB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51E8			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
//9
		CNC	
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//4B
		CNC								// check and execute TC
//
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	IRAD_FLARE				// Jump If Normal Flare
		JIPF	IRAD_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn
//
		SET_BIN	00						// Full Frame images
//
		MOVE_FW1	07					// BPF3 on FW1
		MOVE_FW2	06					// BB2 ON FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51F0			// LUT address, 975 ms exposure
		CCD_START						// start CCD sequencer
//10
		CNC								// Check and Execute TC
//		
		JIF	JUMP_EXT					// Jump to flare detect routine
//									
		MOVE_FW2	07					// BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51F8			// LUT address, 165 ms exposure
		CCD_START						// start CCD sequencer
//11
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//5B	
		CNC								// check and execute TC
//
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	IRAD_FLARE				// Jump If Normal Flare
		JIPF	IRAD_FLARE				// Jump If Prominence Flare
//
		DCR_CYCLE						// Decrement cycle 
//
		JNZC	NORMAL_MODE				// Jump to where ROI cycle repeatations are set
//		
		JMP	REPEAT_CAL					// Jump to REPEAT_CAL after 24 hours. 
//
// ;Routine to localize flare based on EXT FLARE trigger
//
JUMP_EXT:	SET_FRAME_SIZE	00			// Full-frame
		SET_BIN	01						// 2k binned image in NB4
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
//
		SET_SEQ		003C				// Set 10 min. loop for flare localization
//
LOC_FLR:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		CCD_START						// start CCD sequencer
		CNC
		ROI_UpdateEn
//
		FIND_FLARE_EXT					// Call Flare detection module
		JINF	IRAD_FLARE				// Jump If Normal Flare
		JIPF	IRAD_FLARE				// Jump If Prominence Flare
//
		DCR_SEQ
		JNZS	LOC_FLR					// Jump of sequence is not zero
//		
		CLEAR_FLAG						// Clear all flare flags
		JMP	NORMAL_MODE					// Jump to NORMAL_MODE 
//									
//									
//  ; Start of the routine to observe Irradiance flares
//							
IRAD_FLARE:	SET_OBSERV_ID	6A
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
		SET_EXP_TIME	51A8			// Manual Exposure of 1.4s 
//
		CCD_START						// start CCD sequencer
//
		CNC	
		CHK_ADU		00					// Disable Auto Exposure module
//
REPEAT_PROM:	SET_LED	2A43	022A	4427		// Update Shutter Offset value	
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
//
		CCD_START						// start CCD sequencer
//1
		CHK_ADU	00						// Disable Auto Exposure module
//
		ROI_UpdateEn
//
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A008			// Auto-exposure 
		CCD_START						// start CCD sequencer
//2
		CNC	
//
		MOVE_FW1	06					// BB1 is at position 06 on FW1
		MOVE_FW2	05					// BB1 is at position 05 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A038			// Auto-exposure
		CCD_START						// start CCD sequencer
//3
		CNC	
//
		MOVE_FW1	07					// BPF3 on FW1
		MOVE_FW2	06					// BB2 ON FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A048			// Auto-exposure
		CCD_START						// start CCD sequencer
//4
		CNC	
//		
		MOVE_FW2	07					// BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A050			// Auto-exposure
		CCD_START						// start CCD sequencer
//5
		CNC								// Check and Execute TC
//	
		DCR_SEQ
//
		CHK_ADU	FF						// Enable Auto exposure module	
//
		MOVE_FW1	00					// NB4 
		MOVE_FW2	00					// BPF1
//
		JNZS	REPEAT_PROM
//
		JMP	EXIT_FLARE
//
//
EXIT_FLARE:	CHK_ADU	00					// Disable Auto Exposure module
		CLEAR_FLAG						// Clear All flare flags
		JMP	BEGIN						// Start fresh after flare