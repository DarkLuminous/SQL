-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2024 at 10:43 AM
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
-- Database: `research_office`
--
CREATE DATABASE IF NOT EXISTS `research_office` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `research_office`;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `researcher_type` text DEFAULT NULL CHECK (`researcher_type` in ('student','faculty'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `researcher_type`) VALUES
(1, 'Adonis A. Closas', 'faculty'),
(2, 'Eliseo P. Villanueva', 'faculty'),
(3, 'Alex L. Maureal', 'faculty'),
(4, 'Roland Joshua S. Pecson', 'faculty'),
(5, 'Grace E. Echavez', 'faculty'),
(6, 'Alma N. Abug', 'faculty'),
(7, 'Mark John T. Gabule', 'faculty'),
(8, 'Amparo V. Dinagso', 'faculty'),
(9, 'Antoniette Bacabac', 'faculty'),
(10, 'Angela Bernadine M. Cepeda', 'faculty'),
(11, 'Arianne S. Galenzoga\r\n', 'student'),
(12, 'Shania Marie J. Sambaan', 'student'),
(13, 'Archie G. Layaog', 'faculty'),
(14, 'Genevieve U. Garcia', 'faculty'),
(15, 'Anna Fay A. Edulsa\r\n', 'faculty'),
(16, 'Marylene S. Eder', 'faculty'),
(17, 'Kenn Geno G. Malinao', 'faculty'),
(18, 'Dexter L. Duat', 'faculty'),
(19, 'John Benedict L. Bernardo', 'faculty'),
(20, 'Princess Mae Compo', 'faculty'),
(23, 'Antonio-Abdu Sami M. Magomnang', 'faculty'),
(24, 'Angelo Mark P. Walag', 'faculty');

--
-- Triggers `authors`
--
DELIMITER $$
CREATE TRIGGER `after_author_delete` AFTER DELETE ON `authors` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, old_values)
    VALUES (
        'DELETE',
        'authors',
        OLD.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Name: ', OLD.name)
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_author_insert` AFTER INSERT ON `authors` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, new_values)
    VALUES (
        'INSERT',
        'authors',
        NEW.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Name: ', NEW.name)
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_author_update` AFTER UPDATE ON `authors` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, old_values, new_values, changes)
    VALUES (
        'UPDATE',
        'authors',
        OLD.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Name: ', OLD.name),
        CONCAT('Name: ', NEW.name),
        'Updated name'
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `journalarticles`
--

CREATE TABLE `journalarticles` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `journal_id` int(11) DEFAULT NULL,
  `volume` text DEFAULT NULL,
  `page` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `source_platform` text DEFAULT NULL,
  `publication_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journalarticles`
--

INSERT INTO `journalarticles` (`id`, `title`, `journal_id`, `volume`, `page`, `url`, `source_platform`, `publication_date`) VALUES
(1, 'Determination of Specific Moisture Evaporation Rate, Energy Consumption and Specific Energy Consumption at Varying Sample Load Capacity per Batch Drying in a Heat Dryer', 1, 'Vol. 3, Issue 6', 'pp. 225-232', 'http://www.ijetjournal.org/Volume3/Issue6/IJET-V3I6P36.pdf', 'Clarivate Analytics', '2017-12-01'),
(2, 'Management Information System for Smart Agriculture (MISSA) Soil Sensing in Initao, Misamis Oriental', 2, 'Vol. 15', NULL, 'https://mjst.ustp.edu.ph/index.php/mjst/article/view/77', 'SCOPUS ', '2017-04-10'),
(3, 'Point Source Effluents and its Effect on the Microbiological Assessment of its Effluent-Receiving Brackish Water', 3, 'Vol. 11, No. 4', 'pp. 220-228', 'https://www.innspub.net/wp-content/uploads/2022/09/JBES-V11-No4-p220-228.pdf', 'Clarivate Analytics', '2017-10-01'),
(4, 'Student Created Videos as Assessment of Learning in the Mathematics Classroom: Preservice Teachers\' Experiences and Reflections', 4, 'Vol. 5, No. 11', 'pp. 398-402', 'https://www.journalijar.com/uploads/880_84_IJAR-20363.pdf', 'Clarivate Analytics', '2017-11-01'),
(5, 'Assessment of Learning Practices among the Colleges in Mindanao University of Science and Technology', 5, 'Vol. 8, Issue 10', 'pp 1564-1571', 'https://www.ijser.org/researchpaper/Assessment-of-Learning-Practices-Among-the-Colleges-in-Mindanao-University-of-Science-and-Technology.pdf', 'Clarivate Analytics', '2017-10-01'),
(6, 'Initial Phytochemical Screening of the Different Parts of Mansoa alliacea L. (Garlic Vine)', 6, 'Vol. 11, No. 3', 'pp. 227-231\r\n', 'https://www.innspub.net/wp-content/uploads/2022/09/IJB-V11-No3-p219-223.pdf', 'Clarivate Analytics\r\n', '2017-09-30'),
(7, 'Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines', 7, 'Vol.16', 'pages 31-38', 'https://www.researchgate.net/publication/324175225_Survey_of_echinoderms_in_the_intertidal_zone_of_Goso-on_and_Vinapor_Carmen_Agusan_del_Norte_Philippines', 'Clarivate Analytics', '2018-03-31'),
(8, 'Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application', 8, 'Volume 11, No. 47', 'pp. 1-7', 'https://indjst.org/articles/heat-mobi-temperature-and-humidity-monitoring-for-household-and-warehouse-mobile-application', 'Clarivate Analytics', '2018-00-00'),
(9, 'An Ecömmerce Platform and Decision Support for Plants with Comprehensive Information', 9, 'Vol. 2, Issue 5', 'pp. 563-568 ', 'https://ijisrt.com/wp-content/uploads/2017/06/An-Ecommerce-Platform-and-Decision-Support-for-Plants-with-Comprehensive-Information-1.pdf', 'Clarivate Analytics', '2017-05-00'),
(10, 'Analysis of Biogas from agricultural biomass wastes fueled in an internal combustion engine unit', 8, 'Volume 12, No. 4', 'Page 1-12', 'https://indjst.org/articles/analysis-of-biogas-from-agricultural-biomass-wastes-fueled-in-an-internal-combustion-engine-unit', 'Clarivate Analytics', '2019-00-00');

--
-- Triggers `journalarticles`
--
DELIMITER $$
CREATE TRIGGER `after_journalarticle_delete` AFTER DELETE ON `journalarticles` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, old_values)
    VALUES (
        'DELETE',
        'journalarticles',
        OLD.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Title: ', OLD.title, ', Volume: ', OLD.volume, ', Pages: ', OLD.page)
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_journalarticle_insert` AFTER INSERT ON `journalarticles` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, new_values)
    VALUES (
        'INSERT',
        'journalarticles',
        NEW.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Title: ', NEW.title, ', Volume: ', NEW.volume, ', Pages: ', NEW.page)
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_journalarticle_update` AFTER UPDATE ON `journalarticles` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, old_values, new_values, changes)
    VALUES (
        'UPDATE',
        'journalarticles',
        OLD.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Title: ', OLD.title, ', Volume: ', OLD.volume, ', Pages: ', OLD.page),
        CONCAT('Title: ', NEW.title, ', Volume: ', NEW.volume, ', Pages: ', NEW.page),
        'Updated article details'
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `journalarticle_authors`
--

CREATE TABLE `journalarticle_authors` (
  `author_id` int(11) NOT NULL,
  `journalarticle_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journalarticle_authors`
--

INSERT INTO `journalarticle_authors` (`author_id`, `journalarticle_id`) VALUES
(1, 1),
(2, 1),
(2, 10),
(3, 2),
(4, 2),
(5, 2),
(6, 3),
(7, 2),
(7, 3),
(8, 4),
(8, 5),
(9, 5),
(10, 6),
(11, 6),
(12, 6),
(13, 7),
(14, 7),
(15, 8),
(15, 9),
(16, 8),
(17, 8),
(18, 8),
(19, 9),
(20, 9),
(23, 10),
(24, 6),
(24, 7);

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`id`, `title`) VALUES
(1, 'International Journal of Engineering and Techniques'),
(2, 'Mindanao Journal of Science and Technology (MJST)'),
(3, 'Journal of Biodiversity and Environmental Sciences'),
(4, 'International Journal of Advance Research'),
(5, 'International Journal of Scientific and Engineering Research'),
(6, 'International Journal of Biosciences'),
(7, 'Environmental and Experimental Biology\r\n'),
(8, 'Indian Journal of Science and Technology'),
(9, 'International Journal of Innovative Science and Research Technology'),
(10, 'Hello World');

--
-- Triggers `journals`
--
DELIMITER $$
CREATE TRIGGER `after_journal_delete` AFTER DELETE ON `journals` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, old_values)
    VALUES (
        'DELETE',
        'journals',
        OLD.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Title: ', OLD.title)
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_journal_insert` AFTER INSERT ON `journals` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, new_values)
    VALUES (
        'INSERT',
        'journals',
        NEW.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Title: ', NEW.title)
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_journal_update` AFTER UPDATE ON `journals` FOR EACH ROW BEGIN
    INSERT INTO logs (action_type, table_name, record_id, action_time, user_id, old_values, new_values, changes)
    VALUES (
        'UPDATE',
        'journals',
        OLD.id,
        NOW(),
        CURRENT_USER(),
        CONCAT('Title: ', OLD.title),
        CONCAT('Title: ', NEW.title),
        'Updated journal title'
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `journal_article_authors_view`
-- (See below for the actual view)
--
CREATE TABLE `journal_article_authors_view` (
`Journal Article` text
,`Authors` mediumtext
);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL,
  `action_type` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `record_id` int(11) NOT NULL,
  `action_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` varchar(255) DEFAULT NULL,
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL,
  `changes` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `additional_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `action_type`, `table_name`, `record_id`, `action_time`, `user_id`, `old_values`, `new_values`, `changes`, `ip_address`, `additional_info`) VALUES
(1, 'INSERT', 'journalarticles', 9, '2024-12-09 04:46:26', 'root@localhost', NULL, 'Title: Initial Phytochemical Screening of the Different Parts of Mansoa alliacea L. (Garlic Vine), Volume: Vol. 11, No. 3, Pages: pp. 227-231', NULL, NULL, NULL),
(2, 'DELETE', 'journalarticles', 9, '2024-12-09 04:48:53', 'root@localhost', 'Title: Initial Phytochemical Screening of the Different Parts of Mansoa alliacea L. (Garlic Vine), Volume: Vol. 11, No. 3, Pages: pp. 227-231', NULL, NULL, NULL, NULL),
(3, 'INSERT', 'journalarticles', 6, '2024-12-09 04:50:39', 'root@localhost', NULL, 'Title: Initial Phytochemical Screening of the Different Parts of Mansoa alliacea L. (Garlic Vine), Volume: Vol. 11, No. 3, Pages: pp. 227-231\r\n', NULL, NULL, NULL),
(4, 'INSERT', 'journalarticles', 7, '2024-12-09 04:52:03', 'root@localhost', NULL, NULL, NULL, NULL, NULL),
(5, 'INSERT', 'journalarticles', 8, '2024-12-09 04:52:03', 'root@localhost', NULL, NULL, NULL, NULL, NULL),
(6, 'INSERT', 'journalarticles', 9, '2024-12-09 04:52:03', 'root@localhost', NULL, NULL, NULL, NULL, NULL),
(7, 'UPDATE', 'journalarticles', 7, '2024-12-09 04:52:54', 'root@localhost', NULL, NULL, 'Updated article details', NULL, NULL),
(8, 'UPDATE', 'journalarticles', 7, '2024-12-09 04:53:05', 'root@localhost', NULL, 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: Vol.16, pages 31-38\nMarch 2018', 'Updated article details', NULL, NULL),
(9, 'UPDATE', 'journalarticles', 7, '2024-12-09 04:53:29', 'root@localhost', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: Vol.16, pages 31-38\nMarch 2018', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: Vol.16, pages 31-38', 'Updated article details', NULL, NULL),
(10, 'UPDATE', 'journalarticles', 7, '2024-12-09 04:53:36', 'root@localhost', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: Vol.16, pages 31-38', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Updated article details', NULL, NULL),
(11, 'UPDATE', 'journalarticles', 7, '2024-12-09 04:53:49', 'root@localhost', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Updated article details', NULL, NULL),
(12, 'UPDATE', 'journalarticles', 8, '2024-12-09 04:54:04', 'root@localhost', NULL, NULL, 'Updated article details', NULL, NULL),
(13, 'UPDATE', 'journalarticles', 9, '2024-12-09 04:54:19', 'root@localhost', NULL, NULL, 'Updated article details', NULL, NULL),
(14, 'UPDATE', 'journalarticles', 8, '2024-12-09 04:54:38', 'root@localhost', NULL, NULL, 'Updated article details', NULL, NULL),
(15, 'UPDATE', 'journalarticles', 8, '2024-12-09 04:54:53', 'root@localhost', NULL, NULL, 'Updated article details', NULL, NULL),
(16, 'UPDATE', 'journalarticles', 8, '2024-12-09 04:55:01', 'root@localhost', NULL, 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7\n2018', 'Updated article details', NULL, NULL),
(17, 'UPDATE', 'journalarticles', 8, '2024-12-09 04:55:07', 'root@localhost', 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7\n2018', 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7', 'Updated article details', NULL, NULL),
(18, 'UPDATE', 'journalarticles', 9, '2024-12-09 04:55:25', 'root@localhost', NULL, NULL, 'Updated article details', NULL, NULL),
(19, 'UPDATE', 'journalarticles', 9, '2024-12-09 04:55:33', 'root@localhost', NULL, 'Title: An Ecömmerce Platform and Decision Support for Plants with Comprehensive Information, Volume: Vol. 2, Issue 5, Pages: pp. 563-568 ', 'Updated article details', NULL, NULL),
(20, 'INSERT', 'journalarticles', 10, '2024-12-09 04:57:25', 'root@localhost', NULL, 'Title: Analysis of Biogas from agricultural biomass wastes fueled in an internal combustion engine unit, Volume: Volume 12, No. 4, Pages: Page 1-12', NULL, NULL, NULL),
(21, 'UPDATE', 'journalarticles', 10, '2024-12-09 04:58:29', 'root@localhost', 'Title: Analysis of Biogas from agricultural biomass wastes fueled in an internal combustion engine unit, Volume: Volume 12, No. 4, Pages: Page 1-12', 'Title: Analysis of Biogas from agricultural biomass wastes fueled in an internal combustion engine unit, Volume: Volume 12, No. 4, Pages: Page 1-12', 'Updated article details', NULL, NULL),
(22, 'UPDATE', 'journalarticles', 9, '2024-12-09 04:59:12', 'root@localhost', 'Title: An Ecömmerce Platform and Decision Support for Plants with Comprehensive Information, Volume: Vol. 2, Issue 5, Pages: pp. 563-568 ', 'Title: An Ecömmerce Platform and Decision Support for Plants with Comprehensive Information, Volume: Vol. 2, Issue 5, Pages: pp. 563-568 ', 'Updated article details', NULL, NULL),
(23, 'UPDATE', 'journalarticles', 8, '2024-12-09 04:59:43', 'root@localhost', 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7', 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7', 'Updated article details', NULL, NULL),
(24, 'UPDATE', 'journalarticles', 7, '2024-12-09 05:00:18', 'root@localhost', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Updated article details', NULL, NULL),
(25, 'UPDATE', 'journalarticles', 7, '2024-12-09 05:00:37', 'root@localhost', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Updated article details', NULL, NULL),
(26, 'UPDATE', 'journalarticles', 7, '2024-12-09 05:00:53', 'root@localhost', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Updated article details', NULL, NULL),
(27, 'UPDATE', 'journalarticles', 8, '2024-12-09 05:00:57', 'root@localhost', 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7', 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7', 'Updated article details', NULL, NULL),
(28, 'UPDATE', 'journalarticles', 9, '2024-12-09 05:01:01', 'root@localhost', 'Title: An Ecömmerce Platform and Decision Support for Plants with Comprehensive Information, Volume: Vol. 2, Issue 5, Pages: pp. 563-568 ', 'Title: An Ecömmerce Platform and Decision Support for Plants with Comprehensive Information, Volume: Vol. 2, Issue 5, Pages: pp. 563-568 ', 'Updated article details', NULL, NULL),
(29, 'INSERT', 'journals', 6, '2024-12-09 05:01:54', 'root@localhost', NULL, 'Title: International Journal of Biosciences', NULL, NULL, NULL),
(30, 'INSERT', 'journals', 7, '2024-12-09 05:03:41', 'root@localhost', NULL, 'Title: Environmental and Experimental Biology\r\n', NULL, NULL, NULL),
(31, 'INSERT', 'journals', 8, '2024-12-09 05:03:41', 'root@localhost', NULL, 'Title: Indian Journal of Science and Technology', NULL, NULL, NULL),
(32, 'INSERT', 'journals', 9, '2024-12-09 05:03:41', 'root@localhost', NULL, 'Title: International Journal of Innovative Science and Research Technology', NULL, NULL, NULL),
(33, 'UPDATE', 'journalarticles', 6, '2024-12-09 05:04:31', 'root@localhost', 'Title: Initial Phytochemical Screening of the Different Parts of Mansoa alliacea L. (Garlic Vine), Volume: Vol. 11, No. 3, Pages: pp. 227-231\r\n', 'Title: Initial Phytochemical Screening of the Different Parts of Mansoa alliacea L. (Garlic Vine), Volume: Vol. 11, No. 3, Pages: pp. 227-231\r\n', 'Updated article details', NULL, NULL),
(34, 'UPDATE', 'journalarticles', 7, '2024-12-09 05:04:40', 'root@localhost', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Title: Survey of Echinoderms in the Intertidal Zone of Goso-on and Vinapor, Carmen, Agusan del Norte, Philippines, Volume: Vol.16, Pages: pages 31-38', 'Updated article details', NULL, NULL),
(35, 'UPDATE', 'journalarticles', 8, '2024-12-09 05:05:01', 'root@localhost', 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7', 'Title: Heatmobi: Temperature and Humidity Monitoring for Household and Warehouse Mobile Application, Volume: Volume 11, No. 47, Pages: pp. 1-7', 'Updated article details', NULL, NULL),
(36, 'UPDATE', 'journalarticles', 9, '2024-12-09 05:05:24', 'root@localhost', 'Title: An Ecömmerce Platform and Decision Support for Plants with Comprehensive Information, Volume: Vol. 2, Issue 5, Pages: pp. 563-568 ', 'Title: An Ecömmerce Platform and Decision Support for Plants with Comprehensive Information, Volume: Vol. 2, Issue 5, Pages: pp. 563-568 ', 'Updated article details', NULL, NULL),
(37, 'UPDATE', 'journalarticles', 10, '2024-12-09 05:05:35', 'root@localhost', 'Title: Analysis of Biogas from agricultural biomass wastes fueled in an internal combustion engine unit, Volume: Volume 12, No. 4, Pages: Page 1-12', 'Title: Analysis of Biogas from agricultural biomass wastes fueled in an internal combustion engine unit, Volume: Volume 12, No. 4, Pages: Page 1-12', 'Updated article details', NULL, NULL),
(38, 'INSERT', 'authors', 10, '2024-12-09 05:07:05', 'root@localhost', NULL, 'Name: Angela Bernadine M. Cepeda', NULL, NULL, NULL),
(39, 'INSERT', 'authors', 11, '2024-12-09 05:07:05', 'root@localhost', NULL, 'Name: Arianne S. Galenzoga\r\n', NULL, NULL, NULL),
(40, 'INSERT', 'authors', 12, '2024-12-09 05:07:05', 'root@localhost', NULL, 'Name: Shania Marie J. Sambaan', NULL, NULL, NULL),
(41, 'INSERT', 'authors', 13, '2024-12-09 05:07:36', 'root@localhost', NULL, 'Name: Archie G. Layaog', NULL, NULL, NULL),
(42, 'INSERT', 'authors', 14, '2024-12-09 05:07:36', 'root@localhost', NULL, 'Name: Genevieve U. Garcia', NULL, NULL, NULL),
(43, 'INSERT', 'authors', 15, '2024-12-09 05:08:53', 'root@localhost', NULL, 'Name: Anna Fay A. Edulsa\r\n', NULL, NULL, NULL),
(44, 'INSERT', 'authors', 16, '2024-12-09 05:08:53', 'root@localhost', NULL, 'Name: Marylene S. Eder', NULL, NULL, NULL),
(45, 'INSERT', 'authors', 17, '2024-12-09 05:08:53', 'root@localhost', NULL, 'Name: Kenn Geno G. Malinao', NULL, NULL, NULL),
(46, 'INSERT', 'authors', 18, '2024-12-09 05:08:53', 'root@localhost', NULL, 'Name: Dexter L. Duat', NULL, NULL, NULL),
(47, 'INSERT', 'authors', 19, '2024-12-09 05:09:19', 'root@localhost', NULL, 'Name: John Benedict L. Bernardo', NULL, NULL, NULL),
(48, 'INSERT', 'authors', 20, '2024-12-09 05:09:19', 'root@localhost', NULL, 'Name: Princess Mae Compo', NULL, NULL, NULL),
(50, 'INSERT', 'authors', 23, '2024-12-09 05:10:12', 'root@localhost', NULL, 'Name: Antonio-Abdu Sami M. Magomnang', NULL, NULL, NULL),
(51, 'INSERT', 'authors', 24, '2024-12-09 05:11:45', 'root@localhost', NULL, 'Name: Angelo Mark P. Walag', NULL, NULL, NULL),
(52, 'INSERT', 'journals', 10, '2024-12-09 05:19:18', 'root@localhost', NULL, 'Title: Hello World', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `website_view`
-- (See below for the actual view)
--
CREATE TABLE `website_view` (
`Article Title` text
,`Authors` mediumtext
,`Journal Title` text
,`Volume` text
,`Pages` text
,`URL` text
,`Date_Published` date
);

-- --------------------------------------------------------

--
-- Structure for view `journal_article_authors_view`
--
DROP TABLE IF EXISTS `journal_article_authors_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `journal_article_authors_view`  AS SELECT `ja`.`title` AS `Journal Article`, group_concat(`a`.`name` order by `a`.`name` ASC separator ',') AS `Authors` FROM ((`journalarticles` `ja` join `journalarticle_authors` `jaa` on(`ja`.`id` = `jaa`.`journalarticle_id`)) join `authors` `a` on(`jaa`.`author_id` = `a`.`id`)) GROUP BY `ja`.`title` ;

-- --------------------------------------------------------

--
-- Structure for view `website_view`
--
DROP TABLE IF EXISTS `website_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `website_view`  AS SELECT `journalarticles`.`title` AS `Article Title`, group_concat(`authors`.`name` order by `authors`.`name` ASC separator ', ') AS `Authors`, `journals`.`title` AS `Journal Title`, `journalarticles`.`volume` AS `Volume`, `journalarticles`.`page` AS `Pages`, `journalarticles`.`url` AS `URL`, `journalarticles`.`publication_date` AS `Date_Published` FROM (((`authors` join `journalarticle_authors` on(`journalarticle_authors`.`author_id` = `authors`.`id`)) join `journalarticles` on(`journalarticle_authors`.`journalarticle_id` = `journalarticles`.`id`)) join `journals` on(`journals`.`id` = `journalarticles`.`journal_id`)) GROUP BY `journalarticles`.`title`, `journals`.`title`, `journalarticles`.`volume`, `journalarticles`.`page`, `journalarticles`.`url`, `journalarticles`.`publication_date` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING HASH;

--
-- Indexes for table `journalarticles`
--
ALTER TABLE `journalarticles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_id` (`journal_id`);

--
-- Indexes for table `journalarticle_authors`
--
ALTER TABLE `journalarticle_authors`
  ADD PRIMARY KEY (`author_id`,`journalarticle_id`),
  ADD KEY `journalarticle_id` (`journalarticle_id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`) USING HASH;

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `journalarticles`
--
ALTER TABLE `journalarticles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `journalarticles`
--
ALTER TABLE `journalarticles`
  ADD CONSTRAINT `journalarticles_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`);

--
-- Constraints for table `journalarticle_authors`
--
ALTER TABLE `journalarticle_authors`
  ADD CONSTRAINT `journalarticle_authors_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `journalarticle_authors_ibfk_2` FOREIGN KEY (`journalarticle_id`) REFERENCES `journalarticles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
