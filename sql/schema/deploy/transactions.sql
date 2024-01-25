-- Deploy plato:transactions to pg

BEGIN;

CREATE TABLE pl.transactions (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    album_id INT REFERENCES albums(id),
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


COMMIT;
