#!/bin/sh
stty -onlcr -echo -F /dev/ttyRPMSG0
echo "---" > /dev/ttyRPMSG0
