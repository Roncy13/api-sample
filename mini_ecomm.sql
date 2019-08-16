-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: mini_ecomm
-- ------------------------------------------------------
-- Server version	5.7.17

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'sperry','2019-08-16 14:15:47','2019-08-16 15:01:00',1),(2,'Adidas','2019-08-16 14:15:47','2019-08-16 14:15:47',1),(3,'World Balance','2019-08-16 14:15:47','2019-08-16 14:15:47',1),(4,'nike','2019-08-16 15:03:58','2019-08-16 15:03:58',1),(5,'nike','2019-08-16 15:04:50','2019-08-16 15:04:50',1),(6,'nike','2019-08-16 15:06:24','2019-08-16 15:06:24',1),(7,'nike','2019-08-16 15:07:09','2019-08-16 15:07:09',1),(8,'nike','2019-08-16 15:07:41','2019-08-16 15:07:41',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'James1231321','one piece character',2,'2019-08-16 15:33:20','2019-08-16 15:33:20','/Library/WebServer/Documents/back-ecommerce/uploads/d252074d6e07005e1a173dbba98a56517c95d1f2.png'),(2,'Alden Richardsssss','crush sssss bayan',1,'2019-08-16 15:33:54','2019-08-16 16:02:14','http://localhost/back-ecommerce/uploads/78d2e751757384f0d46f9372f6255b6d83b77ab3.png'),(3,'Alden','habulin ng chix',3,'2019-08-16 15:36:20','2019-08-16 15:36:20','/Library/WebServer/Documents/back-ecommerce/uploads/f66e7a2697f16348bc3f2fccbe5fd5f407bddece.jpg'),(4,'Alden','habulin ng chix',3,'2019-08-16 15:37:59','2019-08-16 15:37:59','/Library/WebServer/Documents/back-ecommerce/uploads/5842dea2ce3a5c7de4e1178c5f794fc5c57cb24c.jpg'),(5,'Alden','habulin ng chix',3,'2019-08-16 15:39:47','2019-08-16 15:39:47','uploads/7dcd63d1933774075b85414340199004443c601f.jpg'),(6,'Alden','habulin ng chix',3,'2019-08-16 15:40:29','2019-08-16 15:40:29','{PROJECT_HOST}uploads/5b42cc5e89b81e089a7cf6ded70570aec2519695.jpg'),(7,'Alden','habulin ng chix',3,'2019-08-16 15:40:42','2019-08-16 15:40:42','http://localhost/back-ecommerce/uploads/afc0337e10d3a157fe43639c1c02d856a6cf7274.jpg'),(8,'Alden','habulin ng chix',3,'2019-08-16 15:50:52','2019-08-16 15:50:52','http://localhost/back-ecommerce/uploads/b84eb732eb3fb764bb2d7f0c998c387978e83b12.jpg'),(9,'Aldensss','habulin ng chixsss',3,'2019-08-16 16:05:11','2019-08-16 16:05:11','http://localhost/back-ecommerce/uploads/ad52f2f3e9fd386410a0400282ecc6ff8339fc37.png');
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

-- Dump completed on 2019-08-16 19:36:51
