-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: league
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `admin_interface_theme`
--

DROP TABLE IF EXISTS `admin_interface_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_header_text_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_header_link_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_header_link_hover_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_module_background_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_module_text_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_module_link_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_module_link_hover_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_generic_link_hover_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_save_button_background_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_save_button_background_hover_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_save_button_text_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_delete_button_background_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_delete_button_background_hover_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css_delete_button_text_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `css` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_modal_background_opacity` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `env` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `env_visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
INSERT INTO `admin_interface_theme` VALUES (1,'Django',1,'Django administration',1,'',1,'#0C4B33','#F5DD5D','#44B78B','#FFFFFF','#C9F0DD','#44B78B','#FFFFFF','#FFFFFF','#C9F0DD',1,'#0C3C26','#156641','#0C4B33','#0C3C26','#FFFFFF','#BA2121','#A41515','#FFFFFF','',0,1,'#000000','0.3',1,'#FFFFFF',1,'','development',1);
/*!40000 ALTER TABLE `admin_interface_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can change config',1,'change_config'),(2,'Can add FileBrowser',2,'add_filebrowser'),(3,'Can change FileBrowser',2,'change_filebrowser'),(4,'Can delete FileBrowser',2,'delete_filebrowser'),(5,'Can add Theme',3,'add_theme'),(6,'Can change Theme',3,'change_theme'),(7,'Can delete Theme',3,'delete_theme'),(8,'Can add log entry',4,'add_logentry'),(9,'Can change log entry',4,'change_logentry'),(10,'Can delete log entry',4,'delete_logentry'),(11,'Can add permission',5,'add_permission'),(12,'Can change permission',5,'change_permission'),(13,'Can delete permission',5,'delete_permission'),(14,'Can add user',6,'add_user'),(15,'Can change user',6,'change_user'),(16,'Can delete user',6,'delete_user'),(17,'Can add group',7,'add_group'),(18,'Can change group',7,'change_group'),(19,'Can delete group',7,'delete_group'),(20,'Can add content type',8,'add_contenttype'),(21,'Can change content type',8,'change_contenttype'),(22,'Can delete content type',8,'delete_contenttype'),(23,'Can add session',9,'add_session'),(24,'Can change session',9,'change_session'),(25,'Can delete session',9,'delete_session'),(26,'Can add site slug',10,'add_siteslug'),(27,'Can change site slug',10,'change_siteslug'),(28,'Can delete site slug',10,'delete_siteslug'),(29,'Can add Season',11,'add_season'),(30,'Can change Season',11,'change_season'),(31,'Can delete Season',11,'delete_season'),(32,'Can add match detail',12,'add_matchdetail'),(33,'Can change match detail',12,'change_matchdetail'),(34,'Can delete match detail',12,'delete_matchdetail'),(35,'Can add banner position',13,'add_bannerposition'),(36,'Can change banner position',13,'change_bannerposition'),(37,'Can delete banner position',13,'delete_bannerposition'),(38,'Can add Referee',14,'add_referee'),(39,'Can change Referee',14,'change_referee'),(40,'Can delete Referee',14,'delete_referee'),(41,'Can add Social',15,'add_social'),(42,'Can change Social',15,'change_social'),(43,'Can delete Social',15,'delete_social'),(44,'Can add match action',16,'add_matchaction'),(45,'Can change match action',16,'change_matchaction'),(46,'Can delete match action',16,'delete_matchaction'),(47,'Can add League',17,'add_league'),(48,'Can change League',17,'change_league'),(49,'Can delete League',17,'delete_league'),(50,'Can add Banner',18,'add_banner'),(51,'Can change Banner',18,'change_banner'),(52,'Can delete Banner',18,'delete_banner'),(53,'Can add Player',19,'add_player'),(54,'Can change Player',19,'change_player'),(55,'Can delete Player',19,'delete_player'),(56,'Can add Match',20,'add_match'),(57,'Can change Match',20,'change_match'),(58,'Can delete Match',20,'delete_match'),(59,'Can add Position',21,'add_position'),(60,'Can change Position',21,'change_position'),(61,'Can delete Position',21,'delete_position'),(62,'Can add category',22,'add_category'),(63,'Can change category',22,'change_category'),(64,'Can delete category',22,'delete_category'),(65,'Can add Club',23,'add_club'),(66,'Can change Club',23,'change_club'),(67,'Can delete Club',23,'delete_club'),(68,'Can add Post',24,'add_post'),(69,'Can change Post',24,'change_post'),(70,'Can delete Post',24,'delete_post'),(71,'Can add Stadium',25,'add_stadium'),(72,'Can change Stadium',25,'change_stadium'),(73,'Can delete Stadium',25,'delete_stadium'),(74,'Can add Gallery',26,'add_gallery'),(75,'Can change Gallery',26,'change_gallery'),(76,'Can delete Gallery',26,'delete_gallery'),(77,'Can add Coach',27,'add_coach'),(78,'Can change Coach',27,'change_coach'),(79,'Can delete Coach',27,'delete_coach'),(80,'Can add player history',28,'add_playerhistory'),(81,'Can change player history',28,'change_playerhistory'),(82,'Can delete player history',28,'delete_playerhistory'),(83,'Can add Sponsor',29,'add_sponsor'),(84,'Can change Sponsor',29,'change_sponsor'),(85,'Can delete Sponsor',29,'delete_sponsor'),(86,'Can add kv store',30,'add_kvstore'),(87,'Can change kv store',30,'change_kvstore'),(88,'Can delete kv store',30,'delete_kvstore'),(89,'Can add Tagged Item',31,'add_taggeditem'),(90,'Can change Tagged Item',31,'change_taggeditem'),(91,'Can delete Tagged Item',31,'delete_taggeditem'),(92,'Can add Tag',32,'add_tag'),(93,'Can change Tag',32,'change_tag'),(94,'Can delete Tag',32,'delete_tag'),(95,'Can add constance',33,'add_constance'),(96,'Can change constance',33,'change_constance'),(97,'Can delete constance',33,'delete_constance'),(98,'Can add coach history',34,'add_coachhistory'),(99,'Can change coach history',34,'change_coachhistory'),(100,'Can delete coach history',34,'delete_coachhistory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$cEpA6qTTEPs6$tQCXIz1HpZisI5CtfqfCFz83/ahEaDq+FSY8HcSQL2E=','2018-07-23 04:20:10.239779',1,'root','','','quan.dm@teko.vn',1,1,'2018-07-01 11:50:44.201675');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constance_config`
--

DROP TABLE IF EXISTS `constance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constance_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constance_config`
--

LOCK TABLES `constance_config` WRITE;
/*!40000 ALTER TABLE `constance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `constance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_banner`
--

DROP TABLE IF EXISTS `core_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_banner_position_id_40ebd10b_fk_core_bannerposition_id` (`position_id`),
  CONSTRAINT `core_banner_position_id_40ebd10b_fk_core_bannerposition_id` FOREIGN KEY (`position_id`) REFERENCES `core_bannerposition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_banner`
--

LOCK TABLES `core_banner` WRITE;
/*!40000 ALTER TABLE `core_banner` DISABLE KEYS */;
INSERT INTO `core_banner` VALUES (1,'2018-07-01 11:52:33.119078','2018-07-01 11:52:33.119123','Top trang chu','#','banner01_1Mz5czJ.jpg',1,2),(2,'2018-07-01 11:52:54.976156','2018-07-01 11:52:54.976218','Middle Trang chu','#','banner01_gGqFRD2.jpg',1,3),(3,'2018-07-01 11:53:09.787114','2018-07-01 11:53:09.787158','Trang trong','#','banner01_2HeS3BE.jpg',1,1),(4,'2018-07-01 12:40:43.249927','2018-07-01 12:40:43.249996','Right','#','banner02_TOVtZbL.jpg',1,4);
/*!40000 ALTER TABLE `core_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_bannerposition`
--

DROP TABLE IF EXISTS `core_bannerposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_bannerposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_bannerposition`
--

LOCK TABLES `core_bannerposition` WRITE;
/*!40000 ALTER TABLE `core_bannerposition` DISABLE KEYS */;
INSERT INTO `core_bannerposition` VALUES (1,'2018-07-01 11:51:04.885834','2018-07-01 11:51:04.885882','Normal Page','normal_page'),(2,'2018-07-01 11:51:20.603707','2018-07-01 11:51:20.603752','Top trang chu','index_1'),(3,'2018-07-01 11:51:47.993819','2018-07-01 11:51:47.993863','index_2','index_2'),(4,'2018-07-01 12:40:17.865957','2018-07-01 12:40:17.866002','Right Index','right_index');
/*!40000 ALTER TABLE `core_bannerposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_category`
--

DROP TABLE IF EXISTS `core_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_category_slug_384eca9c` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_category`
--

LOCK TABLES `core_category` WRITE;
/*!40000 ALTER TABLE `core_category` DISABLE KEYS */;
INSERT INTO `core_category` VALUES (1,'2018-07-01 11:54:12.258371','2018-07-01 11:54:12.258414','Category 1','Category 1','category-1',1),(2,'2018-07-10 07:01:30.233354','2018-07-10 07:01:40.601067','Category 2','','cateory-2',1);
/*!40000 ALTER TABLE `core_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_club`
--

DROP TABLE IF EXISTS `core_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `stadium_id` int(11) DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_club_slug_301aa8dc` (`slug`),
  KEY `core_club_stadium_id_50ce72b8_fk_core_stadium_id` (`stadium_id`),
  CONSTRAINT `core_club_stadium_id_50ce72b8_fk_core_stadium_id` FOREIGN KEY (`stadium_id`) REFERENCES `core_stadium` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_club`
--

LOCK TABLES `core_club` WRITE;
/*!40000 ALTER TABLE `core_club` DISABLE KEYS */;
INSERT INTO `core_club` VALUES (1,'2018-07-01 11:57:49.679423','2018-07-10 07:34:44.429628','Young Elephant','hai-phong','Young_Elephant_FC.png',1,1,NULL),(2,'2018-07-01 11:58:05.690000','2018-07-10 07:34:36.768196','Luang Prabang UTD','ha-noi','Luangprabang_United.png',1,1,NULL),(3,'2018-07-01 12:31:36.033042','2018-07-10 07:34:31.246537','Lao Toyota','thanh-hoa-flc','Lao_Toyota_FC.png',1,3,'www.thanhhoafc.com'),(4,'2018-07-04 04:41:02.520096','2018-07-04 04:41:02.520162','Army FC','army-fc','Army-FC_lPxOTAZ.png',1,4,NULL),(5,'2018-07-04 04:41:35.687455','2018-07-10 07:34:10.695142','Lao Police','lao-police','LAO_POLICE_FC.png',1,5,NULL),(6,'2018-07-04 04:42:03.023031','2018-07-10 07:34:04.098877','DK FC','dk-fc','DK_FC.png',1,6,NULL),(7,'2018-07-04 04:42:23.206737','2018-07-10 07:33:58.601981','Master 7','master-7','Master7.png',1,7,NULL),(8,'2018-07-04 04:42:46.479797','2018-07-10 07:33:51.332220','Savan Utd','savan-utd','savan-utd.png',1,8,NULL);
/*!40000 ALTER TABLE `core_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_coach`
--

DROP TABLE IF EXISTS `core_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_coach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` smallint(5) unsigned DEFAULT NULL,
  `weight` smallint(5) unsigned DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_coach_club_id_cac98f18_fk_core_club_id` (`club_id`),
  CONSTRAINT `core_coach_club_id_cac98f18_fk_core_club_id` FOREIGN KEY (`club_id`) REFERENCES `core_club` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_coach`
--

LOCK TABLES `core_coach` WRITE;
/*!40000 ALTER TABLE `core_coach` DISABLE KEYS */;
INSERT INTO `core_coach` VALUES (1,'2018-07-01 12:01:05.653265','2018-07-04 04:50:21.191287','Bruce Buck','1979-01-01','VN',NULL,NULL,'club_logo_oyp8IY6.png',1,2),(2,'2018-07-01 12:01:19.007565','2018-07-04 04:49:36.347741','Unai Emery','1979-11-03','BL',NULL,NULL,'assist02_fvjyaMR.png',1,1),(3,'2018-07-04 04:51:40.619450','2018-07-04 04:51:40.619494','Josep Guardiola','1979-01-01','LC',NULL,NULL,'',1,3),(4,'2018-07-04 04:52:26.953848','2018-07-04 04:52:26.953895','José Mourinho','1979-01-01','PT',NULL,NULL,'',1,4),(5,'2018-07-04 04:53:10.759263','2018-07-04 04:53:10.759308','Marco Silva','1979-01-01','PT',NULL,NULL,'',1,5),(6,'2018-07-04 04:53:45.139401','2018-07-04 04:53:45.139461','Rafael Benítez','1979-01-01','MF',NULL,NULL,'',1,6),(7,'2018-07-04 04:54:15.569947','2018-07-04 04:54:15.569994','Mark Hughes','1979-01-01','VN',NULL,NULL,'',1,7),(8,'2018-07-04 04:54:46.365581','2018-07-04 04:54:46.365634','Manuel Pellegrini','1979-01-01','UY',NULL,NULL,'',1,8);
/*!40000 ALTER TABLE `core_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_coachhistory`
--

DROP TABLE IF EXISTS `core_coachhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_coachhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `club_id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_coachhistory_coach_id_club_id_date_1e372828_uniq` (`coach_id`,`club_id`,`date`),
  KEY `core_coachhistory_club_id_bb38582c_fk_core_club_id` (`club_id`),
  CONSTRAINT `core_coachhistory_club_id_bb38582c_fk_core_club_id` FOREIGN KEY (`club_id`) REFERENCES `core_club` (`id`),
  CONSTRAINT `core_coachhistory_coach_id_64d4fd4a_fk_core_coach_id` FOREIGN KEY (`coach_id`) REFERENCES `core_coach` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_coachhistory`
--

LOCK TABLES `core_coachhistory` WRITE;
/*!40000 ALTER TABLE `core_coachhistory` DISABLE KEYS */;
INSERT INTO `core_coachhistory` VALUES (1,'2018-07-03 07:32:14.930399','2018-07-03 07:32:14.930437','2018-07-03',2,2),(2,'2018-07-03 07:33:38.581697','2018-07-03 07:33:38.581731','2018-07-03',1,1),(3,'2018-07-04 04:49:36.386283','2018-07-04 04:49:36.386330','2018-07-04',1,2),(4,'2018-07-04 04:50:21.196589','2018-07-04 04:50:21.196630','2018-07-04',2,1),(5,'2018-07-04 04:51:40.624262','2018-07-04 04:51:40.624305','2018-07-04',3,3),(6,'2018-07-04 04:52:26.958127','2018-07-04 04:52:26.958174','2018-07-04',4,4),(7,'2018-07-04 04:53:10.764403','2018-07-04 04:53:10.764446','2018-07-04',5,5),(8,'2018-07-04 04:53:45.143486','2018-07-04 04:53:45.143536','2018-07-04',6,6),(9,'2018-07-04 04:54:15.573152','2018-07-04 04:54:15.573194','2018-07-04',7,7),(10,'2018-07-04 04:54:46.370860','2018-07-04 04:54:46.370902','2018-07-04',8,8);
/*!40000 ALTER TABLE `core_coachhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_gallery`
--

DROP TABLE IF EXISTS `core_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_gallery_slug_0d1a434c` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_gallery`
--

LOCK TABLES `core_gallery` WRITE;
/*!40000 ALTER TABLE `core_gallery` DISABLE KEYS */;
INSERT INTO `core_gallery` VALUES (1,'2018-07-01 12:00:08.779851','2018-07-10 06:45:17.521951','George Salter\'s new pitch helping pupils thrive','anh-1',1,'George-Salter-Academy-Premier-League-The-FA-Facilities-Fund.png'),(2,'2018-07-01 12:00:17.234606','2018-07-10 06:44:43.201260','Improving wing play is priority for Spurs','test-2',1,'GettyImages-914208384-1-.jpg'),(3,'2018-07-01 12:00:24.540086','2018-07-10 06:44:08.223017','Premier League kits for the 2018/19 season','test-3',1,'Ayoze-away-landscape.jpg'),(4,'2018-07-02 05:07:36.288207','2018-07-10 06:43:07.735914','West Ham sign Wilshere on a free transfer','test-5',1,'JackWilshere-WHU.jpg'),(5,'2018-07-10 07:47:57.633028','2018-07-10 07:47:57.633070','The Scout’s XI of England World Cup stars','the-scouts-xi-of-england-world-cup-stars',1,'Walker-Sterling.png');
/*!40000 ALTER TABLE `core_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_gallery_clubs`
--

DROP TABLE IF EXISTS `core_gallery_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_gallery_clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_gallery_clubs_gallery_id_club_id_68707544_uniq` (`gallery_id`,`club_id`),
  KEY `core_gallery_clubs_club_id_b641bb33_fk_core_club_id` (`club_id`),
  CONSTRAINT `core_gallery_clubs_club_id_b641bb33_fk_core_club_id` FOREIGN KEY (`club_id`) REFERENCES `core_club` (`id`),
  CONSTRAINT `core_gallery_clubs_gallery_id_bea6bd08_fk_core_gallery_id` FOREIGN KEY (`gallery_id`) REFERENCES `core_gallery` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_gallery_clubs`
--

LOCK TABLES `core_gallery_clubs` WRITE;
/*!40000 ALTER TABLE `core_gallery_clubs` DISABLE KEYS */;
INSERT INTO `core_gallery_clubs` VALUES (6,1,8),(5,2,6),(4,3,5),(3,4,3),(7,5,8);
/*!40000 ALTER TABLE `core_gallery_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_league`
--

DROP TABLE IF EXISTS `core_league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_league` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `season_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_league_slug_2c027fd6` (`slug`),
  KEY `core_league_season_id_3ccbd489_fk_core_season_id` (`season_id`),
  CONSTRAINT `core_league_season_id_3ccbd489_fk_core_season_id` FOREIGN KEY (`season_id`) REFERENCES `core_season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_league`
--

LOCK TABLES `core_league` WRITE;
/*!40000 ALTER TABLE `core_league` DISABLE KEYS */;
INSERT INTO `core_league` VALUES (1,'2018-07-01 11:53:54.419265','2018-07-04 04:56:13.540359','Lao Champion League','vietnam-champion-league',1,1);
/*!40000 ALTER TABLE `core_league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_match`
--

DROP TABLE IF EXISTS `core_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `home_end_score` smallint(6) NOT NULL,
  `away_end_score` smallint(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `away_team_id` int(11) DEFAULT NULL,
  `home_team_id` int(11) DEFAULT NULL,
  `league_id` int(11) NOT NULL,
  `referee_id` int(11) NOT NULL,
  `stadium_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `core_match_away_team_id_3b4f3dd7_fk_core_club_id` (`away_team_id`),
  KEY `core_match_home_team_id_1dc27130_fk_core_club_id` (`home_team_id`),
  KEY `core_match_league_id_34e82c1d_fk_core_league_id` (`league_id`),
  KEY `core_match_referee_id_0d76afec_fk_core_referee_id` (`referee_id`),
  KEY `core_match_stadium_id_c05a4a66_fk_core_stadium_id` (`stadium_id`),
  CONSTRAINT `core_match_away_team_id_3b4f3dd7_fk_core_club_id` FOREIGN KEY (`away_team_id`) REFERENCES `core_club` (`id`),
  CONSTRAINT `core_match_home_team_id_1dc27130_fk_core_club_id` FOREIGN KEY (`home_team_id`) REFERENCES `core_club` (`id`),
  CONSTRAINT `core_match_league_id_34e82c1d_fk_core_league_id` FOREIGN KEY (`league_id`) REFERENCES `core_league` (`id`),
  CONSTRAINT `core_match_referee_id_0d76afec_fk_core_referee_id` FOREIGN KEY (`referee_id`) REFERENCES `core_referee` (`id`),
  CONSTRAINT `core_match_stadium_id_c05a4a66_fk_core_stadium_id` FOREIGN KEY (`stadium_id`) REFERENCES `core_stadium` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_match`
--

LOCK TABLES `core_match` WRITE;
/*!40000 ALTER TABLE `core_match` DISABLE KEYS */;
INSERT INTO `core_match` VALUES (2,'2018-07-01 12:21:49.891946','2018-07-01 15:02:12.992699','2018-06-01 12:20:01.000000','2018-07-01 12:20:03.000000',0,3,1,2,1,1,1,1),(3,'2018-07-01 12:29:11.045281','2018-07-01 12:29:11.045325','2018-07-01 12:29:04.000000','2018-07-01 12:29:05.000000',2,2,1,1,2,1,1,1),(4,'2018-07-01 12:32:59.048363','2018-07-01 12:32:59.048413','2018-07-01 12:32:48.000000','2018-07-01 12:32:49.000000',0,4,1,3,1,1,1,3),(5,'2018-07-01 14:15:16.940607','2018-07-01 14:15:16.940660','2018-07-02 14:14:54.000000','2018-07-02 14:14:56.000000',2,0,1,2,3,1,1,3),(6,'2018-07-04 01:37:31.026246','2018-07-04 01:37:31.026297','2018-07-07 01:37:30.000000','2018-07-07 03:37:36.000000',0,0,1,3,1,1,1,2);
/*!40000 ALTER TABLE `core_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_match_start_away_team`
--

DROP TABLE IF EXISTS `core_match_start_away_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_match_start_away_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_match_start_away_team_match_id_player_id_a0ac9d89_uniq` (`match_id`,`player_id`),
  KEY `core_match_start_away_team_player_id_05184d25_fk_core_player_id` (`player_id`),
  CONSTRAINT `core_match_start_away_team_match_id_f065702e_fk_core_match_id` FOREIGN KEY (`match_id`) REFERENCES `core_match` (`id`),
  CONSTRAINT `core_match_start_away_team_player_id_05184d25_fk_core_player_id` FOREIGN KEY (`player_id`) REFERENCES `core_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_match_start_away_team`
--

LOCK TABLES `core_match_start_away_team` WRITE;
/*!40000 ALTER TABLE `core_match_start_away_team` DISABLE KEYS */;
INSERT INTO `core_match_start_away_team` VALUES (2,2,2),(3,3,1),(4,4,3),(5,5,2),(6,6,3);
/*!40000 ALTER TABLE `core_match_start_away_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_match_start_home_team`
--

DROP TABLE IF EXISTS `core_match_start_home_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_match_start_home_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_match_start_home_team_match_id_player_id_273ba90f_uniq` (`match_id`,`player_id`),
  KEY `core_match_start_home_team_player_id_03bd5fa6_fk_core_player_id` (`player_id`),
  CONSTRAINT `core_match_start_home_team_match_id_f9f81512_fk_core_match_id` FOREIGN KEY (`match_id`) REFERENCES `core_match` (`id`),
  CONSTRAINT `core_match_start_home_team_player_id_03bd5fa6_fk_core_player_id` FOREIGN KEY (`player_id`) REFERENCES `core_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_match_start_home_team`
--

LOCK TABLES `core_match_start_home_team` WRITE;
/*!40000 ALTER TABLE `core_match_start_home_team` DISABLE KEYS */;
INSERT INTO `core_match_start_home_team` VALUES (2,2,1),(3,3,2),(4,4,1),(5,5,3),(6,6,1);
/*!40000 ALTER TABLE `core_match_start_home_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_matchaction`
--

DROP TABLE IF EXISTS `core_matchaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_matchaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_matchaction_name_d93677e2_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_matchaction`
--

LOCK TABLES `core_matchaction` WRITE;
/*!40000 ALTER TABLE `core_matchaction` DISABLE KEYS */;
INSERT INTO `core_matchaction` VALUES (1,'2018-07-01 12:20:14.879391','2018-07-01 12:20:14.879437','Free kick'),(2,'2018-07-01 12:20:26.606991','2018-07-01 12:20:26.607037','Red Card'),(3,'2018-07-01 12:24:27.310082','2018-07-01 12:24:27.310126','Score'),(4,'2018-07-04 04:43:47.761163','2018-07-04 04:43:47.761249','Yellow Card'),(5,'2018-07-04 04:44:19.491111','2018-07-04 04:44:19.491154','Substitution'),(6,'2018-07-04 04:44:39.573114','2018-07-04 04:44:39.573172','Break'),(7,'2018-07-04 06:18:02.605932','2018-07-04 06:18:02.605988','Throw');
/*!40000 ALTER TABLE `core_matchaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_matchdetail`
--

DROP TABLE IF EXISTS `core_matchdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_matchdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_score` tinyint(1) NOT NULL,
  `is_penalty` tinyint(1) NOT NULL,
  `time` datetime(6) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `match_id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_matchdetail_action_id_1f9f7399_fk_core_matchaction_id` (`action_id`),
  KEY `core_matchdetail_match_id_145efa93_fk_core_match_id` (`match_id`),
  KEY `core_matchdetail_player_id_7334f103_fk_core_player_id` (`player_id`),
  CONSTRAINT `core_matchdetail_action_id_1f9f7399_fk_core_matchaction_id` FOREIGN KEY (`action_id`) REFERENCES `core_matchaction` (`id`),
  CONSTRAINT `core_matchdetail_match_id_145efa93_fk_core_match_id` FOREIGN KEY (`match_id`) REFERENCES `core_match` (`id`),
  CONSTRAINT `core_matchdetail_player_id_7334f103_fk_core_player_id` FOREIGN KEY (`player_id`) REFERENCES `core_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_matchdetail`
--

LOCK TABLES `core_matchdetail` WRITE;
/*!40000 ALTER TABLE `core_matchdetail` DISABLE KEYS */;
INSERT INTO `core_matchdetail` VALUES (1,'2018-07-01 12:21:49.906005','2018-07-01 12:22:13.539336',0,0,'2018-07-01 12:20:55.000000',1,2,1),(2,'2018-07-01 12:21:49.907826','2018-07-01 12:22:13.538281',0,0,'2018-07-01 12:21:10.000000',2,2,2),(3,'2018-07-01 12:24:35.226872','2018-07-01 12:24:35.226915',1,0,'2018-07-01 12:24:53.000000',3,2,1),(4,'2018-07-01 12:29:11.055307','2018-07-01 12:29:11.055351',0,1,'2018-07-01 12:29:27.000000',3,3,1),(5,'2018-07-01 12:29:11.056122','2018-07-01 12:29:11.056177',0,1,'2018-07-01 12:29:28.000000',2,3,2),(6,'2018-07-01 12:32:59.078879','2018-07-01 12:32:59.078942',1,0,'2018-07-01 12:33:15.000000',3,4,3),(7,'2018-07-01 12:32:59.081176','2018-07-01 12:32:59.081214',0,0,'2018-07-01 12:33:15.000000',3,4,3),(8,'2018-07-01 12:32:59.083107','2018-07-01 12:32:59.083142',0,0,'2018-07-01 12:33:17.000000',2,4,1),(9,'2018-07-01 14:15:16.949708','2018-07-01 14:15:16.949754',1,0,'2018-07-01 14:15:16.000000',3,5,3),(10,'2018-07-01 14:15:16.950514','2018-07-01 14:15:16.950555',0,0,'2018-07-01 14:15:16.000000',2,5,2);
/*!40000 ALTER TABLE `core_matchdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_player`
--

DROP TABLE IF EXISTS `core_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` smallint(5) unsigned DEFAULT NULL,
  `weight` smallint(5) unsigned DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `club_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_player_club_id_124561a3_fk_core_club_id` (`club_id`),
  KEY `core_player_slug_691eb2fd` (`slug`),
  KEY `core_player_position_id_9b6bf3f4_fk_core_position_id` (`position_id`),
  CONSTRAINT `core_player_club_id_124561a3_fk_core_club_id` FOREIGN KEY (`club_id`) REFERENCES `core_club` (`id`),
  CONSTRAINT `core_player_position_id_9b6bf3f4_fk_core_position_id` FOREIGN KEY (`position_id`) REFERENCES `core_position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_player`
--

LOCK TABLES `core_player` WRITE;
/*!40000 ALTER TABLE `core_player` DISABLE KEYS */;
INSERT INTO `core_player` VALUES (1,'2018-07-01 11:59:24.075226','2018-07-01 11:59:24.075271','Do manh quan','do-manh-quan','1979-11-21','VN',180,80,'player-detail_tD7EFaQ.png',1,1,1),(2,'2018-07-01 11:59:51.380773','2018-07-01 11:59:51.380830','Truong Van Kien','truong-van-kien','1979-01-01','VN',180,80,'news-05_vHsXquv.jpg',1,2,2),(3,'2018-07-01 12:32:05.282743','2018-07-03 07:35:17.340110','Cong VInh','cong-vinh','1979-01-01','VN',NULL,NULL,'assist02_bPvCQHs.png',1,3,1);
/*!40000 ALTER TABLE `core_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_playerhistory`
--

DROP TABLE IF EXISTS `core_playerhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_playerhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `club_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_playerhistory_player_id_club_id_date_260bcd27_uniq` (`player_id`,`club_id`,`date`),
  KEY `core_playerhistory_club_id_90f72907_fk_core_club_id` (`club_id`),
  CONSTRAINT `core_playerhistory_club_id_90f72907_fk_core_club_id` FOREIGN KEY (`club_id`) REFERENCES `core_club` (`id`),
  CONSTRAINT `core_playerhistory_player_id_4cb7759f_fk_core_player_id` FOREIGN KEY (`player_id`) REFERENCES `core_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_playerhistory`
--

LOCK TABLES `core_playerhistory` WRITE;
/*!40000 ALTER TABLE `core_playerhistory` DISABLE KEYS */;
INSERT INTO `core_playerhistory` VALUES (1,'2018-07-03 07:34:56.538187','2018-07-03 07:34:56.538233',3,3,'2018-07-03');
/*!40000 ALTER TABLE `core_playerhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_position`
--

DROP TABLE IF EXISTS `core_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `is_goal_keeper` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_position`
--

LOCK TABLES `core_position` WRITE;
/*!40000 ALTER TABLE `core_position` DISABLE KEYS */;
INSERT INTO `core_position` VALUES (1,'2018-07-01 11:58:24.459602','2018-07-01 11:58:24.459681','Goal Keeper',1,1),(2,'2018-07-01 11:58:34.105756','2018-07-01 11:58:34.105802','Fowarder',1,0),(3,'2018-07-01 11:58:42.022220','2018-07-01 11:58:42.022269','Defender',1,0),(4,'2018-07-04 04:57:32.191824','2018-07-04 04:57:32.191869','Midfielder',1,0),(5,'2018-07-04 04:57:52.024985','2018-07-04 04:57:52.025028','Defensive Midfielder',1,0),(6,'2018-07-04 04:58:01.938818','2018-07-04 04:58:01.938861','Central Midfielder',1,0),(7,'2018-07-04 04:58:14.090986','2018-07-04 04:58:14.091070','Attacking Midfielder',1,0),(8,'2018-07-04 04:58:21.979687','2018-07-04 04:58:21.979732','Left Midfielder',1,0),(9,'2018-07-04 04:58:28.686434','2018-07-04 04:58:28.686494','Right Midfielder',1,0),(10,'2018-07-04 04:58:39.368341','2018-07-04 04:58:39.368411','Central Forward',1,0),(11,'2018-07-04 04:58:58.115257','2018-07-04 04:58:58.115299','Wing-back',1,0),(12,'2018-07-04 04:59:13.275536','2018-07-04 04:59:13.275578','Sweeper',1,0);
/*!40000 ALTER TABLE `core_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_post`
--

DROP TABLE IF EXISTS `core_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `views` int(11) NOT NULL,
  `display_place` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_post_category_id_cfaaba99_fk_core_category_id` (`category_id`),
  KEY `core_post_slug_fd763e8f` (`slug`),
  CONSTRAINT `core_post_category_id_cfaaba99_fk_core_category_id` FOREIGN KEY (`category_id`) REFERENCES `core_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_post`
--

LOCK TABLES `core_post` WRITE;
/*!40000 ALTER TABLE `core_post` DISABLE KEYS */;
INSERT INTO `core_post` VALUES (1,'2018-07-01 11:55:18.828059','2018-07-10 06:40:02.196331','Former Fantasy winner Simon March happy to spend £13.0m on Liverpool star','Mohamed Salah’s new Fantasy Premier League value of £13.0m is still worth paying for, says a former champion, but only if offset with value elsewhere.','lanh-dao-tp-hcm-xin-loi-cong-nhan-vot-rac',1,'Salah.jpg','<p>Mohamed Salah&rsquo;s new Fantasy Premier League value of &pound;13.0m is still worth paying for, says a former champion, but only if offset with value elsewhere.</p>\r\n\r\n<p>The price of the Liverpool star, who broke the record for FPL points with 303 last season, has jumped &pound;4.0m from his starting price in 2017/18, but he remains a midfielder in the game.</p>\r\n\r\n<p>Simon March, who claimed the FPL title in 2014/15, feels that Salah&#39;s new price is one worth paying.</p>\r\n\r\n<p>&ldquo;I think I would [spend &pound;13.0m],&rdquo; March says of the Egyptian.</p>\r\n\r\n<p>&quot;You can get slightly hung up on the high-priced players, but if you can offset them against good value in other areas then, maybe, it&#39;s not so significant.&rdquo;</p>\r\n\r\n<p>March and fellow FPL experts, Mark Sutherns and Chaz Phillips, analyse in the video above some of the prices revealed, with a collective shock at the cost of David De Gea and a price that makes Wolverhampton Wanderers&rsquo; Diogo Jota a must-have for them.</p>\r\n\r\n<p>Tại chương tr&igrave;nh Lắng nghe v&agrave; trao đổi về&nbsp;<em>Vấn đề ngập nước tại TP HCM: nguy&ecirc;n nh&acirc;n v&agrave; giải ph&aacute;p</em>&nbsp;do HĐND TP HCM tổ chức ng&agrave;y 1/7, nhiều &yacute; kiến cho rằng, việc người d&acirc;n xả r&aacute;c bừa b&atilde;i xuống cống l&agrave;m nước kh&ocirc;ng thể tho&aacute;t l&agrave; l&yacute; do g&acirc;y ngập.</p>\r\n\r\n<p>Anh Ng&ocirc; Ch&iacute; H&ugrave;ng (c&ocirc;ng nh&acirc;n C&ocirc;ng ty tho&aacute;t nước đ&ocirc; thị) cho biết, kh&ocirc;ng &iacute;t lần vớt r&aacute;c dưới cống anh bị bỏng rộp da bởi h&oacute;a chất từ những t&ograve;a nh&agrave; x&acirc;y dựng tuồn thẳng xuống.</p>\r\n\r\n<p>&quot;C&oacute; những h&ocirc;m lần m&ograve; trong cống t&ocirc;i đạp phải kim ti&ecirc;m v&agrave; vật kim loại tứa m&aacute;u, đau thấu tim. Hay khi đang loay hoay đưa r&aacute;c ra ngo&agrave;i t&ocirc;i bị nước thải của c&aacute;c nh&agrave; vệ sinh xối thẳng v&agrave;o đầu... V&igrave; c&ocirc;ng việc, t&ocirc;i cắn răng m&agrave; chịu&quot;, anh H&ugrave;ng n&oacute;i v&agrave; b&agrave;y tỏ mong muốn người d&acirc;n để r&aacute;c đ&uacute;ng nơi đ&uacute;ng chỗ, đừng xả hết xuống cống.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Công nhân thoát nước hàng ngày phải đối mặt với nhiều rác thải do người dân xả xuống cống. \" src=\"https://i-vnexpress.vnecdn.net/2018/07/01/cong-nhan-thoat-nuoc-2488-1530443313.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>C&ocirc;ng nh&acirc;n tho&aacute;t nước vớt r&aacute;c thải dưới cống ở S&agrave;i G&ograve;n.&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&quot;Thay mặt ch&iacute;nh quyền TP HCM, t&ocirc;i xin lỗi về những vất vả, nguy hiểm m&agrave; c&ocirc;ng nh&acirc;n tho&aacute;t nước như anh H&ugrave;ng phải đối mặt&quot;, Chủ tịch HĐND TP HCM Nguyễn Thị Quyết T&acirc;m n&oacute;i bằng giọng ngh&egrave;n nghẹn.</p>\r\n\r\n<p>Theo b&agrave; T&acirc;m, việc để r&aacute;c đ&uacute;ng nơi quy định kh&ocirc;ng chỉ g&oacute;p phần giảm ngập m&agrave; c&ograve;n l&agrave;m cho th&agrave;nh phố xanh sạch hơn. Giải ph&aacute;p n&agrave;y kh&ocirc;ng phải tốn tiền nhưng thời gian qua ch&iacute;nh quyền th&agrave;nh phố, c&aacute;c đo&agrave;n thể chưa l&agrave;m tốt.</p>\r\n\r\n<p>&quot;Vừa đau l&ograve;ng, vừa đ&aacute;ng tr&aacute;ch những h&agrave;nh vi v&ocirc; &yacute; thức của một bộ phận người d&acirc;n. Khi nghe t&acirc;m sự của anh, mỗi người sẽ c&oacute; cảm nhận ri&ecirc;ng v&agrave; t&ocirc;i tin rằng với l&ograve;ng tự trọng mọi người sẽ tự điều chỉnh h&agrave;nh vi để g&oacute;p phần l&agrave;m cho th&agrave;nh phố đẹp hơn, gi&uacute;p cho những người c&ocirc;ng nh&acirc;n như anh đỡ vất vả hơn&quot;, b&agrave; T&acirc;m n&oacute;i.</p>\r\n\r\n<p>Chủ tịch HĐND th&agrave;nh phố cũng đề nghị UBND TP HCM xem x&eacute;t giải quyết ngay những phản &aacute;nh của cử tri về t&igrave;nh trạng ngập nước tại đường Huỳnh Tấn Ph&aacute;t, Chiến Lược, C&acirc;y Tr&acirc;m, L&ecirc; Đức Thọ&hellip;; đồng thời t&iacute;nh to&aacute;n lại thời gian thu gom r&aacute;c v&agrave; đẩy nhanh việc nạo v&eacute;t, khơi th&ocirc;ng d&ograve;ng chảy. Đối với những nơi, khu vực cần c&oacute; lộ tr&igrave;nh giảm ngập phải th&ocirc;ng tin cụ thể tiến độ để người d&acirc;n được r&otilde;.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Hàng chục mét khối rác được các công nhân thoát nước vớt lên từ các miệng thu trên đường Nguyễn Hữu Cảnh, quận Bình Thạnh. Duy Trần\" src=\"https://i-vnexpress.vnecdn.net/2018/07/01/cong-tac-5540-1508231289-6612-1748-3714-1530443313.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>H&agrave;ng chục m3 r&aacute;c được c&aacute;c c&ocirc;ng nh&acirc;n tho&aacute;t nước vớt l&ecirc;n từ c&aacute;c miệng thu tr&ecirc;n đường Nguyễn Hữu Cảnh, quận B&igrave;nh Thạnh.&nbsp;<em>Duy Trần.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Đề cập việc xả r&aacute;c bừa b&atilde;i, Ph&oacute; gi&aacute;m đốc Trung t&acirc;m chống ngập Nguyễn Ho&agrave;ng Anh Dũng n&oacute;i, d&ugrave; cống tho&aacute;t nước c&oacute; l&agrave;m th&ecirc;m bao nhi&ecirc;u, to cỡ n&agrave;o nhưng r&aacute;c cứ b&iacute;t c&aacute;c miệng hố ga th&igrave; nước kh&ocirc;ng tho&aacute;t được. T&igrave;nh trạng ngập của th&agrave;nh phố v&igrave; thế m&agrave; kh&ocirc;ng cải thiện.</p>\r\n\r\n<p>&quot;H&agrave;ng năm ch&uacute;ng t&ocirc;i c&oacute; l&agrave;m việc với c&aacute;c hội đo&agrave;n, tổ d&acirc;n phố để tuy&ecirc;n truyền chống xả r&aacute;c nhưng việc kiểm tra xử l&yacute; thời gian qua c&aacute;c địa phương l&agrave;m chưa đạt hiệu quả. C&oacute; những con rạch r&aacute;c nhiều tới mức c&oacute; thể đi bộ qua được&hellip;&quot;, &ocirc;ng Dũng cho hay.</p>',0,'block_1',1),(2,'2018-07-01 11:56:00.275422','2018-07-10 06:48:45.307090','Powerful Sokratis the first choice at Arsenal','Sokratis Papastathopoulos (£5.5m) has the potential to the top Fantasy Premier League target in the Arsenal defence this season.','4-dieu-can-luu-y-khi-chon-truong-dai-hoc-my',1,'Sokratis-2.png','<p>Sokratis Papastathopoulos (&pound;5.5m) has the potential to the top Fantasy Premier League target in the Arsenal defence this season.</p>\r\n\r\n<p>The centre-back arrives in FPL after joining for an undisclosed fee from Borussia Dortmund.</p>\r\n\r\n<p>Arsenal are expected to play in a 4-2-3-1 formation under Unai Emery that includes Sokratis.</p>\r\n\r\n<p>He may partner Shkodran Mustafi in defence while Laurent Koscielny remains sidelined with a long-term injury.</p>\r\n\r\n<p>Sokratis v Arsenal centre-backs<br />\r\n2017/18&nbsp;&nbsp; &nbsp;Mustafi&nbsp;&nbsp; &nbsp;Koscielny&nbsp;&nbsp; &nbsp;Monreal&nbsp;&nbsp; &nbsp;Sokratis<br />\r\nSucc. tackle %&nbsp;&nbsp; &nbsp;71.9&nbsp;&nbsp; &nbsp;48.8&nbsp;&nbsp; &nbsp;59.3&nbsp;&nbsp; &nbsp;72.3<br />\r\nSucc. header %&nbsp;&nbsp; &nbsp;62.2&nbsp;&nbsp; &nbsp;56.7&nbsp;&nbsp; &nbsp;49.6&nbsp;&nbsp; &nbsp;67.5<br />\r\nSucc. pass %&nbsp;&nbsp; &nbsp;86.2&nbsp;&nbsp; &nbsp;89.0&nbsp;&nbsp; &nbsp;89.5&nbsp;&nbsp; &nbsp;86.9<br />\r\nSokratis scored two goals in 30 Bundesliga appearances in 2017/18.</p>\r\n\r\n<p>He won 83 of 123 aerial duels, giving him a success rate of 67.5 per cent, which was better than any Arsenal defender last season.</p>\r\n\r\n<p>That could be key given Arsenal&#39;s record in the air in 2017/18.</p>\r\n\r\n<p>No team scored more goals from set-pieces than their 16 and only Chelsea, with 17, managed more than their 13 headed goals.</p>\r\n\r\n<p>Sokratis could also improve Arsenal&#39;s defensive prospects given that Arsenal conceded 10 goals from headers last season, the sixth-most in the league.</p>\r\n\r\n<p>Pass points<br />\r\nThe Greek is a good passer, which helps his chance of getting extra FPL points.</p>\r\n\r\n<p>Players who attempt at least 30 passes in a match can score in the Bonus Points System (BPS).</p>\r\n\r\n<p>If they complete 70, 80 or 90 per cent of their passes, they pick up two, four or six BPS points.</p>\r\n\r\n<p>Last season Sokratis averaged 63.4 passes a match, with a completion rate of 86.9 per cent.</p>\r\n\r\n<p>Emery is likely to give his full-backs freedom to attack down the flanks, boosting the points potential of the likes of Hector Bellerin and Stephan Lichtsteiner.</p>\r\n\r\n<p>But with a price of &pound;5.5m, Sokratis&#39;s ability to combine goals, clean sheets and bonus points can establish him as Arsenal&#39;s best FPL option at the back.&nbsp;</p>\r\n\r\n<p>Đại diện VietAbroader chia sẻ, b&ecirc;n cạnh những th&ocirc;ng tin như xếp hạng, học bổng, ng&agrave;nh học, cơ sở vật chất... m&agrave; bạn t&igrave;m thấy tr&ecirc;n website, vẫn c&ograve;n nhiều điều m&agrave; bạn cần biết khi chọn c&aacute;c trường đại học Mỹ.</p>\r\n\r\n<p>Lịch sử nhận học sinh Việt Nam</p>\r\n\r\n<p>Cơ hội đậu của bạn sẽ cao hơn khi nộp đơn v&agrave;o những trường từng nhận học sinh Việt Nam. Nh&igrave;n c&aacute;c anh chị đ&atilde; được nhận, bạn sẽ biết bản th&acirc;n m&igrave;nh đủ chuẩn hay chưa để c&ograve;n cố gắng. Trường c&oacute; cộng đồng học sinh Việt Nam mạnh cũng l&agrave; một điểm cộng để bạn quyết định chọn học hay kh&ocirc;ng.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"4 ĐIỀU CẦN BIẾT KHI LỰA CHỌN TRƯỜNG ĐH MỸ - xin bài edit\" src=\"https://i-vnexpress.vnecdn.net/2018/06/28/1516711975-w500-2811-1530171470.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Những học sinh Việt Nam tại Mỹ.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Trường c&oacute; nhiều cựu học sinh th&agrave;nh đạt</p>\r\n\r\n<p>Một điều m&agrave; hầu hết học sinh, sinh vi&ecirc;n thường bỏ qua l&agrave; mạng lưới học sinh v&agrave; cựu học sinh tại trường. Trong khi đ&oacute;, đa số c&aacute;c trường đều c&oacute; những cộng đồng, hoạt động nhằm lưu giữ v&agrave; kết nối c&aacute;c sinh vi&ecirc;n hiện tại với cựu sinh vi&ecirc;n của trường.</p>\r\n\r\n<p>Một ng&ocirc;i trường với nhiều cựu học sinh th&agrave;nh đạt sẽ l&agrave; cơ hội tốt để c&aacute;c bạn kết nối v&agrave; xin lời khuy&ecirc;n về học tập, nghề nghiệp. Ch&iacute;nh c&aacute;c &ldquo;tiền bối&rdquo; ấy sau n&agrave;y cũng c&oacute; thể sẽ gi&uacute;p đỡ v&agrave; mở ra cho bạn nhiều mối quen biết, c&ugrave;ng cơ hội học tập v&agrave; l&agrave;m việc qu&yacute; gi&aacute;.</p>\r\n\r\n<p>Địa điểm của trường</p>\r\n\r\n<p>Điều n&agrave;y rất cần được bạn lưu t&acirc;m, đặc biệt l&agrave; đối với c&aacute;c trường thuộc hệ thống Liberal Arts (Gi&aacute;o dục giải ph&oacute;ng), thường nằm những nơi xa. Nếu bạn l&agrave; một người tương đối ham vui, sẽ kh&ocirc;ng chịu nổi cảnh phải mất chừng một giờ đồng hồ đi xe bu&yacute;t xuống khu trung t&acirc;m chỉ để cắt t&oacute;c, xem phim, hay đơn giản l&agrave; ăn một b&aacute;t phở cho đỡ nhớ nh&agrave;.</p>\r\n\r\n<p>Ngược lại, một số bạn rất th&iacute;ch m&ocirc;i trường y&ecirc;n tĩnh, về với thi&ecirc;n nhi&ecirc;n của trường. V&igrave; quả thật, kh&ocirc;ng phải ng&ocirc;i trường n&agrave;o ở trung t&acirc;m cũng tốt, đặc biệt l&agrave; đối với c&aacute;c khu phức tạp, nhiều tệ nạn x&atilde; hội.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"4 ĐIỀU CẦN BIẾT KHI LỰA CHỌN TRƯỜNG ĐH MỸ - xin bài edit - 1\" src=\"https://i-vnexpress.vnecdn.net/2018/06/28/551821360-w500-2436-1530171471.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Một số trường như Franklin &amp; Marshall College nằm ở c&aacute;c v&ugrave;ng c&oacute; d&acirc;n cư kh&aacute; thưa thớt.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>M&ocirc; h&igrave;nh dạy học</p>\r\n\r\n<p>Theo đại diện VietAbroader, một m&ocirc; h&igrave;nh gi&aacute;o dục giải ph&oacute;ng Liberal Arts ng&agrave;y c&agrave;ng được ưa chuộng b&ecirc;n cạnh m&ocirc; h&igrave;nh đại học quốc gia (National University), v&igrave; c&oacute; thể cung cấp cho sinh vi&ecirc;n một nền gi&aacute;o dục tự do, to&agrave;n diện. Sinh vi&ecirc;n đang dần chuyển sang lựa chọn Williams College, Bowdoin College - được mệnh danh l&agrave; &ldquo;Harvard của Liberal Arts&rdquo;.</p>\r\n\r\n<p>C&oacute; nhiều điểm kh&aacute;c biệt giữa Liberal Arts College (gi&aacute;o dục giải ph&oacute;ng) v&agrave; National University (gi&aacute;o dục đại cương): từ cấu tr&uacute;c chương tr&igrave;nh học, thời gian chọn ng&agrave;nh, k&iacute;ch cỡ lớp học cho đến phương ph&aacute;p giảng dạy. Để biết th&iacute;ch hợp cho m&ocirc; h&igrave;nh n&agrave;o, bạn sẽ phải t&igrave;m hiểu, lắng nghe nhiều cảm nhận từ c&aacute;c anh chị đi trước để c&oacute; những chia sẻ trải nghiệm ch&acirc;n thực nhất.</p>\r\n\r\n<p>VietAbroader - một trong c&aacute;c tổ chức học sinh, sinh vi&ecirc;n hoạt động mạnh nhất về mảng du học Mỹ - sẽ tổ chức hội thảo VietAbroader 2018 lần thứ 13. Tham dự hội thảo, bạn sẽ c&oacute; cơ hội gặp gỡ c&aacute;c anh chị sinh vi&ecirc;n đại diện cho hơn 70 trường đại học nổi tiếng tại Mỹ. Đặc biệt, bạn c&ograve;n cơ hội luyện phỏng vấn v&agrave; xin học bổng với đại diện tuyển sinh ngay tại triển l&atilde;m. Hội thảo v&agrave; triển l&atilde;m du học ở TP HCM v&agrave; H&agrave; Nội như sau:</p>\r\n\r\n<p>- TP HCM: 8h-18h, ng&agrave;y 14/7 tại Capella Park View, 3 Đặng S&acirc;m, quận Ph&uacute; Nhuận. Xem về sự kiện&nbsp;<a href=\"http://bit.ly/vac18hcm\" target=\"_blank\">tại đ&acirc;y</a>.&nbsp;<a href=\"http://bit.ly/VAC2018_HN\" target=\"_blank\">Đăng k&yacute; tham dự</a>.<br />\r\n- H&agrave; Nội: 8h-18h, ng&agrave;y 15/7 tại Lotte Hotel, Liễu Giai, Ba Đ&igrave;nh. Xem&nbsp;<a href=\"http://bit.ly/vac18hn\" target=\"_blank\">tại đ&acirc;y</a>.</p>',0,'block_2',1),(3,'2018-07-10 06:48:02.994106','2018-07-10 06:48:02.994151','Cairney: We belong in the Premier League','Tom Cairney says Fulham are back where they belong in the Premier League after pledging his future to the club with a new five-year deal.','cairney-we-belong-in-the-premier-league',1,'GettyImages-962703446.jpg','<p>Tom Cairney says Fulham are back where they belong in the Premier League after pledging his future to the club with a new five-year deal.</p>\r\n\r\n<p>The 27-year-old midfielder stated when he joined the club three years ago from Blackburn Rovers he felt he was moving to a top-flight side.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"/media/uploads/2018/07/10/GettyImages-962703446.jpg\" /></p>\r\n\r\n<p>In May, Cairney helped make it happen with the only goal in the Championship play-off final against Aston Villa.</p>\r\n\r\n<p>&quot;When I came to Fulham in 2015 and said that, I did believe that this club belonged here [in the Premier League], but to do it in the fashion that we did, I never could have dreamt of that,&quot; Cairney told Fulham&rsquo;s official website.</p>',0,'block_2',1),(4,'2018-07-10 06:50:30.607524','2018-07-10 06:50:30.607570','Midfield pair can boost Hughes\' resurgence','Adrian Clarke on how new signings and a direct approach can help Southampton keep improving under Mark Hughes','midfield-pair-can-boost-hughes-resurgence',1,'HUghes.png','<p>Adrian Clarke looks at where clubs can improve for the 2018/19 season.</p>\r\n\r\n<p>Southampton<br />\r\nIf Southampton start the season as they ended the last, they can be much-improved in 2018/19.</p>\r\n\r\n<p>Saints secured their Premier League status for the upcoming campaign with eight points from four matches prior to the final day.</p>\r\n\r\n<p>Indeed, the only PL matches they lost after Mark Hughes&#39;s first match in the competition as manager in March were courtesy of late goals against Arsenal, Chelsea and Manchester City.</p>\r\n\r\n<p>Room for improvement<br />\r\nBut although he masterminded their escape from relegation Hughes has a number of issues to address in his first pre-season in charge.</p>\r\n\r\n<p>In short, they made too many mistakes at the back, lacked creativity in midfield and were wasteful in front of goal.</p>\r\n\r\n<p>From back to front the team needs to get better if they are to return to the top half of the table, where they had finished for the past four seasons in a row.</p>\r\n\r\n<p>Headaches at home<br />\r\nSouthampton&rsquo;s home form has been a concern for two consecutive seasons.</p>\r\n\r\n<p>In 2015/16 when Saints finished sixth, they got 36 of their 63 points at St Mary&rsquo;s Stadium and scored 39 goals. &nbsp;</p>\r\n\r\n<p>That dipped to 24 points and only 17 goals the following campaign under Claude Puel.</p>\r\n\r\n<p>During 2017/18 their record worsened.</p>\r\n\r\n<p>While their home goal tally rose to 20 they collected only 19 points, the second-lowest home return behind relegated West Bromwich Albion.</p>\r\n\r\n<p>But why?</p>\r\n\r\n<p>Conversion rate down<br />\r\nIt is down to a combination of factors but a lack of tempo and cutting edge is perhaps the main issue.</p>\r\n\r\n<p>Southampton have been neat and tidy in their play between both penalty boxes but creating and converting chances proved problematic. Too many of their passes were sideways and ineffective.</p>\r\n\r\n<p>Their 11 per cent chance conversion rate was the second-lowest in the Premier League last season.</p>\r\n\r\n<p>Only two PL teams took more passes than Southampton to score at home. On average they made 454 passes for each goal at St Mary&rsquo;s Stadium.</p>\r\n\r\n<p>Home teams in 2017/18<br />\r\nMost passes/shot&nbsp;&nbsp; &nbsp;Most passes/goal<br />\r\nMan City&nbsp;&nbsp; &nbsp;41.5&nbsp;&nbsp; &nbsp;Huddersfield&nbsp;&nbsp; &nbsp;504.1<br />\r\nEverton&nbsp;&nbsp; &nbsp;39.1&nbsp;&nbsp; &nbsp;Swansea&nbsp;&nbsp; &nbsp;481.5<br />\r\nHuddersfield&nbsp;&nbsp; &nbsp;38.8&nbsp;&nbsp; &nbsp;Southampton&nbsp;&nbsp; &nbsp;454.0<br />\r\nMan Utd&nbsp;&nbsp; &nbsp;38.3&nbsp;&nbsp; &nbsp;Burnley&nbsp;&nbsp; &nbsp;445.8<br />\r\nSwansea&nbsp;&nbsp; &nbsp;38.1&nbsp;&nbsp; &nbsp;Chelsea&nbsp;&nbsp; &nbsp;359.6<br />\r\nSouthampton&nbsp;&nbsp; &nbsp;36.2&nbsp;&nbsp; &nbsp;Newcastle&nbsp;&nbsp; &nbsp;341.3<br />\r\nForward steps<br />\r\nSaints need to improve how they create and finish their chances.</p>\r\n\r\n<p>Guido Carrillo, Shane Long, Nathan Redmond and Sofiane Boufal scored five goals between them with an average conversion rate of 5.75 per cent.</p>\r\n\r\n<p>In comparison, the regular Premier League starters with the best conversion rates were Arsenal&#39;s Pierre-Emerick Aubameyang (41 per cent), Huddersfield Town&#39;s Laurent Depoitre (32 per cent) and Cenk Tosun of Everton (31 per cent).</p>\r\n\r\n<p>They need help from players who offer speed, guile, and clinical finishing.</p>\r\n\r\n<p>To this end Stuart Armstrong and Mohamed Elyounoussi might help.</p>\r\n\r\n<p>&#39;The next Mane&#39;<br />\r\nBy signing the two attacking midfielders this summer, Hughes has acquired positive players with drive and end product.</p>\r\n\r\n<p>Armstrong suffered with injuries during 2017/18, but he showed what he is capable of with 17 goals for Celtic in the previous campaign.</p>\r\n\r\n<p>Winger Elyounoussi, who can also play as a No 10, is quick and full of tricks. In some respects he is similar to former Saints and current Liverpool star Sadio Mane.</p>\r\n\r\n<p>Both players will aid Saints creatively and make the team a more dangerous goal threat.</p>\r\n\r\n<p>New Saints signings in 2017/18<br />\r\n&nbsp;&nbsp;&nbsp; &nbsp;Armstrong&nbsp;&nbsp; &nbsp;Elyounoussi<br />\r\nGoals&nbsp;&nbsp; &nbsp;3&nbsp;&nbsp; &nbsp;11<br />\r\nMins/goal&nbsp;&nbsp; &nbsp;499.7&nbsp;&nbsp; &nbsp;242.1<br />\r\nAssists&nbsp;&nbsp; &nbsp;5&nbsp;&nbsp; &nbsp;8<br />\r\nMins/assist&nbsp;&nbsp; &nbsp;332.8&nbsp;&nbsp; &nbsp;299.8<br />\r\nShots/90&nbsp;&nbsp; &nbsp;3.2&nbsp;&nbsp; &nbsp;3.4<br />\r\nCostly mistakes<br />\r\nAnother issue that affected Southampton last term was individual errors.&nbsp;</p>\r\n\r\n<p>Eight different players were guilty of gifting at least one goal to opposition sides.</p>\r\n\r\n<p>In 2016/17 Saints had been solid in this department, making only three individual slips that led to goals.</p>\r\n\r\n<p>Defensive errors in 2017/18<br />\r\n&nbsp;&nbsp;&nbsp; &nbsp;2016/17&nbsp;&nbsp; &nbsp;2017/18<br />\r\nErrors leading to goals&nbsp;&nbsp; &nbsp;3&nbsp;&nbsp; &nbsp;13<br />\r\nPL rank&nbsp;&nbsp; &nbsp;18&nbsp;&nbsp; &nbsp;2<br />\r\nPlayers who made errors leading to goals&nbsp;&nbsp; &nbsp;2&nbsp;&nbsp; &nbsp;8<br />\r\nWork cut out<br />\r\nHughes will look to improve all of the above ahead of his first full campaign as manager.</p>\r\n\r\n<p>But if they can build up early momentum by performing with extra pace and taking the chances that fall their way, this could be a catalyst for happier times at St Mary&#39;s Stadium.</p>\r\n\r\n<p>Tomorrow: Aerial gains can take Liverpool higher</p>\r\n\r\n<p>Also in this series<br />\r\nPart 1: Finishing touch can lift Crystal Palace<br />\r\nPart 2: Can Brighton deliver at set-pieces?<br />\r\nPart 3: Breaking down opponents the next step for Burnley<br />\r\nPart 4: Pogba and Sanchez key to United reaching top gear<br />\r\nPart 5: Huddersfield must aim high to progress<br />\r\nPart 6: Injection of pace could boost Watford&#39;s away form<br />\r\nPart 7: Ki to get Newcastle back in control<br />\r\nPart 8: Improving wing play the priority for Spurs</p>',0,'block_1',1),(5,'2018-07-10 06:52:01.253293','2018-07-10 06:52:01.253337','Maguire: My idol Ferdinand had everything','Leicester centre-back and England World Cup star on how he idolised Man Utd defender and Chelsea\'s John Terry','maguire-my-idol-ferdinand-had-everything',1,'ferdinand-maguire-article-2.png','<p>With his combination of power in the air and comfort with the ball at his feet, Leicester City defender Harry Maguire has played a starring role in England&#39;s run to the semi-finals of the 2018 FIFA World Cup.</p>\r\n\r\n<p>So it is no surprise that he idolised two of the Premier League&#39;s greatest centre-backs who embodied those qualities.</p>\r\n\r\n<p>John Terry&#39;s aerial prowess helped him win four titles and score 41 goals as Chelsea&#39;s captain, but Maguire admits it was Rio Ferdinand, who was a league champion on six occasions with Manchester United, who had the greatest influence on his style of play.</p>\r\n\r\n<p>&quot;The two greatest centre-halves when I was growing up were John Terry and Rio Ferdinand,&quot; said Maguire, who was speaking at his previous club Hull City in 2016/17.</p>\r\n\r\n<p>&quot;I really looked up to them, especially Rio Ferdinand, because he brought the ball out of defence really well. Very comfortable on the ball and he had a bit of everything in his prime. A great centre-half in his time.&quot;</p>\r\n\r\n<p>Maguire, who scored the opener in England&#39;s 2-0 quarter-final victory over Sweden on Saturday, will hope to help the Three Lions reach the World Cup final for only the second time when they face Croatia on Wednesday.</p>',0,'block_2',1),(6,'2018-07-10 07:00:03.380677','2018-07-10 07:00:03.380730','Fulham role the next step in Parker\'s journey','Cottagers\' new first-team coach emulates path of Steven Gerrard and Jody Morris with rise from U18 Premier League','fulham-role-the-next-step-in-parkers-journey',1,'parker.png','<p>The Under-18 Premier League not only helps young talents on their journey to playing in the Premier League, but it also provides a pathway to the top for coaches.</p>\r\n\r\n<p>Liverpool legend Steven Gerrard has taken over as manager of Scottish Premiership side Rangers after coaching the Reds&#39; Under-18 team and Jody Morris has been appointed as assistant to Frank Lampard at Derby County, having led Chelsea to the U18 Premier League and U18 Premier League Cup titles last season.</p>\r\n\r\n<p>And now Scott Parker, another man with a stellar career as a PL midfielder, has returned to Fulham as first-team coach, having retired at Craven Cottage last year and learned his trade as Tottenham Hotspur&rsquo;s U18 manager since then.</p>\r\n\r\n<p>Parker told Fulham&rsquo;s official website: &ldquo;I would like to thank everyone at Spurs for their support and encouragement at the very start of my coaching career with the U18s throughout last season, in particular John McDermott for his guidance and ongoing support. I&#39;m looking forward now to the next step up, coaching the First Team at Fulham.&rdquo;</p>\r\n\r\n<p>McDermott is the north Londoners&rsquo; Head of Academy Coaching and Player Development, and while he is sad to lose Parker&rsquo;s expertise, he is proud that the former Spurs midfielder has been given the opportunity to further his development at senior level.</p>\r\n\r\n<p>McDermott told Spurs&rsquo; official website: &ldquo;Scott was a tremendous influence on our young players far beyond his U18 remit last season and, utilising his vast experience in the game, was absolutely first-class in the way he applied himself to the role and helped to nurture the talents of the players and colleagues he worked with.</p>\r\n\r\n<p>&ldquo;While we are obviously sad to lose a figure of such professionalism and integrity, we are pleased that he has been able to take a first-team position in the Premier League as he furthers his own development as a coach.&rdquo;</p>',0,'block_2',1),(7,'2018-07-10 07:02:18.200015','2018-07-10 07:02:18.200059','Maguire and Alli head England into last four','Goals from Leicester defender and Spurs midfielder put Three Lions in World Cup semi-final for first time since 1990','maguire-and-alli-head-england-into-last-four',1,'Maguire.png','<p>Leicester City&#39;s Harry Maguire and Tottenham Hotspur&#39;s Dele Alli earned England a 2-0 victory over Sweden and a place in the 2018 FIFA World Cup semi-finals.</p>\r\n\r\n<p>Gareth Southgate&#39;s team are the first England side to reach the last four since 1990, and they will play Croatia for a place in the final.</p>\r\n\r\n<p>Leicester centre-back Maguire (pictured above) opened the scoring with a thumping first-half header from a corner by Manchester United wing-back Ashley Young.</p>\r\n\r\n<p>Young&#39;s Man Utd team-mate Jesse Lingard clipped in a cross for Alli to nod in England&#39;s second just before the hour mark.</p>\r\n\r\n<p>That goal came either side of two brilliant saves by Everton goalkeeper Jordan Pickford, who was the hero in their Round of 16 penalty shoot-out victory over Colombia.</p>\r\n\r\n<p>Former Leicester striker Andrej Kramaric cancelled out Denis Cheryshev&#39;s opener for Russia, making it 1-1 after 90 minutes. In extra-time, Domagoj Vida put Croatia ahead before Mario Fernandes scored the home side&#39;s second.&nbsp;</p>\r\n\r\n<p>England&#39;s semi-final with Croatia will take place in Moscow at 19:00 BST on Wednesday 11 July.&nbsp;</p>',0,'block_1',2),(8,'2018-07-10 07:32:37.582368','2018-07-10 07:32:37.582420','Ki signing to get Newcastle back in control','See why South Korean can help a side who won only two matches last season when they had more of the ball','ki-signing-to-get-newcastle-back-in-control',1,'GettyImages-946310856-1-.jpg','<p>Adrian Clarke looks at where clubs can improve for the 2018/19 season.</p>\r\n\r\n<p>Newcastle United<br />\r\nRafael Benitez&rsquo;s preference for a counter-attacking strategy for Newcastle United last season was understandable.</p>\r\n\r\n<p>Newcastle&rsquo;s three most impressive victories came in matches where they saw little of the ball.</p>\r\n\r\n<p>At home they beat Manchester United, Arsenal and Chelsea with shares of possession totaling 35.9 per cent, 28.2 per cent and 41.9 per cent respectively.</p>\r\n\r\n<p>The Magpies looked comfortable as a side who defended resolutely before hitting their opponents on the break. This was especially true when they had the nimble Dwight Gayle leading the line.</p>\r\n\r\n<p>In contrast, in the 10 matches they had more than 50 per cent of the ball they won only twice and averaged 0.8 points per match.</p>\r\n\r\n<p>Such a record over the course of a full season would have left Newcastle bottom of the Premier League on 30 points.</p>\r\n\r\n<p>So learning how to control matches better with the ball is an area for Benitez to focus on.</p>\r\n\r\n<p>Newcastle on the ball<br />\r\n2017/18&nbsp;&nbsp; &nbsp;Total&nbsp;&nbsp; &nbsp;PL rank<br />\r\nPossession&nbsp;&nbsp; &nbsp;41.3%&nbsp;&nbsp; &nbsp;18<br />\r\nPass accuracy&nbsp;&nbsp; &nbsp;72.3%&nbsp;&nbsp; &nbsp;18<br />\r\nSucc. passes ending in final third&nbsp;&nbsp; &nbsp;2526&nbsp;&nbsp; &nbsp;17<br />\r\nThe Ki man<br />\r\nThere is nothing wrong with Newcastle playing to their counter-attacking strengths. But it would ease the load on their defence if they took greater care in possession of the ball.</p>\r\n\r\n<p>Newcastle&#39;s players too often handed the initiative back to their opponents, sometimes through forcing a forward pass that was not on or by losing the ball cheaply.</p>\r\n\r\n<p>The signing of Ki Sung-yueng is perhaps an indication of change.</p>\r\n\r\n<p>At Swansea City last season the South Korea midfielder boasted a pass accuracy of 88 per cent, with an 83 per cent success rate in the opposition half.</p>\r\n\r\n<p>These figures were far superior to Benitez&rsquo;s 2017/18 central midfielders.</p>\r\n\r\n<p>And Ki&rsquo;s calming presence will give the side added comfort in possession.&nbsp;</p>',0,'block_1',2);
/*!40000 ALTER TABLE `core_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_post_clubs`
--

DROP TABLE IF EXISTS `core_post_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_post_clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_post_clubs_post_id_club_id_b1f7c362_uniq` (`post_id`,`club_id`),
  KEY `core_post_clubs_club_id_66663ed7_fk_core_club_id` (`club_id`),
  CONSTRAINT `core_post_clubs_club_id_66663ed7_fk_core_club_id` FOREIGN KEY (`club_id`) REFERENCES `core_club` (`id`),
  CONSTRAINT `core_post_clubs_post_id_db8e4bfb_fk_core_post_id` FOREIGN KEY (`post_id`) REFERENCES `core_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_post_clubs`
--

LOCK TABLES `core_post_clubs` WRITE;
/*!40000 ALTER TABLE `core_post_clubs` DISABLE KEYS */;
INSERT INTO `core_post_clubs` VALUES (3,1,1),(4,2,4),(5,3,3),(6,4,1),(7,5,1),(8,6,6),(9,7,7),(10,8,7);
/*!40000 ALTER TABLE `core_post_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_referee`
--

DROP TABLE IF EXISTS `core_referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_referee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` smallint(5) unsigned DEFAULT NULL,
  `weight` smallint(5) unsigned DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_referee`
--

LOCK TABLES `core_referee` WRITE;
/*!40000 ALTER TABLE `core_referee` DISABLE KEYS */;
INSERT INTO `core_referee` VALUES (1,'2018-07-01 12:00:42.851609','2018-07-04 06:23:11.142316','Trọng tài Martin Atkinson','1979-01-01','VN',NULL,NULL,'assist02_KwMoBQ8.png',1),(2,'2018-07-04 06:23:27.549408','2018-07-04 06:23:27.549456','Trọng tài Neil Swarbrick',NULL,'VN',NULL,NULL,'',1),(3,'2018-07-04 06:23:38.161743','2018-07-04 06:23:38.161835','Trọng tài Craig Pawson',NULL,'VN',NULL,NULL,'',1),(4,'2018-07-04 06:23:48.255023','2018-07-04 06:23:48.255118','Trọng tài Andre Marriner',NULL,'VN',NULL,NULL,'',1),(5,'2018-07-04 06:23:57.130052','2018-07-04 06:23:57.130096','Trọng tài Kevin Friend',NULL,'VN',NULL,NULL,'',1),(6,'2018-07-04 06:24:16.593388','2018-07-04 06:24:16.593435','Trọng tài Michael Oliver',NULL,'VN',NULL,NULL,'',1),(7,'2018-07-04 06:24:36.021281','2018-07-04 06:24:36.021334','Trọng tài Anthony Taylor',NULL,'VN',NULL,NULL,'',1),(8,'2018-07-04 06:24:46.825621','2018-07-04 06:24:46.825665','Trọng tài Robert Madley',NULL,'VN',NULL,NULL,'',1),(9,'2018-07-04 06:25:00.941531','2018-07-04 06:25:00.941585','Trọng tài Jonathan Moss',NULL,'VN',NULL,NULL,'',1);
/*!40000 ALTER TABLE `core_referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_season`
--

DROP TABLE IF EXISTS `core_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_season`
--

LOCK TABLES `core_season` WRITE;
/*!40000 ALTER TABLE `core_season` DISABLE KEYS */;
INSERT INTO `core_season` VALUES (1,'2018-07-01 11:53:31.245028','2018-07-01 11:53:31.245073','2017-2018',1,NULL,NULL);
/*!40000 ALTER TABLE `core_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_siteslug`
--

DROP TABLE IF EXISTS `core_siteslug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_siteslug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_siteslug_slug_content_94fdf33c_uniq` (`slug`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_siteslug`
--

LOCK TABLES `core_siteslug` WRITE;
/*!40000 ALTER TABLE `core_siteslug` DISABLE KEYS */;
INSERT INTO `core_siteslug` VALUES (4,'4-dieu-can-luu-y-khi-chon-truong-dai-hoc-my','Post'),(9,'anh-1','Gallery'),(21,'army-fc','Club'),(26,'cairney-we-belong-in-the-premier-league','Post'),(2,'category-1','Category'),(30,'cateory-2','Category'),(15,'coca','Sponsor'),(13,'cong-vinh','Player'),(23,'dk-fc','Club'),(7,'do-manh-quan','Player'),(29,'fulham-role-the-next-step-in-parkers-journey','Post'),(6,'ha-noi','Club'),(5,'hai-phong','Club'),(32,'ki-signing-to-get-newcastle-back-in-control','Post'),(3,'lanh-dao-tp-hcm-xin-loi-cong-nhan-vot-rac','Post'),(22,'lao-police','Club'),(31,'maguire-and-alli-head-england-into-last-four','Post'),(28,'maguire-my-idol-ferdinand-had-everything','Post'),(24,'master-7','Club'),(27,'midfield-pair-can-boost-hughes-resurgence','Post'),(14,'pepsi','Sponsor'),(25,'savan-utd','Club'),(19,'seafsdf','Sponsor'),(16,'test','Sponsor'),(10,'test-2','Gallery'),(11,'test-3','Gallery'),(20,'test-5','Gallery'),(18,'test2','Sponsor'),(17,'test34','Sponsor'),(12,'thanh-hoa-flc','Club'),(33,'the-scouts-xi-of-england-world-cup-stars','Gallery'),(8,'truong-van-kien','Player'),(1,'vietnam-champion-league','League');
/*!40000 ALTER TABLE `core_siteslug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_social`
--

DROP TABLE IF EXISTS `core_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_social` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_social`
--

LOCK TABLES `core_social` WRITE;
/*!40000 ALTER TABLE `core_social` DISABLE KEYS */;
INSERT INTO `core_social` VALUES (1,'2018-07-01 12:01:45.008609','2018-07-01 12:01:45.008652','Facebook',1,'banner03_rcTH3EI.jpg','facebook','http://gmail.com'),(2,'2018-07-02 05:07:05.649212','2018-07-02 05:07:05.649252','Google',1,'season-image.jpg','google','#');
/*!40000 ALTER TABLE `core_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_social_clubs`
--

DROP TABLE IF EXISTS `core_social_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_social_clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `social_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `core_social_clubs_social_id_club_id_471f9edf_uniq` (`social_id`,`club_id`),
  KEY `core_social_clubs_club_id_c9a3ab17_fk_core_club_id` (`club_id`),
  CONSTRAINT `core_social_clubs_club_id_c9a3ab17_fk_core_club_id` FOREIGN KEY (`club_id`) REFERENCES `core_club` (`id`),
  CONSTRAINT `core_social_clubs_social_id_7814f652_fk_core_social_id` FOREIGN KEY (`social_id`) REFERENCES `core_social` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_social_clubs`
--

LOCK TABLES `core_social_clubs` WRITE;
/*!40000 ALTER TABLE `core_social_clubs` DISABLE KEYS */;
INSERT INTO `core_social_clubs` VALUES (1,2,1),(2,2,2),(3,2,3);
/*!40000 ALTER TABLE `core_social_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sponsor`
--

DROP TABLE IF EXISTS `core_sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sponsor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_sponsor_slug_315c78cf` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sponsor`
--

LOCK TABLES `core_sponsor` WRITE;
/*!40000 ALTER TABLE `core_sponsor` DISABLE KEYS */;
INSERT INTO `core_sponsor` VALUES (1,'2018-07-01 12:36:38.558217','2018-07-01 12:36:38.558260','Pepsi','#','pepsi',1,'brand02_WGjkjem.jpg'),(2,'2018-07-01 12:36:49.275518','2018-07-01 12:36:49.275560','Coca','#','coca',1,'brand01_rrLE7Js.jpg'),(3,'2018-07-01 12:37:11.802868','2018-07-04 06:43:28.927375','7up','#','test',1,'537699703.jpg'),(4,'2018-07-01 12:37:22.225969','2018-07-04 06:43:20.315180','Bò húc','#','test34',1,'bohuc.jpg'),(5,'2018-07-01 12:37:43.376897','2018-07-04 06:43:11.772895','Pepsi','#','test2',1,'Pepsi.jpg'),(6,'2018-07-01 12:38:12.921202','2018-07-04 06:43:01.190302','Coca','#','seafsdf',1,'coca.jpeg');
/*!40000 ALTER TABLE `core_sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_stadium`
--

DROP TABLE IF EXISTS `core_stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_stadium` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capable` int(10) unsigned DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_stadium`
--

LOCK TABLES `core_stadium` WRITE;
/*!40000 ALTER TABLE `core_stadium` DISABLE KEYS */;
INSERT INTO `core_stadium` VALUES (1,'2018-07-01 11:57:03.706104','2018-07-04 03:35:13.100356','Young Elephant Stadium',4000,'YoungElephant.jpg',1),(2,'2018-07-01 11:57:22.202633','2018-07-01 11:57:22.202677','San Lach Tray',NULL,'assist04_izTBT0O.png',1),(3,'2018-07-01 12:31:31.259719','2018-07-04 03:27:39.379485','Lao Toyota Stadium',40000,'toyota.png',1),(4,'2018-07-04 04:41:01.115376','2018-07-04 04:41:01.115417','Army FC Stadium',40000,'Army-FC.png',1),(5,'2018-07-04 04:41:34.475545','2018-07-04 04:41:34.475588','Lao Police Stadium',40000,'Laopolice.png',1),(6,'2018-07-04 04:42:01.472457','2018-07-04 04:42:01.472505','DK FC Stadium',40000,'DKFC.jpg',1),(7,'2018-07-04 04:42:22.410603','2018-07-04 04:42:22.410647','Master 7 Stadium',40000,'Master7.jpg',1),(8,'2018-07-04 04:42:44.448797','2018-07-04 04:42:44.448857','Savan Utd Stadium',40000,'Savang-United.png',1);
/*!40000 ALTER TABLE `core_stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-07-01 11:51:04.887644','1','Normal Page',1,'[{\"added\": {}}]',13,1),(2,'2018-07-01 11:51:20.606318','2','Top trang chu',1,'[{\"added\": {}}]',13,1),(3,'2018-07-01 11:51:47.994435','3','index_2',1,'[{\"added\": {}}]',13,1),(4,'2018-07-01 11:52:33.122299','1','Top trang chu',1,'[{\"added\": {}}]',18,1),(5,'2018-07-01 11:52:54.977795','2','Middle Trang chu',1,'[{\"added\": {}}]',18,1),(6,'2018-07-01 11:53:09.788379','3','Trang trong',1,'[{\"added\": {}}]',18,1),(7,'2018-07-01 11:53:31.245730','1','2017-2018',1,'[{\"added\": {}}]',11,1),(8,'2018-07-01 11:53:54.419979','1','Vietnam Champion League',1,'[{\"added\": {}}]',17,1),(9,'2018-07-01 11:54:12.263864','1','Category 1',1,'[{\"added\": {}}]',22,1),(10,'2018-07-01 11:55:18.841088','1','Lãnh đạo TP HCM xin lỗi công nhân vớt rác',1,'[{\"added\": {}}]',24,1),(11,'2018-07-01 11:56:00.285245','2','4 điều cần lưu ý khi chọn trường đại học Mỹ',1,'[{\"added\": {}}]',24,1),(12,'2018-07-01 11:56:09.599914','2','4 điều cần lưu ý khi chọn trường đại học Mỹ',2,'[{\"changed\": {\"fields\": [\"image\", \"tags\"]}}]',24,1),(13,'2018-07-01 11:57:03.708379','1','San Hang Day',1,'[{\"added\": {}}]',25,1),(14,'2018-07-01 11:57:22.206411','2','San Lach Tray',1,'[{\"added\": {}}]',25,1),(15,'2018-07-01 11:57:49.680842','1','Hai Phong',1,'[{\"added\": {}}]',23,1),(16,'2018-07-01 11:58:05.694938','2','Ha Noi',1,'[{\"added\": {}}]',23,1),(17,'2018-07-01 11:58:24.462401','1','Goal Keeper',1,'[{\"added\": {}}]',21,1),(18,'2018-07-01 11:58:34.108198','2','Fowarder',1,'[{\"added\": {}}]',21,1),(19,'2018-07-01 11:58:42.022865','3','Defender',1,'[{\"added\": {}}]',21,1),(20,'2018-07-01 11:59:24.077684','1','Do manh quan',1,'[{\"added\": {}}]',19,1),(21,'2018-07-01 11:59:51.383809','2','Truong Van Kien',1,'[{\"added\": {}}]',19,1),(22,'2018-07-01 12:00:08.782419','1','anh 1',1,'[{\"added\": {}}]',26,1),(23,'2018-07-01 12:00:17.235704','2','test 2',1,'[{\"added\": {}}]',26,1),(24,'2018-07-01 12:00:24.542408','3','test 3',1,'[{\"added\": {}}]',26,1),(25,'2018-07-01 12:00:42.852887','1','Trọng tài Phạm Văn Thắng',1,'[{\"added\": {}}]',14,1),(26,'2018-07-01 12:01:05.654532','1','quan',1,'[{\"added\": {}}]',27,1),(27,'2018-07-01 12:01:19.008738','2','trest',1,'[{\"added\": {}}]',27,1),(28,'2018-07-01 12:01:45.010705','1','Facebook',1,'[{\"added\": {}}]',15,1),(29,'2018-07-01 12:20:14.881114','1','Free kick',1,'[{\"added\": {}}]',16,1),(30,'2018-07-01 12:20:26.607582','2','Red Card',1,'[{\"added\": {}}]',16,1),(31,'2018-07-01 12:21:49.910018','2','Hai Phong VS Hai Phong',1,'[{\"added\": {}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}]',20,1),(32,'2018-07-01 12:22:13.541029','2','Hai Phong VS Hai Phong',2,'[{\"changed\": {\"name\": \"match detail\", \"object\": \"\", \"fields\": [\"action\"]}}, {\"changed\": {\"name\": \"match detail\", \"object\": \"\", \"fields\": [\"action\"]}}]',20,1),(33,'2018-07-01 12:24:27.310682','3','Score',1,'[{\"added\": {}}]',16,1),(34,'2018-07-01 12:24:35.229422','2','Hai Phong VS Hai Phong',2,'[{\"added\": {\"object\": \"\", \"name\": \"match detail\"}}]',20,1),(35,'2018-07-01 12:29:11.060301','3','Ha Noi VS Ha Noi',1,'[{\"added\": {}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}]',20,1),(36,'2018-07-01 12:31:31.262363','3','San Lam Son',1,'[{\"added\": {}}]',25,1),(37,'2018-07-01 12:31:36.035857','3','Thanh hoa FLC',1,'[{\"added\": {}}]',23,1),(38,'2018-07-01 12:32:05.285318','3','Cong VInh',1,'[{\"added\": {}}]',19,1),(39,'2018-07-01 12:32:59.083880','4','Hai Phong VS Thanh hoa FLC',1,'[{\"added\": {}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}]',20,1),(40,'2018-07-01 12:35:53.937745','3','Cong VInh',2,'[{\"changed\": {\"fields\": [\"position\"]}}]',19,1),(41,'2018-07-01 12:36:38.561413','1','Pepsi',1,'[{\"added\": {}}]',29,1),(42,'2018-07-01 12:36:49.276943','2','Coca',1,'[{\"added\": {}}]',29,1),(43,'2018-07-01 12:37:11.803963','3','test',1,'[{\"added\": {}}]',29,1),(44,'2018-07-01 12:37:22.227300','4','test34',1,'[{\"added\": {}}]',29,1),(45,'2018-07-01 12:37:43.377954','5','test2',1,'[{\"added\": {}}]',29,1),(46,'2018-07-01 12:38:12.922278','6','seafsdf',1,'[{\"added\": {}}]',29,1),(47,'2018-07-01 12:40:17.866673','4','Right Index',1,'[{\"added\": {}}]',13,1),(48,'2018-07-01 12:40:43.251877','4','Right',1,'[{\"added\": {}}]',18,1),(49,'2018-07-01 14:15:16.952462','5','Thanh hoa FLC VS Ha Noi (2 - 0)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}, {\"added\": {\"name\": \"match detail\", \"object\": \"\"}}]',20,1),(50,'2018-07-01 15:02:12.998260','2','Hai Phong VS Ha Noi (0 - 3)',2,'[{\"changed\": {\"fields\": [\"start_time\"]}}]',20,1),(51,'2018-07-02 04:47:43.229221','3','Thanh hoa FLC',2,'[{\"changed\": {\"fields\": [\"website\"]}}]',23,1),(52,'2018-07-02 05:06:37.648831','2','4 điều cần lưu ý khi chọn trường đại học Mỹ',2,'[{\"changed\": {\"fields\": [\"tags\", \"clubs\"]}}]',24,1),(53,'2018-07-02 05:07:05.654200','2','Google',1,'[{\"added\": {}}]',15,1),(54,'2018-07-02 05:07:36.296317','4','test 5',1,'[{\"added\": {}}]',26,1),(55,'2018-07-03 07:32:14.955901','2','trest',2,'[]',27,1),(56,'2018-07-03 07:33:38.607879','1','quan',2,'[]',27,1),(57,'2018-07-03 07:34:56.585837','3','Cong VInh',2,'[]',19,1),(58,'2018-07-03 07:35:17.402544','3','Cong VInh',2,'[]',19,1),(59,'2018-07-04 01:37:31.142145','6','Hai Phong VS Thanh hoa FLC (0 - 0)',1,'[{\"added\": {}}]',20,1),(60,'2018-07-04 02:59:30.516189','1','Hai Phong',2,'[{\"changed\": {\"fields\": [\"website\"]}}]',23,1),(61,'2018-07-04 03:27:39.410591','3','Lao Toyota Stadium',2,'[{\"changed\": {\"fields\": [\"name\", \"capable\", \"image\"]}}]',25,1),(62,'2018-07-04 03:27:49.649336','3','Lao Toyota',2,'[{\"changed\": {\"fields\": [\"name\", \"image\"]}}]',23,1),(63,'2018-07-04 03:34:33.185822','1','Luang Prabang Stadium',2,'[{\"changed\": {\"fields\": [\"name\", \"capable\", \"image\"]}}]',25,1),(64,'2018-07-04 03:34:38.198623','2','Luang Prabang UTD',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,1),(65,'2018-07-04 03:35:13.103872','1','Young Elephant Stadium',2,'[{\"changed\": {\"fields\": [\"name\", \"image\"]}}]',25,1),(66,'2018-07-04 03:35:14.760980','1','Young Elephant',2,'[{\"changed\": {\"fields\": [\"name\", \"website\", \"image\"]}}]',23,1),(67,'2018-07-04 04:41:01.124150','4','Army FC Stadium',1,'[{\"added\": {}}]',25,1),(68,'2018-07-04 04:41:02.548741','4','Army FC',1,'[{\"added\": {}}]',23,1),(69,'2018-07-04 04:41:34.476799','5','Lao Police Stadium',1,'[{\"added\": {}}]',25,1),(70,'2018-07-04 04:41:35.688812','5','Lao Police',1,'[{\"added\": {}}]',23,1),(71,'2018-07-04 04:42:01.473827','6','DK FC Stadium',1,'[{\"added\": {}}]',25,1),(72,'2018-07-04 04:42:03.024417','6','DK FC',1,'[{\"added\": {}}]',23,1),(73,'2018-07-04 04:42:22.414059','7','Master 7 Stadium',1,'[{\"added\": {}}]',25,1),(74,'2018-07-04 04:42:23.207946','7','Master 7',1,'[{\"added\": {}}]',23,1),(75,'2018-07-04 04:42:25.575190','7','Master 7',2,'[]',23,1),(76,'2018-07-04 04:42:44.493426','8','Savan Utd Stadium',1,'[{\"added\": {}}]',25,1),(77,'2018-07-04 04:42:46.481152','8','Savan Utd',1,'[{\"added\": {}}]',23,1),(78,'2018-07-04 04:43:47.764194','4','Yellow Card',1,'[{\"added\": {}}]',16,1),(79,'2018-07-04 04:44:19.491767','5','Substitution',1,'[{\"added\": {}}]',16,1),(80,'2018-07-04 04:44:39.573880','6','Break',1,'[{\"added\": {}}]',16,1),(81,'2018-07-04 04:49:36.389628','2','Unai Emery',2,'[{\"changed\": {\"fields\": [\"name\", \"dob\", \"nationality\", \"club\"]}}]',27,1),(82,'2018-07-04 04:50:21.197843','1','Bruce Buck',2,'[{\"changed\": {\"fields\": [\"name\", \"club\"]}}]',27,1),(83,'2018-07-04 04:51:40.625291','3','Josep Guardiola',1,'[{\"added\": {}}]',27,1),(84,'2018-07-04 04:52:26.959080','4','José Mourinho',1,'[{\"added\": {}}]',27,1),(85,'2018-07-04 04:53:10.766566','5','Marco Silva',1,'[{\"added\": {}}]',27,1),(86,'2018-07-04 04:53:45.145214','6','Rafael Benítez',1,'[{\"added\": {}}]',27,1),(87,'2018-07-04 04:54:15.574083','7','Mark Hughes',1,'[{\"added\": {}}]',27,1),(88,'2018-07-04 04:54:46.373334','8','Manuel Pellegrini',1,'[{\"added\": {}}]',27,1),(89,'2018-07-04 04:56:13.542721','1','Lao Champion League',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(90,'2018-07-04 04:57:32.193862','4','Midfielder',1,'[{\"added\": {}}]',21,1),(91,'2018-07-04 04:57:52.025738','5','Defensive Midfielder',1,'[{\"added\": {}}]',21,1),(92,'2018-07-04 04:58:01.940710','6','Central Midfielder',1,'[{\"added\": {}}]',21,1),(93,'2018-07-04 04:58:14.092117','7','Attacking Midfielder',1,'[{\"added\": {}}]',21,1),(94,'2018-07-04 04:58:21.981774','8','Left Midfielder',1,'[{\"added\": {}}]',21,1),(95,'2018-07-04 04:58:28.687492','9','Right Midfielder',1,'[{\"added\": {}}]',21,1),(96,'2018-07-04 04:58:39.369190','10','Central Forward',1,'[{\"added\": {}}]',21,1),(97,'2018-07-04 04:58:58.115971','11','Wing-back',1,'[{\"added\": {}}]',21,1),(98,'2018-07-04 04:59:13.276444','12','Sweeper',1,'[{\"added\": {}}]',21,1),(99,'2018-07-04 06:18:02.608074','7','Throw',1,'[{\"added\": {}}]',16,1),(100,'2018-07-04 06:23:11.143831','1','Trọng tài Martin Atkinson',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',14,1),(101,'2018-07-04 06:23:27.551731','2','Trọng tài Neil Swarbrick',1,'[{\"added\": {}}]',14,1),(102,'2018-07-04 06:23:38.163328','3','Trọng tài Craig Pawson',1,'[{\"added\": {}}]',14,1),(103,'2018-07-04 06:23:48.256602','4','Trọng tài Andre Marriner',1,'[{\"added\": {}}]',14,1),(104,'2018-07-04 06:23:57.130948','5','Trọng tài Kevin Friend',1,'[{\"added\": {}}]',14,1),(105,'2018-07-04 06:24:16.594207','6','Trọng tài Michael Oliver',1,'[{\"added\": {}}]',14,1),(106,'2018-07-04 06:24:36.022236','7','Trọng tài Anthony Taylor',1,'[{\"added\": {}}]',14,1),(107,'2018-07-04 06:24:46.826426','8','Trọng tài Robert Madley',1,'[{\"added\": {}}]',14,1),(108,'2018-07-04 06:25:00.942743','9','Trọng tài Jonathan Moss',1,'[{\"added\": {}}]',14,1),(109,'2018-07-04 06:43:01.193575','6','Coca',2,'[{\"changed\": {\"fields\": [\"name\", \"image\"]}}]',29,1),(110,'2018-07-04 06:43:11.774546','5','Pepsi',2,'[{\"changed\": {\"fields\": [\"name\", \"image\"]}}]',29,1),(111,'2018-07-04 06:43:20.319228','4','Bò húc',2,'[{\"changed\": {\"fields\": [\"name\", \"image\"]}}]',29,1),(112,'2018-07-04 06:43:28.930657','3','7up',2,'[{\"changed\": {\"fields\": [\"name\", \"image\"]}}]',29,1),(113,'2018-07-10 06:39:43.838474','1','Former Fantasy winner Simon March happy to spend £13.0m on Liverpool star',2,'[{\"changed\": {\"fields\": [\"name\", \"desc\", \"content\", \"clubs\", \"tags\"]}}]',24,1),(114,'2018-07-10 06:40:02.205242','1','Former Fantasy winner Simon March happy to spend £13.0m on Liverpool star',2,'[{\"changed\": {\"fields\": [\"image\", \"tags\"]}}]',24,1),(115,'2018-07-10 06:41:43.626994','2','Powerful Sokratis the first choice at Arsenal',2,'[{\"changed\": {\"fields\": [\"name\", \"desc\", \"image\", \"content\", \"clubs\", \"tags\"]}}]',24,1),(116,'2018-07-10 06:42:48.057263','4','West Ham sign Wilshere on a free transfer',2,'[{\"changed\": {\"fields\": [\"name\", \"image\", \"clubs\"]}}]',26,1),(117,'2018-07-10 06:43:07.738939','4','West Ham sign Wilshere on a free transfer',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',26,1),(118,'2018-07-10 06:44:08.228678','3','Premier League kits for the 2018/19 season',2,'[{\"changed\": {\"fields\": [\"name\", \"image\", \"clubs\"]}}]',26,1),(119,'2018-07-10 06:44:43.206753','2','Improving wing play is priority for Spurs',2,'[{\"changed\": {\"fields\": [\"name\", \"image\", \"clubs\"]}}]',26,1),(120,'2018-07-10 06:45:17.527634','1','George Salter\'s new pitch helping pupils thrive',2,'[{\"changed\": {\"fields\": [\"name\", \"image\", \"clubs\"]}}]',26,1),(121,'2018-07-10 06:48:03.008099','3','Cairney: We belong in the Premier League',1,'[{\"added\": {}}]',24,1),(122,'2018-07-10 06:48:45.324940','2','Powerful Sokratis the first choice at Arsenal',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',24,1),(123,'2018-07-10 06:50:30.624222','4','Midfield pair can boost Hughes\' resurgence',1,'[{\"added\": {}}]',24,1),(124,'2018-07-10 06:52:01.270211','5','Maguire: My idol Ferdinand had everything',1,'[{\"added\": {}}]',24,1),(125,'2018-07-10 07:00:03.395791','6','Fulham role the next step in Parker\'s journey',1,'[{\"added\": {}}]',24,1),(126,'2018-07-10 07:01:30.351496','2','Cateory 2',1,'[{\"added\": {}}]',22,1),(127,'2018-07-10 07:01:40.602880','2','Category 2',2,'[{\"changed\": {\"fields\": [\"name\", \"status\"]}}]',22,1),(128,'2018-07-10 07:02:18.214949','7','Maguire and Alli head England into last four',1,'[{\"added\": {}}]',24,1),(129,'2018-07-10 07:32:37.599171','8','Ki signing to get Newcastle back in control',1,'[{\"added\": {}}]',24,1),(130,'2018-07-10 07:33:51.414221','8','Savan Utd',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',23,1),(131,'2018-07-10 07:33:58.606788','7','Master 7',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',23,1),(132,'2018-07-10 07:34:04.102467','6','DK FC',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',23,1),(133,'2018-07-10 07:34:10.696928','5','Lao Police',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',23,1),(134,'2018-07-10 07:34:31.248290','3','Lao Toyota',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',23,1),(135,'2018-07-10 07:34:36.771580','2','Luang Prabang UTD',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',23,1),(136,'2018-07-10 07:34:44.432952','1','Young Elephant',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',23,1),(137,'2018-07-10 07:47:57.638097','5','The Scout’s XI of England World Cup stars',1,'[{\"added\": {}}]',26,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (4,'admin','logentry'),(3,'admin_interface','theme'),(7,'auth','group'),(5,'auth','permission'),(6,'auth','user'),(1,'constance','config'),(8,'contenttypes','contenttype'),(18,'core','banner'),(13,'core','bannerposition'),(22,'core','category'),(23,'core','club'),(27,'core','coach'),(34,'core','coachhistory'),(26,'core','gallery'),(17,'core','league'),(20,'core','match'),(16,'core','matchaction'),(12,'core','matchdetail'),(19,'core','player'),(28,'core','playerhistory'),(21,'core','position'),(24,'core','post'),(14,'core','referee'),(11,'core','season'),(10,'core','siteslug'),(15,'core','social'),(29,'core','sponsor'),(25,'core','stadium'),(33,'database','constance'),(2,'filebrowser','filebrowser'),(9,'sessions','session'),(32,'taggit','tag'),(31,'taggit','taggeditem'),(30,'thumbnail','kvstore');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-07-01 11:49:06.267981'),(2,'auth','0001_initial','2018-07-01 11:49:08.029051'),(3,'admin','0001_initial','2018-07-01 11:49:08.584131'),(4,'admin','0002_logentry_remove_auto_add','2018-07-01 11:49:08.765512'),(5,'admin_interface','0001_initial','2018-07-01 11:49:09.727297'),(6,'admin_interface','0002_add_related_modal','2018-07-01 11:49:10.509769'),(7,'admin_interface','0003_add_logo_color','2018-07-01 11:49:10.869293'),(8,'admin_interface','0004_rename_title_color','2018-07-01 11:49:11.047045'),(9,'admin_interface','0005_add_recent_actions_visible','2018-07-01 11:49:11.303748'),(10,'admin_interface','0006_bytes_to_str','2018-07-01 11:49:11.645965'),(11,'admin_interface','0007_add_favicon','2018-07-01 11:49:11.912435'),(12,'admin_interface','0008_change_related_modal_background_opacity_type','2018-07-01 11:49:12.123166'),(13,'admin_interface','0009_add_enviroment','2018-07-01 11:49:12.565501'),(14,'contenttypes','0002_remove_content_type_name','2018-07-01 11:49:12.967376'),(15,'auth','0002_alter_permission_name_max_length','2018-07-01 11:49:13.183701'),(16,'auth','0003_alter_user_email_max_length','2018-07-01 11:49:13.384758'),(17,'auth','0004_alter_user_username_opts','2018-07-01 11:49:13.561090'),(18,'auth','0005_alter_user_last_login_null','2018-07-01 11:49:13.898812'),(19,'auth','0006_require_contenttypes_0002','2018-07-01 11:49:14.035373'),(20,'auth','0007_alter_validators_add_error_messages','2018-07-01 11:49:14.210869'),(21,'auth','0008_alter_user_username_max_length','2018-07-01 11:49:14.571595'),(22,'auth','0009_alter_user_last_name_max_length','2018-07-01 11:49:14.771978'),(23,'taggit','0001_initial','2018-07-01 11:49:15.377589'),(24,'taggit','0002_auto_20150616_2121','2018-07-01 11:49:15.586901'),(25,'core','0001_initial','2018-07-01 11:49:23.857479'),(26,'database','0001_initial','2018-07-01 11:49:24.140094'),(27,'sessions','0001_initial','2018-07-01 11:49:24.457446'),(28,'thumbnail','0001_initial','2018-07-01 11:49:24.708646'),(29,'core','0002_auto_20180701_1849','2018-07-01 11:50:01.385385'),(30,'core','0003_club_website','2018-07-02 03:41:24.156574'),(31,'core','0004_auto_20180702_1204','2018-07-02 05:05:58.600932'),(32,'core','0005_auto_20180703_1430','2018-07-03 07:31:22.401331');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cvhbw8yzdmju84ehd1jq3kh56ro24q4f','ODQ2ZDQ3MWYzYmU1MTc2MTE4MjU4MGZhMDU4ODhmMTMzZTU3NmNlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZTliMDE2N2U0MDNjZjM0ZjVmOTRmYmU3NmFhZDM5ZmFiZDdlNzZlIn0=','2018-08-06 04:20:10.247299'),('dluowh0kcs3uexpwpti7byexvix05vch','ODQ2ZDQ3MWYzYmU1MTc2MTE4MjU4MGZhMDU4ODhmMTMzZTU3NmNlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZTliMDE2N2U0MDNjZjM0ZjVmOTRmYmU3NmFhZDM5ZmFiZDdlNzZlIn0=','2018-07-18 01:36:42.340479'),('ido2ffvh2w6sfnrhwk2t2xd55y3srj2f','OGIwNTgxZDc0ZGQzYTYxZGRiYjVlYWQ3MDdlNTcxNzg0MGI1Mzg0OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWU5YjAxNjdlNDAzY2YzNGY1Zjk0ZmJlNzZhYWQzOWZhYmQ3ZTc2ZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-07-15 11:50:40.203226'),('pydv5wctzejppuycwpjjxy6s6bobpqo0','ODQ2ZDQ3MWYzYmU1MTc2MTE4MjU4MGZhMDU4ODhmMTMzZTU3NmNlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZTliMDE2N2U0MDNjZjM0ZjVmOTRmYmU3NmFhZDM5ZmFiZDdlNzZlIn0=','2018-07-17 07:31:52.874964'),('s42tpqih2ns5f3w51ko4o0shnum9q3a6','MWZmYTcyODMwNWRhZTJkNTc5ZWYzZjk3MWUzNTY1ODI1NDI4YzE2MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWU5YjAxNjdlNDAzY2YzNGY1Zjk0ZmJlNzZhYWQzOWZhYmQ3ZTc2ZSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-07-18 03:21:22.967090'),('w5og9a7zji4w960ypxap6uocpf8cysux','ODQ2ZDQ3MWYzYmU1MTc2MTE4MjU4MGZhMDU4ODhmMTMzZTU3NmNlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZTliMDE2N2U0MDNjZjM0ZjVmOTRmYmU3NmFhZDM5ZmFiZDdlNzZlIn0=','2018-07-18 02:59:12.946804');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'test','test'),(2,'premierleague','premierleague'),(3,'Fulham','fulham'),(4,'Arsenal','arsenal'),(5,'Mark Hughes','mark-hughes'),(6,'Ferdinand','ferdinand'),(7,'Leicester City\'s','leicester-citys'),(8,'Newcastle','newcastle');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (3,1,24,2),(5,3,24,3),(6,2,24,4),(7,4,24,5),(8,5,24,6),(9,6,24,3),(10,7,24,7),(11,8,24,8);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
INSERT INTO `thumbnail_kvstore` VALUES ('sorl-thumbnail||image||0138844efd954c0373debac73c421623','{\"size\": [32, 19], \"name\": \"cache/d7/9d/d79dfa7541a815e966c8694ca5bf224e.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||019af9e2a83f24e5e6a84f5ce1db571e','{\"size\": [40, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/a1/6d/a16d2417664f147444ab372dbf0930f4.jpg\"}'),('sorl-thumbnail||image||020a4047781a55d3b6061cabfdaa8511','{\"size\": [37, 24], \"name\": \"cache/b6/35/b635abc4d2b0b60559a3690e71de7c14.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||02d7500724952e3caa7362e0965aa74b','{\"name\": \"537699703.jpg\", \"size\": [612, 405], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||07a70316c253f12eaa65b4ace300ae9b','{\"size\": [200, 137], \"name\": \"cache/09/ae/09aeba6e66d2146c9125ee3488de231a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||07d89295f686f34cc2e2ff0a1a3e009e','{\"name\": \"brand02_biTxBrt.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [128, 70]}'),('sorl-thumbnail||image||07e2b0b022cb399b3fc9b410c7e8cbd1','{\"name\": \"cache/91/65/9165e6dc37274d607be165208dca7280.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [313, 209]}'),('sorl-thumbnail||image||081e7b7e006fb2af0d6902163d7e83dc','{\"name\": \"cache/20/25/20252d47a786205dfa37fa0df850d6ca.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [147, 80]}'),('sorl-thumbnail||image||0d0eafbdc960a5e8c4ee664e16302e3a','{\"name\": \"cache/43/31/4331310060dd2c36e3f1f1a3f57293cb.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [32, 19]}'),('sorl-thumbnail||image||0d805653750e416a197b47027c79747a','{\"name\": \"Master7.png\", \"size\": [1536, 1488], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||114d029e3027ee1ee47a0a28ef6db7d7','{\"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/46/45/464523db56f5c6dec84822c87590672a.jpg\"}'),('sorl-thumbnail||image||13f16cf8713d0e0a295b0fef968ada33','{\"name\": \"cache/f6/4a/f64abcf2505e772b0ae2d89bd95aa81b.jpg\", \"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||14884c7084b83e5d25457698e7796f5b','{\"name\": \"GettyImages-962703446.jpg\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||15d48b16c456cf2cc539e6b233cc9f24','{\"name\": \"Sokratis-2_cT3J3LL.png\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||16386d6d55901e48aeab815816442550','{\"name\": \"Walker-Sterling.png\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||183bce33505e1aa9f3dbce8474c71192','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [115, 125], \"name\": \"cache/dd/16/dd1661a9f3963f549780b09622bda1bb.jpg\"}'),('sorl-thumbnail||image||1860dc116aca303797f64368f422c4c0','{\"size\": [153, 190], \"name\": \"cache/4c/4c/4c4cff8e812dc2fcfd44006d0bd894b1.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||19846998250046a64ec9cdfc7e7a24c9','{\"name\": \"GettyImages-946310856-1-.jpg\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||1ac55c831af40141216696f4cd67d3e7','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [262, 181], \"name\": \"season-image.jpg\"}'),('sorl-thumbnail||image||1b75c6cf45ecebbe47b6f7bfe53b5c21','{\"name\": \"cache/dd/91/dd915a1083615089c558ca3725b753c7.jpg\", \"size\": [200, 137], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||1e86ccc356d5d02e42871fae1d5ea973','{\"size\": [42, 40], \"name\": \"cache/32/84/3284966e4692a4f45988f7af5efbbd0a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||1ec5421b2e474c9a4eb70ffb3639342f','{\"name\": \"cache/0d/40/0d406f9ad0bb294470210972823f474e.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [114, 62]}'),('sorl-thumbnail||image||1f9eb588a3a19616498e146d20518fad','{\"size\": [53, 50], \"name\": \"cache/08/33/0833042c063a07a53720d0ae234fbf62.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||20289948532da3f8d06f1baa18274ade','{\"name\": \"Young_Elephant_FC.png\", \"size\": [3645, 3784], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||20eecd91aa50948f2f73cd91d726f569','{\"name\": \"cache/76/0f/760fa4415d8f9468950acaee7a3b7941.jpg\", \"size\": [419, 288], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||223085752ade07b3fe78030d805eb5e8','{\"size\": [235, 235], \"name\": \"DKFC_T4HnYWJ.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||23ae6741e2282c7546e62cf7352abdba','{\"size\": [37, 24], \"name\": \"cache/fd/9b/fd9b88ee8e89cb5c0832443dbbb25550.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||23ec583518672c5b6153820842484876','{\"size\": [40, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/d1/ee/d1ee490a72b39d45fc46f8bcef5b9ea6.jpg\"}'),('sorl-thumbnail||image||2651ba9d35252c6f08b85056723dd295','{\"name\": \"Maguire.png\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||272c08e98a1205f520fdd53138046385','{\"name\": \"cache/c1/35/c135b50b8cd13af2df3eb0355ce34735.jpg\", \"size\": [53, 50], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||274e3be08d1ba3a1b9869f1af85e2653','{\"size\": [263, 350], \"name\": \"banner03_rcTH3EI.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||27a15f2bed27a3c0014198ef6aa2f358','{\"name\": \"cache/e1/0d/e10d5885d047daab24b976b30170b05e.jpg\", \"size\": [573, 383], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||28912d28e6a373a0075b4b3ca786b42b','{\"size\": [263, 350], \"name\": \"banner03_QHACfmr.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||2c442e4af6b8e0308b2416355e290511','{\"size\": [37, 24], \"name\": \"cache/9f/17/9f1716c9ac22d1194ecea56728da25f3.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||2d0bb699c4c0701a821e10275cf56c1d','{\"name\": \"GettyImages-914208384-1-.jpg\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||2d294a91b1c90281adef71be87208cbe','{\"name\": \"Ayoze-away-landscape.jpg\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||2db43412fde7db1ad53cb1f5946fbc81','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [313, 209], \"name\": \"cache/66/66/666607ee49253b650107f48c302035c0.jpg\"}'),('sorl-thumbnail||image||31554ca60872d2761867dcd2b5795fee','{\"size\": [78, 80], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"YoungElephant_qUW26I6.jpg\"}'),('sorl-thumbnail||image||32458b6721df50f7f44565f924c9e666','{\"size\": [210, 210], \"name\": \"Savang-United_QmBRvCR.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||330128c06a5c615d7d01559c6b999a59','{\"name\": \"brand02_WGjkjem.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [128, 70]}'),('sorl-thumbnail||image||3aa86f8e539dcda384bd0f45bb256a4a','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [419, 288], \"name\": \"cache/f4/b7/f4b7073b4ec771f4ad647718ae38e61c.jpg\"}'),('sorl-thumbnail||image||3ab5010c937d808f861dfe0c5cd84486','{\"name\": \"cache/1b/67/1b672125f0e5a5ecf46f7d4ef7f86382.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||3d0cc72d9573a5737ea013b1eb60d987','{\"size\": [260, 349], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"Laopolice_ARoDiP2.png\"}'),('sorl-thumbnail||image||3e449189c2e7f03b128d0a16ebf6e0e6','{\"size\": [37, 24], \"name\": \"cache/89/30/8930dea00c9f75e5d33cbfa3e93b1bc8.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||3ee896bfa3a7d9b674a45093a346aeea','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [42, 40], \"name\": \"cache/2e/ef/2eefa5d20d171e3d853953d0b37a61ff.jpg\"}'),('sorl-thumbnail||image||3f735d413aa246153c38a71e5a5e14f1','{\"name\": \"assist04_HAfvl8f.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [115, 122]}'),('sorl-thumbnail||image||4136826710b3bcc8341fe168246128a0','{\"name\": \"cache/db/88/db8895136eaa97bafa9cd65939869d64.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [32, 19]}'),('sorl-thumbnail||image||4137f5277062f88bcf656241f9b4d570','{\"name\": \"cache/59/2d/592d15b1a97a41b483167b030cb50ab0.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [114, 62]}'),('sorl-thumbnail||image||43f0d3a48caed2465b03864d670f6491','{\"name\": \"cache/a9/f8/a9f849b757c8971d6c187aee099a22e2.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||484daf81609e43fab1ef640adcef0bf4','{\"name\": \"Sokratis-2.png\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||49bcfb18293854e5df08c49747b0c9b7','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/e5/c1/e5c1e3a20acbf0e1f4e1324cbe0815f1.jpg\", \"size\": [42, 40]}'),('sorl-thumbnail||image||49d84afd85c5d6d6167d9d02ee3396b3','{\"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/24/30/243023a87890ad7018ef0a306a5f0357.jpg\"}'),('sorl-thumbnail||image||4a1af358d07fa4e24c584a339e1071df','{\"size\": [263, 350], \"name\": \"banner03_azzXjMw.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||4a30ddba21995692d724df3045d8562b','{\"name\": \"cache/f9/54/f9542aaa46a05a50f183de0fe4217997.jpg\", \"size\": [573, 383], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||4c76733fec4cd560f86cdb326dbcae6d','{\"name\": \"cache/da/3b/da3b21b3f04b60fc9848a06eb53dc2ad.jpg\", \"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||4e2c041fe2b1fd9c94108d9612d3ac27','{\"size\": [153, 190], \"name\": \"cache/2e/f9/2ef92adfb6b3ae063941b9cd024f18ef.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||4e78a2d0168c8bb9c01d1ff062eaec6c','{\"size\": [37, 24], \"name\": \"cache/be/a3/bea37bb94ed7dd1e4b4a12a3eb71f0ef.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||4eefb182f99984bef16bea8228824c3b','{\"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/bb/06/bb0648c9f55e1bbb648122ddd849ca50.jpg\"}'),('sorl-thumbnail||image||4f3d6836b1ae99f89838b0cf346ada1c','{\"name\": \"cache/3a/96/3a967a0c583608d8ee2535068fa34e2f.jpg\", \"size\": [276, 190], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||5023c0abe02a1c84ce4abade80632e87','{\"size\": [42, 40], \"name\": \"cache/5c/bf/5cbfcc95b6e1801eaea0cb7f3526f4a3.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||50a0dc22e5a8c1d970fb6fe5e8e60885','{\"name\": \"cache/f9/2d/f92d5eed967f7a9ee5a32604b091bafd.jpg\", \"size\": [53, 50], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||51bbd0d9a7cb093672db12f2da811130','{\"size\": [263, 428], \"name\": \"banner02_1Q3t4m9.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||52cfb83637382db85e284f1eeac9472b','{\"name\": \"cache/55/1c/551c6c8e599164d40dd65b5f88caec67.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [153, 190]}'),('sorl-thumbnail||image||52fab9a1eae588e81e6b031e225b1cee','{\"name\": \"cache/3d/fb/3dfb496880f1e0eed198952b61dd7c06.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [153, 190]}'),('sorl-thumbnail||image||539d5721eb2484779ece10d56bc74996','{\"name\": \"ferdinand-maguire-article-2.png\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||54e37329c0c0c284c9f02589e5bfb067','{\"name\": \"cache/90/7f/907fce13fdbf202d98ec8d7dedcbbeaf.jpg\", \"size\": [53, 50], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||560bb3fac5a53f279ae2c7b170f14d1a','{\"name\": \"cache/11/ec/11ecadfff0b180b2df02f5722d393f92.jpg\", \"size\": [200, 137], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||589dd612067a87d7654ef801aceda6db','{\"size\": [210, 210], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"toyota_k0Ppx84.png\"}'),('sorl-thumbnail||image||5c202b26ec4b04a8b113b3929e55f7d8','{\"size\": [264, 182], \"name\": \"cache/e4/93/e49304053148d8d1344bb1aaccf46856.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||5d6ece7490e182ff86bba05b1ee0f0d4','{\"name\": \"cache/a5/c7/a5c7525bbe6d304fc153e5717c1dc8bf.jpg\", \"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||60e6ab47423f3730d744af6798e52c77','{\"name\": \"brand02_PB9NkdG.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [128, 70]}'),('sorl-thumbnail||image||6151c338618bec0530c1e585a45d55d0','{\"size\": [78, 80], \"name\": \"YoungElephant.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||6270615287360f4871dd3b538f01e6e6','{\"size\": [153, 190], \"name\": \"cache/1e/d0/1ed0adbcf8ffdc8c7467484b17140caa.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||65dd45b802eec83d68729777e1b774ad','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [264, 182], \"name\": \"cache/0d/5a/0d5a1b9c5bd7ede838e45afce9dcfb35.jpg\"}'),('sorl-thumbnail||image||662a0616ceab8a57a8522fbef6108c50','{\"size\": [103, 117], \"name\": \"Master7_Lp4N6yG.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||679a7d06c579ba716e93100a01566513','{\"size\": [53, 50], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/32/7e/327eaa53056cf62bdc547d4278059f46.jpg\"}'),('sorl-thumbnail||image||6fefe147e86b1384cd48eede5534649e','{\"size\": [115, 125], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"assist02_fvjyaMR.png\"}'),('sorl-thumbnail||image||712b867da3edac68d79ca9aded209450','{\"name\": \"brand02_0FjqAII.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [128, 70]}'),('sorl-thumbnail||image||73dbad2369a06af2074688461e030197','{\"size\": [419, 288], \"name\": \"cache/4a/94/4a9438f7c8ff4d9797498c15783b647c.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||74172e62c1f9f0800ef4d7596ff33234','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ed/dc/eddcc11323853f806294a430a2b81dd2.jpg\", \"size\": [42, 40]}'),('sorl-thumbnail||image||75a0e4bcf1cca646c5fdcc9fdf18088a','{\"name\": \"cache/f1/94/f1944287c168e7a6a8d9002df67947d4.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [115, 125]}'),('sorl-thumbnail||image||7631696eac424b2aaad4320cc0cc2841','{\"name\": \"cache/1f/3e/1f3ec41498326d5f040c2cb2e047458b.jpg\", \"size\": [53, 50], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||77928133917db750ae753b2eb376d6e6','{\"name\": \"cache/5e/fc/5efc018b6eea27d126c3393897d5d55d.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||79c49055c9389aef361dbb2ce12b38dd','{\"name\": \"Pepsi.jpg\", \"size\": [1024, 768], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||7af3958d2a63679a26d6e53d2357cb0c','{\"size\": [37, 24], \"name\": \"cache/f9/22/f922674cb10678464e74aa3a7d88baa0.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||7d2585dadff8fb6de962831a30e1cac8','{\"name\": \"cache/82/bc/82bc92f276548fd43b008803b1f4c49d.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||7e0a45f7c04cbc0751b1c3cbd7e43e17','{\"name\": \"cache/c1/2c/c12ccd70d16d60f636768d464ad93005.jpg\", \"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||819a7175caa26abd5f21035d271c9ecd','{\"name\": \"cache/f1/d8/f1d827deec1acac05f511ff539eb1287.jpg\", \"size\": [391, 261], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||82cffa2ce5a52a59722aa54b1bd27206','{\"size\": [153, 190], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/84/c8/84c8a2a06832c0756c7a33ad5f4b14b9.jpg\"}'),('sorl-thumbnail||image||84db2fc9b221e141e8b838cea15b6716','{\"size\": [40, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/e4/30/e430715f671b321f875f14ecc1a8aea8.jpg\"}'),('sorl-thumbnail||image||8741af30fe9952238766099686ff3ba9','{\"name\": \"cache/9e/54/9e547abc2976beb53337fbe87cbfcf30.jpg\", \"size\": [391, 261], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||878a431cbd94b9b52f1828d4937d982a','{\"name\": \"cache/80/9a/809af4f11f078cf9fb4ee37eb48420e9.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [313, 209]}'),('sorl-thumbnail||image||87cce040ae41628d0de3ac2352f6731c','{\"name\": \"cache/be/77/be77779a396e29ea47d87373f937da1f.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [114, 62]}'),('sorl-thumbnail||image||89721195a557289cfbd29dcd8a86c73c','{\"size\": [115, 122], \"name\": \"assist04_t9pujCp.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||8a485c1797aa1a23636eb50de72e2d18','{\"size\": [115, 125], \"name\": \"cache/4d/65/4d65b93297c970f5077bfed719e4bc27.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||8a8512bab823e7a8f938054fd227fb4e','{\"name\": \"cache/ea/07/ea07768cf41b266fbf2a6aa56a0c6c1c.jpg\", \"size\": [419, 288], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||8ac00c7abc728623d51cd758e60e1ebb','{\"name\": \"cache/ed/2a/ed2aad3d19f29614b48be6daab47ab04.jpg\", \"size\": [573, 383], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||8b1b257959e3e26bd53795bc2716f213','{\"size\": [263, 350], \"name\": \"banner03_JThAytD.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||8b67d168129711dc33052ca92e771147','{\"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/2a/bc/2abcddae0fb54ec8d4d96f9219cf311f.jpg\"}'),('sorl-thumbnail||image||8dd81d33bdcb4a2d0c7d5ee154fbe34b','{\"name\": \"Luangprabang_United.png\", \"size\": [798, 964], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||8e9d11f6a1d6ee2387f46f58519716af','{\"name\": \"cache/fa/38/fa388f4604f80ea696261f024df9a2d9.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||8ff8042abf1fe95352ca3fd02151e4d6','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"club01.jpg\", \"size\": [37, 37]}'),('sorl-thumbnail||image||90d29b29d081836434cd2ef1fd51e3bf','{\"name\": \"cache/ed/90/ed901214ec5231432c4d30cf4475bc2e.jpg\", \"size\": [147, 80], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||91675f2c8d0746d344b1a3f482c86c3c','{\"name\": \"cache/bc/da/bcdabc97b4b4d3d03ced70d3da2c6891.jpg\", \"size\": [200, 137], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||91c71bcc073eed41e185a09a1a70fb28','{\"size\": [53, 50], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/d6/0b/d60bff1e87d8cbdf51b9fa81f32ad1a5.jpg\"}'),('sorl-thumbnail||image||92368d6de47a65dd1dd512d1f2b1c2a0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/6a/7a/6a7a795caf9dbec3100f5b496982bee2.jpg\", \"size\": [153, 190]}'),('sorl-thumbnail||image||927ce5d39f8656475dfb136dd2b935d6','{\"size\": [42, 40], \"name\": \"cache/a1/eb/a1eb160b09d07995469eedba5d568246.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||929a14a5b8a23fd5afb1da8910d1e1b1','{\"name\": \"cache/a1/41/a14149d90698d243484b72e89664c643.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||9484439855de6605820216b74b9bb5bf','{\"size\": [32, 19], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/fc/b7/fcb7a30a369d9e326ed3151d8d481ea9.jpg\"}'),('sorl-thumbnail||image||94fc475a90c84581b000bcac2901af79','{\"size\": [78, 64], \"name\": \"club-line02.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||95b017f3e5f7cc10d17d184b31d93ae7','{\"size\": [42, 40], \"name\": \"cache/bf/70/bf70202eab2c5d77180a04dc14d52f6a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||987aec21ff8e0b9a2768a223ba680995','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [255, 280], \"name\": \"player-detail_tD7EFaQ.png\"}'),('sorl-thumbnail||image||9a7ee2ed710af9d339e42775c0988671','{\"name\": \"cache/57/d4/57d44e1c482f55e671708f0f7e73b077.jpg\", \"size\": [391, 261], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||9ac53b9cbf1a128049ca9ef7bb03be9f','{\"name\": \"cache/49/ae/49aecacb0f66e4be97f8d14753b4b52b.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||9b5859bdb7fb6d4918c848fe6bdd1721','{\"name\": \"parker.png\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||9f1040d485a7e7b191091a45a7e7a013','{\"name\": \"cache/6e/e4/6ee4d641a55ab8d52c4e79d7243d95bf.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [147, 80]}'),('sorl-thumbnail||image||a1f98def0239a4080f760cee5b766c61','{\"name\": \"cache/8e/b9/8eb978519b64e1b61db9f54b646e0364.jpg\", \"size\": [573, 383], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||a32f46562609e696ca994f0f77d4189c','{\"name\": \"cache/90/9d/909da949aef895090ee0d85291da3331.jpg\", \"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||a3624a7b15efb0760d0e52ffd0cc482d','{\"name\": \"cache/37/97/37976cae8796d9dcc9ea69e728b571e5.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [313, 209]}'),('sorl-thumbnail||image||a38d18b44df062accb3af7376cb92b14','{\"size\": [37, 37], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"Army-FC_lPxOTAZ.png\"}'),('sorl-thumbnail||image||a4cd960592b41862ef6b5359cefb891f','{\"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/fa/8e/fa8e84ead23b066024f40cf513c0ee73.jpg\"}'),('sorl-thumbnail||image||a4ce4ca2d34b17ef81f0fde122f1796a','{\"name\": \"cache/e0/90/e090ed55d43a6badc3f95064c7696717.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [153, 190]}'),('sorl-thumbnail||image||a5bc1426ddfb5b02d60d8fa08857cafd','{\"name\": \"cache/e9/96/e99676fa246f7da3170785ae23aca54a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [114, 62]}'),('sorl-thumbnail||image||a63ba6c23d1614da096849fcee9965d0','{\"name\": \"brand01_rrLE7Js.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [128, 70]}'),('sorl-thumbnail||image||aae7f2f6d7a63c919ec0bd08d1c5bb5e','{\"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/67/c0/67c09b247a5c73a91550b53758aa387d.jpg\"}'),('sorl-thumbnail||image||ac15be4847ce189019d3564bf3b153bf','{\"size\": [153, 190], \"name\": \"cache/2a/92/2a92d90ce9445a19821415ee91a8b19c.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||adf71f8dfce5354b5d24cf06b89ff2ec','{\"name\": \"cache/b7/58/b75846068cc7db5772dfe7355c14af31.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [313, 209]}'),('sorl-thumbnail||image||af5060cc752dcae34aee68efc43ab187','{\"size\": [40, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/1c/79/1c79628ec20034c5201bb01e114b676c.jpg\"}'),('sorl-thumbnail||image||b4057cace51533e052e9a849529fd1a3','{\"name\": \"savan-utd.png\", \"size\": [6540, 5350], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||b44878c917fac75e29475fa5b5d3fce0','{\"size\": [115, 122], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"assist04_izTBT0O.png\"}'),('sorl-thumbnail||image||b5f5f2a8014a24a9fa24c7d015b1d5dc','{\"size\": [263, 428], \"name\": \"banner02_20kmpti.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||b886a947507e2fd39462a341f8bfec25','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [200, 137], \"name\": \"cache/41/7d/417d6d7745f5d7dbfb5e7c1dab4384ac.jpg\"}'),('sorl-thumbnail||image||b95c10467e14b64e4664df5fb5bac113','{\"name\": \"Lao_Toyota_FC.png\", \"size\": [1042, 1042], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||b9be06bcad7099322149ebf9ae6d5a02','{\"size\": [115, 125], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/8c/49/8c494b273708421ade36ed247caa9d9f.jpg\"}'),('sorl-thumbnail||image||ba3e7fc93af99f99b225c635e149e558','{\"name\": \"cache/10/f8/10f8df7bc84393221335c665b248adb7.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||bbf7068b9810dbee4df12e7f3495bfa7','{\"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/0c/86/0c868b2a4d5208a991ed8ac0dad04049.jpg\"}'),('sorl-thumbnail||image||bcb4f27326633e108ff27173f14c79e4','{\"size\": [391, 261], \"name\": \"cache/9d/fb/9dfba9e3e971b0623ba3ea3379f9ee74.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||bcf53276b099ba9aff8506c94ac7f252','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [457, 314], \"name\": \"news-05_vHsXquv.jpg\"}'),('sorl-thumbnail||image||bd72901ade11615aa6282801c30496e1','{\"name\": \"cache/ce/80/ce80ba67028d8848c9af3519350328a7.jpg\", \"size\": [276, 190], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||be076192629b350fe88009f5de7b70c8','{\"size\": [53, 50], \"name\": \"cache/de/5e/de5eaae2080374c35dfa9377bfa4a846.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||bf2e04a6aee6db0789feb54e9903782b','{\"name\": \"cache/07/82/07821164b367afc4e7ade12f5ccfe864.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [153, 190]}'),('sorl-thumbnail||image||c3574c24281dd92f32ddc67ed3120259','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"assist02_bPvCQHs.png\", \"size\": [115, 125]}'),('sorl-thumbnail||image||c35981caf0e3e8955e1531ef69206ec3','{\"name\": \"JackWilshere-WHU.jpg\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||c704b1f1929f22e20330d19899a6cfa5','{\"name\": \"cache/36/95/36955db3381fc1e05762594b0e9d4c71.jpg\", \"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||c8e006bb09f99c0499e432d1cc5537d6','{\"name\": \"cache/18/1c/181c94c06a2bb9af2844a42813d1e14b.jpg\", \"size\": [200, 137], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||c8fc8d0163e3018228a54f4354c0afee','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [263, 179], \"name\": \"news-04.jpg\"}'),('sorl-thumbnail||image||c906ce6ee2f66887f9ec4ee6fccff359','{\"name\": \"DK_FC.png\", \"size\": [800, 800], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||c9c4ebbc9cb1dc487e8e97247db231cf','{\"name\": \"HUghes.png\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||c9f45a1f9ce02bde75383d76db6b81a1','{\"name\": \"cache/33/c3/33c3ef96b68384048c0a73bc2abc57fa.jpg\", \"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||cc9eef556b01a04491600a129618d01b','{\"name\": \"cache/10/87/1087e025ed8b6d5f7d328fddb553bf69.jpg\", \"size\": [276, 190], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||ccea10ac61a4ed4cbbf2bbd61bf91b2f','{\"name\": \"cache/07/a3/07a3bf0cd7d8bfe3c33cb03b7d29f244.jpg\", \"size\": [147, 80], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||cf6ca25f828570daa7ebcfc24551150e','{\"name\": \"Salah.jpg\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||cf70042e5aa435b95958750e7708ae57','{\"size\": [40, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/aa/52/aa5239899da34222e450a5a173431258.jpg\"}'),('sorl-thumbnail||image||cfca551002d52705e41c78affa939ac0','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [42, 40], \"name\": \"cache/ae/22/ae2263f6dec333b006118278e385e3f8.jpg\"}'),('sorl-thumbnail||image||cfcc01cac4fbb8827b648851c2aef376','{\"name\": \"cache/76/b6/76b656c86cbb930a0691744507bdf7b6.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [313, 209]}'),('sorl-thumbnail||image||d15cf12ac8c6a49d4fb830b552714125','{\"name\": \"cache/12/05/12053bb8e0e210924f4b939dac86b4ea.jpg\", \"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||d1bc9cec2d5864769164153a58af6aab','{\"name\": \"cache/94/0d/940d8495fec8c6dcbe73323452c42e62.jpg\", \"size\": [391, 261], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||d2b7dea9fbb55cfe3c127477e9d598a8','{\"name\": \"brand01_ZGt5MYK.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [128, 70]}'),('sorl-thumbnail||image||d3bba575cded49a223d4fc0bef3cf191','{\"name\": \"George-Salter-Academy-Premier-League-The-FA-Facilities-Fund.png\", \"size\": [500, 333], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||d44cde4d39420ae547050f3b5d246737','{\"size\": [37, 24], \"name\": \"cache/0b/5a/0b5ab326849d37ba431c5e03a96ed740.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||d6b2abf17177d41788b9f454cd148eb2','{\"name\": \"cache/94/83/9483add087c9aa83e4e6771624d94cce.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [147, 80]}'),('sorl-thumbnail||image||d941d279b4fba6e83efe60b2c62422c0','{\"name\": \"bohuc.jpg\", \"size\": [600, 524], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||dbd3bd2bdfed06b736eae7e8090b9bf6','{\"name\": \"cache/06/db/06dbc0f937733d326c78771b9bcce8f6.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [114, 62]}'),('sorl-thumbnail||image||dc567231615103667a0e2fd03837d82a','{\"name\": \"cache/e5/57/e557b934965c7b3acc4104570069fbc2.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [153, 190]}'),('sorl-thumbnail||image||dcb4dfeb1ceef385ab0c18c7cb5c2162','{\"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/c6/e1/c6e1dc2b90f0b4740336f61c6b53f7a6.jpg\", \"size\": [53, 50]}'),('sorl-thumbnail||image||dcdce01f51e1c29907b564f7e5d6ee5f','{\"size\": [53, 50], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/b9/69/b96908736bfc019d05947d563fa91e9d.jpg\"}'),('sorl-thumbnail||image||e517516c63fdf96396c04cdd6a2cc377','{\"size\": [42, 40], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/ad/1a/ad1aaa90a78f22ad5a0058cfa8add848.jpg\"}'),('sorl-thumbnail||image||e53c0f23405b5e414687295bcc1750c9','{\"name\": \"cache/39/db/39dbb587da3fb8bcf09ae3c8572a930c.jpg\", \"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||e5c2a51a75c651dd7e40d6575c7b57ec','{\"name\": \"cache/f2/3d/f23d135d70b2993af8ad02bcb05876e7.jpg\", \"size\": [147, 80], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||ea433a418618c5aee88bf32c50493fbb','{\"name\": \"cache/ab/0e/ab0eb19db99ca94aee6106115245356b.jpg\", \"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||ea8aa66cdb055d1d9fd225955fe96181','{\"size\": [573, 383], \"name\": \"cache/e4/28/e428fa6f962341fa92899b501bf322c1.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||eaa3f512e0c30a2c14ed6fd0a50a71b5','{\"name\": \"cache/9d/c6/9dc62c1e701c1430908704e7ce3e496b.jpg\", \"size\": [419, 288], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||eb1968edee45e7e78f5f15dc42725b2c','{\"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/cd/00/cd006e49c15f83e196b1957642d90d4e.jpg\"}'),('sorl-thumbnail||image||ec7099b340cc401312ef26aa322cb1e9','{\"size\": [42, 40], \"name\": \"cache/c0/6f/c06f150b7a879d4451c7a87d4abd9557.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||ed9c8581570fc9dd8748d1cea3e49e2b','{\"size\": [53, 50], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/c9/f1/c9f1dd93fc8081382372caded3e86cf6.jpg\"}'),('sorl-thumbnail||image||edf876c3ab4ef624124fb5410a449096','{\"size\": [32, 19], \"name\": \"cache/8e/36/8e36b132d08e1c1b857aec25136f55f7.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||ef7a2cab9cd16224c815e9b9ecd1423c','{\"name\": \"cache/bf/c1/bfc1192fe0e54bc0d41ae955955d3a0f.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [147, 80]}'),('sorl-thumbnail||image||f1728b17f838d5e0a8fbd1c3ecba47c4','{\"name\": \"cache/58/3c/583c5ff24814b1b289d4451271a90558.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [115, 125]}'),('sorl-thumbnail||image||f17d8e9e99becdfa653143bdad9a9254','{\"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"cache/dd/42/dd42a5f0349218b516ee8f4bbf538e2b.jpg\"}'),('sorl-thumbnail||image||f21055ff6a33089f757d14ae48a8bac2','{\"size\": [200, 137], \"name\": \"cache/f3/6f/f36fc486bd73da1b5839e7e92e9cbf97.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||f97ccc8dfbde781465978365403898e5','{\"name\": \"cache/ab/83/ab8338fa32a2ee4fc2419a8efff1b43f.jpg\", \"size\": [115, 125], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||fa317767b962c25329eb754f174f000b','{\"name\": \"cache/5c/c1/5cc1bb6e36ff4975333d7e5eb44a85f1.jpg\", \"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||fa7a727bad9686ba416c4a469cbaeac8','{\"name\": \"cache/37/43/3743f0c7852ef5dab1acfc04120af5f0.jpg\", \"size\": [37, 24], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||fa9f73c77de075cca3c38f6525c83d32','{\"size\": [153, 190], \"storage\": \"django.core.files.storage.FileSystemStorage\", \"name\": \"club_logo_oyp8IY6.png\"}'),('sorl-thumbnail||image||fd524280212a96fbe83504cb44986bf5','{\"name\": \"cache/b0/d4/b0d490bf64964ff5c0ce65904eea2e26.jpg\", \"size\": [313, 209], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||fe0e7a31eac9c69df80ab81ddd8165e0','{\"name\": \"cache/ba/6a/ba6ad2d74c7a9156f231edb66d818778.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [147, 80]}'),('sorl-thumbnail||image||fee90beaa4dac33b5442729a7d462aa0','{\"size\": [210, 210], \"name\": \"toyota.png\", \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||image||ff7c4fc67c1704588b7a71a5d8338e93','{\"name\": \"LAO_POLICE_FC.png\", \"size\": [260, 349], \"storage\": \"django.core.files.storage.FileSystemStorage\"}'),('sorl-thumbnail||thumbnails||02d7500724952e3caa7362e0965aa74b','[\"4137f5277062f88bcf656241f9b4d570\", \"e5c2a51a75c651dd7e40d6575c7b57ec\"]'),('sorl-thumbnail||thumbnails||07d89295f686f34cc2e2ff0a1a3e009e','[\"ef7a2cab9cd16224c815e9b9ecd1423c\"]'),('sorl-thumbnail||thumbnails||0d805653750e416a197b47027c79747a','[\"8e9d11f6a1d6ee2387f46f58519716af\", \"4c76733fec4cd560f86cdb326dbcae6d\"]'),('sorl-thumbnail||thumbnails||14884c7084b83e5d25457698e7796f5b','[\"07e2b0b022cb399b3fc9b410c7e8cbd1\", \"cc9eef556b01a04491600a129618d01b\", \"d1bc9cec2d5864769164153a58af6aab\"]'),('sorl-thumbnail||thumbnails||15d48b16c456cf2cc539e6b233cc9f24','[\"8a8512bab823e7a8f938054fd227fb4e\"]'),('sorl-thumbnail||thumbnails||16386d6d55901e48aeab815816442550','[\"eaa3f512e0c30a2c14ed6fd0a50a71b5\", \"e53c0f23405b5e414687295bcc1750c9\"]'),('sorl-thumbnail||thumbnails||19846998250046a64ec9cdfc7e7a24c9','[\"8ac00c7abc728623d51cd758e60e1ebb\"]'),('sorl-thumbnail||thumbnails||1ac55c831af40141216696f4cd67d3e7','[\"65dd45b802eec83d68729777e1b774ad\"]'),('sorl-thumbnail||thumbnails||20289948532da3f8d06f1baa18274ade','[\"272c08e98a1205f520fdd53138046385\", \"3ab5010c937d808f861dfe0c5cd84486\", \"a4ce4ca2d34b17ef81f0fde122f1796a\", \"fa317767b962c25329eb754f174f000b\"]'),('sorl-thumbnail||thumbnails||223085752ade07b3fe78030d805eb5e8','[\"d44cde4d39420ae547050f3b5d246737\", \"5023c0abe02a1c84ce4abade80632e87\", \"ac15be4847ce189019d3564bf3b153bf\"]'),('sorl-thumbnail||thumbnails||2651ba9d35252c6f08b85056723dd295','[\"a1f98def0239a4080f760cee5b766c61\"]'),('sorl-thumbnail||thumbnails||274e3be08d1ba3a1b9869f1af85e2653','[\"5c202b26ec4b04a8b113b3929e55f7d8\"]'),('sorl-thumbnail||thumbnails||28912d28e6a373a0075b4b3ca786b42b','[\"b886a947507e2fd39462a341f8bfec25\", \"8b67d168129711dc33052ca92e771147\", \"73dbad2369a06af2074688461e030197\"]'),('sorl-thumbnail||thumbnails||2d0bb699c4c0701a821e10275cf56c1d','[\"c704b1f1929f22e20330d19899a6cfa5\", \"c8e006bb09f99c0499e432d1cc5537d6\"]'),('sorl-thumbnail||thumbnails||2d294a91b1c90281adef71be87208cbe','[\"13f16cf8713d0e0a295b0fef968ada33\", \"560bb3fac5a53f279ae2c7b170f14d1a\"]'),('sorl-thumbnail||thumbnails||31554ca60872d2761867dcd2b5795fee','[\"49d84afd85c5d6d6167d9d02ee3396b3\", \"679a7d06c579ba716e93100a01566513\", \"3e449189c2e7f03b128d0a16ebf6e0e6\"]'),('sorl-thumbnail||thumbnails||32458b6721df50f7f44565f924c9e666','[\"2c442e4af6b8e0308b2416355e290511\", \"927ce5d39f8656475dfb136dd2b935d6\"]'),('sorl-thumbnail||thumbnails||330128c06a5c615d7d01559c6b999a59','[\"9f1040d485a7e7b191091a45a7e7a013\", \"1ec5421b2e474c9a4eb70ffb3639342f\"]'),('sorl-thumbnail||thumbnails||3d0cc72d9573a5737ea013b1eb60d987','[\"dc567231615103667a0e2fd03837d82a\", \"4e78a2d0168c8bb9c01d1ff062eaec6c\", \"ed9c8581570fc9dd8748d1cea3e49e2b\", \"ec7099b340cc401312ef26aa322cb1e9\"]'),('sorl-thumbnail||thumbnails||3f735d413aa246153c38a71e5a5e14f1','[\"0d0eafbdc960a5e8c4ee664e16302e3a\"]'),('sorl-thumbnail||thumbnails||484daf81609e43fab1ef640adcef0bf4','[\"9a7ee2ed710af9d339e42775c0988671\", \"adf71f8dfce5354b5d24cf06b89ff2ec\", \"bd72901ade11615aa6282801c30496e1\"]'),('sorl-thumbnail||thumbnails||4a1af358d07fa4e24c584a339e1071df','[\"eb1968edee45e7e78f5f15dc42725b2c\", \"07a70316c253f12eaa65b4ace300ae9b\"]'),('sorl-thumbnail||thumbnails||51bbd0d9a7cb093672db12f2da811130','[\"aae7f2f6d7a63c919ec0bd08d1c5bb5e\", \"bcb4f27326633e108ff27173f14c79e4\"]'),('sorl-thumbnail||thumbnails||539d5721eb2484779ece10d56bc74996','[\"819a7175caa26abd5f21035d271c9ecd\", \"4f3d6836b1ae99f89838b0cf346ada1c\", \"878a431cbd94b9b52f1828d4937d982a\"]'),('sorl-thumbnail||thumbnails||589dd612067a87d7654ef801aceda6db','[\"b9be06bcad7099322149ebf9ae6d5a02\", \"dcdce01f51e1c29907b564f7e5d6ee5f\", \"e517516c63fdf96396c04cdd6a2cc377\", \"6270615287360f4871dd3b538f01e6e6\", \"7af3958d2a63679a26d6e53d2357cb0c\"]'),('sorl-thumbnail||thumbnails||60e6ab47423f3730d744af6798e52c77','[\"fe0e7a31eac9c69df80ab81ddd8165e0\"]'),('sorl-thumbnail||thumbnails||6151c338618bec0530c1e585a45d55d0','[\"0138844efd954c0373debac73c421623\"]'),('sorl-thumbnail||thumbnails||662a0616ceab8a57a8522fbef6108c50','[\"020a4047781a55d3b6061cabfdaa8511\", \"bf2e04a6aee6db0789feb54e9903782b\", \"95b017f3e5f7cc10d17d184b31d93ae7\"]'),('sorl-thumbnail||thumbnails||6fefe147e86b1384cd48eede5534649e','[\"cf70042e5aa435b95958750e7708ae57\"]'),('sorl-thumbnail||thumbnails||712b867da3edac68d79ca9aded209450','[\"4136826710b3bcc8341fe168246128a0\"]'),('sorl-thumbnail||thumbnails||79c49055c9389aef361dbb2ce12b38dd','[\"90d29b29d081836434cd2ef1fd51e3bf\", \"87cce040ae41628d0de3ac2352f6731c\"]'),('sorl-thumbnail||thumbnails||89721195a557289cfbd29dcd8a86c73c','[\"f17d8e9e99becdfa653143bdad9a9254\", \"183bce33505e1aa9f3dbce8474c71192\", \"4e2c041fe2b1fd9c94108d9612d3ac27\", \"c9f45a1f9ce02bde75383d76db6b81a1\", \"be076192629b350fe88009f5de7b70c8\"]'),('sorl-thumbnail||thumbnails||8b1b257959e3e26bd53795bc2716f213','[\"bbf7068b9810dbee4df12e7f3495bfa7\", \"ea8aa66cdb055d1d9fd225955fe96181\"]'),('sorl-thumbnail||thumbnails||8dd81d33bdcb4a2d0c7d5ee154fbe34b','[\"5d6ece7490e182ff86bba05b1ee0f0d4\", \"54e37329c0c0c284c9f02589e5bfb067\", \"7d2585dadff8fb6de962831a30e1cac8\", \"52fab9a1eae588e81e6b031e225b1cee\"]'),('sorl-thumbnail||thumbnails||8ff8042abf1fe95352ca3fd02151e4d6','[\"114d029e3027ee1ee47a0a28ef6db7d7\", \"74172e62c1f9f0800ef4d7596ff33234\", \"75a0e4bcf1cca646c5fdcc9fdf18088a\", \"92368d6de47a65dd1dd512d1f2b1c2a0\", \"dcb4dfeb1ceef385ab0c18c7cb5c2162\"]'),('sorl-thumbnail||thumbnails||94fc475a90c84581b000bcac2901af79','[\"9ac53b9cbf1a128049ca9ef7bb03be9f\", \"1860dc116aca303797f64368f422c4c0\", \"8a485c1797aa1a23636eb50de72e2d18\", \"a4cd960592b41862ef6b5359cefb891f\", \"1f9eb588a3a19616498e146d20518fad\"]'),('sorl-thumbnail||thumbnails||987aec21ff8e0b9a2768a223ba680995','[\"cfca551002d52705e41c78affa939ac0\", \"019af9e2a83f24e5e6a84f5ce1db571e\"]'),('sorl-thumbnail||thumbnails||9b5859bdb7fb6d4918c848fe6bdd1721','[\"8741af30fe9952238766099686ff3ba9\"]'),('sorl-thumbnail||thumbnails||a38d18b44df062accb3af7376cb92b14','[\"1e86ccc356d5d02e42871fae1d5ea973\", \"91c71bcc073eed41e185a09a1a70fb28\", \"82cffa2ce5a52a59722aa54b1bd27206\", \"23ae6741e2282c7546e62cf7352abdba\"]'),('sorl-thumbnail||thumbnails||a63ba6c23d1614da096849fcee9965d0','[\"a5bc1426ddfb5b02d60d8fa08857cafd\", \"081e7b7e006fb2af0d6902163d7e83dc\"]'),('sorl-thumbnail||thumbnails||b4057cace51533e052e9a849529fd1a3','[\"77928133917db750ae753b2eb376d6e6\", \"fa7a727bad9686ba416c4a469cbaeac8\"]'),('sorl-thumbnail||thumbnails||b44878c917fac75e29475fa5b5d3fce0','[\"9484439855de6605820216b74b9bb5bf\"]'),('sorl-thumbnail||thumbnails||b5f5f2a8014a24a9fa24c7d015b1d5dc','[\"4eefb182f99984bef16bea8228824c3b\", \"f21055ff6a33089f757d14ae48a8bac2\"]'),('sorl-thumbnail||thumbnails||b95c10467e14b64e4664df5fb5bac113','[\"50a0dc22e5a8c1d970fb6fe5e8e60885\", \"ea433a418618c5aee88bf32c50493fbb\", \"52cfb83637382db85e284f1eeac9472b\", \"929a14a5b8a23fd5afb1da8910d1e1b1\", \"f97ccc8dfbde781465978365403898e5\"]'),('sorl-thumbnail||thumbnails||bcf53276b099ba9aff8506c94ac7f252','[\"3ee896bfa3a7d9b674a45093a346aeea\", \"84db2fc9b221e141e8b838cea15b6716\"]'),('sorl-thumbnail||thumbnails||c3574c24281dd92f32ddc67ed3120259','[\"49bcfb18293854e5df08c49747b0c9b7\", \"f1728b17f838d5e0a8fbd1c3ecba47c4\", \"af5060cc752dcae34aee68efc43ab187\"]'),('sorl-thumbnail||thumbnails||c35981caf0e3e8955e1531ef69206ec3','[\"91675f2c8d0746d344b1a3f482c86c3c\", \"20eecd91aa50948f2f73cd91d726f569\", \"fd524280212a96fbe83504cb44986bf5\"]'),('sorl-thumbnail||thumbnails||c8fc8d0163e3018228a54f4354c0afee','[\"2db43412fde7db1ad53cb1f5946fbc81\", \"3aa86f8e539dcda384bd0f45bb256a4a\"]'),('sorl-thumbnail||thumbnails||c906ce6ee2f66887f9ec4ee6fccff359','[\"a32f46562609e696ca994f0f77d4189c\", \"43f0d3a48caed2465b03864d670f6491\"]'),('sorl-thumbnail||thumbnails||c9c4ebbc9cb1dc487e8e97247db231cf','[\"27a15f2bed27a3c0014198ef6aa2f358\", \"cfcc01cac4fbb8827b648851c2aef376\"]'),('sorl-thumbnail||thumbnails||cf6ca25f828570daa7ebcfc24551150e','[\"4a30ddba21995692d724df3045d8562b\", \"a3624a7b15efb0760d0e52ffd0cc482d\"]'),('sorl-thumbnail||thumbnails||d2b7dea9fbb55cfe3c127477e9d598a8','[\"d6b2abf17177d41788b9f454cd148eb2\"]'),('sorl-thumbnail||thumbnails||d3bba575cded49a223d4fc0bef3cf191','[\"1b75c6cf45ecebbe47b6f7bfe53b5c21\", \"d15cf12ac8c6a49d4fb830b552714125\"]'),('sorl-thumbnail||thumbnails||d941d279b4fba6e83efe60b2c62422c0','[\"dbd3bd2bdfed06b736eae7e8090b9bf6\", \"ccea10ac61a4ed4cbbf2bbd61bf91b2f\"]'),('sorl-thumbnail||thumbnails||fa9f73c77de075cca3c38f6525c83d32','[\"23ec583518672c5b6153820842484876\"]'),('sorl-thumbnail||thumbnails||fee90beaa4dac33b5442729a7d462aa0','[\"edf876c3ab4ef624124fb5410a449096\"]'),('sorl-thumbnail||thumbnails||ff7c4fc67c1704588b7a71a5d8338e93','[\"ba3e7fc93af99f99b225c635e149e558\", \"7631696eac424b2aaad4320cc0cc2841\", \"7e0a45f7c04cbc0751b1c3cbd7e43e17\"]');
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-23 11:25:38
