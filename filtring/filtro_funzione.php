<?php

function convertSpace($string){
    return str_replace(" ", "_", $string);
}

$string = "mario arriva domani!";
$string = filter_var($string, FILTER_CALLBACK, array("options" => "strtoupper"));

echo filter_var($string, FILTER_CALLBACK, array("options" => "convertSpace"));