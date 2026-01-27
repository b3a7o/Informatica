-- Active: 1764659229914@@127.0.0.1@3306@tutti_in_forma
<?php 
    $host = "127.0.0.1";
    $db = "tutti_in_forma";
    $user = "root";
    $password = "";
    //$port = 3306;

    $dns = "mysql:host=$host;dbname=$db;charset=UTF8";

    try{
        $conn = new PDO($dns, $user, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }catch(PDOException $e){
        die("Errore di connessione: " . $e->getMessage());
    }

    return $conn;
?>

