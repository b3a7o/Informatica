Implementare una pagina di acquisto dei prodotti, nella quale il cliente indica i propri dati,  
sceglie il prodotto e indica la quantità. La pagina PHP dovrà calcolare  e mostrare il costo dell'acquisto.

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping</title>
</head>
<body>
    <form action="", method="POST"> 
        Name: <input type="text", name="name" required><br>
        Email: <input type="text", name="email" required><br>
        <input type="submit">
    </form>
    <?php
        $name = $_POST["name"];
        $email = $_POST["email"];
        require 'check_presence.php';

        if(is_registered($name, $email)){
            
        }else{
            ?>
            <form action="save_customer.php", method="post">
                <button>REGISTER HERE</button>
            </form>
            <?php
        }
    ?>
</body>
</html>