-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 28-Jul-2015 às 20:05
-- Versão do servidor: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `agenda`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`id` int(11) NOT NULL,
  `costumer_id` int(11) NOT NULL,
  `finish` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boxes`
--

CREATE TABLE IF NOT EXISTS `boxes` (
`id` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(10) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `costumers`
--

CREATE TABLE IF NOT EXISTS `costumers` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `prox` date NOT NULL,
  `inscription` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `events`
--

CREATE TABLE IF NOT EXISTS `events` (
`id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `all_day` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Marcado',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` date DEFAULT NULL,
  `modified` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `aplicador` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_types`
--

CREATE TABLE IF NOT EXISTS `event_types` (
`id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '1',
  `package` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
`id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `title`) VALUES
(1, 'Administrador'),
(2, 'Atendente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `parcels`
--

CREATE TABLE IF NOT EXISTS `parcels` (
`id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_type_id` int(11) NOT NULL,
  `real_value` decimal(10,2) NOT NULL,
  `obs` varchar(50) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
`id` int(11) NOT NULL,
  `costumer_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_types`
--

CREATE TABLE IF NOT EXISTS `payment_types` (
`id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `juros` decimal(10,2) NOT NULL DEFAULT '1.00'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Extraindo dados da tabela `payment_types`
--

INSERT INTO `payment_types` (`id`, `title`, `juros`) VALUES
(3, 'Dinheiro', '1.00'),
(4, 'Boleta', '1.00'),
(12, 'Master Card DÃ©bito', '1.00'),
(13, 'Master Card CrÃ©dito', '1.00'),
(14, 'Lagoacred DÃ©bito', '1.00'),
(15, 'Lagoacred CrÃ©dito', '1.00'),
(16, 'Lagoacred AntecipaÃ§Ã£o', '1.00'),
(17, 'Visa DÃ©bito', '1.00'),
(18, 'Visa CrÃ©dito', '1.00'),
(19, 'Cheque p/30 dias', '1.00'),
(20, 'Cheque p/60 dias', '1.00'),
(21, 'Cheque p/90 dias', '1.00'),
(23, 'cheque descontado', '1.00'),
(24, 'Cheque passado pra frente', '1.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `cod` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created`, `modified`, `group_id`) VALUES
(1, 'admin', 'cb0054f5ce2c30f9fdfef6c0b54688518d223d6d', '2014-09-17 03:43:49', '2014-09-17 03:43:49', 1),
(7, 're', 'aa8066d8f6caf480678767b2143a83262003409a', '2014-09-19 19:38:03', '2014-10-17 19:41:05', 2),
(8, 'Nat', 'aa8066d8f6caf480678767b2143a83262003409a', '2014-09-19 23:41:49', '2014-09-30 06:56:44', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boxes`
--
ALTER TABLE `boxes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `costumers`
--
ALTER TABLE `costumers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parcels`
--
ALTER TABLE `parcels`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `boxes`
--
ALTER TABLE `boxes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `costumers`
--
ALTER TABLE `costumers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `parcels`
--
ALTER TABLE `parcels`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
