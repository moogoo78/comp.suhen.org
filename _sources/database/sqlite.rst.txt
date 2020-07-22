SQLite
===============

常用指令

.. code-block::

  $ sqlite3 new.db # create db
  $ sqlite3 myprecious.db ".dump" ＞ output.sql # dump sql
  $ sqlite3 new.db ＜ output.sql # import
  # or
  $ cat dumpfile.sql | sqlite3 new.db


SQLite 沒有 truncate, 用 delete from

.. code-block:: sql

   DELETE FROM table_name;

進入sqlite3後::

  .tables  # MySQL的show tables
  .schema TABLENAME
  .help
  .quit


dump to csv
------------------------

.. code-block::

   sqlite> .headers on
   sqlite> .mode csv
   sqlite> .output data.csv
   sqlite> SELECT customerid,
      ...>        firstname,
      ...>        lastname,
      ...>        company
      ...>   FROM customers;
   sqlite> .quit


import from csv
------------------------

.. code-block::

   sqlite> .headers on
   sqlite> .mode csv
   sqlite> .import data.csv table_name


.. code-block:: bash

    $ sqlite3 -header -csv c:/sqlite/chinook.db "select * from tracks;" > tracks.csv
    $ sqlite3 -header -csv c:/sqlite/chinook.db < query.sql > data.csv



ref: `Export SQLite Database To a CSV File <http://www.sqlitetutorial.net/sqlite-tutorial/sqlite-export-csv/>`__

ref

* `Command Line Shell For SQLite <http://www.sqlite.org/sqlite.html>`__
