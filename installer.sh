#/bin/bash

echo -e "TarbStall Installer\n"
sleep 3
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    echo "Breaking.."
    exit 0
fi

echo "Welcome to the TarbStall installer. Would you like to install TarbStall? (Y/n)"
read -p "> " install
if [ $install = n ]; then
    exit 0
else
    if grep -iq "chromeos" /etc/os-release; then
        mkdir /usr/local/bin/TarbStall
        git clone https://github.com/Shuniji-Labs/TarbStall.git /usr/local/bin/TarbStall
        ln -s /usr/local/bin/TarbStall/tarbstall.sh /usr/local/bin/tarbstall
        mkdir /usr/local/bin/TarbStall/tmp
        chmod +x /usr/local/bin/tarbstall
        touch /usr/local/bin/TarbStall/packages/sources.txt
        echo -e chromeos >> /usr/local/bin/TarbStall/packages/sources.txt
        echo "Run this command in your terminal for crosh compatibility: curl -LO https://raw.githubusercontent.com/chromebrew/crew-sudo/refs/heads/main/install.sh && bash install.sh"
    else
        mkdir /usr/local/bin/TarbStall
        git clone https://github.com/Shuniji-Labs/TarbStall.git /usr/local/bin/TarbStall
        ln -s /usr/local/bin/TarbStall/tarbstall.sh /usr/local/bin/tarbstall
        mkdir /usr/local/bin/TarbStall/tmp
        chmod +x /usr/local/bin/tarbstall
        touch /usr/local/bin/TarbStall/packages/sources.txt
        echo -e linux >> /usr/local/bin/TarbStall/packages/sources.txt
    fi
fi
echo "TarbStall should be installed!"
