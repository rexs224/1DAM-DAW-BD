DROP DATABASE IF EXISTS concesionario;
CREATE DATABASE IF NOT EXISTS concesionario;
USE concesionario;

CREATE TABLE IF NOT EXISTS coches(
    id       INT(10) AUTO_INCREMENT NOT NULL,
    modelo   VARCHAR(50) NOT NULL,
    marca   VARCHAR(50) NOT NULL,
    precio   DECIMAL(10,2) NOT NULL,
    stock    INT(50) NOT NULL,
    CONSTRAINT PRIMARY KEY (id)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS grupos(
    id       INT(10) AUTO_INCREMENT NOT NULL,
    nombre   VARCHAR(50) NOT NULL,
    ciudad   VARCHAR(50) NOT NULL,
    CONSTRAINT PRIMARY KEY (id)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS vendedores(
    id          INT(10) AUTO_INCREMENT NOT NULL,  
    grupo_id    INT(10) NOT NULL,
    nombre      VARCHAR(50) NOT NULL,
    apellidos   VARCHAR(50) NOT NULL,
    dni 		VARCHAR(50) NOT NULL,
    cargo       VARCHAR(50),
    fecha_inicio       DATE,
    sueldo      DECIMAL(20,2),
    comision    DECIMAL(10,2),
    CONSTRAINT PRIMARY KEY (id),
    CONSTRAINT UNIQUE (dni),
    CONSTRAINT FOREIGN KEY (grupo_id) REFERENCES grupos(id)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS clientes(
    id              INT(10) AUTO_INCREMENT NOT NULL,  
    vendedor_id     INT(10),  
    nombre          VARCHAR(150) NOT NULL,
    apellidos          VARCHAR(50),
    fecha           DATE,
    CONSTRAINT PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (vendedor_id) REFERENCES vendedores(id)
    
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS encargos(
    id            INT(10) AUTO_INCREMENT NOT NULL,   
    cliente_id    INT(10) NOT NULL,  
    coche_id      INT(10) NOT NULL,
    fecha         DATE,
    CONSTRAINT PRIMARY KEY (id),
    CONSTRAINT FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT FOREIGN KEY (coche_id) REFERENCES coches(id)
)ENGINE = InnoDB;

/* 
	Insercion de datos en la tabla coches
 */
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Arkana','Renault', 25884, 50);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Clio','Renault', 14768, 20);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Megane','Renault', 35136, 10);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Trafic','Renault', 42242, 6);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Koleos','Renault', 32030, 7);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Twingo','Renault', 24025, 8);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Kangoo','Renault', 23817, 9);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Zoe','Renault', 34420, 12);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Megane E-Tech','Renault', 35136, 45);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Espace','Renault', 43850, 56);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Captur','Renault', 19884, 36);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Austral','Renault', 30333, 18);
INSERT INTO coches (modelo, marca, precio, stock) VALUES ('Kadjar','Renault', 30000, 10);

/* 
	Insercion de datos en la tabla grupos
*/
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Madrid');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 2','Madrid');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 3','Madrid');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Barcelona');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 2','Barcelona');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Valladolid');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Murcia');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Sevilla');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Valencia');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','A Coruña');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Granada');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Vitoria');
INSERT INTO grupos (nombre, ciudad) VALUES ('Grupo 1','Zaragoza');

/* 
	Insercion de datos en la tabla vendedores
 */
INSERT INTO vendedores (grupo_id, nombre, apellidos, dni, cargo, fecha_inicio, sueldo, comision) VALUES (1,'Antonio','Rodriguez','12312312R','Jefe de ventas', '2022-02-03', 40000, 0.5);
INSERT INTO vendedores (grupo_id, nombre, apellidos, dni, cargo, fecha_inicio, sueldo, comision) VALUES (2,'Gema','López','34534534T','Vendedor','2020-04-03', 30000, 3);
INSERT INTO vendedores (grupo_id, nombre, apellidos, dni, cargo, fecha_inicio, sueldo, comision) VALUES (4,'Alberto','De la Torre','67139483Y','Vendedor', '2021-05-05', 30000, 1);
INSERT INTO vendedores (grupo_id, nombre, apellidos, dni, cargo, fecha_inicio, sueldo, comision) VALUES (3,'Ana','Martinez','55449087G','Jefe de ventas', '2017-10-09', 45000, 5);
INSERT INTO vendedores (grupo_id, nombre, apellidos, dni, cargo, fecha_inicio, sueldo, comision) VALUES (2,'Silvia','García','87194437K','Vendedor', '2021-11-12', 25000, 3.2);
INSERT INTO vendedores (grupo_id, nombre, apellidos, dni, cargo, fecha_inicio, sueldo, comision) VALUES (2,'Blanca','Pérez','87155437K','Vendedor', '2021-11-12', 26000, 2.2);

 /* 
	Insercion de datos en la tabla clientes
 */
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES (1 ,'Alfonso','Martinez', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 2,'Sergio','Fontan', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 3,'Francisco','Aliseda', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 2,'Carlos','Rufiangel', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 2,'Ana','Fernandez', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 3,'Miriam','Fernandez', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 4,'Paula','Rodriguez', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 1,'Natalia','Herrera', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 4,'Susana','Cebrián', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 4,'Jaime','Atienza', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 4,'Pablo','Argente', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 1,'Violeta','De Oro', NOW());
INSERT INTO clientes (vendedor_id, nombre, apellidos, fecha) VALUES ( 3,'Helena','Garcia', NOW());
 
 /* 
	Insercion de datos en la tabla encargos
 */
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 1, 1, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 2, 1, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 3, 2, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 4, 5, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 5, 6, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 6, 4, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 7, 4, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 8, 3, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 9, 7, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 10, 11, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 11, 2, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 12, 7, NOW());
INSERT INTO encargos (cliente_id, coche_id, fecha) VALUES ( 13, 8, NOW());