Command 常用指令
=========================


snippets
-------------
把"/t"分隔的檔案轉成sql語法, 用awk和sed

.. code-block:: bash

  awk -F '\t' '{print "INSERT INTO word (\"s3id\",\"content\",\"freq\",\"translate\",\"ex1\",\"ex1_translate\",\"ex2\",\"ex2_translate\") VALUES(\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\",\""$8"\");"}' data_all_u.txt | sed -e 's/^M//g' > out.sql

.. note:: 先用awk轉好, 再用sed去除最後換行符號, "^M"在commend-line裡要Ctrl-V + Ctrl-M表示

more


* `Robert Muth: Better Bash Scripting in 15 Minutes <http://robertmuth.blogspot.tw/2012/08/better-bash-scripting-in-15-minutes.html?utm_source=hackernewsletter&utm_medium=email&utm_term=fav>`__
* `Sed - An Introduction and Tutorial <http://www.grymoire.com/Unix/sed.html?utm_source=hackernewsletter&utm_medium=email&utm_term=code>`__


顯示 \uxxx => unicode 文字:

.. code-block:: bash

   echo -e "$(curl http://127.0.0.1:5000/api/info)"
             
  
檔案
---------------

把檔案foo複製到以下全部目錄裡::

  $ find . -type d |xargs -n 1 cp -i foo

:xargs -n 1: 把每一行command line輸出當作一個參數
:cp -i: 詢問y or n


**改檔名**

大寫改小寫::

  $ for i in $( ls | grep [A-Z] ); do mv -i $i `echo $i | tr 'A-Z' 'a-z'`; done


只取數字, JPG改jpg::

  for i in *.JPG ; do mv "$i" `echo $i | tr -dc '[0-9]'`".jpg" ; done


for loop::

  for f in *.html; do
      base=`basename $f .html`
      mv $f $bae.php
  done


**找檔案**


找目錄名稱::

  $ find / -type d -name "dir_name"

刪除5分鐘內建立的檔案::

  $ find -cmin -5 -type f -exec rm -rf {} \;

找出體積最大前十檔案/目錄:: 
  
  $ du -a /home | sort -n -r | head -n 10

via: `Linux 下找出體積最大的檔案/目錄 – 網絡技術日誌 <http://www.hkcode.com/linux-bsd-notes/693>`__

某目錄下的全部檔案的字串::

  $ grep -rl flaskext . |xargs sed -i -e 's/flaskext/flask.ext/'

  $ ls *.md | xargs sed -i -e 's/static\///' ## 把 所有的.md (markdown) 檔裡的 "static/" 去掉

via: `recursive search and replace old with new string, inside files | commandlinefu.com <http://www.commandlinefu.com/commands/view/4698/recursive-search-and-replace-old-with-new-string-inside-files>`__ 


列出各目錄大小(不顯示子目錄)::

  du -h | grep -v '[a-z]/.'



coding convert::

  # big5 to utf-8
  $ iconv -f big5 -t utf-8 big5.txt -o utf8.txt 

  # 簡體轉繁體
  $ cat test.txt | iconv -f gb2312 -t big5

  # 繁體轉簡體
  $ cat test.txt | iconv -f big5 -t gb2312

  # Big5 編碼跟 UTF-8 編碼之間的轉換,如 UTF-8 轉 Big5
  $ cat test.txt | iconv -f utf-8 -t big5

壓縮/解壓縮 compress/depress
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

  ## tar
  # compress (tar 打包, zip壓縮)
  $ tar -zcvf foo.tgz foo
  # decompress
  $ tar -zxvf foo.tgz

  $ tar -jcvf foo.tar.bz2 foo
  $ tar -jxvf too.tar.bz2

  ## bzip2
  $ bzip2 foo # 會把 foo 變成 foo.bz2
  $ bzip2 -d foo.bz2 # 把 foo.bz2 變 foo

bzip2 的壓縮率比較大, 運算時間長


**grep:**

:-i: 忽略大小寫
:-n: 輸出行號
:-c: 計算次數
:-a: binary 檔用 text 檔案
:-A: 顯示後幾行 (after)
:-B: 顯示前幾行 (before)
:-C: 顯示前後幾行
:-v: --invert-match
:-V: version


* `AWK 简明教程 | 酷壳 - CoolShell.cn <http://coolshell.cn/articles/9070.html>`__



網路
----------------
::

  $ lsof # list open files
  $ lsof -n # network files
  $ lsof -i # monitors network connections in real time
  $ iftop # shows bandwith usage per *connection*
  $ nethogs #shows the bandwith usage per *process*

  # iOS
  $ sudo lsof -i -P
  $ lsof -n -i4TCP:5000 | grep LISTEN # 找出port5000


rsync::

  $ rsync -av /etc /tmp () # 將 /etc/ 的資料備份到 /tmp/etc 內(local)
  $ rsync -av -e ssh user@host:/etc /tmp 將遠端 /etc 備份到local主機的 /tmp 內

dns::

  dig foobar.com        # simple query
  dig +trace foobar.com # detail
  dig +short foobar.com # 不廢話
  dig foobar.com mx

*.* 表示the root of the hierarchy

* `使用 netstat 找出不正常的連線 | Tsung's Blog <http://blog.longwin.com.tw/2010/02/netstat-check-connect-2010/>`__


curl::

  curl http://example.com
  curl http://example -d"tag=foo&cat=bar" # 這個預設會送POST
  curl http://example/edit -XPOST # http method
  crul http://example/api -F user=mouse -F passwd=cheese


Service
-------------------

關掉uwsgi的process::

  ps ca|grep uwsgi |awk '{ print $1}' | xargs --no-run-if-empty sudo kill -9


快速靜態檔案server::

  $ python -m SimpleHTTPServer 8080


Crontab
~~~~~~~~~~~~
分鐘 小時 日期 月份 週 

每5min一次::

  */5 * * * * /home/moogoo/test.sh
  5 0 * * *

每小時::

  01 * * * * /home/moogoo/test.sh

每天(半夜)::

  0 0 * * *

每週::

  0 0 * * 0

每月::

  0 0 1 * *


start::

  service crond start 



locale
-------------------------

語系::

  $ locale -a # 目前系統支援語系
  $ dpkg-reconfigure locales 安裝語系


tools
----------

tmux
~~~~~~~~~~~
# 開新視窗
C-b c

# 前/後一個視窗
C-b n/p 

# 分割上下pane
C-b "

# 分割左右pane
C-b %

# 重整pane(幫你排)
C-b SPACE

# 調整視窗大小
C-b 按著不放再按上下左右

# 移動到另一視窗
C-b 上下左右
C-b o

# 視窗交換位址
 
C-b C-o

# 顯示時間
C-b t

# 把目前tmux session丟到背景去 (回到原本terminal)
C-b d

# 回到剛才的tmux session
tmux attach

# help
C-b ?

scroll::
  
  Ctrl-b [ 上/下/左/右 , q 離開

* `tmux shortcuts & cheatsheet <https://gist.github.com/MohamedAlaa/2961058>`__
* `tmux cheatsheet <https://gist.github.com/andreyvit/2921703>`__
