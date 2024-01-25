-- Verify plato:customers on pg

BEGIN;

SELECT
    id
,   name
,   email
,   phone_number
,   address
FROM pl.customers
LIMIT 1;

ROLLBACK;
