-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 06:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `practice_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `ID` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_code` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`ID`, `event_name`, `event_code`, `status`, `date`) VALUES
(1, 'Test event', 'TEST.EVN1', 'Active', '2023-06-08'),
(2, 'Test event 2', 'TEST.EVN2', 'Active', '2023-06-15'),
(3, 'Test event 3', 'TEST.EVN3', 'Inactive', '2023-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `ID` int(11) NOT NULL,
  `performance_title` varchar(255) DEFAULT NULL,
  `performance_event` varchar(20) DEFAULT NULL,
  `sellable` tinyint(1) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`ID`, `performance_title`, `performance_event`, `sellable`, `date`) VALUES
(1, 'Performance 1', 'TEST.EVN2', 1, '2023-06-21'),
(2, 'Performance 2', 'TEST.EVN1', 1, '2023-06-18'),
(3, 'Performance 3', 'TEST.EVN1', 0, '2023-06-30'),
(4, 'Performance 4', 'TEST.EVN2', 1, '2023-06-20'),
(5, 'Performance 5', 'TEST.EVN1', 0, '2023-06-19'),
(6, 'Performance 6', 'TEST.EVN3', 1, '2023-06-25'),
(7, 'Performance 7', 'TEST.EVN3', 0, '2023-06-26'),
(8, 'Performance 8', 'TEST.EVN1', 1, '2023-06-23'),
(9, 'Performance 1', 'TEST.EVN2', 1, '2023-06-21'),
(10, 'Performance 2', 'TEST.EVN1', 1, '2023-06-18'),
(11, 'Performance 3', 'TEST.EVN1', 0, '2023-06-30'),
(12, 'Performance 4', 'TEST.EVN2', 1, '2023-06-20'),
(13, 'Performance 5', 'TEST.EVN1', 0, '2023-06-19'),
(14, 'Performance 6', 'TEST.EVN3', 1, '2023-06-25'),
(15, 'Performance 7', 'TEST.EVN3', 0, '2023-06-26'),
(16, 'Performance 8', 'TEST.EVN1', 1, '2023-06-23');

-- --------------------------------------------------------

--
-- Table structure for table `performance_meta`
--

CREATE TABLE `performance_meta` (
  `meta_id` int(11) NOT NULL,
  `performance_id` int(11) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `performance_meta`
--

INSERT INTO `performance_meta` (`meta_id`, `performance_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'price', 10000),
(2, 2, 'price', 15000),
(3, 3, 'price', 5000),
(4, 4, 'price', 8000),
(5, 5, 'price', 12000),
(6, 6, 'price', 16000),
(7, 7, 'price', 9000),
(8, 8, 'price', 11000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `performance_meta`
--
ALTER TABLE `performance_meta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `performance_id` (`performance_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `performance`
--
ALTER TABLE `performance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `performance_meta`
--
ALTER TABLE `performance_meta`
  MODIFY `meta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `performance_meta`
--
ALTER TABLE `performance_meta`
  ADD CONSTRAINT `performance_id` FOREIGN KEY (`performance_id`) REFERENCES `performance` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
