-- sudo mysql -u root -p

SHOW DATABASES;

-- Una vez que conozco el nombre de la base de datos
-- Me voy a la terminal y escribo:

-- sudo mysqldump -u root -p blog2526 > backupblog2526.sql

Creo carpeta
rutsaisan@RedHood:~$ cd Escritorio/
rutsaisan@RedHood:~/Escritorio$ mkdir copia
rutsaisan@RedHood:~/Escritorio$ cd copia
rutsaisan@RedHood:~/Escritorio/copia$ sudo mysqldump -u root -p blog2526 > backupblog2526.sql
[sudo] contraseña para rutsaisan: 
Enter password: 
rutsaisan@RedHood:~/Escritorio/copia$ 