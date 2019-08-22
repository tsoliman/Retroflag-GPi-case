#!/bin/bash

for DTS_FILE in *-overlay.dts
do
    DTBO_FILE=${DTS_FILE/-overlay.dts/.dtbo}
    rm -f $DTBO_FILE
    dtc -W no-unit_address_vs_reg -I dts -O dtb -o "$DTBO_FILE" $DTS_FILE
done
