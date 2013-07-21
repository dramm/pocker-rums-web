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

DROP TABLE IF EXISTS `reg_token_user`;
CREATE TABLE `reg_token_user` (
  `id` int(11) NOT NULL COMMENT 'Идентификатор пользователя',
  `reg_token_confirm` varchar(36) NOT NULL COMMENT 'Токен подтверждения регистрации'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Токены подтверждения регистрации';

INSERT INTO `reg_token_user` (`id`, `reg_token_confirm`) VALUES
(39,	'cc2135d7-ebec-4682-80bc-187047f98773'),
(40,	'2567b0ff-1216-44dd-90a1-9c2684a0edde'),
(41,	'77d7ff4e-1c40-43ef-9c0f-c827d128a0a2'),
(42,	'5b592d54-9266-4206-a76c-2e514ea00545'),
(43,	'58b929cf-463c-4b21-ab63-64763f212463'),
(44,	'd41913f4-7f68-43ca-b526-35558d9da670'),
(45,	'8de997fd-70d7-4a7e-af42-342a166be316'),
(46,	'719bfec3-016f-455c-9307-be575c578f05'),
(47,	'38af506b-eb46-4f23-9e08-814069831f86'),
(48,	'550b29d6-c516-4cf1-b743-293c130a8c42'),
(49,	'5288e48b-afd6-4035-bf42-e2f957f765a9'),
(50,	'7596f9f4-10f0-4a4c-ae4a-b0b3d9d52ddf'),
(52,	'854f7dc3-ee0c-4a76-a65a-0b79e9e6eef1'),
(53,	'22af58ef-0541-4ca0-bd2f-7ff59810e4d4'),
(54,	'd09ede4b-369d-42e0-bd2b-5a3b52e81f05'),
(55,	'7f26ff63-2ac0-477e-97bd-2aeff1589456'),
(56,	'29279afb-7ef5-489d-a096-bb7c009719d5'),
(57,	'847fee5d-6146-4e71-b3f5-4c45019c3150'),
(63,	'cf72b98c-9186-46e9-99ac-4cc592a0acb9'),
(64,	'f79c23b5-1f17-453b-b57a-7eaef13fc26c'),
(65,	'cf9415af-f563-4d3e-a1a0-637f3f9732ff'),
(66,	'8a76f15c-8788-4f43-8a4d-b4aa0800fe10'),
(67,	'b01e4e4d-cbc1-4433-91ad-e553a737cdc8'),
(68,	'e8558b52-dfca-4392-81fb-30748770666e'),
(69,	'51f68135-aff4-415a-905d-4e9da7e71a6e'),
(70,	'307e37af-c8ed-4747-94e6-2002f2a1d58b'),
(71,	'1ba09fc2-fe5c-43fb-894a-8c790fa94cd0'),
(72,	'07b8a11e-6ea8-44a3-9fe3-a69fe8d6ccbe'),
(73,	'3d2484ec-9de1-4a21-9c5b-787252a31609'),
(74,	'cbfc660a-b8ea-4a8f-a0e1-1ba9917ba97d'),
(76,	'75299142-f01f-42b1-b60f-8a5cd6acd267'),
(77,	'c2938e3a-dcc9-4b21-a89e-f774cd756da3'),
(78,	'af22951f-91ee-4388-9f03-06b739cacdde'),
(79,	'5549f2db-0758-45a4-b0fc-ec8c9041ffa4'),
(80,	'af080e81-19d5-4fc9-b383-a3ae238185a6'),
(82,	'91c7c437-1774-4a13-ac93-31891502ae5b'),
(83,	'f8367b2f-0516-43ee-bbe3-4b15fca6f9e0'),
(84,	'56c0bdcd-315d-4e73-8aed-0343d2c4c0f2'),
(85,	'ec1d728a-28e2-492f-89dd-af41232a38e4'),
(86,	'3875d0b4-500b-41fd-a3cb-35e956b61e19'),
(87,	'fe2a8f6a-d638-4f0d-adf3-c5d948afd02a'),
(88,	'ec9aa4cd-8ca4-4b09-8962-344f940a7c68'),
(92,	'585ad446-4d69-4abb-9b01-287964d2c594'),
(93,	'c079c88b-5c1b-4a3e-9999-f4b9dfee1d9c'),
(95,	'0b6949a2-14c2-4af5-9999-39d5883977d4'),
(96,	'c6a4ec36-b42a-46b7-bf9d-2a1cb9042b04'),
(98,	'023c6c9c-7082-4633-87a2-dbd6e05da1f0'),
(99,	'bb405ae2-fb68-47c2-90f8-8b8ef127108b'),
(100,	'1f04c050-acd8-4d91-91bb-02bd96bef8c2'),
(101,	'b1f35812-6948-42bb-a935-0c737ae58a08'),
(102,	'e3ca83c9-50ac-43e5-a539-eaade12409b6'),
(103,	'412ea46f-c5b0-4295-9e4e-6941ae284a97'),
(104,	'aee7b73f-39d2-4d09-a181-ca7ea25470a7'),
(105,	'125839b0-0f8d-4d03-a3d8-6460fef15f26'),
(106,	'f2cbb466-a0bc-4b1a-b7d5-ceff206741b5'),
(107,	'b8965edd-b0d3-4f6c-b85a-80f3bf977fa9'),
(108,	'2f315199-9c63-413b-8efa-7b6934160b5e');

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
  `banned` bit(1) NOT NULL COMMENT 'Отметка о блокировке',
  `banned_date` datetime NOT NULL COMMENT 'Дата блокировки',
  `banned_comment` varchar(500) NOT NULL COMMENT 'Причина блокировки',
  `banned_admin_id` int(11) NOT NULL COMMENT 'Идентификатор админа выдавшего бан',
  `activated` bit(1) NOT NULL COMMENT 'Статус активации пользователя',
  PRIMARY KEY (`id`),
  KEY `login_INDEX` (`login`),
  KEY `password_INDEX` (`password`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Личные данные пользователей';


DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL COMMENT 'Идентификатор роли',
  `user_id` int(11) NOT NULL COMMENT 'Идентификатор пользователя'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Соответствие ролей пользователям';

INSERT INTO `user_roles` (`role_id`, `user_id`) VALUES
(1,	3),
(4,	6),
(10,	10),
(10,	10),
(10,	10),
(3,	33),
(3,	32),
(3,	34),
(3,	35),
(3,	36),
(3,	37),
(3,	38),
(3,	39),
(3,	40),
(3,	41),
(3,	42),
(3,	43),
(3,	44),
(3,	45),
(3,	46),
(3,	47),
(3,	48),
(3,	49),
(3,	50),
(3,	52),
(3,	53),
(3,	54),
(3,	55),
(3,	56),
(3,	57),
(3,	59),
(3,	61),
(3,	62),
(3,	63),
(3,	64),
(3,	65),
(3,	66),
(3,	67),
(3,	68),
(3,	69),
(3,	70),
(3,	71),
(3,	72),
(3,	73),
(3,	74),
(3,	76),
(3,	77),
(3,	78),
(3,	79),
(3,	80),
(3,	82),
(3,	83),
(3,	84),
(3,	85),
(3,	86),
(3,	87),
(3,	88),
(3,	92),
(3,	93),
(3,	95),
(3,	96),
(3,	98),
(3,	99),
(3,	100),
(3,	101),
(3,	102),
(3,	103),
(3,	104),
(3,	105),
(3,	106),
(3,	107),
(3,	108);

-- 2013-07-22 01:52:26
