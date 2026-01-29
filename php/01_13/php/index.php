<?php
    session_start();
    if (isset($_SESSION['session_id'])) {
        header('Location: mainPage.php');
        exit;
    }else{
        header('Location: ../login.html');
        exit;
    }
        
?>


