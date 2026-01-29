<?php
require_once(__DIR__.'/connect.php');

if (isset($_POST['register'])) {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    $badge_number = $_POST['badge_number'] ?? '';
    $name = $_POST['name'] ?? '';
    $surname = $_POST['surname'] ?? '';
    $address = $_POST['address'] ?? '';
    $birth_date = $_POST['birth_date'] ?? '';
    $occupation = $_POST['occupation'] ?? '';
    $type = $_POST['type'] ?? '';

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
        header('Location: ../register.html');
        exit;
    } elseif (!$isUsernameValid) {
        header('Location: ../register.html');
        exit;
    } elseif ($pwdLenght < 8 || $pwdLenght > 20) {
        header('Location: ../register.html');
        exit;
    }

    try{
        conn->beginTransaction(); //serve perchè se qualcosa da errore, non si salva quello fatto prima
        $check = $conn->prepare(
            "SELECT username 
            FROM users WHERE 
            username = ? OR badge_number = ?"
        );
        $check->execute([$username, $badge_number]);
        if ($check->rowCount() > 0) {
            throw new Exception("username or badge alredy being used.");
        }

        //members
        $membersQuery = "INSERT INTO members (badge_number, name, surname, address, birth_date, occupation, type) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmtMembers = $conn->prepare($membersQuery);
        $stmtMembers->execute([$badge_number, $name, $surname, $address, $birth_date, $occupation, $type]);
        
        //tipo di atleta
        if ($type === 'athlete') {
            $last_med = $_POST['last_medical'] ?? null;
            $fed_date = $_POST['federal_date'] ?? null;
            $stmtAthlete = $conn->prepare("INSERT INTO athletes (badge_number, last_medical_certificate, federal_badge_date, is_individual) VALUES (?, ?, ?, 1)");
            $stmtAthlete->execute([$badge_number, $last_med, $fed_date]);
        } 
        
        elseif ($type === 'regular') {
            $stmtRegular = $conn->prepare("INSERT INTO regulars (badge_number, courses_number_last_5_years) VALUES (?, 0)");
            $stmtRegular->execute([$badge_number]);
        } 
        
        elseif ($type === 'honorary') {
            $role = $_POST['role'] ?? 'Membro Onorario';
            $stmtHonorary = $conn->prepare("INSERT INTO honorary (badge_number, role) VALUES (?, ?)");
            $stmtHonorary->execute([$badge_number, $role]);
        }
        
        
        $password_hash = password_hash($password, PASSWORD_BCRYPT);
        
        $stmtUser = $conn->prepare("INSERT INTO users (username, password, badge_number) VALUES (?, ?, ?)");
        
        $stmtUser->execute([$username, $password_hash, $badge_number]);
        $conn->commit();
        
        echo "REGISTERED SUCCESFULLY";
        echo "wellcome $username";
        echo "<form action='../login.html'><button type='submit'>login</button></form>";
    }catch(Exception $e){
        $conn->rollback();
        $msg = "Errore : " . $e->getMessage();
        header('Location: ../register.html');
        exit;
    }



/*


PROVA INIZIALE 
        $query = "
            SELECT id
            FROM users
            WHERE username = :username
        ";
        
        $check = $conn->prepare($query);
        $check->bindParam(':username', $username, PDO::PARAM_STR);
        $check->execute();
        
        $user = $check->fetchAll(PDO::FETCH_ASSOC);
        
        if (count($user) > 0) {
            $msg = 'Username già in uso %s';
            $red = true;
            
        } else {
            $query = "
                INSERT INTO users
                VALUES (0, :username, :password)
            ";
        
            $check = $conn->prepare($query);
            $check->bindParam(':username', $username, PDO::PARAM_STR);
            $check->bindParam(':password', $password_hash, PDO::PARAM_STR);
            $check->execute();
            
            if ($check->rowCount() > 0) {
                $msg = 'resitered succesfully';
            } else {
                $msg = 'error ocured with the datas';
                $red = true;
            }
        }
    }
    print($msg);
    if($red){
        header(__DIR__."register.php");
    }   
    echo("<form action='../login.html'><button type='submit'>login</button></form>");

*/
}
?>      