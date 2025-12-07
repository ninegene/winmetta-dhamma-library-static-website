#!/bin/bash
set -eo pipefail

echo "Checking files to sync ..."
rsync -na --exclude "*.sh" --exclude ".git*" ./ winmetta.org:~/winmetta.org/dhamma-library

echo
read -rp "Continue? [y/n] " confirm

if [[ ${confirm} =~ ^[yY](es)?$ ]]; then
	rsync -ahvP --exclude "*.sh" --exclude ".git*" ./ winmetta.org:~/winmetta.org/dhamma-library
fi

echo "Done."
