-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.10 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para a3life
CREATE DATABASE IF NOT EXISTS `a3life` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `a3life`;


-- Volcando estructura para procedimiento a3life.deleteDeadVehicles
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END//
DELIMITER ;


-- Volcando estructura para procedimiento a3life.deleteOldGangs
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
	DELETE FROM `gangs` WHERE `active` = 0;
END//
DELIMITER ;


-- Volcando estructura para procedimiento a3life.deleteOldHouses
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END//
DELIMITER ;


-- Volcando estructura para tabla a3life.gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla a3life.gangs: ~0 rows (aproximadamente)
DELETE FROM `gangs`;
/*!40000 ALTER TABLE `gangs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gangs` ENABLE KEYS */;


-- Volcando estructura para tabla a3life.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla a3life.houses: ~0 rows (aproximadamente)
DELETE FROM `houses`;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;


-- Volcando estructura para tabla a3life.market
CREATE TABLE IF NOT EXISTS `market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prices` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla a3life.market: ~1 rows (aproximadamente)
DELETE FROM `market`;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` (`id`, `prices`) VALUES
	(1, '[304,0,1000,124,413,649,1000,45,326,152,425,0,115,157,508,0,228,246,635,0,487,103,428,20,0,0,0,73,116,0,16,0,6,1,200,29,151,176,0,0,0,0]');
/*!40000 ALTER TABLE `market` ENABLE KEYS */;


-- Volcando estructura para tabla a3life.players
CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `experiencia` text,
  `jailtime` int(100) DEFAULT '0',
  `arrestreason` text,
  `op_licenses` text,
  `op_gear` text NOT NULL,
  `oplevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `mafialvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `terrolvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla a3life.players: ~1 rows (aproximadamente)
DELETE FROM `players`;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`uid`, `name`, `playerid`, `cash`, `bankacc`, `coplevel`, `cop_licenses`, `civ_licenses`, `med_licenses`, `cop_gear`, `med_gear`, `mediclevel`, `arrested`, `aliases`, `adminlevel`, `donatorlvl`, `civ_gear`, `experiencia`, `jailtime`, `arrestreason`, `op_licenses`, `op_gear`, `oplevel`, `mafialvl`, `terrolvl`) VALUES
	(15, 'barra', '_SP_PLAYER_', 0, 2500, '0', '"[]"', '"[]"', '"[]"', '"[]"', '"[]"', '0', 0, '"[``barra``]"', '0', '0', '"[]"', '"[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]"', 0, '""', '"[]"', '"[]"', '0', '0', '0');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;


-- Volcando estructura para tabla a3life.politica
CREATE TABLE IF NOT EXISTS `politica` (
  `id` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `votos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla a3life.politica: ~0 rows (aproximadamente)
DELETE FROM `politica`;
/*!40000 ALTER TABLE `politica` DISABLE KEYS */;
/*!40000 ALTER TABLE `politica` ENABLE KEYS */;


-- Volcando estructura para tabla a3life.politicados
CREATE TABLE IF NOT EXISTS `politicados` (
  `votantes` varchar(50) DEFAULT NULL,
  `candidato` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla a3life.politicados: ~0 rows (aproximadamente)
DELETE FROM `politicados`;
/*!40000 ALTER TABLE `politicados` DISABLE KEYS */;
/*!40000 ALTER TABLE `politicados` ENABLE KEYS */;


-- Volcando estructura para procedimiento a3life.resetLifeVehicles
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE vehicles SET `active`= 0;
END//
DELIMITER ;


-- Volcando estructura para tabla a3life.storages
CREATE TABLE IF NOT EXISTS `storages` (
  `pid` varchar(32) NOT NULL,
  `inventario` text,
  `capacidad` int(4) NOT NULL,
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla a3life.storages: ~0 rows (aproximadamente)
DELETE FROM `storages`;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;


-- Volcando estructura para tabla a3life.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` varchar(8) NOT NULL,
  `color` int(20) NOT NULL,
  `fuel` varchar(16) NOT NULL DEFAULT '"1"',
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla a3life.vehicles: ~0 rows (aproximadamente)
DELETE FROM `vehicles`;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;


-- Volcando estructura para tabla a3life.wanted
CREATE TABLE IF NOT EXISTS `wanted` (
  `list` text,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla a3life.wanted: ~0 rows (aproximadamente)
DELETE FROM `wanted`;
/*!40000 ALTER TABLE `wanted` DISABLE KEYS */;
/*!40000 ALTER TABLE `wanted` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
