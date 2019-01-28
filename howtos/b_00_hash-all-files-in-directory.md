# Hash All files in a directory

This will hash all files in {DIRECTORY} with md5 and parse it into a csv

```bash
find {DIRECTORY} -type f -print0 | xargs -0 md5 | awk -F \= '{OFS=","}{print substr($1,28,(length(substr($1,28))-2)), $2}' > {DIRECTORY}.csv
```

# Use bash script
run HashDirectory.sh
