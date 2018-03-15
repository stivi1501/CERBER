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

-- Zrzut struktury tabela cerber.cerber_gen_inc
CREATE TABLE IF NOT EXISTS `cerber_gen_inc` (
  `lp` int(11) DEFAULT NULL,
  `lp_str` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli cerber.cerber_gen_inc: ~255 rows (około)
/*!40000 ALTER TABLE `cerber_gen_inc` DISABLE KEYS */;
INSERT INTO `cerber_gen_inc` (`lp`, `lp_str`) VALUES
	(1, '1'),
	(10, '10'),
	(100, '100'),
	(101, '101'),
	(102, '102'),
	(103, '103'),
	(104, '104'),
	(105, '105'),
	(106, '106'),
	(107, '107'),
	(108, '108'),
	(109, '109'),
	(11, '11'),
	(110, '110'),
	(111, '111'),
	(112, '112'),
	(113, '113'),
	(114, '114'),
	(115, '115'),
	(116, '116'),
	(117, '117'),
	(118, '118'),
	(119, '119'),
	(12, '12'),
	(120, '120'),
	(121, '121'),
	(122, '122'),
	(123, '123'),
	(124, '124'),
	(125, '125'),
	(126, '126'),
	(127, '127'),
	(128, '128'),
	(129, '129'),
	(13, '13'),
	(130, '130'),
	(131, '131'),
	(132, '132'),
	(133, '133'),
	(134, '134'),
	(135, '135'),
	(136, '136'),
	(137, '137'),
	(138, '138'),
	(139, '139'),
	(14, '14'),
	(140, '140'),
	(141, '141'),
	(142, '142'),
	(143, '143'),
	(144, '144'),
	(145, '145'),
	(146, '146'),
	(147, '147'),
	(148, '148'),
	(149, '149'),
	(15, '15'),
	(150, '150'),
	(151, '151'),
	(152, '152'),
	(153, '153'),
	(154, '154'),
	(155, '155'),
	(156, '156'),
	(157, '157'),
	(158, '158'),
	(159, '159'),
	(16, '16'),
	(160, '160'),
	(161, '161'),
	(162, '162'),
	(163, '163'),
	(164, '164'),
	(165, '165'),
	(166, '166'),
	(167, '167'),
	(168, '168'),
	(169, '169'),
	(17, '17'),
	(170, '170'),
	(171, '171'),
	(172, '172'),
	(173, '173'),
	(174, '174'),
	(175, '175'),
	(176, '176'),
	(177, '177'),
	(178, '178'),
	(179, '179'),
	(18, '18'),
	(180, '180'),
	(181, '181'),
	(182, '182'),
	(183, '183'),
	(184, '184'),
	(185, '185'),
	(186, '186'),
	(187, '187'),
	(188, '188'),
	(189, '189'),
	(19, '19'),
	(190, '190'),
	(191, '191'),
	(192, '192'),
	(193, '193'),
	(194, '194'),
	(195, '195'),
	(196, '196'),
	(197, '197'),
	(198, '198'),
	(199, '199'),
	(2, '2'),
	(20, '20'),
	(200, '200'),
	(201, '201'),
	(202, '202'),
	(203, '203'),
	(204, '204'),
	(205, '205'),
	(206, '206'),
	(207, '207'),
	(208, '208'),
	(209, '209'),
	(21, '21'),
	(210, '210'),
	(211, '211'),
	(212, '212'),
	(213, '213'),
	(214, '214'),
	(215, '215'),
	(216, '216'),
	(217, '217'),
	(218, '218'),
	(219, '219'),
	(22, '22'),
	(220, '220'),
	(221, '221'),
	(222, '222'),
	(223, '223'),
	(224, '224'),
	(225, '225'),
	(226, '226'),
	(227, '227'),
	(228, '228'),
	(229, '229'),
	(23, '23'),
	(230, '230'),
	(231, '231'),
	(232, '232'),
	(233, '233'),
	(234, '234'),
	(235, '235'),
	(236, '236'),
	(237, '237'),
	(238, '238'),
	(239, '239'),
	(24, '24'),
	(240, '240'),
	(241, '241'),
	(242, '242'),
	(243, '243'),
	(244, '244'),
	(245, '245'),
	(246, '246'),
	(247, '247'),
	(248, '248'),
	(249, '249'),
	(25, '25'),
	(250, '250'),
	(251, '251'),
	(252, '252'),
	(253, '253'),
	(254, '254'),
	(255, '255'),
	(26, '26'),
	(27, '27'),
	(28, '28'),
	(29, '29'),
	(3, '3'),
	(30, '30'),
	(31, '31'),
	(32, '32'),
	(33, '33'),
	(34, '34'),
	(35, '35'),
	(36, '36'),
	(37, '37'),
	(38, '38'),
	(39, '39'),
	(4, '4'),
	(40, '40'),
	(41, '41'),
	(42, '42'),
	(43, '43'),
	(44, '44'),
	(45, '45'),
	(46, '46'),
	(47, '47'),
	(48, '48'),
	(49, '49'),
	(5, '5'),
	(50, '50'),
	(51, '51'),
	(52, '52'),
	(53, '53'),
	(54, '54'),
	(55, '55'),
	(56, '56'),
	(57, '57'),
	(58, '58'),
	(59, '59'),
	(6, '6'),
	(60, '60'),
	(61, '61'),
	(62, '62'),
	(63, '63'),
	(64, '64'),
	(65, '65'),
	(66, '66'),
	(67, '67'),
	(68, '68'),
	(69, '69'),
	(7, '7'),
	(70, '70'),
	(71, '71'),
	(72, '72'),
	(73, '73'),
	(74, '74'),
	(75, '75'),
	(76, '76'),
	(77, '77'),
	(78, '78'),
	(79, '79'),
	(8, '8'),
	(80, '80'),
	(81, '81'),
	(82, '82'),
	(83, '83'),
	(84, '84'),
	(85, '85'),
	(86, '86'),
	(87, '87'),
	(88, '88'),
	(89, '89'),
	(9, '9'),
	(90, '90'),
	(91, '91'),
	(92, '92'),
	(93, '93'),
	(94, '94'),
	(95, '95'),
	(96, '96'),
	(97, '97'),
	(98, '98'),
	(99, '99');
/*!40000 ALTER TABLE `cerber_gen_inc` ENABLE KEYS */;

-- Zrzut struktury tabela cerber.cerber_gen_ip
CREATE TABLE IF NOT EXISTS `cerber_gen_ip` (
  `ip` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `n` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli cerber.cerber_gen_ip: ~3 rows (około)
/*!40000 ALTER TABLE `cerber_gen_ip` DISABLE KEYS */;
INSERT INTO `cerber_gen_ip` (`ip`, `n`) VALUES
	('192.168.1.4', 5),
	('192.168.1.5', 5),
	('192.168.1.6', 5);
/*!40000 ALTER TABLE `cerber_gen_ip` ENABLE KEYS */;

-- Zrzut struktury tabela cerber.cerber_gen_port
CREATE TABLE IF NOT EXISTS `cerber_gen_port` (
  `port` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli cerber.cerber_gen_port: ~3 rows (około)
/*!40000 ALTER TABLE `cerber_gen_port` DISABLE KEYS */;
INSERT INTO `cerber_gen_port` (`port`) VALUES
	(21),
	(22),
	(23);
/*!40000 ALTER TABLE `cerber_gen_port` ENABLE KEYS */;

-- Zrzut struktury procedura cerber.cerber_gen_proc1
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cerber_gen_proc1`(
	IN `ip_pocz` INT,
	IN `ip_kon` INT

,
	IN `przed` VARCHAR(50)



,
	IN `n` INT

)
BEGIN
DROP TABLE IF EXISTS cerber_gen_ip;
CREATE TABLE cerber_gen_ip SELECT concat(przed,lp_str) ip,n FROM cerber_gen_inc WHERE lp>=ip_pocz AND lp<=ip_kon;
END//
DELIMITER ;

-- Zrzut struktury procedura cerber.cerber_gen_proc2
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cerber_gen_proc2`()
BEGIN
INSERT INTO cerber_plan(ip,nn,unix_start,type) select ip,n,0,"p" FROM cerber_gen_ip;
INSERT INTO cerber_plan(ip,nn,unix_start,type) select ip,port,0,"s" FROM cerber_gen_ip,cerber_gen_port;

END//
DELIMITER ;

-- Zrzut struktury tabela cerber.cerber_plan
CREATE TABLE IF NOT EXISTS `cerber_plan` (
  `ip` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nn` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `unix_start` bigint(20) DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=COMPACT;

-- Zrzucanie danych dla tabeli cerber.cerber_plan: ~0 rows (około)
/*!40000 ALTER TABLE `cerber_plan` DISABLE KEYS */;
INSERT INTO `cerber_plan` (`ip`, `nn`, `status`, `unix_start`, `type`) VALUES
	('192.168.1.4', 5, 2, 0, 'p'),
	('192.168.1.5', 5, 2, 0, 'p'),
	('192.168.1.6', 5, 2, 0, 'p'),
	('192.168.1.4', 21, 2, 0, 's'),
	('192.168.1.5', 21, 2, 0, 's'),
	('192.168.1.6', 21, 2, 0, 's'),
	('192.168.1.4', 22, 2, 0, 's'),
	('192.168.1.5', 22, 2, 0, 's'),
	('192.168.1.6', 22, 2, 0, 's'),
	('192.168.1.4', 23, 2, 0, 's'),
	('192.168.1.5', 23, 2, 0, 's'),
	('192.168.1.6', 23, 2, 0, 's');
/*!40000 ALTER TABLE `cerber_plan` ENABLE KEYS */;

-- Zrzut struktury procedura cerber.cerber_plan_proc
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cerber_plan_proc`()
BEGIN
DROP TABLE cerber_plan_temp;
CREATE TABLE cerber_plan_temp (
	ip VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_polish_ci',
	nn INT(11) NULL DEFAULT NULL,
	status INT(11) NULL DEFAULT '0',
	unix_start BIGINT(20) NULL DEFAULT NULL,
	type VARCHAR(1) NULL DEFAULT NULL COLLATE 'utf8_polish_ci',
	Id INT(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`Id`)
)
COLLATE='utf8_polish_ci'
ENGINE=InnoDB
ROW_FORMAT=COMPACT;
INSERT INTO cerber_plan_temp(ip,nn,status,unix_start,type)  SELECT ip,nn,status,unix_start,type FROM cerber_plan WHERE status=0 ORDER BY unix_start,type LIMIT 50;
UPDATE cerber_plan_temp t1,cerber_plan t2 SET t2.status=1 WHERE t1.ip=t2.ip AND t1.unix_start=t2.unix_start AND t1.type=t2.type;

UPDATE cerber_setings SET dop=(SELECT (CASE WHEN count(*) IS NULL THEN 0 ELSE count(*) END) dop FROM cerber_plan_temp WHERE type='p');
UPDATE cerber_setings SET dos=(SELECT (CASE WHEN count(*) IS NULL THEN 0 ELSE count(*) END) dos FROM cerber_plan_temp WHERE type='s');

END//
DELIMITER ;

-- Zrzut struktury tabela cerber.cerber_plan_temp
CREATE TABLE IF NOT EXISTS `cerber_plan_temp` (
  `ip` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nn` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `unix_start` bigint(20) DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=COMPACT;

-- Zrzucanie danych dla tabeli cerber.cerber_plan_temp: ~12 rows (około)
/*!40000 ALTER TABLE `cerber_plan_temp` DISABLE KEYS */;
INSERT INTO `cerber_plan_temp` (`ip`, `nn`, `status`, `unix_start`, `type`, `Id`) VALUES
	('192.168.1.4', 5, 0, 0, 'p', 1),
	('192.168.1.5', 5, 0, 0, 'p', 2),
	('192.168.1.6', 5, 0, 0, 'p', 3),
	('192.168.1.5', 23, 0, 0, 's', 4),
	('192.168.1.4', 23, 0, 0, 's', 5),
	('192.168.1.6', 22, 0, 0, 's', 6),
	('192.168.1.5', 22, 0, 0, 's', 7),
	('192.168.1.4', 22, 0, 0, 's', 8),
	('192.168.1.6', 21, 0, 0, 's', 9),
	('192.168.1.5', 21, 0, 0, 's', 10),
	('192.168.1.4', 21, 0, 0, 's', 11),
	('192.168.1.6', 23, 0, 0, 's', 12);
/*!40000 ALTER TABLE `cerber_plan_temp` ENABLE KEYS */;

-- Zrzut struktury tabela cerber.cerber_setings
CREATE TABLE IF NOT EXISTS `cerber_setings` (
  `threads` int(11) DEFAULT NULL,
  `exec` int(11) DEFAULT NULL,
  `dos` int(11) DEFAULT NULL,
  `dop` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli cerber.cerber_setings: ~1 rows (około)
/*!40000 ALTER TABLE `cerber_setings` DISABLE KEYS */;
INSERT INTO `cerber_setings` (`threads`, `exec`, `dos`, `dop`) VALUES
	(50, 23, 9, 3);
/*!40000 ALTER TABLE `cerber_setings` ENABLE KEYS */;

-- Zrzut struktury procedura cerber.cerber_update
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cerber_update`()
BEGIN
UPDATE cerber_setings SET dos=0,dop=0;
UPDATE cerber_setings t1,(SELECT count(*) robi_sie FROM cerber_plan WHERE status=1) t2 SET exec=robi_sie;
UPDATE cerber_setings SET dop=1 WHERE exec<=threads;
UPDATE cerber_setings SET dop=0 WHERE exec>threads;
UPDATE cerber_setings SET dos=1 WHERE exec<=threads;
UPDATE cerber_setings SET dos=0 WHERE exec>threads;

UPDATE cerber_setings t1,(SELECT count(*) do_zrobienia FROM cerber_plan WHERE status<1 AND type='p') t2 SET dop=0 WHERE do_zrobienia=0;
UPDATE cerber_setings t1,(SELECT count(*) do_zrobienia FROM cerber_plan WHERE status<1 AND type='s') t2 SET dos=0 WHERE do_zrobienia=0;

END//
DELIMITER ;

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
	('192.168.1.5', 57, 291, 189, 5, 5, 0, 0, 0, '2018-03-15 20:32:41'),
	('192.168.1.6', 0, 0, 0, 5, 3, 2, 3, 0, '2018-03-15 20:32:41'),
	('192.168.1.4', 0, 0, 0, 5, 3, 2, 3, 0, '2018-03-15 20:32:41');
/*!40000 ALTER TABLE `ping_results` ENABLE KEYS */;

-- Zrzut struktury tabela cerber.socket_results
CREATE TABLE IF NOT EXISTS `socket_results` (
  `ip` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `ok_no` int(11) DEFAULT NULL,
  `timedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Zrzucanie danych dla tabeli cerber.socket_results: ~0 rows (około)
/*!40000 ALTER TABLE `socket_results` DISABLE KEYS */;
INSERT INTO `socket_results` (`ip`, `port`, `ok_no`, `timedate`) VALUES
	('192.168.1.5', 23, 1, '2018-03-15 20:32:45'),
	('192.168.1.5', 21, 0, '2018-03-15 20:32:45'),
	('192.168.1.5', 22, 0, '2018-03-15 20:32:45'),
	('192.168.1.6', 22, 0, '2018-03-15 20:32:45'),
	('192.168.1.4', 23, 0, '2018-03-15 20:32:45'),
	('192.168.1.4', 22, 0, '2018-03-15 20:32:46'),
	('192.168.1.4', 21, 0, '2018-03-15 20:32:46'),
	('192.168.1.6', 23, 0, '2018-03-15 20:32:46'),
	('192.168.1.6', 21, 0, '2018-03-15 20:32:46');
/*!40000 ALTER TABLE `socket_results` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
