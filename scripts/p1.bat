git init -b main
echo Hello Git> notes.txt
git status -s
git add notes.txt
git commit -q -m "Add notes"
git branch feature
git switch feature
echo Feature line>> notes.txt
git diff --stat
git commit -q -am "Update notes on feature branch"
git switch main
git merge feature
