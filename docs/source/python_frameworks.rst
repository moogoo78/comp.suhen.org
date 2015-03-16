
Python Web Framework (SQLAlchemy, Jinja2, Django)
==============================================================


SQLAlchemy
---------------------------

setting
~~~~~~~~~~~~~~~~~~~~
sqlite path::

  # sqlite://<nohostname>/<path>
  # where <path> is relative:
  engine = create_engine('sqlite:///foo.db')

  # or absolute, starting with a slash:
  engine = create_engine('sqlite:////absolute/path/to/foo.db')

import::

  from flask.ext.sqlalchemy import BaseQuery
  from sqlalchemy.sql import func

schema
~~~~~~~~~~~~~~~~~~~~~~~~~

column parameters::

  primary_key =True
  nullable=False
  unique=True
  default
  onupdate
  index=True

* `Schema Definition Language — SQLAlchemy 0.7 Documentation <http://docs.sqlalchemy.org/en/rel_0_7/core/schema.html>`__

mapper_args::

  __mapper_args__ = {'order_by': '-created'}
  __mapper_args__ = {'order_by': [sort, name]}
  __mapper_args__ = {'primary_key':(app_id, num_log)} # 沒有primary key時用!

relationship::

  employees = relationship('Employee',
                  backref='company', cascade='all, delete-orphan')

  # 原本backref是one-to-many, 如果要one-to-one:
  child = relationship("Child", backref=backref("parent", uselist=False))

relationship+filter::

  products = db.relationship(
      'SaleProductData',
      lazy="dynamic",
      backref='sale_event')

  products.filter_by(type=1).all()



http://docs.sqlalchemy.org/en/latest/orm/inheritance.html


Query
~~~~~~~~~~~~~~~~

rand::

  from sqlalchemy.sql import func

  query.order_by(func.rand())


date::

  query.group_by(func.day(LogUserData.dtime).all()


group by::

    votes = db.session.query(EventDC1Vote,
    func.count(uid).label('cnt'), 'uid').group_by('uid').order_by('cnt DESC').all()


between, like::

    q = db.session.query(func.count('*')).\
            filter(API2Log.dtime.between(i[0], i[1]),
                   API2Log.data.like('%%%s%%' % j['data']))

.. code-block:: python

    from sqlalchemy import distinct
    session.query(func.count(distinct(User.name)))

in/limit/order::

  a_list = self.filter(Article.shop_id==g.shop_id,
               Article.blog_id.in_(blog_id)).\
               order_by('-created').\
               limit(limit).\
               all()

join::

  reg_list = db.session.query(User.name, User.email).\
  join(LogUserData, User.id==LogUserData.uid).\
  filter(User.email != '', LogUserData.app_id.in_([156, 157])).\
  all()

  SELECT user.name, user.email, log_user_data.app_id
  FROM `user`
  LEFT JOIN log_user_data ON user.id = log_user_data.uid
  WHERE `email` != '\"\"' and log_user_data.app_id in (156,157)

join, or::

  from sqlalchemy import or_, and_
  p = Product.query.join('brand').\
      filter(or_(Product.title.like('%' + s + '%'),
                 Brand.name.like('%' + s + '%'))).\
      filter(Product.shop_id==g.shop_id).\
      all()


foreign key constraint

.. code-block:: python

  # database level
  ForeignKey('category.id', ondelete='SET NULL')
  # pythen level
  relationship(passive_deletes=True)


relationship, associate

.. code-block:: python

  # db.Table
  # class Foo()
  # class Bar():
  # foo_id = 'foo.id'

  foo = Foo()
  db.session.add(foo)
  db.session.append(Bar.query.get(1))
  db.session.commit() 

  
debug
~~~~~~~~~~~~~
http://pythonhosted.org/Flask-SQLAlchemy/api.html#flask.ext.sqlalchemy.get_debug_queries


常見error

0.8更新::

  'dynamic' loaders cannot be used with many-to-one/one-to-one relationships and/or uselist=False.

0.8以後的SQLAlchemy的relationship如果是是many-to-one, one-to-one的關係用了dynamic loader ``lazy='dynamic'`` , 或是加了 ``uselist=False`` , 都會吐錯誤訊息出來. (以前只是warning)

changelog (0.8): http://docs.sqlalchemy.org/en/latest/changelog/changelog_08.html#change-5f7f7241c49f5c13956148d68788a5b4

文件 (0.7): http://docs.sqlalchemy.org/en/rel_0_7/orm/collections.html#dynamic-relationship

比較
~~~~~~~~~~~
* `SQLAlchemy and You | Armin Ronacher's Thoughts and Writings <http://lucumr.pocoo.org/2011/7/19/sqlachemy-and-you/>`__


  
Jinja2
---------------------

.. code-block:: python

  sort(value, reverse=False, case_sensitive=False, attribute=None)::

  {% for item in iterable|sort(attribute='date') %}
    ...
  {% endfor %}

  dictsort(value, case_sensitive=False, by='key')::

  {% for item in mydict|dictsort(false, 'value') %}
      sort the dict by key, case insensitive, sorted
      normally and ordered by value.


Django
--------------


.. code-block:: bash

  $ pip install Django
  $ django-admin.py startproject mysite
  $ python manage.py startapp myapp

check version:

.. code-block:: python

  import django
  print django.get_version()

* `Django | Django documentation | Django documentation <https://docs.djangoproject.com/en/1.3/>`__
* `Django snippets: django paginator <http://djangosnippets.org/snippets/1811/>`__

