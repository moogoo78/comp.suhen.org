[Computer] 用Emacs dired-mode批次改檔名
#############################################
:date: 2013-06-17 14:55
:category: computer
:tags: emacs, note
:slug: emacs_dired_rename


看到 XahLee_ 的一篇文章: `Emacs: Rename Files Interactively by Pattern (regex; wdired) <http://ergoemacs.org/emacs/rename_file_pattern.html>`__ ，用Emacs來處理批次改檔名實在太方便了。

在Dired模式下，**C-x C-q** 進入修改模式，或是執行 **wdired-change-to-wdired-mode**, 這時改檔名就像改一般文字檔一樣，可以用 *query-replace*, *query-replace-regexp* 或 *cua-mode* , 改完後 **C-c C-c** 送出, 或是 **C-c C-Esc** 取消就可以了,  比寫script直覺多了。

.. _XahLee: http://xahlee.org
