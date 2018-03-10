-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               10.1.28-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win32
-- HeidiSQL Wersja:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Zrzut struktury bazy danych cerber
CREATE DATABASE IF NOT EXISTS `cerber` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci */;
USE `cerber`;

-- Zrzut struktury tabela cerber.cerber_setings
CREATE TABLE IF NOT EXISTS `cerber_setings` (
  `threads` int(11) DEFAULT NULL,
  `exec` int(11) DEFAULT NULL,
  `do` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli cerber.cerber_setings: ~1 rows (około)
/*!40000 ALTER TABLE `cerber_setings` DISABLE KEYS */;
INSERT INTO `cerber_setings` (`threads`, `exec`, `do`) VALUES
	(50, 0, 0);
/*!40000 ALTER TABLE `cerber_setings` ENABLE KEYS */;

-- Zrzut struktury procedura cerber.cerber_update
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cerber_update`()
BEGIN
UPDATE cerber_setings SET do=0;
UPDATE cerber_setings t1,(SELECT count(*) robi_sie FROM ping_plan WHERE status=1) t2 SET exec=robi_sie;
UPDATE cerber_setings SET do=1 WHERE exec<=threads;
UPDATE cerber_setings SET do=0 WHERE exec>threads;
UPDATE cerber_setings t1,(SELECT count(*) do_zrobienia FROM ping_plan WHERE status<1) t2 SET do=0 WHERE do_zrobienia=0;
END//
DELIMITER ;

-- Zrzut struktury tabela cerber.ping_plan
CREATE TABLE IF NOT EXISTS `ping_plan` (
  `ip` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `pocket_sent` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `unix_start` bigint(20) DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli cerber.ping_plan: ~256 rows (około)
/*!40000 ALTER TABLE `ping_plan` DISABLE KEYS */;
INSERT INTO `ping_plan` (`ip`, `pocket_sent`, `status`, `unix_start`, `type`) VALUES
	('192.168.1.1', 5, 2, 1, 'p'),
	('192.168.1.1', 5, 2, 1, 'p'),
	('192.168.1.2', 5, 2, 1, 'p'),
	('192.168.1.3', 5, 2, 1, 'p'),
	('192.168.1.4', 5, 2, 1, 'p'),
	('192.168.1.5', 5, 2, 1, 'p'),
	('192.168.1.6', 5, 2, 1, 'p'),
	('192.168.1.7', 5, 2, 1, 'p'),
	('192.168.1.8', 5, 2, 1, 'p'),
	('192.168.1.9', 5, 2, 1, 'p'),
	('192.168.1.10', 5, 2, 1, 'p'),
	('192.168.1.11', 5, 2, 1, 'p'),
	('192.168.1.12', 5, 2, 1, 'p'),
	('192.168.1.13', 5, 2, 1, 'p'),
	('192.168.1.14', 5, 2, 1, 'p'),
	('192.168.1.15', 5, 2, 1, 'p'),
	('192.168.1.16', 5, 2, 1, 'p'),
	('192.168.1.17', 5, 2, 1, 'p'),
	('192.168.1.18', 5, 2, 1, 'p'),
	('192.168.1.19', 5, 2, 1, 'p'),
	('192.168.1.20', 5, 2, 1, 'p'),
	('192.168.1.21', 5, 2, 1, 'p'),
	('192.168.1.22', 5, 2, 1, 'p'),
	('192.168.1.23', 5, 2, 1, 'p'),
	('192.168.1.24', 5, 2, 1, 'p'),
	('192.168.1.25', 5, 2, 1, 'p'),
	('192.168.1.26', 5, 2, 1, 'p'),
	('192.168.1.27', 5, 2, 1, 'p'),
	('192.168.1.28', 5, 2, 1, 'p'),
	('192.168.1.29', 5, 2, 1, 'p'),
	('192.168.1.30', 5, 2, 1, 'p'),
	('192.168.1.31', 5, 2, 1, 'p'),
	('192.168.1.32', 5, 2, 1, 'p'),
	('192.168.1.33', 5, 2, 1, 'p'),
	('192.168.1.34', 5, 2, 1, 'p'),
	('192.168.1.35', 5, 2, 1, 'p'),
	('192.168.1.36', 5, 2, 1, 'p'),
	('192.168.1.37', 5, 2, 1, 'p'),
	('192.168.1.38', 5, 2, 1, 'p'),
	('192.168.1.39', 5, 2, 1, 'p'),
	('192.168.1.40', 5, 2, 1, 'p'),
	('192.168.1.41', 5, 2, 1, 'p'),
	('192.168.1.42', 5, 2, 1, 'p'),
	('192.168.1.43', 5, 2, 1, 'p'),
	('192.168.1.44', 5, 2, 1, 'p'),
	('192.168.1.45', 5, 2, 1, 'p'),
	('192.168.1.46', 5, 2, 1, 'p'),
	('192.168.1.47', 5, 2, 1, 'p'),
	('192.168.1.48', 5, 2, 1, 'p'),
	('192.168.1.49', 5, 2, 1, 'p'),
	('192.168.1.50', 5, 2, 1, 'p'),
	('192.168.1.51', 5, 2, 1, 'p'),
	('192.168.1.52', 5, 2, 1, 'p'),
	('192.168.1.53', 5, 2, 1, 'p'),
	('192.168.1.54', 5, 2, 1, 'p'),
	('192.168.1.55', 5, 2, 1, 'p'),
	('192.168.1.56', 5, 2, 1, 'p'),
	('192.168.1.57', 5, 2, 1, 'p'),
	('192.168.1.58', 5, 2, 1, 'p'),
	('192.168.1.59', 5, 2, 1, 'p'),
	('192.168.1.60', 5, 2, 1, 'p'),
	('192.168.1.61', 5, 2, 1, 'p'),
	('192.168.1.62', 5, 2, 1, 'p'),
	('192.168.1.63', 5, 2, 1, 'p'),
	('192.168.1.64', 5, 2, 1, 'p'),
	('192.168.1.65', 5, 2, 1, 'p'),
	('192.168.1.66', 5, 2, 1, 'p'),
	('192.168.1.67', 5, 2, 1, 'p'),
	('192.168.1.68', 5, 2, 1, 'p'),
	('192.168.1.69', 5, 2, 1, 'p'),
	('192.168.1.70', 5, 2, 1, 'p'),
	('192.168.1.71', 5, 2, 1, 'p'),
	('192.168.1.72', 5, 2, 1, 'p'),
	('192.168.1.73', 5, 2, 1, 'p'),
	('192.168.1.74', 5, 2, 1, 'p'),
	('192.168.1.75', 5, 2, 1, 'p'),
	('192.168.1.76', 5, 2, 1, 'p'),
	('192.168.1.77', 5, 2, 1, 'p'),
	('192.168.1.78', 5, 2, 1, 'p'),
	('192.168.1.79', 5, 2, 1, 'p'),
	('192.168.1.80', 5, 2, 1, 'p'),
	('192.168.1.81', 5, 2, 1, 'p'),
	('192.168.1.82', 5, 2, 1, 'p'),
	('192.168.1.83', 5, 2, 1, 'p'),
	('192.168.1.84', 5, 2, 1, 'p'),
	('192.168.1.85', 5, 2, 1, 'p'),
	('192.168.1.86', 5, 2, 1, 'p'),
	('192.168.1.87', 5, 2, 1, 'p'),
	('192.168.1.88', 5, 2, 1, 'p'),
	('192.168.1.89', 5, 2, 1, 'p'),
	('192.168.1.90', 5, 2, 1, 'p'),
	('192.168.1.91', 5, 2, 1, 'p'),
	('192.168.1.92', 5, 2, 1, 'p'),
	('192.168.1.93', 5, 2, 1, 'p'),
	('192.168.1.94', 5, 2, 1, 'p'),
	('192.168.1.95', 5, 2, 1, 'p'),
	('192.168.1.96', 5, 2, 1, 'p'),
	('192.168.1.97', 5, 2, 1, 'p'),
	('192.168.1.98', 5, 2, 1, 'p'),
	('192.168.1.99', 5, 2, 1, 'p'),
	('192.168.1.100', 5, 2, 1, 'p'),
	('192.168.1.101', 5, 2, 1, 'p'),
	('192.168.1.102', 5, 2, 1, 'p'),
	('192.168.1.103', 5, 2, 1, 'p'),
	('192.168.1.104', 5, 2, 1, 'p'),
	('192.168.1.105', 5, 2, 1, 'p'),
	('192.168.1.106', 5, 2, 1, 'p'),
	('192.168.1.107', 5, 2, 1, 'p'),
	('192.168.1.108', 5, 2, 1, 'p'),
	('192.168.1.109', 5, 2, 1, 'p'),
	('192.168.1.110', 5, 2, 1, 'p'),
	('192.168.1.111', 5, 2, 1, 'p'),
	('192.168.1.112', 5, 2, 1, 'p'),
	('192.168.1.113', 5, 2, 1, 'p'),
	('192.168.1.114', 5, 2, 1, 'p'),
	('192.168.1.115', 5, 2, 1, 'p'),
	('192.168.1.116', 5, 2, 1, 'p'),
	('192.168.1.117', 5, 2, 1, 'p'),
	('192.168.1.118', 5, 2, 1, 'p'),
	('192.168.1.119', 5, 2, 1, 'p'),
	('192.168.1.120', 5, 2, 1, 'p'),
	('192.168.1.121', 5, 2, 1, 'p'),
	('192.168.1.122', 5, 2, 1, 'p'),
	('192.168.1.123', 5, 2, 1, 'p'),
	('192.168.1.124', 5, 2, 1, 'p'),
	('192.168.1.125', 5, 2, 1, 'p'),
	('192.168.1.126', 5, 2, 1, 'p'),
	('192.168.1.127', 5, 2, 1, 'p'),
	('192.168.1.128', 5, 2, 1, 'p'),
	('192.168.1.129', 5, 2, 1, 'p'),
	('192.168.1.130', 5, 2, 1, 'p'),
	('192.168.1.131', 5, 2, 1, 'p'),
	('192.168.1.132', 5, 2, 1, 'p'),
	('192.168.1.133', 5, 2, 1, 'p'),
	('192.168.1.134', 5, 2, 1, 'p'),
	('192.168.1.135', 5, 2, 1, 'p'),
	('192.168.1.136', 5, 2, 1, 'p'),
	('192.168.1.137', 5, 2, 1, 'p'),
	('192.168.1.138', 5, 2, 1, 'p'),
	('192.168.1.139', 5, 2, 1, 'p'),
	('192.168.1.140', 5, 2, 1, 'p'),
	('192.168.1.141', 5, 2, 1, 'p'),
	('192.168.1.142', 5, 2, 1, 'p'),
	('192.168.1.143', 5, 2, 1, 'p'),
	('192.168.1.144', 5, 2, 1, 'p'),
	('192.168.1.145', 5, 2, 1, 'p'),
	('192.168.1.146', 5, 2, 1, 'p'),
	('192.168.1.147', 5, 2, 1, 'p'),
	('192.168.1.148', 5, 2, 1, 'p'),
	('192.168.1.149', 5, 2, 1, 'p'),
	('192.168.1.150', 5, 2, 1, 'p'),
	('192.168.1.151', 5, 2, 1, 'p'),
	('192.168.1.152', 5, 2, 1, 'p'),
	('192.168.1.153', 5, 2, 1, 'p'),
	('192.168.1.154', 5, 2, 1, 'p'),
	('192.168.1.155', 5, 2, 1, 'p'),
	('192.168.1.156', 5, 2, 1, 'p'),
	('192.168.1.157', 5, 2, 1, 'p'),
	('192.168.1.158', 5, 2, 1, 'p'),
	('192.168.1.159', 5, 2, 1, 'p'),
	('192.168.1.160', 5, 2, 1, 'p'),
	('192.168.1.161', 5, 2, 1, 'p'),
	('192.168.1.162', 5, 2, 1, 'p'),
	('192.168.1.163', 5, 2, 1, 'p'),
	('192.168.1.164', 5, 2, 1, 'p'),
	('192.168.1.165', 5, 2, 1, 'p'),
	('192.168.1.166', 5, 2, 1, 'p'),
	('192.168.1.167', 5, 2, 1, 'p'),
	('192.168.1.168', 5, 2, 1, 'p'),
	('192.168.1.169', 5, 2, 1, 'p'),
	('192.168.1.170', 5, 2, 1, 'p'),
	('192.168.1.171', 5, 2, 1, 'p'),
	('192.168.1.172', 5, 2, 1, 'p'),
	('192.168.1.173', 5, 2, 1, 'p'),
	('192.168.1.174', 5, 2, 1, 'p'),
	('192.168.1.175', 5, 2, 1, 'p'),
	('192.168.1.176', 5, 2, 1, 'p'),
	('192.168.1.177', 5, 2, 1, 'p'),
	('192.168.1.178', 5, 2, 1, 'p'),
	('192.168.1.179', 5, 2, 1, 'p'),
	('192.168.1.180', 5, 2, 1, 'p'),
	('192.168.1.181', 5, 2, 1, 'p'),
	('192.168.1.182', 5, 2, 1, 'p'),
	('192.168.1.183', 5, 2, 1, 'p'),
	('192.168.1.184', 5, 2, 1, 'p'),
	('192.168.1.185', 5, 2, 1, 'p'),
	('192.168.1.186', 5, 2, 1, 'p'),
	('192.168.1.187', 5, 2, 1, 'p'),
	('192.168.1.188', 5, 2, 1, 'p'),
	('192.168.1.189', 5, 2, 1, 'p'),
	('192.168.1.190', 5, 2, 1, 'p'),
	('192.168.1.191', 5, 2, 1, 'p'),
	('192.168.1.192', 5, 2, 1, 'p'),
	('192.168.1.193', 5, 2, 1, 'p'),
	('192.168.1.194', 5, 2, 1, 'p'),
	('192.168.1.195', 5, 2, 1, 'p'),
	('192.168.1.196', 5, 2, 1, 'p'),
	('192.168.1.197', 5, 2, 1, 'p'),
	('192.168.1.198', 5, 2, 1, 'p'),
	('192.168.1.199', 5, 2, 1, 'p'),
	('192.168.1.200', 5, 2, 1, 'p'),
	('192.168.1.201', 5, 2, 1, 'p'),
	('192.168.1.202', 5, 2, 1, 'p'),
	('192.168.1.203', 5, 2, 1, 'p'),
	('192.168.1.204', 5, 2, 1, 'p'),
	('192.168.1.205', 5, 2, 1, 'p'),
	('192.168.1.206', 5, 2, 1, 'p'),
	('192.168.1.207', 5, 2, 1, 'p'),
	('192.168.1.208', 5, 2, 1, 'p'),
	('192.168.1.209', 5, 2, 1, 'p'),
	('192.168.1.210', 5, 2, 1, 'p'),
	('192.168.1.211', 5, 2, 1, 'p'),
	('192.168.1.212', 5, 2, 1, 'p'),
	('192.168.1.213', 5, 2, 1, 'p'),
	('192.168.1.214', 5, 2, 1, 'p'),
	('192.168.1.215', 5, 2, 1, 'p'),
	('192.168.1.216', 5, 2, 1, 'p'),
	('192.168.1.217', 5, 2, 1, 'p'),
	('192.168.1.218', 5, 2, 1, 'p'),
	('192.168.1.219', 5, 2, 1, 'p'),
	('192.168.1.220', 5, 2, 1, 'p'),
	('192.168.1.221', 5, 2, 1, 'p'),
	('192.168.1.222', 5, 2, 1, 'p'),
	('192.168.1.223', 5, 2, 1, 'p'),
	('192.168.1.224', 5, 2, 1, 'p'),
	('192.168.1.225', 5, 2, 1, 'p'),
	('192.168.1.226', 5, 2, 1, 'p'),
	('192.168.1.227', 5, 2, 1, 'p'),
	('192.168.1.228', 5, 2, 1, 'p'),
	('192.168.1.229', 5, 2, 1, 'p'),
	('192.168.1.230', 5, 2, 1, 'p'),
	('192.168.1.231', 5, 2, 1, 'p'),
	('192.168.1.232', 5, 2, 1, 'p'),
	('192.168.1.233', 5, 2, 1, 'p'),
	('192.168.1.234', 5, 2, 1, 'p'),
	('192.168.1.235', 5, 2, 1, 'p'),
	('192.168.1.236', 5, 2, 1, 'p'),
	('192.168.1.237', 5, 2, 1, 'p'),
	('192.168.1.238', 5, 2, 1, 'p'),
	('192.168.1.239', 5, 2, 1, 'p'),
	('192.168.1.240', 5, 2, 1, 'p'),
	('192.168.1.241', 5, 2, 1, 'p'),
	('192.168.1.242', 5, 2, 1, 'p'),
	('192.168.1.243', 5, 2, 1, 'p'),
	('192.168.1.244', 5, 2, 1, 'p'),
	('192.168.1.245', 5, 2, 1, 'p'),
	('192.168.1.246', 5, 2, 1, 'p'),
	('192.168.1.247', 5, 2, 1, 'p'),
	('192.168.1.248', 5, 2, 1, 'p'),
	('192.168.1.249', 5, 2, 1, 'p'),
	('192.168.1.250', 5, 2, 1, 'p'),
	('192.168.1.251', 5, 2, 1, 'p'),
	('192.168.1.252', 5, 2, 1, 'p'),
	('192.168.1.253', 5, 2, 1, 'p'),
	('192.168.1.254', 5, 2, 1, 'p'),
	('192.168.1.255', 5, 2, 1, 'p');
/*!40000 ALTER TABLE `ping_plan` ENABLE KEYS */;

-- Zrzut struktury tabela cerber.ping_results
CREATE TABLE IF NOT EXISTS `ping_results` (
  `ip` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `minping` int(11) DEFAULT NULL,
  `maxping` int(11) DEFAULT NULL,
  `aveping` int(11) DEFAULT NULL,
  `sent` int(11) DEFAULT NULL,
  `receive` int(11) DEFAULT NULL,
  `lost` int(11) DEFAULT NULL,
  `unreachable` int(11) NOT NULL,
  `err` int(11) DEFAULT '0',
  `timedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli cerber.ping_results: ~0 rows (około)
/*!40000 ALTER TABLE `ping_results` DISABLE KEYS */;
INSERT INTO `ping_results` (`ip`, `minping`, `maxping`, `aveping`, `sent`, `receive`, `lost`, `unreachable`, `err`, `timedate`) VALUES
	('192.168.1.254', 2, 2, 2, 5, 5, 0, 0, 0, '2018-03-10 20:44:32'),
	('192.168.1.252', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:42'),
	('192.168.1.253', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:42'),
	('192.168.1.251', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:43'),
	('192.168.1.250', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:49'),
	('192.168.1.249', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:50'),
	('192.168.1.247', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:52'),
	('192.168.1.248', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:52'),
	('192.168.1.255', 0, 0, 0, 5, 0, 5, 0, 2, '2018-03-10 20:44:52'),
	('192.168.1.246', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:52'),
	('192.168.1.244', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:44:55'),
	('192.168.1.245', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:44:57'),
	('192.168.1.243', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:44:57'),
	('192.168.1.245', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:44:58'),
	('192.168.1.243', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:44:59'),
	('192.168.1.242', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:02'),
	('192.168.1.241', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:45:03'),
	('192.168.1.241', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:45:06'),
	('192.168.1.240', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:10'),
	('192.168.1.239', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:10'),
	('192.168.1.238', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:11'),
	('192.168.1.236', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:12'),
	('192.168.1.237', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:12'),
	('192.168.1.235', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:12'),
	('192.168.1.234', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:13'),
	('192.168.1.233', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:13'),
	('192.168.1.232', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:17'),
	('192.168.1.231', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:19'),
	('192.168.1.230', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:19'),
	('192.168.1.229', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:20'),
	('192.168.1.228', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:23'),
	('192.168.1.226', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:24'),
	('192.168.1.227', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:24'),
	('192.168.1.225', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:25'),
	('192.168.1.224', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:28'),
	('192.168.1.223', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:29'),
	('192.168.1.222', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:32'),
	('192.168.1.221', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:35'),
	('192.168.1.220', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:35'),
	('192.168.1.219', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:37'),
	('192.168.1.218', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:37'),
	('192.168.1.217', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:39'),
	('192.168.1.216', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:39'),
	('192.168.1.215', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:43'),
	('192.168.1.214', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:44'),
	('192.168.1.213', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:45'),
	('192.168.1.212', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:45'),
	('192.168.1.210', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:50'),
	('192.168.1.211', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:51'),
	('192.168.1.209', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:53'),
	('192.168.1.208', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:55'),
	('192.168.1.207', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:55'),
	('192.168.1.206', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:45:57'),
	('192.168.1.205', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:01'),
	('192.168.1.204', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:01'),
	('192.168.1.203', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:02'),
	('192.168.1.202', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:05'),
	('192.168.1.201', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:10'),
	('192.168.1.200', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:11'),
	('192.168.1.199', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:12'),
	('192.168.1.198', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:12'),
	('192.168.1.196', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:15'),
	('192.168.1.197', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:15'),
	('192.168.1.194', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:16'),
	('192.168.1.195', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:16'),
	('192.168.1.192', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:24'),
	('192.168.1.191', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:25'),
	('192.168.1.190', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:26'),
	('192.168.1.193', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:46:26'),
	('192.168.1.193', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:46:28'),
	('192.168.1.189', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:28'),
	('192.168.1.188', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:31'),
	('192.168.1.187', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:32'),
	('192.168.1.186', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:32'),
	('192.168.1.185', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:33'),
	('192.168.1.184', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:37'),
	('192.168.1.183', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:38'),
	('192.168.1.182', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:38'),
	('192.168.1.181', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:39'),
	('192.168.1.179', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:45'),
	('192.168.1.180', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:46'),
	('192.168.1.178', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:46'),
	('192.168.1.176', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:46'),
	('192.168.1.177', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:46'),
	('192.168.1.175', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:50'),
	('192.168.1.174', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:52'),
	('192.168.1.173', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:52'),
	('192.168.1.172', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:53'),
	('192.168.1.171', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:46:57'),
	('192.168.1.169', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:02'),
	('192.168.1.168', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:03'),
	('192.168.1.167', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:04'),
	('192.168.1.170', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:47:04'),
	('192.168.1.166', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:06'),
	('192.168.1.170', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:47:06'),
	('192.168.1.165', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:06'),
	('192.168.1.164', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:11'),
	('192.168.1.163', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:12'),
	('192.168.1.161', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:13'),
	('192.168.1.162', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:13'),
	('192.168.1.159', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:18'),
	('192.168.1.158', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:21'),
	('192.168.1.157', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:21'),
	('192.168.1.160', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:47:21'),
	('192.168.1.160', 0, 0, 0, 5, 2, 3, 2, 2, '2018-03-10 20:47:22'),
	('192.168.1.156', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:23'),
	('192.168.1.155', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:25'),
	('192.168.1.154', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:29'),
	('192.168.1.153', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:31'),
	('192.168.1.152', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:32'),
	('192.168.1.151', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:32'),
	('192.168.1.150', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:33'),
	('192.168.1.149', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:35'),
	('192.168.1.148', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:38'),
	('192.168.1.147', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:39'),
	('192.168.1.146', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:39'),
	('192.168.1.145', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:42'),
	('192.168.1.143', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:50'),
	('192.168.1.141', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:51'),
	('192.168.1.144', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:47:51'),
	('192.168.1.142', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:52'),
	('192.168.1.144', 0, 0, 0, 5, 2, 3, 2, 2, '2018-03-10 20:47:52'),
	('192.168.1.140', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:53'),
	('192.168.1.139', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:57'),
	('192.168.1.137', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:58'),
	('192.168.1.138', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:47:58'),
	('192.168.1.136', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:04'),
	('192.168.1.135', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:05'),
	('192.168.1.134', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:05'),
	('192.168.1.133', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:06'),
	('192.168.1.132', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:07'),
	('192.168.1.131', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:08'),
	('192.168.1.130', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:09'),
	('192.168.1.129', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:12'),
	('192.168.1.128', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:13'),
	('192.168.1.127', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:14'),
	('192.168.1.126', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:14'),
	('192.168.1.125', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:19'),
	('192.168.1.123', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:23'),
	('192.168.1.122', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:25'),
	('192.168.1.124', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:48:25'),
	('192.168.1.121', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:26'),
	('192.168.1.120', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:26'),
	('192.168.1.119', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:27'),
	('192.168.1.124', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:48:28'),
	('192.168.1.118', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:33'),
	('192.168.1.117', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:35'),
	('192.168.1.116', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:35'),
	('192.168.1.115', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:37'),
	('192.168.1.114', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:39'),
	('192.168.1.113', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:40'),
	('192.168.1.112', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:40'),
	('192.168.1.111', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:41'),
	('192.168.1.110', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:44'),
	('192.168.1.109', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:47'),
	('192.168.1.108', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:47'),
	('192.168.1.107', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:48'),
	('192.168.1.106', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:51'),
	('192.168.1.105', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:53'),
	('192.168.1.104', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:54'),
	('192.168.1.103', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:55'),
	('192.168.1.102', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:58'),
	('192.168.1.101', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:48:58'),
	('192.168.1.100', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:01'),
	('192.168.1.99', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:02'),
	('192.168.1.98', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:02'),
	('192.168.1.97', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:04'),
	('192.168.1.96', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:09'),
	('192.168.1.94', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:12'),
	('192.168.1.91', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:14'),
	('192.168.1.92', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:14'),
	('192.168.1.93', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:14'),
	('192.168.1.95', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:49:14'),
	('192.168.1.95', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:49:16'),
	('192.168.1.90', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:18'),
	('192.168.1.89', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:25'),
	('192.168.1.87', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:26'),
	('192.168.1.88', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:26'),
	('192.168.1.86', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:27'),
	('192.168.1.85', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:27'),
	('192.168.1.84', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:31'),
	('192.168.1.82', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:32'),
	('192.168.1.83', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:32'),
	('192.168.1.81', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:36'),
	('192.168.1.80', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:37'),
	('192.168.1.79', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:38'),
	('192.168.1.78', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:39'),
	('192.168.1.77', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:43'),
	('192.168.1.76', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:44'),
	('192.168.1.75', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:44'),
	('192.168.1.74', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:46'),
	('192.168.1.73', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:48'),
	('192.168.1.72', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:48'),
	('192.168.1.71', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:51'),
	('192.168.1.69', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:54'),
	('192.168.1.70', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:54'),
	('192.168.1.68', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:49:55'),
	('192.168.1.67', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:01'),
	('192.168.1.66', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:02'),
	('192.168.1.65', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:03'),
	('192.168.1.64', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:03'),
	('192.168.1.63', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:03'),
	('192.168.1.62', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:04'),
	('192.168.1.61', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:08'),
	('192.168.1.60', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:09'),
	('192.168.1.59', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:09'),
	('192.168.1.58', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:10'),
	('192.168.1.56', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:17'),
	('192.168.1.55', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:19'),
	('192.168.1.57', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:50:19'),
	('192.168.1.57', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:50:20'),
	('192.168.1.54', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:21'),
	('192.168.1.53', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:22'),
	('192.168.1.52', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:26'),
	('192.168.1.50', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:28'),
	('192.168.1.51', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:28'),
	('192.168.1.49', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:28'),
	('192.168.1.46', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:35'),
	('192.168.1.47', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:35'),
	('192.168.1.48', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:35'),
	('192.168.1.45', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:36'),
	('192.168.1.44', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:37'),
	('192.168.1.43', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:38'),
	('192.168.1.42', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:40'),
	('192.168.1.41', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:42'),
	('192.168.1.40', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:43'),
	('192.168.1.39', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:44'),
	('192.168.1.38', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:47'),
	('192.168.1.37', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:53'),
	('192.168.1.35', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:54'),
	('192.168.1.36', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:50:55'),
	('192.168.1.34', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:55'),
	('192.168.1.33', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:56'),
	('192.168.1.36', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:50:56'),
	('192.168.1.32', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:57'),
	('192.168.1.31', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:50:58'),
	('192.168.1.29', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:04'),
	('192.168.1.30', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:04'),
	('192.168.1.28', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:05'),
	('192.168.1.27', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:08'),
	('192.168.1.26', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:09'),
	('192.168.1.24', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:11'),
	('192.168.1.25', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:11'),
	('192.168.1.23', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:15'),
	('192.168.1.22', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:16'),
	('192.168.1.20', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:20'),
	('192.168.1.21', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:20'),
	('192.168.1.19', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:21'),
	('192.168.1.17', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:30'),
	('192.168.1.18', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:51:31'),
	('192.168.1.18', 0, 0, 0, 5, 3, 2, 3, 2, '2018-03-10 20:51:34'),
	('192.168.1.15', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:34'),
	('192.168.1.16', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:35'),
	('192.168.1.14', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:37'),
	('192.168.1.11', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:38'),
	('192.168.1.12', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:38'),
	('192.168.1.13', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:38'),
	('192.168.1.10', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:39'),
	('192.168.1.9', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:41'),
	('192.168.1.8', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:44'),
	('192.168.1.7', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:44'),
	('192.168.1.6', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:45'),
	('192.168.1.1', 0, 0, 0, 5, 5, 0, 0, 0, '2018-03-10 20:51:46'),
	('192.168.1.5', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:48'),
	('192.168.1.4', 0, 0, 0, 5, 5, 0, 5, 2, '2018-03-10 20:51:50'),
	('192.168.1.3', 142, 1993, 1067, 5, 3, 2, 1, 0, '2018-03-10 20:51:52'),
	('192.168.1.2', 0, 0, 0, 5, 0, 5, 0, 2, '2018-03-10 20:52:03'),
	('', 0, 0, 0, 0, 0, 0, 0, 1, '2018-03-10 21:00:23');
/*!40000 ALTER TABLE `ping_results` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
