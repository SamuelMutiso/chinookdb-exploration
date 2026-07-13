Filtering Data in SQL
Filtering means picking only the rows that match a certain condition instead of getting the whole table back. In SQL this is done with the WHERE clause.

Basic syntax
SELECT column1, column2
FROM table_name
WHERE condition;
The WHERE clause runs after FROM but before the data is sorted or grouped, so it decides which rows even make it into the result.

Comparison operators
These are used to build the condition inside WHERE.

= equal to
!= or <> not equal to
> greater than
< less than
>= greater than or equal to
<= less than or equal to
Example: get all tracks that cost more than $0.99

SELECT Name, UnitPrice
FROM tracks
WHERE UnitPrice > 0.99;
Logical operators
Used to combine more than one condition.

AND both conditions must be true
OR at least one condition must be true
NOT reverses a condition
Example: tracks that are longer than 5 minutes (300000 ms) AND cost less than $1

SELECT Name, Milliseconds, UnitPrice
FROM tracks
WHERE Milliseconds > 300000 AND UnitPrice < 1;
The IN operator
Checks if a value matches any value in a list. Saves you from writing a bunch of OR conditions.

SELECT FirstName, LastName, Country
FROM customers
WHERE Country IN ('USA', 'Canada', 'Kenya');
The BETWEEN operator
Checks if a value falls within a range (inclusive of both ends).

SELECT Name, UnitPrice
FROM tracks
WHERE UnitPrice BETWEEN 0.99 AND 1.99;
The LIKE operator
Used for pattern matching in text, mostly with wildcards:

% matches any number of characters
_ matches exactly one character
-- customers whose last name starts with "S"
SELECT FirstName, LastName
FROM customers
WHERE LastName LIKE 'S%';
-- tracks that have the word "love" anywhere in the name
SELECT Name
FROM tracks
WHERE Name LIKE '%Love%';
IS NULL / IS NOT NULL
NULL means the value is missing, so you can't use = NULL to check for it. You have to use IS NULL or IS NOT NULL.

-- employees who do not have a manager (ReportsTo is empty)
SELECT FirstName, LastName, ReportsTo
FROM employees
WHERE ReportsTo IS NULL;
Quick summary
Filtering with WHERE is how you narrow down a table to just the rows you actually care about. Combine it with AND/OR/NOT for more complex conditions, and use IN, BETWEEN, LIKE, and IS NULL for common filtering patterns instead of writin
