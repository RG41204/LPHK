@echo off

REM DO NOT USE THIS SCRIPT. It is for creating new releases.

set ORIGDIR="%CD%"

cd %~dp0\..\..

echo Building portable EXE...
call conda run -n LPHK-build pyinstaller ^
    --noconfirm ^
    --add-data VERSION;. ^
    --add-data resources\;resources\ ^
    --onefile ^
    --windowed ^
    --icon=resources\LPHK.ico ^
    LPHK.py
if errorlevel 1 goto ERROR

goto DONE


:ERROR
cd %ORIGDIR%
echo Portable EXE build failed!
exit /B 1

:DONE
cd %ORIGDIR%
echo Portable EXE build done!
exit /B 0