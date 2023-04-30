CREATE DATABASE IF NOT EXISTS practicaordenadores;

USE practicaordenadores;

CREATE TABLE IF NOT EXISTS ordenadores (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(20),
    modelo VARCHAR(20),
    precio DECIMAL (10,2),
    descripcion TEXT
)ENGINE = InnoDB;

marca,modelo,precio,descripcion

LOAD DATA INFILE 'ordenadores.csv' 
INTO TABLE ordenadores
FIELDS TERMINATED BY ',' -- Delimitador de campos
LINES TERMINATED BY '\n' -- Delimitador de líneas
IGNORE 1 ROWS; -- Ignorar la primera fila (encabezado)
