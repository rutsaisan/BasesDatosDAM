-- Crear la base de datos y seleccionarla
CREATE DATABASE clientes;
USE clientes;

-- Crear la tabla clientes
CREATE TABLE clientes(
  nombre VARCHAR(255),
  apellidos VARCHAR(255),
  edad INT
);

-- Insertar datos de ejemplo
INSERT INTO clientes VALUES
('Ana', 'García López', 34),
('Luis', 'Martínez Ruiz', 28),
('María', 'Santos Pérez', 42),
('Carlos', 'Domínguez Alba', 19);

---------------------------------------------------------
-- 1. Proyección y ordenación descendente por edad
---------------------------------------------------------
SELECT 
  nombre AS 'Nombre del cliente',
  apellidos AS 'Apellidos del cliente',
  edad AS 'Edad del cliente'
FROM 
  clientes
ORDER BY
  edad DESC;

---------------------------------------------------------
-- 2. Selección nombrando columnas
---------------------------------------------------------
SELECT 
  nombre,
  apellidos,
  edad
FROM 
  clientes;

---------------------------------------------------------
-- 3. Ordenación ascendente explícita por apellidos
---------------------------------------------------------
SELECT 
  nombre AS 'Nombre del cliente',
  apellidos AS 'Apellidos del cliente',
  edad AS 'Edad del cliente'
FROM 
  clientes
ORDER BY
  apellidos ASC;

---------------------------------------------------------
-- 4. Selección solo de algunas columnas
---------------------------------------------------------
SELECT 
  nombre,
  apellidos
FROM 
  clientes;

---------------------------------------------------------
-- 5. Proyección con renombramiento de columnas
---------------------------------------------------------
SELECT 
  nombre AS 'Nombre del cliente',
  apellidos AS 'Apellidos del cliente',
  edad AS 'Edad del cliente'
FROM 
  clientes;