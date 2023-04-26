CREATE PROCEDURE totalAlumnos (
	OUT total int
)
BEGIN
	SELECT COUNT(*) INTO total FROM alumnos;
END
