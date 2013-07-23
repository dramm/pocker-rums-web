-- Adminer 3.7.1 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+03:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `payment_info`;
CREATE TABLE `payment_info` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя',
  `passport` varchar(200) NOT NULL COMMENT 'Паспорт',
  `pay_sys` int(11) NOT NULL COMMENT 'Платежная система',
  `score` varchar(200) NOT NULL COMMENT 'Счет',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Платежная информация';


DROP TABLE IF EXISTS `pay_sys`;
CREATE TABLE `pay_sys` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор системы',
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

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор роли',
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
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `user_id` int(11) NOT NULL COMMENT 'Идентификатор пользователя',
  `login_time` datetime NOT NULL COMMENT 'Время входа',
  `logout` datetime NOT NULL COMMENT 'Время выхода',
  `ip` int(10) unsigned NOT NULL COMMENT 'ip адресс пользователя',
  `user_agent` varchar(200) NOT NULL COMMENT 'юзер-агент пользователя',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Статистика авторизаций';

INSERT INTO `stat_logins` (`id`, `user_id`, `login_time`, `logout`, `ip`, `user_agent`) VALUES
(15,	2,	'2013-07-23 20:57:07',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(14,	2,	'2013-07-23 20:50:56',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0'),
(13,	2,	'2013-07-23 20:47:01',	'1999-01-01 00:00:00',	2130706433,	'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0');

DROP TABLE IF EXISTS `token_user`;
CREATE TABLE `token_user` (
  `id` int(11) NOT NULL COMMENT 'Идентификатор пользователя',
  `token_confirm` varchar(36) NOT NULL COMMENT 'Токен подтверждения',
  `type_confirm` int(11) NOT NULL COMMENT 'Тип подтверждения',
  `date_request` datetime NOT NULL COMMENT 'Дата запроса действия',
  `date_response` datetime NOT NULL COMMENT 'Дата подтверждения пользователем действия',
  `confirmed` bit(1) NOT NULL COMMENT 'Состояние подтверждения'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Токены подтверждения действий';

INSERT INTO `token_user` (`id`, `token_confirm`, `type_confirm`, `date_request`, `date_response`, `confirmed`) VALUES
(1,	'd51e3d60-2b5c-4ccb-8fcd-5560e170667a',	1,	'2013-07-22 17:01:14',	'2013-07-22 17:07:23',	CONV('1', 2, 10) + 0),
(2,	'1a9d3979-fd30-411b-9235-1b8ebf414521',	1,	'2013-07-23 20:44:30',	'2013-07-23 20:46:26',	CONV('1', 2, 10) + 0);

DROP TABLE IF EXISTS `type_confirm`;
CREATE TABLE `type_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор типа подтверждения',
  `title` varchar(200) NOT NULL COMMENT 'Название подтверждения',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Типы подтверждений';

INSERT INTO `type_confirm` (`id`, `title`) VALUES
(1,	'confirmation of registration'),
(2,	'confirmation of the change e-mail'),
(3,	'confirmation of the change phone'),
(4,	'confirmation of the change pay system');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя',
  `login` varchar(200) NOT NULL COMMENT 'Логин',
  `password` varchar(200) NOT NULL COMMENT 'Пароль',
  `email` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL COMMENT 'Фамилия',
  `name` varchar(200) NOT NULL COMMENT 'Имя',
  `second_name` varchar(200) NOT NULL COMMENT 'Отчество',
  `country` varchar(200) NOT NULL COMMENT 'Страна',
  `tel` varchar(200) NOT NULL COMMENT 'Номер телефона',
  `register_date` datetime NOT NULL COMMENT 'Дата геристрации',
  `last_login` datetime NOT NULL COMMENT 'Время последнего входа',
  `balance` float unsigned NOT NULL COMMENT 'Баланс пользователя',
  `banned` bit(1) NOT NULL COMMENT 'Отметка о блокировке',
  `banned_date` datetime NOT NULL COMMENT 'Дата блокировки',
  `banned_comment` varchar(500) NOT NULL COMMENT 'Причина блокировки',
  `banned_admin_id` int(11) NOT NULL COMMENT 'Идентификатор админа выдавшего бан',
  `activated` bit(1) NOT NULL COMMENT 'Статус активации пользователя',
  PRIMARY KEY (`id`),
  KEY `login_INDEX` (`login`),
  KEY `password_INDEX` (`password`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Личные данные пользователей';

INSERT INTO `users` (`id`, `login`, `password`, `email`, `surname`, `name`, `second_name`, `country`, `tel`, `register_date`, `last_login`, `balance`, `banned`, `banned_date`, `banned_comment`, `banned_admin_id`, `activated`) VALUES
(1,	'admin',	'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',	'posle24@rambler.ru',	'ds',	'sfd',	'',	'',	'321',	'2013-07-22 17:01:14',	'2013-07-23 20:02:34',	0,	CONV('0', 2, 10) + 0,	'2013-07-22 17:01:14',	'',	0,	CONV('1', 2, 10) + 0),
(2,	'root',	'4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2',	'posle24@rambler.ru',	'fds',	'fds',	'',	'',	'root',	'2013-07-23 20:44:30',	'2013-07-23 20:57:07',	0,	CONV('0', 2, 10) + 0,	'1999-01-01 00:00:00',	'',	0,	CONV('1', 2, 10) + 0);

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL COMMENT 'Идентификатор роли',
  `user_id` int(11) NOT NULL COMMENT 'Идентификатор пользователя'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Соответствие ролей пользователям';

INSERT INTO `user_roles` (`role_id`, `user_id`) VALUES
(3,	2);

-- 2013-07-23 21:48:02
