# chinookdb-exploration

Group notes and practice queries on the Chinook sample database, covering filtering, ordering, limiting, grouping, database keys, and SQL joins.

Database used: Chinook (SQLite), from https://www.sqlitetutorial.net/sqlite-sample-database/

## Files

- `filtering.md` / `filtering.sql` - WHERE clause, comparison and logical operators, IN, BETWEEN, LIKE, IS NULL
- `ordering.md` / `ordering.sql` - ORDER BY, ASC/DESC, sorting by multiple columns
- `limiting.md` / `limiting.sql` - LIMIT, OFFSET
- `grouping.md` / `grouping.sql` - GROUP BY, aggregate functions, HAVING
- `database-keys.md` - primary key, foreign key, composite key, candidate key, super key, unique key
- `sql-joins.md` / `joins.sql` - INNER, LEFT, RIGHT, FULL OUTER, CROSS, and SELF joins

## How to run the queries

1. Download the chinook.db file from the link above.
2. Open it with the sqlite3 command line tool: `sqlite3 chinook.db`
3. Paste in any query from the .sql files, or run a whole file with: `.read filename.sql`
