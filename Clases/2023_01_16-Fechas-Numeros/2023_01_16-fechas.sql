/* FECHAS */

/* 
	CURDATE()
	Devuelve fecha y hora de hoy en formato YYYY-MM-DD
 */
 SELECT CURDATE();
 
 /* 
	NOW()
    Devuelve fecha y hora de hoy en formato YYYY-MM-DD HH:MM:SS
 */
 SELECT NOW();
 
 /*
	YEAR(fecha): 				devuelve el año de una fecha dada
    MONTH(fecha): 				devuelve el mes de una fecha dada
    DAYOFMONTH(fecha): 			devuelve el dia del mes de una fecha dada
    DAYNAME(fecha): 			devuelve el dia de la semana de una fecha dada. Puedo operar dentro del parentes
    HOUR(fecha): 				devuelve la hora de una fecha dada.
    MINUTE(fecha): 				devuelve el minuto de una fecha dada.
    SECOND(fecha): 				devuelve el segundo de una fecha dada.
    LAST_DAY(fecha):			devuelve el ultima dia del mes
 */
SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT DAYOFMONTH(NOW());
SELECT DAYNAME(NOW());
SELECT HOUR(NOW());
SELECT MINUTE(NOW());
SELECT SECOND(NOW());

SELECT YEAR(CURDATE());
SELECT MONTH(CURDATE());
SELECT DAYOFMONTH(CURDATE());
SELECT DAYNAME(CURDATE());

/*
	Comparacion fechas
	DATEDIFF(fecha1, fecha2): resta la fecha2 a la fecha1 y devuelve el resultado en dias
	
    Sumar/restar fechas
    DATE_ADD(fecha, INTERVAL numero unidad): suma a una fecha determinada un intervalo de tiempo.
    DATE_SUB(fecha, INTERVAL numero unidad): resta a una fecha determinada un intervalo de tiempo.
*/
SELECT DATEDIFF(NOW(), '2023-01-10') AS diferencia;
SELECT DATE_ADD(NOW(), INTERVAL 5 DAY) AS 'fecha final';
SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH) AS 'fecha final';
SELECT DATE_ADD(DATE_ADD(NOW(), INTERVAL 4 HOUR), INTERVAL 2 DAY) AS 'fecha final';

SELECT DATE_ADD('2024-01-30', INTERVAL 1 MONTH) AS 'fecha final';

SELECT DATEDIFF(CURDATE(), '2023-01-10') AS diferencia;
SELECT DATE_ADD(CURDATE(), INTERVAL 5 DAY) AS 'fecha final';
SELECT DATE_ADD(CURDATE(), INTERVAL 5 DAY) AS 'fecha final';
SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH) AS 'fecha final';
SELECT DATE_ADD(CURDATE(), INTERVAL 4 HOUR) AS 'fecha final';

/* ACTIVIDAD 11. */

/* Ejercicio.   Selecciona la fecha actual:*/
 SELECT CURDATE();
 
/* Ejercicio.   Selecciona la fecha y hora actual:*/
 SELECT NOW();
 
/* Ejercicio.   Agrega 3 días a la fecha de cada persona en la tabla:*/
UPDATE personas
SET dates = DATE_ADD(dates, INTERVAL 3 DAY);
SELECT * FROM personas;

/* ISMAEL Ejercicio.   Resta 6 meses a la fecha de cada persona en la tabla:*/
UPDATE personas
SET dates = DATE_SUB(dates, INTERVAL 6 MONTH);

/* Ejercicio.   Calcula la cantidad de días entre la fecha de cada persona y la fecha actual:*/
SELECT DATEDIFF(NOW(), dates) as 'Diferencia en dias'
FROM personas;

/* JORGE Ejercicio.   Selecciona el nombre y el mes de cada persona en la tabla:*/
SELECT name, MONTH(dates)
FROM personas;

/* ALVARO Ejercicio.   Selecciona el nombre y el año de cada persona en la tabla:*/
SELECT name, YEAR(dates)
FROM personas;

/* LUCIA Ejercicio.   Selecciona el nombre y el día de la semana de cada persona en la tabla:*/
SELECT name, DAY(dates)
FROM personas;

SELECT name, DAYOFWEEK(dates)
FROM personas; 

SELECT name, DAYOFMONTH(dates)
FROM personas;

/* JONAS Ejercicio.   Selecciona el nombre y el día del mes de cada persona en la tabla:*/
SELECT name, DAYOFMONTH(dates)
FROM personas;

/* DAVID Ejercicio.   Selecciona solo las filas cuyas fechas son en enero:*/
SELECT * 
FROM personas
WHERE dates LIKE ('____-01-__');

SELECT * 
FROM personas
WHERE MONTH(dates) LIKE 01;

SELECT * 
FROM personas
WHERE MONTH(dates) IN (01);

SELECT * 
FROM personas
WHERE MONTH(dates) = 01;

/* ERNESTO Ejercicio.   Selecciona solo las filas cuyas fechas son en años pares:*/
SELECT *
FROM personas
WHERE YEAR(dates) % 2 = 0;

SELECT *
FROM personas
WHERE YEAR(dates) MOD 2 = 0;

/* DANIEL Ejercicio.   Selecciona solo las filas cuyas fechas son en fines de semana:*/
SELECT *
FROM personas
WHERE DAYNAME(dates) = 'Saturday' OR DAYNAME(dates) = 'Sunday';

SELECT *
FROM personas
WHERE DAYNAME(dates) IN ('Saturday', 'Sunday');

/* ANA Ejercicio.   Selecciona solo las filas cuyas fechas son el último día del mes:*/
SELECT LAST_DAY(dates)
FROM personas;

/* MARIO GARCIA Ejercicio.   Selecciona el promedio de la cantidad de días entre la fecha de cada persona y la fecha actual:*/
SELECT AVG(DATEDIFF(CURDATE(), dates)) as 'Promedio persona y fecha actual'
FROM personas;

/* Robayo Ejercicio.   Selecciona solo las filas cuyas fechas son en julio:*/
SELECT *
FROM personas
WHERE MONTH(dates) = 7;

SELECT *
FROM personas
WHERE MONTH(dates) IN(7);

SELECT *
FROM personas
WHERE MONTH(dates) LIKE (7);

/* MIGUEL Ejercicio.   Selecciona solo las filas cuyas fechas son en años impares:*/
SELECT *
FROM personas
WHERE YEAR(dates) % 2 = 1;

SELECT *
FROM personas
WHERE YEAR(dates) MOD 2 = 1;

SELECT *
FROM personas
WHERE YEAR(dates) MOD 2 LIKE(1);

SELECT *
FROM personas
WHERE YEAR(dates) MOD 2 IN(1);

/* MIGUEL(with help) Ejercicio.   Selecciona solo las filas cuyas fechas son en días hábiles:*/
SELECT *
FROM personas
WHERE DAYOFWEEK(dates) BETWEEN 2 AND 6;

SELECT *
FROM personas
WHERE DAYOFWEEK(dates) IN (2, 3, 4, 5, 6);

/* JORGE Ejercicio.   Selecciona solo las filas cuyas fechas son el primer día del mes:*/
SELECT *
FROM personas
WHERE DAY(dates) = 1;

SELECT *
FROM personas
WHERE DAYOFMONTH(dates) = 1;

/* VICTOR Ejercicio.   Selecciona el mínimo de la cantidad de días entre la fecha de cada persona y la fecha actual:*/
SELECT MIN(DATEDIFF(NOW(), dates)) AS 'Minimo fecha actual con campo dates'
FROM personas;

/* MARIO CRUZ Ejercicio.   Selecciona el máximo de la cantidad de días entre la fecha de cada persona y la fecha actual:*/
SELECT MAX(DATEDIFF(NOW(), dates)) AS 'Maximo fecha actual con campo dates'
FROM personas;

/* JORGE Ejercicio.   Selecciona el nombre y la fecha de cada persona en la tabla, ordenados por mes en orden ascendente:*/
SELECT name, dates
FROM personas 
ORDER BY MONTH(dates) ASC;

/* VICTOR Ejercicio.   Selecciona el nombre y la fecha de cada persona en la tabla, ordenados por año en orden descendente:*/
SELECT name, dates
FROM personas
ORDER BY YEAR(dates) DESC;

/* ROBAYO Ejercicio.   Selecciona el nombre y la fecha de cada persona en la tabla, ordenados por día de la semana en orden ascendente:*/
SELECT name, dates
FROM personas
ORDER BY DAYOFWEEK(dates) ASC;

/* DAVID Ejercicio.   Selecciona el nombre y la fecha de cada persona en la tabla, ordenados por día del mes en orden descendente:*/
SELECT name, dates
FROM personas
ORDER BY DAYOFMONTH(dates) DESC;

/* MARIO GARCIA Ejercicio: Selecciona el nombre y la fecha de cada persona en la tabla, filtrando solo las fechas de julio*/
SELECT name, dates
FROM personas
WHERE MONTH(dates) LIKE (7);

/* JAVIER Ejercicio: Selecciona el nombre y la fecha de cada persona en la tabla, filtrando solo las fechas del primer día del mes*/
SELECT name, dates
FROM personas
WHERE DAYOFMONTH(dates) = 1;

/* ISMAEL Ejercicio: Selecciona el promedio de la cantidad de días entre la fecha de cada persona y la fecha actual, filtrando solo las fechas de julio*/
SELECT AVG(DATEDIFF(NOW(), dates))
FROM personas
WHERE MONTH(dates) = 7;

/* ANA Ejercicio: Selecciona el mínimo de la cantidad de días entre la fecha de cada persona y la fecha actual, filtrando solo las fechas de años pares*/
SELECT MIN(DATEDIFF(CURDATE(), DATES))
FROM personas
WHERE YEAR(dates) MOD 2 = 0;

/* ERNESTO Ejercicio: Selecciona el máximo de la cantidad de días entre la fecha de cada persona y la fecha actual, filtrando solo las fechas de días hábiles*/
SELECT MAX(DATEDIFF(CURDATE(), DATES))
FROM personas
WHERE DAYOFWEEK(dates) BETWEEN 2 AND 6;

SELECT MAX(DATEDIFF(CURDATE(), DATES))
FROM personas
WHERE DAYNAME(dates) NOT IN ('Saturday', 'Sunday');