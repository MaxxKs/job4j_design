DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS car_transmissions;
DROP TABLE IF EXISTS car_engines;
DROP TABLE IF EXISTS car_bodies;

CREATE TABLE car_bodies
(
	id 					SERIAL PRIMARY KEY,
	name 				VARCHAR(255)
);

CREATE TABLE car_engines
(
	id 					SERIAL PRIMARY KEY,
	name 				VARCHAR(255)
);

CREATE TABLE car_transmissions
(
	id 					SERIAL PRIMARY KEY,
	name 				VARCHAR(255)
);

CREATE TABLE cars
(
	id 					SERIAL PRIMARY KEY,
	name 				VARCHAR(255),
	body_id 			INT REFERENCES car_bodies(id),
	engine_id 			INT REFERENCES car_engines(id),
	transmission_id 	INT REFERENCES car_transmissions(id)
);

INSERT INTO car_bodies(name) VALUES
('Седан'),
('Хэтчбек'),
('Универсал'),
('Купе'),
('Пикап'),
('Кабриолет');

INSERT INTO car_engines(name) VALUES
('Бензиновый 1.6'),
('Бензиновый 2.0'),
('Дизель 2.0'),
('Гибрид'),
('Электро'),
('V8');

INSERT INTO car_transmissions(name) VALUES
('Механика'),
('Автомат'),
('Робот'),
('Вариатор'),
('CVT'),
('8-ступенчатая АКПП');

INSERT INTO cars(name, body_id, engine_id, transmission_id) VALUES
('Toyota Camry', 1, 2, 2),
('BMW 3 Series', 1, 2, 2),
('Volkswagen Golf', 2, 1, 1),
('Skoda Octavia', 3, 3, 2),
('Ford Focus', 2, 1, 1),
('Tesla Model 3', 1, 5, NULL),
('Nissan Leaf', 2, 5, NULL),
('Old Pickup', 5, NULL, 1),
('Project Car', NULL, NULL, NULL),
('Audi A5', 4, 2, 3),
('Toyota Prius', 1, 4, 4);

SELECT 
	c.id,
	c.name AS car_name,
	cb.name AS body_name,
	ce.name AS engine_name,
	ct.name AS transmission_name 
FROM cars c
LEFT JOIN car_bodies cb
	ON c.body_id = cb.id
LEFT JOIN car_engines ce
	ON c.engine_id = ce.id
LEFT JOIN car_transmissions ct
	ON c.transmission_id = ct.id;

SELECT cb.name
FROM car_bodies cb
LEFT JOIN cars c
	ON cb.id = c.body_id
	WHERE c.id IS NULL;

SELECT ce.name
FROM car_engines ce
LEFT JOIN cars c
	ON ce.id = c.engine_id
	WHERE c.id IS NULL;

SELECT ct.name
FROM car_transmissions ct
LEFT JOIN cars c
	ON ct.id = c.transmission_id
	WHERE c.id IS NULL;