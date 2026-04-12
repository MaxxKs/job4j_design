CREATE TABLE car(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE vin(
	id SERIAL PRIMARY KEY,
	number INT
);

CREATE TABLE car_vin(
	id SERIAL PRIMARY KEY,
	car_id INT REFERENCES car(id) UNIQUE,
	vin_id INT REFERENCES vin(id) UNIQUE
);

INSERT INTO car(name) VALUES ('Zil');
INSERT INTO car(name) VALUES ('Kamaz');
INSERT INTO car(name) VALUES ('Volga');

INSERT INTO vin(number) VALUES (123);
INSERT INTO vin(number) VALUES (456);
INSERT INTO vin(number) VALUES (789);

INSERT INTO car_vin(car_id, vin_id) VALUES (1,1);
INSERT INTO car_vin(car_id, vin_id) VALUES (2,2);
INSERT INTO car_vin(car_id, vin_id) VALUES (3,3);

SELECT * FROM car_vin;