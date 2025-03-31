#/bin/bash

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
ln -s /usr/local/bin/TarbStall/packages/installed/steam/usr/bin/steam /usr/local/bin/steam2
