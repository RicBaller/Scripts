#!/bin/bash
# Introduction
echo "   _____ _                _            "
echo "  / ____| |              | |           "
echo " | |    | |__   __ _ _ __| | ___  ___  "
echo " | |    | |_ \ / _  |  __| |/ _ \/ __| "
echo " | |____| | | | (_| | |  | |  __/\__ \ "
echo "  \_____|_| |_|\__,_|_|  |_|\___||___/ "
echo "                                       "
echo "                                       "

echo -e "\e[1;36mCharles >> Hello and welcome to the Interworx Installer!"
sleep 1
echo -e "\e[1;36mCharles >> I'm Charles and I wil be your guide."
sleep 2

# Ask for Key
echo -e "\e[1;36mCharles >> Do you have your license key? If you don't, please ctrl+c to exit now and get your key ready."
echo -e "\e[1;36mSystem >> You have 10 seconds to cancel"
sleep 10

# Ask for Yum updated
echo -e "\e[1;36mCharles >> Have you allready updated Yum?"
sleep 1
echo -e "\e[1;36mSystem >> Press \"n\" to let me update it for you."
echo -e "\e[1;36mSystem >> Press \"y\" if you are sure that it is up-to-date."
read Yum_Update

# If up-to-date -> continue | If not up-to-date -> update
if [ "$Yum_Update" == "y" ]; then
    echo "\e[1;36mCharles >> Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "yes" ]; then
    echo "\e[1;36mCharles >> Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "Y" ]; then
    echo "\e[1;36mCharles >> Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "Yes" ]; then
    echo "\e[1;36mCharles >> Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "n" ]; then
    echo "\e[1;36mCharles >> Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "no" ]; then
    echo "\e[1;36mCharles >> Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "N" ]; then 
    echo "\e[1;36mCharles >> Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "No" ]; then 
    echo "\e[1;36mCharles >> Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
else
    echo "\e[1;36mPress a key givven above"
fi

# Start install proces
if [ "$Yum_UpToDate" == true ]; then
sleep 2
# Give cancel option
echo "\e[1;36mCharles >> If you want to cancel, you can do so within 10 seconds."
sleep 10
# Download Interworx
echo "\e[1;36mSystem >> Download Interworx"
sleep 2
wget https://updates.interworx.com/interworx/7/install.sh
sleep 1
echo "\e[1;36mSystem >> Instal Interworx"
sleep 2
sh install.sh
sleep 1
echo "\e[1;36mSystem >> Instalation complete"
sleep 3
echo "\e[1;36mCharles >> Let's configure your license."
sleep 1
echo "\e[1;36mWhat's your admin email?"
read AdminMail
sleep 1
echo "\e[1;36mWhat is your admin password?"
read AdminPassword
sleep 1
echo "\e[1;36mWhat is your license key?"
read LicenseKey
sleep 1
echo "\e[1;36mCharles >> Activating and configuring Interworx"
~iworx/bin/goiworx.pex --key=$LicenseKey --email=$AdminMail --password=$AdminPassword --ignorechecks



elif [ "$Yum_UpToDate" == false ]; then
sleep 2
# Give cancel option
echo "\e[1;36mCharles >> If you want to cancel, you can do so within 10 seconds."
sleep 10
# Update Yum
echo "\e[1;36mSystem >> Update Yum"
sleep 2
yum update
sleep 1
# Download Interworx
echo "\e[1;36mSystem >> Download Interworx"
sleep 2
wget https://updates.interworx.com/interworx/7/install.sh
sleep 1
# Install interworx
echo "\e[1;36mSystem >> Instal Interworx"
sleep 2
sh install.sh
sleep 1
echo "\e[1;36mSystem >> Instalation complete"
sleep 3
echo "\e[1;36mCharles >> Let's configure your license."
sleep 1
echo "\e[1;36mWhat's your admin email?"
read AdminMail
sleep 1
echo "\e[1;36mWhat is your admin password?"
read AdminPassword
sleep 1
echo "\e[1;36mWhat is your license key?"
read LicenseKey
sleep 1
echo "\e[1;36mCharles >> Activating and configuring Interworx"
~iworx/bin/goiworx.pex --key=$LicenseKey --email=$AdminMail --password=$AdminPassword --ignorechecks

fi
# Summary and general info
sleep 2
echo "\e[1;36mCharles >> Interworx has now been installed on http://$(hostname -i)/nodeworx/ and http://$(hostname -i)/siteworx/!"
echo "\e[1;36mCharles >> Have a look at http://$(hostname -i)/nodeworx/ to complete the setup of Interworx."
