#!/bin/bash

source helpers/logging.sh

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

ERROR_MESSAGE="unknown parameter, use help for options."
ERROR_MESSAGE2="Search by Topic is limited to one tag."

###
# Functions
###
help_message()
{
	echo -e "Usage: \033[0;35mHow_To.sh \033[0;32m[option1] \033[0;33m[option2] \033[0;36m[option3]\033[0m"
	purple "\nOPTIONS:"
	green "\
 help		Show this page
 list		List all HowTos (default behavior)
 new		Create a new HowTo
 open		Open the HowTo directory
 g		search HowTo names for search term"
	yellow "  term		Search term"
	blue "   open		open the result of the search"
	green "\
 <topic tag>	Search HowTos by topic (see TAG below)
 <numeric key>	open HowTo associated with key"
	yellow "  mvi		open HowTo associated with key in MacVim"
	purple "\nTAG		TOPIC"
	green "\
 b		Bash Commands. Note: Many have script written, see ~/BashScripts directory
 c		Code. Things related to code (pulling, commiting, reviewing, etc)
 s		Servers. (setup, connect, verify, etc.)
 t		Text. edit, search, etc
 m		Miscellaneous"
}

get_number()
{
	NUMBER=$(($(find $DIRECTORY -type f -maxdepth 1 | awk -F \/\/ '{print $2}' | grep '^[a-z]' | awk -F \_ '{OFS="\t"}{print $2}' | sort -rn | head -1)+1))
	# @TODO: if number is <10, make it double digit
}

list_howtos()
{
	blue 'Key  HowTo'
	find $DIRECTORY -type f -maxdepth 1 | awk -F \/\/ '{print $2}' | grep '[0-9]' | awk -F \_ '{OFS="   "}{print $2, $3}' | sort -n
	# NOTE: grep excludes README and .DS_Store, all HowTos start with a lowercase tag for the topic
}

make_new_howto()
{
	read -p "$NEW_MESSAGE1" TYPE
	read -p "$NEW_MESSAGE2" ANSWER
	get_number
	touch $DIRECTORY$TYPE\_$NUMBER\_$ANSWER.md
	open -a MacVim $DIRECTORY$TYPE\_$NUMBER\_$ANSWER.md
}

list_by_category()
{
	blue 'Key	HowTo'
	find $DIRECTORY -type f -maxdepth 1 | awk -F \/\/ '{print $2}' | awk -F \_ -v pattern="$1" '$1 ~ pattern {print $2, $3}' | awk '{OFS="\t"}{print $1,$2}'
}

open_howto()
{
	if [ -z "$2" ]; then # default (no second parameter)
		find $DIRECTORY -type f -maxdepth 1 -name '[a-z]*'$1'*' -exec open -g -a "Google Chrome" {} \;
		exit 0
	fi

	case $2 in
		"mvi") find $DIRECTORY -type f -maxdepth 1 -name '[a-z]*'$1'*' -exec open -a "MacVim" {} \; ;;
		"help") purple "use mvi to open HowTo in MacVim" ;;
		*) red "$ERROR_MESSAGE" && exit 1;;
	esac
}

search_howtos()
{
	if [ -z "$1" ]; then
		red "must enter a search term"
		exit 1
	fi

	if [ -z $2 ]; then
		list_howtos | grep -i $1
		exit 1
	fi

	case $2 in
		"open") list_howtos | grep -i $1 | open_howto $(awk '{print $1}') ;;
		"help") purple "use open to open the HowTo from search result" ;;
		*) red "$ERROR_MESSAGE" && exit 1;;
	esac
}

###
# Main body of script starts here
###

if [  -z "$1" ]; then # default (no parameter)
	list_howtos
	purple 'Use "help" for more options'
	exit 0
fi

case $1 in
	"list") list_howtos;;
	"new") make_new_howto;;
	"open")	open $DIRECTORY;;
	"g") search_howtos $2 $3;;
	[[:alpha:]]) list_by_category $1;;
	[[[:digit:]][[:digit:]]) open_howto $1 $2;;
	[[:digit:]] | [[:digit:]][[:digit:]]*) red 'must enter a two digit key (01 instead of 1 or 001)';;
	"help") help_message ;;
	*) red "$ERROR_MESSAGE" && red "$ERROR_MESSAGE2" && exit 1;;
esac
