-- Entro a mysql con sudo mysql -u root -p

--Creo Base Datos;
CREATE DATABASE blog2;

--Nos aeguramos que s ehacreado
SHOW DATABASES;

--Uso la base de datos.
USE blog2;

--Creo la tabla:
CREATE TABLE autores(
    Identificador INT(10),
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    email VARCHAR (100)

);

--Miramos que hemos creado bien
SHOW TABLES;

--Quiero tirar la columna identificador par crearla bien
ALTER TABLE autores DROP Identificador;

--Ahora creo la columna identificador bien hecga con calve primaria
ALTER TABLE autores ADD COLUMN Identificador INT;
AUTO_INCREMENT PRIMARY KEY FIRST;

--Vamos a ve rlo que se hahecho
DESCRIBE autores;

--Ahora quiero insertar un autor de pueba
INSERT INTO autores VALUES(
    
    NULL,
    'Ruth',
    'Sainz Santos-Olmo',
    'rutsaisan@gmail.com'
);

--Vemos la informacion insertada en la tabla.

SELECT * FROM autores;

--Creo la tabla de entradas:
CREATE TABLE entradas(
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    fecha VARCHAR(100),
    imagen VARCHAR (100),
    id_autor VARCHAR (100),
    contenido TEXT

);

--Comprobamos la existencia de la tabla:
SHOW TABLES;

--Ahora decsribimos la tabla para ver si esta bien:
DESCRIBE entradas;


--################################## FOREIGN KEY #####################################
--Sirve para enlazar una tabla con otra

--Creamos una foreign key
ALTER TABLE entradas 
ADD CONSTRAINT autores_a_entradas 
FOREIGN KEY (id_autor) 
REFERENCES autores (Identificador) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

--Cambiamos tipo de datos:
ALTER TABLE entradas
MODIFY COLUMN id_autor INT;

--Volvemos a intentar el foreign key
ALTER TABLE entradas 
ADD CONSTRAINT autores_a_entradas 
FOREIGN KEY (id_autor) 
REFERENCES autores (Identificador) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

--Insertamos una entrada:
INSERT INTO entradas VALUES(
    
    NULL,
    'Titulo de l aprimera entrada'
    '2025-11-03'
    'imagen.jpg'
    1,
    'Este es el contenido de la primera entada'
);

--Vemos lo que hemos insertado.
SELECT * FROM entradas;

--############################# PETICION CRUZADA ######################################

SELECT
entradas.titulo,entradas.fecha,entradas.imagen,entradas.contenido,
autores.nombre,autores.apellidos
FROM entradas
LEFT JOIN autores
ON entradas.id_autor = autores.Identificador

--Por ultimo creamos una vista
CREATE VIEW vista_entradas autores
SELECT
entradas.titulo,entradas.fecha,entradas.imagen,entradas.contenido,
autores.nombre,autores.apellidos
FROM entradas
LEFT JOIN autores
ON entradas.id_autor = autores.Identificador

--Lo miro y compruebo (vemos que la vista se comporta como una tabla).
SELECT * FROM vista_entradas;