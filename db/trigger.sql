DROP TRIGGER IF EXISTS tax_before_trigger ON products;
DROP TRIGGER IF EXISTS history_after_price ON products;
DROP TRIGGER IF EXISTS tax_after_trigger ON products;
DROP FUNCTION IF EXISTS tax_before_row();
DROP FUNCTION IF EXISTS add_history_price_row();
DROP FUNCTION IF EXISTS tax_after_statement();
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS history_of_price;

CREATE TABLE products
(
	id 			SERIAL PRIMARY KEY,
	name		VARCHAR(50),
	producer	VARCHAR(50),
	count		INTEGER DEFAULT 0,
	price 		INTEGER
);

CREATE TABLE history_of_price
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	price INTEGER,
	date TIMESTAMP
);

CREATE 
OR REPLACE FUNCTION tax_before_row()
	RETURNS trigger AS
$$
	BEGIN
		NEW.price := NEW.price * 1.20;
		RETURN NEW;
	END;
$$
LANGUAGE 'plpgsql';
		
CREATE TRIGGER tax_before_trigger
	BEFORE INSERT
	ON products
	FOR EACH ROW
	EXECUTE FUNCTION tax_before_row();

CREATE 
OR REPLACE FUNCTION add_history_price_row()
	RETURNS trigger AS
$$
	BEGIN
		INSERT INTO history_of_price (name, price, date)
		VALUES (NEW.name, NEW.price, CURRENT_TIMESTAMP);
		RETURN NEW;
	END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER history_after_price
	AFTER INSERT
	ON products
	FOR EACH ROW
	EXECUTE FUNCTION add_history_price_row();
	
CREATE 
OR REPLACE FUNCTION tax_after_statement()
	RETURNS trigger AS 
$$ 
	BEGIN
		UPDATE products
		SET price = price * 1.22
		WHERE id IN (SELECT id FROM inserted);	
		RETURN NEW;
	END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER tax_after_trigger
	AFTER INSERT
	ON products
	REFERENCING NEW TABLE AS inserted
	FOR EACH STATEMENT
	EXECUTE FUNCTION tax_after_statement();
 
INSERT INTO products (name, producer, count, price)
VALUES 
('product_2', 'producer_2', 5, 100),
('product_3', 'producer_3', 2, 200),
('product_4', 'producer_4', 8, 300);

SELECT * FROM products;
SELECT * FROM history_of_price;