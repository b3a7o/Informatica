<?php //Sanificazione del URL

$url = "https://www.esempi.com/test?param=<script>alert(1)</script>";
$sanitizeURL = filter_var($url, FILTER_SANITIZE_URL);
echo "URL ripulito! Eccolo: $sanitizeURL \r";

?>