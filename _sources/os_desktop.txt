OS & Desktop
================

Linux - Debian - LXDE
-------------------------


Dell inspiron 15 5000::

  # 缺 2 個 non-free 的 package
  # sourcelist 的 main 後面加上 non-free
  apt-get update
  
  sudo apt-get install firmware-realtek
  sudo apt-get install firmware-iwlwifi

  # 視窗畫面拖拉很慢
  sudo apt-get install compton

桌面::

  # 改啟動檔 ``.config/lxsession/LXDE/autostart``::
  @setxkbmap dvorak -option ctrl:nocaps
  @lxterminal
  @compton

  # 羅馬拼音
  # apt-get install scim-pinyin


套件::

  # 開發  
  sudo apt-get install build-essential python-dev (centos: python-devel?)
  # web devel
  sudo apt-get install libmysqlclient-dev (centos: mysql-python)
  

Desktop shortcut file (Firefox Developer Edition)::

  [Desktop Entry]
  Encoding=UTF-8
  Name=Firefox Developer Edition
  Comment=Open Firefox Developer Edition
  Icon=/home/sh/M/tools/firefox-developer/browser/icons/mozicon128.png
  Exec=/home/sh/M/tools/firefox-developer/firefox
  Terminal=false
  Type=Application
    
  
Browser - bookmarklet
----------------------------

markdown syntax:

.. code-block:: javascript

   javascript:(function(){t='['+decodeURIComponent(document.title)+']('+decodeURIComponent(window.location.href)+')';win=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=550,height=150');win.document.write('<form><textarea name="a" rows="5" cols="50" onClick="javascript:this.form.a.focus();this.form.a.select();">'+t+'</textarea></form>');})()

reST syntax:

.. code-block:: javascript

   javascript:(function(){t='`'+decodeURIComponent(document.title)+' <'+decodeURIComponent(window.location.href)+'>`__';win=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=550,height=150');win.document.write('<form><textarea name="a" rows="5" cols="50" onClick="javascript:this.form.a.focus();this.form.a.select();">'+t+'</textarea></form>');})()


桌面軟體設定 - Mac OSX
---------------------------

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

* `UNetbootin - Homepage and Downloads <http://unetbootin.sourceforge.net/>`__
  
Browser / Internet
^^^^^^^^^^^^^^^^^^^^^^

browser 網址輸入以下, 可以當記事本::

  data:text/html, <html contenteditable>


Browser plugin/extensions:

* 顯示網站使用fromeworks, web server, service...

  * `Chrome Sniffer | Bao's Blog <http://www.nqbao.com/chrome-sniffer>`__ (Chrome)
  * `Wappalyzer <http://wappalyzer.com/>`__ (Firefox)
  * `Find your extension, accelerator and addon for the browsers safari, internet explorer(ie), chrome and firefox <http://www.tcpiputils.com/browser-extensions-addons-accelerators>`__ (Chrome, Firefox, Opera, Safari)

    
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


scratchpad: 按shift+F4

* [重新介紹 Firefox 開發者工具之二 | 訊息中心 | Mozilla Taiwan](http://blog.mozilla.com.tw/posts/4200/reintroducing-the-firefox-developer-tools-part-2-the-scratchpad-and-the-style-editor)


Opera
^^^^^^^^^^^^^^^^^^^^   

spead dial 設定::

  opera://flags/#experimental-start-page

* `JsonViewer 延伸套件 - Opera 外掛程式 <https://addons.opera.com/zh-tw/extensions/details/jsonviewer/?display=en>`__
* `Push to Kindle 延伸套件 - Opera 外掛程式 <https://addons.opera.com/zh-tw/extensions/details/push-to-kindle/?display=en>`__

  
好用軟體
-----------------

開發工具
^^^^^^^^^^^^^^^^^^^^

* 好用的內建 diff, command line: opendiff (開 FileMerge)
* `Sequel Pro <http://www.sequelpro.com/>`__ MySQL client
* `Charles Web Debugging Proxy • HTTP Monitor / HTTP Proxy / HTTPS & SSL Proxy / Reverse Proxy <http://www.charlesproxy.com/>`__
  
  1. Install Charles.app
  2. iOS add SSL certificate (不管 https 可忽略)
  3. 設定 proxy: iOS 的 Wi-Fi, HTTP PROXY 改 Manual

    * Server: 裝 Charles.app 的電腦 IP (要在同一個網路下)
    * Port: 8888

  4. Charles.app 會收到 request, 按 accept 就可以了
  5. 操作 iOS 的 APP, Charles.app 就有資料了
     
* `PixelWindow <http://www.pixelwindowapp.com/>`__ resolution ruler
* `meld <http://meldmerge.org/>`__: $ homebrew install meld
     
應用
^^^^^^^^^^^^^^^^^

* bt - Deluge (Linux)
* `calibre - E-book management <http://calibre-ebook.com/>`__ ebook reader


系統工具
-----------

無法格式化 500 GB 或更大的磁碟, 無法寫入設備上最後的區塊

`磁碟工具程式：無法格式化 500 GB 或更大的磁碟 <http://support.apple.com/kb/TS2644?viewlocale=zh_TW&locale=zh_TW>`__


工具
^^^^^^^^^^^^^^^^^^^^   

osx mount ext2/3: `FUSE for OS X <http://osxfuse.github.com/>`__ + `fuse-ext2 <http://sourceforge.net/projects/fuse-ext2/>`__



從Leopard升級到Mavericks (Archive)
------------------------------------

家裡一台很舊的iMac，作業系統跑Leopard (OS X 10.5.8)，很多軟體都不支援如 LINE桌面版... ，或是連Chrome都不更新了，倒是Firefox還很照顧這些老電腦...

最近Mavericks開放免費更新，我的MacBook Air (Lion) 免費升級新的Mavericks後，覺得很好用，實在也很想更新這台iMac，Leopard一般是無法直接升級到Mavericks的，除非花一點錢，先升級成Snow Leopard (OS X 10.6)，才可以免費升級到Mavericks。但是網路上果然有解決方法！！

參考這篇: `How to install Mavericks over Leopard | Macworld <http://www.macworld.com/article/2056564/how-to-install-mavericks-over-leopard.html>`__



1. 下載Mavericks
^^^^^^^^^^^^^^^^^^^^   

我的MacBook Air已經更新10.9了，但還是可以再下載。

改一個系統檔:

::
   
    /System/Library/CoreServices/SystemVersion.plist
    # 把10.9的地方改稱10.8

然後到iTunes Mavericks官方頁面[Mavericks](https://itunes.apple.com/tw/app/id675248567?mt=12)就可以"重新"下載了。下載完的檔案會放在 */Applications/Install\ OS\ X\ Mavericks.app*，大概有5G多，iTunes載完會自動跳出安裝視窗，但是先不理他，可以把這個目錄copy到其他地方，不然系統以為安裝完後就會自動殺掉。

2. 製作開機磁碟
^^^^^^^^^^^^^^^^^^^^

用Terminal打入以下:

.. code-block:: bash
                
    sudo /Applications/Install\ OS\ X\ Mavericks.app/Contents/Resources/createinstallmedia --volume /Volumes/MY_EXTURNAL_HD --applicationpath /Applications/Install\ OS\ X\ Mavericks.app --nointeraction

訊息跑完後就好了。(原本磁碟內容會消除)

ref: `How to make a bootable Mavericks install drive | Macworld <http://www.macworld.com/article/2056561/how-to-make-a-bootable-mavericks-install-drive.html>`__


3. 安裝
^^^^^^^^^^^^^^^

改系統檔(不確定這是不是一定要):

::
   
    /System/Library/CoreServices/SystemVersion.plist
    # 把10.5.8改成10.68


    外接硬碟接上iMac，重新開機。開機時按住*Option*會跳出選擇開機磁碟，就選剛才製作好的開機碟。就會開始自動安裝了。
