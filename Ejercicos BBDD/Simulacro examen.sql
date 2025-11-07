'''
Simulacro de examen:

Problema(común a los examenes) : Hacer un portafolio, que tenga una parte visible (web), y que tenga una parte de administración interna. 
Paso 1: Hacer una base de datos del portafolio. Existen dos entidades: Pieza (Identificador, PK, título, descripción, imagen, url, id_categoría FK), y Categoría ( Identificador PK, título,descripción).
Debe existir una FK entre Pieza y categoría. Hacer un join entre las dos tablas y una vista (view) de ese JOIN.
'''


-- Entro a mysql con sudo mysql -u root -p

--Creo Base Datos;
CREATE DATABASE portafolio;

--Nos aeguramos que se ha creado
SHOW DATABASES;

--Uso la base de datos.
USE portafolio;

--Creo la tablas:
CREATE TABLE Pieza(
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion VARCHAR(255),
    imagen VARCHAR (100),
    url VARCHAR (100),
    id_categoria INT

);

CREATE TABLE Categoria(
    Identificador INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion VARCHAR(255)

);

--Miramos que hemos creado bien
SHOW TABLES;

--################################## FOREIGN KEY #####################################
--Sirve para enlazar una tabla con otra

--Creamos una foreign key
ALTER TABLE Pieza
ADD FOREIGN KEY (id_categoria) 
REFERENCES Categoria (Identificador) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

--############################# PETICION CRUZADA ######################################

SELECT
Categoria.titulo,Categoria.descripcion,
Pieza.titulo,Pieza.descripcion,Pieza.imagen,Pieza.url
FROM Categoria
LEFT JOIN Pieza
ON Pieza.id_categoria = Categoria.Identificador;

--Por ultimo creamos una vista
CREATE VIEW vista_Categoria AS
SELECT
  Categoria.titulo AS titulo_categoria,
  Categoria.descripcion AS descripcion_categoria,
  Pieza.titulo AS titulo_pieza,
  Pieza.descripcion AS descripcion_pieza,
  Pieza.imagen,
  Pieza.url
FROM Categoria
LEFT JOIN Pieza ON Pieza.id_categoria = Categoria.Identificador;



-- Inserto datos:
INSERT INTO Categoria VALUES(
    NULL,
    'Escultura',
    'Obras tridimensionales talladas o modeladas en diversos materiales'

);

INSERT INTO Categoria VALUES(
    NULL,
    'Pintura',
    'Composiciones visuales realizadas con pigmentos sobre una superficie'

);

INSERT INTO Categoria VALUES(
    NULL,
    'Fotografía',
    'Capturas de imágenes mediante dispositivos ópticos'

);

INSERT INTO Pieza VALUES(
    NULL,
    'El Pensador',
    'Escultura de bronce de Auguste Rodin',
    'pensador.jpg',
    'https://museo.com/pensador',
    1

);

INSERT INTO Pieza VALUES(
    NULL,
    'La noche estrellada',
    'Pintura de Vincent van Gogh', 
    'noche_estrellada.jpg', 
    'https://museo.com/noche', 
    2

);

INSERT INTO Pieza VALUES(
    NULL,
    'Sombras urbanas', 
    'Fotografía en blanco y negro de paisajes urbanos', 
    'sombras.jpg', 
    'https://museo.com/sombras', 
    3

);

--Lo miro y compruebo (vemos que la vista se comporta como una tabla).
SELECT * FROM vista_Categoria;


+------------------+----------------------------------------------------------------------+---------------------+---------------------------------------------------+----------------------+----------------------------+
| titulo_categoria | descripcion_categoria                                                | titulo_pieza        | descripcion_pieza                                 | imagen               | url                        |
+------------------+----------------------------------------------------------------------+---------------------+---------------------------------------------------+----------------------+----------------------------+
| Escultura        | Obras tridimensionales talladas o modeladas en diversos materiales   | El Pensador         | Escultura de bronce de Auguste Rodin              | pensador.jpg         | https://museo.com/pensador |
| Pintura          | Composiciones visuales realizadas con pigmentos sobre una superficie | La noche estrellada | Pintura de Vincent van Gogh                       | noche_estrellada.jpg | https://museo.com/noche    |
| Fotografía       | Capturas de imágenes mediante dispositivos ópticos                   | Sombras urbanas     | Fotografía en blanco y negro de paisajes urbanos  | sombras.jpg          | https://museo.com/sombras  |
+------------------+----------------------------------------------------------------------+---------------------+---------------------------------------------------+----------------------+----------------------------+
3 rows in set (0.00 sec)

-- Creo un usuario:
CREATE USER 
'usuario_portafolio'@'localhost' 
IDENTIFIED  BY 'P0rtaF0li0*';

-- permite acceso a ese usuario
GRANT USAGE ON *.* TO 'usuario_portafolio'@'localhost';

-- quitale todos los limites que tenga
ALTER USER 'usuario_portafolio'@'localhost' 
REQUIRE NONE 
WITH MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

-- dale acceso a la base de datos portafolio
GRANT ALL PRIVILEGES ON portafolio.* 
TO 'usuario_portafolio'@'localhost';

-- recarga la tabla de privilegios
FLUSH PRIVILEGES;