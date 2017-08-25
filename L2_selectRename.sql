# LESSON 2.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# This lesson is about renaming attributes mainly to avoid them clashing when representing totally different things and when we want to carry out set operations or relations.  We can do so  using the AS keyword.

# Using the queries of Lesson 1 with this technique we have:
SELECT CustomerName AS name, City, Country
FROM Customers                    
WHERE Country='Spain' AND City='Madrid'


SELECT CustomerName, City AS cust_city, Country
FROM Customers
WHERE Country='Spain'


SELECT ProductName AS product, Price AS productPrice
FROM Products
WHERE Price > 50

# Note that for readibility and to disambiguate the queries we can always make use of the table name <dot> field name like Products.ProductName, without renaming, for example:
SELECT Products.ProductName, Products.Price
FROM Products
WHERE Products.Price > 50

# and also:
SELECT Customers.CustomerName as Name
FROM Customers
WHERE Customers.City = 'Barcelona'