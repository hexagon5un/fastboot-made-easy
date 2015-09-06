#!/bin/sh
# avrdude -P usb -c usbasp -p m88 -U lfuse:w:0xec:m -U hfuse:w:0xdc:m -U efuse:w:0x04:m
avrdude -P usb -c usbasp -p m88 -U flash:w:bootload.hex

