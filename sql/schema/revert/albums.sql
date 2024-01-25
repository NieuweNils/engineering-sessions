-- Revert plato:albums from pg

BEGIN;

DROP TABLE albums;

COMMIT;
