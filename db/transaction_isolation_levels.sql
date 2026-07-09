CREATE TABLE accounts (
    id SERIAL PRIMARY KEY,
    account_name VARCHAR(50),
    balance INTEGER DEFAULT 0
);

INSERT INTO accounts (account_name, balance)
VALUES 
    ('Jon', 100),
    ('Petr', 200),
    ('Ivan', 300);