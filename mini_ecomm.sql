-- MySQL dump 10.16  Distrib 10.1.39-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mini_ecomm
-- ------------------------------------------------------
-- Server version	10.1.39-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'sperry','2019-08-16 14:15:47','2019-08-16 15:01:00',1),(2,'Adidas','2019-08-16 14:15:47','2019-08-16 14:15:47',1),(3,'World Balance','2019-08-16 14:15:47','2019-08-16 14:15:47',1),(9,'Blue fish Boat shoes','2019-08-17 14:16:40','2019-08-17 14:16:40',1),(10,'New PRoduct Sample','2019-08-17 14:38:51','2019-08-17 14:38:51',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (7,'Alden','habulin ng chix',3,'2019-08-16 15:40:42','2019-08-16 15:40:42','http://localhost/back-ecommerce/uploads/afc0337e10d3a157fe43639c1c02d856a6cf7274.jpg'),(8,'Alden','habulin ng chix',3,'2019-08-16 15:50:52','2019-08-16 15:50:52','http://localhost/back-ecommerce/uploads/b84eb732eb3fb764bb2d7f0c998c387978e83b12.jpg'),(9,'Aldensss','habulin ng chixsss',3,'2019-08-16 16:05:11','2019-08-16 16:05:11','http://localhost/back-ecommerce/uploads/ad52f2f3e9fd386410a0400282ecc6ff8339fc37.png'),(10,'Nike tiger yellow','yellow shoes',1,'2019-08-17 08:00:36','2019-08-17 08:00:36','http://localhost/back-ecommerce/uploads/00246a52fbe08bc8d319f81b8102320bb6406f8d.jpeg'),(11,'Nike Tiger Yellow Shoes','yellow shoes worn',1,'2019-08-17 08:30:44','2019-08-17 08:30:44','http://localhost/back-ecommerce/uploads/26f1cfc75b0319a806d9840d9833019140f6bb4c.jpeg'),(12,'Nike tiger yellow','yellow shoes',1,'2019-08-17 08:41:29','2019-08-17 08:41:29','http://localhost/back-ecommerce/uploads/bac1f04542a99d3166916cfb7dea94793ad5b245.jpeg'),(13,'Blue fish Boat shoes','Good Shoes for Formal attire',1,'2019-08-17 13:39:07','2019-08-17 13:39:07','http://localhost/back-ecommerce/uploads/53f9ad7930f9b1a9b563051bf16e811ed9f7434d.jpg'),(14,'Blue fish Boat shoes','Good Shoes for Formal attire',1,'2019-08-17 13:46:17','2019-08-17 13:46:17','http://localhost/back-ecommerce/uploads/d786a40cfd99bf382645e7286962ea04b9525840.png'),(15,'Blue fish Boat shoes','Good Shoes for Formal attire',1,'2019-08-17 13:59:25','2019-08-17 13:59:25','http://localhost/back-ecommerce/uploads/4ae09d1c7e84483ee8a13c127239451e8de17059.png'),(16,'Blue fish Boat shoes','Good Shoes for Formal attire',1,'2019-08-17 14:05:43','2019-08-17 14:05:43','http://localhost/back-ecommerce/uploads/40e45c3b2875497a2fe51988af0dfe591b202b21.png'),(17,'dsadsada','dsadsadsa',3,'2019-08-17 14:40:11','2019-08-17 14:40:11','http://localhost/back-ecommerce/uploads/e549bcc9ec19859dcadfb21c8ec08f95972d7c27.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_level`
--

DROP TABLE IF EXISTS `user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
INSERT INTO `user_level` VALUES (1,'super-user'),(2,'administrator');
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_expired` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_token`
--

LOCK TABLES `user_token` WRITE;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` VALUES (1,'5d567017301c4',4,'2019-08-16 16:57:59','2019-08-16 16:57:59'),(2,'c6f97efac3e6080a735ae468f91fe6d9a343eda2',4,'2019-08-16 16:58:13','2019-08-16 16:58:13'),(3,'f27b1c48b265eb9f72f006a208c482d49888bc3c',4,'2019-08-16 16:59:03','2019-08-17 16:59:03'),(4,'4fe2781ac1214c0948821ec338ac9363d89b69c9',4,'2019-08-16 17:02:50','2019-08-17 17:02:50'),(5,'80b40d1500e29b6d46da8b1783577852ef5ae958',4,'2019-08-16 17:03:06','2019-08-17 17:03:06'),(6,'1a9994538583966950b5c2e4de9d648b712b7124',1,'2019-08-16 19:22:23','2019-08-17 19:22:23');
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_level_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`),
  KEY `user_level_id` (`user_level_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_level_id`) REFERENCES `user_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'IT MAINTENANCE GUY','IT-SUPPORT','0dea19d74066364d14dfc4007492d20b25d0cbdf','2019-08-16 16:16:06','2019-08-16 19:22:12',1,1),(4,'dsad123123333','james123','92f28d8825269f0ad63d969b0328be3358c70dad','2019-08-16 16:45:25','2019-08-16 19:35:56',2,1),(5,'mejas','mejas123','cbfdac6008f9cab4083784cbd1874f76618d2a97','2019-08-16 19:33:33','2019-08-16 19:33:33',2,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-17 15:07:53
