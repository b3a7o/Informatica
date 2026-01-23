<?php
        
        if($_SERVER["REQUEST_METHOD"] == "POST"&& $_POST && isset($_POST['username'], $_POST['password'])){ 
            $conn = require __DIR__ . '/connect.php';
            
            $name = $_POST['username'];
            $email = $_POST['password'];

            $sql = "INSERT INTO members(username, password) VALUES (:username, :password)";
            $statement = $conn->prepare($sql);
            $statement->bindParam(":username", $username);
            $statement->bindParam(":password", $password);
            
            if($statement->execute()){
                header("Location: index.php");
                exit();
            }
        }
    ?>




<?php
require_once('connect.php');

if (isset($_POST['register'])) {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    $isUsernameValid = filter_var(
        $username,
        FILTER_VALIDATE_REGEXP, [
            "options" => [
                "regexp" => "/^[a-z\d_]{3,20}$/i"
            ]
        ]
    );
    $pwdLenght = mb_strlen($password);
    
    if (empty($username) || empty($password)) {
        $msg = 'Compila tutti i campi %s';
    } elseif (false === $isUsernameValid) {
        $msg = 'invalid Username only alphanumeric characters and underscores';
    } elseif ($pwdLenght < 8 || $pwdLenght > 20) {
        $msg = 'Lunghezza minima password 8 caratteri.
                Lunghezza massima 20 caratteri';
    } else {
        $password_hash = password_hash($password, PASSWORD_BCRYPT);

        $query = "
            SELECT id
            FROM users
            WHERE username = :username
        ";
        
        $check = $pdo->prepare($query);
        $check->bindParam(':username', $username, PDO::PARAM_STR);
        $check->execute();
        
        $user = $check->fetchAll(PDO::FETCH_ASSOC);
        
        if (count($user) > 0) {
            $msg = 'Username già in uso %s';
        } else {
            $query = "
                INSERT INTO users
                VALUES (0, :username, :password)
            ";
        
            $check = $pdo->prepare($query);
            $check->bindParam(':username', $username, PDO::PARAM_STR);
            $check->bindParam(':password', $password_hash, PDO::PARAM_STR);
            $check->execute();
            
            if ($check->rowCount() > 0) {
                $msg = 'Registrazione eseguita con successo';
            } else {
                $msg = 'Problemi con l\'inserimento dei dati %s';
            }
        }
    }
    
    printf($msg, '<a href="../register.html">torna indietro</a>');
}