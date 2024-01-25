-- Deploy plato:albums to pg

BEGIN;


CREATE TABLE pl.albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_date DATE,
    artist_id INT REFERENCES artists(id),
    genre VARCHAR(50),
    price NUMERIC(10, 2) NOT NULL
);


COMMIT;
