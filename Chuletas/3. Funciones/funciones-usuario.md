******************************************************
**************** FUNCIONES USUARIO *******************
******************************************************

En MySQL, se pueden crear funciones de usuario mediante la declaración CREATE FUNCTION. 

Una función de usuario es un bloque de código que realiza una tarea específica y puede ser utilizada en consultas SQL.

******************************************************
********************** SINTAXIS **********************
******************************************************

La sintaxis general de la instrucción CREATE FUNCTION es la siguiente:

    CREATE [OR REPLACE] FUNCTION nombre_funcion(
        parametro1 TIPO DE DATOS [OPCIONES],
        parametro2 TIPO DE DATOS [OPCIONES],
        ...
    ) RETURNS TIPO DE DATOS
    BEGIN
        // Declaraciones
        // Instrucciones de la función aquí
    END;

    Donde:
    - nombre_funcion es el nombre de la función que estás creando.
    - parametro1, parametro2, etc. son parámetros de entrada de la función. Puedes tener tantos parámetros como necesites.
    - TIPO DE DATOS es el tipo de datos de cada parámetro. MariaDB soporta una amplia variedad de tipos de datos, como INT, DECIMAL, VARCHAR, DATE, etc.
    - [OPCIONES] son opciones opcionales que puedes utilizar para especificar el valor inicial de cada parámetro, entre otras cosas.
    - RETURNS TIPO DE DATOS especifica el tipo de datos que la función devolverá cuando se ejecute.

******************************************************
********************** EJEMPLOS **********************
******************************************************

EJEMPLOS:

1. Crear una funcion de usuario que sume dos números enteros y devuelva el resultado como un entero:

    CREATE FUNCTION suma_enteros(
        numero1 INT,
        numero2 INT
    ) RETURNS INT
    BEGIN
        DECLARE resultado INT DEFAULT 0;
        SET resultado = numero1 + numero2;
        RETURN resultado;
    END;


2. Crear una función de usuario en MySQL que calcule el descuento de un producto dado su precio original y el porcentaje de descuento.
    CREATE FUNCTION calcular_descuento (
        precio_original DECIMAL(10,2), 
        porcentaje_descuento DECIMAL(5,2)
    ) RETURNS DECIMAL(10,2)
    BEGIN
        DECLARE descuento DECIMAL(10,2);
        SET descuento = precio_original * (porcentaje_descuento/100);
        RETURN descuento;
    END;


3. Crear una función de usuario en MySQL que calcule la edad de una persona dada su fecha de nacimiento.
    CREATE FUNCTION calcular_edad(
        fecha_nacimiento DATE
    ) RETURNS INT
    BEGIN
        DECLARE edad INT;
        SET edad = YEAR(CURDATE()) - YEAR(fecha_nacimiento);
        RETURN edad;
    END;


4. Crear una función de usuario en MySQL que calcule la suma de los números pares en un rango dado.
    CREATE FUNCTION suma_pares(
        rango_inferior INT, 
        rango_superior INT
    ) RETURNS INT
    BEGIN
        DECLARE suma INT;
        SET suma = 0;
        WHILE rango_inferior <= rango_superior DO
        IF MOD(rango_inferior, 2) = 0 THEN
            SET suma = suma + rango_inferior;
        END IF;
        SET rango_inferior = rango_inferior + 1;
        END WHILE;
        RETURN suma;
    END;
