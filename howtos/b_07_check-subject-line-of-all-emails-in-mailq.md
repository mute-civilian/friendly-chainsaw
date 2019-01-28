# Check Subject line of all emails

**NOTE: Must be root**

```bash
mailq | egrep '^[A-Z0-9]{10}'| awk '{print $1}' | \
xargs postcat -q | grep Subject | sort | uniq -c | sort -rn
```

## Example output:
	5 Subject: WARNING Intrusion Detected
	2 Subject: [psad-alert] DL1 src z:
	1 Subject: OSSEC Notification - ec2-54-244-116-165 - Alert level 2
