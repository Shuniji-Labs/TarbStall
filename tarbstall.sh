#/bin/bash

platform=$(cat /usr/local/bin/TarbStall/packages/sources.txt)
help="HELP - Shows this help message
INSTALL - Installs a package, packages available are in /packages
SEARCH - Searches for packages to install in /packages
UPDATE - Fetches package updates and TarbStall updates"

if [ "$1" = help ]; then
    echo "$help"
elif [ "$1" = install ]; then
    if [ -z "$2" ]; then
        echo "Specify a package for fucks sake"
    elif [ -f "/usr/local/bin/TarbStall/packages/$platform/$2.sh" ]; then
        echo "Are you sure you want to install $2? Y/n"
        read install
        if [ $install = n ]; then
            exit 0
        else
            if grep -iq "chromeos" /usr/local/bin/TarbStall/packages/sources.txt; then
                if [ "$2" = crew-sudo ]; then
                    cd ~
                    curl -LO https://raw.githubusercontent.com/chromebrew/crew-sudo/refs/heads/main/install.sh && bash install.sh
                fi
            else
                sudo bash "/usr/local/bin/TarbStall/packages/$platform/$2.sh"
            fi
        fi
    else
        echo "Package $2 not found. :sob:"
    fi
elif [ "$1" = search ]; then
    if [ -z "$2" ]; then
        echo "Specify a package for fucks sake"    
    else
        echo Available packages are:
        cd /usr/local/bin/TarbStall/packages/$platform
        ls *$2*.sh | sed 's/.sh$//'
        cd ~/ #placeholder until fix
    fi
elif [ "$1" = update ]; then
    echo Updating TarbStall...
    sleep 1
    mkdir "/tmp/tarbstall-update"
    git clone https://github.com/Shuniji-Labs/TarbStall.git /tmp/tarbstall-update
    sudo cp -vr /tmp/tarbstall-update/* "/usr/local/bin/TarbStall"
    rm -rf "/tmp/tarbstall-update"    
elif [ -z "$1" ]; then
    echo "$help"
fi
