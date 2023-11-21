//  ; EEPROM Address - 
//  ;LED calibration / Flat fielding images
//  ;For lab tests, Exposure time needs to be adjusted
//  ;based on the counts w.r.t LED intensity and set up
//  ;Uses two observation IDs (01) and one (F7) for infinite wait loop
//  ;first 32 bits (Set1_255, Set2_255, Set1_355, Set2_355), 8 bits each per DAC
//  ;20 FF images of 5 min. exposure, total duration - 110 mins.
//  ;In Version_5; LEDs are equally spaced (90 deg)
//  ;Redundant LEDs for 355nm SET2 [D16(B16), D12(B14)], SET1 [D08(B12), D04(B10)] 
//  ;Main LEDs for 355nm SET2 [D14(B15), D10(B13)], SET1 [D06(B11), D02(B09)]
//  ;v6 - Corrected comments and indentation
//  ;v7 - Not created
//  ;v8 - HOME_SHU only at the beginning, removed from other places
//  ;v8 - Extra SET_LED before HOME_SHU, 23.01.2023 
//  ;v8 - SET_LED parameters as per FM shutter
//  ;v9 - Filter 04 07 for 355 nm and Fliter 07 06 for 255 nm
//  ;v9 - 355 nm (100 ms and 300 ms. exp), 255 nm (10 sec and 6 sec exp)
//
		SET_OBSERV_ID	01					// Observation ID
		SET_FRAME_TYPE	0A					// LED calibration frame, 355 nm
		SET_FRAME_SIZE	00					// Full Frame
		SET_BIN	00							// 4k image
		SET_EXP_TIME	5028				// 300 msec. exposure time
//
		MOVE_FW1	04						// BP3
		MOVE_FW2	07						// BB3
//
		SET_LED	2A43	022A	4427			// Update Shutter Offset value
		HOME_SHU							// Home Shutter
//
		SET_LED	0000	FF00	0100		// MAIN SET1_355_D02 is ON at max current (20 mA= FF)
		CCD_START							// Start CCD sequencer
//1
		SET_LED	0000	FF00	0400		// MAIN SET1_355_D06 is ON at max current (20 mA= FF)
		CCD_START							// Start CCD sequencer
//2
		SET_LED	0000	00FF	1000		// MAIN SET2_355_D10 is ON at max current (20 mA= FF)
		CCD_START							// Start CCD sequencer
//3
		SET_LED	0000	00FF	4000		// MAIN SET2_355_D14 is ON at max current (20 mA= FF)
		CCD_START							// Start CCD sequencer
//4
		SET_LED	0000	FF00	0200		// Redundant SET1_355_D04 is ON at max current (20 mA= FF)
		CCD_START							// Start CCD sequencer
//5
		SET_LED	0000	FF00	0800		// Redundant SET1_355_D08 is ON at max current (20 mA= FF)
		CCD_START							// Start CCD sequencer
//6
		SET_LED	0000	00FF	2000		// Redundant SET2_355_D12 is ON at max current (20 mA= FF)
		CCD_START							// Start CCD sequencer
//7
		SET_LED	0000	00FF	8000		// Redundant SET2_355_D16 is ON at max current (20 mA= FF)
		CCD_START							// Start CCD sequencer
//8
		SET_EXP_TIME	5000				// 100 msec. exposure time
		SET_LED	0000	BFBF	AA00		// Redundant 4 SET2_355 [D16,D12], SET1_355 [D08,D04] is ON
		CCD_START							
//9
		SET_LED	0000	BFBF	5500		// MAIN 4 SET2_355 [D14,D10], SET1_355 [D06,D02] is ON
		CCD_START							
//10
		CNC								
//
//  ;Main      LEDs for 255nm SET2 [D13(B07), D09(B05)], SET1 [D05(B03), D01(B01)]
//
//  ;Redundant LEDs for 255nm SET2 [D15(B08), D11(B06)], SET1 [D07(B04), D03(B02)]
//
		SET_EXP_TIME	5048				// 10 sec. exposure time
		SET_FRAME_TYPE	0B					// LED calibration frame, 255 nm
		MOVE_FW1	07						// BP4
		MOVE_FW2	06						// 255 nm LEDs, corresponding to BB2
//
		SET_LED	FF00	0000	0001		//	MAIN SET1_255_D01 is ON at max current (20 mA= FF)	
		CCD_START		
//11		
		SET_LED	FF00	0000	0004		//	MAIN SET1_255_D05 is ON at max current (20 mA= FF)		
		CCD_START							
//12
		SET_LED	00FF	0000	0010		//	MAIN SET2_255_D09 is ON at max current (20 mA= FF)		
		CCD_START							
//13
		SET_LED	00FF	0000	0040		//	MAIN SET2_255_D13 is ON at max current (20 mA= FF)		
		CCD_START							
//14
		SET_LED	FF00	0000	0002		//	Redundant SET1_255_D03 is ON at max current (20 mA= FF)		
		CCD_START
//15
		SET_LED	FF00	0000	0008		//  Redundant SET1_255_D07 is ON at max current (20 mA= FF)		
		CCD_START							
//16
		SET_LED	00FF	0000	0020		//  Redundant SET2_255_D11 is ON at max current (20 mA= FF)		
		CCD_START							
//17
		SET_LED	00FF	0000	0080		//  Redundant SET2_255_D15 is ON at max current (20 mA= FF)		
		CCD_START							
//18
		SET_EXP_TIME	5060				// 6 sec. exposure time
		SET_LED	FFFF	0000	0055		//  4 MAIN LEDS SET2_255 [D13, D09], SET1_255 [D05, D01] are ON		
		CCD_START							
//19
		SET_LED	FFFF	0000	00AA		//	4 Redundant LEDS SET2_255 [D15, D11], SET1_255 [D07,D03]
		CCD_START							
//20
		SET_OBSERV_ID	F7					// Observation ID for infinite wait
WAIT_LOOP:	WAIT	7530					// wait for 1 min.		
		CNC
		JMP	WAIT_LOOP