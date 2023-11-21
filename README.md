# SUIT SIMULATOR

**calcVol_synoptic.py**: Calculate the datavolume and time duration for a program sequence.

## Usage

The main script is `calcVol.py`, which requires the following arguments:

- **Program sequence file**: Provide the path to the program sequence file. A sample script is provided within the `program_sequences` folder.
- **X1 location**: Specify the X1 location of the ROI.
- **Y2 location**: Specify the Y1 location of the ROI.
- **delta X**: Define the length in the X-axis for the ROI.
- **delta Y**: Define the length in the Y-axis for the ROI.

Optional Arguments:

- **overscan**: Specify the overscan pixels (one side). The default value is 14.
- **cycle**: Specify the cycle number. If you need to adjust the cycle number to fine-tune the data volume.
- **roi seq**: Specify the ROI sequence number for fine-tuning purposes. This option is only configured for synoptic modes.

Output will be shown in the prompt and also save in `calVol_output.csv` file. Frame by frame output is in `frame_by_frame.csv`.

##SAMPLE 

 ` ./calcVol.py /home/suitpoc2/suitDataVolumeCalc/program_sequences/Synoptic_4Output_100Gb_v9.asm 1691 1721 704 704 ` is a sample entry.  

 ` ./calcVol.py /home/suitpoc2/suitDataVolumeCalc/program_sequences/Synoptic_4Output_100Gb_v9.asm 1691 1721 704 704 --overscan 28 --cycle 3 --roiseq 100 ` is a sample entry for overriding the cycle number in the program sequence to 2 and ROI sequence number to 100 (in the provided program sequence, the cycle number is 13 and roi sequence number is 88).
