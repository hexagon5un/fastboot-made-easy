#!/bin/sh
avrdude -c usbasp -p attiny85 -P usb -U flash:w:bootload.hex
