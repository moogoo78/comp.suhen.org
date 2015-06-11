Web Develop
========================


Webhooks: "user-defined HTTP callbacks"

Design
-------------

Typography
~~~~~~~~~~~~~

http://practicaltypography.com/typography-in-ten-minutes.html

1. body text - 最重要, 最先決定
2. point size - 通常印刷品 10-12 point, web: 15-25 pixels
3. line spacing - 行距: 120-145% point size
4. line length - 45-90 characters per line, 印刷品: page margins larger than the traditional one inch. web page: it usually means not allowing the text to flow to the edges of the browser window.
* 不要用系統預設 font

重點: http://practicaltypography.com/summary-of-key-rules.html
全文: http://practicaltypography.com/


`Web Typography for non-designers - Presslabs <http://www.presslabs.com/blog/web-typography-for-non-designers/>`__

1. Leading (space between lines)
   
   ``line-height``:120%-150% of font size
   
2. Measure (length of one line of text)
   
   ``max-width``: 45-75 characters

3. Kerning (space between pairs of letters)
   
   自己看着辦
   
4. Tracking (space between letters)
   
   ``letter-spacing``: positive or negative
   
5. Alignment (paragraph alignment)
   
   ``text-align``: left, right, center, justify

6. Size (text size)
   
   ``font-size``: ratio: 1,618/phi



工具
---------------


* `SoFresh! - It makes your CSS yummy. <http://sofresh.redpik.net/>`__ 更改 CSS 不用一直更新

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

