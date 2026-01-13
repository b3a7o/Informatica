    <?php

    require 'config.php';

    $dns = "mysql:host=$host;dbname=$db;chartset=UTF8";

    try{
        $options = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION];

        $conn = new PDO($dns, $username, $password, $options);

        if ($conn) {
            echo "Connected to the $db database successfully!";
        }
    }catch(PDOException $e){
        echo $e->getMessage();
    }
    ?>

    