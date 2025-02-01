CREATE DATABASE  IF NOT EXISTS `local_gossip` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `local_gossip`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: local_gossip
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-comment-post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,37,21,'Dolore voluptatibus doloribus architecto veniam dicta aliquid.',1643780649,1643780649),(2,65,6,'Ratione vel repudiandae voluptas doloribus consectetur.',1644411369,1644411369),(3,5,2,'Earum repellendus accusantium incidunt dolores.',1645042089,1645042089),(4,54,7,'Deserunt minus deleniti dolore.',1645672809,1645672809),(5,18,23,'Dolores facilis iste adipisci quibusdam minus.',1646303529,1646303529),(6,59,38,'Fuga cumque iusto cum.',1646934249,1646934249),(7,63,23,'Non labore eveniet.',1647564969,1647564969),(8,8,49,'Quibusdam accusamus dolore.',1648195689,1648195689),(9,75,12,'Saepe voluptatum quisquam dolorum officiis ratione perspiciatis.',1648826409,1648826409),(10,85,25,'Amet explicabo ipsam maiores provident harum ad.',1649457129,1649457129),(11,97,26,'Molestiae nihil rem iste eveniet cumque distinctio illum.',1650087849,1650087849),(12,33,31,'Laudantium velit sequi fuga.',1650718569,1650718569),(13,57,27,'Nulla deserunt aut asperiores.',1651349289,1651349289),(14,26,20,'A ea at voluptate corporis nobis.',1651980009,1651980009),(15,33,48,'Animi quia eum ratione.',1652610729,1652610729),(16,18,5,'Molestias dolorum reiciendis voluptatum ipsum repudiandae deserunt.',1653241449,1653241449),(17,38,35,'Tempora officia rem deleniti similique provident.',1653872169,1653872169),(18,51,43,'Minus aut eius harum distinctio.',1654502889,1654502889),(19,95,37,'Ducimus culpa odit beatae architecto.',1655133609,1655133609),(20,60,6,'Rem magni odit.',1655764329,1655764329),(21,5,15,'Rerum iure velit reiciendis rerum.',1656395049,1656395049),(22,3,8,'Maxime autem a nam est ab laudantium.',1657025769,1657025769),(23,81,28,'Eos neque perferendis corrupti quia.',1657656489,1657656489),(24,15,30,'In ad eius iusto porro.',1658287209,1658287209),(25,45,48,'Molestias blanditiis nemo harum assumenda harum.',1658917929,1658917929),(26,31,8,'Quidem facilis laboriosam explicabo.',1659548649,1659548649),(27,32,44,'Minima iusto aperiam voluptates eius fuga magni.',1660179369,1660179369),(28,16,39,'Dicta ipsam nemo delectus.',1660810089,1660810089),(29,61,46,'Debitis eius debitis nulla.',1661440809,1661440809),(30,27,11,'Suscipit corporis necessitatibus dolorum tempore beatae.',1662071529,1662071529),(31,5,20,'Tempore tenetur ullam in sequi quidem exercitationem labore.',1662702249,1662702249),(32,71,14,'Reprehenderit atque et dolor consectetur provident molestiae.',1663332969,1663332969),(33,24,4,'Rerum maxime nam vero.',1663963689,1663963689),(34,18,29,'Ab ab ipsam perspiciatis.',1664594409,1664594409),(35,20,28,'Magnam accusamus architecto.',1665225129,1665225129),(36,19,8,'Placeat non quis explicabo laudantium doloribus dicta.',1665855849,1665855849),(37,46,43,'Sint iure libero omnis quo.',1666486569,1666486569),(38,100,17,'Recusandae vitae explicabo nisi quod velit.',1667117289,1667117289),(39,5,6,'Vitae reprehenderit a enim provident magni.',1667748009,1667748009),(40,82,28,'Delectus numquam unde iure maiores.',1668378729,1668378729),(41,16,33,'Sed possimus expedita nulla tempore aliquam cupiditate.',1669009449,1669009449),(42,64,18,'Doloremque magnam debitis neque ullam culpa eos.',1669640169,1669640169),(43,48,9,'Error laboriosam dolorum possimus exercitationem id doloremque.',1670270889,1670270889),(44,1,9,'Earum sapiente mollitia corporis perspiciatis velit.',1670901609,1670901609),(45,49,39,'Repudiandae amet accusamus dignissimos quibusdam.',1671532329,1671532329),(46,74,13,'Commodi possimus cupiditate voluptas iure ea.',1672163049,1672163049),(47,32,26,'Dolor eveniet tenetur cupiditate eum fuga et.',1672793769,1672793769),(48,100,48,'Saepe dolorum aperiam fugit.',1673424489,1673424489),(49,43,20,'Molestias atque dignissimos accusamus.',1674055209,1674055209),(50,95,50,'Iste eum suscipit quas quam enim.',1674685929,1674685929),(51,35,46,'Cum molestiae minus.',1675316649,1675316649),(52,48,27,'Quos odit ducimus ea quasi nesciunt sunt.',1675947369,1675947369),(53,44,49,'Occaecati laudantium voluptas cum facilis sequi ducimus.',1676578089,1676578089),(54,39,7,'Voluptatem quam adipisci occaecati necessitatibus.',1677208809,1677208809),(55,49,48,'Atque a blanditiis culpa illum nemo officiis.',1677839529,1677839529),(56,90,32,'Quidem labore quasi rem possimus sint repellendus eum.',1678470249,1678470249),(57,31,10,'Suscipit voluptate quidem veritatis.',1679100969,1679100969),(58,32,33,'Odit corrupti enim odit eum.',1679731689,1679731689),(59,34,39,'Tenetur occaecati laborum voluptatum dolorem.',1680362409,1680362409),(60,88,50,'Possimus ipsum sequi.',1680993129,1680993129),(61,32,3,'Itaque vitae voluptas quia eveniet ut.',1681623849,1681623849),(62,50,43,'Dolorem nisi repudiandae delectus aliquid.',1682254569,1682254569),(63,69,30,'Iure sed nam maiores eum neque.',1682885289,1682885289),(64,23,30,'Repellat cupiditate ratione iusto labore doloremque amet in.',1683516009,1683516009),(65,2,37,'Eum nisi facere deserunt sequi.',1684146729,1684146729),(66,23,34,'Commodi iusto dolor amet.',1684777449,1684777449),(67,31,37,'Sit exercitationem rerum corrupti in.',1685408169,1685408169),(68,20,5,'Magni aperiam eos atque pariatur explicabo eum.',1686038889,1686038889),(69,24,12,'Sit unde voluptates tenetur consectetur tempore alias quae.',1686669609,1686669609),(70,65,10,'Tempora eos dolore earum.',1687300329,1687300329),(71,80,45,'Minima sint quas voluptas nostrum natus provident.',1687931049,1687931049),(72,92,46,'Placeat occaecati repellendus ratione consectetur voluptatibus.',1688561769,1688561769),(73,31,6,'Excepturi recusandae assumenda est sed iusto harum.',1689192489,1689192489),(74,100,36,'Sunt iusto harum error exercitationem.',1689823209,1689823209),(75,85,26,'Velit unde debitis qui.',1690453929,1690453929),(76,13,46,'Nostrum nam soluta esse sapiente.',1691084649,1691084649),(77,53,48,'Saepe neque occaecati quidem voluptatem.',1691715369,1691715369),(78,45,13,'Distinctio dolore eveniet nemo.',1692346089,1692346089),(79,67,35,'Amet praesentium laborum non nemo ipsam eveniet assumenda.',1692976809,1692976809),(80,42,32,'Vel fugiat ab doloremque enim.',1693607529,1693607529),(81,58,36,'Dolorum est velit eum nobis nam consectetur.',1694238249,1694238249),(82,43,2,'Laudantium suscipit ea quasi incidunt sed.',1694868969,1694868969),(83,34,32,'Excepturi autem at excepturi.',1695499689,1695499689),(84,31,26,'Quas temporibus delectus pariatur consequuntur voluptas.',1696130409,1696130409),(85,22,33,'Voluptatem quos ducimus alias.',1696761129,1696761129),(86,17,22,'Necessitatibus dignissimos excepturi doloremque.',1697391849,1697391849),(87,56,24,'Commodi ut totam itaque magnam.',1698022569,1698022569),(88,35,48,'Commodi quibusdam occaecati harum delectus.',1698653289,1698653289),(89,78,19,'Quos nostrum alias iusto.',1699284009,1699284009),(90,79,27,'Laboriosam quos quis sunt similique.',1699914729,1699914729),(91,38,34,'Illo sequi quidem.',1700545449,1700545449),(92,44,29,'Aliquid dignissimos reprehenderit sit saepe ipsum.',1701176169,1701176169),(93,51,34,'Sit soluta illo earum.',1701806889,1701806889),(94,17,20,'Quod dolore laboriosam facere laborum quos nostrum.',1702437609,1702437609),(95,44,37,'Molestias deleniti odio neque atque accusamus.',1703068329,1703068329),(96,73,2,'Animi eos quam odit.',1703699049,1703699049),(97,48,20,'Error atque quaerat voluptatibus vero libero.',1704329769,1704329769),(98,13,48,'Repellendus sapiente minima est.',1704960489,1704960489),(99,87,35,'Dolor doloremque asperiores tempora porro maxime quo.',1705591209,1705591209),(100,67,13,'Impedit similique aliquam suscipit sed omnis.',1706221929,1706221929),(101,95,35,'Voluptatum placeat quidem.',1706852649,1706852649),(102,78,17,'Illo deleniti odio.',1707483369,1707483369),(103,21,50,'Enim voluptates dolores.',1708114089,1708114089),(104,44,46,'Consequatur excepturi cumque officiis ea.',1708744809,1708744809),(105,58,10,'Recusandae numquam aliquid perferendis.',1709375529,1709375529),(106,87,43,'Minus reiciendis dolore magnam quisquam.',1710006249,1710006249),(107,25,21,'Aliquam impedit fugiat.',1710636969,1710636969),(108,68,47,'Hic facere est suscipit minus necessitatibus ratione ad.',1711267689,1711267689),(109,44,39,'Ut vitae et.',1711898409,1711898409),(110,34,35,'Error quasi nam eius fuga laborum possimus.',1712529129,1712529129),(111,29,24,'Amet animi iusto temporibus.',1713159849,1713159849),(112,98,21,'Temporibus hic expedita nam distinctio fugiat consequuntur.',1713790569,1713790569),(113,6,30,'Nemo explicabo dolorum harum ea asperiores.',1714421289,1714421289),(114,79,5,'Hic dolor mollitia autem culpa autem modi.',1715052009,1715052009),(115,4,25,'Quos minus impedit iure repellat.',1715682729,1715682729),(116,55,5,'Atque cupiditate quam voluptate.',1716313449,1716313449),(117,38,22,'Nemo itaque iusto facilis ex voluptatem.',1716944169,1716944169),(118,11,34,'Voluptate porro laudantium.',1717574889,1717574889),(119,78,12,'Labore ipsa labore veritatis voluptates hic.',1718205609,1718205609),(120,12,34,'Ex vitae qui assumenda.',1718836329,1718836329),(121,61,17,'Repudiandae ab quod quos veritatis iure.',1719467049,1719467049),(122,6,42,'Libero perferendis nobis aperiam voluptate minus deserunt saepe.',1720097769,1720097769),(123,60,41,'Iste occaecati libero officiis dolores ea.',1720728489,1720728489),(124,8,41,'Vel deserunt doloribus perspiciatis.',1721359209,1721359209),(125,34,21,'Aliquam esse ipsum quibusdam inventore.',1721989929,1721989929),(126,10,28,'Nulla rem dolorem ut.',1722620649,1722620649),(127,86,14,'Voluptatem beatae voluptas atque est totam cum laudantium.',1723251369,1723251369),(128,34,4,'Repudiandae dolore ab.',1723882089,1723882089),(129,6,29,'Explicabo repellendus odio.',1724512809,1724512809),(130,49,41,'Illum temporibus quos possimus.',1725143529,1725143529),(131,66,12,'Hic ipsa laboriosam adipisci quos culpa dicta sunt.',1725774249,1725774249),(132,62,46,'Nemo molestiae dolores possimus est.',1726404969,1726404969),(133,18,49,'Hic fugiat ad delectus voluptatum exercitationem eaque.',1727035689,1727035689),(134,80,7,'Dolor asperiores doloribus nemo cupiditate qui dignissimos minus.',1727666409,1727666409),(135,1,43,'Doloremque iure sit pariatur magni.',1728297129,1728297129),(136,15,8,'Tempore quam ex aliquid ad ducimus facilis adipisci.',1728927849,1728927849),(137,98,44,'Ab aliquam qui quis nobis error ad.',1729558569,1729558569),(138,14,49,'Doloremque animi ea a incidunt.',1730189289,1730189289),(139,8,8,'Nulla distinctio fuga blanditiis autem molestias dolor provident.',1730820009,1730820009),(140,87,40,'Error tempore repudiandae totam tempora possimus possimus.',1731450729,1731450729),(141,80,32,'Doloribus eum numquam esse.',1732081449,1732081449),(142,40,10,'Molestiae cum eaque corporis nihil velit sapiente.',1732712169,1732712169),(143,72,34,'Mollitia fugit similique aliquam ipsam aperiam ducimus.',1733342889,1733342889),(144,59,15,'Officia molestiae ea numquam repudiandae a.',1733973609,1733973609),(145,3,15,'Numquam perferendis vel eveniet magnam.',1734604329,1734604329),(146,71,20,'Sit quae similique asperiores totam nihil assumenda facilis.',1735235049,1735235049),(147,3,7,'Incidunt nobis occaecati nostrum ut.',1735865769,1735865769),(148,96,16,'Commodi rerum aperiam porro expedita iusto placeat et.',1736496489,1736496489),(149,36,19,'Velit autem culpa cumque eos blanditiis sunt culpa.',1737127209,1737127209),(150,33,43,'Facilis non dolore eum quod ullam.',1737757929,1737757929);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_file`
--

DROP TABLE IF EXISTS `comment_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int NOT NULL,
  `file_id` int NOT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_file_index_14` (`comment_id`,`file_id`),
  KEY `idx-comment_file-comment_id` (`comment_id`),
  KEY `idx-comment_file-comment_id-weight` (`comment_id`,`weight`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `comment_file_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_file`
--

LOCK TABLES `comment_file` WRITE;
/*!40000 ALTER TABLE `comment_file` DISABLE KEYS */;
INSERT INTO `comment_file` VALUES (1,52,51,0,1643780649),(2,1,52,0,1645672809),(3,28,53,0,1647564969),(4,10,54,0,1649457129),(5,41,55,0,1651349289),(6,27,56,0,1653241449),(7,116,57,0,1655133609),(8,51,58,0,1657025769),(9,135,59,0,1658917929),(10,64,60,0,1660810089),(11,96,61,0,1662702249),(12,72,62,0,1664594409),(13,93,63,0,1666486569),(14,75,64,0,1668378729),(15,42,65,0,1670270889),(16,49,66,0,1672163049),(17,73,67,0,1674055209),(18,93,68,0,1675947369),(19,127,69,0,1677839529),(20,45,70,0,1679731689),(21,71,71,0,1681623849),(22,109,72,0,1683516009),(23,106,73,0,1685408169),(24,19,74,0,1687300329),(25,99,75,0,1689192489),(26,93,76,0,1691084649),(27,69,77,0,1692976809),(28,8,78,0,1694868969),(29,100,79,0,1696761129),(30,120,80,0,1698653289),(31,12,81,0,1700545449),(32,86,82,0,1702437609),(33,107,83,0,1704329769),(34,70,84,0,1706221929),(35,136,85,0,1708114089),(36,136,86,0,1710006249),(37,136,87,0,1711898409),(38,125,88,0,1713790569),(39,92,89,0,1715682729),(40,24,90,0,1717574889),(41,39,91,0,1719467049),(42,30,92,0,1721359209),(43,73,93,0,1723251369),(44,67,94,0,1725143529),(45,137,95,0,1727035689),(46,102,96,0,1728927849),(47,29,97,0,1730820009),(48,20,98,0,1732712169),(49,83,99,0,1734604329),(50,31,100,0,1736496489);
/*!40000 ALTER TABLE `comment_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `file_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_image` tinyint NOT NULL DEFAULT '0',
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,12,'/uploads/posts/ipsam.gif',5965439,'ipsam.gif','image/gif',1,1643780649),(2,21,'/uploads/posts/hic.js',3002134,'hic.js','application/msword',0,1645672809),(3,15,'/uploads/posts/repellendus.json',548411,'repellendus.json','application/pdf',0,1647564969),(4,50,'/uploads/posts/officiis.jpg',6598502,'officiis.jpg','image/png',1,1649457129),(5,23,'/uploads/posts/eveniet.gif',9448116,'eveniet.gif','image/gif',1,1651349289),(6,22,'/uploads/posts/atque.html',3827903,'atque.html','application/pdf',0,1653241449),(7,38,'/uploads/posts/iste.gif',4288726,'iste.gif','image/png',1,1655133609),(8,20,'/uploads/posts/nihil.css',8582179,'nihil.css','application/msword',0,1657025769),(9,39,'/uploads/posts/neque.gif',1577906,'neque.gif','image/jpeg',1,1658917929),(10,1,'/uploads/posts/expedita.png',4829230,'expedita.png','image/jpeg',1,1660810089),(11,42,'/uploads/posts/fugiat.jpeg',6081495,'fugiat.jpeg','image/jpeg',1,1662702249),(12,19,'/uploads/posts/voluptas.json',443556,'voluptas.json','application/msword',0,1664594409),(13,4,'/uploads/posts/debitis.css',8675826,'debitis.css','text/plain',0,1666486569),(14,39,'/uploads/posts/occaecati.html',9489625,'occaecati.html','application/pdf',0,1668378729),(15,24,'/uploads/posts/cupiditate.html',6302163,'cupiditate.html','application/msword',0,1670270889),(16,17,'/uploads/posts/ullam.csv',8127758,'ullam.csv','text/plain',0,1672163049),(17,19,'/uploads/posts/architecto.jpg',9863980,'architecto.jpg','image/jpeg',1,1674055209),(18,7,'/uploads/posts/dolor.png',4983482,'dolor.png','image/jpeg',1,1675947369),(19,5,'/uploads/posts/quis.bmp',3255613,'quis.bmp','image/jpeg',1,1677839529),(20,6,'/uploads/posts/quo.json',5572195,'quo.json','application/pdf',0,1679731689),(21,20,'/uploads/posts/explicabo.txt',5378043,'explicabo.txt','application/msword',0,1681623849),(22,12,'/uploads/posts/voluptatibus.tiff',428465,'voluptatibus.tiff','image/jpeg',1,1683516009),(23,26,'/uploads/posts/cumque.csv',3317064,'cumque.csv','text/plain',0,1685408169),(24,3,'/uploads/posts/error.png',4376446,'error.png','image/jpeg',1,1687300329),(25,18,'/uploads/posts/vitae.jpg',3662817,'vitae.jpg','image/gif',1,1689192489),(26,7,'/uploads/posts/ratione.html',6408077,'ratione.html','application/pdf',0,1691084649),(27,7,'/uploads/posts/quaerat.tiff',2274743,'quaerat.tiff','image/png',1,1692976809),(28,13,'/uploads/posts/quis.jpg',6386447,'quis.jpg','image/jpeg',1,1694868969),(29,16,'/uploads/posts/necessitatibus.jpeg',3286093,'necessitatibus.jpeg','image/png',1,1696761129),(30,8,'/uploads/posts/laborum.png',2660690,'laborum.png','image/gif',1,1698653289),(31,10,'/uploads/posts/iure.jpg',381026,'iure.jpg','image/png',1,1700545449),(32,29,'/uploads/posts/commodi.jpg',7119129,'commodi.jpg','image/png',1,1702437609),(33,8,'/uploads/posts/nostrum.json',7265987,'nostrum.json','application/msword',0,1704329769),(34,25,'/uploads/posts/minima.jpg',9791820,'minima.jpg','image/jpeg',1,1706221929),(35,47,'/uploads/posts/voluptatem.json',8453970,'voluptatem.json','text/plain',0,1708114089),(36,45,'/uploads/posts/cumque.tiff',3289227,'cumque.tiff','image/gif',1,1710006249),(37,46,'/uploads/posts/sed.tiff',6502893,'sed.tiff','image/png',1,1711898409),(38,41,'/uploads/posts/eaque.js',5887040,'eaque.js','application/msword',0,1713790569),(39,48,'/uploads/posts/id.txt',2682609,'id.txt','application/msword',0,1715682729),(40,17,'/uploads/posts/debitis.jpeg',7384592,'debitis.jpeg','image/gif',1,1717574889),(41,33,'/uploads/posts/hic.png',9440311,'hic.png','image/png',1,1719467049),(42,3,'/uploads/posts/ratione.png',7570502,'ratione.png','image/gif',1,1721359209),(43,46,'/uploads/posts/dicta.jpg',3673612,'dicta.jpg','image/jpeg',1,1723251369),(44,48,'/uploads/posts/tempora.txt',6720888,'tempora.txt','application/pdf',0,1725143529),(45,47,'/uploads/posts/quos.json',9054765,'quos.json','application/pdf',0,1727035689),(46,34,'/uploads/posts/molestias.csv',7057868,'molestias.csv','text/plain',0,1728927849),(47,8,'/uploads/posts/deserunt.gif',8320548,'deserunt.gif','image/png',1,1730820009),(48,41,'/uploads/posts/eos.tiff',8236422,'eos.tiff','image/jpeg',1,1732712169),(49,35,'/uploads/posts/distinctio.jpeg',7313003,'distinctio.jpeg','image/gif',1,1734604329),(50,40,'/uploads/posts/dolores.csv',971434,'dolores.csv','text/plain',0,1736496489),(51,24,'/uploads/comments/aut.bmp',6269923,'aut.bmp','image/png',1,1643780649),(52,30,'/uploads/comments/doloribus.json',686024,'doloribus.json','text/plain',0,1645672809),(53,43,'/uploads/comments/repellat.jpg',4090476,'repellat.jpg','image/jpeg',1,1647564969),(54,13,'/uploads/comments/aliquam.jpeg',511742,'aliquam.jpeg','image/jpeg',1,1649457129),(55,32,'/uploads/comments/deleniti.tiff',9496339,'deleniti.tiff','image/png',1,1651349289),(56,22,'/uploads/comments/praesentium.tiff',6582009,'praesentium.tiff','image/jpeg',1,1653241449),(57,41,'/uploads/comments/tenetur.json',8472670,'tenetur.json','application/msword',0,1655133609),(58,23,'/uploads/comments/voluptatem.jpg',7910582,'voluptatem.jpg','image/gif',1,1657025769),(59,21,'/uploads/comments/beatae.jpg',1653070,'beatae.jpg','image/gif',1,1658917929),(60,14,'/uploads/comments/saepe.csv',5769470,'saepe.csv','text/plain',0,1660810089),(61,42,'/uploads/comments/vitae.jpg',9608257,'vitae.jpg','image/png',1,1662702249),(62,47,'/uploads/comments/animi.csv',7582400,'animi.csv','application/pdf',0,1664594409),(63,45,'/uploads/comments/error.csv',1645193,'error.csv','text/plain',0,1666486569),(64,40,'/uploads/comments/dolor.csv',5903015,'dolor.csv','application/msword',0,1668378729),(65,23,'/uploads/comments/quo.jpg',3006565,'quo.jpg','image/png',1,1670270889),(66,11,'/uploads/comments/porro.tiff',5657371,'porro.tiff','image/gif',1,1672163049),(67,19,'/uploads/comments/et.html',983446,'et.html','application/msword',0,1674055209),(68,14,'/uploads/comments/a.tiff',3219021,'a.tiff','image/png',1,1675947369),(69,18,'/uploads/comments/aliquam.html',2366166,'aliquam.html','application/pdf',0,1677839529),(70,26,'/uploads/comments/enim.jpg',7061512,'enim.jpg','image/jpeg',1,1679731689),(71,49,'/uploads/comments/ratione.png',9798476,'ratione.png','image/jpeg',1,1681623849),(72,29,'/uploads/comments/dolorum.jpeg',6040245,'dolorum.jpeg','image/png',1,1683516009),(73,39,'/uploads/comments/dolor.tiff',1110122,'dolor.tiff','image/png',1,1685408169),(74,5,'/uploads/comments/earum.html',4192277,'earum.html','application/msword',0,1687300329),(75,29,'/uploads/comments/nemo.js',6308381,'nemo.js','application/msword',0,1689192489),(76,26,'/uploads/comments/ipsa.tiff',7842350,'ipsa.tiff','image/jpeg',1,1691084649),(77,13,'/uploads/comments/eligendi.tiff',167114,'eligendi.tiff','image/gif',1,1692976809),(78,15,'/uploads/comments/ab.jpg',9088685,'ab.jpg','image/jpeg',1,1694868969),(79,44,'/uploads/comments/voluptas.bmp',4060316,'voluptas.bmp','image/gif',1,1696761129),(80,9,'/uploads/comments/expedita.jpeg',9956815,'expedita.jpeg','image/jpeg',1,1698653289),(81,12,'/uploads/comments/porro.html',2696307,'porro.html','application/msword',0,1700545449),(82,7,'/uploads/comments/quas.jpeg',6734275,'quas.jpeg','image/gif',1,1702437609),(83,29,'/uploads/comments/nihil.png',5472899,'nihil.png','image/gif',1,1704329769),(84,35,'/uploads/comments/quaerat.bmp',6127942,'quaerat.bmp','image/jpeg',1,1706221929),(85,50,'/uploads/comments/suscipit.gif',9517194,'suscipit.gif','image/gif',1,1708114089),(86,4,'/uploads/comments/assumenda.jpeg',9255339,'assumenda.jpeg','image/gif',1,1710006249),(87,8,'/uploads/comments/modi.jpeg',4283978,'modi.jpeg','image/gif',1,1711898409),(88,31,'/uploads/comments/optio.gif',369319,'optio.gif','image/png',1,1713790569),(89,34,'/uploads/comments/eligendi.bmp',1843565,'eligendi.bmp','image/jpeg',1,1715682729),(90,44,'/uploads/comments/eligendi.tiff',9642204,'eligendi.tiff','image/jpeg',1,1717574889),(91,34,'/uploads/comments/atque.html',4372092,'atque.html','application/msword',0,1719467049),(92,22,'/uploads/comments/necessitatibus.json',7112325,'necessitatibus.json','application/msword',0,1721359209),(93,7,'/uploads/comments/incidunt.bmp',8517371,'incidunt.bmp','image/jpeg',1,1723251369),(94,36,'/uploads/comments/accusamus.txt',8867485,'accusamus.txt','text/plain',0,1725143529),(95,43,'/uploads/comments/hic.js',917415,'hic.js','application/msword',0,1727035689),(96,38,'/uploads/comments/cum.gif',9219228,'cum.gif','image/jpeg',1,1728927849),(97,23,'/uploads/comments/debitis.jpeg',4426630,'debitis.jpeg','image/jpeg',1,1730820009),(98,7,'/uploads/comments/alias.jpeg',6467933,'alias.jpeg','image/jpeg',1,1732712169),(99,36,'/uploads/comments/minus.csv',6831159,'minus.csv','application/pdf',0,1734604329),(100,45,'/uploads/comments/repudiandae.css',6016796,'repudiandae.css','application/pdf',0,1736496489);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref_id` int NOT NULL,
  `type` enum('Post','Comment') COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_category_id` int NOT NULL,
  `raised_by` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','Resolved','Unable to resolve','Dismissed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `resolved_note` text COLLATE utf8mb4_unicode_ci,
  `resolved_by` int DEFAULT NULL,
  `resolved_at` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-flag-status` (`status`),
  KEY `idx-flag-ref_id-type` (`ref_id`,`type`),
  KEY `flag_category_id` (`flag_category_id`),
  KEY `raised_by` (`raised_by`),
  KEY `resolved_by` (`resolved_by`),
  CONSTRAINT `flag_ibfk_1` FOREIGN KEY (`ref_id`) REFERENCES `post` (`id`),
  CONSTRAINT `flag_ibfk_2` FOREIGN KEY (`ref_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `flag_ibfk_3` FOREIGN KEY (`flag_category_id`) REFERENCES `flag_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `flag_ibfk_4` FOREIGN KEY (`raised_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `flag_ibfk_5` FOREIGN KEY (`resolved_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag`
--

LOCK TABLES `flag` WRITE;
/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
INSERT INTO `flag` VALUES (1,53,'Post',5,4,'Facilis debitis voluptas reprehenderit voluptate. Illo recusandae amet aliquid veniam. Occaecati adipisci minima modi nostrum nulla.','Pending',NULL,NULL,NULL,1643780649,1643780649),(2,58,'Post',2,28,'Ex nihil expedita nam suscipit sunt. Blanditiis temporibus sint provident. Natus odio minus.','Dismissed','Dolorum sapiente nobis repudiandae exercitationem necessitatibus. Quibusdam tempore delectus occaecati tempore facere dicta minima.',18,1662788649,1662702249,1662702249),(3,54,'Post',4,31,'Necessitatibus totam perferendis. Corrupti fugit nesciunt in in facilis necessitatibus. Eos atque maiores nostrum quam ipsa suscipit illo.','Pending',NULL,NULL,NULL,1681623849,1681623849),(4,47,'Post',5,43,'Fugiat amet quasi rem quaerat eligendi molestias. Voluptates temporibus voluptatum dolore dolores praesentium.','Pending',NULL,NULL,NULL,1700545449,1700545449),(5,1,'Post',1,7,'Neque commodi enim perspiciatis dolore molestiae. Perspiciatis eveniet ut eius. A ex quas laudantium mollitia assumenda.\nAliquid qui eos. Aliquid praesentium esse accusamus animi.','Pending',NULL,NULL,NULL,1719467049,1719467049),(6,10,'Comment',1,19,'Beatae beatae quaerat sequi odit. Sint necessitatibus distinctio possimus expedita.','Pending',NULL,NULL,NULL,1643780649,1643780649),(7,96,'Comment',5,23,'At earum necessitatibus exercitationem laudantium consectetur excepturi ducimus. Harum iure dolores asperiores odio animi quas.','Pending',NULL,NULL,NULL,1662702249,1662702249),(8,9,'Comment',5,27,'Assumenda deserunt fuga blanditiis. Reprehenderit dolores assumenda quod debitis quos. Asperiores alias corrupti.','Unable to resolve','Architecto consectetur mollitia sit nesciunt aliquid voluptatum ut. Quas adipisci nisi iste.',22,1681710249,1681623849,1681623849),(9,95,'Comment',1,42,'Ut tempora laborum corporis reprehenderit. Iste dolor fuga atque cupiditate. Ratione rem deserunt id eum iure error.','Resolved','Natus enim voluptatibus error. Nostrum dolores praesentium nobis sunt.\nUnde quisquam impedit placeat dicta aliquam. Vero quas a rerum laudantium suscipit.',50,1700631849,1700545449,1700545449),(10,52,'Comment',1,45,'Officia recusandae in enim. Vero natus id.\nIure ex delectus fugiat est eligendi.\nSed porro enim cupiditate recusandae quas.','Dismissed','Nemo est veritatis id ullam.\nArchitecto nesciunt perferendis quae deserunt quis. Libero debitis quo suscipit laborum ad harum.',15,1719553449,1719467049,1719467049);
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flag_category`
--

DROP TABLE IF EXISTS `flag_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flag_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flag_category_index_10` (`name`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flag_category`
--

LOCK TABLES `flag_category` WRITE;
/*!40000 ALTER TABLE `flag_category` DISABLE KEYS */;
INSERT INTO `flag_category` VALUES (1,'Spam','spam','Active',1738388649,1738388649),(2,'Harassment','harassment','Active',1738388649,1738388649),(3,'Inappropriate','inappropriate','Active',1738388649,1738388649),(4,'Violence','violence','Active',1738388649,1738388649),(5,'Other','other','Active',1738388649,1738388649);
/*!40000 ALTER TABLE `flag_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint DEFAULT '0',
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_slug` (`name_slug`),
  UNIQUE KEY `uk-group-name-status` (`name`,`status`),
  KEY `idx-group-status` (`status`),
  KEY `idx-group-status-is_public` (`status`,`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'Johnson, Park and Jenkins','johnson-park-and-jenkins','Active',1,1643780649,1643780649),(2,'Myers-Duncan','myers-duncan','Active',0,1653241449,1653241449),(3,'Tanner-Alexander','tanner-alexander','Active',1,1662702249,1662702249),(4,'Maldonado-Martinez','maldonado-martinez','Active',1,1672163049,1672163049),(5,'Chen, Castillo and Perez','chen-castillo-and-perez','Active',0,1681623849,1681623849),(6,'Mcdaniel PLC','mcdaniel-plc','Active',1,1691084649,1691084649),(7,'Miller, Sullivan and Erickson','miller-sullivan-and-erickson','Active',0,1700545449,1700545449),(8,'Freeman-Anthony','freeman-anthony','Active',0,1710006249,1710006249),(9,'Marquez-Horton','marquez-horton','Active',1,1719467049,1719467049),(10,'Jenkins, Cross and Yang','jenkins-cross-and-yang','Active',1,1728927849,1728927849);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user`
--

DROP TABLE IF EXISTS `group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_user` (
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  `is_admin` tinyint DEFAULT '0',
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `idx-group_user-user_id` (`user_id`),
  KEY `idx-group_user-group_id` (`group_id`),
  CONSTRAINT `group_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `group_user_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user`
--

LOCK TABLES `group_user` WRITE;
/*!40000 ALTER TABLE `group_user` DISABLE KEYS */;
INSERT INTO `group_user` VALUES (1,8,0,1702437609),(2,4,1,1668378729),(2,10,1,1670270889),(5,2,0,1691084649),(10,2,0,1681623849),(11,1,1,1666486569),(11,7,1,1683516009),(13,5,1,1700545449),(14,2,0,1715682729),(14,3,1,1698653289),(16,9,0,1657025769),(18,2,1,1660810089),(18,4,1,1662702249),(18,9,0,1677839529),(19,6,0,1653241449),(23,1,0,1689192489),(24,1,0,1721359209),(24,9,0,1687300329),(25,4,0,1734604329),(25,6,0,1732712169),(25,9,0,1719467049),(26,2,0,1727035689),(28,2,0,1692976809),(28,8,1,1647564969),(29,3,0,1711898409),(29,5,1,1717574889),(29,6,0,1728927849),(29,8,0,1736496489),(30,4,0,1679731689),(31,1,1,1658917929),(31,9,0,1704329769),(35,6,1,1651349289),(36,1,0,1708114089),(36,4,0,1710006249),(36,7,1,1645672809),(38,2,0,1723251369),(38,3,1,1706221929),(42,9,1,1655133609),(43,8,0,1696761129),(43,9,1,1649457129),(45,6,1,1643780649),(46,2,0,1675947369),(47,2,1,1664594409),(48,2,0,1674055209),(48,8,1,1685408169),(50,1,0,1730820009),(50,10,1,1672163049);
/*!40000 ALTER TABLE `group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int DEFAULT NULL,
  `visibility` enum('Public','Private') COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_lat` decimal(10,8) DEFAULT NULL,
  `place_lon` decimal(11,8) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,2,NULL,'Public',NULL,NULL,NULL,'Minus quis vero. Officiis suscipit similique repudiandae. Sint quidem dignissimos sint deleniti tenetur.',1643780649,1643780649),(2,31,NULL,'Public',NULL,NULL,NULL,'Fugit corrupti repellendus dolorem. Inventore optio odit omnis voluptas natus. Ab iusto nihil.',1644726729,1644726729),(3,40,NULL,'Public',NULL,NULL,NULL,'Soluta eum quasi. Temporibus pariatur veritatis fugiat praesentium reiciendis maxime.',1645672809,1645672809),(4,13,NULL,'Public',NULL,NULL,NULL,'Dicta illum vel quasi dignissimos aut provident animi. Et quidem blanditiis.',1646618889,1646618889),(5,35,NULL,'Public',NULL,NULL,NULL,'Vero inventore adipisci pariatur. Voluptatibus aperiam unde inventore debitis fuga repudiandae.',1647564969,1647564969),(6,9,NULL,'Public',NULL,NULL,NULL,'Fugit similique dicta molestias delectus aperiam. Odit cupiditate quae mollitia fugit quaerat totam. Vero nobis voluptas dicta architecto.',1648511049,1648511049),(7,21,2,'Public',NULL,NULL,NULL,'Earum mollitia consectetur quidem quas quae qui sint. Repellendus praesentium aperiam repudiandae odit esse. Consequuntur beatae vero beatae omnis eum.',1649457129,1649457129),(8,3,NULL,'Public',NULL,NULL,NULL,'Ab ex neque labore molestiae. Consequatur illo enim. Non earum cupiditate hic.',1650403209,1650403209),(9,3,NULL,'Public','Lot 13, Jalan 5/9',46.32374000,-117.70755000,'Quidem earum officia dicta nihil necessitatibus itaque. Hic molestias quae minus. Incidunt saepe commodi quae maiores.',1651349289,1651349289),(10,12,NULL,'Public','91, Jln 2/8',41.15376000,-116.97725000,'Dolores numquam quos nostrum alias. Enim molestiae quibusdam amet molestiae. Porro illo pariatur nihil inventore dolor.',1652295369,1652295369),(11,35,NULL,'Public',NULL,NULL,NULL,'Reprehenderit molestias nam. Alias iure vitae. Exercitationem illum est iusto nemo maxime.',1653241449,1653241449),(12,47,NULL,'Public',NULL,NULL,NULL,'Iusto accusantium fugiat corporis culpa. Repellendus doloremque omnis magni voluptatum placeat neque cumque. Beatae at pariatur nemo.',1654187529,1654187529),(13,2,NULL,'Public',NULL,NULL,NULL,'Beatae aspernatur occaecati asperiores eaque. Ab nisi consequuntur voluptatibus repudiandae mollitia voluptates. Nam quo suscipit voluptates. Cumque maiores quidem labore asperiores.',1655133609,1655133609),(14,5,NULL,'Public','Lot w-75-02, Jalan 9/5',47.92526000,-120.43572000,'Exercitationem consequatur dolorem ipsa distinctio ea. Iure ipsa omnis repudiandae eius aliquid sed. Facilis veritatis beatae dolorum.',1656079689,1656079689),(15,37,NULL,'Public',NULL,NULL,NULL,'Error eaque amet quis. Repudiandae veniam accusamus sit. Temporibus enim eius assumenda quibusdam aliquam tempora.',1657025769,1657025769),(16,1,NULL,'Public',NULL,NULL,NULL,'Ea ab explicabo eius sequi tenetur nihil ipsam. Porro fugit similique occaecati placeat ipsa quae. Dolorum aliquam fugit similique.',1657971849,1657971849),(17,20,NULL,'Public',NULL,NULL,NULL,'Assumenda numquam dolorem voluptates odit dignissimos. Nam quos cum beatae quae nam expedita.',1658917929,1658917929),(18,8,NULL,'Public',NULL,NULL,NULL,'Totam id culpa esse sequi aspernatur.',1659864009,1659864009),(19,9,NULL,'Public',NULL,NULL,NULL,'Iure labore veritatis veritatis porro placeat eius. Ullam occaecati dignissimos dignissimos quisquam perspiciatis id. Sequi itaque qui quaerat voluptatibus libero.',1660810089,1660810089),(20,4,NULL,'Public','B-97-77, Jalan 42N',27.09978000,-75.60804000,'Illo ad quasi voluptates. Placeat perspiciatis accusamus in quas quam. Fuga repudiandae sequi sapiente.',1661756169,1661756169),(21,8,NULL,'Public','t-55-55, Jalan 9',41.55838000,-81.26367000,'Repudiandae similique quae ab modi. Eum aliquam eos soluta cumque. Nisi commodi inventore facilis.',1662702249,1662702249),(22,33,NULL,'Public',NULL,NULL,NULL,'Eum commodi suscipit corporis. Minima dignissimos nihil ex similique est autem. Earum nihil quae velit.',1663648329,1663648329),(23,40,NULL,'Private',NULL,NULL,NULL,'Reprehenderit iure minus nesciunt porro soluta. Officia minus incidunt fuga.',1664594409,1664594409),(24,12,NULL,'Public',NULL,NULL,NULL,'Vero animi saepe delectus. Itaque ratione sed.',1665540489,1665540489),(25,20,NULL,'Public','No. 5-1, Jalan 2F',38.54491000,-73.97069000,'Laboriosam iste aut qui. Praesentium excepturi quam.',1666486569,1666486569),(26,9,NULL,'Public',NULL,NULL,NULL,'Delectus quaerat esse magnam. Itaque vel quae voluptate labore sint tenetur. Nemo nemo temporibus nihil.',1667432649,1667432649),(27,14,NULL,'Public',NULL,NULL,NULL,'Eos nostrum numquam explicabo odit. Sunt quos pariatur natus dolore. Eveniet vel eaque optio qui vero. Consequatur quod aliquam.',1668378729,1668378729),(28,50,NULL,'Public',NULL,NULL,NULL,'Provident tempora vel delectus odio harum nihil. Amet doloribus in dolorum. Cumque blanditiis ea odit.',1669324809,1669324809),(29,46,NULL,'Public',NULL,NULL,NULL,'Minus debitis sequi quisquam explicabo magnam quos. Facilis libero ratione labore delectus cupiditate. Dicta veniam fugit labore excepturi.',1670270889,1670270889),(30,33,NULL,'Public','1, Jalan 3I',25.67927000,-73.95097000,'Iste modi dolore nam corporis repudiandae aliquid reiciendis. Culpa alias quod natus. Laborum accusamus tempore distinctio sequi quod vel.',1671216969,1671216969),(31,41,3,'Public',NULL,NULL,NULL,'Fugit asperiores excepturi autem ea sint hic. Placeat accusantium occaecati perferendis odit fuga cum.',1672163049,1672163049),(32,39,NULL,'Private',NULL,NULL,NULL,'Molestias inventore minus maxime reiciendis aliquid vitae. Eius quo cupiditate.',1673109129,1673109129),(33,6,NULL,'Public','Lot b-09-87, Jalan Kuala Kangsar 7/1',34.25628000,-73.75513000,'Beatae placeat est repudiandae.',1674055209,1674055209),(34,34,NULL,'Public','No. 4-3, Lorong 4',40.55760000,-93.12577000,'Dicta occaecati labore asperiores. Dolorem a dolore laudantium beatae.',1675001289,1675001289),(35,28,NULL,'Public',NULL,NULL,NULL,'Fugit atque porro culpa eveniet officiis architecto distinctio. Excepturi animi doloribus fugiat animi rerum ducimus.',1675947369,1675947369),(36,6,NULL,'Public',NULL,NULL,NULL,'Sit maiores doloremque voluptatum nemo nam incidunt. Pariatur praesentium consequuntur excepturi tenetur cum. Ipsa repellat esse veritatis.',1676893449,1676893449),(37,5,NULL,'Public',NULL,NULL,NULL,'Ipsa adipisci nesciunt similique tenetur laboriosam animi accusantium. Laborum sint doloremque sunt debitis quibusdam eius tempore.',1677839529,1677839529),(38,50,NULL,'Public','Lot 22, Jalan Doraisamy 1/24',39.45621000,-122.20540000,'Non hic hic delectus in. Qui sint voluptates sapiente beatae nesciunt. Deserunt totam nam architecto.',1678785609,1678785609),(39,32,1,'Public',NULL,NULL,NULL,'Eaque earum perferendis soluta nobis. Possimus earum est voluptas impedit at. Adipisci laboriosam earum enim animi dolore accusamus. Autem cum velit sint perspiciatis consequuntur nisi.',1679731689,1679731689),(40,30,NULL,'Public',NULL,NULL,NULL,'Quidem nemo eveniet expedita. Repudiandae architecto magnam hic fugiat quos iste. Sed deleniti aspernatur est dolor eius sit.',1680677769,1680677769),(41,34,8,'Public',NULL,NULL,NULL,'Culpa veniam adipisci libero laboriosam atque enim. Voluptate commodi qui voluptatum consequuntur.',1681623849,1681623849),(42,18,NULL,'Public',NULL,NULL,NULL,'Quo rem facere temporibus itaque porro possimus rem. Id provident iste qui fugit omnis. Quis iusto ipsum et ducimus recusandae repellat.',1682569929,1682569929),(43,13,NULL,'Public',NULL,NULL,NULL,'Saepe excepturi fugiat voluptatibus nesciunt sequi dolorem. Facilis facilis totam optio explicabo. Accusantium pariatur voluptatibus atque fugit voluptate.',1683516009,1683516009),(44,16,10,'Public','No. 5, Lorong Kebun Bunga 3/7',32.44874000,-83.55521000,'Nam ab dolores at dignissimos. Eum dolores reprehenderit explicabo itaque porro ipsa labore.',1684462089,1684462089),(45,9,NULL,'Public',NULL,NULL,NULL,'Molestiae placeat ipsam incidunt voluptates voluptate eum cumque. Voluptatibus accusantium autem neque neque. Quis ullam velit velit voluptates nobis officia esse.',1685408169,1685408169),(46,7,8,'Public',NULL,NULL,NULL,'Distinctio beatae excepturi ut ipsum. Impedit error in. Quasi quos illum deserunt ea officiis.',1686354249,1686354249),(47,5,10,'Public',NULL,NULL,NULL,'Facere nemo optio sunt laborum. Rem hic dicta libero aut mollitia in.',1687300329,1687300329),(48,31,NULL,'Public',NULL,NULL,NULL,'Voluptatem recusandae nam doloribus natus voluptatem praesentium. Praesentium cupiditate atque distinctio velit.',1688246409,1688246409),(49,36,NULL,'Public',NULL,NULL,NULL,'Assumenda aliquam cumque aliquid ratione nulla. Quaerat tenetur quos adipisci.',1689192489,1689192489),(50,15,8,'Public',NULL,NULL,NULL,'Modi repudiandae possimus at nam ex. Quaerat nulla adipisci blanditiis debitis. Nisi a possimus doloremque error.',1690138569,1690138569),(51,26,NULL,'Public',NULL,NULL,NULL,'Ratione aspernatur aperiam quis. Iusto perspiciatis quod nam. Minus unde exercitationem enim autem aperiam id.',1691084649,1691084649),(52,45,NULL,'Public',NULL,NULL,NULL,'Itaque voluptatem facilis odit occaecati. Recusandae aut adipisci corporis dolor modi. Architecto quis id impedit quia sequi.',1692030729,1692030729),(53,9,NULL,'Public',NULL,NULL,NULL,'Numquam iure tempore sit vero harum tenetur. Occaecati adipisci temporibus.',1692976809,1692976809),(54,4,NULL,'Public',NULL,NULL,NULL,'Adipisci voluptates vitae voluptatibus quas at. Hic tenetur ducimus. Atque ea tempora pariatur itaque laboriosam.',1693922889,1693922889),(55,7,NULL,'Public',NULL,NULL,NULL,'Similique omnis dignissimos ducimus. Deleniti beatae molestias. Ut mollitia asperiores ducimus. Ea repellendus dolore commodi deserunt quo.',1694868969,1694868969),(56,20,NULL,'Public','3-2, Jalan 76N',32.91560000,-104.22884000,'Debitis officia alias nihil nemo at repudiandae. Numquam eius recusandae eligendi vitae.',1695815049,1695815049),(57,50,NULL,'Public','6-2, Jalan Air Itam 4/30',42.35843000,-74.96933000,'Sed saepe quia laudantium. Amet est eos voluptatibus porro. Praesentium quibusdam molestiae. Soluta in dolorum exercitationem.',1696761129,1696761129),(58,32,NULL,'Public','522, Jln Serian 1 98y',45.53929000,-71.80230000,'Dolor veritatis maiores expedita laborum. Magnam dolorem ipsam aut quis.',1697707209,1697707209),(59,35,NULL,'Public',NULL,NULL,NULL,'Quia cum ea sit magnam voluptate quibusdam. Voluptate eos dolores cumque atque. Repudiandae ad error dolores. Perspiciatis sint dolore totam ad aut dicta.',1698653289,1698653289),(60,5,NULL,'Public',NULL,NULL,NULL,'Quae provident excepturi sit. Corrupti repudiandae dolorem officia.',1699599369,1699599369),(61,50,NULL,'Public',NULL,NULL,NULL,'Quam quia incidunt voluptatum sequi laboriosam. Ipsam voluptatum voluptate illum.',1700545449,1700545449),(62,23,9,'Public',NULL,NULL,NULL,'Cupiditate facere rerum nam placeat corrupti quo. Quasi corrupti voluptate harum. Assumenda quas tempore.',1701491529,1701491529),(63,40,NULL,'Public','Lot 76, Jalan Vivekananda 5/86',38.91817000,-82.61573000,'Ea inventore eum velit. Beatae deserunt consequuntur sapiente voluptatum optio.',1702437609,1702437609),(64,18,NULL,'Public',NULL,NULL,NULL,'Eaque qui alias. Earum alias doloribus eius esse non illo.',1703383689,1703383689),(65,25,NULL,'Public',NULL,NULL,NULL,'Doloremque architecto sapiente. Voluptatibus dolorem maiores quod odit deserunt. Facilis natus eveniet rerum odit ipsum a.',1704329769,1704329769),(66,31,NULL,'Public',NULL,NULL,NULL,'Quis voluptatibus temporibus deleniti alias est. Id ab rerum at impedit. Nemo blanditiis totam occaecati.',1705275849,1705275849),(67,18,NULL,'Public',NULL,NULL,NULL,'Sequi quod quas veniam vel.',1706221929,1706221929),(68,37,5,'Public',NULL,NULL,NULL,'Expedita placeat aliquam harum. Assumenda harum quod. Aperiam officiis provident.',1707168009,1707168009),(69,20,NULL,'Public',NULL,NULL,NULL,'Quibusdam minus accusamus occaecati. Consectetur totam qui laborum.',1708114089,1708114089),(70,46,NULL,'Public','3, Jln Dato Abdul Rahman 9',31.12406000,-88.70464000,'Itaque itaque occaecati occaecati quae dolor est. Illum quod beatae non asperiores earum repellat iure. Vitae incidunt ipsum nisi ut facilis.',1709060169,1709060169),(71,25,1,'Public',NULL,NULL,NULL,'Neque voluptatem molestias minus tenetur quia.',1710006249,1710006249),(72,45,NULL,'Public',NULL,NULL,NULL,'Provident commodi autem cum inventore explicabo tempore.',1710952329,1710952329),(73,31,9,'Public',NULL,NULL,NULL,'Praesentium error totam perferendis. Perferendis alias eius quam. Non veniam numquam adipisci sit. Maiores reiciendis quas tempore.',1711898409,1711898409),(74,31,NULL,'Public',NULL,NULL,NULL,'Excepturi expedita sunt est. Perspiciatis ad neque ratione molestias veniam eligendi. Similique molestias veritatis dolorum commodi exercitationem ratione.',1712844489,1712844489),(75,18,NULL,'Public',NULL,NULL,NULL,'Possimus dolores cupiditate fugiat ea necessitatibus nihil esse. Quos fugit ab necessitatibus.',1713790569,1713790569),(76,11,5,'Public',NULL,NULL,NULL,'Odit harum necessitatibus aliquam ratione explicabo ipsa voluptates. Enim earum eveniet tempore distinctio reiciendis. Itaque est quas illo animi placeat cum consequuntur. Accusamus libero eaque id perferendis a.',1714736649,1714736649),(77,46,6,'Public','No. 94, Jalan 7',42.30865000,-116.97725000,'Dolorem in non ad sed dolor eveniet. Accusantium cupiditate at deserunt expedita. Omnis odio incidunt dolores aliquam ut fugit quo.',1715682729,1715682729),(78,19,NULL,'Public',NULL,NULL,NULL,'Veritatis voluptatem excepturi sit unde. Dolore exercitationem asperiores est dolorum repellendus. Illum enim autem incidunt.',1716628809,1716628809),(79,40,NULL,'Public',NULL,NULL,NULL,'Distinctio ratione libero ad illo maiores. Praesentium occaecati dolorum corporis veniam. Reprehenderit autem adipisci ut laborum non.',1717574889,1717574889),(80,26,NULL,'Public',NULL,NULL,NULL,'Excepturi error fugiat harum libero occaecati. Veritatis perferendis in unde. Autem totam vero ex consequatur qui.',1718520969,1718520969),(81,19,NULL,'Public','No. 3, Jalan Eaton 9W',40.27370000,-120.93549000,'Similique ipsa adipisci molestiae ratione maiores. Perferendis voluptatibus deleniti ullam inventore velit. In laborum odit minus dolorum. Iure sed odio reprehenderit expedita.',1719467049,1719467049),(82,13,NULL,'Public',NULL,NULL,NULL,'Libero tempore incidunt accusantium quis voluptate repudiandae. Saepe neque distinctio aut accusamus. Est possimus voluptatibus perspiciatis porro iusto doloremque quos.',1720413129,1720413129),(83,39,NULL,'Private',NULL,NULL,NULL,'Quae suscipit et accusantium. Cum porro quisquam ullam consequuntur. Ipsa esse iste quibusdam.',1721359209,1721359209),(84,18,NULL,'Public',NULL,NULL,NULL,'Cum deserunt commodi. Tempora vitae ad commodi amet. Rerum tempore molestiae nobis natus ipsum.',1722305289,1722305289),(85,26,NULL,'Public',NULL,NULL,NULL,'Ea voluptas sequi laboriosam expedita aspernatur recusandae. Sunt odit eligendi quod. Asperiores id suscipit unde aliquam error.',1723251369,1723251369),(86,50,2,'Public',NULL,NULL,NULL,'Possimus laudantium voluptas repellendus animi adipisci corrupti. Dolores ipsum sunt aut ad cupiditate velit. Cupiditate perferendis occaecati cum voluptatum omnis.',1724197449,1724197449),(87,11,1,'Public',NULL,NULL,NULL,'Excepturi totam laboriosam aspernatur laborum consequatur. Nihil voluptas natus modi. Vero veritatis aperiam pariatur libero.',1725143529,1725143529),(88,45,NULL,'Public',NULL,NULL,NULL,'Sit consectetur dicta. Fuga quo accusamus expedita neque dolorum necessitatibus.',1726089609,1726089609),(89,29,9,'Public',NULL,NULL,NULL,'Iure voluptatum consequatur et similique alias consectetur. Facere reprehenderit alias natus exercitationem quisquam eum. Nobis eius quaerat optio.',1727035689,1727035689),(90,39,NULL,'Public',NULL,NULL,NULL,'Rerum beatae esse culpa id. Dolores cupiditate ullam corrupti. Nobis excepturi inventore vel. Possimus quia enim reprehenderit animi labore.',1727981769,1727981769),(91,10,4,'Public',NULL,NULL,NULL,'Nam atque temporibus ratione. Recusandae illum at vitae. Doloremque eos dolorum omnis.',1728927849,1728927849),(92,46,2,'Public',NULL,NULL,NULL,'Earum temporibus deleniti. Vero voluptas maxime amet a earum culpa illum.',1729873929,1729873929),(93,14,2,'Public',NULL,NULL,NULL,'Atque nam iste distinctio assumenda. Quae doloremque facere quod at fugiat veritatis perspiciatis.',1730820009,1730820009),(94,33,1,'Public',NULL,NULL,NULL,'Magni officiis labore placeat. Odio incidunt odit laboriosam repellat neque nam. Ea cupiditate eum illo.',1731766089,1731766089),(95,7,NULL,'Public',NULL,NULL,NULL,'Iure eos mollitia quia rem nesciunt saepe. Repellendus voluptates asperiores illum. Nisi itaque est saepe eligendi soluta dignissimos.',1732712169,1732712169),(96,35,NULL,'Public',NULL,NULL,NULL,'Tempore quisquam est repudiandae distinctio minima. Nihil placeat mollitia mollitia. Asperiores mollitia placeat cum cumque dicta ducimus blanditiis.',1733658249,1733658249),(97,22,NULL,'Public',NULL,NULL,NULL,'Omnis sed et nobis. Officia perferendis reiciendis ipsam nisi commodi. Repudiandae vero odio ad vel.',1734604329,1734604329),(98,14,NULL,'Public',NULL,NULL,NULL,'Veniam error culpa deserunt.',1735550409,1735550409),(99,42,NULL,'Public',NULL,NULL,NULL,'Sint commodi enim officia tenetur. Debitis voluptates quasi porro voluptatum ad. Maxime natus at tempore minus ea perspiciatis. Iusto aliquam aspernatur esse veritatis cupiditate.',1736496489,1736496489),(100,44,7,'Public',NULL,NULL,NULL,'Corporis unde optio distinctio. Ut beatae totam quia architecto eos.',1737442569,1737442569);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_file`
--

DROP TABLE IF EXISTS `post_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `file_id` int NOT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_file_index_17` (`post_id`,`file_id`),
  KEY `idx-post_file-post_id` (`post_id`),
  KEY `idx-post_file-post_id-weight` (`post_id`,`weight`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `post_file_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_file`
--

LOCK TABLES `post_file` WRITE;
/*!40000 ALTER TABLE `post_file` DISABLE KEYS */;
INSERT INTO `post_file` VALUES (1,39,1,0,1643780649),(2,81,2,0,1645672809),(3,45,3,0,1647564969),(4,30,4,0,1649457129),(5,69,5,0,1651349289),(6,30,6,0,1653241449),(7,65,7,0,1655133609),(8,24,8,0,1657025769),(9,75,9,0,1658917929),(10,88,10,0,1660810089),(11,15,11,0,1662702249),(12,16,12,0,1664594409),(13,14,13,0,1666486569),(14,28,14,0,1668378729),(15,7,15,0,1670270889),(16,48,16,0,1672163049),(17,18,17,0,1674055209),(18,86,18,0,1675947369),(19,54,19,0,1677839529),(20,49,20,0,1679731689),(21,7,21,0,1681623849),(22,36,22,0,1683516009),(23,66,23,0,1685408169),(24,32,24,0,1687300329),(25,30,25,0,1689192489),(26,80,26,0,1691084649),(27,84,27,0,1692976809),(28,24,28,0,1694868969),(29,42,29,0,1696761129),(30,58,30,0,1698653289),(31,27,31,0,1700545449),(32,12,32,0,1702437609),(33,57,33,0,1704329769),(34,22,34,0,1706221929),(35,38,35,0,1708114089),(36,68,36,0,1710006249),(37,51,37,0,1711898409),(38,75,38,0,1713790569),(39,81,39,0,1715682729),(40,54,40,0,1717574889),(41,77,41,0,1719467049),(42,42,42,0,1721359209),(43,52,43,0,1723251369),(44,61,44,0,1725143529),(45,15,45,0,1727035689),(46,47,46,0,1728927849),(47,78,47,0,1730820009),(48,48,48,0,1732712169),(49,52,49,0,1734604329),(50,33,50,0,1736496489);
/*!40000 ALTER TABLE `post_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_like`
--

DROP TABLE IF EXISTS `post_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `value` tinyint NOT NULL DEFAULT '1',
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_like_index_22` (`post_id`,`user_id`),
  CONSTRAINT `post_like_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_like_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_like`
--

LOCK TABLES `post_like` WRITE;
/*!40000 ALTER TABLE `post_like` DISABLE KEYS */;
INSERT INTO `post_like` VALUES (1,42,34,1,1643780649),(2,11,49,-1,1644411369),(3,40,17,1,1645042089),(4,25,47,1,1645672809),(9,26,37,-1,1648826409),(13,39,10,1,1651349289),(14,12,19,-1,1651980009),(16,32,35,1,1653241449),(18,3,2,1,1654502889),(19,3,25,1,1655133609),(20,12,13,1,1655764329),(22,28,12,1,1657025769),(24,18,32,1,1658287209),(26,41,32,1,1659548649),(28,11,18,1,1660810089),(30,33,40,1,1662071529),(31,28,22,1,1662702249),(32,17,1,1,1663332969),(34,15,45,-1,1664594409),(39,30,41,-1,1667748009),(40,10,9,1,1668378729),(41,50,7,1,1669009449),(45,35,2,1,1671532329),(46,10,46,1,1672163049),(50,19,21,1,1674685929),(53,28,31,1,1676578089),(54,13,16,1,1677208809),(57,41,48,1,1679100969),(58,6,41,1,1679731689),(59,3,3,1,1680362409),(61,43,2,1,1681623849),(65,2,29,1,1684146729),(67,13,25,-1,1685408169),(68,27,32,1,1686038889),(70,33,17,1,1687300329),(76,13,47,1,1691084649),(77,34,41,1,1691715369),(78,49,41,1,1692346089),(80,4,5,1,1693607529),(82,14,24,-1,1694868969),(84,28,23,1,1696130409),(90,1,12,1,1699914729),(93,33,43,1,1701806889),(95,26,45,1,1703068329),(96,27,35,1,1703699049),(98,33,33,1,1704960489),(99,32,45,-1,1705591209),(101,40,7,1,1706852649),(104,2,46,1,1708744809),(106,37,26,1,1710006249),(108,18,16,1,1711267689),(109,42,40,-1,1711898409),(110,3,27,1,1712529129),(111,16,41,1,1713159849),(113,28,32,1,1714421289),(114,10,22,1,1715052009),(118,47,45,1,1717574889),(120,15,24,1,1718836329),(122,34,6,1,1720097769),(123,16,44,1,1720728489),(129,19,16,1,1724512809),(132,38,39,1,1726404969),(133,28,37,-1,1727035689),(136,17,5,1,1728927849),(137,9,10,1,1729558569),(139,28,20,1,1730820009),(141,6,14,-1,1732081449),(142,41,39,1,1732712169),(143,40,3,1,1733342889),(149,37,11,1,1737127209),(150,29,40,1,1737757929);
/*!40000 ALTER TABLE `post_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_mention_user`
--

DROP TABLE IF EXISTS `post_mention_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_mention_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_mention_user_index_21` (`post_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_mention_user_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_mention_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_mention_user`
--

LOCK TABLES `post_mention_user` WRITE;
/*!40000 ALTER TABLE `post_mention_user` DISABLE KEYS */;
INSERT INTO `post_mention_user` VALUES (1,35,3,1643780649),(2,61,34,1645672809),(3,44,33,1647564969),(4,36,39,1649457129),(5,50,9,1651349289),(6,15,7,1653241449),(7,81,8,1655133609),(8,6,13,1657025769),(9,5,3,1658917929),(10,55,12,1660810089),(11,68,18,1662702249),(12,22,35,1664594409),(13,51,6,1666486569),(14,15,13,1668378729),(15,34,49,1670270889),(16,31,5,1672163049),(17,72,25,1674055209),(18,65,46,1675947369),(19,74,30,1677839529),(20,92,17,1679731689),(21,77,17,1681623849),(22,85,11,1683516009),(23,18,18,1685408169),(24,30,39,1687300329),(25,72,44,1689192489),(26,19,29,1691084649),(27,28,15,1692976809),(28,43,29,1694868969),(29,42,36,1696761129),(30,86,3,1698653289),(31,100,30,1700545449),(32,17,36,1702437609),(33,44,26,1704329769),(34,49,49,1706221929),(35,78,15,1708114089),(36,15,19,1710006249),(37,78,47,1711898409),(38,69,1,1713790569),(39,80,14,1715682729),(40,69,8,1717574889),(41,94,47,1719467049),(42,16,3,1721359209),(43,87,18,1723251369),(44,68,31,1725143529),(45,25,16,1727035689),(46,90,6,1728927849),(47,47,23,1730820009),(48,87,46,1732712169),(49,26,27,1734604329),(50,10,41,1736496489);
/*!40000 ALTER TABLE `post_mention_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tag_index_18` (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,45,15,1643780649),(2,69,4,1644726729),(3,19,11,1645672809),(4,23,12,1646618889),(5,87,2,1647564969),(6,100,8,1648511049),(7,85,7,1649457129),(8,53,3,1650403209),(9,75,16,1651349289),(10,81,11,1652295369),(11,74,3,1653241449),(12,84,22,1654187529),(13,72,11,1655133609),(14,47,8,1656079689),(15,16,4,1657025769),(16,92,7,1657971849),(17,41,11,1658917929),(18,77,21,1659864009),(19,75,6,1660810089),(20,98,9,1661756169),(21,19,14,1662702249),(22,5,10,1663648329),(23,94,4,1664594409),(24,91,4,1665540489),(25,26,19,1666486569),(26,14,8,1667432649),(27,14,21,1668378729),(28,51,23,1669324809),(29,29,21,1670270889),(30,27,20,1671216969),(31,83,13,1672163049),(32,86,11,1673109129),(33,50,12,1674055209),(34,10,11,1675001289),(35,81,24,1675947369),(36,56,18,1676893449),(37,20,19,1677839529),(38,52,3,1678785609),(39,39,25,1679731689),(40,61,8,1680677769),(41,49,7,1681623849),(42,22,3,1682569929),(43,30,22,1683516009),(44,92,13,1684462089),(45,61,10,1685408169),(46,42,20,1686354249),(47,25,1,1687300329),(48,43,12,1688246409),(49,81,21,1689192489),(50,23,10,1690138569),(51,91,8,1691084649),(52,45,9,1692030729),(53,69,22,1692976809),(54,22,22,1693922889),(55,69,18,1694868969),(56,58,13,1695815049),(57,51,18,1696761129),(58,37,22,1697707209),(59,60,4,1698653289),(61,48,11,1700545449),(62,97,21,1701491529),(63,80,5,1702437609),(64,15,8,1703383689),(65,89,1,1704329769),(66,84,18,1705275849),(67,9,23,1706221929),(68,42,6,1707168009),(69,49,15,1708114089),(70,9,1,1709060169),(71,94,22,1710006249),(72,13,16,1710952329),(73,43,24,1711898409),(74,21,5,1712844489),(75,78,9,1713790569),(76,37,17,1714736649),(77,32,15,1715682729),(78,100,18,1716628809),(79,66,9,1717574889),(80,55,4,1718520969),(81,14,3,1719467049),(82,34,4,1720413129),(83,1,2,1721359209),(84,84,15,1722305289),(86,19,10,1724197449),(87,27,17,1725143529),(88,98,24,1726089609),(89,16,18,1727035689),(90,9,24,1727981769),(91,65,9,1728927849),(92,23,25,1729873929),(93,24,11,1730820009),(94,57,13,1731766089),(95,73,25,1732712169),(96,70,5,1733658249),(97,48,8,1734604329),(98,83,22,1735550409),(99,100,5,1736496489),(100,9,2,1737442569);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_slug` (`name_slug`),
  UNIQUE KEY `tag_index_19` (`name`,`status`),
  KEY `idx-tag-status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'quam vel','quam-vel','Active',1643780649,1643780649),(2,'natus modi','natus-modi','Active',1647564969,1647564969),(3,'hic dolorem','hic-dolorem','Active',1651349289,1651349289),(4,'sapiente laudantium','sapiente-laudantium','Active',1655133609,1655133609),(5,'natus sunt','natus-sunt','Active',1658917929,1658917929),(6,'tempore magnam','tempore-magnam','Inactive',1662702249,1662702249),(7,'necessitatibus totam','necessitatibus-totam','Active',1666486569,1666486569),(8,'occaecati vero','occaecati-vero','Active',1670270889,1670270889),(9,'ullam velit','ullam-velit','Active',1674055209,1674055209),(10,'maxime quidem','maxime-quidem','Active',1677839529,1677839529),(11,'ipsa fuga','ipsa-fuga','Active',1681623849,1681623849),(12,'quo quibusdam','quo-quibusdam','Active',1685408169,1685408169),(13,'ipsum laboriosam','ipsum-laboriosam','Active',1689192489,1689192489),(14,'sunt sed','sunt-sed','Active',1692976809,1692976809),(15,'repudiandae veniam','repudiandae-veniam','Active',1696761129,1696761129),(16,'corporis iste','corporis-iste','Active',1700545449,1700545449),(17,'officiis esse','officiis-esse','Inactive',1704329769,1704329769),(18,'natus adipisci','natus-adipisci','Active',1708114089,1708114089),(19,'expedita nulla','expedita-nulla','Active',1711898409,1711898409),(20,'animi dolore','animi-dolore','Active',1715682729,1715682729),(21,'ea voluptate','ea-voluptate','Active',1719467049,1719467049),(22,'deserunt impedit','deserunt-impedit','Active',1723251369,1723251369),(23,'magnam officiis','magnam-officiis','Active',1727035689,1727035689),(24,'dolorem id','dolorem-id','Active',1730820009,1730820009),(25,'soluta consectetur','soluta-consectetur','Active',1734604329,1734604329);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nickname_slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password_hash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email_verification_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email_verified_at` int DEFAULT NULL,
  `jwt_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `jwt_token_expired_at` int DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','Normal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login_at` int DEFAULT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `nickname_slug` (`nickname_slug`),
  KEY `idx-user-email` (`email`),
  KEY `idx-user-status` (`status`),
  KEY `idx-group-email-status` (`email`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'edavis@example.org','nathanmoyer','nathanmoyer','$2b$12$ZW2og9GDEr0BEDJEKJ.7Zep25kiqpVi/18i2fkVwqFw8UIpzfmuVy',NULL,NULL,NULL,NULL,'Active','Admin',NULL,1643780640,1643780640),(2,'rachelpatel@example.org','sampsonkara','sampsonkara','$2b$12$LuNaKiXFiwUbTmvo4yajluCih1m1qUAGiXJbzNv6qD5jHSsttxEVu',NULL,NULL,NULL,NULL,'Active','Admin',NULL,1645672800,1645672800),(3,'hwilson@example.com','matthew87','matthew87','$2b$12$CClAyQ0.iK0EchFTAhYY4.wfUe0iT89CJNGmM0zAe94RWTUwFK7BS',NULL,NULL,NULL,NULL,'Active','Admin',NULL,1647564960,1647564960),(4,'ericwillis@example.net','patrickgarcia','patrickgarcia','$2b$12$Ea9fPNTwMW9Q4vnMJRvFtuJtb1.h4fB3VjB7rq9jn/DoRS699kxeO',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1649457120,1649457120),(5,'greenemichelle@example.org','jessicamiller','jessicamiller','$2b$12$Hy1scXWfwmYiyn421Wl1YuLOQbLxVGSvU8vc0znyAHDcY/j1qooT2',NULL,NULL,NULL,NULL,'Inactive','Normal',NULL,1651349280,1651349280),(6,'lindsaygardner@example.com','robertmcpherson','robertmcpherson','$2b$12$id./ZNgFWd151SLW3ghGlOlYYy6HluL5OX9qhXZmMIdNOXqAmvrSK',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1653241441,1653241441),(7,'andrea53@example.com','maria72','maria72','$2b$12$/fApCo6A0dKmltn.XnJp9OJ7ntzBMRNvOlIo69MevK4Ag3g9dOfiS',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1655133601,1655133601),(8,'tommynielsen@example.org','gryan','gryan','$2b$12$LwE3DgjUcxbLRkjlPu0tquONHU/wTNwft6iewTn490Wz2dhvbs9ce',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1657025761,1657025761),(9,'fmason@example.org','barnesrachel','barnesrachel','$2b$12$HwLWC/dCKG.kectn5hp7keAISxBqV2TCe7oss4cUSuLZqaE4L3Dfq',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1658917921,1658917921),(10,'yateskendra@example.com','michellecastillo','michellecastillo','$2b$12$/CLWFQR5uIWjzbQQLHNa2OGvoMmBcRUgAZVhmmOFkH1JbTCssOyIy',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1660810081,1660810081),(11,'pmorris@example.net','brownshannon','brownshannon','$2b$12$s3p54cEGVQ6RhsUw1imA1OuS08cuyZU9ZQecUoEyV5FgeWG8.Oq9G',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1662702242,1662702242),(12,'jennifer22@example.net','christopherwilliams','christopherwilliams','$2b$12$pU7hYNwbm/gv3XpuXnKdt.MUeuNQIDjKTC53o6Ndn3Dj.usfXPEeG',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1664594402,1664594402),(13,'mrogers@example.org','connieroberts','connieroberts','$2b$12$1nAsrmhYYz5zyWBQXnFOJ./63EvOTeHYGFlZQWKwVMbVslzp.pnQC',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1666486562,1666486562),(14,'jonesrebecca@example.net','jessicalee','jessicalee','$2b$12$QE701OO/xN9utJvJ4GYdV.EWim2uahInnU/ZG20F8xs7asxdZKt6K',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1668378722,1668378722),(15,'william65@example.org','schmidtlinda','schmidtlinda','$2b$12$98kP5NI0SAJMkTiRAigTQOb.QK8zVaJxuwc1ZrnNUJyRBQGrjl8Pe',NULL,NULL,NULL,NULL,'Inactive','Normal',NULL,1670270882,1670270882),(16,'bryantbeverly@example.org','leebrandi','leebrandi','$2b$12$5zW/82WctuJ28TwtYeV44.gSsuLcX4K94WcRww3M8wxl6Oz13EODW',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1672163042,1672163042),(17,'meganalvarez@example.net','crystal43','crystal43','$2b$12$BHoo49b1MK4GhfT.ILGTh.ruNgleNBXZ34frywyXy33.31pXfbVsi',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1674055203,1674055203),(18,'jasongonzalez@example.com','jennifer88','jennifer88','$2b$12$e.YKZgEM7jG/d8uVdBgGPOAf6k8g3sWaQLDvtIy2OTwQCaOc7V992',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1675947363,1675947363),(19,'awells@example.com','lindayoung','lindayoung','$2b$12$pWEkKof3zWTBrNnBy/6Oruz6Njxy5U4BF23rK/vB0ByfVpZbf4MG2',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1677839523,1677839523),(20,'jason87@example.org','sheltoneric','sheltoneric','$2b$12$vUiaEoBUdqzCBLO6IfP6HuSCXjkcx5vHRZDDMKCujXIuJyMLz2RUy',NULL,NULL,NULL,NULL,'Inactive','Normal',NULL,1679731683,1679731683),(21,'shunter@example.org','singhalyssa','singhalyssa','$2b$12$UBibtp59A1omMV1znIxUNOoqT990WR.3XiMbq7aLgRvaJvSnGCmnu',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1681623843,1681623843),(22,'perryjennifer@example.org','rscott','rscott','$2b$12$d8ZzEMyVsflaGauSkmJwnelJb0ja7VZrUV435N2K3PSq2g1G7XRS2',NULL,NULL,NULL,NULL,'Inactive','Normal',NULL,1683516004,1683516004),(23,'carlos59@example.org','staciemartin','staciemartin','$2b$12$ujkBlNyLIYj.Yx6cAM9Vi.MRe8jTYxFNRI4shObqHCb9RClMAp0f2',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1685408164,1685408164),(24,'wrightnicholas@example.com','kevin97','kevin97','$2b$12$3WNx6uMuhG8duEFxAzPvFevsuj9srFiU.ghuwXQbuf0OEyL5mi9py',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1687300324,1687300324),(25,'staylor@example.net','glennbrenda','glennbrenda','$2b$12$q2QKCGoy0T661X1qpqZ2vu3Me6cXUhkid7qZ79BD6fI7tqY5fgiRG',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1689192484,1689192484),(26,'rodriguezjonathan@example.com','sandraspencer','sandraspencer','$2b$12$9iX/K7MAS6lE4mSzphIh5OvwSEhet4u96oyonnFmCWzVHs08fiatm',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1691084644,1691084644),(27,'pgibson@example.com','acortez','acortez','$2b$12$.9Yilofr/ppqAR9u70X.6.iE68DkuKTgzLV1RzuCv0eDOnbtcIVGm',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1692976805,1692976805),(28,'robertolson@example.net','sharon52','sharon52','$2b$12$LEgigpUxFhmWALmAkAws3OkQiLbDgZjoXE4K2Dysrzaue2Iytp0vm',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1694868965,1694868965),(29,'angela64@example.com','aaron83','aaron83','$2b$12$5MxS5eAokw9F9SizsStKr.97Wmzo6YUfNcUy/mL7s.Oyu72TasfLm',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1696761125,1696761125),(30,'teresa83@example.com','xjones','xjones','$2b$12$hfQqLucXdWFJDOTdrF8iquPtG7Vtg7UFOuUkBVuOluNqdgmgCxvVS',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1698653285,1698653285),(31,'umcbride@example.net','fjohnson','fjohnson','$2b$12$8Ur./geLeRvFZvS6x6EQaOXBPr65oFgUAjwiTKsCOEWEIwdpSD8y.',NULL,NULL,NULL,NULL,'Inactive','Normal',NULL,1700545445,1700545445),(32,'lisa28@example.org','smithscott','smithscott','$2b$12$5kKc76XGwi7TsmZBOpgeP.yepo2uvQiXyb4QtyixBEwfI5rn15ALq',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1702437606,1702437606),(33,'emartinez@example.com','amanda59','amanda59','$2b$12$hyf0VI/1fQZdCkFtL1qRD.Q3TnCwwoIuMRA1LAzJEyWH649EAcI3.',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1704329766,1704329766),(34,'monique67@example.org','amy11','amy11','$2b$12$5hqEQiwFMz3uFOaRo1RWaO3msl7anyg3RivApwbmlxxsNtGtnK8Qy',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1706221926,1706221926),(35,'dmedina@example.com','phillipdrake','phillipdrake','$2b$12$KsfipkDkEaPbgK9H2edbrud9cNa41DNJjJq3QVDMR9L.pncB9MHw6',NULL,NULL,NULL,NULL,'Inactive','Normal',NULL,1708114086,1708114086),(36,'richardrobinson@example.org','lmontgomery','lmontgomery','$2b$12$NKEs.kqI9.rrj4Djl8AAmeFlIoY/qES./9zuEm8CEqqlYnLY3bcvu',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1710006246,1710006246),(37,'reginald30@example.org','snowkristina','snowkristina','$2b$12$KqRzQXBRtzkkiDZxLHuAZuAzwQQLLyWUPTJlDy7YYIWTrPzV/Q2h.',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1711898407,1711898407),(38,'daviscynthia@example.com','mirandamonica','mirandamonica','$2b$12$HbIADeJ.O0Bo7fuDLEpiNuiIrA7FWe9ay228BZlxfACiqZCbYMXyW',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1713790567,1713790567),(39,'larroyo@example.org','hoganjason','hoganjason','$2b$12$m1jfQaD9XRMJQBtjNBFjEOMV8XwI8t6H7Y46KoV9jrpkmdg7RmjCK',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1715682727,1715682727),(40,'jmalone@example.org','paul66','paul66','$2b$12$/m71eWcFoNUqQwOMFzr/xuQsqx3wzOT4fMmESyWHi8VlxQmXRFoIa',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1717574887,1717574887),(41,'mcgeejackson@example.org','alex63','alex63','$2b$12$6uXrxxOByAd961DVxuF8geQdIXq85bpJGKOSGqGgDbDRKhDcfM7VO',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1719467047,1719467047),(42,'cruzerin@example.org','ogonzalez','ogonzalez','$2b$12$EJ8Ss9eU.3g/SfMIke.WcejC0W3Axi4bVn68ngoi.Ts9y557Aa566',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1721359208,1721359208),(43,'williamflynn@example.com','carlastewart','carlastewart','$2b$12$ScpMlXRnUZvlYH/g9FQ3Ou3qBYs5YCwHX/HzJp/fCDvkzPP.Sbqpu',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1723251368,1723251368),(44,'stephanie53@example.net','travis76','travis76','$2b$12$eEr6DpyYn6yrtPFUO886t.QIaQ1vE4ga8OqKTm18IU4lQttf8KHgO',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1725143528,1725143528),(45,'kathy79@example.net','bwilliams','bwilliams','$2b$12$nx/aookwSflspWCNm7nnn.cbIQquOZtVAod70jarkvJsf7K0CxfLG',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1727035688,1727035688),(46,'mitchellmichael@example.net','janebush','janebush','$2b$12$Wv7eVYtQ9OojcisLPUT6QeaRUfiH/xoNuLlXj9xv2kyPEtUXzXBiS',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1728927848,1728927848),(47,'wilsondavid@example.net','grantdouglas','grantdouglas','$2b$12$w1H86aaneYpR9sQlWA/6DuS/e/mmG/AD0Js6guz2G5Xjb3Svp.Q1a',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1730820009,1730820009),(48,'vpatton@example.net','hayesmary','hayesmary','$2b$12$Fw6j5/XY8g/Tw1AsmIHLWeEWAsgaKZxI212nfBDhcS9FIedRQ1.6y',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1732712169,1732712169),(49,'stacey86@example.org','dmoore','dmoore','$2b$12$ohxyeIi/Rn1.2gYU8JRZxOMLVNnBrQ5s/Xw0Q/7VxpZsKZQKwblby',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1734604329,1734604329),(50,'cooperjudy@example.org','christine89','christine89','$2b$12$Rrv0biFd8DidjfoOWPw3nOndJw1L44vCh/qGxRgo3LcFSzJTHKVb2',NULL,NULL,NULL,NULL,'Active','Normal',NULL,1736496489,1736496489);
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

-- Dump completed on 2025-02-01 13:55:37
