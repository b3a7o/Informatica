<?php 
    session_start();
    require_once(__DIR__."/connect.php");

    if(isset($_SESSION['session_id'])){
        header('Location: php/index.php');
        exit;
    }
    
    if(isset($_POST['login'])){
        $username = $_POST["username"] ?? '';
        $password = $_POST['password'] ?? '';

        if(empty($username) || empty($password)){
            $msg = "Ypu must every camp in order to login";
        }else{
            $query = "
                SELECT username, password
                FROM users
                WHERE username = :username
            ";
            $check = $conn->prepare($query);
            $check->bindParam(":username", $username, PDO::PARAM_STR);
            $check->execute();

            $user = $check->fetch(PDO::FETCH_ASSOC);

            if(!$user || password_verify($password, $user['password'])){
                $msg = "password or username incorrect";
            }else{
                session_regenerate_id();
                $_SESSION['session_id'] = session_id();
                $_SESSION['session_user'] = $user['username'];

                header('Location: php/index.php');
                exit;
            }
        }
        print($msg);
        echo("<form action='login.html'><button type='submit'>Go Back</button></form>");
    }
?>