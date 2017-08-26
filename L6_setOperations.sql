# LESSON 6.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# The set operatos are: UNION, INTERSECT and EXCEPT.
# All the operators above remove duplicates and to retain them use UNION ALL, INTERSECT ALL and EXCEPT ALL.

# UNION
# The SQL UNION operator is used to combine the result sets of 2 or more SELECT statements. It removes duplicate rows between the various SELECT statements.
# Each SELECT statement within the UNION must have the same number of fields in the result sets with similar data types.

# The following will return one column called CustomerName that will have the Countries of the suppliers after the last CustomerName, for example:
SELECT CustomerName
FROM Customers
UNION
SELECT Country
FROM Suppliers

# We can check the mutual countries between suppliers and Customers by using the INTERSECT keyword which is going to pick the common countries.
SELECT Country
FROM Customers
INTERSECT
SELECT Country
FROM Suppliers

# Another example in INTERSECTION will show us that there are no customers that are both suppliers because the following will return as result 'no result'.
SELECT CustomerName, Country
FROM Customers
INTERSECT
SELECT SupplierName, Country
FROM Suppliers

# The following is going to select all the suppliers coming from the USA that have products priced more than £20.00.
SELECT SupplierID
FROM Suppliers
WHERE Country = 'USA'
INTERSECT
SELECT SupplierID
FROM Products
WHERE price > 20

# Another one, the following will return all the suppliers that are originated from the USA and what they supply is in the cateogy of 'Beverages'.
SELECT SupplierID
FROM Suppliers
WHERE Country='USA'
INTERSECT
SELECT SupplierID
FROM Products
WHERE (SELECT CategoryID
	   FROM Categories
       WHERE CategoryName = 'Beverages')
              
# Note that the following is going to return an error because we are trying to use INTERSECT while we have 2 different SELECT followups.
SELECT SupplierID, Name  # Name is not a field of Categories and this return an error.
FROM Suppliers
WHERE Country='USA'
INTERSECT
SELECT SupplierID
FROM Products
WHERE (SELECT CategoryID
	   FROM Categories
       WHERE CategoryName = 'Beverages')

# Another one, guess what is returning:
SELECT SupplierID
FROM Suppliers
WHERE Country='USA'
INTERSECT
SELECT SupplierID
FROM Products
WHERE ProductName = "Chef Anton's Gumbo Mix"

# And now guess why this one returns no result:
SELECT SupplierID
FROM Suppliers
WHERE Country='USA'
INTERSECT
SELECT SupplierID
FROM Products
WHERE (SELECT CategoryName
	   FROM Categories
       WHERE CategoryID > 0)

# For the EXCEPT keyword we can use again the following, which is going to give us only the customers, a total of 91 records.
SELECT CustomerName, Country
FROM Customers
EXCEPT
SELECT SupplierName, Country
FROM Suppliers

# which is exactly the same as this one:
SELECT CustomerName, Country
FROM Customers
# becaues as we have see there are no records that are listed as both Customers and Suppliers.

# A better example for EXCEPT is the following:
SELECT OrderID, OrderDate
FROM Orders
EXCEPT
SELECT OrderID, OrderDate
FROM Orders
WHERE OrderDate <= '1996-12-31'
# which returns all the orders except those which have date on 1996 year and backwards.

# NOTE that both INTERSECT and EXCEPT statements need to have the same field after the SELECT statement.  This means exactly the same field names.  This restriction does not apply in UNION where the combination is always possible.