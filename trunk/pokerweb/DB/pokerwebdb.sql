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
  `sum` float unsigned NOT NULL COMMENT 'Запрошенная сумма',
  `data_request` datetime NOT NULL COMMENT 'Время подачи заявки',
  `data_response` datetime NOT NULL DEFAULT '1999-01-01 00:00:00' COMMENT 'Время выдачи средств',
  `id_manager` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Идентификатор менеджера выдавшего средства',
  `processed` bit(1) NOT NULL DEFAULT b'0' COMMENT 'Статус выдачи',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Заявки на выплату средств';

INSERT INTO `request_out_money` (`id`, `id_user`, `sum`, `data_request`, `data_response`, `id_manager`, `processed`) VALUES
(1,	7,	200,	'2013-07-31 17:14:55',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(2,	7,	4000,	'2013-07-31 17:15:03',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(3,	7,	12,	'2013-07-31 17:15:11',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(4,	7,	2222,	'2013-07-31 17:15:20',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(5,	7,	2321,	'2013-07-31 17:15:38',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(6,	8,	2000,	'2013-07-31 17:16:12',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(7,	8,	120,	'2013-07-31 17:16:19',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(8,	8,	990,	'2013-07-31 17:16:27',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(9,	8,	1232,	'2013-07-31 17:16:34',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(10,	8,	1121,	'2013-07-31 17:16:41',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(11,	8,	9232,	'2013-07-31 17:16:50',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0),
(12,	7,	2,	'2013-07-31 20:10:40',	'1999-01-01 00:00:00',	0,	CONV('0', 2, 10) + 0);

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
(39,	7,	'2013-07-31 21:00:08',	'2013-07-31 21:06:54',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0');

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
(1,	8,	'26ef8281-3ec9-40d3-819f-b5f57a1f3ea5',	2,	'2013-07-31 20:58:06',	'2013-07-31 20:58:58',	CONV('1', 2, 10) + 0);

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
(7,	'root',	'4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2',	'dizinor@gmail.com',	'fds',	'ef',	'',	'',	'12',	'2013-07-29 16:19:19',	'2013-07-31 21:00:08',	12000,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0),
(8,	'admin',	'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',	'dizinor@gmail.com',	'dsa',	'ew',	'',	'',	'4321',	'2013-07-30 20:38:36',	'2013-07-31 20:56:44',	12000,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0);

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

-- 2013-07-31 21:06:55
