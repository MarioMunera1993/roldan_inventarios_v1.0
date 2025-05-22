<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php

        // --- Configuración de la conexión ---
        $serverName = "localhost\\ID1082"; // Ej: "localhost\SQLEXPRESS" o "192.168.1.100"
        $databaseName = "inventario_sistemas";
        $username = "roldan";
        $password = "Roldan2025*";

        try {
            // --- Conexión ---
            // DSN (Data Source Name) para SQL Server
            $conn = new PDO("sqlsrv:Server=$serverName;Database=$databaseName", $username, $password);

            // Configurar PDO para que lance excepciones en caso de error
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            echo "¡Conexión exitosa a SQL Server con PDO!<br>";

            
        } catch (PDOException $e) {
            echo "Error de conexión o consulta: " . $e->getMessage() . "<br>";
            // En un entorno de producción, no muestres detalles del error al usuario.
            // Regístralos en un archivo de log.
            // die("Error: No se pudo conectar a la base de datos.");
        } finally {
            // --- Cerrar la conexión ---
            // Con PDO, la conexión se cierra automáticamente cuando el script termina o cuando $conn se establece a null.
            // Pero es buena práctica hacerlo explícitamente si ya no la necesitas.
            $conn = null;
            echo "Conexión cerrada.<br>";
        }



        /* 

        // --- Ejemplo: Ejecutar una consulta SELECT ---
            $sql = "SELECT id, nombre, email FROM Usuarios"; // Cambia 'Usuarios' y las columnas por las de tu tabla
            $stmt = $conn->query($sql);

            echo "<h2>Resultados de la consulta:</h2>";
            echo "<ul>";
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<li>ID: " . htmlspecialchars($row['id']) .
                    " - Nombre: " . htmlspecialchars($row['nombre']) .
                    " - Email: " . htmlspecialchars($row['email']) . "</li>";
            }
            echo "</ul>";

            // --- Ejemplo: Usar Sentencias Preparadas (para INSERT, UPDATE, DELETE o SELECT con parámetros) ---
            $nuevoNombre = "Pedro Ejemplo";
            $nuevoEmail = "pedro.ejemplo@example.com";

            $sqlInsert = "INSERT INTO Usuarios (nombre, email) VALUES (:nombre, :email)";
            $stmtInsert = $conn->prepare($sqlInsert);

            // Vincular parámetros
            $stmtInsert->bindParam(':nombre', $nuevoNombre);
            $stmtInsert->bindParam(':email', $nuevoEmail);

            if ($stmtInsert->execute()) {
                echo "Nuevo registro insertado correctamente con ID: " . $conn->lastInsertId() . "<br>";
            } else {
                echo "Error al insertar el registro.<br>";
            }

        */

    ?>
    
</body>
</html>