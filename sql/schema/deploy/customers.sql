-- Deploy plato:customers to pg

BEGIN;

CREATE TABLE pl.customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address VARCHAR(255)
);
COMMIT;
