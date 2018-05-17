#!/bin/bash
echo "script week 2"

dir1=$1
groep=$2

cd $dir1

for i in *.png *.bmp *.jpeg *.jpg; do
	if [[ $2 = "maand" ]]
	then
		date1=$(date -r $i +%B)
		mkdir -r maand
	elif [[ $2 = "week" ]]
	then
		date1=$(date -r $i +%W)
		mkdir -r week
	else
		echo "second variable must be maand or week"
	fi
	md51=$(md5sum $i)
	mkdir -p ./$2/$date1
	cp $i ./$2/$date1
	cd ./$2/$date1
	md52=$(md5sum $i)
	cd -
	if [ "$md51" == "$md52" ]
	then
		rm -f $i
	else
		echo "$1 is not the same"
	fi
done
