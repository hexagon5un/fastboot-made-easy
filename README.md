# fastboot-made-easy

Peter Dannegger's `fastboot` (https://www.mikrocontroller.net/articles/AVR_Bootloader_FastBoot_von_Peter_Dannegger) is a fantastic serial bootloader for (any!?) AVR microcontroller.  I love it and use it all the time.  

It lets you upload new code to your microcontroller project with the very same serial-USB cable that you're using for `printf()` debugging anyway.  How's that for convenient?

Outstanding features include:
* USART autobauding
* Reasonably sized (around 512 KB)
* Works on Tiny13 to Mega328 and beyond (AFAIK)
* One-wire mode (with additional hardware)
* Smart flashing software lets you use every last byte of flash memory for your code.
* Very fast.  So fast, it's in the name.
* It's really old.  It's been battle-tested.  It works.

Actually compiling `fastboot` for any given chip / port / CPU speed combo involves editing a Makefile each time.  And recently (sometime in 2015?) the compile procedure went broken, due to upstream changes in GCC, but whatevers.  So I ended up re-writing the compile frontend for my own purposes, and thought I'd share.  

So what I've done here is to fix the `get_avr_arch.sh` file, streamline the build process, add an interactive frontend, and add pre-built binaries for all the chip X pin combinations that I use with any frequency.  There are also flash / test scripts for each processor which:

1. Upload the correct bootloader for the chip
2. Write in the correct fuse values to the chip
3. Test-flash a blinky-LED program to the chip via `fastboot` to make sure it's working

Finally, since the one-wire facility is so cool, but requires a bit of additional hardware to work, I've documented that too.  Everything you'd need to get the thingy fabbed (or DIY) is in the hardware directory.

## TL;DR

The build chain for `fastboot` went broken, and I "fixed" it by taking the build process in a different direction. 

I've also included binaries, and a simple hardware project to support the one-wire feature with a FTDI USB/serial cable or equivalent.

The aim was to make it easy to use for everyone.  See the project name.

If you have a chip that's not supported, either fork-and-pull-request or e-mail me.  We'll get binaries up and running for you in no time.

## Support Software

You'll need a `fastboot`-compatible uploader.   
* For Linux: https://github.com/Boregard/FBoot-Linux  
* For Mac (may not support one-wire): http://www.avrfreaks.net/index.php?module=Freaks%20Academy&func=viewItem&item_type=project&item_id=1927.  
* For Windows: http://luani.de/projekte/updateloader/ 


## Tutorial Example

Something about the timing with running the uploader and then tapping reset / powering chip on.  

## F(not-yet)AQ

1. Does `AVRDUDE` work with `fastboot`?  Nope, you need an uploader.

2. I really need every pin on my ATtiny45.  What can I do?  Flash the bootloader set up for one-wire mode on the RESET pin, then disable the reset pin using the relevant fuse bits.  Now instead of triggering a bootloader session by tapping reset, you do so by turning the chip on.  Use the reset pin (PB5) normally in your code.  Woot!  

3. Will this work with my AVR-based Arduino?  Sure, but unless you absolutely need one-wire mode you should probably stick with the Arduino-native Optiboot because `fastboot` won't work with the Arduino IDE, and that's a hassle.  Optiboot is really pretty darn good.

4. Do you have any questions?  I've got more answers.

