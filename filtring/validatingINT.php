<?php

$numero = "150";
$options = [
    "options" => [
        "min_range" => 25,
        "max_range" => 125
        ]
];

if (filter_var($numero, FILTER_VALIDATE_INT, $options)!==false){
    echo "$numero è valido!\n ";
}
else{
    echo "$numero numero fuori range!\n";
}

$numero2 = "52+3pp";
var_dump(filter_var($numero2, FILTER_SANITIZE_NUMBER_INT));
