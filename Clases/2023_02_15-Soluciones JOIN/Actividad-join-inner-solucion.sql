
/* ¿Cuál es el promedio de salario de los empleados del departamento de Ventas?*/
SELECT AVG(salario) FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id
WHERE departamentos.nombre = 'Ventas';

/* ¿Qué departamentos tienen empleados que ganan más de $60,000?*/
SELECT DISTINCT departamentos.nombre FROM departamentos
INNER JOIN empleados ON departamentos.id = empleados.departamento_id
WHERE empleados.salario > 60000;

/* ¿Cuántos empleados hay en cada departamento?*/
SELECT departamentos.nombre, COUNT(empleados.id) FROM departamentos
INNER JOIN empleados ON departamentos.id = empleados.departamento_id
GROUP BY departamentos.nombre;

/* ¿Qué empleados tienen un salario superior al promedio?*/
SELECT nombre FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

/* ¿Qué departamentos tienen un salario promedio superior a $50,000?*/
SELECT departamentos.nombre FROM departamentos
INNER JOIN empleados ON departamentos.id = empleados.departamento_id
GROUP BY departamentos.nombre
HAVING AVG(empleados.salario) > 50000;

/* ¿Cuáles son los nombres de los empleados y sus departamentos?*/
SELECT empleados.nombre, departamentos.nombre FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id;

/* ¿Cuáles son los nombres de los empleados y los nombres de sus departamentos donde el salario es superior a $60,000?*/
SELECT empleados.nombre, departamentos.nombre FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id
WHERE empleados.salario > 60000;

/* ¿Cuáles son los nombres y salarios de los empleados que trabajan en el departamento de Ingeniería y ganan más de $60,000?*/
SELECT empleados.nombre, empleados.salario FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id
WHERE departamentos.nombre = 'Engineering' AND empleados.salario > 60000;

/* ¿Cuáles son los nombres de los departamentos y el presupuesto salarial total para cada departamento?*/
SELECT departamentos.nombre, SUM(empleados.salario) FROM departamentos
INNER JOIN empleados ON departamentos.id = empleados.departamento_id
GROUP BY departamentos.nombre;

/* ¿Cuáles son los nombres de los empleados varones y sus salarios?*/
SELECT empleados.nombre, empleados.salario FROM empleados
INNER JOIN genero ON empleados.genero_id = genero.id
WHERE genero.nombre = 'Male';

/* ¿Cuáles son los nombres de los departamentos donde todos los empleados ganan más de $50,000?*/
SELECT departamentos.nombre 
FROM departamentos
INNER JOIN empleados ON departamentos.id = empleados.departamento_id
GROUP BY departamentos.nombre
HAVING MIN(empleados.salario) > 50000;

/* ¿Cuáles son los nombres de los empleados que trabajan en el departamento de Ventas y tienen un salario superior al salario promedio de todos los empleados?*/
SELECT empleados.nombre FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id
WHERE departamentos.nombre = 'Sales' AND empleados.salario > (SELECT AVG(salario) FROM empleados);

/* ¿Cuáles son los nombres y los nombres de departamento de los empleados que ganan más que el salario promedio de su departamento?*/
SELECT empleados.nombre, departamentos.nombre 
FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id
WHERE empleados.salario > (SELECT AVG(salario) FROM empleados WHERE departamento_id = departamentos.id);

/* ¿Cuáles son los nombres y salarios de las empleadas que ganan más de $60,000?*/
SELECT empleados.nombre, empleados.salario FROM empleados
INNER JOIN genero ON empleados.genero_id = genero.id
WHERE genero.nombre = 'Female' AND empleados.salario > 60000;

/* ¿Cuáles son los nombres y los nombres de departamento de los empleados que ganan más que el salario más alto de su departamento?*/
SELECT empleados.nombre, departamentos.nombre FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id
WHERE empleados.salario > (SELECT MAX(salario) FROM empleados WHERE departamento_id = departamentos.id);

/* ¿Cuáles son los nombres de los empleados que ganan más que el salario promedio de su departamento y tienen un género de "Femenino"?*/
SELECT empleados.nombre FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id
INNER JOIN genero ON empleados.genero_id = genero.id
WHERE empleados.salario > (SELECT AVG(salario) FROM empleados WHERE departamento_id = departamentos.id)AND genero.nombre = 'Female';

/* ¿Cuáles son los nombres de los departamentos y la cantidad de empleados en cada departamento que ganan más de $60,000?*/
SELECT departamentos.nombre, COUNT(empleados.id) FROM departamentos
INNER JOIN empleados ON departamentos.id = empleados.departamento_id
WHERE empleados.salario > 60000
GROUP BY departamentos.nombre;