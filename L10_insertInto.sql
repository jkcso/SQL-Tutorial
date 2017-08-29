# LESSON 9 (A).
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# The INSERT INTO statement.
# It is used to insert new records in a table and is possible to write it in two ways.

# The first way specifies both the column names and the values to be inserted:
INSERT INTO Categories(CategoryName, Description)
VALUES ('Sports', 'Athletic Equipment')	

# We can also write into just one of the columns, for example in CategoryName, and this will have as a result for the value in the field Description to be a null.
INSERT INTO Categories(CategoryName)
VALUES ('Home')	

# The second way is to just specify the table name.  I tried passing 2 params as above omitting the ID but an error was returned therefore I passed the next availble ID too but this should be avoided.
INSERT INTO Categories
VALUES ('11', 'Home Furniture', 'Home Equipment')

# LESSON 9 (B).
# Let's now talk about null values.  A field with a NULL value is a field which has no value, not 0, just nothing inside.  This happens when we insert or update a record and we don't include a value in an optional field.

# Q: How do I test  for NULL values?
# A: Not possible with comparison operators (i.e =, <, or <>).  We need to make use of IS NULL and IS NOT NULL operators.  The query that follows will return the second record insertion we had today.
SELECT CategoryName, Description
FROM Categories
WHERE Description IS NULL

# This returns the categories which have no NULL Description and have ID < than 4.
SELECT CategoryID, CategoryName, Description
FROM Categories
WHERE Description IS NOT NULL AND CategoryID < 4
ORDER BY CategoryID

# NOTE: IS NULL can be used for fields that have no values inside at all, so not only for NULLs.  Therefore a good example is a customer record where there is the home phone and mobile phone number and not all of them have both phones.  Therefore the one will be empty and checking for IS NULL in home phone or mobile phone will be useful.