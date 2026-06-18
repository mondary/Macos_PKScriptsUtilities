#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title DL2desk
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName DL2desk.sh

# Documentation:
# @raycast.description DL 2 desktop
# @raycast.author Cmondary
# @raycast.authorURL https://github.com/mondary

move_downloads() {
    find ~/Downloads -type f ! -name "*.tmp" ! -name "*.crdownload" -exec mv {} ~/Desktop/ \;

    for folder in ~/Downloads/*; do
        if [[ -d "${folder}" ]]; then
            mv "${folder}" ~/Desktop/
        fi
    done
}

if [ "$1" = "--once" ]; then
    move_downloads
    exit $?
fi

while true; do
    move_downloads
    sleep 5
done