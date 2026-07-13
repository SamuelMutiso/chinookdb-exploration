-- limiting.sql
-- Examples of limiting data in the chinook database using LIMIT and OFFSET

-- 1. Just grab 5 tracks (no particular order guaranteed)
SELECT Name
FROM tracks
LIMIT 5;

-- 2. Top 10 most expensive tracks
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice DESC
LIMIT 10;

-- 3. 5 customers with the biggest invoice total (using invoices table)
SELECT CustomerId, InvoiceId, Total
FROM invoices
ORDER BY Total DESC
LIMIT 5;

-- 4. Pagination example: page 2 of tracks, 10 per page
SELECT Name, UnitPrice
FROM tracks
ORDER BY Name ASC
LIMIT 10 OFFSET 10;
