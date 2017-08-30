# LESSON 13.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# CONSTRAINTS 
# They are rules for the data input in a table and they are used to limit the type of data that can go into that table. This ensures the accuracy, integrity and reliability of the data in the table. If the constraint is not satisfied and there exists a violation, the action is aborted. They can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.

# We are going to see the following:
# 1] NOT NULL -> A column cannot have a NULL value.
# 2] UNIQUE -> All values in a column are different.
# 3] PRIMARY KEY -> A combination of a NOT NULL and UNIQUE. Uniquely identifies each record in a table.
# 4] FOREIGN KEY -> Identifies uniquely a record in another table.
# 5] CHECK -> Ensures that all values in a column satisfies a specific condition.
# 6] DEFAULT -> Sets a default value for a column when no value is specified.
# 7] INDEX -> Use to create and retrieve data from the database very quickly.

# 1] NOT NULL.
# By default, a column can hold NULL values but this constraint enforces a column to NOT accept NULL values.  This enforces a field to always contain a value, which means that you cannot insert a new record, or update a record without adding a value to this field.

# Creating a table using this:
INSERT INTO FootballPlayers (
    PlayerID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int NOT NULL,
    Team varchar(255) NOT NULL
)

# we can add to this table using the following but note that FirstName can be NULL.
INSERT INTO FootballPlayers (PlayerID, LastName, FirstName, Age, Team)
VALUES ('1', 'Sallai', 'Roland', '20', 'APOEL')

# Therefore the following is permitted as well but no other variations omitting other values because it is returning an error:
INSERT INTO FootballPlayers (PlayerID, LastName, Age, Team)
VALUES ('2', 'Carlao', '20', 'APOEL')

# 2] UNIQUE.
# Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.  A PRIMARY KEY constraint automatically has a UNIQUE constraint.  However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.  Using UNIQUE the above table should be:
CREATE TABLE FootballPlayers (
    PlayerID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int NOT NULL,
    Team varchar(255) NOT NULL
)

# Remember that we can always add a constraint later by doing:
ALTER TABLE FootballPlayers
ADD UNIQUE (PlayerID)

# 3] PRIMARY KEY.
# Primary keys must contain UNIQUE values, and cannot contain NULL values.  A table can have only one primary key, which may consist of single or multiple fields.
CREATE TABLE FootballPlayers (
    PlayerID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int NOT NULL,
    Team varchar(255) NOT NULL
)

# 4] FOREIGN KEY
#A FOREIGN KEY is a key used to link two tables together.  A FOREIGN KEY is a field (or collection of fields) in one table that refers to the PRIMARY KEY in another table.  The table containing the foreign key is called the child table, and the table containing the candidate key is called the referenced or parent table.
CREATE TABLE FootballPlayers (
    PlayerID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int NOT NULL,
    TeamID int NOT NULL FOREIGN KEY REFERENCES Teams(TeamID)
    PositionID int NOT NULL FOREIGN KEY REFERENCES Positions(PositionID)
)

# The above is using the two following tables:
CREATE TABLE Teams (
    TeamID int NOT NULL PRIMARY KEY,
    Name varchar(255) NOT NULL,
    FoundationYear int NOT NULL,
    Stadium varchar(255) NOT NULL
)

CREATE TABLE Positions (
    PositionID int NOT NULL PRIMARY KEY,
    Name varchar(255) NOT NULL,
    Description varchar(255) NOT NULL
)

# 5] CHECK.
# used to limit the value range that can be placed in a column.  If you define a CHECK constraint on a single column it allows only certain values for this column.  If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.
CREATE TABLE FootballPlayers (
    PlayerID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int NOT NULL,
    Team varchar(255) NOT NULL
    CHECK (Age >= 16)
)

# You can always add this later by doing:
ALTER TABLE FootballPlayers
ADD CHECK (Age>=18);

# 6] DEFAULT.
# used to provide a default value for a column.  The default value will be added to all new records IF no other value is specified.
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
)

# 7] INDEX.
#  Used to create indexes in tables.  Indexes are used to retrieve data from the database very fast. The users cannot see the indexes, they are just used to speed up searches/queries.  The tradeoff here is to use indexes only where is really useful and this is because updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.

# Creates an index on customer lastname.
CREATE INDEX idx_lastname
ON Customers (CustomerName)

# Creates an index on orderID and customerID.
CREATE INDEX idx_ordCust
ON Orders (OrderID, CustomerID)

# We can also create unique indexed by doing:
CREATE UNIQUE INDEX idx_ordCustUnique
ON Orders (OrderID, CustomerID)

# To drop an index you do:
DROP INDEX idx_lastname

# NOTE: You don't select directly from the index. You select from the table.  If the index is appropriate, SQL Server will use it when you do that.  Indexing is like: what is the use of having an index in a book? perhaps to allow you to find the page where some information you are looking for is instead of having to read the whole book from page one. 

# To *test* if the index is working we are using the following syntax:
SELECT *
FROM Orders WITH (INDEX(idx_ordCust))