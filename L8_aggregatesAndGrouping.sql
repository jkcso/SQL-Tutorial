# LESSON 8 (A).
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# AGGREGATE FUNCTIONS
# The aggregate functions SUM, AVG, MIN, MAX and COUNT can be used to calculate a single value from the result list or from a part of it - see grouping later.  Nulls are excluded from these calculations.

# The following sums up the total price of products from supplier 2:
SELECT SUM(Price) AS TotalPriceFromSupplierTwo
FROM Products
WHERE SupplierID = '2'

# The following provides the average price of the products from supplier 2:
SELECT AVG(Price) AS AveragePriceFromSupplierTwo
FROM Products
WHERE SupplierID = '2'

# This return the minimum price of the products sold from supplier 2:
SELECT MIN(Price) AS MinimumPriceFromSupplierTwo
FROM Products
WHERE SupplierID = '2'

# And this one returns the maximum:
SELECT MAX(Price) AS MinimumPriceFromSupplierTwo
FROM Products
WHERE SupplierID = '2'

# Looking a bit to what is coming next, we can find the product name having the minimum price of all of them using:
SELECT ProductName, Price
FROM Products
WHERE Price = (SELECT MIN(Price)
			   FROM Products)

# COUNT(DISTINCT attribute) counts the number of distinct values of the attribute.  COUNT(*) is an aggregate function that counts the number of tuples in a relation or group (including nulls).

# This will return the number of employees but if 'null' values are presented it will count them as well:
SELECT COUNT(*) AS totalNumOfEmployees
FROM EMPLOYEES

# This will count the number of distinct employees.
SELECT COUNT(DISTINCT EmployeeID) AS totalNumOfEmployees
FROM EMPLOYEES

# LESSON 8 (B).
# Again, DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# GROUPING

# Grouping is achieved by providing a list of grouping attributes in a GROUP BY clause. If aggregate functions are used, they are applied to each group.

# The following query will return the number of products falling in each category grouped by the category id.
SELECT CategoryID, 
       COUNT(DISTINCT ProductID) AS totalNumOfProducts
FROM Products
GROUP BY CategoryID

# This is the above having the category name next to the CategoryID as well:
SELECT C.CategoryID, C.CategoryName,
       COUNT(DISTINCT ProductID) AS totalNumOfProducts
FROM Categories C JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID

# The following will return the exact same results as both of the above but the sorting will be different because of the field going to be used in the GROUP BY clause:
SELECT C.CategoryID, C.CategoryName,
       COUNT(DISTINCT ProductID) AS totalNumOfProducts
FROM Categories C JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.Description

# LESSON 8 (C).
# Again, DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# THE 'HAVING' CLAUSE

# We can filter groups using a predicate with aggregate functions that is applied to each group by adding a HAVING clause after the GROUP BY clause.
# So the followign will return only those categories which have more than 9 products.
SELECT C.CategoryID, C.CategoryName,
       COUNT(DISTINCT ProductID) AS totalNumOfProducts
FROM Categories C JOIN Products P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID
HAVING COUNT(*) > 9

# This will return all order ids and their dates that have quantity more than 45 and groups them by quantity.
SELECT OD.OrderID, O.OrderDate, OD.Quantity
FROM OrderDetails OD JOIN Orders O ON OD.OrderID = O.OrderID
GROUP BY OD.Quantity
HAVING OD.Quantity > 45

# We can also make use of ORDER BY clause to order the results for example by date.
SELECT OD.OrderID, O.OrderDate, OD.Quantity
FROM OrderDetails OD JOIN Orders O ON OD.OrderID = O.OrderID
GROUP BY OD.Quantity
HAVING OD.Quantity > 45
ORDER BY O.OrderDate