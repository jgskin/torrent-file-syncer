#! /bin/bash

orig_dir=$1

dest_dir=$2

excluded_regex="*.part"

rsync -ruvh --progress --exclude=$excluded_regex $orig_dir $dest_dir

while true; do
    read -p "Do you wish to clean the directory files?" clean
    case $clean in
        [Yy] ) find $orig_dir -type f -a -not -iname $excluded_regex -delete; exit;;
        [Nn] ) exit;;
        * ) echo "Please answer y or n.";;
    esac
done