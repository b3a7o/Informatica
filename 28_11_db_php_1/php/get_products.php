<?php
function products(){
    try {
        $conn = require 'connect.php';
        $sql = 'SELECT DISTINCT name FROM products WHERE is_available = 1';
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>