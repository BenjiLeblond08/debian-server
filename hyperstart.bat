@ECHO off
:top
CLS
ECHO Choose a shell:
ECHO [1] cmd
ECHO [2] bash
ECHO [3] PowerShell
ECHO [4] Python
ECHO.
ECHO [5] restart elevated
ECHO [6] exit
ECHO.

CHOICE /N /C:123456 /M "> "
CLS
IF ERRORLEVEL ==6 GOTO end
IF ERRORLEVEL ==5 powershell -Command "Start-Process hyper -Verb RunAs"
IF ERRORLEVEL ==4 python
IF ERRORLEVEL ==3 powershell
IF ERRORLEVEL ==2 bash
IF ERRORLEVEL ==1 cmd

CLS
ECHO Switch or exit?
ECHO [1] Switch
ECHO [2] Exit

CHOICE /N /C:12 /D 2 /T 5 /M "> "
IF ERRORLEVEL ==2 GOTO end
IF ERRORLEVEL ==1 GOTO top

:end