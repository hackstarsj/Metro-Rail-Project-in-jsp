-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 25, 2018 at 10:09 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `metrorail`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `a_name` varchar(25) NOT NULL,
  `a_address` varchar(75) NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `email` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `permission` int(11) NOT NULL,
  `designation` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `a_name`, `a_address`, `phone_num`, `email`, `age`, `gender`, `permission`, `designation`, `password`) VALUES
(1, 'sanjeev', 'kumardhubi', '9205878477', 'sksanjeev362@gmail.com', 20, 'male', 1, 'developer', '123456'),
(2, 'rahul', 'b', 'd', 'e', 1, 'm', 1, 'd', '11'),
(3, 'a', 'b', 'd', 'e', 1, 'm', 1, 'd', '11'),
(4, 'a', 'b', 'd', 'e', 1, 'm', 1, 'd', '11'),
(5, 'null', 'test', '7877', 'testt', 10, 'Male', 1, 'sksanjeev363@gmail.com', '123456'),
(6, 'null', 'ndf', '4445', 'fdfsk', 11, 'Male', 1, 'fasfsa', 'fsdfsafas'),
(7, 'null', 'kmme', '9205878477', 'sksanjeev365@gmail.com', 20, 'Male', 1, 'Developer', 'sanjeev');

-- --------------------------------------------------------

--
-- Table structure for table `card_recharges`
--

CREATE TABLE `card_recharges` (
  `id` int(11) NOT NULL,
  `card_num` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `amount` varchar(10) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txn_id` varchar(255) NOT NULL,
  `paymentid` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `card_recharges`
--

INSERT INTO `card_recharges` (`id`, `card_num`, `status`, `amount`, `datetime`, `txn_id`, `paymentid`) VALUES
(1, '9858888', 'Pending', '100', '2018-03-25 00:27:06', '23ce67e55025448aa34aff1c569d6f60', ''),
(2, '9858888', 'Pending', '100', '2018-03-25 00:35:13', 'c7c2860b1f5248b48bb1d11e161bf591', ''),
(3, '9858888', 'Pending', '100', '2018-03-25 11:50:10', 'a57bf34a66fd4b21a51a3a41a85b5f35', ''),
(4, '9858888', 'Pending', '100', '2018-03-25 12:50:25', '7335c2d4a725468f86db6d0351cccb73', NULL),
(5, '9858888', 'Pending', '100', '2018-03-25 12:54:10', '796efeab55084620a259b4b1d57245d5', NULL),
(6, '9858888', 'complete', '100.00', '2018-03-25 12:55:45', 'f7fae484b0da4707b43b685eb525b149', 'MOJO8325005A92834498');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `u_name` varchar(30) NOT NULL,
  `u_address` text NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `msg` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `u_name`, `u_address`, `phone_num`, `msg`, `email`, `age`, `status`, `datetime`) VALUES
(1, 'sanjeev kumar', 'kmme', '9999888877', 'thanks', 'sksanjeev362@gmail.com', 20, 1, '2018-02-25 00:58:24'),
(2, 'sanjeev kumar', 'kmme', '9999888877', 'thanks', 'sksanjeev362@gmail.com', 20, 1, '2018-02-25 01:02:25'),
(3, 'sanjeev kumar', 'kmme', '9999888877', 'thanks', 'sksanjeev362@gmail.com', 20, 1, '2018-02-25 01:03:20'),
(4, 'sanjeev kumar', 'kmme', '9999888877', 'hm', 'sksanjeev362@gmail.com', 20, 1, '2018-02-25 10:25:54'),
(5, 'sanjeev kumar', 'kmme', '9205878477', 'hh', 'sksanjeev362@gmail.com', 20, 1, '2018-03-22 22:38:33'),
(6, 'sanjeev kumar', 'kmme', '9205878477', 'bb', 'sksanjeev362@gmail.com', 20, 0, '2018-03-24 00:01:43'),
(7, 'sanjeev', 'kmme', '9205878477', 'th', 'sksanjeev362@gmail.com', 20, 0, '2018-03-24 17:28:22');

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`id`, `name`) VALUES
(1, 'sanjeev'),
(2, 'rahul');

-- --------------------------------------------------------

--
-- Table structure for table `fair`
--

CREATE TABLE `fair` (
  `id` int(11) NOT NULL,
  `amt` varchar(10) NOT NULL,
  `min_distances` varchar(10) NOT NULL,
  `max_distances` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fair`
--

INSERT INTO `fair` (`id`, `amt`, `min_distances`, `max_distances`) VALUES
(1, '10', '0', '10'),
(2, '20', '10', '20'),
(3, '30', '20', '30'),
(4, '40', '30', '40'),
(5, '50', '50', '200'),
(6, '60', '200', '300'),
(7, '100', '300', '500'),
(8, '150', '500', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `metro_card`
--

CREATE TABLE `metro_card` (
  `id` int(11) NOT NULL,
  `card_num` varchar(20) DEFAULT NULL,
  `u_name` varchar(30) NOT NULL,
  `u_address` text NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `phone_num` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `card_status` tinyint(1) NOT NULL DEFAULT '0',
  `balance` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `metro_card`
--

INSERT INTO `metro_card` (`id`, `card_num`, `u_name`, `u_address`, `age`, `gender`, `phone_num`, `email`, `password`, `card_status`, `balance`) VALUES
(1, 'abcsde', 'sanjeev kumar', 'kumardhubi bazar', 20, 'null', '9205878477', 'sksanjeev362@gmail.com', '123456', 1, 0),
(2, '9858888', 'test', 'jjj', 20, 'null', '9999999', 'sksanjeev362@gmail.com', '123456', 1, 120);

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `id` int(11) NOT NULL,
  `complaints_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reply`
--

INSERT INTO `reply` (`id`, `complaints_id`, `msg`, `admin_id`) VALUES
(1, 1, 'ok will fix it', 1),
(2, 2, 'you welcome', 1),
(3, 3, 'you welcome', 1),
(4, 4, 'thanks', 1),
(5, 5, 'thanks', 1);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `r_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `r_name`) VALUES
(1, 'first'),
(2, 'second');

-- --------------------------------------------------------

--
-- Table structure for table `route_details`
--

CREATE TABLE `route_details` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `s_order_num` int(11) NOT NULL,
  `length_from_start` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route_details`
--

INSERT INTO `route_details` (`id`, `route_id`, `station_id`, `s_order_num`, `length_from_start`) VALUES
(19, 2, 11, 1, 0),
(20, 2, 10, 2, 120),
(21, 2, 9, 3, 170),
(22, 2, 1, 4, 200),
(23, 2, 13, 5, 260),
(24, 2, 14, 6, 280),
(25, 1, 12, 1, 0),
(26, 1, 3, 2, 5),
(27, 1, 4, 3, 4),
(28, 1, 5, 4, 15),
(29, 1, 6, 5, 30),
(30, 1, 1, 6, 45),
(31, 1, 10, 7, 150),
(32, 1, 11, 8, 220);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `id` int(11) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`id`, `s_name`, `latitude`, `longitude`) VALUES
(1, 'Dhanbad', 23.7957, 86.4304),
(3, 'Kumardhubi Market, Chirkunda, Jharkhand, India', 23.7465, 86.784),
(4, 'Mugma, Jharkhand, India', 23.7727, 86.7322),
(5, 'Nirsa, Jharkhand, India', 23.7848, 86.7039),
(6, 'Gobindpur, Jharkhand, India', 23.8343, 86.5224),
(7, 'Bokaro Steel City, Jharkhand, India', 23.6693, 86.1511),
(8, 'Gomoh, Jharkhand, India', 23.8608, 86.1598),
(9, 'Katras, Jharkhand, India', 23.8081, 86.292),
(10, 'Muri, Jharkhand, India', 23.3784, 85.8614),
(11, 'Ranchi, Jharkhand, India', 23.3441, 85.3096),
(12, 'Chirkunda, Jharkhand, India', 23.7479, 86.7869),
(13, 'Panchet Dam, Tantloi, West Bengal', 23.6781, 86.7469),
(14, 'Maithon Dam, Kenjapahar Ist part al, Jharkhand', 23.8503, 86.7778),
(15, 'Junkudar, Jharkhand, India', 23.7253, 86.7705);

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `id` int(11) NOT NULL,
  `train_no` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`id`, `train_no`, `capacity`) VALUES
(1, 'abc123', 100),
(2, 'abc456', 80),
(3, 'abc789', 120),
(4, 'abc741', 90),
(5, 'abc852', 70),
(6, 'abc963', 65);

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `trip_code` varchar(20) NOT NULL,
  `train_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id`, `trip_code`, `train_id`, `route_id`) VALUES
(1, 'first_trip', 1, 1),
(2, 'second_trip', 2, 2),
(3, 'trip2', 5, 2),
(4, 'trip3', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trip_details`
--

CREATE TABLE `trip_details` (
  `id` int(11) NOT NULL,
  `trip_num` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `arrival_time` varchar(10) NOT NULL,
  `departure_time` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trip_details`
--

INSERT INTO `trip_details` (`id`, `trip_num`, `station_id`, `arrival_time`, `departure_time`) VALUES
(1, 1, 1, '08:50', '09:00'),
(2, 1, 9, '09:11', '09:20'),
(3, 2, 1, '09:54', '09:59'),
(4, 2, 8, '10:31', '10:45'),
(5, 3, 3, '08:43', '08:50'),
(6, 3, 8, '09:35', '09:45'),
(9, 4, 1, '08:50', '17:19'),
(10, 4, 9, '09:11', '09:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card_recharges`
--
ALTER TABLE `card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fair`
--
ALTER TABLE `fair`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metro_card`
--
ALTER TABLE `metro_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_details`
--
ALTER TABLE `route_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip_details`
--
ALTER TABLE `trip_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `card_recharges`
--
ALTER TABLE `card_recharges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `fair`
--
ALTER TABLE `fair`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `metro_card`
--
ALTER TABLE `metro_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `route_details`
--
ALTER TABLE `route_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `trip_details`
--
ALTER TABLE `trip_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
