tmux
=====================



Quick Start::

  <prefix> c: Create a new window (appears in status bar)
  <prefix> 0: Switch to window 0
  <prefix> 1: Switch to window 1
  <prefix> 2: Switch to window 2 (etc.)
  <prefix> x: Kill current window
  <prefix> d: Detach tmux (exit back to normal terminal)
  --
  <prefix> n/p: 前/後一個視窗
  <prefix>": 分割上下pane
  <prefix> %: 分割左右pane
  <prefix> SPACE: 重整pane(幫你排)
  <prefix> 按著不放再按上下左右: 調整視窗大小

  # 移動到另一視窗
  <prefix> 上下左右
  <prefix> o

  # 視窗交換位址
  <prefix> C-o

  # 顯示時間
  <prefix> t

  # 回到剛才的tmux session
  $ tmux a (attach)

  $ tmux ls: list
  $ tmux a -t <session-name>

  $ tmux new -s session_name自己取一個 session name (instead of number)
  $ tmux rename-session -t 0 my_new_name

  # help
  <prefix> ?

  $ tmux kill-session -t 0
  $ tmux kill-session -t <session_name>
  $ tmux kill-session -a # 全部
  $ tmux kill-server


scroll::

  Ctrl-b [ 上/下/左/右 , q 離開

* `tmux shortcuts & cheatsheet <https://gist.github.com/MohamedAlaa/2961058>`__
* `tmux cheatsheet <https://gist.github.com/andreyvit/2921703>`__
* `tmux cheatsheet <https://gist.github.com/henrik/1967800>`__
* `A minimalist guide to tmux <https://medium.com/actualize-network/a-minimalist-guide-to-tmux-13675fb160fa>`__


常用::

    <prefix> c Create a new window (with shell)
    <prefix> w Choose window from a list
    <prefix> 0 Switch to window 0 (by number )
    <prefix> , Rename the current window
    <prefix> % Split current pane horizontally into two panes
    <prefix> " Split current pane vertically into two panes
    <prefix> o Go to the next pane
    <prefix> ; Toggle between current and previous pane
    <prefix> x Close the current pane


copy-mode::

  <prefix> [

  # 按 space 開始移動選範圍, enter 結束
  # <prefix> ] # 貼上


switch-pane to other session::

  <prefix>:move-pane -t 1:1 # session_name:window_name

conf

* `Daniel Allen Deutsch <http://danielallendeutsch.com/blog/16-using-tmux-properly.html>`__

tuts

* `Getting started with Tmux | Linuxize <https://linuxize.com/post/getting-started-with-tmux/>`__
