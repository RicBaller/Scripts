#!/bin/bash
#
echo "Charles >> Hello and welcome to the Interworx Installer!"
sleep 2
echo "Charles >> I'm Charles and I wil be your guide."
sleep 3

echo "Charles >> Please enter your Interworx license key."
read License_Interworx
sleep 2

echo "Charles >> Have you allready updated Yum?"
sleep 1
echo "System >> Press \"n\" to let me update it for you."
echo "System >> Press \"y\" if you are sure that it is up-to-date."
read Yum_Update

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

if [ "$Yum_UpToDate" == true ]; then
sleep 2
echo "Charles >> If you want to cancel, you can do so within 10 seconds."
sleep 10
echo "System >> Download Interworx"
sleep 2
wget https://updates.interworx.com/interworx/7/install.sh
sleep 1
echo "Instal Interworx"
sleep 2
sh install.sh

elif [ "$Yum_UpToDate" == false ]; then
sleep 2
echo "Charles >> If you want to cancel, you can do so within 10 seconds."
sleep 10
echo "System >> Update Yum"
sleep 2
yum update
sleep 1
echo "System >> Download Interworx"
sleep 2
wget https://updates.interworx.com/interworx/7/install.sh
sleep 1
echo "System >> Instal Interworx"
sleep 2
sh install.sh

fi
sleep 2
echo "Charles >> Interworx has now been installed on http://$(hostname -i)/nodeworx/ and http://$(hostname -i)/siteworx/!"
echo "Charles >> Have a look at http://$(hostname -i)/nodeworx/ to complete the setup of Interworx."

done
