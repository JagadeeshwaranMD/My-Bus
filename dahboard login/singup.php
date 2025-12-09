<?php
$servername = "localhost";
$username = "root"; // Change if needed
$password = ""; // Change if needed
$dbname = "my_bus"; // Updated database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$first_name = $_POST['first_name'];
$last_name = $_POST['last_name'];
$email = $_POST['email'];
$password = $_POST['password'];
$confirm_password = $_POST['confirm_password'];
$phone = $_POST['phone'];
$age = $_POST['age'];
$address = $_POST['address'];
$city = $_POST['city'];
$state = $_POST['state'];

// Validate password confirmation
if ($password !== $confirm_password) {
    die("Passwords do not match!");
}

// Hash password
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Handle profile image upload
$profile_image = $_FILES['profile_image']['name'];
$target_dir = "uploads/";
$target_file = $target_dir . basename($profile_image);
move_uploaded_file($_FILES["profile_image"]["tmp_name"], $target_file);

// Insert data into database
$sql = "INSERT INTO users (first_name, last_name, email, password, phone, age, address, city, state, profile_image) 
        VALUES ('$first_name', '$last_name', '$email', '$hashed_password', '$phone', '$age', '$address', '$city', '$state', '$profile_image')";

if ($conn->query($sql) === TRUE) {
    echo "Sign up successful! <a href='user-login.html'>Login Here</a>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
