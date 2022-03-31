/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : caisse_db

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2022-03-31 19:14:27
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_12_14_000001_create_personal_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('5', '2022_03_29_092553_create_type_operations_table', '1');
INSERT INTO `migrations` VALUES ('6', '2022_03_29_103959_create_operations_table', '1');

-- ----------------------------
-- Table structure for `operations`
-- ----------------------------
DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeoperation_id` int(10) unsigned DEFAULT NULL,
  `datas` text COLLATE utf8mb4_unicode_ci,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ajout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retrait` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_typeoperation_id_foreign` (`typeoperation_id`),
  CONSTRAINT `operations_typeoperation_id_foreign` FOREIGN KEY (`typeoperation_id`) REFERENCES `type_operations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of operations
-- ----------------------------
INSERT INTO `operations` VALUES ('1', '1', '\"{\\\"billets\\\":{\\\"6245d29cd7988\\\":{\\\"nominal\\\":\\\"10\\\",\\\"quantity\\\":\\\"2\\\",\\\"subtotal\\\":\\\"20\\\"},\\\"6245d2b181e4d\\\":{\\\"nominal\\\":\\\"5\\\",\\\"quantity\\\":\\\"1\\\",\\\"subtotal\\\":\\\"5\\\"}},\\\"pieces\\\":{\\\"6245d29cd8315\\\":{\\\"nominal\\\":\\\"2\\\",\\\"quantity\\\":\\\"3\\\",\\\"subtotal\\\":\\\"6\\\"}},\\\"centimes\\\":{\\\"6245d29cd8c8f\\\":{\\\"nominal\\\":\\\"5\\\",\\\"quantity\\\":\\\"5\\\",\\\"subtotal\\\":\\\"0.25\\\"}}}\"', '31.25', '31.25', '0', 'test dépôt de caisse', '2022-03-29', '2022-03-31 16:11:47', '2022-03-31 16:11:47');
INSERT INTO `operations` VALUES ('2', '2', '\"{\\\"billets\\\":{\\\"6245d2c991923\\\":{\\\"nominal\\\":\\\"5\\\",\\\"quantity\\\":\\\"2\\\",\\\"subtotal\\\":\\\"10\\\"}},\\\"pieces\\\":{\\\"6245d2c991c9c\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"5\\\",\\\"subtotal\\\":\\\"5\\\"}},\\\"centimes\\\":{\\\"6245d2c991f9a\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"0\\\",\\\"subtotal\\\":\\\"0\\\"}}}\"', '15.00', '0', '15.00', 'test remise en banque', '2022-03-28', '2022-03-31 16:12:19', '2022-03-31 16:12:19');
INSERT INTO `operations` VALUES ('3', '3', '\"{\\\"billets\\\":{\\\"6245d2ed48c22\\\":{\\\"nominal\\\":\\\"5\\\",\\\"quantity\\\":\\\"3\\\",\\\"subtotal\\\":\\\"15\\\"}},\\\"pieces\\\":{\\\"6245d2ed48fbc\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"0\\\",\\\"subtotal\\\":\\\"0\\\"}},\\\"centimes\\\":{\\\"6245d2ed4931e\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"0\\\",\\\"subtotal\\\":\\\"0\\\"}}}\"', '15.00', '0', '15.00', 'test retrait', '2022-03-30', '2022-03-31 16:12:49', '2022-03-31 16:12:49');
INSERT INTO `operations` VALUES ('4', '1', '\"{\\\"billets\\\":{\\\"6245d339f2fd2\\\":{\\\"nominal\\\":\\\"50\\\",\\\"quantity\\\":\\\"1\\\",\\\"subtotal\\\":\\\"50\\\"}},\\\"pieces\\\":{\\\"6245d339f3f4f\\\":{\\\"nominal\\\":\\\"2\\\",\\\"quantity\\\":\\\"5\\\",\\\"subtotal\\\":\\\"10\\\"}},\\\"centimes\\\":{\\\"6245d33a00534\\\":{\\\"nominal\\\":\\\"5\\\",\\\"quantity\\\":\\\"4\\\",\\\"subtotal\\\":\\\"0.2\\\"}}}\"', '160.20', '160.20', '0', 'test dépôt de caisse 2', null, '2022-03-31 16:13:40', '2022-03-31 16:13:54');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `personal_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `type_operations`
-- ----------------------------
DROP TABLE IF EXISTS `type_operations`;
CREATE TABLE `type_operations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of type_operations
-- ----------------------------
INSERT INTO `type_operations` VALUES ('1', 'Dépôt de caisse', null, null);
INSERT INTO `type_operations` VALUES ('2', 'Remise en banque', null, null);
INSERT INTO `type_operations` VALUES ('3', 'Retrait', null, null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Hariony RAKOTOBE', 'user@gmail.com', null, '$2y$10$I6VWYhxloHP7agH3JZzxQ.dd9K4.hSvyCCryBJKgNCLxcOJqaLyHS', null, '2022-03-31 16:09:42', '2022-03-31 16:09:42');
