# Interworx Installer
This is a instal-script to install Interworx on CentOS. Please read the instrucions while using the script.

## Installation

1. Make sure you are logged in as root user, or with root permissions, and you are in the `/root` folder.

2. Download the file using this command : 

`wget https://raw.githubusercontent.com/RicBaller/Scripts/main/Linux/CentOS/Interworx/installer.sh`

3. Activate the script using this command: `sh installer.sh`
4. Follow the steps carefully.
## FAQ
### I can not get Interworx installed. It is saying something about Yum.
Please run the install script again and choose the option to update Yum. This will fix most of the problems you

### The installer has an error. What can I do?
Please open the installer file and enter every command seperately. This way you get all the feedback from the machine without the automation. This gives you time to analyze the problem. If that lies with your machine, please solve the issue. If the problem lies with Interworx, contact Interworx support. If it lies with the script, please let me know via a issue in the repo.
