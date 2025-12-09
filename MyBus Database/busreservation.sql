-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2025 at 06:14 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `busreservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `seat_number` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `booked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `bus_id`, `seat_number`, `user_name`, `booked_at`) VALUES
(1, 1, 1, 'Dj', '2025-04-03 06:21:26'),
(2, 1, 8, 'Dj', '2025-04-03 06:21:26'),
(3, 1, 14, 'Dj', '2025-04-03 06:21:26'),
(4, 3, 9, 'aarthika', '2025-04-03 06:27:11'),
(5, 3, 10, 'aarthika', '2025-04-03 06:27:11'),
(6, 1, 3, 'jagadeeeeeeeeeeeeeeeeeeeeeeeshwaran           MMMMMMMMMMMMMMMMMMMMMMMMm DDDDDDDDDDDDDDDDDDDDDDDDD', '2025-04-03 09:36:01'),
(7, 1, 7, 'jagadeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', '2025-04-03 09:59:38'),
(9, 1, 27, 'jagaaaaaaaaaaaaaaaaaaaaaaaaaa', '2025-04-03 10:00:25'),
(10, 1, 28, 'jagaaaaaaaaaaaaaaaaaaaaaaaaaa', '2025-04-03 10:00:25'),
(11, 1, 32, 'jagaaaaaaaaaaaaaaaaaaaaaaaaaa', '2025-04-03 10:00:25'),
(12, 1, 30, 'Praga', '2025-04-05 06:36:35'),
(13, 1, 31, 'Praga', '2025-04-05 06:36:35'),
(14, 1, 11, 'JAGA', '2025-04-05 07:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` int(11) NOT NULL,
  `bus_name` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `from_place` varchar(255) NOT NULL,
  `to_place` varchar(255) NOT NULL,
  `bus_type` enum('Sleeper','Non-Sleeper') NOT NULL,
  `features` text NOT NULL,
  `bus_image` varchar(255) DEFAULT NULL,
  `video_file` varchar(255) DEFAULT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `no_of_column` int(100) NOT NULL,
  `seats_available` int(11) DEFAULT 50,
  `seats_availables` int(11) DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `bus_name`, `owner`, `from_place`, `to_place`, `bus_type`, `features`, `bus_image`, `video_file`, `time_from`, `time_to`, `no_of_column`, `seats_available`, `seats_availables`) VALUES
(1, 'HP', 'hpppp', 'Hogwards', 'Magic school', 'Sleeper', 'wifi', 'uploads/images/1743500320_Namba Bus (17).jpg', NULL, '14:01:00', '21:58:00', 0, 50, 50),
(2, 'HP', 'hpppp', 'Hogwards', 'Magic school', 'Sleeper', 'kj2', 'uploads/images/1743505607_My (1).jpg', NULL, '16:39:00', '16:41:00', 0, 50, 50),
(3, 'mukesh', 'mukesh', 'chennai', 'madhurai', 'Sleeper', 'wifi', 'uploads/images/1743573906_Namba Bus (11).jpg', NULL, '03:38:00', '02:40:00', 0, 50, 50),
(4, 'muthu', 'muthu', 'rajapalayam', 'mamsapuram', 'Sleeper', 'wi fi', 'uploads/images/1743574127_Namba Bus (19).jpg', NULL, '02:38:00', '04:38:00', 0, 50, 50),
(5, 'mamoj', 'manoj', 'chennai', 'vanthavasi', 'Sleeper', 'wifi', 'uploads/images/1743583215_Namba Bus (18).jpg', NULL, '14:13:00', '20:10:00', 0, 50, 50);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `from_place` varchar(100) DEFAULT NULL,
  `to_place` varchar(100) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `travelers` int(3) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_cost` int(11) NOT NULL,
  `number_of_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `name`, `age`, `email`, `phone`, `address`, `from_place`, `to_place`, `date_from`, `date_to`, `travelers`, `created_at`, `total_cost`, `number_of_days`) VALUES
(1, 'Sanjay V', 17, 'sanjay@gmail.com', '8522256789', 'ljbb', 'Chennai', 'Thirupatur', '2025-04-04', '2025-04-10', 17, '2025-04-02 09:18:29', 8500, 6),
(2, 'JAGADEESHWARAN M D', 3, 'sivajaga2915@outlook.com', '1234567890', '1234, ieucneiunc', 'Chennai', 'Thirupatur', '2025-04-02', '2025-04-25', 170, '2025-04-02 09:29:45', 85000, 23),
(3, 'JAGADEESHWARAN M D', 3, 'sivajaga2915@outlook.com', '1234567890', 'JAGA', 'Chennai', 'Thirupatur', '2025-04-25', '2025-04-02', 170, '2025-04-02 10:33:38', 85000, 23),
(4, 'Rahul OOtary', 17, 'rahul@gmail.com', '1234567899', 'Rahul', 'Chennai', 'Otary', '2025-04-03', '2025-04-30', 4, '2025-04-03 06:04:32', 2000, 27),
(5, 'Rahul OOtary', 17, 'rahul@gmail.com', '1234567899', 'Jaga', 'Chennai', 'Otary', '2025-04-03', '2025-05-01', 4, '2025-04-03 06:10:30', 2000, 28),
(6, 'dhinakran', 17, 'dhinakran@gmail.com', '6381537546', 'knp', 'Chennai', 'trt', '2298-05-02', '2222-02-22', 4, '2025-04-03 06:23:00', 2000, 27828),
(7, 'aarthka', 12, 'aarthika@gmail.com', '1234567890', 'velachery', 'thiruthuraipoondi', 'chennai', '2026-03-10', '2026-03-11', 50, '2025-04-03 06:30:17', 25000, 1),
(8, 'Vijay', 65, 'vijay@gmail.com', '1234567890', 'VIJAYVIJAY', 'Vijay V', 'Vijay', '2025-04-03', '2025-04-24', 14, '2025-04-03 09:57:26', 7000, 21);

-- --------------------------------------------------------

--
-- Table structure for table `seat_bookings`
--

CREATE TABLE `seat_bookings` (
  `id` int(11) NOT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `status` enum('booked','available') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seat_bookings`
--

INSERT INTO `seat_bookings` (`id`, `bus_id`, `seat_number`, `status`) VALUES
(1, 1, 13, 'booked'),
(2, 1, 14, 'booked'),
(3, 1, 25, 'booked'),
(4, 1, 36, 'booked'),
(5, 1, 46, 'booked'),
(6, 1, 3, 'booked'),
(7, 1, 4, 'booked');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `profile_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `phone`, `age`, `address`, `city`, `state`, `profile_image`) VALUES
(0, 'Mukesh', 'G', 'mukeshg@gmail.com', '$2y$10$cULaLw/vnGbMPtdqv7kZ1.DBXFJ6aZZPACn9zqdj4R0iRyeMjJteG', '1234567890', 18, 'mamsapuram', 'Virudhunagar', 'TN', '23f490a1-a596-49bb-bf8d-d7328bb70667.jpg'),
(0, 'Jaga', 'Kutty', 'jaga@gmai.com', '$2y$10$3rUZ4ShN.k15HUqQbP5/.u0udG5TMspFE/Fu0Y3SBbO4OPk2Fk.C6', '1234567890', 19, 'qwe', 'qwe', 'qwe', 'android-chrome-192x192.png'),
(0, 'Rahul', 'OOtary', 'rahul@gmail.com', '$2y$10$DGsX2XU0sRmcX1DSYlcfaebvAXQOZZchNRZLJIZp26oDL2vhb6vw6', '12345678990', 17, 'Rahul', 'Otary', 'TChennai', 'Ap (2).jpg'),
(0, 'Rahul', 'OOtary', 'rahul@gmail.com', '$2y$10$BjoroGcVdSb1/edzA/FwE.dEOMNPG1VQVbv/j.mBqlyzY6iGhyEZ2', '12345678990', 17, 'jaga', 'Otary', 'TChennai', 'c6e17c4b-c7e5-4d31-a234-7dcd6a3f9e39.jpg'),
(0, 'djboydhina', 'R ', 'dhinakran@gmail.com', '$2y$10$HDdVcziCOZyAbrNuF583q.wjn8SNkGaLV2b//.L6ihMXq8VkF.8MK', '6381537546', 17, 'ddddd', 'trt', 'tn', '08e22ee9-38d3-4d6c-93f5-5d5a2bd64039.jpg'),
(0, 'rajesh', 'j', 'rajesh@gmail.com', '$2y$10$/0YG/BzYG1yhEZc/hEbUY.iua3Um9dcwO6QoogRZb5.ZXnCiGgtqm', '1212345678', 12, 'dfdgfg', 'mu', 'tn', 'android-chrome-75X75.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_reservations`
--

CREATE TABLE `user_reservations` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `seats` text NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `reservation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bus_id` (`bus_id`,`seat_number`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seat_bookings`
--
ALTER TABLE `seat_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `user_reservations`
--
ALTER TABLE `user_reservations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `seat_bookings`
--
ALTER TABLE `seat_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_reservations`
--
ALTER TABLE `user_reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seat_bookings`
--
ALTER TABLE `seat_bookings`
  ADD CONSTRAINT `seat_bookings_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
