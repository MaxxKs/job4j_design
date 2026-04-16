INSERT INTO roles(name) VALUES ('admin');
INSERT INTO roles(name) VALUES ('manager');
INSERT INTO roles(name) VALUES ('user');

INSERT INTO users(name, role_id) VALUES ('John', 1);
INSERT INTO users(name, role_id) VALUES ('Petr', 1);
INSERT INTO users(name, role_id) VALUES ('Tom', 2);

INSERT INTO rules(name) VALUES ('read');
INSERT INTO rules(name) VALUES ('add');
INSERT INTO rules(name) VALUES ('delete');

INSERT INTO roles_rules(role_id, rule_id) VALUES(1,1);
INSERT INTO roles_rules(role_id, rule_id) VALUES(1,2);
INSERT INTO roles_rules(role_id, rule_id) VALUES(1,3);
INSERT INTO roles_rules(role_id, rule_id) VALUES(2,1);
INSERT INTO roles_rules(role_id, rule_id) VALUES(2,2);
INSERT INTO roles_rules(role_id, rule_id) VALUES(3,1);

INSERT INTO states(name) VALUES ('new');
INSERT INTO states(name) VALUES ('completed');
INSERT INTO states(name) VALUES ('in_progress');

INSERT INTO categories(name) VALUES ('support');
INSERT INTO categories(name) VALUES ('development');
INSERT INTO categories(name) VALUES ('testing');

INSERT INTO items(name, user_id, state_id, category_id) VALUES ('item №1', 1, 1, 2);
INSERT INTO items(name, user_id, state_id, category_id) VALUES ('item №2', 2, 2, 1);
INSERT INTO items(name, user_id, state_id, category_id) VALUES ('item №3', 3, 3, 3);

INSERT INTO comments(name, item_id) VALUES ('comment №1', 1);
INSERT INTO comments(name, item_id) VALUES ('comment №2', 2);
INSERT INTO comments(name, item_id) VALUES ('comment №3', 3);

INSERT INTO attachs(name, item_id) VALUES ('attach №1', 1);
INSERT INTO attachs(name, item_id) VALUES ('attach №2', 2);
INSERT INTO attachs(name, item_id) VALUES ('attach №3', 3);