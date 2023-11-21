// ; EEPROM Address - 
// ; Default Synoptic is the base code; 
// ; 1 FD + 1 Binnened images per min; 11 FF in every 2 hrs: 
// ; One cycle consists of 3 FD (Sp filter) + 3 binning + 11 FD cycle
// ; One cycle for ~ 2.4 hours, 10 such cycles 
// ; Observation IDs will be assigned
// ; flare routine time corrected by setting seq = 120 (0x78)
// ;
//
REPEAT_CAL:	SET_CYCLE	000C			// ;Set for 12 cycles in a day
//		
		CLEAR_FLAG						// Clear all Flare Flags 	
		CLEAR_CCD	02					// Clears CCD to ensure no trapped charges
//
		SET_OBSERV_ID	96				// ;Program Observation ID for the BIAS & DARK
		SET_FRAME_SIZE	00				// Full Frame
		SET_BIN	00						// No binning
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
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
BEGIN:	SET_OBSERV_ID	97				// ;Program Observation ID for NORMAL Mode
		SET_FRAME_TYPE	00				// NORMAL 
		SET_FRAME_SIZE	00				// Full Frame
//
		CLEAR_CCD	02
//
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
//	;NORMAL MODE,  88 ROI sets +  1 FF set in ~2.4 hours duration
//	;ROI SEQUENCE STARTS with check for EXT FLARE Trigger after every frame 
//	;SELF FLARE Trigger check done at ~ 77s cadense 
//	 
//  	;FULL-DISK SEQUENCE 
//		
NORMAL_MODE:	SET_SEQ	0028			// set sequence
		CLEAR_CCD	00					// No extra CCD dumps
//
REPEAT_FDC:	SET_FRAME_SIZE	00			// FULL-FRAME
		SET_BIN	00						// No Binning
//		
		MOVE_FW1	06					// BB1 location on FW1 w.r.t NB4 Position
		MOVE_FW2	04					// BB1 location on FW2 w.r.t BPF1 Position
		SET_EXP_TIME	51E0			// 608 ms for BB1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
//		;1-Img		
		CNC
		WAIT	1770					// wait for 12sec
		CNC								// Check and Execute TC
//
		SET_BIN	01						// 2k binned image in NB4
		MOVE_FW1	00					// NB4 is at position 00 on FW1
		MOVE_FW2	00					// BPF1 is at position 00 on FW2 
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//		;1-BinImg
		CNC								// check and execute TC
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//		
		CNC
		WAIT	1F40					// wait for 16sec
		CNC								// Check and Execute TC
//
		SET_BIN	00						// No Binning
//		
		MOVE_FW1	07					// BPF3 on FW1
		MOVE_FW2	06					// BB2 ON FW2
		SET_EXP_TIME	51F0			// 975 ms for BB2
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
//		;2-Img		
		CNC
		WAIT	1770					// wait for 12sec
		CNC								// Check and Execute TC
//
		SET_BIN	01						// 2k binned image in NB4
		MOVE_FW1	00					// NB4 is at position 00 on FW1
		MOVE_FW2	00					// BPF1 is at position 00 on FW2 
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//		;2-BinImg
		CNC								// check and execute TC
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//		
		CNC
		WAIT	1F40					// wait for 16sec
		CNC
//		
		SET_BIN	00						// No Binning
		MOVE_FW1	07					// NB3
		MOVE_FW2	07					// BB3
		SET_EXP_TIME	51F8			// 165 ms for BB3
		HOME_SHU						// Shutter homing
		CCD_START						// start CCD sequencer
//		;3-Img		
		CNC
		WAIT	1770					// wait for 12sec
		CNC								// Check and Execute TC
//
		SET_BIN	01						// 2k binned image in NB4
		MOVE_FW1	00					// NB4 is at position 00 on FW1
		MOVE_FW2	00					// BPF1 is at position 00 on FW2 
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//		;3-BinImg
		CNC								// check and execute TC
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//		
		CNC
		WAIT	1F40					// wait for 16sec
		CNC
//		
		DCR_SEQ							// Decrement sequence
		JNZS	REPEAT_FDC				// Jump if seq. is not zero
//
//  	;FULL-FRAME SEQUENCE 
//		
		SET_FRAME_SIZE	00				// FULL-FRAME
		SET_BIN	00						// No Binning
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
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn
//
		SET_BIN	00						// No Binning
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
		SET_BIN	01						// 2k binned image 
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
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
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
		SET_BIN	01						// 2k binned image 
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
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
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
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
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
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		DCR_CYCLE						// Decrement cycle 
		JNZC	NORMAL_MODE				// Jump to where ROI cycle repeatations are set
		JMP	REPEAT_CAL					// Jump to REPEAT_CAL after 24 hours.
//
//
//  ;Routine to localize flare based on EXT FLARE trigger
//
JUMP_EXT:	SET_FRAME_SIZE	00			// Full-frame
//
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
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
NORM_FLARE:	SET_OBSERV_ID	98			// ;Observation ID for Normal Flare
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
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A008			// Auto-exposure 
		CCD_START						// start CCD sequencer
		CNC	
//2
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A010			// Auto-exposure 
		CCD_START						// start CCD sequencer
		CNC	
//3
		MOVE_FW1	03					// NB5
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A018			// Auto-exposure 
		CCD_START						// start CCD sequencer
		CNC	
//4	
		MOVE_FW1	04					// BPF2 is at position 04 on FW1
		MOVE_FW2	01					// say NB6 is at position 01 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A020			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//5									
		MOVE_FW2	02					// say NB7 is at position 02 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A030			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//6		
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// another NB8 is at position 03 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A028			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//7									
		MOVE_FW1	06					// BB1 is at position 06 on FW1
		MOVE_FW2	05					// BB1 is at position 05 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A038			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//8
		MOVE_FW2	05					// NB1 is at position 05 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A040		
		CCD_START						// Start CCD sequencer
		CNC								// Check and Execute TC
//9
		MOVE_FW1	07					// BPF3 on FW1
		MOVE_FW2	06					// BB2 ON FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A048			// LUT address
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//10		
//
		MOVE_FW2	07					// BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A050			// LUT address
		CCD_START						// start CCD sequencer
		CNC
//11
		DCR_SEQ
//
		CHK_ADU	FF						// Enable Auto-exposure module

		MOVE_FW1	00					// NB4 image in the loop comes back
		MOVE_FW2	00					// BPF1 
//
		JNZS	REPEAT_FLARE
//
		JMP	EXIT_FLARE
//	
//	; Start of the Prominence flare observation routine
//							
PROM_FLARE:	SET_OBSERV_ID	99			// ;Observation ID for Prom. Flare
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
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A008			// Auto Exposure
		CCD_START						// start CCD sequencer
		CNC	
//2
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A010			// Auto Exposure 
		CCD_START						// start CCD sequencer
		CNC	
//3
		MOVE_FW1	03					// NB5
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A018			// Auto Exposure 
		CCD_START						// start CCD sequencer
		CNC	
//4		
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// another NB8 is at position 03 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A028			// Auto Exposure 
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//5	
		DCR_SEQ
//
		CHK_ADU	FF						// Enable Auto Exposure Module
//
		MOVE_FW1	00					// NB4 image in the loop comes back
		MOVE_FW2	00					// BPF1
//
		JNZS	REPEAT_PROM				// Jump if seq zero
//
		JMP	EXIT_FLARE
//
EXIT_FLARE:	CHK_ADU	00					// Disable Auto Exposure Module
		CLEAR_FLAG						// Clear all flare flags
		JMP	BEGIN						// Start fresh after flare