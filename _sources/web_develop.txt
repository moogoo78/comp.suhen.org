Web Develop
========================


Webhooks: "user-defined HTTP callbacks"



工具
---------------

layout:

* `Placehold.it - Quick and simple image placeholders <http://www.placehold.it/>`__
* `Mockingbird <https://gomockingbird.com/mockingbird/>`__

color:

* `NIPPON COLORS - 日本の伝統色 <http://nipponcolors.com/>`__ (Firefox有問題)
* `Spectral <http://jxnblk.github.io/Spectral/>`__ 找色/配色工具 (快速簡潔)

Font:

* `WhatFont Tool - The easiest way to inspect fonts in webpages « Chengyin Liu <http://chengyinliu.com/whatfont.html>`__ 方便看網頁字體的bookmarklet


  
資源
------------------

* [✿ Our favorite set — CopyPasteCharacter.com](http://copypastecharacter.com/)
* [NounProject](http://thenounproject.com/) 剪影 icon


Web Server / daemon
-------------------------

gunicorn
~~~~~~~~~~~~~~

.. code-block:: bash
                
    $ gunicorn main:app -b 0.0.0.0

    # port 80 好像不行

uwsgi
~~~~~~~

.. code-block:: bash

    # kill existing uwsgi
    ps aux|grep uwsgi |awk '{ print $2}' | xargs --no-run-if-empty sudo kill -9
    sleep 1
    # start with virtualhost setting
    sudo uwsgi -s :9090 -M -p 4 --vhost &

    
nginx
~~~~~~~~~~

redirect test.com to www.test.com

.. code-block:: text

    server {
        server_name test.com;
        return 301 $scheme://www.test.com$request_uri;
    }



Apache
~~~~~~~~~~~~

Mac apache folder:

    /Library/WebServer/Documents
    

PHP
~~~~~~~~~

PHP session:

    /var/lib/php/session


php start:

    sudo /etc/init.d/php_cgi start


Performance
-----------------

### ab

    ab -k -c 1000 -n 1000 http://testme.com

參數:

    :::text
    k: HTTP Keep Alive
    c: concurrency (同時連線)
    n: num of requests (測試的request總數, 用完就結束)
    t: timelimit
    p: postfile
    T: content-type
    h: help

