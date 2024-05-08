-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db_springboot_backend
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (4,'Sanchez','2020-10-12','manuel@bolsadeideas.com','Manuel','d1c277b6-f0ca-4e36-bc66-8de2241bec1a_ALCAZAR_DE_CORDOBA.jpg',4),(5,'Sanchez','2020-10-26','pedro@bolsadeideas.com','Pedro','60a75919-1503-4ffe-a914-7c099d9fa124_Captura-de-pantalla-2016-05-19-09.16.12.png',4),(6,'Perez','2020-10-26','anamariaperez@bolsadeideas.com','Ana Maria','324b9c5c-6a4d-4397-bce9-45081f37af01_cordoba.jpg',4),(7,'Jimenez','2020-10-26','sandra@bolsadeideas.com','Sandra','bfda33ea-dd93-4115-afde-5083b3f53ebd_espectaculo-luz-sonido-alcazar-12.jpg',4),(8,'Garcia','2020-10-26','susana@bolsadeideas.com','Susana','d0099f64-e935-49a2-b8cf-d15cea48c82a_excursion-medina-azahara-paseando-por-europa-00.jpg',4),(9,'Perez','2020-10-29','arturo@bolsadeideas.com','Arturo','ab8af825-adb3-485b-beba-4d7409928c4f_potro-erasmus-cordoba.jpg',4),(10,'Martín','2020-10-15','frederik.martin1976@gmail.com','Federico','43c48faf-4d84-4075-be54-de6678ef5893_PATIO_TINTE_9_CORDOBA_10.jpg',4),(11,'Uribe','2020-10-31','ruribe@bolsadeideas.com','Raul','e02c7d13-092f-4f5e-8aca-66d70e1bad84_zonas-iluminadas-Medina-Azahara_1189391060_74605596_1485x1024.jpg',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (3,'2021-01-25','Mobiliario',NULL,4);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `facturas_items`
--

LOCK TABLES `facturas_items` WRITE;
/*!40000 ALTER TABLE `facturas_items` DISABLE KEYS */;
INSERT INTO `facturas_items` VALUES (3,1,4,3);
/*!40000 ALTER TABLE `facturas_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'2021-01-24','Camara Sony DSC-500',30),(2,'2021-01-24','Tablet Samsung TX-800',680),(3,'2021-01-24','Bicicleta Orbea AX-100',80),(4,'2021-01-24','Mesa Ikea Bletka 2',40);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `regiones`
--

LOCK TABLES `regiones` WRITE;
/*!40000 ALTER TABLE `regiones` DISABLE KEYS */;
INSERT INTO `regiones` VALUES (1,'Sudamérica'),(2,'Centroamérica'),(3,'Norteamérica'),(4,'Europa'),(5,'África'),(6,'Asia'),(7,'Oceanía'),(8,'Antártida');
/*!40000 ALTER TABLE `regiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,_binary '','$2a$10$HgOw8ogtmkt33eyRb9kx8.0aFa4A/wzAkeXXta0xB15kszyw43CyK','andres','Pérez','aperez@bolsadeideas.com','Andrés'),(2,_binary '','$2a$10$63uM/Y6flNc2r95DcFJHceYvaTLCAOtSo7r8KQpJM3c3zCXffk0Tu','admin','Martín','frederik.martin1976@gmail.com','Federico');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios_roles`
--

LOCK TABLES `usuarios_roles` WRITE;
/*!40000 ALTER TABLE `usuarios_roles` DISABLE KEYS */;
INSERT INTO `usuarios_roles` VALUES (1,1),(2,1),(2,2);
/*!40000 ALTER TABLE `usuarios_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-25 21:44:42
