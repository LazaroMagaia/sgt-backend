-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: sistema_de_gestao_transporte
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `identity_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` date NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clients_user_id_foreign` (`user_id`),
  CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (4,14,NULL,'1998-10-01','Male','877017601','','Coop','Cliente acompanhante','877017601','2024-10-01 11:50:50','2024-10-01 11:50:50');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_bilhetes`
--

DROP TABLE IF EXISTS `compras_bilhetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_bilhetes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `compra_id` bigint unsigned NOT NULL,
  `bilhete_id` bigint unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compras_bilhetes_compra_id_foreign` (`compra_id`),
  KEY `compras_bilhetes_bilhete_id_foreign` (`bilhete_id`),
  CONSTRAINT `compras_bilhetes_bilhete_id_foreign` FOREIGN KEY (`bilhete_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `compras_bilhetes_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `ordens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_bilhetes`
--

LOCK TABLES `compras_bilhetes` WRITE;
/*!40000 ALTER TABLE `compras_bilhetes` DISABLE KEYS */;
INSERT INTO `compras_bilhetes` VALUES (20,15,1,1,1200.00,1200.00,'2025-01-05 00:07:59','2025-01-05 00:07:59'),(21,15,2,1,2000.00,2000.00,'2025-01-05 00:07:59','2025-01-05 00:07:59'),(22,16,2,1,2000.00,2000.00,'2025-01-05 00:27:35','2025-01-05 00:27:35'),(23,16,3,1,1000.00,1000.00,'2025-01-05 00:27:35','2025-01-05 00:27:35'),(24,17,2,1,2000.00,2000.00,'2025-01-05 00:30:15','2025-01-05 00:30:15'),(25,17,3,1,1000.00,1000.00,'2025-01-05 00:30:15','2025-01-05 00:30:15'),(26,18,3,1,1000.00,1000.00,'2025-01-06 12:50:45','2025-01-06 12:50:45'),(27,19,3,1,1000.00,1000.00,'2025-01-06 12:51:03','2025-01-06 12:51:03'),(28,20,3,1,1000.00,1000.00,'2025-01-06 12:52:10','2025-01-06 12:52:10'),(29,21,1,1,1200.00,1200.00,'2025-01-06 12:57:20','2025-01-06 12:57:20'),(30,21,2,1,2000.00,2000.00,'2025-01-06 12:57:20','2025-01-06 12:57:20'),(31,21,3,1,1000.00,1000.00,'2025-01-06 12:57:20','2025-01-06 12:57:20'),(32,21,4,1,1300.00,1300.00,'2025-01-06 12:57:20','2025-01-06 12:57:20');
/*!40000 ALTER TABLE `compras_bilhetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `birth` date NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_user_id_foreign` (`user_id`),
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (4,9,'2024-09-17','Male','28 282 82822',NULL,'Coop','Lazaro Magaia','28 288 28288','2024-09-17 05:27:39','2024-09-17 05:35:15'),(5,10,'2024-09-01','Male','82 701 7602',NULL,'Coop','Lazaro Magaia','82 701 7601','2024-09-17 07:51:33','2024-09-30 16:25:41');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (13,'0001_01_01_000000_create_users_table',1),(14,'0001_01_01_000001_create_cache_table',1),(15,'0001_01_01_000002_create_jobs_table',1),(16,'2024_09_09_163042_create_personal_access_tokens_table',1),(17,'2024_09_12_082713_create_employees_table',2),(18,'2024_09_30_182828_create_clients_table',3),(20,'2024_10_01_173750_create_routes_table',4),(22,'2024_10_02_070745_create_tickets_table',5),(23,'2024_11_19_115834_create_ordens_table',6),(24,'2024_11_19_120201_create_compras_bilhetes_table',6),(26,'2025_01_05_015603_add_payment_type_to_ordens_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordens`
--

DROP TABLE IF EXISTS `ordens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendente',
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordens_user_id_foreign` (`user_id`),
  CONSTRAINT `ordens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordens`
--

LOCK TABLES `ordens` WRITE;
/*!40000 ALTER TABLE `ordens` DISABLE KEYS */;
INSERT INTO `ordens` VALUES (15,1,3200.00,'pago','MPESA','2025-01-05 00:07:59','2025-01-05 00:07:59'),(16,1,3000.00,'pendente','Deposito_Bancario','2025-01-05 00:27:35','2025-01-05 00:27:35'),(17,1,3000.00,'pendente','Deposito_Bancario','2025-01-05 00:30:15','2025-01-05 00:30:15'),(18,1,1000.00,'pendente','Transferencia_Movel','2025-01-06 12:50:45','2025-01-06 12:50:45'),(19,1,1000.00,'pendente','Transferencia_Movel','2025-01-06 12:51:03','2025-01-06 12:51:03'),(20,1,1000.00,'pendente','Transferencia_Movel','2025-01-06 12:52:10','2025-01-06 12:52:10'),(21,1,5500.00,'pendente','Deposito_Bancario','2025-01-06 12:57:20','2025-01-06 12:57:20');
/*!40000 ALTER TABLE `ordens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'api-token','2f6b4a3e20c5a577ee7012a3b15e5df9d57d4f7059e0209bb4b88a3b01da74c0','[\"*\"]',NULL,NULL,'2024-09-11 18:18:37','2024-09-11 18:18:37'),(2,'App\\Models\\User',1,'api-token','5a6716b5b3ebc51d0e1e08d22185bfd1dd82411a2953fbd5943e423919bbe147','[\"*\"]',NULL,NULL,'2024-09-11 18:19:12','2024-09-11 18:19:12'),(3,'App\\Models\\User',1,'api-token','eea70d9c31b1b43ee04d25ae10f9d488c6eee19eca4e0eabc77a5e58f95a3a3c','[\"*\"]',NULL,NULL,'2024-09-11 18:47:24','2024-09-11 18:47:24'),(4,'App\\Models\\User',1,'api-token','ebb3dafaeade0d334946a0df4e2ddf5b618da18789e6b98310a802d857152922','[\"*\"]',NULL,NULL,'2024-09-11 18:47:28','2024-09-11 18:47:28'),(5,'App\\Models\\User',1,'api-token','2eaa0a96615b9d10fb638176e00bffc6165d752726ad173d3a99a61e9df70123','[\"*\"]',NULL,NULL,'2024-09-11 18:48:02','2024-09-11 18:48:02'),(6,'App\\Models\\User',1,'api-token','0398462640f36f98f075cb199605c313ebdb949268f3fbe71d629d66a5ea2f67','[\"*\"]',NULL,NULL,'2024-09-11 18:48:21','2024-09-11 18:48:21'),(7,'App\\Models\\User',1,'api-token','ccfa2e3b8e46418c955eaad1e5aab5f24cb7d8d079cc31ad3d8915e948e297ff','[\"*\"]',NULL,NULL,'2024-09-11 18:50:21','2024-09-11 18:50:21'),(8,'App\\Models\\User',1,'api-token','15dba59345b6ebbbbb2cabcdde659cff7df8ec047cd46f4b7fd3e9146fe76f4d','[\"*\"]',NULL,NULL,'2024-09-12 05:39:16','2024-09-12 05:39:16'),(9,'App\\Models\\User',1,'api-token','9faf1e3b3ee939a241c00dc1b03bd5f1948efc5744e37bc0928748a53d7c0e6d','[\"*\"]',NULL,NULL,'2024-09-12 05:42:34','2024-09-12 05:42:34'),(10,'App\\Models\\User',1,'api-token','a0d740e735a8d75b80f0b5721ad51c585bb1b00202430c58d14d7cf557add7ab','[\"*\"]',NULL,NULL,'2024-09-12 05:43:11','2024-09-12 05:43:11'),(11,'App\\Models\\User',1,'api-token','f146944230ef53965eebfd1239069adb45526049d886ac81070d115da31be795','[\"*\"]','2024-09-12 06:55:00',NULL,'2024-09-12 06:42:23','2024-09-12 06:55:00'),(12,'App\\Models\\User',1,'api-token','80c1acff7b52df7c5f03fab3d25ad16008bd8a857eaae7dd12f98768759ac17f','[\"*\"]','2024-09-12 07:02:47',NULL,'2024-09-12 06:58:56','2024-09-12 07:02:47'),(13,'App\\Models\\User',1,'api-token','92684860d3eba5dff30e5608141ad9b152879640bfe1f081c4056aa4d6d6367b','[\"*\"]',NULL,NULL,'2024-09-12 07:05:26','2024-09-12 07:05:26'),(14,'App\\Models\\User',1,'api-token','e2000e8cc892c80c933191072f283b420d18745859a85aecb20254c9749f8b6b','[\"*\"]',NULL,NULL,'2024-09-12 07:10:17','2024-09-12 07:10:17'),(15,'App\\Models\\User',1,'api-token','f28fc9afc4054fdf80cec837c69bdd5817d19f70333d0f3433a140de2ed819ee','[\"*\"]',NULL,NULL,'2024-09-12 07:13:28','2024-09-12 07:13:28'),(16,'App\\Models\\User',1,'api-token','6cba883ad43bef2e1c44d2881b2c0f224ab822c69d9891f8df4f3dbfaf11838b','[\"*\"]',NULL,NULL,'2024-09-12 07:20:36','2024-09-12 07:20:36'),(17,'App\\Models\\User',1,'api-token','0a820bfda254b15d5a2287ed3757a84d33737bbe97c94694d5aee2ab6af842c7','[\"*\"]',NULL,NULL,'2024-09-12 07:28:33','2024-09-12 07:28:33'),(18,'App\\Models\\User',1,'api-token','4f672206ccd1a397cbfd6a55dbd0541f5a7f0b52b331bc973d5e28dafe8dbdb9','[\"*\"]',NULL,NULL,'2024-09-12 07:43:08','2024-09-12 07:43:08'),(19,'App\\Models\\User',1,'api-token','3f693f93b750ac339e5d37cd57a9dec2bbd3c7446a209041bd1f6f98bd204b6f','[\"*\"]',NULL,NULL,'2024-09-12 07:46:46','2024-09-12 07:46:46'),(20,'App\\Models\\User',1,'api-token','8808f6fe9c6d2ff783c5ac4bd0dd1ea94b8ee160cec1e5622c3beb55537b4b02','[\"*\"]',NULL,NULL,'2024-09-12 07:46:47','2024-09-12 07:46:47'),(21,'App\\Models\\User',1,'api-token','b17be5d1c899f42f32ad794e2bc1e413cbd54997e85aa44a73d871cf07333dc3','[\"*\"]','2024-09-12 07:50:38',NULL,'2024-09-12 07:49:50','2024-09-12 07:50:38'),(22,'App\\Models\\User',1,'api-token','e30149207d4661d0c4abe0685dc71c94d8651d0b7fb51b725ec5c1cb5c4020d5','[\"*\"]',NULL,NULL,'2024-09-12 07:54:05','2024-09-12 07:54:05'),(23,'App\\Models\\User',1,'api-token','ec9ea4432bb67417b9914c4dab1777111146fea6f15434b65bf5f093aff3e19b','[\"*\"]',NULL,NULL,'2024-09-12 07:59:28','2024-09-12 07:59:28'),(24,'App\\Models\\User',1,'api-token','854fce718b27f3ba270b3717d3dba06ae5de33cdb578d9bdfc4df307304337a5','[\"*\"]',NULL,NULL,'2024-09-12 08:02:08','2024-09-12 08:02:08'),(25,'App\\Models\\User',1,'api-token','79bcc4e87f50d7b954cbb9ff804eba0a45d69ead042ca2aacfcd986032f37db9','[\"*\"]',NULL,NULL,'2024-09-12 08:04:37','2024-09-12 08:04:37'),(26,'App\\Models\\User',1,'api-token','7ab9e19362c2e596cba216ef3f96ce364bce49380082487d4359baf76cd5ad99','[\"*\"]',NULL,NULL,'2024-09-12 08:08:18','2024-09-12 08:08:18'),(27,'App\\Models\\User',1,'api-token','55d530618f959eb7c47e55c384b028f815287bf0e362d50cf3d1bcc2cdf4948b','[\"*\"]',NULL,NULL,'2024-09-12 08:12:20','2024-09-12 08:12:20'),(28,'App\\Models\\User',1,'api-token','d87c498e5572be3107a3a283a8886cb6acd05923794385e40dad9d04d92dd839','[\"*\"]',NULL,NULL,'2024-09-12 08:15:42','2024-09-12 08:15:42'),(29,'App\\Models\\User',1,'api-token','60477c595a1d09c807dcaf4eabd93eb7b6a5b2c9a186785a2f58cfcc28a5133a','[\"*\"]',NULL,NULL,'2024-09-12 10:46:33','2024-09-12 10:46:33'),(30,'App\\Models\\User',1,'api-token','6d3db24465bf560c311708d6025b519ff76d3e760393320025dcd20645ec0094','[\"*\"]',NULL,NULL,'2024-09-12 10:54:01','2024-09-12 10:54:01'),(31,'App\\Models\\User',1,'api-token','54af12d4f3ae9858caafc894915e14c8117cde7aa755fe38587c08734e9093d7','[\"*\"]','2024-09-12 16:17:00',NULL,'2024-09-12 15:43:23','2024-09-12 16:17:00'),(32,'App\\Models\\User',1,'api-token','c3366b9ef0c78ea1e8c1c2a20513367c81eb6cb86ec32f51634c5548e7794f7f','[\"*\"]','2024-09-12 16:20:43',NULL,'2024-09-12 16:20:34','2024-09-12 16:20:43'),(33,'App\\Models\\User',1,'api-token','27f9d2f43e1de5fba95ebccbaf19f7e38310344a6c9ff8d3cccc194e8f8fa875','[\"*\"]','2024-09-12 16:21:47',NULL,'2024-09-12 16:21:40','2024-09-12 16:21:47'),(34,'App\\Models\\User',1,'api-token','4f5aa57503ecc74c0e5b52508eb47211c99737992e3b37e2496a613ecbe32125','[\"*\"]','2024-09-12 16:22:24',NULL,'2024-09-12 16:22:19','2024-09-12 16:22:24'),(35,'App\\Models\\User',1,'api-token','a4054222acc25725724b81be1501a7450060f830b814f7bd95cb608a914f93ab','[\"*\"]','2024-09-12 16:25:37',NULL,'2024-09-12 16:25:13','2024-09-12 16:25:37'),(36,'App\\Models\\User',1,'api-token','7a0ba71d11522a723155e3f532bf22878d02697b50e22f600bdbca79988f902f','[\"*\"]',NULL,NULL,'2024-09-12 16:28:22','2024-09-12 16:28:22'),(37,'App\\Models\\User',1,'api-token','7dbf521482873e654f1198d3fbee35a8a45530cd7ec896d192e7afc3ad9f8a81','[\"*\"]','2024-09-12 16:28:49',NULL,'2024-09-12 16:28:35','2024-09-12 16:28:49'),(38,'App\\Models\\User',1,'api-token','bbef557209827216bfc7d7c0b60723b2fb603937ad5c3840111c3bc036585f74','[\"*\"]',NULL,NULL,'2024-09-12 16:29:03','2024-09-12 16:29:03'),(39,'App\\Models\\User',1,'api-token','285f579b19e39be781685c3ff2817ab1f91f4acfdfc4201626411bed6ce08129','[\"*\"]',NULL,NULL,'2024-09-12 16:30:03','2024-09-12 16:30:03'),(40,'App\\Models\\User',1,'api-token','de49898863a5213ebd06b88f14b79cdfbf0c4178c9fc66c6e011df5d776a4f35','[\"*\"]','2024-09-12 16:40:57',NULL,'2024-09-12 16:34:21','2024-09-12 16:40:57'),(41,'App\\Models\\User',1,'api-token','13153761d53f277efc80bd74dd1f88b7b0405f5bf59bec414279d1ed4f20a1f5','[\"*\"]','2024-09-12 17:01:49',NULL,'2024-09-12 16:41:26','2024-09-12 17:01:49'),(42,'App\\Models\\User',8,'api-token','491943293a85dd6796ffed62058bc49882b942b3cbdacdde54aef89821bbef09','[\"*\"]','2024-09-12 17:03:47',NULL,'2024-09-12 16:41:56','2024-09-12 17:03:47'),(43,'App\\Models\\User',1,'api-token','793326e2e9d6ac74ac9bb6d85b2b5457ddbc6f7020e6f95e8f1589c88ac7e59d','[\"*\"]','2024-09-13 07:34:11',NULL,'2024-09-12 17:02:01','2024-09-13 07:34:11'),(44,'App\\Models\\User',1,'api-token','6a5581eb544f2c2d5f7455dbefc7db125ae69471a750851217ce753e8d01a40f','[\"*\"]','2024-09-12 17:04:01',NULL,'2024-09-12 17:03:58','2024-09-12 17:04:01'),(45,'App\\Models\\User',8,'api-token','b5bd3b61f83cc76e6e481a347cec1b0fc6a219a3123e095c1deff563ff1f3226','[\"*\"]','2024-09-12 17:26:24',NULL,'2024-09-12 17:04:36','2024-09-12 17:26:24'),(46,'App\\Models\\User',1,'api-token','fa52a5bd6edadd6c3da5f80b83770249a6691b6105fd94490c6745c95f86e489','[\"*\"]','2024-09-13 18:05:57',NULL,'2024-09-13 17:55:29','2024-09-13 18:05:57'),(47,'App\\Models\\User',1,'api-token','05ebf93f9a5bf8caacd69f8992ad3f3e0708580fbaa1fb3207eb6338b6ff3651','[\"*\"]','2024-09-17 05:42:43',NULL,'2024-09-17 05:02:02','2024-09-17 05:42:43'),(48,'App\\Models\\User',8,'api-token','c1b1e9f6cd909debf17c7998010fe72f077952608688a716d9da57847974ea27','[\"*\"]','2024-09-17 05:05:00',NULL,'2024-09-17 05:04:56','2024-09-17 05:05:00'),(49,'App\\Models\\User',1,'api-token','cf34589e684cabdc6ef60cff1513391f099443535e2d43e76165b3660736edc2','[\"*\"]',NULL,NULL,'2024-09-17 06:09:21','2024-09-17 06:09:21'),(50,'App\\Models\\User',1,'api-token','d205bc51c8b5428cca6968a8b0fc94d9f13af627268a2c26668338c41ff87a5d','[\"*\"]','2024-09-17 07:51:38',NULL,'2024-09-17 07:50:41','2024-09-17 07:51:38'),(51,'App\\Models\\User',10,'api-token','8425876e99a6c0b62959c46856aefc81d05663736eea432a0d080919c6eaad3e','[\"*\"]','2024-09-17 08:07:02',NULL,'2024-09-17 07:53:27','2024-09-17 08:07:02'),(52,'App\\Models\\User',1,'api-token','0e0ce95b9ada7ec3d4e238bfab82718124bdf371d90970cb3372ec4bde7b5b9a','[\"*\"]',NULL,NULL,'2024-09-17 09:21:53','2024-09-17 09:21:53'),(53,'App\\Models\\User',1,'api-token','edffe5baa5665d51fcafc5b9fb9588d169be4f165b428afdf58c9883b0d2e56e','[\"*\"]',NULL,NULL,'2024-09-17 09:22:58','2024-09-17 09:22:58'),(54,'App\\Models\\User',1,'api-token','5bfd325f6a46d95439da7024962d5d13861e3a0eefa213a973261edaf1bc9b1d','[\"*\"]','2024-09-30 16:37:23',NULL,'2024-09-30 16:25:19','2024-09-30 16:37:23'),(55,'App\\Models\\User',1,'api-token','9031d2d67ce520fe71fb287bfbcc3cbf64f5585f84a0f7eb5a522a350fcebc55','[\"*\"]','2024-10-01 16:39:15',NULL,'2024-09-30 16:39:29','2024-10-01 16:39:15'),(56,'App\\Models\\User',1,'api-token','187d431891d9c6931507833f2824ade0378c70bf454ed4dae055a1cb5cc5a198','[\"*\"]','2024-10-01 11:34:01',NULL,'2024-10-01 11:30:29','2024-10-01 11:34:01'),(57,'App\\Models\\User',1,'api-token','0ba3184d844d073dc090fc45518db0aeb786c53fdfaccedbcc6c60a5402efe90','[\"*\"]','2024-10-01 11:40:56',NULL,'2024-10-01 11:37:44','2024-10-01 11:40:56'),(58,'App\\Models\\User',13,'api-token','07a013b41b436c840b038d32455d8322e7fb0c7b4516c40a4cf8107535d2fedb','[\"*\"]',NULL,NULL,'2024-10-01 11:41:08','2024-10-01 11:41:08'),(59,'App\\Models\\User',1,'api-token','af8c108a6fb4010609088aee3053adc6c46f4e41e693c3e789884c8a1bdece9c','[\"*\"]','2024-10-01 11:50:50',NULL,'2024-10-01 11:45:12','2024-10-01 11:50:50'),(60,'App\\Models\\User',14,'api-token','8ff8b03edb911d28a490de5ae1332a1f2a6bbef313d09fe552cc38a6513415f5','[\"*\"]',NULL,NULL,'2024-10-01 11:51:03','2024-10-01 11:51:03'),(61,'App\\Models\\User',1,'api-token','ce78cf316e95cd6f3322ac80f3a530fe787fc813910f0ce8aad60f68ab093279','[\"*\"]','2024-10-01 15:19:22',NULL,'2024-10-01 15:19:03','2024-10-01 15:19:22'),(62,'App\\Models\\User',1,'api-token','dc93b7869417f4c2c479a07eec00ba33af1b63ae6e3783524880129ff13a2c02','[\"*\"]','2024-10-02 04:48:19',NULL,'2024-10-01 16:39:56','2024-10-02 04:48:19'),(63,'App\\Models\\User',1,'api-token','e4acab330f47975fc68736bd63cb31dcefc3729957394a84d58333a78f464619','[\"*\"]','2024-10-02 17:55:21',NULL,'2024-10-02 04:52:07','2024-10-02 17:55:21'),(64,'App\\Models\\User',1,'api-token','032146c0d0178590aab75614b74e49a3b13f41aed1cb00cac95a985f1a1e5832','[\"*\"]','2024-10-02 16:08:58',NULL,'2024-10-02 10:57:18','2024-10-02 16:08:58'),(65,'App\\Models\\User',1,'api-token','eeddd53c80412ef151b4d04d10180cfe8b23e23bac98b5929f78797e7d287501','[\"*\"]',NULL,NULL,'2024-10-04 14:55:01','2024-10-04 14:55:01'),(66,'App\\Models\\User',1,'api-token','c85fe5bf775e450bbf3bb9e996f56f2d2c2cd5437339ffa699b4332b249a8f63','[\"*\"]','2024-11-19 06:11:28',NULL,'2024-11-19 06:10:50','2024-11-19 06:11:28'),(67,'App\\Models\\User',1,'api-token','ba22e56f13905ddcbae8c02ce60b530ddf7971000e00fac47109d06c44adf91d','[\"*\"]','2024-11-19 10:17:08',NULL,'2024-11-19 06:11:49','2024-11-19 10:17:08'),(68,'App\\Models\\User',1,'api-token','257db3e7e573d86c41b0000e3952bcef27ffa5b507761f23238d2c9483e114ab','[\"*\"]',NULL,NULL,'2024-11-19 10:33:50','2024-11-19 10:33:50'),(69,'App\\Models\\User',1,'api-token','8de0ae4dfb4db14403719a67bfa7a6455b40cc00ae084afed7d04be646274865','[\"*\"]',NULL,NULL,'2024-11-19 17:23:12','2024-11-19 17:23:12'),(70,'App\\Models\\User',1,'api-token','d326c110c87edc46da9e75beeb8943785e26fbd38a23538b674324f0c5d34a04','[\"*\"]','2024-11-19 17:27:07',NULL,'2024-11-19 17:26:59','2024-11-19 17:27:07'),(71,'App\\Models\\User',14,'api-token','7362572a9e56936dea5005ccad1bf88e1c5f12d93bd83ba368bf7288c2b19982','[\"*\"]',NULL,NULL,'2024-11-19 17:27:44','2024-11-19 17:27:44'),(72,'App\\Models\\User',14,'api-token','b796d38d83bb10fbde0d88936c18ee36c7917f5aa2cd2ac9bf1e740e7b67de10','[\"*\"]',NULL,NULL,'2024-11-19 17:36:26','2024-11-19 17:36:26'),(73,'App\\Models\\User',1,'api-token','8377d621ed7c16ac414383d6e0eee401e107af833a6a2add5b724154bd88f15f','[\"*\"]','2024-12-03 09:01:22',NULL,'2024-12-03 08:59:58','2024-12-03 09:01:22'),(74,'App\\Models\\User',1,'api-token','fed3bb41804ced3adf319215f6272566dd1f7f04030c52d9451bb6dff7627cc5','[\"*\"]',NULL,NULL,'2025-01-04 19:37:14','2025-01-04 19:37:14');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `routes_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'Maputo','sddsad','2024-10-01 16:08:06','2024-10-01 16:16:53'),(2,'Xai-Xai',NULL,'2024-10-01 17:19:10','2024-10-01 17:19:10'),(3,'Inhambane',NULL,'2024-10-01 17:19:17','2024-10-01 17:19:17'),(4,'Beira',NULL,'2024-10-01 17:19:24','2024-10-01 17:19:24'),(5,'Chimoio',NULL,'2024-10-01 17:19:30','2024-10-01 17:19:30'),(6,'Tete',NULL,'2024-10-01 17:19:35','2024-10-01 17:19:35'),(7,'Quelimane',NULL,'2024-10-01 17:19:41','2024-10-01 17:19:41'),(8,'Nampula',NULL,'2024-10-01 17:19:47','2024-10-01 17:19:47'),(9,'Pemba',NULL,'2024-10-01 17:19:52','2024-10-01 17:19:52'),(10,'Lichinga',NULL,'2024-10-01 17:19:57','2024-10-01 17:19:57');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('7OYjoceMI4L9l6H2a64yp3iFXXutu5kbNLfgEywQ',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHBNVzE2Q3BHSFpobzB1cFhGaUV3UkRQU0dSVVZnOUZuSnlTbkdRNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8vaW1hZ2VzL3BheW1lbnRzL00tUGVzYS5wbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1736195775),('9XXOPhojoTgw2QH9ZCSDsLcyqAjSi8GhJNsWW075',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmNQbUJFd2x5ak1vbWtMbUVLazJFYzRJU0xMY0kxcjhJa01UV0kyeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8vaW1hZ2VzL2NpdHlsaW5rLmpwZWciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1736029941),('B18Jji5WIAuQE1iCre4ka2I9NQ6VCkUQiWyS0NOR',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXFDaHYxRVRPbm1nZmIzd3UybEg3WExmNXBtV3gyMVpSMWF6R0N2eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1736029907),('G5yCgVV747enrv0hJZbH05dsIBMoleMTtJtO6RSV',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic0tUWWVjbVNKdzVua3I0cUNZTkxBbTlzSTFXOGtsTW9oZnF4dHl2SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1736029932),('GI5v0oG5RhmfZ9fqwGyP3J6B11XMEpJDPvojPYDx',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicVgzSlhSbnpoMkZIQ1pCOUw1R3dQcGdTWFlVWURINHV6OFlQWlNGVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1736029929),('rpTmM8EpQAEqA1BzyhTNISUTzsv3iMU4QP9ofkPg',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0tDRk9qanFoZ3hLWnFVeDJ5QVV2cEtYWXk5cW1XNVp6UWtwYlZQUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8vaW1hZ2VzL2NpdHlsaW5rLmpwZWciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1736029941),('VZZ4vlu13U2vjkspzeztDzCYYKnbP4O58Y9Tn2Fu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiblB1QzBxYm4zYndQRjBQbWhkYjR4STk1TUVSdFZnTzdETXdVVUp5YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1736029935),('wVRHBXYkrPOc33BqUw5nIC9GreWaFPO3B9MCfcuR',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGRlZnlPSkhPWmN2dU8zZmdsNkprcUV3UTU2azJ3aDRkWHZFVGpKZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1736029767),('xQr16de77pJlInvEHUjJUUJg1kFg8NDbrZPw5ZOP',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieHFvS3JsMU01MnRDak9FZjBOaGpVOVJoUlh1STBYOHlnaTNvU1VZYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8vaW1hZ2VzL3BheW1lbnRzL00tUGVzYS5wbmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1736195740),('ynqPuvxNYIjBGB36RLLjGAMnqfF8opSWNYNnnTOl',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicHJ2SW50YkpFM2FNNlF0N0hjTGdDb1FWTHlhR0N6NTNNM1FHcUxHTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8vaW1hZ2VzL2NpdHlsaW5rLmpwZWciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1736030004);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` date NOT NULL,
  `hour` time NOT NULL DEFAULT '04:30:00',
  `total_seats` int NOT NULL DEFAULT '0',
  `seats_available` int NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `discounted_price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'Maputo','Xai-Xai','csaascas','images/jlMrvgjR7zzEl6DOK5R3JCXcyjPxVeXXC38L2JI2.jpg','2024-10-15','04:30:00',40,40,1200.00,NULL,NULL,'2024-10-02 07:22:36','2024-10-02 16:34:02'),(2,'Maputo','Tete','Descrição breve sobre a viagem de Inhambane até Tete.','images/8ekLmKtCf55AM6gluCb0gwMGXfmK1bXXTDOGreVd.jpg','2024-10-08','04:30:00',5,5,2000.00,NULL,NULL,'2024-10-02 10:11:26','2024-10-02 16:33:30'),(3,'Inhambane','Nampula','sacasdsaa',NULL,'2024-10-09','04:30:00',25,25,1000.00,NULL,NULL,'2024-10-02 17:45:12','2024-10-02 17:45:12'),(4,'Tete','Lichinga','55151','images/0Y8tVnAuOllsZA4tdUwfEDAzHN7zcngyUv2kvOxQ.jpg','2024-10-17','04:30:00',25,25,1300.00,20.00,1040.00,'2024-10-02 17:47:18','2024-12-03 09:01:22');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','llmagaia2@gmail.com','827017601','admin','2024-09-11 18:13:51','$2y$12$voiolK9Da7H6A92yXSsCsuBiVdwoRdlQvq5S6tCHE.PEAim2O5Vbe',NULL,'2024-09-11 18:13:51','2024-09-11 18:13:51'),(9,'Lazaro Magaia 1','llmagaia12@gmail.com','28 282 82822','driver',NULL,'$2y$12$fe.KEw36SNGObYE8P3l82uKz/xck1WEc2r1Zw3nMaExU7GipkGUP.',NULL,'2024-09-17 05:27:39','2024-09-17 05:35:15'),(10,'Lazaro Magaia 12','llmagaia10@gmail.com','82 701 7602','driver',NULL,'$2y$12$CdHAlS4.erssUv0Wlwnm0.vUnuVvzDG3zfcUZH9aCT5SIPIVwUrFa',NULL,'2024-09-17 07:51:33','2024-09-17 07:51:33'),(14,'Cliente Teste','877017601@gmail.com','877017601','user',NULL,'$2y$12$n9uUTT4y7fjajSgnNHBeHOTKqtLiwVyuNTocisUuT05SLXxsB.072',NULL,'2024-10-01 11:50:50','2024-10-01 11:50:50');
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

-- Dump completed on 2025-01-11  2:39:02
