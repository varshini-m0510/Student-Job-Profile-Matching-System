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
-- Table structure for table `academic_details`
--

DROP TABLE IF EXISTS `academic_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_details` (
  `Degree` varchar(50) NOT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `SSC_Year` int DEFAULT NULL,
  `SSC_Percent` decimal(5,2) DEFAULT NULL,
  `HSC_Year` int DEFAULT NULL,
  `HSC_Percent` decimal(5,2) DEFAULT NULL,
  `SRN` varchar(10) NOT NULL,
  `CGPA` decimal(3,1) NOT NULL,
  PRIMARY KEY (`SRN`,`Degree`),
  CONSTRAINT `academic_details_ibfk_1` FOREIGN KEY (`SRN`) REFERENCES `student` (`SRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_details`
--

LOCK TABLES `academic_details` WRITE;
/*!40000 ALTER TABLE `academic_details` DISABLE KEYS */;
INSERT INTO `academic_details` VALUES ('B.Tech','Computer Science',2016,85.00,2018,90.00,'SRN00001',9.8),('B.Sc','Physics',2017,90.50,2019,88.50,'SRN00002',8.7),('B.Com','Commerce',2015,78.00,2017,74.00,'SRN00003',6.8),('M.Tech','Information Technology',2018,88.00,2020,92.00,'SRN00004',9.3),('MBA','Business Administration',2017,75.00,2019,80.00,'SRN00005',5.2),('BBA','Management',2016,80.00,2018,86.00,'SRN00006',6.7),('BCA','Computer Applications',2019,95.00,2021,94.00,'SRN00007',7.5),('M.Sc','Biology',2015,82.00,2017,77.00,'SRN00008',7.6),('M.Com','Commerce',2018,89.00,2020,89.00,'SRN00009',5.8),('Ph.D','Engineering',2014,76.00,2016,81.00,'SRN00010',8.8);
/*!40000 ALTER TABLE `academic_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `Achievement_Name` varchar(100) NOT NULL,
  `Description` text,
  `SRN` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Achievement_Name`),
  KEY `SRN` (`SRN`),
  CONSTRAINT `achievement_ibfk_1` FOREIGN KEY (`SRN`) REFERENCES `student` (`SRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
INSERT INTO `achievement` VALUES ('Best Intern','Recognized as the best intern of the year','SRN00003'),('Best Presentation','Gave the best presentation in a class seminar','SRN00010'),('Code Hunt Finalist','Qualified to the last round of code hunt','SRN00001'),('Coding Competition','Secured a top spot in a CodeHunt coding competition','SRN00007'),('Conference Speaker','Delivered a talk at an international conference','SRN00004'),('Dean\'s List','Included in the Dean\'s list for academic excellence','SRN00008'),('Leadership Award','Awarded for leadership in organizing university events','SRN00009'),('Project Excellence','Completed an outstanding project with distinction','SRN00005'),('Research Publication','Published a research paper in a reputed journal','SRN00006'),('Top Scorer','Achieved the highest grade in semester exams','SRN00002');
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer_login`
--

DROP TABLE IF EXISTS `employer_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer_login` (
  `Employer_ID` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`Employer_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer_login`
--

LOCK TABLES `employer_login` WRITE;
/*!40000 ALTER TABLE `employer_login` DISABLE KEYS */;
INSERT INTO `employer_login` VALUES (1,'employer1@example.com','password123'),(2,'employer2@example.com','securePass456'),(3,'employer3@example.com','welcome789'),(4,'employer4@example.com','adminAccess1'),(5,'employer5@example.com','safePassword2'),(6,'employer6@example.com','loginPassword3'),(7,'employer7@example.com','employerPass4'),(8,'employer8@example.com','myPassword5'),(9,'employer9@example.com','companyLogin6'),(10,'employer10@example.com','entrySecure7');
/*!40000 ALTER TABLE `employer_login` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `Skill_Name` varchar(100) NOT NULL,
  `Type` enum('Technical','Non-technical') DEFAULT NULL,
  `SRN` varchar(10) NOT NULL,
  PRIMARY KEY (`Skill_Name`,`SRN`),
  KEY `fk_srn` (`SRN`),
  CONSTRAINT `fk_srn` FOREIGN KEY (`SRN`) REFERENCES `student` (`SRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES ('Cloud Computing','Technical','SRN00007'),('Communication','Non-technical','SRN00010'),('Cybersecurity','Non-technical','SRN00008'),('Data Analysis','Technical','SRN00003'),('Graphic Design','Non-technical','SRN00009'),('Java','Technical','SRN00002'),('Machine Learning','Technical','SRN00005'),('Project Management','Non-technical','SRN00004'),('Python','Technical','SRN00001'),('Web Development','Technical','SRN00003'),('Web Development','Technical','SRN00006');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `skills_BEFORE_INSERT` BEFORE INSERT ON `skills` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM `skills` WHERE `SRN` = NEW.SRN AND `Skill_Name` = NEW.Skill_Name) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate skill for the same student is not allowed';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `SRN` varchar(10) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Mobile` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('SRN00001','John Doe','2000-01-01','1234567890','johndoe@example.com'),('SRN00002','Jane Smith','1999-05-15','0987654321','janesmith@example.com'),('SRN00003','Alice Johnson','1998-03-20','1231231234','alicej@example.com'),('SRN00004','Bob Brown','2001-12-05','9879879876','bobbrown@example.com'),('SRN00005','Charlie Davis','1997-07-30','4564564567','charliedavis@example.com'),('SRN00006','Diana Prince','2000-09-10','3213213210','dianaprince@example.com'),('SRN00007','Ethan Hunt','1995-11-25','6546546543','ethanhunt@example.com'),('SRN00008','Fiona Glenanne','2002-04-17','7897897890','fionag@example.com'),('SRN00009','George Weasley','1996-08-08','1112223333','georgeweasley@example.com'),('SRN00010','Hannah Baker','1999-10-22','4445556666','hannahbaker@example.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_login`
--

DROP TABLE IF EXISTS `student_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_login` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `SRN` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  KEY `SRN` (`SRN`),
  CONSTRAINT `student_login_ibfk_1` FOREIGN KEY (`SRN`) REFERENCES `student` (`SRN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_login`
--

LOCK TABLES `student_login` WRITE;
/*!40000 ALTER TABLE `student_login` DISABLE KEYS */;
INSERT INTO `student_login` VALUES ('alicej','password3','SRN00003'),('bobbrown','password4','SRN00004'),('charlied','password5','SRN00005'),('dianaprince','password6','SRN00006'),('ethanhunt','password7','SRN00007'),('fionag','password8','SRN00008'),('georgeweasley','password9','SRN00009'),('hannahbaker','password10','SRN00010'),('janesmith','password2','SRN00002'),('johndoe','password1','SRN00001');
/*!40000 ALTER TABLE `student_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_skill_academic`
--

DROP TABLE IF EXISTS `student_skill_academic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_skill_academic` (
  `Student_SRN` varchar(10) NOT NULL,
  `Academic_Degree` varchar(50) NOT NULL,
  `Skill_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Student_SRN`,`Academic_Degree`,`Skill_Name`),
  KEY `Skill_Name` (`Skill_Name`),
  CONSTRAINT `student_skill_academic_ibfk_1` FOREIGN KEY (`Student_SRN`) REFERENCES `student` (`SRN`),
  CONSTRAINT `student_skill_academic_ibfk_2` FOREIGN KEY (`Student_SRN`, `Academic_Degree`) REFERENCES `academic_details` (`SRN`, `Degree`),
  CONSTRAINT `student_skill_academic_ibfk_3` FOREIGN KEY (`Skill_Name`) REFERENCES `skills` (`Skill_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_skill_academic`
--

LOCK TABLES `student_skill_academic` WRITE;
/*!40000 ALTER TABLE `student_skill_academic` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_skill_academic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'resume_mngmt'
--

--
-- Dumping routines for database 'resume_mngmt'
--
/*!50003 DROP PROCEDURE IF EXISTS `filter_students_by_cgpa_and_skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_students_by_cgpa_and_skills`(IN min_cgpa FLOAT, IN selected_skills TEXT)
BEGIN
	SET @skills_placeholder = selected_skills;    
    SELECT s.SRN, s.Name, a.Degree, a.CGPA, GROUP_CONCAT(DISTINCT sk.Skill_Name) AS Skills
    FROM academic_details a
    JOIN student s ON a.SRN = s.SRN
    JOIN skills sk ON sk.SRN = s.SRN
    WHERE a.CGPA >= min_cgpa
    AND FIND_IN_SET(sk.Skill_Name, @skills_placeholder) > 0
    GROUP BY s.SRN, a.Degree, a.CGPA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_skills`()
BEGIN
	SELECT DISTINCT Skill_Name
    FROM skills
    ORDER BY Skill_Name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-13  0:27:03
