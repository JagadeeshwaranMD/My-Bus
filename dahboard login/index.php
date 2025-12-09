<?php
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: user-login.html"); // Redirect to login page if not logged in
    exit();
}

$user = $_SESSION['user']; // Get logged-in user details
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bus Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            background: url('bus-background.jpg') no-repeat center center/cover;
            overflow: hidden;
        }
        .header {
            background: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 15px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: url('images/th.gif');
            background-size: cover;
            
        }
        .search-form {
            display: flex;
            gap: 10px;
        }
        .search-form input, .search-form button {
            padding: 8px;
            border-radius: 5px;
            border: none;
        }
        .search-form button {
            background: #f39c12;
            color: white;
            cursor: pointer;
        }
        .sidebar {
            width: 250px;
            background: url('images/wC3PRqQaao3QHOCLrZGgBfoghiVYYLhCauQU.gif') no-repeat center center/cover;
            color: white;
            padding: 20px;
            box-shadow: 2px 0px 10px rgba(0, 0, 0, 0.5);
            display: flex;
            flex-direction: column;
            gap: 15px;
            height: 100vh;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            display: block;
            padding: 10px 15px;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            transition: background 0.3s, color 0.3s;
        }
        .sidebar a:hover {
            background: rgba(255, 204, 0, 0.8);
            color: black;
        }
        .main-content {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            font-size: 2rem;
        }
        .profile-container {
            position: relative;
            display: inline-block;
        }
        .profile-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            cursor: pointer;
            border: 2px solid white;
        }
        .dropdown-menu {
            position: absolute;
            top: 60px;
            right: 0;
            background: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            padding: 10px;
            width: 220px;
            display: none;
        }
        .dropdown-menu.active {
            display: block;
        }
        .dropdown-menu p {
            margin: 0;
            padding: 5px 10px;
            font-size: 14px;
            color: black;
            font-weight: bold;
        }
        .dropdown-menu a {
            display: block;
            padding: 8px 10px;
            text-decoration: none;
            color: black;
            font-size: 14px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .dropdown-menu a:hover {
            background: rgba(0, 0, 0, 0.1);
        }
        .dropdown-menu .logout-btn {
            background: red;
            color: white;
            padding: 8px;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            margin-top: 10px;
            display: block;
        }
         
    </style>
</head>
<body>

    <!-- Header with Search Form -->
    <header class="header">
        <h2>Bus Booking System</h2>
        <form class="search-form" action="search-results.php" method="POST">
            <input type="text" name="from_location" placeholder="From" required>
            <input type="text" name="to_location" placeholder="To" required>
            <input type="date" name="travel_date" required>
            <button type="submit">Search</button>
        </form>
        <div class="profile-container">
            <img src="<?php echo $user['profile_image']; ?>" alt="Profile Image" class="profile-image" id="profileImage">
            <div class="dropdown-menu" id="profileDropdown">
                <p>👤 <?php echo $user['first_name'] . " " . $user['last_name']; ?></p>
                <hr>
                <a href="profile.php">📄 Profile</a>
                <a href="settings.php">⚙️ Settings</a>
                <a href="update_user.php">🔄 Update Details</a>
                <hr>
                <a href="logout.php" class="logout-btn">🚪 Logout</a>
            </div>
        </div>
         <!-- Main Content -->
    <!-- <div class="main-content">
        <h1>Welcome, <?php echo $user['first_name']; ?>!</h1>
    </div> -->
    </header>

    <!-- Sidebar -->
    <nav class="sidebar">
    <a href="#">🏠 Home</a>
    <a href="#">🚌 Bus Booking</a>
    <a href="#">🎫 View Ticket</a>
    <a href="#">🌍 Trip</a>
    <a href="#">⚙️ Settings</a>
    <a href="about.php">ℹ️ About</a> <!-- New About Page -->
</nav>

    <div class="main">
    
    </div>
   

    <script>
        document.getElementById('profileImage').addEventListener('click', function() {
            document.getElementById('profileDropdown').classList.toggle('active');
        });

        // Close dropdown when clicking outside
        document.addEventListener('click', function(event) {
            var dropdown = document.getElementById('profileDropdown');
            var profileImage = document.getElementById('profileImage');
            if (!dropdown.contains(event.target) && event.target !== profileImage) {
                dropdown.classList.remove('active');
            }
        });
    </script>

</body>
</html>
