-- Revert plato:transactions from pg

BEGIN;

DROP TABLE pl.transactions;

COMMIT;
