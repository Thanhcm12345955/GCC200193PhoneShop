-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: shop_gcc200193
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cuserid` int(11) NOT NULL,
  `cproid` int(11) NOT NULL,
  `cquantity` int(11) NOT NULL,
  `cdate` date NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `fk_cart_usr` (`cuserid`),
  CONSTRAINT `fk_cart_usr` FOREIGN KEY (`cuserid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,1,32,'2023-08-09'),(2,1,2,12,'2023-08-09'),(3,1,3,8,'2023-08-09'),(4,1,6,3,'2023-08-09'),(5,1,4,2,'2023-08-09'),(6,1,5,4,'2023-08-09'),(7,1,12,4,'2023-08-09');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `catid` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catname` varchar(30) NOT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('C001','Phone'),('C002','Accessory');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  `pprice` decimal(8,0) NOT NULL,
  `pinfo` varchar(255) NOT NULL,
  `pimage` varchar(100) NOT NULL,
  `pquan` int(11) NOT NULL,
  `pcatid` varchar(5) NOT NULL,
  `pdate` date NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_cat_pro` (`pcatid`),
  CONSTRAINT `fk_cat_pro` FOREIGN KEY (`pcatid`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (18,'Xiaomi',250,'Xiaomi Redmi 12 latest phone models launched by Xiaomi in June 2023 made the technology enthusiast community extremely excited. The machine puts on a personal appearance, the large screen offers an eye-catching experience and stable performance with all t','xiaomi.jpg',8,'C001','2023-08-12'),(19,'SamSung',350,'Samsung Galaxy A24 6GB continues to be a mid-range phone model introduced by Samsung to Vietnam market in April 2023, featuring a cheap price, Super AMOLED screen and 50 MP camera taking sharp pictures.','Samsung.jpg',6,'C001','2023-08-12'),(20,'Oppo',500,'OPPO Find N2 Flip 5G - OPPO\'s first folding phone was officially introduced in Vietnam in March 2023. Possessing a powerful configuration and an ultra-compact design that optimizes the size, the phone will stand out with you in any space with a personalit','Oppo.jpg',10,'C001','2023-08-12'),(21,'Iphone14',1200,'iPhone 14 Pro Max, a super product in the smartphone world, was launched by Apple in September 2022. The device is equipped with an extremely powerful Apple A16 Bionic chip, accompanied by a new screen design, promising to bring new experiences to iPhone ','ip14.jpg',20,'C001','2023-08-12'),(22,'Huawei',1300,'Huawei has just launched the high-end smartphone Huawei P30 along with the P30 Pro and P30 Lite. Inheriting the design of Huawei P20, moreover, the device is also drastically improved in terms of camera and performance. Huawei P30 promises to be a formida','Huawei.jpg',18,'C001','2023-08-12'),(23,'Backup charger',100,'HOCO power bank. Wireless 10000Mah 20000mAh Qi 2A + Micro Type C 3 in 1 handy','sacduphong.jpg',25,'C002','2023-08-12'),(24,'Phone headset',50,'BOROFONE CM4 1.2M Wired Phone Headset - Genuine','tainghe.jpg',30,'C002','2023-08-12'),(25,'Wireless headphones',100,'Yealink WH62 Dual Teams Wireless Phone Headset','tainghe0day.jpg',16,'C002','2023-08-12'),(26,'Charger',180,'Wireless Wifi IP Camera Charger is one of our best selling products, there are many advantages that you should choose.','cucsacdien.jpg',19,'C002','2023-08-12'),(27,'Phone cases',60,'9D case for Vivo phones has a very unique, beautiful, funny and lovely fashion design. The main function of the phone case is to protect the phone from drops, bumps, scratches and distortion.','oplung.jpg',30,'C002','2023-08-12'),(28,'Phone cases',90,'INJECTION KINGXBAR INJECTION KINGXBAR INJECTION KINGXBAR IPHONE 13 PRO MAX','opplung.jpg',20,'C002','2023-08-12'),(29,'Phone tempered stickers',20,'Dungpv phone accessories specializes in providing tempered stickers for Vivo V9 and other phone lines such as Oppo, Xiaomi, Meizu, Motorola, ... with the cheapest price in the market along with the best quality.','dancuongluc.jpg',30,'C002','2023-08-12'),(30,'Bluetooth headphone',120,'Bluetooth 4.0 earphones, cheap earphones, genuine earphones','taingheblu.jpg',26,'C002','2023-08-12'),(31,'Earphones',150,'Best cheap wireless Bluetooth earphones 2023','tainghechuptai.png',27,'C002','2023-08-12'),(32,'Sony',2000,'Phone Sony Xperia PRO-I 6.5 in 4K HDR 12GB RAM 512GB Memory','sony.jpg',14,'C001','2023-08-12'),(33,'Vivo',1200,'Vivo Y20s phone (6GB/128GB) Crystal Blue','vivo.jpg',9,'C001','2023-08-12'),(34,'Vertu',12000,'Vertu Signature S Yellow Gold Ceramic','Vertu.jpg',5,'C001','2023-08-12'),(35,'Nokia',300,'Nokia 6700 Gold Phone','nokia.png',19,'C001','2023-08-12');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hometown` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aaaaaaaa','1','ct'),(2,'abc','abc','ct');
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

-- Dump completed on 2023-08-12 21:13:18
