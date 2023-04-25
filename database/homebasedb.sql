-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2023 at 06:09 PM
-- Server version: 5.7.39-42-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homebasedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `behaviordb`
--

CREATE TABLE `behaviordb` (
                              `title` varchar(100) NOT NULL,
                              `behaviorLevel` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `behaviordb`
--

INSERT INTO `behaviordb` (`title`, `behaviorLevel`) VALUES
                                                        ('Blanket', 'Beginner'),
                                                        ('Can be caught and haltered in the field', 'Beginner'),
                                                        ('Clean all 4 feet', 'Beginner'),
                                                        ('Comfortable with grooming', 'Beginner'),
                                                        ('Fly', 'Hard'),
                                                        ('Fly mask', 'Beginner'),
                                                        ('Fly spray', 'Beginner'),
                                                        ('Stand tied', 'Beginner'),
                                                        ('Walk forward on a loose lead', 'Beginner'),
                                                        ('Whoa', 'Beginner');

-- --------------------------------------------------------

--
-- Table structure for table `dbapplicantscreenings`
--

CREATE TABLE `dbapplicantscreenings` (
                                         `type` text NOT NULL,
                                         `creator` text,
                                         `steps` text,
                                         `status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbdates`
--

CREATE TABLE `dbdates` (
                           `id` char(20) NOT NULL,
                           `shifts` text,
                           `mgr_notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbdates`
--

INSERT INTO `dbdates` (`id`, `shifts`, `mgr_notes`) VALUES
                                                        ('22-01-24:portland', '22-01-24:9-12:portland*22-01-24:3-6:portland*22-01-24:6-9:portland*22-01-24:12-3:portland', ''),
                                                        ('22-01-25:portland', '22-01-25:9-12:portland*22-01-25:12-3:portland*22-01-25:3-6:portland*22-01-25:6-9:portland', ''),
                                                        ('22-01-26:portland', '22-01-26:9-12:portland*22-01-26:12-3:portland*22-01-26:3-6:portland*22-01-26:6-9:portland', ''),
                                                        ('22-01-27:portland', '22-01-27:9-12:portland*22-01-27:12-3:portland*22-01-27:3-6:portland*22-01-27:6-9:portland', ''),
                                                        ('22-01-28:portland', '22-01-28:9-12:portland*22-01-28:12-3:portland*22-01-28:3-6:portland*22-01-28:6-9:portland*22-01-28:night:portland', ''),
                                                        ('22-01-29:portland', '22-01-29:10-1:portland*22-01-29:1-4:portland*22-01-29:night:portland', ''),
                                                        ('22-01-30:portland', '22-01-30:9-12:portland*22-01-30:2-5:portland*22-01-30:5-9:portland', ''),
                                                        ('22-01-31:portland', '22-01-31:9-12:portland*22-01-31:3-6:portland*22-01-31:6-9:portland*22-01-31:12-3:portland', ''),
                                                        ('22-02-01:portland', '22-02-01:9-12:portland*22-02-01:12-3:portland*22-02-01:3-6:portland*22-02-01:6-9:portland', ''),
                                                        ('22-02-02:portland', '22-02-02:9-12:portland*22-02-02:12-3:portland*22-02-02:3-6:portland*22-02-02:6-9:portland', ''),
                                                        ('22-02-03:portland', '22-02-03:9-12:portland*22-02-03:12-3:portland*22-02-03:3-6:portland*22-02-03:6-9:portland', ''),
                                                        ('22-02-04:portland', '22-02-04:9-12:portland*22-02-04:3-6:portland*22-02-04:6-9:portland*22-02-04:night:portland*22-02-04:12-3:portland', ''),
                                                        ('22-02-05:portland', '22-02-05:10-1:portland*22-02-05:1-4:portland*22-02-05:night:portland', ''),
                                                        ('22-02-06:portland', '22-02-06:9-12:portland*22-02-06:2-5:portland*22-02-06:5-9:portland', '');

-- --------------------------------------------------------

--
-- Table structure for table `dblog`
--

CREATE TABLE `dblog` (
                         `id` int(3) NOT NULL,
                         `time` text,
                         `message` text,
                         `venue` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbmasterschedule`
--

CREATE TABLE `dbmasterschedule` (
                                    `venue` text,
                                    `day` text NOT NULL,
                                    `week_no` text NOT NULL,
                                    `hours` text,
                                    `slots` int(11) DEFAULT NULL,
                                    `persons` text,
                                    `notes` text,
                                    `id` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbmasterschedule`
--

INSERT INTO `dbmasterschedule` (`venue`, `day`, `week_no`, `hours`, `slots`, `persons`, `notes`, `id`) VALUES
                                                                                                           ('portland', 'Mon', 'odd', '9-12', 3, ',Jane7038293469,Cathy7038295422,Cheryl7032821358', '', 'odd:Mon:9-12:portland'),
                                                                                                           ('portland', 'Mon', 'odd', '3-6', 2, ',Robin7037510984,Claire7033293465', '', 'odd:Mon:3-6:portland'),
                                                                                                           ('portland', 'Mon', 'odd', '6-9', 2, ',Nonie7037812392', '', 'odd:Mon:6-9:portland'),
                                                                                                           ('portland', 'Tue', 'odd', '9-12', 2, ',Jane7038859127,Stacey7032333522', '', 'odd:Tue:9-12:portland'),
                                                                                                           ('portland', 'Tue', 'odd', '12-3', 2, ',Cindy7035631089', '', 'odd:Tue:12-3:portland'),
                                                                                                           ('portland', 'Tue', 'odd', '3-6', 2, ',Becky7037725009,Betsy7038464935', '', 'odd:Tue:3-6:portland'),
                                                                                                           ('portland', 'Tue', 'odd', '6-9', 2, ',Kara7035953232,Daniel7032330196', '', 'odd:Tue:6-9:portland'),
                                                                                                           ('portland', 'Wed', 'odd', '9-12', 2, ',Aynne7032328782,Charlie7032728637', '', 'odd:Wed:9-12:portland'),
                                                                                                           ('portland', 'Wed', 'odd', '12-3', 2, ',John7032476256', '', 'odd:Wed:12-3:portland'),
                                                                                                           ('portland', 'Wed', 'odd', '3-6', 2, ',Amy7037519944,Ann7038470375', '', 'odd:Wed:3-6:portland'),
                                                                                                           ('portland', 'Wed', 'odd', '6-9', 2, ',Marilee7034159124,Claudia7033181908', '', 'odd:Wed:6-9:portland'),
                                                                                                           ('portland', 'Thu', 'odd', '9-12', 2, ',Cathy7038784455,Meg7039395058', '', 'odd:Thu:9-12:portland'),
                                                                                                           ('portland', 'Thu', 'odd', '12-3', 2, ',Marjorie7032328434', '', 'odd:Thu:12-3:portland'),
                                                                                                           ('portland', 'Thu', 'odd', '3-6', 2, ',Nancy7032210332,Suzanne7037018778', '', 'odd:Thu:3-6:portland'),
                                                                                                           ('portland', 'Thu', 'odd', '6-9', 2, ',Jody7033294089,Allyson7034410528', '', 'odd:Thu:6-9:portland'),
                                                                                                           ('portland', 'Fri', 'odd', '9-12', 2, ',Sally7037993827,Becky7038463827', '', 'odd:Fri:9-12:portland'),
                                                                                                           ('portland', 'Fri', 'odd', '12-3', 2, ',Ellen7034432810', '', 'odd:Fri:12-3:portland'),
                                                                                                           ('portland', 'Fri', 'odd', '3-6', 3, ',Phyllis7032325963,Elaine7037672928', '', 'odd:Fri:3-6:portland'),
                                                                                                           ('portland', 'Fri', 'odd', '6-9', 0, '', '', 'odd:Fri:6-9:portland'),
                                                                                                           ('portland', 'Mon', 'even', '9-12', 3, ',Jane7038293469,Cathy7038295422,Cheryl7032821358', '', 'even:Mon:9-12:portland'),
                                                                                                           ('portland', 'Mon', 'even', '3-6', 2, ',Maureen7032100761,Claire7033293465', '', 'even:Mon:3-6:portland'),
                                                                                                           ('portland', 'Mon', 'even', '6-9', 2, ',Vickie7033180302,Estelle7037720647', '', 'even:Mon:6-9:portland'),
                                                                                                           ('portland', 'Tue', 'even', '9-12', 2, ',Jane7038859127,Stacey7032333522', '', 'even:Tue:9-12:portland'),
                                                                                                           ('portland', 'Tue', 'even', '12-3', 2, ',Mary Ann7038833212,Gibbs7037474590', '', 'even:Tue:12-3:portland'),
                                                                                                           ('portland', 'Tue', 'even', '3-6', 2, ',Becky7037725009,Betsy7038464935', '', 'even:Tue:3-6:portland'),
                                                                                                           ('portland', 'Tue', 'even', '6-9', 2, ',Josh7037124705,April7038075431', '', 'even:Tue:6-9:portland'),
                                                                                                           ('portland', 'Wed', 'even', '9-12', 2, ',Jeannie7037970345,Kym7037970345', '', 'even:Wed:9-12:portland'),
                                                                                                           ('portland', 'Wed', 'even', '12-3', 2, ',Ellen7037994830', '', 'even:Wed:12-3:portland'),
                                                                                                           ('portland', 'Wed', 'even', '3-6', 2, ',Nancy7034158150', '', 'even:Wed:3-6:portland'),
                                                                                                           ('portland', 'Wed', 'even', '6-9', 2, ',Jody7033294089,Lilly2158349209', '', 'even:Wed:6-9:portland'),
                                                                                                           ('portland', 'Thu', 'even', '9-12', 2, '', '', 'even:Thu:9-12:portland'),
                                                                                                           ('portland', 'Thu', 'even', '12-3', 2, ',Thorne7034439654,Meg7037298111', '', 'even:Thu:12-3:portland'),
                                                                                                           ('portland', 'Thu', 'even', '3-6', 2, ',Linda7037568845,Sue7033171877', '', 'even:Thu:3-6:portland'),
                                                                                                           ('portland', 'Thu', 'even', '6-9', 2, ',Shay6175012425,Rebecca5185881836', '', 'even:Thu:6-9:portland'),
                                                                                                           ('portland', 'Fri', 'even', '9-12', 3, ',Bobbi7033447417,Meg7039395058', '', 'even:Fri:9-12:portland'),
                                                                                                           ('portland', 'Fri', 'even', '3-6', 3, ',Phyllis7032325963,Margi7034152255', '', 'even:Fri:3-6:portland'),
                                                                                                           ('portland', 'Fri', 'even', '6-9', 0, '', '', 'even:Fri:6-9:portland'),
                                                                                                           ('portland', 'Sat', '1st', '10-1', 3, ',Nancy7036769033,Beth7033399448,Rita7037998431', '', '1st:Sat:10-1:portland'),
                                                                                                           ('portland', 'Sat', '1st', '1-4', 1, ',Beverly7038542682', '', '1st:Sat:1-4:portland'),
                                                                                                           ('portland', 'Sat', '2nd', '10-1', 1, '', '', '2nd:Sat:10-1:portland'),
                                                                                                           ('portland', 'Sat', '2nd', '1-4', 1, ',Susan7037817946', '', '2nd:Sat:1-4:portland'),
                                                                                                           ('portland', 'Sat', '3rd', '10-1', 1, '', '', '3rd:Sat:10-1:portland'),
                                                                                                           ('portland', 'Sat', '3rd', '1-4', 1, '', '', '3rd:Sat:1-4:portland'),
                                                                                                           ('portland', 'Sat', '4th', '10-1', 1, '', '', '4th:Sat:10-1:portland'),
                                                                                                           ('portland', 'Sat', '5th', '10-1', 1, '', '', '5th:Sat:10-1:portland'),
                                                                                                           ('portland', 'Sat', '5th', '1-4', 1, '', '', '5th:Sat:1-4:portland'),
                                                                                                           ('portland', 'Sun', '1st', '9-12', 1, '', '', '1st:Sun:9-12:portland'),
                                                                                                           ('portland', 'Sun', '1st', '2-5', 1, ',Mary7038293321', '', '1st:Sun:2-5:portland'),
                                                                                                           ('portland', 'Sun', '1st', '5-9', 1, ',Paul7032323414', '', '1st:Sun:5-9:portland'),
                                                                                                           ('portland', 'Sun', '2nd', '9-12', 1, '', '', '2nd:Sun:9-12:portland'),
                                                                                                           ('portland', 'Sun', '3rd', '9-12', 1, '', '', '3rd:Sun:9-12:portland'),
                                                                                                           ('portland', 'Sun', '3rd', '2-5', 2, ',Lance7032528780,Melissa7036501479', '', '3rd:Sun:2-5:portland'),
                                                                                                           ('portland', 'Sun', '4th', '9-12', 1, ',Gaye7032476985', '', '4th:Sun:9-12:portland'),
                                                                                                           ('portland', 'Sun', '4th', '2-5', 1, '', '', '4th:Sun:2-5:portland'),
                                                                                                           ('portland', 'Sun', '4th', '5-9', 1, '', '', '4th:Sun:5-9:portland'),
                                                                                                           ('portland', 'Sun', '5th', '9-12', 1, '', '', '5th:Sun:9-12:portland'),
                                                                                                           ('portland', 'Sun', '5th', '2-5', 1, '', '', '5th:Sun:2-5:portland'),
                                                                                                           ('portland', 'Sun', '5th', '5-9', 1, ',Chris7038788512', '', '5th:Sun:5-9:portland'),
                                                                                                           ('portland', 'Fri', 'odd', 'night', 1, '', '', 'odd:Fri:night:portland'),
                                                                                                           ('portland', 'Fri', 'even', 'night', 1, '', '', 'even:Fri:night:portland'),
                                                                                                           ('portland', 'Sat', '1st', 'night', 1, '', '', '1st:Sat:night:portland'),
                                                                                                           ('portland', 'Sat', '2nd', 'night', 1, '', '', '2nd:Sat:night:portland'),
                                                                                                           ('portland', 'Sat', '3rd', 'night', 1, '', '', '3rd:Sat:night:portland'),
                                                                                                           ('portland', 'Sat', '4th', 'night', 1, '', '', '4th:Sat:night:portland'),
                                                                                                           ('portland', 'Sat', '5th', 'night', 1, '', '', '5th:Sat:night:portland'),
                                                                                                           ('portland', 'Sat', '4th', '1-4', 1, '', '', '4th:Sat:1-4:portland'),
                                                                                                           ('portland', 'Mon', 'even', '12-3', 2, ',Peter7037991786,Cheryl7038089589', '', 'even:Mon:12-3:portland'),
                                                                                                           ('portland', 'Sun', '3rd', '5-9', 1, '', '', '3rd:Sun:5-9:portland'),
                                                                                                           ('portland', 'Fri', 'even', '12-3', 2, ',Suzanne7037018778', '', 'even:Fri:12-3:portland'),
                                                                                                           ('portland', 'Sun', '2nd', '2-5', 1, ',Chris7038788512', '', '2nd:Sun:2-5:portland'),
                                                                                                           ('portland', 'Sun', '2nd', '5-9', 1, '', '', '2nd:Sun:5-9:portland'),
                                                                                                           ('portland', 'Mon', 'odd', '12-3', 2, ',Cheryl7038089589', '', 'odd:Mon:12-3:portland'),
                                                                                                           ('bangor', 'Sat', '5th', 'night', 0, '', '', '5th:Sat:night:bangor'),
                                                                                                           ('bangor', 'Mon', 'odd', '9-12', 1, '', '', 'odd:Mon:9-12:bangor'),
                                                                                                           ('bangor', 'Tue', 'odd', '9-12', 1, ',Julie7039424211', '', 'odd:Tue:9-12:bangor'),
                                                                                                           ('bangor', 'Wed', 'odd', '9-12', 1, ',Linda7037358701', '', 'odd:Wed:9-12:bangor'),
                                                                                                           ('bangor', 'Thu', 'odd', '9-12', 1, ',Lura7039471915', '', 'odd:Thu:9-12:bangor'),
                                                                                                           ('bangor', 'Fri', 'odd', '9-12', 1, ',Sara7036594431', '', 'odd:Fri:9-12:bangor'),
                                                                                                           ('bangor', 'Mon', 'even', '9-12', 1, '', '', 'even:Mon:9-12:bangor'),
                                                                                                           ('bangor', 'Tue', 'even', '9-12', 1, ',Julie7039424211', '', 'even:Tue:9-12:bangor'),
                                                                                                           ('bangor', 'Wed', 'even', '9-12', 1, ',Linda7037358701', '', 'even:Wed:9-12:bangor'),
                                                                                                           ('bangor', 'Thu', 'even', '9-12', 1, ',Lura7039471915', '', 'even:Thu:9-12:bangor'),
                                                                                                           ('bangor', 'Fri', 'even', '9-12', 1, ',Sara7036594431', '', 'even:Fri:9-12:bangor'),
                                                                                                           ('bangor', 'Thu', 'odd', '3-6', 2, ',Cassandra7039445038,Nicole9176052094', '', 'odd:Thu:3-6:bangor'),
                                                                                                           ('bangor', 'Mon', 'odd', '12-3', 1, ',Barbara7033227096', '', 'odd:Mon:12-3:bangor'),
                                                                                                           ('bangor', 'Tue', 'odd', '12-3', 1, ',Sara7036594431', '', 'odd:Tue:12-3:bangor'),
                                                                                                           ('bangor', 'Wed', 'odd', '12-3', 1, ',Bonnie7039421321', '', 'odd:Wed:12-3:bangor'),
                                                                                                           ('bangor', 'Thu', 'odd', '12-3', 2, ',Shannon7039912298,Hannah7036109735', '', 'odd:Thu:12-3:bangor'),
                                                                                                           ('bangor', 'Fri', 'odd', '12-3', 1, ',Jane7038273452', '', 'odd:Fri:12-3:bangor'),
                                                                                                           ('bangor', 'Mon', 'odd', '3-6', 1, '', '', 'odd:Mon:3-6:bangor'),
                                                                                                           ('bangor', 'Tue', 'odd', '3-6', 1, ',Jennifer7038527724', '', 'odd:Tue:3-6:bangor'),
                                                                                                           ('bangor', 'Wed', 'odd', '3-6', 1, '', '', 'odd:Wed:3-6:bangor'),
                                                                                                           ('bangor', 'Fri', 'odd', '3-6', 1, ',Amanda7032051750', '', 'odd:Fri:3-6:bangor'),
                                                                                                           ('bangor', 'Mon', 'odd', '6-9', 1, '', '', 'odd:Mon:6-9:bangor'),
                                                                                                           ('bangor', 'Tue', 'odd', '6-9', 1, ',Natasha7034040029', '', 'odd:Tue:6-9:bangor'),
                                                                                                           ('bangor', 'Wed', 'odd', '6-9', 1, ',Natasha7034040029', '', 'odd:Wed:6-9:bangor'),
                                                                                                           ('bangor', 'Thu', 'odd', '6-9', 1, '', '', 'odd:Thu:6-9:bangor'),
                                                                                                           ('bangor', 'Mon', 'even', '12-3', 1, ',Barbara7033227096', '', 'even:Mon:12-3:bangor'),
                                                                                                           ('bangor', 'Tue', 'even', '12-3', 1, ',Kimberley9048746622', '', 'even:Tue:12-3:bangor'),
                                                                                                           ('bangor', 'Wed', 'even', '12-3', 1, ',Bonnie7039421321', '', 'even:Wed:12-3:bangor'),
                                                                                                           ('bangor', 'Thu', 'even', '12-3', 2, ',Shannon7039912298,Hannah7036109735', '', 'even:Thu:12-3:bangor'),
                                                                                                           ('bangor', 'Fri', 'even', '12-3', 1, ',Jane7038273452', '', 'even:Fri:12-3:bangor'),
                                                                                                           ('bangor', 'Mon', 'even', '3-6', 1, '', '', 'even:Mon:3-6:bangor'),
                                                                                                           ('bangor', 'Tue', 'even', '3-6', 1, ',Jennifer7038527724', '', 'even:Tue:3-6:bangor'),
                                                                                                           ('bangor', 'Wed', 'even', '3-6', 1, '', '', 'even:Wed:3-6:bangor'),
                                                                                                           ('bangor', 'Thu', 'even', '3-6', 2, ',Cassandra7039445038,Nicole9176052094', '', 'even:Thu:3-6:bangor'),
                                                                                                           ('bangor', 'Fri', 'even', '3-6', 1, ',Amanda7032051750', '', 'even:Fri:3-6:bangor'),
                                                                                                           ('bangor', 'Mon', 'even', '6-9', 1, '', '', 'even:Mon:6-9:bangor'),
                                                                                                           ('bangor', 'Tue', 'even', '6-9', 1, ',Natasha7034040029', '', 'even:Tue:6-9:bangor'),
                                                                                                           ('bangor', 'Wed', 'even', '6-9', 1, ',Natasha7034040029', '', 'even:Wed:6-9:bangor'),
                                                                                                           ('bangor', 'Thu', 'even', '6-9', 1, '', '', 'even:Thu:6-9:bangor'),
                                                                                                           ('bangor', 'Fri', 'odd', 'night', 0, '', '', 'odd:Fri:night:bangor'),
                                                                                                           ('bangor', 'Fri', 'even', 'night', 0, '', '', 'even:Fri:night:bangor'),
                                                                                                           ('bangor', 'Sun', '1st', '5-9', 0, '', '', '1st:Sun:5-9:bangor'),
                                                                                                           ('bangor', 'Sat', '4th', 'night', 0, '', '', '4th:Sat:night:bangor'),
                                                                                                           ('bangor', 'Sat', '1st', 'night', 0, '', '', '1st:Sat:night:bangor'),
                                                                                                           ('bangor', 'Sun', '1st', '9-5', 0, '', '', '1st:Sun:9-5:bangor'),
                                                                                                           ('bangor', 'Sat', '2nd', 'night', 0, '', '', '2nd:Sat:night:bangor'),
                                                                                                           ('bangor', 'Sun', '2nd', '9-5', 0, '', '', '2nd:Sun:9-5:bangor'),
                                                                                                           ('bangor', 'Sun', '2nd', '5-9', 0, '', '', '2nd:Sun:5-9:bangor'),
                                                                                                           ('bangor', 'Sun', '3rd', '9-5', 0, '', '', '3rd:Sun:9-5:bangor'),
                                                                                                           ('bangor', 'Sun', '4th', '9-5', 0, '', '', '4th:Sun:9-5:bangor'),
                                                                                                           ('bangor', 'Sun', '3rd', '5-9', 0, '', '', '3rd:Sun:5-9:bangor'),
                                                                                                           ('bangor', 'Sat', '3rd', 'night', 0, '', '', '3rd:Sat:night:bangor'),
                                                                                                           ('bangor', 'Sun', '4th', '5-9', 0, '', '', '4th:Sun:5-9:bangor'),
                                                                                                           ('bangor', 'Sun', '5th', '9-5', 0, '', '', '5th:Sun:9-5:bangor'),
                                                                                                           ('bangor', 'Sun', '5th', '5-9', 0, '', '', '5th:Sun:5-9:bangor'),
                                                                                                           ('bangor', 'Sat', '1st', '9-5', 0, '', '', '1st:Sat:9-5:bangor'),
                                                                                                           ('bangor', 'Sat', '2nd', '9-5', 0, '', '', '2nd:Sat:9-5:bangor'),
                                                                                                           ('bangor', 'Sat', '3rd', '9-5', 0, '', '', '3rd:Sat:9-5:bangor'),
                                                                                                           ('bangor', 'Sat', '4th', '9-5', 0, '', '', '4th:Sat:9-5:bangor'),
                                                                                                           ('bangor', 'Sat', '5th', '9-5', 0, '', '', '5th:Sat:9-5:bangor');

-- --------------------------------------------------------

--
-- Table structure for table `dbpersons`
--

CREATE TABLE `dbpersons` (
                             `username` text NOT NULL,
                             `firstName` text NOT NULL,
                             `lastName` text,
                             `phone` varchar(12) NOT NULL,
                             `email` text,
                             `userType` text,
                             `pass` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbpersons`
--

INSERT INTO `dbpersons` (`username`, `firstName`, `lastName`, `phone`, `email`, `userType`, `pass`) VALUES
                                                                                                        ('Micaela2083365478', 'Micaela', 'de Loyola-Carkin', '2083365478', '', 'manager', 'e21ff257d2f0854e57da564a4d561f61'),
                                                                                                        ('Allen1111111111', 'Allen', 'applicant', '1111111111', '', '', '25d2812e404188360fc6ff9d16788545'),
                                                                                                        ('admin', 'admin', 'admin', 'admin', 'admin', 'manager', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `dbscl`
--

CREATE TABLE `dbscl` (
                         `id` char(25) NOT NULL,
                         `persons` text,
                         `status` text,
                         `vacancies` text,
                         `time` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbshifts`
--

CREATE TABLE `dbshifts` (
                            `id` char(25) NOT NULL,
                            `start_time` int(11) DEFAULT NULL,
                            `end_time` int(11) DEFAULT NULL,
                            `venue` text,
                            `vacancies` int(11) DEFAULT NULL,
                            `persons` text,
                            `removed_persons` text,
                            `sub_call_list` text,
                            `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbshifts`
--

INSERT INTO `dbshifts` (`id`, `start_time`, `end_time`, `venue`, `vacancies`, `persons`, `removed_persons`, `sub_call_list`, `notes`) VALUES
                                                                                                                                          ('22-01-24:12-3:portland', 12, 15, 'portland', 1, 'Cheryl7038089589+Cheryl+Jones', '', '', ''),
                                                                                                                                          ('22-01-24:3-6:portland', 15, 18, 'portland', 0, 'Robin7037510984+Robin+Jones*Claire7033293465+Claire+Jones', '', '', ''),
                                                                                                                                          ('22-01-24:6-9:portland', 18, 21, 'portland', 1, 'Nonie7037812392+Nonie+Jones', '', '', ''),
                                                                                                                                          ('22-01-24:9-12:portland', 9, 12, 'portland', 0, 'Jane7038293469+Jane+Jones*Cathy7038295422+Cathy+Jones*Cheryl7032821358+Cheryl+Jones', '', '', ''),
                                                                                                                                          ('22-01-25:12-3:portland', 12, 15, 'portland', 1, 'Cindy7035631089+Cindy+Jones', '', '', ''),
                                                                                                                                          ('22-01-25:3-6:portland', 15, 18, 'portland', 0, 'Becky7037725009*Betsy7038464935+Betsy+Jones', '', '', ''),
                                                                                                                                          ('22-01-25:6-9:portland', 18, 21, 'portland', 0, 'Kara7035953232+Kara+Jones*Daniel7032330196+Daniel+Jones', '', '', ''),
                                                                                                                                          ('22-01-25:9-12:portland', 9, 12, 'portland', 0, 'Jane7038859127*Stacey7032333522+Stacey+Jones', '', '', ''),
                                                                                                                                          ('22-01-26:12-3:portland', 12, 15, 'portland', 1, 'John7032476256+John+Jones', '', '', ''),
                                                                                                                                          ('22-01-26:3-6:portland', 15, 18, 'portland', 0, 'Amy7037519944+Amy+Jones*Ann7038470375+Ann+Jones', '', '', ''),
                                                                                                                                          ('22-01-26:6-9:portland', 18, 21, 'portland', 0, 'Marilee7034159124+Marilee+Jones*Claudia7033181908+Claudia+Jones', '', '', ''),
                                                                                                                                          ('22-01-26:9-12:portland', 9, 12, 'portland', 0, 'Aynne7032328782+Aynne+Jones*Charlie7032728637+Charlie+Jones', '', '', ''),
                                                                                                                                          ('22-01-27:12-3:portland', 12, 15, 'portland', 1, 'Marjorie7032328434+Marjorie+Jones', '', '', ''),
                                                                                                                                          ('22-01-27:3-6:portland', 15, 18, 'portland', 0, 'Nancy7032210332+Nancy+Jones*Suzanne7037018778+Suzanne+Jones', '', '', ''),
                                                                                                                                          ('22-01-27:6-9:portland', 18, 21, 'portland', 0, 'Jody7033294089+Jody+Jones*Allyson7034410528+Allyson+Jones', '', '', ''),
                                                                                                                                          ('22-01-27:9-12:portland', 9, 12, 'portland', 0, 'Cathy7038784455+Cathy+Jones*Meg7039395058+Meg+Jones', '', '', ''),
                                                                                                                                          ('22-01-28:12-3:portland', 12, 15, 'portland', 1, 'Ellen7034432810+Ellen+Jones', '', '', ''),
                                                                                                                                          ('22-01-28:3-6:portland', 15, 18, 'portland', 1, 'Phyllis7032325963*Elaine7037672928+Elaine+Jones', '', '', ''),
                                                                                                                                          ('22-01-28:6-9:portland', 18, 21, 'portland', 0, '', '', '', ''),
                                                                                                                                          ('22-01-28:9-12:portland', 9, 12, 'portland', 0, 'Sally7037993827+Sally+Jones*Becky7038463827+Becky+Jones', '', '', ''),
                                                                                                                                          ('22-01-28:night:portland', 0, 1, 'portland', 1, '', '', '', ''),
                                                                                                                                          ('22-01-29:1-4:portland', 13, 16, 'portland', 1, '', '', '', ''),
                                                                                                                                          ('22-01-29:10-1:portland', 10, 13, 'portland', 1, '', '', '', ''),
                                                                                                                                          ('22-01-29:night:portland', 0, 1, 'portland', 1, '', '', '', ''),
                                                                                                                                          ('22-01-30:2-5:portland', 14, 17, 'portland', 1, '', '', '', ''),
                                                                                                                                          ('22-01-30:5-9:portland', 17, 21, 'portland', 0, 'Chris7038788512+Chris+Jones', '', '', ''),
                                                                                                                                          ('22-01-30:9-12:portland', 9, 12, 'portland', 1, '', '', '', ''),
                                                                                                                                          ('22-01-31:12-3:portland', 12, 15, 'portland', 0, 'Peter7037991786+Peter+Jones*Cheryl7038089589+Cheryl+Jones', '', '', ''),
                                                                                                                                          ('22-01-31:3-6:portland', 15, 18, 'portland', 0, 'Maureen7032100761+Maureen+Jones*Claire7033293465+Claire+Jones', '', '', ''),
                                                                                                                                          ('22-01-31:6-9:portland', 18, 21, 'portland', 0, 'Vickie7033180302+Vickie+Jones*Estelle7037720647+Estelle+Jones', '', '', ''),
                                                                                                                                          ('22-01-31:9-12:portland', 9, 12, 'portland', 0, 'Jane7038293469+Jane+Jones*Cathy7038295422+Cathy+Jones*Cheryl7032821358+Cheryl+Jones', '', '', ''),
                                                                                                                                          ('22-02-01:12-3:portland', 12, 15, 'portland', 0, 'Mary Ann7038833212+Mary Ann+Jones*Gibbs7037474590+Gibbs+Jones', '', '', ''),
                                                                                                                                          ('22-02-01:3-6:portland', 15, 18, 'portland', 0, 'Becky7037725009*Betsy7038464935+Betsy+Jones', '', '', ''),
                                                                                                                                          ('22-02-01:6-9:portland', 18, 21, 'portland', 0, 'Josh7037124705+Josh+Jones*April7038075431+April+Jones', '', '', ''),
                                                                                                                                          ('22-02-01:9-12:portland', 9, 12, 'portland', 0, 'Jane7038859127*Stacey7032333522+Stacey+Jones', '', '', ''),
                                                                                                                                          ('22-02-02:12-3:portland', 12, 15, 'portland', 1, 'Ellen7037994830+Ellen+Jones', '', '', ''),
                                                                                                                                          ('22-02-02:3-6:portland', 15, 18, 'portland', 1, 'Nancy7034158150+Nancy+Jones', '', '', ''),
                                                                                                                                          ('22-02-02:6-9:portland', 18, 21, 'portland', 0, 'Jody7033294089+Jody+Jones*Lilly2158349209', '', '', ''),
                                                                                                                                          ('22-02-02:9-12:portland', 9, 12, 'portland', 0, 'Jeannie7037970345+Jeannie+Jones*Kym7037970345+Kym+Jones', '', '', ''),
                                                                                                                                          ('22-02-03:12-3:portland', 12, 15, 'portland', 0, 'Thorne7034439654+Thorne+Jones*Meg7037298111+Meg+Jones', '', '', ''),
                                                                                                                                          ('22-02-03:3-6:portland', 15, 18, 'portland', 0, 'Linda7037568845+Linda+Jones*Sue7033171877+Sue+Jones', '', '', ''),
                                                                                                                                          ('22-02-03:6-9:portland', 18, 21, 'portland', 0, 'Shay6175012425*Rebecca5185881836', '', '', ''),
                                                                                                                                          ('22-02-03:9-12:portland', 9, 12, 'portland', 2, '', '', '', ''),
                                                                                                                                          ('22-02-04:12-3:portland', 12, 15, 'portland', 1, 'Suzanne7037018778+Suzanne+Jones', '', '', ''),
                                                                                                                                          ('22-02-04:3-6:portland', 15, 18, 'portland', 1, 'Phyllis7032325963*Margi7034152255+Margi+Jones', '', '', ''),
                                                                                                                                          ('22-02-04:6-9:portland', 18, 21, 'portland', 0, '', '', '', ''),
                                                                                                                                          ('22-02-04:9-12:portland', 9, 12, 'portland', 1, 'Bobbi7033447417+Bobbi+Jones*Meg7039395058+Meg+Jones', '', '', ''),
                                                                                                                                          ('22-02-04:night:portland', 0, 1, 'portland', 1, '', '', '', ''),
                                                                                                                                          ('22-02-05:1-4:portland', 13, 16, 'portland', 0, 'Beverly7038542682+Beverly+Jones', '', '', ''),
                                                                                                                                          ('22-02-05:10-1:portland', 10, 13, 'portland', 0, 'Nancy7036769033+Nancy+Jones*Beth7033399448+Beth+Jones*Rita7037998431+Rita+Jones', '', '', ''),
                                                                                                                                          ('22-02-05:night:portland', 0, 1, 'portland', 1, '', '', '', ''),
                                                                                                                                          ('22-02-06:2-5:portland', 14, 17, 'portland', 0, 'Mary7038293321+Mary+Jones', '', '', ''),
                                                                                                                                          ('22-02-06:5-9:portland', 17, 21, 'portland', 0, 'Paul7032323414+Paul+Jones', '', '', ''),
                                                                                                                                          ('22-02-06:9-12:portland', 9, 12, 'portland', 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `dbweeks`
--

CREATE TABLE `dbweeks` (
                           `id` char(20) NOT NULL,
                           `dates` text,
                           `venue` text,
                           `status` text,
                           `name` text,
                           `end` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbweeks`
--

INSERT INTO `dbweeks` (`id`, `dates`, `venue`, `status`, `name`, `end`) VALUES
                                                                            ('22-01-24:portland', '22-01-24:portland*22-01-25:portland*22-01-26:portland*22-01-27:portland*22-01-28:portland*22-01-29:portland*22-01-30:portland', 'portland', 'archived', 'January 24, 2022 to January 30, 2022', 1643587199),
                                                                            ('22-01-31:portland', '22-01-31:portland*22-02-01:portland*22-02-02:portland*22-02-03:portland*22-02-04:portland*22-02-05:portland*22-02-06:portland', 'portland', 'unpublished', 'January 31, 2022 to February 6, 2022', 1644191999);

-- --------------------------------------------------------

--
-- Table structure for table `dietaryrestrictionsdb`
--

CREATE TABLE `dietaryrestrictionsdb` (
                                         `horseName` varchar(50) NOT NULL,
                                         `restriction` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dietaryrestrictionsdb`
--

INSERT INTO `dietaryrestrictionsdb` (`horseName`, `restriction`) VALUES
                                                                     ('horse', 'no carrots'),
                                                                     ('Test', 'this horse only eats apples');

-- --------------------------------------------------------

--
-- Table structure for table `horsedb`
--

CREATE TABLE `horsedb` (
                           `horseName` varchar(50) NOT NULL,
                           `color` text,
                           `breed` text,
                           `pastureNum` int(11) DEFAULT NULL,
                           `colorRank` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `horsedb`
--

INSERT INTO `horsedb` (`horseName`, `color`, `breed`, `pastureNum`, `colorRank`) VALUES
                                                                                     ('blue', 'blue', 'blue', 1, 'yellow'),
                                                                                     ('DP', 'Brown', 'Enter Breed', 2, 'green'),
                                                                                     ('horse', 'Grey', 'Stallion', 2, 'Red'),
                                                                                     ('Horse2', 'Green', 'Horse 2', 9, 'Green'),
                                                                                     ('red', 'red', 'red', 2, 'red'),
                                                                                     ('Test', 'Brown', 'Breed', 1, 'red');

-- --------------------------------------------------------

--
-- Table structure for table `horsetobehaviordb`
--

CREATE TABLE `horsetobehaviordb` (
                                     `horseName` varchar(50) NOT NULL,
                                     `behaviorTitle` varchar(50) NOT NULL,
                                     `startDate` date DEFAULT NULL,
                                     `endDate` date DEFAULT NULL,
                                     `completed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `horsetobehaviordb`
--

INSERT INTO `horsetobehaviordb` (`horseName`, `behaviorTitle`, `startDate`, `endDate`, `completed`) VALUES
                                                                                                        ('blue', 'Back up', '2023-04-14', '2023-04-17', 1),
                                                                                                        ('blue', 'Blanket', '2023-04-17', '2023-04-17', 1),
                                                                                                        ('blue', 'Comfortable with grooming', '2023-04-14', '2023-04-17', 1),
                                                                                                        ('blue', 'Fly mask', '2023-04-13', NULL, NULL),
                                                                                                        ('blue', 'Fly spray', '2023-04-14', NULL, NULL),
                                                                                                        ('blue', 'Stand', '2023-04-14', '2023-04-17', 1),
                                                                                                        ('blue', 'Stand tied', '2023-04-14', '2023-04-17', 1),
                                                                                                        ('blue', 'Whoa', '2023-04-14', '2023-04-17', 1),
                                                                                                        ('DP', 'Blanket', '2023-04-24', NULL, 0),
                                                                                                        ('horse', 'Fly', '2023-04-24', '2023-04-24', 1),
                                                                                                        ('Test', 'Blanket', '2023-04-24', '2023-04-24', 1),
                                                                                                        ('Test', 'Can be caught and haltered in the field', '2023-04-24', NULL, NULL),
                                                                                                        ('Test', 'Clean all 4 feet', '2023-04-24', NULL, NULL),
                                                                                                        ('Test', 'Comfortable with grooming', '2023-04-24', NULL, NULL),
                                                                                                        ('Test', 'Fly', '2023-04-24', NULL, NULL),
                                                                                                        ('Test', 'Fly mask', '2023-04-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notesdb`
--

CREATE TABLE `notesdb` (
                           `horseName` varchar(50) NOT NULL,
                           `noteDate` date NOT NULL,
                           `noteTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                           `note` text,
                           `trainerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notesdb`
--

INSERT INTO `notesdb` (`horseName`, `noteDate`, `noteTimestamp`, `note`, `trainerId`) VALUES
                                                                                          ('blue', '2023-04-05', '2023-04-05 19:48:51', 'horse is horsing horsily', 6),
                                                                                          ('blue', '2023-04-10', '2023-04-10 13:03:59', 'Test test', 6),
                                                                                          ('blue', '2023-04-17', '2023-04-17 13:25:34', 'note note note', 1),
                                                                                          ('blue', '2023-04-24', '2023-04-24 00:00:47', 'The horse is horsing very well today. We horsed very horsily until the horse correctly learned how to horse.', 1),
                                                                                          ('Horse', '2023-04-24', '2023-04-24 14:51:10', 'The horse is horsing very well today. We horsed very horsily until the horse correctly learned how to horse.', 1),
                                                                                          ('Horse2', '2023-04-24', '2023-04-24 19:46:29', 'testing testing testing', 1),
                                                                                          ('Test', '2023-04-24', '2023-04-24 21:03:25', 'here is a note', 1),
                                                                                          ('Test', '2023-04-24', '2023-04-24 21:11:09', 'test note', 1),
                                                                                          ('Test', '2023-04-24', '2023-04-24 23:35:42', 'Hello', 1);

-- --------------------------------------------------------

--
-- Table structure for table `persondb`
--

CREATE TABLE `persondb` (
                            `firstName` text,
                            `lastName` text,
                            `fullName` varchar(50) NOT NULL,
                            `phone` text,
                            `email` text,
                            `username` text,
                            `pass` text,
                            `userType` text NOT NULL,
                            `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persondb`
--

INSERT INTO `persondb` (`firstName`, `lastName`, `fullName`, `phone`, `email`, `username`, `pass`, `userType`, `id`) VALUES
                                                                                                                         ('admin', 'admin', 'admin admin', '123-456-7890', 'adminnn@gmail.com', 'admin', '$2y$10$emj07XFcemvG0a9.LEV9Ou3jGn6etKICRy/59QjKvWa7rZm8VqBmC', 'manager', 1),
                                                                                                                         ('Stephen', 'McCarthy', 'Stephen McCarthy', '123-456-7890', 'test@gmail.com', 'stephen', '$2y$10$i2qtEyiN/fP1WyvI1bAhxeoGh.3IxZTnDAkTvOInDkrLLS5bzwfku', 'manager', 6),
                                                                                                                         ('testing', 'testing', 'testing testing', '123-456-7890', 'mail@mail.com', 'testing', '$2y$10$8A.UMIFiYLActQ2D.xXeu.ZxVThYhg4mngvtEMCyj29ChNOEBjxb6', 'Administrator', 9),
                                                                                                                         ('aa', 'aa', 'aa aa', '123-436-7890', 'mail@mail.com', 'aa', '$2y$10$.gmXaiDNHB/Wy6IRNdMnj..QKTkrSER9PCyW1wIy33XyGovmsoDum', 'Volunteer', 10);

-- --------------------------------------------------------

--
-- Table structure for table `trainertohorsedb`
--

CREATE TABLE `trainertohorsedb` (
                                    `trainerId` int(50) NOT NULL,
                                    `horseName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trainertohorsedb`
--

INSERT INTO `trainertohorsedb` (`trainerId`, `horseName`) VALUES
                                                              (1, 'Test'),
                                                              (6, 'blue'),
                                                              (6, 'horse'),
                                                              (6, 'Horse2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `behaviordb`
--
ALTER TABLE `behaviordb`
    ADD PRIMARY KEY (`title`);

--
-- Indexes for table `dbdates`
--
ALTER TABLE `dbdates`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dblog`
--
ALTER TABLE `dblog`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbscl`
--
ALTER TABLE `dbscl`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbshifts`
--
ALTER TABLE `dbshifts`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbweeks`
--
ALTER TABLE `dbweeks`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dietaryrestrictionsdb`
--
ALTER TABLE `dietaryrestrictionsdb`
    ADD PRIMARY KEY (`horseName`,`restriction`);

--
-- Indexes for table `horsedb`
--
ALTER TABLE `horsedb`
    ADD PRIMARY KEY (`horseName`);

--
-- Indexes for table `horsetobehaviordb`
--
ALTER TABLE `horsetobehaviordb`
    ADD PRIMARY KEY (`horseName`,`behaviorTitle`);

--
-- Indexes for table `notesdb`
--
ALTER TABLE `notesdb`
    ADD PRIMARY KEY (`horseName`,`noteDate`,`noteTimestamp`),
  ADD KEY `trainerId` (`trainerId`);

--
-- Indexes for table `persondb`
--
ALTER TABLE `persondb`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainertohorsedb`
--
ALTER TABLE `trainertohorsedb`
    ADD PRIMARY KEY (`trainerId`,`horseName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dblog`
--
ALTER TABLE `dblog`
    MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `persondb`
--
ALTER TABLE `persondb`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dietaryrestrictionsdb`
--
ALTER TABLE `dietaryrestrictionsdb`
    ADD CONSTRAINT `dietaryrestrictionsdb_ibfk_1` FOREIGN KEY (`horseName`) REFERENCES `horsedb` (`horseName`);

--
-- Constraints for table `notesdb`
--
ALTER TABLE `notesdb`
    ADD CONSTRAINT `horseName` FOREIGN KEY (`horseName`) REFERENCES `horsedb` (`horseName`),
  ADD CONSTRAINT `trainerId` FOREIGN KEY (`trainerId`) REFERENCES `persondb` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;