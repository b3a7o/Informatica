    <?php
        if($_POST && isset($_POST['name'], $_POST['email'])){ 
            $pdo = require_once 'connect.php';
            $name = $_POST['name'];
            $email = $_POST['email'];
            $sql = "INSERT INTO customers(name, email) VALUES (:name, :email)";
            $statement = $conn->prepare($sql);
            $statement->bindParam(":name", $name);
            $statement->bindParam(":email", $email);
            $statement->execute();
        }
    ?>
