-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-08-2012 a las 14:19:46
-- Versión del servidor: 5.5.25a
-- Versión de PHP: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mudis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
CREATE TABLE IF NOT EXISTS `idiomas` (
  `idIdioma` tinyint(4) NOT NULL AUTO_INCREMENT,
  `idioma` varchar(45) NOT NULL,
  `abreviacion` varchar(10) NOT NULL,
  PRIMARY KEY (`idIdioma`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`idIdioma`, `idioma`, `abreviacion`) VALUES
(1, 'Español México', 'es-mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `idPais` tinyint(4) NOT NULL AUTO_INCREMENT,
  `pais` varchar(45) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`idPais`, `pais`, `abreviatura`) VALUES
(1, 'México', 'mx'),
(2, 'Costa Rica', 'cr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `idRol` tinyint(4) NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) DEFAULT NULL,
  `abreviacion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `rol`, `abreviacion`) VALUES
(1, 'Administrador', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `aPaterno` varchar(45) DEFAULT NULL,
  `aMaterno` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `idPais` tinyint(4) NOT NULL,
  `idIdioma` tinyint(4) NOT NULL,
  `idRol` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `FK_paises_usuarios` (`idPais`),
  KEY `FK_IDIOMAS_USUARIOS` (`idIdioma`),
  KEY `FK_ROLES_USUARIOS` (`idRol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `nombre`, `aPaterno`, `aMaterno`, `usuario`, `password`, `idPais`, `idIdioma`, `idRol`) VALUES
(1, 'admin', '-', '-', 'admin', '704b037a97fa9b25522b7c014c300f8a', 1, 1, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_IDIOMAS_USUARIOS` FOREIGN KEY (`idIdioma`) REFERENCES `idiomas` (`idIdioma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PAISES_USUARIOS` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ROLES_USUARIOS` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
