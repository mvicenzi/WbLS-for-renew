#!/bin/bash

########################
# Functions:
# 1. This script transfer data from HothDAQ to MVD
# 2. This script convert binary into root

# Usage:
#     bash get_data.sh
#########################


#======================================
# GLOBAL PARAMETERS (you don't need to change it very often)
DAQ_DIR=/home/rootless/ToolApplication
echo "enter full directory where root files will be stored (google drive)"
read MVD_DIR
echo "enter user for proxy jump"
read PROXY_USER
DAQ_USER=rootless
DAQ_IP=130.199.33.252
GATEWAY=gateway.phy.bnl.gov
#======================================

RUN_TYPE='renew'
echo 'enter group name: '
read GROUP
# note:
#     muon stores muon data
#     calibration stores led, alpha lightbulb, ...
#     debug store test data
#     alpha stores alpha lightbulb
#     [create your own]


#if [ $RUN_TYPE = "geco" ]; then
#    echo "Do you want to convert geco log to csv file (1: yes, 0: no)?"
#    read DO_CSV

    
DO_ROOTER=1

echo "Start transfering renew data for group $GROUP"

function transfer_data() {
    if [ $RUN_TYPE != "geco" ]; then
		output_dir=`pwd`
		scp -oProxyJump=${PROXY_USER}@${GATEWAY} "${DAQ_USER}@${DAQ_IP}:${DAQ_DIR}/*${RUN_TYPE}_*${GROUP}*.bin" $output_dir
		find ${output_dir}/*${RUN_TYPE}*${GROUP}*.bin -type f > tmp.list
    fi
    
}

function run_rooter() {

	output_dir=${MVD_DIR}/
	while read fpath; do
	    case "$fpath" in \#*) continue ;; esac
	    echo " "
	    echo "processing $fpath ..."
	    python src/raw_data_rooter.py --if_path=${fpath} --output_dir=${output_dir}
		rm ${fpath}
	done < tmp.list
}


# execute the transfer functions
transfer_data

# execute the rooter
if [ $DO_ROOTER -eq 1 ]; then
    source env/bin/activate
    run_rooter
fi


