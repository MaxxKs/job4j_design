CREATE TABLE roles(
	id SERIAL PRIMARY KEY,
	name TEXT
);

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name TEXT,
	role_id INT REFERENCES roles(id)
);

CREATE TABLE rules(
	id SERIAL PRIMARY KEY,
	name TEXT
);

CREATE TABLE roles_rules(
	id SERIAL PRIMARY KEY,
	role_id INT REFERENCES roles(id),
	rule_id INT REFERENCES rules(id)
);

CREATE TABLE states(
	id SERIAL PRIMARY KEY,
	name TEXT
);

CREATE TABLE categories(
	id SERIAL PRIMARY KEY,
	name TEXT
);

CREATE TABLE items(
	id SERIAL PRIMARY KEY,
	name TEXT,
	user_id INT REFERENCES users(id),
	state_id INT REFERENCES states(id),
	category_id INT REFERENCES categories(id)
);

CREATE TABLE comments(
	id SERIAL PRIMARY KEY,
	name TEXT,
	item_id INT REFERENCES items(id)
);

CREATE TABLE attachs(
	id SERIAL PRIMARY KEY,
	name TEXT,
	item_id INT REFERENCES items(id)
);