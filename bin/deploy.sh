#!/bin/bash
# Unpack secrets; -C ensures they unpack *in* the .travis directory
tar xvf .travis/secrets.tar -C .travis

# Setup SSH agent:
eval "$(ssh-agent -s)" #start the ssh agent
chmod 600 .travis/deploy.pem
ssh-add .travis/deploy.pem

# Setup git defaults:
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

# Add SSH-based remote to GitHub repo:
git remote add deploy git@github.com:knyshuk/environment-manager.git
git fetch deploy

# Get box and build PHAR
wget https://box-project.github.io/box2/manifest.json
BOX_URL=$(php bin/parse-box-manifest.php manifest.json)
rm manifest.json
wget -O box.phar ${BOX_URL}
chmod 755 box.phar
./box.phar build -vv

# Without the following step, we cannot checkout the gh-pages branch due to
# file conflicts:
mv em.phar em.phar.tmp

# Checkout gh-pages and add PHAR file and version:
git checkout -b gh-pages deploy/gh-pages
mv em.phar.tmp em.phar
echo $TRAVIS_TAG > em.phar.version
git add em.phar em.phar.version

# Commit and push:
git commit -m "Rebuilt phar for Environment Manager v.$TRAVIS_TAG"
git push deploy gh-pages:gh-pages
