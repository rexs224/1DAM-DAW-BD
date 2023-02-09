/* Ejercicio: Selecciona todos los productos cuyo precio sea mayor que cualquier precio de los productos de la tabla "Productos".*/
SELECT *
FROM productos
WHERE precio > ANY(SELECT precio FROM productos);

SELECT *
FROM productos
WHERE precio > (SELECT MIN(precio) FROM productos);

/* Ejercicio: Selecciona todos los productos cuyo precio sea menor o igual que todos los precios de los productos de la tabla "Productos".*/
SELECT *
FROM productos 
WHERE precio <= ALL (SELECT precio from productos);

SELECT *
FROM productos
WHERE precio <= (SELECT MIN(precio) FROM productos);

/* Ejercicio: Selecciona todos los clientes que hayan realizado al menos una compra con un monto mayor que cualquier monto de las compras de la tabla "Ventas".*/
SELECT * 
FROM clientes
WHERE id IN (SELECT IDCliente FROM ventas WHERE monto > ANY(SELECT monto FROM ventas));

SELECT * 
FROM clientes
WHERE id IN (SELECT IDCliente FROM ventas WHERE monto > (SELECT MIN(monto) FROM ventas));

/* Ejercicio: Selecciona todos los clientes que hayan realizado al menos una compra con un monto menor o igual que todos los montos de las compras de la tabla "Ventas".*/
SELECT * 
FROM clientes
WHERE id IN (SELECT IDCliente FROM ventas WHERE monto <= ALL(SELECT monto FROM ventas));

SELECT * 
FROM clientes
WHERE id IN (SELECT IDCliente FROM ventas WHERE monto = (SELECT MIN(monto) FROM ventas));

/* Ejercicio: Selecciona todos los productos cuyo nombre tenga todas las letras que tenga algún producto de la tabla "Productos".*/
SELECT *
FROM productos 
WHERE nombre = ANY(SELECT nombre FROM productos);

SELECT *
FROM productos 
WHERE nombre IN (SELECT nombre FROM productos);

/* Ejercicio: Selecciona todos los clientes cuyo número de compras sea mayor que cualquier número de compras de los clientes de la tabla "Clientes".*/
SELECT IDCliente 
FROM ventas
GROUP BY IDCliente
HAVING COUNT(IDCliente) > ANY (SELECT COUNT(IDCliente) FROM ventas GROUP BY IDCliente);


/* Ejercicio: Selecciona todos los clientes cuyo número de compras sea menor o igual que todos los números de compras de los clientes de la tabla "Clientes".*/


/* Ejercicio: Selecciona todas las ventas cuyo monto total sea mayor que cualquier monto total de las ventas de la tabla "Ventas".*/


/* Ejercicio: Selecciona todas las ventas cuyo monto total sea menor o igual que todos los montos totales de las ventas de la tabla "Ventas".*/


