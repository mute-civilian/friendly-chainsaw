# Git Cheatsheet
## Clone a repository
```bash
git clone shh://{URL}
```

## Create a branch
```bash
git checkout -b {BRANCH NAME}
```

### Branch naming convention
- feature/{JIRA TICKET}-description-of-change
- bugfix/
- hotfix/

## Switch to a branch
```bash
git checkout {BRANCH NAME}
```

## Add file
```bash
git add {FILE NAME}
```

## Commit
```bash
git commit -m "{MESSAGE}"
```

## Push Changes
```bash
git push
```

## open repo in browser
```bash
stash browse
```

## create a pull request
```bash
stash pull-request topicBranch master
```

### setup commit to use Personal Access Token
```bash
git config remote.origin.url "https://{ACCESS_TOKEN}@github.com/{PROJECT}/{{REPO}}"
```
