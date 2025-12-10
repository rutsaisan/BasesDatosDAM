<?php
        $host = "172.24.103.203";
        $user = "periodico";
        $pass = "Periodico123$";
        $db   = "periodico";
        $conexion = new mysqli($host, $user, $pass, $db);
        $sql = "SELECT * FROM noticias";
        $resultado = $conexion->query($sql);
        while ($fila = $resultado->fetch_assoc()) {
          echo '
            <article>
              <h3>'.$fila['titulo'].'</h3>
              <time>'.$fila['fecha_publicacion'].'</time>
              <p>'.$fila['autor_id'].'</p>
              <p>'.$fila['contenido'].'</p>
            </article>
          ';
        }
        $conexion->close();
      ?>