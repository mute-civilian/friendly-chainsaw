# Test SSH ciphers
```bash
ssh -o Ciphers=blowfish-cbc,rijndael-cbc@lysator.liu.se,cast128-cbc,aes256-cbc,arcfour,aes192-cbc,3des-cbc,arcfour128,arcfour256,aes128-cbc
```

# Test SSH MACs
```bash
ssh -o MACs=hmac-md5-96,hmac-sha1-96,hmac-md5
```
