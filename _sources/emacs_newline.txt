[computer] Emacs輸入newline符號
#####################################
:date: 2013-06-27 11:32
:category: computer
:tags: emacs, note
:slug: emacs_newline

Emacs的換行::

  C-q C-j 

.. note:: `C-q`: quoted-insert, `C-j`: newline

但是我的 `C-q` 和 `C-j` 為了使用dvorak layout, 改成cut & paste::

  (global-set-key (kbd "C-q") 'kill-region) ; cut
  (global-set-key (kbd "C-j") 'kill-ring-save) ; paste

因此把沒用到的 `C-`` 跟 `C-,` 拿來做key-translate::

  (define-key key-translation-map (kbd "C-q") (kbd "C-'"))
  (define-key key-translation-map (kbd "C-'") (kbd "C-q"))
  (define-key key-translation-map (kbd "C-j") (kbd "C-,"))
  (define-key key-translation-map (kbd "C-,") (kbd "C-j"))
  (global-set-key (kbd "C-'") 'kill-region)
  (global-set-key (kbd "C-,") 'kill-ring-save)
  
搞得很複雜... 先試用一下看看...
