CREATE DATABASE IF NOT EXISTS imf;
USE imf;

CREATE TABLE IF NOT EXISTS alumno (
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    nota DECIMAL(5,2) DEFAULT null,
    PRIMARY KEY (id)
);

SELECT * FROM alumno;

INSERT INTO alumno VALUES (1, 'Antonio', 9.2), (2, 'Carlos', 7.5), (3, 'Inma', 6.3), (4, 'David', 4.99), (5, 'Sergio', null);

/*
	CONDICIONALES
    
    IF
    IF(condicional, VERDADERO, FALSO)
	
    -	Si hay un campo en null lo contempla como falso al evaluar la condicion.
    
    Ejemplo:
		SELECT nombre, IF(nota >=5, 'Aprobado', 'Suspenso')
		FROM alumno;
    
    CASE
		CASE
			WHEN condicion1 THEN sentencia
            WHEN condicion2 THEN sentencia
            ...
            ELSE sentencia
        END
        
	-	Si hay un campo en null lo contempla como caso de ELSE ya que no se puede evaluar en ninguna condicion.
    
    Ejemplo:
		SELECT nombre, 
			(CASE
				WHEN nota >= 9 THEN 'SB'
                WHEN nota >= 7 THEN 'NT'
                WHEN nota >= 5 THEN 'SF'
                ELSE 'IN'
            END) as 'Calificacion', nota
		FROM alumno;
    
    IFNULL
    IFULL(campo, 'Respuesta')
    
    Ejemplo:
		SELECT nombre, IFNULL(nota, 'No presentado')
        FROM alumno;
    
    
*/

SELECT nombre, IF(nota >=5, 'Aprobado', 'Suspenso')
FROM alumno;

SELECT nombre, IF(nota >=5, IF(nombre = 'Inma', 'Inma y aprobado', 'Aprobado y otra persona'), 'Suspenso') as 'Calificacion'
FROM alumno;

SELECT nombre, 
	(CASE
		WHEN nota >= 9 THEN 'SB'
		WHEN nota >= 7 THEN 'NT'
		WHEN nota >= 5 THEN 'SF'
		ELSE 'IN'
	END) as 'Calificacion', nota
FROM alumno;
    
SELECT nombre, IFNULL(nota, 'No presentado') AS 'Calificacion'
FROM alumno;

SELECT nombre, 
	(CASE
		WHEN nota < 0 OR nota > 10 THEN 'Nota no valida'
		WHEN nota >= 9 AND nota <= 10 THEN 'SB'
		WHEN nota >= 7 THEN 'NT'
		WHEN nota >= 5 THEN 'SF'
        WHEN nota >= 0 THEN 'IN'
		ELSE IFNULL(nota, 'No presentado')
	END) as 'Calificacion', nota
FROM alumno;