CREATE DATABASE  IF NOT EXISTS `adm` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adm`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: adm
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `idMaterial` int NOT NULL AUTO_INCREMENT,
  `deEspecificacao` varchar(155) NOT NULL,
  `qtMaterial` decimal(12,2) NOT NULL,
  `dtEntrada` date NOT NULL,
  `idTipoMaterial` int unsigned NOT NULL,
  PRIMARY KEY (`idMaterial`),
  UNIQUE KEY `idMaterial_UNIQUE` (`idMaterial`),
  KEY `fk_material_tipomaterial1_idx` (`idTipoMaterial`),
  CONSTRAINT `fk_material_tipomaterial1` FOREIGN KEY (`idTipoMaterial`) REFERENCES `tipomaterial` (`idTipoMaterial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomaterial`
--

DROP TABLE IF EXISTS `tipomaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipomaterial` (
  `idTipoMaterial` int unsigned NOT NULL AUTO_INCREMENT,
  `deTipoMaterial` varchar(150) NOT NULL,
  `deUnidadeMedida` varchar(150) NOT NULL,
  `deLocalEstoque` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idTipoMaterial`),
  UNIQUE KEY `idcabo elétrico_UNIQUE` (`idTipoMaterial`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomaterial`
--

LOCK TABLES `tipomaterial` WRITE;
/*!40000 ALTER TABLE `tipomaterial` DISABLE KEYS */;
INSERT INTO `tipomaterial` VALUES (5,'cabo 2,5mm','metros','prateleiras'),(6,'cabo 1,5mm','metros','prateleiras'),(7,'cabo 4mm','metros','prateleiras');
/*!40000 ALTER TABLE `tipomaterial` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-17  8:57:09
