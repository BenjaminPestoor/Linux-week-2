#!/bin/bash
echo "script week 2"
mkdir -p maand
mkdir -p week

dir1=$1
groep=$2

if [[ $2 = "maand" ]]
then
	cd $dir1
	for i in *.png; do
		date1=$(date -f $i +%B)
		md51=$(md5sum $i)
		mkdir -p ./maand/$date1
		cp $i ./maand/$date1
		cd ./maand/$date1
		md52=$(md5sum $i)
		cd -
		if [ "$md51" == "$md52" ]
		then
			rm -f $i
		else
			echo "$1 is not the same"
		fi
        done
fi

if [[ $2 = "week" ]]
then
	cd $dir1
        for i in *.png; do
                date1=$(date -f $i +%W)
                md51=$(md5sum $i)
                mkdir -p ./week/$date1
                cp $i ./week/$date1
                cd ./week/$date1
                md52=$(md5sum $i)
                cd -
                if [ "$md51" == "$md52" ]
                then
                        rm -f $i
                else
                        echo "$1 is not the same"
                fi
        done
fi
