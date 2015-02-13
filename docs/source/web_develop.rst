Web Develop
========================

名詞
-----------

Webhooks: "user-defined HTTP callbacks"


HTML
-------

* `Tips for authoring fast-loading HTML pages - Web developer guide | MDN <https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Tips_for_authoring_fast-loading_HTML_pages>`__ - 效能要讀


CSS
-----------

* `HTML5 & CSS3 Fundamentals: Development for Absolute Beginners | Channel 9 <http://channel9.msdn.com/Series/HTML5-CSS3-Fundamentals-Development-for-Absolute-Beginners>`__ 初學課程video
* `An Advanced Guide to HTML & CSS <http://learn.shayhowe.com/advanced-html-css/>`__ 進階架構
* `The truth about structuring an HTML5 page | Feature | .net magazine <http://www.netmagazine.com/features/truth-about-structuring-html5-page>`__
* `» 你從未瞭解過的 z-index | iCoding <http://www.icoding.co/2013/06/knowledge-about-z-index-2>`__


基本語法
~~~~~~~~~~~~

.. code-block:: css

    border:5px solid red; /* 常用style: none, dotted, dashed, solid, double */
    tr:nth-child(odd) { background-color:#99ff99; }

* `CSS Border <http://www.w3schools.com/css/css_border.asp>`__
* `Zebra striping tables with CSS3 - Dev.Opera <http://dev.opera.com/articles/view/zebra-striping-tables-with-css3/>`__

position, box
~~~~~~~~~~~~~~~~~~~~~~

layout (float, clear)::

    |=========== header ==========|
    |                             |
    |== section ==| |== section ==|
    | float: left;   float: right;|
    |=========== footer ==========|
    |          clear:both;        |
    |-----------------------------|


.. code-block:: css
               
    section {
        float: left;
        margin: 10px;
        width: 600px;
    }
    aside {
        float: right;
        margin: 10px;
        width: 320px;
    }
    footer {
        clear: both;
    }


css:

    :::css
    .center {
        width:xxxpx;margin-left:auto;margin-right:auto;
    }


應用
~~~~~~~~~~~~

圖片塞滿browser

* `Full Screen Background Image - Pure CSS Code <http://paulmason.name/item/full-screen-background-image-pure-css-code>`__

CSS3:

.. code-block:: css
                
    html { 
      background: url(IMG_0083.JPG) no-repeat center center fixed; 
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
    }


表格列加刪除線

* `Table Row Strikethrough <http://codepen.io/nericksx/pen/CKjbe>`__



參考:

.. code-block:: css
                
    /* http://www.teachparentstech.org/images/checkbox.gif */
     
    #content .boxlabel{
    color:#999;
    background: url(../images/checkbox.gif) no-repeat00;
    height: 28px;
    padding-left: 20px;
    padding-right:10px;
    cursor: pointer;
    }
     
    #content .boxlabel.selected{
    color: rgb(32, 25, 25);
    background-position:0-42px;
    }



JavaScript
----------------

jQuery
~~~~~~~~~~


(DOM) ready:

.. code-block:: javascript
                
    $( document ).ready(function() {
    // Handler for .ready() called.
    });


    $(function() {
    // Handler for .ready() called.
    });


工具
~~~~~~~~

layout:

* `Placehold.it - Quick and simple image placeholders <http://www.placehold.it/>`__
* `Mockingbird <https://gomockingbird.com/mockingbird/>`__

color:

* `NIPPON COLORS - 日本の伝統色 <http://nipponcolors.com/>`__ (Firefox有問題)
* `Spectral <http://jxnblk.github.io/Spectral/>`__ 找色/配色工具 (快速簡潔)

Font:

* `WhatFont Tool - The easiest way to inspect fonts in webpages « Chengyin Liu <http://chengyinliu.com/whatfont.html>`__ 方便看網頁字體的bookmarklet


  
### 資源

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
