DROP TABLE IF EXISTS doctor_patient;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS doctor;

CREATE TABLE doctor(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE patient(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE doctor_patient(
	id SERIAL PRIMARY KEY,
	doctor_id INT REFERENCES doctor(id),
	patient_id INT REFERENCES patient(id)
);

INSERT INTO doctor(name) VALUES ('Internist');
INSERT INTO doctor(name) VALUES ('Allergist');
INSERT INTO doctor(name) VALUES ('Dentist');

INSERT INTO patient(name) VALUES ('Sam');
INSERT INTO patient(name) VALUES ('James');
INSERT INTO patient(name) VALUES ('Jack');

INSERT INTO doctor_patient(doctor_id, patient_id) VALUES (1,1);
INSERT INTO doctor_patient(doctor_id, patient_id) VALUES (1,2);
INSERT INTO doctor_patient(doctor_id, patient_id) VALUES (2,1);
INSERT INTO doctor_patient(doctor_id, patient_id) VALUES (3,1);
INSERT INTO doctor_patient(doctor_id, patient_id) VALUES (3,2);
INSERT INTO doctor_patient(doctor_id, patient_id) VALUES (3,3);

SELECT * FROM doctor_patient;