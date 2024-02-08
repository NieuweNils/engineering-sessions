\connect grocer

CREATE TABLE IF NOT EXISTS apples (
    id SERIAL PRIMARY KEY,
    circumference FLOAT NOT NULL,
    seeds INTEGER NOT NULL
);