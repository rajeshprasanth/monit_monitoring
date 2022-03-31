#!/bin/bash
#=================================================================
# Written on Thu Mar 31 04:54:55 IST 2022
# Author: Rajesh Prashanth <rajeshprasanth@rediffmail.com>
# Purpose: This script determine the health of given disk
#=================================================================
#
export disk_partition=$1

usage() {
    echo "Usage : hdd_health.sh [disk_partition]"
}

if [ $# -ne 1 ] ; then
        usage
        exit 1;
fi

status=`/usr/sbin/smartctl -H /dev/$disk_partition | grep overall-health | awk 'match($0,"result:"){print substr($0,RSTART+8,6)}'`
if [ "$status" = "PASSED" ]; then
    exit_code=0
else
    exit_code=1
fi
echo "$status"
exit $exit_code
