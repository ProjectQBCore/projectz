CREATE DATABASE IF NOT EXISTS `essentialmode` /* Your db name */;
USE `essentialmode` /* Your db name */;

CREATE TABLE IF NOT EXISTS `crafting_formulas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL DEFAULT '0',
  `formula` varchar(50) NOT NULL DEFAULT '0',
  `materials` longtext NOT NULL DEFAULT '0',
  `product` varchar(50) NOT NULL DEFAULT '0',
  `amount` int(11) DEFAULT 1,
  `time` int(11) NOT NULL DEFAULT 0,
  `reqzone` varchar(50) DEFAULT 'false',
  `type` varchar(50) DEFAULT NULL,
  `reqjob` varchar(50) DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO `crafting_formulas` (`id`, `category`, `formula`, `materials`, `product`, `amount`, `time`, `reqzone`, `type`, `reqjob`) VALUES
	(1, 'Food', 'false', '[{"name":"meat","amount":1}]', 'steak', 1, 5, 'true', 'item', 'false'),
	(2, 'Other', 'false', '[{"name":"wood","amount":5}]', 'campfire', 1, 5, 'false', 'item', 'false');

CREATE TABLE IF NOT EXISTS `crafting_formulas_players` (
  `identifier` varchar(50) NOT NULL,
  `formulas` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`identifier`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `crafting_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorys` longtext NOT NULL DEFAULT '[]',
  `coords` longtext NOT NULL DEFAULT '[]',
  `objects` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO `crafting_zones` (`id`, `categorys`, `coords`, `objects`) VALUES
	(1, '["Food"]', '{}', '{"prop_beach_fire","prop_bbq_1"}');
