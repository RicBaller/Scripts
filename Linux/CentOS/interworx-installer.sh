echo "Hello and welcome to the Interworx Installer"
echo "I'm Charles and I wil be your guide"

echo "Press any key to continue"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "waiting for the keypress"
fi

echo "Please enter your Interworx license key."
read License_Interworx

echo "Have you allready updated Yum?"
echo "Press \"n\" to let me update it for you."
echo "Press \"y\" if you are sure that it is up-to-date."

read Yum_Update

if [ "$Yum_Update" == "y" ]; then
    echo "Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "yes" ]; then
    echo "Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "Y" ]; then
    echo "Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "Yes" ]; then
    echo "Than we'll continue the installation of Interworx."
    Yum_UpToDate=true
elif [ "$Yum_Update" == "n" ]; then
    echo "Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "no" ]; then
    echo "Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "N" ]; then 
    echo "Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
elif [ "$Yum_Update" == "No" ]; then 
    echo "Than we'll update that first as Interworx won't install without it being up-to-date."
    Yum_UpToDate=false
else
    echo "Press a key givven above"
fi

if [ "$Yum_UpToDate" == true ]; then
wget https://updates.interworx.com/interworx/7/install.sh
sh install.sh


elif [ "$Yum_UpToDate" == false ]; then
yum update
wget https://updates.interworx.com/interworx/7/install.sh
sh install.sh

fi
echo "Interworx has now been installed on http://$(hostname -i)/nodeworx/ and http://$(hostname -i)/siteworx/!"
echo "Have a look at http://$(hostname -i)/nodeworx/ to complete the setup of Interworx."

done
