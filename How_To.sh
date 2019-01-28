#!/bin/bash

DIRECTORY="$HOME/Documents/HowTos/"
if [ ! -d "$DIRECTORY" ]; then mkdir $DIRECTORY; fi

###
# Messages
###

NEW_MESSAGE1=\
"TAG	TOPIC
  b	Bash Commands. Note: Many have script written, see ~/BashScripts directory
  c	Code. Things related to code (pulling, commiting, reviewing, etc)
  s	Servers. (setup, connect, verify, etc.)
  t	Text. edit, search, etc
  m	Miscellaneous
What type of HowTo is it? Enter tag: "

NEW_MESSAGE2="What would you like to call it?: "

HELP_MESSAGE=\
"Usage: How_To.sh [option1] [option2]

OPTION 1:
 help		Show this page
 list		List all HowTos (default behavior)
 new		Create a new HowTo
 <topic tag>	Search HowTos by topic (see TAG below)
 <numeric key>	open HowTo associated with key
 open		Open the HowTo directory

OPTION 2:
Given option1 is a numeric key
 term		open HowTo associated with key in terminal

TAG		TOPIC
  b		Bash Commands. Note: Many have script written, see ~/BashScripts directory
  c		Code. Things related to code (pulling, commiting, reviewing, etc)
  s		Servers. (setup, connect, verify, etc.)
  t		Text. edit, search, etc
  m		Miscellaneous"

ERROR_MESSAGE="unknown parameter, use help for options. Search by Topic is limited to one tag. Key to read HowTo must be a 2-digit numeric"

###
# functions
###

get_number()
{
	NUMBER=$(($(find $DIRECTORY -type f -maxdepth 1 | awk -F \/\/ '{print $2}' | grep '^[a-z]' | awk -F \_ '{OFS="\t"}{print $2}' | sort -rn | head -1)+1))
	# TODO: if number is <10, make it double digit
}

list_howtos()
{
	echo 'Key	HowTo'
	find $DIRECTORY -type f -maxdepth 1 | awk -F \/\/ '{print $2}' | grep '[0-9]' | awk -F \_ '{OFS="\t"}{print $2, $3}' | sort -n
	# NOTE: grep excludes README and .DS_Store, all HowTos start with a lowercase tag for the topic
}

make_new_howto()
{
	read -p "$NEW_MESSAGE1" TYPE
	read -p "$NEW_MESSAGE2" ANSWER
	get_number
	vim $DIRECTORY$TYPE\_$NUMBER\_$ANSWER.md
}

list_by_category()
{
	echo 'Key	HowTo'
	find $DIRECTORY -type f -maxdepth 1 | awk -F \/\/ '{print $2}' | awk -F \_ -v pattern="$1" '$1 ~ pattern {print $2, $3}' | awk '{OFS="\t"}{print $1,$2}'
	# second awk had trouble with OFS so pipe it into a third awk to format output correctly.
}

open_howto()
{
	if [ -z "$2" ]; then # default (no second parameter)
		find $DIRECTORY -type f -maxdepth 1 -name '[a-z]*'$1'*' -exec open -a "Google Chrome" {} \;
		exit 0
	fi

	case $2 in
		"term") find $DIRECTORY -type f -maxdepth 1 -name '[a-z]*'$1'*' -exec vim {} \; ;;
		"help") echo "use term to open HowTo in terminal" ;;
		*) echo "$ERROR_MESSAGE";;
	esac
}

###
# Main body of script starts here
###

if [  -z "$1" ]; then # default (no parameter)
	list_howtos
	echo 'Use "help" for more options'
	exit 0
fi

case $1 in
	"list") list_howtos;;
	"new") make_new_howto;;
	"open")	open $DIRECTORY;;
	[[:alpha:]]) list_by_category ;;
	[[[:digit:]][[:digit:]]) open_howto $1 $2;;
	[[:digit:]] | [[:digit:]][[:digit:]]*) echo 'must enter a two digit key (01 instead of 1 or 001)';;
	"help") echo "$HELP_MESSAGE";;
	*) echo "$ERROR_MESSAGE";;
esac
