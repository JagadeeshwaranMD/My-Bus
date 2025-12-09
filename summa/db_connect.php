<?php
$servername = "localhost"; // XAMPP default
$username = "root"; // Default username
$password = ""; // Default password is empty
$database = "my_bus"; // Ensure this database exists in phpMyAdmin

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
