/*
	1. TRANSACCIONES
		-	Ejecutar un grupo de instrucciones como bloque unico con seguridad. Tengo dos opciones:
			+	COMMIT si quiero confirmar la transaccion.
            +	ROLLBACK si quiero cancelar la transaccion.
            
		-	Si no realizo un ROLLBACK no cancelo las instrucciones ejecutadas, es decir, se aplican.
        
        SINTAXIS:
			START TRANSACTION;
			BEGIN;
				INSERT...
				UPDATE...
				ALTER...
				DELETE...
			COMMIT/ROLLBACK;
        
    2. FUNCIONES USUARIO
		-	Bloques de codigo para realizar tareas repetitivas.
        -	Siempre tienen RETURN.
        -	Pueden (o no) tener PARAMETROS.
		
        SINTAXIS
    
		CREATE FUNCTION nombre (
			nombre_parametro tipo_parametro,
			nombre_parametro2 tipo_parametro2,
			...
		) RETURN tipo_dato
		BEGIN
			// Zona de declaracion de variables
			DECLARE nombre_variable tipo_variable [OPCIONES];
			
			// Zona de sentencias
			SELECT campo INTO nombre_variable FROM tabla;
			
			// Zona de return
			RETURN nombre_variable;
		END
		
		- [OPCIONES]: elementos opcionales como por ejemplo el DEFAULT.
    
*/

use concesionario;
SELECT * FROM clientes;

-- Realizar una transaccion que cambie la fecha a hoy de todos los clientes que tienen vendedor_id = 1 y que cambie su vendedor_id a 2
START TRANSACTION;
BEGIN;
	UPDATE clientes SET fecha = NOW() WHERE vendedor_id = 1;
    UPDATE clientes SET vendedor_id = 2 WHERE vendedor_id = 1;
ROLLBACK; -- Si en vez de hacer ROLLBACK para cancelar, hago COMMIT para confirmar, los cambios se mantienen.

-- Funcion que retorna el total de usuarios del concesionario.
DELIMITER $$
CREATE FUNCTION getTotalUsers () 
RETURNS INTEGER
BEGIN
	-- Zona de declaracion de variables
	DECLARE total INTEGER DEFAULT 0;
	
	-- Zona de sentencias
	SELECT COUNT(*) INTO total FROM clientes;
	
	-- Zona de return
	RETURN total;
END $$
DELIMITER ;

SELECT COUNT(*) FROM clientes;
SELECT getTotalUsers();

SELECT * FROM coches;

-- Crea una funcion que reciba por parametro un id y un stock y reduzca el stock del coche correspondiente
DELIMITER $$
CREATE FUNCTION cambiaStock (
	id_coche INTEGER,
	stock_coche INTEGER
) RETURNS VARCHAR(20)
BEGIN
	-- Zona de declaracion de variables
	DECLARE respuesta VARCHAR(20);
	
	-- Zona de sentencias
	UPDATE coches SET stock = stock_coche WHERE id = id_coche;
    SET respuesta = "TODO CORRECTO";
    
	-- Zona de return
	RETURN respuesta;
END $$
DELIMITER ;

SELECT * FROM coches;
SELECT cambiaStock(1, 45);