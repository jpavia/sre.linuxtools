#!/bin/bash

count=0

part1=`ps -aeo cmd |grep epds2 | awk '{print $3}' |sort | uniq -c | sort -k 1,1n |grep -v ' 1 '|sed 's/\-f//g' |awk '{print $2}'|grep -v echo | grep -v E`
part2=`ps -aeo cmd |grep epds2 | awk '{print $2}' |sort | uniq -c | sort -k 1,1n |grep -v ' 1 '|sed 's/\-f//g' |awk '{print $2}'|grep -v echo | grep -v -- '-p'`

for each in $part1 $part2
do
    if [ ${count} -eq 0 ]; then
	 products="$each"
    else
	 products="`echo -n $products`,$each"
    fi
    count=1
done

if [ ${count} -eq 1 ]; then
	echo "WARNING: Multiple DSes per product running on same host: $products"
else
	echo "OK: Multiple DSes per product not found"
fi

exit $count

