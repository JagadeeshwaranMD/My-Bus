<?php
include("db_connect.php"); // Ensure connection to database

$new_password = 'newpassword'; // Set your new password
$hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

$sql = "UPDATE admin_users SET password = ? WHERE email = 'admin@example.com'";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $hashed_password);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo "Password updated successfully!";
} else {
    echo "Failed to update password!";
}

$stmt->close();
$conn->close();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <h3 class="text-center">Admin Login</h3>
                <?php if (isset($error)) { echo "<div class='alert alert-danger'>$error</div>"; } ?>
                <form method="POST" action="">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <button type="submit" name="login" class="btn btn-primary w-100"> Login </button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
