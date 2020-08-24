# comp.suhian.li


## repo

    # project root directory
    $ mkdir comp
    $ cd comp
    # get default branch: gh-pages
    $ mkdir gh-pages
    $ cd gh-pages
    $ git clone git@github.com:moogoo78/comp.suhen.org.git # will clone gh-pages branch
    $ mv comp.suhian.org html
    # get master branch
    $ cd .. # back to project root
    $ mkdir master
    $ cd master
    $ git clone git@github.com:moogoo78/comp.suhen.org.git -b master # clone master

## build

    $ cd docs
    $ make html

## fab

	$ fab html # make html
  $ fab open # make html & open browser
  $ fab deploy # deploy to github 
