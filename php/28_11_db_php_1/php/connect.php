<?php

require __DIR__ . '/config.php';

$dns = "mysql:host=$host;dbname=$db;charset=UTF8";
$conn = null;

try{
    $conn = new PDO($dns, $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
    die("Errore di connessione: " . $e->getMessage());
}

return $conn;
?>

