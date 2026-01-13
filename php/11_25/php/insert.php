    <?php 
    $pdo = require_once 'connect.php';
    
    $name = 'amas';
    $sql = "INSERT INTO publisher(name) VALUES(:name)";

    $statement = $pdo->prepare($sql);

    $statement->execute([":name" => $name]);

    $publisher_id = $pdo-> lasatInsertId();

    echo "The publisher id ".$publisher_id." was inserted" ;
    ?>