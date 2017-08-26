# LESSON 7 (A).
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# MORE JOINS
# (INNER) JOIN returns tuples when there is at least one match in both relations.  We have seen this before.

# LEFT (OUTER) JOIN is like (INNER) JOIN but includes all tuples from the left relation, even if there are no matches in the right relation. Nulls are used for missing values.
# The following will return all the customers and if they have order, the order id, and if not it will return a null.
SELECT C.CustomerName, O.OrderID
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID

# Now, try this:
SELECT *
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

# and then this:
SELECT *
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.OrderID

# especially for the last one, why are the results so?

# RIGHT (OUTER) JOIN is like (INNER) JOIN but includes all tuples from the right relation, even if there are no matches in the left relation. Again, nulls are used for missing values.
# The following will return all employees names, and any orders they might have have placed otherwise nulls.
SELECT O.OrderID, E.LastName, E.FirstName
FROM Orders O
RIGHT JOIN Employees E
ON O.EmployeeID = E.EmployeeID

# FULL (OUTER) JOIN is like (INNER) JOIN but includes all umatched tuples from both relations. Nulls are used for missing values.
# The following will return all customers, and all orders:
SELECT C.CustomerName, O.OrderID
FROM Customers C
FULL OUTER JOIN Orders O ON C.CustomerID=O.CustomerID

# NOTE: All the joins above can be natural joins (joined by matching attributes) or theta joins (joined by a condition) as we have seen above.

# LESSON 7 (B).
# SQL queries can produce duplicate rows.  We can use the keyword DISTINCT after the SELECT to get rid of them.  Recall that UNION, INTERSECT and EXCEPT eliminate duplicates unless the keyword ALL is used, for example:
SELECT DISTINCT CustomerName, City
FROM CUSTOMERS
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID    # this returns 91 records.

# exactly the same without the DISTINCT keywoard returns 213 records:
SELECT CustomerName, City
FROM CUSTOMERS
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

# now, if we change this a bit, asking from the SELECT statement to return back the OrderID as well, why are we getting 213 records no matter if we use the DISTINCT statement or not?
# Try it yourself.
SELECT CustomerName, City, OrderID
FROM CUSTOMERS
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

# and
SELECT DISTINCT CustomerName, City, OrderID
FROM CUSTOMERS
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID