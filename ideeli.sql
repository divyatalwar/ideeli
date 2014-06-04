-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ideeli_development
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

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
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `publishable_flag` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,1,'color1',NULL,NULL,0,NULL,NULL),(2,1,'color2',NULL,NULL,0,NULL,NULL),(3,1,'color3',NULL,NULL,0,NULL,NULL),(4,2,'color4',NULL,NULL,0,NULL,NULL),(5,2,'color5',NULL,NULL,0,NULL,NULL),(6,2,'color6',NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `discount_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'o',
  `shopping_event_id` int(11) DEFAULT NULL,
  `publishable_flag` tinyint(4) DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,1,NULL,'color11',1,0,'offer1','Sweepstake',0,'2014-06-03 12:33:42','2014-06-04 13:14:36'),(2,1,NULL,'color2',1,0,'offer2','Sweepstake',0,'2014-06-03 12:34:05','2014-06-03 12:34:05'),(3,2,NULL,'color3',1,NULL,'offer3',NULL,0,'2014-06-03 12:38:16','2014-06-03 12:38:16'),(4,2,NULL,'color4',2,NULL,'offer4',NULL,0,'2014-06-03 12:38:38','2014-06-03 12:38:38'),(5,2,NULL,'color5',2,NULL,'offer5',NULL,0,'2014-06-03 12:38:46','2014-06-03 12:38:46'),(6,2,NULL,'color6',2,NULL,'offer6',NULL,0,'2014-06-03 12:38:56','2014-06-03 12:38:56');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_infos`
--

DROP TABLE IF EXISTS `product_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `spec` text COLLATE utf8_unicode_ci,
  `brand_code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishable_flag` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_infos`
--

LOCK TABLES `product_infos` WRITE;
/*!40000 ALTER TABLE `product_infos` DISABLE KEYS */;
INSERT INTO `product_infos` VALUES (13,'info1','spec1','1',0,NULL,NULL),(14,'info2','spec2','2',NULL,NULL,NULL),(15,'info3','spec3','3',NULL,NULL,NULL),(16,'info4','spec4','4',NULL,NULL,NULL),(17,'info5','spec5','5',NULL,NULL,NULL),(18,'info6','spec6','6',NULL,NULL,NULL);
/*!40000 ALTER TABLE `product_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strapline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info_id` int(11) DEFAULT NULL,
  `publishable_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'straline1','brand1a',13,NULL),(2,'straline2','brand2',2,NULL),(3,'straline3','brand3',3,NULL),(4,'straline4','brand4',4,NULL),(5,'straline5','brand5',5,NULL),(6,'straline6','brand6',6,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140530130111'),('20140530130718'),('20140530174123'),('20140531102420'),('20140531103243'),('20140531104442'),('20140531110406'),('20140531111050'),('20140603144440'),('20140604131835');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_event_groups`
--

DROP TABLE IF EXISTS `shopping_event_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_event_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `publishable_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_event_groups`
--

LOCK TABLES `shopping_event_groups` WRITE;
/*!40000 ALTER TABLE `shopping_event_groups` DISABLE KEYS */;
INSERT INTO `shopping_event_groups` VALUES (1,'2014-05-10 00:00:00','2014-05-12 00:00:00','2014-06-03 12:06:43','2014-06-03 12:06:43',NULL),(2,'2014-06-10 00:00:00','2014-06-12 00:00:00','2014-06-03 12:06:53','2014-06-03 12:06:53',NULL);
/*!40000 ALTER TABLE `shopping_event_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_events`
--

DROP TABLE IF EXISTS `shopping_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_editorial` text COLLATE utf8_unicode_ci,
  `canceled_at` datetime DEFAULT NULL,
  `group_position` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `publishable_flag` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_events`
--

LOCK TABLES `shopping_events` WRITE;
/*!40000 ALTER TABLE `shopping_events` DISABLE KEYS */;
INSERT INTO `shopping_events` VALUES (1,'Event1','2014-05-21 00:00:00','2014-05-24 00:00:00',1,'brand1','email text for shopping event 1',NULL,0,'2014-06-03 12:12:58','2014-06-03 12:12:58',0),(2,'Event2','2014-05-22 00:00:00','2014-05-26 00:00:00',2,'brand2','email text for shopping event 2',NULL,0,'2014-06-03 12:13:36','2014-06-03 12:13:36',NULL);
/*!40000 ALTER TABLE `shopping_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_units`
--

DROP TABLE IF EXISTS `sku_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku_id` int(11) DEFAULT NULL,
  `state` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_units`
--

LOCK TABLES `sku_units` WRITE;
/*!40000 ALTER TABLE `sku_units` DISABLE KEYS */;
INSERT INTO `sku_units` VALUES (1,1,'sample1'),(2,1,'sample2'),(3,1,'sample3'),(4,2,'sample4'),(5,2,'sample5'),(6,3,'sample6'),(7,3,'sample7'),(8,3,'sample8'),(9,4,'sample9'),(10,4,'sample10');
/*!40000 ALTER TABLE `sku_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skus`
--

DROP TABLE IF EXISTS `skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_id` int(11) DEFAULT '0',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishable_flag` tinyint(4) DEFAULT NULL,
  `season` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_cents` int(11) DEFAULT NULL,
  `msrp_cents` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skus`
--

LOCK TABLES `skus` WRITE;
/*!40000 ALTER TABLE `skus` DISABLE KEYS */;
INSERT INTO `skus` VALUES (1,'3',1,'1',NULL,'sku1',0,0),(2,'2',1,'2',NULL,'sku2',0,0),(3,'3',2,'2',NULL,'sku3',0,0),(4,'2',2,'2',NULL,'sku4',0,0);
/*!40000 ALTER TABLE `skus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-04 19:07:21
