CREATE TABLE city(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE school(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	city_id INT REFERENCES city(id)
);

INSERT INTO city(name) VALUES ('Moscow');
INSERT INTO school(name, city_id) VALUES ('School № 1', 1);

SELECT * FROM school;

SELECT * FROM city WHERE id IN (SELECT city_id FROM school);