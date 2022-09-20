# Welcome to Down and Up!

Welcom to the Down and Up script. This script downloads a file from a set link and uploads it to a FTP server.

## What to use it for

This script has been tested on a WHMCS installation and you can download all your invoices in just 1 script instead of the PDF batch function.
It is also possible to edit the file to suit your use case / panel. In this case, I would like to hear about it.

## Requirements

- The filedownloader works with WHMCS only if you upload the gen_invoice_pdf.php in the main directory of you WHMCS installation. Credits for this file go to [@wesamly](https://stackoverflow.com/users/249645/wesamly) at StackOverflow. In [this thread](https://stackoverflow.com/a/37352831) he pulished the code. The file is also downloadable here as gen_invoice_pdf.php
- A working WHMCS installation is required.
- A server with FTP running ([Linode](https://www.linode.com/lp/refer/?r=c11406fde693cffdb17dc51b543d82b3fd615ea6) has cheap servers for hourly fee, for longer than one month [Contabo](https://contabo.com/en/) delivers bigger servers for less.)

## How to use

Change the following variables:

    - $maxcount = 1000;
Maxcount is by default set to 1000. This means it wil stop when it reaches the file with an ID higher that 1000.

    - $username = "username";
Username should be set to your username on your WHMCS panel.

    - $password = "password";
Password should be set to your password on your WHMCS panel.

    - $sleep = 1;
This is just a small timeout of 1 second to make sure the chances of being listed as a DDoS attack will be lower than without a small timeout.

    - $count = 1;
This is the start ID. Change it to fit your ID range.

    - $domain = "http://www.domain.com";
Change this to be your domain.

    - $file_prefix = "file";
This is the prefix that will be givven to the files that you download. For example, if set to "Invoice-", the filenames will be "Invoice-1.pdf".

    - $ftp_server = "ip or domain";
This should be the IP of your FTP server.

    - $ftp_user_name = "name";
This should be the name of your FTP user.

    - $ftp_user_pass = "password";
This should be the password of your FTP user.

    - $ftp_port = 21;
Your don't have to touch this variable, only if your FTP server is on a different port than the default port.
## Warning
The script to generate the invoices can be used by **EVERYONE** who has login credentials to the panel. Only leave the file in the directory until you're done. Than remove it imediately.