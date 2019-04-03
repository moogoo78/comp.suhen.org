Web DevOops
==================





Web server / Daemon
------------------------



service
~~~~~~~~~~~~~~


::

   $ chkconfig
   $ chkconfig --level 2345 nginx on



supervisor
~~~~~~~~~~~~~

web 界面

supervisord.cond::
  
  ;[inet_http_server]         ; inet (TCP) server disabled by default, 外連要改 0.0.0.0:9001
  ;port=127.0.0.1:9001        ; (ip_address:port specifier, *:port for all iface)
  ;username=user              ; (default is no username (open server))
  ;password=123               ; (default is no password (open server))


gunicorn
~~~~~~~~~~~~~~

.. code-block:: bash
                
    $ gunicorn main:app -b 0.0.0.0

    # port 80 好像不行

uwsgi
~~~~~~~

.. code-block:: bash

    # kill existing uwsgi
    ps aux|grep uwsgi |awk '{ print $2}' | xargs --no-run-if-empty sudo kill -9
    sleep 1
    # start with virtualhost setting
    sudo uwsgi -s :9090 -M -p 4 --vhost &

    
nginx
~~~~~~~~~~

redirect test.com to www.test.com

.. code-block:: text

    server {
        server_name test.com;
        return 301 $scheme://www.test.com$request_uri;
    }


上傳檔案限制

.. code-block:: text

   # /etc/nginx/nginx.conf, 找 http, server or location
   # set client body size to 2M #
   client_max_body_size 2M;    

   
Apache
~~~~~~~~~~~~

Mac apache folder:

    /Library/WebServer/Documents
    

PHP environment
--------------------------

PHP session::

    /var/lib/php/session


php start::

    sudo /etc/init.d/php_cgi start



python environment
---------------------

Pillow jpeg 老問題
~~~~~~~~~~~~~~~~~~~

Debian::

  $ sudo apt-get install libjpeg-dev
  $ pip install --no-cache-dir -I pillow # reinstall pillow


cryptography 安裝失敗
~~~~~~~~~~~~~~~~~~~~~~~~~~

似乎在 digital ocean 最便宜 image 才會發生. resource 不夠 (build 時會卡很久)

sovle::

  # 做一個 512MB 的swap
  $ sudo dd if=/dev/zero of=/swapfile bs=1024 count=524288
  $ sudo chmod 600 /swapfile
  $ sudo mkswap /swapfile
  $ sudo swapon /swapfile

  $ pip install cryptography # 就 ok 了, 神

  # 解除
  $ swapoff /swapfile
  $ rm /swapfile

ref:

`Running setup.py install for cryptography ... error command 'x86_64-linux-gnu-gcc' failed with exit status 4 · Issue #2324 · certbot/certbot <https://github.com/certbot/certbot/issues/2324>`__
  
