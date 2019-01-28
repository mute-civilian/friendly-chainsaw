# OWASP Security Shepherd
1. Import the VM to your hyper visor (Eg: Virtual Box)
2. Update the VM Network Adapters to suit what you have available. (Bridged Adapter for Network Availability, Host-Only for local access only and NAT for just outbound access) The VM by default has 2 Network adapters, one NAT and a Host-Only.
3. Boot the VM
4. Sign in with `securityshepherd` / `owaspSecurityShepherd`
5. Change the user password with the passwd command
6. In the VM, run "ifconfig" to find the IP address of the network adapter that is not configured for NAT. Make note of this
7. On your host machine, open https://<VM IP Address>/
8. Sign in with `admin` / `password`
9. Change the admin password (cannot be password again)
10. Go to Admin -> Module Management -> Change Module Layout to change the way levels are presented. Default is CTF Mode (One at a time)
11. Time to play!
