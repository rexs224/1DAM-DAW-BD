-- GRUPO B
/*
	FUNCIONES DE USUARIO
    Se crean mediante la declaracion 'CREATE FUNCTION'.
    Es un bloque de codigo que realiza una tarea especifica y puede ser utilizada en sentencias SQL.
    Las funciones de usuario se asocian SIEMPRE a una base de datos especifica.
    
    SINTAXIS
    La sintaxis de una funcion de usuario es:
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
    
    
    CREACION
    2 opciones:
    -	Creacion fuera de un script:
			- Haciendo click en el boton que está debajo de 'Server' cuyo icono pone f(). 
            - En este punto nos dirige a otra pestaña con la estructura de la funcion para construir su contenido. Una vez finalizdo, hacer click en 'Apply' para aplicar los cambios.
	-	Creacion dentro de un script:
			- Debemos tener en cuenta el delimitador. Su construccion es igual que en modo anterior cambiando el final de linea*
            
	*DELIMITADOR
    El delimitador es el final de sentencia. De manera predefinida es ; pero es posible cambiarlo utilizando la sentencia 'DELIMITER'.
    A la hora de crear la funcion, es IMPRESCINDIBLE cambiar el delimitador a cualquier otro simbolo (normalmente se utiliza $$). 
    Esto hace que el final de sentencia dentro de la funcion siga siendo ; mientras que fuera de la funcion, es decir, en cualquier otra sentencia se utilice $$.
    El objetivo es no entrar en conflicto a la hroa de crear la sintaxis.
    
    LLAMADAS A LAS FUNCIONES
    Utilizamos la sentencia SELECT seguida del nombre de la funcion con/sin parametros.
    Ejemplo:
		SELECT nombre_funcion();
	
    ELIMINACION FUNCIONES
	Para eliminar una funcion asociada a una base de datos utilizamos 'DROP FUNCTION'
    Sintaxis:
		DROP FUNCTION nombre_funcion;
*/

use nba;

select suma(1,2) as 'total';

-- Funcion que recoge el total de equipos
DELIMITER $$
USE `nba`$$
CREATE FUNCTION getEquipos()
RETURNS INTEGER
BEGIN
	DECLARE total INTEGER DEFAULT 0;
    SELECT COUNT(*) INTO total FROM equipos;
	RETURN total;
END$$
DELIMITER ;

-- Llamada a la funcion que devuelve equipos
SELECT getEquipos() AS 'TOTAL EQUIPOS';

/* Crear una funcion 'calculaPrecio' que calcule el precio final de un producto dado un precio original y porcentaje de descuento.
    Parametros:
	-	Precio DECIMAL
	-	Descuento DECIMAL
    Return:
	-	Total DECIMAL
 */
DELIMITER $$
USE `nba`$$
CREATE FUNCTION `calculaPrecio`(
	precio DECIMAL,
    descuento DECIMAL
) RETURNS decimal(10,2)
BEGIN
	DECLARE total DECIMAL;
    SET total = precio - ((precio * descuento) / 100);
	RETURN total;
END$$
DELIMITER ;

SELECT calculaPrecio(10, 50);
 
/* Crear una funcion 'calculaEdad' que calcule la edad de una persona dada su fecha de nacimiento
	Parametros:
    -	Fecha DATE
    Return:
    -	Edad INTEGER
*/
DELIMITER $$
USE `nba`$$
CREATE FUNCTION `calculaEdad`(fecha DATE
) RETURNS decimal(10,2)
BEGIN
	DECLARE edad DECIMAL;
    SET EDAD = DATEDIFF(CURDATE(), fecha);
	RETURN edad/365;
END$$

DELIMITER ;

SELECT calculaEdad(CURDATE()) AS 'Edad';
SELECT calculaEdad('2000-03-01') AS 'Edad';

-- Eliminamos las funciones
DROP FUNCTION calculaEdad;
DROP FUNCTION calculaPrecio;
DROP FUNCTION suma;
DROP FUNCTION getEquipos;