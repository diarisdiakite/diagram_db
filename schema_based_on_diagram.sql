CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  date_of_birth TIMESTAMP
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY key,
  admitted_at TIMESTAMP,
  patient_id INTEGER FOREIGN KEY REFERENCES patients(id),
  status VARCHAR(150)
);