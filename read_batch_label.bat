@echo off &setlocal EnableDelayedExpansion

:main
set "mypath=%~f0"

call :read_label ascii_art "%mypath%" "ascii_art"
for /l %%0 in (1, 1, %ary_len%) do echo !ascii_art[%%0]! &set "ascii_art[%%0]="

pause

:ascii_art
                                                                   /L'-,
                               ,'-.           /MM . .             /  L '-,
     .                    _,--dMMMM\         /MMM  `..           /       '-, 
     :             _,--,  )MMMMMMMMM),.      `QMM   ,<>         /_      '-,'
     ;     ___,--. \MM(    `-'   )M//MM\       `  ,',.;      .-'* ;     .'
     |     \MMMMMM) \MM\       ,dM//MMM/     ___ < ,; `.      )`--'    /
     |      \MM()M   MMM)__   /MM(/MP'  ___, \  \ `  `. `.   /__,    ,'
     |       MMMM/   MMMMMM( /MMMMP'__, \     | /      `. `-,_\     /
     |       MM     /MMM---' `--'_ \     |-'  |/         `./ .\----.___
     |      /MM'   `--' __,-  \""   |-'  |_,               `.__) . .F. )-.
     |     `--'       \   \    |-'  |_,     _,-/            J . . . J-'-. `-.,
     |         __  \`. |   |   |         \    / _           |. . . . \   `-.  F
     |   ___  /  \  | `|   '      __  \   |  /-'            F . . . . \     '`    
     |   \  \ \  /  |        __  /  \  |  |,-'        __,- J . . . . . \            
     |    | /  |/     __,-  \  ) \  /  |_,-     __,--'     |. .__.----,'           
     |    |/    ___     \    |'.  |/      __,--'           `.-;;;;;;;;;\         
     |     ___  \  \     |   |  `   __,--'                  /;;;;;;;;;;;;.     
     |     \  \  |-'\    '    __,--'                       /;;;;;;;;;;;;;;\   
 \   |      | /  |      __,--'                             `--;;/     \;-'\  
  \  |      |/    __,--'                                   /  /         \  \  
   \ |      __,--'                                        /  /           \  \        
    \|__,--'                                          _,-;M-K,           ,;-;\        
                                                     <;;;;;;;;           '-;;;;

:test1
echo this is test1
tasklist
pause
exit /b 0

:read_label <name_ReturnArray> <string_FilePath> <string_LabelName>
set "return_=%~1" &set "path_=%~2" &set "label_name=%~3"
if not exist "%path_%" set "path_=%~f0"
if not defined label_name exit /b 1
if not defined return_ set "return_=%label_name%_line"
chcp 65001 >nul &set "start=" &set /a ary_len=-1
:read_label_
for /f "tokens=* delims=" %%a in (%path_%) do (
set "line=%%a" &if "!line:~0,1!"==":" set "start="
if "!line:~0,1!"==":" for %%b in (!line!) do if %%b==:%label_name% set "start=1"
if defined start set /a ary_len+=1 &set %return_%[!ary_len!]=%%a)
if !ary_len! GEQ 0 (exit /b 0) else exit /b 1

:test2 <test> <69>
echo this is test2
netstat -ano
pause
exit /b 0
