DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS universities;

CREATE TABLE universities
(
    id   SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE students
(
    id            SERIAL PRIMARY KEY,
    name          TEXT,
    course        INT,
    budget        BOOLEAN,
    speciality    TEXT,
    enroll_date   TIMESTAMP,
    university_id INT REFERENCES universities (id)
);

INSERT INTO universities(name)
VALUES ('U1');
INSERT INTO universities(name)
VALUES ('U2');
INSERT INTO universities(name)
VALUES ('U3');
INSERT INTO universities(name)
VALUES ('U4');
INSERT INTO universities(name)
VALUES ('U5');

INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('AB', 1, true, 'S1', '2020-09-01', 1);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('AC', 2, true, 'S1', '2019-09-02', 1);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('AD', 3, true, 'M1', '2018-09-03', 1);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('AE', 4, false, 'Z1', '2017-09-04', 1);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('AF', 5, false, 'E1', '2016-09-05', 1);

INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('BC', 1, true, 'Q2', '2020-09-01', 2);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('BD', 2, true, 'R2', '2019-09-02', 2);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('BE', 3, false, 'T2', '2018-09-03', 2);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('BF', 4, false, 'Y2', '2017-09-04', 2);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('BG', 5, false, 'U2', '2016-09-05', 2);

INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('CD', 1, true, 'A3', '2020-09-01', 3);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('CE', 2, true, 'D3', '2019-09-01', 3);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('CF', 3, false, 'F3', '2018-09-01', 3);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('CG', 4, false, 'G3', '2017-09-01', 3);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('CH', 5, true, 'H3', '2016-09-01', 3);

INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('DE', 1, false, 'Z4', '2020-09-01', 4);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('DF', 2, true, 'X4', '2019-09-01', 4);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('DG', 3, true, 'C4', '2018-09-01', 4);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('DH', 4, false, 'V4', '2017-09-01', 4);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('DJ', 5, true, 'V4', '2016-09-01', 4);

INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('EF', 1, true, 'P5', '2020-09-01', 5);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('EG', 2, true, 'O5', '2019-09-01', 5);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('EH', 3, false, 'I5', '2018-09-01', 5);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('EJ', 4, true, 'J5', '2017-09-01', 5);
INSERT INTO students(name, course, budget, speciality, enroll_date, university_id)
VALUES ('EI', 5, true, 'K5', '2016-09-01', 5);

SELECT * FROM students;

SELECT name, course, budget FROM students;

SELECT * FROM students WHERE course = 2;

SELECT * FROM students WHERE course != 2;

SELECT * FROM students WHERE name IS NULL;

SELECT * FROM students WHERE name IS NOT NULL;

SELECT * FROM students WHERE enroll_date >= '2020-09-01';

SELECT * FROM students WHERE name LIKE 'A%';

SELECT * FROM students WHERE name LIKE 'D%' AND course > 2;

SELECT current_date;

SELECT current_date > '2020-01-01';

SELECT current_date + INTERVAL '1 month';

SELECT * FROM students ORDER BY name ASC;

SELECT * FROM students ORDER BY name DESC;

SELECT DISTINCT course FROM students;

SELECT* FROM students LIMIT 5; 