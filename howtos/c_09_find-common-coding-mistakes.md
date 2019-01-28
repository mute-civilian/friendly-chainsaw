# Find Common Coding mistakes
1. Hard-coded credentials
	```bash
	ack "\.((password)|(email)|(username)) = \""
	```
2. printStackTrace() returned to end-user
	```bash
	ack "printstacktrace\(.+\)"
	```
3. HTML Comments
	```bash
	ack --html --xml "\<\!--"
	```
4. Erroneous Class Comparison, does this work?
	```bash
	ack "getclass\(\)\.getname\(\)\.equals"
	```
5. Secure Cookie Attribute Not Set
	```bash
	ack -l "new cookie" | ack -x -L "\.setsecure"
	```
6. Broadly Scoped Session Cookie Path
	```bash
	ack -B 5 "setpath\(\"/\"\)"
	```
