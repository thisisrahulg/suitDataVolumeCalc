#!/usr/bin/python3

'''
Author: Rahul G <rahulg.astro@gmail.com>
Purpose: Reads command sequence and calculates data volume and duration. This script can account for any type of loop.
Date: 10-06-2023

Comments: > Considers rotation time, exposure time and read out time.
          > The file size is accurate.
          > Read out time is the least accurate.
          > Need to change the read out time to accurate one.
V_2.0   :
          > more accurate readout time added
          > wheel rotation is not linear
          for 1 rotation of            -> 1.570s
          for 2 rotation of same wheel -> 2.368s
          for 3 rotation of same wheel -> 3.345s
          for 4 rotation of same wheel -> 4.138s
          > ccd clear time of 200ms is added.
          > delay time for different exposure is added from table

Changes added on Nov 1 2023:
          > Added feature to play around the cycle number and roi sequence number
          > read out time and data volume based on different roi location and size is added
          > output redirected to calcVol_output.csv file
'''
import numpy as np
import sys,os
import pandas as pd
import matplotlib.pyplot as plt
import warnings
from ccd_readout_code import *

warnings.filterwarnings('ignore')

def read_fdata(data):
    full_data = []
    end_flag = 0
    for ind,line in enumerate(data.readlines()):
        line = line.split('//')[0]
        smallline = line.strip().split('\t')
        temp = [ind,smallline]
        full_data.append(temp)

    return full_data

def calc_sizes(fsize,set_bin,dx,dy,overscan):
    if fsize == 0:
        if set_bin == 0:
            dx = 4096 + 2*50 + overscan*2
            dy = 4096 + 2*20
        elif set_bin == 1:
            dx = 2048 + 2*25 + overscan
            dy = 2048 + 2*10
        else:
            print('Invalid frame type and bin size')
            sys.exit(-1)

    elif fsize == 1:
        dx = dx + 2*50 + overscan*2

    else:
        print('Invalid frame type and bin size')
        sys.exit(-1)

    return dx*dy*2. + 64.


def exp_time(exp_table,ID):
    if ID != '':
        # print(float(exp_table['EXP_VAL'][exp_table['EXP_ID'] == ID]))
        return float(exp_table['FULL_MOVE'][exp_table['EXP_ID'] == ID])/1000.0
    else:
        return 0

#def delay_time(delay_table,exp_table,fsize,set_bin,expid):
#    if expid != '':
#        exp = exp_time(exp_table,expid)
#    else:
#        exp = 0
#    delay = delay_table['DELAY'][(delay_table['ROI_FF'] == int(fsize)) & (delay_table['BIN'] == int(set_bin)) & (delay_table['EXP'] == int(exp*1000))]
#    if len(delay) == 0:
#        delay = 1200.0 # if exposure is not in list, give the average value of delay
#
#    return float(delay)/1000.0



def wheel_move(fw1_past,fw2_past,fw1_now,fw2_now):
    #multiplier = [0.000,1.570,2.368,3.345,4.138]
    #multiplier = [0.000,1.,1.,1.,1.]
    multiplier = np.array([0.00,1.5,1.84+0.5,2.72+0.5,3.52+0.5]) #0.5 settling time
    check = [0,1,2,3,4]
    val1 = abs(float(fw1_now) - float(fw1_past))
    val2 = abs(float(fw2_now) - float(fw2_past))

    if val1 > 4:
       val1 = abs(8 - val1)
    if val2 > 4:
       val2 = abs( 8 - val2)
    if int(val1) not in check:
        print('Invalid rotation of FW1')
        sys.exit()
    if int(val2) not in check:
        print('Invalid rotation of FW2')
        sys.exit()
    val1 = multiplier[int(val1)]
    val2 = multiplier[int(val2)]
    #print(val1+val2)
    return val1+val2

def ccd_readout_time(output,fsize,set_bin,x1,y1,dx,dy,overscan):
    if fsize == 0:
        if set_bin == 0:
            # read_time = find_readout_time(0,20,4095,4095,overscan)
            return output*15.652571428571429 + 0.20679999999999998*2
            # return output*read_time +  0.20679999999999998
        elif set_bin == 1:
            # read_bintime = find_readout_time(0,20,2047,2047,overscan)
            #print('setbin1:',read_bintime)
            # return output*7.928685714285714 + 0.20679999999999998*2 #8.916  # 8.159
            return output*8.916 + 0.20679999999999998*2 #8.916  # 8.159
            # return output*read_bintime  +  0.20679999999999998
        else:
            print('Invalid frame type and bin size')
            sys.exit(-1)
    elif fsize == 1:
            read_roitime = find_readout_time(x1,y1,dx,dy,overscan)
            #read_roitime = 2.269
           # print('roi',read_roitime)
            return output*read_roitime + 0.20679999999999998*2
    else:
        print('Invalid frame type and bin size')
        sys.exit(-1)


def find_cmd(full_data,index):
    cmd = [itm[1] for itm in full_data if itm[0] == index ]
    return cmd[0]

def find_idx(full_data,cmd):
    index = [itm[0] for itm in full_data if cmd in itm[1]]
    return index[0]


def check_cnc_in_a_jumploop(full_data, loop_name, idx):
    now_cmd = find_cmd(full_data,idx)
    while 'JMP' not in now_cmd:
        now_cmd = find_cmd(full_data,idx)
        if 'CNC' in now_cmd:
            return True
        else:
            idx +=1

def process_sequence(full_cmds, indices, exp_table, output, args):
    n_fullframe = 0
    n_binned = 0
    n_roi = 0
    fw1_past = None
    fw1_now = None
    fw2_now = None
    fw2_past = None
    set_bin = None
    fsize = None
    cycle = None
    seq = None
    ftype= None
    calc_ttime = 0
    calc_size = 0
    min30_time = 0
    min30_size = 0
    size_list = []
    seq_val = []
    calb_time = 0
    calb_size = 0
    frame_count = 0
    expid = None
    obsid = None
    onecycle,twocycle,firstcycle_time,firstcycle_size,nextcycle_size,nextcycle_time = 0,0,0,0,0,0
    idx = indices[0]
    columns = ['FRAME_NO', 'OBSERV_ID', 'BIN_EN', 'FRAME_TYPE', 'FW1', 'FW2', 'CYCLE_NO', 'SEQ_NO','EXP_TIME']
    new_row = []
    binned_time = []
    prev_time = 0
    now_time = 0
    old_seq  = None
    old_cycle  = None
    ledflag = False
    homeshu = False
    cnc_count = 1

    while idx != indices[-1]+1:

        now_cmd = find_cmd(full_data,idx)
        if 'JUMP_EXT:' in now_cmd: #break at flare routineS
            calc_ttime += 2.0/1000.
            break
        elif 'SET_FRAME_TYPE' in now_cmd:
            calc_ttime += 2.0/1000.
            ftype = str(now_cmd[-1])
            if ftype == '00':
                calb_time = calc_ttime
                calb_size = calc_size
        elif 'SET_CYCLE' in now_cmd:
            calc_ttime += 2.0/1000.
            cycle = int(now_cmd[-1],16)
            if args.cycle is not None:
                cycle = args.cycle
            cycle_val = cycle
            old_cycle = cycle
        elif 'SET_FRAME_SIZE' in now_cmd:
            calc_ttime += 2.0/1000.
            fsize = int(now_cmd[-1],16)
        elif 'SET_BIN' in now_cmd:
            calc_ttime += 2.0/1000.
            set_bin = int(now_cmd[-1],16)
        elif 'SET_EXP_TIME' in now_cmd:
            calc_ttime += 2.0/1000.
            expid = str(now_cmd[-1])
        elif 'MOVE_FW1' in now_cmd:
            calc_ttime += 2.0/1000.
            fw1_now = int(now_cmd[-1],16)
            if not fw1_past:
                fw1_past = fw1_now

        elif 'MOVE_FW2' in now_cmd:
            calc_ttime += 2.0/1000.
            fw2_now = int(now_cmd[-1],16)
            if not fw2_past:
                fw2_past = fw2_now
        elif 'SET_OBSERV_ID' in now_cmd:
            calc_ttime += 2.0/1000.
            obsid = str(now_cmd[-1])
            if obsid  == 'F7':
                print('Infinite loop wait, exiting the calculation')
                break
        elif 'SET_LED' in now_cmd:
            calc_ttime += 2.0/1000.
            if ('2A43','022A', '4427') in now_cmd:
                ledflag = True
            # Sanity check: filter wheel settings should be there.
            # calc_ttime += 1.57

        elif 'HOME_SHU' in now_cmd:
            calc_ttime += 2.0/1000.
            homeshu = True

        elif 'WAIT' in now_cmd:
            calc_ttime += 2.0/1000.
            # print(now_cmd)
            #print(int(now_cmd[-1],16)*2)
            calc_ttime += (int(now_cmd[-1],16)*2.)/1000.
            min30_time += (int(now_cmd[-1],16)*2.)/1000.

        elif 'JMP' in now_cmd:
            calc_ttime += 2.0/1000.
            if str(now_cmd[-1]) != 'REPEAT_CAL' and str(now_cmd[-1]) != 'REPEAT_BOOT':
                idx = find_idx(full_data,str(now_cmd[-1])+':')
                check_cnc_in_a_jumploop(full_data,str(now_cmd[-1])+':', idx)
                continue
            else:
                print('REPEAT_CAL or REPEAT BOOT jump reached.' )
                break

        elif 'SET_SEQ' in now_cmd:
            calc_ttime += 2.0/1000.
            seq = int(now_cmd[-1],16)
            old_seq = seq
            # print('seq',seq)
            if seq !=3 and args.roiseq is not None:
                seq = args.roiseq
            if seq != 3 and seq not in seq_val:
                seq_val.append(seq)
        elif 'DCR_SEQ' in now_cmd:
            old_seq = seq
            calc_ttime += 2.0/1000.
            seq -= 1

            #print(seq)
        elif 'FIND_FLARE_SELF' in now_cmd or 'FIND_FLARE_EXT' in now_cmd:
            # if prev_bin != 1:
            #     print(f'Line: {idx+1}')
            #     print('Binned image is not taken before this. Invalid sequence')
            #     sys.exit()
            calc_ttime += 2.0/1000.
            calc_ttime += 1.4
            min30_time += 1.4
        elif 'JNZS' in now_cmd:
            calc_ttime += 2.0/1000.
            #Sanity check for Decrement in seq is happening to prevent Infinite loop
            if old_seq == seq:
                print(f'Line: {idx+1}')
                print('Decrement does not happen. Sanity check failed. Error in program sequence')
                sys.exit()
            if seq != 0:
                idx = find_idx(full_data,str(now_cmd[-1])+':')
                continue
        elif 'CNC' in now_cmd:
            cnc_count = 2
        elif 'CCD_START' in now_cmd:
            prev_bin = 1 if set_bin == 1 else 0

            if cnc_count == 0:
                print(f'Line: {idx+1}')
                print('CNC command should be there after every images')
                sys.exit()

            cnc_count -= 1

            # Sanity check: filter wheel settings should be there.
            if fw1_past == None or fw2_past == None:
                print(f'Line: {idx+1}')
                print('Filter wheel setting is not found before CCD_START, ')
                sys.exit()
            # Sanity check: other settings should be there.
            elif set_bin == None or expid == None or obsid == None or ftype == None or fsize == None:
                print(f'Line: {idx+1}')
                print(f'Fundamental settings not found before CCD START')
                sys.exit()
            elif set_bin == 1 and fsize == 1:
                print(f'Line: {idx+1}')
                print('Binning enabled for ROI mode. Invalid sequence')
                sys.exit()
            # Sanity check for SET LED and HOME_SHU after ROI
            elif prev_bin == 1 and not ledflag and not homeshu:
                print(f'Line: {idx+1}')
                print('After ROI mode, SET LED and HOME_SHU not found')
                sys.exit()

            elif set_bin == 1 and fw1_now != 1 and fw2_now != 0 and args.synoptic:
                    print(f'Line: {idx+1}')
                    print('Binned image should be NB3 filter')
                    sys.exit()

            #Setting prev_bin to 1 if current image in ROI
            prev_bin = 1 if set_bin == 1 else 0

            calc_ttime += 2.0/1000.
            calc_ttime += (2*(204.8))/1000.

            #unknown delay per frame
            calc_ttime += 240/1000.

            frame_count +=1
            if fsize == 0 and set_bin == 0:
                n_fullframe +=1

            elif fsize == 0 and set_bin == 1:
                n_binned +=1

            elif fsize == 1:
                n_roi +=1
            exp_time_ = exp_time(exp_table,expid)
            #frame = [ frame_count, obsid, set_bin, ftype, fw1_now, fw2_now, calc_ttime, calc_size, cycle, seq,exp_time ]
            frame = [frame_count, obsid, set_bin, ftype, fw1_now, fw2_now, cycle, seq,exp_time_]
            new_row.append(frame)
            calc_ttime += wheel_move(fw1_past,fw2_past,fw1_now,fw2_now)
            calc_ttime += exp_time_
            calc_ttime += ccd_readout_time(output,fsize,set_bin,args.X1,args.Y1,args.dx,args.dy,args.overscan)

            if fsize == 0 and set_bin == 1 and onecycle == 0:
                now_time = calc_ttime
                difftime = now_time - prev_time
                prev_time = now_time
                binned_time.append(difftime)
            calc_size += calc_sizes(fsize,set_bin,args.dx,args.dy,args.overscan)

            #min30_time += delay_time(delay_table,exp_table,fsize,set_bin,expid)
            min30_time += wheel_move(fw1_past,fw2_past,fw1_now,fw2_now)
            #min30_time += exp_time(exp_table,expid)
            min30_time += ccd_readout_time(output,fsize,set_bin,args.X1,args.Y1,args.dx,args.dy,args.overscan)

            min30_size += calc_sizes(fsize,set_bin,args.dx,args.dy,args.overscan)

            fw1_past = fw1_now
            fw2_past = fw2_now

            if min30_time>1800.0:
                #print(min30_time/60.,0.5*((min30_size)*(8.0e-9)))
                size_list.append(0.5*((min30_size)*(8.0e-9)))
                min30_time = 0
                min30_size = 0

        elif 'DCR_CYCLE' in now_cmd:
            old_cycle = cycle
            calc_ttime += 2.0/1000.
            # print(cycle)
            cycle -= 1
            if onecycle == 0:
                firstcycle_time = calc_ttime
                firstcycle_size = calc_size
                onecycle = 1
            elif twocycle == 0 and onecycle == 1:
                nextcycle_time = calc_ttime
                nextcycle_size = calc_size
                twocycle = 1

        elif 'JNZC' in now_cmd:
            #Sanity check for Decrement in cycle is happening to prevent Infinite loop
            if old_cycle == cycle:
                print('Decrement in cycle does not happen. Sanity check failed')
                sys.exit()
            calc_ttime += 2.0/1000.
            if cycle != 0:
                idx = find_idx(full_data,str(now_cmd[-1]+':'))
                continue
        if len(now_cmd) == 1 and '' in now_cmd:
            idx += 1
            continue
        calc_ttime += 2.0/1000.
        idx += 1

    print('>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<')
    print('\n...CALCULATION COMPLETED...\n')
    print(f'TOTAL FRAMES: {frame_count}')

    print('Breakdown(FF,binned,ROI)')
    print(n_fullframe,n_binned,n_roi)
    print('\n Binned Frame time difference\n')
    print(binned_time)

    all_frames = pd.DataFrame(new_row, columns=columns)
    all_frames.to_csv(f'{os.path.basename(args.sequenceName)}_frame_by_frame.csv', index=False, header=True)
    if ftype != '00':
        calb_time = calc_ttime
        calb_size = calc_size

    if len(seq_val) == 0:
        seq_val = 0

    if onecycle == 1 and twocycle == 1:
        print(f'Percycle_ROI+FF Time: {(nextcycle_time-firstcycle_time)/(60.*60.)} Hours')
        print(f'Percycle_ROI+FF Size: {0.5*(((nextcycle_size-firstcycle_size)*(8.0))/(1024.*1024.*1024.))} Gb')
        onecycle_time = (nextcycle_time-firstcycle_time)/(60.*60.)
        onecycle_size = 0.5*(((nextcycle_size-firstcycle_size)*(8.0))/(1024.*1024.*1024.))

    else:
        print('Only one cycle')
        onecycle_time = calc_ttime/(60.*60.)
        onecycle_size = (((calc_size)*(8.0))/(1024.*1024.*1024.))/1.7
        cycle_val = 1
    size_list = np.array(size_list)
    s1 = f'Total duration in Seconds: {calc_ttime}\n'
    s2 = f'Total duration in Hours: {calc_ttime/(60.*60.)}\n'
    s3 = f'Total File size in bits after compression: {0.5*(((calc_size)*(8.0))/(1024.*1024.*1024.))} Gb\n\n'
    if len(size_list) != 0:
        s4 = f'Mean 30 min data volume: {np.mean(size_list)} Gb\n'
        s5 = f'Maximum of 30 min data volume: {np.max(size_list)} Gb\n'
        s6 = f'Minimun of 30 min data volume: {np.min(size_list)} Gb\n'
        mean = np.mean(size_list)
        maxx = np.max(size_list)
        minn = np.min(size_list)
        string = s1 + s2 + s3 + s4 + s5 + s6
    else:
        string = s1 + s2 + s3
        mean = 0.5*(((calc_size)*(8.0))/(1024.*1024.*1024.))
        maxx = 0.5*(((calc_size)*(8.0))/(1024.*1024.*1024.))
        minn = 0.5*(((calc_size)*(8.0))/(1024.*1024.*1024.))

    print(f'SEQ:{seq_val}      CYCLE:{cycle_val}')
    print(string)
    dict = {
        'FILE_NAME': os.path.basename(args.sequenceName),
        'TOTAL_DURATION' : [calc_ttime/(60.*60.)],
        'TOTAL_SIZE_IN_AFTER_COMPRESSION_(Gib)': [0.5*(((calc_size)*(8.0))/(1024.*1024.*1024.))],
        'TOTAL_FRAMES': [frame_count],
        'CALB_TIME' : [calb_time/(60.*60.)],
        'CALB_SIZE' : [0.5*(((calb_size)*(8.0))/(1024.*1024.*1024.))],
        'TIME_PER_CYCLE' :[ onecycle_time],
        'SIZE_PER_CYCLE' :[onecycle_size],
        'N_CYCLE' : [cycle_val],
        'N_SEQ' : [seq_val],
        'T_FRAME':[frame_count],
        'N_BINNED':[n_binned],
        'N_FF':[n_fullframe],
        'N_ROI':[n_roi]
    }
    df = pd.DataFrame(dict)
    df.to_csv(f'{os.path.basename(args.sequenceName)}_calcVol_output.csv',mode='a',index=False,header=True)




if __name__ == '__main__':

    import argparse

    parser = argparse.ArgumentParser(description='Script to calculate the data volume and duration for a given SUIT program sequence')
    parser.add_argument('sequenceName', type=str, help='Program sequence full file path')
    parser.add_argument('X1', type=int, help='X1 position of ROI (default X1 = 1691)')
    parser.add_argument('Y1', type=int, help='Y1 position of ROI (default Y1 = 1721)')
    parser.add_argument('dx', type=int, help='size in x-axis for ROI (default = 704)')
    parser.add_argument('dy', type=int, help='size in y-axis for ROI( default = 704)')
    parser.add_argument('--overscan', type=int,default=14, help='number of overscan pixels( give the number on one side)')
    parser.add_argument('--cycle',default=None, type=int, help='Cycle number (if not given, it takes the cycle number in the program sequence')
    parser.add_argument('--roiseq',default=None, type=int, help='ROI sequence number (if not given, it takes the roi sequence number in the program sequence)')
    parser.add_argument('--synoptic',action='store_true', help='Flag for saying this is a synoptic mode')

    args = parser.parse_args()


    data = open(args.sequenceName, 'r')

    if '4output' in args.sequenceName.lower():
        output = 1
    elif '2output' in  args.sequenceName.lower():
        output = 2
    elif '1output' in args.sequenceName.lower():
        output = 4
    else:
        output = 1

    full_data= read_fdata(data)

    exp_table = pd.read_csv('exposure_table.csv')
    #delay_table = pd.read_csv('delay_details.csv')

    full_cmds = [itm[1] for itm in full_data]
    indices = [itm[0] for itm in full_data]
    process_sequence(full_cmds, indices, exp_table, output, args)
