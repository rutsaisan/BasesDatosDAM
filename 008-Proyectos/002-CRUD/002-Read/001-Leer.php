<?php
	session_start(); // Arranco una sesion
  $host = "172.24.103.203";
  $user = "empleados";
  $pass = "Empleados123$";
  $db   = "empleados";

  $conexion = new mysqli($host, $user, $pass, $db);
  
	// Comprobacion exitosa pero mirando los datos que vienen del formulario en POST
  $sql = "
  	SELECT * FROM empleados;
  ";
	
  $resultado = $conexion->query($sql);
  
	var_dump($resultado);			// Vomito en pantalla y ya luego formateare
  	
  $conexion->close();
  
?>