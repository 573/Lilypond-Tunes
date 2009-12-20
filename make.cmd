@echo off
set /P lily=[Path to lilypond.exe]?
set path=%path%;%lily%

pushd %~dp1

:mark

pause

lilypond-windows.exe -dgui "%~1"

goto :mark
