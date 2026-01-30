<?php 
    $host = "127.0.0.1";
    $db = "tutti_in_forma";
    $user = "root";
    $password = "";
    //$port = 3307;

    $dns = "mysql:host=$host;dbname=$db;charset=UTF8"; //port after host (3307 in case default 3306 is being used)

    try{
        $conn = new PDO($dns, $user, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }catch(PDOException $e){
        die("Errore di connessione: " . $e->getMessage());
    }

    return $conn;
?>

