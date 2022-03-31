#!/bin/bash
#=================================================================
# Written on Thu Mar 31 04:54:55 IST 2022
# Author: Rajesh Prashanth <rajeshprasanth@rediffmail.com>
# Purpose: This script determine the temperature of GPU
#=================================================================
#
export threshold=$1

usage() {
    echo "Usage : gpu_temp.sh [threshold]"
}

if [ $# -ne 1 ] ; then
        usage
        exit 1;
fi

temperature=`sensors|grep -A 1 "GPU core:"|grep temp1: |gawk {'print $2'}|gawk -F"°C" {'print $1'}|gawk -F"+" {'print $2'}|gawk -F"." {'print $1'}`

if [ $temperature -gt $threshold ]; then
    exit_code=1
    echo "WARNING|Temp(deg):$temperature|Thres(deg):$threshold"
else
    exit_code=0
    echo "SAFE|Temp(deg):$temperature|Thres(deg):$threshold"
fi
exit $exit_code
