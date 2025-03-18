#!/bin/bash

# Remove the dist directory and rebuild
rm -rf ../dist
yarn build

# Navigate to the dist directory
cd ../dist

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
  git init
fi

# Set the remote URL
git remote set-url origin https://github.com/suklins-ice/torpedo-document.git

# Verify the remote URL
if ! git remote -v | grep -q 'https://github.com/suklins-ice/torpedo-document.git'; then
  git remote add origin https://github.com/suklins-ice/torpedo-document.git
fi

# Pull the latest changes from the remote repository
git pull origin gh-pages --allow-unrelated-histories

# Delete the local branch if it exists
if git show-ref --verify --quiet refs/heads/gh-pages; then
  git branch -D gh-pages
fi

# Delete the remote branch
git push origin --delete gh-pages

# Add all files to the staging area
git add .

# Commit the changes
git commit -m "Update document"

# Set the branch to gh-pages
git branch -M gh-pages

# Push the changes to the remote repository
git push -u origin gh-pages