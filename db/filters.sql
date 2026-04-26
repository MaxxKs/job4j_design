DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS type;

CREATE TABLE type
(
	id 		SERIAL PRIMARY KEY,
	name 	VARCHAR(255)
);

CREATE TABLE product
(
	id 				SERIAL PRIMARY KEY,
	name 			VARCHAR(255),
	expired_date	DATE,
	type_id			INT REFERENCES type(id),
	price			FLOAT
);

INSERT INTO type(name) VALUES
('СЫР'),
('МОЛОКО'),
('МОРОЖЕНОЕ'),
('ЙОГУРТ'),
('ХЛЕБ'),
('КОЛБАСА'),
('СМЕТАНА'),
('ТВОРОГ'),
('СОК'),
('МАСЛО');

INSERT INTO product(name, type_id, expired_date, price) VALUES
('Сыр гауда', 1, '2026-05-10', 350),
('Сыр моцарелла', 1, '2026-04-20', 420),
('Сыр плавленый', 1, '2026-03-01', 200),
('Молоко 3.2%', 2, '2026-04-15', 120),
('Молоко фермерское', 2, '2026-04-10', 200),
('Мороженое пломбир', 3, '2027-01-01', 90),
('Мороженое шоколадное', 3, '2026-12-15', 110),
('Йогурт клубничный', 4, '2026-04-18', 80),
('Йогурт греческий', 4, '2026-04-12', 130),
('Хлеб белый', 5, '2026-04-08', 55),
('Хлеб ржаной', 5, '2026-04-09', 60),
('Колбаса докторская', 6, '2026-04-25', 390),
('Колбаса салями', 6, '2026-05-01', 470),
('Сметана 20%', 7, '2026-04-11', 95),
('Творог зерненый', 8, '2026-04-13', 140),
('Сок яблочный', 9, '2026-11-01', 150),
('Сок апельсиновый', 9, '2026-10-15', 200),
('Масло сливочное', 10, '2026-06-01', 200),
('Сыр пармезан', 1, '2026-07-01', 470),
('Мороженое ванильное', 3, '2026-11-20', 110);

SELECT *
FROM product AS p
JOIN type AS t
	ON p.type_id = t.id
WHERE t.name = 'СЫР';

SELECT *
FROM product
WHERE name ILIKE '%мороженое%';

SELECT *
FROM product
WHERE expired_date < CURRENT_DATE;

SELECT * 
FROM product
WHERE price = (SELECT MAX(price) FROM product);

SELECT t.name, COUNT(*) AS product_count
FROM type AS t
JOIN product AS p
	ON p.type_id = t.id
GROUP BY t.name;

SELECT *
FROM product AS p
JOIN type AS t
	ON p.type_id = t.id
WHERE t.name IN ('СЫР', 'МОЛОКО');

SELECT t.name, COUNT(*) AS product_count
FROM type AS t
JOIN product AS p
	ON p.type_id = t.id
GROUP BY t.name
HAVING COUNT(*) < 10;

SELECT *
FROM product AS p
JOIN type AS t
	ON p.type_id = t.id;