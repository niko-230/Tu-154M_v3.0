#!/bin/bash
# push_to_github.sh
# Uploads this aircraft folder to GitHub in batches that stay under GitHub's 2 GB-per-push limit.
# Works for an empty repo AND for a repo that already has history (it builds on top of it).
# Place this file in the aircraft root folder and run:  bash push_to_github.sh

set -e

REPO_URL="${1:-https://github.com/niko-230/Tu-154M_XP12_sasl3_project.git}"
BRANCH="main"
LIMIT=1500          # MB per push (GitHub hard limit is 2000)
N=0

cd "$(dirname "$0")"
echo "Folder: $(pwd)"
echo "Repo:   $REPO_URL"
echo

command -v git >/dev/null || { echo "git is not installed. Run:  xcode-select --install   then run this script again."; exit 1; }
[ -f .gitignore ] || { echo "Missing .gitignore in this folder. Put the .gitignore file next to this script first."; exit 1; }

echo "== Checking for files over 100 MB (GitHub refuses these) =="
BIG=$(find . -path ./.git -prune -o -type f -size +100M -print)
if [ -n "$BIG" ]; then
  echo "$BIG"
  echo "Stopped: the files above are too big for GitHub. Nothing was uploaded."
  exit 1
fi
echo "OK, none found."
echo

if [ -z "$(git config --global user.name)" ]; then
  read -r -p "Your name for commits: " GN;  git config --global user.name "$GN"
  read -r -p "Your GitHub email:     " GE;  git config --global user.email "$GE"
fi

[ -d .git ] || git init -q
git symbolic-ref HEAD "refs/heads/$BRANCH"
git config http.postBuffer 524288000
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

if git ls-remote --exit-code --heads origin "$BRANCH" >/dev/null 2>&1; then
  echo "Repo already has a '$BRANCH' branch - building on top of its history (your local files are NOT touched)."
  git fetch -q origin "$BRANCH"
  git reset -q "origin/$BRANCH"
else
  echo "Repo is empty - starting fresh."
fi
echo

flush() {
  [ ${#batch[@]} -eq 0 ] && return 0
  git add -A -- "${batch[@]}"
  if ! git diff --cached --quiet; then
    N=$((N+1))
    git commit -q -m "Project upload, part $N"
    echo "== Part $N (~${total} MB) =="
    printf '   %s\n' "${batch[@]}"
  fi
  # Push whenever there is anything not yet on GitHub (also catches parts left over from an interrupted run)
  if git rev-parse -q --verify HEAD >/dev/null; then
    if ! git rev-parse -q --verify "origin/$BRANCH" >/dev/null || [ -n "$(git rev-list "origin/$BRANCH..HEAD")" ]; then
      echo "   pushing..."
      git push -u origin "$BRANCH"
    fi
  fi
  batch=(); total=0
}

upload_dir() {
  local batch=() total=0 c s
  while IFS= read -r -d '' c; do
    [ "$c" = "./.git" ] && continue
    git check-ignore -q "$c" && continue
    s=$(du -sm "$c" | cut -f1)
    if [ -d "$c" ] && [ "$s" -gt "$LIMIT" ]; then
      flush
      upload_dir "$c"
    else
      [ $((total + s)) -gt "$LIMIT" ] && flush
      batch+=("$c"); total=$((total + s))
    fi
  done < <(find "$1" -mindepth 1 -maxdepth 1 -print0)
  flush
}

upload_dir "."

# Final pass: picks up deleted files and anything left over
batch=(".") ; total=0 ; flush

echo
echo "Done. Everything is on GitHub: ${REPO_URL%.git}"
