#!/bin/bash

for DTS_FILE in *-overlay.dts
do
    DTBO_FILE=${DTS_FILE/-overlay.dts/.dtbo}
    rm -f $DTBO_FILE
    dtc -I dts -O dtb -o "$DTBO_FILE" $DTS_FILE
done
