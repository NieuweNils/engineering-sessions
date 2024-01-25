-- Revert plato:artists from pg

BEGIN;

DROP TABLE pl.artists;

COMMIT;
