#!/bin/bash
source "/usr/lib/smartlog/smartlog.sh"

TYPEOUT=true
tip "Welcome to the summation script"
tip "Author: Dennis Castleberry <dcastl2@lsu.edu>"
tip "Louisiana State University, LDMC 2019"
TYPEOUT=false

# Print a usage message, then exit.
usage () {
  echo "$0 [-a num] [-b num] [-c num]"
  exit
}

# Set START, STOP, STEP to initial values.
START=1
STOP=10
STEP=1;

# Handle options. Having a colon after the letter indicates that it
# takes a value, which can be gotten from the OPTARG environment
# variable.
while getopts ":a:b:c:" opt; do
  case $opt in
     a) START=$OPTARG;;
     b) STOP=$OPTARG;;
     c) STEP=$OPTARG;;
    \?) die "Invalid option: -$OPTARG" >&2;;
  esac
done

if [ -z $START ]
then
  usage;
fi
tip "Using start value $START"

if [ -z $STOP ]
then
  usage;
fi
tip "Using stop value $STOP"

if [ -z $STEP ]
then
  usage;
fi
tip "Using step value $STEP"

sum=0;
for ((i=$START; $i<=$STOP; i=$i+$STEP))
do
  let sum=$sum+$i
done

tip "The sum is: $sum"
tip "Thank you for using the summation script"
