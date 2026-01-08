<?php
    function is_registered($name, $email){
            if($_POST && isset($_POST['name'], $_POST['email'])){ 
                $conn = require __DIR__ . '/connect.php';
                $name = $_POST['name'];
                $email = $_POST['email'];
                $sql = "SELECT name, email FROM customers WHERE name = :name AND email = :email";
                $statement = $conn->prepare($sql);
                $statement->bindParam(":name", $name);
                $statement->bindParam(":email", $email);
                $statement->execute();
                return $row = $statement->fetch(PDO::FETCH_ASSOC);
                if($row){
                    return true;
                }else{
                    return false;
                }
            }
        }
?>
