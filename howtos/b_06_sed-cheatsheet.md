# Sed Cheat sheet

## replace string in place
```bash
sed -i '' -e 's/string1/string2/g' {FILE}
```
	-i = in place
	-e = expression/command
	s/ = substitute
	/g = global (replace all instead of first)

NOTE: MacOSX does NOT support case-insensitive searching

## pass multiple commands at once
```bash
sed -i '' -e 's/string1/string2/g; s/string3/string4/; s/string5/string6/
```
