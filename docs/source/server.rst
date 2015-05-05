Server 
==============

BUILD_TOOLS='gcc python-devel'
DEV_TOOLS='git vim'
SERV_DB='mysql-devel mysql-python'

debian, dpk
-------------

sudo apt-get update
sudo apt-get -V upgrade
sudo agt-get install -y $BUILD_TOOLS $DEV_TOOLS $SERV_DB

centos, redhat RPM
--------------------

sudo yum update -y
sudo yum install -y $BUILD_TOOLS $DEV_TOOLS $SERV_DB




pip

virtualenvwrapper
