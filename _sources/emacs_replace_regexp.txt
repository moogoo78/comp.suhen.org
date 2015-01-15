
[computer] 善用Emacs的replace-regexp
########################################
:date: 2013-06-25 10:07
:category: computer
:tags: note, emacs
:slug: emacs_replace-regexp.rst

指令::

  M-x replace-regexp <RET> regexp <RET> newstring <RET>


特殊字

- ``\&’`` 完整的匹配字
- ``\d`` d是數字, 表示匹配在第幾個group (back reference)
- ``\#`` 累加, 發生第幾次,第一次從0開始
- ``\,`` Lisp expression
- ``\?`` 詢問

範例
===============

數字編號::

  1987:Bogotá
  5243:Fabergé

  \(.+:\)
  \#.

  0.Bogotá
  1.Fabergé

  如果要從1開始:
  \,(1+ \#). 


HTML H降級::

  <h1>silly</h1>
  <h2>walk</h2>

  <\(/?\)h\([0-9]\)>
  <\1h\,(1+ \#2)>

  <h2>silly</h2>
  <h3>walk</h3>


HTML link換成rst格式::

  <a href=\"\(.+\)\"\(.*\)>\(.+\)</a>
  ->
  `\3 <\1>`__

(BUG)

Flickr share link to rst::

  <a href=\"\(.+\)\" \(.+\)><img src=\"\(.+\).jpg\" \(.+\) alt=\"\(.+\)\"></a>
  ->
  \5 | `flickr <\1>`__

  .. image:: \3.jpg

(BUG)


參考

* `Regexp Replace - GNU Emacs Manual <http://www.gnu.org/software/emacs/manual/html_node/emacs/Regexp-Replace.html>`__
* `EmacsWiki: Replace Regexp <http://www.emacswiki.org/emacs/ReplaceRegexp>`__



