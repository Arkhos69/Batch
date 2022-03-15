@echo off &setlocal EnableDelayedExpansion

set "str=192.*.*.*" &set "str=!str:*=_!"
echo !str! &echo.

:main
call :str_replace return "192.*.*.*" "*" "_"
echo %return%
call :str_replace return "192.*.*.*" "*" ""
echo %return%
pause

:str_replace <return> <str> <from> <to>
set "rp_get=" &set "return_=%~1" &set "str_=%~2" &set "form_=%~3" &set "to_=%~4"
for %%a in (str_ form_ return_) do if not defined %%a exit /b 1
:str_replace_loop
for %%i in (20 30 50 100) do for /l %%0 in (0, 1, %%i) do ^
if defined str_ (set "sp_=!str_:~0,1!" &set "str_=!str_:~1!"
if "!sp_!"=="!form_!" (if defined to_ set "rp_get=!rp_get!!to_!") else set "rp_get=!rp_get!!sp_!"
) else set "%~1=!rp_get!" &exit /b 0
goto str_replace_loop
