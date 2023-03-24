CREATE FUNCTION `sumaEnteros`(num1 INT, num2 INT) 
RETURNS int(11)
BEGIN
	DECLARE resultado INT DEFAULT 0;
	IF (num1 > 0 AND num2 > 0) THEN
		SET resultado = num1 + num2;
	END IF;
	RETURN resultado;
END