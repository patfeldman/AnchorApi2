-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2015 at 06:04 AM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `anchornet`
--

-- --------------------------------------------------------

--
-- Table structure for table `authaccess`
--

CREATE TABLE IF NOT EXISTS `authaccess` (
  `accessId` int(11) NOT NULL AUTO_INCREMENT,
  `authToken` varchar(25) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `ipAddress` varchar(30) NOT NULL,
  `successLogin` tinyint(1) NOT NULL,
  PRIMARY KEY (`accessId`),
  KEY `User` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `authaccess`
--

INSERT INTO `authaccess` (`accessId`, `authToken`, `date`, `userId`, `ipAddress`, `successLogin`) VALUES
(16, 'VUIA4KtIGcuv6QPMuLgc', '2015-09-15 01:49:03', 14, '', 0),
(17, 'fOVC7DNBpH5v3hsQk8s6', '2015-09-15 03:21:25', 19, '', 0),
(18, 'YFhlzljQ4FZnmdABndPb', '2015-09-15 03:21:39', 20, '', 0),
(19, '8mj5Gn3E3cRV00FCh7o8', '2015-09-15 03:22:03', 21, '', 0),
(20, 'H1o7M5qS2fyKQsfkR8bU', '2015-09-15 03:23:10', 22, '', 0),
(21, 'yyZzA7I1jN6bJyPTVYkP', '2015-09-15 03:24:16', 23, '', 0),
(23, 'gd4cwR7VdwmTsawaywPI', '2015-09-15 03:28:49', 24, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE IF NOT EXISTS `crew` (
  `crewId` int(11) NOT NULL AUTO_INCREMENT,
  `crewName` varchar(50) DEFAULT NULL,
  `numPeople` int(11) NOT NULL,
  `crewDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`crewId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crewchatmessage`
--

CREATE TABLE IF NOT EXISTS `crewchatmessage` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `crewId` int(11) NOT NULL,
  `fromUid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` tinyblob NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `crewmember`
--

CREATE TABLE IF NOT EXISTS `crewmember` (
  `crewMemberId` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`crewMemberId`),
  KEY `group` (`groupId`),
  KEY `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `moodhistory`
--

CREATE TABLE IF NOT EXISTS `moodhistory` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `moodGroup` int(11) NOT NULL,
  `moodItem` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`historyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `moodhistory`
--

INSERT INTO `moodhistory` (`historyId`, `userId`, `moodGroup`, `moodItem`, `date`) VALUES
(12, 14, 0, 0, '2015-09-14 22:03:20'),
(13, 14, 1, 2, '2015-09-14 22:04:03'),
(14, 14, 2, 2, '2015-09-14 22:09:52'),
(15, 14, 1, 0, '2015-09-14 22:10:24'),
(16, 24, 0, 0, '2015-09-14 23:29:56');

-- --------------------------------------------------------

--
-- Table structure for table `privatechatmessage`
--

CREATE TABLE IF NOT EXISTS `privatechatmessage` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `user1Id` int(11) NOT NULL,
  `user2Id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` tinyblob NOT NULL,
  PRIMARY KEY (`messageId`),
  KEY `user1` (`user1Id`),
  KEY `User2` (`user2Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(50) NOT NULL,
  `temppassword` varchar(50) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `avatarType` int(11) NOT NULL DEFAULT '0',
  `current_latitude` float NOT NULL,
  `current_longitude` float NOT NULL,
  `creation_date` datetime NOT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(13) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `temppassword`, `verified`, `avatarType`, `current_latitude`, `current_longitude`, `creation_date`, `email`, `phone`) VALUES
(14, 'pat', 'feldman', '', 0, 0, 0, 0, '0000-00-00 00:00:00', 'patfeldman@yahoo.com', '1234567890'),
(24, 'tap1', 'feldman', '', 0, 0, 0, 0, '0000-00-00 00:00:00', 'patfeldman@yahoo.com', '1232354345');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
