CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	country TEXT,
	perishable BOOLEAN
);

INSERT INTO products(name, country, perishable)
VALUES ('Milk', 'Russia', TRUE);

SELECT * FROM products;

UPDATE products
SET name = 'Cheese';

SELECT * FROM products;

DELETE FROM products;

SELECT * FROM products;