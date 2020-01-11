-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jan 11, 2020 at 10:51 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recruitement`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ADDRESS` varchar(255) NOT NULL,
  `CITY` varchar(200) NOT NULL,
  `ADMIN_IMG` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applied_jobs`
--

DROP TABLE IF EXISTS `applied_jobs`;
CREATE TABLE IF NOT EXISTS `applied_jobs` (
  `ID_APPLIEDJOBS` int(11) NOT NULL AUTO_INCREMENT,
  `APPLYING_DATE` date NOT NULL,
  `IS_ACCEPTED` tinyint(1) NOT NULL,
  `ID_JOB_FK` int(11) NOT NULL,
  `ID_CANDIDATE_FK` int(11) NOT NULL,
  PRIMARY KEY (`ID_APPLIEDJOBS`),
  KEY `FK_APPLIED_JOBS_CANDIDATE_REF` (`ID_CANDIDATE_FK`),
  KEY `FK_APPLIED_JOBS_JOB_OFFERS_ID` (`ID_JOB_FK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
CREATE TABLE IF NOT EXISTS `candidate` (
  `ID_CANDIDATE` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `FIRSTNAME` varchar(255) NOT NULL,
  `LASTNAME` varchar(255) NOT NULL,
  `PHONE_NUMBER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RESUME` blob NOT NULL,
  `CANDIDATE_IMG` blob NOT NULL,
  `REGISTRATION_DATE` date NOT NULL,
  `EXPERIENCE_FK` int(11) NOT NULL,
  `POSITION_FK` int(11) NOT NULL,
  `ID_FIELD_FK` int(11) NOT NULL,
  PRIMARY KEY (`ID_CANDIDATE`),
  KEY `FK_CANDIDATE_EXPERIENCE_REF` (`EXPERIENCE_FK`),
  KEY `FK_CANDIDATE_POSITION_REF` (`POSITION_FK`),
  KEY `FK_CANDIDATE_FIELD_REF` (`ID_FIELD_FK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `ID_COMPANY` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `COMPANY_NAME` varchar(255) NOT NULL,
  `PHONE_NUMBER` varchar(255) NOT NULL,
  `WEBSITE_URL` varchar(255) NOT NULL,
  `COMPANY_IMG` blob NOT NULL,
  `REGISTRATION_DATE` date NOT NULL,
  `ID_SECTOR_FK` int(11) NOT NULL,
  PRIMARY KEY (`ID_COMPANY`),
  KEY `FK_COMPANY_SECTOR_REF` (`ID_SECTOR_FK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `ID_CONTRAT` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_CONTRAT` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_CONTRAT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
CREATE TABLE IF NOT EXISTS `experience` (
  `ID_EXPERIENCE` int(11) NOT NULL AUTO_INCREMENT,
  `EXPERIENCE_LEVEL` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_EXPERIENCE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
CREATE TABLE IF NOT EXISTS `field` (
  `ID_FIELD` int(11) NOT NULL AUTO_INCREMENT,
  `FIELD_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_FIELD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_offers`
--

DROP TABLE IF EXISTS `job_offers`;
CREATE TABLE IF NOT EXISTS `job_offers` (
  `ID_JOB` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_TITLE` varchar(255) NOT NULL,
  `JOB_DESCRIPTION` varchar(255) NOT NULL,
  `POSTING_DATE` date NOT NULL,
  `IS_CLOSED` tinyint(1) NOT NULL,
  `NBR_POSITION` int(11) NOT NULL,
  `ID_POSITION_FK` int(11) NOT NULL,
  `ID_COMPANY_FK` int(11) NOT NULL,
  `ID_EXPERIENCE_FK` int(11) NOT NULL,
  `ID_CONTRAT_FK` int(11) NOT NULL,
  PRIMARY KEY (`ID_JOB`),
  KEY `FK_JOBOFFERS_COMPANY_REF` (`ID_COMPANY_FK`),
  KEY `FK_JOB_OFFERS_POSITION_REF` (`ID_POSITION_FK`),
  KEY `FK_JOB_OFFERS_EXPERIENCE_REF` (`ID_EXPERIENCE_FK`),
  KEY `FK_JOB_OFFERS_CONTRAT_REF` (`ID_CONTRAT_FK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `ID_POSITION` int(11) NOT NULL AUTO_INCREMENT,
  `POSITION_NAME` varchar(255) NOT NULL,
  `STUDY_LEVEL` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_POSITION`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `ID_SECTOR` int(11) NOT NULL AUTO_INCREMENT,
  `SECTOR_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_SECTOR`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
