from fabric.api import *


def html():
    local('cd docs; make html;')

def deploy():
    html()
    local("cd ../gh-pages/html; git add . ;git ci 'auto';git push origin gh-pages")

def open():
    local('cd ../gh-pages/html; open index.html')
