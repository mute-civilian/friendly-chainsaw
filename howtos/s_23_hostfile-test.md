# Hostfile test
`vim /private/etc/hosts` and Enter IP and hostname like this:

xxx.xxx.xxx.xxx		hostname

NOTE: You may have to flush DNS cache for mapping to take effect.

```bash
sudo killall -HUP mDNSResponder
```
