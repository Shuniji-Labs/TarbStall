echo TarbStall Installer
sleep 3
echo "Welcome to the TarbStall installer. Would you like to install TarbStall? Y/n"
read install
if [ $install = n ]; then
    exit 0
else
    mkdir tmp
    touch .inited
    sudo git clone https://github.com/Shuniji-Labs/TarbStall.git /usr/local/bin
    sudo ln -s /usr/local/bin/TarbStall/tarbstall.sh /usr/local/bin/tarbstall
fi
echo TarbStall should be installed!
