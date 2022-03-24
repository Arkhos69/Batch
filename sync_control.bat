@echo off &setlocal EnableDelayedExpansion
color 0a

if exist switch.sync del switch.sync
if defined pass (title=__sync__catch__ &goto loop) ^

else (title=__sync__input__ &set "choice_=1 2 3 4 5 w a s d"
for %%a in (!choice_!) do set /a len+=1 &set "input[!len!]=%%a"
set "choice_=!choice_: =!"
set "pass=1" &start %~f0)

:main
choice /n /c %choice_% /m "%choice_%:"
if not exist switch.sync ^
for /l %%0 in (1, 1, %len%) do if !errorlevel!==%%0 ^
echo !input[%%0]! >data.sync &echo open >switch.sync
goto main

:loop
if exist switch.sync (
for /f "tokens=*" %%a in ('type data.sync') do echo %%a
del switch.sync &del data.sync)
goto loop
