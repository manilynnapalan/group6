-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2023 at 12:21 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vpmis`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `usertype` int(11) NOT NULL COMMENT '1-admin\r\n2-coaches\r\n3-athletes',
  `pro_pic` varchar(255) NOT NULL,
  `updated` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `usertype`, `pro_pic`, `updated`, `created_at`) VALUES
(1, 'admin', 'ODI3Y2NiMGVlYThhNzA2YzRjMzRhMTY4OTFmODRlN2I=', 1, '33c0ea537d1fa1628b0bd09fc1415ee0.jpg', 1, '2022-12-18 00:34:38'),
(33, '058', 'NzQzMWM3NzhhOWUyMmMzOGJiMzM3OGFhNTYwNGYxZjU=', 2, 'pro_pic_icon_admin.png', 1, '2023-04-05 12:34:56'),
(34, '123', 'NzQzMWM3NzhhOWUyMmMzOGJiMzM3OGFhNTYwNGYxZjU=', 2, 'pro_pic_icon_admin.png', 1, '2023-04-05 12:57:30'),
(35, '191023-2', 'NzQzMWM3NzhhOWUyMmMzOGJiMzM3OGFhNTYwNGYxZjU=', 3, 'pro_pic_icon_admin.png', 1, '2023-04-05 13:00:26'),
(36, '191024-2', 'NzQzMWM3NzhhOWUyMmMzOGJiMzM3OGFhNTYwNGYxZjU=', 3, 'pro_pic_icon_admin.png', 1, '2023-04-05 13:01:21'),
(37, '191025-1', 'NjA5YTY4ZTYwN2UwMGI3MWNhOGJlYjM3YmEzODgxZWI=', 3, 'pro_pic_icon_admin.png', 0, '2023-04-05 13:02:55'),
(38, '1910126-2', 'ZTEwYWRjMzk0OWJhNTlhYmJlNTZlMDU3ZjIwZjg4M2U=', 3, 'pro_pic_icon_admin.png', 0, '2023-04-10 13:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `active_school_year`
--

CREATE TABLE `active_school_year` (
  `id` int(11) NOT NULL,
  `school_year` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `active_school_year`
--

INSERT INTO `active_school_year` (`id`, `school_year`) VALUES
(1, '2022-2023');

-- --------------------------------------------------------

--
-- Table structure for table `athletes_surveys`
--

CREATE TABLE `athletes_surveys` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `name` varchar(11) DEFAULT NULL,
  `suggestions` text DEFAULT NULL,
  `date_answered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `athletes_surveys`
--

INSERT INTO `athletes_surveys` (`id`, `account_id`, `survey_id`, `answer`, `name`, `suggestions`, `date_answered`) VALUES
(1, 35, 1, '{\"1\":\"5\",\"2\":\"4\",\"3\":\"5\",\"4\":\"3\"}', NULL, '', '2023-04-10 13:41:15'),
(2, 36, 1, '{\"1\":\"5\",\"2\":\"5\",\"3\":\"5\",\"4\":\"5\"}', 'on', '', '2023-04-10 13:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `att_event_id` int(11) NOT NULL,
  `att_account_id` int(11) NOT NULL,
  `time_present` time NOT NULL DEFAULT current_timestamp(),
  `remarks` text NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `att_event_id`, `att_account_id`, `time_present`, `remarks`, `status`) VALUES
(1, 21, 35, '13:32:20', '', 'Absent'),
(2, 21, 36, '13:33:40', '', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `venue` varchar(255) NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `coach_id`, `event_name`, `date`, `description`, `venue`, `start_time`, `end_time`, `created_at`) VALUES
(21, 34, 'First General Practice', '2023-03-10', 'Basta mao nato!', 'SLSU-Bontoc Gym', '9:00 AM', '5:00 PM', '2023-04-05 13:06:06'),
(22, 34, 'Second Practise', '2023-03-13', 'Basta maonato', 'SLSU-Bontoc Gym', '1:00 PM', '3:00 PM', '2023-04-10 14:08:14');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `sports` varchar(255) DEFAULT NULL,
  `sy_end` int(11) NOT NULL,
  `sy_start` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`id`, `account_id`, `firstname`, `lastname`, `address`, `birthdate`, `gender`, `course`, `sports`, `sy_end`, `sy_start`) VALUES
(1, 1, 'Admin', 'Ko', NULL, NULL, NULL, NULL, NULL, 0, 0),
(33, 33, 'Sam', 'Paul', NULL, NULL, 'Male', NULL, 'Volleyball', 0, 0),
(34, 34, 'Sherwin', 'Caday', NULL, NULL, 'Male', NULL, 'Baseball', 0, 0),
(35, 35, 'John', 'Cena', 'San Ramon', '2019-05-08', 'Male', 'BSFi 101', 'Baseball', 2023, 2022),
(36, 36, 'Peter', 'Paul', 'Divisoria', '2019-08-18', 'Male', 'BSFi 101', 'Baseball', 2023, 2022),
(37, 37, 'Juan', 'Know', 'Sample', '2023-04-05', 'Male', 'BSMB 202', 'Volleyball', 2024, 2023),
(38, 38, 'ajboy', 'moralde', 'Sogod', '1999-10-22', 'Male', 'BSMB', 'Baseball', 2024, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT current_timestamp(),
  `sport_team` varchar(100) NOT NULL,
  `post_account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `image`, `date_posted`, `sport_team`, `post_account_id`) VALUES
(1, 'Sample', 'Documentation', '37b80059a5bd6908ceeaa2b256d84ae8.jpg', '2022-12-19 01:03:39', 'Basketball', 6),
(2, 'Sample Post', 'THis is a sample admin post.', 'cf929342bce952d6d214eb6124bb8fdd.jpg', '2022-12-19 08:27:23', 'admin', 1),
(7, 'a', 'a', 'TOTICTPM_-_Zoom_Virtual_Background.png', '2023-04-10 13:34:49', 'Baseball', 34);

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `sport_name` varchar(100) NOT NULL,
  `calendar_color` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `sport_name`, `calendar_color`, `created_at`) VALUES
(1, 'Volleyball', '#28bbe7', '0000-00-00 00:00:00'),
(2, 'Track and Field', '#860d95', '0000-00-00 00:00:00'),
(3, 'Tennis', '#189934', '0000-00-00 00:00:00'),
(10, 'Baseball', '', '2023-04-05 12:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `surveys_to_answer`
--

CREATE TABLE `surveys_to_answer` (
  `id` int(11) NOT NULL,
  `school_year` varchar(100) NOT NULL,
  `semester` varchar(100) NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surveys_to_answer`
--

INSERT INTO `surveys_to_answer` (`id`, `school_year`, `semester`, `date_posted`) VALUES
(1, '2022-2023', '1st Semester', '2023-04-10 13:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `survey_criterias`
--

CREATE TABLE `survey_criterias` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `criteria` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `survey_criterias`
--

INSERT INTO `survey_criterias` (`id`, `category`, `criteria`, `created_at`) VALUES
(1, '', 'The coach\'s approach has been a good fit for me.', '2023-01-15 22:47:13'),
(2, '', 'I value the coaching sessions and prioritise my attendance.', '2023-01-15 22:47:19'),
(3, '', 'I am able to work on or talk about what I need to work and talk about.', '2023-01-15 22:47:34'),
(4, '', 'The coaching session have meet my professional development needs.', '2023-01-15 22:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id` int(11) NOT NULL,
  `venue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `venue`) VALUES
(1, 'SLSU-Bontoc Gym'),
(2, 'San Ramon Covered Court'),
(3, 'Municipal Basketball Court');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `active_school_year`
--
ALTER TABLE `active_school_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `athletes_surveys`
--
ALTER TABLE `athletes_surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveys_to_answer`
--
ALTER TABLE `surveys_to_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_criterias`
--
ALTER TABLE `survey_criterias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `active_school_year`
--
ALTER TABLE `active_school_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `athletes_surveys`
--
ALTER TABLE `athletes_surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `surveys_to_answer`
--
ALTER TABLE `surveys_to_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `survey_criterias`
--
ALTER TABLE `survey_criterias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
