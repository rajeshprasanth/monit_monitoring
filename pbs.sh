#!/bin/bash
#
#
munge_status=`systemctl is-active --quiet munge`
munge_status_return=$?

trqauthd_status=`systemctl is-active --quiet trqauthd`
trqauthd_status_return=$?

pbs_server_status=`systemctl is-active --quiet pbs_server`
pbs_server_status_return=$?

pbs_sched_status=`systemctl is-active --quiet pbs_sched`
pbs_sched_status_return=$?

pbs_mom_status=`systemctl is-active --quiet pbs_mom`
pbs_mom_status_return=$?


if [ $munge_status_return -eq 0 ] || [ $trqauthd_status_return -eq 0 ] || [ $pbs_server_status_return -eq 0 ] || [ $pbs_sched_status_return -eq 0 ] || [ $pbs_mom_status_return -eq 0 ] ; then
    echo "PASSED"
    exit 0
else
    echo "FAILED"
    exit 3
fi
