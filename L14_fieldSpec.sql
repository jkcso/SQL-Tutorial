# LESSON 14.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# In this lesson we are going to see auto-increment and dates.

# AUTO INCREMENT
# Allows a unique number to be generated automatically when a new record is inserted into a table.  Often this is the primary key field that we would like to be created automatically every time a new record is inserted.
CREATE TABLE FootballPlayers (
    PlayerID Integer PRIMARY KEY AUTOINCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    Team varchar(255)
)

# DATES
# The tricky bit when working with dates is to be sure that the format of the date you are trying to insert, matches the format of the date column in the database.

# In our database we follow this format: YY-MM-DD
SELECT * 
FROM Orders 
WHERE OrderDate > '1996-01-01'