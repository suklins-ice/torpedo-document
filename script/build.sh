yarn build
cd dist
mv ../dist.git .git
git add .
git push
cp -r .git ../dist.git
git subtree push --prefix dist origin gh-pages