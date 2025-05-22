<?php

    class Conexion{
        public static function ConexionBD(){
            /*
            $serverName = "192.168.20.248"; // Nombre del servidor o dirección IP
            $database = "roldan_python"; // Nombre de la base de datos
            $username = "mariomunera"; // Nombre de usuario
            $password = "Victoria1107"; // Contraseña del usuario
            */
            
            $serverName = "localhost"; // Nombre del servidor o dirección IP
            $database = "inventario_sistemas"; // Nombre de la base de datos
            $username = "roldan"; // Nombre de usuario
            $password = "Roldan2025*"; // Contraseña del usuario
            
            
            

            try {

                $conn = new PDO("sqlsrv:server=$serverName;Database=$database",$username, $password);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                echo "Conexión exitosa!";
            } 
            catch (PDOException $e) {
                echo "Error de conexión: " . $e->getMessage();
            }
            return $conn;

            }
    }

    ?>