@echo off &setlocal EnableDelayedExpansion
color 0a &chcp 1252 >nul

:main
set /p enter=Decimal:
call :dec_hex %enter% return
echo %return% &echo.
set "enter=" &set "return="
goto main

:dec_hex <int_Decimal> <string_Return>
set /a dec_=%~1 &set "return_=%~2"
set "hex=" &set "hex_map=0000000000ABCDEF"
if defined dec_ if defined return_ (call :dec_hex_) else (exit /b 1)
set "%return_%=%hex%" &exit /b 0
:dec_hex_
set /a mod=dec_ %% 16
if %mod% gtr 9 (set "hex=!hex_map:~%mod%,1!!hex!") else (set "hex=!mod!!hex!")
set /a dec_/=16
if not !dec_! gtr 0 exit /b 0
goto dec_hex_