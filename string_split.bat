@echo off &setlocal EnableDelayedExpansion
color 0a &chcp 1252 >nul

:main
set "split_char=,"
set ary=split

set "str=1,12,123,1234,12345, 1  1,A B C D E F G"
call :str_split str ary
for /l %%0 in (1, 1, %sp_cnt%) do echo !split[%%0]! &set "!split[%%0]!="
echo. &echo Total Split: %sp_cnt%

echo. &echo Pressure test
set "split_char=*"
set "str=****^^***^#$??**^**&**>.<****(**^ ^***)**,*^.^****_^_**>///<***  \\\  ***"**""******"
call :str_split str ary
for /l %%0 in (1, 1, %sp_cnt%) do echo !split[%%0]! &set "!split[%%0]!="
echo. &echo Total Split: %sp_cnt%

pause &endlocal

:str_split <String> <ReturnArray>
set "sp_str=!%~1!" &set "sp_ary=!%~2!"
if not defined sp_ary exit /b 1
if not defined split_char set "split_char=,"
set "split_char=%split_char:~0,1%"
set /a sp_cnt=0
:str_split_
set "sp_cut="
if defined sp_str (
set "sp_=%sp_str:~0,1%"
set "sp_str=%sp_str:~1%"
if !sp_!==!split_char! (set sp_cut=1) else (set "sp_tmp=!sp_tmp!!sp_!")
if not defined sp_str set sp_cut=1
if defined sp_cut if defined sp_tmp set /a sp_cnt+=1 &set "!sp_ary![!sp_cnt!]=!sp_tmp!" &set "sp_tmp="
) else (exit /b 0)
goto str_split_