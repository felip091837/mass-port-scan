#!/bin/bash

if [ $# != 2 ]
then
        echo "### Mass PortScan by EL1S1uM ###"
        echo "Uso: $0 ips.txt ports.txt"
else

for i in $(cat $1)
do
        for y in $(cat $2)
        do
                netcat -vnz -w 1 $i $y &>> result.txt
                cat result.txt | grep 'open' | cut -d ' ' -f 2,3,4,5 | sort -u > aux.txt
                touch aux2.txt
                var=$(diff aux.txt aux2.txt)

                if [ "$var" != "" ]
                then
                        clear
                        cat result.txt | grep 'open' | cut -d ' ' -f 2,3,4,5 | sort -u
                        cat result.txt | grep 'open' | cut -d ' ' -f 2,3,4,5 | sort -u > aux2.txt
                fi

        done
done

cat result.txt | grep 'open' | sort -u | cut -d ' ' -f 2,3,4,5 > open.txt && rm result.txt && rm aux.txt && rm aux2.txt
echo
echo "IPs disponíveis em: open.txt"

fi