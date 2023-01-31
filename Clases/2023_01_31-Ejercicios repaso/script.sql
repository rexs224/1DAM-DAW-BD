/*

GRUPO B

	Ejercicios sobre la base de datos 'concesionario'
    -	Manejo de fechas
    -	Manejo de cadenas
    -   Clausulas para el examen: 
		-	DISTINCT
		-	LIKE
		-	GROUP BY
		-	HAVING
		-	ORDER BY
*/
/*
	Selecciona los primeros cinco vendedores cuyo sueldo es igual o superior al sueldo promedio de todos los vendedores.
    
    SOLUCION: Ana y Antonio
*/
SELECT nombre
FROM vendedores
WHERE sueldo >= (SELECT AVG(sueldo) FROM vendedores) LIMIT 5;


/*
	Selecciona nombre y apellidos de los vendedores cuyo nombre contiene la palabra 'an'
    
    SOLUCION: Antonio Rodriguez, Ana Martinez, Blanca Perez
*/
SELECT nombre, apellidos
FROM vendedores
WHERE nombre LIKE '%an%';

/* 
	Selecciona  los modelos de coches que tienen un precio mayor a la media
    
    SOLUCION: varios coches (7)
*/
SELECT modelo
FROM coches
WHERE precio > (SELECT AVG(precio) FROM coches);

/*
	Selecciona los vendedores con sueldo mas alto por grupo
*/
SELECT grupo_id, MAX(sueldo)
FROM vendedores
GROUP BY grupo_id;

/*
	Selecciona los vendedores con sueldo mas alto por grupo y solo aquellos que tengan mas de 35000
*/
SELECT grupo_id, MAX(sueldo)
FROM vendedores
WHERE sueldo > 35000
GROUP BY grupo_id;

/* Mas correcta */
SELECT grupo_id, MAX(sueldo)
FROM vendedores
GROUP BY grupo_id
HAVING MAX(sueldo) > 35000;

/*
	Selecciona los vendedores con sueldo mas alto por cargo solo aquellos que cobren mas de 30.000
*/
SELECT cargo, MAX(sueldo)
FROM vendedores
WHERE sueldo > 30000
GROUP BY cargo;

SELECT cargo, MAX(sueldo)
FROM vendedores
GROUP BY cargo
HAVING MAX(sueldo) > 30000;

/*
	Seleccionar los clientes que compraron un modelo de coche con la letra 'a'
*/
SELECT nombre, apellidos
FROM clientes 
WHERE id IN(SELECT cliente_id FROM encargos WHERE coche_id IN(SELECT id FROM coches WHERE modelo LIKE '%a%'));

/*
	Seleccionar los grupos que tienen mas de 5 vendedores
    
    SIN RESULTADOS
    Se entiende que el enunciado pide el nombre del grupo y necesitamos que sea unico
*/
SELECT DISTINCT nombre
FROM grupos
WHERE id IN (SELECT grupo_id FROM vendedores GROUP BY grupo_id HAVING COUNT(nombre) > 5);

/*
	Seleccionar los clientes que compraron un coche que tiene un precio mayor a la media
*/
SELECT nombre, apellidos
FROM clientes
WHERE id IN(SELECT cliente_id FROM encargos WHERE coche_id IN (SELECT id FROM coches WHERE precio > (SELECT AVG(precio) FROM coches)));

/*
	Selecciona 3 clientes que han hecho un encargo con un coche con modelo con longitud superior a 6
*/
SELECT *
FROM clientes
WHERE id IN (SELECT cliente_id FROM encargos WHERE coche_id IN(SELECT id FROM coches WHERE LENGTH(modelo) > 6)) LIMIT 3;

/*
	Selecciona los vendedores que han atendido al menos a 2 clientes
*/
SELECT * 
FROM vendedores
WHERE id IN(SELECT vendedor_id FROM clientes GROUP BY vendedor_id HAVING COUNT(*) >= 2);

/*
	Selecciona el nombre de los grupos cuyos vendedores han realizado mas de 2 ventas 
    
    SIN RESULTADOS. Solo con el count > 0 aparece alguno
*/
SELECT *
FROM grupos
WHERE id IN(
	SELECT grupo_id FROM vendedores WHERE id IN(
		SELECT vendedor_id FROM clientes WHERE id IN (
			SELECT cliente_id FROM encargos GROUP BY cliente_id HAVING COUNT(*) > 2)));

/*
	Selecciona los 5 modelos de coche mas vendidos
    
    RESPUESTA parcialmente correcta puesto que hay 4 productos con dos ventas y el resto tienen 1 venta.
    Se puede observar esta afirmacion en la segunda consulta con los count(*) 
    
*/
SELECT modelo
FROM coches
WHERE id IN(SELECT coche_id FROM encargos GROUP BY coche_id ORDER BY COUNT(*) DESC LIMIT 5);

SELECT *, COUNT(*) FROM encargos GROUP BY coche_id ORDER BY COUNT(*) DESC;

/*
	Seleccionar nombre y apellidos de vendedores que han vendido al menos dos modelos diferentes de coches
*/
SELECT nombre, apellidos
FROM vendedores
WHERE id IN (
	SELECT vendedor_id FROM clientes WHERE id IN (
		SELECT cliente_id FROM encargos GROUP BY cliente_id HAVING COUNT(DISTINCT coche_id) >= 2));

/*
	Selecciona los nombres de los 5 ultimos coches comprados
*/
SELECT modelo
FROM coches
WHERE id IN (SELECT coche_id FROM encargos ORDER BY fecha DESC) LIMIT 5;


/*
	Selecciona el vendedor mas antiguo y el vendedor mas reciente
*/
SELECT nombre
FROM vendedores
WHERE fecha_inicio LIKE (SELECT MAX(fecha_inicio) FROM vendedores)
	OR fecha_inicio LIKE (SELECT MIN(fecha_inicio) FROM vendedores);
    
SELECT nombre
FROM vendedores
WHERE fecha_inicio IN ((SELECT MAX(fecha_inicio) FROM vendedores), (SELECT MIN(fecha_inicio) FROM vendedores));

SELECT nombre
FROM vendedores
WHERE fecha_inicio IN ((SELECT fecha_inicio FROM vendedores ORDER BY fecha_inicio ASC LIMIT 1), 
	(SELECT fecha_inicio FROM vendedores ORDER BY fecha_inicio DESC LIMIT 1));

/*
	Selecciona los nombres de los clientes que han realizado las ultimas 5 compras
*/
SELECT nombre
FROM clientes
WHERE id IN (SELECT cliente_id FROM encargos ORDER BY fecha DESC) LIMIT 5;

/*
	Selecciona nombres de los coches vendidos en los ultimos 30 dias
*/
SELECT modelo, marca
FROM coches
WHERE id IN (SELECT coche_id FROM encargos WHERE DATEDIFF(NOW(), fecha) < 30);

/*
	Selecciona los beneficios que habrá de cada modelo de coches que estan actualmente en el concesionario
*/
SELECT modelo, marca, SUM(precio * stock) AS 'Beneficio'
FROM coches
GROUP BY modelo, marca
ORDER BY SUM(precio * stock) DESC;
