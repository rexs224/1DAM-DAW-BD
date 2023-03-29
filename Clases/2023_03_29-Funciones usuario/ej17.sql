CREATE DEFINER=`root`@`localhost` FUNCTION `ej17`() RETURNS varchar(50) CHARSET latin1
BEGIN
	DECLARE nombre VARCHAR(50);
    -- SELECT name INTO nombre FROM users WHERE LENGTH(name) >= ALL (SELECT LENGTH(name) FROM users) LIMIT 1;
    -- SELECT name INTO nombre FROM users WHERE LENGTH(name) = (SELECT MAX(LENGTH(name)) FROM users) LIMIT 1 ;
    SELECT name INTO nombre FROM users ORDER BY LENGTH(name) DESC LIMIT 1 ;
	RETURN nombre;
END