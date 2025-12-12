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
    <form action="", method="POST"> 
        Name: <input type="text", name="name" required><br>
        Email: <input type="text", name="email" required><br>
        <input type="submit">
    </form>
    <?php
        require 'check_presence.php';
        $name = $_POST["name"];
        $email = $_POST["email"];
        
        if(is_registered($name, $email)){
            /*show the product list below, use the get_products class, method products() return and array with every row*/
            
            require_once "get_products.php";
            $products = products();
            echo build_table($products);
            
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