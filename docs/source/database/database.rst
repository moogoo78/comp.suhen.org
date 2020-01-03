Database筆記
===================================================


RDBMS
---------------


常用 SQL Syntax
~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: sql

   ALTER USER "user_name" WITH PASSWORD 'new_password';   # 改 user 密碼
   ALTER DATABASE name RENAME TO new_name # 不能 connect 時改, 用 psql 不要加 -d


把 count, group by 起來的結果筆數全部加起來, 重點是 "as A" 要加

.. code-block:: sql

    SELECT SUM(cnt) FROM (SELECT COUNT(*) AS cnt
    FROM taibif_col
    GROUP BY genus) as A

單字表沒有照abc排, 要照字母順序排序(num)

.. code-block:: sql

  SELECT *, (SELECT COUNT(*) FROM en_word AS t2 where LOWER(t2.word) <= LOWER(t1.word)) as NUM FROM en_word AS t1 WHERE t1.id = foo ORDER BY LOWER(word)

一個裝置, 安裝了2個app以上的數量統計

.. code-block:: sql

  select count(*) as total, num as num_of_apps from (select count(*) as num, did from log_user_data group by (did) order by num desc) t where num > 1 group by num desc

每個字母開頭的單字數量

.. code-block:: sql

  select count(*),lower(substr(english, 1, 1)) as c from words group by c



比較
~~~~~~~~~~~~~~~

:MySQL: RAND()
:Sqlite: RANDOM()

MySQL有ROW_NUMBER(), Sqlite沒有, 只能用SQL語法的奇技淫巧來達成.


DB 特性討論:

* `Goodbye MongoDB, Hello PostgreSQL <http://developer.olery.com/blog/goodbye-mongodb-hello-postgresql/>`__

