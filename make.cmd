@echo off
set /P lily=[Path to lilypond.exe]?
set path=%path%;%lily%

cd /D %~dp1

:mark

pause

lilypond "%~1"

goto :mark
