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

--Verificamos la estructura de la tabla cliente scon el DESCRIBE
DESCRIBE clientes;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| identificador | int          | NO   | PRI | NULL    | auto_increment |
| dninie        | varchar(9)   | YES  |     | NULL    |                |
| nombre        | varchar(50)  | YES  |     | NULL    |                |
| apellidos     | varchar(255) | YES  |     | NULL    |                |
| email         | varchar(100) | YES  |     | NULL    |                |
| direccion     | varchar(255) | YES  |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
6 rows in set (0.01 sec)