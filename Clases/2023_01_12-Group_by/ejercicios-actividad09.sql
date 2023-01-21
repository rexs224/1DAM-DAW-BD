/*
	SUBCONSULTAS
*/
use actividad09;

/* Ejercicio: Obtener el nombre de todos los clientes que hayan realizado alguna compra*/
SELECT nombre
FROM clientes
WHERE id IN (SELECT DISTINCT id_cliente FROM ventas);

/* HAY LIO. Compra en madrid¿?
Ejercicio: Obtener el nombre y la ciudad de todos los clientes que hayan realizado alguna compra en Madrid*/
SELECT nombre, ciudad
FROM clientes 
WHERE ciudad = 'Madrid';

/* Ejercicio: Obtener el nombre y el precio de todos los productos que no hayan sido comprados*/
SELECT nombre, precio
FROM productos
WHERE id NOT IN (SELECT DISTINCT id_producto FROM ventas);

INSERT INTO productos (nombre, precio, stock) VALUES ('Ordenador', 1555.50, 15);

/* HAY LIO. GROUP BY 
Ejercicio: Obtener el nombre de todos los clientes que hayan realizado alguna compra de más de 2 productos*/
SELECT nombre
FROM clientes
WHERE id IN (SELECT id_cliente FROM ventas WHERE cantidad > 2);

SELECT count(*)
FROM ventas
WHERE id_cliente = 3;

/* Ejercicio: Obtener el nombre y el precio de los productos que han sido comprados por al menos un cliente*/
SELECT nombre, precio 
FROM productos 
WHERE id IN (SELECT DISTINCT id_producto FROM ventas);

/* Ejercicio: Obtener el nombre de los clientes que no han realizado compras*/
SELECT nombre
FROM clientes 
WHERE id NOT IN (SELECT DISTINCT id_cliente FROM ventas);

/* Ejercicio: Obtener el nombre y el stock de los productos que tienen un stock mayor al promedio*/
SELECT nombre, stock
FROM productos
WHERE stock > (SELECT AVG(stock) FROM productos);

/* HAY LIO. No ciudades de compra.
Ejercicio: Obtener el nombre de los clientes que han realizado compras en todas las ciudades*/

/* Ejercicio: Obtener el nombre y el precio de los productos que han sido comprados por todos los clientes*/
SELECT nombre, precio
FROM productos;

SELECT DISTINCT id_producto FROM ventas;
/* Ejercicio: Obtener el nombre y la ciudad de los clientes que han realizado compras en todas las ciudades*/

/* Ejercicio: Obtener el nombre de los productos que han sido comprados por al menos un cliente de Madrid*/
