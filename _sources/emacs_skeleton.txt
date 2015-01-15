用Emacs的skeleton快速建立pelican的blog內文
#################################################
:date: 2013-08-27 18:07
:category: computer
:tags: emacs
:slug: emacs_skeleton


用 `Pelican <|filename|/computer/pelican.md>`_ 寫blog時都要輸入一堆metadata很麻煩, 利用 `Emacs <|filename|/computer/emacs.rst>`_ 的skeleton-mode可以很快產生template, 接受mini-buffer輸入, insert lisp function...超方便!!


.. code-block:: cl

  (define-skeleton insert-pelican-template
    "Insert templete for pelican static blog system"
    "" (skeleton-read "Title: ")?\n
    "#############################" ?\n
    ":date: " (insert-current-date) ?\n
    ":category: " (skeleton-read "category: ") ?\n
    ":tags: " (skeleton-read "tags: ") ?\n
    ":slug: " (skeleton-read "slug: ") ?\n
  )


參考: 
`EmacsWiki: Skeleton Mode <http://www.emacswiki.org/emacs/SkeletonMode>`__


