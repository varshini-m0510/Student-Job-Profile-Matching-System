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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 21:27:30
