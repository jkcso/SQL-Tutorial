# LESSON 15.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# VIEWS
# It is a virtual table coming out as a result of a SQL statement.  Since it is described as a table, it contains rows and columns. The fields in a view are fields from one or more real tables in the database.  You can add SQL functions, WHERE, and JOIN statements to a view and present the data as if the data were coming from one single table.

# The following creates a view about the suppliers from USA.
CREATE VIEW [CurrentSuppliersUSA] AS
SELECT SupplierID, SupplierName
FROM Suppliers
WHERE Country = 'USA'

# and this shows the above viewing:
SELECT * FROM CurrentSuppliersUSA

# The following creates a view with all products that are above the average price.
CREATE VIEW [ProductsAboveAveragePrice] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)

# We can change something from the above by updating it using:
CREATE OR REPLACE VIEW ProductsAboveAveragePrice AS
SELECT ProductName, Price, CategoryID
FROM Products
WHERE Price > (SELECT MIN(PRICE) FROM PRODUCTS)

# We can drop it using:
DROP VIEW ProductsAboveAveragePrice