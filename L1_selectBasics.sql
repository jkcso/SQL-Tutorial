# LESSON 1.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# SELECT is by far the most famous statement in SQL used to retrieve (aka query) data from a database.
# It supports all relational operators, sorting, grouping and aggregate functions but can be used as a subquery in expressions.

# Using https://www.w3schools.com/sql/trysql.asp?filename=trysql_op_in and the ER_diagram.png we have we can create and then analyse our first query.
SELECT CustomerName, City, Country          # returns as a query response a table of three columns named: CustomerName, City, Country.
FROM Customers                              # the information returned is coming from the table named Customers.
WHERE Country='Spain' AND City='Madrid'     # these are the conditions.  Here we are asking only for the customers who live in Madrid, Spain.

# In the following query we are going to ask for all the customers who live in Spain, no matter in what city.
SELECT CustomerName, City, Country
FROM Customers
WHERE Country='Spain'

# In the next example we are going to query the Products table, asking for all the products which have price greater than £50.00
SELECT ProductName, Price
FROM Products
WHERE Price > 50

# Moving quickly into a more advanced aspect of SELECT keyword we can see that this statement can be also used to choose the number of record returned.
# This is useful on large tables with thousands of records since returning a large number of records can impact on performance.

# The following returns 91 records.  Imagine a database with 91K customers.
SELECT *
FROM CUSTOMERS

# This 2 following queries will return the first 5 customers.
SELECT * 
FROM Customers
LIMIT 5

SELECT TOP 5 * 
FROM Customers

# We can also use percentages here:
SELECT TOP 50 PERCENT * 
FROM Customers