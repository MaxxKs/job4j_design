DROP TABLE IF EXISTS products CASCADE;

CREATE TABLE products
(
	id 			SERIAL PRIMARY KEY,
	name 		VARCHAR(50),
	producer	VARCHAR(50),
	count		INTEGER DEFAULT 0,
	price 		INTEGER
);

INSERT INTO products (name, producer, count, price)
VALUES 	('product_1', 'producer_1', 0, 50),
		('product_2', 'producer_2', 1, 200),
		('product_3', 'producer_3', 3, 300),
		('product_4', 'producer_4', 5, 500),
		('product_5', 'producer_5', 0, 100);

CREATE
OR REPLACE PROCEDURE insert_data(i_name varchar, prod varchar, i_count integer, i_price integer)
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		INSERT INTO products (name, producer, count, price)
		VALUES (i_name, prod, i_count, i_price);
	END;
$$;

CREATE 
OR REPLACE PROCEDURE update_data(u_count integer, tax float, u_id integer)
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		IF 
			u_count > 0 THEN
			UPDATE products
			SET count = count - u_count
			WHERE id = u_id;
		END IF;
		IF 
			tax > 0 THEN
			UPDATE products
			SET price = price + price * tax;
		END IF;
	END;
$$;

CREATE 
OR REPLACE PROCEDURE delete_data(d_id integer)
LANGUAGE 'plpgsql'
AS $$	
	BEGIN
		DELETE FROM products
		WHERE id = d_id AND count <= 0;
	END;
$$;

CREATE
OR REPLACE FUNCTION f_insert_data(i_name varchar, prod varchar, i_count integer, i_price integer)
RETURNS void
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		INSERT INTO products (name, producer, count, price)
		VALUES (i_name, prod, i_count, i_price);
	END;
$$;

CREATE
OR REPLACE FUNCTION f_update_data(u_count integer, tax float, u_id integer)
RETURNS integer
LANGUAGE 'plpgsql'
AS $$
	DECLARE
		result integer;
	BEGIN
		IF u_count > 0 THEN
			UPDATE products
			SET count = count - u_count
			WHERE id = u_id;
			SELECT INTO result count
			FROM products
			WHERE id = u_id;
		END IF;
			IF tax > 0 THEN
			UPDATE products
			SET price = price + price * tax;
			SELECT INTO result SUM(price)
			FROM products;
		END IF;
		RETURN result;
	END;
$$;

CREATE 
OR REPLACE FUNCTION f_delete_data()
RETURNS SETOF integer
LANGUAGE 'plpgsql'
AS $$
	BEGIN
		RETURN QUERY
		DELETE FROM products
		WHERE count <= 0
		RETURNING id;
	END;
$$;

SELECT * FROM products;

CALL insert_data('product_1', 'producer_1', 3, 50);

CALL update_data(10, 0, 1);

CALL delete_data(1);

CALL insert_data('product_3', 'producer_3', 8, 115);

SELECT f_insert_data('product_1', 'producer_1', 25, 50);

SELECT f_update_data(10, 0, 2);

SELECT f_insert_data('product_2', 'producer_2', 15, 32);
SELECT f_insert_data('product_3', 'producer_3', 8, 115);

SELECT f_delete_data();

SELECT f_update_data(0, 0.2, 0);

SELECT * FROM products;