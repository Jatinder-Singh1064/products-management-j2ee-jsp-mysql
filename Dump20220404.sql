-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: ABCDatabase
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `name` varchar(25) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES ('admin','12345'),('Jass','123456');
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Claim`
--

DROP TABLE IF EXISTS `Claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Claim` (
  `claimid` int(11) NOT NULL AUTO_INCREMENT,
  `serialNumber` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `dateofclaim` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`claimid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Claim`
--

LOCK TABLES `Claim` WRITE;
/*!40000 ALTER TABLE `Claim` DISABLE KEYS */;
INSERT INTO `Claim` VALUES (5,'101','Broken','05/04/2021','Approved','Karan'),(6,'101','Damage','2021-04-05','Approved','Karan'),(7,'101','Damage','2021-04-05','Approved','Karan'),(8,'105','Broken','2021-04-05','Rejected','Karan'),(9,'105','Broken','2021-04-05','Pending','Karan'),(10,'120','Damage','2021-04-05','Pending','Sarbjot'),(11,'200','Damage','2021-04-05','Approved','sarbjot1'),(12,'111','Damage','2021-04-08','Pending','Karan'),(13,'210','Broken','2021-04-08','Approved','Karan');
/*!40000 ALTER TABLE `Claim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productName` varchar(45) DEFAULT NULL,
  `productModel` varchar(45) DEFAULT NULL,
  `productColor` varchar(45) DEFAULT NULL,
  `productSerialNumber` varchar(45) NOT NULL,
  `productCompany` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productSerialNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('macbook','Pro','silver','100','Apple'),('iPhone','12 ','Gold','101','Apple'),('Watch','4th Generation','Black','120','Apple'),('Pen','Gel','Blue','2021-04-05','Cello'),('TV','TCL 3','Black','210','TCL');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registeredProducts`
--

DROP TABLE IF EXISTS `registeredProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registeredProducts` (
  `login_id` varchar(45) DEFAULT NULL,
  `productname` varchar(45) DEFAULT NULL,
  `serialno` int(11) NOT NULL,
  `Purchasedate` datetime DEFAULT NULL,
  PRIMARY KEY (`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeredProducts`
--

LOCK TABLES `registeredProducts` WRITE;
/*!40000 ALTER TABLE `registeredProducts` DISABLE KEYS */;
INSERT INTO `registeredProducts` VALUES ('Sarbjot','iphone 12',100,'2021-04-01 00:00:00'),('Karan','mac',101,'2021-04-01 00:00:00'),(NULL,'macbook',104,'2021-04-05 00:00:00'),('Karan','iPhone',105,'2021-04-05 00:00:00'),('Karan','macbook',106,'2021-04-05 00:00:00'),('Karan','macbook',107,'2021-04-05 00:00:00'),('Karan','macbook',109,'2021-04-05 00:00:00'),('Karan','iPhone',110,'2012-04-05 00:00:00'),('Karan','macbook',111,'2021-04-05 00:00:00'),('Sarbjot','Watch',120,'2021-04-05 00:00:00'),('sarbjot1','Pen',200,'2021-04-05 00:00:00'),('Karan','TV',210,'2021-04-08 00:00:00'),('Preet','TV',211,'2021-04-09 00:00:00');
/*!40000 ALTER TABLE `registeredProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `name` varchar(30) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Jashan','123456','9876543210','Jashan@gmail.com','Toronto'),('Karan','12345','876543210','karan@gmail.com','toronto'),('Preet','12345','9876543210','preet@gmail.com','Etobicoke'),('Sarbjot','12345','9876543210','Sarb@gmail.com','Don mills'),('Sarbjot1','12345','9876543210','Randhawa@gmail.com','North York');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 22:25:20
