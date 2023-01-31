/*
    1. ¿Cuántos productos hay con inventario inferior a 50 unidades?
        a) 1
        b) 3
        c) 4
        d) 5    
*/

/*
    2. ¿Cuáles son los clientes que han comprado al menos 2 productos diferentes?
        a) Juan Perez, Carlos Rodriguez			// Correcta
        b) Juan Perez, Maria Gomez				// Correcta
        c) No hay datos en la respuesta     	
        d) Carlos Rodriguez, Andres Rodriguez	// Correcto
        
        - Diferentes utilizo DISTINCT
        - COUNT() >= 2
		- POSITION para identificar en que posicion esta la ,
		  Si position devuelve 0 entonces no existe , y por tanto habria un unico producto.
*/
SELECT nombre
FROM clientes
WHERE POSITION(',' IN historial_compras) > 0;




/*
    3. ¿Cual es la media de salario de empleados por puesto teniendo en cuenta solo aquellos que tienen salarios mayores a $2000?
        a) Gerente, 2500
        b) Gerente, 3000         			// Correcto
        c) Carnicero, 2000
        d) Carnicero, 2500
        
        - AVG(salario)
        - agrupar por puesto
        - avg > 2000
*/
SELECT puesto, AVG(salario)
FROM empleados
WHERE salario > 2000
GROUP BY puesto;

SELECT puesto, AVG(salario)
FROM empleados
GROUP BY puesto
HAVING AVG(salario) > 2000;

/*
    4. ¿Cuáles son las fechas en las que se registraron ventas de más de 3 unidades de algún producto?
        a) 2022-01-01, 2022-01-02
        b) 2022-01-03, 2022-01-04
        c) 2022-01-03, 2022-01-06       
        d) 2022-01-07, 2022-01-08
*/

/*
    5. ¿Cuáles son los productos más vendidos en el mes de enero?
        a) Salchicha, cordero, ave          
        b) Salchicha, longaniza, res
        c) Salchicha, ave, codero
        d) Longaniza, cordero, mortadela
*/

/*
    6. ¿A que proveedor se le compra mas de 1 productos con una fecha de vencimiento en diciembre de 2022?
        a) Granja S.A.                  // Correcto    
        b) Pescaderia S.A.              // Correcto
        c) Proveedor1 S.L.
        d) Ganaderia S.A.  				// Correcto
        
        - nombre de proveedor
        - tabla compras ---> provedor_id
        - fecha_vencimiento de los productos
*/

/* paso 1. Recoger los tipo de los productos con la fecha de vencimiento indicada */
SELECT tipo
FROM productos
WHERE fecha_vencimiento LIKE ('2022-12-__');

/* paso 2. Recoger los proveedor_id cuyo 'compras.producto' coincida con 'productos.tipo'*/
SELECT proveedor_id
FROM compras
WHERE productos IN (SELECT tipo
	FROM productos
	WHERE fecha_vencimiento LIKE ('2022-12-__'))
GROUP BY proveedor_id
HAVING COUNT(*) > 1;

/* paso3. Recoger nombre de proovedor */
SELECT nombre_empresa
FROM proveedores
WHERE id IN(SELECT proveedor_id
FROM compras
WHERE productos IN (SELECT tipo
	FROM productos
	WHERE fecha_vencimiento LIKE ('2022-12-__'))
GROUP BY proveedor_id
HAVING COUNT(*) > 1);

/* OJO DUDAS AQUI. Cantidad vs veces que aparece el producto */
SELECT* FROM compras;
SELECT nombre_empresa
FROM proveedores
WHERE id IN(SELECT proveedor_id
FROM compras
WHERE productos IN (SELECT tipo
	FROM productos
	WHERE fecha_vencimiento LIKE ('2022-12-__')
    AND cantidad > 1));

/*
    7. ¿Cuáles son los empleados que han sido contratados en el año 2022?
        a) Juan Perez, Maria Gomez                  
        b) Carlos Rodriguez, Andres Rodriguez       
        c) Ana Lopez, Pedro Garcia                  
        d) Juana Martinez, Luis Gonzalez            
*/

/*
    8. ¿Cuáles son las recetas con tiempo de preparación de menos de 30 minutos?
        a) Pizza casera, espagueti ala boloñesa     		// Correcto
        b) Pollo a la parrilla, hamburguesas caseras
        c) Espagueti ala boloñesa, arroz frito      		// Correcto
        d) Asado de cordero, hamburguesas caseras

	- tiempo preparacion NO CONTIENE LA PALABRA hora
*/

/* Recoger numeros de tiempo_preparacion */
SELECT SUBSTRING(tiempo_preparacion, 1, 2)
FROM recetas
WHERE tiempo_preparacion NOT LIKE ('%hora%');

/* Respuesta */
SELECT nombre
FROM recetas
WHERE tiempo_preparacion NOT LIKE ('%hora%')
	AND CAST(SUBSTRING(tiempo_preparacion, 1, 2) AS DECIMAL(10,2)) < 30;

/* 
	CASO ESPECIAL
    El tiempo_preparacion contiene una suma de minutos que en conjunto son menores a 30
    
    - Donde esta el simbolo +
    - Filtrar por recetas que no tienen 'hora'
    - Recoger substring con el primer numero
    - Recoger substring con el segundo numero
    - Sumar ambos numeros recogidos y verificar que son menores de 60 
*/
SELECT POSITION('+' IN tiempo_preparacion)
FROM recetas;

SELECT SUBSTRING(tiempo_preparacion, POSITION('+' IN tiempo_preparacion) + 2, 2)
FROM RECETAS
WHERE POSITION('+' IN tiempo_preparacion) > 0
	AND tiempo_preparacion NOT LIKE ('%hora%');


/*insert into recetas(id, nombre, ingredientes, preparacion, tiempo_preparacion, porciones)
values (19, 'ernesto', 'el sonido de su movil', 'no me lleves la contraria', '10 minutos + 6 minutos fuera de clase', 1);*/

SELECT *
FROM recetas
WHERE POSITION('+' IN tiempo_preparacion) > 0
	AND tiempo_preparacion NOT LIKE ('%hora%')
    AND SUBSTRING(tiempo_preparacion, 1,2) + SUBSTRING(tiempo_preparacion, POSITION('+' IN tiempo_preparacion) + 2, 2) < 30;

/*
    9. ¿Cuáles son los tipos de carne que ha comprado el cliente con ID 2?
        a) Chorizo y cangrejo       
        b) Chorizo y cordero
        c) cangrejo y ave
        d) Res y ave
        
        NO HAY UNA RESPUESTA CORRECTA
        e) Cerdo y cordero
*/

select * from ventas where cliente_id = 2;
/*
    10. ¿Cuáles son los nombres de los empleados que tienen un salario mayor a 2000?
        a) Juan Perez 
        b) Carlos Rodriguez                     // Correcto
        c) Juan Perez 
        d) Maria Gomez 
*/
SELECT nombre 
FROM empleados 
WHERE salario > 2000;

/*
    11. ¿Cuáles son los productos que se han vendido en el mes de enero?
        a) Res, cerdo, pollo
        b) Res, cerdo, cordero                  // Correcto
        c) Res, ave, pollo
        d) Cerdo, ave, cordero                  // Correcto
*/
SELECT DISTINCT productos 
FROM ventas 
WHERE fecha BETWEEN '2022-01-01' AND '2022-01-31';

/*
    12. ¿Cuál es el precio total de las ventas realizadas el día 2 de Enero?
        a) Entre 20 y 30 
        b) Entre 30 y 40                       // Correcta  
        c) Entre 40 y 50 
        d) Entre 50 y 60 
*/
select * from ventas;
SELECT precio FROM ventas WHERE fecha LIKE ('____-01-02');

/*
    13. ¿Cuáles son los tipos de carne más vendidos en el mes de enero?
        a) Res y Cerdo                          
        b) Res y Cordero                        
        c) Cerdo y Ave                          
        d) Res y Ave  
        
        NO EXISTE UNA RESPUESTA CORRECTA
        e) Salchicha y ave 
        
        - COUNT(*) ---> numero de veces que se vende
        - SUM(cantidad) ---> total de veces que se vende
*/
SELECT productos, SUM(cantidad)
FROM ventas
WHERE fecha LIKE('____-01-__')
GROUP BY productos
ORDER BY SUM(cantidad) DESC;

/*

    14. ¿Cuáles son los nombres de los clientes que han comprado carne de res?
        a) Juan Perez y Maria Gomez
        b) Carlos Rodriguez y Ana Lopez
        c) Juan Perez y Juana Martinez              // Correcta
        d) Maria Gomez y Ana Lopez
*/
SELECT nombre 
FROM clientes 
WHERE historial_compras LIKE '%Res%';


/*
    15. ¿Cuánto es el total de ventas del mes de marzo?
        a) $500
        b) $1000
        c) $1500
        d) No hay datos              // Correcta               
*/
SELECT SUM(precio) 
FROM ventas 
WHERE fecha BETWEEN '2022-03-01' AND '2022-03-31';

/*
    16. ¿Cuáles son los 3 productos más vendidos en el mes de enero?
        a) Salchicha, ave, cordero       		// Correcta
        b) Ave, cordero, cerdo           
        c) Conejo, ave, cerdo
        d) Chorizo, salchicha, cordero
        e) Salchicha, ave, cerdo				// Correcta
        
        - COUNT(*) ---> numero de veces que se vende
        - SUM(cantidad) ---> total de veces que se vende
*/
SELECT * FROM ventas;

SELECT productos, SUM(cantidad)
FROM ventas
WHERE fecha LIKE('____-01-__')
GROUP BY productos
ORDER BY SUM(cantidad) DESC;

/*
    17. ¿Cuáles son los empleados que tienen un salario mayor a $1000?
        a) Juan Perez, Maria Gomez				// Correcto
        b) Carlos Rodriguez, Ana Lopez
        c) Juan Perez, Carlos Rodriguez			// Correcto
        d) Maria Gomez, Ana Lopez
*/
SELECT nombre
FROM empleados
WHERE salario > 1000;

/*
    18. ¿Cuales son los puesto que tienen algun empleados por puesto con un salario mayor a $1200?
        a) Carnicero                        // Correcta
        b) Encargado                        
        c) Encargado de compras             // Correcta
        d) Cocinero                         
*/
SELECT puesto, COUNT(*)
FROM empleados
WHERE salario > 1200
GROUP BY puesto;

/*
    19. ¿Cuál es el cliente que hizo mas compras en el mes de febrero?
        a) Juan Perez
        b) Carlos Rodriguez
        c) No existen datos       				// Correcta              
        d) Juan Perez, Carlos Rodriguez
*/
SELECT cliente_id, COUNT(*)
FROM ventas
WHERE fecha LIKE('____-02-__');

/*
    20. ¿Cuál es el empleado contratado más recientemente?
        a) Juan Perez
        b) Maria Gomez
        c) Andres Rodriguez         // Correcto
        d) Ana Lopez
*/
/* Mas reciente */
SELECT nombre 
FROM empleados 
ORDER BY fecha_contratacion DESC LIMIT 1;

/*
    21. ¿Cuáles son los empleados contratados mas reciente y mas antiguamente?
        a) Juan Perez, Maria Gomez
        b) Maria Gomez, Andres Rodriguez
        c) Andres Rodriguez, Maria Gomez         
        d) Juan Perez, Andres Rodriguez    			// Correcto
        
        - hallar el id del mas reciente
        - hallar el id del mas antiguo
*/

/* Mas reciente */
SELECT id 
FROM empleados 
ORDER BY fecha_contratacion DESC LIMIT 1;

/* Mas antiguo */
SELECT id 
FROM empleados 
ORDER BY fecha_contratacion ASC LIMIT 1;

/* Mezclo subconsultas */
SELECT nombre
FROM empleados
WHERE id IN ((SELECT id 
	FROM empleados 
	ORDER BY fecha_contratacion DESC LIMIT 1), (SELECT id 
	FROM empleados 
	ORDER BY fecha_contratacion ASC LIMIT 1));
    
/* OPCION B */
SELECT nombre
FROM empleados
WHERE id = (SELECT id FROM empleados ORDER BY fecha_contratacion DESC LIMIT 1)
	OR id = (SELECT id FROM empleados ORDER BY fecha_contratacion ASC LIMIT 1);
/*
    22. ¿Cuál es el producto con fecha de vencimiento más cercana?
        a) Cangrejo                     // Correcto             
        b) Cerdo						// Correcto
        c) Ave							// Correcto
        d) Cordero						// Correcto
*/
SELECT fecha_vencimiento FROM productos;

/*
    23. ¿Cuántos tipos de productos diferentes hay en el inventario?
        a) 15						// Correcta
        b) 17
        c) 19
        d) 20                       
*/

SELECT * FROM productos;

SELECT COUNT(DISTINCT tipo) 
FROM productos;

/* No seria correcta puesto que no distingue si hay algun valor igual en el campo tipo */
SELECT DISTINCT COUNT( tipo) 
FROM productos;




/*
    24. ¿Cuál es el precio promedio de los productos?
        a) $12
        b) $13                      // Correcta    
        c) $14
        d) $15
*/
SELECT FLOOR(AVG(precio)) FROM productos;

/*
    25. ¿Cuál es el producto con el inventario más alto?
        a) Salchicha             // Correcto    
        b) Cerdo
        c) Ave
        d) Cordero
*/
SELECT tipo, inventario
FROM productos 
ORDER BY inventario DESC;

/*
    26. ¿Cuántos clientes han comprado carne de res?
        a) 1
        b) 2                            
        c) 3
        d) 4
*/
SELECT COUNT(*) 
FROM clientes 
WHERE historial_compras LIKE '%Res%';

/*
    27. ¿Cuántos empleados ganan más de $2000 al mes?
        a) 1                         // Correcto           
        b) 2
        c) 3
        d) 4
*/
SELECT COUNT(*) 
FROM empleados 
WHERE salario > 2000;

/*
    28. ¿Cuál es el producto más vendido en el mes de enero?
        a) Salchicha                        // Correcto
        b) Ave
        c) Cordero
        d) No hay dato disponibles
*/
SELECT productos, SUM(cantidad) 
FROM ventas 
WHERE fecha BETWEEN '2022-01-01' AND '2022-01-31' 
GROUP BY productos 
ORDER BY SUM(cantidad) DESC;

/*
    29. ¿Cuántas ventas se hicieron en el mes de febrero?
        a) 0                                // Correcta
        b) 2
        c) 3
        d) 4
*/
SELECT COUNT(*) 
FROM ventas 
WHERE fecha BETWEEN '2022-02-01' AND '2022-02-28';

/*
    30. ¿Cuántas recetas tienen un tiempo de preparación de más de 1 hora?
        a) 2				// Correcto
        b) 3                                    
        c) 4
        d) 5
        
        - count(*) 
        - like ('1 hora%')
        - tiempo > 1 hora
        
*/
SELECT * FROM recetas;

SELECT COUNT(*)
FROM recetas
WHERE tiempo_preparacion LIKE('%hora%')
	AND LENGTH(tiempo_preparacion) > 6;
    
  
/* Esta consulta da como resultado 3, por lo que no es correcta al coger el caso de '1 hora' */
SELECT COUNT(*) 
FROM recetas 
WHERE tiempo_preparacion LIKE('%hora%') 
	AND substring(tiempo_preparacion, 1, 2) >= 1;


/*
    31. ¿Cuántas recetas requieren de cebolla para su preparacion?
        a) 2
        b) 4
        c) 6
        d) 8                           // Correcta     
*/
SELECT count(*) 
FROM recetas 
WHERE ingredientes LIKE '%cebolla%';
/*
    32. ¿Cuáles son los nombres de las recetas que contienen la palabra "BBQ" en los ingredientes?
        a) Costillas BBQ                        // Costillas
        b) Asado BBQ
        c) Hamburguesa BBQ
        d) Pollo BBQ
*/
SELECT nombre 
FROM recetas 
WHERE ingredientes LIKE '%BBQ%';