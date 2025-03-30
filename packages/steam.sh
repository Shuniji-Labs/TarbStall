#/bin/bash

cd /usr/local/bin/TarbStall/tmp
curl -O https://repo.steampowered.com/steam/archive/precise/steam_latest.tar.gz
tar -xvzf steam_latest.tar.gz
cd steam-launcher
./configure
make
sudo make install
cd ..
rm -rf steam-launcher
rm -f steam-latest.tar.gz
