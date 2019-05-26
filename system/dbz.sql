-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 26-Maio-2019 às 17:37
-- Versão do servidor: 10.1.39-MariaDB
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbz`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vote` int(11) NOT NULL,
  `nickname` varchar(16) DEFAULT NULL,
  `created` int(16) DEFAULT NULL,
  `avatar` char(48) DEFAULT NULL,
  `about_me` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`, `vote`, `nickname`, `created`, `avatar`, `about_me`) VALUES
(1, '1', '514f0c1a5e675d08e98eb6899effdce80bb5b494', '', 65535, 0, '', '0', 0, 0, 1, '', 0, '', '', 3, '', 0, 0, 0, 0, 0, 'unknown', 0, NULL, NULL, NULL, NULL),
(5, 'lukinhoh', 'a5fad98e19b4d86a8f71c8d4ce561fc2a771909f', '', 29, 1558725984, 'lukinhoh@gmail.com', '0', 0, 0, 1, '', 0, '', '', 5, '', 0, 0, 0, 0, 0, '', 0, '[ADMIN] Senky', NULL, NULL, NULL),
(8, 'teste', '2e6f9b0d5885b6010f9167787445617f553a735f', '', 0, 0, 'teste@email.com', '0', 0, 0, 1, '', 0, '', '', 0, '', 0, 0, 0, 0, 0, '', 0, 'Teste', NULL, NULL, NULL);

--
-- Acionadores `accounts`
--
DELIMITER $$
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts` FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) UNSIGNED NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) UNSIGNED NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `action` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `bans`
--

INSERT INTO `bans` (`id`, `type`, `value`, `param`, `active`, `expires`, `added`, `admin_id`, `comment`, `reason`, `action`, `statement`) VALUES
(1, 2, 63, 2, 1, -1, 1437057538, 32, 'namelock xD', 0, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `environment_killers`
--

CREATE TABLE `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `events`
--

CREATE TABLE `events` (
  `event_name` varchar(255) NOT NULL,
  `winner_name` varchar(255) NOT NULL,
  `won_item` varchar(255) NOT NULL,
  `time_win` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL DEFAULT '0',
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `global_storage`
--

INSERT INTO `global_storage` (`key`, `world_id`, `value`) VALUES
('0', 0, '-1'),
('1000', 0, '56'),
('140120', 0, '0'),
('140121', 0, '0'),
('180400', 0, '0'),
('34370', 0, '0'),
('34371', 0, '2'),
('34372', 0, '0'),
('34373', 0, '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds` FOR EACH ROW BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_kills`
--

CREATE TABLE `guild_kills` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `payment` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guild_kills` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `enemy_kills` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `doors` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `beds` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tiles` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `guild` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `clear` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(1, 0, 41, 0, 0, 1436805918, 'Unnamed House #1', 1, 67, 10400000, 0, 0, 2, 104, 0, 0),
(2, 0, 0, 0, 0, 0, 'Unnamed House #2', 1, 23, 3600000, 0, 0, 2, 36, 0, 0),
(3, 0, 0, 0, 0, 0, 'Unnamed House #3', 1, 23, 3600000, 0, 0, 2, 36, 0, 0),
(4, 0, 0, 0, 0, 0, 'Unnamed House #4', 1, 23, 3600000, 0, 0, 2, 36, 0, 0),
(5, 0, 0, 0, 0, 0, 'Unnamed House #5', 1, 23, 3600000, 0, 1, 2, 36, 0, 0),
(6, 0, 0, 0, 0, 0, 'Unnamed House #6', 1, 18, 3000000, 0, 0, 2, 30, 0, 0),
(7, 0, 0, 0, 0, 0, 'Unnamed House #7', 1, 18, 3000000, 0, 0, 2, 30, 0, 0),
(8, 0, 0, 0, 0, 0, 'Unnamed House #8', 1, 14, 2500000, 0, 1, 2, 25, 0, 0),
(9, 0, 0, 0, 0, 0, 'Unnamed House #9', 1, 14, 2500000, 0, 1, 2, 25, 0, 0),
(10, 0, 0, 0, 0, 0, 'Unnamed House #10', 1, 52, 7100000, 0, 1, 2, 71, 0, 0),
(11, 0, 0, 0, 0, 0, 'Unnamed House #11', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(12, 0, 0, 0, 0, 0, 'Unnamed House #12', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(13, 0, 0, 0, 0, 0, 'Unnamed House #13', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(14, 0, 0, 0, 0, 0, 'Unnamed House #14', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(15, 0, 0, 0, 0, 0, 'Unnamed House #15', 1, 10, 2100000, 0, 1, 2, 21, 0, 0),
(16, 0, 0, 0, 0, 0, 'Unnamed House #16', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(17, 0, 0, 0, 0, 0, 'Unnamed House #17', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(18, 0, 0, 0, 0, 0, 'Unnamed House #18', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(19, 0, 0, 0, 0, 0, 'Unnamed House #19', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(20, 0, 0, 0, 0, 0, 'Unnamed House #20', 1, 14, 2600000, 0, 1, 2, 26, 0, 0),
(21, 0, 0, 0, 0, 0, 'Unnamed House #21', 1, 18, 3100000, 0, 1, 2, 31, 0, 0),
(22, 0, 0, 0, 0, 0, 'Unnamed House #22', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(23, 0, 0, 0, 0, 0, 'Unnamed House #23', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(24, 0, 0, 0, 0, 0, 'Unnamed House #24', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(25, 0, 0, 0, 0, 0, 'Unnamed House #25', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(26, 0, 0, 0, 0, 0, 'Unnamed House #26', 1, 14, 2600000, 0, 1, 2, 26, 0, 0),
(27, 0, 0, 0, 0, 0, 'Unnamed House #27', 1, 18, 3100000, 0, 1, 2, 31, 0, 0),
(28, 0, 0, 0, 0, 0, 'Unnamed House #28', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(29, 0, 0, 0, 0, 0, 'Unnamed House #29', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(30, 0, 0, 0, 0, 0, 'Unnamed House #30', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(31, 0, 0, 0, 0, 0, 'Unnamed House #31', 1, 10, 2000000, 0, 1, 2, 20, 0, 0),
(32, 0, 0, 0, 0, 0, 'Unnamed House #32', 1, 14, 2300000, 0, 1, 2, 23, 0, 0),
(33, 0, 0, 0, 0, 0, 'Unnamed House #33', 1, 18, 3100000, 0, 1, 2, 31, 0, 0),
(34, 0, 0, 0, 0, 0, 'Unnamed House #34', 1, 13, 2400000, 0, 1, 2, 24, 0, 0),
(35, 0, 0, 0, 0, 0, 'Unnamed House #35', 1, 13, 2400000, 0, 1, 2, 24, 0, 0),
(36, 0, 0, 0, 0, 0, 'Unnamed House #36', 1, 13, 2400000, 0, 0, 2, 24, 0, 0),
(37, 0, 0, 0, 0, 0, 'Unnamed House #37', 1, 13, 2400000, 0, 0, 2, 24, 0, 0),
(38, 0, 0, 0, 0, 0, 'Unnamed House #38', 1, 13, 2400000, 0, 1, 2, 24, 0, 0),
(39, 0, 0, 0, 0, 0, 'Unnamed House #39', 1, 13, 2400000, 0, 1, 2, 24, 0, 0),
(40, 0, 0, 0, 0, 0, 'Unnamed House #40', 1, 13, 2500000, 0, 1, 2, 25, 0, 0),
(41, 0, 0, 0, 0, 0, 'Unnamed House #41', 1, 13, 2500000, 0, 1, 2, 25, 0, 0),
(42, 0, 0, 0, 0, 0, 'Unnamed House #42', 1, 8, 1800000, 0, 1, 2, 18, 0, 0),
(43, 0, 0, 0, 0, 0, 'Unnamed House #43', 1, 13, 2400000, 0, 1, 2, 24, 0, 0),
(44, 0, 0, 0, 0, 0, 'Unnamed House #44', 1, 18, 3300000, 0, 1, 2, 33, 0, 0),
(45, 0, 0, 0, 0, 0, 'Unnamed House #45', 1, 18, 3000000, 0, 1, 2, 30, 0, 0),
(46, 0, 0, 0, 0, 0, 'Unnamed House #46', 1, 18, 3000000, 0, 1, 2, 30, 0, 0),
(47, 0, 0, 0, 0, 0, 'Unnamed House #47', 1, 16, 3000000, 0, 1, 2, 30, 0, 0),
(48, 0, 0, 0, 0, 0, 'Unnamed House #48', 1, 16, 3000000, 0, 1, 2, 30, 0, 0),
(49, 0, 55, 0, 0, 1436811077, 'Unnamed House #49', 1, 49, 7300000, 0, 1, 2, 73, 0, 0),
(50, 0, 64, 0, 0, 1436957153, 'Unnamed House #50', 1, 49, 7200000, 0, 1, 2, 72, 0, 0),
(51, 0, 0, 0, 0, 0, 'Unnamed House #51', 1, 49, 7200000, 0, 1, 2, 72, 0, 0),
(52, 0, 0, 0, 0, 0, 'Unnamed House #52', 1, 50, 7200000, 0, 1, 2, 72, 0, 0),
(53, 0, 0, 0, 0, 0, 'Unnamed House #53', 1, 47, 6500000, 0, 1, 4, 65, 0, 0),
(54, 0, 0, 0, 0, 0, 'Unnamed House #54', 1, 47, 6500000, 0, 1, 4, 65, 0, 0),
(55, 0, 0, 0, 0, 0, 'Unnamed House #55', 1, 47, 6500000, 0, 1, 4, 65, 0, 0),
(56, 0, 0, 0, 0, 0, 'Unnamed House #56', 1, 45, 6400000, 0, 1, 4, 64, 0, 0),
(57, 0, 0, 0, 0, 0, 'Unnamed House #57', 1, 45, 6400000, 0, 1, 4, 64, 0, 0),
(58, 0, 0, 0, 0, 0, 'Unnamed House #58', 1, 45, 6400000, 0, 1, 4, 64, 0, 0),
(59, 0, 0, 0, 0, 0, 'Unnamed House #59', 1, 54, 7800000, 0, 1, 2, 78, 0, 0),
(60, 0, 0, 0, 0, 0, 'Unnamed House #60', 1, 34, 5400000, 0, 1, 2, 54, 0, 0),
(61, 0, 0, 0, 0, 0, 'Rox House #1', 1, 113, 16200000, 0, 1, 2, 162, 0, 0),
(62, 0, 0, 0, 0, 0, 'Unnamed House #62', 1, 61, 8400000, 0, 1, 4, 84, 0, 0),
(63, 0, 0, 0, 0, 0, 'Unnamed House #63', 1, 68, 9200000, 0, 1, 4, 92, 0, 0),
(64, 0, 0, 0, 0, 0, 'Unnamed House #64', 1, 56, 7700000, 0, 1, 4, 77, 0, 0),
(65, 0, 0, 0, 0, 0, 'Unnamed House #65', 1, 57, 8500000, 0, 1, 2, 85, 0, 0),
(66, 0, 0, 0, 0, 0, 'Unnamed House #66', 1, 22, 3600000, 0, 1, 2, 36, 0, 0),
(67, 0, 0, 0, 0, 0, 'Unnamed House #67', 1, 26, 4100000, 0, 1, 2, 41, 0, 0),
(68, 0, 0, 0, 0, 0, 'Unnamed House #68', 1, 26, 4000000, 0, 1, 2, 40, 0, 0),
(69, 0, 0, 0, 0, 0, 'Unnamed House #69', 1, 22, 3500000, 0, 1, 2, 35, 0, 0),
(70, 0, 0, 0, 0, 0, 'Unnamed House #70', 1, 22, 3600000, 0, 1, 2, 36, 0, 0),
(71, 0, 0, 0, 0, 0, 'Unnamed House #71', 1, 22, 3600000, 0, 1, 2, 36, 0, 0),
(72, 0, 0, 0, 0, 0, 'Unnamed House #72', 1, 22, 3500000, 0, 1, 2, 35, 0, 0),
(73, 0, 0, 0, 0, 0, 'Unnamed House #73', 1, 22, 3500000, 0, 1, 2, 35, 0, 0),
(74, 0, 0, 0, 0, 0, 'Unnamed House #74', 1, 18, 3000000, 0, 1, 2, 30, 0, 0),
(75, 0, 0, 0, 0, 0, 'Unnamed House #75', 1, 22, 3500000, 0, 1, 2, 35, 0, 0),
(76, 0, 0, 0, 0, 0, 'Unnamed House #76', 1, 48, 7000000, 0, 1, 2, 70, 0, 0),
(78, 0, 0, 0, 0, 0, 'Unnamed House #78', 1, 52, 8000000, 0, 1, 2, 80, 0, 0),
(79, 0, 0, 0, 0, 0, 'Unnamed House #79', 1, 52, 8000000, 0, 1, 2, 80, 0, 0),
(80, 0, 0, 0, 0, 0, 'Unnamed House #80', 1, 52, 8000000, 0, 1, 2, 80, 0, 0),
(81, 0, 0, 0, 0, 0, 'Unnamed House #81', 1, 102, 16000000, 0, 2, 6, 160, 0, 0),
(82, 0, 0, 0, 0, 0, 'Unnamed House #82', 1, 102, 16000000, 0, 2, 6, 160, 0, 0),
(83, 0, 0, 0, 0, 0, 'Unnamed House #83', 1, 102, 16000000, 0, 2, 6, 160, 0, 0),
(84, 0, 0, 0, 0, 0, 'Unnamed House #84', 1, 52, 8000000, 0, 1, 2, 80, 0, 0),
(85, 0, 0, 0, 0, 0, 'Unnamed House #85', 2, 13, 2400000, 0, 1, 2, 24, 0, 0),
(86, 0, 0, 0, 0, 0, 'Unnamed House #86', 2, 13, 2500000, 0, 1, 2, 25, 0, 0),
(87, 0, 0, 0, 0, 0, 'Unnamed House #87', 2, 25, 3900000, 0, 1, 2, 39, 0, 0),
(88, 0, 0, 0, 0, 0, 'Unnamed House #88', 2, 10, 2000000, 0, 1, 2, 20, 0, 0),
(89, 0, 0, 0, 0, 0, 'Unnamed House #89', 2, 10, 2000000, 0, 1, 2, 20, 0, 0),
(90, 0, 0, 0, 0, 0, 'Unnamed House #90', 2, 10, 2100000, 0, 1, 2, 21, 0, 0),
(91, 0, 0, 0, 0, 0, 'Unnamed House #91', 2, 10, 2100000, 0, 1, 2, 21, 0, 0),
(92, 0, 0, 0, 0, 0, 'Unnamed House #92', 2, 16, 2800000, 0, 2, 2, 28, 0, 0),
(94, 0, 0, 0, 0, 0, 'Unnamed House #94', 2, 22, 3500000, 0, 1, 2, 35, 0, 0),
(95, 0, 0, 0, 0, 0, 'Unnamed House #95', 2, 22, 3500000, 0, 1, 2, 35, 0, 0),
(96, 0, 0, 0, 0, 0, 'Unnamed House #96', 2, 22, 3500000, 0, 1, 2, 35, 0, 0),
(97, 0, 0, 0, 0, 0, 'Unnamed House #97', 2, 22, 3500000, 0, 1, 2, 35, 0, 0),
(98, 0, 0, 0, 0, 0, 'Unnamed House #98', 2, 22, 3500000, 0, 1, 2, 35, 0, 0),
(99, 0, 0, 0, 0, 0, 'Unnamed House #99', 2, 14, 2500000, 0, 1, 2, 25, 0, 0),
(100, 0, 0, 0, 0, 0, 'Unnamed House #100', 2, 14, 2500000, 0, 1, 2, 25, 0, 0),
(101, 0, 0, 0, 0, 0, 'Unnamed House #101', 2, 14, 2500000, 0, 1, 2, 25, 0, 0),
(102, 0, 0, 0, 0, 0, 'Unnamed House #102', 2, 14, 2500000, 0, 1, 2, 25, 0, 0),
(103, 0, 0, 0, 0, 0, 'Unnamed House #103', 2, 14, 2500000, 0, 1, 2, 25, 0, 0),
(104, 0, 0, 0, 0, 0, 'Unnamed House #104', 1, 18, 3100000, 0, 1, 2, 31, 0, 0),
(105, 0, 0, 0, 0, 0, 'Unnamed House #105', 3, 24, 4000000, 0, 1, 4, 40, 0, 0),
(106, 0, 0, 0, 0, 0, 'Unnamed House #106', 3, 7, 1700000, 0, 1, 2, 17, 0, 0),
(107, 0, 0, 0, 0, 0, 'Unnamed House #107', 3, 7, 1700000, 0, 1, 2, 17, 0, 0),
(108, 0, 0, 0, 0, 0, 'Unnamed House #108', 3, 7, 1700000, 0, 1, 2, 17, 0, 0),
(109, 0, 0, 0, 0, 0, 'Unnamed House #109', 3, 23, 3700000, 0, 1, 2, 37, 0, 0),
(110, 0, 0, 0, 0, 0, 'Unnamed House #110', 3, 23, 3700000, 0, 1, 2, 37, 0, 0),
(111, 0, 0, 0, 0, 0, 'Unnamed House #111', 3, 23, 3700000, 0, 1, 2, 37, 0, 0),
(112, 0, 0, 0, 0, 0, 'Unnamed House #112', 3, 77, 11400000, 0, 1, 4, 114, 0, 0),
(113, 0, 0, 0, 0, 0, 'Unnamed House #113', 3, 77, 11400000, 0, 1, 4, 114, 0, 0),
(114, 0, 0, 0, 0, 0, 'Unnamed House #114', 3, 77, 11400000, 0, 1, 4, 114, 0, 0),
(115, 0, 0, 0, 0, 0, 'Unnamed House #115', 3, 59, 8100000, 0, 1, 4, 81, 0, 0),
(116, 0, 0, 0, 0, 0, 'Unnamed House #116', 3, 159, 21000000, 0, 2, 6, 210, 0, 0),
(117, 0, 0, 0, 0, 0, 'Unnamed House #117', 3, 67, 9000000, 0, 1, 4, 90, 0, 0),
(118, 0, 0, 0, 0, 0, 'Unnamed House #118', 3, 33, 4900000, 0, 1, 2, 49, 0, 0),
(119, 0, 0, 0, 0, 0, 'Unnamed House #119', 3, 33, 4900000, 0, 1, 2, 49, 0, 0),
(120, 0, 0, 0, 0, 0, 'Unnamed House #120', 3, 68, 9000000, 0, 1, 4, 90, 0, 0),
(121, 0, 0, 0, 0, 0, 'Unnamed House #121', 3, 38, 5400000, 0, 1, 2, 54, 0, 0),
(122, 0, 0, 0, 0, 0, 'Unnamed House #122', 4, 66, 10200000, 0, 2, 4, 102, 0, 0),
(123, 0, 0, 0, 0, 0, 'Unnamed House #123', 4, 66, 10200000, 0, 2, 4, 102, 0, 0),
(124, 0, 0, 0, 0, 0, 'Unnamed House #124', 4, 66, 10200000, 0, 2, 4, 102, 0, 0),
(126, 0, 0, 0, 0, 0, 'Unnamed House #126', 7, 57, 9100000, 0, 2, 4, 91, 0, 0),
(127, 0, 0, 0, 0, 0, 'Unnamed House #127', 7, 57, 9100000, 0, 2, 4, 91, 0, 0),
(128, 0, 0, 0, 0, 0, 'Unnamed House #128', 7, 57, 9000000, 0, 1, 4, 90, 0, 0),
(129, 0, 0, 0, 0, 0, 'Unnamed House #129', 7, 57, 8900000, 0, 0, 4, 89, 0, 0),
(130, 0, 0, 0, 0, 0, 'Unnamed House #130', 7, 30, 4500000, 0, 1, 2, 45, 0, 0),
(131, 0, 0, 0, 0, 0, 'Unnamed House #131', 7, 30, 4600000, 0, 1, 2, 46, 0, 0),
(132, 0, 0, 0, 0, 0, 'Unnamed House #132', 7, 30, 4500000, 0, 1, 2, 45, 0, 0),
(133, 0, 0, 0, 0, 0, 'Unnamed House #133', 7, 30, 4600000, 0, 1, 2, 46, 0, 0),
(134, 0, 0, 0, 0, 0, 'Unnamed House #134', 7, 30, 4500000, 0, 1, 2, 45, 0, 0),
(135, 0, 0, 0, 0, 0, 'Unnamed House #135', 7, 30, 4600000, 0, 1, 2, 46, 0, 0),
(136, 0, 0, 0, 0, 0, 'Unnamed House #136', 7, 30, 4500000, 0, 1, 2, 45, 0, 0),
(137, 0, 0, 0, 0, 0, 'Unnamed House #137', 7, 30, 4600000, 0, 1, 2, 46, 0, 0),
(138, 0, 0, 0, 0, 0, 'Unnamed House #138', 7, 8, 1800000, 0, 1, 2, 18, 0, 0),
(139, 0, 0, 0, 0, 0, 'Unnamed House #139', 7, 8, 1800000, 0, 1, 2, 18, 0, 0),
(140, 0, 0, 0, 0, 0, 'Unnamed House #140', 7, 8, 1800000, 0, 1, 2, 18, 0, 0),
(141, 0, 0, 0, 0, 0, 'Unnamed House #141', 7, 8, 1900000, 0, 1, 2, 19, 0, 0),
(142, 0, 0, 0, 0, 0, 'Unnamed House #142', 7, 8, 1900000, 0, 1, 2, 19, 0, 0),
(143, 0, 0, 0, 0, 0, 'Unnamed House #143', 7, 8, 1900000, 0, 1, 2, 19, 0, 0),
(144, 0, 0, 0, 0, 0, 'Unnamed House #144', 7, 67, 10500000, 0, 1, 4, 105, 0, 0),
(145, 0, 0, 0, 0, 0, 'Unnamed House #145', 7, 8, 1500000, 0, 1, 0, 15, 0, 0),
(146, 0, 0, 0, 0, 0, 'Unnamed House #146', 7, 8, 1500000, 0, 1, 0, 15, 0, 0),
(147, 0, 0, 0, 0, 0, 'Unnamed House #147', 7, 8, 1500000, 0, 1, 0, 15, 0, 0),
(148, 0, 0, 0, 0, 0, 'Unnamed House #148', 8, 23, 3600000, 0, 1, 2, 36, 0, 0),
(149, 0, 0, 0, 0, 0, 'Unnamed House #149', 8, 23, 3600000, 0, 1, 2, 36, 0, 0),
(150, 0, 0, 0, 0, 0, 'Unnamed House #150', 8, 32, 5500000, 0, 2, 2, 55, 0, 0),
(151, 0, 0, 0, 0, 0, 'Unnamed House #151', 8, 32, 5500000, 0, 2, 2, 55, 0, 0),
(152, 0, 0, 0, 0, 0, 'Unnamed House #152', 8, 32, 5500000, 0, 2, 2, 55, 0, 0),
(153, 0, 0, 0, 0, 0, 'Unnamed House #153', 8, 26, 4100000, 0, 1, 2, 41, 0, 0),
(154, 0, 0, 0, 0, 0, 'Unnamed House #154', 8, 26, 4100000, 0, 1, 2, 41, 0, 0),
(155, 0, 0, 0, 0, 0, 'Unnamed House #155', 8, 26, 4100000, 0, 1, 2, 41, 0, 0),
(156, 0, 0, 0, 0, 0, 'Unnamed House #156', 8, 18, 3000000, 0, 1, 2, 30, 0, 0),
(157, 0, 0, 0, 0, 0, 'Unnamed House #157', 8, 13, 2500000, 0, 1, 2, 25, 0, 0),
(158, 0, 0, 0, 0, 0, 'Unnamed House #158', 8, 13, 2500000, 0, 1, 2, 25, 0, 0),
(159, 0, 0, 0, 0, 0, 'Unnamed House #159', 8, 13, 2500000, 0, 1, 2, 25, 0, 0),
(160, 0, 0, 0, 0, 0, 'Unnamed House #160', 8, 18, 3000000, 0, 1, 2, 30, 0, 0),
(161, 0, 0, 0, 0, 0, 'Unnamed House #161', 8, 18, 3000000, 0, 1, 2, 30, 0, 0),
(162, 0, 0, 0, 0, 0, 'Unnamed House #162', 1, 93, 12300000, 0, 1, 0, 123, 0, 0),
(163, 0, 0, 0, 0, 0, 'Unnamed House #163', 1, 63, 9800000, 0, 0, 2, 98, 0, 0),
(164, 0, 0, 0, 0, 0, 'Unnamed House #164', 1, 63, 10000000, 0, 0, 2, 100, 0, 0),
(165, 0, 0, 0, 0, 0, 'Donate House #1', 1, 161, 26600000, 0, 3, 2, 266, 0, 0),
(166, 0, 0, 0, 0, 0, 'Donate House #2', 1, 161, 26800000, 0, 3, 2, 268, 0, 0),
(167, 0, 0, 0, 0, 0, 'Donate House #3', 1, 161, 26900000, 0, 3, 2, 269, 0, 0),
(168, 0, 0, 0, 0, 0, 'Donate House #4', 1, 161, 26600000, 0, 3, 2, 266, 0, 0),
(169, 0, 0, 0, 0, 0, 'Unnamed House #169', 1, 65, 8500000, 0, 0, 2, 85, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_auctions`
--

CREATE TABLE `house_auctions` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `limit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `endtime` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_data`
--

CREATE TABLE `house_data` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `killers`
--

CREATE TABLE `killers` (
  `id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `text` tinytext,
  `time` int(11) DEFAULT NULL,
  `delete_from` tinyint(1) DEFAULT NULL,
  `delete_to` tinyint(1) DEFAULT NULL,
  `unread` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `time` int(18) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsticker`
--

CREATE TABLE `newsticker` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `time` int(18) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `titulo` mediumtext NOT NULL,
  `noticia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `noticias`
--

INSERT INTO `noticias` (`id`, `nickname`, `titulo`, `noticia`) VALUES
(3, '[ADMIN] Senky', 'Sobre o servidor.', 'Fase de desenvolvimento em andamento.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagsegurotransacoes`
--

CREATE TABLE `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ProdQuantidade_x` int(5) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `signature` text NOT NULL,
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL,
  `created` int(16) DEFAULT NULL,
  `old_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `signature`, `cast`, `castViewers`, `castDescription`, `created`, `old_name`) VALUES
(2, 'Account Manager', 0, 1, 1, 1, 639, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559479, 1677764800, 1, 4, 0, 0, '', 1422559485, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(3, 'Goku Sample', 0, 1, 1, 1, 1, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559479, 1677764800, 1, 4, 0, 0, '', 1422559485, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(4, 'Vegeta Sample', 0, 1, 1, 1, 17, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559586, 1677764800, 1, 4, 0, 0, '', 1422559693, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(5, 'Piccolo Sample', 0, 1, 1, 1, 32, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559526, 1677764800, 1, 4, 0, 0, '', 1422559544, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(6, 'C17 Sample', 0, 1, 1, 1, 45, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559308, 1677764800, 1, 4, 0, 0, '', 1422559385, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(7, 'Gohan Sample', 0, 1, 1, 1, 57, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559457, 1677764800, 1, 4, 0, 0, '', 1422559479, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(8, 'Trunks Sample', 0, 1, 1, 1, 71, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559544, 1677764800, 1, 4, 0, 0, '', 1422559565, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(9, 'Cell Sample', 0, 1, 1, 1, 83, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559215, 1677764800, 1, 4, 0, 0, '', 1422559242, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(10, 'Freeza Sample', 0, 1, 1, 1, 95, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559408, 1677764800, 1, 4, 0, 0, '', 1422559457, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(11, 'Majin Boo Sample', 0, 1, 1, 1, 111, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559507, 1677764800, 1, 4, 0, 0, '', 1422559526, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(12, 'Brolly Sample', 0, 1, 1, 1, 127, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559193, 1677764800, 1, 4, 0, 0, '', 1422559215, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(13, 'C18 Sample', 0, 1, 1, 1, 140, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 0, 1422559385, 1677764800, 1, 4, 0, 0, '', 1422559407, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(14, 'Uub Sample', 0, 1, 1, 1, 152, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559565, 1677764800, 1, 4, 0, 0, '', 1422559586, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(15, 'Goten Sample', 0, 1, 1, 1, 164, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559485, 1677764800, 1, 4, 0, 0, '', 1422559506, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(16, 'Chibi Trunks Sample', 0, 1, 1, 1, 178, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559243, 1677764800, 1, 4, 0, 0, '', 1422559261, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(17, 'Cooler Sample', 0, 1, 1, 1, 192, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559262, 1677764800, 1, 4, 0, 0, '', 1422559283, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(18, 'Dende Sample', 0, 1, 1, 1, 206, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422559283, 1677764800, 1, 4, 0, 0, '', 1422559308, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(19, 'Tsuful Sample', 0, 1, 1, 1, 218, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560589, 1677764800, 1, 4, 0, 0, '', 1422560591, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(20, 'Kuririn Sample', 0, 1, 1, 1, 244, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560222, 1677764800, 1, 4, 0, 0, '', 1422560247, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(21, 'Pan Sample', 0, 1, 1, 1, 256, 250, 250, 0, 68, 76, 78, 39, 136, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 0, 1422560247, 1677764800, 1, 4, 0, 0, '', 1422560275, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(22, 'Kaio Sample', 0, 1, 1, 1, 268, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560203, 1677764800, 1, 4, 0, 0, '', 1422560222, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(23, 'Videl Sample', 0, 1, 1, 1, 280, 250, 250, 0, 68, 76, 78, 39, 136, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 0, 1422560359, 1677764800, 1, 4, 0, 0, '', 1422560380, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(24, 'Janemba Sample', 0, 1, 1, 1, 292, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560167, 1677764800, 1, 4, 0, 0, '', 1422560185, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(25, 'Tenshinhan Sample', 0, 1, 1, 1, 304, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560333, 1677764800, 1, 4, 0, 0, '', 1422560335, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(26, 'Jenk Sample', 0, 1, 1, 1, 316, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560185, 1677764800, 1, 4, 0, 0, '', 1422560203, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(27, 'Raditz Sample', 0, 1, 1, 1, 328, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560276, 1677764800, 1, 4, 0, 0, '', 1422560294, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(28, 'C16 Sample', 0, 1, 1, 1, 340, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560147, 1677764800, 1, 4, 0, 0, '', 1422560167, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(29, 'Turles Sample', 0, 1, 1, 1, 352, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1422560335, 1677764800, 1, 4, 0, 0, '', 1422560359, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(30, 'Bulma Sample', 0, 1, 1, 1, 364, 250, 250, 0, 68, 76, 78, 39, 136, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 0, 1422560124, 1677764800, 1, 4, 0, 0, '', 1422560146, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(31, 'Bardock Sample', 0, 1, 1, 1, 230, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 655, 399, 7, '', 400, 1, 1436740850, 303746388, 1, 4, 0, 0, '', 1436740910, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(33, 'Senky', 0, 6, 5, 500, 8, 250, 250, 2058474800, 0, 0, 0, 0, 400, 0, 0, 250, 250, 0, 100, 1, 98, 189, 7, '', 400, 1, 1558744200, 16777343, 1, 4, 0, 0, '', 1558757239, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(36, 'Bulma', 0, 1, 8, 615, 364, 153750, 153750, 3852614700, 0, 0, 0, 0, 301, 0, 75, 153750, 153750, 11084, 125, 1, 100, 189, 7, '', 61800, 0, 1558746853, 16777343, 1, 4, 0, 0, '', 1558748316, 0, 0, 151096500, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(37, 'Goku', 0, 1, 8, 1, 1, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 0, 0, 0, '', 400, 1, 0, 0, 1, 4, 0, 0, '', 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL),
(40, 'Cooler', 0, 1, 8, 1, 192, 250, 250, 0, 68, 76, 78, 39, 128, 0, 0, 250, 250, 0, 100, 1, 0, 0, 0, '', 400, 1, 0, 0, 1, 4, 0, 0, '', 0, 0, 0, 151200000, 2, 150, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '', 0, 0, 0, '', 0, 0, '', NULL, NULL);

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players` FOR EACH ROW BEGIN
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
        UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) UNSIGNED NOT NULL,
  `level` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(3, 1, 101, 12634, 1, ''),
(3, 3, 102, 12764, 1, ''),
(3, 4, 103, 12664, 1, ''),
(3, 5, 104, 12776, 100, 0x0f64),
(3, 6, 105, 12698, 1, ''),
(3, 7, 106, 12683, 1, ''),
(3, 8, 107, 12697, 1, ''),
(3, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(3, 10, 109, 12775, 100, 0x0f64),
(3, 102, 110, 2667, 100, 0x0f64),
(4, 1, 101, 12634, 1, ''),
(4, 3, 102, 12764, 1, ''),
(4, 4, 103, 12664, 1, ''),
(4, 5, 104, 12776, 100, 0x0f64),
(4, 6, 105, 12698, 1, ''),
(4, 7, 106, 12683, 1, ''),
(4, 8, 107, 12697, 1, ''),
(4, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(4, 10, 109, 12775, 100, 0x0f64),
(4, 102, 110, 2667, 100, 0x0f64),
(5, 1, 101, 12634, 1, ''),
(5, 3, 102, 12764, 1, ''),
(5, 4, 103, 12664, 1, ''),
(5, 5, 104, 2667, 100, 0x0f64),
(5, 6, 105, 12736, 1, ''),
(5, 7, 106, 12683, 1, ''),
(5, 8, 107, 12697, 1, ''),
(5, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(5, 10, 109, 12737, 1, 0x0f01),
(5, 102, 110, 12776, 100, 0x0f64),
(5, 102, 111, 12775, 100, 0x0f64),
(6, 1, 101, 12634, 1, ''),
(6, 3, 102, 12764, 1, ''),
(6, 4, 103, 12664, 1, ''),
(6, 5, 104, 12776, 100, 0x0f64),
(6, 6, 105, 12698, 1, ''),
(6, 7, 106, 12683, 1, ''),
(6, 8, 107, 12697, 1, ''),
(6, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(6, 10, 109, 12775, 100, 0x0f64),
(6, 102, 110, 2667, 100, 0x0f64),
(7, 1, 101, 12634, 1, ''),
(7, 3, 102, 12764, 1, ''),
(7, 4, 103, 12664, 1, ''),
(7, 5, 104, 12776, 100, 0x0f64),
(7, 6, 105, 12698, 1, ''),
(7, 7, 106, 12683, 1, ''),
(7, 8, 107, 12697, 1, ''),
(7, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(7, 10, 109, 12775, 100, 0x0f64),
(7, 102, 110, 2667, 100, 0x0f64),
(8, 1, 101, 12634, 1, ''),
(8, 3, 102, 12764, 1, ''),
(8, 4, 103, 12664, 1, ''),
(8, 5, 104, 12776, 100, 0x0f64),
(8, 6, 105, 12716, 1, ''),
(8, 7, 106, 12683, 1, ''),
(8, 8, 107, 12697, 1, ''),
(8, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(8, 10, 109, 12775, 100, 0x0f64),
(8, 102, 110, 2667, 100, 0x0f64),
(9, 1, 101, 12634, 1, ''),
(9, 3, 102, 12764, 1, ''),
(9, 4, 103, 12664, 1, ''),
(9, 5, 104, 2667, 100, 0x0f64),
(9, 6, 105, 12736, 1, ''),
(9, 7, 106, 12683, 1, ''),
(9, 8, 107, 12697, 1, ''),
(9, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(9, 10, 109, 12737, 1, 0x0f01),
(9, 102, 110, 12776, 100, 0x0f64),
(9, 102, 111, 12775, 100, 0x0f64),
(10, 1, 101, 12634, 1, ''),
(10, 3, 102, 12764, 1, ''),
(10, 4, 103, 12664, 1, ''),
(10, 5, 104, 12776, 100, 0x0f64),
(10, 6, 105, 12698, 1, ''),
(10, 7, 106, 12683, 1, ''),
(10, 8, 107, 12697, 1, ''),
(10, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(10, 10, 109, 12775, 100, 0x0f64),
(10, 102, 110, 2667, 100, 0x0f64),
(11, 1, 101, 12634, 1, ''),
(11, 3, 102, 12764, 1, ''),
(11, 4, 103, 12664, 1, ''),
(11, 5, 104, 12776, 100, 0x0f64),
(11, 6, 105, 12698, 1, ''),
(11, 7, 106, 12683, 1, ''),
(11, 8, 107, 12697, 1, ''),
(11, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(11, 10, 109, 12775, 100, 0x0f64),
(11, 102, 110, 2667, 100, 0x0f64),
(12, 1, 101, 12634, 1, ''),
(12, 3, 102, 12764, 1, ''),
(12, 4, 103, 12664, 1, ''),
(12, 5, 104, 12776, 100, 0x0f64),
(12, 6, 105, 12698, 1, ''),
(12, 7, 106, 12683, 1, ''),
(12, 8, 107, 12697, 1, ''),
(12, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(12, 10, 109, 12775, 100, 0x0f64),
(12, 102, 110, 2667, 100, 0x0f64),
(13, 1, 101, 12634, 1, ''),
(13, 3, 102, 12764, 1, ''),
(13, 4, 103, 12664, 1, ''),
(13, 5, 104, 12776, 100, 0x0f64),
(13, 6, 105, 12698, 1, ''),
(13, 7, 106, 12683, 1, ''),
(13, 8, 107, 12697, 1, ''),
(13, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(13, 10, 109, 12775, 100, 0x0f64),
(13, 102, 110, 2667, 100, 0x0f64),
(14, 1, 101, 12634, 1, ''),
(14, 3, 102, 12764, 1, ''),
(14, 4, 103, 12664, 1, ''),
(14, 5, 104, 12776, 100, 0x0f64),
(14, 6, 105, 12698, 1, ''),
(14, 7, 106, 12683, 1, ''),
(14, 8, 107, 12697, 1, ''),
(14, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(14, 10, 109, 12775, 100, 0x0f64),
(14, 102, 110, 2667, 100, 0x0f64),
(15, 1, 101, 12634, 1, ''),
(15, 3, 102, 12764, 1, ''),
(15, 4, 103, 12664, 1, ''),
(15, 5, 104, 12776, 100, 0x0f64),
(15, 6, 105, 12698, 1, ''),
(15, 7, 106, 12683, 1, ''),
(15, 8, 107, 12697, 1, ''),
(15, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(15, 10, 109, 12775, 100, 0x0f64),
(15, 102, 110, 2667, 100, 0x0f64),
(16, 1, 101, 12634, 1, ''),
(16, 3, 102, 12764, 1, ''),
(16, 4, 103, 12664, 1, ''),
(16, 5, 104, 12776, 100, 0x0f64),
(16, 6, 105, 12716, 1, ''),
(16, 7, 106, 12683, 1, ''),
(16, 8, 107, 12697, 1, ''),
(16, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(16, 10, 109, 12775, 100, 0x0f64),
(16, 102, 110, 2667, 100, 0x0f64),
(17, 1, 101, 12634, 1, ''),
(17, 3, 102, 12764, 1, ''),
(17, 4, 103, 12664, 1, ''),
(17, 5, 104, 12776, 100, 0x0f64),
(17, 6, 105, 12698, 1, ''),
(17, 7, 106, 12683, 1, ''),
(17, 8, 107, 12697, 1, ''),
(17, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(17, 10, 109, 12775, 100, 0x0f64),
(17, 102, 110, 2667, 100, 0x0f64),
(18, 1, 101, 12634, 1, ''),
(18, 3, 102, 12764, 1, ''),
(18, 4, 103, 12664, 1, ''),
(18, 5, 104, 2667, 100, 0x0f64),
(18, 6, 105, 12736, 1, ''),
(18, 7, 106, 12683, 1, ''),
(18, 8, 107, 12697, 1, ''),
(18, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(18, 10, 109, 12737, 1, 0x0f01),
(18, 102, 110, 12776, 100, 0x0f64),
(18, 102, 111, 12775, 100, 0x0f64),
(19, 1, 101, 12634, 1, ''),
(19, 3, 102, 12764, 1, ''),
(19, 4, 103, 12664, 1, ''),
(19, 5, 104, 12776, 100, 0x0f64),
(19, 6, 105, 12698, 1, ''),
(19, 7, 106, 12683, 1, ''),
(19, 8, 107, 12697, 1, ''),
(19, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(19, 10, 109, 12775, 100, 0x0f64),
(19, 102, 110, 2667, 100, 0x0f64),
(20, 1, 101, 12634, 1, ''),
(20, 3, 102, 12764, 1, ''),
(20, 4, 103, 12664, 1, ''),
(20, 5, 104, 12776, 100, 0x0f64),
(20, 6, 105, 12698, 1, ''),
(20, 7, 106, 12683, 1, ''),
(20, 8, 107, 12697, 1, ''),
(20, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(20, 10, 109, 12775, 100, 0x0f64),
(20, 102, 110, 2667, 100, 0x0f64),
(21, 1, 101, 12634, 1, ''),
(21, 3, 102, 12764, 1, ''),
(21, 4, 103, 12664, 1, ''),
(21, 5, 104, 12776, 100, 0x0f64),
(21, 6, 105, 12698, 1, ''),
(21, 7, 106, 12683, 1, ''),
(21, 8, 107, 12697, 1, ''),
(21, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(21, 10, 109, 12775, 100, 0x0f64),
(21, 102, 110, 2667, 100, 0x0f64),
(22, 1, 101, 12634, 1, ''),
(22, 3, 102, 12764, 1, ''),
(22, 4, 103, 12664, 1, ''),
(22, 5, 104, 2667, 100, 0x0f64),
(22, 6, 105, 12736, 1, ''),
(22, 7, 106, 12683, 1, ''),
(22, 8, 107, 12697, 1, ''),
(22, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(22, 10, 109, 12737, 1, 0x0f01),
(22, 102, 110, 12776, 100, 0x0f64),
(22, 102, 111, 12775, 100, 0x0f64),
(23, 1, 101, 12634, 1, ''),
(23, 3, 102, 12764, 1, ''),
(23, 4, 103, 12664, 1, ''),
(23, 5, 104, 12776, 100, 0x0f64),
(23, 6, 105, 12698, 1, ''),
(23, 7, 106, 12683, 1, ''),
(23, 8, 107, 12697, 1, ''),
(23, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(23, 10, 109, 12775, 100, 0x0f64),
(23, 102, 110, 2667, 100, 0x0f64),
(24, 1, 101, 12634, 1, ''),
(24, 3, 102, 12764, 1, ''),
(24, 4, 103, 12664, 1, ''),
(24, 5, 104, 12776, 100, 0x0f64),
(24, 6, 105, 12716, 1, ''),
(24, 7, 106, 12683, 1, ''),
(24, 8, 107, 12697, 1, ''),
(24, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(24, 10, 109, 12775, 100, 0x0f64),
(24, 102, 110, 2667, 100, 0x0f64),
(25, 1, 101, 12634, 1, ''),
(25, 3, 102, 12764, 1, ''),
(25, 4, 103, 12664, 1, ''),
(25, 5, 104, 12776, 100, 0x0f64),
(25, 6, 105, 12698, 1, ''),
(25, 7, 106, 12683, 1, ''),
(25, 8, 107, 12697, 1, ''),
(25, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(25, 10, 109, 12775, 100, 0x0f64),
(25, 102, 110, 2667, 100, 0x0f64),
(26, 1, 101, 12634, 1, ''),
(26, 3, 102, 12764, 1, ''),
(26, 4, 103, 12664, 1, ''),
(26, 5, 104, 12776, 100, 0x0f64),
(26, 6, 105, 12698, 1, ''),
(26, 7, 106, 12683, 1, ''),
(26, 8, 107, 12697, 1, ''),
(26, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(26, 10, 109, 12775, 100, 0x0f64),
(26, 102, 110, 2667, 100, 0x0f64),
(27, 1, 101, 12634, 1, ''),
(27, 3, 102, 12764, 1, ''),
(27, 4, 103, 12664, 1, ''),
(27, 5, 104, 12776, 100, 0x0f64),
(27, 6, 105, 12698, 1, ''),
(27, 7, 106, 12683, 1, ''),
(27, 8, 107, 12697, 1, ''),
(27, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(27, 10, 109, 12775, 100, 0x0f64),
(27, 102, 110, 2667, 100, 0x0f64),
(28, 1, 101, 12634, 1, ''),
(28, 3, 102, 12764, 1, ''),
(28, 4, 103, 12664, 1, ''),
(28, 5, 104, 12776, 100, 0x0f64),
(28, 6, 105, 12698, 1, ''),
(28, 7, 106, 12683, 1, ''),
(28, 8, 107, 12697, 1, ''),
(28, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(28, 10, 109, 12775, 100, 0x0f64),
(28, 102, 110, 2667, 100, 0x0f64),
(29, 1, 101, 12634, 1, ''),
(29, 3, 102, 12764, 1, ''),
(29, 4, 103, 12664, 1, ''),
(29, 5, 104, 12776, 100, 0x0f64),
(29, 6, 105, 12698, 1, ''),
(29, 7, 106, 12683, 1, ''),
(29, 8, 107, 12697, 1, ''),
(29, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(29, 10, 109, 12775, 100, 0x0f64),
(29, 102, 110, 2667, 100, 0x0f64),
(30, 1, 101, 12634, 1, ''),
(30, 3, 102, 12764, 1, ''),
(30, 4, 103, 12664, 1, ''),
(30, 5, 104, 12776, 100, 0x0f64),
(30, 6, 105, 12698, 1, ''),
(30, 7, 106, 12683, 1, ''),
(30, 8, 107, 12697, 1, ''),
(30, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(30, 10, 109, 12775, 100, 0x0f64),
(30, 102, 110, 2667, 100, 0x0f64),
(31, 1, 101, 12634, 1, ''),
(31, 3, 102, 12764, 1, ''),
(31, 4, 103, 12664, 1, ''),
(31, 5, 104, 12776, 100, 0x0f64),
(31, 6, 105, 12698, 1, ''),
(31, 7, 106, 12683, 1, ''),
(33, 1, 101, 2457, 1, ''),
(33, 3, 102, 12764, 1, ''),
(33, 4, 103, 2463, 1, ''),
(33, 5, 104, 2510, 1, ''),
(33, 6, 105, 13537, 1, ''),
(33, 7, 106, 2647, 1, ''),
(33, 8, 107, 2645, 1, ''),
(33, 102, 108, 2157, 1, 0x0f01),
(33, 102, 109, 5958, 1, ''),
(33, 102, 110, 5958, 1, ''),
(33, 102, 111, 13538, 1, ''),
(33, 102, 112, 13539, 100, 0x0f64),
(36, 1, 101, 2457, 1, ''),
(36, 3, 102, 12764, 1, ''),
(36, 4, 103, 2463, 1, ''),
(36, 5, 104, 2510, 1, ''),
(36, 6, 105, 13538, 1, ''),
(36, 7, 106, 2647, 1, ''),
(36, 8, 107, 2645, 1, ''),
(36, 9, 108, 12758, 1, 0x8001000700636861726765730201000000),
(36, 10, 109, 13539, 99, 0x0f63),
(36, 102, 110, 2160, 99, 0x0f63),
(36, 102, 111, 2157, 1, 0x0f01),
(36, 102, 112, 5958, 1, ''),
(36, 102, 113, 5958, 1, ''),
(36, 102, 114, 13537, 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_killers`
--

CREATE TABLE `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_skills`
--

CREATE TABLE `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0),
(7, 0, 10, 0),
(7, 1, 10, 0),
(7, 2, 10, 0),
(7, 3, 10, 0),
(7, 4, 10, 0),
(7, 5, 10, 0),
(7, 6, 10, 0),
(8, 0, 10, 0),
(8, 1, 10, 0),
(8, 2, 10, 0),
(8, 3, 10, 0),
(8, 4, 10, 0),
(8, 5, 10, 0),
(8, 6, 10, 0),
(9, 0, 10, 0),
(9, 1, 10, 0),
(9, 2, 10, 0),
(9, 3, 10, 0),
(9, 4, 10, 0),
(9, 5, 10, 0),
(9, 6, 10, 0),
(10, 0, 10, 0),
(10, 1, 10, 0),
(10, 2, 10, 0),
(10, 3, 10, 0),
(10, 4, 10, 0),
(10, 5, 10, 0),
(10, 6, 10, 0),
(11, 0, 10, 0),
(11, 1, 10, 0),
(11, 2, 10, 0),
(11, 3, 10, 0),
(11, 4, 10, 0),
(11, 5, 10, 0),
(11, 6, 10, 0),
(12, 0, 10, 0),
(12, 1, 10, 0),
(12, 2, 10, 0),
(12, 3, 10, 0),
(12, 4, 10, 0),
(12, 5, 10, 0),
(12, 6, 10, 0),
(13, 0, 10, 0),
(13, 1, 10, 0),
(13, 2, 10, 0),
(13, 3, 10, 0),
(13, 4, 10, 0),
(13, 5, 10, 0),
(13, 6, 10, 0),
(14, 0, 10, 0),
(14, 1, 10, 0),
(14, 2, 10, 0),
(14, 3, 10, 0),
(14, 4, 10, 0),
(14, 5, 10, 0),
(14, 6, 10, 0),
(15, 0, 10, 0),
(15, 1, 10, 0),
(15, 2, 10, 0),
(15, 3, 10, 0),
(15, 4, 10, 0),
(15, 5, 10, 0),
(15, 6, 10, 0),
(16, 0, 10, 0),
(16, 1, 10, 0),
(16, 2, 10, 0),
(16, 3, 10, 0),
(16, 4, 10, 0),
(16, 5, 10, 0),
(16, 6, 10, 0),
(17, 0, 10, 0),
(17, 1, 10, 0),
(17, 2, 10, 0),
(17, 3, 10, 0),
(17, 4, 10, 0),
(17, 5, 10, 0),
(17, 6, 10, 0),
(18, 0, 10, 0),
(18, 1, 10, 0),
(18, 2, 10, 0),
(18, 3, 10, 0),
(18, 4, 10, 0),
(18, 5, 10, 0),
(18, 6, 10, 0),
(19, 0, 10, 0),
(19, 1, 10, 0),
(19, 2, 10, 0),
(19, 3, 10, 0),
(19, 4, 10, 0),
(19, 5, 10, 0),
(19, 6, 10, 0),
(20, 0, 10, 0),
(20, 1, 10, 0),
(20, 2, 10, 0),
(20, 3, 10, 0),
(20, 4, 10, 0),
(20, 5, 10, 0),
(20, 6, 10, 0),
(21, 0, 10, 0),
(21, 1, 10, 0),
(21, 2, 10, 0),
(21, 3, 10, 0),
(21, 4, 10, 0),
(21, 5, 10, 0),
(21, 6, 10, 0),
(22, 0, 10, 0),
(22, 1, 10, 0),
(22, 2, 10, 0),
(22, 3, 10, 0),
(22, 4, 10, 0),
(22, 5, 10, 0),
(22, 6, 10, 0),
(23, 0, 10, 0),
(23, 1, 10, 0),
(23, 2, 10, 0),
(23, 3, 10, 0),
(23, 4, 10, 0),
(23, 5, 10, 0),
(23, 6, 10, 0),
(24, 0, 10, 0),
(24, 1, 10, 0),
(24, 2, 10, 0),
(24, 3, 10, 0),
(24, 4, 10, 0),
(24, 5, 10, 0),
(24, 6, 10, 0),
(25, 0, 10, 0),
(25, 1, 10, 0),
(25, 2, 10, 0),
(25, 3, 10, 0),
(25, 4, 10, 0),
(25, 5, 10, 0),
(25, 6, 10, 0),
(26, 0, 10, 0),
(26, 1, 10, 0),
(26, 2, 10, 0),
(26, 3, 10, 0),
(26, 4, 10, 0),
(26, 5, 10, 0),
(26, 6, 10, 0),
(27, 0, 10, 0),
(27, 1, 10, 0),
(27, 2, 10, 0),
(27, 3, 10, 0),
(27, 4, 10, 0),
(27, 5, 10, 0),
(27, 6, 10, 0),
(28, 0, 10, 0),
(28, 1, 10, 0),
(28, 2, 10, 0),
(28, 3, 10, 0),
(28, 4, 10, 0),
(28, 5, 10, 0),
(28, 6, 10, 0),
(29, 0, 10, 0),
(29, 1, 10, 0),
(29, 2, 10, 0),
(29, 3, 10, 0),
(29, 4, 10, 0),
(29, 5, 10, 0),
(29, 6, 10, 0),
(30, 0, 10, 0),
(30, 1, 10, 0),
(30, 2, 10, 0),
(30, 3, 10, 0),
(30, 4, 10, 0),
(30, 5, 10, 0),
(30, 6, 10, 0),
(31, 0, 10, 0),
(31, 1, 10, 0),
(31, 2, 10, 0),
(31, 3, 10, 0),
(31, 4, 10, 0),
(31, 5, 10, 0),
(31, 6, 10, 0),
(33, 0, 10, 0),
(33, 1, 10, 0),
(33, 2, 10, 0),
(33, 3, 10, 0),
(33, 4, 10, 0),
(33, 5, 10, 0),
(33, 6, 10, 0),
(36, 0, 67, 8428),
(36, 1, 10, 0),
(36, 2, 56, 1232),
(36, 3, 10, 0),
(36, 4, 10, 0),
(36, 5, 60, 2012),
(36, 6, 10, 0),
(37, 0, 10, 0),
(37, 1, 10, 0),
(37, 2, 10, 0),
(37, 3, 10, 0),
(37, 4, 10, 0),
(37, 5, 10, 0),
(37, 6, 10, 0),
(40, 0, 10, 0),
(40, 1, 10, 0),
(40, 2, 10, 0),
(40, 3, 10, 0),
(40, 4, 10, 0),
(40, 5, 10, 0),
(40, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(33, '1219', '0'),
(33, '30024', '0'),
(33, '3482101', '0'),
(33, '50000', '1558632776.5'),
(33, '60150', '1'),
(33, '95498', '1'),
(36, '1219', '0'),
(36, '30024', '0'),
(36, '3482101', '0'),
(36, '50000', '1558746895.5'),
(36, '60150', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_viplist`
--

CREATE TABLE `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '27'),
('encryption', '2'),
('vahash_key', '8HY4-465K-TY5B-FA6P');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_motd`
--

CREATE TABLE `server_motd` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(1, 0, 'Welcome to The Forgotten Server!'),
(2, 0, 'Welcome on Dragon Ball Night Apocalypse! Enjoy!\nwww.dbna.pl'),
(3, 0, 'Bem-vindo ao DBUniverse, divirta-se!'),
(4, 0, 'Welcome on Dragon Ball Night Apocalypse! Enjoy!\nwww.dbna.pl'),
(5, 0, 'Bem-vindo ao DBUniverse, divirta-se!'),
(6, 0, 'Bem-vindo ao DBSuperGOD, divirta-se!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_record`
--

CREATE TABLE `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(0, 0, 0),
(1, 0, 1436777623),
(2, 0, 1436777933),
(3, 0, 1436779473),
(4, 0, 1436780048),
(5, 0, 1436780148),
(6, 0, 1436784123),
(7, 0, 1436963108);

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_reports`
--

CREATE TABLE `server_reports` (
  `id` int(11) NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tiles`
--

CREATE TABLE `tiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `house_id` int(10) UNSIGNED NOT NULL,
  `x` int(5) UNSIGNED NOT NULL,
  `y` int(5) UNSIGNED NOT NULL,
  `z` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tiles`
--

INSERT INTO `tiles` (`id`, `world_id`, `house_id`, `x`, `y`, `z`) VALUES
(0, 0, 1, 115, 183, 7),
(1, 0, 1, 116, 180, 7),
(2, 0, 1, 116, 181, 7),
(3, 0, 2, 84, 177, 7),
(4, 0, 2, 84, 178, 7),
(5, 0, 2, 82, 182, 7),
(6, 0, 3, 78, 177, 7),
(7, 0, 3, 78, 178, 7),
(8, 0, 3, 76, 182, 7),
(9, 0, 4, 72, 177, 7),
(10, 0, 4, 72, 178, 7),
(11, 0, 4, 70, 182, 7),
(12, 0, 5, 46, 181, 7),
(13, 0, 5, 46, 182, 7),
(14, 0, 5, 51, 183, 7),
(15, 0, 6, 73, 172, 7),
(16, 0, 6, 73, 173, 7),
(17, 0, 6, 78, 174, 7),
(18, 0, 7, 73, 167, 7),
(19, 0, 7, 73, 168, 7),
(20, 0, 7, 78, 169, 7),
(21, 0, 8, 79, 158, 7),
(22, 0, 8, 79, 159, 7),
(23, 0, 8, 81, 162, 7),
(24, 0, 9, 84, 158, 7),
(25, 0, 9, 84, 159, 7),
(26, 0, 9, 86, 162, 7),
(27, 0, 10, 79, 151, 7),
(28, 0, 10, 78, 154, 7),
(29, 0, 10, 79, 152, 7),
(30, 0, 11, 89, 163, 7),
(31, 0, 11, 89, 164, 7),
(32, 0, 11, 93, 164, 7),
(33, 0, 12, 89, 159, 7),
(34, 0, 12, 89, 160, 7),
(35, 0, 12, 93, 160, 7),
(36, 0, 13, 89, 155, 7),
(37, 0, 13, 89, 156, 7),
(38, 0, 13, 93, 156, 7),
(39, 0, 14, 89, 151, 7),
(40, 0, 14, 89, 152, 7),
(41, 0, 14, 93, 152, 7),
(42, 0, 15, 100, 151, 7),
(43, 0, 15, 96, 152, 7),
(44, 0, 15, 100, 152, 7),
(45, 0, 16, 89, 151, 6),
(46, 0, 16, 89, 152, 6),
(47, 0, 16, 93, 152, 6),
(48, 0, 17, 89, 155, 6),
(49, 0, 17, 89, 156, 6),
(50, 0, 17, 93, 156, 6),
(51, 0, 18, 89, 159, 6),
(52, 0, 18, 89, 160, 6),
(53, 0, 18, 93, 160, 6),
(54, 0, 19, 89, 163, 6),
(55, 0, 19, 89, 164, 6),
(56, 0, 19, 93, 164, 6),
(57, 0, 20, 101, 158, 6),
(58, 0, 20, 105, 156, 6),
(59, 0, 20, 105, 157, 6),
(60, 0, 21, 101, 163, 6),
(61, 0, 21, 105, 161, 6),
(62, 0, 21, 105, 162, 6),
(63, 0, 22, 89, 151, 5),
(64, 0, 22, 89, 152, 5),
(65, 0, 22, 93, 152, 5),
(66, 0, 23, 89, 155, 5),
(67, 0, 23, 89, 156, 5),
(68, 0, 23, 93, 156, 5),
(69, 0, 24, 89, 159, 5),
(70, 0, 24, 89, 160, 5),
(71, 0, 24, 93, 160, 5),
(72, 0, 25, 89, 163, 5),
(73, 0, 25, 89, 164, 5),
(74, 0, 25, 93, 164, 5),
(75, 0, 26, 101, 158, 5),
(76, 0, 26, 105, 156, 5),
(77, 0, 26, 105, 157, 5),
(78, 0, 27, 101, 163, 5),
(79, 0, 27, 105, 161, 5),
(80, 0, 27, 105, 162, 5),
(81, 0, 28, 89, 151, 4),
(82, 0, 28, 89, 152, 4),
(83, 0, 28, 93, 152, 4),
(84, 0, 29, 89, 155, 4),
(85, 0, 29, 89, 156, 4),
(86, 0, 29, 93, 156, 4),
(87, 0, 30, 89, 159, 4),
(88, 0, 30, 89, 160, 4),
(89, 0, 30, 93, 160, 4),
(90, 0, 31, 89, 163, 4),
(91, 0, 31, 89, 164, 4),
(92, 0, 31, 93, 164, 4),
(93, 0, 32, 101, 158, 4),
(94, 0, 32, 105, 156, 4),
(95, 0, 32, 105, 157, 4),
(96, 0, 33, 101, 163, 4),
(97, 0, 33, 105, 161, 4),
(98, 0, 33, 105, 162, 4),
(99, 0, 34, 56, 193, 6),
(100, 0, 34, 56, 194, 6),
(101, 0, 34, 54, 196, 6),
(102, 0, 35, 62, 193, 6),
(103, 0, 35, 62, 194, 6),
(104, 0, 35, 60, 196, 6),
(105, 0, 36, 56, 199, 6),
(106, 0, 36, 56, 200, 6),
(107, 0, 37, 62, 199, 6),
(108, 0, 37, 62, 200, 6),
(109, 0, 38, 56, 193, 5),
(110, 0, 38, 56, 194, 5),
(111, 0, 38, 54, 196, 5),
(112, 0, 39, 62, 193, 5),
(113, 0, 39, 62, 194, 5),
(114, 0, 39, 60, 196, 5),
(115, 0, 40, 54, 198, 5),
(116, 0, 40, 56, 199, 5),
(117, 0, 40, 56, 200, 5),
(118, 0, 41, 60, 198, 5),
(119, 0, 41, 62, 199, 5),
(120, 0, 41, 62, 200, 5),
(121, 0, 42, 55, 176, 6),
(122, 0, 42, 55, 177, 6),
(123, 0, 42, 57, 178, 6),
(124, 0, 43, 62, 176, 6),
(125, 0, 43, 62, 177, 6),
(126, 0, 43, 64, 179, 6),
(127, 0, 44, 72, 179, 6),
(128, 0, 44, 77, 177, 6),
(129, 0, 44, 77, 178, 6),
(130, 0, 45, 73, 172, 6),
(131, 0, 45, 73, 173, 6),
(132, 0, 45, 78, 174, 6),
(133, 0, 46, 73, 167, 6),
(134, 0, 46, 73, 168, 6),
(135, 0, 46, 78, 169, 6),
(136, 0, 47, 79, 161, 6),
(137, 0, 47, 79, 162, 6),
(138, 0, 47, 81, 163, 6),
(139, 0, 48, 84, 161, 6),
(140, 0, 48, 84, 162, 6),
(141, 0, 48, 86, 163, 6),
(142, 0, 49, 111, 142, 7),
(143, 0, 49, 116, 140, 7),
(144, 0, 49, 116, 141, 7),
(145, 0, 50, 111, 136, 7),
(146, 0, 50, 116, 134, 7),
(147, 0, 50, 116, 135, 7),
(148, 0, 51, 111, 130, 7),
(149, 0, 51, 116, 128, 7),
(150, 0, 51, 116, 129, 7),
(151, 0, 52, 111, 124, 7),
(152, 0, 52, 116, 122, 7),
(153, 0, 52, 116, 123, 7),
(154, 0, 53, 93, 138, 7),
(155, 0, 53, 93, 139, 7),
(156, 0, 53, 96, 132, 7),
(157, 0, 53, 99, 138, 7),
(158, 0, 53, 99, 139, 7),
(159, 0, 54, 88, 132, 7),
(160, 0, 54, 85, 138, 7),
(161, 0, 54, 85, 139, 7),
(162, 0, 54, 91, 138, 7),
(163, 0, 54, 91, 139, 7),
(164, 0, 55, 77, 138, 7),
(165, 0, 55, 77, 139, 7),
(166, 0, 55, 80, 132, 7),
(167, 0, 55, 83, 138, 7),
(168, 0, 55, 83, 139, 7),
(169, 0, 56, 77, 121, 7),
(170, 0, 56, 77, 122, 7),
(171, 0, 56, 83, 121, 7),
(172, 0, 56, 83, 122, 7),
(173, 0, 56, 80, 128, 7),
(174, 0, 57, 85, 121, 7),
(175, 0, 57, 85, 122, 7),
(176, 0, 57, 91, 121, 7),
(177, 0, 57, 91, 122, 7),
(178, 0, 57, 88, 128, 7),
(179, 0, 58, 93, 121, 7),
(180, 0, 58, 93, 122, 7),
(181, 0, 58, 99, 121, 7),
(182, 0, 58, 99, 122, 7),
(183, 0, 58, 96, 128, 7),
(184, 0, 59, 70, 107, 7),
(185, 0, 59, 70, 108, 7),
(186, 0, 59, 75, 109, 7),
(187, 0, 60, 70, 100, 7),
(188, 0, 60, 70, 101, 7),
(189, 0, 60, 75, 102, 7),
(190, 0, 61, 46, 91, 7),
(191, 0, 61, 46, 94, 7),
(192, 0, 61, 47, 94, 7),
(193, 0, 61, 57, 95, 7),
(194, 0, 61, 58, 95, 7),
(195, 0, 61, 64, 103, 7),
(196, 0, 62, 69, 84, 7),
(197, 0, 62, 69, 85, 7),
(198, 0, 62, 76, 87, 7),
(199, 0, 62, 76, 88, 7),
(200, 0, 62, 71, 94, 7),
(201, 0, 63, 75, 90, 7),
(202, 0, 63, 75, 91, 7),
(203, 0, 63, 79, 94, 7),
(204, 0, 63, 83, 84, 7),
(205, 0, 63, 83, 85, 7),
(206, 0, 64, 108, 92, 7),
(207, 0, 64, 116, 86, 7),
(208, 0, 64, 116, 87, 7),
(209, 0, 64, 116, 89, 7),
(210, 0, 64, 116, 90, 7),
(211, 0, 65, 116, 93, 7),
(212, 0, 65, 116, 94, 7),
(213, 0, 65, 111, 96, 7),
(214, 0, 66, 49, 119, 7),
(215, 0, 66, 52, 116, 7),
(216, 0, 66, 49, 120, 7),
(217, 0, 67, 41, 119, 7),
(218, 0, 67, 44, 116, 7),
(219, 0, 67, 41, 120, 7),
(220, 0, 68, 41, 110, 7),
(221, 0, 68, 41, 111, 7),
(222, 0, 68, 44, 114, 7),
(223, 0, 69, 49, 110, 7),
(224, 0, 69, 49, 111, 7),
(225, 0, 69, 52, 114, 7),
(226, 0, 70, 48, 119, 6),
(227, 0, 70, 51, 116, 6),
(228, 0, 70, 48, 120, 6),
(229, 0, 71, 41, 119, 6),
(230, 0, 71, 44, 116, 6),
(231, 0, 71, 41, 120, 6),
(232, 0, 72, 41, 110, 6),
(233, 0, 72, 41, 111, 6),
(234, 0, 72, 44, 114, 6),
(235, 0, 73, 48, 110, 6),
(236, 0, 73, 48, 111, 6),
(237, 0, 73, 51, 114, 6),
(238, 0, 74, 50, 117, 5),
(239, 0, 74, 50, 118, 5),
(240, 0, 74, 55, 119, 5),
(241, 0, 75, 41, 119, 5),
(242, 0, 75, 47, 119, 5),
(243, 0, 75, 41, 120, 5),
(244, 0, 76, 53, 110, 5),
(245, 0, 76, 53, 111, 5),
(246, 0, 76, 47, 114, 5),
(247, 0, 78, 262, 594, 7),
(248, 0, 78, 262, 595, 7),
(249, 0, 78, 265, 598, 7),
(250, 0, 79, 271, 594, 7),
(251, 0, 79, 271, 595, 7),
(252, 0, 79, 274, 598, 7),
(253, 0, 80, 280, 594, 7),
(254, 0, 80, 280, 595, 7),
(255, 0, 80, 283, 598, 7),
(256, 0, 81, 88, 618, 7),
(257, 0, 81, 88, 619, 7),
(258, 0, 81, 94, 618, 7),
(259, 0, 81, 94, 619, 7),
(260, 0, 81, 91, 622, 7),
(261, 0, 81, 251, 606, 7),
(262, 0, 81, 251, 607, 7),
(263, 0, 81, 254, 610, 7),
(264, 0, 82, 97, 618, 7),
(265, 0, 82, 97, 619, 7),
(266, 0, 82, 103, 618, 7),
(267, 0, 82, 103, 619, 7),
(268, 0, 82, 100, 622, 7),
(269, 0, 82, 260, 606, 7),
(270, 0, 82, 260, 607, 7),
(271, 0, 82, 263, 610, 7),
(272, 0, 83, 106, 618, 7),
(273, 0, 83, 106, 619, 7),
(274, 0, 83, 109, 622, 7),
(275, 0, 83, 112, 618, 7),
(276, 0, 83, 112, 619, 7),
(277, 0, 83, 271, 606, 7),
(278, 0, 83, 271, 607, 7),
(279, 0, 83, 274, 610, 7),
(280, 0, 84, 280, 606, 7),
(281, 0, 84, 280, 607, 7),
(282, 0, 84, 283, 610, 7),
(283, 0, 85, 450, 633, 7),
(284, 0, 85, 450, 634, 7),
(285, 0, 85, 451, 638, 7),
(286, 0, 86, 487, 634, 7),
(287, 0, 86, 487, 635, 7),
(288, 0, 86, 484, 636, 7),
(289, 0, 87, 446, 643, 7),
(290, 0, 87, 446, 644, 7),
(291, 0, 87, 453, 642, 7),
(292, 0, 88, 437, 625, 6),
(293, 0, 88, 437, 626, 6),
(294, 0, 88, 438, 629, 6),
(295, 0, 89, 441, 625, 6),
(296, 0, 89, 441, 626, 6),
(297, 0, 89, 442, 629, 6),
(298, 0, 90, 439, 642, 6),
(299, 0, 90, 438, 645, 6),
(300, 0, 90, 438, 646, 6),
(301, 0, 91, 443, 642, 6),
(302, 0, 91, 442, 645, 6),
(303, 0, 91, 442, 646, 6),
(304, 0, 92, 481, 623, 6),
(305, 0, 92, 481, 624, 6),
(306, 0, 92, 483, 626, 6),
(307, 0, 92, 484, 626, 6),
(308, 0, 94, 534, 639, 7),
(309, 0, 94, 534, 640, 7),
(310, 0, 94, 535, 642, 7),
(311, 0, 94, 532, 645, 7),
(312, 0, 94, 533, 645, 7),
(313, 0, 95, 526, 639, 7),
(314, 0, 95, 526, 640, 7),
(315, 0, 95, 527, 645, 7),
(316, 0, 95, 528, 645, 7),
(317, 0, 96, 521, 639, 7),
(318, 0, 96, 521, 640, 7),
(319, 0, 96, 522, 645, 7),
(320, 0, 96, 523, 645, 7),
(321, 0, 97, 512, 645, 7),
(322, 0, 97, 512, 646, 7),
(323, 0, 97, 518, 646, 7),
(324, 0, 97, 518, 647, 7),
(325, 0, 98, 512, 650, 7),
(326, 0, 98, 512, 651, 7),
(327, 0, 98, 518, 651, 7),
(328, 0, 98, 515, 654, 7),
(329, 0, 98, 518, 652, 7),
(330, 0, 99, 531, 639, 6),
(331, 0, 99, 531, 640, 6),
(332, 0, 99, 533, 643, 6),
(333, 0, 99, 534, 643, 6),
(334, 0, 99, 535, 641, 6),
(335, 0, 100, 526, 639, 6),
(336, 0, 100, 526, 640, 6),
(337, 0, 100, 528, 643, 6),
(338, 0, 100, 529, 643, 6),
(339, 0, 101, 521, 639, 6),
(340, 0, 101, 521, 640, 6),
(341, 0, 101, 523, 643, 6),
(342, 0, 101, 524, 643, 6),
(343, 0, 102, 512, 645, 6),
(344, 0, 102, 512, 646, 6),
(345, 0, 102, 516, 646, 6),
(346, 0, 102, 516, 647, 6),
(347, 0, 103, 512, 650, 6),
(348, 0, 103, 512, 651, 6),
(349, 0, 103, 514, 654, 6),
(350, 0, 103, 516, 652, 6),
(351, 0, 103, 516, 653, 6),
(352, 0, 104, 94, 99, 7),
(353, 0, 104, 94, 100, 7),
(354, 0, 104, 96, 96, 7),
(355, 0, 105, 354, 941, 7),
(356, 0, 105, 354, 942, 7),
(357, 0, 105, 360, 941, 7),
(358, 0, 105, 360, 942, 7),
(359, 0, 105, 357, 945, 7),
(360, 0, 106, 320, 939, 7),
(361, 0, 106, 323, 938, 7),
(362, 0, 106, 323, 939, 7),
(363, 0, 107, 320, 935, 7),
(364, 0, 107, 323, 934, 7),
(365, 0, 107, 323, 935, 7),
(366, 0, 108, 320, 931, 7),
(367, 0, 108, 323, 930, 7),
(368, 0, 108, 323, 931, 7),
(369, 0, 109, 335, 922, 7),
(370, 0, 109, 333, 926, 7),
(371, 0, 109, 333, 927, 7),
(372, 0, 110, 341, 922, 7),
(373, 0, 110, 339, 926, 7),
(374, 0, 110, 339, 927, 7),
(375, 0, 111, 347, 922, 7),
(376, 0, 111, 345, 926, 7),
(377, 0, 111, 345, 927, 7),
(378, 0, 112, 334, 907, 7),
(379, 0, 112, 334, 908, 7),
(380, 0, 112, 337, 907, 6),
(381, 0, 112, 337, 908, 6),
(382, 0, 112, 335, 914, 7),
(383, 0, 113, 343, 907, 6),
(384, 0, 113, 340, 907, 7),
(385, 0, 113, 343, 908, 6),
(386, 0, 113, 340, 908, 7),
(387, 0, 113, 341, 914, 7),
(388, 0, 114, 346, 907, 7),
(389, 0, 114, 349, 907, 6),
(390, 0, 114, 346, 908, 7),
(391, 0, 114, 349, 908, 6),
(392, 0, 114, 347, 914, 7),
(393, 0, 115, 349, 893, 7),
(394, 0, 115, 346, 901, 7),
(395, 0, 115, 346, 902, 7),
(396, 0, 115, 348, 901, 7),
(397, 0, 115, 348, 902, 7),
(398, 0, 116, 355, 894, 7),
(399, 0, 116, 355, 895, 7),
(400, 0, 116, 362, 898, 7),
(401, 0, 116, 362, 899, 7),
(402, 0, 116, 354, 901, 6),
(403, 0, 116, 354, 902, 6),
(404, 0, 116, 356, 901, 6),
(405, 0, 116, 356, 902, 6),
(406, 0, 117, 376, 923, 7),
(407, 0, 117, 368, 927, 7),
(408, 0, 117, 376, 924, 7),
(409, 0, 117, 376, 930, 7),
(410, 0, 117, 376, 931, 7),
(411, 0, 118, 369, 935, 7),
(412, 0, 118, 376, 933, 7),
(413, 0, 118, 376, 934, 7),
(414, 0, 119, 376, 939, 7),
(415, 0, 119, 369, 941, 7),
(416, 0, 119, 376, 940, 7),
(417, 0, 120, 378, 923, 7),
(418, 0, 120, 378, 924, 7),
(419, 0, 120, 378, 930, 7),
(420, 0, 120, 378, 931, 7),
(421, 0, 120, 386, 927, 7),
(422, 0, 121, 378, 933, 7),
(423, 0, 121, 378, 934, 7),
(424, 0, 121, 386, 935, 7),
(425, 0, 122, 80, 64, 13),
(426, 0, 122, 80, 65, 13),
(427, 0, 122, 80, 64, 14),
(428, 0, 122, 80, 65, 14),
(429, 0, 122, 82, 70, 14),
(430, 0, 122, 83, 70, 14),
(431, 0, 123, 89, 64, 13),
(432, 0, 123, 89, 65, 13),
(433, 0, 123, 89, 64, 14),
(434, 0, 123, 89, 65, 14),
(435, 0, 123, 91, 70, 14),
(436, 0, 123, 92, 70, 14),
(437, 0, 124, 98, 64, 13),
(438, 0, 124, 98, 65, 13),
(439, 0, 124, 98, 64, 14),
(440, 0, 124, 98, 65, 14),
(441, 0, 124, 100, 70, 14),
(442, 0, 124, 101, 70, 14),
(443, 0, 126, 516, 750, 13),
(444, 0, 126, 518, 751, 13),
(445, 0, 126, 514, 754, 12),
(446, 0, 126, 514, 755, 12),
(447, 0, 126, 518, 752, 13),
(448, 0, 126, 516, 756, 13),
(449, 0, 127, 508, 750, 13),
(450, 0, 127, 510, 751, 13),
(451, 0, 127, 506, 754, 12),
(452, 0, 127, 506, 755, 12),
(453, 0, 127, 510, 752, 13),
(454, 0, 127, 508, 756, 13),
(455, 0, 128, 506, 727, 12),
(456, 0, 128, 510, 727, 13),
(457, 0, 128, 506, 728, 12),
(458, 0, 128, 510, 728, 13),
(459, 0, 128, 508, 732, 13),
(460, 0, 129, 514, 727, 12),
(461, 0, 129, 518, 727, 13),
(462, 0, 129, 514, 728, 12),
(463, 0, 129, 518, 728, 13),
(464, 0, 130, 488, 727, 13),
(465, 0, 130, 488, 728, 13),
(466, 0, 130, 492, 731, 13),
(467, 0, 131, 502, 727, 13),
(468, 0, 131, 498, 731, 13),
(469, 0, 131, 502, 728, 13),
(470, 0, 132, 492, 728, 12),
(471, 0, 132, 488, 733, 12),
(472, 0, 132, 488, 734, 12),
(473, 0, 133, 498, 728, 12),
(474, 0, 133, 502, 733, 12),
(475, 0, 133, 502, 734, 12),
(476, 0, 134, 535, 756, 13),
(477, 0, 134, 535, 757, 13),
(478, 0, 134, 539, 760, 13),
(479, 0, 135, 549, 756, 13),
(480, 0, 135, 549, 757, 13),
(481, 0, 135, 545, 760, 13),
(482, 0, 136, 539, 757, 12),
(483, 0, 136, 535, 762, 12),
(484, 0, 136, 535, 763, 12),
(485, 0, 137, 545, 757, 12),
(486, 0, 137, 549, 762, 12),
(487, 0, 137, 549, 763, 12),
(488, 0, 138, 539, 742, 13),
(489, 0, 138, 541, 740, 13),
(490, 0, 138, 541, 741, 13),
(491, 0, 139, 545, 742, 13),
(492, 0, 139, 547, 740, 13),
(493, 0, 139, 547, 741, 13),
(494, 0, 140, 551, 742, 13),
(495, 0, 140, 553, 740, 13),
(496, 0, 140, 553, 741, 13),
(497, 0, 141, 539, 751, 13),
(498, 0, 141, 541, 752, 13),
(499, 0, 141, 541, 753, 13),
(500, 0, 142, 545, 751, 13),
(501, 0, 142, 547, 752, 13),
(502, 0, 142, 547, 753, 13),
(503, 0, 143, 551, 751, 13),
(504, 0, 143, 553, 752, 13),
(505, 0, 143, 553, 753, 13),
(506, 0, 144, 562, 735, 12),
(507, 0, 144, 565, 735, 13),
(508, 0, 144, 562, 736, 12),
(509, 0, 144, 561, 738, 13),
(510, 0, 144, 565, 736, 13),
(511, 0, 145, 553, 733, 13),
(512, 0, 146, 545, 733, 13),
(513, 0, 147, 537, 733, 13),
(514, 0, 148, 733, 1134, 7),
(515, 0, 148, 734, 1134, 7),
(516, 0, 148, 738, 1132, 7),
(517, 0, 149, 733, 1145, 7),
(518, 0, 149, 734, 1145, 7),
(519, 0, 149, 738, 1143, 7),
(520, 0, 150, 746, 1127, 7),
(521, 0, 150, 744, 1128, 7),
(522, 0, 150, 744, 1129, 7),
(523, 0, 150, 746, 1134, 7),
(524, 0, 151, 751, 1127, 7),
(525, 0, 151, 749, 1128, 7),
(526, 0, 151, 749, 1129, 7),
(527, 0, 151, 751, 1134, 7),
(528, 0, 152, 756, 1127, 7),
(529, 0, 152, 754, 1128, 7),
(530, 0, 152, 754, 1129, 7),
(531, 0, 152, 756, 1134, 7),
(532, 0, 153, 746, 1141, 7),
(533, 0, 153, 747, 1147, 7),
(534, 0, 153, 747, 1148, 7),
(535, 0, 154, 751, 1141, 7),
(536, 0, 154, 752, 1147, 7),
(537, 0, 154, 752, 1148, 7),
(538, 0, 155, 756, 1141, 7),
(539, 0, 155, 757, 1147, 7),
(540, 0, 155, 757, 1148, 7),
(541, 0, 156, 788, 1131, 7),
(542, 0, 156, 788, 1132, 7),
(543, 0, 156, 790, 1135, 7),
(544, 0, 157, 790, 1141, 7),
(545, 0, 157, 792, 1143, 7),
(546, 0, 157, 792, 1144, 7),
(547, 0, 158, 796, 1141, 7),
(548, 0, 158, 798, 1143, 7),
(549, 0, 158, 798, 1144, 7),
(550, 0, 159, 802, 1141, 7),
(551, 0, 159, 804, 1143, 7),
(552, 0, 159, 804, 1144, 7),
(553, 0, 160, 807, 1131, 7),
(554, 0, 160, 807, 1132, 7),
(555, 0, 160, 809, 1135, 7),
(556, 0, 161, 815, 1131, 7),
(557, 0, 161, 815, 1132, 7),
(558, 0, 161, 817, 1135, 7),
(559, 0, 162, 118, 171, 7),
(560, 0, 163, 114, 194, 7),
(561, 0, 163, 115, 192, 7),
(562, 0, 163, 115, 193, 7),
(563, 0, 164, 108, 199, 7),
(564, 0, 164, 113, 196, 7),
(565, 0, 164, 113, 197, 7),
(566, 0, 164, 112, 202, 7),
(567, 0, 164, 113, 202, 7),
(568, 0, 165, 147, 168, 7),
(569, 0, 165, 147, 169, 7),
(570, 0, 165, 147, 170, 7),
(571, 0, 165, 148, 168, 7),
(572, 0, 165, 150, 172, 7),
(573, 0, 165, 148, 176, 7),
(574, 0, 165, 149, 176, 7),
(575, 0, 166, 161, 168, 7),
(576, 0, 166, 161, 169, 7),
(577, 0, 166, 161, 170, 7),
(578, 0, 166, 162, 168, 7),
(579, 0, 166, 164, 172, 7),
(580, 0, 166, 162, 176, 7),
(581, 0, 166, 163, 176, 7),
(582, 0, 167, 143, 205, 7),
(583, 0, 167, 143, 206, 7),
(584, 0, 167, 143, 207, 7),
(585, 0, 167, 148, 199, 7),
(586, 0, 167, 149, 199, 7),
(587, 0, 167, 145, 203, 7),
(588, 0, 167, 144, 207, 7),
(589, 0, 168, 159, 203, 7),
(590, 0, 168, 157, 205, 7),
(591, 0, 168, 157, 206, 7),
(592, 0, 168, 157, 207, 7),
(593, 0, 168, 158, 207, 7),
(594, 0, 168, 162, 199, 7),
(595, 0, 168, 163, 199, 7),
(596, 0, 169, 102, 192, 7),
(597, 0, 169, 102, 193, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_items`
--

CREATE TABLE `tile_items` (
  `tile_id` int(10) UNSIGNED NOT NULL,
  `world_id` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tile_items`
--

INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(0, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013900000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202331272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(1, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(3, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(4, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(5, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(6, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(7, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(8, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(9, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(10, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(11, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033363030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(12, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(13, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(14, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203336303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(15, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(16, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(17, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(18, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(19, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(20, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732033303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(21, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(22, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(23, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(24, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(25, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(26, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f757365202339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(27, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(28, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203731303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(29, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(30, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(31, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(32, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(33, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(34, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(35, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(36, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(37, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(38, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(39, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(40, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(41, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(42, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(43, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203231303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(44, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(45, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(46, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(47, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(48, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(49, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(50, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(51, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(52, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(53, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(54, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(55, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(56, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(57, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203236303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(58, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(59, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(60, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203331303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(61, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(62, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(63, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(64, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(65, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(66, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(67, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(68, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(69, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(70, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(71, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(72, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(73, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(74, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233235272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(75, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203236303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(76, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(77, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(78, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203331303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(79, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(80, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(81, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(82, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(83, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(84, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(85, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(86, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233239272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(87, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(88, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(89, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(90, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(91, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(92, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(93, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203233303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(94, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(95, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(96, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203331303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(97, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(98, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(99, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(100, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(101, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203234303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(102, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(103, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(104, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203234303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(105, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(106, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(107, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(108, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(109, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(110, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(111, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203234303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(112, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(113, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(114, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203234303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(115, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(116, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(117, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(118, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(119, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(120, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(121, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(122, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(123, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(124, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(125, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(126, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203234303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(127, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203333303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(128, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(129, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(130, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(131, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(132, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(133, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(134, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(135, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(136, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(137, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(138, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(139, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(140, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(141, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(142, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233439272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(143, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(144, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(145, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e013a00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233530272e20206f776e73207468697320686f7573652e0600646f6f7269640201000000),
(146, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(147, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(148, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(149, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(150, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(151, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203732303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(152, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(153, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(154, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(155, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(156, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203635303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(157, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(158, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(159, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203635303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(160, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(161, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(162, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(163, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(164, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(165, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(166, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203635303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(167, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(168, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(169, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(170, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(171, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(172, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(173, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203634303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(174, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(175, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(176, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(177, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(178, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203634303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(179, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(180, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(181, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(182, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(183, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203634303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(184, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(185, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(186, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203738303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(187, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(188, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(189, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203534303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(190, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(191, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(192, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(193, 0, 1, 0, 1252, 1, ''),
(194, 0, 1, 0, 1252, 1, ''),
(195, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027526f7820486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313632303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(196, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(197, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(198, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(199, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(200, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203834303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(201, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(202, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(203, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233633272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203932303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(204, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(205, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(206, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233634272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203737303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(207, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(208, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(209, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(210, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(211, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(212, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(213, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233635272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203835303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(214, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(215, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233636272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203336303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(216, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(217, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(218, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233637272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203431303030303020676f6c6420636f696e732e0600646f6f726964020b000000),
(219, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(220, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(221, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(222, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233638272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203430303030303020676f6c6420636f696e732e0600646f6f726964020c000000),
(223, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(224, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(225, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233639272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(226, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(227, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233730272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203336303030303020676f6c6420636f696e732e0600646f6f7269640204000000),
(228, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(229, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(230, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233731272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203336303030303020676f6c6420636f696e732e0600646f6f7269640207000000),
(231, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(232, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(233, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(234, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233732272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f7269640206000000),
(235, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(236, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(237, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233733272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f7269640205000000),
(238, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(239, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(240, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233734272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330303030303020676f6c6420636f696e732e0600646f6f7269640210000000),
(241, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(242, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233735272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f726964020a000000),
(243, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(244, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(245, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(246, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233736272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203730303030303020676f6c6420636f696e732e0600646f6f726964020f000000),
(247, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(248, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(249, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233738272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(250, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(251, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(252, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233739272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(253, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(254, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(255, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233830272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(256, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(257, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(258, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(259, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(260, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(261, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(262, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(263, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233831272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(264, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(265, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(266, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(267, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(268, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(269, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(270, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(271, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233832272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(272, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(273, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(274, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(275, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(276, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(277, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(278, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(279, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233833272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(280, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(281, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(282, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233834272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203830303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(283, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(284, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(285, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233835272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203234303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(286, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(287, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(288, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233836272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(289, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(290, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(291, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233837272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203339303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(292, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(293, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(294, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233838272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(295, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(296, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(297, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233839272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203230303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(298, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233930272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203231303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(299, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(300, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(301, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233931272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203231303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(302, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(303, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(304, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(305, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(306, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203238303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(307, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233932272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203238303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(308, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(309, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(310, 0, 1, 0, 7028, 1, ''),
(311, 0, 1, 0, 7027, 1, ''),
(312, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233934272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(313, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(314, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(315, 0, 1, 0, 7027, 1, ''),
(316, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233935272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(317, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(318, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(319, 0, 1, 0, 7027, 1, ''),
(320, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233936272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(321, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(322, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(323, 0, 1, 0, 7028, 1, ''),
(324, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233937272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(325, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(326, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(327, 0, 1, 0, 7028, 1, ''),
(328, 0, 1, 0, 7027, 1, ''),
(329, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233938272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203335303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(330, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(331, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(332, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f75736520233939272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(333, 0, 1, 0, 7027, 1, ''),
(334, 0, 1, 0, 7028, 1, ''),
(335, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(336, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(337, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313030272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(338, 0, 1, 0, 7027, 1, ''),
(339, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(340, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(341, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(342, 0, 1, 0, 7027, 1, ''),
(343, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(344, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(345, 0, 1, 0, 7028, 1, ''),
(346, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(347, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(348, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(349, 0, 1, 0, 7027, 1, ''),
(350, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(351, 0, 1, 0, 7028, 1, ''),
(352, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(353, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(354, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203331303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(355, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(356, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(357, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(358, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(359, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203430303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(360, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203137303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(361, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(362, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(363, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203137303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(364, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(365, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(366, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203137303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(367, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(368, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(369, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203337303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(370, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(371, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(372, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313130272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203337303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(373, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(374, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(375, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313131272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203337303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(376, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(377, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(378, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(379, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(380, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(381, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(382, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313132272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313134303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(383, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(384, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(385, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(386, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(387, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313133272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313134303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(388, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(389, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(390, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(391, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(392, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313134272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313134303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(393, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313135272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203831303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(394, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(395, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(396, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(397, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(398, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(399, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(400, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(401, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313136272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(402, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(403, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(404, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(405, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(406, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(407, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313137272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(408, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(409, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(410, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(411, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313138272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203439303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(412, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(413, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(414, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(415, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313139272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203439303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(416, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(417, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(418, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(419, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(420, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(421, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313230272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(422, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(423, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(424, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313231272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203534303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(425, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(426, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(427, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(428, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(429, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313032303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(430, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313232272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313032303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(431, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(432, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(433, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(434, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(435, 0, 1, 0, 1253, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313032303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(436, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313233272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313032303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(437, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(438, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(439, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(440, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(441, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313032303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(442, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313234272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313032303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(443, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203931303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(444, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(445, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(446, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(447, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(448, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313236272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203931303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(449, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203931303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(450, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(451, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(452, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(453, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(454, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313237272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203931303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(455, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(456, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(457, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(458, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(459, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313238272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203930303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(460, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(461, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(462, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(463, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(464, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(465, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(466, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313330272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203435303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(467, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(468, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203436303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(469, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(470, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203435303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(471, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(472, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(473, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203436303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(474, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(475, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(476, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(477, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(478, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203435303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(479, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(480, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(481, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313335272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203436303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(482, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313336272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203435303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(483, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(484, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(485, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313337272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203436303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(486, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(487, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(488, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313338272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(489, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(490, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(491, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313339272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(492, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(493, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(494, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313430272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203138303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(495, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(496, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(497, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313431272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(498, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(499, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(500, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313432272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(501, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(502, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(503, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313433272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203139303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(504, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(505, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(506, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(507, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(508, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(509, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313434272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313035303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(510, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(511, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313435272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(512, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313436272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(513, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313437272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203135303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(514, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(515, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(516, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313438272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203336303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(517, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(518, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(519, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313439272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203336303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(520, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203535303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(521, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(522, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(523, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313530272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203535303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(524, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203535303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(525, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(526, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(527, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313531272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203535303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(528, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203535303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(529, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(530, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(531, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313532272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203535303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(532, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313533272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203431303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(533, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(534, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(535, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313534272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203431303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(536, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(537, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(538, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313535272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203431303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(539, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(540, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(541, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(542, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(543, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(544, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313537272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(545, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(546, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(547, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313538272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(548, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(549, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(550, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313539272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203235303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(551, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(552, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(553, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(554, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(555, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313630272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(556, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(557, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(558, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015e00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313631272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f737473203330303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(559, 0, 1, 0, 1249, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f7573652027556e6e616d656420486f7573652023313632272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313233303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(560, 0, 1, 0, 1249, 1, ''),
(561, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(562, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(563, 0, 1, 0, 1250, 1, ''),
(564, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(565, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(566, 0, 1, 0, 1252, 1, ''),
(567, 0, 1, 0, 1252, 1, ''),
(568, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(569, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(570, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(571, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(572, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323636303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(573, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323636303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(574, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202331272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323636303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(575, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(576, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(577, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(578, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(579, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323638303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(580, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323638303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(581, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202332272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323638303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(582, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(583, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(584, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(585, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323639303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(586, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323639303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(587, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202333272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323639303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(588, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(589, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323636303030303020676f6c6420636f696e732e0600646f6f7269640203000000),
(590, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(591, 0, 1, 0, 2590, 1, 0x80010007006465706f7469640201000000),
(592, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(593, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(594, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323636303030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(595, 0, 1, 0, 1252, 1, 0x8002000b006465736372697074696f6e015c00000049742062656c6f6e677320746f20686f7573652027446f6e61746520486f757365202334272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323636303030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(596, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(597, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e);

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `description` tinytext,
  `youtube` varchar(45) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `video_comments`
--

CREATE TABLE `video_comments` (
  `id` int(10) NOT NULL,
  `author` int(11) DEFAULT NULL,
  `video` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `text` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_featured_article`
--

CREATE TABLE `z_featured_article` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `read_more` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_forum`
--

INSERT INTO `z_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`) VALUES
(1, 1, 1436888559, 1, 0, 12, 2, 32, '<center>Hello, Today I give you the first screenshots from DBNA.\r\n<a href=\"img/ss1.png\">\r\n<img src=\"img/ss1.png\" width=\"70%\"/>\r\n</a>\r\n<a href=\"img/ss2.png\">\r\n<img src=\"img/ss2.png\" width=\"70%\"/>\r\n</a>\r\n<a href=\"img/ss3.png\">\r\n<img src=\"img/ss3.png\" width=\"70%\"/>\r\n</a>\r\n<a href=\"img/ss4.png\">\r\n<img src=\"img/ss4.png\" width=\"70%\"/>\r\n</a>\r\n<a href=\"img/ss5.png\">\r\n<img src=\"img/ss5.png\" width=\"70%\"/>\r\n</a>\r\n\r\nYou can enlarge screens by clicking on it.\r\n</center>', 'Screens of Dragon Ball Night Apocalypse', 0, 1436888559, 2, 1436910851, '83.20.255.254');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_network_box`
--

INSERT INTO `z_network_box` (`id`, `network_name`, `network_link`) VALUES
(1, 'facebook', 'newdbu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_history_item`
--

INSERT INTO `z_shop_history_item` (`id`, `to_name`, `to_account`, `from_nick`, `from_account`, `price`, `offer_id`, `trans_state`, `trans_start`, `trans_real`) VALUES
(1, 'Buu', 13, 'Anonymous', 13, 0, 'Shenron', 'realized', 1437519583, 1437519640),
(2, 'Kramer', 12, 'Anonymous', 12, 0, 'Shenron', 'realized', 1437521354, 1437531257),
(3, 'Buu', 13, 'Anonymous', 13, 0, 'Backpack de Gold', 'realized', 1437530302, 1437530335);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`) VALUES
(1, 20, 12633, 1, 0, 0, 'item', 'Armor: 60 | Speed +25 | Ki Blasting +5 | Ki +3000/s.', 'Cell Helmet'),
(2, 10, 12661, 1, 0, 0, 'item', 'Armor: 150 | Ki Blasting +20 | Ki +3000/s.', 'Cell Armor'),
(3, 15, 12632, 1, 0, 0, 'item', 'Armor: 60 | Speed +20 | Sword +5 | Health & Ki +2000/s.', 'Janemba Helmet'),
(4, 10, 12654, 1, 0, 0, 'item', 'Armor: 125 | Sword +10 | Health & Ki +3000/s.', 'Janemba Armor'),
(5, 10, 12679, 1, 0, 0, 'item', 'Armor: 75 | Sword +5 | Health & Ki +3000/s.', 'Janemba Legs'),
(6, 10, 12689, 1, 0, 0, 'item', 'Armor: 30 | Health & Ki +2000/s.', 'Janemba Boots'),
(7, 10, 12660, 1, 0, 0, 'item', 'Armor: 150 | Speed +15 | Health & Ki +3500/s.', 'Fusion Armor'),
(8, 10, 12680, 1, 0, 0, 'item', 'Armor: 85 | Speed +15 | Health & Ki +3500/s.', 'Fusion Legs'),
(9, 10, 12694, 1, 0, 0, 'item', 'Armor: 75 | Speed +15 | Health & Ki +3000/s.', 'Fusion Boots'),
(11, 5, 12655, 1, 0, 0, 'item', 'Armor: 85 | Health +5000/3s.', 'Goku Armor'),
(12, 5, 12675, 0, 0, 0, 'item', 'Armor: 50 | Ki +5000/3s.', 'Goku Legs'),
(13, 7, 12693, 0, 0, 0, 'item', 'Armor: 50 | Health & Ki +5000/3s.', 'Goku Boots'),
(14, 6, 12678, 1, 0, 0, 'item', 'Armor: 75 | Health & Ki +2500/s.', 'Goku SSJ5 Legs'),
(15, 15, 12662, 1, 0, 0, 'item', 'Armor: 200 | All Skills +5 | Health & Ki +5000/s.', 'Legendary Armor'),
(16, 15, 12681, 1, 0, 0, 'item', 'Armor: 100 | Health & Ki +5000/s.', 'Legendary Legs'),
(17, 15, 12695, 1, 0, 0, 'item', 'Armor: 85 | Health & Ki +4000/s.', 'Legendary Boots'),
(18, 20, 12663, 1, 0, 0, 'item', 'Armor: 250 | All Skills +5 | Health & Ki +6500/s.', 'Supreme North Armor'),
(19, 20, 12682, 1, 0, 0, 'item', 'Armor: 150 | All Skills +5 | Health & Ki +6500/s.', 'Supreme North Legs'),
(20, 20, 12696, 1, 0, 0, 'item', 'Armor: 100 | Health & Ki +5000/s.', 'Supreme North Boots'),
(21, 25, 13497, 1, 0, 0, 'item', 'Armor: 150 | Speed +25 | Ki Level +5 | Health & Ki +7500/s.', 'Bills Armor'),
(22, 25, 13498, 1, 0, 0, 'item', 'Armor: 100 | Speed +50 | Ki Level +5 | Health & Ki +7500/s.', 'Bills Legs'),
(23, 25, 13499, 1, 0, 0, 'item', 'Armor: 65 | Speed +100| Ki Level +3 | Health & Ki +5000/s.', 'Bills Boots'),
(24, 15, 12714, 1, 0, 0, 'item', 'Atk: 20 | Def: 20 | Strenght +10 | Effect | Fast Attack.', 'Glove Of Lies'),
(25, 15, 12733, 1, 0, 0, 'item', 'Atk: 20 | Def: 20 | Sword +10 | Effect | Fast Attack.', 'Hell Janemba Sword'),
(26, 15, 13447, 1, 0, 0, 'item', 'Atk: 20 | Def: 20 | Weapon +10 | Effect | Fast Attack.', 'Elypson'),
(27, 20, 13467, 1, 0, 0, 'item', 'Atk: 25 Def: 25 | Attack Speed +10 Strenght & Defense +10 | Effect | Fast Attack.', 'Golden Crystal Glove'),
(28, 20, 13466, 1, 0, 0, 'item', 'Atk: 25 Def: 25 | Attack Speed +10 Sword & Defense +10 | Effect | Fast Attack.', 'Mystic Sword'),
(29, 20, 12734, 1, 0, 0, 'item', 'Atk: 25 Def: 25 | Attack Speed +10  Weapon & Defense +10 | Effect | Fast Attack.', 'Goku Staff'),
(30, 15, 12735, 1, 0, 0, 'item', 'Def: 100 | Protect All 5% | Speed +100', 'Shield Of Glory'),
(31, 15, 13398, 1, 0, 0, 'item', 'Def: 250 | Protect All 5% | Speed -100', 'Tortoiseshell'),
(32, 20, 12759, 1, 0, 0, 'item', 'Protect All 10%.', 'Earring Of Magic'),
(33, 20, 10220, 1, 0, 0, 'item', 'Protect All 10%.', 'Leviathans Amulet'),
(36, 30, 13484, 1, 0, 0, 'mounts', 'Transforme-se em um Shenron.', 'VocaÃ§Ã£o Shenron'),
(37, 30, 13485, 1, 0, 0, 'mounts', 'Transforme-se em um Vegetto.', 'VocaÃ§Ã£o Vegetto'),
(38, 30, 13486, 1, 0, 0, 'mounts', 'Transforme-se em um Tapion.', 'VocaÃ§Ã£o Tapion'),
(39, 30, 13487, 1, 0, 0, 'mounts', 'Transforme-se em um Kame.', 'VocaÃ§Ã£o Kame'),
(40, 30, 13488, 1, 0, 0, 'mounts', 'Transforme-se em um King Vegeta.', 'VocaÃ§Ã£o King Vegeta'),
(41, 30, 13489, 1, 0, 0, 'mounts', 'Transforme-se em uma Kagome.', 'VocaÃ§Ã£o Kagome'),
(42, 30, 13490, 1, 0, 0, 'mounts', 'Transforme-se em um Zaiko.', 'VocaÃ§Ã£o Zaiko'),
(43, 30, 13491, 1, 0, 0, 'mounts', 'Transforme-se em um Chilled.', 'VocaÃ§Ã£o Chilled'),
(44, 30, 13492, 1, 0, 0, 'mounts', 'Transforme-se em um C8.', 'VocaÃ§Ã£o C8'),
(45, 27, 9004, 1, 0, 0, 'addons', 'Premium Scroll de 90 dias.', 'Premium Scroll'),
(48, 10, 5958, 1, 0, 0, 'addons', 'Premium Scroll de 30 dias.', 'Premium Scroll'),
(49, 7, 5957, 1, 0, 0, 'addons', 'Premium Scroll de 10 dias.', 'Premium Scroll'),
(50, 5, 12289, 1, 0, 0, 'addons', 'Recupera toda a Stamina.', 'Stamina Potion'),
(51, 5, 7440, 1, 0, 0, 'addons', 'Remove todos frags unjustified do seu personagem.', 'Remover Unjust');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `world_id` (`world_id`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`,`value`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD KEY `kill_id` (`kill_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_name`);

--
-- Indexes for table `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`,`world_id`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`world_id`);

--
-- Indexes for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_kills_ibfk_1` (`war_id`),
  ADD KEY `guild_kills_ibfk_2` (`death_id`),
  ADD KEY `guild_kills_ibfk_3` (`guild_id`);

--
-- Indexes for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `enemy_id` (`enemy_id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Indexes for table `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `house_data`
--
ALTER TABLE `house_data`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`);

--
-- Indexes for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`);

--
-- Indexes for table `killers`
--
ALTER TABLE `killers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `death_id` (`death_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`from`),
  ADD KEY `to` (`to`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsticker`
--
ALTER TABLE `newsticker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagsegurotransacoes`
--
ALTER TABLE `pagsegurotransacoes`
  ADD UNIQUE KEY `TransacaoID` (`TransacaoID`,`StatusTransacao`),
  ADD KEY `Referencia` (`Referencia`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`deleted`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `online` (`online`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_items`
--
ALTER TABLE `player_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_killers`
--
ALTER TABLE `player_killers`
  ADD KEY `kill_id` (`kill_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_skills`
--
ALTER TABLE `player_skills`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`name`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`key`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `vip_id` (`vip_id`);

--
-- Indexes for table `server_config`
--
ALTER TABLE `server_config`
  ADD UNIQUE KEY `config` (`config`);

--
-- Indexes for table `server_motd`
--
ALTER TABLE `server_motd`
  ADD UNIQUE KEY `id` (`id`,`world_id`);

--
-- Indexes for table `server_record`
--
ALTER TABLE `server_record`
  ADD UNIQUE KEY `record` (`record`,`world_id`,`timestamp`);

--
-- Indexes for table `server_reports`
--
ALTER TABLE `server_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `world_id` (`world_id`),
  ADD KEY `reads` (`reads`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `tiles`
--
ALTER TABLE `tiles`
  ADD UNIQUE KEY `id` (`id`,`world_id`),
  ADD KEY `x` (`x`,`y`,`z`),
  ADD KEY `house_id` (`house_id`,`world_id`);

--
-- Indexes for table `tile_items`
--
ALTER TABLE `tile_items`
  ADD UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author` (`author`);

--
-- Indexes for table `video_comments`
--
ALTER TABLE `video_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video` (`video`),
  ADD KEY `author` (`author`);

--
-- Indexes for table `z_featured_article`
--
ALTER TABLE `z_featured_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Indexes for table `z_network_box`
--
ALTER TABLE `z_network_box`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guild_kills`
--
ALTER TABLE `guild_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `killers`
--
ALTER TABLE `killers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsticker`
--
ALTER TABLE `newsticker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `player_deaths`
--
ALTER TABLE `player_deaths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `server_reports`
--
ALTER TABLE `server_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_comments`
--
ALTER TABLE `video_comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `z_featured_article`
--
ALTER TABLE `z_featured_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `z_network_box`
--
ALTER TABLE `z_network_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`,`world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `video_comments`
--
ALTER TABLE `video_comments`
  ADD CONSTRAINT `video_comments_ibfk_1` FOREIGN KEY (`video`) REFERENCES `videos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_comments_ibfk_2` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
