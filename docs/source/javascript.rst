JavaScript
=============


Tutorial
-------------

* `JavaScript Guide - MDN Docs <https://developer.mozilla.org/en/JavaScript/Guide>`__ 
* `DOM Enlightenment - Exploring the relationship between JavaScript and the modern HTML DOM <http://www.domenlightenment.com/>`__
* `Google JavaScript Style Guide <http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml>`__
* `Arrays in JavaScript <http://www.2ality.com/2012/12/arrays.html>`__


特色
--------------

The Good part
~~~~~~~~~~~~~~
           
* Javascript簡單型別: 數值, 字串, boolean, null, undefinde都是物件。容器是物件的特性，有key, value。

* prototype linkage: 繼承，減少初始化時間，與記憶體消耗。

* object literal: {...}

* 取用用 ``.`` 或 ``[ ]`` 都可以 ( . 比較簡單)
* update: 有name存在時會取代舊值, 沒name時會自動增加到object裡
* reference: 物件不會被複製，用reference傳遞

* enum

  * for (name in alist) { ... }

    * 要過濾hasOwnProperty和typeof檢查型別
    * 不會照原本順序

  * 用for (var i=0; i< len ; i++) { ... }

    * 不用檢查型別
    * 會照原本順序


不良
~~~~~~~~~~~~~~

* 建立一個全域物件當作全域變數 => 避免全域變數濫用
* 在每個函式起始處宣告所有變數 => JavaScript沒有區塊範圍 (函式中區塊內的變數到處可見)
* parseInt要使用進制 => 數字是10進制，字申是8進制

.. todo:: float的0.1 + 0.2 不等於0.3?


Snippets
------------

redirect:

.. code-block:: javascript
                
  // HTTP redirect
  window.location.replace("http://stackoverflow.com");

  // clicking on a link
  window.location.href = "http://stackoverflow.com";


  
Library / Framework
---------------------

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


* plug-in
   * `hoverIntent jQuery Plug-in <http://cherne.net/brian/resources/jquery.hoverIntent.html>`__ 下拉選單
   * `jQuery UI Multiple Select Widget | Eric Hynds <http://www.erichynds.com/jquery/jquery-ui-multiselect-widget/>`__ 漂亮的multi select
   * jqzoom
   * `fancyBox - Fancy jQuery Lightbox Alternative <http://fancyapps.com/fancybox/>`__   (要license) 
   * `Lightbox 2 <http://lokeshdhakar.com/projects/lightbox2/>`__
   * `mozilla/pdf.js @ GitHub <http://mozilla.github.com/pdf.js/>`__ PDF reader
   * `Infinite Ajax Scroll, a jQuery plugin — FIEG <http://www.fieg.nl/infinite-ajax-scroll-a-jquery-plugin>`__ 


Debug Tools (console)
--------------------------

* `Chrome Developer Tools: Console - Google Chrome Developer Tools - Google Code <http://code.google.com/intl/zh-TW/chrome/devtools/docs/console.html>`__
* `Become a Javascript Console Power-User - YouTube <http://www.youtube.com/watch?v=4mf_yNLlgic&feature=youtube_gdata>`__

General::

   console.log()
   console.dir() -  除了log外還可以看DOM的屬性
   console.time() / console.timeEnd() - 做benchmark
   inspect(foo) - 顯示此一物件在HTML的位置
   $0 - ??
   $0.outerHTML
   $$('textarea') - 找出匹配的DOM
   monitorEvents($$('textarea')[0])
   monitorEvents($$('textarea')[0], 'key或mouse')
   keys(document) / values(document)
   copy(keys(document)) -  copy to clipboard

Opera::

   >>> // jquery()
   "Loading jquery"
   jquery loaded
   >>> jquery('div')
   


Tips
----------

原圖太大::

  //lightbox.js

  preloader.onload = function() {
  $image.attr('src', _this.album[_this.currentImageIndex].link);
  $image.width = preloader.width;
  $image.height = preloader.height;
  return _this.sizeContainer(preloader.width, preloader.height);
  };
  //to
  preloader.onload = function() {
  $image.attr('src', _this.album[_this.currentImageIndex].link);
  if (preloader.width > window.innerWidth * 0.9) {
  preloader.height = (window.innerWidth * 0.9 * preloader.height) / preloader.width;
  preloader.width = window.innerWidth * 0.9;
  }

  if (preloader.height > window.innerHeight * 0.8) {
  preloader.width = (window.innerHeight * 0.8 * preloader.width) / preloader.height;
  preloader.height = window.innerHeight * 0.8;
  }
  $image.width = preloader.width;
  $image.height = preloader.height;
  $image.attr('width', preloader.width + "px");
  return _this.sizeContainer(preloader.width, preloader.height);
  };

  //ligthbox.css:

  #lightbox img {
  width: auto;
  height: auto;
  }
  //to
  #lightbox img {
  /*width: auto;
  height: auto;*/
  } 



Adv.
-----
* `Javascript 面向对象编程 | 酷壳 - CoolShell.cn <http://coolshell.cn/articles/6441.html>`__

