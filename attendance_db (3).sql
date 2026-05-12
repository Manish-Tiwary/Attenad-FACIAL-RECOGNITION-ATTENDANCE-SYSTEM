-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2026 at 02:21 AM
-- Server version: 12.2.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'Teacher' COMMENT 'Super = full CRUD on admins; Teacher = own profile + students only',
  `status` varchar(20) NOT NULL DEFAULT 'active' COMMENT 'Login blocked when inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `role`, `status`) VALUES
(1, 'raven', '$2b$12$oq/UJg7OFYdKifvftNVvOuI/nAtwLhwGEQ1wANErXuyojt5jJaff2', 'Super', 'active'),
(70, 'Captain', '$2b$12$j1oXn7iXrcVFm4wVAkzbQexxfJ3rjmRzbw8FhGbnUowFKNANWtRQe', 'Teacher', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `admin_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(23) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `profile_pic_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`admin_id`, `first_name`, `last_name`, `email`, `dob`, `gender`, `address`, `phone_no`, `profile_pic_path`) VALUES
(1, 'manish', 'tiwari', 'raven@admin.com', '2025-04-03', 'Male', 'golkhupaka', '7456231598', 'Admin_Profiles/rav_profile.png'),
(70, 'Steve', 'Roger', 'Cap@admin.com', '2026-04-20', 'Male', 'avanger headquater', '9810456789', 'Admin_Profiles/Captain_profile.png');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `log_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` enum('Present','Absent','Late') DEFAULT 'Present',
  `log_date` date NOT NULL,
  `log_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_logs`
--

INSERT INTO `attendance_logs` (`log_id`, `student_id`, `status`, `log_date`, `log_time`) VALUES
(1, 1, 'Present', '2026-04-04', '00:45:04'),
(2, 1, 'Present', '2026-04-05', '11:36:36'),
(3, 3, 'Present', '2026-04-05', '15:33:54'),
(4, 1, 'Present', '2026-04-06', '07:03:53'),
(5, 4, 'Present', '2026-04-06', '07:08:57'),
(6, 1, 'Present', '2026-04-08', '13:43:17'),
(7, 1, 'Present', '2026-04-15', '07:57:45'),
(8, 4, 'Present', '2026-04-15', '08:00:09'),
(9, 1, 'Present', '2026-04-20', '08:40:07'),
(10, 4, 'Present', '2026-04-20', '21:19:23'),
(11, 1, 'Present', '2026-04-21', '06:03:59'),
(12, 1, 'Present', '2026-04-22', '08:57:15'),
(13, 1, 'Present', '2026-04-28', '12:43:24'),
(14, 5, 'Present', '2026-04-28', '12:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `leave_type` varchar(100) DEFAULT NULL,
  `leave_start` date DEFAULT NULL,
  `leave_end` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `applied_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `student_id`, `reason`, `leave_type`, `leave_start`, `leave_end`, `status`, `applied_on`) VALUES
(1, 1, 'fever', 'Sick Leave', '2026-04-21', '2026-04-21', 'Approved', '2026-04-20');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(10) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `username`, `password`, `created_at`, `status`) VALUES
(1, 'Raven', '$2b$12$wnbdK03huejXFdC/kjE.MOQFYZ6PF7SAqKRIFjoxriK8VXBiVrtpu', '2026-04-03 17:27:31', 'Active'),
(3, 'Ironman', '$2b$12$ck/9lqEeZjRO7.7pXvjykONdgeL.mFEh8cP4Mx43wIXwS3Wzxyxqa', '2026-04-05 09:46:43', 'Active'),
(4, 'Chirag', '$2b$12$g84Ledu0Sfi3N8BlYov3oe7LUiwB8G0wSm6WT2Jtj0QrY4Hl4XjfW', '2026-04-06 01:22:14', 'Active'),
(5, 'Manish', '$2b$12$aAH9fWgbsKTsw8GOojKczuoq9uBBevS1qPfo4r9XWi.c4CfVHozIG', '2026-04-28 06:56:27', 'Active'),
(6, 'Twary', '$2b$12$rK9UShmQpO90znwdl.e0HuuQiFy0QBm10dkedrJ7csncxr69D7yNa', '2026-04-28 07:02:39', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `student_academic`
--

CREATE TABLE `student_academic` (
  `academic_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `acad_year` year(4) NOT NULL,
  `faculty` varchar(100) NOT NULL,
  `course` varchar(100) NOT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(20) DEFAULT NULL,
  `relationship` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_academic`
--

INSERT INTO `student_academic` (`academic_id`, `student_id`, `acad_year`, `faculty`, `course`, `guardian_name`, `guardian_phone`, `relationship`) VALUES
(1, 1, '2024', 'Humanities & Social Sciences', 'BCA', 'tej Kumari Tamang', '9874563210', 'aunty'),
(3, 3, '2024', 'Management', 'BIM', 'Captain America', '9870001234', 'Father firend'),
(4, 4, '2024', 'Management', 'BBA', 'Manish', '9870123456', 'Father'),
(5, 5, '2026', 'Management', 'BBA', 'angel', '9875641230', 'aunty'),
(6, 6, '2026', 'Management', 'BBA', 'Angel', '8974562356', 'Uncke');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `detail_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `curr_address` text NOT NULL,
  `perm_address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `acad_year` year(4) NOT NULL,
  `faculty` varchar(100) NOT NULL,
  `course` varchar(100) NOT NULL,
  `guardian_name` varchar(100) NOT NULL,
  `guardian_phone` varchar(20) NOT NULL,
  `relationship` varchar(50) NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_profiles`
--

CREATE TABLE `student_profiles` (
  `profile_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `curr_address` text DEFAULT NULL,
  `perm_address` text DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_profiles`
--

INSERT INTO `student_profiles` (`profile_id`, `student_id`, `first_name`, `middle_name`, `last_name`, `dob`, `gender`, `phone`, `email`, `curr_address`, `perm_address`, `photo_path`) VALUES
(1, 1, 'Manish', '', 'Tiwari', '2003-02-10', 'Male', '9818896113', 'Manishtiwari@gmail.com', 'Golkhupaka KTM', 'Jhapa Nepal', 'Student_Profiles/Ravmt_profile.png'),
(3, 3, 'Rorbot ', 'Downy ', 'Jr', '2026-04-05', 'Male', '7894562130', 'Ironman@avenger.com', 'USA', 'USA', 'Student_Profiles/Ironman_profile.jpg'),
(4, 4, 'Chirag', '', 'Gurung', '2026-04-06', 'Male', '9800012457', 'Boka@gmail.com', 'KTM', 'KTM', 'Student_Profiles/Chirag_profile.png'),
(5, 5, 'Manish ', '', 'Tiwari', '2026-04-28', 'Male', '9876543210', 'Nt@gmail.com', 'Ktm', 'Ktm', 'Student_Profiles/Manish_profile.png'),
(6, 6, 'Chirag', '', 'Bishal', '2026-04-28', 'Male', '1245639870', 'Atr@gmail.com', 'Admin', 'ADmin', 'Student_Profiles/Twary_profile.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `student_academic`
--
ALTER TABLE `student_academic`
  ADD PRIMARY KEY (`academic_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student_academic`
--
ALTER TABLE `student_academic`
  MODIFY `academic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_profiles`
--
ALTER TABLE `student_profiles`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD CONSTRAINT `admin_details_fk` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD CONSTRAINT `1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_academic`
--
ALTER TABLE `student_academic`
  ADD CONSTRAINT `1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_details`
--
ALTER TABLE `student_details`
  ADD CONSTRAINT `1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_profiles`
--
ALTER TABLE `student_profiles`
  ADD CONSTRAINT `1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
