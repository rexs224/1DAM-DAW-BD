GROUP BY - HAVING - WHERE

-   GROUP BY es una cláusula en SQL que se utiliza para agrupar resultados de una consulta según uno o varios campos específicos. 
    El resultado de una consulta con GROUP BY es un conjunto de grupos, donde cada grupo contiene todas las filas que tienen valores idénticos en los campos especificados en la cláusula GROUP BY.

-   HAVING es una cláusula que se utiliza para filtrar los grupos resultantes de una consulta con GROUP BY. 
    A diferencia de WHERE, que se utiliza para filtrar las filas antes de agruparlas, HAVING se utiliza para filtrar los grupos después de agruparlas. Por lo tanto, en una consulta con GROUP BY, se puede utilizar WHERE para filtrar las filas antes de agruparlas y HAVING para filtrar los grupos después de agruparlas.


***********************************************
***********************************************
******** ¿HAVING sustituye a WHERE? ***********
***********************************************
***********************************************

No, HAVING y WHERE son cláusulas diferentes que se utilizan en diferentes etapas de una consulta SQL.

-   WHERE se utiliza para filtrar las filas de una tabla antes de agruparlas o antes de seleccionar las columnas específicas. 
    Es decir, se utiliza para filtrar las filas antes de que se realice la operación de agrupamiento.

-   HAVING, por otro lado, se utiliza para filtrar los grupos resultantes de una consulta con GROUP BY. 
    Es decir, se utiliza para filtrar los grupos después de que se hayan agrupado las filas.

Por lo tanto, no podemos decir que HAVING sustituye a WHERE, ya que ambas cláusulas tienen funciones diferentes en una consulta SQL y se utilizan en diferentes etapas del proceso de consulta.