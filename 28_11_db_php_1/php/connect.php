<?php

require 'config.php';

$dns = "mysql:host=$host;dbname=$db;chartset=UTF8";

try{
    $conn = new PDO($dns, $user, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if ($conn) {
        echo "Connected to the $db database successfully!";
    }
}catch(PDOException $e){
    echo $e->getMessage();
}
?>

