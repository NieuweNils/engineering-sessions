-- Revert plato:customers from pg

BEGIN;

DROP TABLE pl.customers;

COMMIT;
