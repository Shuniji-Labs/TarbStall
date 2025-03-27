echo TarbStall
sleep 3
echo "This is the first time you have opened TarbStall. Would you like to init? Y/n"
read yesntquestion
if [ $yesntquestion = n ]; then
    break
else
    touch .inited
fi
