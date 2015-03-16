Flask
===================

request:

.. code-block:: python

  request.remote_addr # client id
  request.access_route # all ip addresses from client (access_route[0]) to the last proxy server,
  # 判斷環境變數 HTTP_X_FORWARDED_FOR

* `charles leifer | Structuring flask apps, a how-to for those coming from Django <http://charlesleifer.com/blog/structuring-flask-apps-a-how-to-for-those-coming-from-django/>`__
* `lask/examples at master · mitsuhiko/flask <https://github.com/mitsuhiko/flask/tree/master/examples>`__
* `semirook/flask-kit <https://github.com/semirook/flask-kit>`__

  

settings
--------------

設定檔放在一起 (config.py)，容易比較，敏感資料從 os.environ.get('foo') 取得

.. code-block:: python

   env = os.environ.get('APP_ENV','DevConfig')
   app.config.from_object(
       'config.%' % env))

   app.config['ENV'] = env


structure 目錄配置
------------------------

中央集權 - 大V大T
~~~~~~~~~~~~~~~~~~~~~~~~~~

我們同一家

結構層次簡單，方便資源/功能共享，
  
.. code-block:: text

   app/
       __init.py
       static/
       templates/
           api/
           admin/
           user/
       views/
           __init__.py
           api.py
           admin.py
           user.py
       models.py


地方自治 - 小V小T
~~~~~~~~~~~~~~~~~~~~~~~~~~

自己的 template, view 自己管

層次多，改 admin 時, views, static, templates 都在附近, 不用移來移去

別的網站要用可以整包搬 ?   

.. code-block:: text

   app/
       __init.py
       api/
           __init__.py
           views.py
           static/
           templates/
       admin/
           __init__.py
           views.py
           static/
           templates/       
       user/
           __init__.py
           views.py
           static/
           templates/
       models.py       


Extensions (Plugins)
----------------------------
* `Flask-Login documentation <http://packages.python.org/Flask-Login/>`__, `leafstorm / flask-login / overview — Bitbucket <https://bitbucket.org/leafstorm/flask-login>`__
* `Flask-WTF <http://packages.python.org/Flask-WTF/>`__, `WTForms Documentation <http://wtforms.simplecodes.com/docs/dev/>`__, `danjac / flask-wtf / overview — Bitbucket <https://bitbucket.org/danjac/flask-wtf>`__
       
