#!/bin/bash

# make html
pushd docs; make html

# git commit 
popd
git add .; git ci 'edited source'; git push

# deploy
cd ../gh-pages/html; git add .;git ci 'auto';git push origin gh-pages:w

