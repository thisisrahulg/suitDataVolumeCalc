// ; EEPROM Address - 
// ;Objective of this code is to go through all 64 entries of Exposure-LUT addresses
// ;Choose any one filter, actual filter may be decided later
// ;For lab-test, one should update the LUT and execute this code again
// ;Lower (around 100msec)exposure values also should be checked in the LAB
// ;For default values, total exposure time would be ~43 mins.
// ;CCD readout time for 64 RoI images would be 6 mins.
// ;v6 - Corrected comments and indentation
// ;Total execution time ~50 mins. 
// ; Program uses two observation IDs (03 and F7)
// ;v8 - Added SET_LED instruction before every HOME_SHU, 21.03.2023
// ;v8 - SET_LED parameters as per FM shutter
// ;v9 - Changes fliters to 00 position
//
SET_OBSERV_ID	03			// Observation ID
SET_FRAME_TYPE	05			// Shutter Calibration Frame
CLEAR_FLAG					// Clear all Flare flags
CLEAR_CCD	01				// One extra CCD dump
SET_FRAME_SIZE	01			// ROI
SET_BIN		00				// No binning
//
MOVE_FW1	00				// ;MOVE filter wheel 1 to zero position
MOVE_FW2	00				// ;MOVE filter wheel 2 to zero position
//1
SET_EXP_TIME	5000		// 1st Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU					// Home Shutter
CCD_START					// Start CCD sequencer
CNC
//2
SET_EXP_TIME	5008		// 2nd Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//3
SET_EXP_TIME	5010		// 3rd Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//4
SET_EXP_TIME	5018		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//5
SET_EXP_TIME	5020		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//6
SET_EXP_TIME	5028		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//7
SET_EXP_TIME	5030		// Exposure-LUT address		
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//8
SET_EXP_TIME	5038		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//9
SET_EXP_TIME	5040		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//10
SET_EXP_TIME	5048		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//11
SET_EXP_TIME	5050		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//12
SET_EXP_TIME	5058		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//13
SET_EXP_TIME	5060		// Exposure-LUT address	
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//14
SET_EXP_TIME	5068		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//15
SET_EXP_TIME	5070		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//16
SET_EXP_TIME	5078		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//17
SET_EXP_TIME	5080		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//18
SET_EXP_TIME	5088		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//19
SET_EXP_TIME	5090		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//20
SET_EXP_TIME	5098		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//21
SET_EXP_TIME	50A0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//22
SET_EXP_TIME	50A8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//23
SET_EXP_TIME	50B0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//24
SET_EXP_TIME	50B8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//25
SET_EXP_TIME	50C0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//26
SET_EXP_TIME	50C8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//27
SET_EXP_TIME	50D0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//28
SET_EXP_TIME	50D8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//29
SET_EXP_TIME	50E0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//30
SET_EXP_TIME	50E8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//31
SET_EXP_TIME	50F0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//32
SET_EXP_TIME	50F8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//33
SET_EXP_TIME	5100		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//34
SET_EXP_TIME	5108		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//35
SET_EXP_TIME	5110		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//36
SET_EXP_TIME	5118		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//37
SET_EXP_TIME	5120		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//38
SET_EXP_TIME	5128		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//39
SET_EXP_TIME	5130		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//40
SET_EXP_TIME	5138		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//41
SET_EXP_TIME	5140		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//42
SET_EXP_TIME	5148		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//43
SET_EXP_TIME	5150		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//44
SET_EXP_TIME	5158		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//45
SET_EXP_TIME	5160		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//46
SET_EXP_TIME	5168		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//47
SET_EXP_TIME	5170		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//48
SET_EXP_TIME	5178		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//49
SET_EXP_TIME	5180		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//50
SET_EXP_TIME	5188		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//51
SET_EXP_TIME	5190		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//52
SET_EXP_TIME	5198		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//53
SET_EXP_TIME	51A0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//54
SET_EXP_TIME	51A8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//55
SET_EXP_TIME	51B0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//56
SET_EXP_TIME	51B8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//57
SET_EXP_TIME	51C0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//58
SET_EXP_TIME	51C8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//59
SET_EXP_TIME	51D0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//60
SET_EXP_TIME	51D8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//61
SET_EXP_TIME	51E0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//62
SET_EXP_TIME	51E8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//63
SET_EXP_TIME	51F0		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//64
SET_EXP_TIME	51F8		// Exposure-LUT address
SET_LED	2A43	022A	4427		// Update Shutter Offset value
HOME_SHU
CCD_START
CNC
//
SET_OBSERV_ID	F7
WAIT_LOOP:	WAIT	7530
	CNC
	JMP	WAIT_LOOP	