-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2015 at 10:15 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

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
  `accessId` int(11) NOT NULL,
  `authToken` varchar(25) NOT NULL,
  `date` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `ipAddress` varchar(30) NOT NULL,
  `successLogin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE IF NOT EXISTS `crew` (
  `crewId` int(11) NOT NULL,
  `crewName` varchar(50) DEFAULT NULL,
  `numPeople` int(11) NOT NULL,
  `crewDescription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crewchatmessage`
--

CREATE TABLE IF NOT EXISTS `crewchatmessage` (
  `messageId` int(11) NOT NULL,
  `crewId` int(11) NOT NULL,
  `fromUid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` tinyblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `crewmember`
--

CREATE TABLE IF NOT EXISTS `crewmember` (
  `crewMemberId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `moodhistory`
--

CREATE TABLE IF NOT EXISTS `moodhistory` (
  `historyId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `moodGroup` int(11) NOT NULL,
  `moodItem` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `privatechatmessage`
--

CREATE TABLE IF NOT EXISTS `privatechatmessage` (
  `messageId` int(11) NOT NULL,
  `user1Id` int(11) NOT NULL,
  `user2Id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` tinyblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(50) NOT NULL,
  `temppassword` varchar(50) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `avatarType` int(11) NOT NULL DEFAULT '0',
  `current_latitude` float NOT NULL,
  `current_longitude` float NOT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authaccess`
--
ALTER TABLE `authaccess`
  ADD PRIMARY KEY (`accessId`), ADD KEY `User` (`userId`);

--
-- Indexes for table `crew`
--
ALTER TABLE `crew`
  ADD PRIMARY KEY (`crewId`);

--
-- Indexes for table `crewchatmessage`
--
ALTER TABLE `crewchatmessage`
  ADD PRIMARY KEY (`messageId`);

--
-- Indexes for table `crewmember`
--
ALTER TABLE `crewmember`
  ADD PRIMARY KEY (`crewMemberId`), ADD KEY `group` (`groupId`), ADD KEY `user` (`userId`);

--
-- Indexes for table `moodhistory`
--
ALTER TABLE `moodhistory`
  ADD PRIMARY KEY (`historyId`);

--
-- Indexes for table `privatechatmessage`
--
ALTER TABLE `privatechatmessage`
  ADD PRIMARY KEY (`messageId`), ADD KEY `user1` (`user1Id`), ADD KEY `User2` (`user2Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authaccess`
--
ALTER TABLE `authaccess`
  MODIFY `accessId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `crew`
--
ALTER TABLE `crew`
  MODIFY `crewId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `crewchatmessage`
--
ALTER TABLE `crewchatmessage`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `crewmember`
--
ALTER TABLE `crewmember`
  MODIFY `crewMemberId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `moodhistory`
--
ALTER TABLE `moodhistory`
  MODIFY `historyId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `privatechatmessage`
--
ALTER TABLE `privatechatmessage`
  MODIFY `messageId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
