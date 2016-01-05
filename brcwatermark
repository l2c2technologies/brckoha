@echo off
rem -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
rem brcwatermark.cmd v 0.1 (2015) 
rem BRC Watermarking script
rem (c) L2C2 Technologies (indradg@l2c2.co.in)
rem Licensed under GNU GPL v 3.0 or higher
rem -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

for /f "eol=: delims=" %%F in ('dir /b /a-d *.png^|findstr /irc:"[13579]\.png$"') do ( 
gm convert -font Tahoma -pointsize 14 -fill black -gravity southwest -draw "text 50,50 Bhaktivedanta Research Center Digital Library" "%%F" "%%F"
)

for /f "eol=: delims=" %%F in ('dir /b /a-d *.png^|findstr /irc:"[02468]\.png$"') do ( 
gm convert -font Tahoma -pointsize 14 -fill black -gravity southeast -draw "text 50,50 Bhaktivedanta Research Center Digital Library" "%%F" "%%F"
)
