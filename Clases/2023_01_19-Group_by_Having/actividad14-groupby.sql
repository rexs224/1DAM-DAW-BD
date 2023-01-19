CREATE DATABASE actividad14;

USE actividad14;

CREATE TABLE empleados (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  edad INT NOT NULL,
  genero VARCHAR(255) NOT NULL,
  departamento VARCHAR(255) NOT NULL,
  salario DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ventas (
  id INT NOT NULL AUTO_INCREMENT,
  id_empleado INT NOT NULL,
  fecha DATE NOT NULL,
  monto DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);

INSERT INTO empleados (nombre, edad, genero, departamento, salario) VALUES
('Juan', 35, 'M','Ventas', 4000.00),
('Ana', 29, 'F','Ventas', 3500.00),
('Pedro', 41, 'M','Compras', 5500.00),
('Sandra', 24, 'F','Compras', 3000.00),
('Laura', 33, 'F','Recursos Humanos', 4500.00),
('Mario', 27, 'M','Recursos Humanos', 3500.00),
('Santiago', 38, 'M','Marketing', 4500.00),
('Sofía', 32, 'F','Marketing', 4000.00),
('Pablo', 40, 'M','IT', 6000.00),
('Carla', 25, 'F','IT', 3000.00);

INSERT INTO ventas (id_empleado, fecha, monto) VALUES
(1, '2021-01-01', 500.00),
(1, '2021-01-03', 300.00),
(1, '2021-01-05', 400.00),
(2, '2021-01-02', 450.00),
(2, '2021-01-05', 350.00),
(2, '2021-01-07', 300.00),
(3, '2021-01-03', 600.00),
(3, '2021-01-06', 450.00),
(3, '2021-01-09', 500.00),
(4, '2021-01-04', 350.00),
(4, '2021-01-08', 400.00),
(5, '2021-01-02', 500.00),
(5, '2021-01-05', 400.00),
(5, '2021-01-07', 350.00);


/* Ejercicio : Obtener el total de ventas por día:*/
SELECT fecha, SUM(monto) AS 'total ventas'
FROM ventas
GROUP BY fecha;

/* MARIO CRUZ. Ejercicio : Obtener el número de ventas por día:*/
SELECT fecha, COUNT(*)
FROM ventas
GROUP BY fecha;

/* MARIO GARCIA. Ejercicio : Obtener el promedio de ventas por día:*/
SELECT fecha, AVG(monto)
FROM ventas
GROUP BY fecha;

/* VICTOR. Ejercicio : Obtener el número de empleados por departamento:*/
SELECT departamento, count(*)
FROM EMPLEADOS
GROUP BY departamento;

/* DAVID. Ejercicio : Obtener el total de salarios por departamento:*/
SELECT departamento, SUM(salario) AS 'total salario'
FROM empleados
GROUP BY salario;

/* JORGE. Ejercicio : Obtener el promedio de edad por departamento:*/
SELECT departamento, CAST(AVG(edad) AS DECIMAL(10,0)) AS 'edad'
FROM empleados
GROUP BY departamento;

/* ISMAEL. Ejercicio : Obtener el número de ventas por mes:*/
SELECT MONTH(fecha) AS 'mes', COUNT(*) AS 'total'
FROM ventas
GROUP BY MONTH(fecha);

/* JONAS. Ejercicio : Obtener el total de ventas por mes:*/
SELECT MONTH(fecha) AS 'mes', SUM(monto) AS 'total'
FROM ventas
GROUP BY MONTH(fecha);

/* JOSE. Ejercicio : Obtener el promedio de ventas por mes:*/
SELECT MONTH(fecha) AS 'mes', CAST(AVG(monto) AS DECIMAL(10,2)) AS 'Promedio'
FROM ventas
GROUP BY MONTH(fecha);

/* ERNESTO. Ejercicio : Obtener el número de empleados por edad:*/
SELECT edad, COUNT(*) as 'total por edad'
FROM empleados
GROUP BY edad;

/* JORGE. Ejercicio : Obtener el número de ventas por día de la semana:*/
SELECT DAYNAME(fecha) AS 'Dia', COUNT(*) AS 'total'
FROM ventas
GROUP BY DAYNAME(fecha);

/* VICTOR. Ejercicio : Obtener el total de ventas por día de la semana:*/
SELECT DAYNAME(fecha) AS 'Dia', SUM(monto) AS 'total'
FROM ventas
GROUP BY DAYNAME(fecha);

/* MARIO GARCIA. Ejercicio : Obtener el promedio de ventas por día de la semana:*/
SELECT DAYNAME(fecha)AS 'Dia', CAST(AVG(monto) AS DECIMAL(10,2)) AS 'Promedio'
FROM ventas
GROUP BY DAYNAME(fecha);

/* DANIEL Ejercicio : Obtener el número de ventas por mes y año:*/
SELECT MONTH(fecha) AS 'mes', YEAR(fecha) as 'año', COUNT(*) as 'total'
FROM ventas
GROUP BY MONTH(fecha), YEAR(fecha);

/* ALVARO. Ejercicio : Obtener el total de ventas por mes y año:*/
SELECT YEAR(fecha) as 'año', MONTH(fecha) AS 'mes', SUM(monto) as 'total'
FROM ventas
GROUP BY YEAR(fecha), MONTH(fecha);

/* Ejercicio : Obtener el promedio de ventas por mes y año:*/
SELECT  MONTH(fecha) AS 'mes', YEAR(fecha) as 'año', CAST(AVG(monto) AS DECIMAL(10,2)) AS 'Promedio'
FROM  ventas
GROUP BY  MONTH(fecha), YEAR(fecha);

/* VICTOR. Ejercicio : Obtener el número de empleados por género y departamento:*/
SELECT departamento, genero, COUNT(*) AS 'Total'
FROM empleados
GROUP BY departamento, genero;

/* MARIO CRUZ. Ejercicio : Obtener el total de salarios por género y departamento:*/
SELECT departamento, genero, SUM(salario) AS 'Total'
FROM empleados
GROUP BY departamento, genero;
