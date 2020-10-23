-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: dsignweb
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `app_id` varchar(6) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `order_no` int DEFAULT NULL,
  `permission` int DEFAULT NULL,
  `order_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES ('A1','Dashbord','0','Y','/tatasky/home',0,0,NULL),('A2','Master','0','Y','/tatasky/home',0,0,NULL),('A21','Employee','A2','Y','/tatasky/viewEmployee',0,0,NULL),('A22','User','A2','Y','/tatasky/viewUser',0,0,NULL),('A23','Department','A2','Y','/tatasky/viewDepartment',0,0,NULL),('A24','Signatories','A2','Y','/tatasky/viewSignatory',0,0,NULL),('A25','Documents','A2','Y','/tatasky/viewDocuments',0,0,NULL),('A3','Contract ','0','Y','/tatasky/home',0,0,NULL),('A31','Profile','A3','Y','/tatasky/viewProfile',0,0,NULL),('A32','WorkFlow Profile','A3','Y','/tatasky/viewProfileWorkflow',0,0,NULL),('A33','Signatories','A3','Y','/tatasky/viewSignatory',0,0,NULL),('A34','Documents','A3','Y','/tatasky/viewDocuments',0,0,NULL),('A35','Contract Mngmt','A3','Y','/tatasky/viewContractType',0,0,NULL),('A36','Contract View','A3','Y','/tatasky/viewContractTypeList',0,0,NULL),('A37','Contract Review','A3','Y','/tatasky/viewContractReview',0,0,NULL),('A38','Contract Update','A3','Y','/tatasky/modifyContractTypeList',0,0,NULL),('A39','Document Approval','A3','Y','/tatasky/followupDocumentList',0,0,NULL),('A4','Workflow2','0','N','/tatasky/home',0,0,NULL),('Z1','Logout','0','Y','/tatasky/logoutSuccess',0,0,NULL);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_review`
--

DROP TABLE IF EXISTS `contract_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_review` (
  `contract_review_id` bigint NOT NULL AUTO_INCREMENT,
  `contract_review_name` varchar(50) DEFAULT NULL,
  `profile_sig_id` bigint DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT '0',
  `last_chg_by` varchar(12) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`contract_review_id`),
  KEY `profile_sig_id` (`profile_sig_id`),
  CONSTRAINT `contract_review_ibfk_1` FOREIGN KEY (`profile_sig_id`) REFERENCES `profile_signatories` (`profile_sig_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_review`
--

LOCK TABLES `contract_review` WRITE;
/*!40000 ALTER TABLE `contract_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_type`
--

DROP TABLE IF EXISTS `contract_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_type` (
  `contract_type_id` bigint NOT NULL AUTO_INCREMENT,
  `contract_type_name` varchar(500) DEFAULT NULL,
  `contract_document` varchar(500) DEFAULT NULL,
  `uploaded_contract_document` varchar(500) DEFAULT NULL,
  `signed_contract_path` varchar(1000) DEFAULT NULL,
  `uploaded_contract_path` varchar(1000) DEFAULT NULL,
  `document_id` bigint DEFAULT NULL,
  `profile_sig_id` bigint DEFAULT NULL,
  `contract_status` varchar(20) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT '0',
  `last_chg_by` varchar(12) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(10) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`contract_type_id`),
  KEY `document_id` (`document_id`),
  KEY `profile_sig_id` (`profile_sig_id`),
  CONSTRAINT `contract_type_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `contract_type_ibfk_2` FOREIGN KEY (`profile_sig_id`) REFERENCES `profile_signatories` (`profile_sig_id`),
  CONSTRAINT `FK4ekw2em4ccrwuq5hc958o5a4` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_type`
--

LOCK TABLES `contract_type` WRITE;
/*!40000 ALTER TABLE `contract_type` DISABLE KEYS */;
INSERT INTO `contract_type` VALUES (25,'Soft Cont1','TC2005281085742746.pdf','18102020234130_TC2005281085742746.pdf','#','/home/digisign/input/',NULL,13,'Y',NULL,NULL,'2020-10-18',NULL,1,NULL),(30,'Vendor Contract1','TC2005281085742746.pdf','19102020052101_TC2005281085742746.pdf','#','/home/digisign/input',NULL,13,'N','1','admin','2020-10-19','05:21:01',3,NULL);
/*!40000 ALTER TABLE `contract_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` bigint NOT NULL AUTO_INCREMENT,
  `department_code` varchar(10) DEFAULT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  `status` varchar(1) DEFAULT '0',
  `last_chg_by` varchar(12) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'IT','Information Technology','1',NULL,NULL,NULL),(2,'FINANCE','Finance','1',NULL,NULL,NULL),(3,'SCM','Supply Chain Management','1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `document_id` bigint NOT NULL AUTO_INCREMENT,
  `document_code` varchar(10) DEFAULT NULL,
  `document_name` varchar(30) DEFAULT NULL,
  `status` varchar(1) DEFAULT '0',
  `last_chg_by` varchar(12) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` VALUES (20,'VENDOR','Vendor Doc','1','2','2020-10-18',''),(21,'SOFTWARE','Software Doc','1','2','2020-10-18','');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_workflow`
--

DROP TABLE IF EXISTS `document_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_workflow` (
  `workflow_id` bigint NOT NULL AUTO_INCREMENT,
  `contract_type_id` bigint DEFAULT NULL,
  `followup` text,
  `followup_date` date DEFAULT NULL,
  `followup_by` bigint DEFAULT NULL,
  `signatories_id` bigint DEFAULT NULL,
  `mail_sent` varchar(10) DEFAULT NULL,
  `status` varchar(1) DEFAULT '0',
  `last_chg_by` varchar(12) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`workflow_id`),
  KEY `contract_type_id` (`contract_type_id`),
  KEY `signatories_id` (`signatories_id`),
  KEY `followup_by` (`followup_by`),
  CONSTRAINT `document_workflow_ibfk_1` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_type` (`contract_type_id`),
  CONSTRAINT `document_workflow_ibfk_2` FOREIGN KEY (`signatories_id`) REFERENCES `signatories` (`signatories_id`),
  CONSTRAINT `document_workflow_ibfk_3` FOREIGN KEY (`followup_by`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_workflow`
--

LOCK TABLES `document_workflow` WRITE;
/*!40000 ALTER TABLE `document_workflow` DISABLE KEYS */;
INSERT INTO `document_workflow` VALUES (27,25,'Test Page','2020-10-18',NULL,NULL,'N','Y','pavan','2020-10-18','23:44:13');
/*!40000 ALTER TABLE `document_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` bigint NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(120) DEFAULT NULL,
  `employee_code` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `mobile_no` varchar(15) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `last_chg_by` varchar(30) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Admin','MNS','malaya.sinha@samparksolutions.com','9873595976','1',1,NULL,NULL,NULL),(2,'Suresh D','Em001','sureshkumar.rajudandu@tatasky.com','9876543210','1',1,'2',NULL,NULL),(3,'Vishal Dhicholkar','Em002','Vishal.Dicholkar@tatasky.com','8976543210','1',3,'2',NULL,NULL),(5,'Virgin Almeida','Emp003','virgin.almeida@tatasky.com','9786543210','1',2,'2',NULL,NULL),(6,'Pavan Kumar Muktapuram','Emp004','pavankum@tatasky.com','96876543210','1',2,'2',NULL,NULL),(7,'Chirag Thakar','Emp005','chiragt@tatasky.com','9567843210','1',2,'2',NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (31);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_signatories`
--

DROP TABLE IF EXISTS `profile_signatories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_signatories` (
  `profile_sig_id` bigint NOT NULL AUTO_INCREMENT,
  `profile_sig_name` varchar(60) DEFAULT NULL,
  `document_id` bigint DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  `signatory_id_1` bigint DEFAULT NULL,
  `signatory_id_2` bigint DEFAULT NULL,
  `signatory_id_3` bigint DEFAULT NULL,
  `signatory_id_4` bigint DEFAULT NULL,
  `signatory_id_5` bigint DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT '0',
  `last_chg_by` varchar(12) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`profile_sig_id`),
  KEY `profile_id` (`profile_id`),
  KEY `signatory_id_1` (`signatory_id_1`),
  KEY `signatory_id_2` (`signatory_id_2`),
  KEY `signatory_id_3` (`signatory_id_3`),
  KEY `signatory_id_4` (`signatory_id_4`),
  KEY `signatory_id_5` (`signatory_id_5`),
  KEY `FKtkgmwdch6mys12bgylukiiaea` (`document_id`),
  CONSTRAINT `FKtkgmwdch6mys12bgylukiiaea` FOREIGN KEY (`document_id`) REFERENCES `document` (`document_id`),
  CONSTRAINT `profile_signatories_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles_main` (`profile_id`),
  CONSTRAINT `profile_signatories_ibfk_2` FOREIGN KEY (`signatory_id_1`) REFERENCES `signatories` (`signatories_id`),
  CONSTRAINT `profile_signatories_ibfk_3` FOREIGN KEY (`signatory_id_2`) REFERENCES `signatories` (`signatories_id`),
  CONSTRAINT `profile_signatories_ibfk_4` FOREIGN KEY (`signatory_id_3`) REFERENCES `signatories` (`signatories_id`),
  CONSTRAINT `profile_signatories_ibfk_5` FOREIGN KEY (`signatory_id_4`) REFERENCES `signatories` (`signatories_id`),
  CONSTRAINT `profile_signatories_ibfk_6` FOREIGN KEY (`signatory_id_5`) REFERENCES `signatories` (`signatories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_signatories`
--

LOCK TABLES `profile_signatories` WRITE;
/*!40000 ALTER TABLE `profile_signatories` DISABLE KEYS */;
INSERT INTO `profile_signatories` VALUES (13,'Vendor Doc1',20,13,15,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL),(14,'Software Doc1',21,14,16,NULL,NULL,NULL,NULL,'1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `profile_signatories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_main`
--

DROP TABLE IF EXISTS `profiles_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles_main` (
  `profile_id` bigint NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(50) DEFAULT NULL,
  `profile_description` varchar(50) DEFAULT NULL,
  `input_folder` varchar(50) DEFAULT NULL,
  `output_folder` varchar(50) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT '0',
  `last_chg_by` varchar(12) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_main`
--

LOCK TABLES `profiles_main` WRITE;
/*!40000 ALTER TABLE `profiles_main` DISABLE KEYS */;
INSERT INTO `profiles_main` VALUES (13,'Fin001','Finance Template','/home/digisign/input','/home/digisign/output','1',NULL,NULL,NULL),(14,'Scm001','SCM Template','/home/digisign/input','/home/digisign/output','1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `profiles_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` bigint NOT NULL,
  `role_name` varchar(25) DEFAULT NULL,
  `enabled` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'SUPER','Y'),(2,'ADMIN','Y'),(3,'UPLOADER','Y'),(4,'SIGNER','Y');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_application`
--

DROP TABLE IF EXISTS `role_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_application` (
  `role_app_id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL,
  `app_id` varchar(6) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `enabled` int DEFAULT NULL,
  PRIMARY KEY (`role_app_id`),
  KEY `role_id` (`role_id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `role_application_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_application_ibfk_2` FOREIGN KEY (`app_id`) REFERENCES `application` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_application`
--

LOCK TABLES `role_application` WRITE;
/*!40000 ALTER TABLE `role_application` DISABLE KEYS */;
INSERT INTO `role_application` VALUES (1,1,'A1','Y',1),(2,1,'A2','Y',1),(3,1,'A3','Y',1),(4,1,'A4','Y',1),(5,1,'Z1','Y',1),(6,2,'A1','Y',1),(7,2,'A2','Y',1),(8,2,'A3','Y',1),(9,2,'A4','Y',0),(10,2,'Z1','Y',1),(11,2,'A21','Y',1),(12,2,'A22','Y',1),(13,1,'A21','Y',1),(14,1,'A22','Y',1),(15,1,'A31','Y',1),(16,1,'A32','Y',1),(17,1,'A33','Y',1),(18,2,'A31','Y',1),(19,2,'A32','Y',1),(20,2,'A33','Y',1),(21,2,'A34','Y',1),(22,2,'A35','Y',1),(23,2,'A36','Y',1),(24,1,'A34','Y',1),(25,1,'A35','Y',1),(26,1,'A36','Y',1),(27,1,'A37','Y',1),(28,2,'A37','Y',1),(29,1,'A38','Y',1),(30,2,'A38','Y',1),(31,3,'A1','Y',1),(32,3,'A3','Y',1),(33,3,'Z1','Y',1),(34,3,'A35','Y',1),(35,4,'A1','Y',1),(36,4,'A3','Y',1),(37,4,'A37','Y',1),(38,4,'Z1','Y',1),(39,3,'A36','Y',1),(40,3,'A37','Y',1),(41,3,'A38','Y',1),(42,1,'A23','Y',1),(43,2,'A23','Y',1),(44,2,'A39','Y',1),(45,1,'A39','Y',1),(46,4,'A39','Y',1);
/*!40000 ALTER TABLE `role_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signatories`
--

DROP TABLE IF EXISTS `signatories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signatories` (
  `signatories_id` bigint NOT NULL AUTO_INCREMENT,
  `signatories_code` varchar(10) DEFAULT NULL,
  `signatories_name` varchar(30) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `private_key` varchar(50) DEFAULT NULL,
  `certificate_key` varchar(50) DEFAULT NULL,
  `x1` int DEFAULT NULL,
  `y1` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `last_chg_by` varchar(12) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`signatories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signatories`
--

LOCK TABLES `signatories` WRITE;
/*!40000 ALTER TABLE `signatories` DISABLE KEYS */;
INSERT INTO `signatories` VALUES (15,'Pavan','Pavan Kumar',6,'private_key','PAVAN KUMAR MUKTAPURAM',NULL,NULL,NULL,NULL,'1',NULL,NULL,'2',NULL,''),(16,'Chirag T','Chirag Thakar',7,'ct_private_key','THAKAR CHIRAG',NULL,NULL,NULL,NULL,'1',NULL,NULL,'2',NULL,'');
/*!40000 ALTER TABLE `signatories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signatories_mapping`
--

DROP TABLE IF EXISTS `signatories_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signatories_mapping` (
  `signatories_mapping_id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint DEFAULT NULL,
  `profile_sig_id` bigint DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `last_chg_by` varchar(30) DEFAULT NULL,
  `last_chg_date` date DEFAULT NULL,
  `last_chg_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`signatories_mapping_id`),
  KEY `employee_id` (`employee_id`),
  KEY `profile_sig_id` (`profile_sig_id`),
  CONSTRAINT `signatories_mapping_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `signatories_mapping_ibfk_2` FOREIGN KEY (`profile_sig_id`) REFERENCES `profile_signatories` (`profile_sig_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signatories_mapping`
--

LOCK TABLES `signatories_mapping` WRITE;
/*!40000 ALTER TABLE `signatories_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `signatories_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `bankid` varchar(25) NOT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `bank_id` varchar(25) NOT NULL,
  `bank_name` varchar(125) NOT NULL,
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `role_id` int NOT NULL,
  `enabled` int DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `enabled` varchar(10) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `fName` varchar(40) DEFAULT NULL,
  `mName` varchar(40) DEFAULT NULL,
  `lName` varchar(40) DEFAULT NULL,
  `dName` varchar(120) DEFAULT NULL,
  `mobileNo` varchar(15) DEFAULT NULL,
  `emailId` varchar(120) DEFAULT NULL,
  `employeeId` bigint DEFAULT NULL,
  `createdBy` varchar(30) DEFAULT NULL,
  `creationDate` date DEFAULT NULL,
  `modifiedBy` varchar(30) DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `id` int DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `role` tinyblob,
  `status` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `employeeId` (`employeeId`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','$2a$10$QlGBWiDyfUhuWK.MLzHy6etMFx8MuoBKaSErPQZ566JB8Gh6qYBsW','1',2,'Malaya',NULL,'Sinha','Malaya','9818061982','malaya.sinha@samparksolutions.com',1,NULL,NULL,NULL,NULL,0,NULL,NULL,'1'),(8,'suresh','$2a$10$tGIxTC2B1jwTv8IIFpmYgunMPjIhzkSbHShBDc2uoawDpNQMuBobm','1',3,'Suresh','Kumar','Raju Dandu','Suresh D','9687543210','sureshkumar.rajudandu@tatasky.com',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(9,'vishal','$2a$10$Y.csIiEUB7UrTRaoqDj7Je9hsBI9JB.ZETxhbZKGriod.822d9t4e','1',3,'Vishal','','Dhicholkar','Vishal D','987965433','vishal.dhicholkar@tatasky.com',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(10,'virgin','$2a$10$je0P3Yg3FLb0ppJi2t4ZOu.5CbEKA//WoDX3FTel.iR5LK.9/D7Dq','1',3,'Virgin','','Almeida','Virgin A','978654321','virgin.almeida@tatasky.com',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(11,'pavan','$2a$10$aGdzVPe40SjsfLTjHc3p7eh73zqPotTgSZR9Aen322OS3CmuwQgdi','1',4,'Pavan','Kumar','Muktapuram','Pavan K','9785643210','pavankum@tatasky.com',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1'),(12,'chirag','$2a$10$uz3XqBMebXY.janlzIrLpu/RM0KFHpBN.ul9yFe8NYPJ9muBDUQ6y','1',4,'Chirag','','Thakar','Chirag T','9458763210','chiragt@tatasky.com',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_log`
--

DROP TABLE IF EXISTS `users_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_log` (
  `users_log_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `STATUS` varchar(1) NOT NULL,
  `user_ip` varchar(30) NOT NULL,
  `last_by` varchar(12) DEFAULT NULL,
  `login_date` date DEFAULT NULL,
  `login_time` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`users_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_log`
--

LOCK TABLES `users_log` WRITE;
/*!40000 ALTER TABLE `users_log` DISABLE KEYS */;
INSERT INTO `users_log` VALUES (4,2,'Y','127.0.0.1','admin','2020-10-18','15:35:12'),(17,2,'Y','127.0.0.1','admin','2020-10-18','17:43:34'),(18,2,'Y','127.0.0.1','admin','2020-10-18','19:27:25'),(19,2,'Y','127.0.0.1','admin','2020-10-18','20:50:06'),(23,2,'Y','127.0.0.1','admin','2020-10-18','23:26:08'),(26,11,'Y','0:0:0:0:0:0:0:1','pavan','2020-10-18','23:43:40'),(28,2,'Y','127.0.0.1','admin','2020-10-19','05:08:50'),(29,2,'Y','127.0.0.1','admin','2020-10-19','05:11:19');
/*!40000 ALTER TABLE `users_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_role`
--

DROP TABLE IF EXISTS `users_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_role` (
  `users_role_id` bigint NOT NULL AUTO_INCREMENT,
  `users_id` bigint DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `enabled` int DEFAULT NULL,
  PRIMARY KEY (`users_role_id`),
  KEY `users_id` (`users_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_role`
--

LOCK TABLES `users_role` WRITE;
/*!40000 ALTER TABLE `users_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dsignweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-23 18:26:45
