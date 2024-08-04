#!/bin/bash
INTERFACE="eth0"
Op_file="/tmp/network_capture.pcap"

sudo tcpdump -i $INTERFACE -w $Op_file -c 1000

