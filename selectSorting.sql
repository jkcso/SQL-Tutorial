# LESSON 3.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# SELECT statement can sort the resulting by adding an ORDER BY keywoard clause at the end of the SELECT statement.

# Note that the order of priority of the operators is FROM, WHERE, ORDER BY, SELECT.

# This chooses OrderID and OrderDate starting from the oldest one to come to the most recent.
SELECT OrderID, OrderDate
FROM Orders
ORDER BY OrderDate ASC

# The following does the most recent to oldest sorting.
SELECT OrderID, OrderDate
FROM Orders
ORDER BY OrderDate DESC

# Also note that the field name followed by the ORDER BY keyword is NOT restricted to be presented in the SELECT clause.
# So the following is absolutely valid:
SELECT OrderID
FROM Orders
ORDER BY OrderDate DESC

# We can sort the resulting tuples using multiple orders.
SELECT SupplierName, City, PostalCode
FROM Suppliers
ORDER BY City ASC, PostalCode DESC  # this sorts firstly by Ascending city and then by Descending postal code.