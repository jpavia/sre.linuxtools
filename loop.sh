#!/bin/bash
# useful script for looping commands

# Usage: loop.sh <iterations> <command> <args>

E_ARGERROR=85
MINPARAMS=2

i="$1"
command="$2"

if [ $# -lt "$MINPARAMS" ]
then 
   echo "!ERROR!"
   echo "Usage: `basename $0` <iterations> <command> <args>"
   exit $E_ARGERROR
fi
args=""
if [ $# -eq 3 ]
then
   args="$3"
fi

if [ $i = -1 ]
then 
i=99999999999999999999999
fi 
echo "
Running $i iterations of $command $args
" 
if [ `which $command`  ]
then 
   command=`which $command`
   for ((a=1; a <= $i ; a++))
   do
      ecko "$command $args" #&
   done
fi

