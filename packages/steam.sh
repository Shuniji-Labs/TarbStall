cd tmp
curl -O https://repo.steampowered.com/steam/archive/precise/steam_latest.tar.gz
tar -xvzf steam_latest.tar.gz
cd steam-launcher
sudo make install
cd ..
rm -rf steam-launcher
rm -rf steam-latest.tar.gz