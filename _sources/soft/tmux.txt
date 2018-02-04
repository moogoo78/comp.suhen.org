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
  
  # help
  <prefix> ?

scroll::
  
  Ctrl-b [ 上/下/左/右 , q 離開

* `tmux shortcuts & cheatsheet <https://gist.github.com/MohamedAlaa/2961058>`__
* `tmux cheatsheet <https://gist.github.com/andreyvit/2921703>`__
* `tmux cheatsheet <https://gist.github.com/henrik/1967800>`__
* `A minimalist guide to tmux <https://medium.com/actualize-network/a-minimalist-guide-to-tmux-13675fb160fa>`__
  
conf

* `Daniel Allen Deutsch <http://danielallendeutsch.com/blog/16-using-tmux-properly.html>`__
