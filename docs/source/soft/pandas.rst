Pandas
=============

::

   SELECT *
   FROM table
   WHERE colume_name = some_value

   df.loc[df['column_name'] == some_value]

ref: `python - Select rows from a DataFrame based on values in a column in pandas - Stack Overflow <https://stackoverflow.com/questions/17071871/select-rows-from-a-dataframe-based-on-values-in-a-column-in-pandas>`__

Quick Start
------------------

.. code-block:: python

    ## settings
    pd.set_option('display.max_rows', 500)
    pd.set_option('display.max_columns', 500)
    pd.set_option('display.width', 1000)

    pd.set_option('display.max_column',None)
    pd.set_option('display.max_rows',None)
    pd.set_option('display.max_seq_items',None)
    pd.set_option('display.max_colwidth', 500)
    pd.set_option('expand_frame_repr', True)
    pd.options.display.width = None

    # SQL SELECT
    df = df[['num_yes', 'something1', 'something']]
    # SQL JOIN
    df = thing1.join(thing2)
    # SQL WHERE
    df = df[df.created_at > 1000]
    # SQL GROUP BY
    df = df.groupby('something', num_yes = ('yes', 'sum'))
    # SQL HAVING, filtering on the result of a GROUP BY
    df = df[df.num_yes > 2]
    # SQL ORDER BY and LIMIT
    df.sort_values('sometthing', ascending=True)[:30]
    # group & count
    df.groupby(['Foo'])['Foo'].agg('count')
    # select where
    df.loc[df['column_name'] == some_value]

    # nan fill with blank string
    df.fillna('', inplace=True)

    # df = df.astype(str) # all data type to str
