-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               10.1.31-MariaDB - mariadb.org binary distribution
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
  `lp` int(11) DEFAULT NULL COMMENT 'numer porządkowy ',
  `lp_str` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL COMMENT 'ostatni oktet adresu ip'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Tabea dla geneeraatora zapytań w tabeli cerber_plan, Zawera ostatni oktet adresu ip.';

-- Data exporting was unselected.
-- Zrzut struktury tabela cerber.cerber_gen_ip
CREATE TABLE IF NOT EXISTS `cerber_gen_ip` (
  `ip` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `n` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.
-- Zrzut struktury tabela cerber.cerber_gen_port
CREATE TABLE IF NOT EXISTS `cerber_gen_port` (
  `port` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='Tabea dla geneeraatora zapytań w tabeli cerber_plan.  Zawiera porty które chcemy przeskanować dlaa grupy ip z tabeli cerber_gen_ip';

-- Data exporting was unselected.
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
INSERT INTO cerber_plan(ip,nn,unix_start,type,time_cmd) select ip,n,0,"p","2000-01-01" FROM cerber_gen_ip;
INSERT INTO cerber_plan(ip,nn,unix_start,type,time_cmd) select ip,port,0,"s","2000-01-01" FROM cerber_gen_ip,cerber_gen_port;

END//
DELIMITER ;

-- Zrzut struktury tabela cerber.cerber_plan
CREATE TABLE IF NOT EXISTS `cerber_plan` (
  `ip` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nn` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `unix_start` bigint(20) DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `time_cmd` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `time_res` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `minping` int(11) DEFAULT NULL,
  `maxping` int(11) DEFAULT NULL,
  `aveping` int(11) DEFAULT NULL,
  `sent` int(11) DEFAULT NULL,
  `receive` int(11) DEFAULT NULL,
  `lost` int(11) DEFAULT NULL,
  `unreachable` int(11) DEFAULT NULL,
  `erro` int(11) DEFAULT '0',
  `ok_no` int(11) DEFAULT NULL,
  `sess` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Zrzut struktury tabela cerber.cerber_plan_copy
CREATE TABLE IF NOT EXISTS `cerber_plan_copy` (
  `ip` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nn` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `unix_start` bigint(20) DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `time_cmd` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `time_res` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Zrzut struktury tabela cerber.cerber_plan_lp
CREATE TABLE IF NOT EXISTS `cerber_plan_lp` (
  `lp` int(11) DEFAULT NULL,
  `min_lp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.
-- Zrzut struktury procedura cerber.cerber_plan_proc
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cerber_plan_proc`()
BEGIN
DECLARE threads_limit INT;
DECLARE threads_active INT;
DECLARE id_min_v INT;
DECLARE timeout_ress INT;

SET timeout_ress=(SELECT timeout_res FROM cerber_setings LIMIT 1);

UPDATE cerber_plan SET status=0 WHERE status=1 AND round(TIME_TO_SEC(timediff(now(),time_res)))>timeout_ress;
UPDATE cerber_plan_lp SET lp=lp+1;
UPDATE cerber_setings SET dos=0 WHERE dos<0;
UPDATE cerber_setings SET dop=0 WHERE dop<0;
DROP TABLE cerber_plan_temp;
CREATE TABLE `cerber_plan_temp` (
	`ip` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_polish_ci',
	`nn` INT(11) NULL DEFAULT NULL,
	`status` INT(11) NULL DEFAULT '0',
	`unix_start` BIGINT(20) NULL DEFAULT NULL,
	`type` VARCHAR(1) NULL DEFAULT NULL COLLATE 'utf8_polish_ci',
	`time_cmd` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_polish_ci',
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`lp` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_polish_ci'
ENGINE=InnoDB
ROW_FORMAT=COMPACT
AUTO_INCREMENT=1;

SET threads_active=(SELECT count(*) do_zrobienia FROM cerber_plan WHERE status=1 LIMIT 1);
SET threads_limit=(SELECT threads FROM cerber_setings LIMIT 1)-threads_active;
SET threads_limit=(SELECT CASE WHEN threads_limit<0 THEN 0 ELSE threads_limit END LIMIT 1);

INSERT INTO cerber_plan_temp(ip,nn,status,unix_start,type,time_cmd,lp) SELECT ip,nn,status,unix_start,type,time_cmd,t2.lp FROM cerber_plan t1,cerber_plan_lp t2 WHERE status=0 AND time_cmd<now() ORDER BY time_cmd ASC,type LIMIT threads_limit;
UPDATE cerber_plan_temp t1,cerber_plan t2 SET t2.status=1,time_res=now() WHERE t1.ip=t2.ip AND t1.unix_start=t2.unix_start AND t1.type=t2.type;
SET id_min_v=(select min(id)-1 min_lp FROM cerber_plan_temp t1,cerber_plan_lp t2 WHERE t1.lp=t2.lp limit 1);
UPDATE cerber_plan_lp SET min_lp=id_min_v;

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
  `time_cmd` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Zrzut struktury tabela cerber.cerber_setings
CREATE TABLE IF NOT EXISTS `cerber_setings` (
  `threads` int(11) DEFAULT NULL,
  `dos` int(11) DEFAULT NULL,
  `dop` int(11) DEFAULT NULL,
  `timeout_res` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.
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
  `timedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_cmd` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `time_res` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.
-- Zrzut struktury procedura cerber.save_res_ping
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `save_res_ping`(
	IN `ddest` VARCHAR(50),
	IN `mminping` INT,
	IN `mmaxping` INT,
	IN `aaveping` INT,
	IN `ssent` INT,
	IN `rreceive` INT,
	IN `llost` INT,
	IN `uunreachable` INT,
	IN `eerro` INT,
	IN `ttime_cmd` VARCHAR(50),
	IN `ttime_res` VARCHAR(50)





)
BEGIN
UPDATE cerber_plan SET minping=mminping,maxping=mmaxping,aveping=aaveping,sent=ssent,receive=rreceive,lost=llost,unreachable=uunreachable,erro=eerro,time_res=ttime_res WHERE time_cmd=ttime_cmd AND ddest=ip AND type='p';
END//
DELIMITER ;

-- Zrzut struktury procedura cerber.save_res_sock
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `save_res_sock`(
	IN `ddest` VARCHAR(50),
	IN `pport` INT,
	IN `ook_no` INT,
	IN `ttime_cmd` VARCHAR(50),
	IN `ttime_res` VARCHAR(50)






)
BEGIN
UPDATE cerber_plan SET ok_no=ook_no,time_res=ttime_res WHERE time_cmd=ttime_cmd AND ddest=ip AND type='s' AND nn=pport;
END//
DELIMITER ;

-- Zrzut struktury tabela cerber.socket_results
CREATE TABLE IF NOT EXISTS `socket_results` (
  `ip` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `ok_no` int(11) DEFAULT NULL,
  `timedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `time_cmd` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `time_res` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Data exporting was unselected.
-- Zrzut struktury procedura cerber.xxxxxx
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `xxxxxx`()
BEGIN
DECLARE threads_limit INT;
DECLARE threads_active INT;
DECLARE id_min_v INT;
UPDATE cerber_plan_lp SET lp=lp+1;

UPDATE cerber_setings SET dos=0 WHERE dos<0;
UPDATE cerber_setings SET dop=0 WHERE dop<0;

DROP TABLE cerber_plan_temp;
CREATE TABLE `cerber_plan_temp` (
	`ip` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_polish_ci',
	`nn` INT(11) NULL DEFAULT NULL,
	`status` INT(11) NULL DEFAULT '0',
	`unix_start` BIGINT(20) NULL DEFAULT NULL,
	`type` VARCHAR(1) NULL DEFAULT NULL COLLATE 'utf8_polish_ci',
	`time_cmd` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_polish_ci',
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`lp` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_polish_ci'
ENGINE=InnoDB
ROW_FORMAT=COMPACT
AUTO_INCREMENT=1;

SET threads_active=(SELECT count(*) do_zrobienia FROM cerber_plan WHERE status=1 LIMIT 1);
SET threads_limit=(SELECT threads FROM cerber_setings LIMIT 1)-threads_active;

INSERT INTO cerber_plan_temp(ip,nn,status,unix_start,type,time_cmd,lp) SELECT ip,nn,status,unix_start,type,time_cmd,t2.lp FROM cerber_plan t1,cerber_plan_lp t2 WHERE status=0 AND time_cmd<now() ORDER BY time_cmd ASC,type LIMIT threads_limit;
UPDATE cerber_plan_temp t1,cerber_plan t2 SET t2.status=1,time_res=now() WHERE t1.ip=t2.ip AND t1.unix_start=t2.unix_start AND t1.type=t2.type;
SET id_min_v=(select min(id)-1 min_lp FROM cerber_plan_temp t1,cerber_plan_lp t2 WHERE t1.lp=t2.lp limit 1);
UPDATE cerber_plan_lp SET min_lp=id_min_v;

UPDATE cerber_setings SET dop=(SELECT (CASE WHEN count(*) IS NULL THEN 0 ELSE count(*) END) dop FROM cerber_plan_temp WHERE type='p');
UPDATE cerber_setings SET dos=(SELECT (CASE WHEN count(*) IS NULL THEN 0 ELSE count(*) END) dos FROM cerber_plan_temp WHERE type='s');

UPDATE cerber_setings SET dos=threads_limit WHERE dos>=threads_limit;
UPDATE cerber_setings SET dos=threads_limit WHERE dos>=threads_limit;

END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
