use nba;

SELECT *
FROM jugadores;

/*
	ORDER BY
    Proporciona un orden a los datos de la consulta en funcion de un campo determinado.
	
    ASC		---> de menor a mayor
    DESC 	---> de mayor a menor
    
    El orden seria:
    - numerico: 0,1,2,...
    - caracteres: a,b,c,...
    - fechas: YYYY-MM-DD
*/

SELECT *
FROM jugadores
ORDER BY peso ASC;

SELECT *
FROM jugadores
ORDER BY peso DESC;

SELECT *
FROM jugadores
ORDER BY id DESC;

/*
	SUBCONSULTAS
    Consulta dentro de otra consulta
    
*/
SELECT * 
FROM estadisticas
WHERE puntos > (SELECT AVG(puntos) FROM estadisticas) AND temporada_id=2
ORDER BY puntos ASC;

/*
	Selecciona el id de los jugadores que:
    - promedian mas de 20 puntos
    - en la temporada mas reciente
    - deben salir en orden ascendente
*/
SELECT jugador_id
FROM estadisticas
WHERE puntos > 20 AND temporada_id = (SELECT MAX(id) FROM temporadas) -1
ORDER BY jugador_id DESC;

/*
	Selecccionar aquellos jugadores que:
    - hayan promediado mas de 20 puntos
    - en cualquier temporada
    - ordenalos de mayor a menor
*/
SELECT DISTINCT jugador_id
FROM estadisticas
WHERE puntos > 20
ORDER BY jugador_id DESC;

/*
	Seleccionar los jugadores con su datos (*)
    - tienen un promedio de rebotes mayor a la media
    - tienen un promedio de puntos menor a la media o un promedio de asistencias menor a la media
*/
SELECT DISTINCT *
FROM estadisticas
WHERE rebotes > (SELECT AVG(rebotes) FROM estadisticas) 
	AND (puntos < (SELECT AVG(puntos) FROM estadisticas) OR asistencias < (SELECT AVG(asistencias) FROM estadisticas));












