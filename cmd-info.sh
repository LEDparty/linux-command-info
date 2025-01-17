#!/bin/bash
#tels -ls user if a script/binary exists, where it is located, and
#if executable privledges are turned on

SCRIPT=$0
PROGRAM_NAME=$1

#instructions
if [ $# -lt 1 ]; then
	echo "Usage:${SCRIPT##*/} [program-name]"
	exit 1
fi 

#runs the scripts from the home directory without changing
#the one you are logged in to: this ensures that you can run
#this script from anywhere in the OS without getting denied permission
#to write and erase the temporary file needed for scrip to work
cd $HOME

#creates file listing path directories
echo $PATH | awk 'BEGIN {RS=":"} {print}' | sed '/^$/d' > path-dirs

#loops through directories and tels -ls user if file exists but is not executable
while read -r line; do
	if [ -f "$line/$1" ] && ! [ -x "$line/$1" ]; then
		echo -e "\n${PROGRAM_NAME##*/} is in \$PATH but is NOT executable\n"
		echo -e "Location: $line\n"
		echo -e "Path to file: $line/$1\n"
		SIZE=$(ls -l "$line/$1" | awk '{print $5}')
		echo -e "File Size: ${SIZE%%$line/$1}\n"
		TYPE=$(file "$line/$1")
		echo -e "File Type:${TYPE##*:}\n"
		#clean-up
		rm path-dirs
		exit 0
	fi
done < path-dirs

#runs if program is ready to use
while read -r line; do
	if [ -x "$line/$1" ]; then
		echo -e "\n${PROGRAM_NAME##*/} is in \$PATH and is executable\n"
		echo -e "Location: $line\n"
		echo -e "Path to file: $line/$1\n"
		SIZE=$(ls -l "$line/$1" | awk '{print $5}')
		echo -e "File Size: ${SIZE%%$line/$1} Bytes\n"
		TYPE=$(file "$line/$1")
		echo -e "File Type:${TYPE##*:}\n"
		#clean-up
		rm path-dirs
		exit 0
	fi
done < path-dirs

echo "${PROGRAM_NAME##*/} does not exist in \$PATH"

rm path-dirs
