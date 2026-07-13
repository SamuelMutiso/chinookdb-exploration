# SQL Joins

A join combines rows from two or more tables based on a related column between them, usually a primary key in one table matching a foreign key in another. Without joins, you'd only ever be able to query one table at a time, which isn't very useful in a database like chinook where information is split across many related tables (tracks, albums, artists, customers, etc).

## INNER JOIN

Returns only the rows where there is a match in both tables. If a row in one table has no matching row in the other, it's left out completely.

```sql
-- get each track along with its album title
SELECT tracks.Name AS track_name, albums.Title AS album_title
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId;
```

This is the most commonly used join, and if you just write `JOIN` without saying which type, SQL treats it as an `INNER JOIN` by default.

## LEFT JOIN (LEFT OUTER JOIN)

Returns all rows from the left (first) table, and the matching rows from the right table. If there's no match, the columns from the right table just show up as `NULL`.

```sql
-- get every album, and the artist name if it has one
SELECT albums.Title, artists.Name AS artist_name
FROM albums
LEFT JOIN artists ON albums.ArtistId = artists.ArtistId;
```

A common use case is finding rows that don't have a match, by adding a `WHERE right_table.column IS NULL`.

```sql
-- find customers who have never made a purchase (no invoices)
SELECT customers.CustomerId, customers.FirstName, customers.LastName
FROM customers
LEFT JOIN invoices ON customers.CustomerId = invoices.CustomerId
WHERE invoices.InvoiceId IS NULL;
```

## RIGHT JOIN (RIGHT OUTER JOIN)

The opposite of `LEFT JOIN`: returns all rows from the right (second) table, and matching rows from the left table, with `NULL` where there's no match.

```sql
SELECT albums.Title, artists.Name AS artist_name
FROM albums
RIGHT JOIN artists ON albums.ArtistId = artists.ArtistId;
```

Note: older versions of SQLite did not support `RIGHT JOIN` (only added it in version 3.39, released 2022). If it doesn't run, you can just flip the table order and use `LEFT JOIN` instead to get the same result.

## FULL OUTER JOIN

Returns all rows from both tables. Where there's a match, the columns line up; where there isn't, the missing side shows `NULL`. Basically combines what `LEFT JOIN` and `RIGHT JOIN` would give you.

```sql
SELECT albums.Title, artists.Name AS artist_name
FROM albums
FULL OUTER JOIN artists ON albums.ArtistId = artists.ArtistId;
```

Note: like `RIGHT JOIN`, `FULL OUTER JOIN` is also only supported in newer versions of SQLite (3.39+).

## CROSS JOIN

Returns the combination of every row in the first table with every row in the second table (this is called a Cartesian product). It doesn't need an `ON` condition because it's not matching anything, it's just multiplying rows together. This can create a huge result set fast, so it's used less often, mostly for generating combinations.

```sql
-- every genre paired with every media type (not something you'd normally need,
-- just an example of what CROSS JOIN produces)
SELECT genres.Name AS genre, media_types.Name AS media_type
FROM genres
CROSS JOIN media_types;
```

## SELF JOIN

A self join is when a table is joined with itself. This is useful when a table has a column that refers back to the same table, like an employee having a manager who is also an employee.

```sql
-- list each employee together with their manager's name
SELECT e.FirstName || ' ' || e.LastName AS employee,
       m.FirstName || ' ' || m.LastName AS manager
FROM employees e
LEFT JOIN employees m ON e.ReportsTo = m.EmployeeId;
```

Here the same `employees` table is used twice, aliased as `e` (the employee) and `m` (the manager), and `LEFT JOIN` is used so employees without a manager still show up (with `NULL` in the manager column).

## Summary table

| Join type | What it returns |
|---|---|
| INNER JOIN | Only rows that match in both tables |
| LEFT JOIN | All rows from the left table, matched rows from the right (NULL if no match) |
| RIGHT JOIN | All rows from the right table, matched rows from the left (NULL if no match) |
| FULL OUTER JOIN | All rows from both tables, NULL wherever there's no match |
| CROSS JOIN | Every row from the first table combined with every row from the second |
| SELF JOIN | A table joined with itself, using aliases to tell the two copies apart |

## References

- https://www.sqlitetutorial.net/sqlite-join/
- https://www.sqlitetutorial.net/sqlite-left-join/
- https://www.w3schools.com/sql/sql_join.asp
- https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/
