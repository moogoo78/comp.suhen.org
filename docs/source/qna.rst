問題解決
================

AWS
---------

eb cli 出現錯誤 (MacOS X Yosemite)

.. code-block:: bash

    Traceback (most recent call last):
      File "/Library/Frameworks/Python.framework/Versions/2.7/bin/eb", line 5, in <module>
        from pkg_resources import load_entry_point
      File "build/bdist.macosx-10.6-intel/egg/pkg_resources.py", line 2912, in <module>
        
      File "build/bdist.macosx-10.6-intel/egg/pkg_resources.py", line 550, in _build_master
        
      File "build/bdist.macosx-10.6-intel/egg/pkg_resources.py", line 563, in _build_from_requirements
        keys2.append(dist.key)
      File "build/bdist.macosx-10.6-intel/egg/pkg_resources.py", line 742, in resolve
        
    pkg_resources.DistributionNotFound: six==1.8.0



solved:

1. sudo pip install --upgrade setuptools
2. sudo pip uninstall awsebcli
3. sudo pip install awsebcli
4. eb --version


bitbucket multiple ssh keys
------------------------------

在 bitbucket, git 多個帳號設定 ssh keys (免打密碼)


產生除了預設之外的 ssh key pairs:

.. code-block:: bash

    ssh-keygen -t rsa -C "your_email@youremail.com" -f ~/.ssh/other_key
    
    # 複製到剪貼簿 (mac)
    pbcoby < ~/.ssh/other_key.pub

    
設定 .ssh/config:

.. code-block:: text

    Host bitbucket-other
        User git
        Hostname bitbucket.org
        PreferredAuthentications publickey
        IdentitiesOnly yes
        IdentityFile ~/.ssh/other_key

這樣用 git 就不用打密碼了


push notification
---------------------

利用 Corona, AWS/SNS 做推播 (push notification)

.. figure:: /images/computer/push_notification.JPG
   :alt: push\_notification

   push\_notification

-  `Setting up AWS SNS to send Push notifications to iOS devices -
   Adventures of an
   Entrepreneur <http://www.adventuresofanentrepreneur.net/creating-a-mobile-appsgames-company/setting-up-aws-sns-to-send-push-notifications-to-ios-devices>`__
   - AWS, SNS 的設定步驟

用 AWS SNS 發送到 GCM 的步驟:

1. Google API 管理界面 (https://console.developers.google.com) 產生一個
   project, 從 project create 一個 API KEY (for server)
2. 用這個 key 到 SNS 界面產生一個 Apps
3. google project id, 填到 config.lua (CoronaSDK)

測試:

-  GCM 的 token 亂給也可以加到 SNS 的 endpoint, 如果 APNS 的話 token
   亂給 boto 會收到 400 的錯誤


Python package (pip)
-----------------------

pip install gevent

.. code-block:: bash

   FLAGS='-std=c99' pip install gevent
