CREATE DEFINER=`root`@`localhost` FUNCTION `ej8`(producto VARCHAR(20)
) RETURNS int(11)
BEGIN
	DECLARE ventas INTEGER;
    SELECT price * quantity INTO ventas FROM products WHERE name = producto;
	RETURN ventas;
END