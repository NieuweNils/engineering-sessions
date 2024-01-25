-- Verify plato:transactions on pg

BEGIN;

SELECT
    id
,   customer_id
,   album_id
,   purchase_date
FROM pl.transactions
LIMIT 1;

ROLLBACK;
