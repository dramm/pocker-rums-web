-- Adminer 3.7.1 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+03:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Таблица логирования обработки выдачи средств';

INSERT INTO `log_money_transaction` (`id`, `id_user`, `sum`, `current_balance`, `date_request`, `user_agent`, `ip_user`, `date_starting_response`, `id_manager`, `ip_manager`, `balance_starting_response`, `date_completed`, `balance_completed_response`, `manager_agent`) VALUES
(1,	7,	20.00,	9000000.00,	'2013-08-04 03:16:55',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'2013-08-05 01:50:19',	7,	2130706433,	8999918.00,	'2013-08-05 01:50:19',	8999917.80,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(2,	7,	2.00,	8999920.00,	'2013-08-04 19:33:46',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'2013-08-05 01:50:19',	7,	2130706433,	8999918.00,	'2013-08-05 01:50:19',	8999917.80,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(3,	7,	0.20,	8999918.00,	'2013-08-05 01:50:06',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'2013-08-05 01:50:19',	7,	2130706433,	8999918.00,	'2013-08-05 01:50:19',	8999917.80,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(4,	7,	32.00,	8999917.80,	'2013-08-05 19:12:58',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'1999-01-01 00:00:00',	0,	0,	0.00,	'1999-01-01 00:00:00',	0.00,	''),
(5,	1,	2.00,	4537.00,	'2013-08-05 19:52:00',	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',	2130706433,	'1999-01-01 00:00:00',	0,	0,	0.00,	'1999-01-01 00:00:00',	0.00,	'');

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
(4,	7,	32.00,	'2013-08-05 19:12:58',	8999917.80,	'1999-01-01 00:00:00',	0.00,	0,	0,	''),
(5,	1,	2.00,	'2013-08-05 19:52:00',	4537.00,	'1999-01-01 00:00:00',	0.00,	0,	0,	'');

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
(188,	1,	'2013-08-05 23:11:32',	'2013-08-05 23:12:06',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0');

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
(7,	'root',	'4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2',	'dizinor@gmail.com',	'fds',	'ef',	'',	'',	'12',	'2013-07-29 16:19:19',	'2013-08-05 23:05:34',	8999917.80,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0),
(1,	'admin',	'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',	'dizinor@gmail.com',	'dsa',	'ew',	'',	'',	'4321',	'2013-07-30 20:38:36',	'2013-08-05 23:11:32',	4537.00,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0);

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

-- 2013-08-05 23:12:10
