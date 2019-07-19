I originally posted the following [to reddit](https://www.reddit.com/r/retroflag_gpi/comments/cenjwv/further_tinkering_with_the_overlay_files/). I've added it here for context on why I did this.

----

So for a while I've viewed the 2 magical overlay files as binary blobs (they are) with no source code.

So I started reading the documentation about [device trees](https://www.raspberrypi.org/documentation/configuration/device-tree.md) and managed to decompile them. So here's what I found.

# Video

**Hypothesis**  
The `dpi24` overlay looks like it's a copy of the [_old_ stock dpi24 overlay](https://raw.githubusercontent.com/raspberrypi/linux/c71f07110233e9d7dcc37563d851dac7e1a45d61/arch/arm/boot/dts/overlays/dpi24-overlay.dts) (the one before [they standardized](https://github.com/raspberrypi/linux/commit/26423c8f79541cc629cee7367349ed277057c5c1)) but without pins 18 and 19. So it uses pins 0-27 excluding 18,19.

**Proof**  
I compile the [_newest_ stock dpi24 overlay](https://raw.githubusercontent.com/raspberrypi/linux/26423c8f79541cc629cee7367349ed277057c5c1/arch/arm/boot/dts/overlays/dpi24-overlay.dts) but slightly modified to remove pins 18 and 19 from the list. I compile it and install it. I reboot. It works! I now have the _newer_ version of the retroflag magical file #1

# Audio

**Hypothesis**  
The `pwm-audio-pi-zero` overlay looks like it is the custom one from [this article](https://hackaday.io/project/9467-piboy-zero/log/35090-pi-zero-pwm-audio-device-tree-overlay) but using pins 18 and 19 for the left and right channel instead of that article's 13 and 18.  The function also seems to be set to 2 2 instead of 4 2.

**Proof**  
I copy the file from the article. I modify it to be consistent with the new standard. I change the pins and function. I compile it and install it. Reboot. Do the sound test `speaker-test -c2 -tw`. It works! I now have the _newer_ version of the retroflag magical file #2

# Conclusion

They've managed to jam both a DPI screen (that usually takes over almost all the GPIO pins, including the audio pins) and Stereo Audio output into the same set of GPIO pins normally taken up by the DPI screen. People said it couldn't be done but retroflag did it and this is how they did it: They use mode [6 (666 with gaps)](https://www.raspberrypi.org/documentation/hardware/raspberrypi/dpi/README.md) which frees up pins 10,11,18,19,26,27. They then grab two of those pins for audio.

What's funny is that it is called dpi24 but it isn't 24bit color. It really should be called dpi18-666-cfg2 or something. It's colorful enough for me. I'd rather have audio than "true color" ;)

Also: I wasted a bunch of time doing a bunch of reverse engineering of a bunch of stuff when I could have asked retroflag for the dts files. But hey, I learned a lot in the process. Still got a lot to learn.

Cheers.
