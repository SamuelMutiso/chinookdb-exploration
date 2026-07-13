-- joins.sql
-- Examples of the most common SQL joins using the chinook database

-- 1. INNER JOIN: tracks with their album title
SELECT tracks.Name AS track_name, albums.Title AS album_title
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId;

-- 2. LEFT JOIN: every album, with artist name if it exists
SELECT albums.Title, artists.Name AS artist_name
FROM albums
LEFT JOIN artists ON albums.ArtistId = artists.ArtistId;

-- 3. LEFT JOIN to find rows with no match: customers who never bought anything
SELECT customers.CustomerId, customers.FirstName, customers.LastName
FROM customers
LEFT JOIN invoices ON customers.CustomerId = invoices.CustomerId
WHERE invoices.InvoiceId IS NULL;

-- 4. RIGHT JOIN (needs SQLite 3.39+, otherwise flip the tables and use LEFT JOIN)
SELECT albums.Title, artists.Name AS artist_name
FROM albums
RIGHT JOIN artists ON albums.ArtistId = artists.ArtistId;

-- 5. CROSS JOIN: every genre combined with every media type
SELECT genres.Name AS genre, media_types.Name AS media_type
FROM genres
CROSS JOIN media_types;

-- 6. SELF JOIN: employees together with their manager
SELECT e.FirstName || ' ' || e.LastName AS employee,
       m.FirstName || ' ' || m.LastName AS manager
FROM employees e
LEFT JOIN employees m ON e.ReportsTo = m.EmployeeId;

-- 7. Joining three tables together: track name, album title, and artist name
SELECT tracks.Name AS track_name, albums.Title AS album_title, artists.Name AS artist_name
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId;
