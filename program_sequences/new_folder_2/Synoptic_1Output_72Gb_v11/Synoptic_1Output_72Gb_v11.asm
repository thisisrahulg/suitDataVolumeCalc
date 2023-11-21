// ; EEPROM Address - 
// ; Synoptic one output mode program sequence for 72 Gb data
// ; Uses 26 cycles of 8 ROI + 1 FF sequence
// ; This program uses four observation IDs [A2,A3,A4,A5]
// ; v6 - CLEAR_CCD decreased by 1
// ; v6 - Corrected comments and indentation
// ; v7 - SET FULL-FRAME AFTER BEGIN LABEL
// ; v8 - Added SET_LED instruction before every HOME_SHU, 23.01.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Adjusted cycles and seq for less than 100 Gib data
// 
REPEAT_CAL:	SET_CYCLE	001A			// Set for 26 cycles in a day
//		
		CLEAR_FLAG						// Clear all Flare Flags 	
		CLEAR_CCD	02					// Clears CCD to ensure no trapped charges
//
		SET_OBSERV_ID	A2				// Program Observation ID for the BIAS & DARK
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
BEGIN:	SET_OBSERV_ID	A3				// Program Observation ID for NORMAL Mode
		SET_FRAME_TYPE	00				// NORMAL 
		SET_FRAME_SIZE	00				// Full Frame
//
		CLEAR_CCD	02
//
		SET_SEQ	0003					// 3 Mg II NB4 2K images to be taken
		SET_BIN	01						// 2X2 Binning
		MOVE_FW1	00					// NB4 is at position 00 on FW1
		MOVE_FW2	00					// say BPF1 is at position 00 on FW2 
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
//
INIT_FRAMES:	SET_LED	2A43	022A	4427	// Update Shutter Offset value	
		HOME_SHU	
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
		DCR_SEQ
		JNZS	INIT_FRAMES				// Repeat until Seq counter goes to zero
//
//	;NORMAL MODE = 14 ROI sets +  1 FF set in 30 Minutes duration
//	;ROI SEQUENCE STARTS with check for EXT FLARE Trigger after every frame 
//	;SELF FLARE Trigger check done after one full set ~ 77s 
//
NORMAL_MODE:	SET_SEQ	000E			// Set for 14 ROI sequences
		CLEAR_CCD	00					// No extra CCD dumps
//
REPEAT_ROI:	SET_FRAME_SIZE	01			// ROI frame size
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_BIN	00						// No Binning
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	51A8			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//1		
		MOVE_FW1	01					// NB3 is at position 01 on FW1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B0			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//2									
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B8			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//3									
		MOVE_FW1	03					// NB5 is at position 03 on FW1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51C0			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//4									
		MOVE_FW1	04					// BPF2 
		MOVE_FW2	01					// NB6
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51C8			// LUT address, 683 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//5									
		MOVE_FW2	02					// NB7
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D8			// LUT address, 458ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger 
//6							
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// another NB8 is at position 03 on FW2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D0			// LUT address, 1.4s exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//7									
		MOVE_FW1	06					// BB1 
		MOVE_FW2	05					// NB1 
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51E8			// LUT address, 1.4s exposure
		CCD_START						// Start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//8
		SET_BIN	01						// 2X2 Binning 
		SET_FRAME_SIZE	00				// Full-frame
//		
		MOVE_FW1	00					// NB4 
		MOVE_FW2	00					// BPF1 
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
//1B
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		CNC								// check and execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//		
		DCR_SEQ							// Decrement sequence
		JNZS	REPEAT_ROI				// Jump to REPEAT_ROI if sequence is not zero
//
//
//	;FULL-FRAME SEQUENCE STARTS
//		
		SET_FRAME_SIZE	00				// Full-frame 
		SET_BIN	00						// No Binning
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51A8			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//1
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//1B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// 4k images
//
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B0			// LUT address, 1400 ms exposure
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//2
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//2B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
//
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51B8			// LUT address
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//3	
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//3B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
//
		MOVE_FW1	03					// NB5
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51C0			// LUT address
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//4
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//4B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
//
		MOVE_FW1	04					// BPF2
		MOVE_FW2	01					// NB6
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	51C8			// LUT address, 683 ms exposure
		CCD_START
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//5
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//5B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
//
		MOVE_FW1	04					// BPF2 on FW1
		MOVE_FW2	02					// NB7
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D8			// LUT address, 458 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//6
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//6B
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// Full Frame images
//		
		MOVE_FW1	05					// NB8
		MOVE_FW2	03					// NB8
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51D0			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//7
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//7B
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// Full Frame images
//
		MOVE_FW1	06					// BB1
		MOVE_FW2	04					// BB1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51E0			// LUT address, 608 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//8
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//8B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
//
		MOVE_FW1	06					// BB1
		MOVE_FW2	05					// NB1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51E8			// LUT address, 1400 ms exposure
		CCD_START						// start CCD sequencer
		CNC	
		JIF	JUMP_EXT					// check for EXT FLARE Trigger
//9
		SET_BIN	01						// 2k binned image in NB4
//
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//9B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// Full Frame images
//
		MOVE_FW1	07					// BPF3 on FW1
		MOVE_FW2	06					// BB2 ON FW2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51F0			// LUT address, 975 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//10		
		JIF	JUMP_EXT					// Jump to flare detect routine
//
		SET_BIN	01						// 2k binned image in NB4
//
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//10B
		FIND_FLARE_SELF					// Call Flare detection module
//
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// Full Frame images
//
		MOVE_FW1	07					// BPF3 on FW1									
		MOVE_FW2	07					// BB3
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	51F8			// LUT address, 165 ms exposure
		CCD_START						// start CCD sequencer
//11
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
		CCD_START						// start CCD sequencer
		CNC								// check and execute TC
//11B
		FIND_FLARE_SELF					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		DCR_CYCLE						// Decrement cycle 
		JNZC	NORMAL_MODE				// Jump to where ROI cycle repeatations are set
		JMP	REPEAT_CAL					// REPEAT_CAL after 24 hours.
//
//	;Routine to localize flare based on EXT FLARE trigger
//
JUMP_EXT:	SET_FRAME_SIZE	00			// Full-frame
//
		SET_BIN	01						// 2k binned image in NB4
//
		MOVE_FW1	00					// NB4
		MOVE_FW2	00					// BPF1
		SET_EXP_TIME	5018			// LUT address, 700 ms exposure
//
		SET_SEQ		000F				// keep repeating unless confirmed for 10 mins
//
LOC_FLR:	SET_LED	2A43	022A	4427	// Update Shutter Offset value	
		HOME_SHU
		CCD_START						// start CCD sequencer
		CNC
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		FIND_FLARE_EXT					// Call Flare detection module
		JINF	NORM_FLARE				// Jump If Normal Flare
		JIPF	PROM_FLARE				// Jump If Prominence Flare
//
		DCR_SEQ							// Decrement sequence
		JNZS	LOC_FLR					// Jump to LOC_FLR if seq is not zero
//		
		CLEAR_FLAG						// Clear All flare flags
		JMP	NORMAL_MODE					// Jump to NORMAL_MODE 
//										
//  ;Normal flare observation routine
//
NORM_FLARE:	SET_OBSERV_ID	A4
		SET_FRAME_SIZE	01				// ROI
		ROI_UpdateEn					// Update ROI coordinate if new TC received
		SET_BIN	00						//  Unbinned image in NB4
//
		SET_SEQ	0050					// to be confirmed for times equivalent to 7200 secs
//
		CHK_ADU	FF						// Enable Auto-exposure module
//
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU
		SET_EXP_TIME	51A8			// Manual exposure
		CCD_START						// start CCD sequencer
		CNC	
		CHK_ADU		00					// Disable Auto Exposure module
//
REPEAT_FLARE:	SET_LED	2A43	022A	4427	// Update Shutter Offset value	
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
		CCD_START						// start CCD sequencer
//1
		CHK_ADU		00					// Disable Auto Exposure module
//
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A008			// Auto-exposure 
		CCD_START						// start CCD sequencer
		CNC	
//2
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A010			// Auto-exposure 
		CCD_START						// start CCD sequencer
		CNC	
//3
		MOVE_FW1	03					// NB5	
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A018			// Auto-exposure 
		CCD_START						// start CCD sequencer
		CNC	
//4	
		MOVE_FW1	04					// BPF2 
		MOVE_FW2	01					// NB6 
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A020			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//5									
		MOVE_FW2	02					// NB7 
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A030			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//6		
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// another NB8 is at position 03 on FW2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A028			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//7									
		MOVE_FW1	06					// BB1 is at position 06 on FW1
		MOVE_FW2	05					// BB1 is at position 05 on FW2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A038			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//8
		MOVE_FW2	05					// NB1 
		SET_EXP_TIME	A040
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		CCD_START						// Start CCD sequencer
		CNC								// Check and Execute TC
//9
		MOVE_FW1	07					// BPF3 on FW1
		MOVE_FW2	06					// BB2 ON FW2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A048			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//10		
		MOVE_FW2	07					// BB3
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A050			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC
//11
		DCR_SEQ							// Decrement sequence
//
		CHK_ADU	FF						// Enable Auto-exposure module

		MOVE_FW1	00					// NB4 image in the loop comes back
		MOVE_FW2	00					// BPF1 
//
		JNZS	REPEAT_FLARE			// Jump to REPEAT_FLARE if seq is not zero
//
		JMP	EXIT_FLARE
//
//	
//	; PROMINENCE FLARE ROUTINE
//							
PROM_FLARE:	SET_OBSERV_ID	A5
		SET_FRAME_SIZE	01				// ROI
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		SET_BIN	00						// No binning
		SET_SEQ	0078					// set seq. for 7200 secs
//
		CHK_ADU	FF						// Enable Auto-exposure module
//
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing		
		SET_EXP_TIME	51A8			// Manual Exposure 
//
		CCD_START						// start CCD sequencer
//
		CNC	
		CHK_ADU		00					// Disable Auto Exposure module
//
REPEAT_PROM:	SET_LED	2A43	022A	4427	// Update Shutter Offset value	
		HOME_SHU
		SET_EXP_TIME	A000			// Auto-exposure 
		CCD_START						// start CCD sequencer
//1
		CHK_ADU	00						// Disable Auto-exposure module
//
		ROI_UpdateEn					// Update ROI coordinate if new TC received
//
		MOVE_FW1	01					// NB3
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A008			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC	
//2
		MOVE_FW1	02					// NB2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A010			// Auto-exposure 
		CCD_START						// start CCD sequencer
		CNC	
//3
		MOVE_FW1	03					// NB5
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A018			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC	
//4		
		MOVE_FW1	05					// NB8 is at position 05 on FW1
		MOVE_FW2	03					// another NB8 is at position 03 on FW2
		SET_LED	2A43	022A	4427	// Update Shutter Offset value
		HOME_SHU						// Shutter homing
		SET_EXP_TIME	A028			// Auto-exposure
		CCD_START						// start CCD sequencer
		CNC								// Check and Execute TC
//5	
		DCR_SEQ							// Decrement sequence
//
		CHK_ADU	FF						// Enable Auto-exposure module	
//
		MOVE_FW1	00					// NB4 image in the loop comes back
		MOVE_FW2	00					// BPF1
//
		JNZS	REPEAT_PROM				// Jump to REPEAT_PROM if seq. is not zero
//
		JMP	EXIT_FLARE
//
//
EXIT_FLARE:	CHK_ADU	00					// Disable Auto-exposure module 
		CLEAR_FLAG
		JMP	BEGIN						// Start fresh after flare