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

-- treatments table
CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(80)
);

--invoices table
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount FLOAT,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT FOREIGN KEY REFERENCES medical_histories(id)
);

--invoice_items table
CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price FLOAT,
    quantity INT,
    total_price FLOAT,
    invoice_id INT FOREIGN KEY REFERENCES invoices(id),
    treatment_id INT FOREIGN KEY REFERENCES treatments(id)
);

-- treatments_medical_histories table
CREATE TABLE treatments_medical_histories (
    treatment_id INT FOREIGN KEY REFERENCES treatments(id),
    medical_history_id INT FOREIGN KEY REFERENCES medical_histories(id),
    PRIMARY KEY (treatment_id, medical_history_id)
);