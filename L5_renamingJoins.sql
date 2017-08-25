# LESSON 5 (A).
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# This lesson is about renaming relations for clarity and readability.  This comes handy in what we call self join (i.e to form a query over two tuples from the same relation), where we list the relation twice:
SELECT p1.ProductName, p2.Price, p1.ProductID
FROM Products AS p1 JOIN Products AS p2 ON p1.ProductID > p2.Price

# Using an example from before, we can have the following: 
SELECT p.ProductName, p.Price, p.ProductID, o.Quantity
FROM Products AS p JOIN OrderDetails AS o ON p.ProductID = o.ProductID
WHERE p.ProductID = 11

# Using JOIN, we can join as many relations as we like.
SELECT o.OrderID, c.CustomerName, s.ShipperName, e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
			  JOIN Shippers s ON o.ShipperID = s.ShipperID
              JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderID = 10248