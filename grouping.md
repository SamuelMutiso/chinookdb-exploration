# Grouping Data in SQL

Grouping lets you take many rows and collapse them into summary rows based on a shared value. It's almost always used together with an aggregate function, since grouping by itself just tells SQL how to bucket the rows, and the aggregate function tells it what to calculate for each bucket.

## Aggregate functions

These functions take many rows and return one value:

- `COUNT()` number of rows
- `SUM()` total of a numeric column
- `AVG()` average of a numeric column
- `MIN()` smallest value
- `MAX()` largest value

Example without grouping, just on the whole table:

```sql
-- how many tracks are in the database
SELECT COUNT(*) AS total_tracks
FROM tracks;
```

## GROUP BY

```sql
SELECT column1, AGGREGATE_FUNCTION(column2)
FROM table_name
GROUP BY column1;
```

Example: how many tracks are in each genre

```sql
SELECT GenreId, COUNT(*) AS track_count
FROM tracks
GROUP BY GenreId;
```

Example: average track price per media type

```sql
SELECT MediaTypeId, AVG(UnitPrice) AS avg_price
FROM tracks
GROUP BY MediaTypeId;
```

Any column in the SELECT list that is not inside an aggregate function has to be in the `GROUP BY` list, otherwise the query doesn't really make sense (SQL wouldn't know which single value to show for that column).

## HAVING vs WHERE

This is the part people mix up the most:

- `WHERE` filters individual rows, before any grouping happens.
- `HAVING` filters groups, after the grouping and aggregation happens.

So if you want to filter on the result of an aggregate function like `COUNT()` or `SUM()`, you need `HAVING`, because that value doesn't exist until after grouping.

```sql
-- genres that have more than 100 tracks
SELECT GenreId, COUNT(*) AS track_count
FROM tracks
GROUP BY GenreId
HAVING COUNT(*) > 100;
```

You can combine both: `WHERE` narrows the rows first, then `GROUP BY` buckets what's left, then `HAVING` filters the buckets.

```sql
-- among tracks priced above 0.99, find genres with more than 10 tracks
SELECT GenreId, COUNT(*) AS track_count
FROM tracks
WHERE UnitPrice > 0.99
GROUP BY GenreId
HAVING COUNT(*) > 10;
```

## Quick summary

`GROUP BY` collapses rows into groups based on a column's value, and you pair it with aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) to calculate something about each group. Use `WHERE` to filter rows before grouping, and `HAVING` to filter groups after aggregation.
