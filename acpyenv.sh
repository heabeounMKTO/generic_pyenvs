#! /usr/bin/bash

echo "Choose an env to activate"
SELECTENV=$(cat available.txt | gum choose) 

subdircount=$(find ./$SELECTENV -maxdepth 1 -type d | wc -l)
if [[ "$subdircount" -eq 1 ]]
then
    echo "creating env"
    python3 -m venv ./$SELECTENV
    source ./$SELECTENV/bin/activate
    gum spin --show-output --spinner dot  --title  "installing packages" -- pip install -r $SELECTENV.txt  
else
    echo "activating $SELECTENV"
    set -e
    source ./$SELECTENV/bin/activate
fi
