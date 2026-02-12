#!/bin/bash

DIR=$1

if [[ ! -d "${DIR}" ]]; then
	echo "Directory does not exist!" >&2;
	exit 1
fi

EMPTY_FOUND=false 
for i in "$DIR"/*; do
	
	if [[ -f "${i}" && ! -s "${i}" ]]; then
		if [[ "${EMPTY_FOUND}" == false ]]; then
			echo -e "The following file(s) are empty! Do you want to delete them?\n"
		fi
		echo "${i##*/}"
		EMPTY_FOUND=true
	fi
done

if [[ "${EMPTY_FOUND}" == false ]]; then
	echo "No empty files found!" >&2;
	exit 1
fi


while true; do
	
	read -r DELETE
	if [[ ! "${DELETE}" =~ ^[YNyn]$ ]]; then
                echo -e "y for yes and n for no!\n" >&2;
		continue
	elif [[ "${DELETE}" =~ ^[yY]$ ]]; then
		for i in "$DIR"/*; do
			if [[ -f "${i}" && ! -s "${i}" ]]; then
				rm "${i}"
				echo "removed file: ${i##*/}"
			fi
		done
		exit 0
        else
		exit 0
        fi
done
