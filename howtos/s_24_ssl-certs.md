# SSL Certificates
```bash
openssl req -new -sha256 -nodes -newkey rsa:2048 -keyout customersitename.key -out customersitename.csr
```

use Registrant info
Organizational Unit Name is blank
common name is site URL
email for CSR should be blank
optional company name is blank

optional challenge password
