-- MySQL dump 10.13  Distrib 5.5.30, for Win32 (x86)
--
-- Host: localhost    Database: servicestation
-- ------------------------------------------------------
-- Server version	5.5.30

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `vin` varchar(255) DEFAULT NULL,
  `Client_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`Client_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_car_Client_idx` (`Client_id`),
  CONSTRAINT `fk_car_Client` FOREIGN KEY (`Client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'honda','prelude',1992,'unknown',1),(2,'audi','a6',2013,'87657fgjvc66',2),(3,'Bentley','Continental',1999,'',5),(4,'BMW','',1999,'',3),(5,'Ferrari','',2015,'',1);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Evgeny','Smirnov','1985-12-20','Majakovsky str. 142-14','375-33-6317462','illerax@gmail.com'),(2,'Ivan','Petrov','','','344555677','petrov@gmail.com'),(3,'Garry','Larsen','1998-12-12','','34564564567',''),(4,'John','Jones','','','565645656767',''),(5,'Max','Tompson','1963-06-07','Some street 12 22','36464472343245','hdh@mail.com'),(6,'Ben','Green','','','2352465346',''),(7,'Bill','Gates','','','2342345245',''),(8,'Paul','Franklin','','','4444444555555',''),(9,'Carlos','Castaneda','','','4773665522',''),(10,'Bill','Crawtz','','','483632893003',''),(11,'Bruce','Lee','','','47788399092',''),(12,'Monica','Albertos','','','4489209220',''),(13,'Garry','Bupe','','','449992200',''),(14,'Richard','Jonson','1964-07-01','','3339299002',''),(15,'Eric','Sidel','','','49993773823',''),(16,'Billy','','1974-07-19','','3477839992',''),(17,'Amanda','Martinez','','','48478494993',''),(18,'Phill','Fox','','','474849993',''),(19,'Pavel','Hogins','','','4894947893',''),(20,'Ivan','Ivanov','','','44923940249',''),(21,'Vladimir','Petrov','','','47882902020',''),(22,'Vladimir','Sidorov','','','46663882902',''),(23,'Franchesco','Bernulli','1992-04-01','','7883778839',''),(24,'Jorge','Washington','','','4678290202',''),(25,'Aleksander','Grigorev','','','477839992','');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `amount` int(5) DEFAULT NULL,
  `status` enum('Completed','In Progress','Cancelled') DEFAULT NULL,
  `car_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`car_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_orders_car1_idx` (`car_id`),
  CONSTRAINT `fk_orders_car1` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2015-09-21',111,'Completed',1),(2,'2015-09-21',200,'In Progress',2),(3,'2015-09-21',4000,'In Progress',3),(4,'2015-09-21',233,'In Progress',3),(5,'2015-09-21',300,'In Progress',1),(6,'2015-09-21',22,'In Progress',1),(7,'2015-09-21',200,'In Progress',4),(8,'2015-09-21',10000,'In Progress',5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-21  4:48:15
