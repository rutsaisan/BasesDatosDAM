<table>
<?php
	$host = "172.24.103.203";
  $user = "tiendaonlinedamdaw";
  $pass = "Tiendaonlinedamdaw123$";
  $db   = "tiendaonlinedamdaw";

  $conexion = new mysqli($host, $user, $pass, $db);
	$resultado = $conexion->query("
  	SELECT * FROM cliente;
  ");
  while ($fila = $resultado->fetch_assoc()) {
  var_dump($fila);echo "<br><br>";
  	echo '
    <tr>
    	<td>'.$fila['nombre_cliente'].'</td>
      <td>'.$fila['apellidos'].'</td>
      <td>'.$fila['email'].'</td>
      <td>'.$fila['direccion'].'</td>
      <td>'.$fila['telefono'].'</td>
    </tr>
    ';
   }
?>
</table>