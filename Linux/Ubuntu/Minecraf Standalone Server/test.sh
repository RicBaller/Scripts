#!/bin/bash

# BAT / CMD goto function
function goto
{
    label=$1
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

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

# Just for the heck of it: how to create a variable where to jump to:
start=${1:-"start"}
goto "$start"

: start
goto_msg="Starting..."
echo $goto_msg
# Just jump to the label:
goto skipped

: skipped
goto_msg="This is skipped!"
echo "$goto_msg"
goto continue

: continue
goto_msg="Ended..."
echo "$goto_msg"