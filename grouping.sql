-- grouping.sql
-- Examples of grouping data in the chinook database using GROUP BY and HAVING

-- 1. Total number of tracks in the whole database
SELECT COUNT(*) AS total_tracks
FROM tracks;

-- 2. Number of tracks per genre
SELECT GenreId, COUNT(*) AS track_count
FROM tracks
GROUP BY GenreId;

-- 3. Average track price per media type
SELECT MediaTypeId, AVG(UnitPrice) AS avg_price
FROM tracks
GROUP BY MediaTypeId;

-- 4. Total sales (Total column) per customer
SELECT CustomerId, SUM(Total) AS total_spent
FROM invoices
GROUP BY CustomerId
ORDER BY total_spent DESC;

-- 5. Genres with more than 100 tracks (HAVING filters groups)
SELECT GenreId, COUNT(*) AS track_count
FROM tracks
GROUP BY GenreId
HAVING COUNT(*) > 100;

-- 6. WHERE + GROUP BY + HAVING together
SELECT GenreId, COUNT(*) AS track_count
FROM tracks
WHERE UnitPrice > 0.99
GROUP BY GenreId
HAVING COUNT(*) > 10;
