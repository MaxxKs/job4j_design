DROP TABLE IF EXISTS devices_people;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS devices;

CREATE TABLE devices
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	price FLOAT
);

CREATE TABLE people
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE devices_people
(
	id SERIAL PRIMARY KEY,
	device_id INT REFERENCES devices (id),
	people_id INT REFERENCES people (id)
);

INSERT INTO devices(name, price) VALUES ('Samsung Galaxy S25', 30000.99), ('iPhone 16 Pro', 49000.50), ('Xiaomi 14 Ultra', 54321.12), ('Google Pixel 10a', 83321.12), ('OnePlus 15', 49221.12);
INSERT INTO people(name) VALUES ('Аня'), ('Ваня'), ('Боря');
INSERT INTO devices_people(device_id, people_id) VALUES (2, 1), (4,1), (5, 1), (1, 2), (3, 2), (5, 2), (3, 3), (5, 3);

SELECT AVG(price) FROM devices;

SELECT p.name, AVG(d.price)
FROM people AS p
JOIN devices_people dp
ON dp.people_id = p.id 
JOIN devices d
ON dp.device_id = d.id
GROUP BY p.name;

SELECT p.name, AVG(d.price)
FROM people AS p
JOIN devices_people dp
ON dp.people_id = p.id 
JOIN devices d
ON dp.device_id = d.id
GROUP BY p.name
HAVING AVG(d.price) > 5000;