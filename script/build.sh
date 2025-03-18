yarn build
cd ../dist
git init
git remote add origin https://github.com/suklins-ice/torpedo-document.git
git add .
git commit -m "Update document"
git branch -M gh-pages
git push -u origin gh-pages