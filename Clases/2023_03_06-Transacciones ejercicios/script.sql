use trimestre2repesca;

/*
	Ejercicio 1.
    Realice una transacción que:
    -	inserte un nuevo usuario en la tabla 'users', 
    -	un nuevo pedido en la tabla 'pedidos', 
    -	un nuevo registro en la tabla 'pedidos_has_productos' con un producto existente y el pedido recién creado.
    
    NOTA: 
    -	Producto recien creado necesito saber su ID.
    -	Necesito o bien almacenar ese ID en una variable o utilizarlo en subconsulta.
    
    COSAS:
    -	La funcion predefinida LAST_INSERT_ID() proporciona el valor de la clave primaria (ultimo id) insertado por ultima vez.
		Aclaracion: te da id de tu ultima insercion.
*/

/*SELECT * FROM pedidos_has_productos;
START TRANSACTION;
BEGIN;
 INSERT INTO users VALUES(NULL, 'Sergio', 'Fontan', 'sfontan', '13455', '1234234');

 SET @user_id = LAST_INSERT_ID();
 INSERT INTO pedidos VALUES (NULL, @user_id, NOW());
 
 SET @pedido_id = LAST_INSERT_ID();
 INSERT INTO pedidos_has_productos VALUES (@pedido_id, 4, 3, 3);
COMMIT;*/

/*
	Ejercicio 2:
    Cree una transacción que:
    -	actualice el precio de un producto en la tabla 'productos' (da igual el producto que sea y da igual el precio que sea)
    -	ajuste el precio de todos los registros en la tabla 'pedidos_has_productos' que contienen ese producto.
*/

/*
START TRANSACTION;
BEGIN;
	UPDATE productos SET precio = 0.01 WHERE id = 1;
    UPDATE pedidos_has_productos SET precio = 0.01 WHERE producto_id = 1;
COMMIT;
*/


/*
	Ejercicio 3:
    Realice una transacción que:
    -	seleccione y bloquee todos los registros en la tabla 'pedidos_has_productos' para un pedido específico, 
    -	actualice los valores de unidades y precio de cada registro y, 
    -	actualice el stock del producto correspondiente en la tabla 'productos'.
    
    COSAS:
    -	Para bloquear los registros de la tabla 'pedidos_has_productos' para un pedido especifico utilizamos 'FOR UPDATE' 
		al final de la sentencia.
	-	Se bloquean todos los cambios hasta que finalice la transaccion. Por tanto, cualquier consulta sobre el 'pedido_id' 1
		en la tabla 'pedidos_has_productos' retorna los datos antiguos.
	-	La transaccion finaliza con un COMMIT o ROLLBACK. Hasta entonces recibe los datos antiguos.
    
*/

/*
	START TRANSACTION;
	BEGIN;
		SELECT * FROM pedidos_has_productos WHERE pedido_id = 2 FOR UPDATE;
		SELECT * FROM productos FOR UPDATE;
		UPDATE pedidos_has_productos SET unidades = unidades - 1, precio = precio + 1 WHERE pedido_id = 2;
		UPDATE productos SET stock = stock - 1 WHERE id IN (SELECT producto_id FROM pedidos_has_productos WHERE pedido_id = 2);
	COMMIT;
*/

/*
	Ejercicio 4:
    Cree una transacción que:
    -	seleccione y bloquee todos los registros en la tabla 'pedidos_has_productos' para un pedido específico 
    -	elimine el pedido y todos los registros asociados en las tablas 'pedidos_has_productos' y 'pedidos'.
*/
/*START TRANSACTION;
BEGIN;
	SELECT * FROM pedidos_has_productos WHERE pedido_id = 3 FOR UPDATE;
    SELECT * FROM pedidos WHERE id = 3 FOR UPDATE;
    DELETE FROM pedidos_has_productos WHERE pedido_id = 3;
    DELETE FROM pedidos WHERE id = 3;
ROLLBACK;*/
/*
	SHOW ENGINES;
	ALTER TABLE pedidos ENGINE = InnoDB;
*/

/*
	Ejercicio 5:
    Realice una transacción que:
    -	seleccione y bloquee todos los registros en la tabla 'pedidos_has_productos' para un pedido específico
    -	actualice el stock de cada producto correspondiente en la tabla 'productos'
    -	elimine todos los registros de la tabla 'pedidos_has_productos' asociados con el pedido
    -	elimine el pedido de la tabla 'pedidos'.
*/

/*
	Ejercicio 6:
    Cree una transacción que:
    -	seleccione y bloquee todos los registros en la tabla 'pedidos_has_productos' para un pedido específico, 
    -	sume los precios de cada registro y 
    -	agrege un campo en la tabla 'pedidos' con el nombre 'total' de tipo DECIMAL
    -	agregue el precio total del pedido en la tabla 'pedidos' en su pedido correspondiente.
*/

