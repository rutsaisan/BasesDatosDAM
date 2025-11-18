--sudo mysql -u root -p

CREATE DATABASE Series;

USE Series;

CREATE TABLE series(
    nombre VARCHAR(255),
    tematicas VARCHAR (255),
    calificacion INT
);

INSERT INTO series VALUES("Stranger Things", "Miedo, Ciencia Ficción", 9);
INSERT INTO series VALUES("Teen Wolf", "Miedo, Sobrenatural, Criaturas mitológicas, Acción", 10);
-- Usamos IA para crear mas inserts
INSERT INTO series VALUES("Breaking Bad", "Crimen, Drama, Suspenso", 10);
INSERT INTO series VALUES("The Witcher", "Fantasía, Acción, Aventura", 8);
INSERT INTO series VALUES("Dark", "Misterio, Ciencia Ficción, Thriller", 9);
INSERT INTO series VALUES("The Mandalorian", "Ciencia Ficción, Aventura, Acción", 8);
INSERT INTO series VALUES("Black Mirror", "Ciencia Ficción, Distopía, Tecnología", 9);
INSERT INTO series VALUES("Game of Thrones", "Fantasía, Drama, Acción", 9);
INSERT INTO series VALUES("The Crown", "Histórica, Drama, Política", 8);
INSERT INTO series VALUES("Narcos", "Crimen, Drama, Biografía", 9);
INSERT INTO series VALUES("The Office", "Comedia, Trabajo, Cotidiano", 8);
INSERT INTO series VALUES("Friends", "Comedia, Romance, Amistad", 9);
INSERT INTO series VALUES("Sherlock", "Misterio, Crimen, Drama", 9);
INSERT INTO series VALUES("Vikings", "Histórica, Acción, Aventura", 8);
INSERT INTO series VALUES("Peaky Blinders", "Crimen, Drama, Histórica", 9);
INSERT INTO series VALUES("The Boys", "Acción, Superhéroes, Satírica", 9);
INSERT INTO series VALUES("Lucifer", "Sobrenatural, Crimen, Comedia", 8);
INSERT INTO series VALUES("House of Cards", "Política, Drama, Thriller", 8);
INSERT INTO series VALUES("How I Met Your Mother", "Comedia, Romance, Amistad", 8);
INSERT INTO series VALUES("Lost", "Misterio, Aventura, Drama", 8);
INSERT INTO series VALUES("Dexter", "Crimen, Thriller, Drama", 9);
INSERT INTO series VALUES("Supernatural", "Sobrenatural, Misterio, Aventura", 8);
INSERT INTO series VALUES("Arrow", "Acción, Superhéroes, Drama", 7);
INSERT INTO series VALUES("The Flash", "Acción, Ciencia Ficción, Superhéroes", 8);
INSERT INTO series VALUES("The Walking Dead", "Miedo, Drama, Apocalíptico", 8);
INSERT INTO series VALUES("Sense8", "Ciencia Ficción, Drama, Misterio", 8);
INSERT INTO series VALUES("Ozark", "Crimen, Drama, Thriller", 9);
INSERT INTO series VALUES("Money Heist", "Crimen, Suspenso, Acción", 9);
INSERT INTO series VALUES("The Umbrella Academy", "Superhéroes, Drama, Ciencia Ficción", 8);
INSERT INTO series VALUES("Euphoria", "Drama, Adolescencia, Psicología", 8);
INSERT INTO series VALUES("The 100", "Ciencia Ficción, Postapocalíptico, Aventura", 7);
INSERT INTO series VALUES("Riverdale", "Drama, Misterio, Adolescencia", 7);

SELECT 

nombre AS 'Nombre de la serie',
tematicas AS 'Temática de la serie',
calificacion AS 'Calificación del 1 al 10 de la serie'

FROM

series

ORDER BY
calificacion DESC, nombre ASC;