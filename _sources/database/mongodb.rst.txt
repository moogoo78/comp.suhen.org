MongoDB
==============

debian 版本比較舊, 預設 apt 跑不起來

`Install MongoDB Community Edition on Debian — MongoDB Manual 3.6 <https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/>`__

.. code-block:: bash

  $ mongod --dbpath db
  $ mongod --dbpath db --smallfiles
  $ mongod --config /usr/local/etc/mongod.conf # macos

**dump/import**

.. code-block:: bash

  $ mongodump # 預設存成 dump 資料夾
  $ mondodump -h <host> -d <db_name> -c <collection_name> -o <output_path>
  $ mongorestore # 預設讀取 dump 資料夾
  $ mongorestore -d <db_name> --gzip <folder>
  $ mongorestore -h <host> -d <db_name> -c <collection_name> <bson_file_path>


params
.. code-block::

   -h：         host
   -u：         user
   -p：         password
   --port：     port
   -d：        database
   -c：        collection
   -o：        output (path)






Snippets
--------------

select fieldname has value:

.. code-block::

   db.mycollection.find({ 'fieldname' : { $exists: true, $ne: null } });



aggregate/group/year-month:

.. code-block::

  db.getCollection('Annotations').aggregate( [
  {
    $project: {
      year: {$year: "$createTime"},
      month: {$month: "$createTime"},
    },
  },
  {
    $group: {
      _id: {
        year: '$year',
        month: '$month',
      },
      year: { $first : "$year" },
      month: {$first: "$month"},
      count: {
        $sum: 1
      },
    },
  },
  {
    $sort: {
      '_id.year': -1,
      '_id.month': -1
    }
  },
  ]);



check last modified (orderBy):

.. code-block::

   db.getCollection('Annotations').find().sort({createTime: -1})

