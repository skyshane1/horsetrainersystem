-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 31, 2022 at 08:37 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

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


/*homebasedb.sql: SQL file for importing into phpMyAdmin.*/
/*Contains all of the tables and foreign key restraints necessary for CVHR training.*/
/*Name can be changed once website is fully functional.*/

/*Drop existing Homebase tables*/
DROP TABLE IF EXISTS dbapplicantscreenings;
DROP TABLE IF EXISTS dbbehavior;
DROP TABLE IF EXISTS dbdates;
DROP TABLE IF EXISTS dblog;
DROP TABLE IF EXISTS dbmasterschedule;
DROP TABLE IF EXISTS dbpersons;
DROP TABLE IF EXISTS dbscl;
DROP TABLE IF EXISTS dbshifts;
DROP TABLE IF EXISTS dbweeks;

/*Drop CVHR tables*/
DROP TABLE IF EXISTS notesDB;
DROP TABLE IF EXISTS trainerToHorseDB;
DROP TABLE IF EXISTS horseToBehaviorDB;
DROP TABLE IF EXISTS horseDB;
DROP TABLE IF EXISTS personDB;
DROP TABLE IF EXISTS trainerDB;
DROP TABLE IF EXISTS behaviorDB;
DROP TABLE IF EXISTS dietaryRestrictionsDB;


SET foreign_key_checks = 0;

/*Create CVHR tables*/

SET foreign_key_checks = 1;

CREATE TABLE horseDB (
  horseName varchar(50) primary key NOT NULL,
  color text,
  breed text,
  pastureNum int,
  colorRank text
);

CREATE TABLE behaviorDB (
  title varchar(100) primary key NOT NULL,
  behaviorLevel text
);

CREATE TABLE personDB (
  firstName text,
  lastName text, 
  fullName varchar(50) primary key NOT NULL,
  phone text,
  email text,
  username text,
  pass text,
  userType text NOT NULL
);

CREATE TABLE trainerToHorseDB (
  trainerName varchar(50) NOT NULL,
  horseName varchar(100) NOT NULL,
  primary key (trainerName, horseName)/*,
  FOREIGN KEY (horseName) REFERENCES horseDB(horseName)
  FOREIGN KEY (behaviorTitle) REFERENCES behaviorDB(title) */
);

CREATE TABLE horseToBehaviorDB (
  horseName varchar(50) NOT NULL,
  behaviorTitle varchar(50) NOT NULL,
  primary key (horseName, behaviorTitle)/*,
  FOREIGN KEY (trainerName) REFERENCES personDB(personName)
  FOREIGN KEY (horseName) REFERENCES horseDB(horseName) */
);

CREATE TABLE notesDB (
  horseName varchar(50) NOT NULL,
  noteDate date,
  noteTimestamp timestamp,
  note text,
  trainerName varchar(50),
  primary key (horseName, noteDate, noteTimestamp),
  FOREIGN KEY (horseName) REFERENCES horseDB(horseName),
  FOREIGN KEY (trainerName) REFERENCES personDB(fullName)
); 

CREATE TABLE dietaryRestrictionsDB (
  horseName varchar(50) NOT NULL,
  restriction varchar(500),
  primary key (horseName, restriction),
  FOREIGN KEY (horseName) REFERENCES horseDB(horseName)
);



/*THIS IS NO LONGER NEEDED, BUT HERE JUST BECAUSE WE DON'T REALLY NEED TO DELETE IT AT THE MOMENT!!*/






--
-- Table structure for table `dbApplicantScreenings`
--

CREATE TABLE `dbApplicantScreenings` (
  `type` text NOT NULL,
  `creator` text,
  `steps` text,
  `status` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbDates`
--

CREATE TABLE `dbDates` (
  `id` char(20) NOT NULL,
  `shifts` text,
  `mgr_notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbDates`
--

INSERT INTO `dbDates` (`id`, `shifts`, `mgr_notes`) VALUES
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
-- Table structure for table `dbLog`
--

CREATE TABLE `dbLog` (
  `id` int(3) NOT NULL,
  `time` text,
  `message` text,
  `venue` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbMasterSchedule`
--

CREATE TABLE `dbMasterSchedule` (
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
-- Dumping data for table `dbMasterSchedule`
--

INSERT INTO `dbMasterSchedule` (`venue`, `day`, `week_no`, `hours`, `slots`, `persons`, `notes`, `id`) VALUES
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
-- Table structure for table `dbPersons`
--

CREATE TABLE `dbPersons` (
  `id` text NOT NULL,
  `start_date` text,
  `venue` text,
  `first_name` text NOT NULL,
  `last_name` text,
  `address` text,
  `city` text,
  `state` varchar(2) DEFAULT NULL,
  `zip` text,
  `phone1` varchar(12) NOT NULL,
  `phone1type` text,
  `phone2` varchar(12) DEFAULT NULL,
  `phone2type` text,
  `birthday` text,
  `email` text,
  `employer` text,
  `position` text,
  `credithours` text,
  `howdidyouhear` text,
  `commitment` text,
  `motivation` text,
  `specialties` text,
  `convictions` text,
  `type` text,
  `screening_type` text,
  `screening_status` text,
  `status` text,
  `availability` text,
  `schedule` text,
  `hours` text,
  `notes` text,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbPersons`
--

INSERT INTO `dbPersons` (`id`, `start_date`, `venue`, `first_name`, `last_name`, `address`, `city`, `state`, `zip`, `phone1`, `phone1type`, `phone2`, `phone2type`, `birthday`, `email`, `employer`, `position`, `credithours`, `howdidyouhear`, `commitment`, `motivation`, `specialties`, `convictions`, `type`, `screening_type`, `screening_status`, `status`, `availability`, `schedule`, `hours`, `notes`, `password`) VALUES
('Sally7037993827', '', 'portland', 'Sally', 'Jones', '64 even: Lights Rd', 'Ashburn', 'VA', '20147', '7037993827', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Fri:9-12:portland', 'odd:Fri:9-12:portland', NULL, '', 'a02b5869d34e15fea2c851a3b3bbe7c7'),
('Evelyn7036505443', '', 'portland', 'Evelyn', 'Jones', '9 Oceanwood Drive', 'Ashburn', 'VA', '20147', '7036505443', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub', '', '', 'active', 'Fri:12-3:portland', '', NULL, '', 'd7a884b770b099880896e87dbfc1ae66'),
('Cathy7038295422', '', 'portland', 'Cathy', 'Jones', '8 Crystal Lane', 'Ashburn', 'VA', '20147', '7038295422', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:9-12:portland', 'odd:Mon:9-12:portland,even:Mon:9-12:portland', NULL, '', '0cf68a6d8f827aec554538a730ed6f1a'),
('Kym7037970345', '', 'portland', 'Kym', 'Jones', '120 E. Cummonwealth Dr.', 'Ashburn', 'VA', '20147', '7037970345', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Wed:9-12:portland', 'even:Wed:9-12:portland', NULL, '', 'b7b0487b2fb10103fbf40f17881f678b'),
('Pat7037275523', '', 'portland', 'Pat', 'Jones', '218 Saco Rd.', 'Ashburn', 'VA', '20147', '7037275523', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Thu:6-9:portland', 'even:Thu:6-9:portland', NULL, '', 'e58435622d1ad41bf6be7871520d1f5d'),
('Nancy7036769033', '', 'portland', 'Nancy', 'Jones', '21 Hidden Acres', 'Ashburn', 'VA', '20147', '7036769033', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland', '1st:Sat:10-1:portland', NULL, '', '24458704318e1c717f84e8a18cdde420'),
('Beth7033399448', '', 'portland', 'Beth', 'Jones', '163 Lower Barley St.', 'Ashburn', 'VA', '20147', '7033399448', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland', '1st:Sat:10-1:portland', NULL, '', '570916379c5d5c1268d3ca4f61af1d6b'),
('Amy7038394383', '09-01-01', 'portland', 'Amy', 'Jones', '13 Veranda Drive', 'Ashburn', 'VA', '20147', '7038394383', NULL, '', '', '67-08-04', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,volunteer,guestchef', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'b19beb7cdc9571b108774ffa50c4f2cc'),
('Christine and Duane7038977040', '', 'portland', 'Christine and Duane', 'Jones', '455 East Jay Road', 'Ashburn', 'VA', '20147', '7038977040', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'a75a8b8a490a0a9fd29193a86dac3e50'),
('Carolyn7037812771', '', 'portland', 'Carolyn', 'Jones', '34 Foreside Road', 'Ashburn', 'VA', '20147', '7037812771', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '75b33763ce2dc6b9b7c912a6071f9f4f'),
('Susan and Dennis7039391240', '', 'portland', 'Susan and Dennis', 'Jones', '19 Lynwood Road', 'Ashburn', 'VA', '20147', '7039391240', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '4093f31bfe2f8c605d1f644aff341008'),
('Ben7038392795', '', 'portland', 'Ben', 'Jones', '17 William Henry Drive', 'Ashburn', 'VA', '20147', '7038392795', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:6-9:portland', '', NULL, '', '4f4ff415b2e7b738a31ba4d2f78dc517'),
('Daniel7036668904', '', 'portland', 'Daniel', 'Jones', '17 Lucas Lane', 'Ashburn', 'VA', '20147', '7036668904', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '05eebe847bebf4054a6901a5b1539d4b'),
('Kirsten7036668904', '', 'portland', 'Kirsten', 'Jones', '17 Lucas Lane', 'Ashburn', 'VA', '20147', '7036668904', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '97d18645c5ce918dd7fd4ccfa46626dd'),
('Peter and Suzanne7038999578', '08-02-25', 'portland', 'Peter and Suzanne', 'Jones', '6 Oakmont Dr', 'Ashburn', 'VA', '20147', '7038999578', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '2d7ed6d482d65b282b967889659ea3be'),
('Frank and Bette7037436859', '', 'portland', 'Frank and Bette', 'Jones', '170 Alpine Street', 'Ashburn', 'VA', '20147', '7037436859', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'e6da0469db502752af581303cc83bc62'),
('Nancy7038392795', '', 'portland', 'Nancy', 'Jones', '17 William Henry Dr', 'Ashburn', 'VA', '20147', '7038392795', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:6-9:portland', 'even:Mon:6-9:portland', NULL, '', 'c6340acbf9292aa2bda8f3d4e3859005'),
('Steve7039293544', '', 'portland', 'Steve', 'Jones', 'PO Box 249', 'Ashburn', 'VA', '20147', '7039293544', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'f12755f900b004f0751910b7a49a997d'),
('Suzanne7038999578', '', 'portland', 'Suzanne', 'Jones', '6 Oakmont Drive', 'Ashburn', 'VA', '20147', '7038999578', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'd0dc3d243e28a3b9d50f6b99b3387a8d'),
('Peter7038999578', '', 'portland', 'Peter', 'Jones', '6 Oakmont Drive', 'Ashburn', 'VA', '20147', '7038999578', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'a82895cb526e436611b3dfa5c0b03e48'),
('Kara7035953232', '', 'portland', 'Kara', 'Jones', '305 Brook Street', 'Ashburn', 'VA', '20147', '7035953232', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland,Sun:5-9:portland', 'odd:Tue:6-9:portland', NULL, '', '247184f5fcf8c0afea1291676dc6df8f'),
('Jana7037817472', '', 'portland', 'Jana', 'Jones', '110 Woodlands Avenue', 'Ashburn', 'VA', '20147', '7037817472', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '2081d74ddbd60b5230398210ec00c70c'),
('Amber7037737446', '', 'portland', 'Amber', 'Jones', '37 Carroll  St', 'Ashburn', 'VA', '20147', '7037737446', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,cleaning', '', '', 'active', 'Fri:9-12:portland', '', NULL, '', '35e4b7f4d5751372e07235a7cd7fe8e2'),
('Jane7038293469', '', 'portland', 'Jane', 'Jones', '19 County Creek', 'Ashburn', 'VA', '20147', '7038293469', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:9-12:portland', 'odd:Mon:9-12:portland,even:Mon:9-12:portland', NULL, '', 'e0a70e585f657b7997d77deabc7e3567'),
('Becky7038463827', '', 'portland', 'Becky', 'Jones', '55 Shoreview Rd', 'Ashburn', 'VA', '20147', '7038463827', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Fri:9-12:portland', 'odd:Fri:9-12:portland', NULL, '', 'b81d3cd08f1b69a206b1b09b3e8ea822'),
('Betty Jane and Carl7037815270', '', 'portland', 'Betty Jane and Carl', 'Jones', '10 Pine Ridge Road', 'Ashburn', 'VA', '20147', '7037815270', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'f35ca516bf94e6f1774318adca54af6a'),
('Russ and Ann7038317519', '', 'portland', 'Russ and Ann', 'Jones', '421 Jacob Ave', 'Ashburn', 'VA', '20147', '7038317519', NULL, '', '', '', 'jonesey@yahoo.com', 'phone', '', '', '', '', '', '', '', 'sub', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:12-3:portland,Sun:2-5:portland', '', NULL, '', '8305532282e0b53a5abddaefb64db16b'),
('Craig7033633667', '', 'portland', 'Craig', 'Jones', '91 Fall Mill Rd', 'Ashburn', 'VA', '20147', '7033633667', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'ac0109b44e832af7a17dc6598f1b9466'),
('Glenn and Deborah7036362555', '', 'portland', 'Glenn and Deborah', 'Jones', '384 Emery Mills Road', 'Ashburn', 'VA', '20147', '7036362555', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'a3e8e32ec7c2ca41c19a7ec2822d4ede'),
('Aynne7032328782', '', 'portland', 'Aynne', 'Jones', '118 Eastern Prom', 'Ashburn', 'VA', '20147', '7032328782', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Wed:9-12:portland', 'odd:Wed:9-12:portland', NULL, '', '46cc320652a2ad45c9e15678f683af24'),
('Barbara7038318187', '', 'portland', 'Barbara', 'Jones', '214 Forest Street', 'Ashburn', 'VA', '20147', '7038318187', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Wed:3-6:portland', 'even:Wed:3-6:portland', NULL, '', '96f40b19102ef16096d7128648a8e284'),
('Rita7037998431', '', 'portland', 'Rita', 'Jones', '48 Bowers St.', 'Ashburn', 'VA', '20147', '7037998431', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland', '1st:Sat:10-1:portland,1st:Sat:10-1:portland', NULL, '', '3545109eb72b648be6a22cce463ffb9f'),
('LeeAnn7038922717', '', 'portland', 'LeeAnn', 'Jones', '7 Watson Farm Rd', 'Ashburn', 'VA', '20147', '7038922717', NULL, '', '', 'XX-12-20', 'jonesey@yahoo.com', 'email', 'Bank Manager', '7038926089', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sun:2-5:portland,Sun:5-9:portland', '4th:Sun:5-9:portland,4th:Sun:5-9:portland,4th:Sun:5-9:portland', NULL, '', '75d44a5874b59487fd2404aee7b96a16'),
('Gaye7032476985', '', 'portland', 'Gaye', 'Jones', '52 McLucas Rd', 'Ashburn', 'VA', '20147', '7032476985', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:12-3:portland,Sun:2-5:portland', '4th:Sun:9-12:portland', NULL, '', '8b5e028fafc27c5fe16650cc4f030e97'),
('Cindy7037813251', '', 'portland', 'Cindy', 'Jones', '128 Woodlands Drive', 'Ashburn', 'VA', '20147', '7037813251', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Tue:9-12:portland', 'odd:Tue:9-12:portland', NULL, '', 'ae33059c0047ac2ddf2a8beb748e3ef6'),
('Rachel7038997981', '', 'portland', 'Rachel', 'Jones', '1176 Sawyer Road', 'Ashburn', 'VA', '20147', '7038997981', NULL, '', '', '', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Fri:12-3:portland', '', NULL, '', '4bc0467e2e77f35493a1259b8696a4c3'),
('Pat7038296568', '', 'portland', 'Pat', 'Jones', '17 Smithwood Drive', 'Ashburn', 'VA', '20147', '7038296568', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'guestchef', '', '', 'active', '', '', NULL, '', '90cfb7f1097a2038c861e9e597d74a61'),
('Aaron7037670380', '', 'portland', 'Aaron', 'Jones', '259 High St.', 'Ashburn', 'VA', '20147', '7037670380', NULL, '', '', '', 'jonesey@yahoo.com', 'email', 'US Coast Guard', '', '', '', 'We have a wide variety of specialties and abilities.', '', '', 'guestchef', 'Guest Chef', '01-15-13,--,--,--,--', 'LOA', '', '', NULL, '', '4cab60ca4d6729eeaf0d3364e8b86cd4'),
('Lauren7038389165', '', 'portland', 'Lauren', 'Jones', '213 South Richland Street', 'Ashburn', 'VA', '20147', '7038389165', NULL, '', '', '82-05-09', 'jonesey@yahoo.com', 'email', 'Teacher', '', '', '', 'Being a teacher, it is important for me to help others. My godson is preparing to make his communion and confirmation and is looking to do a service project. The Ronald McDonald House and the cookie crew seems like the perfect opportunity for us to help others. We will be volunteering on Saturday March 2 and hope to work out our schedules to try and volunteer more often.', '', '', 'other', 'Cookie Crew', '03-01-13,--,--,03-02-13', 'active', '', '', NULL, '', 'e0aab43d687793f94978b412b2681397'),
('Mary7038469107', '', 'portland', 'Mary', 'Jones', '53 Whites Cove Rd', 'Ashburn', 'VA', '20147', '7038469107', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Fri:12-3:portland', 'odd:Fri:12-3:portland', NULL, '', 'be96a737af476b899a209bf0cc397218'),
('Allyson7034410528', '', 'portland', 'Allyson', 'Jones', '43 Berwick St.', 'Ashburn', 'VA', '20147', '7034410528', NULL, '', '', '89-05-28', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Thu:6-9:portland', 'odd:Thu:6-9:portland', NULL, '', '872da72eb59c06d84dd327900098f18f'),
('Leslie and Craig7033633667', '', 'portland', 'Leslie and Craig', 'Jones', '91 Fall Mill Road', 'Ashburn', 'VA', '20147', '7033633667', NULL, '', '', '', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', '', 'volunteer,sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'a2502fb23295e97b442ba852fa9b8124'),
('Nicole7033572928', '', 'portland', 'Nicole', 'Jones', '294 Andover Road', 'Ashburn', 'VA', '20147', '7033572928', NULL, '', '', '90-04-30', 'jonesey@yahoo.com', 'email', 'Athletic Intern ', '7033577465', '', '', 'Making candy bouquets for the kitchen 2 times a month.', '', '', 'other', 'Guest Chef', '03-11-13,--,03-21-13,03-26-13,--', 'active', '', '', NULL, 'will drop off paperwork 3/25/13', '8438a1da6a53037e94bb26314736f656'),
('Avanel7034420555', '', 'portland', 'Avanel', 'Jones', '995 Washington St', 'Ashburn', 'VA', '20147', '7034420555', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sun:9-12:portland', '', NULL, '', 'efdd36ef4a3f94254ced418bd91f2540'),
('Becky7038850804', '', 'portland', 'Becky', 'Jones', '4 Tall Pines Road', 'Ashburn', 'VA', '20147', '7038850804', NULL, '', '', 'XX-05-05', 'jonesey@yahoo.com', 'phone', '', '7033298203', '', '', '', '', '', 'guestchef', 'Guest Chef', '04-29-13,--,05-03-13,05-07-13,05-18-13', 'active', 'Sat:3-6:portland', '', NULL, 'wants to guest chef with her daughter Lilly; tentative date - May 18', '3eb8c0e11c149de37c993e5ec6fc04c3'),
('Kimberly7032050257', '', 'portland', 'Kimberly', 'Jones', '792 Limerick Road', 'Ashburn', 'VA', '20147', '7032050257', NULL, '', '', '91-05-22', 'jonesey@yahoo.com', '', 'Nanny ', '', '', '', '', '', '', 'parking', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Mon:12-3:portland,Sat:1-4:portland,Sun:12-3:portland,Mon:3-6:portland,Tue:3-6:portland', '', NULL, '', '3aded8f75f6ad29d576735ae0a499a9e'),
('Stephanie7034504530', '', 'portland', 'Stephanie', 'Jones', '785 Congress St Apt 1', 'Ashburn', 'VA', '20147', '7034504530', NULL, '', '', '85-11-03', 'jonesey@yahoo.com', '', '', '7038381427', '', '', 'Looking to volunteer more in the community and have not done anything with the RMH since I was kid.', '', '', 'parking', 'Cleaning/Other', '06-10-13,--,--,--,--,--', 'active', 'Sun:12-3:portland,Sun:2-5:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland,Sun:5-9:portland', '', NULL, '', 'fa37990787ee5c9c6e9dbfdb590d5433'),
('ASG7037752332', '', 'portland', 'ASG', 'Jones', '2 Monument Square Suite 520', 'Ashburn', 'VA', '20147', '7037752332', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '7032322686', '', '', 'ASG Risk Management would like to become active in its community as a company.', '', '', 'parking', '', '', 'active', '', '', NULL, 'Business volunteering\r\nContact persons are: April St. Cyr (703-807-5431) and Peter Parent (703-232-2686)\r\nWe are interested in the parking work for the Sea Dogs, guest chef and cookie club.  We would also be willing to offer employees time during the day to help with special projects as they come up.', 'fd735b685bd3fa8edeee7da2e89be993'),
('Gayla7033185530', '', 'portland', 'Gayla', 'Jones', '17 Arbor View Lane', 'Ashburn', 'VA', '20147', '7033185530', NULL, '', '', '62-01-27', 'jonesey@yahoo.com', 'email', 'Insurance', '7035230837', '', '', 'cooking, baking.', '', '', 'guestchef', 'Guest Chef', '06-11-13,06-21-13,06-21-13,--,--', 'active', 'Sat:1-4:portland,Sun:12-3:portland,Sat:3-6:portland,Sun:2-5:portland,Sat:6-9:portland,Sun:5-9:portland', '', NULL, 'Hello, \r\nMy family and I would like to volunteer our cooking services at the house....do you need a separate application for each of us or will this one suffice? It would be me, my husband, our son Joshua (15), and daughter Karah (22). My husband is a great cook and Karah and I like to bake. We could put on a top your own pizza party or a pasta night etc... we work weekday so 6-9:portland or weekends....I didn\'t check off weekdays but this could be arranged with advnace notice too...', '25f81228224ab3502e3df03c94558dc9'),
('Joanie7039293544', '', 'portland', 'Joanie', 'Jones', 'PO Box 249', 'Ashburn', 'VA', '20147', '7039293544', NULL, '', '', '', 'jonesey@yahoo.com', 'email', '', '7032294221', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Tue:3-6:portland', '', NULL, '', 'fc5fb5fc9b50aec8b6cdb7ae08635c15'),
('Kelly7034781866', '', 'portland', 'Kelly', 'Jones', '20 School Street', 'Ashburn', 'VA', '20147', '7034781866', NULL, '', '', '86-01-15', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', '', 'parking', 'Cleaning/Other', '06-10-13,06-18-13,--,--,--,--', 'active', 'Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Sun:5-9:portland', '', NULL, 'Wants to do with her friend.  Need to get name and have them fill out an application.', 'cd403f76f0489877f00ed8bbc5b9c893'),
('Andrea7037129570', '', 'portland', 'Andrea', 'Jones', '1 Thornhurst Road', 'Ashburn', 'VA', '20147', '7037129570', NULL, '', '', 'XX-01-22', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Mon:12-3:portland,Wed:12-3:portland,Thu:12-3:portland', '', NULL, 'returning fall 2013', '682ccc4d2785119ba69d970e87ad68ff'),
('Maureen7032100761', '', 'portland', 'Maureen', 'Jones', '32 Roosevelt Street', 'Ashburn', 'VA', '20147', '7032100761', NULL, '', '', 'XX-07-23', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:3-6:portland', ',even:Mon:3-6:portland', NULL, '', 'feaaedad8ae1a8959f5c023cac950281'),
('Jill and Peter7035758038', '', 'portland', 'Jill and Peter', 'Jones', '138 Main Avenue', 'Ashburn', 'VA', '20147', '7035758038', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '16a1270a582db721c790d50c57b8c261'),
('Erin7033182299', '', 'portland', 'Erin', 'Jones', '47 Fengler Road', 'Ashburn', 'VA', '20147', '7033182299', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland,Fri:6-9:portland', '', NULL, '6/28/13', '447a511eb436479a1a9319844d92c322'),
('Michelle7034153303', '', 'portland', 'Michelle', 'Jones', '221 Alfred St', 'Ashburn', 'VA', '20147', '7034153303', NULL, '', '', '', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', '', NULL, '', 'a20c6741e86a84fbb0d3bcde2a8f1a14'),
('Monique7039394553', '', 'portland', 'Monique', 'Jones', '6 Caribou Drive', 'Ashburn', 'VA', '20147', '7039394553', NULL, '', '', '', 'jonesey@yahoo.com', 'email', 'Girl Scout Leader /self employed', '7039394554', '', '', '', '', '', 'guestchef,cleaning,other', '', '', 'active', '', '', NULL, 'Our troop #783 would like to come and prepare lunch, clean, and maybe decorate.', 'e06347d44bbeb459bfb87cae16501383'),
('Samantha7037612960', '', 'portland', 'Samantha', 'Jones', '175 Lancaster St', 'Ashburn', 'VA', '20147', '7037612960', NULL, '', '', '79-06-27', 'jonesey@yahoo.com', 'email', 'Career Resourse Specialist', '7037982653', '', '', '', '', '', 'other', '', '', 'active', 'Thu:9-12:portland', '', NULL, 'Group for Work Opportunities Unlimited - Cookie Crew', 'bd9649c229ceba8ad4a8262e48ae3a00'),
('Angela7038850565', '', 'portland', 'Angela', 'Jones', '7 Landmark Road', 'Ashburn', 'VA', '20147', '7038850565', NULL, '', '', '71-06-11', 'jonesey@yahoo.com', 'email', '', '7034158065', '', '', '', '', '', 'guestchef', '', '', 'active', '', '', NULL, '', 'cd9e33627679369fb91d4a82c19dc3ab'),
('Michelle7035951031', '', 'portland', 'Michelle', 'Jones', '104 Murray St.', 'Ashburn', 'VA', '20147', '7035951031', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Mon:9-12:portland,Wed:9-12:portland,Wed:12-3:portland', '', NULL, '', '76b65c7990a7aab84029de46c39bd703'),
('Jennifer7038921509', '', 'portland', 'Jennifer', 'Jones', '11 Bear Run', 'Ashburn', 'VA', '20147', '7038921509', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Mon:6-9:portland', 'even:Mon:6-9:portland', NULL, '', '75c9569f7ac933577d3b752195498c4c'),
('Kassey7036082287', '', 'portland', 'Kassey', 'Jones', '554 Highland Ave.', 'Ashburn', 'VA', '20147', '7036082287', NULL, '', '', '', 'jonesey@yahoo.com', 'email', 'Research Assistant at MMCRI', '7032420580', '', '', 'I\'m a recent college graduate who moved to the area to work a few years at a research institute before applying to medical school. I\'m looking for ways to get involved and I enjoy working with people so I think this could be perfect for me!', '', '', 'volunteer,sub', 'Shift Volunteer/Weekend Manager', '08-13-13,--,--,--,--,--,--', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:12-3:portland,Sat:3-6:portland,Sun:2-5:portland,Sat:6-9:portland,Sun:5-9:portland', '', NULL, '', 'ac51d6eff952d46465d934825ec33871'),
('Liz7034009092', '', 'portland', 'Liz', 'Jones', '14 Wilson Street Apt 3', 'Ashburn', 'VA', '20147', '7034009092', NULL, '', '', '81-12-18', 'jonesey@yahoo.com', '', 'Real Estate Agent, Portside Real Estate Group', '7032720613', '', '', 'My mother has been involved with the house for many years and I was a volunteer as a teenager. I\'ve also had close friends stay at RMH\'s in other cities and would love to honor them by volunteering. I don\'t have specific skills to offer (and I\'m a horrible cook!) but I\'m willing to help however I can.', '', '', 'volunteer,sub', 'Shift Volunteer/Weekend Manager', '07-08-13,07-15-13,07-16-13,07-16-13,07-30-13,08-06-13,--', 'active', 'Tue:9-12:portland,Thu:9-12:portland,Fri:9-12:portland', '', NULL, 'I volunteered at the house years ago as a teenager and look forward to being involved again.', 'b7951a385e419f8cf240bc6e95c87964'),
('Susan7037817946', '11-07-01', 'portland', 'Susan', 'Jones', '5 thornhurst rd', 'Ashburn', 'VA', '20147', '7037817946', NULL, '', '', 'XX-03-04', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:1-4:portland', '2nd:Sat:1-4:portland', NULL, '', 'fd4cae7b6cfb5dac67568c6213d006ee'),
('Eric7037496109', '', 'portland', 'Eric', 'Jones', '11 Pond View Drive', 'Ashburn', 'VA', '20147', '7037496109', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:night:portland,Sun:5-9:portland', '', NULL, '', '306b1d21bf40a50ebb9df00d6d1ac66b'),
('Diana7032536901', '', 'portland', 'Diana', 'Jones', '891 Washington Avenue', 'Ashburn', 'VA', '20147', '7032536901', NULL, '', '', '61-08-14', 'jonesey@yahoo.com', '', 'claims examiner', '', '', '', '', '', '', 'cleaning', 'Cleaning/Other', '--,--,--,--,--,--', 'active', 'Fri:9-12:portland', '', NULL, 'Gabrielle, I am filling out the application for Martins Point claims department.  We are hoping to do fall clean up on November 1, 2013.', 'cfec98805a2a70ca99cda6c188fd7d6b'),
('Amy7036884716', '', 'portland', 'Amy', 'Jones', '131 Upper Minot Rd', 'Ashburn', 'VA', '20147', '7036884716', NULL, '', '', '73-10-29', 'jonesey@yahoo.com', 'email', 'Own and run a daycare', '6884716', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:12-3:portland,Sat:3-6:portland,Sun:2-5:portland', '', NULL, 'I am looking to volunteer on weekends. I love making quilts and would love to make some for the house.\r\nI also would be interested in making a meal.', '3d09e5ab2032243f3f713f618f72d930'),
('Lisa7033296707', '', 'portland', 'Lisa', 'Jones', '77 Randall Street #1', 'Ashburn', 'VA', '20147', '7033296707', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub', '', '', 'LOA', 'Fri:3-6:portland', '', NULL, '', '5687c198cae09393419f32d054e8cda9'),
('Helen7032748829', '', 'portland', 'Helen', 'Jones', 'P.O.Box 4612', 'Ashburn', 'VA', '20147', '7032748829', NULL, '', '', '', 'jonesey@yahoo.com', 'email', '', '7034151703', '', '', '', '', '', 'other', 'Shift Volunteer/Weekend Manager', '08-26-13,09-24-13,--,--,--,--,--', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland', '', NULL, '', '1d68ae964a2e48c104c004f32d34ee06'),
('David7032824314', '', 'portland', 'David', 'Jones', '34 Cathedral Oaks Drive', 'Ashburn', 'VA', '20147', '7032824314', NULL, '', '', '', 'jonesey@yahoo.com', 'email', 'Retired', '2824314', '', '', '', '', '', 'guestchef', 'Guest Chef', '09-26-13,--,--,--,--', 'LOA', 'Thu:6-9:portland,Fri:6-9:portland', '', NULL, 'did not complete application process 10/10/13', '07c56b4c7353764482364c837e7b5f9a'),
('Pat7037018778', '', 'portland', 'Pat', 'Jones', '148 Ferry Road', 'Ashburn', 'VA', '20147', '7037018778', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Fri:12-3:portland,Thu:3-6:portland', '', NULL, '', 'ea17d7e1b7bf63e74c66dbb0953cb141'),
('Taylor7034754529', '', 'portland', 'Taylor', 'Jones', '89 Spring Street', 'Ashburn', 'VA', '20147', '7034754529', NULL, '', '', '', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Thu:12-3:portland', '', NULL, 'USM student', '132cb5fbbc1526624d2aedd3ef969130'),
('Sarah7035425380', '', 'portland', 'Sarah', 'Jones', '19 Center St.', 'Ashburn', 'VA', '20147', '7035425380', NULL, '', '', '92-10-25', 'jonesey@yahoo.com', 'email', 'full-time student', '7035425647', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Fri:9-12:portland,Fri:12-3:portland,Fri:3-6:portland,Sat:3-6:portland,Fri:6-9:portland,Sat:6-9:portland', '', NULL, '', '4dd463ba3d069781a9361baf1c81291e'),
('Anna7033308133', '', 'portland', 'Anna', 'Jones', '994 Portland Road, Apt. 10', 'Ashburn', 'VA', '20147', '7033308133', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'former', 'Fri:night:portland,Sat:night:portland', '', NULL, 'on leave as of 3/7/13', 'b23f765bbe46613286faa265fcca843d'),
('Kellie and Alex7038293271', '', 'portland', 'Kellie and Alex', 'Jones', '5 Lockwood Lane', 'Ashburn', 'VA', '20147', '7038293271', NULL, '', '', '59-10-15', 'jonesey@yahoo.com', '', 'Product Marketing Analyst', '7038293271', '', '', 'My son Alex needs to complete community service for school, and he opted for RMH. We were Guest Chefs a couple of years ago, and he really enjoyed it.', '', '', 'guestchef', '', '', 'active', 'Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland,Sat:6-9:portland,Sun:5-9:portland', '', NULL, 'My 17-year-old son and I would like to volunteer as Guest Chefs at RMH. Unfortunately he works at 6:30 in Yarmouth M-F 6-9:portlands, so unless we can come at 5-5:30, we\'ll have to volunteer on the weekends only.', '29b805b94c1b2ffbfb122f4027e59e09'),
('Shanna and Matthew7033300522', '', 'portland', 'Shanna and Matthew', 'Jones', '994 Portland Road, Apt. 10', 'Ashburn', 'VA', '20147', '7033300522', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'LOA', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '2cff00b6faddf38375d4e9bc3e30eee0'),
('Jillaine7039914206', '', 'portland', 'Jillaine', 'Jones', '15 Stone Ridge Road', 'Ashburn', 'VA', '20147', '7039914206', NULL, '', '', '', 'jonesey@yahoo.com', 'email', 'Marketing/Sales Laboratory Non-Profit', '7033919447', '', '', 'I volunteered for the RMH through Key Club and high school and would love to start it up again with my family.  I would like my children to start learning the value of giving to others.', '', '', 'guestchef', 'Guest Chef', '11-12-13,--,--,--,--', 'active', 'Mon:3-6:portland,Thu:3-6:portland,Sun:2-5:portland', '', NULL, '', '6a9f8235cd2bc110bed27ac8db6d3023'),
('John7037812536', '00-01-01', 'portland', 'John', 'Jones', '17 Pine Ridge Road', 'Ashburn', 'VA', '20147', '7037812536', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Mon:6-9:portland,Thu:6-9:portland', 'even:Wed:6-9:portland', NULL, '', '9596f34cfad1f48b0140e4344f194f6e'),
('John7034899051', '', 'portland', 'John', 'Jones', '7 Baxter Lane', 'Ashburn', 'VA', '20147', '7034899051', NULL, '', '', '42-02-07', 'jonesey@yahoo.com', 'email', 'Retired Naval officer (20 years) & retired director of development (Gould Academy) 21 years', '', '', '', 'I want my volunteer work to have a positive impact on people.  My hobby is cooking, but I\'m not sure of what &quot;guest chef&quot; entails.', '', '', 'guestchef', 'Guest Chef', '--,11-12-13,--,--,--', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Sat:10-1:portland,Sun:9-12:portland', '', NULL, '', '15803d767600c0c4604ec72fc30d42cb'),
('Gibbs7037474590', '', 'portland', 'Gibbs', 'Jones', '35 Back Cove Estates', 'Ashburn', 'VA', '20147', '7037474590', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '5082090384', '', '', '', '', '', 'volunteer', '', '', 'active', 'Tue:12-3:portland', ',even:Tue:12-3:portland', NULL, '', '3dd1711997927b393ed48e9d14c018b6'),
('Kim7037496106', '', 'portland', 'Kim', 'Jones', '11 Pond View Drive', 'Ashburn', 'VA', '20147', '7037496106', NULL, '', '', 'XX-07-09', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,weekendmgr', '', '', 'active', 'Sat:night:portland,Sun:5-9:portland', '', NULL, 'have previously been weekend managers - 2001 - 2005', '306e40ac3fd315eddaba0513cc1d4c7e'),
('Chloe7035924902', '', 'portland', 'Chloe', 'Jones', '97 Pine St, Apt 1', 'Ashburn', 'VA', '20147', '7035924902', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Mon:3-6:portland', '', NULL, 'leave as of 5/2013', '3ef5f13cbcd95cf512261ef7b7b914f4'),
('Melissa7037806963', '', 'portland', 'Melissa', 'Jones', 'PO Box 298', 'Ashburn', 'VA', '20147', '7037806963', NULL, '', '', 'XX-01-02', 'jonesey@yahoo.com', 'email', '', '7038076963', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Fri:12-3:portland,Wed:3-6:portland', '', NULL, 'will be in Maine November - January 2013/14', '126a693e1f703d07c52369c39d7d166b'),
('David7034153386', '', 'portland', 'David', 'Jones', '566 Pinkham Brook Rd', 'Ashburn', 'VA', '20147', '7034153386', NULL, '', '', '65-05-04', 'jonesey@yahoo.com', '', 'Applications Specialist', '7034153386', '', '', 'General help.', '', '', 'cleaning', '', '', 'active', 'Sat:10-1:portland,Sat:1-4:portland,Sun:12-3:portland,Sat:3-6:portland,Sun:2-5:portland', '', NULL, '', '33106ebb448dbab807be92f437a748c8'),
('Evan7034153386', '', 'portland', 'Evan', 'Jones', '566 Pinkham Brook Rd', 'Ashburn', 'VA', '20147', '7034153386', NULL, '', '', '00-03-12', 'jonesey@yahoo.com', '', 'Student', '7034153386', '', '', '', '', '', 'cleaning', '', '', 'active', 'Sat:1-4:portland,Sun:12-3:portland,Sat:3-6:portland,Sun:2-5:portland', '', NULL, 'with father, David McKittrick', '8789b6ba8266dda7de4f35bbc29c5f28'),
('Wendy7038903671', '', 'portland', 'Wendy', 'Jones', '435 Summit Hill Road', 'Ashburn', 'VA', '20147', '7038903671', NULL, '', '', '71-01-13', 'jonesey@yahoo.com', '', 'Secretary/South Paris Baptist Church', '7038903621', '', '', '', '', '', 'guestchef', '', '', 'active', 'Mon:9-12:portland,Sat:1-4:portland,Fri:3-6:portland,Sat:3-6:portland,Sun:2-5:portland,Fri:6-9:portland,Sat:6-9:portland,Sun:5-9:portland', '', NULL, '', 'd974d95a370f433cc61bcc76b99fe7f2'),
('Debra7037813821', '', 'portland', 'Debra', 'Jones', '11 Maplewood Circle', 'Ashburn', 'VA', '20147', '7037813821', NULL, '', '', 'XX-02-18', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Mon:3-6:portland', 'odd:Mon:3-6:portland,even:Mon:3-6:portland', NULL, '', '16e98a1759cdc19c9365ae05f34e0566'),
('Anna7039391657', '', 'portland', 'Anna', 'Jones', '4 Raven Terrace', 'Ashburn', 'VA', '20147', '7039391657', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Sat:10-1:portland,Sun:9-12:portland,Wed:12-3:portland,Sat:1-4:portland,Sun:12-3:portland', '', NULL, 'College Student back in June 2014.', '85e3133abad312106d70120219696a77'),
('Sarah7033299368', '', 'portland', 'Sarah', 'Jones', '4 Raven Terrace', 'Ashburn', 'VA', '20147', '7033299368', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Tue:9-12:portland', '', NULL, 'Springfield College Student back May/June 2014.', 'ab1184503100cd13c259c44ddd5f9c14'),
('Ann7038317519', '', 'portland', 'Ann', 'Jones', '421 Jacob Ave', 'Ashburn', 'VA', '20147', '7038317519', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland', '', NULL, '', 'dadf47a24b7ee9af117c444943178510'),
('Russ7038317519', '', 'portland', 'Russ', 'Jones', '421 Jacob Ave', 'Ashburn', 'VA', '20147', '7038317519', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland,Sun:5-9:portland', '', NULL, '', 'bc664b2d8148b136b5647cac48c24d68'),
('David7037494034', '', 'portland', 'David', 'Jones', '11 Starboard Drive', 'Ashburn', 'VA', '20147', '7037494034', NULL, '', '', '62-03-24', 'jonesey@yahoo.com', 'email', 'Sales/Mkting', '7037490179', '', '', '', '', '', 'weekendmgr,guestchef,other', '', '', 'active', 'Fri:night:portland,Sat:night:portland,Sun:5-9:portland', '', NULL, '4/22/14 still interested in night coverage and fundraising events.', 'f1f397e3439330a7608923ec8a629914'),
('Kristine7036996023', '02-04-07', 'portland', 'Kristine', 'Jones', '75 Clark Street', 'Ashburn', 'VA', '20147', '7036996023', NULL, '', '', 'XX-06-02', 'jonesey@yahoo.com', '', 'I have volunteered for the Aids project now (Frannie Peabody) For 7yrs took time off to go back to school.', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Sat:10-1:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Sat:1-4:portland', '', NULL, '4/21/14 broke her leg as soon as heals will be able to volunteer . . . robin', '509454f40864e06741ad78a81bcdca42'),
('Estelle7037720647', '', 'portland', 'Estelle', 'Jones', '11 Bancroft', 'Ashburn', 'VA', '20147', '7037720647', NULL, '', '', '', 'jonesey@yahoo.com', 'phone', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', ',even:Mon:6-9:portland', NULL, '', 'b5c960cb78caa67fbe00e61e19eb8d49'),
('Ellen7034432810', '', 'portland', 'Ellen', 'Jones', '69 Sanders Road', 'Ashburn', 'VA', '20147', '7034432810', NULL, '', '', '', 'jonesey@yahoo.com', 'phone', 'Retired', '7034432810', '', '', '', '', '', 'volunteer,guestchef', '', '', 'active', 'Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Sat:1-4:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland,Sat:3-6:portland', ',odd:Fri:12-3:portland', NULL, '3/11/14 emailed shadow shift options and background/confidentiality forms to fill out', 'bebef9aa9f297b2313c11fa4dc5c8606'),
('Beverly7038542682', '', 'portland', 'Beverly', 'Jones', '16 Middle St.', 'Ashburn', 'VA', '20147', '7038542682', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Sat:10-1:portland,Sat:1-4:portland', '1st:Sat:1-4:portland', NULL, '', '76eefae884f38701967de6df4294066b'),
('Kevin and Nathalie7038659650', '', 'portland', 'Kevin and Nathalie', 'Jones', '14 Roos Hill Drive', 'Ashburn', 'VA', '20147', '7038659650', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '2a80821bbdc35b6e4c0d6a0996900591'),
('Pat7038319787', '', 'portland', 'Pat', 'Jones', 'PO Box 41', 'Ashburn', 'VA', '20147', '7038319787', NULL, '', '', 'XX-01-19', 'jonesey@yahoo.com', '', '', '7038319787', '', '', '', '', '', 'parking', '', '', 'former', 'Fri:12-3:portland', '', NULL, '', '391a3947f7120e084e89affb1e19dd66'),
('Tom7032391994', '', 'portland', 'Tom', 'Jones', '28 Gray Road', 'Ashburn', 'VA', '20147', '7032391994', NULL, '', '', '', 'jonesey@yahoo.com', '', 'workers comp board', '', '', '', '', '', '', 'volunteer,sub,cleaning,other', 'Shift Volunteer/Weekend Manager', '04-10-14,04-23-14,04-24-14,04-24-14,05-01-14,05-09-14,05-12-14', 'active', 'Wed:6-9:portland,Sat:6-9:portland', '', NULL, '', 'f3660730f114769711c69d1372b64aff'),
('Lance7032528780', '00-09-01', 'portland', 'Lance', 'Jones', '101 Presidential Way', 'Ashburn', 'VA', '20147', '7032528780', NULL, '', '', '79-05-07', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland,Sun:5-9:portland', '3rd:Sun:2-5:portland', NULL, '', '34cb724c374a0ae3949ad67fdcb3fd44'),
('Mary7037999534', '', 'portland', 'Mary', 'Jones', '18 Elderberry Drive', 'Ashburn', 'VA', '20147', '7037999534', NULL, '', '', 'XX-04-30', 'jonesey@yahoo.com', '', '', '8074514', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Wed:6-9:portland', '', NULL, 'Mary out injured as of May 2014', '6fd8fc147e1fc095900c06e96a3b9f56'),
('Nancy and Chris7032297633', '', 'portland', 'Nancy and Chris', 'Jones', '2 Homestead Lane', 'Ashburn', 'VA', '20147', '7032297633', NULL, '', '', '61-06-19', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland,Sun:5-9:portland', '', NULL, '', 'd5948a2b51a8927d3a892063e47625d6'),
('Sue7033171877', '01-09-12', 'portland', 'Sue', 'Jones', '48 Macintosh Lane', 'Ashburn', 'VA', '20147', '7033171877', NULL, '', '', 'XX-07-07', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', 'even:Thu:3-6:portland,even:Thu:3-6:portland', NULL, '', '442d3d22c8e48c8c96dcfb0e2f022a9a'),
('Leigh7037878876', '', 'portland', 'Leigh', 'Jones', '426 Bridgton Rd', 'Ashburn', 'VA', '20147', '7037878876', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:1-4:portland', '4th:Sat:1-4:portland,4th:Sat:1-4:portland,4th:Sat:1-4:portland', NULL, '', 'a1c054b67919ba041d00ddcd884da682'),
('Cheryl7037760561', '', 'portland', 'Cheryl', 'Jones', '166 Delaware Court', 'Ashburn', 'VA', '20147', '7037760561', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Sat:10-1:portland', '', NULL, 'Subs as needed - we call or she will call in.\r\n9-12 on Saturdays', '66a43ceb3d299b16e0bd37098e8eb993'),
('Michelle7035906214', '', 'portland', 'Michelle', 'Jones', '18 Ryefield Drive', 'Ashburn', 'VA', '20147', '7035906214', NULL, '', '', '71-12-16', 'jonesey@yahoo.com', '', 'Financial analyst', '7032320995', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:12-3:portland,Sat:3-6:portland,Sun:2-5:portland', '', NULL, '', 'edf8377563f7fa2897df6aa434ad305e'),
('Ellen7036323133', '', 'portland', 'Ellen', 'Jones', '187 Lester Drive', 'Ashburn', 'VA', '20147', '7036323133', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Mon:6-9:portland', 'odd:Mon:6-9:portland', NULL, 'Will contact us in October to get back on schedule', '35f2008dad56e7db7726631c77f6310c'),
('Robert7036328883', '', 'portland', 'Robert', 'Jones', '845 North Road', 'Ashburn', 'VA', '20147', '7036328883', NULL, '', '', '88-07-19', 'jonesey@yahoo.com', 'email', '', '7038384698', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', '', NULL, 'Moved to Boston June 2014, might take shifts when back in town.', '0124acb28a7ec951c1baf98f3185f223'),
('Ellen7038855822', '', 'portland', 'Ellen', 'Jones', '30 Evergreen Farm Rd.', 'Ashburn', 'VA', '20147', '7038855822', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Thu:6-9:portland', 'even:Thu:6-9:portland', NULL, 'On leave as of 7/2014. Hopes to return later this year.', '3c9ff65f8af18b9e72b0206cab99fcee'),
('Nina7038790643', '', 'portland', 'Nina', 'Jones', '150 Glenwood Ave.', 'Ashburn', 'VA', '20147', '7038790643', NULL, '', '', '', 'jonesey@yahoo.com', '', 'Just graduate', '7036537731', '', '', '', '', '', 'volunteer,sub', '', '', 'active', '', '', NULL, 'Former volunteer', '62c8ad0a15d9d1ca38d5dee762a16e01'),
('Gerry7037721447', '', 'portland', 'Gerry', 'Jones', '2 Ashlar Court', 'Ashburn', 'VA', '20147', '7037721447', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Mon:12-3:portland', 'odd:Mon:12-3:portland', NULL, 'Gerry had pneumonia, taking a break as of 7/14', 'f7dbf90e80594c3b1ceeae010f80de4b'),
('Stacey7032333522', '', 'portland', 'Stacey', 'Jones', '149 woodlands drive', 'Ashburn', 'VA', '20147', '7032333522', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Tue:9-12:portland', 'even:Tue:9-12:portland,odd:Tue:9-12:portland,odd:Tue:9-12:portland,even:Tue:9-12:portland', NULL, 'out until 9/14; still supplying Family Room', 'a59a215ebebf9aa9d18955eefdad030c'),
('Eryn7034236689', '', 'portland', 'Eryn', 'Jones', '7 Old Salt Road #20', 'Ashburn', 'VA', '20147', '7034236689', NULL, '', '', '', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', '', 'other', '', '', 'active', '', '', NULL, 'Wants to do special projects (like gift wrapping)', '5dcc743b6f13fb669abcd4352714cd18'),
('Rosemary7036197215', '', 'portland', 'Rosemary', 'Jones', '6 Walker St, apt 1', 'Ashburn', 'VA', '20147', '7036197215', NULL, '', '', 'XX-10-07', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', '', NULL, '4/14/14 was in the hospital and will sub when feeling better.', 'cb56a32cfda15d8dd1189eada430c3bc'),
('Deb7039932644', '', 'portland', 'Deb', 'Jones', 'PO Box 567', 'Ashburn', 'VA', '20147', '7039932644', NULL, '', '', '56-05-26', 'jonesey@yahoo.com', 'email', 'Marketing Coordinator', '7039932644', '', '', '', '', '', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'd53464c96035c3cc819d0538f3dbcbcc'),
('Maxine7038926343', '', 'portland', 'Maxine', 'Jones', '40 Sebage Lake Rd.', 'Ashburn', 'VA', '20147', '7038926343', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:12-3:portland', '', NULL, '', '4f9289cdcce14583fab1bec013254950'),
('Stacy7037726579', '08-09-01', 'portland', 'Stacy', 'Jones', '9 Lombard St', 'Ashburn', 'VA', '20147', '7037726579', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland', '', NULL, 'Number above is work number (realty office)', '0b6e435ca7a3f777f98a5e6cb0181e33'),
('Joanne7038073943', '', 'portland', 'Joanne', 'Jones', '9 Monroe Dr', 'Ashburn', 'VA', '20147', '7038073943', NULL, '', '', '', 'jonesey@yahoo.com', '', 'Receptionist', '7038315704', '', '', 'Cooking, cleaning, linens.  Organization.  Hospitality.', '', '', 'volunteer', 'Shift Volunteer/Weekend Manager', '--,08-30-14,--,--,09-10-14,09-16-14,09-17-14', 'active', 'Mon:12-3:portland,Wed:12-3:portland,Fri:12-3:portland,Sun:12-3:portland,Mon:3-6:portland,Wed:3-6:portland,Fri:3-6:portland,Sun:2-5:portland,Mon:6-9:portland', '', NULL, '', '4f97d3b8a7b90cd282d889cc07cc2124'),
('Tara7032722318', '', 'portland', 'Tara', 'Jones', '244 Patterson Road', 'Ashburn', 'VA', '20147', '7032722318', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '75be2dd10c2643140d2453498e4e41f2'),
('Judy and Rod7038945447', '', 'portland', 'Judy and Rod', 'Jones', '108 Brown Cove Road', 'Ashburn', 'VA', '20147', '7038945447', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'weekendmgr', '', '', 'former', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'cd51e0fdf4be6c382c15c18a63b2ae1c'),
('Dee7036553052', '', 'portland', 'Dee', 'Jones', '95 Watkins Shores Road', 'Ashburn', 'VA', '20147', '7036553052', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Tue:12-3:portland', '', NULL, '', '93bd782784edfcfce308b36480c6a397'),
('Star7036536759', '', 'portland', 'Star', 'Jones', '99 Maine Ave', 'Ashburn', 'VA', '20147', '7036536759', NULL, '', '', 'XX-03-18', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland', '', NULL, '', 'aa0544516c5a8b404e222d029069157d'),
('Cheryl7032821358', '', 'portland', 'Cheryl', 'Jones', '64 Old Orchard Road', 'Ashburn', 'VA', '20147', '7032821358', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:9-12:portland', 'odd:Mon:9-12:portland,even:Mon:9-12:portland', NULL, '', '6864c3260ce39b00459cf614ba2cde3f'),
('Amy7037519944', '', 'portland', 'Amy', 'Jones', '13 Lambert Rd.', 'Ashburn', 'VA', '20147', '7037519944', NULL, '', '', '', 'jonesey@yahoo.com', '', 'Special Ed/Ed Tech', '2728332', '', '', '', '', '', 'volunteer,sub', 'Shift Volunteer/Weekend Manager', '--,--,--,--,--,--,--', 'active', 'Mon:3-6:portland', ',odd:Wed:3-6:portland', NULL, 'Ann Nye\'s daughter', 'a1f3c4f4a31b5f75618d79e0ecfd0bf3'),
('Cindy7037122120', '', 'portland', 'Cindy', 'Jones', '252 Vaughan Street #5', 'Ashburn', 'VA', '20147', '7037122120', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '209ca19b13060a8febec841aecdc9828'),
('Laura7036154220', '', 'portland', 'Laura', 'Jones', '439 Convene Rd.', 'Ashburn', 'VA', '20147', '7036154220', NULL, '', '', '61-04-27', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', '', '', NULL, '', '40bdd662305a0b4689c89b672884f83d'),
('Arthur7034500012', '14-10-30', 'portland', 'Arthur', 'Jones', '67 Gary L. Maietta Parkway, #6', 'Ashburn', 'VA', '20147', '7034500012', NULL, '', '', 'XX-10-19', 'jonesey@yahoo.com', '', 'Commercial Recovery', '7034500012', '', '', '', '', '', 'volunteer,weekendmgr,guestchef', 'Shift Volunteer/Weekend Manager', '--,--,--,--,--,--,--', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, 'Wife is Nannette Duncanson', '72a8195c46cff6a7bc555b90128b68a1'),
('Annie7038466661', '', 'portland', 'Annie', 'Jones', '90 Shoreview Dr.', 'Ashburn', 'VA', '20147', '7038466661', NULL, '', '', '47-11-26', 'jonesey@yahoo.com', 'email', 'Retired Delta Flt. Attendant', '7032338726', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland', '', NULL, 'She volunteers with Sally Kennedy and Becky Joyce every other Friday from spring until late fall.', 'e9d1821292eb086c0fe682ac2a9a13d7');
INSERT INTO `dbPersons` (`id`, `start_date`, `venue`, `first_name`, `last_name`, `address`, `city`, `state`, `zip`, `phone1`, `phone1type`, `phone2`, `phone2type`, `birthday`, `email`, `employer`, `position`, `credithours`, `howdidyouhear`, `commitment`, `motivation`, `specialties`, `convictions`, `type`, `screening_type`, `screening_status`, `status`, `availability`, `schedule`, `hours`, `notes`, `password`) VALUES
('Mary Murray7037412944', '', 'portland', 'Mary Murray', 'Jones', '22 Wildwood Drive', 'Ashburn', 'VA', '20147', '7037412944', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Wed:9-12:portland,Wed:12-3:portland', 'odd:Mon:12-3:portland', NULL, 'On leave as of November 2014; hopes to be back in 2015', '4a8c4f8d97fab55f1273f0278ace3e21'),
('Mary Ann7038833212', '', 'portland', 'Mary Ann', 'Jones', '4 Woodland Road', 'Ashburn', 'VA', '20147', '7038833212', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Tue:12-3:portland', 'even:Tue:12-3:portland', NULL, '', '68894f2ee34f8252950147c5bb69b296'),
('Vickie7033180302', '', 'portland', 'Vickie', 'Jones', 'PO Box 50', 'Ashburn', 'VA', '20147', '7033180302', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', ',even:Mon:6-9:portland', NULL, 'Doesn\'t check email often, call to contact', '697f808b00a5a5d5f1899226ef54e0c4'),
('Cheryl7038384913', '', 'portland', 'Cheryl', 'Jones', '9 Ru-Bee Ridge Rd', 'Ashburn', 'VA', '20147', '7038384913', NULL, '', '', '', 'jonesey@yahoo.com', '', 'Windham Booster ClubWindham Project Graduation', '', '', '', '', '', '', 'guestchef', '', '', 'active', 'Wed:6-9:portland', '', NULL, '', '18ef152121cd34ccef72467b91cc4941'),
('Bryce7032334316', '14-11-21', 'portland', 'Bryce', 'Jones', '69 Euclid Ave.', 'Ashburn', 'VA', '20147', '7032334316', NULL, '', '', 'XX-10-21', 'jonesey@yahoo.com', '', 'U.S. Probation Officer ', '7035513656', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland', '', NULL, '', 'e2c7a449c603b4a86c000c792432ea70'),
('Daryn7036242209', '', 'portland', 'Daryn', 'Jones', '64 Greenwood Ave.', 'Ashburn', 'VA', '20147', '7036242209', NULL, '', '', 'XX-10-20', 'jonesey@yahoo.com', '', 'VP, Farm Credit East', '7033560689', '', '', '', '', '', 'volunteer', 'Shift Volunteer/Weekend Manager', '--,--,--,--,--,--,--', 'active', '', '', NULL, 'Co-worker of Rob Horne', 'ea2d566de4601700c1637fa971ec1e53'),
('Louise7037125923', '14-12-05', 'portland', 'Louise', 'Jones', '95 Pleasant Hill Rd.', 'Ashburn', 'VA', '20147', '7037125923', NULL, '', '', '59-04-21', 'jonesey@yahoo.com', '', 'Member Services Coordinator', '7037125928', '', '', '', '', '', 'volunteer,guestchef', '', '', 'active', 'Sat:10-1:portland,Sat:1-4:portland', '', NULL, 'Also does Guest Chef with Martin\'s Point', '1dfac053e395bbe37532fb904de0fec9'),
('Claudia7033181908', '', 'portland', 'Claudia', 'Jones', '4 Settlers Rd', 'Ashburn', 'VA', '20147', '7033181908', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Wed:6-9:portland', 'odd:Wed:6-9:portland,odd:Wed:6-9:portland', NULL, '', 'beb8e4e656006dd5c06c64c0e07cc508'),
('Linda7036711597', '', 'portland', 'Linda', 'Jones', '3 Thomas Drive', 'Ashburn', 'VA', '20147', '7036711597', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,parking', '', '', 'active', 'Thu:12-3:portland', 'odd:Thu:12-3:portland', NULL, '', '4d97ce696353f6c46e3c8b3b76d7a931'),
('Amanda7033185257', '14-12-31', 'portland', 'Amanda', 'Jones', '5 Morrill Ave.', 'Ashburn', 'VA', '20147', '7033185257', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,guestchef,other', '', '', 'active', '', '', NULL, '', '45f899a2efd6d7f5682ecf75987023fd'),
('Stacie7033560689', '', 'portland', 'Stacie', 'Jones', '64 Greenwood Ave.', 'Ashburn', 'VA', '20147', '7033560689', NULL, '', '', 'XX-08-23', 'jonesey@yahoo.com', '', 'Special education Teacher', '6242209', '', '', '', '', '', 'volunteer', 'Shift Volunteer/Weekend Manager', '--,--,--,--,--,--,--', 'active', '', '', NULL, 'Husband is Daryn Deveau, co-worker of Rob Horne', '5a7fe411ea70b099f5328581bde04dec'),
('Adrien7036152675', '14-11-14', 'portland', 'Adrien', 'Jones', '692 Cathance Rd.', 'Ashburn', 'VA', '20147', '7036152675', NULL, '', '', 'XX-04-10', 'jonesey@yahoo.com', '', 'Operations Analyst, Gen Re', '7032333045', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:12-3:portland,Sun:2-5:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', '', NULL, 'Volunteers with wife/partner Gisele Couturier', '91b327a8b1515c8f6af845902f63a47a'),
('Gisele7032333045', '14-11-14', 'portland', 'Gisele', 'Jones', '692 Cathance Rd.', 'Ashburn', 'VA', '20147', '7032333045', NULL, '', '', 'XX-06-22', 'jonesey@yahoo.com', '', 'Audit Manager, Baker Newman Noyes', '7036152675', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:12-3:portland,Sun:2-5:portland,Mon:6-9:portland,Tue:6-9:portland,Thu:6-9:portland', '', NULL, 'Volunteers with husband/partner Adrien Boudreau', '2f5bc78b214106832c1fbccce76d8d84'),
('Sarah7036503396', '', 'portland', 'Sarah', 'Jones', '26 Deering Street #7', 'Ashburn', 'VA', '20147', '7036503396', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '7037992246', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Mon:12-3:portland,Tue:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', '', NULL, 'Marked as &quot;on leave&quot; 1/2015--hasn\'t been here in awhile', 'e2bbdca1b65c0cb9e62ce82d0df77ace'),
('David7032848177', '15-01-16', 'portland', 'David', 'Jones', '3 Penny Avenue', 'Ashburn', 'VA', '20147', '7032848177', NULL, '', '', '', 'jonesey@yahoo.com', '', 'Quality Assurance, Pratt & Whitney', '7036324043', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Sat:10-1:portland,Sat:1-4:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', '', NULL, 'Primary phone is home, secondary is cell, work is 703-676-4100 x.25', '0e675c05e846b40f32a8896c288b62a4'),
('Nicki7038788443', '', 'portland', 'Nicki', 'Jones', '79 Farragut St.', 'Ashburn', 'VA', '20147', '7038788443', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub,weekendmgr', '', '', 'active', 'Sat:10-1:portland,Sun:12-3:portland,Sun:2-5:portland,Fri:night:portland,Sat:night:portland', '', NULL, '', '85fb14c5bc8918c43338d23cfc1cb02f'),
('Marilyn7036506687', '', 'portland', 'Marilyn', 'Jones', '36 Ring Landing Rd', 'Ashburn', 'VA', '20147', '7036506687', NULL, '', '', '', 'jonesey@yahoo.com', '', 'CASA Volunteer Portland,ME     1998-2002Youth Alternatives, Family Mediator 2002-2004', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Tue:6-9:portland', 'odd:Tue:6-9:portland', NULL, 'On leave as of 12/2014.  Hopes to return in spring after knee replacement.  Usually odd Tuesdays 6-9 with Kara.', '077f39a9140b76b816b6a5847693d6f9'),
('Ellen7038855447', '', 'portland', 'Ellen', 'Jones', '24 Honeysuckle Lane', 'Ashburn', 'VA', '20147', '7038855447', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub', '', '', 'LOA', 'Mon:9-12:portland,Tue:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Fri:12-3:portland', '', NULL, 'Picks up recycling and returnables; on leave due to injury as of 2/2/2015', 'a6d81aa345eeb016470344fc294831a9'),
('Bobbi7033447417', '14-12-17', 'portland', 'Bobbi', 'Jones', '122 Moody Road', 'Ashburn', 'VA', '20147', '7033447417', NULL, '', '', '75-08-17', 'jonesey@yahoo.com', 'email', 'Occupational therapist', '7037542023', '', '', '', '', '', 'volunteer', '', '', 'active', 'Fri:9-12:portland,Sat:10-1:portland,Sun:9-12:portland,Fri:12-3:portland,Sat:1-4:portland,Sun:12-3:portland,Fri:3-6:portland,Sat:3-6:portland,Sun:2-5:portland,Fri:6-9:portland,Sat:6-9:portland,Sun:5-9:portland', ',even:Fri:9-12:portland', NULL, '', 'd2796c72fb33a6d7e6ad5b5ffe3dd7a7'),
('Suzanne7037592753', '', 'portland', 'Suzanne', 'Jones', '127 Harriet St', 'Ashburn', 'VA', '20147', '7037592753', NULL, '', '', '68-05-28', 'jonesey@yahoo.com', '', 'self employed- baker', '7036718638', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Mon:3-6:portland', '', NULL, 'On leave as of fall 2014--new job, hopes to help out again when time allows', '3e6310117c4db6af3c2bbe51d5711f23'),
('April7038995598', '15-03-03', 'portland', 'April', 'Jones', '30 Stagecoach Lane', 'Ashburn', 'VA', '20147', '7038995598', NULL, '', '', '', 'jonesey@yahoo.com', '', 'Busines Owner', '7035239661', '', '', '', '', '', 'weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', 'eeaa985a92a2f3aae930c12cc6dc3df3'),
('Fran7037996057', '', 'portland', 'Fran', 'Jones', '5 Surf Road', 'Ashburn', 'VA', '20147', '7037996057', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Wed:12-3:portland', 'even:Wed:12-3:portland', NULL, 'On leave until 10/14--called late fall and has other things going on, hopes to be back in the spring.', '9aa13bc7b4ebd46e5544f9db9a7579f0'),
('Cindy7037492317', '', 'portland', 'Cindy', 'Jones', '51 Martin Heights', 'Ashburn', 'VA', '20147', '7037492317', NULL, '', '', '', 'jonesey@yahoo.com', 'email', 'previously  employed as a school bus driver for 14 years.', '7037492379', '', '', '', '', '', 'volunteer,sub,guestchef,parking,other', '', '', 'LOA', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', '', NULL, 'On leave as of 3/17/15, family medical issues', 'b751f24f766da0985a732c1afff9cbca'),
('Matthew7038313944', '15-02-20', 'portland', 'Matthew', 'Jones', '133 Hawthorne Lane', 'Ashburn', 'VA', '20147', '7038313944', NULL, '', '', '94-04-24', 'jonesey@yahoo.com', 'email', 'Junior Hockey Player', '7039393273', '', '', '', '', '', 'volunteer,parking,cleaning', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Sat:3-6:portland', '', NULL, '', 'ea28e24e712323d9d14ff648a35cefc4'),
('Kathleen7032724955', '', 'portland', 'Kathleen', 'Jones', '3 D Street', 'Ashburn', 'VA', '20147', '7032724955', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub', '', '', 'former', 'Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', 'even:Thu:12-3:portland', NULL, '8/12/14, Emailed to see if she\'s still volunteering--GN', 'c7a4e16632191470d97196631e2a112c'),
('Laureen7036537432', '15-04-10', 'portland', 'Laureen', 'Jones', '8 Irie Road', 'Ashburn', 'VA', '20147', '7036537432', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Fri:9-12:portland', '', NULL, '', '06065f96a11068bcddc040e3f70b57fd'),
('Grace7034099841', '15-04-24', 'portland', 'Grace', 'Jones', '196 Sebago Lake Road', 'Ashburn', 'VA', '20147', '7034099841', NULL, '', '', '', 'jonesey@yahoo.com', '', 'Students', '7033104007', '', '', '', '', '', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '4f8a183d88354f7c45a7168cabc5e044'),
('Ellen7037994830', '15-05-01', 'portland', 'Ellen', 'Jones', '823 Shore Road', 'Ashburn', 'VA', '20147', '7037994830', NULL, '', '', '', 'jonesey@yahoo.com', '', 'N/A', '7038386668', '', '', '', '', '', 'volunteer', '', '', 'active', 'Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland', ',even:Wed:12-3:portland', NULL, '', '8555fd0a608e57e7d479b6d5b454284c'),
('Brooke7036026920', '14-12-17', 'portland', 'Brooke', 'Jones', '8 Ocean Greens Drive', 'Ashburn', 'VA', '20147', '7036026920', NULL, '', '', '78-02-17', 'jonesey@yahoo.com', 'email', 'Stay at home mother', '7036026203', '', '', 'Used to work in the medical field and miss helping people.  Was raised doing volunteer work and would like my children to value and become better people from the experience.', '', '', 'guestchef,cleaning,other', 'Shift Volunteer/Weekend Manager', '12-23-14,--,--,--,--,--,--', 'active', 'Sun:9-12:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', '', NULL, 'I would like to do this with my children ages 3, 8, 8, 10', '9c5d109d598a66c9751a73894ffe5a14'),
('Claire7037970515', '14-09-29', 'portland', 'Claire', 'Jones', '85 Dole Drive', 'Ashburn', 'VA', '20147', '7037970515', NULL, '', '', 'XX-08-09', 'jonesey@yahoo.com', '', 'Retired', '79133746577429', '', '', '', '', '', 'sub,guestchef', 'Shift Volunteer/Weekend Manager', '--,--,--,--,10-30-14,11-07-14,--', 'active', '', '', NULL, '', 'a244e36c59519fbff9a4e75c868dcdd5'),
('Elaine7037672928', '', 'portland', 'Elaine', 'Jones', '19 Phoebe\'s Way', 'Ashburn', 'VA', '20147', '7037672928', NULL, '', '', '56-09-25', 'jonesey@yahoo.com', 'phone', 'High School Educational Technician', '7036327156', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:6-9:portland', ',odd:Fri:3-6:portland', NULL, 'emailed shadow shift options 3/11/14', 'f46b90962ae116e1ca9832d6fac4dc9b'),
('Cheryl7038089589', '15-05-19', 'portland', 'Cheryl', 'Jones', '52 Carleton St, Apt. 2', 'Ashburn', 'VA', '20147', '7038089589', NULL, '', '', 'XX-06-29', 'jonesey@yahoo.com', '', '', '6204311395', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', ',odd:Mon:12-3:portland,even:Mon:12-3:portland', NULL, '', 'e304638091eb8dc78c0150074742a394'),
('Charlie7032728637', '', 'portland', 'Charlie', 'Jones', '80 Grant Street, Apt.5', 'Ashburn', 'VA', '20147', '7032728637', NULL, '', '', 'XX-07-26', 'jonesey@yahoo.com', 'phone', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland', ',odd:Wed:9-12:portland,odd:Wed:9-12:portland', NULL, '', '92ce2511431e73678f0626112a637524'),
('Susan7038830238', '', 'portland', 'Susan', 'Jones', '48 Old Blue Point Rd', 'Ashburn', 'VA', '20147', '7038830238', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'other', '', '', 'active', 'Thu:9-12:portland', 'even:Thu:9-12:portland', NULL, 'Former shift volunteer; now for special projects', 'bb20e3eaa2855907713de2c75d7d1f51'),
('Libby7037812854', '', 'portland', 'Libby', 'Jones', '7 Sturdivant Rd', 'Ashburn', 'VA', '20147', '7037812854', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'other', '', '', 'active', 'Thu:9-12:portland', 'even:Thu:9-12:portland', NULL, 'Former shift volunteer; now just special projects', '74ffdf94dd0f41edf02496340b746c49'),
('Lisa7035929386', '', 'portland', 'Lisa', 'Jones', '48 Western Promenade', 'Ashburn', 'VA', '20147', '7035929386', NULL, '', '', '61-09-13', 'jonesey@yahoo.com', 'email', 'HR Director', '8153512658', '', '', '', '', '', 'volunteer', '', '', 'active', 'Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland', '', NULL, '', '28707382d96da155e4d9aa469f8909bd'),
('Reeven7034009615', '', 'portland', 'Reeven', 'Jones', '48 Western Promenade', 'Ashburn', 'VA', '20147', '7034009615', NULL, '', '', '61-05-15', 'jonesey@yahoo.com', 'email', 'Health Care Executive', '7035929386', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:3-6:portland,Thu:6-9:portland,Fri:6-9:portland', '', NULL, '', '7b9e2e6ddc9a6d1843d65668640cb5aa'),
('Ann7038470375', '', 'portland', 'Ann', 'Jones', '234 Bluff Road', 'Ashburn', 'VA', '20147', '7038470375', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:12-3:portland', ',odd:Wed:3-6:portland', NULL, '', '8146f6d82f31eaee4dbb8ecf14cc70c1'),
('Hannah7034155621', '15-05-13', 'portland', 'Hannah', 'Jones', '21 Chestnut Way', 'Ashburn', 'VA', '20147', '7034155621', NULL, '', '', 'XX-09-23', 'jonesey@yahoo.com', '', 'Owner, small business', '7034159550', '', '', '', '', '', 'volunteer', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Thu:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Thu:12-3:portland', '', NULL, '', '971853a7eeabab7cadb4e303708b2d49'),
('John7032476256', '15-06-17', 'portland', 'John', 'Jones', 'PO Box 262', 'Ashburn', 'VA', '20147', '7032476256', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Wed:3-6:portland', ',even:wed:3-6:portland,odd:Wed:12-3:portland', NULL, '', '327eed417359e104f09c7b25c09a2ac8'),
('Jeanette7037615825', '', 'portland', 'Jeanette', 'Jones', '11 Garrison Street', 'Ashburn', 'VA', '20147', '7037615825', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland', '', NULL, '', '0a96f99577eea66840c5231e9dd19ead'),
('Betsy7038464935', '', 'portland', 'Betsy', 'Jones', '7 Kingfisher Cove', 'Ashburn', 'VA', '20147', '7038464935', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Tue:3-6:portland', 'odd:Tue:3-6:portland,even:Tue:3-6:portland', NULL, 'On leave during summer', 'd267eb176ce6bb63e0882f729d22c3ac'),
('Kaite7036491875', '', 'portland', 'Kaite', 'Jones', 'NA', 'Ashburn', 'VA', '20147', '7036491875', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'sub,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '01ccd13579210e080976c6659c0d7c73'),
('Zeynep7034206343', '15-02-17', 'portland', 'Zeynep', 'Jones', '32 Fairview St.', 'Ashburn', 'VA', '20147', '7034206343', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '7034201929', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Mon:6-9:portland', '', NULL, 'New job summer 2015, not sure if she\'ll have time', 'f9913f82a3a8bad2a70620adebcadf72'),
('Gloria7032322778', '15-03-31', 'portland', 'Gloria', 'Jones', '29 Munjoy Street', 'Ashburn', 'VA', '20147', '7032322778', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Sun:9-12:portland,Sun:12-3:portland', '', NULL, 'Volunteers with daughter, Morgan', '51f2b716fa248b035e4b08778434476e'),
('Cindy7035631089', '', 'portland', 'Cindy', 'Jones', '21 Wawenock Drive', 'Ashburn', 'VA', '20147', '7035631089', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', 'Tue:12-3:portland', 'odd:Tue:12-3:portland,odd:Tue:12-3:portland', NULL, '', '3e941391b64586232ac638a5bb0e1d06'),
('Joan7037975211', '', 'portland', 'Joan', 'Jones', '238 Virginia St', 'Ashburn', 'VA', '20147', '7037975211', NULL, '', '', '', 'jonesey@yahoo.com', 'phone', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'LOA', 'Mon:3-6:portland', '', NULL, 'Taken off regular shift as of August 2015 because of health issues', '430765c56f3406c13f8c02539e8b4ab1'),
('Iola7034006114', '', 'portland', 'Iola', 'Jones', '131 Temple Ave. #11', 'Ashburn', 'VA', '20147', '7034006114', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'LOA', 'Sat:10-1:portland,Sun:5-9:portland', '', NULL, 'On leave as of August 2015.  Health problems (knee)', '1f01d3ff1c68e43a6d7aa27d7ed39ace'),
('Liset and David7032402357', '', 'portland', 'Liset and David', 'Jones', 'PO Box 802', 'Ashburn', 'VA', '20147', '7032402357', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer', '', '', 'active', '', '', NULL, '', 'dc31618e2dc8aadaa45ba46e0077c257'),
('Susan7034154788', '15-08-21', 'portland', 'Susan', 'Jones', '317 East Main St.', 'Ashburn', 'VA', '20147', '7034154788', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', NULL, '', '6fef83109c8fd67e20465715d63af23a'),
('Mary7036423647', '', 'portland', 'Mary', 'Jones', 'Box 602, 350 Manchester Rd', 'Ashburn', 'VA', '20147', '7036423647', NULL, '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', '', 'volunteer,sub', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Fri:12-3:portland', 'odd:Wed:12-3:portland', NULL, '', 'b57c0cec9b69847bb28bbc0cc42bbe85'),
('Kristen7032395617', '15-06-11', 'portland', 'Kristen', 'Jones', '172 Clark St, #3', 'Ashburn', 'VA', '20147', '7032395617', '', '', '', 'XX-06-16', 'jonesey@yahoo.com', '', 'Sales Ops Manager, IDEXX', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', '', '', 'Subbing on 6-9 shift for now--6/2015', 'dddede4b63e31d331d83a7312644c08c'),
('Sonia7037298510', '15-09-28', 'portland', 'Sonia', 'Jones', '48 McLellen St.', 'Ashburn', 'VA', '20147', '7037298510', 'home', '', '', '05281958', 'jonesey@yahoo.com', 'Town of Brunswick PD', 'Communications Supervisor', '', 'family', '', 'Desire to volunteer, children grown', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', '15-10-12:0900-1300:4,15-10-10:0900-1230:3.5,15-10-09:1800-0900:15,15-10-08:1500-1830:3.5,15-10-05:1500-1800:3', '', '235215b63f5d77038279dce684c734ec'),
('Anne7034432321', '09-06-16', 'portland', 'Anne', 'Jones', '992 High St', 'Ashburn', 'VA', '20147', '7034432321', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'LOA', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Sat:1-4:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', '', '', '', '2cbbb32d97d24454ece602f6c74cbae2'),
('Chris7038788512', '', 'portland', 'Chris', 'Jones', '59 Bartley Ave.', 'Ashburn', 'VA', '20147', '7038788512', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Sun:2-5:portland,Sun:5-9:portland', '2nd:Sun:2-5:portland,5th:Sun:5-9:portland', '', '', 'ec25c28bd70ba2c3c86c1a54d23e790c'),
('Jeannie7037970345', '', 'portland', 'Jeannie', 'Jones', '120 E. Cummonwealth Dr.', 'Ashburn', 'VA', '20147', '7037970345', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Wed:9-12:portland', 'even:Wed:9-12:portland', '', '', '8afcde7f894dc6d2e517401b23e74ee8'),
('Pam7035137117', '15-10-16', 'portland', 'Pam', 'Jones', '209 Emerald Drive', 'Ashburn', 'VA', '20147', '7035137117', 'cell', '', '', '09111967', 'jonesey@yahoo.com', 'Hannaford', 'Accountant', '', 'internet', '', '', 'Knows how to make Christmas wreaths', 'no', 'volunteer', '', '', 'active', 'Sun:2-5:portland', '', '', '', '986a5f53a205095786a0f33e5831ff49'),
('Robin7037510984', '', 'portland', 'Robin', 'Jones', '30 Derby Lane', 'Ashburn', 'VA', '20147', '7037510984', '', '', '', '55-05-12', 'jonesey@yahoo.com', 'email', 'Retired', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Tue:12-3:portland,Thu:12-3:portland,Mon:3-6:portland', ',odd:Mod:3-6:portland', '', '', '7d60e21e6a90587d75a4b8e18738d426'),
('Caitlin7037455445', '15-06-24', 'portland', 'Caitlin', 'Jones', '757 Main Street, Unit 65', 'Ashburn', 'VA', '20147', '7037455445', '', '', '', '', 'jonesey@yahoo.com', 'R. M. Davis, Inc.', 'Senior Portfolio Administrator', '', 'other', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Sat:10-1:portland,Sat:1-4:portland,Sun:2-5:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland,Fri:6-9:portland', '', '', '', '66912f70c5dfdaac2fa5bfbab9f3c669'),
('Suzanne7037018778', '', 'portland', 'Suzanne', 'Jones', '148 Ferry Road', 'Ashburn', 'VA', '20147', '7037018778', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', 'odd:Thu:3-6:portland,odd:thu:3-6:portland,even:Fri:12-3:portland', '', '', 'a8e6c2993a52bf389379b5412a0652e2'),
('Bonnie7038999201', '', 'portland', 'Bonnie', 'Jones', '25 Nevens Street, Unit B', 'Ashburn', 'VA', '20147', '7038999201', '', '', '', '', 'jonesey@yahoo.com', 'email', 'Dan Anderson Real Estate-Office Assistant', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'LOA', 'Tue:6-9:portland', '', '', '', '6d0a2f78e069954e2027c5885897c2c9'),
('Melissa7036501479', '00-09-01', 'portland', 'Melissa', 'Jones', '101 Presidential Way', 'Ashburn', 'VA', '20147', '7036501479', '', '', '', '77-05-29', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland,Sun:5-9:portland', '3rd:Sun:2-5:portland', '', 'Mboire@rsu14.org', '43380f5ada34ce922c24bdfb334f34e7'),
('Josh7037124705', '', 'portland', 'Josh', 'Jones', '57 Moody Street', 'Ashburn', 'VA', '20147', '7037124705', '', '', '', 'XX-02-02', 'jonesey@yahoo.com', 'phone', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland,Mon:6-9:portland,Tue:6-9:portland,Thu:6-9:portland,Sun:5-9:portland', ',even:Tue:6-9:portland', '', '', '300a63930a897cdd581b1ab0fc5e7e38'),
('Seth7037746863', '', 'portland', 'Seth', 'Jones', '86 Murray St.', 'Ashburn', 'VA', '20147', '7037746863', '', '', '', 'XX-01-28', 'jonesey@yahoo.com', '', 'Security Officer', '', '', '', '', '', 'no', 'volunteer', '', '', 'former', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Sat:10-1:portland,Sat:1-4:portland,Sun:2-5:portland,Sun:5-9:portland', '', '', 'Applying for Peace Corps', '0bb61f29b3dc1f946e168fd07d2b842d'),
('Cathy7038784455', '', 'portland', 'Cathy', 'Jones', '4 Robin Lane', 'Ashburn', 'VA', '20147', '7038784455', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland', 'odd:Thu:9-12:portland', '', 'Primary phone no longer works', 'af651453e0766258da261f70183ed928'),
('Torrey7038280724', '14-11-07', 'portland', 'Torrey', 'Jones', '75 Clinton Street', 'Ashburn', 'VA', '20147', '7038280724', '', '', '', '', 'jonesey@yahoo.com', 'email', 'Social Work - Team Lead TCMHS Windham Clinic', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'LOA', 'Fri:night:portland,Sat:night:portland', '', '', '', '7d463a3d14e7238c4e12c6760c934815'),
('Peter7037991786', '', 'portland', 'Peter', 'Jones', '3 Village Lane', 'Ashburn', 'VA', '20147', '7037991786', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:12-3:portland', 'even:Mon:12-3:portland,even:Mon:12-3:portland', '', '', '9798e012ceac251e850dcf9d416a0d3d'),
('Gregory7037130502', '15-04-08', 'portland', 'Gregory', 'Jones', '1792 Pownal Rd.', 'Ashburn', 'VA', '20147', '7037130502', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'former', 'Sun:5-9:portland,Sat:night:portland', '', '', '', '76c621aab321de1a71ecad981c93da4b'),
('Lora7039853797', '15-12-01', 'portland', 'Lora', 'Jones', '6 Preston Lane', 'Ashburn', 'VA', '20147', '7039853797', 'home', '', '', '05241959', 'jonesey@yahoo.com', 'Southern Maine Health Care', 'RN', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:12-3:portland,Tue:12-3:portland', '', '', '', '1c50239f7bb1ac08e7e7df0f1de21eaf'),
('Jody7033294089', '', 'portland', 'Jody', 'Jones', '106 Spruce Street', 'Ashburn', 'VA', '20147', '7033294089', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Wed:6-9:portland,Thu:6-9:portland', 'even:Wed:6-9:portland', '', '', '2f1ebd7f36e79b85fd011c2531e2d187'),
('Marilee7034159124', '', 'portland', 'Marilee', 'Jones', '2 Serenity Dr', 'Ashburn', 'VA', '20147', '7034159124', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Wed:6-9:portland', 'odd:Wed:6-9:portland,odd:Wed:6-9:portland', '', '', '05d70e6367c16094f116c55ea538fd4c'),
('Jill7037739540', '', 'portland', 'Jill', 'Jones', '35 Woodmont St', 'Ashburn', 'VA', '20147', '7037739540', '', '', '', '', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland', 'odd:Wed:3-6:portland', '', 'Confirmed on 1/21/15 that she\'d still like to be on the sub call list', '3ce8be8d762bb0a7b72a3cc4e35ba333'),
('Annie7032831610', '', 'portland', 'Annie', 'Jones', '11 Wildwood Dr', 'Ashburn', 'VA', '20147', '7032831610', '', '', '', '58-03-02', 'jonesey@yahoo.com', '', 'Banker', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Mon:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Fri:12-3:portland', '', '', '', '505c9356fe37b5f4ef99366bc476df59'),
('Lucy7037495489', '15-12-14', 'portland', 'Lucy', 'Jones', '48 State St., #4', 'Ashburn', 'VA', '20147', '7037495489', '', '', '', '', 'jonesey@yahoo.com', 'LL Bean', 'Customer Service', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Fri:9-12:portland,Sat:10-1:portland,Sun:9-12:portland,Fri:12-3:portland,Sat:1-4:portland,Sun:2-5:portland,Fri:3-6:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland,Sun:5-9:portland', '', '', '', '3dc62acd1f085f3bca4635eedcbed841'),
('Nannette7034500012', '14-10-30', 'portland', 'Nannette', 'Jones', '67 Gary L. Maietta Parkway, #6', 'Ashburn', 'VA', '20147', '7034500012', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', '', '', '12e51412f7f9c977e51184b05a0643b1'),
('Andy and Lisa7036128001', '', 'portland', 'Andy and Lisa', 'Jones', '7 Airport Road', 'Ashburn', 'VA', '20147', '7036128001', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', '', 'Andy\'s email: buildinmaine@yahoo.com', 'ea00a1dcaef8b735eb4346b201520265'),
('Mims7036532970', '', 'portland', 'Mims', 'Jones', '24 Pearl St', 'Ashburn', 'VA', '20147', '7036532970', '', '', '', '', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'LOA', 'Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', '3rd:Sat:1-4:portland', '', 'Out until March 6, 2016--health issue', '112e3ed18e3086459e1a65aa6d10c180'),
('Whitney7039429003', '16-01-05', 'bangor', 'Whitney', 'Jones', 'RMH Bangor - 654 State Street', 'Ashburn', 'VA', '20147', '7039429003', 'work', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'manager', '', '', 'active', '', '', '', '', '1ee15b6e015bcccbda66cfbef3e14d8d'),
('AllenB7037298111', '16-01-07', 'bangor', 'AllenB', 'Jones', '42 Walini Way', 'Ashburn', 'VA', '20147', '7037298111', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'manager', '', '', 'active', '', '', '', '', '378735d54ec3054447e01c9bae0bb053'),
('Lura7039471915', '16-01-08', 'bangor', 'Lura', 'Jones', '838 State Street', 'Ashburn', 'VA', '20147', '7039471915', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Thu:9-12:bangor', ',even:Thu:9-12:bangor,odd:Thu:9-12:bangor', '', '', '8dd1ad9d415cdde0039b6a3369a0e48a'),
('Alison7037358542', '16-01-13', 'bangor', 'Alison', 'Jones', '1121 Chase Road', 'Ashburn', 'VA', '20147', '7037358542', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Thu:3-6:bangor', '', '', '', 'cc3b7b86fcb617228f7dfdf50b7cf6d9'),
('Lynn7032230934', '16-01-13', 'bangor', 'Lynn', 'Jones', '974 N Main Street', 'Ashburn', 'VA', '20147', '7032230934', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:6-9:bangor', '', '', '', '848a697d0fd69014b23e1ac241d145b5'),
('Dawn7039494119', '16-01-13', 'bangor', 'Dawn', 'Jones', '246 Potter Road', 'Ashburn', 'VA', '20147', '7039494119', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Tue:6-9:bangor,Thu:6-9:bangor', '', '', '', 'f772787a9b969bdd485010fbf5044640'),
('Mary7035540215', '16-01-13', 'bangor', 'Mary', 'Jones', '60 Washburn Street', 'Ashburn', 'VA', '20147', '7035540215', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', 'd08ffa00ab2378d5c4a597e5b87f990a'),
('Colleen7032636047', '16-01-13', 'bangor', 'Colleen', 'Jones', '272 US Rte 1', 'Ashburn', 'VA', '20147', '7032636047', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', '47cb89b4fd074f47b60131eee593fcac'),
('Bonnie7039421321', '16-01-13', 'bangor', 'Bonnie', 'Jones', '11 Olive Heights', 'Ashburn', 'VA', '20147', '7039421321', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Wed:12-3:bangor', ',odd:Wed:12-3:bangor,even:Wed:12-3:bangor', '', '', '14a96307faa22c2b9cdb9c8405993f64'),
('Carrie7033562721', '16-01-13', 'bangor', 'Carrie', 'Jones', '24 Mountainview Ave', 'Ashburn', 'VA', '20147', '7033562721', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Sun:5-9:bangor,Fri:night:bangor,Sat:night:bangor', '', '', '', '2160ded94b9c70ec2e336838908618eb'),
('Mitchell7033855315', '16-01-13', 'bangor', 'Mitchell', 'Jones', '325 Day Road', 'Ashburn', 'VA', '20147', '7033855315', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:6-9:bangor,Tue:6-9:bangor,Wed:6-9:bangor,Thu:6-9:bangor,Fri:night:bangor,Sat:night:bangor', '', '', '', '36aa802e8dd653e64c865ae6bd06603f'),
('Julie7039424211', '16-01-13', 'bangor', 'Julie', 'Jones', '69 Baldwin Drive', 'Ashburn', 'VA', '20147', '7039424211', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Tue:9-12:bangor', ',odd:Tue:9-12:bangor,even:Tue:9-12:bangor', '', '', '73a796eab53e00743a191708861e789f'),
('Lee7038253478', '16-01-13', 'bangor', 'Lee', 'Jones', '238 Swetts Pond Road', 'Ashburn', 'VA', '20147', '7038253478', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:3-6:bangor', '', '', '', '613be2386acf4da1377108c799e26029'),
('Jane7038273452', '16-01-13', 'bangor', 'Jane', 'Jones', '141 Fourth Street', 'Ashburn', 'VA', '20147', '7038273452', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:12-3:bangor', ',odd:Fri:12-3:bangor,even:Fri:12-3:bangor', '', '', 'd348759668759d9ef50ec5490dc86799'),
('Bobby7032597764', '16-01-14', 'bangor', 'Bobby', 'Jones', '7 Lookum Lane', 'Ashburn', 'VA', '20147', '7032597764', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', '675de1c85a844385993782bff90af4bd'),
('Cleveland7037358542', '16-01-13', 'bangor', 'Cleveland', 'Jones', '1121 Chase Road', 'Ashburn', 'VA', '20147', '7037358542', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Thu:3-6:bangor', '', '', '', 'd900c642ffa4642bc8cea04085a4529f'),
('Peggy7032554161', '16-01-13', 'bangor', 'Peggy', 'Jones', 'PO Box 204', 'Ashburn', 'VA', '20147', '7032554161', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', '6245ee37ce389045f6310401cc17e9b9'),
('Laurie7032597764', '16-01-14', 'bangor', 'Laurie', 'Jones', '7 Lookum Lane', 'Ashburn', 'VA', '20147', '7032597764', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', '4271cafb3744f4d92898981cf1515cf1'),
('Howard7034543455', '16-01-14', 'bangor', 'Howard', 'Jones', '11 Maple lane', 'Ashburn', 'VA', '20147', '7034543455', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', '1369afd5058a5f43cba6cc084c4ca28c'),
('MaryAnn7034543455', '16-01-14', 'bangor', 'MaryAnn', 'Jones', '11 Maple Lane', 'Ashburn', 'VA', '20147', '7034543455', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', '9a35052f703a68593d33086bcb4070b2'),
('Briana7039914355', '16-01-13', 'bangor', 'Briana', 'Jones', '67 Bald Mountain Drive', 'Ashburn', 'VA', '20147', '7039914355', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Tue:12-3:bangor', '', '', '', 'cf3b6bf891abb9c840bb4a2c2229c040'),
('Carol7034543620', '16-01-14', 'bangor', 'Carol', 'Jones', 'PO Box 177', 'Ashburn', 'VA', '20147', '7034543620', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', '427898912be29f991ec37934721b485a'),
('Stan7035540215', '16-01-13', 'bangor', 'Stan', 'Jones', '60 Washburn Street', 'Ashburn', 'VA', '20147', '7035540215', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Fri:night:bangor,Sat:night:bangor', '', '', '', '1c23d884ea1eb5fe737cbb8248a1d980'),
('Monica7037794983', '16-01-13', 'bangor', 'Monica', 'Jones', '9 Charles Street', 'Ashburn', 'VA', '20147', '7037794983', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Wed:6-9:bangor', '', '', '', '0739afb1af932fe19bf152e824ba7d88'),
('Taylor7035428000', '16-01-13', 'bangor', 'Taylor', 'Jones', '199 Woodland Drive', 'Ashburn', 'VA', '20147', '7035428000', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:9-12:bangor', '', '', '', 'e8fbc1f03504ddffc52a9e6dab5e204d'),
('Barbara7033227096', '16-01-13', 'bangor', 'Barbara', 'Jones', '566 Deerfield Drive', 'Ashburn', 'VA', '20147', '7033227096', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:12-3:bangor', ',odd:Mon:12-3:bangor,even:Mon:12-3:bangor', '', '', 'c66e48286af55f06773cd129e22e0f0d'),
('Erika7033148486', '16-01-18', 'bangor', 'Erika', 'Jones', '7 Covell Road', 'Ashburn', 'VA', '20147', '7033148486', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Thu:6-9:bangor', '', '', '', '1e6dd634573c49f9e5720ea0d3b037dc'),
('John7033172152', '15-08-28', 'portland', 'John', 'Jones', '15 Piper Rd.  K215', 'Ashburn', 'VA', '20147', '7033172152', 'home', '', '', '48-12-02', 'jonesey@yahoo.com', 'email', 'retired', '', 'internet', '', 'i\'m looking to help out.  I\'ve cooked in restaurants and am a pretty fair carpenter', '', 'no', 'volunteer,sub', '', '', 'former', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Sat:10-1:portland,Sun:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Sat:1-4:portland,Sun:2-5:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland,Fri:6-9:portland,Sun:5-9:portland,Fri:night:portland,Sat:night:portland', '', '', '', 'c09e45ecf3df377bd2d876e402574c2b'),
('Julienne7076857618', '15-10-14', 'portland', 'Julienne', 'Jones', '467 Mill Rd.', 'Ashburn', 'VA', '20147', '7076857618', 'cell', '', '', '09241987', 'jonesey@yahoo.com', 'Coast Guard', 'E3', '', 'volunteer', '', '', '', 'no', 'volunteer', '', '', 'former', 'Mon:6-9:portland', '', '', 'Coast Guard, volunteers with Juliana and Hunter', '7ff7c05c77c2ed2e605e4344da194d02'),
('Deborah7036362555', '', 'portland', 'Deborah', 'Jones', '384 Emery Mills Rd', 'Ashburn', 'VA', '20147', '7036362555', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'weekendmgr', '', '', 'active', 'Sat:10-1:portland,Sat:1-4:portland,Fri:night:portland,Sat:night:portland', '', '', '', '137471ff38f35b2fe0a1e12c06a693b1'),
('Joanne7034684170', '', 'portland', 'Joanne', 'Jones', '29 Wolcott Street', 'Ashburn', 'VA', '20147', '7034684170', '', '', '', '', 'jonesey@yahoo.com', '', 'Healthcare Consultant', '', '', '', '', '', 'no', 'volunteer,weekendmgr,sub', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland,Sun:5-9:portland', '', '', 'Volunteered previously from 2009 - 2011 (approximately)', '2f57223f78162dfece721dee0615027b'),
('Eileen7038528077', '16-01-18', 'bangor', 'Eileen', 'Jones', '2023 Dixmont Road', 'Ashburn', 'VA', '20147', '7038528077', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Sat:9-5:bangor,Sun:9-5:bangor,Fri:6-9:bangor,Sun:5-9:bangor,Fri:night:bangor,Sat:night:bangor', '', '', '', 'e70c88622f4f1e007cdcca03426e709d'),
('Sarah7038525695', '16-01-18', 'bangor', 'Sarah', 'Jones', '47 Getchell Street, Apt 3', 'Ashburn', 'VA', '20147', '7038525695', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Sat:9-5:bangor,Sun:9-5:bangor,Fri:6-9:bangor,Sun:5-9:bangor,Fri:night:bangor,Sat:night:bangor', '', '', '', '0271aed1333e0867a16893bf6ccaa707'),
('Nancy6037834573', '15-05-08', 'portland', 'Nancy', 'Jones', '119 Lesmerises Rd.', 'Ashburn', 'VA', '20147', '6037834573', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', '', 'Former guest; volunteers with daughter, Rebecca\r\n2/1/16--use cell number', '393469ca902f346003fd510d45154cb3'),
('Brian7035537619', '15-01-30', 'portland', 'Brian', 'Jones', '41 State St, Apt. 412', 'Ashburn', 'VA', '20147', '7035537619', '', '', '', '', 'jonesey@yahoo.com', '', 'Manager, the Beacon Group', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland,Sun:5-9:portland', '', '', '', '7613d40a93bac7d2e83cca5f3bb91937'),
('Margi7034152255', '', 'portland', 'Margi', 'Jones', '12 Pennyroyal Court', 'Ashburn', 'VA', '20147', '7034152255', '', '', '', 'XX-12-28', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Thu:3-6:portland,Fri:3-6:portland', ',even:Fri:3-6:portland', '', '', 'e7f1f92d6d16fd03d3e3adfa924015d8'),
('Natasha7034040029', '16-02-05', 'bangor', 'Natasha', 'Jones', '343 Elm Street', 'Ashburn', 'VA', '20147', '7034040029', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', 'internet', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Sat:9-5:bangor,Sun:9-5:bangor,Mon:6-9:bangor,Tue:6-9:bangor,Wed:6-9:bangor,Thu:6-9:bangor,Fri:6-9:bangor,Sun:5-9:bangor,Fri:night:bangor,Sat:night:bangor', ',even:Wed:6-9:bangor,odd:Wed:6-9:bangor,odd:Tue:6-9:bangor,even:Tue:6-9:bangor', '', '', 'a358628ecb2d54ee302c609d9f9ca46e'),
('Chelsea7034501874', '', 'portland', 'Chelsea', 'Jones', '142 Park Ave., Apt 10', 'Ashburn', 'VA', '20147', '7034501874', '', '', '', '', 'jonesey@yahoo.com', 'USM', 'student', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', '', '', '4902f490e39ab48b7e41b79749f0b780'),
('Debbie7035189784', '', 'portland', 'Debbie', 'Jones', '44 Maeves Way', 'Ashburn', 'VA', '20147', '7035189784', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'LOA', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland', '', '', '', 'b1442fa43811c9209eeae3fcb69bbb3c'),
('Nancy7034158150', '16-02-24', 'portland', 'Nancy', 'Jones', '392 Spring St.', 'Ashburn', 'VA', '20147', '7034158150', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', ',even:Wed:3-6:portland', '', '', '154cec3c920973efcb76997d58329970'),
('Shelby7034503205', '16-02-26', 'portland', 'Shelby', 'Jones', '35 State St., Apt 2', 'Ashburn', 'VA', '20147', '7034503205', 'cell', '', '', '', 'jonesey@yahoo.com', 'Old Port Card Works', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', '', '', '', 'a451438bdcb6c866aa310fcc91616571'),
('Glenn7039749203', '16-02-24', 'bangor', 'Glenn', 'Jones', '16 Spaulding Ln', 'Ashburn', 'VA', '20147', '7039749203', 'cell', '', '', '62-12-10', 'jonesey@yahoo.com', 'Acadia Hospital', 'Master Electrician', '', 'family', '', 'I am at age where kids are growing up and I have more free time and I believe this is a worthy charity. I don\'t have money to donate but I do have time.', '', 'no', 'volunteer,sub', 'Shift Volunteer/Weekend Manager', ',,,,,,', 'active', 'Sat:9-5:bangor,Sun:9-5:bangor,Mon:6-9:bangor,Tue:6-9:bangor,Wed:6-9:bangor,Thu:6-9:bangor,Fri:6-9:bangor,Sun:5-9:bangor,Fri:night:bangor,Sat:night:bangor', '', '', '', '7c598a4f4e1a507e9eea6b04e9ca943d'),
('Mary7038293321', '', 'portland', 'Mary', 'Jones', 'P.O. Box 308', 'Ashburn', 'VA', '20147', '7038293321', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'LOA', 'Sun:5-9:portland', '1st:Sun:5-9:portland,1st:Sun:2-5:portland', '', '', '279f14d8d57cc1f8c754983336234661'),
('Claire7033293465', '', 'portland', 'Claire', 'Jones', '16 Old Oak Way', 'Ashburn', 'VA', '20147', '7033293465', '', '', '', '', 'jonesey@yahoo.com', 'email', 'Retired ', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Sun:2-5:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland', ',odd:Mon:3-6:portland,even:Mon:3-6:portland', '', '', 'cd56cdf4c7f4d45ee692ae366ad72d27'),
('Laurie7036315036', '16-03-08', 'bangor', 'Laurie', 'Jones', '3 Crescent St.', 'Ashburn', 'VA', '20147', '7036315036', 'cell', '', '', '72-09-22', 'jonesey@yahoo.com', 'SAHM with special needs child', 'Past: Epstein Properties, EMMC,Holzwarth & Phillips', '', 'internet', '', 'I have stayed at the RMH in Portland as a parent of a child with special/medical needs several times and I also worked at Specialty Peds at EMMC in the past and have set patients up with the Bangor house. I know what an important service RMH provides to families first hand and I have been wanting to volunteer for a long time.', 'I love to cook. I have a degree in CIS and have worked in various medical and property management offices.  I am interesting in being a guest chef but could fill other needs as well-cleaning, front desk, or office work. As a comment for the question below, 20 years ago (I am 43 now)I had to go to court and pay a fine for illegal attachment of plates. I believe it was a misdemeanor.', 'no', 'volunteer,mealprep', '', '', 'active', 'Wed:9-12:bangor,Fri:12-3:bangor', '', '', '', 'ddcd5141cf41c9a200ba42da00421dd5'),
('Paul7032323414', '', 'portland', 'Paul', 'Jones', '665 Saco St. #242', 'Ashburn', 'VA', '20147', '7032323414', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Sun:2-5:portland,Sun:5-9:portland', '1st:Sun:5-9:portland,1st:Sun:5-9:portland', '', '', '75cefb5cd1ba09a05af19225f0fba040'),
('Jennifer7038926916', '15-04-24', 'portland', 'Jennifer', 'Jones', '196 Sebago Lake Road', 'Ashburn', 'VA', '20147', '7038926916', '', '', '', '', 'jonesey@yahoo.com', '', 'Voice actor', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', '', '', '10a0e29e910354388a3298196bfe0521'),
('Lisa7036128001', '16-04-05', 'portland', 'Lisa', 'Jones', '7 Airport Road', 'Ashburn', 'VA', '20147', '7036128001', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', 'Shift Volunteer/Weekend Manager', ',,,,,,', 'active', 'Fri:night:portland,Sat:night:portland', '', '', '', '99e3697ecb601eb7e03b368df89e3ebb'),
('Gil and Bonnie7037820198', '', 'portland', 'Gil and Bonnie', 'Jones', '88 Hillside Avenue', 'Ashburn', 'VA', '20147', '7037820198', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'former', 'Fri:night:portland', '', '', '', '711b21753d967eb29e40f6bae96cee93');
INSERT INTO `dbPersons` (`id`, `start_date`, `venue`, `first_name`, `last_name`, `address`, `city`, `state`, `zip`, `phone1`, `phone1type`, `phone2`, `phone2type`, `birthday`, `email`, `employer`, `position`, `credithours`, `howdidyouhear`, `commitment`, `motivation`, `specialties`, `convictions`, `type`, `screening_type`, `screening_status`, `status`, `availability`, `schedule`, `hours`, `notes`, `password`) VALUES
('Vida7032294221', '', 'portland', 'Vida', 'Jones', 'P.O Box 249', 'Ashburn', 'VA', '20147', '7032294221', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr,sub', '', '', 'active', 'Thu:9-12:portland,Fri:night:portland,Sat:night:portland', '', '', '', '28a297f971f88d45d784c69c7319afaf'),
('Linda7037358701', '16-01-13', 'bangor', 'Linda', 'Jones', '2 University Place', 'Ashburn', 'VA', '20147', '7037358701', 'home', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Wed:9-12:bangor', ',odd:Wed:9-12:bangor,even:Wed:9-12:bangor', '', '', '96c645ba7a539b5d8555aebfa0a43743'),
('Jim7035901566', '16-04-13', 'portland', 'Jim', 'Jones', '12 Tibbettes Lane', 'Ashburn', 'VA', '20147', '7035901566', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'sub', '', '', 'active', 'Fri:night:portland,Sat:night:portland', '', '', '', '73d3a94e8f48e614361c07ec00094850'),
('Jennifer7038527724', '16-04-19', 'bangor', 'Jennifer', 'Jones', '36 January Lane', 'Ashburn', 'VA', '20147', '7038527724', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Tue:3-6:bangor,Wed:3-6:bangor', ',odd:Tue:3-6:bangor,even:Tue:3-6:bangor', '', '', '94b3b2210e675d8dafbc4eb9393a6ebc'),
('Kyle7034490069', '', 'portland', 'Kyle', 'Jones', '2 Summer St., Apt 2a', 'Ashburn', 'VA', '20147', '7034490069', '', '', '', '', 'jonesey@yahoo.com', '', 'Coffee roaster/owner', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Thu:6-9:portland', '', '', '', '0d14d701289477afe66414fec973e4b5'),
('Tara7033564045', '16-01-18', 'bangor', 'Tara', 'Jones', '37 Knox Avenue', 'Ashburn', 'VA', '20147', '7033564045', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Sat:9-5:bangor,Sun:9-5:bangor,Fri:6-9:bangor,Sun:5-9:bangor,Fri:night:bangor,Sat:night:bangor', '', '', '', '9a7f05710c544d139364841e797b1052'),
('Carlene7032634838', '16-05-02', 'bangor', 'Carlene', 'Jones', '39 Gooch Mill Road', 'Ashburn', 'VA', '20147', '7032634838', 'cell', '', '', '50-10-04', 'jonesey@yahoo.com', 'Sunrise County Economic Councill', 'Finance Manager ', '', 'volunteer', '', 'I have been at the Ronald McDonald House when we were in need. I feel I could be of help.', 'Speak French. Handled small school offices, been in business and love hospitality.', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Sat:9-5:bangor,Sun:9-5:bangor,Sun:5-9:bangor,Fri:night:bangor,Sat:night:bangor', '', '', '', 'c6a230a04ef2182d0f16d732cf199586'),
('Meg7037298111', '', 'portland', 'Meg', 'Jones', '42 Walini Way', 'Ashburn', 'VA', '20147', '7037298111', '', '', '', 'XX-01-01', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,weekendmgr', '', '', 'active', 'Thu:12-3:portland', 'even:Fri:12-3:portland,even:Thu:12-3:portland', '', '', '378735d54ec3054447e01c9bae0bb053'),
('Thorne7034439654', '09-09-09', 'portland', 'Thorne', 'Jones', '37 Oak St', 'Ashburn', 'VA', '20147', '7034439654', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Thu:12-3:portland', 'odd:Thu:12-3:portland,even:Thu:12-3:portland', '', 'On leave until April 2016', '8cf9e3b47f5a0074d28e4c851acde3f9'),
('Shannon7039912298', '16-06-02', 'bangor', 'Shannon', 'Jones', '56 Nolan Road', 'Ashburn', 'VA', '20147', '7039912298', 'cell', '', '', '09051997', 'jonesey@yahoo.com', 'Husson University', 'student', '40', 'internet', '', 'I\'ve always been looking to help and get involved and RMHC seemed like a welcoming place.', 'I\'ve volunteered through the guest chef program at RMHC in high school, and volunteered at EMMC for 1 year.', 'no', 'volunteer', '', '', 'active', 'Thu:9-12:bangor,Thu:12-3:bangor', ',odd:Thu:12-3:bangor,even:Thu:12-3:bangor', '16-06-02:1300-1500:2,16-06-09:1200-1500:3,16-06-16:1200-1500:3,16-06-23:1200-1500:3,16-06-30:1200-1500:3,16-07-14:1200-1500:3,16-07-21:1200-1500:3,16-07-28:1200-1500:3,16-08-04:1200-1500:3,16-08-11:1200-1500:3,16-08-25:1200-1500:3', '', 'd527ead2b66a4721ec175fa882742ad3'),
('Nancy7032210332', '16-06-02', 'portland', 'Nancy', 'Jones', '25 Henley St', 'Ashburn', 'VA', '20147', '7032210332', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland', 'odd:Thu:3-6:portland', '', '', '6535ee59265839f22d8b8467ba3491d3'),
('Daniel7032330196', '16-05-23', 'portland', 'Daniel', 'Jones', '59 West St', 'Ashburn', 'VA', '20147', '7032330196', 'cell', '', '', '07071947', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Tue:6-9:portland,Thu:6-9:portland', ',odd:Tue:6-9:portland', '', '', 'f39c5e340d62e7bca7802f75ce35c687'),
('Matt7034786952', '16-01-13', 'bangor', 'Matt', 'Jones', '1434 Ohio Street, #4', 'Ashburn', 'VA', '20147', '7034786952', 'cell', '', '', '', 'jonesey@yahoo.com', 'RSU #64', 'Guidance Counselor', '16-05-01:1700-2130:4.5', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Sun:5-9:bangor,Fri:night:bangor,Sat:night:bangor', '', '16-05-01:1700-2130:4.5', '', '7336b5b188fe5b0f8868c248dc7d50b2'),
('Michael7036590314', '16-06-02', 'bangor', 'Michael', 'Jones', '13 Page Pl', 'Ashburn', 'VA', '20147', '7036590314', 'cell', '', '', '96-11-11', 'jonesey@yahoo.com', 'Colby College', 'student', '', 'family', '', 'My mother works in healthcare, and told me that the Ronald McDonald house is a really worthwhile place to volunteer. I want to help the community while I am on summer break from college.', 'I\'ve worked carpentry before.', 'no', 'volunteer', '', '', 'active', 'Tue:12-3:bangor,Wed:12-3:bangor,Thu:12-3:bangor,Tue:3-6:bangor,Wed:3-6:bangor,Thu:3-6:bangor', '', '', '', 'a722f944018fe05fc24e1fc616a2bcfa'),
('Patti7037769081', '16-05-09', 'portland', 'Patti', 'Jones', '71 Cross Hill Rd', 'Ashburn', 'VA', '20147', '7037769081', '', '', '', '67-05-17', 'jonesey@yahoo.com', 'IDEXX', 'Business Operations', '', 'internet', '', 'IDEXX provides two paid days to volunteer in our community.  My colleagues and I would like to do something together.  We would love to come an prepare dinner for your families.  There are five of us in total.', '', 'no', 'mealprep', '', '', 'active', '', '', '', '', '34b5752bd20f90114344a07128084c4b'),
('alisa7037710814', '16-06-02', 'portland', 'alisa', 'Jones', '100 middle st', 'Ashburn', 'VA', '20147', '7037710814', 'work', '', '', '', 'jonesey@yahoo.com', 'Morgan Stanley', 'Branch Manager\'s Assistant', '', 'family', '', 'Morgan Stanley has a firm wide global volunteer month during the month of June. I would like to have a group of volunteers help out one day in June.', '', 'no', 'mealprep,events', '', '', 'active', 'Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland', '', '', '', '644bcb72ae9414838cbb2f99ea2057a7'),
('Linda7037568845', '', 'portland', 'Linda', 'Jones', '40 Whitney Avenue', 'Ashburn', 'VA', '20147', '7037568845', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Sat:10-1:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Sat:1-4:portland,Sun:2-5:portland,Tue:3-6:portland,Wed:3-6:portland,Fri:3-6:portland,Tue:6-9:portland,Wed:6-9:portland', '', '', '', 'adfe056ca1f53a201ddd7c924562fcac'),
('Marjorie7032328434', '16-05-19', 'portland', 'Marjorie', 'Jones', '20 Woodville Rd', 'Ashburn', 'VA', '20147', '7032328434', 'cell', '', '', '12-29-52', 'jonesey@yahoo.com', '', 'student', '', 'internet', '', 'I have been a nurse for 40 years, I am also a cancer survivor. I would like to contribute to my community.', '', 'no', 'volunteer,sub,events', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Thu:3-6:portland,Fri:3-6:portland,Mon:6-9:portland,Tue:6-9:portland,Wed:6-9:portland,Thu:6-9:portland,Fri:6-9:portland,Sun:5-9:portland', ',odd:Thu:12-3:portland', '', 'job shadowing', 'd25600339ffd5853961ef5d4ee8508f2'),
('Hannah7036109735', '16-06-02', 'bangor', 'Hannah', 'Jones', '36 Comins Lane', 'Ashburn', 'VA', '20147', '7036109735', 'cell', '', '', '11181997', 'jonesey@yahoo.com', 'Michigan State University', 'student', '', 'family', '', 'I\'m always looking for a way to help out and get involved, this seemed like a great place.', 'Volunteer at EMMC for 2 summers: hotline, registration, kitchen &amp; hospitality', 'no', 'volunteer', '', '', 'active', 'Thu:12-3:bangor', ',odd:Thu:12-3:bangor,even:Thu:12-3:bangor', '16-06-02:1300-1500:2,16-06-09:1200-1500:3,16-06-16:1200-1500:3,16-06-23:1200-1500:3,16-06-30:1200-1500:3,16-07-21:1200-1500:3,16-07-28:1200-1500:3,16-08-04:1200-1500:3,16-08-11:1200-1500:3,16-08-18:1200-1500:3', '', 'f70845b881fef6b8c0d9f67885fa6874'),
('Nonie7037812392', '16-06-23', 'portland', 'Nonie', 'Jones', '38 Johnson Rd', 'Ashburn', 'VA', '20147', '7037812392', '', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:6-9:portland', '', '', '', '01ec00d2547fa0b1e5b7ff0de4b5878e'),
('Meg7039395058', '', 'portland', 'Meg', 'Jones', '35 Blueberry Fields', 'Ashburn', 'VA', '20147', '7039395058', '', '', '', '', 'jonesey@yahoo.com', 'email', '', '', '', '', '', '', 'no', 'volunteer,sub', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Mon:12-3:portland,Tue:12-3:portland,Wed:12-3:portland,Thu:12-3:portland,Fri:12-3:portland,Mon:3-6:portland,Tue:3-6:portland,Wed:3-6:portland,Thu:3-6:portland,Fri:3-6:portland', ',odd:Thu:9-12:portland,even:Fri:9-12:portland', '', '', '9435b4dbd80bfa89cccaef0bd121b019'),
('Cassandra7039445038', '16-06-20', 'bangor', 'Cassandra', 'Jones', '3 Cynthia Circle', 'Ashburn', 'VA', '20147', '7039445038', 'cell', '', '', '', 'jonesey@yahoo.com', 'Husson University', 'student', '', 'other', '', '', 'CNA &amp; BLS Ceritifications', 'no', 'volunteer', '', '', 'active', 'Thu:3-6:bangor', ',odd:Thu:3-6:bangor,even:Thu:3-6:bangor', '', '', '381d1ee69292f06053419b4d9ea87c7e'),
('Hannah7034159484', '16-01-13', 'bangor', 'Hannah', 'Jones', '21st Street, Apt. 2', 'Ashburn', 'VA', '20147', '7034159484', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'former', 'Thu:3-6:bangor', '', '', '', '151ff0704219e0b7fe480a89cb78aaea'),
('Michael7038585032', '16-02-10', 'portland', 'Michael', 'Jones', '837 congress st apt 3', 'Ashburn', 'VA', '20147', '7038585032', 'cell', '', '', '92-07-02', 'jonesey@yahoo.com', 'Smcc', 'student', '', 'other', '', 'When I was younger my family would stay while my sister was getting her treatment. I spent lots of time just enjoying family time and I have always wanted to give back.', 'Photography, I am a Veteran, Record collecting, Reading and playing board games.', 'no', 'volunteer', 'Shift Volunteer/Weekend Manager', '2/16/16,,,,,,', 'LOA', 'Mon:9-12:portland', '', '', 'last emailed on 3/24/16', 'dabe59d50c316cc1b4fd0dc1e38b4538'),
('Michelle7032454626', '16-02-16', 'portland', 'Michelle', 'Jones', '271 Brackett St APT 2', 'Ashburn', 'VA', '20147', '7032454626', 'cell', '', '', '89-09-12', 'jonesey@yahoo.com', 'LANCO INTEGRATED', 'Engineering Assistant', '', 'other', '', 'I have recently spent the past 7 months of my life working 70+ hours a week and only focusing on myself. My life was filled with superficial things that left me with nothing in the end. I kind of broke down at the end, and realized that I needed to change my life. I need to be less selfish and get involved in the community that I live in. I want to grow with Portland, and I believe that involving myself in places where I can give a helping hand, will make me feel more at home in this city.', 'I am a perfectionist- I like to organize and plan every details of my life.\r\nInterpersonal skills- I am very good with people and I enjoy meeting all kinds of people.', 'no', 'volunteer,events', 'Shift Volunteer/Weekend Manager', '21/6/16,,,,,,', 'LOA', 'Mon:9-12:portland', '', '', 'needs a second job shadow and last emailed on 5/24/16', 'a24f0d26e6f982bca6b314d4aee96c34'),
('Catherine7034083158', '16-02-17', 'portland', 'Catherine', 'Jones', '7 Marston St.', 'Ashburn', 'VA', '20147', '7034083158', 'cell', '', '', '', 'jonesey@yahoo.com', 'Ledgewood Manor', 'RN', '', 'internet', '', '', '', 'no', 'volunteer', 'Shift Volunteer/Weekend Manager', '2/17/16,,,,,,', 'LOA', 'Sat:10-1:portland,Sat:1-4:portland', '', '', 'last emailed on 3/23/16', 'd950cf137f000bacf2ca1dc115778f8c'),
('Kate7038381537', '16-03-05', 'portland', 'Kate', 'Jones', '88 Main St', 'Ashburn', 'VA', '20147', '7038381537', 'cell', '', '', '06251963', 'jonesey@yahoo.com', 'Self', 'Insurance Broker', '', 'other', '', 'Our family is involved with community service through our son\'s school, Hyde in Bath. We are doing this as a one-time event. We may do other things but this is seporate for now.', 'Ability to cook meals.', 'no', 'mealprep', '', '', 'LOA', '', '', '', '', '6353f445ed719efd955d84f3174e3aca'),
('Wes7037399331', '16-03-09', 'portland', 'Wes', 'Jones', '25 green st', 'Ashburn', 'VA', '20147', '7037399331', 'cell', '', '', '11-11-66', 'jonesey@yahoo.com', 'Western Maine Healthcare', 'OT', '', 'family', '', 'My sister spent time there with her son and was very impressed with the accommodations and staff.  My son is a freshman and will need to get involved in the community, volunteering will be a valuable experience for him.', '', 'no', 'weekendmgr', '', '', 'LOA', 'Fri:night:portland,Sat:night:portland', '', '', 'last emailed on 03/30/16', 'ede07c89fb8606304e8030364f4769fd'),
('Marie7032426867', '16-04-05', 'portland', 'Marie', 'Jones', '16 Hillcrest St', 'Ashburn', 'VA', '20147', '7032426867', 'cell', '', '', '82-10-05', 'jonesey@yahoo.com', 'Childrens center', 'SB BHP Ed Tech ', '', 'volunteer', '', 'Family and friends have received services and I want to give back.', '', 'no', 'mealprep', '', '', 'LOA', '', '', '', 'last emailed in April 2016', '247c77ebdb0447bb9648e597e80d6ef9'),
('Lorraine (Lorrie)7036935556', '16-04-06', 'portland', 'Lorraine (Lorrie)', 'Jones', '121 Dunton Road', 'Ashburn', 'VA', '20147', '7036935556', 'home', '', '', '64-05-24', 'jonesey@yahoo.com', 'N/A', 'Retired', '', 'internet', '', 'For a large portion of my career, I was involved in the designing, building and opening of cancer center and other health care facilities.  After witnessing (and experiencing) the fear and anxiety associated with health-care matters, I would love to be able to contribute in any way to allaying those emotions so family can focus on family and less so on logistics.  I have always thought the Ronald McDonald House concept to be an amazing and compassionate one and would like to be able to help, if possible.', 'My hobbies include gardening, crocheting, reading and cooking.  \r\nI am a volunteer (and was an interim staff member) at the local library. \r\nOne of my past positions was as Facilities Manager for one of the cancer centers I was involved in (as noted above).', 'no', 'volunteer', '', '', 'LOA', 'Mon:9-12:portland', '', '', 'last emailed in April 2016', '8f51210125603222875a22324c3cc15c'),
('Monica7034599236', '16-05-09', 'portland', 'Monica', 'Jones', '133 Keswick Rd', 'Ashburn', 'VA', '20147', '7034599236', 'cell', '', '', '92-08-06', 'jonesey@yahoo.com', 'Woodfords Family Services ', 'Teacher Assistant ', '', 'internet', '', 'I enjoy working with children, am looking for an opportunity to volunteer, and this would be great! I would love to feel like I was helping families in anyway.', 'I work with kids, love hiking and being active and recent got an award for always having a smile on my face!', 'no', 'volunteer', '', '', 'LOA', 'Tue:6-9:portland,Wed:6-9:portland', '', '', 'trying to set up a time to meet. emailed multiple times.', '69d4a9a3d9b358c7d6a2b40eb0649d38'),
('Amanda7032051750', '16-06-20', 'bangor', 'Amanda', 'Jones', '283 Elm St', 'Ashburn', 'VA', '20147', '7032051750', 'cell', '', '', '80-05-08', 'jonesey@yahoo.com', 'none', '', '', 'family', '', 'I would love to help make a family feel welcomed,comfortable,and supported during the difficult time they are experiencing.I have an adopted special needs child that their biological parents had been supported by the Ronald McDonald house and it would be amazing to be involved this opportunity.It would be an honor.I very much enjoy cooking and being a host. I\'m a mother of six children and enjoyed every min. of that busy environment and catering to all their needs they had.I\'m a very patient person whom is very detailed and motivated.I take pride in the work I do and feel that I could be a great addition to your program.Even though I enjoy cooking I would be willing to be involved in any other task that I was asked to complete. Be part of a team is willingness to help with all aspects of the program if necessary.', 'I used to clean for hotels. I did make dishes for the restaurant I worked at for 6 years.As well as running the restaurant and managing the other staff 5-6 days a week. I  love children and would love to be part of the healing process and making a difference in the families whom are involved in your program.', 'no', 'volunteer,sub,mealprep', '', '', 'active', 'Mon:9-12:bangor,Mon:3-6:bangor,Tue:3-6:bangor,Wed:3-6:bangor,Thu:3-6:bangor,Fri:3-6:bangor,Mon:6-9:bangor,Tue:6-9:bangor,Wed:6-9:bangor,Thu:6-9:bangor,Fri:6-9:bangor,Sun:5-9:bangor', ',odd:Fri:3-6:bangor,even:Fri:3-6:bangor', '', '', '1896e7f59c4c55d1be3de28e8afff9d9'),
('Sara7036594431', '16-07-13', 'bangor', 'Sara', 'Jones', '60 Moosehead Blvd', 'Ashburn', 'VA', '20147', '7036594431', 'cell', '', '', '86-05-09', 'jonesey@yahoo.com', 'Beal College', 'student', '', 'other', '', 'Enjoy helping people and would like to help make families stay easier.', 'Baking, word, phones, crafts', 'no', 'volunteer,weekendmgr,sub', '', '', 'active', 'Tue:9-12:bangor,Thu:9-12:bangor,Fri:9-12:bangor,Sat:9-5:bangor,Sun:9-5:bangor,Tue:12-3:bangor,Thu:12-3:bangor,Fri:12-3:bangor', ',odd:Fri:9-12:bangor,even:Fri:9-12:bangor,odd:Tue:12-3:bangor', '', '', 'abaf16e0f494eb8d066d8c3a7cf49a08'),
('Zach7035385885', '16-07-20', 'bangor', 'Zach', 'Jones', '83 Longwood Drive', 'Ashburn', 'VA', '20147', '7035385885', 'cell', '', '', '92-10-21', 'jonesey@yahoo.com', 'University of Southern Maine', 'student', '', 'family', '', 'Great opportunity to get involved in an awesome cause.', '', 'no', 'volunteer', '', '', 'active', 'Thu:3-6:bangor,Thu:6-9:bangor', '', '', '', '67af3bba5a67ac2c89552583140c0b73'),
('Carly7039654835', '16-06-28', 'portland', 'Carly', 'Jones', '66 Wells Road', 'Ashburn', 'VA', '20147', '7039654835', 'cell', '', '', '', 'jonesey@yahoo.com', '', '', '', 'family', '', 'I am very interested in getting involved with the Ronald McDonald House because I am very passionate about helping others. My background is in social work, as well as fundraising, so in addition to giving back to my community, I am interested in connecting with folks professionally since I am new to the area.', '', 'no', 'volunteer,sub,events', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sat:1-4:portland,Sun:2-5:portland,Mon:6-9:portland', '', '', 'called on 7/7/16 to set up a time to meet.', '90b2be79aa734a005a9420580a5820a7'),
('April7038075431', '16-06-06', 'portland', 'April', 'Jones', '189 Spring St', 'Ashburn', 'VA', '20147', '7038075431', 'cell', '', '', '08-31-73', 'jonesey@yahoo.com', 'ASG Risk Management', 'Claims Manager', '16-06-01:1800-2100:3,16-05-27:1200-1500:3,16-06-07:1800-2100:3,16-06-15:1230-1330:1,16-06-21:1800-2100:3,16-06-22:1200-1300:1,16-07-05:1800-2100:3,16-07-15:1700-1800:1,16-07-17:1700-1830:1.5,16-07-19:1800-2030:2.5,16-07-20:1230-1330:1,16-07-27:1630-1800:1.5,16-07-31:1330-1830:5,16-08-02:1800-2100:3,16-08-07:1600-1800:2', 'volunteer', '', '', '', 'no', 'volunteer,sub,mealprep,events', '', '', 'active', 'Sat:10-1:portland,Sun:9-12:portland,Sun:2-5:portland,Mon:3-6:portland,Tue:3-6:portland,Fri:3-6:portland,Mon:6-9:portland,Tue:6-9:portland,Fri:6-9:portland,Sun:5-9:portland', ',even:Tue:6-9:portland', '16-06-01:1800-2100:3,16-05-27:1200-1500:3,16-06-07:1800-2100:3,16-06-15:1230-1330:1,16-06-21:1800-2100:3,16-06-22:1200-1300:1,16-07-05:1800-2100:3,16-07-15:1700-1800:1,16-07-17:1700-1830:1.5,16-07-19:1800-2030:2.5,16-07-20:1230-1330:1,16-07-27:1630-1800:1.5,16-07-31:1330-1830:5,16-08-02:1800-2100:3,16-08-07:1600-1800:2', '', '340392d4c35f1399b0056739a63606be'),
('VolunteerB7037806282', '17-07-23', 'bangor', 'VolunteerB', 'Jones', '1 Gum Tree Rd', 'Ashburn', 'VA', '20147', '7037806282', '', '', '', '', 'VolunteerB@yahoo.com', '', '', '', '', '', '', '', 'no', 'volunteer', '', '', 'active', 'Mon:9-12:bangor', '', '', '', 'e0057e755220561c46f751cdf8b5cfdd'),
('Allen7037298111', '', 'portland', 'Allen', 'Jones', '42 Walini Wy', 'Ashburn', 'VA', '20147', '7037298111', '', '', '', '', 'jonesey@yahoo.com', '', '', '17-07-17:1300-1700:4', '', '', '', '', 'no', 'manager', '', '', 'active', 'Mon:9-12:portland', '', '17-07-17:1300-1700:4', '', '378735d54ec3054447e01c9bae0bb053'),
('Volunteer7037806282', '16-05-30', 'portland', 'Volunteer', 'Jones', '38 Johnson Rd.', 'Ashburn', 'VA', '20147', '7037806282', '', '', '', '', 'jonesey@yahoo.com', 'Self-employed', '', '10/02/15:1715-1215:19,17-07-29:0130-0830:7', 'other', '', 'I have been for a very long time.', '', 'no', 'volunteer', '', '', 'active', 'Mon:9-12:portland,Tue:9-12:portland,Wed:9-12:portland,Thu:9-12:portland,Fri:9-12:portland,Sat:10-1:portland,Sun:9-12:portland', '', '10/02/15:1715-1215:19', '', 'b0a1106545a55c00405102dca2390cf0'),
('Admin7037806282', '17-07-26', 'portland', 'Admin', 'Jones', '1 Gum Tree Rd', 'Ashburn', 'VA', '20147', '7037806282', '', '7037806282', '', '', 'admin@yahoo.com', '', '', '', '', '', '', '', 'no', 'manager', '', '', 'active', '', '', '', '', 'be6bef2c7a57bead38826deed4077d03'),
('Micaela2083365478', '18-06-26', 'portland', 'Micaela', 'de Loyola-Carkin', 'Idaho Ronald McDonald House', 'Boise', 'ME', '12345', '2083365478', 'work', '', '', '', '', '', '', '', '', '', '', '', 'no', 'manager', '', '', 'active', '', '', '', '', 'e21ff257d2f0854e57da564a4d561f61'),
('Allen1111111111', '19-05-25', 'portland', 'Allen', 'applicant', '2 see breeze', 'bluffton', 'ME', '12345', '1111111111', '', '', '', '', '', '', '', '', '', '', '', '', 'no', '', '', '', 'applicant', '', '', '', '', '25d2812e404188360fc6ff9d16788545');

-- --------------------------------------------------------

--
-- Table structure for table `dbSCL`
--

CREATE TABLE `dbSCL` (
  `id` char(25) NOT NULL,
  `persons` text,
  `status` text,
  `vacancies` text,
  `time` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dbShifts`
--

CREATE TABLE `dbShifts` (
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
-- Dumping data for table `dbShifts`
--

INSERT INTO `dbShifts` (`id`, `start_time`, `end_time`, `venue`, `vacancies`, `persons`, `removed_persons`, `sub_call_list`, `notes`) VALUES
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
-- Table structure for table `dbWeeks`
--

CREATE TABLE `dbWeeks` (
  `id` char(20) NOT NULL,
  `dates` text,
  `venue` text,
  `status` text,
  `name` text,
  `end` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dbWeeks`
--

INSERT INTO `dbWeeks` (`id`, `dates`, `venue`, `status`, `name`, `end`) VALUES
('22-01-24:portland', '22-01-24:portland*22-01-25:portland*22-01-26:portland*22-01-27:portland*22-01-28:portland*22-01-29:portland*22-01-30:portland', 'portland', 'archived', 'January 24, 2022 to January 30, 2022', 1643587199),
('22-01-31:portland', '22-01-31:portland*22-02-01:portland*22-02-02:portland*22-02-03:portland*22-02-04:portland*22-02-05:portland*22-02-06:portland', 'portland', 'unpublished', 'January 31, 2022 to February 6, 2022', 1644191999);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dbDates`
--
ALTER TABLE `dbDates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbLog`
--
ALTER TABLE `dbLog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbSCL`
--
ALTER TABLE `dbSCL`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbShifts`
--
ALTER TABLE `dbShifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dbWeeks`
--
ALTER TABLE `dbWeeks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dbLog`
--
ALTER TABLE `dbLog`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
