@echo off

echo Write something, it will be used in the command "echo"
set /p input=""
cls
echo %input%
pause 

@echo off

echo Write something, it will be used in the command "echo"
set /p input=""
cls
if %input% == "Y" (
echo %input%
) else (exit)
pause

echo %input%
pause 

set /p input=""
cls
if %input% == "File" (
    ipconfig > C:\Users\%USERNAME%\Documents\IP-Config.txt
    ) 
else (
    ipconfig
    )
pause