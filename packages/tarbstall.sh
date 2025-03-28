echo "Warning: This will install TarbStall into /bin. Are you sure you want to do this?"
read install
if [ $install = n ]; then
    exit 0
else
    mkdir /usr/local/bin/tarbstall
    sudo cp -r "$PWD" /usr/local/bin/tarbstall
    sudo ln -s /usr/local/bin/tarbstall/tarbstall.sh /usr/local/bin/tarbstall
    echo export TARBSTALL_INSTALLED="1" >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
fi