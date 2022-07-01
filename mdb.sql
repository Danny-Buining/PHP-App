-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2022 at 10:26 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `year` varchar(45) DEFAULT NULL,
  `picture` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `title`, `year`, `picture`, `created_at`, `updated_at`) VALUES
(1, 'Normaal', 'Godverdomme', 'https://www.youtube.com/embed/t3PdA_gJIZo', NULL, NULL),
(2, 'Normaal', 'Oerend Hard', 'https://www.youtube.com/embed/pqLAygIsReI', NULL, NULL),
(3, 'Normaal', 'Deur Donderen', 'https://www.youtube.com/embed/Lf3uowN01aA', NULL, NULL),
(4, 'Jovink', 'Brommers Kieken', 'https://www.youtube.com/embed/JpXmnfhZtwY', NULL, NULL),
(5, 'Jovink', 'Aan de kant', 'https://www.youtube.com/embed/QY1yWAlLQ90', NULL, NULL),
(18, 'Jovink', 'Mongo solo', 'https://www.youtube.com/embed/ktsGVxnm4t4', '2022-06-02 02:06:04', NULL),
(20, 'Normaal', 'Krachttoer', 'https://www.youtube.com/embed/3dSBDcSVMDM', '2022-06-09 09:06:17', NULL),
(21, 'Gregossan', 'Urus', 'https://www.youtube.com/embed/TCLXNgd2AHU', '2022-06-11 11:06:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `music`
--

CREATE TABLE `music` (
  `music_id` int(250) NOT NULL,
  `music_title` varchar(200) NOT NULL,
  `music_artist` varchar(200) NOT NULL,
  `music_link` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `music`
--

INSERT INTO `music` (`music_id`, `music_title`, `music_artist`, `music_link`) VALUES
(1, 'Urus', 'Gregossan', 'https://www.youtube.com/embed/TCLXNgd2AHU');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`user_id`, `movie_id`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(1, 2, 3, NULL, NULL),
(2, 1, 1, NULL, NULL),
(2, 2, 4, NULL, NULL),
(2, 5, 3, NULL, NULL),
(3, 1, 3, NULL, NULL),
(3, 2, 4, NULL, NULL),
(3, 5, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(180) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'janjaap@siewers.org', '$2y$10$XLkW5j83sR4nXRhBGbGFFuwhu1TGeczHhb2q2i6NfIUxNyYdoTx.q', NULL, NULL),
(2, 'klaus@enk.nl', '$2y$10$ROVR/xml4E1Rqu0lGIR62uOo1cFnSg339GVuMWvUiACJr2LHnXvle', NULL, NULL),
(3, 'truus@kok.nl', '$2y$10$i4cUTpz6/8m3I19JPXGhDOfFVmB2THZFVchTA8uvOuBH4SOirD2Em', NULL, NULL),
(4, 'janjaap@siekjhkjhers.org', 'kjhkjhkj', '2022-04-12 14:53:38', NULL),
(5, 'henk@gmail.com', 'henkje123', '2022-05-23 09:46:41', '2022-05-23 09:46:17'),
(6, 'gerritgrindtegel@kaasboer.nl', 'kaasboer69', '2022-06-20 09:30:33', '2022-06-20 09:30:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`user_id`,`movie_id`),
  ADD KEY `fk_rating_movie_idx` (`movie_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_rating_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rating_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
