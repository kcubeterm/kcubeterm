#!/bin/bash
wget https://dl.bintray.com/termux/termux-packages-24/dists/stable/main/binary-aarch64/Packages
IFS=$'\n'
out=aarch64_sum.txt
for line in `cat Packages`; do
        if `echo $line | grep 'Package' > /dev/null`;then
                package=`echo $line | cut -d' ' -f2`
                printf "$package " >> $out

        elif `echo $line | grep 'SHA1' > /dev/null`;then
                checksum=`echo $line | cut -d' ' -f2`
                printf $checksum >> $out
                echo >> $out
        fi

        #echo $line
done
mkdir output
cp aarch64* output
