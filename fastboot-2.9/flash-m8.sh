#!/bin/sh
avrdude -P usb -c usbasp -p m8 -U lfuse:w:0x2c:m -U hfuse:w:0xdc:m
avrdude -P usb -c usbasp -p m8 -U flash:w:bootload.hex

