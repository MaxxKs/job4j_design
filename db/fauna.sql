DROP TABLE IF EXISTS fauna;

CREATE TABLE fauna
(
	id				SERIAL PRIMARY KEY,
	name			TEXT,
	avg_age			INT,
	discovery_date	DATE
);	

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('goldfish', 15000, '1800-10-01');

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('catfish', 18000, '1758-01-01');

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('dog', 5000, '1700-08-10');

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('parrot', 20000, '1824-05-10');

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('turtle', 25000, '1901-03-15');

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('sunfish', 12000, '1930-07-20');

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('lion', 8000, '1758-01-01');

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('jellyfish', 11000, NULL);

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('starfish', 17000, NULL);

INSERT INTO fauna(name, avg_age, discovery_date)
VALUES ('salmon', 9000, '1945-06-01');

SELECT * FROM fauna WHERE name LIKE '%fish%';

SELECT * FROM fauna WHERE avg_age BETWEEN 10000 AND 21000; 

SELECT * FROM fauna WHERE discovery_date IS NULL;

SELECT * FROM fauna WHERE discovery_date < '1950-01-01';