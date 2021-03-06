@echo off &setlocal EnableDelayedExpansion

set "string=123\n456\n789"
set "keyword=\n"

echo Keyword=\n
echo String=123\n456\n789
echo Return:
call :str_keyword_split return string keyword
if %errorlevel%==0 for /l %%0 in (0, 1, %sp_ary_len%) do echo !return[%%0]! &set "return[%%0]="
set "Keyword="

:main
echo.
if defined keyword (echo [Keyword=!keyword!]) else set /p "keyword=Set Keyword:"
set /p "enter=Enter Split String:"
if defined enter call :str_keyword_split return enter keyword & ^
if !errorlevel!==0 for /l %%0 in (0, 1, !sp_ary_len!) do echo !return[%%0]! &set "return[%%0]="
set "enter=" &goto main

:str_keyword_split <name_ReturnArray> <name_String> <name_KeyWord>
set "sp_return=%~1" &set "sp_str=!%~2!" &set "sp_Keyword=!%~3!"
for %%a in (sp_return sp_str sp_Keyword) do if not defined %%a exit /b 1
set "sp_get=" &set "sp_tmp=" &set /a len_=0 &set /a sp_ary_len=-1
:str_keyword_split_loop
for %%i in (20 30 50 100 200) do for /l %%0 in (0, 1, %%i) do ^
if defined sp_str (set "sp_=!sp_str:~0,1!" &set "sp_str=!sp_str:~1!"

if defined sp_start for %%l in (!len_!) do if not "!sp_!"=="!sp_Keyword:~%%l,1!" ^
set "sp_start=" &set "sp_get=!sp_get!!sp_tmp!" &set "sp_tmp="

if "!sp_!"=="!sp_Keyword:~0,1!" set "sp_start=1" &set /a len_=0

if defined sp_start (set "sp_tmp=!sp_tmp!!sp_!"
if "!sp_tmp!"=="%sp_Keyword%" (set "sp_cut=1" &set "sp_start=" &set "sp_tmp=") ^
else set /a len_+=1

) else set "sp_get=!sp_get!!sp_!"

if not defined sp_str (
if defined sp_tmp set "sp_get=!sp_get!!sp_tmp!"
if defined sp_get set "sp_cut=1")
if defined sp_cut set "sp_cut=" &if defined sp_get set /a sp_ary_len+=1 & ^
set "!sp_return![!sp_ary_len!]=!sp_get!" &set "sp_get="

) else (if !sp_ary_len! GEQ 0 (exit /b 0) else exit /b 1)
goto str_keyword_split_loop
