Rock n' Roll Racing MSU-1 hack
Version 1.0
by DarkShock

This hack adds CD quality audio to Rock 'n Roll Racing using the MSU-1 chip invented by byuu.

The hack has been tested on bsnes 075, higan 094 and SD2SNES.

Note that I don't distribute the .pcm with this hack for obvious reasons but I included everything you need to build them on Windows.

=====================
= Creating the .pcm =
=====================
Use create_pcm.bat to create the .pcm from WAV files. If you are exporting from Audacity, clear any tag information unless wav2msu won't convert your WAV files.

The script excepts these filenames for the WAV files:

Highway Star = highway_star.wav
Peter Gunn = peter_gunn.wav
Born to be Wild = born_to_be_wild.wav
Bad to the Bone = bad_to_the_bone.wav
Paranoid = paranoid.wav

===============
= Using higan =
===============
1. Patch the ROM
2. Generate the .pcm
3. Launch it using higan
4. Go to %USERPROFILE%\Emulation\Super Famicom\rnrr_msu1.sfc in Windows Explorer.
5. Rename program.rom to rnrr_msu1.sfc
6. Copy manifest.bml and the .pcm file there
7. Launch the game

===============
= Using BSNES =
===============
1. Patch the ROM
2. Generate the .pcm
3. Launch the game

====================
= Using on SD2SNES =
====================
Drop the ROM file, rnrr_msu1.msu and the .pcm files in any folder. (I really suggest creating a folder)
Launch the game and voilà, enjoy !

=============
= Compiling =
=============
Source is availabe on GitHub: https://github.com/mlarouche/RockNRollRacing-MSU1

To compile the hack you need

* asar 1.36 (http://www.smwcentral.net/?p=section&a=details&id=6000)
* wav2msu (http://helmet.kafuka.org/thepile/Wav2msu)

To distribute the hack you need

* uCON64 (http://ucon64.sourceforge.net/)
* 7-Zip (http://www.7-zip.org/)

make.bat assemble the patch
create_pcm.bat create the .pcm from the WAV files
distribute.bat distribute the patch
make_all.bat does everything
