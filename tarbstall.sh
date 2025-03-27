help="We do not have any commands yet :skull:, to get commands you should jump off a cliff. that will immediately grant you commands."

if [ ! -f .inited ]; then
    bash init.sh
fi

if [ "$1" = help ]; then
    echo "$help"
elif [ "$1" = install ]; then
    sudo bash "packages/$2.sh"
elif [ -z "$1" ]; then
    echo "$help"
fi
