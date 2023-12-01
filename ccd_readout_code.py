#!/usr/bin/env python3

"""
Script to calculate the CCD readout time based on the location and size of the ROI

"""
import sys


X0 = 2048
Y0 = 2048 + 20
PIXEL_READ_TIME = 1/280000
PIXEL_IGNORE_TIME = 1e-6

LINE_READ_TIME = 100e-6
LINE_IGNORE_TIME = 1e-4
UNDERSCAN = 50


def find_readout_time(x1,y1,dx,dy,overscan):
    x2 = x1 + dx
    y2 = y1 + dy
    
    if x2 > 4096 or y2 > 4096+39:
        print('Invalid coordinates of X2 or Y2')
        sys.exit(-1)
    if x1 < 0 or y1 < 20:
        print('Invalid coordinates of X1 or Y1')
        sys.exit(-1)
        
    if x2 < X0:
        shift = abs(x2 - X0)
        x1 = x1 + shift
        x2 = X0
    if y2 < Y0: 
        shift = abs(y2-Y0)
        y2 = Y0
        y1 = y1 + shift
    if x1 > X0: 
        shift = abs(x1-X0)
        x1 = X0
        x2 = x2 - shift
    if y1 > Y0:
        shift = abs(y1-Y0) 
        y1 = Y0
        y2 = y2 - shift
    
    lengthE = X0 - x1
    breadthE = Y0 - y1
    
    lengthF = x2 - X0
    breadthF = Y0 - y1

    lengthG = x2 - X0
    breadthG = y2 - Y0
    
    lengthH = X0 - x1
    breadthH = y2 - Y0
    
    areaE = lengthE*breadthE 
    areaF = lengthF*breadthF 
    areaG = lengthG*breadthG
    areaH = lengthH*breadthH 
    
    array = [areaE,areaF,areaG,areaH]
    maxIndex = array.index(max(array))
    if maxIndex == 0:
        A = lengthE
        D = breadthE
     
    elif maxIndex == 1:
        A = lengthF
        D = breadthF
    
    elif maxIndex == 2:
        A = lengthG
        D = breadthG
            
    elif maxIndex == 3:
        A = lengthH
        D = breadthH
    
    B = X0 - A
    C = Y0 - D
    
    E = overscan + UNDERSCAN
    totalLineReadTime = (PIXEL_READ_TIME*(A+E) + PIXEL_IGNORE_TIME*B)*D + D*LINE_READ_TIME + LINE_IGNORE_TIME*C
    #print(totalLineReadTime)
    return totalLineReadTime

if __name__ == '__main__':
    print('Checking random number') 
    print(find_readout_time(608,1908,320,320,14))
 
