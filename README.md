# fastboot-made-easy

Peter Dannegger's Fastboot (link:https://www.mikrocontroller.net/articles/AVR_Bootloader_FastBoot_von_Peter_Dannegger) is a fantastic serial bootloader for (any??) AVR microcontroller.  I love it and use it all the time.

Outstanding features include:
* USART autobauding
* Reasonably sized (around 512 KB)
* Works on Tiny13 to Mega328
* One-wire mode (with additional hardware)
* Smart flashing software lets you use every last byte of flash memory for your code.
* Very fast.  So fast, it's in the name.

Actually using fastboot for any given chip / port / CPU speed combo involves editing a Makefile each time.  And recently (sometime in 2015?) the compile procedure went broken, due to upstream changes in GCC, but whatevers.  So I ended up re-writing the compile frontend for my own purposes, and thought I'd share.  

So what I've done here is to streamline the build process, add an interactive frontend, and add pre-built binaries for all the chip X pin combinations that I use with any frequency.  There are also flash / test scripts for each processor which:
1) Upload the correct bootloader for the chip
2) Write in the correct fuse values to the chip
3) Test-flash a blinky-LED program to the chip via fastboot to make sure it's working

Finally, since the one-wire facility is so cool, but requires a bit of additional hardware to work, I've documented that too.  Everything you'd need to get the thingy fabbed (or DIY) is in the hardware directory.




