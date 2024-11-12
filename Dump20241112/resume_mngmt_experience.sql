-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: resume_mngmt
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `Experience_ID` varchar(15) NOT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Duration` varchar(50) DEFAULT NULL,
  `SRN` varchar(10) DEFAULT NULL,
  `Skill_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Experience_ID`),
  KEY `SRN` (`SRN`),
  KEY `Skill_Name` (`Skill_Name`),
  CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`SRN`) REFERENCES `student` (`SRN`),
  CONSTRAINT `experience_ibfk_2` FOREIGN KEY (`Skill_Name`) REFERENCES `skills` (`Skill_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES ('EXP00001','Tech Solutions','Software Engineer','2 years','SRN00001','Python'),('EXP00002','Innovatech','Data Analyst','1 year','SRN00002','Java'),('EXP00003','DataCorp','Project Manager','3 years','SRN00003','Data Analysis'),('EXP00004','ProjectWorks','Intern','6 months','SRN00004','Project Management'),('EXP00005','AI Labs','Machine Learning Engineer','1 year','SRN00005','Machine Learning'),('EXP00006','Web Solutions','Web Developer','8 months','SRN00006','Web Development'),('EXP00007','Cloud Services','Cloud Engineer','1.5 years','SRN00007','Cloud Computing'),('EXP00008','SecureNet','Cybersecurity Analyst','2 years','SRN00008','Cybersecurity'),('EXP00009','Design Studio','Graphic Designer','9 months','SRN00009','Graphic Design'),('EXP00010','CommWorks','Communications Manager','1 year','SRN00010','Communication');
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 21:27:30
