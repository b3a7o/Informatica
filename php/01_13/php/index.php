<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        session_start();

        if (isset($_SESSION['session_id'])) {
            unset($_SESSION['session_id']);
        }
        header('Location: ../login.html');
        exit;
    ?>
</body>
</html>

