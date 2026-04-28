DROP TABLE IF EXISTS teens;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments 
(
	id 				SERIAL PRIMARY KEY,
	name 			VARCHAR(255)
);

CREATE TABLE employees
(
	id				SERIAL PRIMARY KEY,
	name 			VARCHAR(255),
	department_id	INT REFERENCES departments(id)
);

CREATE TABLE teens 
(
	id 				SERIAL PRIMARY KEY,
	name  			VARCHAR(255),
	gender			VARCHAR(255)
);

INSERT INTO departments(name) VALUES 
('IT'),
('HR'),
('Sales'),
('Marketing'),
('Finance'),
('Logistics');

INSERT INTO employees(name, department_id) VALUES
('Ivan', 1),
('Petr', 1),
('Anna', 2),
('Olga', 3),
('Sergey', 3),
('Maria', 5);

INSERT INTO teens(name, gender) 
VALUES 
('Vasya', 'M'),
('Petya', 'M'),
('Kolya', 'M'),
('Masha', 'F'),
('Olya', 'F'),
('Katya', 'F');

SELECT *
FROM departments AS d
LEFT JOIN employees AS e
	ON (d.id = e.department_id);

SELECT *
FROM departments AS d
LEFT JOIN employees AS e
	ON (d.id = e.department_id)
WHERE e.department_id IS NULL;

SELECT d.name, e.name, e.department_id
FROM departments AS d
RIGHT JOIN employees AS e
	ON (d.id = e.department_id);

SELECT d.name, e.name, e.department_id
FROM employees AS e
LEFT JOIN departments AS d
	ON (e.department_id = d.id);

SELECT *
FROM departments AS d
FULL JOIN employees AS e
	ON (d.id = e.department_id);

SELECT *
FROM teens AS t1
CROSS JOIN teens AS t2
WHERE t1.gender = 'M' AND t2.gender = 'F';