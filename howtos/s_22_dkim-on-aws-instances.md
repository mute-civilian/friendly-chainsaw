#DKIM on AWS Instance
## CentOS 6
1. 
```bash
yum install opendkim
export DOMAIN=example.com
export SELECTOR=aws
mkdir /etc/opendkim/keys/$DOMAIN
cd /etc/opendkim/keys/$DOMAIN
opendkim-genkey -d $DOMAIN -s $SELECTOR
chown -R opendkim:opendkim /etc/opendkim/keys/$DOMAIN
echo "$SELECTOR._domainkey.$DOMAIN $DOMAIN:$SELECTOR:/etc/opendkim/keys/$DOMAIN/$SELECTOR.private" >> /etc/opendkim/KeyTable
echo "*@$DOMAIN $SELECTOR._domainkey.$DOMAIN" >> /etc/opendkim/SigningTable
```
2. `vim /etc/opendkim.conf`
	- Domain example.com # though maybe this isn't needed
	- Mode sv
	- Selector aws
	- Uncomment: KeyTable, SigningTable
3. `vim /etc/postfix/main.cf`
	1. Under opendkim setup
		- smtpd_milters = inet:localhost:8891
		- non_smtpd_milters = inet:localhost:8891
		- milter_default_action = accept	
4. Restart services
```bash
service opendkim restart
service postfix restart
chkconfig opendkim on
```
