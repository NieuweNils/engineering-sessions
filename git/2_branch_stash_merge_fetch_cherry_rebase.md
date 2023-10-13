``` 
init_git_repo.sh


git branch branch_name
git checkout branch_name

git checkout -b branch_name # shorthand for above 2 commands

git stash
git stash save descriptive_name
git stash apply
git stash apply descriptive_name

git fetch 
git merge main

git pull # == git fetch & git merge [current_branch]

git checkout main 
git cherry-pick [commit_hash_from_branch_name]

git checkout branch_name 
touch new_file.txt
git add new_file.txt
git commit --message "add new file"

git checkout main
touch another_file.txt
git add another_file.txt
git commit --message "add another file"

# to consolidate all changes in branch_name, you now have a couple of options:
# 1
git checkout branch_name
git merge main

#2
git checkout branch_name
git rebase main

git revert [commit_hash]
git reset [commit_hash]

git push --force
``` 
