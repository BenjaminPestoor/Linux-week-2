#!/bin/bash
echo "script week 2"

cd $1
dir1="$1"

shopt -s nullglob
shopt -s nocaseglob
number=0
for i in *.jpeg *.bmp *.png *.jpg; do
	if [[ $2 = "maand" ]]
	then
		date1=$(date -r $i +%B)
		mkdir -p maand
	elif [[ $2 = "week" ]]
	then
		date1=$(date -r $i +%W)
		mkdir -p week
	else
		echo "second variable must be maand or week"
	fi
	md51=$(md5sum $i)
	mkdir -p ./$2/$date1
	cp $i ./$2/$date1
	cd ./$2/$date1
	md52=$(md5sum $i)
	cd ~-
	if [ "$md51" == "$md52" ]
	then
		rm -f $i
	else
		echo "$1 is not the same"
	fi
	((number++))
done
if [[ $number < 1 ]]
then
	echo "there were no files to sort"
else
	echo "$number files were sorted"
fi
shopt -u nocaseglob
shopt -u nullglob
