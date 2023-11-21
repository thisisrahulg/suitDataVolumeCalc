// ; EEPROM Address - 
// ;Four Mg2 Index filters Full disk images for ~6 hours duration
// ;Should produce about 29 GB data (before compression)
// ;This program uses four observation IDs [6E,6F,70 and F7]
// ; flare routine time corrected by setting seq = 120 (0x78)
// ;v6 - CLEAR_CCD decreased by 1
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Adjusted cycles and seq for less than 100 Gib data
//
		CLEAR_FLAG						// Clear all Flare Flags 	
//
		SET_CYCLE	00AA				// Repeat 170 times, each loop ~ 135 sec.
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
BEGIN:	SET_OBSERV_ID	6E				// ObservationID for NORMAL Mode
		SET_FRAME_SIZE	00				// Full-frame
		SET_FRAME_TYPE	00				// NORMAL 
//
		CLEAR_CCD	02
//		
		SET_SEQ	0003					// 3 Mg II NB4 2K images to be taken
		SET_BIN	01						// 2X2 Binning
		MOVE_FW1	00					// NB4 
		MOVE_FW2	00					// BPF1  
		SET_EXP_TIME	5018			// LUT address, 700 ms
//
INIT_FRAMES:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
		DCR_SEQ
		JNZS	INIT_FRAMES				// Repeat until Seq counter goes to zero
//	
		CLEAR_CCD	00					// No extra CCD dumps 		
//
//  ; Take Full disk images in four Mg2 index filters
//
MG_FILTERS:	SET_FRAME_SIZE	00			// FF
		SET_BIN	00						// No Binning
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address, 1400 ms 
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//1
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B0			// Exposure LUT Address
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//2
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// Exposure LUT address
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//1B
		FIND_FLARE_SELF					// Call flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn
//
		SET_BIN	00						// No binning
//
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B8			// Exposure LUT Address
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//3
		MOVE_FW1	03					// NB5
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51C0			// LUT address
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//4
		SET_BIN	01						// 2k binned image
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
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
		DCR_CYCLE						// Decrement cycle 
//
		JNZC	MG_FILTERS				// Jump if Cycle zero
//		
		SET_OBSERV_ID	F7				// Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530				// wait for 1 min.		
		CNC
		JMP	WAIT_LOOP
//
//	;Routine to localize flare based on EXT FLARE trigger
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
		ROI_UpdateEn
//
		FIND_FLARE_EXT					// Call flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		DCR_SEQ							// Decrement seq.
		JNZS	LOC_FLR					// Jump if seq not zero
//		
		CLEAR_FLAG						// Clear all Flare flags
		JMP	MG_FILTERS					// Jump back to Normal Routine 
//									
//	; Start of the routine to observe normal flares								
//
NORM_FLARE:	SET_OBSERV_ID	6F
//
		SET_FRAME_SIZE	01				// ROI
		ROI_UpdateEn
		SET_BIN	00						// Unbinned image in NB4
//
		SET_SEQ	0078					// Seq. no. equivalent to 7200 secs
//
		CHK_ADU	FF						// Enable Auto-exposure module
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	51A8			// NB4 manual exposure
		CCD_START						// start CCD sequencer
		CNC	
		CHK_ADU		00					// Disable Auto Exposure module
//
REPEAT_FLARE:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
		CCD_START						// start CCD sequencer
		CHK_ADU		00					// Auto Exposure module disable
		ROI_UpdateEn
//1
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
		MOVE_FW2	01					// NB6 is at position 01 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A020			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// check for TC
//5									
		MOVE_FW2	02					// NB7 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A030			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// check for TC
//6		
		MOVE_FW1	05					// NB8 
		MOVE_FW2	03					// NB8 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A028			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// check for TC
//7								
		MOVE_FW1	06					// BB1 is at position 06 on FW1
		MOVE_FW2	05					// BB1 is at position 05 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A038			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//8
		MOVE_FW2	05					// NB1
		SET_EXP_TIME	A040			// Auto-exposure
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// Start CCD sequencer
		CNC								// check for TC
//9
		MOVE_FW1	07					// BPF3 on FW1
		MOVE_FW2	06					// BB2 ON FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A048			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//10		
		MOVE_FW2	07					// BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A050			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC
//11
		DCR_SEQ							// Decrement seq.
		CHK_ADU	FF						// Enable Auto-exposure module
		MOVE_FW1	00					// NB4 image in the loop comes back
		MOVE_FW2	00					// BPF1 
//
		JNZS	REPEAT_FLARE
//
		JMP	EXIT_FLARE
//
//	; Start of the routine to observe prom. flares
//							
PROM_FLARE:	SET_OBSERV_ID	70
		SET_FRAME_SIZE	01				// ROI
		ROI_UpdateEn
		SET_BIN	00						// No binning
		SET_SEQ	0078					// Seq. no. for time equal to 7200 secs
//
		CHK_ADU	FF						// Enable Auto-exposure module
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// Manual Exposure
		CCD_START						// start CCD sequencer
		CNC	
		CHK_ADU		00					// Disable Auto Exposure module
//
REPEAT_PROM:	SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
		CCD_START						// start CCD sequencer
//1
		CHK_ADU	00						// Disable Auto Exposure module
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
		MOVE_FW1	05					// NB8 
		MOVE_FW2	03					// NB8 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A028			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// check for TC
//5
		DCR_SEQ							// Decrement seq.
		CHK_ADU	FF						// Enable Auto-exposure module	
//
		MOVE_FW1	00					// NB4 image in the loop comes back
		MOVE_FW2	00					// BPF1
//
		JNZS	REPEAT_PROM
//
		JMP	EXIT_FLARE
//
//
EXIT_FLARE:	CHK_ADU	00					// Disable Auto Exposure module
		CLEAR_FLAG						// Clear All flags
		JMP	BEGIN						// Start fresh after flare