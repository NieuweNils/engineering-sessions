``` 
init_git_repo.sh
#! /bin/bash
git init new_repo

cd new_repo
echo "hello, github!" > README.md
git status

git add README.md
git status

git commit --message 'Commit a file to make this repo better for this reason'
git status

git remote -v
git remote add origin git@github.com:NieuweNils/empty_repo_for_tutorial.git
git remote -v

git pull
git push origin main
git status
```