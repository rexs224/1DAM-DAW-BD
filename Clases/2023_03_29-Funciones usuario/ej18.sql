CREATE DEFINER=`root`@`localhost` FUNCTION `ej18`() RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE nombre VARCHAR(50);
    SELECT name INTO nombre FROM products ORDER BY price ASC LIMIT 1;
	RETURN nombre;
END