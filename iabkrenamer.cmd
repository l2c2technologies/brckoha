@echo off
rem -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
rem iabkrenamer.cmd v 0.1 (2015) 
rem IA BookReader Module Batch Renaming script for Windows 7 and above
rem (c) L2C2 Technologies (indradg@l2c2.co.in)
rem Licensed under GNU GPL v 3.0 or higher
rem -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

setlocal enableextensions enabledelayedexpansion

rem get directory name
for %%a in (.) do set bookname=%%~na

rem store sorted filenames in a temp file
dir /a-d /b /on "*.png" > tmplist

rem setup page counter
set pagecount=0

rem iterate through the sorted file and rename the files
for /F "tokens=*" %%A in (tmplist) do (

    rem zero pad page number
    set FileNumber=0000!pagecount!

    rem Trim to four digits, from the end
    set FileNumber=!FileNumber:~-4!

    set FileName=%bookname%_!FileNumber!.png

    rem Rename the file and increment page counter
    rename "%%A" "!FileName!"
    set /a pagecount+=1
)
endlocal

IF EXIST "tmplist" del /F "tmplist"
