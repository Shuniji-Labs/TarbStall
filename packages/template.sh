cd /usr/local/bin/TarbStall/tmp
curl -O https://example.com/example.tar.gz
tar -xvzf example.tar.gz
cd example
./configure
make
sudo make install
cd ..
rm -rf example
rm -f example.tar.gz
