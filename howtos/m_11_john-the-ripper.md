# John the Ripper
## Format for password
1. username:$algorithm$hash$salt
2. Magento - md5($salt.$password)
3. user:$dynamic_1017$hash$salt

## Crack easy passwords
```bash
john -single passwordfile
```

## Crack with wordlist and variations (password, p@ssword)
```bash
john --wordlist='WordList' --rules=single passwordfile
```

## View cracked passwords
```bash
john -show passwordfile
```

## View status of Saved/Interrupted file
```bash
john -status
```
