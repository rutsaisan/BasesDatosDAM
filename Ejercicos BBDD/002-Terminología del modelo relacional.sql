-- Entro a mysql con sudo mysql -u root -p

--Entro a la base de datos que vaya a usar con el comando USE empresadam;

--Creo la tabla libros:
CREATE TABLE libros(  

    titulo VARCHAR(100),
    autor VARCHAR(50),
    paginas INT

);

--Añadimos el id del libro
ALTER TABLE libros
ADD COLUMN id_libros INT AUTO_INCREMENT PRIMARY KEY;

--Creo la tabla videojuegos y la relacionamos con la de libros
CREATE TABLE videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_libro_videojuego INT,
    FOREIGN KEY (id_libro_videojuego) REFERENCES libros(id_libros)
);

--Añado elementos a la tabla libros
INSERT INTO libros VALUES(
    
    'Alas de Sangre',
    'Rebecca Yarros',
    '736',
    NULL
);

INSERT INTO libros VALUES(
    
    'Regretting You',
    'Colleen Hoover',
    '428',
    NULL
);

INSERT INTO libros VALUES(
    
    'Harry Potter',
    'J.K Rowling ',
    '736',
    NULL
);




--Ahora en videojuegos insertamos un juego relacionado y uno que no para ver

INSERT INTO videojuegos (nombre, id_libro_videojuego)
VALUES ('Hogwarts Legacy', 3);


INSERT INTO videojuegos (nombre, id_libro_videojuego)
VALUES ('Minecraft', NULL);

--Vemos la informacion insertada en las tablas para asegurarnos de que esta correcta.

SELECT * FROM libros;

SELECT * FROM videojuegos;