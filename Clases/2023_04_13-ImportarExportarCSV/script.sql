CREATE DATABASE IF NOT EXISTS abr13GB;
USE abr13GB;

CREATE TABLE IF NOT EXISTS personas(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(7),
    edad INT,
    trabajo VARCHAR(2)
);

SELECT * FROM personas;

/*
	IMPORTAR FICHEROS CSV
    Para importar ficheros CSV tengo en cuenta:
    -	Ubicacion del fichero.
    -	Tabla de insercion.
    -	Delimitador de campo.
    -	Delimitador de linea.
    -	(opcional) ignorar primera/s lineas
    
    LOAD DATA INFILE 'ruta'
    INTO TABLE 'tabla'
    FIELS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
*/

LOAD DATA INFILE 'D:\2022-23 IMF\\GITHUB\\MP01. Bases de Datos\\GrupoB\\Clases\\2023_04_13-ImportarExportarCSV\\exportar_antoni.csv' 
INTO TABLE personas
FIELDS TERMINATED BY ',' -- Delimitador de campos
LINES TERMINATED BY '\n' -- Delimitador de líneas
IGNORE 7 ROWS; -- Ignorar la primera fila (encabezado)

/*
	EXPORTAR DATOS EN CSV
    -	Ubicacion del archivo.
    -	Delimitador campo
    -	Delimitador de linea
*/

SELECT * INTO OUTFILE 'D:\2022-23 IMF\\GITHUB\\MP01. Bases de Datos\\GrupoB\\Clases\\2023_04_13-ImportarExportarCSV\\exportar_antoni.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM personas;

UPDATE personas SET nombre = 'Ant,oni' WHERE id = 3;







USE nba;
SELECT * INTO OUTFILE 'D:\2022-23 IMF\\GITHUB\\MP01. Bases de Datos\\GrupoB\\Clases\\2023_04_13-ImportarExportarCSV\\jugadores.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM jugadores;
