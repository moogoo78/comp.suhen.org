CSS
=====

* `sanitize.css <http://jonathantneal.github.io/sanitize.css/>`__ - 進化的 reset.css, normalize.css
  
Tutorial
-----------

* `CSS - no layout <http://learnlayout.com/no-layout.html>`__ 範例清楚, 簡潔明瞭
* http://zh-tw.learnlayout.com/
* https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_Started/Layout

  
Basic
~~~~~~~~~~~

External::

  <head>
  <link rel="stylesheet" type="text/css" href="mystyle.css" />
  </head>

Internal(Embedded)::

  <head>
  <style type="text/css">
  hr {color:sienna;}
  p {margin-left:20px;}
  body {background-image:url("images/back40.gif");}
  </style>
  </head>

Inline::

  <p style="color:sienna;margin-left:20px">This is a paragraph.</p>


優先順序

1. !important
2. Inline (HTML ``STYLE attribute``)
3. Internal (HTML 包在HEAD裡的 ``<STYLE>``)
4. External (HTML ``<LINK>``)
5. Browser default

.. note:: 相同屬性，後寫的會蓋掉前面的

* `HTML5 & CSS3 Fundamentals: Development for Absolute Beginners | Channel 9 <http://channel9.msdn.com/Series/HTML5-CSS3-Fundamentals-Development-for-Absolute-Beginners>`__ 初學課程video
* `An Advanced Guide to HTML & CSS <http://learn.shayhowe.com/advanced-html-css/>`__ 進階架構
* `The truth about structuring an HTML5 page | Feature | .net magazine <http://www.netmagazine.com/features/truth-about-structuring-html5-page>`__
* `» 你從未瞭解過的 z-index | iCoding <http://www.icoding.co/2013/06/knowledge-about-z-index-2>`__
* `[讀書筆記] CSS 基礎技巧懶人包 - Blog.XDite.net <http://blog.xdite.net/posts/2012/01/29/css-tricks-summary/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed:+xxddite+(Blog.XDite.net)&utm_content=Google+Reader>`__
  

定位 (position)
~~~~~~~~~~~~~~~~~~~~~
* static - default, 排排站, 一個疊一個
* relative - 保持距離
* absolute - 說在那就在那
* fixed - scroll也不動
* inherit - 聽父母的話


* `CSS-Positioning-101/readme.txt at master · mwmnj/CSS-Positioning-101 · GitHub <https://github.com/mwmnj/CSS-Positioning-101>`__ 
* `A List Apart: Articles: CSS Positioning 101 <http://www.alistapart.com/articles/css-positioning-101/>`__
* `How to Center in CSS <http://howtocenterincss.com/>`__ 置中產生器

Box
~~~~~~~~~~~~~~~  

.. code-block:: css

    border:5px solid red; /* 常用style: none, dotted, dashed, solid, double */
    tr:nth-child(odd) { background-color:#99ff99; }

* `CSS Border <http://www.w3schools.com/css/css_border.asp>`__
* `Zebra striping tables with CSS3 - Dev.Opera <http://dev.opera.com/articles/view/zebra-striping-tables-with-css3/>`__


Debug
~~~~~~~~~~~
  
* `最常用的10種CSS BUG解決方法與技巧 - 各大瀏覽器兼容 | InspireGate 派克空間 <http://inspire.twgg.org/c/programming/html-css/2011-11-14-03-39-39.html>`__



Snippets
------------------

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

.. code-block:: css
    
    .center {
        width:xxxpx;margin-left:auto;margin-right:auto;
    }
    

position::

  .left {float:left}; // left class
  {margin: 0 auto;} // center layout


應用
~~~~~~~~~~~

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

  
Gallery
-------------

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
