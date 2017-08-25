# LESSON 4 (A).
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# You can join tables using the FROM clause using the comma ',' operator or the JOIN keyword.
# The following two queries will joing the tables wholly in the same way, returning the same result.
SELECT *
FROM Shippers, Categories       # this is the ',' way.

SELECT *
FROM Shippers JOIN Categories   # this is the JOIN way.

# This is not restricted to '*' choice, you can always have:
SELECT ShipperID, CategoryID
FROM Shippers JOIN Categories

# which returns a 2-column result, 
#but the following will result in a one column result named ShipperID:
SELECT ShipperID
FROM Shippers JOIN Categories

# LESSON 4 (B).
# What follows is called Theta join and is performed to join attributes on conditions.

# For example, the following will return the OrderDetails which have a specific product identifier which is 11.
SELECT Products.ProductName, Products.Price, Products.ProductID
FROM Products JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.ProductID = 11

# Playing with the above, if we omit Products. prefix from Products.ProductID we are going to get back an error that what we are looking for is unambiguous.
SELECT Products.ProductName, Products.Price, ProductID
FROM Products JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.ProductID = 11

# If we now omit the WHERE clause and use a query that is like the following, we are going to get back all the products that are part of OrderDetails.  Therefore it's like betting back the products which are sold.
SELECT Products.ProductName, Products.Price, ProductID
FROM Products JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID