-- Entro a mysql con sudo mysql -u root -p

--Creo la base de datos llamada portafolioexamen

CREATE DATABASE portafolioexamen;

-- Nos aseguramos de que la base de datos se ha creado correctamente.

SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| biblioteca25       |
| ejemploclaves      |
| ejercicios_bbdd    |
| empresa            |
| empresadam         |
| information_schema |
| mysql              |
| performance_schema |
| portafolio         |
| portafolioexamen   |
| sys                |
+--------------------+
11 rows in set (0.00 sec)

-- Ahora usamos la base de datos que hemos creado

USE portafolioexamen;

-- Creo las tablas piezasportafolio y categoriasportafolio con sus respectivas columnas.

CREATE TABLE piezasportafolio(
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion VARCHAR(255),
    fecha VARCHAR(100),
    id_categoria INT

);

CREATE TABLE categoriasportafolio(
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

--Ahora compruebo que ambas tablas se han creado correctamente

SHOW TABLES;
+----------------------------+
| Tables_in_portafolioexamen |
+----------------------------+
| categoriasportafolio       |
| piezasportafolio           |
+----------------------------+
2 rows in set (0.00 sec)

--################################## FOREIGN KEY #####################################
--Sirve para enlazar una tabla con otra

--Creamos una foreign key
ALTER TABLE piezasportafolio
ADD FOREIGN KEY (id_categoria) 
REFERENCES categoriasportafolio (Identificador) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

-- Ahora vamos a insertar valores en las tablas:

INSERT INTO categoriasportafolio VALUES(
    NULL,
    'Pintura'
);

--Me aseguro de que se ha creado correctamente y miro el id para enlazarlo con piezasportafolio.
SELECT*FROM categoriasportafolio;
+---------------+---------+
| Identificador | nombre  |
+---------------+---------+
|             1 | Pintura |
+---------------+---------+
1 row in set (0.00 sec)

--Inserto valores en piezas portafolio

INSERT INTO piezasportafolio VALUES(
    NULL,
    'La noche estrellada',
    'Pintura de Vincent van Gogh',
    '2025-11-10',
    1
);

--Me aseguro de que se ha creado correctamente y demuestro que se leer datos

SELECT*FROM piezasportafolio;
+---------------+---------------------+-----------------------------+------------+--------------+
| Identificador | titulo              | descripcion                 | fecha      | id_categoria |
+---------------+---------------------+-----------------------------+------------+--------------+
|             1 | La noche estrellada | Pintura de Vincent van Gogh | 2025-11-10 |            1 |
+---------------+---------------------+-----------------------------+------------+--------------+
1 row in set (0.00 sec)

-- Actualizamos datos
UPDATE piezasportafolio
SET descripcion = 'Pintura mundialmente conocida del pintor Vicente Van Gogh'
WHERE Identificador = 1;

-- Ahora comprobamos que el cambio se ha realizado correctamente:
SELECT * FROM piezasportafolio;
+---------------+---------------------+-----------------------------------------------------------+------------+--------------+
| Identificador | titulo              | descripcion                                               | fecha      | id_categoria |
+---------------+---------------------+-----------------------------------------------------------+------------+--------------+
|             1 | La noche estrellada | Pintura mundialmente conocida del pintor Vicente Van Gogh | 2025-11-10 |            1 |
+---------------+---------------------+-----------------------------------------------------------+------------+--------------+
1 row in set (0.00 sec)

-- Ahora eliminamos los datos de la tabla portafolio
DELETE FROM piezasportafolio
WHERE Identificador = 1;

-- Y comprobamos que ha funcionado:
SELECT * FROM piezasportafolio;
Empty set (0.01 sec)

-- Ahora vaamos a añadir otravez datos para que la tabla no quede vacía
INSERT INTO piezasportafolio VALUES(
    NULL,
    'La noche estrellada',
    'Pintura de Vincent van Gogh',
    '2025-11-10',
    1
);

--############################# PETICION CRUZADA ######################################

SELECT
categoriasportafolio.nombre,
piezasportafolio.titulo,piezasportafolio.descripcion,piezasportafolio.fecha
FROM categoriasportafolio
LEFT JOIN piezasportafolio
ON piezasportafolio.id_categoria = categoriasportafolio.Identificador;

--Por ultimo creamos una vista
CREATE VIEW vista_categoriapieza AS
SELECT
  categoriasportafolio.nombre AS nombre_categoria,
  piezasportafolio.titulo AS titulo_pieza,
  piezasportafolio.descripcion AS descripcion_pieza,
  piezasportafolio.fecha AS fecha_pieza
FROM categoriasportafolio
LEFT JOIN piezasportafolio ON piezasportafolio.id_categoria = categoriasportafolio.Identificador;

--Nos aseguramos de que se ha creado y que se ve correctamente
 SHOW TABLES;
+----------------------------+
| Tables_in_portafolioexamen |
+----------------------------+
| categoriasportafolio       |
| piezasportafolio           |
| vista_categoriapieza       |
+----------------------------+
3 rows in set (0.01 sec)

SELECT*FROM vista_categoriapieza;
+------------------+---------------------+-----------------------------+-------------+
| nombre_categoria | titulo_pieza        | descripcion_pieza           | fecha_pieza |
+------------------+---------------------+-----------------------------+-------------+
| Pintura          | La noche estrellada | Pintura de Vincent van Gogh | 2025-11-10  |
+------------------+---------------------+-----------------------------+-------------+
1 row in set (0.00 sec)

--Creo el usuario con permisos para acceder a la base de datos

CREATE USER 
'usuario_portafolioexamen'@'localhost' 
IDENTIFIED  BY 'P0rtaF0li0*ExAm3n';

-- permite acceso a ese usuario
GRANT USAGE ON *.* TO 'usuario_portafolioexamen'@'localhost';

-- quitale todos los limites que tenga
ALTER USER 'usuario_portafolioexamen'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- dale acceso a la base de datos portafolio
GRANT ALL PRIVILEGES ON portafolioexamen.* 
TO 'usuario_portafolioexamen'@'localhost';

-- recarga la tabla de privilegios
FLUSH PRIVILEGES;
