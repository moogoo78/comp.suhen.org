Elscreen - Emacs好用的tab mode
####################################
:date: 2013-04-23 17:28
:category: computer
:tags: note
:slug: emacs_elscreen


我以為在Emacs一直沒有好的tab顯示模式，以前用過 `tabbar mode <http://emacswiki.org/emacs/TabBarMode>`__ ，也覺得不是很好用，原來只是我固陋寡聞沒見過ElScreen這個elist套件。

下載elscreen.el: ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/

elscreen.el只有一個檔案，但是他要依附一套 `APEL <https://github.com/jeffgran/APEL>`__ 才可以運作。

::

  ;; elscreen
  (add-to-list 'load-path (concat my-path "goodies/APEL"))
  (load "elscreen" "ElScreen" )
  (setq elscreen-display-tab t)
   
  (global-set-key (kbd "C-x t") 'elscreen-create)
  (global-set-key (kbd "C-x w") 'elscreen-kill)  
  (global-set-key (kbd "M-t") 'elscreen-previous) ;;transpose-words
  (global-set-key (kbd "M-n") 'elscreen-next)  


參考:

- `elscreen 改め tabbar のインストールログ - テクノ組曲 <http://d.hatena.ne.jp/plasticster/20110825/1314271209>`__
- `emacs-fu: keeping related buffers together with elscreen <http://emacs-fu.blogspot.tw/2009/07/keeping-related-buffers-together-with.html>`__
