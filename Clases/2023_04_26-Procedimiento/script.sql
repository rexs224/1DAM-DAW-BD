use prueba_transaccion;

/* 
	PROCEDIMIENTOS
    Los procedimientos almacenados son:
    -	subrutinas que puedes crear y ejecutar para realizar tareas específicas.
    -	son útiles porque te permiten encapsular lógica compleja y reutilizarla en diferentes partes del código.
    
    PARAMETROS
    -	IN: Un parámetro de entrada (IN) es utilizado para pasar un valor a un procedimiento almacenado desde fuera del procedimiento. 
		Es decir, se utiliza para proporcionar valores que el procedimiento necesita. Un parámetro de entrada es de sólo lectura dentro del procedimiento,
        lo que significa que su valor no puede ser modificado por el procedimiento almacenado. 
        Los valores de los parámetros de entrada se especifican al llamar al procedimiento almacenado desde una consulta en MySQL.
        
	-	- OUT: Un parámetro de salida (OUT) es utilizado para devolver un valor desde un procedimiento almacenado al código que llama al procedimiento. 
		Es decir, se utiliza para proporcionar valores calculados o generados por el procedimiento almacenado de vuelta a la aplicación o consulta que lo invoca. 
        Un parámetro de salida es de escritura dentro del procedimiento, lo que significa que su valor puede ser modificado por el procedimiento almacenado durante su ejecución 
        y ese valor será devuelto al código que llama al procedimiento cuando éste haya finalizado.
        
    SINTAXIS
		CREATE PROCEDURE nombre_procedimiento(
			IN/OUT parametro1 TIPO DE DATOS [OPCIONES],
			IN/OUT parametro2 TIPO DE DATOS [OPCIONES],
			...
		)
		BEGIN
			// Instrucciones del procedimiento aquí
		END;

	  Donde:
		- nombre_procedimiento es el nombre del procedimiento que estás creando.
		- parametro1, parametro2, etc. son parámetros de entrada y/o salida del procedimiento. Puedes tener tantos parámetros como necesites.
		- TIPO DE DATOS es el tipo de datos de cada parámetro. MySQL soporta una amplia variedad de tipos de datos, como INT, DECIMAL, VARCHAR, DATE, etc.
		- [OPCIONES] son opciones opcionales que puedes utilizar para especificar el valor inicial de cada parámetro, entre otras cosas.
    
    FUNCIONES vs PROCEDIMIENTOS
    
    -	RETORNO VALORES:
    
    -	NUMERO ELEMENTOS RETORNADOS:
    
    -	INVOCACION:
    
    -	USO DE TRANSACCIONES: 
 */
 
 
-- Ejemplo 1: Procedimiento almacenado que devuelve el número total de alumnos registrados en la tabla 'alumnos':
/*
    PARAMETROS ENTRADA: NO
    PARAMETROS SALIDA:  SI, tipo numerico
    TRANSACCIONES:      NO
    CONDICIONALES:      NO
    
    SELECT COUNT(*) FROM alumnos;
*/
 -- DECLARE total int; NO SE PUEDE
 -- set @total == ???? NO SE PUEDE
CALL totalAlumnos(@total);
SELECT @total;

-- Ejemplo 2: Procedimiento almacenado que devuelve el nombre y apellidos del alumno más joven registrados en la tabla 'alumnos':
/*
    PARAMETROS ENTRADA: NO
    PARAMETROS SALIDA:  SI, conjunto de datos.
    TRANSACCIONES:      NO
    CONDICIONALES:      NO
    
    Mas joven
    SELECT nombre FROM alumnos; FILTRAR POR DATEDIFF() 
    SELECT apellido FROM alumnos;
*/

-- SELECT nombre, apellidos, DATEDIFF(NOW(), fecha_nacimiento) FROM alumnos ORDER BY DATEDIFF(NOW(), fecha_nacimiento) ASC ;
CALL alumnoJoven(@nombre, @apellidos);
SELECT @nombre, @apellidos;

-- Ejemplo 3: Procedimiento almacenado que toma un parámetro de entrada 'ciclo' y devuelve el número total de alumnos registrados en ese ciclo:

/*
    PARAMETROS ENTRADA: SI, varchar
    PARAMETROS SALIDA:  SI, tipo numerico
    TRANSACCIONES:      NO
    CONDICIONALES:      NO
*/
-- SELECT COUNT(*) FROM alumnos WHERE ciclo = 'DAM';

DELIMITER $$
	CREATE PROCEDURE totalPorCiclo(
		IN ciclo_alumnos VARCHAR (5),
		OUT total INTEGER
	)
	BEGIN
		-- Instrucciones del procedimiento aquí
        SELECT COUNT(*) INTO total FROM alumnos WHERE ciclo = ciclo_alumnos;
	END $$

DELIMITER ;

CALL totalPorCiclo('DAM', @totalPorCiclo);
SELECT @totalPorCiclo;

-- Ejemplo 4: Procedimiento almacenado que toma un parámetro de entrada 'fecha_nacimiento' y 
-- devuelve el nombre y apellidos de un alumno que haya nacido antes de esa fecha:

/*
    PARAMETROS ENTRADA: SI, tipo numerico
    PARAMETROS SALIDA:  SI, conjunto de datos
    TRANSACCIONES:      NO
    CONDICIONALES:      NO
*/

DELIMITER $$
	CREATE PROCEDURE alumnoPorFecha(
		IN fecha_alumno DATE,
		OUT nombre_alumno VARCHAR(20),
        OUT apellidos_alumno VARCHAR(20)
	)
	BEGIN
		-- Instrucciones del procedimiento aquí
        SELECT nombre, apellidos INTO nombre_alumno, apellidos_alumno 
        FROM alumnos 
        WHERE fecha_nacimiento < fecha_alumno 
        LIMIT 1;
	END $$
DELIMITER ;

-- SELECT nombre, apellidos, fecha_nacimiento FROM alumnos WHERE fecha_nacimiento < '1995-07-15';
CALL alumnoPorFecha('1995-07-15', @nombre_alumno, @apellidos_alumno);
SELECT @nombre_alumno, @apellidos_alumno;

-- Ejemplo 5: procedimiento almacenado que toma un parametro de entrada 'matricula_param' y devuelve el nombre y apellidos del alumno que pertenece a esa matricula: 

/*
    PARAMETROS ENTRADA: SI, tipo numerico
    PARAMETROS SALIDA:  SI, conjunto de datos
    TRANSACCIONES:      NO
    CONDICIONALES:      NO
*/

DELIMITER $$
	CREATE PROCEDURE alumnoPorMatricula(
		IN matricula_alumno VARCHAR(20),
		OUT nombre_alumno VARCHAR(20),
        OUT apellidos_alumno VARCHAR(20)
	)
	BEGIN
		-- Instrucciones del procedimiento aquí
        SELECT nombre, apellidos INTO nombre_alumno, apellidos_alumno 
        FROM alumnos 
        WHERE numero_matricula = matricula_alumno
        LIMIT 1;
        
        SELECT nombre_alumno, apellidos_alumno;
	END $$
DELIMITER ;

DROP procedure IF EXISTS alumnoPorMatricula;
CALL alumnoPorMatricula('2021000001', @nombre_matricula, @apellidos_matricula);
SELECT @nombre_matricula, @apellidos_matricula;

-- Ejemplo 6:  procedimiento almacenado que toma varios parametros de entrada para insertar en la tabla alumnos y devuelve un mensaje.
/*
	IN nombre
    IN apellidos
    IN numero_matricula
    IN fecha_nacimiento
    IN ciclo
    OUT mensaje 
*/
/*
    PARAMETROS ENTRADA: SI, varios tipos
    PARAMETROS SALIDA:  SI, un varchar
    DEVLUCION DATOS:    NO
    TRANSACCIONES:      SI
    CONDICIONALES:      SI
*/

CALL insertarAlumno('Sergio', 'Fontan', '202300005', '2000-02-01', 'DAM', @mensaje);

SELECT * FROM alumnos;

INSERT INTO alumnos (nombre, apellidos, numero_matricula, fecha_nacimiento, ciclo) VALUES ('Sergio', 'Fontan', '202300001', '2020-01-01', 'DAM');