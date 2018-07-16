-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: riyaduniversity
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `staff_course_association`
--

DROP TABLE IF EXISTS `staff_course_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_course_association` (
  `staff_course_id` int(11) NOT NULL,
  `org_unit_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `reports_to_staff_id` int(11) DEFAULT NULL COMMENT ' reports_to: refers to whom the staff reports.',
  `course_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL COMMENT 'role_code : refers to role associated to Staff from staff_roles table',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  PRIMARY KEY (`staff_course_id`),
  KEY `org_unit_id_idx` (`org_unit_id`),
  KEY `staff_id_idx` (`staff_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `role_code_idx` (`role_id`),
  KEY `reports_to_idx` (`reports_to_staff_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `master_course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `org_unit_id` FOREIGN KEY (`org_unit_id`) REFERENCES `organisation_units` (`organisation_unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reports_to` FOREIGN KEY (`reports_to_staff_id`) REFERENCES `master_staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `staff_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `staff_id` FOREIGN KEY (`staff_id`) REFERENCES `master_staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role_code : refers to role associated to Staff from staff_roles table. reports_to: refers to whom the staff reports.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_course_association`
--

LOCK TABLES `staff_course_association` WRITE;
/*!40000 ALTER TABLE `staff_course_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_course_association` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-04 13:08:40
