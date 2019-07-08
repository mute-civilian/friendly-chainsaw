#!/bin/bash

source helpers/logging.sh

if [ -z "$1" ]; then
	blue 'setting repo alias to current directory. You can also pass in a path.'
	DIRECTORY=$(pwd)
else
	DIRECTORY=$1
fi

alias repo="cd $DIRECTORY"

if [ -f ~/.repo.sh ]; then
	sed -i '' -e "s:alias repo=.*:alias repo='cd $DIRECTORY':" ~/.repo.sh
	green "Set repo alias to $DIRECTORY and replaced in profile too."
else
	red '.repo.sh does not exist in home directory. Alias will not persist.'
fi
