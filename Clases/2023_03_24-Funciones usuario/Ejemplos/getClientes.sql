CREATE FUNCTION `getClientes`() 
RETURNS int(11)
BEGIN
	DECLARE total INT DEFAULT 0;
	SELECT COUNT(*) INTO total FROM clientes;
	RETURN total;
END