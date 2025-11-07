
######################################### Parte 4,5,6,7,8###################################################
import sqlite3
conexion = sqlite3.connect("empresa.db")
cursor = conexion.cursor()
print("Programa agenda SQLite v0.1 Ruth Sainz Santos-Olmo")

while True:
 print("Escoge una opción: \n1.-Crear cliente\n2.-Listar clientes\n3.-Actualizar clientes\n4.-Eliminar clientes\n5.-Buscar Cliente\n6.-Salir del programa")
 opcion = int(input("Selecciona una opción: "))
 if opcion == 1:
  
  nombre  = input("Introduce el nombre del nuevo cliente: ")
  apellido  = input("Introduce los apellidos del nuevo cliente: ")
  email  = input("Introduce el email del nuevo cliente: ")
 cursor.execute("""
   INSERT INTO clientes VALUES(
    NULL,'"""+nombre+"""','"""+apellido+"""','"""+email+"""'
    );
 """)

 
 if opcion == 2:
      cursor.execute('''
         SELECT * FROM clientes;
         ''')
      filas = cursor.fetchall()
      for fila in filas:
            print(fila)
 elif opcion == 3:
    identificador = input("Introduce el identificador a actializar: ")
    nombre  = input("Introduce el nombre del nuevo cliente: ")
    apellidos  = input("Introduce los apellidos del nuevo cliente: ")
    email  = input("Introduce el email del nuevo cliente: ")
    cursor.execute("""
         UPDATE clientes SET
         nombre = '"""+nombre+"""',
         apellido = '"""+apellido+"""',
         email = '"""+email+"""'
         WHERE Identificador = """+identificador+""";
      """)
 elif opcion == 4:
    identificador = input("Introduce el identificador a eliminar: ")
    cursor.execute("""
        DELETE FROM clientes WHERE Identificador = """+identificador""";
    """)
 elif opcion == 5:
        texto = input("Introduce texto para buscar (nombre, apellidos o email): ")
        cursor.execute("""
            SELECT * FROM clientes
            WHERE nombre LIKE ? OR apellidos LIKE ? OR email LIKE ?;
        """, (f'%{texto}%', f'%{texto}%', f'%{texto}%'))
        resultados = cursor.fetchall()
        if resultados:
            for cliente in resultados:
                print(cliente)
   
 elif opcion == 6:
    print("byebye")
    exit()
