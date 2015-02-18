Software
================

Desktop
---------------------------

Mac OSX
~~~~~~~~~~~

(Mac的Option也是Alt鍵)

Finder:

* Command Shift D: 移駕「桌面」
* Command Shift H: Home
* Command Shift G: 輸入資料夾名稱
* Command Shift U:「工具程式」檔案夾
* Command M: 縮小視窗
* Command Option T:隱藏 / 顯示工具列
* Command 1/2/3/4: 顯示方式
* Command [ / ]: 上/下一個資料夾
* Command 上: 上一層資料夾 
* 顯示User Library(資料庫): 在Finder裡的Go(前往)選單, 按住option, 就會出現

清空垃圾桶: Command Shift Delete

zoom in/out: Command Opt =/-

強制結束: Command Opt Esc (force quit)

全面截圖 (存到桌面): Command Shift 3

區域截圖 (存到桌面): Command Shift 4

視窗截圖 (存到桌面): Command Shift 4 Space [選視窗]

區域截圖 (存到剪貼簿): Command Shift Control 4

貼上無格式文字 (plain-text): ShiftOption Command-v

輸入特殊符號: Command option T

放大縮小: Command + / Command -


無線網路密碼::

  1. 到"鑰匙圈存取": Finder -> 工具程式 -> 鑰匙圈存取
  2. 找基地台名稱, 分類是"AirPort網路密碼", 顯示密碼


Mac 更新到iOX 10.9, pip安裝出現錯誤 (gcc編譯相關)::

  1. 更新xcode
  2. sudo xcodebuild -license
  3. xcode-select --install 


* [14 Mac Hacks That Will Change The Way You Use Your Computer](http://www.buzzfeed.com/peggy/14-mac-hacks-that-will-change-the-way-you-use-your-computer)



瘦身::

  ~/Library/Application\ Support/MobileSync # 檔案很大, iPhone, iPad, iPod...的備份

  iTunes -> Perference -> Devices -> 刪除備份


做開機 usb disk::
  
  $ diskutil list
  $ diskutil unmountDisk /dev/diskN
  $ sudo dd if=/path/to/downloaded.img of=/dev/rdiskN bs=1m

好用軟體
~~~~~~~~~~~~~~~~~~~~~

Internet:

* bt - Deluge (Linux)
* IRC Client (OS X)
* `Charles Web Debugging Proxy • HTTP Monitor / HTTP Proxy / HTTPS & SSL Proxy / Reverse Proxy <http://www.charlesproxy.com/>`__

  1. Install Charles.app
  2. iOS add SSL certificate (不管 https 可忽略)
  3. 設定 proxy: iOS 的 Wi-Fi, HTTP PROXY 改 Manual

    * Server: 裝 Charles.app 的電腦 IP (要在同一個網路下)
    * Port: 8888

  4. Charles.app 會收到 request, 按 accept 就可以了
  5. 操作 iOS 的 APP, Charles.app 就有資料了


ebook:

* `calibre - E-book management <http://calibre-ebook.com/>`__

系統工具:

osx mount ext2/3: `FUSE for OS X <http://osxfuse.github.com/>`__ + `fuse-ext2 <http://sourceforge.net/projects/fuse-ext2/>`__


DevTools:

* `PixelWindow <http://www.pixelwindowapp.com/>`__ resolution ruler
* `meld <http://meldmerge.org/>`__: $ homebrew install meld


Browser / Internet
----------------------

browser 網址輸入以下, 可以當記事本::

  data:text/html, <html contenteditable>


Firefox
~~~~~~~~~~~~

快速鍵 (整理過, 只列出自己常用)::

    # bookmark
    Ctrl+B   顯示bookmark (側邊欄)
    Ctrl+D   加入bookmark

    # tab
    Ctrl+T   開新tab
    Ctrl+W   關Tab
    Ctrl+tab 下一個tab
    Ctrl+PageUp/PageDown 上/下一個tab

    # window/frame
    Ctrl+L 移到網址列
    Ctrl+J download
    F6     move to frame

    # search
    Ctrl+F   search
    Ctrl+G   search next
    Shift+F3 serach privious

    # other
    Alt+Enter open link in new tab
    F11 fullscreen    
    F7 鍵盤瀏覽

**Developer's tools:**

scratchpad: 按shift+F4

* [重新介紹 Firefox 開發者工具之二 | 訊息中心 | Mozilla Taiwan](http://blog.mozilla.com.tw/posts/4200/reintroducing-the-firefox-developer-tools-part-2-the-scratchpad-and-the-style-editor)

Browser plugin/extensions:

* 顯示網站使用fromeworks, web server, service...

  * `Chrome Sniffer | Bao's Blog <http://www.nqbao.com/chrome-sniffer>`__ (Chrome)
  * `Wappalyzer <http://wappalyzer.com/>`__ (Firefox)
  * `Find your extension, accelerator and addon for the browsers safari, internet explorer(ie), chrome and firefox <http://www.tcpiputils.com/browser-extensions-addons-accelerators>`__ (Chrome, Firefox, Opera, Safari)


Internet
~~~~~~~~~~~

HTML5 Slides:

* `impress.js | presentation tool based on the power of CSS3 transforms and transitions in modern browsers | by Bartek Szopka @bartaz <http://bartaz.github.io/impress.js/#/bored>`__
* `hakimel/reveal.js <https://github.com/hakimel/reveal.js>`__



VIM
-------------

行號::

  :set nonu
  :set nu

vim硬是要存檔::

  :w !sudo tee %


dot (grphviz)
-----------------------


example::

  digraph foo {
    hello [shape="diamond", label="hihi \nhello"]
    world
    hello -> world [label="Y"]
  }


輸出png::

  dot foo.dot -Tpng -o foo.png

.. note:: -T: format -o: output

.. note:: 註解用\/* \*/ 或 //，像C++一樣

ref:

* `Node Shapes | Graphviz - Graph Visualization Software <http://www.graphviz.org/content/node-shapes>`__
* `The DOT Language | Graphviz - Graph Visualization Software <http://www.graphviz.org/content/dot-language>`__
* `Gallery | Graphviz - Graph Visualization Software <http://www.graphviz.org/Gallery.php>`__


ffmpeg
-------------

usage::

  ffmpeg -i [source] [target]

.. note:: -vcodec

.. note:: -s 100x100

.. note:: -t 10 (前10秒)

.. note:: -vf crop=100:100 (切中間100x100), crop=in_w-480:in_h(左右各切240)

.. note:: -aspect 4:3

列出所有codecs::

  $ ffmpeg -codecs

列出所有file format::

  $ ffmpeg -formats 


----

**Tips:**

右上角watermark::

  $ ffmpeg –i inputvideo.avi -vf "movie=watermarklogo.png [watermark]; [in][watermark] overlay=main_w-overlay_w-10:10 [out]" outputvideo.flv

via: `How to watermark a video using FFmpeg | iDude.net <http://www.idude.net/index.php/how-to-watermark-a-video-using-ffmpeg/>`__


examples::

  $ ffmpeg -i filename.webm -acodec libmp3lame -aq 4 filename.mp3
  
  # convert MTS to mp4
  $ ffmpeg -i 00026.MTS -vcodec mpeg4 -b:v 10M -acodec libfaac -b:a 192k out.mp4
  
  # movie range, from 00:45:00 to 00:48:00 (經過 3 分鐘)
  $ ffmpeg -i 00026.MTS -vcodec mpeg4 -b:v 10M -acodec libfaac -b:a 192k -ss 00:45:00.0 -t 00:03:00.0 out.mp4

  # show meta data
  $ ffmpeg -i <foo.mp4> -f ffmetadata <out.txt>

  # 大小聲
  $ ffmpeg -i silent.mp3 -af "volume=10dB" noise.mp3
  $ ffmpeg -i silent.mp3 -af "volume=-5dB" noise.mp3
  $ ffmpeg -f inputfile -vcodec copy -af "volume/10dB" outputfile

