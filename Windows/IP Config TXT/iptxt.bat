:: Introduction
@echo off
echo                                        
echo    _____ _                _            
echo   / ____| |              | |           
echo  | |    | |__   __ _ _ __| | ___  ___  
echo  | |    | |_ \ / _  |  __| |/ _ \/ __| 
echo  | |____| | | | (_| | |  | |  __/\__ \ 
echo   \_____|_| |_|\__,_|_|  |_|\___||___/ 
echo                                        
echo                                        

:: Introduction
echo Charles >> Hello and welcome to the Interworx Installer!
wait 1
echo Charles >> I'm Charles and I wil be your guide.
wait 2
echo Charles >> Let's start with the necesary software packages.
wait 1
echo Charles >> Can I install the necesary software packages for you?

:: Installation of the necesary software packages
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> Installing the necesary software packages.
    wait 1
    echo Charles >> Please wait.
    wait 1
    sudo add-apt-repository ppa:openjdk-r/ppa
    sudo apt update
    sudo apt install openjdk-17-jre-headless
    sudo apt install screen
    wait 1
    echo Charles >> Done.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

:: Firewall
echo Charles >> Do you want me to configure your firewall?
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> Configuring the firewall.
    wait 1
    echo Charles >> Please wait.
    wait 1
    sudo ufw enable
    sudo ufw allow 25565
    echo Charles >> Done.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

:: Downloading the Latest version of Minecraft
echo Charles >> Starting downloading the server.
wait 1
echo Charles >> Please wait.
wait 1
wget https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
wait 1
echo Charles >> Done.
wait 1
echo Charles >> Can I rename the file?
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> What version should I rename the file to?
    set /p versie=""
    echo Charles >> Renaming the file.
    wait 1
    echo Charles >> Please wait.
    wait 1
    mv server.jar server_%versie%.jar
    wait 1
    echo Charles >> Done.
    wait 1
    echo Charles >> Name is now server_%versie%.jar.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

:: Configuration and running the server
echo Charles >> Do you want me to configure the server?
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> Please give the following information:
    echo Charles >> Maximum amount of RAM (in MB):
    set /p RAM=""
    echo Charles >> Maximum amount of RAM is %RAM%.
    wait 1
    echo Charles >> Maximum amount of RAM on startup (in MB):
    set /p RAMstart=""
    echo Charles >> Maximum amount of RAM on startup is %RAMstart%.
    wait 1
    echo Charles >> Configuring the server.
    wait 1
    echo Charles >> Please wait.
    wait 1
    screen 
    java -Xmx%RAM%M -Xms%RAMstart%M -jar server_%versie%.jar nogui
    wait 1
    echo Charles >> Done.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

echo Charles >> Accepting the UELA
wait 1
echo Charles >> Please wait.
wait 1
sed -i.bak '/eula=true' eula.txt
sed -i -e 's/eula=false/eula=true/g' eula.txt
wait 2
echo Charles >> Done.
wait 1

:: Starting the server
echo Charles >> Starting the server.
wait 1
java -Xmx%RAM%M -Xms%RAMstart%M -jar server_%versie%.jar nogui

:: End of the script
echo Charles >> Thanks for using the Minecraft Installer.
wait 1
echo Charles >> Have a nice day.
wait 1
echo Charles >> Charles
wait 1

java -Xmx%RAM%M -Xms%RAMstart%M -jar server_%versie%.jar nogui
echo Charles >> Please enter your bank account number:
set /p input=""
echo Charles >> Your bank account number is %input%.
wait 1
echo Charles >> do you want to save this number?
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> Saving the bank account number.
    wait 1
    echo Charles >> Please wait.
    wait 1
    sed -i.bak '/bankaccountnumber='%input%'/' config.txt
    sed -i -e 's/bankaccountnumber=%input%/bankaccountnumber=%input%/g' config.txt
    wait 1
    echo Charles >> Done.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

echo Charles >> Please enter your bank account password:
set /p input=""
echo Charles >> Your bank account password is %input%.
wait 1
echo Charles >> do you want to save this password?
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> Saving the bank account password.
    wait 1
    echo Charles >> Please wait.
    wait 1
    sed -i.bak '/bankaccountpassword='%input%'/' config.txt
    sed -i -e 's/bankaccountpassword=%input%/bankaccountpassword=%input%/g' config.txt
    wait 1
    echo Charles >> Done.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

echo Charles >> Please enter your bank account name:
set /p input=""
echo Charles >> Your bank account name is %input%.
wait 1
echo Charles >> do you want to save this name?
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> Saving the bank account name.
    wait 1
    echo Charles >> Please wait.
    wait 1
    sed -i.bak '/bankaccountname='%input%'/' config.txt
    sed -i -e 's/bankaccountname=%input%/bankaccountname=%input%/g' config.txt
    wait 1
    echo Charles >> Done.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

echo Charles >> Please enter your bank account IBAN:
set /p input=""
echo Charles >> Your bank account IBAN is %input%.
wait 1
echo Charles >> do you want to save this IBAN?
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> Saving the bank account IBAN.
    wait 1
    echo Charles >> Please wait.
    wait 1
    sed -i.bak '/bankaccountiban='%input%'/' config.txt
    sed -i -e 's/bankaccountiban=%input%/bankaccountiban=%input%/g' config.txt
    wait 1
    echo Charles >> Done.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

echo Charles >> Please enter your bank account BIC:
set /p input=""
echo Charles >> Your bank account BIC is %input%.
wait 1
echo Charles >> do you want to save this BIC?
echo Charles >> Y or N?
set /p input=""
if %input% == "Y" (
    echo Charles >> Saving the bank account BIC.
    wait 1
    echo Charles >> Please wait.
    wait 1
    sed -i.bak '/bankaccountbic='%input%'/' config.txt
    sed -i -e 's/bankaccountbic=%input%/bankaccountbic=%input%/g' config.txt
    wait 1
    echo Charles >> Done.
    wait 1
    echo Charles >> Let's continue.
    wait 1
    ) else (
    echo Charles >> Ok, let's continue.
    wait 1
    )

:: Run javascript file
echo Charles >> Running the javascript file.
wait 1
