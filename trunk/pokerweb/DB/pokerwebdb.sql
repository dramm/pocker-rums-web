-- Adminer 3.7.1 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+03:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

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
(8,	'',	1,	'');

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
(4,	7,	2,	'2013-07-30 18:45:58',	'1999-01-01 00:00:00',	'data2',	CONV('0', 2, 10) + 0),
(3,	7,	1,	'2013-07-30 18:45:58',	'1999-01-01 00:00:00',	'data',	CONV('0', 2, 10) + 0),
(5,	7,	2,	'2013-07-30 18:46:58',	'1999-01-01 00:00:00',	'222',	CONV('1', 2, 10) + 0),
(6,	7,	1,	'2013-07-30 18:45:59',	'1999-01-01 00:00:00',	'34214',	CONV('1', 2, 10) + 0),
(8,	8,	1,	'2013-07-30 18:46:59',	'1999-01-01 00:00:00',	'11111',	CONV('1', 2, 10) + 0),
(9,	7,	3,	'2013-07-30 20:19:53',	'2013-07-30 20:27:52',	'12',	CONV('1', 2, 10) + 0);

DROP TABLE IF EXISTS `request_out_money`;
CREATE TABLE `request_out_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор заявки',
  `id_user` int(10) unsigned NOT NULL COMMENT 'Идентификатор пользователя',
  `sum` float unsigned NOT NULL COMMENT 'Запрошенная сумма',
  `data_request` datetime NOT NULL COMMENT 'Время подачи заявки',
  `data_response` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Время выдачи средств',
  `id_manager` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор менеджера выдавшего средства',
  `processed` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Статус выдачи',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Заявки на выплату средств';

INSERT INTO `request_out_money` (`id`, `id_user`, `sum`, `data_request`, `data_response`, `id_manager`, `processed`) VALUES
(2,	7,	60.5,	'2013-07-29 20:55:37',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0);

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
(101,	5,	'2013-07-25 23:03:34',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(102,	5,	'2013-07-26 17:58:36',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(103,	5,	'2013-07-26 20:00:55',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(104,	5,	'2013-07-26 20:34:16',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(105,	5,	'2013-07-26 20:37:49',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(106,	5,	'2013-07-26 20:43:11',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(107,	5,	'2013-07-26 20:48:29',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(108,	5,	'2013-07-26 20:51:22',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(109,	5,	'2013-07-26 20:53:23',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(110,	5,	'2013-07-26 20:58:28',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(111,	5,	'2013-07-26 21:03:47',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(112,	5,	'2013-07-26 21:12:29',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(113,	5,	'2013-07-26 21:18:22',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(114,	5,	'2013-07-26 21:28:08',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(115,	5,	'2013-07-28 14:40:05',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(116,	5,	'2013-07-28 14:50:29',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(117,	5,	'2013-07-29 15:30:28',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(118,	5,	'2013-07-29 15:32:32',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(119,	5,	'2013-07-29 15:33:24',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(120,	5,	'2013-07-29 15:44:17',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(121,	5,	'2013-07-29 16:05:58',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(122,	5,	'2013-07-29 16:07:07',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(123,	5,	'2013-07-29 16:11:50',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(124,	6,	'2013-07-29 16:17:14',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(125,	7,	'2013-07-29 16:19:58',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(126,	7,	'2013-07-29 16:24:57',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(127,	7,	'2013-07-29 19:05:01',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(128,	7,	'2013-07-29 19:12:49',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(129,	7,	'2013-07-29 19:16:57',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(130,	7,	'2013-07-29 19:18:49',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(131,	7,	'2013-07-29 19:20:18',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(132,	7,	'2013-07-29 19:39:24',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(133,	7,	'2013-07-29 19:46:36',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(134,	7,	'2013-07-29 19:51:00',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(135,	7,	'2013-07-29 19:52:38',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(136,	7,	'2013-07-29 19:58:18',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(137,	7,	'2013-07-29 20:53:37',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(138,	7,	'2013-07-29 20:55:06',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(139,	7,	'2013-07-29 21:23:49',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(140,	7,	'2013-07-29 21:27:53',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(141,	7,	'2013-07-29 21:28:24',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(142,	7,	'2013-07-29 21:28:58',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(143,	7,	'2013-07-29 22:36:58',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(144,	7,	'2013-07-29 22:39:14',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(145,	7,	'2013-07-30 12:37:15',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(146,	7,	'2013-07-30 12:39:30',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(147,	7,	'2013-07-30 12:53:34',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(148,	7,	'2013-07-30 15:34:54',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(149,	7,	'2013-07-30 15:36:20',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(150,	7,	'2013-07-30 20:19:43',	'2013-07-30 21:34:02',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(151,	8,	'2013-07-30 20:39:17',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(152,	8,	'2013-07-30 21:39:47',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(153,	8,	'2013-07-30 21:41:28',	'2013-07-30 21:41:59',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(154,	7,	'2013-07-30 21:43:12',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0');

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
(6,	5,	'646ae913-fffc-478f-9857-3010750811eb',	2,	'2013-07-28 14:51:56',	'2013-07-28 14:51:56',	CONV('0', 2, 10) + 0),
(7,	5,	'c64b7042-0eb2-4f40-a2e0-849f688a28cc',	2,	'2013-07-28 14:53:41',	'2013-07-28 14:53:41',	CONV('0', 2, 10) + 0),
(8,	5,	'ea6b4661-0ef4-4239-a773-2915d122e9bd',	2,	'2013-07-29 15:31:52',	'2013-07-29 15:31:52',	CONV('0', 2, 10) + 0),
(9,	5,	'fb898caa-054f-4aaf-a3b8-ccd217fb20ee',	2,	'2013-07-29 15:32:48',	'2013-07-29 15:32:48',	CONV('0', 2, 10) + 0),
(10,	5,	'9fb4d3a7-a63a-47a3-a3b2-151da39dbd9d',	2,	'2013-07-29 16:07:21',	'2013-07-29 16:07:21',	CONV('0', 2, 10) + 0),
(11,	5,	'b49e7624-9753-456c-ba93-2ea7e53c0e47',	2,	'2013-07-29 16:12:01',	'2013-07-29 16:12:01',	CONV('0', 2, 10) + 0),
(12,	6,	'ef5f878b-48e5-4b59-a1f4-65419cd21d39',	1,	'2013-07-29 16:16:50',	'2013-07-29 16:17:08',	CONV('1', 2, 10) + 0),
(13,	6,	'8f85913d-3c1b-4eaf-acd0-d1e8db559c2b',	2,	'2013-07-29 16:17:26',	'2013-07-29 16:17:26',	CONV('0', 2, 10) + 0),
(14,	7,	'5a446f1c-87d3-4ed5-bc83-9d786df510b4',	1,	'2013-07-29 16:19:19',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(15,	7,	'73c6805a-830b-453f-a095-8fb48c93359f',	2,	'2013-07-29 16:20:12',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(16,	7,	'9c3d3ba8-fb4d-49b2-a77c-f707c3089fdc',	2,	'2013-07-29 19:22:58',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(17,	7,	'fcd3d456-1d91-417d-96bf-64a129b9ff26',	2,	'2013-07-29 19:24:34',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(18,	7,	'77692708-d2ea-476d-b9b1-8d980110c459',	2,	'2013-07-29 19:25:22',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(19,	7,	'e5de7d4f-8009-44b5-a00d-15c80a2cd95a',	2,	'2013-07-29 19:25:31',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(20,	7,	'80aa9b88-2352-4309-835b-9302f06e094d',	2,	'2013-07-29 19:39:35',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(21,	7,	'7cfcef63-5876-4408-88e6-ba1eccd82fdc',	2,	'2013-07-29 22:37:12',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(22,	7,	'9889cc01-d775-4b53-9e32-af2dc1f68c68',	2,	'2013-07-29 22:39:26',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(23,	7,	'7a6dcd6d-87ee-4762-ab24-3b3231eec64f',	2,	'2013-07-30 20:19:53',	'2013-07-30 20:27:52',	CONV('1', 2, 10) + 0),
(24,	8,	'fb4d9384-44a3-4278-9711-dc0e78db3916',	1,	'2013-07-30 20:38:36',	'2013-07-30 20:39:08',	CONV('1', 2, 10) + 0);

DROP TABLE IF EXISTS `type_confirm`;
CREATE TABLE `type_confirm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор типа подтверждения',
  `title` varchar(200) NOT NULL COMMENT 'Название подтверждения',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Типы подтверждений';

INSERT INTO `type_confirm` (`id`, `title`) VALUES
(1,	'confirmation of registration'),
(2,	'confirmation of the change private settings');

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
  `balance` float unsigned NOT NULL DEFAULT '0' COMMENT 'Баланс пользователя',
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
(7,	'root',	'4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2',	'data',	'fds',	'ef',	'',	'',	'12',	'2013-07-29 16:19:19',	'2013-07-30 21:43:12',	12000,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0),
(8,	'admin',	'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',	'dizinor@gmail.com',	'dsa',	'ew',	'',	'',	'4321',	'2013-07-30 20:38:36',	'2013-07-30 21:41:28',	0,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0);

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
(3,	8);

-- 2013-07-30 21:43:32
