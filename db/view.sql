DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS students;
DROP VIEW IF EXISTS show_students_with_2_or_more_books;
DROP VIEW IF EXISTS student_authors_summary;

CREATE TABLE students
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (name)
VALUES ('Иван Иванов');
INSERT INTO students (name)
VALUES ('Петр Петров');
INSERT INTO students (name)
VALUES ('Анна Смирнова');
INSERT INTO students (name)
VALUES ('Дмитрий Новиков');
INSERT INTO students (name)
VALUES ('Евгений Смирнов');

CREATE TABLE authors
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO authors (name)
VALUES ('Александр Пушкин');
INSERT INTO authors (name)
VALUES ('Николай Гоголь');
INSERT INTO authors (name)
VALUES ('Фёдор Достоевский');
INSERT INTO authors (name)
VALUES ('Лев Толстой');
INSERT INTO authors (name)
VALUES ('Антон Чехов');

CREATE TABLE books
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    author_id INTEGER REFERENCES authors (id)
);

INSERT INTO books (name, author_id)
VALUES ('Евгений Онегин', 1);
INSERT INTO books (name, author_id)
VALUES ('Капитанская дочка', 1);
INSERT INTO books (name, author_id)
VALUES ('Дубровский', 1);
INSERT INTO books (name, author_id)
VALUES ('Мертвые души', 2);
INSERT INTO books (name, author_id)
VALUES ('Вий', 2);
INSERT INTO books (name, author_id)
VALUES ('Преступление и наказание', 3);
INSERT INTO books (name, author_id)
VALUES ('Война и мир', 4);
INSERT INTO books (name, author_id)
VALUES ('Вишнёвый сад', 5);

CREATE TABLE orders
(
    id SERIAL PRIMARY KEY,
    active BOOLEAN DEFAULT true,
    book_id INTEGER REFERENCES books (id),
    student_id INTEGER REFERENCES students (id)
);

INSERT INTO orders (book_id, student_id)
VALUES (1, 1);
INSERT INTO orders (book_id, student_id)
VALUES (3, 1);
INSERT INTO orders (book_id, student_id)
VALUES (5, 2);
INSERT INTO orders (book_id, student_id)
VALUES (4, 1);
INSERT INTO orders (book_id, student_id)
VALUES (2, 2);

CREATE VIEW show_students_with_2_or_more_books
AS
SELECT 
	s.name AS student,
	COUNT(a.name),
	a.name AS author
FROM students AS s
	JOIN orders o ON s.id = o.student_id
	JOIN books b ON o.book_id = b.id
    JOIN authors a ON b.author_id = a.id
GROUP BY (s.name, a.name)
HAVING COUNT(a.name) >= 2;

SELECT * FROM show_students_with_2_or_more_books;

CREATE VIEW student_authors_summary
AS
SELECT 
    s.name AS student_name,
    COUNT(o.id) AS total_books,
    COUNT(DISTINCT a.id) AS unique_authors,
    STRING_AGG(DISTINCT a.name, ', ' ORDER BY a.name) AS authors
FROM students s
	JOIN orders o ON s.id = o.student_id
	JOIN books b ON o.book_id = b.id
	JOIN authors a ON b.author_id = a.id
GROUP BY s.id, s.name
ORDER BY total_books DESC, student_name;

SELECT * FROM student_authors_summary;