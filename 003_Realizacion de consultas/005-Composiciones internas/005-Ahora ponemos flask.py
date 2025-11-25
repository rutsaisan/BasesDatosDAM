import mysql.connector 
from flask import Flask

conexion = mysql.connector.connect(
  host="localhost",
  user="tiendaclase",
  password="TiendaClase123$",
  database="tiendaclase"
)                                      
  
app = Flask(__name__)

@app.route("/clientes")
def inicio():
	cursor = conexion.cursor() 
	cursor.execute("SELECT * FROM clientes;")  

	filas = cursor.fetchall()
	return json.dumps(filas)

if __name__ == "__main__":
	app.run(debug=True) 

# http://127.0.0.1:5000/clientes