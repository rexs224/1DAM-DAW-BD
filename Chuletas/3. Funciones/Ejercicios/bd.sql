CREATE DATABASE IF NOT EXISTS medicamentos;

-- Creación de la tabla "medicamentos"
CREATE TABLE IF NOT EXISTS medicamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    dosis VARCHAR(50),
    via_administracion VARCHAR(50),
    fecha_vencimiento DATE
);

-- Inserciones de datos de ejemplo
INSERT INTO medicamentos (nombre, dosis, via_administracion, fecha_vencimiento) 
VALUES ('Ibuprofeno', '200mg', 'Oral', '2024-06-30'),
       ('Paracetamol', '500mg', 'Oral', '2023-12-31'),
       ('Amoxicilina', '250mg', 'Oral', '2022-09-15'),
       ('Omeprazol', '20mg', 'Oral', '2023-05-31'),
       ('Loratadina', '10mg', 'Oral', '2024-08-30'),
       ('Insulina Lispro', '100 UI/ml', 'Subcutánea', '2023-11-30'),
       ('Atorvastatina', '40mg', 'Oral', '2022-07-31'),
       ('Losartan', '50mg', 'Oral', '2023-09-30'),
       ('Dexametasona', '4mg', 'Intravenosa', '2023-04-30'),
       ('Metformina', '850mg', 'Oral', '2022-12-31');


