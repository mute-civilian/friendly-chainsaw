# AWK cheatsheet

## Remove newlines from quoted text
This will spit out everything, replacing \n within quotes with a space
```bash
awk -v RS='"' 'NR % 2 == 0 { gsub(/\n/, " ") } { printf("%s%s", $0, RT) }' {FILE}
```
It does not handle escaped quotes. For example, `"He said: \"this is a direct quote.\""` will not work as desired.

## Loop through fields
`{for(i=1; i<=NF; i++) {print $i}}`

## Replace a field separator
This will replaces `,` with `;`
```bash
awk -F \, '{out=""; for(i=1;i<=NF;i++) {out=out";"$i};print out}'""})""}
```

## Print Field number and field
```bash
head -1 {FILE} | awk '{ for (i=1; i<=NF; ++i) {print i, $i} }'
```

## Replace every other \n with a comma
```bash
awk '{ORS=(NR%2?", ":"\n")}1' {FILE}
```
