# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.42)
# Database: report
# Generation Time: 2018-08-04 07:44:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `created_at`, `updated_at`)
VALUES
	(1,0,1,'主目录','fa-bar-chart','/',NULL,'2018-08-03 09:50:00'),
	(2,0,2,'用户管理','fa-tasks',NULL,NULL,'2018-08-03 09:50:57'),
	(3,2,3,'用户列表','fa-users','auth/users',NULL,'2018-08-03 09:51:49'),
	(4,2,4,'角色','fa-user','auth/roles',NULL,'2018-08-03 10:04:38'),
	(5,2,5,'权限','fa-ban','auth/permissions',NULL,'2018-08-03 14:00:30'),
	(6,2,6,'节点菜单','fa-bars','auth/menu',NULL,'2018-08-04 00:44:54'),
	(7,2,7,'操作日志','fa-history','auth/logs',NULL,'2018-08-04 00:45:10');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin','GET','::1','[]','2018-08-03 09:21:39','2018-08-03 09:21:39'),
	(2,1,'admin','GET','::1','{\"_pjax\":\"%23pjax-container\"}','2018-08-03 09:21:43','2018-08-03 09:21:43'),
	(3,1,'admin','GET','::1','[]','2018-08-03 09:21:43','2018-08-03 09:21:43'),
	(4,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:21:46','2018-08-03 09:21:46'),
	(5,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:21:46','2018-08-03 09:21:46'),
	(6,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:26:38','2018-08-03 09:26:38'),
	(7,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:26:39','2018-08-03 09:26:39'),
	(8,1,'admin','GET','::1','{\"_pjax\":\"%23pjax-container\"}','2018-08-03 09:26:50','2018-08-03 09:26:50'),
	(9,1,'admin','GET','::1','[]','2018-08-03 09:26:50','2018-08-03 09:26:50'),
	(10,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:26:58','2018-08-03 09:26:58'),
	(11,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:26:59','2018-08-03 09:26:59'),
	(12,1,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:27:01','2018-08-03 09:27:01'),
	(13,1,'admin/auth/roles','GET','::1','[]','2018-08-03 09:27:01','2018-08-03 09:27:01'),
	(14,1,'admin/auth/roles','GET','::1','[]','2018-08-03 09:28:38','2018-08-03 09:28:38'),
	(15,1,'admin/auth/roles','GET','::1','[]','2018-08-03 09:29:20','2018-08-03 09:29:20'),
	(16,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:29:31','2018-08-03 09:29:31'),
	(17,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:29:31','2018-08-03 09:29:31'),
	(18,1,'admin/auth/users/create','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:29:37','2018-08-03 09:29:37'),
	(19,1,'admin/auth/users/create','GET','::1','[]','2018-08-03 09:29:37','2018-08-03 09:29:37'),
	(20,1,'admin/auth/users/create','GET','::1','[]','2018-08-03 09:33:05','2018-08-03 09:33:05'),
	(21,1,'admin/auth/users/create','GET','::1','[]','2018-08-03 09:33:07','2018-08-03 09:33:07'),
	(22,1,'admin','GET','::1','{\"_pjax\":\"%23pjax-container\"}','2018-08-03 09:33:10','2018-08-03 09:33:10'),
	(23,1,'admin','GET','::1','[]','2018-08-03 09:33:11','2018-08-03 09:33:11'),
	(24,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:33:13','2018-08-03 09:33:13'),
	(25,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:33:13','2018-08-03 09:33:13'),
	(26,1,'admin/auth/users/create','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:33:16','2018-08-03 09:33:16'),
	(27,1,'admin/auth/users/create','GET','::1','[]','2018-08-03 09:33:16','2018-08-03 09:33:16'),
	(28,1,'admin/auth/users','POST','::1','{\"username\":\"\\u5f20\\u5efa\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"zj951221\",\"password_confirmation\":\"zj951221\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-03 09:34:08','2018-08-03 09:34:08'),
	(29,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:34:09','2018-08-03 09:34:09'),
	(30,1,'admin/auth/users','POST','::1','{\"username\":\"\\u5f20\\u5efa\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"zj951221\",\"password_confirmation\":\"zj951221\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-03 09:34:16','2018-08-03 09:34:16'),
	(31,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:34:17','2018-08-03 09:34:17'),
	(32,1,'admin/auth/users','POST','::1','{\"username\":\"\\u5f20\\u5efa\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"zj951221\",\"password_confirmation\":\"zj951221\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-03 09:34:37','2018-08-03 09:34:37'),
	(33,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:34:37','2018-08-03 09:34:37'),
	(34,1,'admin/auth/users','POST','::1','{\"username\":\"\\u5f20\\u5efa\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"zj951221\",\"password_confirmation\":\"zj951221\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-03 09:35:35','2018-08-03 09:35:35'),
	(35,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:35:36','2018-08-03 09:35:36'),
	(36,1,'admin/auth/users','POST','::1','{\"username\":\"\\u5f20\\u5efa\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"zj951221\",\"password_confirmation\":\"zj951221\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-03 09:36:49','2018-08-03 09:36:49'),
	(37,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:36:50','2018-08-03 09:36:50'),
	(38,1,'admin/auth/users','GET','::1','[]','2018-08-03 09:37:06','2018-08-03 09:37:06'),
	(39,1,'admin/auth/users/create','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:37:16','2018-08-03 09:37:16'),
	(40,1,'admin/auth/users/create','GET','::1','[]','2018-08-03 09:37:16','2018-08-03 09:37:16'),
	(41,1,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:37:24','2018-08-03 09:37:24'),
	(42,1,'admin/auth/roles','GET','::1','[]','2018-08-03 09:37:24','2018-08-03 09:37:24'),
	(43,1,'admin/auth/roles/1/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:37:31','2018-08-03 09:37:31'),
	(44,1,'admin/auth/roles/1/edit','GET','::1','[]','2018-08-03 09:37:31','2018-08-03 09:37:31'),
	(45,1,'admin/auth/menu','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:37:51','2018-08-03 09:37:51'),
	(46,1,'admin/auth/menu','GET','::1','[]','2018-08-03 09:37:51','2018-08-03 09:37:51'),
	(47,1,'admin/auth/menu/1/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:38:28','2018-08-03 09:38:28'),
	(48,1,'admin/auth/menu/1/edit','GET','::1','[]','2018-08-03 09:38:28','2018-08-03 09:38:28'),
	(49,1,'admin','GET','::1','{\"_pjax\":\"%23pjax-container\"}','2018-08-03 09:38:42','2018-08-03 09:38:42'),
	(50,1,'admin','GET','::1','[]','2018-08-03 09:38:42','2018-08-03 09:38:42'),
	(51,1,'admin/auth/menu','GET','::1','[]','2018-08-03 09:47:53','2018-08-03 09:47:53'),
	(52,1,'admin/auth/menu/1/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:48:56','2018-08-03 09:48:56'),
	(53,1,'admin/auth/menu/1/edit','GET','::1','[]','2018-08-03 09:48:56','2018-08-03 09:48:56'),
	(54,1,'admin/auth/menu/1','PUT','::1','{\"parent_id\":\"0\",\"title\":\"\\u4e3b\\u76ee\\u5f55\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 09:50:00','2018-08-03 09:50:00'),
	(55,1,'admin/auth/menu','GET','::1','[]','2018-08-03 09:50:00','2018-08-03 09:50:00'),
	(56,1,'admin/auth/menu','GET','::1','[]','2018-08-03 09:50:33','2018-08-03 09:50:33'),
	(57,1,'admin/auth/menu/2/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:50:44','2018-08-03 09:50:44'),
	(58,1,'admin/auth/menu/2/edit','GET','::1','[]','2018-08-03 09:50:44','2018-08-03 09:50:44'),
	(59,1,'admin/auth/menu/2','PUT','::1','{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 09:50:57','2018-08-03 09:50:57'),
	(60,1,'admin/auth/menu','GET','::1','[]','2018-08-03 09:50:57','2018-08-03 09:50:57'),
	(61,1,'admin/auth/menu','GET','::1','[]','2018-08-03 09:51:26','2018-08-03 09:51:26'),
	(62,1,'admin/auth/menu/3/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 09:51:32','2018-08-03 09:51:32'),
	(63,1,'admin/auth/menu/3/edit','GET','::1','[]','2018-08-03 09:51:33','2018-08-03 09:51:33'),
	(64,1,'admin/auth/menu/3','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 09:51:49','2018-08-03 09:51:49'),
	(65,1,'admin/auth/menu','GET','::1','[]','2018-08-03 09:51:49','2018-08-03 09:51:49'),
	(66,1,'admin/auth/menu/3','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 10:02:09','2018-08-03 10:02:09'),
	(67,1,'admin/auth/menu','GET','::1','[]','2018-08-03 10:02:09','2018-08-03 10:02:09'),
	(68,1,'admin/auth/menu/3','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 10:02:29','2018-08-03 10:02:29'),
	(69,1,'admin/auth/menu','GET','::1','[]','2018-08-03 10:02:29','2018-08-03 10:02:29'),
	(70,1,'admin/auth/menu/3','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[\"1\",null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 10:03:14','2018-08-03 10:03:14'),
	(71,1,'admin/auth/menu','GET','::1','[]','2018-08-03 10:03:14','2018-08-03 10:03:14'),
	(72,1,'admin/auth/menu/3','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\\u5217\\u8868\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[\"1\",null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 10:03:28','2018-08-03 10:03:28'),
	(73,1,'admin/auth/menu','GET','::1','[]','2018-08-03 10:03:28','2018-08-03 10:03:28'),
	(74,1,'admin/auth/menu/3','GET','::1','[]','2018-08-03 10:03:32','2018-08-03 10:03:32'),
	(75,1,'admin/auth/menu/3/edit','GET','::1','[]','2018-08-03 10:03:33','2018-08-03 10:03:33'),
	(76,1,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 10:03:39','2018-08-03 10:03:39'),
	(77,1,'admin/auth/roles','GET','::1','[]','2018-08-03 10:03:39','2018-08-03 10:03:39'),
	(78,1,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 10:03:56','2018-08-03 10:03:56'),
	(79,1,'admin/auth/roles','GET','::1','[]','2018-08-03 10:03:56','2018-08-03 10:03:56'),
	(80,1,'admin/auth/roles','GET','::1','{\"per_page\":\"10\",\"_pjax\":\"#pjax-container\"}','2018-08-03 10:04:06','2018-08-03 10:04:06'),
	(81,1,'admin/auth/roles','GET','::1','{\"per_page\":\"10\"}','2018-08-03 10:04:06','2018-08-03 10:04:06'),
	(82,1,'admin/auth/roles','GET','::1','{\"per_page\":\"20\",\"_pjax\":\"#pjax-container\"}','2018-08-03 10:04:08','2018-08-03 10:04:08'),
	(83,1,'admin/auth/roles','GET','::1','{\"per_page\":\"20\"}','2018-08-03 10:04:08','2018-08-03 10:04:08'),
	(84,1,'admin/auth/menu','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 10:04:18','2018-08-03 10:04:18'),
	(85,1,'admin/auth/menu','GET','::1','[]','2018-08-03 10:04:19','2018-08-03 10:04:19'),
	(86,1,'admin/auth/menu/4/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 10:04:26','2018-08-03 10:04:26'),
	(87,1,'admin/auth/menu/4/edit','GET','::1','[]','2018-08-03 10:04:26','2018-08-03 10:04:26'),
	(88,1,'admin/auth/menu/4','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 10:04:38','2018-08-03 10:04:38'),
	(89,1,'admin/auth/menu','GET','::1','[]','2018-08-03 10:04:38','2018-08-03 10:04:38'),
	(90,1,'admin/auth/menu/4','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"_token\":\"idy5c4zHtiLkxZPXdJ2f1XpSDVcCFjOBkyAytHOb\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 10:11:53','2018-08-03 10:11:53'),
	(91,1,'admin/auth/menu','GET','::1','[]','2018-08-03 10:11:53','2018-08-03 10:11:53'),
	(92,1,'admin/auth/menu','GET','::1','[]','2018-08-03 14:00:06','2018-08-03 14:00:06'),
	(93,1,'admin/auth/menu/5/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-03 14:00:15','2018-08-03 14:00:15'),
	(94,1,'admin/auth/menu/5/edit','GET','::1','[]','2018-08-03 14:00:15','2018-08-03 14:00:15'),
	(95,1,'admin/auth/menu/5','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"_token\":\"2ZXNDlEJkzbbokB9WY7TFXfpp59a2VCuK732qeXT\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-03 14:00:30','2018-08-03 14:00:30'),
	(96,1,'admin/auth/menu','GET','::1','[]','2018-08-03 14:00:30','2018-08-03 14:00:30'),
	(97,1,'admin','GET','::1','[]','2018-08-04 00:37:37','2018-08-04 00:37:37'),
	(98,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:37:41','2018-08-04 00:37:41'),
	(99,1,'admin/auth/users','GET','::1','[]','2018-08-04 00:37:41','2018-08-04 00:37:41'),
	(100,1,'admin/auth/users/2/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:37:45','2018-08-04 00:37:45'),
	(101,1,'admin/auth/users/2/edit','GET','::1','[]','2018-08-04 00:37:45','2018-08-04 00:37:45'),
	(102,1,'admin/auth/users/2','PUT','::1','{\"username\":\"\\u5f20\\u5efa\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"123456\",\"password_confirmation\":\"345621\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"cxbaBSIJB7BtOO899XGyABB5aJA6AGxe6WMrtzgO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-04 00:38:05','2018-08-04 00:38:05'),
	(103,1,'admin/auth/users/2/edit','GET','::1','[]','2018-08-04 00:38:05','2018-08-04 00:38:05'),
	(104,1,'admin/auth/users/2','PUT','::1','{\"username\":\"zhangjian\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"123456\",\"password_confirmation\":\"345621\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"cxbaBSIJB7BtOO899XGyABB5aJA6AGxe6WMrtzgO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-04 00:38:22','2018-08-04 00:38:22'),
	(105,1,'admin/auth/users/2','GET','::1','[]','2018-08-04 00:38:22','2018-08-04 00:38:22'),
	(106,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:38:30','2018-08-04 00:38:30'),
	(107,1,'admin/auth/users','GET','::1','[]','2018-08-04 00:38:30','2018-08-04 00:38:30'),
	(108,1,'admin/auth/users','GET','::1','[]','2018-08-04 00:38:34','2018-08-04 00:38:34'),
	(109,1,'admin/auth/users/2/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:38:46','2018-08-04 00:38:46'),
	(110,1,'admin/auth/users/2/edit','GET','::1','[]','2018-08-04 00:38:47','2018-08-04 00:38:47'),
	(111,1,'admin/auth/users/2','PUT','::1','{\"username\":\"\\u5f20\\u5efa1\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"$2y$10$DuDts6pEEzhJwnJ8fGWCRuUZwtSwKPoBzbF4npeRnQHjKvirj6B7e\",\"password_confirmation\":\"$2y$10$DuDts6pEEzhJwnJ8fGWCRuUZwtSwKPoBzbF4npeRnQHjKvirj6B7e\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"cxbaBSIJB7BtOO899XGyABB5aJA6AGxe6WMrtzgO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-04 00:38:57','2018-08-04 00:38:57'),
	(112,1,'admin/auth/users','GET','::1','[]','2018-08-04 00:38:57','2018-08-04 00:38:57'),
	(113,1,'admin/auth/users/2','PUT','::1','{\"username\":\"\\u5f20\\u5efa1\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"$2y$10$DuDts6pEEzhJwnJ8fGWCRuUZwtSwKPoBzbF4npeRnQHjKvirj6B7e\",\"password_confirmation\":\"$2y$10$DuDts6pEEzhJwnJ8fGWCRuUZwtSwKPoBzbF4npeRnQHjKvirj6B7e\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"cxbaBSIJB7BtOO899XGyABB5aJA6AGxe6WMrtzgO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-04 00:42:34','2018-08-04 00:42:34'),
	(114,1,'admin/auth/users','GET','::1','[]','2018-08-04 00:42:34','2018-08-04 00:42:34'),
	(115,1,'admin/auth/users/2/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:42:42','2018-08-04 00:42:42'),
	(116,1,'admin/auth/users/2','PUT','::1','{\"username\":\"zhangjian\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"234561\",\"password_confirmation\":\"123456\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"cxbaBSIJB7BtOO899XGyABB5aJA6AGxe6WMrtzgO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-04 00:43:13','2018-08-04 00:43:13'),
	(117,1,'admin/auth/users/2/edit','GET','::1','[]','2018-08-04 00:43:13','2018-08-04 00:43:13'),
	(118,1,'admin/auth/users/2','PUT','::1','{\"username\":\"zhangjian\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[\"1\",null],\"permissions\":[\"1\",null],\"_token\":\"cxbaBSIJB7BtOO899XGyABB5aJA6AGxe6WMrtzgO\",\"_method\":\"PUT\"}','2018-08-04 00:43:43','2018-08-04 00:43:43'),
	(119,1,'admin/auth/users','GET','::1','[]','2018-08-04 00:43:43','2018-08-04 00:43:43'),
	(120,1,'admin/auth/logout','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:43:51','2018-08-04 00:43:51'),
	(121,2,'admin','GET','::1','[]','2018-08-04 00:43:59','2018-08-04 00:43:59'),
	(122,2,'admin/auth/menu','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:44:11','2018-08-04 00:44:11'),
	(123,2,'admin/auth/menu','POST','::1','{\"parent_id\":\"0\",\"title\":\"\\u8282\\u70b9\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"_token\":\"LydbgT2HsKTPEGBRMIx1YRtgK5KD6nMp7wAcPMRJ\"}','2018-08-04 00:44:29','2018-08-04 00:44:29'),
	(124,2,'admin/auth/menu','GET','::1','[]','2018-08-04 00:44:29','2018-08-04 00:44:29'),
	(125,2,'admin/auth/menu/8','DELETE','::1','{\"_method\":\"delete\",\"_token\":\"LydbgT2HsKTPEGBRMIx1YRtgK5KD6nMp7wAcPMRJ\"}','2018-08-04 00:44:34','2018-08-04 00:44:34'),
	(126,2,'admin/auth/menu','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:44:34','2018-08-04 00:44:34'),
	(127,2,'admin/auth/menu/6/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:44:40','2018-08-04 00:44:40'),
	(128,2,'admin/auth/menu/6','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u8282\\u70b9\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"_token\":\"LydbgT2HsKTPEGBRMIx1YRtgK5KD6nMp7wAcPMRJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-04 00:44:54','2018-08-04 00:44:54'),
	(129,2,'admin/auth/menu','GET','::1','[]','2018-08-04 00:44:54','2018-08-04 00:44:54'),
	(130,2,'admin/auth/menu/7/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:45:01','2018-08-04 00:45:01'),
	(131,2,'admin/auth/menu/7','PUT','::1','{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"_token\":\"LydbgT2HsKTPEGBRMIx1YRtgK5KD6nMp7wAcPMRJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/menu\"}','2018-08-04 00:45:10','2018-08-04 00:45:10'),
	(132,2,'admin/auth/menu','GET','::1','[]','2018-08-04 00:45:10','2018-08-04 00:45:10'),
	(134,2,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:46:26','2018-08-04 00:46:26'),
	(135,2,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\",\"id\":\"100\"}','2018-08-04 00:46:34','2018-08-04 00:46:34'),
	(136,2,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:46:38','2018-08-04 00:46:38'),
	(137,2,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:46:45','2018-08-04 00:46:45'),
	(138,2,'admin','GET','::1','{\"_pjax\":\"%23pjax-container\"}','2018-08-04 00:46:49','2018-08-04 00:46:49'),
	(139,2,'admin/auth/menu','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:46:55','2018-08-04 00:46:55'),
	(140,2,'admin/auth/permissions','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:46:56','2018-08-04 00:46:56'),
	(141,2,'admin/auth/permissions','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:47:03','2018-08-04 00:47:03'),
	(142,2,'admin/auth/permissions','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:47:12','2018-08-04 00:47:12'),
	(143,2,'admin/auth/setting','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:47:26','2018-08-04 00:47:26'),
	(144,2,'admin/auth/permissions','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:47:33','2018-08-04 00:47:33'),
	(145,2,'admin/auth/permissions/5/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:47:45','2018-08-04 00:47:45'),
	(146,2,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:47:56','2018-08-04 00:47:56'),
	(147,2,'admin/auth/roles/create','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:48:05','2018-08-04 00:48:05'),
	(148,2,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:49:00','2018-08-04 00:49:00'),
	(149,2,'admin/auth/roles/create','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:49:03','2018-08-04 00:49:03'),
	(150,2,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:49:08','2018-08-04 00:49:08'),
	(151,2,'admin/auth/roles/1/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:49:11','2018-08-04 00:49:11'),
	(152,2,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:49:17','2018-08-04 00:49:17'),
	(153,2,'admin/auth/roles/create','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:49:23','2018-08-04 00:49:23'),
	(154,2,'admin/auth/roles','POST','::1','{\"slug\":\"\\u8d22\\u52a1\",\"name\":\"\\u8d22\\u52a1\",\"permissions\":[\"1\",\"2\",\"5\",null],\"_token\":\"LydbgT2HsKTPEGBRMIx1YRtgK5KD6nMp7wAcPMRJ\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/roles\"}','2018-08-04 00:50:32','2018-08-04 00:50:32'),
	(155,2,'admin/auth/roles','GET','::1','[]','2018-08-04 00:50:32','2018-08-04 00:50:32'),
	(156,2,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:50:39','2018-08-04 00:50:39'),
	(157,2,'admin/auth/permissions','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:50:42','2018-08-04 00:50:42'),
	(158,2,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:50:46','2018-08-04 00:50:46'),
	(159,2,'admin/auth/users/2/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:50:52','2018-08-04 00:50:52'),
	(160,2,'admin/auth/users/2','PUT','::1','{\"username\":\"zhangjian\",\"name\":\"\\u8d22\\u52a1\",\"password\":\"$2y$10$yj4obfT0PpfXyyhQ7oBQGukWsRb50\\/FTlECBOM2Rbn4oqca5oGbVC\",\"password_confirmation\":\"$2y$10$yj4obfT0PpfXyyhQ7oBQGukWsRb50\\/FTlECBOM2Rbn4oqca5oGbVC\",\"roles\":[\"2\",null],\"permissions\":[\"3\",\"4\",null],\"_token\":\"LydbgT2HsKTPEGBRMIx1YRtgK5KD6nMp7wAcPMRJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/users\"}','2018-08-04 00:51:19','2018-08-04 00:51:19'),
	(161,2,'admin/auth/users','GET','::1','[]','2018-08-04 00:51:19','2018-08-04 00:51:19'),
	(162,2,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:51:26','2018-08-04 00:51:26'),
	(163,2,'admin/auth/roles/2/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:51:30','2018-08-04 00:51:30'),
	(164,2,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:52:02','2018-08-04 00:52:02'),
	(165,2,'admin/auth/roles/2/edit','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:52:06','2018-08-04 00:52:06'),
	(166,2,'admin/auth/roles/2','PUT','::1','{\"slug\":\"\\u8d22\\u52a1\",\"name\":\"\\u8d22\\u52a1\",\"permissions\":[\"2\",\"3\",null],\"_token\":\"LydbgT2HsKTPEGBRMIx1YRtgK5KD6nMp7wAcPMRJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.blt.com:81\\/admin\\/auth\\/roles\"}','2018-08-04 00:52:19','2018-08-04 00:52:19'),
	(167,2,'admin/auth/roles','GET','::1','[]','2018-08-04 00:52:19','2018-08-04 00:52:19'),
	(168,2,'admin/auth/roles','GET','::1','[]','2018-08-04 00:52:29','2018-08-04 00:52:29'),
	(169,2,'admin','GET','::1','{\"_pjax\":\"%23pjax-container\"}','2018-08-04 00:52:32','2018-08-04 00:52:32'),
	(170,2,'admin','GET','::1','{\"_pjax\":\"%23pjax-container\"}','2018-08-04 00:52:34','2018-08-04 00:52:34'),
	(171,2,'admin/auth/logout','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 00:52:45','2018-08-04 00:52:45'),
	(172,1,'admin','GET','::1','[]','2018-08-04 00:52:53','2018-08-04 00:52:53'),
	(173,1,'admin','GET','::1','{\"_pjax\":\"%23pjax-container\"}','2018-08-04 00:52:58','2018-08-04 00:52:58'),
	(174,1,'admin','GET','::1','[]','2018-08-04 04:15:33','2018-08-04 04:15:33'),
	(175,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 04:15:37','2018-08-04 04:15:37'),
	(176,1,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 04:15:41','2018-08-04 04:15:41'),
	(177,1,'admin/auth/permissions','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 04:15:43','2018-08-04 04:15:43'),
	(178,1,'admin/auth/menu','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 04:15:53','2018-08-04 04:15:53'),
	(179,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 04:16:08','2018-08-04 04:16:08'),
	(180,1,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 04:16:15','2018-08-04 04:16:15'),
	(181,1,'admin/auth/permissions','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 04:16:16','2018-08-04 04:16:16'),
	(182,1,'admin/auth/menu','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 04:16:33','2018-08-04 04:16:33'),
	(183,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 05:04:02','2018-08-04 05:04:02'),
	(184,1,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 05:04:03','2018-08-04 05:04:03'),
	(185,1,'admin/auth/permissions','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 05:04:04','2018-08-04 05:04:04'),
	(186,1,'admin/auth/roles','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 05:19:29','2018-08-04 05:19:29'),
	(187,1,'admin/auth/users','GET','::1','{\"_pjax\":\"#pjax-container\"}','2018-08-04 05:19:31','2018-08-04 05:19:31'),
	(188,1,'admin/auth/users','GET','::1','[]','2018-08-04 07:41:50','2018-08-04 07:41:50');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES
	(1,'All permission','*','','*',NULL,NULL),
	(2,'Dashboard','dashboard','GET','/',NULL,NULL),
	(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),
	(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),
	(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL);

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL),
	(1,3,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,2,NULL,NULL),
	(2,3,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,2,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','administrator','2018-08-03 09:21:19','2018-08-03 09:21:19'),
	(2,'财务','财务','2018-08-04 00:50:32','2018-08-04 00:50:32');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;

INSERT INTO `admin_user_permissions` (`user_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(2,3,NULL,NULL),
	(2,4,NULL,NULL);

/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$bPnGOZ6Jbq2vC/4dO33F2eyTolvE9QUaFWtAmJHRZbm1iemUbHRXm','Administrator',NULL,'y8l6tft2dkfWCZcYHN2UDgOOhDMNXlAMf3Uhv6kCBbhTinbVpWmt2OdUGx4q','2018-08-03 09:21:19','2018-08-03 09:21:19'),
	(2,'zhangjian','$2y$10$yj4obfT0PpfXyyhQ7oBQGukWsRb50/FTlECBOM2Rbn4oqca5oGbVC','财务',NULL,'A7xKMs89xYSLmy9ajISiZcpApJ9nFNitrUIpi6Lzwd9MsxkBGfQs38p00td3','2018-08-03 09:34:09','2018-08-04 00:43:43');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_04_173148_create_admin_tables',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
