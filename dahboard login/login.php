<?php
session_start(); // Start session

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "my_bus";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT * FROM users WHERE email='$email'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    
    // Verify password
    if (password_verify($password, $row['password'])) {
        $_SESSION['user'] = $row; // Store user data in session
        header("Location: index.php"); // Redirect to main page
        exit();
    } else {
        echo "<script>alert('Incorrect password!'); window.location.href='user-login.html';</script>";
    }
} else {
    echo "<script>alert('User not found!'); window.location.href='user-login.html';</script>";
}

$conn->close();
?>
