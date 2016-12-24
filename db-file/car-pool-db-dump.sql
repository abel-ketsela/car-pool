CREATE DATABASE  IF NOT EXISTS `car-pool` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `car-pool`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: car-pool
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `commentid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(20) unsigned NOT NULL,
  `postid` int(20) unsigned NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,10,4,'There is nothing for free','2016-12-19 06:00:00','2016-12-19 06:00:00'),(2,11,4,'you are so rude','2016-12-20 06:00:00','2016-12-20 06:00:00'),(3,10,4,'I know','2016-12-21 13:09:11','2016-12-21 13:32:47'),(4,10,4,'Just kidding','2016-12-21 13:32:13','2016-12-21 13:32:13'),(5,11,4,'I got the ride forget it :)','2016-12-21 13:38:10','2016-12-21 13:38:10'),(6,10,4,'good for you','2016-12-21 13:39:16','2016-12-21 13:39:16'),(7,10,4,'Test','2016-12-21 13:44:35','2016-12-21 13:44:35'),(8,10,4,'test','2016-12-22 09:01:06','2016-12-22 09:01:06'),(9,10,5,'fdsf','2016-12-22 09:33:30','2016-12-22 09:33:30'),(10,10,5,'eeee','2016-12-22 09:33:43','2016-12-22 09:33:43'),(11,10,5,'3333','2016-12-22 09:34:04','2016-12-22 09:34:04'),(12,10,5,'sss','2016-12-22 09:34:19','2016-12-22 09:34:19'),(13,10,30,'test','2016-12-22 09:37:51','2016-12-22 09:37:51'),(14,10,30,'aaa','2016-12-22 09:37:53','2016-12-22 09:37:53'),(15,10,30,'bbb','2016-12-22 09:37:57','2016-12-22 09:37:57'),(16,10,30,'testddddd','2016-12-22 09:38:37','2016-12-22 09:38:37'),(17,10,2,'ererer','2016-12-22 09:39:37','2016-12-22 09:39:37'),(18,10,2,'wewew','2016-12-22 09:39:44','2016-12-22 09:39:44'),(19,10,3,'fdsf','2016-12-22 09:39:55','2016-12-22 09:39:55'),(20,10,6,'','2016-12-22 09:39:58','2016-12-22 09:39:58'),(21,10,2,'errrr nakeshhh','2016-12-22 09:51:27','2016-12-22 09:51:27'),(22,10,36,'this is a test','2016-12-22 16:24:04','2016-12-22 16:24:04'),(23,10,38,'this is a test','2016-12-22 17:28:01','2016-12-22 17:28:01'),(24,10,38,'another tegst','2016-12-22 17:28:09','2016-12-22 17:28:09');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `likeid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(20) unsigned NOT NULL,
  `postid` int(20) unsigned NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`likeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `postid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(20) unsigned NOT NULL,
  `post` text COLLATE utf8_bin NOT NULL,
  `posttype` varchar(50) COLLATE utf8_bin NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`postid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,10,'I am going to Iowa City on Dec 24-2016 ...   seat available','PROVIDE','2016-12-20 06:00:00','2016-12-20 06:00:00'),(2,11,'I need a ride  for two person before Dec-30 working AC prefered','REQUEST','2016-12-20 06:00:00','2016-12-20 06:00:00'),(3,10,'Looking for urgent ride to Cedar Rapids tomorrow ','REQUEST','2016-12-20 06:00:00','2016-12-19 06:00:00'),(4,11,'A familly in need of a ride for free in the coming weekend  to the Iowa city park','REQUEST','2016-12-20 06:00:00','2016-12-18 06:00:00'),(5,10,'Anyone going to Ottummua Tomorrow ?','REQUEST','2016-12-22 04:46:40','2016-12-22 04:46:40'),(6,10,'Anyone going to Des Monies  for Christmas ','REQUEST','2016-12-22 04:47:35','2016-12-22 04:47:35'),(7,10,'Anyone going to Des Monies  for New Year','REQUEST','2016-12-22 04:47:47','2016-12-22 04:47:47'),(8,10,'I need a ride to Argiro tomorrow , there is a heavy snow ','REQUEST','2016-12-22 04:48:23','2016-12-22 04:48:23'),(9,10,'Pleaseeeeeeeeeeeeeeeeeeeeeeeeeeeeeee urgent ride to cedar rapids airport tomorrow Thanks','REQUEST','2016-12-22 05:11:16','2016-12-22 05:11:16'),(10,10,'Hello friends any free ride to the park','REQUEST','2016-12-22 05:12:00','2016-12-22 05:12:00'),(11,10,'Recurrent ride to school .... ever weekdays ? ','REQUEST','2016-12-22 05:12:36','2016-12-22 05:12:36'),(12,10,'I need a ride every Monday willing to share gas','REQUEST','2016-12-22 05:13:14','2016-12-22 05:13:14'),(13,10,'Checking if some one is going to Walmart today evening  ','REQUEST','2016-12-22 06:35:48','2016-12-22 06:35:48'),(14,10,'I really need a ride to Walmart today, anyone going ?','REQUEST','2016-12-22 06:42:23','2016-12-22 06:42:23'),(15,10,'me and my two friends looking for a ride to the park on this weekend','REQUEST','2016-12-22 06:59:43','2016-12-22 06:59:43'),(16,10,'A family looking for a ride to the carnival today','REQUEST','2016-12-22 07:03:41','2016-12-22 07:03:41'),(17,10,'Looking for a ride every Monday and Tuesday to 1000 N 4th St','REQUEST','2016-12-22 07:33:54','2016-12-22 07:33:54'),(18,10,'Looking for a ride to Fairfield school every weekdays','REQUEST','2016-12-22 07:40:02','2016-12-22 07:40:02'),(19,10,'Can some one drive me to Walmart, A/C car preferred  ','REQUEST','2016-12-22 07:45:27','2016-12-22 07:45:27'),(20,10,'checking for a ride tomorrow to the main Airport ?','REQUEST','2016-12-22 08:01:27','2016-12-22 08:01:27'),(21,10,'this is atergfgd','REQUEST','2016-12-22 08:13:10','2016-12-22 08:13:10'),(22,10,'this is atergfgd vsdfewsfwef','REQUEST','2016-12-22 08:15:35','2016-12-22 08:15:35'),(23,10,'adasdsad','REQUEST','2016-12-22 08:22:33','2016-12-22 08:22:33'),(24,10,'fdsgfsdgsafg','REQUEST','2016-12-22 08:26:36','2016-12-22 08:26:36'),(25,10,'asdas dfasdwa','REQUEST','2016-12-22 08:26:54','2016-12-22 08:26:54'),(26,10,'afsagfsfg gsdgfdsfa','REQUEST','2016-12-22 08:32:10','2016-12-22 08:32:10'),(27,10,'dghfdhgfdhfgd  dfgdghgd gdfsgsd','REQUEST','2016-12-22 08:32:31','2016-12-22 08:32:31'),(28,10,'asfadf fdfad fdafaf','REQUEST','2016-12-22 08:35:12','2016-12-22 08:35:12'),(29,10,'gdfgdfs gfdgdfs gdfgsd dgfdsgs','REQUEST','2016-12-22 08:38:55','2016-12-22 08:38:55'),(30,10,'afadf gdfsgdsf bfdgsdf','REQUEST','2016-12-22 08:40:00','2016-12-22 08:40:00'),(31,10,'rrrrrrrrrrrrrrrrrrrrr','REQUEST','2016-12-22 08:40:28','2016-12-22 08:40:28'),(32,10,'ertetrewytyrtyt erterwytewry','REQUEST','2016-12-22 08:41:46','2016-12-22 08:41:46'),(33,10,'dsfdsfgsdgfdsgdfs ffgdsfgdfs','REQUEST','2016-12-22 08:42:12','2016-12-22 08:42:12'),(34,11,'fedfewwq','REQUEST','2016-12-22 09:41:34','2016-12-22 09:41:34'),(35,11,'fedfewwq','REQUEST','2016-12-22 09:44:44','2016-12-22 09:44:44'),(36,10,'fsfewdew','REQUEST','2016-12-22 09:51:57','2016-12-22 09:51:57'),(37,10,'this is a test post','REQUEST','2016-12-22 16:29:00','2016-12-22 16:29:00'),(38,10,'this a test ','REQUEST','2016-12-22 17:25:20','2016-12-22 17:25:20'),(39,10,'anoter post','REQUEST','2016-12-22 17:25:57','2016-12-22 17:25:57'),(40,10,'anoter post','REQUEST','2016-12-22 17:26:18','2016-12-22 17:26:18'),(41,10,'test','REQUEST','2016-12-22 17:26:46','2016-12-22 17:26:46'),(42,10,'another test','REQUEST','2016-12-22 17:28:20','2016-12-22 17:28:20'),(43,10,'another test','REQUEST','2016-12-22 17:28:53','2016-12-22 17:28:53'),(44,10,'test','REQUEST','2016-12-22 17:31:12','2016-12-22 17:31:12'),(45,10,'jlkjlkjk','REQUEST','2016-12-22 17:38:56','2016-12-22 17:38:56');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) COLLATE utf8_bin NOT NULL,
  `gender` varchar(50) COLLATE utf8_bin NOT NULL,
  `state` varchar(50) COLLATE utf8_bin NOT NULL,
  `city` varchar(50) COLLATE utf8_bin NOT NULL,
  `street` varchar(50) COLLATE utf8_bin NOT NULL,
  `zipcode` varchar(50) COLLATE utf8_bin NOT NULL,
  `birthyear` date NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `datecreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateupdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'Admin','Male','IA','Fairfield','1000 N 4th St','52558','1990-01-01','admin@admin.com','pass','2016-01-01 06:00:00','2016-01-01 06:00:00'),(11,'User','Female','TX','Hustin','52589 North Ave','63698','1988-01-01','user@user.com','pass','2016-01-01 06:00:00','2016-01-01 06:00:00');
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

-- Dump completed on 2016-12-23 18:31:43
