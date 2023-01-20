 
use actividad15;

/* Ejercicio : Muestra el número de clientes por ciudad y sólo aquellas ciudades que tengan más de 5 clientes.*/
SELECT ciudad, COUNT(*) AS 'total'
FROM clientes
GROUP BY ciudad
HAVING COUNT(*) > 5;

/* Ejercicio : Muestra el número de productos vendidos por cada vendedor, y sólo aquellos vendedores que hayan vendido más de 50 productos.*/
SELECT vendedor, SUM(cantidad)
FROM ventas
GROUP BY vendedor
HAVING SUM(cantidad) > 50;

/* Ejercicio : Muestra el número de pedidos realizados por cada cliente en el último año, y sólo aquellos clientes que hayan realizado más de 10 pedidos.*/
/* Esta solucion tiene en cuenta todo el periodo del año 2022 */
SELECT cliente, COUNT(*), fecha
FROM pedidos
WHERE YEAR(fecha) = YEAR(NOW()) - 1
GROUP BY cliente
HAVING COUNT(*) > 10;

/* Esta solucion tiene en cuenta los ultimos 365 dias */
SELECT cliente, COUNT(*), fecha
FROM pedidos
WHERE DATEDIFF(NOW(), fecha) <= 365
GROUP BY cliente
HAVING COUNT(*) > 10 ;

/* Esta solucion tiene en cuenta todo el periodo del año 2022 */
SELECT cliente, COUNT(*), fecha
FROM pedidos
WHERE fecha LIKE ('2022-__-__')
GROUP BY cliente
HAVING COUNT(*) > 10;

/* Ejercicio : Muestra el número de productos vendidos por cada categoría, y sólo aquellas categorías que hayan tenido más de 100 ventas.*/
SELECT categoria_id, SUM(cantidad) AS num_productos
FROM ventas
GROUP BY categoría
HAVING SUM(cantidad) > 100;

/* Ejercicio : Muestra el número de empleados por departamento y sólo aquellos departamentos que tengan más de 5 empleados.*/
SELECT departamento, COUNT(*) AS 'Total Empleados'
FROM empleados
GROUP BY departamento
HAVING COUNT(*) > 5;

/* Ejercicio : Muestra el total de ventas por vendedor y sólo aquellos vendedores que hayan generado más de $1,000 en ventas.*/
SELECT vendedor, SUM(cantidad * precio) AS 'TOTAL VENTAS'
FROM ventas
GROUP BY vendedor
HAVING SUM(cantidad * precio) > 1000;

/* Ejercicio : Muestra el total de ventas por vendedor y sólo aquellos vendedores que hayan generado más de 
$500 en ventas en el último mes.*/
SELECT vendedor, SUM(cantidad * precio) AS 'TOTAL VENTAS'
FROM ventas
WHERE MONTH(fecha) = 12 AND YEAR(fecha) = 2022 
GROUP BY vendedor
HAVING SUM(precio * cantidad) > 500;


SELECT vendedor, SUM(cantidad * precio) AS 'TOTAL VENTAS'
FROM ventas
WHERE DATEDIFF(NOW(), fecha) <= 30 
GROUP BY vendedor
HAVING SUM(precio * cantidad) > 500;

/* Ejercicio : Muestra el número de clientes por ciudad y sólo aquellas ciudades que tengan más de 3 clientes y menos de 8 clientes.*/
SELECT ciudad, COUNT(*) AS 'TOTAL'
FROM clientes
GROUP BY ciudad
HAVING COUNT(*) BETWEEN 3 AND 8;

/* Ejercicio : Muestra el total de ventas por categoría y sólo aquellas categorías que hayan generado más de $200 en ventas en el último año.*/
SELECT categoria_id, SUM(cantidad * precio) AS 'TOTAL'
FROM ventas
WHERE DATEDIFF(NOW(), fecha) <= 365
GROUP BY categoria_id
HAVING SUM(cantidad * precio) > 200;

/* Ejercicio : Muestra el número de empleados por departamento y sólo aquellos departamentos que tengan menos de 6 empleados.*/
SELECT departamento, COUNT(*) AS 'TOTAL'
FROM empleados
GROUP BY departamento
HAVING COUNT(*) < 6;