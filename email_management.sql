-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: email_management
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (2,'Microsoft account security info was added','Microsoft account team <account-security-noreply@accountprotection.microsoft.com>','The following security info was recently added to the Microsoft account ik**2@outlook.com:\r\n\r\nikhwanm32@gmail.com\r\n\r\nIf this was you, then you can safely ignore this email.\r\n\r\nIf this wasn\'t you, a malicious user has access to your account. Please review your recent activity and we\'ll help you secure your account.\r\n\r\nReview recent activity https://account.microsoft.com/activity.\r\n\r\nTo opt out or change where you receive security notifications, click here https://account.live.com/SecurityNotifications/Update.\r\n\r\nThanks,\r\nThe Microsoft account team \r\n'),(3,'Microsoft account security info verification','Microsoft account team <account-security-noreply@accountprotection.microsoft.com>','Recently, you verified the security info on the Microsoft account ik**2@outlook.com. This was a periodic security check which only happens if you haven\'t used a security code recently. You won\'t need to provide a code every time you sign in.\r\n\r\nIt\'s important to keep the security info associated with your account correct and up-to-date. We\'ll never use this info to spam you or for any marketing purposes — it\'s only to verify your identity if there\'s ever a problem with your account.\r\n\r\nTo learn more or contact support, click here http://go.microsoft.com/fwlink/?LinkID=281822.\r\n\r\nTo opt out or change where you receive security notifications, click here https://account.live.com/SecurityNotifications/Update.\r\n\r\nThanks,\r\nThe Microsoft account team \r\n'),(42,'Example Email','IZAO <ikhwanm32@gmail.com>','Dear recipient,\r\n\r\nThis is an example email for testing purposes. It contains some\r\ncontent that you can use to verify the display and functionality of\r\nyour application.\r\n\r\nRegards,\r\nJohn Doe\r\n'),(43,'Example Email 2','IZAO <ikhwanm32@gmail.com>','Example Email test\r\n'),(44,'Request for vacation','IZAO <ikhwanm32@gmail.com>','Dear Mr. Smith,\r\n\r\nI am writing to request a vacation from Monday, September 9th till Friday,\r\nSeptember 13th. I will make sure to complete all my current projects and\r\npending tasks in advance before the vacation. My colleagues, John Doe and\r\nJane Doe, will cover my responsibilities during my absence.\r\n\r\nI would like to take this opportunity to visit my family in California. I\r\nhave not seen them in over a year and I am looking forward to spending some\r\ntime with them.\r\n\r\nI would be grateful if you could approve my request.\r\n\r\nThank you for your time and consideration.\r\n\r\nSincerely,\r\n\r\nBard\r\n');
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sent_emails`
--

DROP TABLE IF EXISTS `sent_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sent_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipient_email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sent_emails`
--

LOCK TABLES `sent_emails` WRITE;
/*!40000 ALTER TABLE `sent_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `sent_emails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24  0:09:17
