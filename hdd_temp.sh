#!/bin/bash
#=================================================================
# Written on Thu Mar 31 04:54:55 IST 2022
# Author: Rajesh Prashanth <rajeshprasanth@rediffmail.com>
# Purpose: This script determine the temperature of given disk
#=================================================================
#
export disk_partition=$1
export threshold=$2

usage() {
    echo "Usage : hdd_temp.sh [disk_partition] [threshold]"
}

if [ $# -ne 2 ] ; then
        usage
        exit 1;
fi

temperature=`/usr/sbin/smartctl -a /dev/$disk_partition | grep Temperature_Celsius | awk -F " " '{print  $10}'`

if [ "$temperature" -gt $threshold ]; then
    exit_code=1
    echo "WARNING|Temp(deg):$temperature|Thres(deg):$threshold"
else
    exit_code=0
    echo "SAFE|Temp(deg):$temperature|Thres(deg):$threshold"
fi
exit $exit_code
