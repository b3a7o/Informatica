<?php 
    session_start();
    require_once(__DIR__."/connect.php");

    if(isset($_SESSION['session_id'])){
        header('Location: index.php');
        exit;
    }
    
    if(isset($_POST['login'])){
        $username = $_POST["username"] ?? '';
        $password = $_POST['password'] ?? '';

        if(empty($username) || empty($password)){
            echo "Ypu must fill every camp in order to login";
        }else{
            $query = "
                SELECT username, password, badge_number
                FROM users
                WHERE username = :username
            ";
            $check = $conn->prepare($query);
            $check->bindParam(":username", $username, PDO::PARAM_STR);
            $check->execute();

            $user = $check->fetch(PDO::FETCH_ASSOC);

            if($user && password_verify($password, $user['password'])){
                session_regenerate_id();
                $_SESSION['session_id'] = session_id();
                $_SESSION['session_user'] = $user['username'];
                $_SESSION['badge_number'] = $user['badge_number'];

                header('Location: mainPage.php');
                exit;
            }else{
                echo "password or username incorrect";
                echo "<form action='../login.html'><button type='submit'>Go Back</button></form>";
            }
        }
    }
?>