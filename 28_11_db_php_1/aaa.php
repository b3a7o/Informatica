<?php
    $email = "ut(ent)e@esempi.com";

    if(filer_var($email, FILTER_VALIDATE_EMAIL)){
        echo "Email valida: $email\n"
    }else{
        echo "Email non valida\n";
    }
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);
    echo "Email SANIFICATA: $email\n";
?>

<?php
    $numero = "150";
    $options[
        "options" => [
            "min_range"=>1,
            "max_range"=>100
        ]
    ];
    if (filter_var($numero, FILTER_VALIDATE_INT, $options) !== false){
        echo "Numero valido: $numero\n";
    }
    else{
        echo "Numero fuori dal range\n"
    }
    $numero2 = "5+2+3pp"
    var_dump(filter_var($numero2, FILTER_SANITIZE_NUMBER_INT));

?>

<?php
$dati=[
    "email"=>"ut(ent)e@esempi.com",
    "eta"=>"25",
    "url"=> "https://www.esempi.com"
];

$filtri=[]
?>



<?php

    function ConvertSpace($string){
        return str_replace(" ", "_", $string);
    }

    $string = "mario arriva domani";
    echo filter_var($string, FILTER_CALLBACK, array("options"=>"strtoupper"));
?>