#!/bin/bash

# make html
cd docs; make html

# git commit 
git add .; git ci 'edited source'; git push

# deploy
cd ../gh-pages/html; gitadd .;git ci 'auto';git push origin-gh-pages
