#!/bin/bash
# Introduction
echo "                                       "
echo "   _____ _                _            "
echo "  / ____| |              | |           "
echo " | |    | |__   __ _ _ __| | ___  ___  "
echo " | |    | |_ \ / _  |  __| |/ _ \/ __| "
echo " | |____| | | | (_| | |  | |  __/\__ \ "
echo "  \_____|_| |_|\__,_|_|  |_|\___||___/ "
echo "                                       "
echo "                                       "

# Introduction
echo -e "Charles >> Hello and welcome to the Interworx Installer!"
sleep 1
echo -e "Charles >> I'm Charles and I wil be your guide."
sleep 2

# Ask for Key
echo -e "Charles >> Do you have your license key? If you don't, please ctrl+c to exit now and get your key ready."
echo -e "System >> You have 10 seconds to cancel"
sleep 10

# Ask for Yum updated
echo -e "Charles >> Have you allready updated Yum?"
sleep 1
echo -e "System >> Press \"n\" to let me update it for you."
echo -e "System >> Press \"y\" if you are sure that it is up-to-date."
read Yum_Update

# If up-to-date -> continue | If not up-to-date -> update
if [ "$Yum_Update" == "y" ]; then
    echo "Charles >> Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "yes" ]; then
    echo "Charles >> Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "Y" ]; then
    echo "Charles >> Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "Yes" ]; then
    echo "Charles >> Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "n" ]; then
    echo "Charles >> Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "no" ]; then
    echo "Charles >> Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "N" ]; then 
    echo "Charles >> Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "No" ]; then 
    echo "Charles >> Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
else
    echo "Press a key givven above"
fi

# Start install proces
if [ "$Yum_UpToDate" == true ]; then
sleep 2
# Give cancel option
echo "Charles >> If you want to cancel, you can do so within 10 seconds."
sleep 10
# Download Interworx
echo "System >> Download Interworx"
sleep 2
wget https://updates.interworx.com/interworx/7/install.sh
sleep 1
# Install Interworx
echo "System >> Instal Interworx"
sleep 2
sh install.sh
sleep 1
echo "System >> Instalation complete"
sleep 3
# Start configuring Interworx
echo "Charles >> Let's configure your Interworx."
sleep 1
echo "What's your admin email?"
read AdminMail
sleep 1
echo "What is your admin password?"
read AdminPassword
sleep 1
echo "What is your license key?"
read LicenseKey
sleep 1
# Using information above to activate and configure Interworx
echo "Charles >> Activating and configuring Interworx"
~iworx/bin/goiworx.pex --key=$LicenseKey --email=$AdminMail --password=$AdminPassword --ignorechecks



elif [ "$Yum_UpToDate" == false ]; then
sleep 2
# Give cancel option
echo "Charles >> If you want to cancel, you can do so within 10 seconds."
sleep 10
# Update Yum
echo "System >> Update Yum"
sleep 2
yum update
sleep 1
# Download Interworx
echo "System >> Download Interworx"
sleep 2
wget https://updates.interworx.com/interworx/7/install.sh
sleep 1
# Install interworx
echo "System >> Instal Interworx"
sleep 2
sh install.sh
sleep 1
echo "System >> Instalation complete"
sleep 3
# Start configuring Interworx
echo "Charles >> Let's configure your license."
sleep 1
echo "What's your admin email?"
read AdminMail
sleep 1
echo "What is your admin password?"
read AdminPassword
sleep 1
echo "What is your license key?"
read LicenseKey
sleep 1
# Using information above to activate and configure Interworx 
echo "Charles >> Activating and configuring Interworx"
~iworx/bin/goiworx.pex --key=$LicenseKey --email=$AdminMail --password=$AdminPassword --ignorechecks

fi
# Summary and general info
sleep 2
echo "Charles >> Interworx has now been installed on http://$(hostname -i)/nodeworx/ and http://$(hostname -i)/siteworx/!"
echo "Charles >> Have a look at http://$(hostname -i)/nodeworx/ to complete the setup of Interworx."
echo "Charles >> If you have any problems with the installation, try running the installer again."
echo "Charles >> If your problem still exists, run every command seperately or contact Interworx support."
echo "Charles >> Thank you for using the Interworx Installer!"
echo "Charles >> Have a nice day!"
sleep 3
echo "Credits for installer: by https://github.com/RicBaller/Scripts/tree/main/Linux/CentOS/Interworx/"
sleep 3
exit