// ; EEPROM Address - 
// ; Coupling ROI - Number of filter combination in ROI - 4
// ;Program runs for 6 hours, 43 ROI sequences + 1 ff sequence
// ;One cycle for ~30 mins., Total 12 such cycles
// ;This program uses four observation IDs [83,84,85 and F7]
// ;flare routine time corrected by setting seq = 120 (0x78)
// ;v6 - CLEAR_CCD decreased by 1
// ;v6 - Corrected comments and indentation
// ;v8 - Added SET_LED instruction before every HOME_SHU, 20.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - same as v8, 43 Gb data
//
		SET_CYCLE	000C				// Set for 12 cycles, 6 hours
		CLEAR_FLAG						// Clear all Flare Flags 	
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
BEGIN:	SET_OBSERV_ID	83				// Observation ID for NORMAL Mode
		SET_FRAME_SIZE	00				// FULL-FRAME
		SET_FRAME_TYPE	00				// NORMAL 
//
		CLEAR_CCD	02					// two extra CCD dumps
//
		SET_SEQ	0003					// 3 Mg II NB4 2K images to be taken
		SET_BIN	01						// 2X2 Binning
		MOVE_FW1	00					// NB4 is at position 00 on FW1
		MOVE_FW2	00					// say BPF1 is at position 00 on FW2 
		SET_EXP_TIME	5018			// LUT address, 700 ms for 2k binned NB4
//
INIT_FRAMES:	SET_LED	2A43	022A	4427		// Update Shutter Offset value	
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and execute TC
		DCR_SEQ
		JNZS	INIT_FRAMES				// Repeat until Seq counter goes to zero
//
//	;NORMAL MODE STARTS = 43 ROI sequences +  1 FF sequence in 30 Minutes duration
//
NORMAL_MODE:	SET_SEQ	002B			// 43 ROI sequences
		CLEAR_CCD	00					// No extra CCD dumps
//
REPEAT_ROI:	SET_FRAME_SIZE	01			// ROI frame size
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_BIN	00						// No Binning
		SET_EXP_TIME	5018			// LUT address, 1400 ms- NB4
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//1							
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// NB8 is at position 03 on FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D0			// LUT address, 1.4s for NB8
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//2									
		MOVE_FW1	04					// BPF2 is at position 04 on FW1
		MOVE_FW2	02					// NB7 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D8			// LUT address, 1.4s for NB7+BPF2
		CCD_START						// Start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//3
		SET_BIN	01						// 2X2 Binning 
		SET_FRAME_SIZE	00				// Full-frame
//		
		MOVE_FW1	00					// NB4 is at position 00 on FW1
		MOVE_FW2	00					// say BPF1 is at position 00 on FW2 
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms for NB4 in 2k binning
		CCD_START						// start CCD sequencer
//1B
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		CNC								// check and execute TC
		DCR_SEQ
		JNZS	REPEAT_ROI				// Jump if seq. is not zero
//
//
//  ;FULL-FRAME SEQUENCE 
//		
		SET_FRAME_SIZE	00				// FULL-FRAME
		SET_BIN	00						// No Binning
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address, 1400 ms for NB4
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//1
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B0			// LUT address, 1400 ms for NB3
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//2
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms 
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//1B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B8			// LUT address
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//3	
		MOVE_FW1	03					// NB5
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51C0			// LUT address, NB5
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//4
		MOVE_FW1	04					// BPF2
		MOVE_FW2	01					// NB6
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	51C8			// LUT address, 683 ms for NB6
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//5
		SET_BIN	01						// 2k binned image in NB4
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms 
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//2B
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
//
		MOVE_FW1	05					// NB8
		MOVE_FW2	03					// NB8
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D0			// LUT address, 1400 ms for NB8 
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//6
		MOVE_FW1	04					// BPF2
		MOVE_FW2	02					// NB7
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D8			// LUT address, 458 ms for NB7 
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//7
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms 
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//3B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No Binning
		MOVE_FW1	06					// BB1
		MOVE_FW2	04					// BB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51E0			// LUT address, 608 ms for BB1
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//8
		MOVE_FW2	05					// NB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51E8			// LUT address, 1400 ms for NB1
		CCD_START						// start CCD sequencer
		CNC	
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//9
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	5018			// LUT address, 700 ms 
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//4B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// Full Frame images
		MOVE_FW1	07					// BPF3 on FW1
		MOVE_FW2	06					// BB2 ON FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51F0			// LUT address, 975 ms for BB2
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//10		
		JIF	JUMP_EXT					// Jump to flare detect routine
//									
		MOVE_FW2	07					// BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51F8			// LUT address, 165 ms for BB3
		CCD_START						// start CCD sequencer
//11
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms for NB4 in 2k binning
		CCD_START						// start CCD sequencer
//5B	
		CNC								// check and execute TC
//
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		DCR_CYCLE						// Decrement cycle 
		JNZC	NORMAL_MODE				// Jump to where ROI cycle repeatations are set
//		
		SET_OBSERV_ID	F7				// Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530				// wait for 1 min.		
		CNC
		JMP	WAIT_LOOP
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
NORM_FLARE:	SET_OBSERV_ID	84			// ;Observation ID for Normal Flare
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
		SET_EXP_TIME	A040
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU						// Shutter homing
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
PROM_FLARE:	SET_OBSERV_ID	85			// ;Observation ID for Prom. Flare
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