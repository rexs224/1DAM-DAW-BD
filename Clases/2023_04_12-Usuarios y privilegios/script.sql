/*
	********************************
    USUARIOS
    ********************************
	CREAR USUARIOS
    Para crear usuarios tengo que tener en cuenta lo siguiente:
    -	Establecer un nombre.
    -	Establecer un host.
    -	Establecer una contraseña.
    
    -	Al crear un usuario, este puede unicamente acceder pero no tiene privilegios para ninguna tarea

		SINTAXIS
        CREATE USER 'username'@'host' IDENTIFIED BY 'password';
	
    ELIMINAR USUARIO
    -	Necesito saber su nombre y su host
    -	Si soy superusuario (tengo privilegios para manejar usuarios) puedo eliminarlo.
    
		SINTAXIS
        DROP USER 'username'@'host'
	
    MODIFICAR CONTRASEÑA
    -	Necesito saber nombre de usuario y host.
	
		SINTAXIS
        ALTER USER 'username'@'host' IDENTIFIED BY 'password';
    
    ********************************
    PRIVILEGIOS
    ********************************
    Son los permisos o acciones que puede hacer un usuario.
    Cuando se crea un usuario, no tiene permisos par ahacer otra accion que no sea autenticarse.
    
    
    GRANT permiso ON db.table TO 'usuario'@'localhost';
    REVOKE permiso ON db.table FROM 'usuario'@'localhost';
    
    
    VER PERMISOS
    SHOW GRANTS FOR 'username'@'host';
    
    
	PODER VER LOS USUARIOS EXISTENTES
    -	USE mysql; para entrar en la BD mysql que es la que tiene acceso a los usuarios y demas informacion.
    -	SELECT * FROM USER; para mostrar toda la informacion de los usuarios, es decir, sus privilegios.
*/

USE mysql;
SELECT * FROM USER;
-- Crear usuario
CREATE USER 'alvaro'@'localhost' IDENTIFIED BY '';
-- Ver datos sobre el usuario
SELECT * FROM USER;
-- Eliminar usuario
DROP USER 'alvaro'@'localhost';
-- Modificar contraseña de usuario
ALTER USER 'alvaro'@'localhost' IDENTIFIED BY '1234';

-- Ver privilegios de usuario
SHOW GRANTS FOR 'alvaro'@'localhost';

-- Dar permiso a usuario para ver la base de datos nba
GRANT select ON nba.jugadores TO 'alvaro'@'localhost';
GRANT select ON nba.equipos TO 'alvaro'@'localhost';
GRANT select ON nba.* TO 'alvaro'@'localhost';
GRANT delete ON nba.temporadas TO 'alvaro'@'localhost';
/*
	Se recomienta utilizar 'FLUSH PRIVILEGES' despues de ejecutar la sentencia GRANT para otorgar nuevos permisos a un usuario.
    Despues de otorgar nuevos permisos a un usuario con GRANT, es necesario recargar los privilegios para que los cambios sean efectivos.
*/
FLUSH PRIVILEGES;

GRANT select ON papeleria.* TO 'alvaro'@'localhost';

GRANT ALL PRIVILEGES ON *.* TO 'alvaro'@'localhost';
REVOKE select ON nba.jugadores FROM 'alvaro'@'localhost';

CREATE USER 'miguel'@'localhost' IDENTIFIED BY '';
GRANT select ON papeleria.* TO 'miguel'@'localhost';
GRANT select ON nba.* TO 'miguel'@'localhost';
GRANT update, delete, select, alter ON papeleria.* TO 'miguel'@'localhost';

GRANT select ON mysql.db TO 'miguel'@'localhost';
SELECT * FROM USER;
FLUSH PRIVILEGES;

/*
	EJERCICIO.
    1. Crea un usuario con tu nombre y contraseña 13557.
		CREATE USER 'robayo'@'localhost' IDENTIFIED BY '13557';
        
    2. Modifica esa contraseña del usuario que has creado a vacía.
		ALTER USER 'robayo'@'localhost' IDENTIFIED BY '';
        UPDATE mysql.user SET password = '' WHERE user = 'robayo';
        
    3. Genera una conexion en el Workbench con ese usuario.
		-	Boton de casita
        -	Boton de +
			-	Nombre de conexion
			-	nombre de usuario: 
			-	host: localhost o 127.0.0.1
        
    4. Agrega privilegios para seleccionar y actualizar campos de dos tablas de una base de datos.
		-	GRANT select, update ON nba.equipos TO 'jose'@'localhost'
        -	GRANT select, update ON nba.jugadores TO 'jose'@'localhost'
        
    5. Eliminar privilegios de actualizar campos de una de las tablas.
		-	REVOKE update ON nba.jugadores FROM 'jose'@'localhost'
        
    6. Elimina el usuario que has creado.
		-	DROP USER 'jose'@'localhost'
*/