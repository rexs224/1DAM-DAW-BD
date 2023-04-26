use prueba_transaccion;

SELECT * FROM alumnos;

/* id, nombre, apellidos, numero_matricula, fecha_nacimiento, ciclo */

/*
	TRIGGER
    Objeto en la base de datos que automatriza la ejecucion de una serie de acciones en respuesta a eventos de una tabla.
    Esto quiere decir que se activan automaticamente.
    
    Partes de un trigger
    -	Condicion: es una expresion logica que determina cuando se debe activar (INSERT, UPDATE, DELETE).
    -	Accion: conjunto de instrucciones SQL que se ejecutan cuando se activa un trigger.
    
    Posibles usos: respaldo o historial de datos de una tabla determinada, auditoria de cambios en las tablas, etc.
    
    MOMENTO DE EJECUCION
    -	BEFORE: indica que el trigger se activa ANTES de la accion que lo dispara (antes del INSERT, UPDATE, DELETE).
    -	AFTER: indica que el trigger se activa DESPUES de la accion que lo dispara (despues del INSERT, UPDATE, DELETE).
    
    MOMENTO DE LA CAPTACION DE DATOS
    -	OLD: referencia valores de columnas ANTES de realizar la accion.
    -	NEW: referencia valores de columnas DESPUES de realizar la accion.
    
    SINTAXIS
    CREATE TRIGGER nombre {BEFORE|AFTER} {INSERT|UPDATE|DELETE} ON tabla
    FOR EACH ROW
    BEGIN
		-- Instrucciones SQL
    END;
*/

-- Creamos tabla de respaldo para almacenar informacion proporcionada por el trigger
CREATE TABLE IF NOT EXISTS respaldo(
	id INT PRIMARY KEY AUTO_INCREMENT,
    ciclo_antiguo VARCHAR(10),
    ciclo_nuevo VARCHAR(10),
    fecha_modificacion DATETIME,
    usuario VARCHAR(20)
) ENGINE= InnoDB;

SELECT * FROM respaldo;

-- 1. Almacenar la informacion de quien y cuando se ha insertado un valor en la tabla ALUMNOS

DELIMITER $$
CREATE TRIGGER insertaAlgo AFTER INSERT ON alumnos
FOR EACH ROW
BEGIN
	-- Instrucciones SQL
	INSERT INTO respaldo (fecha_modificacion, usuario) VALUES (NOW(), CURRENT_USER());
END $$

DELIMITER ;

-- Comprobamos la insercion en mi tabla de alumnos
INSERT INTO alumnos (ciclo) VALUES ('DAW');
SELECT * FROM respaldo;

-- 2. Almacenar la informacion de los cambios, quien y cuando al actualizar valores en la tabla ALUMNOS
DELIMITER $$
CREATE TRIGGER actualizaCiclo BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
	-- Instrucciones SQL
    INSERT INTO respaldo(ciclo_antiguo, ciclo_nuevo, fecha_modificacion, usuario) 
    VALUES(OLD.ciclo, NEW.ciclo, NOW(), CURRENT_USER());
END $$
DELIMITER ;

-- Comprobacion con UPDATE para un alumno existente
UPDATE alumnos SET ciclo = 'DAM' WHERE id = 2;
UPDATE alumnos SET nombre = 'Pepito' WHERE id = 1;

CREATE USER 'alumno'@'localhost' IDENTIFIED BY '';
GRANT INSERT ON prueba_transaccion.alumnos TO 'alumno'@'localhost';
GRANT SELECT ON prueba_transaccion.alumnos TO 'alumno'@'localhost';

SELECT * FROM respaldo;