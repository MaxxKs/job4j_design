CREATE TABLE customers
(
	id 			SERIAL PRIMARY KEY,
	first_name	TEXT,
	last_name	TEXT,
	age			INT,
	country		TEXT
);

CREATE TABLE orders
(
	id 			SERIAL PRIMARY KEY,
	amount		INT,
	customer_id	INT REFERENCES customers (id)
);

INSERT INTO customers (first_name, last_name, age, country)
VALUES 	('Иван',  'Иванов',    25, 'Россия'),
		('Анна',  'Петрова',   30, 'Россия'),
		('Мария', 'Сидорова',  22, 'Беларусь'),
		('Джон',  'Смит',      35, 'США'),
		('Елена', 'Кузнецова', 28, 'Россия'),
		('Ганс',  'Мюллер',    40, 'Германия'),
		('Сара',  'Коннор',    27, 'США'),
		('Пётр',  'Смирнов',   45, 'Казахстан');

INSERT INTO orders (amount, customer_id)
VALUES 	(1500, 1),
		(2300, 1),
		(800,  2),
		(5000, 4),
		(6700, 4),
		(1200, 5),
		(3400, 7),
		(900,  7);

SELECT * FROM customers
WHERE age = (
	SELECT MIN(age)
	FROM customers);

SELECT * FROM customers
WHERE id NOT IN (
	SELECT customer_id
	FROM orders);