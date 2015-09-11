-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2015 at 12:20 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `authaccess`
--

INSERT INTO `authaccess` (`accessId`, `authToken`, `date`, `userId`, `ipAddress`, `successLogin`) VALUES
(14, '8JeXyK8cvkpiljb4yccm', '2015-09-11 09:46:37', 14, '', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `temppassword`, `verified`, `avatarType`, `current_latitude`, `current_longitude`, `creation_date`, `email`, `phone`) VALUES
(14, 'pat', 'feldman', '', 0, 0, 0, 0, '0000-00-00 00:00:00', 'patfeldman@yahoo.com', '1234567890');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
