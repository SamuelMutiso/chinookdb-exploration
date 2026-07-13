# Limiting Data in SQL

Sometimes a table has thousands of rows and you don't need all of them back, maybe just the top 10. `LIMIT` restricts how many rows the query returns.

## Basic syntax

```sql
SELECT column1, column2
FROM table_name
LIMIT number_of_rows;
```

## LIMIT on its own

```sql
-- get only 5 tracks
SELECT Name
FROM tracks
LIMIT 5;
```

Without `ORDER BY`, `LIMIT` will just grab whatever rows the database happens to return first, which is not guaranteed to be meaningful. That's why `LIMIT` is almost always used together with `ORDER BY`.

## LIMIT with ORDER BY (the "top N" pattern)

```sql
-- 10 most expensive tracks
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice DESC
LIMIT 10;
```

## OFFSET

`OFFSET` skips a number of rows before it starts returning results. This is useful for pagination, like showing "page 2" of results.

```sql
SELECT column1, column2
FROM table_name
LIMIT number_of_rows OFFSET number_to_skip;
```

Example: skip the first 10 tracks and then return the next 10 (this is basically "page 2" if each page has 10 tracks)

```sql
SELECT Name, UnitPrice
FROM tracks
ORDER BY Name ASC
LIMIT 10 OFFSET 10;
```

## Quick summary

`LIMIT` caps how many rows come back, and `OFFSET` skips a number of rows before that cap kicks in. Always pair `LIMIT` with `ORDER BY` if the order of the top results actually matters, otherwise you might get a random-looking set of rows.
