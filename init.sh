echo TarbStall
sleep 3
echo "This is the first time you have opened TarbStall. Would you like to init? Y/n"
read yesntquestion
if [ $yesntquestion = n ]; then
    exit 0
else
    #do the other shit we need for depends such as curl/wget and make
    mkdir tmp
    touch .inited
fi