Rock n' Roll Racing MSU-1 hack
by DarkShock

This hack adds support for the MSU-1 chip invented by byuu that supports CD quality audio and streaming 4Gb of data. This hack only uses the audio part of the chip.

The hack is made for the 1.0 version of the game. Tested on SD2SNES.

=============
= Compiling =
=============
To compile the hack you need

* asar 1.36 (http://www.smwcentral.net/?p=section&a=details&id=6000)
* wav2msu (http://helmet.kafuka.org/thepile/Wav2msu)

The rom needs to be named rnrr_msu1.sfc.

For the name of the .wav files, look in the create_pcm.bat file.

===========
= Songs   =
===========
00 = Highway Star
01 = Peter Gunn
02 = Born to be Wild
03 = Bad to the Bone
04 = Paranoid

========
= TODO =
========
* Stop the music when the game ask for it
* Duck (reduce) the volume when pausing the game in course
* Make the manifest file for bsnes and higan