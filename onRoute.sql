-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-06-2011 a las 08:57:15
-- Versión del servidor: 5.1.44
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `onRoute`
--
CREATE DATABASE `onRoute` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `onRoute`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Participant`
--

CREATE TABLE IF NOT EXISTS `Participant` (
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`email`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcar la base de datos para la tabla `Participant`
--

INSERT INTO `Participant` (`email`, `name`) VALUES
('javidgon@gmail.com', 'Olympic games'),
('javidgon@gmail.com', 'Ruta de la plata'),
('usuario@gmail.com', 'Olympic games'),
('usuario@gmail.com', 'Unisciti con noi in Toscana!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Route`
--

CREATE TABLE IF NOT EXISTS `Route` (
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `country` varchar(50) CHARACTER SET latin1 NOT NULL,
  `province` varchar(50) CHARACTER SET latin1 NOT NULL,
  `city` varchar(50) CHARACTER SET latin1 NOT NULL,
  `description` varchar(200) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcar la base de datos para la tabla `Route`
--

INSERT INTO `Route` (`name`, `country`, `province`, `city`, `description`) VALUES
('Olympic games', 'UK', 'London', 'London', 'Come with us to see this awesome event! In 2012!'),
('Ruta de la plata', 'Spain', 'Seville', 'Seville', 'Una ruta que recorre unos grandiosos parajes rurales! Empezamos el 15 de Agosto!'),
('Unisciti con noi in Toscana!', 'Italia', 'Toscana', 'Firenze', 'Adesso puoi venire con noi a un prezzo meraviglioso! Solo 25 Euro! Cominciamo il 15 di luglio.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `surname` varchar(50) CHARACTER SET latin1 NOT NULL,
  `gender` varchar(10) CHARACTER SET latin1 NOT NULL,
  `country` varchar(50) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcar la base de datos para la tabla `User`
--

INSERT INTO `User` (`email`, `password`, `name`, `surname`, `gender`, `country`) VALUES
('javidgon@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'Giuseppe', 'Felini', 'Male', 'Italy'),
('root@onroute.com', 'dc76e9f0c0006e8f919e0c515c66dbba3982f785', 'Root', 'Root', 'Male', 'Spain'),
('usuario@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 'Joe', 'Smith', 'Male', 'US');
