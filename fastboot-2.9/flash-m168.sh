#!/bin/sh
# avrdude -P usb -c usbasp -p m168 -U lfuse:w:0xd2:m -U hfuse:w:0xdc:m -U efuse:w:0x06:m
avrdude -P usb -c usbasp -p m168 -U flash:w:bootload.hex

