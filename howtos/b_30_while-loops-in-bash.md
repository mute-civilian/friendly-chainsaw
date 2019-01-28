# While loops
## Read from file line by line
```bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Text read from file: $line"
done < {FILENAME}
```
## Read from piped input line by line
```bash
{some command} | while read $line; do
	echo "this was passed in: $line"
done
```
