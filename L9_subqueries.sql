# LESSON 9.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# SUBQUERIES
# One of the most powerful features of SELECT is that they can be used as subqueries in expressions by enclosing them in parentheses i.e. (subquery). SQL supports scalar, set and relations subqueries:

# 1) Scalar subquery
# A subquery that produces a single value. Typically a select with an aggregate function. Scalar subqueries can be used in any expression, e.g. in WHERE and HAVING clauses.

# This returns the Customers and their order id, returning null if customers did not place an order.
SELECT C.CustomerName, C.Country, (SELECT O.OrderID
                                   FROM Orders O 
                                   WHERE C.CustomerID = O.CustomerID) AS OrderID
FROM Customers C

# This shows us the Customer names, what product they purchased and the product price.
SELECT C.CustomerName, P.ProductName, P.Price
FROM OrderDetails OD JOIN Orders O ON OD.OrderID = O.OrderID JOIN Customers C ON C.CustomerID = O.CustomerID
					 JOIN Products P ON OD.ProductID = P.ProductID

# it has not a subquery inside because the result is not going to be neat and readable.
SELECT C.CustomerName, O.OrderID, (SELECT P.ProductName
								   FROM Products P 
                                   JOIN OrderDetails OD ON OD.ProductID = P.ProductID 
                                   JOIN Orders O ON OD.OrderID = O.OrderID 
                                   JOIN Customers C ON O.CustomerID = C.CustomerID) AS productName
FROM Customers C JOIN Orders O ON C.CustomerID = O.CustomerID

# This should (but does not) count the number of times that each product was ordered.
SELECT P.ProductName, (SELECT COUNT(DISTINCT OD.ProductID)
					   FROM OrderDetails OD JOIN Products P ON OD.ProductID = P.ProductID) AS NumOrders
FROM Products P

# 2) Set subquery
# A subquery that produces a set of distinct values (a single column). Typically used for (i) set membership using operators IN or NOT IN, or (ii) set comparisons using operators SOME (ANY) or ALL.

# Here we can say that set subqueries are falling into 2 subcategories, divided between the set membership and the set comparison.
# Starting from set membership, we have subqueries that produce a set of values can be used to test if a value is a member of the set by using the in or not in operators, for example:
SELECT ProductID, ProductName, Price
FROM Products
WHERE CategoryID IN (SELECT CategoryID
					 FROM Categories C
                     WHERE CategoryName LIKE 'B%')
ORDER BY Price DESC

# We can also extend this to use tuple values like:
SELECT ProductID, ProductName, Price
FROM Products
WHERE (Unit, Price) IN (SELECT Unit, Price
					 	FROM Products
                     	WHERE Price > 15 AND ProductName LIKE 'b%')

# Again, we can use JOIN for the above instead of subqueries.
                           
# Moving now into set comparison, we can use subqueries to compare a value against some or all values returned by a subquery, using the SOME and ALL functions respectively.
SELECT S1.SupplierName, S1.City, S1.Country
FROM Suppliers S1
WHERE S1.SupplierID > ANY (SELECT S2.SupplierID
     					   FROM Suppliers S2
                           WHERE S1.City = S2.City)     # currently returns syntax error.
                           
SELECT SupplierName, City, Country
FROM Suppliers
WHERE SupplierID > ANY (SELECT S.SupplierID
						FROM Suppliers S JOIN Products P ON S.SupplierID = P.SupplierID
                        WHERE P.Price > 10)             # currently returns syntax error.                           

# In set subqueries we can use all the symbols like >, >= etc along with SOME, ANY and ALL.

# 3) Relation subquery
# A subquery that produces a relation.  Typically used as an operand of (i) JOIN, UNION, INTERSECT, EXCEPT, (iii) operators EXISTS or NOT EXISTS to test if a relation is empty or not, (iv) operators NOT UNIQUE or UNIQUE to test if a relation has duplicates or not.
SELECT EmployeeID, FirstName, LastName
FROM Employees E1
WHERE BirthDate EXISTS (SELECT *
						FROM Employees E2
                       	WHERE E1.BirthDate = E2.BirthDate)  # currently returns syntax error.                           
                        