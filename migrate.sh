#!/bin/bash
#
systemctl stop monit
cp /etc/monitrc /etc/monitrc_$(date +"%Y%m%d_%H_%M_%S")
cp monitrc /etc/monitrc
systemctl start monit
