<?php
session_start();
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: admin-login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }
        .container {
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">Manage Bus Bookings</h2>
    <form action="save_bus.php" method="POST" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Bus Name</label>
            <input type="text" name="bus_name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">From Address</label>
            <input type="text" name="from_address" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">To Address</label>
            <input type="text" name="to_address" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">From Date & Time</label>
            <input type="datetime-local" id="from_datetime" name="from_datetime" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">To Date & Time</label>
            <input type="datetime-local" id="to_datetime" name="to_datetime" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Duration (Hours)</label>
            <input type="text" id="duration" name="duration" class="form-control" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Bus Features</label>
            <textarea name="bus_features" class="form-control" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">One Seat Amount</label>
            <input type="number" name="seat_amount" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Bus Profile Image</label>
            <input type="file" name="bus_image" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Bus 360° Video</label>
            <input type="file" name="bus_video" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Save Booking</button>
    </form>
</div>

<script>
document.getElementById("from_datetime").addEventListener("change", calculateHours);
document.getElementById("to_datetime").addEventListener("change", calculateHours);

function calculateHours() {
    let fromDate = new Date(document.getElementById("from_datetime").value);
    let toDate = new Date(document.getElementById("to_datetime").value);

    if (fromDate && toDate) {
        let diffMs = toDate - fromDate; // Difference in milliseconds
        let diffHrs = diffMs / (1000 * 60 * 60); // Convert to hours

        if (diffHrs >= 0) {
            document.getElementById("duration").value = diffHrs.toFixed(2); // Show in decimal format
        } else {
            document.getElementById("duration").value = "Invalid Dates!";
        }
    }
}
</script>

</body>
</html>
