@ECHO OFF

del /q rnrr_msu1.ips
del /q RockNRollRacing_MSU1.zip
rmdir /s /q RockNRollRacing_MSU1

mkdir RockNRollRacing_MSU1
ucon64 -q --snes --chk rnnr_msu1.sfc
ucon64 -q --mki=rnrr_original.smc rnrr_msu1.sfc
copy rnrr_msu1.ips RockNRollRacing_MSU1
copy README.txt RockNRollRacing_MSU1
copy rnrr_msu1.msu RockNRollRacing_MSU1
copy rnrr_msu1.xml RockNRollRacing_MSU1
copy manifest.bml RockNRollRacing_MSU1
copy create_pcm.bat RockNRollRacing_MSU1
copy wav2msu.exe RockNRollRacing_MSU1

"C:\Program Files\7-Zip\7z" a -r RockNRollRacing_MSU1.zip RockNRollRacing_MSU1