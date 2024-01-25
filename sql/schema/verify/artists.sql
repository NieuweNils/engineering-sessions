-- Verify plato:artists on pg

BEGIN;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'artists';

ROLLBACK;
