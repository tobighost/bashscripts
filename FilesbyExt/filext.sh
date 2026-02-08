#!/bin/bash

DIR=$1
EXT=$2

if [[ ! $DIR || ! $EXT ]]; then
	echo "No Directory or Extension provided!" >&2;
	exit 1
fi

if [[ ! -e $DIR ]]; then
	echo "Directory does not exist!" >&2;
	exit 1
fi

if [[ $EXT == *.* ]]; then
	echo -e "Error!\n" >&2;
        echo "Dot detected! write the extension without a point at the beginning!" >&2;
        exit 1
fi

NUMOFFILES=$(find $DIR -type f -name "*.$EXT" | wc -l)

echo "The number of files by extension: $EXT is $NUMOFFILES"
