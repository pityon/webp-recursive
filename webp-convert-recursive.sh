#!/bin/bash

# CONVERSION ARGUMENTS
PARAMS=('-m 6 -q 70 -mt -af -progress')
# PARAMS=('-m 6 -q 100 -z 9')
if [ $# -ne 0 ]; then
	PARAMS=$@;
fi

# DIRECTORY CHANGE
cd $(pwd)/tu_wpierdalac_grafiki

# ITERATION
find . \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.tif" -o -iname "*.tiff" \) -print0 | \
    while read -d $'\0' -r image; do
        # CALL METHOD
        ../bin/cwebp $PARAMS "$image" -o "${image%.*}".webp;
done

$SHELL