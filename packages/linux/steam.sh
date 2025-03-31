#/bin/bash

if command -v pacman &>/dev/null; then
    if grep -qE '^\[multilib\]' /etc/pacman.conf && grep -qv '^#' /etc/pacman.conf; then
        echo "multilib is already enabled. we dont have to enable it :yippee:"
    else
        echo "dumbass forgot to enable multilib :skull:"
        sudo sed -i '/^\[multilib\]/,/^$/s/^#//g' /etc/pacman.conf
    fi
    sudo pacman -Sy --noconfirm base-devel lib32-glibc lib32-libgl lib32-libdrm
elif command -v apt-get &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y build-essential lib32-glibc libgl1-mesa-glx libdrm2
else
    echo "we do not like you stinky non arch/debian users"
    exit 1
fi

mkdir /usr/local/bin/packages/installed/steam
cd /usr/local/bin/TarbStall/tmp
curl -O https://repo.steampowered.com/steam/archive/precise/steam_latest.tar.gz
tar -xvzf steam_latest.tar.gz
cd steam-launcher
./configure
make
sudo make install DESTDIR=/usr/local/bin/TarbStall/packages/installed/steam
cd ..
rm -rf steam-launcher
rm -f steam-latest.tar.gz
