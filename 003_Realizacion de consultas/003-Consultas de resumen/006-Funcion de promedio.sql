--sudo mysql - root -p

USE clientes;

SELECT 
ROUND(AVG(edad))
FROM clientes;

SELECT 
FLOOR(AVG(edad))           -- Para la edad usamos el FLOOR
FROM clientes;

SELECT 
CEIL(AVG(edad))
FROM clientes;