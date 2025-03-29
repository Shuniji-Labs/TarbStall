#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
echo_red() { echo -e "${RED}$1${NC}" }
echo_yellow() { echo -e "${YELLOW}$1${NC}" }
echo_green() { echo -e "${GREEN}$1${NC}" }
clear
tput cup 0 0
echo -e "TarbStall Installer\n"
sleep 2

if [[ $EUID -ne 0 ]]; then
    echo_red "This script must be run as root."
    exit 0
fi

install_tarbstall() {
    echo -e "\nSetting up directories..."
    mkdir /usr/local/bin/TarbStall || { echo_red "oh noezies i failed making the directory shit oh god no bad"; exit 0; }

    echo -e "\nDownloading TarbStall..."
    git clone -q https://github.com/Shuniji-Labs/TarbStall.git /usr/local/bin/TarbStall || { echo_red "damn vro the download failed, you sure u have internet?"; exit 0; }

    echo -e "\nCreating symlink..."
    ln -s /usr/local/bin/TarbStall/tarbstall.sh /usr/local/bin/tarbstall || echo_yellow "jesus christ bro this symlink aint working shit."

    echo -e "\nPreparing temporary storage..."
    mkdir /usr/local/bin/TarbStall/tmp || echo_yellow "god damn the tmp directory didn't wanna get made, anyway run this command: sudo mkdir /usr/local/bin/TarbStall/tmp"

    echo -e "\nSetting permissions..."
    chmod +x /usr/local/bin/tarbstall || echo_red "chmod +x jumped off a cliff somehow."
}

echo -e "would you like to install TarbStall? (y/n)"
read -p "> " user_choice

if [[ $user_choice == "n" || $user_choice == "N" ]]; then
    exit 0
elif [[ $user_choice == "y" || $user_choice == "Y" ]]; then
    install_tarbstall
else
    exit 0
fi

echo_green "TarbStall installation complete!"
