@echo off
echo    _____ _                _            
echo   / ____| |              | |           
echo  | |    | |__   __ _ _ __| | ___  ___  
echo  | |    | |_ \ / _  |  __| |/ _ \/ __| 
echo  | |____| | | | (_| | |  | |  __/\__ \ 
echo   \_____|_| |_|\__,_|_|  |_|\___||___/ 

:: Introduction
echo Charles >> Hello and welcome to the Interworx Installer!
wait 1
echo Charles >> I'm Charles and I wil be your guide.
wait 2
echo Charles >> I will now dump your IP and Networking information in a text file.
wait 1
echo Charles >> This will help us to troubleshoot any issues you may have.
wait 1
echo Charles >> Please wait while I do this.
wait 1
echo Charles >> How do you want the file to be called?
set /p filename=""
echo Charles >> Please enter a filename:
wait 1
echo Charles >> Thank you!
wait 1

:: Dump IP and Networking information
echo Charles >> I will now dump your IP and Networking information in a text file.
wait 1
IPCONFIG /ALL > %filename%.txt
wait 1
echo Charles >> I have finished dumping your IP and Networking information in a text file.
wait 1
echo Charles >> I will now open the file for you.
wait 1

:: Open the file
start %filename%.txt
wait 1
echo Charles >> I have opened the file for you.
wait 1
echo Charles >> Have a nice day!
wait 1
exit
