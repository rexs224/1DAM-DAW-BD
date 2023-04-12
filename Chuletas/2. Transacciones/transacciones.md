******************************************************
****************** TRANSACCIONES *********************
******************************************************

Una transacción en MySQL es una secuencia de operaciones que se realizan como una sola unidad atómica. 

Esto significa que todas las operaciones dentro de la transacción se realizan juntas o ninguna de ellas se realiza en absoluto. 

La idea detrás de las transacciones es garantizar que una serie de operaciones se realicen de manera segura y consistente, y que se mantenga la integridad de los datos.

Las transacciones se utilizan comúnmente en aplicaciones de bases de datos que requieren operaciones críticas como la actualización de saldos, las transferencias de fondos, la actualización de inventarios y otras operaciones similares. 
En lugar de ejecutar cada operación por separado, se agrupan en una transacción para garantizar que se realicen todas o ninguna.

Sintaxis de una transacción en MySQL:

1.  Para iniciar una transacción, utilizamos la instrucción "BEGIN". 
2.  Luego, realizamos todas las operaciones que necesitamos, como actualizar, insertar o eliminar datos. 
3.  Si todo se realiza correctamente, confirmamos la transacción utilizando "COMMIT". 
4.  Si hay algún error o problema, podemos cancelar la transacción utilizando "ROLLBACK".

******************************************************
******************** SINTAXIS ************************
******************************************************

La sintaxis básica para una transacción en MySQL es la siguiente:

START TRANSACTION;
    -- operaciones a realizar
COMMIT;
    -- o ROLLBACK;


Ejemplo de una transacción en MySQL:

Supongamos que tenemos una tabla "cuentas" que contiene información de cuentas bancarias, incluyendo el saldo actual de cada cuenta. 

Queremos actualizar el saldo de dos cuentas, A y B, para realizar una transferencia de $100 de la cuenta A a la cuenta B. 

Si ocurriera un error durante la actualización del saldo, no queremos que se realice ninguna actualización. En este caso, podemos utilizar una transacción para garantizar la integridad de los datos.

START TRANSACTION;
BEGIN;
    UPDATE cuentas SET saldo = saldo - 100 WHERE cuenta_id = 'A';
    UPDATE cuentas SET saldo = saldo + 100 WHERE cuenta_id = 'B';
COMMIT;


En este ejemplo, la transacción comienza con "START TRANSACTION", luego se realizan dos operaciones para actualizar los saldos de las cuentas A y B. Si ambas operaciones se realizan sin problemas, confirmamos la transacción con "COMMIT". Si ocurre un error durante cualquiera de las operaciones, podemos cancelar la transacción utilizando "ROLLBACK" y los saldos de las cuentas se mantendrán sin cambios.


