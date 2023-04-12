******************************************************
**************** IMPORTAR FICHEROS *******************
******************************************************

Importar ficheros en una base de datos MySQL es un proceso relativamente sencillo. 

A continuación se describen los pasos básicos para hacerlo:

Paso 1: Preparar el archivo a importar
    Antes de importar un archivo en MySQL, necesitas asegurarte de que el archivo esté en un formato compatible. MySQL admite varios formatos de archivo, como archivos SQL, CSV (valores separados por comas), y XML, entre otros. Asegúrate de tener el archivo que deseas importar en uno de estos formatos y que esté correctamente formateado.

Paso 2: Acceder a MySQL
    Abre tu cliente de MySQL, (MySQL Workbench) o la línea de comandos de MySQL, y accede a tu base de datos utilizando las credenciales correctas, incluyendo el nombre de usuario, contraseña y el nombre de la base de datos a la que deseas importar los datos.

Paso 3: Ejecutar el comando de importación
    En MySQL, puedes utilizar el comando LOAD DATA INFILE para importar datos desde un archivo. Aquí tienes un ejemplo básico de cómo puedes usarlo:

    LOAD DATA INFILE '/ruta/del/archivo/archivo.csv' INTO TABLE nombre_de_la_tabla
    FIELDS TERMINATED BY ','                        -- Especifica el delimitador de campos (en este caso, una coma)
    ENCLOSED BY '"'                                 -- Especifica el delimitador de texto (en este caso, comillas dobles)
    LINES TERMINATED BY '\n'                        -- Especifica el delimitador de líneas (en este caso, salto de línea)
    IGNORE 1 ROWS;                                  -- Opcional: ignora la primera fila (encabezado) si es necesario

    Asegúrate de ajustar los parámetros según el formato del archivo que estás importando y la estructura de tu base de datos. Por ejemplo, si estás importando un archivo CSV con valores separados por tabulaciones en lugar de comas, puedes usar FIELDS TERMINATED BY '\t'.

Paso 4: Verificar la importación
    Una vez que hayas ejecutado el comando de importación, MySQL debería importar los datos del archivo en la tabla especificada. Puedes verificar que los datos se hayan importado correctamente consultando la tabla en MySQL o ejecutando consultas SQL para verificar la presencia de los datos importados.


