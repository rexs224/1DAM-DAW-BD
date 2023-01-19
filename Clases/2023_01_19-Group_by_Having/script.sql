use nba;

/*
	GROUP BY
    Se utiliza para agrupar resultados segun uno o mas campos especificos.
    
    Sintaxis:
    SELECT campo, funcion
    FROM tabla
    GROUP BY campo
    [ORDER BY funcion]
    
    donde:
    -	campo: es la columna de la tabla por la quiero ordenar.
    -	los elementos que estan dentro de cochetes son opcionales (ordenacion)
    
    Es habitual utilizar una de las funciones de agregacion en conjuncion con el GROUP BY para obtener resultados mas detallados.
    SUM(), COUNT(), AVG(), MIN(), MAX()
        
*/

/* Ejemplo: selecciona el numero de jugadores que contiene cada equipo ordenados de mayor a menor */
SELECT equipo_id,count(*) AS 'total'
FROM jugadores
GROUP BY equipo_id
ORDER BY total DESC;

/* Selecciona el numero de estadisticas por temporada */
SELECT temporada_id, count(*)
FROM estadisticas
GROUP BY temporada_id;

/* Obtener numero total de puntos por temporada */
SELECT temporada_id, sum(puntos)
FROM estadisticas
GROUP BY temporada_id;

/* Obtener el promedio de puntos por temporada */
SELECT temporada_id, AVG(puntos)
FROM estadisticas
GROUP BY temporada_id;

/* Obtener el promedio de puntos y rebotes por temporada y jugador */
SELECT temporada_id, jugador_id, CAST(AVG(puntos) AS DECIMAL(10,2)) AS 'puntos', CAST(AVG(rebotes) AS DECIMAL(10,2)) AS 'rebotes'
FROM estadisticas
GROUP BY temporada_id, jugador_id;

/* Obtener el minimo de puntos de un jugador por temporada */
SELECT temporada_id, MAX(puntos)
FROM estadisticas
GROUP BY temporada_id;

SELECT *
FROM jugadores
WHERE id = (SELECT jugador_id FROM estadisticas WHERE puntos = 45);

/* Obtener el numero de jugadores por procedencia */
SELECT procedencia, equipo_id, count(*)
FROM jugadores
GROUP BY procedencia, equipo_id;

/* 
	HAVING
    Realiza la funcion del where sobre los elementos que tengamos en el GROUP BY
*/
use nba;
SELECT procedencia, equipo_id, count(*)
FROM jugadores
GROUP BY procedencia, equipo_id
HAVING count(*) > 3;
 