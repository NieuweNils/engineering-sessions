CREATE TABLE pl.online_users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE pl.online_users_customers(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL
, CONSTRAINT unique_online_users_customers               UNIQUE (user_id, customer_id)
, CONSTRAINT foreign_key_online_users_customers_user     FOREIGN KEY (user_id) REFERENCES pl.online_users(id) ON DELETE CASCADE
, CONSTRAINT foreign_key_online_users_customers_customer FOREIGN KEY (customer_id) REFERENCES pl.customer(id) ON DELETE CASCADE
)
