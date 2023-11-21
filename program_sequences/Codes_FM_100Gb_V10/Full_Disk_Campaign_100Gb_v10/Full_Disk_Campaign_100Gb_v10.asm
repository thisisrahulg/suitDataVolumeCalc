// ; EEPROM Address - 
// ;FULL-DISK CAMPAIGN MODE for 7 hours
// ;One cycle of 23 FD sequences + one default FF sequence
// ;Total 11 such cycles
// ;This program uses four observation IDs [65,66,67 and F7] 
// ;generates more than 168 Gb in ~7 hours
// ;v8 - Added SET_LED instruction before every HOME_SHU, 16.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Adjusted cycles and seq for less than 100 Gib data
//
		SET_CYCLE	000E			// Set for 14 cycles, i.e 7 hours		
		CLEAR_FLAG					// Clear all Flare Flags 	
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
BEGIN:	SET_OBSERV_ID	65			// Observation ID for NORMAL Mode
		SET_FRAME_SIZE	00			// Full Frame
		SET_FRAME_TYPE	00			// NORMAL 
//
		CLEAR_CCD	02
//		
		SET_SEQ	0003				// 3 Mg II NB4 2K images to be taken
		SET_BIN	01					// 2X2 Binning
		MOVE_FW1	00				// NB4 is at position 00 on FW1
		MOVE_FW2	00				// BPF1 is at position 00 on FW2 
		SET_EXP_TIME	5018		// LUT address, 700 ms for 2k binned NB4
//
INIT_FRAMES:	SET_LED	2A43	022A	4427		// Update Shutter Offset value	
		HOME_SHU
		CCD_START					// start CCD sequencer
		CNC							// check and execute TC
		DCR_SEQ						// Decrement seq.
		JNZS	INIT_FRAMES			// Repeat until Seq counter goes to zero
//
//	;NORMAL MODE STARTS = 13 FD campaign sequences +  1 FF set in 30 Minutes duration
//  ;SELF FLARE Trigger check done after one full set ~ 77s 
//
NORMAL_MODE:	SET_SEQ	000D		// set sequence
		CLEAR_CCD	00				// No extra CCD dumps
//
REPEAT_BB:	SET_BIN	00	
		MOVE_FW1	06				// BB1 location on FW1 w.r.t NB4 Position
		MOVE_FW2	04				// BB1 location on FW2 w.r.t BPF1 Position
		SET_EXP_TIME	51E0		// 608 ms for BB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START					// start CCD sequencer
		CNC							// check and execute TC
		JIF	JUMP_EXT							
//1
		MOVE_FW1	07				// BPF3 on FW1
		MOVE_FW2	06				// BB2 ON FW2
		SET_EXP_TIME	51F0		// 975 ms for BB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START					// start CCD sequencer
		CNC
		JIF	JUMP_EXT
//2
		MOVE_FW2	07				// BB3
		SET_EXP_TIME	51F8		// 165 ms for BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START					// start CCD sequencer
		CNC
		JIF	JUMP_EXT
//3
		SET_BIN	01					// 2X2 Binning 
		MOVE_FW1	00				// NB4 is at position 00 on FW1
		MOVE_FW2	00				// BPF1 is at position 00 on FW2 
		SET_EXP_TIME	5018		// Address location for 700 ms
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		CCD_START					// start CCD sequencer
		FIND_FLARE_SELF				// Call Flare detection module
		JINF	NORM_FLARE			// Jump If Normal Flare
		JIPF	PROM_FLARE			// Jump If Prominence Flare
		CNC							// check and execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//1B
		DCR_SEQ						// Decrement sequence
		JNZS	REPEAT_BB			// Jump if seq. is not zero
//
//  ;USUAL FULL-FRAME SEQUENCE
//		
		SET_FRAME_SIZE	00			// FF sequence starts
		SET_BIN	00					// No Binning
//
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51A8		// LUT address, 1400 ms for NB4
		CCD_START					// start CCD sequencer
//1		
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//
		MOVE_FW1	01				// NB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51B0		// LUT address, 1400 ms for NB3
		CCD_START
//2		
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//
		SET_BIN	01					// 2k binned image in NB4
//
		MOVE_FW1	00				// NB4
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	5018		// LUT address, 700 ms for NB4 in 2k binning
		CCD_START					// start CCD sequencer
//1B
		CNC							// check and execute TC
//
		FIND_FLARE_SELF				// Call Flare detection module
//
		JINF	NORM_FLARE			// Jump If Normal Flare
		JIPF	PROM_FLARE			// Jump If Prominence Flare
//
		SET_BIN	00					// No binning
//
		MOVE_FW1	02				// NB2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51B8		// LUT address, NB2
		CCD_START
//3
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//	
		MOVE_FW1	03				// NB5
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51C0		// LUT address, NB5
		CCD_START
//4
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//
		MOVE_FW1	04				// BPF2
		MOVE_FW2	01				// NB6
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	51C8		// LUT address, 683 ms for NB6
		CCD_START
//5
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//
		SET_BIN	01					// 2k binned image in NB4
//
		MOVE_FW1	00				// NB4
		MOVE_FW2	00				// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	5018		// LUT address, 700 ms 
		CCD_START					// start CCD sequencer
//2B
		CNC							// check and execute TC
//
		FIND_FLARE_SELF				// Call Flare detection module
		JINF	NORM_FLARE			// Jump If Normal Flare
		JIPF	PROM_FLARE			// Jump If Prominence Flare
//
		SET_BIN	00					// No Binning
//
		MOVE_FW1	05				// NB8
		MOVE_FW2	03				// NB8
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51D0		// LUT address, 1400 ms for NB8 
		CCD_START					// start CCD sequencer
//6
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//
		MOVE_FW1	04				// BPF2
		MOVE_FW2	02				// NB7
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51D8		// LUT address, 458 ms for NB7 
		CCD_START					// start CCD sequencer
//7		
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//
		SET_BIN	01					// 2k binned image in NB4
//
		MOVE_FW1	00				// NB4
		MOVE_FW2	00				// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	5018		// LUT address, 700 ms for NB4 
		CCD_START					// start CCD sequencer
//3B
		CNC							// check and execute TC
//
		FIND_FLARE_SELF				// Call Flare detection module
		JINF	NORM_FLARE			// Jump If Normal Flare
		JIPF	PROM_FLARE			// Jump If Prominence Flare
//
		SET_BIN	00					// Full Frame images
//
		MOVE_FW1	06				// BB1
		MOVE_FW2	04				// BB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51E0		// LUT address, 608 ms for BB1
		CCD_START					// start CCD sequencer
//8
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//
		MOVE_FW2	05				// NB1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51E8		// LUT address, 1400 ms for NB1
		CCD_START					// start CCD sequencer
//9
		CNC	
		JIF	JUMP_EXT				// check for EXT FLARE Trigger
//
		SET_BIN	01					// 2k binned image in NB4
//
		MOVE_FW1	00				// NB4
		MOVE_FW2	00				// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	5018		// LUT address, 700 ms 
		CCD_START					// start CCD sequencer
//4B
		CNC							// check and execute TC
//
		FIND_FLARE_SELF				// Call Flare detection module
		JINF	NORM_FLARE			// Jump If Normal Flare
		JIPF	PROM_FLARE			// Jump If Prominence Flare
//
		SET_BIN	00					// Full Frame images
//
		MOVE_FW1	07				// BPF3 on FW1
		MOVE_FW2	06				// BB2 ON FW2
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51F0		// LUT address, 975 ms for BB2
		CCD_START					// start CCD sequencer
//10
		CNC							// Check and Execute TC
		JIF	JUMP_EXT				// Jump to flare detect routine
//									
		MOVE_FW2	07				// BB3
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	51F8		// LUT address, 165 ms for BB3
		CCD_START					// start CCD sequencer
//11
		SET_BIN	01					// 2k binned image in NB4
//
		MOVE_FW1	00				// NB4
		MOVE_FW2	00				// BPF1
		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU					// Shutter homing
		SET_EXP_TIME	5018		// LUT address, 700 ms for NB4 in 2k binning
		CCD_START					// start CCD sequencer
//5B	
		CNC							// check and execute TC
//
		FIND_FLARE_SELF				// Call Flare detection module
//
		JINF	NORM_FLARE			// Jump If Normal Flare
		JIPF	PROM_FLARE			// Jump If Prominence Flare
//
		DCR_CYCLE					// Decrement cycle
//
		JNZC	NORMAL_MODE			// Jump if cycle is not zero
//		
//
		SET_OBSERV_ID	F7			// Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530			// wait for 1 min.
		CNC							// TC to go to regular Synoptic Mode
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
NORM_FLARE:	SET_OBSERV_ID	66			// ;Observation ID for Normal Flare
//
		SET_FRAME_SIZE	01				// ROI
//
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
REPEAT_FLARE:		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
		CCD_START						// NB4 image with auto exposure
//1
		CHK_ADU		00					// Auto Exposure module disable
//
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
PROM_FLARE:	SET_OBSERV_ID	67			// ;Observation ID for Prom. Flare
		SET_FRAME_SIZE	01				// ROI
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
REPEAT_PROM:		SET_LED	2A43	022A	4427		// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
		CCD_START						// NB4 image with auto exposure
//1
		CHK_ADU	00						// Disable Auto Exposure module
//
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