<?php
    function build_table($array){
        // start table
        $html = '<table>';
        // header row
        $html .= '<tr>';
        foreach($array[0] as $key=>$value){
                $html .= '<th>' . htmlspecialchars($key) . '</th>';
        }
        $html .= '</tr>';

        // data rows
        foreach( $array as $key=>$value){
            $html .= '<tr>';
            foreach($value as $key2=>$value2){
                $html .= '<td><button type="button">BUY</button></td>';
                $html .= '<td>' . htmlspecialchars($value2) . '</td>';
            }
            $html .= '</tr>';
        }

        // finish table and return it
        $html .= '</table>';
        return $html;
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping</title>
</head>
<body>
    <?php
    require 'check_presence.php';
    
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $name = isset($_POST["name"]) ? $_POST["name"] : "";
        $email = isset($_POST["email"]) ? $_POST["email"] : "";
    
        if(is_registered($name, $email)){
            /*show the product list below, use the get_products class, method products() return and array with every row*/
        
            require_once "get_products.php";
            $products = products();
            echo "<h3>Available Products:</h3>";
            echo build_table($products);
        }else{
            echo "<h3>You are not registered yet.</h3>";
            ?>
            <form action="save_customer.php", method="post">
                <button>REGISTER HERE</button>
            </form>
            <?php
        }
    }else{
        ?>
        <h1>Login</h1>
        <form action="", method="POST"> 
            Name: <input type="text", name="name" required><br>
            Email: <input type="text", name="email" required><br>
            <input type="submit" value="Login">
        </form>
        <?php
    }
    ?>
</body>
</html>