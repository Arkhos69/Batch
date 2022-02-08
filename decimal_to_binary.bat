@echo off &setlocal EnableDelayedExpansion
color 0a &chcp 1252 >nul

:main
set /p enter=Decimal:
call :dec_bin %enter% return
echo %return% &echo.
set "enter=" &set "return="
goto main

:dec_bin <int_Decimal> <string_Return>
set /a dec_=%~1 &set "return_=%~2" &set "bin="
if defined dec_ if defined return_ (call :dec_bin_) else (exit /b 1)
set "%return_%=%bin%" &exit /b 0
:dec_bin_
for /l %%0 in (1 ,1, 32) do (
set /a mod=dec_ %% 2
set bin=!mod!!bin!
set /a dec_/=2
if not !dec_! gtr 0 exit /b 0
)
exit /b 1