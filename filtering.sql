-- filtering.sql
-- Examples of filtering data in the chinook database using WHERE

-- 1. Simple comparison: tracks priced above 0.99
SELECT Name, UnitPrice
FROM tracks
WHERE UnitPrice > 0.99;

-- 2. AND: long tracks that are still cheap
SELECT Name, Milliseconds, UnitPrice
FROM tracks
WHERE Milliseconds > 300000 AND UnitPrice < 1;

-- 3. OR: customers from Kenya or Nigeria
SELECT FirstName, LastName, Country
FROM customers
WHERE Country = 'Kenya' OR Country = 'Nigeria';

-- 4. IN: customers from a set list of countries
SELECT FirstName, LastName, Country
FROM customers
WHERE Country IN ('USA', 'Canada', 'Kenya');

-- 5. BETWEEN: tracks in a certain price range
SELECT Name, UnitPrice
FROM tracks
WHERE UnitPrice BETWEEN 0.99 AND 1.99;

-- 6. LIKE: customers whose last name starts with S
SELECT FirstName, LastName
FROM customers
WHERE LastName LIKE 'S%';

-- 7. LIKE: tracks with "Love" in the title
SELECT Name
FROM tracks
WHERE Name LIKE '%Love%';

-- 8. IS NULL: employees with no manager
SELECT FirstName, LastName, ReportsTo
FROM employees
WHERE ReportsTo IS NULL;

-- 9. NOT: tracks that are NOT in the Rock genre (GenreId 1 is Rock in chinook)
SELECT Name, GenreId
FROM tracks
WHERE NOT GenreId = 1;
