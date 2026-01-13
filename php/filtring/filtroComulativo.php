<?php
$dati = [
    "email" => "utente@esempi.com",
    "eta" => 89,
    "url" => "https://www.esempi.com"
];

$filtri=[
    "email" => FILTER_VALIDATE_EMAIL,
    "eta" => [
        "filter" => FILTER_VALIDATE_INT,
        "options" => ["min_range" => 25, "max_range" => 125]],
    "url" => FILTER_VALIDATE_URL
];

$risultato = filter_var_array($dati, $filtri);
print_r($risultato);