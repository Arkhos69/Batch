@echo off &setlocal EnableDelayedExpansion

:main
set "mypath=%~f0"
call :read_label "%mypath%" "test1" "label_line"
if %errorlevel%==0 (for /l %%0 in (1, 1, %rl_cnt%) do echo !label_line[%%0]!) ^
else (echo Cannot find label.)
pause

:test1
echo this is test1
tasklist
pause
exit /b 0

:read_label <string_FilePath> <string_LabelName> <string_ReturnArray>
set "path_=%~1" &set "label_name=%~2" &set "ary=%~3"
if not exist "%path_%" set "path_=%~f0"
if not defined label_name exit /b 1
if not defined ary set "ary=%label_name%_line"
chcp 65001 >nul &set "start=" &set /a rl_cnt=0
:read_label_
for /f "tokens=*" %%a in (%path_%) do (
set "line=%%a" &if "!line:~0,1!"==":" set "start="
if "!line:~0,1!"==":" for %%b in (!line!) do if %%b==:%label_name% set "start=1"
if defined start set /a rl_cnt+=1 &set %ary%[!rl_cnt!]=%%a)
if !rl_cnt! neq 0 (exit /b 0) else (exit /b 1)

:test2 <test> <69>
echo this is test2
netstat -ano
pause
exit /b 0