/*
PREGUNTAS SIN GROUP BY

1. Pregunta: ¿Cuáles son los nombres de los clientes que compraron productos en la tienda entre el 1 de enero y el 15 de enero del año 2022 y cuya compra fue de un monto mayor a $300?

	Respuestas posibles:
	A) Javier Sanchez, Andres Martinez, Adriana Gómez
	B) Juan Pérez, Maria González, Pedro Martínez
	C) Andres Martinez, Sofia Gomez, Javier Sanchez
	D) Sofia Rodríguez, Carlos López, Paula Hernández
	E) Luis García, Andres Martinez, Paula Hernández

	Consulta: SELECT DISTINCT nombre, apellido FROM clientes
	WHERE id IN (
		SELECT cliente_id FROM ventas 
		WHERE fecha BETWEEN '2022-01-01' AND '2022-01-15' AND total > 300
	)
	Respuesta correcta: C


2. Pregunta: ¿Cuáles son los nombres de los productos que se han vendido en una cantidad mayor a 2 y cuya categoria es futbol?

	Respuestas posibles:
	A) Pelota de futbol, Camiseta de futbol
	B) Raqueta de tenis, Balon de basquetbol
	C) Zapatillas de tenis, Pelota de futbol
	D) Pelota de futbol, Zapatillas de tenis, Raqueta de tenis
	E) Pelota de futbol, Camiseta de futbol, Zapatillas de tenis

	Consulta:
		SELECT DISTINCT nombre FROM productos
		WHERE categoria_id = (SELECT id FROM categorias WHERE nombre = 'Futbol')
		AND id IN (SELECT producto_id FROM detalles_ventas WHERE cantidad >= 2);

	Respuesta correcta: C

3. Pregunta: ¿Cuáles son los nombres de los clientes que compraron productos de la marca "Adidas" y cuya compra fue de un monto mayor a $200?

	Respuestas posibles:
	A) Juan Pérez
	B) Carlos López
	C) Maria González
	D) Adriana Gómez
	E) Pedro Martínez

	Consulta:
		SELECT DISTINCT nombre,apellido
		FROM clientes 
		WHERE id in (SELECT cliente_id FROM ventas WHERE id in 
			(SELECT venta_id FROM detalles_ventas WHERE producto_id in 
				(SELECT id FROM productos WHERE marca_id in (select id from marcas where nombre = "Adidas"))AND precio*cantidad > 200))
		ORDER BY apellido ASC;

	Respuesta correcta: E


4. Pregunta: ¿Cuáles son los nombres de los empleados que han hecho mas ventas en entre el 1 de febrero y el 3 de febrero del año 2022 y cuya venta fue de un monto mayor a $1000?

	Respuestas posibles:
	A) Juan, Pedro, Luis
	B) Andres, Camila, Diego
	C) Carlos, Adrian, Paula
	D) Juan, Pedro, Carlos
	E) Luis, Ana, Adrian

	Consulta:
		SELECT DISTINCT nombre
		FROM empleados
		WHERE id IN (SELECT empleado_id FROM ventas 
			WHERE fecha BETWEEN '2022-02-01' AND '2022-02-03' AND total > 1000)
		ORDER BY nombre ASC;

	RESPUESTA CORRECTA: B

5. Pregunta: ¿Cuáles son los nombres de los productos cuyo precio es mayor a $50 y cuya categoria es Tenis?

	Respuestas posibles:
	A) Zapatillas de tenis, playera de tenis
	B) Calcetines de tenis, Raqueta de tenis
	C) Camiseta de tenis, Zapatillas de tenis
	D) Zapatillas de tenis, Gorra de tenis, playera de tenis
	E) Zapatillas de tenis, Raqueta de tenis

	Consulta:select nombre from productos where precio > 50 && categoria_id = (select id from categorias where nombre = "Tenis");
	Respuesta correcta: E

6. ¿Cuál es el nombre del empleado que ha realizado la mayor cantidad de ventas?
	A) Juan
	B) Camila
	C) Luis
	D) Ana
	E) Sofia

     Consulta: select nombre from empleados where id in (select empleado_id from ventas group by empleado_id order by count(*) desc);
	Respuesta correcta: A, B, C, D, E

7. ¿Cuál es el total de ventas realizadas en el mes de enero de 2022?
	A) $22000
	B) $32000
	C) $42000
	D) $52000
	E) $62000

    Consulta: select sum(total) from ventas where fecha like ("2022-01-__");
	Respuesta correcta: E

8. ¿Cuáles son los nombres de los clientes que han comprado al menos un producto de la categoria "Tenis"?
	A) Juan Pérez, Ana Sánchez, Sofia Rodríguez
	B) Carlos López, Paula Hernández, Luis García
	C) Pedro Martínez, Carlos Garcia, Adriana Perez
	D) Adriana Gómez, Juan Pérez, Maria González
	E) Maria González, Pedro Martínez, Ana Sánchez

    Consulta:
		SELECT DISTINCT nombre,apellido FROM clientes 
		WHERE id in (SELECT cliente_id FROM ventas
		WHERE id in (SELECT venta_id FROM detalles_ventas
		WHERE producto_id in (SELECT productos.id
		FROM productos WHERE productos.categoria_id=(SELECT id FROM categorias WHERE nombre='Tenis'))))
		ORDER BY apellido ASC;

	Respuesta correcta: C

9. ¿Cuáles son los nombres de los productos cuyo stock es menor a 10 unidades?
	A) Zapatillas de running
	B) Pelota de futbol
	C) Remo de canoa
	D) Zapatillas de running
	E) Pelota de futbol

    Consulta:SELECT nombre FROM productos
	WHERE stock < 10;

	RESPUESTA CORRECTA: C

10. ¿Cuál es el nombre del cliente que ha realizado la mayor cantidad de compras?
	A) Juan Pérez
	B) Alejandro Hernandez
	C) Maria González
	D) Pedro Martínez
	E) Adriana Gómez

    Consulta:
	SELECT nombre, apellido FROM clientes
	WHERE id = (SELECT cliente_id FROM ventas
	GROUP BY cliente_id ORDER BY COUNT(*) DESC);

	Respuesta correcta: A, B, D

11. ¿Cuál es el total de ventas realizadas en el año 2022?
	A) $99000
	B) $98000
	C) $97000
	D) $88000
	E) $87000

    Consulta: 
	SELECT SUM(total) FROM ventas
	WHERE fecha BETWEEN '2022-01-01' AND '2022-12-31';

	RESPUESTA CORRECTA: B

12. ¿Cuáles son los nombres de los empleados que han realizado ventas con un monto mayor a $1000 en el mes de febrero?
	A) Facundo Gonzalez, Valeria Gonzalez, Diego Gonzalez
	B) Ana Martinez, Ximena Sanchez, Alicia Martinez
	C) Jessica Perez, Adrian Sanchez, Facundo Gonzalez
	D) Facundo Gonzalez, Valeria Gonzalez, Jessica Perez
	E) Diego Gonzalez, Sebastian Rodriguez, Facundo Gonzalez

    Consulta:
		SELECT nombre, apellido
		FROM empleados
		WHERE id IN(SELECT empleado_id FROM ventas WHERE total > 1000 AND fecha LIKE('____-02-__'));

	Consulta 2:
		SELECT DISTINCT nombre, apellido
		FROM empleados
		WHERE id IN (SELECT empleado_id FROM ventas
		WHERE fecha BETWEEN '2022-02-01' AND '2022-02-30' AND total > 1000)
		ORDER BY nombre ASC;

	Respuesta correcta: E
	 
13. ¿Cuáles son los nombres de los productos cuyo precio es menor a $30 y cuya marca es "Adidas"?
	A) Zapatillas de running
	B) Pelota de futbol
	C) Camiseta de futbol
	D) Zapatillas de running
	E) Pelota de futbol

    Consulta:
		SELECT nombre 
		FROM productos 
		WHERE marca_id IN(SELECT id FROM marcas WHERE nombre = 'Adidas');

	Consulta 2:
		SELECT DISTINCT nombre 
		FROM productos
		WHERE precio < 30 AND marca_id IN (SELECT id FROM marcas WHERE nombre = 'Adidas')
		ORDER BY nombre ASC;

	Respuesta correcta: B, E
	
14. ¿Cuál es el total de compras realizadas por los clientes con apellido "Garcia" en el año 2022?
	A) $4900
	B) $4800
	C) $5800
	D) $5900
	E) $7900

	Consulta:
	 	SELECT SUM(total)
		FROM ventas
		WHERE cliente_id IN(SELECT id FROM clientes WHERE apellido = 'Garcia');

	Consulta 2:
		SELECT SUM(total)
		FROM ventas
		WHERE cliente_id in (SELECT id FROM clientes
		WHERE apellido like 'Garcia%' ) AND fecha BETWEEN '2022-01-01' AND '2022-12-31';

	Respuesta correcta: D

15. ¿Cuál es la cantidad total de productos de la marca "Nike" comprados por el cliente con id=2?
	A) 1
	B) 2
	C) 3
	D) 4
	E) 5

    Consulta:
		SELECT SUM(cantidad)
		FROM detalles_ventas 
		WHERE producto_id IN (SELECT id FROM productos
		WHERE marca_id = (SELECT id FROM marcas WHERE nombre = 'Nike'))
		AND venta_id IN (SELECT id FROM ventas WHERE cliente_id = 2);

	RESPUESTA CORECTA: A


16. ¿Cuáles son los nombres de los productos cuyo precio es mayor a $50 y el stock es menor a 5?
	A) Zapatillas de running
	B) Ninguno 
	C) Camiseta de futbol
	D) Zapatillas de running
	E) Pelota de futbol

	Consulta:
		SELECT nombre FROM productos
		WHERE precio > 50 AND stock < 5
		ORDER BY nombre ASC;

	RESPUESTA: B

17. ¿Cuál es el total de compras realizadas por los clientes con edad entre 20 y 30 años?
	A) Mayor a $15000 y menor a $16000
	B) Mayor a $16000 y menor a $17000
	C) Mayor a $17000 y menor a $18000
	D) Mayor a $18000 y menor a $19000
	E) Mayor a $19000 y menor a $20000

	Consulta:
	SELECT SUM(total) FROM ventas
	WHERE cliente_id IN (SELECT id FROM clientes
	WHERE FLOOR(DATEDIFF(NOW(), fecha_nacimiento)/365) BETWEEN 20 AND 30);

	Respuesta correcta: Ninguna, resultado 12.400


18. ¿Cuáles son los nombres de los empleados que no han realizado ninguna venta en la segunda quincena del mes de enero de 2022?
	A) Adrian Sanchez, Andres Perez, Luis Mendoza
	B) Camila Garcia, Sofia Martinez, Alicia Martinez
	C) Diego Gonzalez, Adrian Sanchez, Diego Sanchez
	D) Adrian Sanchez, Andres Perez, Diego Gonzalez
	E) Luis Mendoza, Camila Garcia, Adrian Mendoza

	Consulta: 
		SELECT nombre, apellido
		FROM empleados
		WHERE NOT EXISTS (SELECT * FROM ventas WHERE empleado_id = id AND fecha BETWEEN '2022-01-16' AND '2022-01-30')
		ORDER BY nombre ASC;

	RESPUESTA CORRECTA: D


19. ¿Cuál es el nombre del producto con el mayor precio en la categoria 'Futbol'?
	A) Zapatillas de running
	B) playera de running
	C) Pelota de futbol
	D) Raqueta de tenis
	E) Camiseta de futbol

	Consulta:
		SELECT productos.nombre FROM productos
		WHERE productos.categoria_id = (SELECT id FROM categorias WHERE nombre = 'Futbol')
		ORDER BY productos.precio DESC
		LIMIT 1;

	Respuesta correcta: A


20. ¿Cuál es la suma del stock de todos los productos con categoria "Tenis"?
	A) 105
	B) 106
	C) 108
	D) 111
	E) 110

    Consulta: 
	SELECT SUM(productos.stock) FROM productos
	WHERE productos.categoria_id = (SELECT id FROM categorias WHERE nombre = 'Tenis');

	Solucion: E


21. ¿Cuáles son los nombres de los productos tres productos con menor precio que tengan un stock mayor a 15 y precio menor a 40 ordenados por precio?
	A) Zapatillas de running, playera de running
	B) Pelota de futbol, Raqueta de tenis
	C) Mochila de senderismo, Balon de basquetbol, Camiseta de futbol
	D) Zapatillas de running, Gorra de running, playera de running
	E) Pelota de futbol, Zapatillas de tenis, Raqueta de tenis

	Consulta:

		SELECT nombre FROM productos
	WHERE stock > 15 AND precio < 40
	ORDER BY precio DESC
	LIMIT 3;

	Respuesta correcta: C

22. ¿Cuáles son los nombres de los clientes que han realizado compras al empleado 'Sofia Sanchez' y cuyo nombre comienza con la letra "M"?
	A) Maria
	B) Juan
	C) Carlos
	D) Juan
	E) Luis

	Consulta:

	select nombre 
	from clientes 
	where id in (select cliente_id from ventas where empleado_id in
		(select id from empleados where nombre="Sofia" and apellido="Sanchez")) and nombre like ('M%');
    
	Respuesta correcta: Ninguna, resultado vacio


23. ¿Cuál es el nombre del producto mas vendido en una sola venta?
	A) Pelota de fubol
	B) Raqueta de tenis
	C) Zapatillas de running
	D) Camiseta de futbol
	E) Botas de futbol

    Consulta: 
		SELECT nombre
		FROM productos 
		WHERE id IN (SELECT producto_id FROM detalles_ventas ORDER BY cantidad DESC LIMIT 1);

	Respuesta correcta: A


24. ¿Cuáles son los nombres de los productos con stock menor a 5 y que no pertenecen a la categoria "Ropa"?
	A) Zapatillas de running, playera de running
	B) Pelota de futbol, Raqueta de tenis
	C) Camiseta de futbol, Zapatillas de basquetbol
	D) Ninguno
	E) Pelota de futbol, Zapatillas de tenis, Raqueta de tenis
     
    Consulta:
		SELECT nombre FROM productos
		WHERE stock < 5 AND categoria_id != (SELECT id FROM categorias WHERE nombre = 'Ropa')
		ORDER BY nombre ASC;

	Respuesta correcta: D


 PREGUNTAS CON GROUP BY y HAVING

25.	¿Cuántos clientes hay por cada año de nacimiento en la tabla 'clientes'?
	a) 2020, 1 cliente
	b) 2002, 1 cliente
	c) 1994, 1 cliente
	d) 1990, 3 clientes

    Consulta: 
	SELECT YEAR(fecha_nacimiento) as year, COUNT(*) FROM clientes GROUP BY year;

	Respuesta correcta: B, C, D

26.	¿Cuántos clientes hay por cada década de nacimiento en la tabla 'clientes'?
	a) 1980, 4 clientes
	b) 1990, 11 clientes
	c) 2000, 4 clientes
	d) 2010, 3 clientes

    Consulta: 
	SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(*) FROM clientes GROUP BY decade;

	Respuesta correcta: B, C 

27.	¿Cuántos clientes hay por cada década de nacimiento que tienen más de un cliente?
	a) 1980, 4 clientes
	b) 1990, 11 clientes
	c) 2000, 4 clientes
	d) 2010, 3 clientes

    Consulta:
	SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(*) FROM clientes GROUP BY decade HAVING COUNT(*) > 1;

	Respuesta correcta: B, C

28.	¿Cuántas categorías hay por cada letra (primera letra de cada categoria) del nombre en la tabla 'categorias'?
	a) C, 3 categorias
	b) E, 1 categoria
	c) G, 1 categoria
	d) N, 1 categoria

    Consulta:
		SELECT LEFT(nombre,1) as letter, COUNT(*) FROM categorias GROUP BY letter;

	Respuesta correcta: A, B

29.	¿Cuántas categorías hay por cada letra (primera letra de cada categoria) del nombre que tienen más de una categoría?
	a) C, 3 categorias
	b) E, 1 categoria
	c) G, 1 categoria
	d) N, 1 categoria

    Consulta:
	SELECT LEFT(nombre,1) as letter, COUNT(*) FROM categorias GROUP BY letter HAVING COUNT(*) > 1;

	Respuesta correcta: A

30.	¿Cuál es el número de clientes por cada día de la semana en la tabla 'clientes'?
	a) Tuesday, 1 cliente
	b) Sunday, 4 clientes
	c) Monday, 1 cliente
	d) Thursday, 4 clientes

    Consulta:
	SELECT DAYNAME(fecha_nacimiento) as day, COUNT(*) FROM clientes GROUP BY day;

	Respuesta correcta: D

31.	¿Cuántas categorías hay en total en la tabla 'categorias'?
	a) 17
	b) 18
	c) 19
	d) 20

    Consulta:
	SELECT COUNT(DISTINCT nombre) FROM categorias;

	Respuesta correcta: A

32.	¿Cuántos clientes hay por cada mes de nacimiento en la tabla 'clientes'?
	a) December, 2 clientes
	b) July, 1 cliente
	c) June, 1 cliente
	d) April, 2 clientes

    Consulta:
	SELECT MONTHNAME(fecha_nacimiento) as month, COUNT(*) FROM clientes GROUP BY month;

	Respuesta correcta: A y D

33.	¿Cuántos clientes hay por cada año de nacimiento que tienen un número de teléfono con más de 10 dígitos en la tabla 'clientes'?
	a) 1985, 1 cliente
	b) 1992, 3 clientes
	c) 1988, 1 cliente
	d) 1989, 1 cliente

    Consulta:
	
	SELECT YEAR(fecha_nacimiento) as year, COUNT(*) FROM clientes WHERE LENGTH(telefono) > 10 GROUP BY year;

	Respuesta correcta: A, B, C, D

34.	¿Cuántos clientes hay por cada año de nacimiento y que tienen el apellido "Garcia" en la tabla 'clientes'?
	a) 1986, 1 cliente
	b) 1990, 2 clientes
	c) 1993, 1 cliente
	d) 2000, 2 clientes

    Consulta:
		SELECT YEAR(fecha_nacimiento) as year, COUNT(*) FROM clientes WHERE apellido='Garcia' GROUP BY year;

	Respuesta correcta: A, C

35.	¿Cuántos clientes hay por cada año de nacimiento y que tienen el correo electrónico que contiene "gmail" en la tabla 'clientes'?
	a) 2001, 2 clientes
	b) 2000, 1 cliente
	c) 1999, 1 cliente
	d) 1996, 1 cliente

    Consulta:
	SELECT YEAR(fecha_nacimiento) as year, COUNT(*) FROM clientes WHERE correo LIKE '%gmail%' GROUP BY year;

	Respuesta correcta: D


36.	¿Cuántos clientes hay por cada mes de nacimiento y que tienen el número de teléfono que empieza con "555" en la tabla 'clientes'?
	a) January, 1 cliente
	b) February, 2 clientes
	c) March, 1 cliente
	d) April, 2 clientes

    Consulta:
	SELECT MONTHNAME(fecha_nacimiento) as month, COUNT(*) FROM clientes WHERE telefono LIKE '555%' GROUP BY month;

	Respuesta correcta: A, C, D

37.	¿Cuántos clientes hay por cada día de la semana de nacimiento y que tienen fecha de nacimiento antes del 1 de Enero de 1990 en la tabla 'clientes'?
	a) Tuesday, 1 cliente
	b) Wedenesday, 1 cliente
	c) Thursday, 2 clientes
	d) Friday, 1 cliente

    Consulta:
		SELECT DAYNAME(fecha_nacimiento) as day, COUNT(*) 
		FROM clientes 
		WHERE fecha_nacimiento < '1990-01-01' GROUP BY day;

	Respuesta correcta: D

38.	¿Cuántos clientes únicos hay por cada año de nacimiento en la tabla 'clientes'?
	a) 1988, 1 cliente
	b) 1989, 1 cliente
	c) 1990, 2 clientes
	d) 1991, 2 clientes 

    Consulta:
		SELECT YEAR(fecha_nacimiento) as year, COUNT(DISTINCT id) 
		FROM clientes 
		GROUP BY year;

	Respuesta correcta: A, B, D

39.	¿Cuántos clientes hay por cada año de nacimiento y que tienen el correo electrónico que contiene "gmail" y el número de teléfono que empieza con "555" en la tabla 'clientes'?
	a) 1988, 1 cliente
	b) 1989, 1 cliente
	c) 1990, 2 clientes
	d) 1991, 2 clientes 

    Consulta:
		SELECT YEAR(fecha_nacimiento) as year, COUNT(*) 
		FROM clientes 
		WHERE correo LIKE '%gmail%' AND telefono LIKE '555%' GROUP BY YEAR(fecha_nacimiento);

	Respuesta correcta: A, B, D

40.	¿Cuántos clientes hay por cada día de la semana de nacimiento y que tienen fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 en la tabla 'clientes'?
	a) Tuesday, 1 cliente
	b) Wednesday, 2 clientes
	c) Thursday, 2 clientes
	d) Friday, 1 cliente

    Consulta:
		SELECT DAYNAME(fecha_nacimiento) as day, COUNT(*) 
		FROM clientes 
		WHERE fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY DAYNAME(fecha_nacimiento);

	Respuesta correcta: B

41.	¿Cuántos clientes hay por cada mes de nacimiento y que tienen el apellido "Garcia" y el correo electrónico que contiene "gmail" en la tabla 'clientes'?
	a) March
	b) April
	c) November
	d) December

    Consulta:
	SELECT MONTHNAME(fecha_nacimiento) as month, COUNT(*) FROM clientes WHERE apellido='Garcia' AND correo LIKE '%gmail%' GROUP BY month;

	Respuesta correcta: B, D

42.	¿Cuántos clientes únicos hay por cada década de nacimiento y que tienen el número de teléfono que empieza con "555" en la tabla 'clientes'?
	a) 1980, 3 clientes
	b) 1990, 2 clientes
	c) 2000, 1 cliente
	d) 2010, 0 clientes

    Consulta: 
	SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(DISTINCT id) FROM clientes WHERE telefono LIKE '555%' GROUP BY decade;

	Respuesta correcta: A, D

43.	¿Cuántos clientes hay por cada mes de nacimiento y que tienen el apellido "Garcia" o el correo electrónico que contiene "gmail" en la tabla 'clientes'?
	a) April, 1 cliente
	b) December, 2 clientes
	c) February, 1 cliente
	d) January, 2 clientes

    Consulta: 
	SELECT MONTHNAME(fecha_nacimiento) as month, COUNT(*) FROM clientes WHERE apellido='Garcia' OR correo LIKE '%gmail%' GROUP BY month;

	Respuesta correcta: B


44.	¿Cuántos clientes hay por cada año de nacimiento y que tienen el apellido "Garcia" y una fecha de nacimiento antes del 1 de Enero de 1990 en la tabla 'clientes'?
	a) 1985, 1 cliente
	b) 1986, 1 cliente
	c) 1987, 1 cliente
	d) 1988, 1 cliente

    Consulta:
	SELECT YEAR(fecha_nacimiento) as year, COUNT(*) FROM clientes WHERE apellido='Garcia' AND fecha_nacimiento < '1990-01-01' GROUP BY year;

	Respuesta correcta: B

45.	¿Cuántos clientes hay por cada año de nacimiento y que tienen el correo electrónico que contiene "gmail" y una fecha de nacimiento después del 1 de Enero de 2000 en la tabla 'clientes'?
	a) 1985, 1 cliente
	b) 1986, 1 cliente
	c) 2000, 1 cliente
	d) 2001, 1 cliente

    Consulta: 
		SELECT YEAR(fecha_nacimiento) as year, COUNT(*) 
		FROM clientes 
		WHERE correo LIKE '%gmail%' AND fecha_nacimiento > '2000-01-01' GROUP BY YEAR(fecha_nacimiento);

	Respuesta correcta: D

46.	¿Cuántos clientes hay por cada mes de nacimiento y que tienen el número de teléfono que empieza con "555" y una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 en la tabla 'clientes'?
	a) December, 1 cliente
	b) April, 1 cliente
	c) May, 1 cliente
	d) October, 2 clientes

    Consulta:
		SELECT MONTHNAME(fecha_nacimiento) as month, COUNT(*) 
		FROM clientes 
		WHERE telefono LIKE '555%' AND fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01' 
		GROUP BY MONTHNAME(fecha_nacimiento);

	Respuesta correcta: C

47.	¿Cuántos clientes hay por cada década de nacimiento y que tienen el apellido "Garcia" y el correo electrónico que contiene "gmail" en la tabla 'clientes'?
	a) 1980, 1 cliente
	b) 1990, 1 cliente
	c) 2000, 1 cliente
	d) 2010, 1 cliente

    Consulta:
		SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(*) 
		FROM clientes 
		WHERE apellido='Garcia' AND correo LIKE '%gmail%' 
		GROUP BY FLOOR(YEAR(fecha_nacimiento) / 10) * 10;

	Respuesta correcta: C

48.	¿Cuántos clientes hay por cada año de nacimiento y que tienen el apellido "Garcia" o el correo electrónico que contiene "gmail" y una fecha de nacimiento antes del 1 de Enero de 1990 en la tabla 'clientes'?
	a) 1985, 1 cliente
	b) 1986, 1 cliente
	c) 1987, 1 cliente
	d) 1988, 1 cliente

    Consulta:
		SELECT YEAR(fecha_nacimiento) as year, COUNT(*) 
		FROM clientes 
		WHERE (apellido='Garcia' OR correo LIKE '%gmail%') AND fecha_nacimiento < '1990-01-01' 
		GROUP BY YEAR(fecha_nacimiento);

	Respuesta correcta: A, B, D

49.	¿Cuántos clientes únicos hay por cada década de nacimiento y que tienen el número de teléfono que empieza con "555" o una dirección que contiene "Calle" en la tabla 'clientes'?
	a) 1980, 1 cliente
	b) 1990, 11 clientes
	c) 2000, 3 clientes
	d) 2010, 4 clientes

    Consulta:
		SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(DISTINCT id) 
		FROM clientes 
		WHERE (telefono LIKE '555%' OR direccion LIKE '%Calle%') 
		GROUP BY FLOOR(YEAR(fecha_nacimiento) / 10) * 10;

	Respuesta correcta: B, C

50.	¿Cuántos clientes hay por cada mes de nacimiento y que tienen el apellido "Garcia" y una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 en la tabla 'clientes'?
	a) January, 1 cliente
	b) February, 1 cliente
	c) March, 1 cliente
	d) April, 1 cliente

    Consulta:
		SELECT MONTHNAME(fecha_nacimiento) as month, COUNT(*) 
		FROM clientes 
		WHERE apellido='Garcia' AND fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01' 
		GROUP BY ONTHNAME(fecha_nacimiento);

	Respuesta correcta: B

51.	¿Cuántos clientes hay por cada día de la semana de nacimiento y que tienen el correo electrónico que contiene "gmail" y una fecha de nacimiento después del 1 de Enero de 2000 en la tabla 'clientes'?
	a) Friday, 1 cliente
	b) Saturday, 1 cliente
	c) Sunday, 1 cliente
	d) Tuesday, 1 cliente

    Consulta:
		SELECT DAYNAME(fecha_nacimiento) as day, COUNT(*) 
		FROM clientes 
		WHERE correo LIKE '%gmail%' AND fecha_nacimiento > '2000-01-01' 
		GROUP BY DAYNAME(fecha_nacimiento);

	Respuesta correcta: B, C

52.	¿Cuántos clientes hay por cada década de nacimiento y que tienen el apellido "Garcia" o el correo electrónico que contiene "gmail" y una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 en la tabla 'clientes'?
	a) 1980, 11 clientes
	b) 1990, 11 clientes
	c) 2000, 11 clientes
	d) 2010, 11 clientes

    Consulta: 
		SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(*) 
		FROM clientes 
		WHERE (apellido='Garcia' OR correo LIKE '%gmail%') AND fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01' 
		GROUP BY FLOOR(YEAR(fecha_nacimiento) / 10) * 10;

	Respuesta correcta: B

53.	¿Cuántos clientes hay por cada día de la semana de nacimiento y que tienen el número de teléfono que empieza con "555" o una dirección que contiene "Calle" y una fecha de nacimiento antes del 1 de Enero de 1990 en la tabla 'clientes'?
	a) Tuesday, 1 cliente
	b) Wednesday, 1 cliente
	c) Thursday, 1 cliente
	d) Sunday, 1 cliente

    Consulta:
		SELECT DAYNAME(fecha_nacimiento) as day, COUNT(*) 
		FROM clientes 
		WHERE (telefono LIKE '555%' OR direccion LIKE '%Calle%') AND fecha_nacimiento < '1990-01-01' 
		GROUP BY DAYNAME(fecha_nacimiento);

	Respuesta correcta: D 

54.	¿Cuántos clientes hay por cada año de nacimiento y que tienen el apellido "Garcia" y una fecha de nacimiento antes del 1 de Enero de 1990 en la tabla 'clientes' y que tienen un nombre con al menos 4 letras?
	a) 1985, 1 cliente
	b) 1986, 1 cliente
	c) 1987, 1 cliente
	d) 1988, 1 cliente

    Consulta:
		SELECT YEAR(fecha_nacimiento) as year, COUNT(*) 
		FROM clientes 
		WHERE apellido='Garcia' AND fecha_nacimiento < '1990-01-01' AND LENGTH(nombre) >= 4 
		GROUP BY YEAR(fecha_nacimiento);

	Respuesta correcta: B

55.	¿Cuántos clientes hay por cada década de nacimiento y que tienen el correo electrónico que contiene "gmail" y una fecha de nacimiento después del 1 de Enero de 2000 y que tienen un nombre con al menos 4 letras en la tabla 'clientes'?
	a) 1980, 3 clientes
	b) 1990, 3 clientes
	c) 2000, 3 clientes
	d) 2010, 3 clientes

    Consulta:SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(*) FROM clientes WHERE correo LIKE '%gmail%' AND fecha_nacimiento > '2000-01-01' AND LENGTH(nombre) >=4 GROUP BY decade;

	Respuesta correcta: C

56.	¿Cuántos clientes únicos hay por cada mes de nacimiento y que tienen el número de teléfono que empieza con "555" y una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 en la tabla 'clientes' y que tienen un nombre con al menos 4 letras?
	a) December, 2 clientes
	b) July, 2 clientes
	c) October, 1 cliente
	d) May, 1 cliente

    Consulta:SELECT MONTHNAME(fecha_nacimiento) as month, COUNT(DISTINCT id) FROM clientes WHERE telefono LIKE '555%' AND fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01' AND LENGTH(nombre) >=4 GROUP BY month;

	Respuesta correcta: A, B, C, D 

57.	¿Cuántos clientes hay por cada década de nacimiento y que tienen el apellido "Garcia" y el correo electrónico que contiene "gmail" y que tienen un nombre con al menos 4 letras en la tabla 'clientes'?
	a) 1980, 1 cliente
	b) 1990, 2 clientes
	c) 2000, 3 clientes
	d) 1990, 1 cliente
    
    Consulta:SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(*) FROM clientes WHERE apellido='Garcia' AND correo LIKE '%gmail%' AND LENGTH(nombre) >=4 GROUP BY decade;

	Respuesta correcta: B

58.	¿Cuántos clientes hay por cada año de nacimiento y que tienen el apellido "Garcia" o el correo electrónico que contiene "gmail" y una fecha de nacimiento antes del 1 de Enero de 1990 en la tabla 'clientes' y que tienen un nombre con al menos 4 letras?
	a) 1985, 1 cliente
	b) 1986, 1 cliente
	c) 1987, 1 cliente
	d) 1988, 1 cliente

    Consulta:SELECT YEAR(fecha_nacimiento) as year, COUNT(*) FROM clientes WHERE (apellido='Garcia' OR correo LIKE '%gmail%') AND fecha_nacimiento < '1990-01-01' AND LENGTH(nombre) >=4 GROUP BY year;

	Respuesta correcta: A, B, D

59.	¿Cuántos clientes únicos hay por cada década de nacimiento y que tienen el número de teléfono que empieza con "555" o una dirección que contiene "Calle" y que tienen un nombre con al menos 4 letras en la tabla 'clientes'?
	a) 1980, 3 clientes
	b) 1990, 11 clientes
	c) 2000, 1 cliente
	d) 1990, 10 clientes

    Consulta: SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(DISTINCT id) FROM clientes WHERE (telefono LIKE '555%' OR direccion LIKE '%Calle%') AND LENGTH(nombre) >=4 GROUP BY decade;

	Respuesta correcta: A, D

60.	¿Cuántos clientes hay por cada mes de nacimiento y que tienen el apellido "Garcia" y una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 y que tienen un nombre con al menos 4 letras en la tabla 'clientes'?
	a) December, 1 cliente
	b) February, 2 clientes
	c) No hay datos disponibles
	d) April, 1 cliente

    Consulta: SELECT MONTHNAME(fecha_nacimiento) as month, COUNT(*) FROM clientes WHERE apellido='Garcia' AND fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01' AND LENGTH(nombre) >=4 GROUP BY month;

	Respuesta correcta: A

61.	¿Cuántos clientes hay por cada día de la semana de nacimiento y que tienen el correo electrónico que contiene "gmail" y una fecha de nacimiento después del 1 de Enero de 2000 y que tienen un nombre con al menos 4 letras en la tabla 'clientes'?
	a) Sunday, 1 cliente
	b) Saturday, 1 cliente
	c) Friday, 1 cliente
	d) Tuesday, 1 cliente

    Consulta:SELECT DAYNAME(fecha_nacimiento) as day, COUNT(*) FROM clientes WHERE correo LIKE '%gmail%' AND fecha_nacimiento > '2000-01-01' AND LENGTH(nombre) >=4 GROUP BY day;

	Respuesta correcta: A, B

62.	¿Cuántos clientes hay por cada década de nacimiento y que tienen el apellido "Garcia" o el correo electrónico que contiene "gmail" y una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 y que tienen un nombre con al menos 4 letras en la tabla 'clientes'?
	a) 1980, 3 clientes
	b) 1990, 11 clientes
	c) 2000, 1 cliente
	d) 1990, 10 clientes

    Consulta:SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(*) FROM clientes WHERE (apellido='Garcia' OR correo LIKE '%gmail%') AND fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01' AND LENGTH(nombre) >=4 GROUP BY decade;

	Respuesta correcta: D 

63.	¿Cuál es el promedio de edad de los clientes que tienen el apellido "Garcia" y que tienen una fecha de nacimiento antes del 1 de Enero de 1990 en la tabla 'clientes'?
	a) 32
	b) 34
	c) 35
	d) 37

    Consulta:SELECT AVG(YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento)) as average_age FROM clientes WHERE apellido='Garcia' AND fecha_nacimiento < '1990-01-01';

	Respuesta correcta: D

64.	¿Cuántos clientes hay por cada década de nacimiento y que tienen el correo electrónico que contiene "gmail" y una fecha de nacimiento después del 1 de Enero de 2000 y que tienen un nombre con al menos 4 letras en la tabla 'clientes'?
	a) 2000, 3 clientes
	b) 2000, 11 clientes
	c) 2000, 3 cliente
	d) 2000, 10 clientes

    Consulta:
	    SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT(*) 
    FROM clientes 
    WHERE correo LIKE '%gmail%' AND fecha_nacimiento > '2000-01-01' AND LENGTH(nombre) >=4 
    GROUP BY FLOOR(YEAR(fecha_nacimiento) / 10) * 10;

	Respuesta correcta: C

65.	¿Cuál es el total de edad de los clientes que tienen el apellido "Garcia" y que tienen una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 en la tabla 'clientes'?
	a) 60
	b) 62
	c) 63
	d) 64

    Consulta:SELECT SUM(YEAR(CURRENT_DATE) - YEAR(fecha_nacimiento)) as total_age FROM clientes WHERE apellido='Garcia' AND fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01'

	Respuesta correcta: C

66.	¿Qué clientes tienen el nombre que empieza con "A" y el apellido que empieza con "G" en la tabla 'clientes' y ordenados por fecha de nacimiento en orden ascendente?
	a) Ana Gutierrez
	b) Andres Garcia 
	c) No hay datos disponibles
	d) Ana Gomez

    Consulta:SELECT * FROM clientes WHERE nombre LIKE 'A%' AND apellido LIKE 'G%' ORDER BY fecha_nacimiento ASC;

	Respuesta correcta: C

67.	¿Cuántos clientes hay por cada década de nacimiento y que tienen el apellido "Garcia" y el correo electrónico que contiene "gmail" y que tienen un nombre con al menos 4 letras en la tabla 'clientes' y mostrando solo los resultados con más de 5 clientes?
	a) 1980, 3 clientes
	b) 1990, 11 clientes
	c) 2000, 1 cliente
	d) No hay datos disponibles

    Consulta:SELECT FLOOR(YEAR(fecha_nacimiento) / 10) * 10 as decade, COUNT() FROM clientes WHERE apellido='Garcia' AND correo LIKE '%gmail%' AND LENGTH(nombre) >=4 GROUP BY decade HAVING COUNT() > 5;

	Respuesta correcta: D

68.	¿Qué clientes tienen una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 y que tienen un nombre con al menos 4 letras en la tabla 'clientes' y mostrando solo los primeros 20 resultados ordenados por fecha de nacimiento en orden descendente?
	a) Javier con ID 10
	b) Maria con ID 1
	c) Pedro con ID 3
	d) Diego con ID 15

    Consulta:SELECT nombre FROM clientes WHERE fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01' AND LENGTH(nombre) >=4 ORDER BY fecha_nacimiento DESC LIMIT 20;

	Respuesta correcta: A, B, D

69.	¿Cuál es el promedio de edad de los clientes que tienen el apellido "Garcia" y que tienen una fecha de nacimiento entre el 1 de Enero de 1990 y el 1 de Enero de 2000 en la tabla 'clientes'?
	a) 30,5
	b) 31,5
	c) 32,5
	d) 33,5

    Consulta:
	SELECT AVG(YEAR(CURDATE()) - YEAR(fecha_nacimiento)) as 'Media' 
	FROM clientes 
	WHERE apellido='Garcia' AND fecha_nacimiento BETWEEN '1990-01-01' AND '2000-01-01';

	Respuesta correcta: B

70.	¿Cuál es el total de edad de los clientes que tienen el apellido "Garcia" y que tienen una fecha de nacimiento antes del 1 de Enero de 1990 en la tabla 'clientes' y mostrando solo los primeros 10 resultados?
	a) 33
	b) 34
	c) 35
	d) 37

    Consulta:
	SELECT SUM(YEAR(curdate()) - YEAR(fecha_nacimiento)) as 'Total edad' 
	FROM clientes 
	WHERE apellido='Garcia' AND fecha_nacimiento < '1990-01-01' LIMIT 10;

	Respuesta correcta: D

71.	¿Cuántos clientes hay por cada década de nacimiento y que tienen el número de teléfono que empieza con "555" y que tienen un nombre con al menos 4 letras en la tabla 'clientes' y mostrando solo los resultados con más de 5 clientes y ordenados por década de nacimiento en orden ascendente?
	a) 1980, 3 clientes
	b) 1990, 11 clientes
	c) 2000, 1 cliente
	d) 1990, 10 clientes

    Consulta:
	select floor((year(fecha_nacimiento)/10)) *10 ,count(*)
	from clientes
	where telefono like '555%' and nombre like '%____%' 
	group by floor((year(fecha_nacimiento)/10)) *10 having count(*) > 5
	order by floor((year(fecha_nacimiento)/10)) *10 desc;
	
	Respuesta correcta: D

72.	¿Qué clientes tienen una fecha de nacimiento antes del 1 de Enero de 1990 y que tienen un nombre con al menos 4 letras en la tabla 'clientes' y mostrando solo los primeros 15 resultados distintos ordenados por apellido en orden ascendente?
	a) Maria con ID 20
	b) Jorge con ID 6
	c) Carlos con ID 19
	d) Valeria con ID 14

    Consulta:		
		SELECT DISTINCT * 
		FROM clientes 
		WHERE fecha_nacimiento < '1990-01-01' AND LENGTH(nombre) >=4 
		ORDER BY apellido ASC LIMIT 15;

	Respuesta correcta: A, B, C, D 


*/