-- Entro a mysql con sudo mysql -u root -p

--Entro a la base de datos que vaya a usar con el comando USE ejercicios_bbdd;

--Creo la tabla favoritos:
CREATE TABLE favoritos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(20),
    nombre VARCHAR(200),
    fecha_ultima_visualizacion DATE

);

--Añado elementos a la tabla favoritos
INSERT INTO favoritos VALUES(
    
    NULL,
    'Videojuego',
    'The Legend of Zelda: Breath of the Wild',
    '2011-12-15'
);

INSERT INTO favoritos VALUES(
    
    NULL,
    'Serie',
    'Stranger Things',
    '2024-10-13'
    
);

INSERT INTO favoritos VALUES(
    
    NULL,
    'Videojuegos',
    'Minecraft ',
    '2022-06-06'

);

--Vemos la informacion insertada en las tablas.

SELECT * FROM favoritos;