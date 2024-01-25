-- Deploy plato:artists to pg

BEGIN;

CREATE TABLE pl.artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    bio TEXT
);
COMMIT;
