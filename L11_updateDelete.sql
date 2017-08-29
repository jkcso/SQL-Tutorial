# LESSON 11 (A).
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# UPDATE: Come on, you know what is doing!  It is used to update an existing record in a table.
# WARNING: Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!

# The following will update a record we had inserted previously.
UPDATE Categories
SET CategoryName='Kids', Description='Kids table games and sport equipment'
WHERE CategoryName='Home Furniture'

# LESSON 11 (B).

# the DELETE keywoard: used to delete existing records in a table.
DELETE FROM Categories
WHERE CategoryName='Home'

# The above will delete the record we added previously having a null description.

# We can now empty a table using:
DELETE * FROM table_name;