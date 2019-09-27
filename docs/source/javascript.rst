JavaScript
=============


Tutorial
-------------

* `JavaScript Guide - MDN Docs <https://developer.mozilla.org/en/JavaScript/Guide>`__
* `A re-introduction to JavaScript (JS tutorial) - JavaScript | MDN <https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript>`__ 
* `DOM Enlightenment - Exploring the relationship between JavaScript and the modern HTML DOM <http://www.domenlightenment.com/>`__
* `Google JavaScript Style Guide <http://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml>`__
* `Arrays in JavaScript <http://www.2ality.com/2012/12/arrays.html>`__

  
ES 6
----------------

via: `The Difference Between Function and Block Scope in JavaScript <https://medium.com/@josephcardillo/the-difference-between-function-and-block-scope-in-javascript-4296b2322abe>`__

.. note::
   
   var is function scope.
   let and const are block scope.
   Function scope is within the function.
   Block scope is within curly brackets.
   

for ... in, for ... of | via: `When to use for..of loop instead of for..in - DEV Community 👩‍💻👨‍💻 <https://dev.to/umaralam48/when-to-use-for-of-loop-instead-of-for-in-4oa3>`__

.. code-block:: javascript

    // for ... in
    // iterates over the enumerable properties of an object (array is object with index as their property in javascript)
    // for ... of
    // iterates over the values that the iterable defines to be iterated over (饒舌)
    for (let x in [0.1, 0.2, 0.3]) {
        console.log(x); // 0, 1, 2 (print index)
    }

    for (let x of [0.1, 0.2, 0.3]) {
        console.log(x); // 0.1, 0.2, 0.3 (print value)
    }

    for (let x in {foo:'bar', monty: 'python'}) {
        console.log(x); // foo, monty (print key)
    }

    for (let x of {foo:'bar', monty: 'python'})) {
        console.log(x); // Uncaught TypeError: {(intermediate value)(intermediate value)} is not iterable
    }

    // objects in Javascript are not iterable unless they implement the iterable protocol


用 async / await 取代 then, then...:

  * `JavaScript Fetch API and using Async/Await | Fundamentals Of Code <https://fundamentalsofcode.com/javascript-fetch-api-and-using-async-await/>`__

.. code-block:: javascript

    async function getUserAsync(name)
    {
        let response = await fetch(`https://api.github.com/users/${name}`);
        let data = await response.json()
        return data;
    }

    getUserAsync('yourUsernameHere')
     .then(data => console.log(data));


特色
--------------
Javascript 的物件可以放任何東西

.. code-block:: javascript

          for … in // enumerable properties, 全部的 property (包括 function, property, 不是ownporperty (繼承的)也會列出…)
          for… of // iterable objcet 只有 Array 會列出



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

.. note:: float的0.1 + 0.2 不等於0.3?


Snippets
------------

redirect:

.. code-block:: javascript
                
  // HTTP redirect
  window.location.replace("http://stackoverflow.com");

  // clicking on a link
  window.location.href = "http://stackoverflow.com";

DOM 操作  
-----------------

* `DOM Tips and Techniques: Parent, Child, and Siblings <http://www.sitepoint.com/dom-tips-techniques-parent-child-siblings/>`__
  

Library / Framework
---------------------

* `Sortable. No jQuery. <http://rubaxa.github.io/Sortable/>`__
* multiple select
  * `jQuery UI MultiSelect Widget by Eric Hynds <http://www.erichynds.com/examples/jquery-ui-multiselect-widget/demos/#filter>`__
  * `Chosen: A jQuery Plugin by Harvest to Tame Unwieldy Select Boxes <http://harvesthq.github.io/chosen/>`__

    
reactjs
-------------------

- changing an uncontrolled input => value 要給 default ex: value={this_value || ''}



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

* `Useful JavaScript debugging tips you didn't know <https://raygun.io/blog/2015/06/useful-javascript-debugging-tips-you-didnt-know/>`__
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
* `Checklist for your new Open Source JavaScript Project | Eric Douglas <http://ericdouglas.github.io/2015/09/27/checklist-for-your-new-open-source-javascript-project/>`__ javascript 想要 open source 公諸世人的注意 (打包) 事項


compare jQuery & vanilla JavaScript
----------------------------------------

.. code-block :: javascript

    // Doucment ready
    $(document).ready(function() {
      // code…
    });
     
    document.addEventListener("DOMContentLoaded", function() {
      // code…
    });
     
    // select all divs
    var divs = $("div");
    
    var divs = document.querySelectorAll("div");

    // add class
    newDiv.addClass("foo");
    
    newDiv.classList.add("foo");

    // toggle class
    newDiv.toggleClass("foo");
    
    newDiv.classList.toggle("foo");

    // click
    $("a").click(function() {
      // code…
    })
        
    [].forEach.call(document.querySelectorAll("a"), function(el) {
      el.addEventListener("click", function() {
        // code…
      });
    });
     
    // append
    $("body").append($("<p/>"));
    
    document.body.appendChild(document.createElement("p"));

    // add attr
    $("img").filter(":first").attr("alt", "My image");
     
    document.querySelector("img").setAttribute("alt", "My image");

    // find parent
    var parent = $("#about").parent();
     
    var parent = document.getElementById("about").parentNode;
     
    // clone
    var clonedElement = $("#about").clone();
     
    var clonedElement = document.getElementById("about").cloneNode(true);
     
    // clear childs
    $("#wrap").empty();
     
    var wrap = document.getElementById("wrap");
    while(wrap.firstChild) wrap.removeChild(wrap.firstChild);
     
    // check has child nodes
    if($("#wrap").is(":empty")) { ... }
     
    if(!document.getElementById("wrap").hasChildNodes()) { ... }
     
     
    // next sibling
    var nextElement = $("#wrap").next();
     
    var nextElement = document.getElementById("wrap").nextSibling;
     
