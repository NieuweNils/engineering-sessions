-- Verify plato:albums on pg

BEGIN;

SELECT
    id
,   title
,   release_date
,   artist_id
,   genre
,   price
FROM pl.albums
LIMIT 1;

ROLLBACK;
