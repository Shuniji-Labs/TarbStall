#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo_red() {
    echo -e "${RED}$1${NC}"
}

echo_yellow() {
    echo -e "${YELLOW}$1${NC}"
}

echo_green() {
    echo -e "${GREEN}$1${NC}"
}

echo -e "TarbStall Installer\n"
sleep 3

if [[ $EUID -ne 0 ]]; then
    echo_red "This script must be run as root."
    echo "Breaking.."
    exit 0
fi

install_tarbstall() {
    mkdir /usr/local/bin/TarbStall || { echo_red "An error has occurred: MKDir failed."; exit 0; }
    git clone https://github.com/Shuniji-Labs/TarbStall.git /usr/local/bin/TarbStall || { echo_red "Failed cloning TarbStall!"; exit 0; }
    ln -s /usr/local/bin/TarbStall/tarbstall.sh /usr/local/bin/tarbstall || echo_red "Failed making symlink!"
    mkdir /usr/local/bin/TarbStall/tmp || echo_yellow "Failed to make temporary path. Please, open a new terminal and run 'sudo mkdir /usr/local/bin/TarbStall/tmp'"
    chmod +x /usr/local/bin/tarbstall || echo_red "Failed to give executable permission."
}

echo "Welcome to the TarbStall installer. Would you like to install TarbStall? (Y/n)"
read -p "> " user_choice

if [[ $user_choice == "n" || $user_choice == "N" ]]; then
    exit 0
elif [[ $user_choice == "y" || $user_choice == "Y" ]]; then
    install_tarbstall
else
    exit 0
fi

echo_green "TarbStall should be installed!"
