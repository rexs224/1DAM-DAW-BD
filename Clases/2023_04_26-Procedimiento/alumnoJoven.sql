CREATE DEFINER=`root`@`localhost` PROCEDURE `alumnoJoven`(
	OUT nombre_alumno VARCHAR(20),
    OUT apellidos_alumno VARCHAR(40)
)
BEGIN
	SELECT nombre, apellidos INTO nombre_alumno, apellidos_alumno 
    FROM alumnos 
    WHERE DATEDIFF(NOW(), fecha_nacimiento) > 0
    ORDER BY DATEDIFF(NOW(), fecha_nacimiento) ASC 
    LIMIT 1;
END