Web Develop
========================



NodeJS / NPM
------------------

`Installing Node.js via package manager | Node.js <https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions>`__

install 最新 nodejs (debian的很舊)::

  $ curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
  $ sudo apt-get install -y nodejs


update npm::
    
  $ sudo npm install npm -g
  
gulp
---------------

::

  (sudo) npm install --global gulp-cli

  npm install --save-dev gulp


::
   var gulp = require('gulp');

   gulp.task('default', function() {
     // place code for your default task here
   });  

Production
----------------

* `Building for Production: Web Applications — Monitoring | DigitalOcean <https://www.digitalocean.com/community/tutorials/building-for-production-web-applications-monitoring>`__


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
* `Fount · Identify any web font you see. <https://fount.artequalswork.com/>`__ 很方便!!

  
資源
------------------

* [✿ Our favorite set — CopyPasteCharacter.com](http://copypastecharacter.com/)
* [NounProject](http://thenounproject.com/) 剪影 icon



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

    
Cache    
----------

HTTP 1.0 用 Header 的 metadata: Expires 和 Pragma 來控制

HTTP 1.1 用 Cache-Control:

:no-store: 強制不 cache
:no-cache: 會 cache, 每次 request 判斷有更新 -> 回 200, 沒更新 -> 回 304
:private: 目前這個使用者可以用 (用於敏感資料)
:public: 讓不同使用者用
:must-revalidate: refresh 頁面時檢查?

第一次發 request 到一個 URL, server 回傳 HTTP status code: 200, 同時會帶一個 ``Last-Modified`` 或是 ``ETag tag``.

瀏覽器收到, 如果再發同一個 request，就會夾帶 ``If-Modified-Since`` 或 ``If-None-Match``, server 判斷後, 沒更新, 回傳 304 Not Modified， 時 (沒有回傳內容), 瀏覽器就用 Cache. (減少 response 內容)

.. note:: Server 判斷檔案 cache 規則: 1. Last-Modified (最後修改時間, 用 GMT) 2. 資料內容驗證 (Hash)

Cache-Control: max-age=x秒, 效期限還沒到 瀏覽器不送 request, 直接拿 Cache

* `HTTP 快取 | Web Fundamentals - Google Developers <https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/http-caching>`__
* `初探 HTTP 1.1 Cache 機制 - Soul & Shell Blog <http://blog.toright.com/posts/3414/初探-http-1-1-cache-機制.html>`__
