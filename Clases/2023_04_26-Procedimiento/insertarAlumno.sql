CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarAlumno`(
	IN nombreI VARCHAR(20),
    IN apellidosI VARCHAR (20),
    IN numero_matriculaI VARCHAR (20),
    IN fecha_nacimientoI DATE,
    IN cicloI VARCHAR (20),
    OUT mensaje VARCHAR(20)
)
BEGIN
	START TRANSACTION;
	
	-- Comprobar que el ciclo es correcto (DAM, DAW, ASIR)
	IF (cicloI IN ('DAM', 'DAW', 'ASIR')) THEN	
    
		-- Validamos fecha
        IF (fecha_nacimientoI between '2000-01-01' AND NOW()) THEN
			INSERT INTO alumnos (nombre, apellidos, numero_matricula, fecha_nacimiento, ciclo) VALUES (nombreI, apellidosI, numero_matriculaI, fecha_nacimientoI, cicloI);
			SET mensaje = 'Insercion correcta';
            COMMIT;
        ELSE
			SET mensaje = 'Error en la fecha';
            ROLLBACK;
		END IF;
	ELSE
		SET mensaje = 'No es ciclo correcto';
		ROLLBACK;
    END IF;
    
    SELECT mensaje;
END