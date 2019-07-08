#!/bin/bash

source helpers/logging.sh

# directory from command line to recursively hash
if [ -z "$1" ]; then
	red "supply directory with files to hash"
	exit
elif [[ $1 = *"/" ]]; then # input must end in / so the awk command later will function properly.
	# set variable to directory
	DIR="$1"
else
	DIR="$1/"
fi

# get basename of directory to name output file
SAVETO=$(basename $DIR)

# write CSV header
echo "File, SHA256" > hashed_$SAVETO.csv

# find all files in directory and:
#		hash it if the file is NOT DS_Store
#		print filename and its hash to file
find $DIR -type f -print0 | xargs -0 openssl sha256 | awk -F \/\/ '$2 !~ /DS_Store/ {print $2}' | awk -F \= '{match($1,"\\)")}{OFS=","}{print substr($1, 0, RSTART-1), $2}' >> hashed_$SAVETO.csv

green "hashes saved to hashed_$SAVETO.csv"
