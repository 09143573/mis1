CREATE DATABASE  IF NOT EXISTS `设备保养` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `设备保养`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: 设备保养
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `保养消耗`
--

DROP TABLE IF EXISTS `保养消耗`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养消耗` (
  `保养消耗ID` int(11) NOT NULL,
  `保养记录ID` int(11) NOT NULL,
  `消耗材料名称` varchar(45) NOT NULL,
  `数量` int(11) NOT NULL,
  `单位` varchar(45) NOT NULL,
  PRIMARY KEY (`保养消耗ID`),
  KEY `k5_idx` (`保养记录ID`),
  CONSTRAINT `k5` FOREIGN KEY (`保养记录ID`) REFERENCES `保养记录` (`保养记录ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养消耗`
--

LOCK TABLES `保养消耗` WRITE;
/*!40000 ALTER TABLE `保养消耗` DISABLE KEYS */;
INSERT INTO `保养消耗` VALUES (1,1,'电线',2,'根');
/*!40000 ALTER TABLE `保养消耗` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `保养记录`
--

DROP TABLE IF EXISTS `保养记录`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养记录` (
  `保养记录ID` int(11) NOT NULL,
  `设备ID` int(11) NOT NULL,
  `保养项目ID` int(11) NOT NULL,
  `保养人` varchar(45) NOT NULL,
  `完成情况` varchar(45) NOT NULL,
  `时间` date NOT NULL,
  PRIMARY KEY (`保养记录ID`),
  KEY `k3_idx` (`设备ID`),
  KEY `k4_idx` (`保养项目ID`),
  CONSTRAINT `k3` FOREIGN KEY (`设备ID`) REFERENCES `设备` (`设备ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `k4` FOREIGN KEY (`保养项目ID`) REFERENCES `保养项目` (`保养项目ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养记录`
--

LOCK TABLES `保养记录` WRITE;
/*!40000 ALTER TABLE `保养记录` DISABLE KEYS */;
INSERT INTO `保养记录` VALUES (1,1,1,'aa','完成','2016-10-11'),(2,1,2,'a','完成','2016-10-13'),(3,2,4,'b','完成','2016-10-10');
/*!40000 ALTER TABLE `保养记录` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `保养项目`
--

DROP TABLE IF EXISTS `保养项目`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养项目` (
  `保养项目ID` int(11) NOT NULL,
  `设备类型ID` int(11) NOT NULL,
  `项目名称` varchar(45) NOT NULL,
  PRIMARY KEY (`保养项目ID`),
  KEY `k2_idx` (`设备类型ID`),
  CONSTRAINT `k2` FOREIGN KEY (`设备类型ID`) REFERENCES `设备类型` (`设备类型ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养项目`
--

LOCK TABLES `保养项目` WRITE;
/*!40000 ALTER TABLE `保养项目` DISABLE KEYS */;
INSERT INTO `保养项目` VALUES (1,2,'防冻液喷洒系统电磁阀密封、防腐检'),(2,2,'防冻液喷洒系统泵和液压站电机接线、密封、防腐；'),(3,2,'防冻液喷洒系统现场开关检查、接线箱接线、密封、防腐；'),(4,5,'校对液位仪准确度');
/*!40000 ALTER TABLE `保养项目` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `登录人员`
--

DROP TABLE IF EXISTS `登录人员`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `登录人员` (
  `用户名` varchar(45) NOT NULL,
  `密码` int(11) NOT NULL,
  `是否主管` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `登录人员`
--

LOCK TABLES `登录人员` WRITE;
/*!40000 ALTER TABLE `登录人员` DISABLE KEYS */;
INSERT INTO `登录人员` VALUES ('123',123,NULL),('321',321,1);
/*!40000 ALTER TABLE `登录人员` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备`
--

DROP TABLE IF EXISTS `设备`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备` (
  `设备ID` int(11) NOT NULL,
  `设备类型ID` int(11) NOT NULL,
  `最后一次保养时间` date NOT NULL,
  PRIMARY KEY (`设备ID`),
  KEY `k1_idx` (`设备类型ID`),
  CONSTRAINT `k1` FOREIGN KEY (`设备类型ID`) REFERENCES `设备类型` (`设备类型ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备`
--

LOCK TABLES `设备` WRITE;
/*!40000 ALTER TABLE `设备` DISABLE KEYS */;
INSERT INTO `设备` VALUES (1,2,'2016-10-11'),(2,5,'2016-10-10'),(3,16,'2016-10-10'),(4,18,'2016-10-09'),(5,2,'2016-10-11');
/*!40000 ALTER TABLE `设备` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备类型`
--

DROP TABLE IF EXISTS `设备类型`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备类型` (
  `设备类型ID` int(11) NOT NULL,
  `设备类型` varchar(45) NOT NULL,
  `保养周期` int(11) NOT NULL,
  `提前期` int(11) NOT NULL,
  `备注` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`设备类型ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备类型`
--

LOCK TABLES `设备类型` WRITE;
/*!40000 ALTER TABLE `设备类型` DISABLE KEYS */;
INSERT INTO `设备类型` VALUES (2,'防冻液喷洒设备',7,2,'11月20日-4月1日'),(5,'桶位仪',30,5,NULL),(16,'振动筛电机',180,7,NULL),(18,'球磨机',365,20,NULL);
/*!40000 ALTER TABLE `设备类型` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-02 16:10:14
