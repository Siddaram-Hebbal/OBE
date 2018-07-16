CREATE DATABASE  IF NOT EXISTS `riyaduniversity` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `riyaduniversity`;
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
-- Table structure for table `master_course`
--

DROP TABLE IF EXISTS `master_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(135) NOT NULL,
  `courseCode` varchar(45) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_course`
--

LOCK TABLES `master_course` WRITE;
/*!40000 ALTER TABLE `master_course` DISABLE KEYS */;
INSERT INTO `master_course` VALUES (2,'Mtech','vtu_mtech_01','Post Graduation Technical Course','no','','2018-02-13',NULL,NULL,NULL,NULL),(3,'BE','BE_VTU_01','Bachelor of Engineering','no','','2018-03-16',NULL,NULL,NULL,NULL),(4,'Cardio Science','RHPT-2878','Course to get into area of Cardio Sciences','no','Admin','2018-06-06',NULL,NULL,NULL,NULL),(5,'Pathalogy','RHPT-1716','Department of Pathalogy','no','Admin','2018-06-06',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `master_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_course_learning_outcome`
--

DROP TABLE IF EXISTS `master_course_learning_outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_course_learning_outcome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `courseId` int(11) NOT NULL,
  `potId` int(11) NOT NULL,
  `clocode` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  `flag` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_course_learning_outcome`
--

LOCK TABLES `master_course_learning_outcome` WRITE;
/*!40000 ALTER TABLE `master_course_learning_outcome` DISABLE KEYS */;
INSERT INTO `master_course_learning_outcome` VALUES (1,'Should be able to describe the terminologies',2,1,'A1','Contact respective staff','no','','2018-02-27',NULL,NULL,NULL,NULL,NULL),(2,'Determine',2,1,'A2','Able to Determine the cause','no','','2018-02-27',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `master_course_learning_outcome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_organisations`
--

DROP TABLE IF EXISTS `master_organisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_organisations` (
  `organisation_id` int(11) NOT NULL,
  `organisation_name` varchar(90) DEFAULT NULL,
  `address` varchar(245) DEFAULT NULL,
  `other_details` varchar(245) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  PRIMARY KEY (`organisation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_organisations`
--

LOCK TABLES `master_organisations` WRITE;
/*!40000 ALTER TABLE `master_organisations` DISABLE KEYS */;
INSERT INTO `master_organisations` VALUES (0,'majamaah_university','address','other','no',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `master_organisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_program_outcome_type`
--

DROP TABLE IF EXISTS `master_program_outcome_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_program_outcome_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `pocode` varchar(45) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  `flag` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_program_outcome_type`
--

LOCK TABLES `master_program_outcome_type` WRITE;
/*!40000 ALTER TABLE `master_program_outcome_type` DISABLE KEYS */;
INSERT INTO `master_program_outcome_type` VALUES (1,'Knowledge','A','Assessing Knowledge of Student','no','','2018-02-27',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `master_program_outcome_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_staff`
--

DROP TABLE IF EXISTS `master_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_code` varchar(45) DEFAULT NULL,
  `first_name` varchar(90) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phoneNo` varchar(45) DEFAULT NULL,
  `address` varchar(345) DEFAULT NULL,
  `message` varchar(45) DEFAULT NULL,
  `other_details` varchar(245) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_staff`
--

LOCK TABLES `master_staff` WRITE;
/*!40000 ALTER TABLE `master_staff` DISABLE KEYS */;
INSERT INTO `master_staff` VALUES (1,'MU_STAFF_PATH_001','Siddaram','A','Hebbal','1990-12-01','on','siddaram.hebbal1@outlook.com','111111','111111111','Address','Message','Other Details','no','Admin','2018-06-15',NULL,NULL,NULL,NULL),(2,'MU_STAFF_PATH_002','Bassu','S','Chimmanchod','1989-12-03','on','basavarajminds1@gmail.com','111111','111111','111','1111','1111','no','Admin','2018-06-18',NULL,NULL,NULL,NULL),(3,'MU_STAFF_PATH_003','Sid','A','Hebbal','1988-09-09','on','siddaram.hebbal2@outlook.com','111111','111111','111','1111','1111','no','Admin','2018-06-18',NULL,NULL,NULL,NULL),(4,'MU_STAFF_PATH_004','Siddu','aa','hhh','1990-04-04','on','siddaram.hebbal3@outlook.com','111111','111111111','111111111','111111111','111111111111111','no','Admin','2018-06-18',NULL,NULL,NULL,NULL),(5,'MU_STAFF_PATH_005','raam','a','h','1990-02-02','on','siddaram.hebbal4@outlook.com','111111','111111111','1111','1111','1111','no','Admin','2018-06-18',NULL,NULL,NULL,NULL),(6,'MU_STAFF_PATH_008','siddd','aaaaaaa','hhhhhhhhhhhh','1988-03-02','on','siddaram.hebbal5@outlook.com','111111','111111111','sadasda','sadsa','asdASDA','no','Admin','2018-06-18',NULL,NULL,NULL,NULL),(7,'MU_STAFF_PATH_011','SidRAM','A','Hebbal','1990-08-09','on','siddaram.hebbal6@outlook.com','111111','111111111','sfsadf','1aredas','safasdf','no','Admin','2018-06-18',NULL,NULL,NULL,NULL),(8,'MU_STAFF_PATH_006','bassu','s','c','1998-03-04','on','siddaram.hebbal@outlook.com','111111','111111111','sdfasdf','sadsa','sdfasdfsad','no','Admin','2018-06-20',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `master_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_university`
--

DROP TABLE IF EXISTS `master_university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_university` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(135) NOT NULL,
  `registrationCode` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_university`
--

LOCK TABLES `master_university` WRITE;
/*!40000 ALTER TABLE `master_university` DISABLE KEYS */;
INSERT INTO `master_university` VALUES (1,'VTU','aicte2000vtu','9739315465','contact@vtu.ac.in','http://www.vtu.ac.in','sdafsdf','gfhggfhsdafdsafsdfsfd','no','','2018-02-08',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `master_university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisation_units`
--

DROP TABLE IF EXISTS `organisation_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation_units` (
  `organisation_unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `organisation_id` int(11) DEFAULT NULL,
  `parent_organisation_unit_id` int(11) DEFAULT NULL,
  `organisation_unit_name` varchar(80) DEFAULT NULL,
  `other_details` varchar(145) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  PRIMARY KEY (`organisation_unit_id`),
  KEY `organisation_id_idx` (`organisation_id`),
  KEY `parent_org_unit_id_idx` (`parent_organisation_unit_id`),
  CONSTRAINT `organisation_id` FOREIGN KEY (`organisation_id`) REFERENCES `master_organisations` (`organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `parent_org_unit_id` FOREIGN KEY (`parent_organisation_unit_id`) REFERENCES `organisation_units` (`organisation_unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='parent organisation unit is used to create sub_organisation_units helps in creating organisation unit hierarchy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisation_units`
--

LOCK TABLES `organisation_units` WRITE;
/*!40000 ALTER TABLE `organisation_units` DISABLE KEYS */;
INSERT INTO `organisation_units` VALUES (4,0,4,'pathology','Department of Pathology','no',NULL,NULL,NULL,NULL,NULL,NULL),(5,0,5,'cardiology','Study of Cardiology Sciences','no',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `organisation_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_course_association`
--

DROP TABLE IF EXISTS `staff_course_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_course_association` (
  `staff_course_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_unit_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `parent_staff_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `otherDetails` varchar(145) DEFAULT NULL,
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
  KEY `parent_staff_id_idx` (`parent_staff_id`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `master_course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `org_unit_id` FOREIGN KEY (`org_unit_id`) REFERENCES `organisation_units` (`organisation_unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `parent_staff_id` FOREIGN KEY (`parent_staff_id`) REFERENCES `master_staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `staff_roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `staff_id` FOREIGN KEY (`staff_id`) REFERENCES `master_staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_course_association`
--

LOCK TABLES `staff_course_association` WRITE;
/*!40000 ALTER TABLE `staff_course_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_course_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_roles`
--

DROP TABLE IF EXISTS `staff_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(45) NOT NULL,
  `role_name` varchar(60) DEFAULT NULL,
  `role_description` varchar(245) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  PRIMARY KEY (`role_id`,`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_roles`
--

LOCK TABLES `staff_roles` WRITE;
/*!40000 ALTER TABLE `staff_roles` DISABLE KEYS */;
INSERT INTO `staff_roles` VALUES (1,'RC MC MED 120','Module Coordinator','Module Coordinator for Module Code MED-120 ','no','Admin','2018-06-01',NULL,NULL,NULL,NULL),(2,'sub_coord_01','Sub Coordinator','Sub Coordinator','no','Admin','2018-06-06',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `staff_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_code`
--

DROP TABLE IF EXISTS `user_login_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `user_login_code` varchar(45) DEFAULT NULL,
  `softDelete` varchar(45) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `deletedBy` varchar(45) DEFAULT NULL,
  `deletedAt` date DEFAULT NULL,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedAt` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`user_id`),
  CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `master_staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_code`
--

LOCK TABLES `user_login_code` WRITE;
/*!40000 ALTER TABLE `user_login_code` DISABLE KEYS */;
INSERT INTO `user_login_code` VALUES (2,7,'siddaram.hebbal@outlook8.com','MU_3017_sid','no','Admin','2018-06-18',NULL,NULL,NULL,NULL),(3,8,'siddaram.hebbal@outlook.com','MU_3424_sid','no','Admin','2018-06-20',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_login_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-22 15:46:56
