-- Entro a mysql con sudo mysql -u root -p

--Entro a la base de datos que vaya a usar con el comando USE y el nombre de la base de dato. Ejemplo: USE ejercicios_bbdd;

--Creo la tabla:

CREATE TABLE "clientes"(
    
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(50)

);

-- Le añado los datos a la tabla:
INSERT INTO clientes VALUES(
    
    NULL,
    'Laura Gómez',
    'laura@gmail.com',
    '612345678',
    'Madrid'
);

INSERT INTO clientes VALUES(

    NULL,
    'Alison Martínez',
    'alison@gmail.com',
    '615609749',
    'Valencia'
);

INSERT INTO clientes VALUES(
    
    NULL,
    'Carlos Ruiz',
    'carlos@hotmail.com',
    '699876543',
    'Barcelona'
);

--Ahora veo la tabla con los datos que he metido:

SHOW TABLES;
SELECT * FROM  clientes;