# Ordering Data in SQL

Ordering means sorting the result of a query. By default SQL does not guarantee any particular order, so if you want the rows to come back sorted you have to say so with `ORDER BY`.

## Basic syntax

```sql
SELECT column1, column2
FROM table_name
ORDER BY column1 [ASC | DESC];
```

`ORDER BY` runs after `WHERE`, so filtering happens first and then whatever rows are left get sorted.

## ASC vs DESC

- `ASC` sorts from smallest to largest (a to z, 0 to 9). This is the default, so if you don't write anything it will sort ascending.
- `DESC` sorts from largest to smallest (z to a, 9 to 0).

Example: sort tracks by price, cheapest first

```sql
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice ASC;
```

Example: sort tracks by price, most expensive first

```sql
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice DESC;
```

## Sorting by more than one column

You can list multiple columns separated by commas. SQL sorts by the first column, and only uses the next column to break ties.

```sql
-- sort customers by country, and within the same country sort by last name
SELECT FirstName, LastName, Country
FROM customers
ORDER BY Country ASC, LastName ASC;
```

## Sorting by a column not in the SELECT list

You can order by a column even if you did not select it.

```sql
SELECT Name
FROM tracks
ORDER BY Milliseconds DESC;
```

## Sorting with column position

Instead of the column name, you can use its position number in the SELECT list. This works but is less readable, so it's better to just use the column name in real projects.

```sql
SELECT Name, UnitPrice
FROM tracks
ORDER BY 2 DESC;
```

## Quick summary

`ORDER BY` controls the order rows come back in. Use `ASC` for smallest-to-largest (default) and `DESC` for largest-to-smallest. You can sort by multiple columns, and the first column listed takes priority.
