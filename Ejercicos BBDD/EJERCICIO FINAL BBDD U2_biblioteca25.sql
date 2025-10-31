-- Entro a mysql con sudo mysql -u root -p

--Creo la base de datos
CREATE DATABASE biblioteca25;

--Selecciono la base de datos pasa usarla
USE biblioteca25;

--Compruebo que estoy es esa base de datos 
SELECT DATABASE();

--Creo la tabla autores
CREATE TABLE autores(
    
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(80) NULL

);

--Compruebo que se ha creado correctaente con las retricciones dadas
DESCRIBE autores;

--Evidencia del DESCRIBE:
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| nombre | varchar(100) | NO   |     | NULL    |                |
| pais   | varchar(80)  | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

--Creo la tabla libros
CREATE TABLE libros(
    
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    precio DECIMAL(8,2) NOT NULL CHECK(precio > 0),
    autor_id INT NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT

);

--Creo un índice sobre el título
CREATE INDEX idx_titulo ON libros(titulo);

--Verifico que el índice existe
SHOW INDEX FROM libros;

--PRueba de que funciona:
SHOW INDEX FROM libros;
+--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| libros |          0 | PRIMARY    |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          0 | isbn       |            1 | isbn        | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | autor_id   |            1 | autor_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | idx_titulo |            1 | titulo      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.01 sec)

--Evidencias:
DESCRIBE libros;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int          | NO   | PRI | NULL    | auto_increment |
| titulo   | varchar(200) | NO   | MUL | NULL    |                |
| isbn     | varchar(20)  | NO   | UNI | NULL    |                |
| precio   | decimal(8,2) | NO   |     | NULL    |                |
| autor_id | int          | NO   | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

SHOW INDEX FROM libros;
+--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| libros |          0 | PRIMARY    |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          0 | isbn       |            1 | isbn        | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | autor_id   |            1 | autor_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| libros |          1 | idx_titulo |            1 | titulo      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.01 sec)

--Creo la tabla Socios:

CREATE TABLE socios(
    
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    fecha_alta DATE NOT NULL DEFAULT (CURRENT_DATE)

);

--Añado la restriccion al email
ALTER TABLE socios
ADD CONSTRAINT chk_email_format
CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');

--Inserto dos socios válidos

INSERT INTO socios VALUES(
    
    NULL,
    'Laura Gómez',
    'laura@gmail.com',
    '2025-10-15'
);

INSERT INTO socios VALUES(
    
    NULL,
    'Pablo García',
    'pablito@gmail.com',
    '2025-10-31'
);

--Evidencia de que se han insertado
 SELECT * FROM  socios;
+----+---------------+-------------------+------------+
| id | nombre        | email             | fecha_alta |
+----+---------------+-------------------+------------+
|  1 | Laura Gómez   | laura@gmail.com   | 2025-10-15 |
|  2 | Pablo García  | pablito@gmail.com | 2025-10-31 |
+----+---------------+-------------------+------------+
2 rows in set (0.00 sec)

--Inserto un socio con el email invalido
INSERT INTO socios VALUES(
    
    NULL,
    'Pablo Picaso',
    'correo invalido',
    '2025-10-31'
);

--Evidencia de que da error
ERROR 3819 (HY000): Check constraint 'chk_email_format' is violated.

--Evidencia de la tabla con describe
DESCRIBE socios;
+------------+--------------+------+-----+-----------+-------------------+
| Field      | Type         | Null | Key | Default   | Extra             |
+------------+--------------+------+-----+-----------+-------------------+
| id         | int          | NO   | PRI | NULL      | auto_increment    |
| nombre     | varchar(200) | NO   |     | NULL      |                   |
| email      | varchar(120) | NO   | UNI | NULL      |                   |
| fecha_alta | date         | NO   |     | curdate() | DEFAULT_GENERATED |
+------------+--------------+------+-----+-----------+-------------------+
4 rows in set (0.00 sec)

--Creo la tabla prestamos con todas las retricciones que me pide el enunciado.

CREATE TABLE prestamos(
    
    id INT AUTO_INCREMENT PRIMARY KEY,
    socio_id INT NOT NULL,
    libro_id INT NOT NULL,
    fecha_prestamo DATE NOT NULL DEFAULT (CURRENT_DATE),
    fecha_devolucion DATE NULL,
    CHECK ( fecha_devolucion IS NULL OR fecha_devolucion >= fecha_prestamo),
    FOREIGN KEY (socio_id) REFERENCES socios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (libro_id) REFERENCES libros(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    INDEX idx_socio_libro (socio_id, libro_id)
);

--Verifico
SHOW INDEX FROM prestamos;
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| prestamos |          0 | PRIMARY         |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | libro_id        |            1 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | idx_socio_libro |            1 | socio_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | idx_socio_libro |            2 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.00 sec)

--Evidencia
DESCRIBE prestamos;
+------------------+------+------+-----+-----------+-------------------+
| Field            | Type | Null | Key | Default   | Extra             |
+------------------+------+------+-----+-----------+-------------------+
| id               | int  | NO   | PRI | NULL      | auto_increment    |
| socio_id         | int  | NO   | MUL | NULL      |                   |
| libro_id         | int  | NO   | MUL | NULL      |                   |
| fecha_prestamo   | date | NO   |     | curdate() | DEFAULT_GENERATED |
| fecha_devolucion | date | YES  |     | NULL      |                   |
+------------------+------+------+-----+-----------+-------------------+
5 rows in set (0.00 sec)

 SHOW INDEX FROM prestamos;
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| prestamos |          0 | PRIMARY         |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | libro_id        |            1 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | idx_socio_libro |            1 | socio_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| prestamos |          1 | idx_socio_libro |            2 | libro_id    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+-----------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.00 sec)

--Inserto Datos para poner la maquina virtual en funcionamiento.

INSERT INTO autores VALUES (
    NULL,
    'Joana Marcus',
    'Mallorca'
);
INSERT INTO autores VALUES (
    NULL,
    'Alex Mirez',
    'Venezuela'

);
INSERT INTO autores VALUES (
    NULL,
    'Rebecca Yarros',
    'Estados Unidos'

);

INSERT INTO libros VALUES (
    NULL,
    'Antes de Diciembre',
    '9789566026877',
    19.95,
    1
);
INSERT INTO libros VALUES (
    NULL,
    'Damián',
    '9798400137259',
    20.95,
    2
);
INSERT INTO libros VALUES (
    NULL,
    'Alas de Sangre',
    '8408279998',
    29.95,
    3
);
INSERT INTO socios VALUES (
    NULL,
    'Ana Ruiz',
    'ana.ruiz@example.com',
    CURRENT_DATE
);
INSERT INTO socios VALUES (
    NULL,
    'Luis Pérez',
    'luis.perez@example.com',
    CURRENT_DATE
);
INSERT INTO prestamos VALUES (
    NULL,
    1,    -- socio_id     
    4,    -- libro_id      
    CURRENT_DATE,
    NULL
);
INSERT INTO prestamos VALUES (
    NULL,
    2,   -- mismo socio_id      
    5,   -- otro libro_id       
    '2025-10-01',
    '2025-10-15'
);

--Evidencia
SELECT * FROM autores;
+----+----------------+----------------+
| id | nombre         | pais           |
+----+----------------+----------------+
|  1 | Joana Marcus   | Mallorca       |
|  2 | Alex Mirez     | Venezuela      |
|  3 | Rebecca Yarros | Estados Unidos |
+----+----------------+----------------+
3 rows in set (0.00 sec)

SELECT * FROM libros;
+----+--------------------+---------------+--------+----------+
| id | titulo             | isbn          | precio | autor_id |
+----+--------------------+---------------+--------+----------+
|  4 | Antes de Diciembre | 9789566026877 |  19.95 |        1 |
|  5 | Damián             | 9798400137259 |  20.95 |        2 |
|  6 | Alas de Sangre     | 8408279998    |  29.95 |        3 |
+----+--------------------+---------------+--------+----------+
3 rows in set (0.00 sec)

SELECT * FROM socios;
+----+---------------+------------------------+------------+
| id | nombre        | email                  | fecha_alta |
+----+---------------+------------------------+------------+
|  1 | Laura Gómez   | laura@gmail.com        | 2025-10-15 |
|  2 | Pablo García  | pablito@gmail.com      | 2025-10-31 |
|  3 | Ana Ruiz      | ana.ruiz@example.com   | 2025-10-31 |
|  4 | Luis Pérez    | luis.perez@example.com | 2025-10-31 |
+----+---------------+------------------------+------------+
4 rows in set (0.00 sec)

SELECT * FROM prestamos;
+----+----------+----------+----------------+------------------+
| id | socio_id | libro_id | fecha_prestamo | fecha_devolucion |
+----+----------+----------+----------------+------------------+
|  9 |        1 |        4 | 2025-10-31     | NULL             |
| 10 |        2 |        5 | 2025-10-01     | 2025-10-15       |
+----+----------+----------+----------------+------------------+
2 rows in set (0.00 sec)



--RESUMEN Y COMPROBACIONES FINALES
SHOW TABLES;
+------------------------+
| Tables_in_biblioteca25 |
+------------------------+
| autores                |
| libros                 |
| prestamos              |
| socios                 |
+------------------------+
4 rows in set (0.01 sec)

DESCRIBE autores;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| nombre | varchar(100) | NO   |     | NULL    |                |
| pais   | varchar(80)  | YES  |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

DESCRIBE libros;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| id       | int          | NO   | PRI | NULL    | auto_increment |
| titulo   | varchar(200) | NO   | MUL | NULL    |                |
| isbn     | varchar(20)  | NO   | UNI | NULL    |                |
| precio   | decimal(8,2) | NO   |     | NULL    |                |
| autor_id | int          | NO   | MUL | NULL    |                |
+----------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

DESCRIBE socios;
+------------+--------------+------+-----+-----------+-------------------+
| Field      | Type         | Null | Key | Default   | Extra             |
+------------+--------------+------+-----+-----------+-------------------+
| id         | int          | NO   | PRI | NULL      | auto_increment    |
| nombre     | varchar(200) | NO   |     | NULL      |                   |
| email      | varchar(120) | NO   | UNI | NULL      |                   |
| fecha_alta | date         | NO   |     | curdate() | DEFAULT_GENERATED |
+------------+--------------+------+-----+-----------+-------------------+
4 rows in set (0.00 sec)
