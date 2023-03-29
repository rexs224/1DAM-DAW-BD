-- Crear base de datos de ejemplo
CREATE DATABASE actividadFunciones;
USE actividadFunciones;

-- Crear tabla de usuarios
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL
);

-- Insertar algunos datos de ejemplo en la tabla de usuarios
INSERT INTO users (name, email, city, country) VALUES 
('John Smith', 'john@example.com', 'New York', 'USA'),
('Jane Doe', 'jane@example.com', 'London', 'UK'),
('Bob Johnson', 'bob@example.com', 'Paris', 'France'),
('Alice Jones', 'alice@example.com', 'Berlin', 'Germany');

-- Crear tabla de productos
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  quantity INT NOT NULL
);

-- Insertar algunos datos de ejemplo en la tabla de productos
INSERT INTO products (name, price, quantity) VALUES
('Computer', 1000.00, 10),
('Keyboard', 50.00, 100),
('Mouse', 25.00, 1000),
('Monitor', 200.00, 50);

use actividadfunciones;

-- 8. Crear una función que calcule el total de ventas (precio * cantidad) para un producto determinado
SELECT ej8('computer') AS 'Total';

-- 10. Crear una función que tome una ciudad como parámetro de entrada y devuelva el número de usuarios en esa ciudad
SELECT ej10('London') AS 'Total';

-- 17. Crear una función que devuelva el nombre del usuario con el nombre más largo
SELECT ej17() AS 'Nombre';

-- 18. Crear una función que devuelva el nombre del producto con el precio más bajo
SELECT ej18() AS 'Producto';
