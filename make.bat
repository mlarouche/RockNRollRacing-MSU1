@ECHO OFF

del rnrr_msu1.sfc

copy rnrr_original.smc rnrr_msu1.sfc
asar rnrr_msu1_music.asm rnrr_msu1.sfc

create_pcm.bat