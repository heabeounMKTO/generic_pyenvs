#! /usr/bin/bash

SELECTENV=$(cat available.txt | gum choose) 
echo "activating $SELECTENV"

