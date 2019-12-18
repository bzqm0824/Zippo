-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: books
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `书籍`
--

DROP TABLE IF EXISTS `书籍`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `书籍` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `书名` varchar(50) DEFAULT NULL,
  `价格` decimal(5,2) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `p_fk` (`pid`),
  KEY `a_fk` (`aid`),
  CONSTRAINT `a_fk` FOREIGN KEY (`aid`) REFERENCES `作家` (`id`),
  CONSTRAINT `p_fk` FOREIGN KEY (`pid`) REFERENCES `出版社` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `书籍`
--

LOCK TABLES `书籍` WRITE;
/*!40000 ALTER TABLE `书籍` DISABLE KEYS */;
/*!40000 ALTER TABLE `书籍` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `作家`
--

DROP TABLE IF EXISTS `作家`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `作家` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `笔名` varchar(50) DEFAULT NULL,
  `性别` enum('m','w') DEFAULT NULL,
  `出生日期` date DEFAULT NULL,
  `风格` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `作家`
--

LOCK TABLES `作家` WRITE;
/*!40000 ALTER TABLE `作家` DISABLE KEYS */;
/*!40000 ALTER TABLE `作家` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `出版社`
--

DROP TABLE IF EXISTS `出版社`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `出版社` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `名称` varchar(50) DEFAULT NULL,
  `创刊日期` date DEFAULT NULL,
  `地址` char(50) DEFAULT NULL,
  `电话` char(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `出版社`
--

LOCK TABLES `出版社` WRITE;
/*!40000 ALTER TABLE `出版社` DISABLE KEYS */;
/*!40000 ALTER TABLE `出版社` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `publication` varchar(50) DEFAULT NULL,
  `comment` text,
  `publication_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'骆驼祥子','老舍',46.80,'中国教育出版社','你是祥子么？','2012-09-25'),(3,'围城','钱钟书',68.50,'机械工业出版社','什么是你心中的围城',NULL),(4,'丰乳肥臀','莫言',47.00,'机械工业出版社',NULL,NULL),(5,'朝花夕拾','鲁迅',52.00,'人民教育出版社','xxxxx',NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_author`
--

DROP TABLE IF EXISTS `publication_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication_author` (
  `p_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `签约时间` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`p_id`,`a_id`),
  KEY `a_fk1` (`a_id`),
  CONSTRAINT `a_fk1` FOREIGN KEY (`a_id`) REFERENCES `作家` (`id`),
  CONSTRAINT `p_fk1` FOREIGN KEY (`p_id`) REFERENCES `出版社` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_author`
--

LOCK TABLES `publication_author` WRITE;
/*!40000 ALTER TABLE `publication_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_author` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-17 10:26:14
