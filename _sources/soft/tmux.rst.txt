tmux
=====================

session -> window -> pane

shortkey
----------
tmux command::

  $ tmux ls: list
  $ tmux a -t <session-name>

  $ tmux new -s session_name自己取一個 session name (instead of number)
  $ tmux rename-session -t 0 my_new_name
  $ tmux kill-session -t 0
  $ tmux kill-session -t <session_name>
  $ tmux kill-session -a # 全部
  $ tmux kill-server


tmux::

  <prefix> c Create a new window (with shell)
  <prefix> w Choose window from a list
  <prefix> d: Detach tmux (exit back to normal terminal)
  # 顯示時間
  <prefix> t
  # help
  <prefix> ?

session::

  # rename session
  <prefix> $
  # switch session
  <prefix> s
  # switch to last session
  <prefix> l


window::

  # switch window
  <prefix> n/p # 前/後一個視窗
  <prefix> 0 # Switch to window 0 (by number )
  <prefix> c # Create a new window (appears in status bar)
  <prefix> , # Rename the current window
  <prefix> x # Kill current window
  <prefix> . # edit window number/sort
  <prefix> & # close window


pane::

  # switch pane
  <prefix> 上下左右
  <prefix> o

  <prefix>": 分割上下pane
  <prefix> %: 分割左右pane
  <prefix> SPACE: 重整pane(幫你排)
  <prefix> 按著不放再按上下左右: 調整視窗大小

  <prefix> ! # open current panel to new window
  <prefix> q # display panel number

copy-mode::

  <prefix> [

  # 按 space 開始移動選範圍, enter 結束
  # <prefix> ] # 貼上


switch-pane to other session::

  <prefix>:move-pane -t 1:1 # session_name:window_name


ref
----------
* `Getting started with Tmux | Linuxize <https://linuxize.com/post/getting-started-with-tmux/>`__
* `A minimalist guide to tmux <https://medium.com/actualize-network/a-minimalist-guide-to-tmux-13675fb160fa>`__

cheatsheet:

* `tmux shortcuts & cheatsheet <https://gist.github.com/MohamedAlaa/2961058>`__
* `tmux cheatsheet <https://gist.github.com/andreyvit/2921703>`__
* `tmux cheatsheet <https://gist.github.com/henrik/1967800>`__


conf:

* `Daniel Allen Deutsch <http://danielallendeutsch.com/blog/16-using-tmux-properly.html>`__

