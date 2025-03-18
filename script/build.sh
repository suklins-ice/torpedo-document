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

# Pull the latest changes from the remote repository
git pull origin gh-pages --allow-unrelated-histories

# Add all files to the staging area
git add .

# Commit the changes
git commit -m "Update document"

# Set the branch to gh-pages
git branch -M gh-pages

# Push the changes to the remote repository
git push -u origin gh-pages