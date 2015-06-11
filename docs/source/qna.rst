常見錯誤解決
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
