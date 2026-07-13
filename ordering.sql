-- ordering.sql
-- Examples of ordering data in the chinook database using ORDER BY

-- 1. Ascending: cheapest tracks first
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice ASC;

-- 2. Descending: most expensive tracks first
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice DESC;

-- 3. Order by multiple columns: country, then last name
SELECT FirstName, LastName, Country
FROM customers
ORDER BY Country ASC, LastName ASC;

-- 4. Order by a column not selected
SELECT Name
FROM tracks
ORDER BY Milliseconds DESC;

-- 5. Combine WHERE and ORDER BY: rock tracks sorted by length
SELECT Name, Milliseconds
FROM tracks
WHERE GenreId = 1
ORDER BY Milliseconds DESC;
