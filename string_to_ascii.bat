@echo off &setlocal EnableDelayedExpansion
color 0a &chcp 1252 >nul

set "ascii_table=   #$%%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
set "ascii[33]=^!" &set "ascii[34]=""

:main
set /p "string=String:"
echo %time%
call :str_ascii
echo. &goto main

:str_ascii
if defined string (
set "char=!string:~0,1!"
call :char_ascii
set "string=!string:~1!"
) else (echo %time% &exit /b 0)
goto str_ascii

:char_ascii
if "!char!"=="!ascii[33]!" echo !ascii[33]! = 33 &exit /b 0
if "!char!"=="!ascii[34]!" echo !ascii[34]! = 34 &exit /b 0
if "!char!"=="" exit /b 1
set /a index=32
for /l %%0 in (0, 1, 94) do (
if "!char!"=="!ascii_table:~%%0,1!" echo !char! = !index! &exit /b 0
set /a index+=1)
echo Cannot find char &exit /b 1