# Replace or Count text
## replace `,` with `\n`
```bash
tr , '\n' < {FILE}
```

## make everything lowercase
```bash
`tr [A-Z] [a-z]`
```

## replace tab with pipe
```bash
`sed $'s/\t/|/g' {FILE}`
```

## count how many e's are in file
```bash
cat {FILE} | tr -cd 'e' | wc -c
# -cd means delete anything that is NOT in given pattern
```
