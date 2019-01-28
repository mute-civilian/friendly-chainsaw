# Set up a crontab

> **IMPORTANT: -r will remove the current crontab!** Set up a backup at ~/Documents/my_crontab

## Edit crontab
```bash
crontab -e
```

min hr day month dayOfWeek {Command to be executed}
(0-59) (0-23) (1-31) (1-12) (0-6 with 0=Sunday)

### Example
0 * * * * rsync -r ~/Desktop ~/Dropbox/ # every hour sync the desktop folder with a copy in Dropbox.

> /dev/null 2>&1 # add to end of command to disable mail
