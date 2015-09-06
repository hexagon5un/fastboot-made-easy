#!/bin/sh

# Get AVR architecture
#
# (c) 2010 Heike C. Zimmerer <hcz@hczim.de>
# License: PGL v3

# 2010-08-19: now runs gawk instead of awk.  WinAVR only knows about gawk.
# 2015-01-12: Refactoring by A. Wolf medusa@marsmail.de
 
usage(){
    echo "\
Usage: $pname -mmcu=<mcutype> <objfile.o>
Function: return AVR architecture (the
  architecture which avr-gcc uses for linking) as
  string on stdout.  
  <mcutype> may be any mcu type accepted by avr-gcc.
  <objfile.o> must exist but may be empty.
Opts: 
  -x   Script debug (set -x)"
    exit 1
}

pname="${0##*/}"
while getopts m:-:hx argv; do
    case $argv in
    m) mcu="$OPTARG";;
    x) set -x;;
    *) usage;;
    esac
done
shift $((OPTIND-1))

case "$#" in
    0) echo >&2 "$pname: missing object file"; exit 1;;
    1) ;;
    *) echo >&2 "$pname: Too many arguments: $*"; exit 1;;
esac

# call gcc, asking it for the command line which it would use for
# linking:
AVR_GCC_OUTPUT="$(avr-gcc -m"$mcu" -### "$1" 2>&1)"
if [ $? != 0 ]; then  #avr-gcc error
    echo "$AVR_GCC_OUTPUT"
    exit 1
fi

STRIP_PRE=${AVR_GCC_OUTPUT##*-m}
AVR_ARCHITECTURE=${STRIP_PRE%% *}

if [ -n "$AVR_ARCHITECTURE" ]; then # any match?
    echo $AVR_ARCHITECTURE
    exit 0
fi

echo >&2 \
"$pname: Could not find an architecture in avr-gcc's internal ld command line"
exit 1;
