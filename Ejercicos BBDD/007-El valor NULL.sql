-- Entro a mysql con sudo mysql -u root -p

--Veo las bases de datos que tengo
 SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| biblioteca25       |
| ejemploclaves      |
| ejercicios_bbdd    |
| empresadam         |
| information_schema |
| mysql              |
| performance_schema |
| portafolio         |
| sys                |
+--------------------+
9 rows in set (0.00 sec)

--Uso la base de datos empresadam
USE empresadam;

-- Muestro la stablas en la base de datos
SHOW TABLES;

+----------------------+
| Tables_in_empresadam |
+----------------------+
| clientes             |
| productos            |
+----------------------+
2 rows in set (0.00 sec)


--CReo la tabla pedidos:
CREATE TABLE pedidos (
  numerodepedido VARCHAR(20) NOT NULL,
  cliente VARCHAR(50) NOT NULL,
  producto VARCHAR(255) NOT NULL
);

--Verifico que se ha creado la tabla:
SHOW TABLES;

+----------------------+
| Tables_in_empresadam |
+----------------------+
| clientes             |
| pedidos              |
| productos            |
+----------------------+
3 rows in set (0.00 sec)