# Database Keys

A key is a column (or a group of columns) used to identify rows in a table and to connect tables to each other. Below are the main types of keys and where they show up in the chinook database.

## Primary Key

A primary key uniquely identifies each row in a table. No two rows can have the same primary key value, and it cannot be `NULL`. Every table usually has exactly one primary key.

Examples in chinook:
- `tracks.TrackId`
- `albums.AlbumId`
- `artists.ArtistId`
- `customers.CustomerId`
- `employees.EmployeeId`
- `invoices.InvoiceId`
- `invoice_items.InvoiceItemId`
- `genres.GenreId`
- `media_types.MediaTypeId`
- `playlists.PlaylistId`

## Foreign Key

A foreign key is a column in one table that points to the primary key of another table. This is what creates a relationship (link) between two tables.

Examples in chinook:
- `tracks.AlbumId` points to `albums.AlbumId`
- `tracks.GenreId` points to `genres.GenreId`
- `tracks.MediaTypeId` points to `media_types.MediaTypeId`
- `albums.ArtistId` points to `artists.ArtistId`
- `invoices.CustomerId` points to `customers.CustomerId`
- `invoice_items.InvoiceId` points to `invoices.InvoiceId`
- `invoice_items.TrackId` points to `tracks.TrackId`
- `employees.ReportsTo` points to `employees.EmployeeId` (this is a self-referencing foreign key, since an employee's manager is also an employee)
- `customers.SupportRepId` points to `employees.EmployeeId`

## Composite Key

A composite key is a primary key made up of more than one column, where it's the combination of the columns together that is unique, not each column on its own.

Example in chinook:
- `playlist_track` table uses `PlaylistId` and `TrackId` together as a composite primary key. A single playlist can have many tracks and a single track can be in many playlists, so neither column alone is unique, but the pairing of the two is.

## Candidate Key

A candidate key is any column (or set of columns) that could work as the primary key because it is unique and not null. A table can have more than one candidate key, but only one of them is actually chosen as the primary key. The others are sometimes called alternate keys.

Example: in `customers`, `CustomerId` is the chosen primary key, but `Email` is also unique for each customer, so `Email` is a candidate key too.

## Super Key

A super key is any column or combination of columns that can uniquely identify a row, even if it includes extra columns that aren't actually needed for uniqueness. Every candidate key is a super key, but not every super key is a candidate key (because a super key can have unnecessary extra columns).

Example: `CustomerId` alone is enough to identify a customer, but `CustomerId + Email` together is still technically a super key, just not the minimal one.

## Unique Key

A unique key is a column (not necessarily the primary key) that must have distinct values across all rows, but unlike a primary key it is allowed to have one `NULL` value.

Example: `Email` in the `customers` table would typically be set up as a unique key, since two customers shouldn't share the same email.

## Summary table

| Key type | What it means | Example in chinook |
|---|---|---|
| Primary key | Uniquely identifies a row, cannot be null | `tracks.TrackId` |
| Foreign key | Links to another table's primary key | `tracks.AlbumId` -> `albums.AlbumId` |
| Composite key | Primary key made of 2+ columns | `playlist_track (PlaylistId, TrackId)` |
| Candidate key | Could have been the primary key | `customers.Email` |
| Super key | Any combination that is unique (may have extra columns) | `CustomerId + Email` |
| Unique key | Must be unique, allows one null | `customers.Email` |

