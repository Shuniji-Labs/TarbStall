help="We do not have any commands yet :skull:"

if [ ! -f inited ]; then
    bash init.sh
fi

if [ "$1" = help ]; then
    echo "$help"
elif [ -z "$1" ]; then
    echo "$help"
fi