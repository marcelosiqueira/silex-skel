-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 04/08/2015 às 09:12
-- Versão do servidor: 5.5.44-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `skel`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table for Profiles' AUTO_INCREMENT=3 ;

--
-- Fazendo dump de dados para tabela `profiles`
--

INSERT INTO `profiles` (`id`, `title`, `created`, `updated`) VALUES
(1, 'Profile 1', '2015-08-04 09:07:38', NULL),
(2, '', '2015-08-04 09:08:09', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `email` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `password` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '1',
  `profile_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_idx` (`profile_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table for Users' AUTO_INCREMENT=2 ;

--
-- Fazendo dump de dados para tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`, `profile_id`, `created`, `updated`) VALUES
(1, 'user', 'user@skel.com', '10203', 1, 1, '2015-08-04 09:10:00', NULL);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
