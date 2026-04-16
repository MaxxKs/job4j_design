DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS vin;

CREATE TABLE vin
(
	id 		SERIAL PRIMARY KEY,
	seria 	INT,
	number 	INT
);

CREATE TABLE car
(
	id 		SERIAL PRIMARY KEY,
	name 	TEXT,
	vin_id 	INT REFERENCES vin(id) UNIQUE
);

INSERT INTO vin(seria, number) VALUES (123, 456789);
INSERT INTO vin(seria, number) VALUES (321, 987654);
INSERT INTO vin(seria, number) VALUES (777, 777777);

INSERT INTO car(name, vin_id) VALUES ('jeep', 1);
INSERT INTO car(name, vin_id) VALUES ('volkswagen', 2);
INSERT INTO car(name, vin_id) VALUES ('mercedes', 3);

SELECT 	cv.name,
		v.seria,
		v.number
FROM car AS cv
JOIN vin AS v ON cv.vin_id = v.id;

SELECT 	cv.name as "Название",
		v.seria as "Серия",
		v.number as "Номер"
FROM car AS cv
JOIN vin AS v ON cv.vin_id = v.id;

SELECT 	cv.name as "Название автомобиля",
		v.seria "Серия", 
		v.number "Номер"
FROM car cv 
JOIN vin v ON cv.vin_id = v.id;
