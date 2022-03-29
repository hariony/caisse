/*
Navicat MySQL Data Transfer

Source Server         : wamp
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : caisse_db

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2022-03-29 19:44:48
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
INSERT INTO `migrations` VALUES ('5', '2022_03_29_092553_create_operations_table', '1');
INSERT INTO `migrations` VALUES ('6', '2022_03_29_103959_create_type_operations_table', '1');

-- ----------------------------
-- Table structure for `operations`
-- ----------------------------
DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeoperation_id` int(11) NOT NULL,
  `datas` text COLLATE utf8mb4_unicode_ci,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ajout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retrait` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of operations
-- ----------------------------
INSERT INTO `operations` VALUES ('18', '1', '\"{\\\"billets\\\":{\\\"624316534bd38\\\":{\\\"nominal\\\":\\\"5\\\",\\\"quantity\\\":\\\"3\\\",\\\"subtotal\\\":\\\"15\\\"}},\\\"pieces\\\":{\\\"624316534c069\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"4\\\",\\\"subtotal\\\":\\\"4\\\"}},\\\"centimes\\\":{\\\"624316534c30b\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"75\\\",\\\"subtotal\\\":\\\"0.75\\\"}}}\"', '44.75', '44.75', '0', 'test dépôts', null, '2022-03-29 14:21:17', '2022-03-29 14:23:30');
INSERT INTO `operations` VALUES ('20', '2', '\"{\\\"billets\\\":{\\\"6243336091df4\\\":{\\\"nominal\\\":\\\"10\\\",\\\"quantity\\\":\\\"4\\\",\\\"subtotal\\\":\\\"40\\\"}},\\\"pieces\\\":{\\\"624333609200b\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"20\\\",\\\"subtotal\\\":\\\"20\\\"}},\\\"centimes\\\":{\\\"62433360921f2\\\":{\\\"nominal\\\":\\\"2\\\",\\\"quantity\\\":\\\"30\\\",\\\"subtotal\\\":\\\"0.6\\\"}}}\"', '60.60', '0', '60.60', 'test remise', '2022-03-29', '2022-03-29 16:27:51', '2022-03-29 16:27:51');
INSERT INTO `operations` VALUES ('21', '1', '\"{\\\"billets\\\":{\\\"6243339552833\\\":{\\\"nominal\\\":\\\"50\\\",\\\"quantity\\\":\\\"5\\\",\\\"subtotal\\\":\\\"250\\\"},\\\"624333c56fa1c\\\":{\\\"nominal\\\":\\\"5\\\",\\\"quantity\\\":\\\"3\\\",\\\"subtotal\\\":\\\"15\\\"}},\\\"pieces\\\":{\\\"6243339552a55\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"3\\\",\\\"subtotal\\\":\\\"3\\\"}},\\\"centimes\\\":{\\\"6243339552c3b\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"23\\\",\\\"subtotal\\\":\\\"0.23\\\"}}}\"', '268.23', '268.23', '0', 'test Dépôt caisse 2', '2022-03-29', '2022-03-29 16:29:02', '2022-03-29 16:29:02');
INSERT INTO `operations` VALUES ('22', '3', '\"{\\\"billets\\\":{\\\"624333da0a8a1\\\":{\\\"nominal\\\":\\\"10\\\",\\\"quantity\\\":\\\"1\\\",\\\"subtotal\\\":\\\"10\\\"}},\\\"pieces\\\":{\\\"624333da0ab7b\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"2\\\",\\\"subtotal\\\":\\\"2\\\"}},\\\"centimes\\\":{\\\"624333da0ade6\\\":{\\\"nominal\\\":\\\"1\\\",\\\"quantity\\\":\\\"0\\\",\\\"subtotal\\\":\\\"0\\\"}}}\"', '12.00', '0', '12.00', 'essai retrait', '2022-03-29', '2022-03-29 16:29:33', '2022-03-29 16:29:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of type_operations
-- ----------------------------
INSERT INTO `type_operations` VALUES ('1', 'Dépôt de caisse', '2022-03-29 17:48:53', '2022-03-29 17:48:58');
INSERT INTO `type_operations` VALUES ('2', 'Remise en banque', '2022-03-29 17:49:13', '2022-03-29 17:49:19');
INSERT INTO `type_operations` VALUES ('3', 'Retrait', '2022-03-29 17:49:30', '2022-03-29 17:49:34');
INSERT INTO `type_operations` VALUES ('5', 'Test Opération', '2022-03-29 15:50:42', '2022-03-29 16:30:16');

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
INSERT INTO `users` VALUES ('1', 'Hariony RAKOTOBE', 'rakotobe.hariony@gmail.com', null, '$2y$10$fS8eVXYn.qouJJad/PUd5ec28dw.jsIACiIdBLVGQL3qmxcZwmmsa', null, '2022-03-29 13:56:24', '2022-03-29 13:56:29');
