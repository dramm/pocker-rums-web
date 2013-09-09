-- Adminer 3.7.1 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+03:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `bet_hand`;
CREATE TABLE `bet_hand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор ставки на руку',
  `id_bet_stage` int(10) unsigned NOT NULL COMMENT 'Идентификатор стадии на ставке',
  `id_hand` int(10) unsigned NOT NULL COMMENT 'Идентификатор руки на столе',
  `factor` float unsigned NOT NULL COMMENT 'Коефициент руки',
  `date_bet` datetime NOT NULL COMMENT 'Дата ставки',
  `cart_one` int(10) unsigned NOT NULL COMMENT 'Первая карта',
  `cart_two` int(10) unsigned NOT NULL COMMENT 'Вторая карта',
  `sum` decimal(11,2) unsigned NOT NULL COMMENT 'Сумма ставки',
  `win` bit(1) NOT NULL COMMENT 'Индикатор выигрыша',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Ставка на руку';

INSERT INTO `bet_hand` (`id`, `id_bet_stage`, `id_hand`, `factor`, `date_bet`, `cart_one`, `cart_two`, `sum`, `win`) VALUES
(1,	1,	2,	3.78,	'2013-09-09 20:55:44',	6,	38,	19.50,	CONV('0', 2, 10) + 0),
(2,	1,	3,	3.26,	'2013-09-09 20:55:57',	33,	34,	19.50,	CONV('0', 2, 10) + 0),
(3,	2,	1,	3.29,	'2013-09-09 20:56:24',	48,	50,	19.50,	CONV('0', 2, 10) + 0),
(4,	3,	2,	5.04,	'2013-09-09 20:56:40',	50,	11,	19.50,	CONV('0', 2, 10) + 0),
(5,	4,	2,	2.46,	'2013-09-09 21:21:39',	17,	9,	13.00,	CONV('0', 2, 10) + 0),
(6,	5,	1,	5.7,	'2013-09-09 21:21:59',	16,	47,	13.00,	CONV('0', 2, 10) + 0),
(7,	6,	3,	7.47,	'2013-09-09 21:22:22',	5,	42,	13.00,	CONV('0', 2, 10) + 0);

DROP TABLE IF EXISTS `bet_stage`;
CREATE TABLE `bet_stage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор ставки на стол',
  `id_bet_table` int(10) unsigned NOT NULL COMMENT 'Идентификатор стола на ставке',
  `stage` int(10) unsigned NOT NULL COMMENT 'Идентификатор стадии',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Ставка на стадии';

INSERT INTO `bet_stage` (`id`, `id_bet_table`, `stage`) VALUES
(1,	2,	1),
(2,	3,	1),
(3,	4,	1),
(4,	5,	1),
(5,	6,	1),
(6,	7,	1);

DROP TABLE IF EXISTS `bet_table`;
CREATE TABLE `bet_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор записи',
  `id_bet` int(10) unsigned NOT NULL COMMENT 'Идентификатор ставки из таблицы user_bet',
  `id_table` int(10) unsigned NOT NULL COMMENT 'Идентификатор стола',
  `flop_one` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор первой карта на флопе',
  `flop_two` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор второй карты на флопе',
  `flop_three` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор третьей карты на флопе',
  `tern` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор карты на терне',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Ставки на столе';

INSERT INTO `bet_table` (`id`, `id_bet`, `id_table`, `flop_one`, `flop_two`, `flop_three`, `tern`) VALUES
(1,	2,	0,	0,	0,	0,	0),
(2,	3,	0,	0,	0,	0,	0),
(3,	3,	1,	0,	0,	0,	0),
(4,	3,	2,	0,	0,	0,	0),
(5,	5,	0,	0,	0,	0,	0),
(6,	5,	1,	0,	0,	0,	0),
(7,	5,	2,	0,	0,	0,	0);

DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор карты(Добавленно)',
  `suits_id` int(11) unsigned NOT NULL COMMENT 'Идентификатор масти',
  `dignitys_id` int(11) unsigned NOT NULL COMMENT 'Идентификатор достоинства',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Карты';

INSERT INTO `cards` (`id`, `suits_id`, `dignitys_id`) VALUES
(1,	1,	2),
(2,	2,	2),
(3,	3,	2),
(4,	4,	2),
(5,	1,	3),
(6,	2,	3),
(7,	3,	3),
(8,	4,	3),
(9,	1,	4),
(10,	2,	4),
(11,	3,	4),
(12,	4,	4),
(13,	1,	5),
(14,	2,	5),
(15,	3,	5),
(16,	4,	5),
(17,	1,	6),
(18,	2,	6),
(19,	3,	6),
(20,	4,	6),
(21,	1,	7),
(22,	2,	7),
(23,	3,	7),
(24,	4,	7),
(25,	1,	8),
(26,	2,	8),
(27,	3,	8),
(28,	4,	8),
(29,	1,	9),
(30,	2,	9),
(31,	3,	9),
(32,	4,	9),
(33,	1,	10),
(34,	2,	10),
(35,	3,	10),
(36,	4,	10),
(37,	1,	11),
(38,	2,	11),
(39,	3,	11),
(40,	4,	11),
(41,	1,	12),
(42,	2,	12),
(43,	3,	12),
(44,	4,	12),
(45,	1,	13),
(46,	2,	13),
(47,	3,	13),
(48,	4,	13),
(49,	1,	14),
(50,	2,	14),
(51,	3,	14),
(52,	4,	14);

DROP TABLE IF EXISTS `log_money_transaction`;
CREATE TABLE `log_money_transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор лога',
  `id_user` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `sum` decimal(9,2) unsigned NOT NULL COMMENT 'Запрошенная сумма',
  `current_balance` decimal(9,2) unsigned NOT NULL COMMENT 'Состояние баланса в момент запроса выдачи средств',
  `date_request` datetime NOT NULL COMMENT 'Время в момент запроса средств',
  `user_agent` varchar(200) NOT NULL COMMENT 'юзер агент пользователя в момент запроса',
  `ip_user` int(10) unsigned NOT NULL COMMENT 'ip адрес пользователя в момент запроса',
  `date_starting_response` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Дата начала выполнения выдачи средств пользователю',
  `id_manager` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор менеджера инициализировавшего выдачу средств',
  `ip_manager` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ip адрес менеджера в момент инициализации выдачи средств',
  `balance_starting_response` decimal(9,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Баланс пользователя в момент инициализации выдачи средств',
  `date_completed` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Дата окончания транзакции',
  `balance_completed_response` decimal(9,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Баланс пользователя после выдачи средств',
  `manager_agent` varchar(200) NOT NULL DEFAULT '' COMMENT 'юзер агент менеджера инициализировавшего выдачу средств',
  `comment` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Коментарий к оплате',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Таблица логирования обработки выдачи средств';

INSERT INTO `log_money_transaction` (`id`, `id_user`, `sum`, `current_balance`, `date_request`, `user_agent`, `ip_user`, `date_starting_response`, `id_manager`, `ip_manager`, `balance_starting_response`, `date_completed`, `balance_completed_response`, `manager_agent`, `comment`) VALUES
(1,	7,	20.00,	9000000.00,	'2013-08-04 03:16:55',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'2013-08-06 22:17:52',	7,	2130706433,	8999917.80,	'2013-08-08 22:52:46',	8999765.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	''),
(2,	7,	2.00,	8999920.00,	'2013-08-04 19:33:46',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'2013-08-06 22:17:52',	7,	2130706433,	8999917.80,	'2013-08-08 22:52:46',	8999765.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	''),
(3,	7,	0.20,	8999918.00,	'2013-08-05 01:50:06',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'2013-08-06 22:17:52',	7,	2130706433,	8999917.80,	'2013-08-08 22:52:46',	8999765.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	''),
(4,	7,	32.00,	8999917.80,	'2013-08-05 19:12:58',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'2013-08-06 22:41:49',	7,	2130706433,	8999821.80,	'2013-08-08 22:52:46',	8999765.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'какой-то комент №0'),
(5,	1,	2.00,	4537.00,	'2013-08-05 19:52:00',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'2013-08-08 22:44:12',	7,	2130706433,	4537.00,	'2013-08-08 22:44:12',	4535.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'ytreytre'),
(6,	7,	0.80,	8999821.80,	'2013-08-06 22:43:35',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-06 22:43:44',	7,	2130706433,	8999821.80,	'2013-08-08 22:52:46',	8999765.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'какой-то комент №0'),
(7,	7,	0.80,	8999821.80,	'2013-08-06 22:46:30',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-06 22:46:37',	7,	2130706433,	8999821.80,	'2013-08-08 22:52:46',	8999765.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'какой-то комент №0'),
(8,	7,	23.00,	8999821.00,	'2013-08-08 22:45:37',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 22:52:18',	7,	2130706433,	8999821.00,	'2013-08-08 22:52:46',	8999765.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'432'),
(9,	7,	33.00,	8999798.00,	'2013-08-08 22:52:31',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 22:52:46',	7,	2130706433,	8999798.00,	'2013-08-08 22:52:46',	8999765.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'1111'),
(10,	7,	2.00,	8999765.00,	'2013-08-08 22:58:57',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 23:10:11',	7,	2130706433,	8999765.00,	'1999-01-01 00:00:00',	0.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'null'),
(11,	7,	121.00,	8999763.00,	'2013-08-08 23:10:22',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 23:10:35',	7,	2130706433,	8999763.00,	'1999-01-01 00:00:00',	0.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'null'),
(12,	7,	2.00,	8999642.00,	'2013-08-08 23:14:36',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 23:14:46',	7,	2130706433,	8999642.00,	'1999-01-01 00:00:00',	0.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'4333'),
(13,	7,	32.00,	8999640.00,	'2013-08-08 23:15:31',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 23:15:42',	7,	2130706433,	8999640.00,	'1999-01-01 00:00:00',	0.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'efrefsda'),
(14,	7,	223.00,	8999608.00,	'2013-08-08 23:16:37',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 23:16:47',	7,	2130706433,	8999608.00,	'1999-01-01 00:00:00',	0.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'1121'),
(15,	7,	212.00,	8999385.00,	'2013-08-08 23:17:53',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 23:22:01',	7,	2130706433,	8999385.00,	'1999-01-01 00:00:00',	0.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'У казино кончились деньги'),
(16,	7,	212.00,	8999385.00,	'2013-08-08 23:22:36',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	2130706433,	'2013-08-08 23:23:03',	7,	2130706433,	8999385.00,	'1999-01-01 00:00:00',	0.00,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0',	'отлично');

DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info` (
  `id_user` int(11) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `passport` varchar(200) NOT NULL COMMENT 'Паспорт',
  `pay_sys` int(11) unsigned NOT NULL COMMENT 'Платежная система',
  `score` varchar(200) NOT NULL COMMENT 'Счет',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Платежная информация';

INSERT INTO `payment_info` (`id_user`, `passport`, `pay_sys`, `score`) VALUES
(5,	'4355',	2,	'1'),
(6,	'',	1,	''),
(7,	'серия и номер',	0,	'номер платежки'),
(8,	'',	0,	'');

DROP TABLE IF EXISTS `pay_sys`;
CREATE TABLE `pay_sys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор системы',
  `title` varchar(200) NOT NULL COMMENT 'Название системы',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Платежные системы';

INSERT INTO `pay_sys` (`id`, `title`) VALUES
(1,	'Visa'),
(2,	'WebMoney'),
(3,	'YandexMoney'),
(4,	'PayPal'),
(5,	'MasterCard'),
(6,	'QIWI');

DROP TABLE IF EXISTS `request_edit_user_info`;
CREATE TABLE `request_edit_user_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор запроса на изменение',
  `id_user` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `type` int(10) unsigned NOT NULL COMMENT 'Тип запроса',
  `date_request` datetime NOT NULL COMMENT 'Дата запроса',
  `date_response` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Дата обработки',
  `data` varchar(200) NOT NULL COMMENT 'Новые данные',
  `processed` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Статус обработки',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='данные требующие подтверждения';

INSERT INTO `request_edit_user_info` (`id`, `id_user`, `type`, `date_request`, `date_response`, `data`, `processed`) VALUES
(1,	8,	5,	'2013-07-31 20:58:06',	'2013-07-31 20:58:58',	'0',	CONV('1', 2, 10) + 0);

DROP TABLE IF EXISTS `request_out_money`;
CREATE TABLE `request_out_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор заявки',
  `id_user` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `sum` decimal(9,2) unsigned NOT NULL COMMENT 'Запрошенная сумма',
  `data_request` datetime NOT NULL COMMENT 'Время подачи заявки',
  `balance_request` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT 'Баланс пользователя во время запроса средств',
  `data_response` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Время выдачи средств',
  `balance_response` decimal(9,2) NOT NULL DEFAULT '0.00' COMMENT 'Баланс после произведения выплаты',
  `id_manager` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор менеджера выдавшего средства',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Текущий статус оплаты',
  `comment` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Заявки на выплату средств';

INSERT INTO `request_out_money` (`id`, `id_user`, `sum`, `data_request`, `balance_request`, `data_response`, `balance_response`, `id_manager`, `status`, `comment`) VALUES
(1,	7,	20.00,	'2013-08-04 03:16:55',	9000000.00,	'2013-08-04 03:56:16',	8999920.00,	7,	2,	''),
(2,	7,	2.00,	'2013-08-04 19:33:46',	8999920.00,	'2013-08-05 00:24:12',	8999918.00,	7,	2,	''),
(3,	7,	0.20,	'2013-08-05 01:50:06',	8999918.00,	'2013-08-05 01:50:19',	8999917.80,	7,	2,	''),
(4,	7,	32.00,	'2013-08-05 19:12:58',	8999917.80,	'2013-08-06 22:41:49',	8999821.80,	7,	1,	'какой-то комент №0'),
(5,	1,	2.00,	'2013-08-05 19:52:00',	4537.00,	'2013-08-08 22:44:12',	4535.00,	7,	1,	'ytreytre'),
(6,	7,	0.80,	'2013-08-06 22:43:35',	8999821.80,	'2013-08-06 22:43:44',	8999821.80,	7,	1,	'какой-то комент №0'),
(7,	7,	0.80,	'2013-08-06 22:46:30',	8999821.80,	'2013-08-06 22:46:37',	8999821.00,	7,	1,	'какой-то комент №0'),
(8,	7,	23.00,	'2013-08-08 22:45:37',	8999821.00,	'2013-08-08 22:52:19',	8999798.00,	7,	1,	'432'),
(9,	7,	33.00,	'2013-08-08 22:52:31',	8999798.00,	'2013-08-08 22:52:46',	8999765.00,	7,	1,	'1111'),
(10,	7,	2.00,	'2013-08-08 22:58:57',	8999765.00,	'2013-08-08 23:10:11',	8999763.00,	7,	2,	'null'),
(11,	7,	121.00,	'2013-08-08 23:10:22',	8999763.00,	'2013-08-08 23:10:35',	8999642.00,	7,	2,	'null'),
(12,	7,	2.00,	'2013-08-08 23:14:36',	8999642.00,	'2013-08-08 23:14:46',	8999640.00,	7,	2,	'4333'),
(13,	7,	32.00,	'2013-08-08 23:15:31',	8999640.00,	'2013-08-08 23:15:42',	8999608.00,	7,	2,	'efrefsda'),
(14,	7,	223.00,	'2013-08-08 23:16:37',	8999608.00,	'2013-08-08 23:16:47',	8999385.00,	7,	2,	'1121'),
(15,	7,	212.00,	'2013-08-08 23:17:53',	8999385.00,	'1999-01-01 00:00:00',	0.00,	7,	3,	'У казино кончились деньги'),
(16,	7,	212.00,	'2013-08-08 23:22:36',	8999385.00,	'2013-08-08 23:23:03',	8999173.00,	7,	2,	'отлично');

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор роли',
  `role_name` varchar(200) NOT NULL COMMENT 'Название роли',
  `comment` varchar(500) NOT NULL COMMENT 'Коментарий',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Роли пользователей';

INSERT INTO `roles` (`id`, `role_name`, `comment`) VALUES
(1,	'admin',	'Администраторы'),
(2,	'manager',	'Менеджеры'),
(3,	'user',	'Пользователи');

DROP TABLE IF EXISTS `status_processing`;
CREATE TABLE `status_processing` (
  `id` int(10) unsigned NOT NULL COMMENT 'Идентификатор статуса обработки',
  `title` varchar(200) NOT NULL COMMENT 'Название статуса обработки',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Статусы обработки транзакций';

INSERT INTO `status_processing` (`id`, `title`) VALUES
(0,	'not running'),
(1,	'running'),
(2,	'completed'),
(3,	'canceled');

DROP TABLE IF EXISTS `stat_logins`;
CREATE TABLE `stat_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `user_id` int(11) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `login_time` datetime NOT NULL COMMENT 'Время входа',
  `logout` datetime NOT NULL COMMENT 'Время выхода',
  `ip` int(10) unsigned NOT NULL COMMENT 'ip адресс пользователя',
  `user_agent` varchar(200) NOT NULL COMMENT 'юзер-агент пользователя',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Статистика авторизаций';

INSERT INTO `stat_logins` (`id`, `user_id`, `login_time`, `logout`, `ip`, `user_agent`) VALUES
(1,	7,	'2013-07-31 15:30:28',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(2,	8,	'2013-07-31 15:32:09',	'2013-07-31 15:32:28',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(3,	8,	'2013-07-31 15:37:46',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(4,	7,	'2013-07-31 16:10:38',	'2013-07-31 16:32:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(5,	7,	'2013-07-31 17:12:42',	'2013-07-31 17:14:16',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(6,	7,	'2013-07-31 17:14:28',	'2013-07-31 17:15:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(7,	8,	'2013-07-31 17:16:01',	'2013-07-31 17:17:21',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(8,	7,	'2013-07-31 18:07:14',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(9,	7,	'2013-07-31 18:10:48',	'2013-07-31 18:12:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(10,	7,	'2013-07-31 18:13:08',	'2013-07-31 18:17:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(11,	7,	'2013-07-31 18:18:19',	'2013-07-31 18:20:39',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(12,	7,	'2013-07-31 18:21:10',	'2013-07-31 18:22:15',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(13,	7,	'2013-07-31 18:22:52',	'2013-07-31 18:26:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(14,	7,	'2013-07-31 18:27:04',	'2013-07-31 18:28:09',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(15,	7,	'2013-07-31 18:28:39',	'2013-07-31 18:31:11',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(16,	7,	'2013-07-31 18:38:44',	'2013-07-31 18:39:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(17,	7,	'2013-07-31 18:39:58',	'2013-07-31 18:40:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(18,	7,	'2013-07-31 18:41:19',	'2013-07-31 18:44:32',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(19,	7,	'2013-07-31 18:45:02',	'2013-07-31 18:45:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(20,	7,	'2013-07-31 18:46:03',	'2013-07-31 18:57:16',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(21,	7,	'2013-07-31 18:58:20',	'2013-07-31 18:58:56',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(22,	7,	'2013-07-31 19:02:01',	'2013-07-31 19:06:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(23,	7,	'2013-07-31 19:07:24',	'2013-07-31 19:08:27',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(24,	7,	'2013-07-31 19:09:04',	'2013-07-31 19:11:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(25,	7,	'2013-07-31 19:12:57',	'2013-07-31 19:35:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(26,	7,	'2013-07-31 19:36:41',	'2013-07-31 19:39:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(27,	7,	'2013-07-31 19:39:55',	'2013-07-31 19:40:45',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(28,	7,	'2013-07-31 19:41:17',	'2013-07-31 19:42:39',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(29,	7,	'2013-07-31 19:43:14',	'2013-07-31 19:43:56',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(30,	7,	'2013-07-31 19:44:22',	'2013-07-31 19:46:32',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(31,	7,	'2013-07-31 19:47:04',	'2013-07-31 19:55:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(32,	7,	'2013-07-31 19:57:26',	'2013-07-31 19:58:59',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(33,	7,	'2013-07-31 19:59:34',	'2013-07-31 20:03:22',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(34,	7,	'2013-07-31 20:03:50',	'2013-07-31 20:07:56',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(35,	7,	'2013-07-31 20:08:34',	'2013-07-31 20:09:24',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(36,	7,	'2013-07-31 20:09:52',	'2013-07-31 20:55:27',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(37,	8,	'2013-07-31 20:55:45',	'2013-07-31 20:56:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(38,	8,	'2013-07-31 20:56:44',	'2013-07-31 20:59:56',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(39,	7,	'2013-07-31 21:00:08',	'2013-07-31 21:07:57',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(40,	7,	'2013-07-31 22:41:51',	'2013-08-01 03:15:08',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(41,	7,	'2013-08-01 14:25:46',	'2013-08-01 14:26:31',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(42,	7,	'2013-08-01 14:26:58',	'2013-08-01 14:28:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(43,	7,	'2013-08-01 14:29:12',	'2013-08-01 14:51:33',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(44,	7,	'2013-08-01 14:52:54',	'2013-08-01 14:55:33',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(45,	7,	'2013-08-01 14:55:50',	'2013-08-01 14:57:56',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(46,	7,	'2013-08-01 14:59:55',	'2013-08-01 15:27:57',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(47,	7,	'2013-08-01 15:28:25',	'2013-08-01 15:31:18',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(48,	7,	'2013-08-01 15:31:48',	'2013-08-01 15:36:11',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(49,	7,	'2013-08-01 15:36:32',	'2013-08-01 15:57:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(50,	7,	'2013-08-01 15:58:01',	'2013-08-01 15:59:02',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(51,	7,	'2013-08-01 15:59:23',	'2013-08-01 16:12:46',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(52,	7,	'2013-08-01 16:15:20',	'2013-08-01 16:16:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(53,	7,	'2013-08-01 16:17:12',	'2013-08-01 16:17:51',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(54,	7,	'2013-08-01 16:18:17',	'2013-08-01 16:37:35',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(55,	7,	'2013-08-01 16:38:05',	'2013-08-01 16:41:49',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(56,	7,	'2013-08-01 16:42:17',	'2013-08-01 16:43:16',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(57,	7,	'2013-08-01 16:43:42',	'2013-08-01 16:48:20',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(58,	7,	'2013-08-01 17:04:29',	'2013-08-01 17:06:04',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(59,	7,	'2013-08-01 17:06:29',	'2013-08-01 17:07:11',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(60,	7,	'2013-08-01 17:07:37',	'2013-08-01 17:09:56',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(61,	7,	'2013-08-01 17:10:20',	'2013-08-01 17:10:34',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(62,	7,	'2013-08-01 17:10:56',	'2013-08-01 17:13:17',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(63,	7,	'2013-08-01 17:13:53',	'2013-08-01 17:15:02',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(64,	7,	'2013-08-01 17:16:30',	'2013-08-01 17:28:01',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(65,	7,	'2013-08-01 17:28:30',	'2013-08-01 17:28:31',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(66,	7,	'2013-08-01 17:28:38',	'2013-08-01 17:30:11',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(67,	7,	'2013-08-01 17:30:38',	'2013-08-01 17:31:03',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(68,	7,	'2013-08-01 17:31:26',	'2013-08-01 17:32:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(69,	7,	'2013-08-01 17:33:15',	'2013-08-01 17:33:49',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(70,	7,	'2013-08-01 17:37:41',	'2013-08-01 18:29:11',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(71,	7,	'2013-08-01 20:39:30',	'2013-08-01 20:40:47',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(72,	7,	'2013-08-01 20:41:10',	'2013-08-01 20:42:05',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(73,	7,	'2013-08-01 20:42:54',	'2013-08-01 20:46:35',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(74,	7,	'2013-08-01 20:47:27',	'2013-08-01 20:48:05',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(75,	7,	'2013-08-01 20:48:34',	'2013-08-01 20:49:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(76,	7,	'2013-08-01 20:50:12',	'2013-08-01 21:23:28',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(77,	7,	'2013-08-01 21:23:50',	'2013-08-01 21:24:35',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(78,	7,	'2013-08-01 21:24:55',	'2013-08-01 21:27:20',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(79,	7,	'2013-08-01 21:27:50',	'2013-08-01 21:29:24',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(80,	7,	'2013-08-01 21:30:14',	'2013-08-01 21:31:20',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(81,	7,	'2013-08-01 21:31:46',	'2013-08-01 21:32:35',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(82,	7,	'2013-08-01 21:34:55',	'2013-08-01 21:38:13',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(83,	7,	'2013-08-01 21:38:45',	'2013-08-01 21:42:05',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(84,	7,	'2013-08-01 21:42:33',	'2013-08-01 21:43:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(85,	7,	'2013-08-01 21:44:08',	'2013-08-01 21:45:03',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(86,	7,	'2013-08-01 21:47:27',	'2013-08-01 21:48:31',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(87,	7,	'2013-08-01 21:49:01',	'2013-08-01 21:50:01',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(88,	7,	'2013-08-01 21:50:33',	'2013-08-01 21:54:18',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(89,	7,	'2013-08-01 21:54:46',	'2013-08-01 21:57:11',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(90,	7,	'2013-08-01 21:58:49',	'2013-08-01 22:02:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(91,	7,	'2013-08-01 22:03:22',	'2013-08-01 22:04:05',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(92,	7,	'2013-08-01 22:04:36',	'2013-08-01 22:09:11',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(93,	7,	'2013-08-01 22:20:15',	'2013-08-01 22:22:07',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(94,	7,	'2013-08-01 22:22:37',	'2013-08-01 22:24:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(95,	7,	'2013-08-01 22:24:56',	'2013-08-01 22:29:35',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(96,	7,	'2013-08-01 22:30:02',	'2013-08-01 22:51:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(97,	7,	'2013-08-02 21:14:57',	'2013-08-02 21:19:03',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(98,	7,	'2013-08-02 21:19:41',	'2013-08-02 21:21:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(99,	7,	'2013-08-02 21:21:50',	'2013-08-02 21:36:22',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(100,	7,	'2013-08-02 22:46:21',	'2013-08-03 12:57:59',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(101,	7,	'2013-08-04 03:05:27',	'2013-08-04 03:07:01',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(102,	7,	'2013-08-04 03:10:48',	'2013-08-04 03:12:51',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(103,	7,	'2013-08-04 03:13:13',	'2013-08-04 03:15:45',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(104,	7,	'2013-08-04 03:16:40',	'2013-08-04 03:17:58',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(105,	7,	'2013-08-04 03:18:25',	'2013-08-04 03:19:12',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(106,	7,	'2013-08-04 03:19:55',	'2013-08-04 03:22:58',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(107,	7,	'2013-08-04 03:23:27',	'2013-08-04 03:32:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(108,	7,	'2013-08-04 03:33:03',	'2013-08-04 03:34:17',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(109,	7,	'2013-08-04 03:34:48',	'2013-08-04 03:35:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(110,	7,	'2013-08-04 03:36:34',	'2013-08-04 03:41:40',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(111,	7,	'2013-08-04 03:42:21',	'2013-08-04 03:44:55',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(112,	7,	'2013-08-04 03:45:18',	'2013-08-04 03:46:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(113,	7,	'2013-08-04 03:49:10',	'2013-08-04 03:53:51',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(114,	7,	'2013-08-04 03:54:41',	'2013-08-04 03:55:29',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(115,	7,	'2013-08-04 03:56:09',	'2013-08-04 04:10:51',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(116,	7,	'2013-08-04 04:13:59',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(117,	7,	'2013-08-04 04:14:48',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(118,	7,	'2013-08-04 04:21:06',	'2013-08-04 04:21:07',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(119,	7,	'2013-08-04 19:33:32',	'2013-08-04 19:37:06',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(120,	7,	'2013-08-04 19:37:33',	'2013-08-04 19:38:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(121,	7,	'2013-08-04 19:41:28',	'2013-08-04 19:44:30',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(122,	7,	'2013-08-04 19:45:03',	'2013-08-04 19:46:51',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(123,	7,	'2013-08-04 19:47:25',	'2013-08-04 22:14:58',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(124,	7,	'2013-08-04 23:39:15',	'2013-08-04 23:39:34',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(125,	7,	'2013-08-05 00:10:38',	'2013-08-05 00:10:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(126,	7,	'2013-08-05 00:23:58',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(127,	7,	'2013-08-05 01:10:37',	'2013-08-05 01:11:19',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(128,	7,	'2013-08-05 01:11:36',	'2013-08-05 01:13:52',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(129,	7,	'2013-08-05 01:14:20',	'2013-08-05 01:14:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(130,	7,	'2013-08-05 01:42:58',	'2013-08-05 01:45:09',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(131,	7,	'2013-08-05 01:46:03',	'2013-08-05 01:46:53',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(132,	7,	'2013-08-05 01:49:54',	'2013-08-05 01:50:35',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(133,	7,	'2013-08-05 01:57:13',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(134,	7,	'2013-08-05 01:59:20',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(135,	7,	'2013-08-05 18:05:47',	'2013-08-05 18:06:35',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(136,	7,	'2013-08-05 18:07:14',	'2013-08-05 18:08:32',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(137,	7,	'2013-08-05 18:08:59',	'2013-08-05 18:13:05',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(138,	7,	'2013-08-05 18:13:35',	'2013-08-05 18:32:09',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(139,	7,	'2013-08-05 19:12:47',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(140,	1,	'2013-08-05 19:13:15',	'2013-08-05 19:15:32',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(141,	1,	'2013-08-05 19:15:51',	'2013-08-05 19:16:47',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(142,	1,	'2013-08-05 19:17:15',	'2013-08-05 19:18:34',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(143,	7,	'2013-08-05 19:19:07',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(144,	1,	'2013-08-05 19:19:23',	'2013-08-05 19:19:55',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(145,	1,	'2013-08-05 19:20:16',	'2013-08-05 19:22:10',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(146,	1,	'2013-08-05 19:22:42',	'2013-08-05 19:24:59',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(147,	1,	'2013-08-05 19:25:35',	'2013-08-05 19:32:22',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(148,	1,	'2013-08-05 19:33:04',	'2013-08-05 19:33:37',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(149,	1,	'2013-08-05 19:34:11',	'2013-08-05 19:36:43',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(150,	1,	'2013-08-05 19:37:13',	'2013-08-05 19:44:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(151,	1,	'2013-08-05 19:47:43',	'2013-08-05 19:49:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(152,	1,	'2013-08-05 19:50:16',	'2013-08-05 19:51:18',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(153,	1,	'2013-08-05 19:51:40',	'2013-08-05 19:54:52',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(154,	1,	'2013-08-05 19:55:28',	'2013-08-05 19:57:45',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(155,	1,	'2013-08-05 19:58:11',	'2013-08-05 19:58:59',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(156,	1,	'2013-08-05 19:59:29',	'2013-08-05 20:00:16',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(157,	1,	'2013-08-05 20:00:54',	'2013-08-05 20:02:44',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(158,	1,	'2013-08-05 20:03:09',	'2013-08-05 20:03:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(159,	1,	'2013-08-05 20:03:41',	'2013-08-05 20:14:14',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(160,	1,	'2013-08-05 20:14:46',	'2013-08-05 20:15:18',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(161,	1,	'2013-08-05 20:15:50',	'2013-08-05 20:45:08',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(162,	1,	'2013-08-05 20:45:44',	'2013-08-05 20:48:16',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(163,	1,	'2013-08-05 20:48:49',	'2013-08-05 20:49:36',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(164,	1,	'2013-08-05 20:50:13',	'2013-08-05 20:52:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(165,	1,	'2013-08-05 20:52:28',	'2013-08-05 20:53:31',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(166,	1,	'2013-08-05 20:54:06',	'2013-08-05 21:31:42',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(167,	1,	'2013-08-05 21:49:43',	'2013-08-05 21:51:08',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(168,	1,	'2013-08-05 21:51:40',	'2013-08-05 21:54:23',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(169,	1,	'2013-08-05 21:54:49',	'2013-08-05 22:22:08',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(170,	1,	'2013-08-05 22:22:41',	'2013-08-05 22:25:13',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(171,	1,	'2013-08-05 22:25:34',	'2013-08-05 22:35:21',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(172,	1,	'2013-08-05 22:35:44',	'2013-08-05 22:36:58',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(173,	1,	'2013-08-05 22:37:21',	'2013-08-05 22:39:01',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(174,	1,	'2013-08-05 22:39:28',	'2013-08-05 22:40:45',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(175,	1,	'2013-08-05 22:41:11',	'2013-08-05 22:42:08',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(176,	1,	'2013-08-05 22:42:28',	'2013-08-05 22:43:36',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(177,	1,	'2013-08-05 22:44:09',	'2013-08-05 22:45:13',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(178,	1,	'2013-08-05 22:45:32',	'2013-08-05 22:48:43',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(179,	1,	'2013-08-05 22:49:09',	'2013-08-05 22:49:46',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(180,	1,	'2013-08-05 22:50:11',	'2013-08-05 22:52:08',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(181,	7,	'2013-08-05 22:52:32',	'2013-08-05 22:55:53',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(182,	7,	'2013-08-05 22:56:23',	'2013-08-05 22:57:36',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(183,	7,	'2013-08-05 22:58:13',	'2013-08-05 23:02:06',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(184,	7,	'2013-08-05 23:02:52',	'2013-08-05 23:05:06',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(185,	7,	'2013-08-05 23:05:34',	'2013-08-05 23:06:51',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(186,	1,	'2013-08-05 23:07:00',	'2013-08-05 23:10:09',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(187,	1,	'2013-08-05 23:10:37',	'2013-08-05 23:11:15',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(188,	1,	'2013-08-05 23:11:32',	'2013-08-05 23:21:21',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(189,	7,	'2013-08-05 23:35:47',	'2013-08-05 23:37:21',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(190,	7,	'2013-08-05 23:37:56',	'2013-08-05 23:38:13',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(191,	7,	'2013-08-05 23:39:58',	'2013-08-05 23:42:28',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(192,	1,	'2013-08-05 23:42:36',	'2013-08-05 23:43:13',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(193,	1,	'2013-08-05 23:43:45',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(194,	7,	'2013-08-05 23:44:21',	'2013-08-05 23:44:33',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(195,	1,	'2013-08-05 23:44:41',	'2013-08-05 23:49:33',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(196,	7,	'2013-08-06 19:24:59',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(197,	1,	'2013-08-06 19:25:13',	'2013-08-06 19:25:45',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(198,	7,	'2013-08-06 20:48:30',	'2013-08-06 20:50:03',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(199,	7,	'2013-08-06 20:50:51',	'2013-08-06 20:51:38',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(200,	7,	'2013-08-06 20:52:19',	'2013-08-06 20:58:36',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(201,	7,	'2013-08-06 20:59:12',	'2013-08-06 21:00:45',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(202,	7,	'2013-08-06 21:01:23',	'2013-08-06 21:03:12',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(203,	7,	'2013-08-06 21:03:37',	'2013-08-06 21:06:39',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(204,	7,	'2013-08-06 21:07:06',	'2013-08-06 21:10:38',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(205,	7,	'2013-08-06 21:11:16',	'2013-08-06 21:11:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(206,	7,	'2013-08-06 21:12:30',	'2013-08-06 21:13:33',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(207,	7,	'2013-08-06 21:14:14',	'2013-08-06 21:56:31',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(208,	7,	'2013-08-06 21:57:03',	'2013-08-06 21:57:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(209,	7,	'2013-08-06 21:58:23',	'2013-08-06 21:59:10',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(210,	7,	'2013-08-06 21:59:36',	'2013-08-06 22:06:38',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(211,	7,	'2013-08-06 22:07:08',	'2013-08-06 22:07:55',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(212,	7,	'2013-08-06 22:08:24',	'2013-08-06 22:10:55',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(213,	7,	'2013-08-06 22:11:29',	'2013-08-06 22:13:01',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(214,	7,	'2013-08-06 22:15:20',	'2013-08-06 22:16:37',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(215,	7,	'2013-08-06 22:17:06',	'2013-08-06 22:28:24',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(216,	7,	'2013-08-06 22:33:27',	'2013-08-06 22:34:45',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(217,	7,	'2013-08-06 22:36:25',	'2013-08-06 22:40:15',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(218,	7,	'2013-08-06 22:41:40',	'2013-08-06 22:45:46',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(219,	7,	'2013-08-06 22:46:20',	'2013-08-06 23:25:24',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(220,	7,	'2013-08-06 23:56:17',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(221,	7,	'2013-08-07 04:54:28',	'2013-08-07 05:05:11',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(222,	7,	'2013-08-07 21:01:44',	'2013-08-07 21:02:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(223,	1,	'2013-08-07 21:03:06',	'2013-08-07 21:05:24',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(224,	1,	'2013-08-07 23:29:51',	'2013-08-07 23:34:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(225,	7,	'2013-08-08 04:31:53',	'2013-08-08 04:31:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(226,	7,	'2013-08-08 04:41:32',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(227,	7,	'2013-08-08 04:44:22',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(228,	7,	'2013-08-08 04:46:30',	'2013-08-08 04:46:32',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(229,	7,	'2013-08-08 04:50:15',	'2013-08-08 04:50:17',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(230,	7,	'2013-08-08 04:50:39',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(231,	7,	'2013-08-08 04:52:41',	'2013-08-08 04:52:42',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(232,	7,	'2013-08-08 04:56:17',	'2013-08-08 04:56:18',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(233,	7,	'2013-08-08 04:56:46',	'2013-08-08 04:56:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(234,	7,	'2013-08-08 18:55:54',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(235,	7,	'2013-08-08 18:59:46',	'2013-08-08 18:59:50',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(236,	7,	'2013-08-08 22:03:30',	'2013-08-08 22:05:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(237,	7,	'2013-08-08 22:06:20',	'2013-08-08 22:08:03',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(238,	7,	'2013-08-08 22:08:34',	'2013-08-08 22:12:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(239,	7,	'2013-08-08 22:13:26',	'2013-08-08 22:14:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(240,	7,	'2013-08-08 22:15:01',	'2013-08-08 22:15:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(241,	7,	'2013-08-08 22:15:49',	'2013-08-08 22:17:37',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(242,	7,	'2013-08-08 22:18:04',	'2013-08-08 22:22:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(243,	7,	'2013-08-08 22:23:03',	'2013-08-08 22:27:37',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(244,	7,	'2013-08-08 22:29:51',	'2013-08-08 22:33:34',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(245,	7,	'2013-08-08 22:34:03',	'2013-08-08 22:35:29',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(246,	7,	'2013-08-08 22:36:09',	'2013-08-08 22:36:26',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(247,	7,	'2013-08-08 22:41:04',	'2013-08-08 22:41:51',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(248,	7,	'2013-08-08 22:43:21',	'2013-08-08 22:45:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(249,	7,	'2013-08-08 22:52:03',	'2013-08-08 22:52:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(250,	7,	'2013-08-08 22:58:44',	'2013-08-08 22:59:17',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(251,	7,	'2013-08-08 23:09:55',	'2013-08-08 23:13:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(252,	7,	'2013-08-08 23:14:26',	'2013-08-08 23:14:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(253,	7,	'2013-08-08 23:15:19',	'2013-08-08 23:15:59',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(254,	7,	'2013-08-08 23:16:27',	'2013-08-08 23:17:09',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(255,	7,	'2013-08-08 23:17:42',	'2013-08-08 23:21:02',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(256,	7,	'2013-08-08 23:21:41',	'2013-08-08 23:35:20',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(257,	7,	'2013-08-08 23:35:49',	'2013-08-08 23:38:09',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(258,	7,	'2013-08-08 23:38:45',	'2013-08-08 23:40:02',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(259,	7,	'2013-08-08 23:41:04',	'2013-08-08 23:46:02',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(260,	7,	'2013-08-08 23:47:03',	'2013-08-08 23:48:09',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(261,	7,	'2013-08-08 23:48:41',	'2013-08-08 23:49:21',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(262,	7,	'2013-08-08 23:49:47',	'2013-08-08 23:50:06',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(263,	7,	'2013-08-08 23:50:33',	'2013-08-08 23:52:09',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(264,	7,	'2013-08-08 23:53:10',	'2013-08-08 23:54:02',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(265,	7,	'2013-08-08 23:54:50',	'2013-08-08 23:55:44',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(266,	7,	'2013-08-08 23:56:17',	'2013-08-08 23:57:24',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(267,	7,	'2013-08-08 23:58:20',	'2013-08-08 23:59:38',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(268,	7,	'2013-08-09 17:46:32',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(269,	7,	'2013-08-09 17:48:36',	'2013-08-09 17:49:55',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(270,	7,	'2013-08-09 17:50:29',	'2013-08-09 18:01:20',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(271,	7,	'2013-08-09 18:01:57',	'2013-08-09 18:06:05',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(272,	1,	'2013-09-05 23:16:08',	'2013-09-05 23:18:23',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(273,	1,	'2013-09-05 23:22:50',	'2013-09-05 23:27:05',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(274,	1,	'2013-09-05 23:28:49',	'2013-09-05 23:58:08',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(275,	1,	'2013-09-05 23:59:34',	'2013-09-06 00:05:07',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(276,	1,	'2013-09-06 00:05:48',	'2013-09-06 00:23:21',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(277,	1,	'2013-09-06 00:24:09',	'2013-09-06 00:24:28',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(278,	1,	'2013-09-06 01:10:19',	'2013-09-06 01:12:36',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(279,	1,	'2013-09-06 01:13:58',	'2013-09-06 01:16:46',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(280,	1,	'2013-09-06 01:17:08',	'2013-09-06 01:25:37',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(281,	1,	'2013-09-06 01:41:41',	'2013-09-06 01:43:44',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(282,	1,	'2013-09-06 01:44:24',	'2013-09-06 01:50:10',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(283,	1,	'2013-09-06 01:50:35',	'2013-09-06 01:51:44',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(284,	1,	'2013-09-06 01:55:23',	'2013-09-06 01:58:57',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(285,	1,	'2013-09-06 01:59:20',	'2013-09-06 02:01:38',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(286,	1,	'2013-09-06 02:02:21',	'2013-09-06 02:04:55',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(287,	1,	'2013-09-06 02:06:10',	'2013-09-06 02:12:33',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(288,	1,	'2013-09-06 21:11:56',	'2013-09-06 21:18:30',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(289,	1,	'2013-09-06 21:19:00',	'2013-09-06 21:24:03',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(290,	1,	'2013-09-06 21:24:31',	'2013-09-06 21:32:19',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(291,	1,	'2013-09-06 21:32:51',	'2013-09-06 21:43:55',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(292,	1,	'2013-09-06 21:44:21',	'2013-09-06 21:47:25',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(293,	1,	'2013-09-06 21:47:47',	'2013-09-06 22:26:15',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(294,	1,	'2013-09-08 20:56:31',	'2013-09-08 20:57:04',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(295,	1,	'2013-09-09 20:29:25',	'2013-09-09 20:31:58',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(296,	1,	'2013-09-09 20:32:54',	'2013-09-09 20:34:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(297,	1,	'2013-09-09 20:36:00',	'2013-09-09 20:38:14',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(298,	1,	'2013-09-09 20:39:13',	'2013-09-09 20:41:45',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(299,	1,	'2013-09-09 20:42:23',	'2013-09-09 20:46:41',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(300,	1,	'2013-09-09 20:47:35',	'2013-09-09 20:53:39',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(301,	1,	'2013-09-09 20:54:23',	'2013-09-09 21:12:55',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(302,	1,	'2013-09-09 21:13:40',	'2013-09-09 21:18:07',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(303,	1,	'2013-09-09 21:18:58',	'2013-09-09 21:19:31',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0'),
(304,	1,	'2013-09-09 21:20:30',	'2013-09-09 21:24:48',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0');

DROP TABLE IF EXISTS `token_user`;
CREATE TABLE `token_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор подтверждения',
  `id_user` int(11) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `token_confirm` varchar(36) NOT NULL COMMENT 'Токен подтверждения',
  `type_confirm` int(11) unsigned NOT NULL COMMENT 'Тип подтверждения',
  `date_request` datetime NOT NULL COMMENT 'Дата запроса действия',
  `date_response` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Дата подтверждения пользователем действия',
  `confirmed` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Состояние подтверждения',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Токены подтверждения действий';

INSERT INTO `token_user` (`id`, `id_user`, `token_confirm`, `type_confirm`, `date_request`, `date_response`, `confirmed`) VALUES
(1,	8,	'26ef8281-3ec9-40d3-819f-b5f57a1f3ea5',	2,	'2013-07-31 20:58:06',	'2013-07-31 20:58:58',	CONV('1', 2, 10) + 0),
(2,	7,	'b57e5ea0-c24a-40e5-a7b7-cc84f3f218c3',	3,	'2013-08-08 03:11:09',	'2013-08-08 18:56:22',	CONV('1', 2, 10) + 0),
(3,	7,	'284be139-0bc7-4959-a1ae-c9f0df9856bf',	3,	'2013-08-08 03:23:18',	'2013-08-08 18:56:22',	CONV('0', 2, 10) + 0),
(4,	7,	'36c1ddf9-a2d3-4956-8c6f-18f53c98d010',	3,	'2013-08-08 03:49:44',	'2013-08-08 18:56:22',	CONV('0', 2, 10) + 0),
(5,	7,	'1b0b61c5-a9d8-4698-9048-6029ff4eae90',	3,	'2013-08-08 04:08:37',	'2013-08-08 18:56:22',	CONV('0', 2, 10) + 0),
(6,	7,	'17b398a2-fefa-4798-891c-30724a962b62',	3,	'2013-08-08 04:55:19',	'2013-08-08 18:56:22',	CONV('0', 2, 10) + 0),
(7,	7,	'ec30468a-be03-4943-bf95-f83ee153abd1',	3,	'2013-08-08 18:52:02',	'2013-08-08 18:56:22',	CONV('0', 2, 10) + 0),
(8,	7,	'350a1265-2676-4d58-9be6-bfc79b2ebe7f',	3,	'2013-08-08 18:58:49',	'2013-08-08 18:59:36',	CONV('1', 2, 10) + 0);

DROP TABLE IF EXISTS `type_confirm`;
CREATE TABLE `type_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор типа подтверждения',
  `title` varchar(200) NOT NULL COMMENT 'Название подтверждения',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Типы подтверждений';

INSERT INTO `type_confirm` (`id`, `title`) VALUES
(1,	'confirmation of registration'),
(2,	'confirmation of the change private settings'),
(3,	'Reset Pass');

DROP TABLE IF EXISTS `type_request_info`;
CREATE TABLE `type_request_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор типа запроса',
  `title` varchar(200) NOT NULL COMMENT 'Название запроса',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Идентификаторы типов запросов изменения личной информации';

INSERT INTO `type_request_info` (`id`, `title`) VALUES
(1,	'mail'),
(2,	'password'),
(3,	'phone'),
(4,	'passport'),
(5,	'pay_system'),
(6,	'score');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя',
  `login` varchar(200) NOT NULL COMMENT 'Логин',
  `password` varchar(200) NOT NULL COMMENT 'Пароль',
  `email` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL COMMENT 'Фамилия',
  `name` varchar(200) NOT NULL COMMENT 'Имя',
  `second_name` varchar(200) NOT NULL DEFAULT '' COMMENT 'Отчество',
  `country` varchar(200) NOT NULL DEFAULT '' COMMENT 'Страна',
  `tel` varchar(200) NOT NULL COMMENT 'Номер телефона',
  `register_date` datetime NOT NULL COMMENT 'Дата геристрации',
  `last_login` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Время последнего входа',
  `balance` decimal(9,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Баланс пользователя',
  `banned` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Отметка о блокировке',
  `banned_date` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Дата блокировки',
  `banned_comment` varchar(500) NOT NULL DEFAULT '' COMMENT 'Причина блокировки',
  `banned_admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор админа выдавшего бан',
  `activated` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Статус активации пользователя',
  PRIMARY KEY (`id`),
  KEY `login_INDEX` (`login`),
  KEY `password_INDEX` (`password`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Личные данные пользователей';

INSERT INTO `users` (`id`, `login`, `password`, `email`, `surname`, `name`, `second_name`, `country`, `tel`, `register_date`, `last_login`, `balance`, `banned`, `banned_date`, `banned_comment`, `banned_admin_id`, `activated`) VALUES
(7,	'root',	'25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7',	'dizinor@gmail.com',	'fds',	'ef',	'',	'',	'12',	'2013-07-29 16:19:19',	'2013-08-09 18:01:57',	8999173.00,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0),
(1,	'admin',	'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',	'dizinor@gmail.com',	'dsa',	'ew',	'',	'',	'4321',	'2013-07-30 20:38:36',	'2013-09-09 21:20:30',	4535.00,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0);

DROP TABLE IF EXISTS `user_bet`;
CREATE TABLE `user_bet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'идентификатор записи',
  `id_user` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `id_game` int(10) unsigned NOT NULL COMMENT 'Инедтификатор игры',
  `user_ip` int(10) unsigned NOT NULL COMMENT 'ip пользователя в момент игры',
  `user_agent` varchar(200) NOT NULL COMMENT 'user agent пользователя в момент игры',
  `balance_start` decimal(11,2) unsigned NOT NULL COMMENT 'Баланс пользователя в момент старта игры',
  `balance_finish` decimal(11,2) unsigned NOT NULL COMMENT 'баланс пользователя после окончания',
  `sum_win` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Сумма выиграша',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Таблица ставок пользователя';

INSERT INTO `user_bet` (`id`, `id_user`, `id_game`, `user_ip`, `user_agent`, `balance_start`, `balance_finish`, `sum_win`) VALUES
(1,	1,	13466,	123,	'0',	200.00,	0.00,	0.00),
(2,	1,	13467,	123,	'0',	200.00,	0.00,	0.00),
(3,	1,	13471,	123,	'0',	200.00,	0.00,	0.00),
(4,	1,	13484,	123,	'0',	200.00,	0.00,	0.00),
(5,	1,	13488,	123,	'0',	200.00,	0.00,	0.00);

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `role_id` int(11) unsigned NOT NULL COMMENT 'Идентификатор роли',
  `user_id` int(11) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Соответствие ролей пользователям';

INSERT INTO `user_roles` (`role_id`, `user_id`) VALUES
(3,	2),
(3,	3),
(3,	4),
(3,	5),
(3,	6),
(2,	7),
(1,	1);

-- 2013-09-09 22:16:46
