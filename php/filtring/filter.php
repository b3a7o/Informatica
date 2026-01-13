<?php

$email = "ut()ente@esempi.com";
echo "( " . $email . " ) ";

if(filter_var($email, FILTER_VALIDATE_EMAIL)){
    echo "Email valida: $email\r";

}else{
    echo "Email non valida. \r";
}

$email = filter_var($email, FILTER_SANITIZE_EMAIL);
echo "Email ripulita! Eccola: $email\r\r";

?>

