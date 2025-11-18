--sudo mysql -u root -p

CREATE DATABASE clientes;

USE clientes;

CREATE TABLE clientes(
    nombre VARCHAR(255),
    apellidos VARCHAR (255),
    edad INT
);

INSERT INTO clientes VALUES("Juan", "Lopez", 45);
INSERT INTO clientes VALUES("Javier", "Martinez", 46);
-- Usamos IA para crear mas inserts
INSERT INTO clientes VALUES("Ana", "Gómez", 34);
INSERT INTO clientes VALUES("Luis", "Fernández", 52);
INSERT INTO clientes VALUES("María", "López", 28);
INSERT INTO clientes VALUES("Carlos", "Ruiz", 41);
INSERT INTO clientes VALUES("Lucía", "Sánchez", 36);
INSERT INTO clientes VALUES("Pedro", "Ramírez", 47);
INSERT INTO clientes VALUES("Elena", "Torres", 30);
INSERT INTO clientes VALUES("Miguel", "Vargas", 55);
INSERT INTO clientes VALUES("Laura", "Castro", 25);
INSERT INTO clientes VALUES("Jorge", "Moreno", 39);
INSERT INTO clientes VALUES("Isabel", "Navarro", 33);
INSERT INTO clientes VALUES("Raúl", "Ortega", 44);
INSERT INTO clientes VALUES("Carmen", "Delgado", 29);
INSERT INTO clientes VALUES("Andrés", "Iglesias", 50);
INSERT INTO clientes VALUES("Patricia", "Reyes", 38);
INSERT INTO clientes VALUES("Sergio", "Cabrera", 42);
INSERT INTO clientes VALUES("Beatriz", "Molina", 31);
INSERT INTO clientes VALUES("Alberto", "Silva", 45);
INSERT INTO clientes VALUES("Natalia", "Rojas", 27);
INSERT INTO clientes VALUES("Héctor", "Peña", 49);
INSERT INTO clientes VALUES("Rocío", "Campos", 35);
INSERT INTO clientes VALUES("Iván", "Herrera", 40);
INSERT INTO clientes VALUES("Marta", "Vega", 32);
INSERT INTO clientes VALUES("Óscar", "Soto", 53);
INSERT INTO clientes VALUES("Claudia", "Medina", 26);
INSERT INTO clientes VALUES("Rubén", "Cortés", 48);
INSERT INTO clientes VALUES("Sara", "Arias", 37);
INSERT INTO clientes VALUES("Adrián", "Fuentes", 43);
INSERT INTO clientes VALUES("Paula", "Luna", 24);
INSERT INTO clientes VALUES("Diego", "Núñez", 51);