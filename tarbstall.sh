help="HELP - Shows this help message
INSTALL - Installs a package, packages available are in /packages
SEARCH - Searches for packages to install in /packages
UPDATE - Fetches package updates and TarbStall Updates"

if [ ! -f .inited ]; then
    bash init.sh
    exit 0
fi
if [ "$1" = help ]; then
    echo "$help"
elif [ "$1" = install ]; then
    if [ -z "$2" ]; then
        echo "Specify a package for fucks sake"
    elif [ -f "packages/$2.sh" ]; then
        echo "Are you sure you want to install $2? Y/n"
        read install
        if [ $install = n ]; then
            exit 0
        else
            sudo bash "packages/$2.sh"
        fi
    else
        echo "Package $2 not found. :sob:"
    fi
elif [ "$1" = search ]; then
    if [ -z "$2" ]; then
        echo "Specify a package for fucks sake"    
    else
        echo Available packages are:
        cd packages
        ls *$2*.sh | sed 's/.sh$//'
        cd ..
    fi
elif [ "$1" = update ]; then
    rm -rf "/tmp/tarbstall-update"
    mkdir "/tmp/tarbstall-update"
    git clone https://github.com/Shuniji-Labs/TarbStall.git /tmp/tarbstall-update
    if [ "$TARBSTALL_INSTALLED" = 1 ]; then
        cp -vr /tmp/tarbstall-update/* "/usr/local/bin/tarbstall"
    else
        cp -vr /tmp/tarbstall-update/* "$PWD"
    fi
elif [ -z "$1" ]; then
    echo "$help"
fi