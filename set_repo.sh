#!/bin/bash

if [ -z "$1" ]; then
	echo 'setting repo alias to current directory. You can also pass in a path.'
	DIRECTORY=$(pwd)
else
	DIRECTORY=$1
fi

sed -i '' -e "s:alias repo=.*:alias repo='cd $DIRECTORY':" ~/.bash_profile
alias repo="cd $DIRECTORY"
echo Set repo alias to $DIRECTORY and replaced in bash profile too.
