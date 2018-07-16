CREATE SCHEMA `riyaduniversity` ;



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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8


CREATE TABLE `riyaduniversity`.`master_program_outcome_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `pocode` VARCHAR(45) NULL,
  `description` VARCHAR(60) NULL,
  `softDelete` VARCHAR(45) NULL,
  `createdBy` VARCHAR(45) NULL,
  `createdAt` DATE NULL,
  `deletedBy` VARCHAR(45) NULL,
  `deletedAt` DATE NULL,
  `modifiedBy` VARCHAR(45) NULL,
  `modifiedAt` DATE NULL,
  `flag` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));
  	
  
  CREATE TABLE `riyaduniversity`.`master_course_learning_outcome` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `courseId` INT NOT NULL,
  `potId` INT NOT NULL,
  `clocode` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `softDelete` VARCHAR(45) NULL,
  `createdBy` VARCHAR(45) NULL,
  `createdAt` DATE NULL,
  `deletedBy` VARCHAR(45) NULL,
  `deletedAt` DATE NULL,
  `modifiedBy` VARCHAR(45) NULL,
  `modifiedAt` DATE NULL,
  `flag` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));