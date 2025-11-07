-- Entro a mysql con sudo mysql -u root -p

--Veo las bases de datos que tengo
 SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| biblioteca25       |
| ejemploclaves      |
| ejercicios_bbdd    |
| empresadam         |
| information_schema |
| mysql              |
| performance_schema |
| portafolio         |
| sys                |
+--------------------+
9 rows in set (0.00 sec)

--Uso la base de datos empresadam
USE empresadam;

-- Muestro las tablas en la base de datos
SHOW TABLES;

--Verificamos la estructura de la tabla cliente scon el DESCRIBE
DESCRIBE clientes;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| dninie        | varchar(9)   | YES  |     | NULL    |                |
| nombre        | varchar(50)  | YES  |     | NULL    |                |
| apellidos     | varchar(255) | YES  |     | NULL    |                |
| email         | varchar(100) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)

-- Añadimos una nueva columna direccion a la tabla clientes.
ALTER TABLE clientes
ADD COLUMN direccion VARCHAR(255);

-- Describo de nuevo la tabla para verificar los cambios.
DESCRIBE clientes;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| dninie        | varchar(9)   | YES  |     | NULL    |                |
| nombre        | varchar(50)  | YES  |     | NULL    |                |
| apellidos     | varchar(255) | YES  |     | NULL    |                |
| email         | varchar(100) | YES  |     | NULL    |                |
| direccion     | varchar(255) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)

-- Elimino la columna direccion que acabo de añadir.
ALTER TABLE clientes
DROP COLUMN direccion;

-- Describo de nuevo la tabla para confirmar que la columna ha sido eliminada.
DESCRIBE clientes;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| dninie        | varchar(9)   | YES  |     | NULL    |                |
| nombre        | varchar(50)  | YES  |     | NULL    |                |
| apellidos     | varchar(255) | YES  |     | NULL    |                |
| email         | varchar(100) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)

--Añado una restricción que valide el formato del DNI/NIE.

ALTER TABLE clientes
ADD CONSTRAINT comprobar_dni_nie_letra
CHECK (
  (
    -- DNI: 8 dígitos + letra
    dninie REGEXP '^[0-9]{8}[A-Za-z]$'
    AND
    UPPER(SUBSTRING(dninie, 9, 1)) =
    SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
              (CAST(SUBSTRING(dninie, 1, 8) AS UNSIGNED) MOD 23) + 1,
              1)
  )
  OR
  (
    -- NIE: X/Y/Z + 7 dígitos + letra
    dninie REGEXP '^[XYZxyz][0-9]{7}[A-Za-z]$'
    AND
    UPPER(SUBSTRING(dninie, 9, 1)) =
    SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE',
              (
                CAST(CONCAT(
                      CASE UPPER(SUBSTRING(dninie, 1, 1))
                        WHEN 'X' THEN '0'
                        WHEN 'Y' THEN '1'
                        WHEN 'Z' THEN '2'
                      END,
                      SUBSTRING(dninie, 2, 7)
                ) AS UNSIGNED) MOD 23
              ) + 1,
              1)
  )
);

-- Intento insertar un registro que no cumpla la restricción para ver el error.
INSERT INTO clientes VALUES(
  NULL,
  '12345678A',
  'Jose Vicente',
  'Carratala Sanchis',
  'info@jocarsa.com'
);

ERROR 3819 (HY000): Check constraint 'comprobar_dni_nie_letra' is violated.

-- Saneo los registros que no cumplen la restricción.
DELETE FROM clientes WHERE dninie NOT REGEXP '^[0-9]{8}[A-Za-z]$' AND dninie NOT REGEXP '^[XYZxyz][0-9]{7}[A-Za-z]$';

-- Elimino la restricción comprobar_dni_nie_letra.
ALTER TABLE clientes
DROP CONSTRAINT comprobar_dni_nie_letra;

-- Creo una nueva tabla productos con las columnas y restricciones especificadas en el ejercicio.
CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(7,2) NOT NULL,
  stock INT NOT NULL,
  CONSTRAINT chk_nombre_longitud CHECK (CHAR_LENGTH(nombre) >= 5),
  CONSTRAINT chk_precio_positivo CHECK (precio >= 0),
  CONSTRAINT chk_precio_maximo CHECK (precio <= 5000),
  CONSTRAINT chk_stock_positivo CHECK (stock >= 0)
);

-- Inserto algunos registros en la tabla productos para verificar las restricciones
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Patito Clásico', 'El patito de goma amarillo tradicional.', 3.50, 120),
('Patito Pirata', 'Patito de goma con parche y sombrero pirata.', 4.25, 80);

-- Intento insertar un registro que no cumpla alguna restricción para ver el error.
INSERT INTO productos (nombre, precio, stock) VALUES ('Producto corto', 10.00, 50);

-- Eliminar los registros que no cumplen las restricciones
DELETE FROM productos WHERE nombre LIKE '%corto%';

-- Salgo de mysql
quit;

-- Hago una cobia de seguridad de empresadam
sudo mysqldump -u root -p empresadam > copiadeseguridad.sql