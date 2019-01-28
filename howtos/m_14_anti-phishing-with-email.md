# Anti-phishing for email
## DMARC
- What's protected by SPF and/or DKIM and tells receiver what to do if neither of those authentication methods passes.
- Message will fail even if it passes SPF or DKIM, but fails alignment
- Policy published in public DNS as text resource records. Announce what a receiver should do with non-aligned mail
	- p=none - monitor mode. That way you can see what's failing in aggregate report
	- p=quarantine - treat message with suspicion
	- p=reject - reject the message outright.
		- fine for domains without individual human users.
		- problems with human users, mailing lists
- a subdomain can publish its own DMARC record
- Alignment:
	-	checks domain in From: field AKA 5322.From
	-	Strict - domain names must be identical
	-	Relaxed - top-level "Organizational Domain" must match. Ex - a.b.c.d.example.com.au matches example.com.au
- There may be several DKIM signatures on an email message; DMARC requires one valid signature where the domain in the d= tag aligns with the sender's domain stated in the From: header field.
- DNS record
	- DMARC published in DNS with subdomain label _dmarc (_dmarc.example.com)
	- name=value tags sperarated by semicolons
	- v - version
	- p - policy
	- sp - subdomain policy
	- pct - percent of "bad" emails on which to apply policy
	- rua - URI to send aggregate report to.
	- Example:
		`v=DMARC1;p=none;sp=quarantine;pct=100;rua=mailto:dmarcreports@example.com;ruf=mailto:dmarcreports@example.com`
- Reports
	- Aggregate
		- sent to address specified under rua
		- XML file sent daily
	- Forensic
		- sent to address specified under ruf
		- sent in real time
		- redacted copies of individual emails that failed SPF/DKIM/both based on value spcified in fo tag
		- resembles that of regular bounces

## SPF
- checks that the IP address of the sending server is authorized by the owner of the domain that appears in the SMTP MAIL FROM command.
- The email address in the MAIL FROM is also called the envelop-from or 5321.MailFrom

## DKIM
- 2 operations: signing and verifying
- parts of an email message are cryptographically signed.
- can choose which header fields to sign but must include From:
- within the DKIM-Signature mail header:
	- d= (domain)
	- s= (selector) tags specify where in DNS to retrieve the public key for signature
