CREATE DATABASE  IF NOT EXISTS `automobiles` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `automobiles`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 0.0.0.0    Database: automobiles
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modelYear` year(4) NOT NULL,
  `make` varchar(25) NOT NULL,
  `model` varchar(40) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL,
  `description` varchar(200) DEFAULT 'No description provided',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,2018,'McLaren','570S Spider',191100.00,'There are three members of the 570 family, and all are set to kick sand in the faces of lesser cars. '),(2,2016,'Acura','ILX',28940.00,'Although the ILX is basically a Honda Civic, it is a really nice Civic.'),(3,2017,'Acura','NSX',156940.00,'The legendary NSX, touted as a supercar that’s easy to live with on a daily basis, is reborn for 2017 with a trendy hybrid powertrain. ');
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;




DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `hq` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Callahan Auto','Sandusky, OH'),(2,'Zalinsky Auto','Dayton, OH'),(3,'Goodyear','Akron, OH');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `part` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cost` decimal(7,2) NOT NULL,
  `partNo` smallint(5) unsigned NOT NULL,
  `supplierID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SUPPLIER_idx` (`supplierID`),
  CONSTRAINT `FK_SUPPLIER` FOREIGN KEY (`supplierID`) REFERENCES `supplier` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES (1,'Eagle GT Tire',299.00,123,3),(2,'Supra Brake Pad',59.00,212,1),(3,'Ultra Brake Pad',69.99,222,2),(4,'Fan Belt',57.99,223,1);
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;





DROP TABLE IF EXISTS `autoPart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autoPart` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `autoID` int(10) unsigned NOT NULL,
  `partID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTO_idx` (`autoID`),
  KEY `FK_PART_idx` (`partID`),
  CONSTRAINT `FK_AUTO` FOREIGN KEY (`autoID`) REFERENCES `auto` (`ID`),
  CONSTRAINT `FK_PART` FOREIGN KEY (`partID`) REFERENCES `part` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autoPart`
--

LOCK TABLES `autoPart` WRITE;
/*!40000 ALTER TABLE `autoPart` DISABLE KEYS */;
INSERT INTO `autoPart` VALUES (3,1,1),(4,1,2),(5,1,3),(8,2,2),(9,2,3),(10,2,4),(11,3,2),(12,3,1),(13,3,3);
/*!40000 ALTER TABLE `autoPart` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `supplier`
--


--
-- Temporary view structure for view `vAutos`
--

DROP TABLE IF EXISTS `vAutos`;
/*!50001 DROP VIEW IF EXISTS `vAutos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vAutos` AS SELECT
 1 AS `autoPartID`,
 1 AS `autoID`,
 1 AS `partID`,
 1 AS `partName`,
 1 AS `partNo`,
 1 AS `supplierID`,
 1 AS `supplierName`,
 1 AS `hq`,
 1 AS `make`,
 1 AS `model`,
 1 AS `modelYear`,
 1 AS `MSRP`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vAutos`
--

/*!50001 DROP VIEW IF EXISTS `vAutos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;

/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vAutos` AS select `ap`.`ID` AS `autoPartID`,`ap`.`autoID` AS `autoID`,`ap`.`partID` AS `partID`,`p`.`name` AS `partName`,`p`.`partNo` AS `partNo`,`p`.`supplierID` AS `supplierID`,`s`.`name` AS `supplierName`,`s`.`hq` AS `hq`,`a`.`make` AS `make`,`a`.`model` AS `model`,`a`.`modelYear` AS `modelYear`,`a`.`MSRP` AS `MSRP`,`a`.`description` AS `description` from (((`autoPart` `ap` join `auto` `a` on((`ap`.`autoID` = `a`.`ID`))) join `part` `p` on((`ap`.`partID` = `p`.`ID`))) join `supplier` `s` on((`s`.`ID` = `p`.`supplierID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-25 16:05:02
