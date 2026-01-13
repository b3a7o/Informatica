    <?php
        if($_SERVER["REQUEST_METHOD"] == "POST"&& $_POST && isset($_POST['name'], $_POST['email'])){ 
            $conn = require __DIR__ . '/connect.php';
            
            $name = $_POST['name'];
            $email = $_POST['email'];

            $sql = "INSERT INTO customers(name, email) VALUES (:name, :email)";
            $statement = $conn->prepare($sql);
            $statement->bindParam(":name", $name);
            $statement->bindParam(":email", $email);
            
            if($statement->execute()){
                header("Location: buy_products.php");
                exit();
            }
        }
    ?>
