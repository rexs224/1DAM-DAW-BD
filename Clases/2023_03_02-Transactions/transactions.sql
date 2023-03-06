USE imf;

/*
	TRANSACTIONS
    
    Una transaccion es una agrupacion de varias sentencias que se ejecutan como un unico bloque.
    Esto quiere decir que se ejecutan TODAS o ninguna.
    
    ¿Objetivo? --> El objetivo de una transaccion es garantizar que se realizan las operaraciones de una manera segura y consistente.alter
    
    Las transacciones se utilizan comunmente en aplicaciones de bases de datos que requieren operaciones criticas como actualizacion de datos, transferencia de fondos, etc.
    
    NOTA: El motor predeterminado MyISAM NO SOPORTA LAS TRANSACCIONES
    
    Pasos:
    -	Para iniciar una transaccion utilizamos la instruccion BEGIN.
    -	Realizamos todas las operaciones necesarias.
    -	Si se ralizan correctamente las operaciones, utilizamos la instruccion COMMIT para confirmar la transaccion.
    -	Si NO se realizan correctamente las operaciones, utilizamos la instruccion ROLLBACK para cancelar la transaccion.
    
    SINTAXIS
    -	CON COMMIT
		
        START TRANSACTION;
        BEGIN;
			INSERT...
            UPDATE...
            DELETE...
		COMMIT;
    
    -	CON ROLLBACK
    
		START TRANSACTION;
        BEGIN;
			INSERT...
            UPDATE...
            DELETE...
		ROLLBACK;
 */
 
 START TRANSACTION;
 BEGIN;
	INSERT INTO alumno VALUES (NULL, 'David', 2.5);
    INSERT INTO alumno VALUES (NULL, 'Jorge', 1.5);
 ROLLBACK;

/*ALTER TABLE alumno ENGINE = InnoDB;*/
SELECT * FROM alumno;
SHOW ENGINES;