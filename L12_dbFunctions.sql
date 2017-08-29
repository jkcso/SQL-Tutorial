# LESSON 12.
# Please DO try the following queries yourselves but most importantly try different variations and always ask yourself: "Why am I getting this back?".

# You can create a database using:
CREATE DATABASE db_name
# for example:
CREATE DATABASE newDatabase.

# to delete it you can do:
DROP DATABASE newDatabase.

# You can create a table using:
CREATE TABLE FootballPlayers (      -- here is the table name
    PlayerID int,                   -- here are the column names having data types next to them.
    LastName varchar(255),
    FirstName varchar(255),
    Team varchar(255)
);

# To drop the table created above we do:
DROP TABLE FootballPlayers

# We can delete its contents (records) without deleting the table itself by doing:
TRUNCATE TABLE FootballPlayers

# Remember from lesson 10 that we can add records using the INSERT INTO statement.

# We can ALTER tables by adding or deleting columns using:
ALTER TABLE FootballPlayers
ADD DateOfBirth year

# We can delete a column using:
ALTER TABLE FootballPlayers
DROP COLUMN DateOfBirth