-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2021 at 02:03 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentID` int(11) NOT NULL,
  `commentBy` int(11) NOT NULL,
  `commentOn` int(11) NOT NULL,
  `comment` text NOT NULL,
  `commentAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentID`, `commentBy`, `commentOn`, `comment`, `commentAt`) VALUES
(4, 5, 34, 'Yeah', '2021-06-09 20:56:45'),
(5, 6, 35, 'That\'s great', '2021-06-13 00:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `followID` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `followStatus` enum('0','1') NOT NULL,
  `followOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`followID`, `sender`, `receiver`, `followStatus`, `followOn`) VALUES
(86, 6, 5, '1', '2021-06-13 20:23:14'),
(87, 5, 6, '1', '2021-06-13 23:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `likeID` int(11) NOT NULL,
  `likeOn` int(11) NOT NULL,
  `likeBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`likeID`, `likeOn`, `likeBy`) VALUES
(24, 26, 5),
(25, 34, 5),
(30, 4, 5),
(34, 35, 5),
(35, 39, 6),
(36, 38, 6),
(37, 40, 6),
(39, 32, 6),
(40, 31, 6);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`messageID`, `message`, `messageTo`, `messageFrom`, `messageOn`, `status`) VALUES
(10, 'Hi', 6, 5, '2021-06-12 15:01:41', 0),
(11, 'Hello', 5, 6, '2021-06-12 15:01:48', 0),
(12, 'How are you doing?', 6, 5, '2021-06-12 15:02:04', 0),
(13, 'Hi', 6, 6, '2021-06-13 00:56:38', 0),
(14, 'I am fine bro', 5, 6, '2021-06-13 00:57:18', 0),
(15, 'Hi', 6, 5, '2021-06-13 05:38:47', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('like','comment','retweet','follow','message','mention') NOT NULL,
  `notificationOn` datetime NOT NULL DEFAULT current_timestamp(),
  `notificationCount` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`ID`, `notificationFor`, `notificationFrom`, `target`, `type`, `notificationOn`, `notificationCount`, `status`) VALUES
(1, 5, 6, 38, 'like', '2021-06-12 23:59:20', 1, 0),
(3, 5, 6, 35, 'retweet', '2021-06-13 00:16:22', 1, 0),
(4, 5, 6, 35, 'comment', '2021-06-13 00:47:12', 1, 0),
(6, 5, 6, 14, 'message', '2021-06-13 00:57:18', 1, 0),
(7, 6, 5, 40, 'mention', '2021-06-13 04:12:59', 1, 0),
(8, 5, 6, 40, 'like', '2021-06-13 05:38:18', 1, 0),
(9, 6, 5, 15, 'message', '2021-06-13 05:38:47', 1, 0),
(20, 10, 0, 0, 'follow', '2021-06-13 06:27:59', 0, 0),
(21, 10, 0, 0, 'follow', '2021-06-13 06:28:00', 0, 0),
(22, 10, 0, 0, 'follow', '2021-06-13 06:28:01', 0, 0),
(23, 10, 0, 0, 'follow', '2021-06-13 06:28:02', 0, 0),
(24, 10, 0, 0, 'follow', '2021-06-13 06:28:03', 0, 0),
(25, 10, 0, 0, 'follow', '2021-06-13 06:28:33', 0, 0),
(37, 10, 10, 0, 'follow', '2021-06-13 15:17:28', 0, 0),
(49, 5, 6, 0, 'follow', '2021-06-13 20:23:14', 0, 0),
(50, 5, 6, 32, 'like', '2021-06-13 20:24:45', 0, 0),
(51, 5, 6, 31, 'like', '2021-06-13 20:26:21', 0, 0),
(52, 6, 5, 0, 'follow', '2021-06-13 23:59:51', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `retweet`
--

CREATE TABLE `retweet` (
  `retweetID` int(11) NOT NULL,
  `retweetBy` int(11) NOT NULL,
  `retweetFrom` int(11) NOT NULL,
  `status` text NOT NULL,
  `tweetOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `retweet`
--

INSERT INTO `retweet` (`retweetID`, `retweetBy`, `retweetFrom`, `status`, `tweetOn`) VALUES
(16, 6, 35, '', '2021-06-12 17:16:22');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `trendID` int(11) NOT NULL,
  `hashtag` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tweetId` int(11) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`trendID`, `hashtag`, `user_id`, `tweetId`, `createdOn`) VALUES
(21, 'php', 6, 50, '2021-06-13 19:26:08'),
(22, 'mysql', 6, 52, '2021-06-13 19:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `tweet_id` int(11) NOT NULL,
  `status` text NOT NULL,
  `tweetBy` int(11) NOT NULL,
  `tweetImage` text NOT NULL,
  `postedOn` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`tweet_id`, `status`, `tweetBy`, `tweetImage`, `postedOn`) VALUES
(28, 'Don\'t be afraid to be alone.\nGoals are personal.', 5, '', '2021-06-09 00:50:20'),
(30, 'If you chase knowledge you will never be poor.', 5, '', '2021-06-09 00:53:01'),
(31, 'Put your energy on your goals and not your fears.', 5, '', '2021-06-09 00:53:13'),
(32, 'Studying gives you knowledge \n\nObserving gives you wisdom', 5, '', '2021-06-09 00:54:15'),
(34, 'We are judged by what we finish, not what we start.', 5, '', '2021-06-09 01:02:35'),
(37, '', 5, 'frontend/media/d0127ec055cff00b5859da0cb.png', '2021-06-11 19:06:07'),
(38, 'Tags and Elements', 5, 'frontend/media/7ea3429c29b38fc23062993ed.png', '2021-06-11 19:14:02'),
(40, '@robertokong how are you doing?', 5, '', '2021-06-13 04:12:59'),
(50, 'I am learning #php', 6, '', '2021-06-13 19:26:08'),
(52, '#mysql is awesome', 6, '', '2021-06-13 19:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profileImage` varchar(255) NOT NULL,
  `profileCover` varchar(255) NOT NULL,
  `following` int(11) NOT NULL,
  `followers` int(11) NOT NULL,
  `bio` text NOT NULL,
  `country` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `signUpDate` datetime NOT NULL DEFAULT current_timestamp(),
  `profileEdit` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstName`, `lastName`, `username`, `email`, `password`, `profileImage`, `profileCover`, `following`, `followers`, `bio`, `country`, `website`, `signUpDate`, `profileEdit`) VALUES
(5, 'Christopher', 'Glikpo', 'christopherglikpo', 'christopherglikpoqwesi@gmail.com', '$2y$10$kA4Z9lpgYRdkmOzBROIpQO9Di7HFX1JfSOdpfhlN3trb.2suerb4.', 'frontend/profileImage/5/0c0db739a9861869d76528b38.png', 'frontend/profileCover/5/efeb439fef67de9b8cc8164ed.png', 1, 1, '', '', '', '2021-03-31 16:36:51', '0'),
(6, 'Roberto', 'Kong', 'robertokong', 'chrisqwesi@gmail.com', '$2y$10$4Y3qaVv4H/oRhRtsQVy.z..HoY68d/97tuqEJvx1l9FOQGjv8dK6C', 'frontend/profileImage/6/e03dd2ee48ef96ce0ea708ea4.png', 'frontend/profileCover/6/3e9e7ce8e48ba394fda4fa5a7.png', 1, 1, '', '', '', '2021-04-21 09:28:02', '0'),
(7, 'Josephine', 'Kwakye', 'josephinekwakye', 'jkwakye001@gmail.com', '$2y$10$aXAxnLzlfKr/Sc0L9j0KUeKufeRw5Tadi/Uu7IDlbPB061ekT5H.S', 'frontend/assets/images/defaultPic.svg', 'frontend/assets/images/backgroundImage.svg', 0, 0, '', '', '', '2021-04-21 09:37:30', '0'),
(9, 'Hope', 'Moore', 'hopemoore', 'koomsonrobert@gmail.com', '$2y$10$fb85VC2WdkLe3FSl5qwzjOiUrk4SASHKF3grplfaB.VXWQYkxIEN6', 'frontend/assets/images/defaultProfilePic.png', 'frontend/assets/images/backgroundCoverPic.svg', 0, 0, '', '', '', '2021-04-21 09:48:24', '0'),
(10, 'Favour', 'Moore', 'favourmoore', 'koomsonrobertgh@gmail.com', '$2y$10$xNeRAuk6i9k93wirDNdcIO520gyqamr6L0UWyZIPWUkYGKMyCH54m', 'frontend/assets/images/defaultProfilePic.png', 'frontend/assets/images/backgroundCoverPic.svg', 0, 0, '', '', '', '2021-04-21 09:58:55', '0');

-- --------------------------------------------------------

--
-- Table structure for table `verification`
--

CREATE TABLE `verification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verification`
--

INSERT INTO `verification` (`id`, `user_id`, `code`, `status`, `createdAt`) VALUES
(56, 5, 'fa952b32664bbffdc4baf2da6', '1', '2021-03-31 16:36:54'),
(57, 5, 'fa952b32664bbffdc4baf2da6', '1', '2021-03-31 16:37:20'),
(60, 6, '8b5d52d910f62648f078e1169', '1', '2021-04-21 09:28:07'),
(61, 6, '8b5d52d910f62648f078e1169', '1', '2021-04-21 09:31:40'),
(62, 7, '237ab9bee2de3eaf850aa5def', '1', '2021-04-21 09:37:33'),
(63, 7, '237ab9bee2de3eaf850aa5def', '1', '2021-04-21 09:40:07'),
(64, 7, '237ab9bee2de3eaf850aa5def', '1', '2021-04-21 09:40:41'),
(74, 9, '1d6891032b735845334696ce8', '0', '2021-04-21 09:48:26'),
(75, 9, 'f4b4f91227b8822bc3ae7024a', '0', '2021-04-21 09:53:57'),
(76, 9, '3d05fb4cd7c33904647edef40', '0', '2021-04-21 09:54:02'),
(77, 10, 'cec944cd2600e6ca3ea6669be', '1', '2021-04-21 09:58:57'),
(78, 10, 'cec944cd2600e6ca3ea6669be', '1', '2021-04-21 10:00:40'),
(79, 10, 'cec944cd2600e6ca3ea6669be', '1', '2021-04-21 10:01:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentID`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`followID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`likeID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `retweet`
--
ALTER TABLE `retweet`
  ADD PRIMARY KEY (`retweetID`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tokenForein` (`user_id`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trendID`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`tweet_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `verification`
--
ALTER TABLE `verification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verify_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `followID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `likeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `retweet`
--
ALTER TABLE `retweet`
  MODIFY `retweetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `trendID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `tweet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `verification`
--
ALTER TABLE `verification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `tokenForein` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `verification`
--
ALTER TABLE `verification`
  ADD CONSTRAINT `verify_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
