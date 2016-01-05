@echo off
rem -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
rem gmtif2png.cmd v 0.1 (2015) 
rem Invokes GraphicsMagick's mogrify utility for batch conversion from 
rem TIFF to PNG format. Copyright L2C2 Technologies (indradg@l2c2.co.in)
rem Licensed under GNU GPL v 3.0 or higher
rem -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

setlocal enableextensions enabledelayedexpansion

rem convert TIFF to PNG
gm mogrify -format png *.tif

rem remove the TIFF files
for /r %%i in (*.tif) do del %%i

endlocal
