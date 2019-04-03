Pelican
==========

一直想用純HTML來寫blog，做筆記，最早用PHP的\ `Dokuwiki <https://www.dokuwiki.org>`__
，不想被PHP server綁住，改用Emacs的\ `Org-mode <http://orgmode.org>`__,
org的編輯功能超強大，也可以輸出HTML，但要擴展或改template就不是很方便了。之後又接觸了\ `ReStructuredText <|filename|/computer/rest_sphinx.rst>`__,
因為看到大部分Python的文件都用Sphinx產生。但是他又不是blog（長的不像）。Ruby有Octopress，無意間看到Python也有Pelican，安裝方便，預設板型漂亮，容易整合目前當紅的網路服務，reST格式我可以很容易把之前的筆記轉過來，還是覺得純文字檔才是王道阿。

用了github控管我的內容，順便也使用github
pages，放置我的靜態網頁，只要開一個repository，把要發佈的內容放到gh-pages的orphan
branch就可以了。

`Creating Project Pages manually · GitHub
Help <https://help.github.com/articles/creating-project-pages-manually>`__

Quick-start
--------------

安裝:

::

    :::bash
    $ pip install pelican

開始:

::

    :::bash
    $ mkdir blog
    $ cd blog
    $ pelican-quickstart

快速產生相關的設定

寫第一篇文章:

::

    :::bash
    $ vim content/first.rst

工具指令:

::

    :::bash
    $ make html # 顧名思義
    $ make clean 
    $ make rsync_upload # 用rsync上傳到你的ssh host
    $ make serve # 啟動python的SimpleHTTPServer
    $ make devserver # 修改rst會自動reload, 重啓server
    $ make github #自動執行ghp-import到github pages

文章格式 (reST, markdown)
------------------------------
屬性:

::

    :::text
    # rst
    hello
    ############
    :date: 2013-04-14 (必填)
    :category: music
    :tags: foo, bar
    :slug:
    :lang:
    :author:
    :status: draft (不會處理)

    #md
    Title: hello
    Date: 2013-04-14 (必填)
    Category: music
    Tags: foo, bar
    ...

圖片:

::

    :::text
    # rst
    .. image:: /path/to/filename.jpg
               :height: 450 px
               :width: 600 px
               :alt: alternate text

    # md
    ![title](/path/to/filename.jpg)

連結:

::

    :::text
    # rst
    `title <http://foo.bar>`__ 跟reST一樣

    this is a foo_ .
    _foo: http://foo.bar

    # md
    [title](http://foo.bar)

內部連結:

::

    :::text
    # reST
    `京都行 <|filename|/travel/2012_kyoto_marathon-1.rst>`_  

    # markdown
    [玉山小檗](|filename|/nature/plant/0005-玉山小檗.rst)

區塊:

::

    :::text
    # rst
    foo::

      spam spam spam spam

    # md

        spam spam spam spam

syntax highlight:

::

    :::text
    # rst
    .. code-block:: python

    import os

    # md
        :::c++
        :::python
        :::text

git hub
----------

環境設定
^^^^^^^^^^^^

python要用virtualenv才是王道:

::

    :::bash
    $ mkvirtualenv sillywalk.org
    $ cd sillkwalk.org
    $ setvirtualenvproject
    $ workon sillywalk.org

    $ pip install pelican
    $ pip install ghp-import # 方便發佈到github pages的工具

產生HTML，發佈
^^^^^^^^^^^^^^^^

產生HTML內容:

::

    :::bash
    $ pelican -s pelican.conf.py .
    $ ghp-import output
    $ git push origin gh-pages

    # 其實pelican的make就可以了
    $ make github

自訂domain
^^^^^^^^^^^^^^

1. 在你的domain設定指向github的IP
2. 在發佈的gh-pages branch下放一個CNAME檔案，裡面寫你的domain

放在output目錄的CNAME在每次build時都會被洗掉，所以要每次自動copy。

先產生content/extra/CNAME，然後在pelicanconf.py加入:

::

    :::text
    FILES_TO_COPY = (
        ('extra/CNAME', 'CNAME'),
    )

用reST (reStructuredText) 還是markdown好?
----------------------------------------------
活在Python世界，很多文件是reST編寫的，當初在選用Pelican當blog時也是用預設的reST格式。

但是reST還是有一些很討厭的地方，像:

-  連結的語法我永遠很難記得，都是用自己寫的javascript bookmarklet解決
-  連結跟內容文字之間要有空白，不然會錯，除非加上跳脫字元 **/**
-  標題用
   ######...，長度要跟標題文字一樣長，雖然編輯器都有快速鍵可以補齊，但是還是會在修改標題後，常常忘了補滿而出現錯誤

簡潔的markdown實在比reST好用很多，不過，預設沒有表格
(table)的語法。所以，如果用到表格，或是覺得以後要用Sphinx產生文件，減少轉換問題，就用reST，其他一般用markdown。

markdown可以直接貼HTML也是超級方便的!

補充
^^^^^^

bookmarklet:

::

    :::javascript
    // reST
    javascript:(function(){t='`'+decodeURIComponent(document.title)+' <'+decodeURIComponent(window.location.href)+'>`__';win=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=550,height=150');win.document.write('<form><textarea name="a" rows="5" cols="50" onClick="javascript:this.form.a.focus();this.form.a.select();">'+t+'</textarea></form>');})()
    // markdown
    javascript:(function(){t='['+decodeURIComponent(document.title)+']('+decodeURIComponent(window.location.href)+')';win=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=550,height=150');win.document.write('<form><textarea name="a" rows="5" cols="50" onClick="javascript:this.form.a.focus();this.form.a.select();">'+t+'</textarea></form>');})()

參考
---------------

靜態blog generator
^^^^^^^^^^^^^^^^^^^^^^^^

-  Hyde (看起來很複雜，沒仔細看) - http://ringce.com/hyde
-  Nikola 有image gallery (把圖片丟到某個目錄下就好了) -
   http://nikola.ralsina.com.ar/
-  mynt - http://mynt.mirroredwhite.com/

deploy to github
^^^^^^^^^^^^^^^^^^^^

-  `Python 的虛擬環境及多版本開發利器─Virtualenv 與 Pythonbrew -
   OpenFoundry <http://www.openfoundry.org/tw/tech-column/8516-pythons-virtual-environment-and-multi-version-programming-tools-virtualenv-and-pythonbrew>`__
-  `Tips — Pelican 3
   documentation <http://docs.getpelican.com/en/3.0/tips.html>`__
-  `Setting up a custom domain with Pages · GitHub
   Help <https://help.github.com/articles/setting-up-a-custom-domain-with-pages>`__

syntax
^^^^^^^^^^

-  `Markdown 語法說明 <http://markdown.tw/>`__

補充
---------

更新 v 3.4
^^^^^^^^^^^^^^^^^

pelican\_youtube::

::

    pip install pelican-youtube

pelicanconf.py::

::

    PLUGINS = [
        'pelican_youtube',
    ]

