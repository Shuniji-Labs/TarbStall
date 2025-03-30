#/bin/bash

help="HELP - Shows this help message
INSTALL - Installs a package, packages available are in /packages
SEARCH - Searches for packages to install in /packages
UPDATE - Fetches package updates and TarbStall updates"

if [ "$1" = help ]; then
    echo "$help"
elif [ "$1" = install ]; then
    if [ -z "$2" ]; then
        echo "Specify a package for fucks sake"
    elif [ -f "/usr/local/bin/TarbStall/packages/$2.sh" ]; then
        echo "Are you sure you want to install $2? Y/n"
        read install
        if [ $install = n ]; then
            exit 0
        else
            sudo bash "/usr/local/bin/TarbStall/packages/$2.sh"
        fi
    else
        echo "Package $2 not found. :sob:"
    fi
elif [ "$1" = search ]; then
    if [ -z "$2" ]; then
        echo "Specify a package for fucks sake"    
    else
        echo Available packages are:
        cd /usr/local/bin/TarbStall/packages/
        ls *$2*.sh | sed 's/.sh$//'
        cd ~/ #placeholder until fix
    fi
elif [ "$1" = update ]; then
    echo Updating TarbStall...
    sleep 1
    rm -rf "/tmp/tarbstall-update"
    mkdir "/tmp/tarbstall-update"
    git clone https://github.com/Shuniji-Labs/TarbStall.git /tmp/tarbstall-update
    sudo cp -vr /tmp/tarbstall-update/* "/usr/local/bin/TarbStall"
elif [ -z "$1" ]; then
    echo "$help"
fi
