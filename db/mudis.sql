-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-09-2012 a las 06:02:09
-- Versión del servidor: 5.5.25a
-- Versión de PHP: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mudisemp_backend`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedido`
--

CREATE TABLE IF NOT EXISTS `detallespedido` (
  `idDetallePedido` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) unsigned NOT NULL,
  `modelo` varchar(100) COLLATE utf8_bin NOT NULL,
  `dispositivo` varchar(100) COLLATE utf8_bin NOT NULL,
  `cantidad` tinyint(3) unsigned NOT NULL,
  `precio` float unsigned NOT NULL,
  PRIMARY KEY (`idDetallePedido`),
  UNIQUE KEY `idDetallePedido_UNIQUE` (`idDetallePedido`),
  KEY `FK_DETALLES_PEDIDOS` (`idPedido`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `detallespedido`
--

INSERT INTO `detallespedido` (`idDetallePedido`, `idPedido`, `modelo`, `dispositivo`, `cantidad`, `precio`) VALUES
(1, 40, 'Arte en bronce', 'Apple - .iPhone 4S', 1, 179),
(2, 41, 'HUE1004', 'Motorola - Motorola RAZR Droid', 1, 179),
(3, 41, 'Doodle amor', 'Motorola - .Motorola Defy', 1, 179),
(4, 42, 'Mudis personalizado', 'Apple iPod Touch 4G', 1, 199),
(5, 43, 'Arte en bronce', 'Apple - .iPhone 4S', 1, 179),
(6, 44, 'HUE1004', 'Motorola - Motorola RAZR Droid', 1, 179),
(7, 44, 'Doodle amor', 'Motorola - .Motorola Defy', 1, 179),
(8, 45, 'Mudis personalizado', 'Apple iPod Touch 4G', 1, 199);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formasenvio`
--

CREATE TABLE IF NOT EXISTS `formasenvio` (
  `idFormaEnvio` tinyint(4) unsigned NOT NULL,
  `formaEnvio` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idFormaEnvio`),
  UNIQUE KEY `idFormaEnvio_UNIQUE` (`idFormaEnvio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `formasenvio`
--

INSERT INTO `formasenvio` (`idFormaEnvio`, `formaEnvio`) VALUES
(1, 'Gratis por Mexpost');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaspago`
--

CREATE TABLE IF NOT EXISTS `formaspago` (
  `idFormaPago` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `formaPago` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idFormaPago`),
  UNIQUE KEY `idFormaPago_UNIQUE` (`idFormaPago`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `formaspago`
--

INSERT INTO `formaspago` (`idFormaPago`, `formaPago`) VALUES
(1, 'DineroMail');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE IF NOT EXISTS `idiomas` (
  `idIdioma` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `idioma` varchar(45) NOT NULL,
  `abreviacion` varchar(10) NOT NULL,
  PRIMARY KEY (`idIdioma`),
  UNIQUE KEY `idIdioma_UNIQUE` (`idIdioma`)
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

CREATE TABLE IF NOT EXISTS `paises` (
  `idPais` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `pais` varchar(45) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  PRIMARY KEY (`idPais`),
  UNIQUE KEY `idPais_UNIQUE` (`idPais`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`idPais`, `pais`, `abreviatura`) VALUES
(1, 'México', 'mx'),
(2, 'Costa Rica', 'cr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `idPedido` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idPais` tinyint(4) unsigned NOT NULL,
  `idFormaPago` tinyint(4) unsigned NOT NULL,
  `idFormaEnvio` tinyint(4) unsigned NOT NULL,
  `nombreComprador` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `apellidoComprador` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `emailComprador` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `direccion` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ciudad` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `region` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `provincia` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `totalProductos` smallint(4) NOT NULL,
  `totalPedido` float(8,2) NOT NULL,
  `fechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPedido`),
  UNIQUE KEY `idPedido_UNIQUE` (`idPedido`),
  KEY `FK_FORMASENVIO_PEDIDOS` (`idFormaEnvio`),
  KEY `FK_FORMASPAGO_PEDIDOS` (`idFormaPago`),
  KEY `FK_PAIS_PEDIDOS` (`idPais`),
  KEY `FK_PEDIDOS_PAISES` (`idPais`),
  KEY `FK_USUARIOS_FORMASPAGO` (`idFormaPago`),
  KEY `FK_USUARIOS_FORMASENVIO` (`idFormaEnvio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `idPais`, `idFormaPago`, `idFormaEnvio`, `nombreComprador`, `apellidoComprador`, `emailComprador`, `direccion`, `ciudad`, `region`, `provincia`, `totalProductos`, `totalPedido`, `fechaCreacion`) VALUES
(1, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '0000-00-00 00:00:00'),
(2, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '0000-00-00 00:00:00'),
(3, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '0000-00-00 00:00:00'),
(4, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '0000-00-00 00:00:00'),
(5, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '0000-00-00 00:00:00'),
(6, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '0000-00-00 00:00:00'),
(7, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '0000-00-00 00:00:00'),
(8, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '0000-00-00 00:00:00'),
(9, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '0000-00-00 00:00:00'),
(10, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '0000-00-00 00:00:00'),
(11, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '0000-00-00 00:00:00'),
(12, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '0000-00-00 00:00:00'),
(13, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '0000-00-00 00:00:00'),
(14, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '0000-00-00 00:00:00'),
(15, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '0000-00-00 00:00:00'),
(16, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '0000-00-00 00:00:00'),
(17, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '0000-00-00 00:00:00'),
(18, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '0000-00-00 00:00:00'),
(19, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '0000-00-00 00:00:00'),
(20, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '0000-00-00 00:00:00'),
(21, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '0000-00-00 00:00:00'),
(22, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '0000-00-00 00:00:00'),
(23, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '0000-00-00 00:00:00'),
(24, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '0000-00-00 00:00:00'),
(25, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '2012-09-06 06:09:29'),
(26, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '2012-09-06 06:09:29'),
(27, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '2012-09-06 06:09:29'),
(28, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '2012-09-06 06:10:04'),
(29, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '2012-09-06 06:10:04'),
(30, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '2012-09-06 06:10:04'),
(31, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '2012-09-06 06:25:13'),
(32, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '2012-09-06 06:25:13'),
(33, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '2012-09-06 06:25:14'),
(34, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '2012-09-06 06:25:51'),
(35, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '2012-09-06 06:25:51'),
(36, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '2012-09-06 06:25:51'),
(37, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '2012-09-06 06:26:28'),
(38, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '2012-09-06 06:26:28'),
(39, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '2012-09-06 06:26:28'),
(40, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '2012-09-06 06:28:06'),
(41, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '2012-09-06 06:28:06'),
(42, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '2012-09-06 06:28:06'),
(43, 1, 1, 1, 'prueba', 'prueba', 'cesar_cgfg@hotmail.com', 'prueba prueba', 'prueba', 'prueba', 'prueba', 1, 179.00, '2012-09-11 19:01:00'),
(44, 1, 1, 1, 'Fernando ', 'Dubon', 'fherduglam@hotmail.com', 'Calzada de Tlalpan #2148, Col. Campestre Chur', 'MÃ©xico D.F.', '', 'Del. CoyoacÃ¡n', 2, 358.00, '2012-09-11 19:01:00'),
(45, 1, 1, 1, 'Ulises', 'Rodriguez', 'kenny_arkana@hotmail.com', '22 norte No. 609 interior 13 5 norte 115-b te', 'tehuacan', '', '', 1, 199.00, '2012-09-11 19:01:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `idRol` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  `abreviacion` varchar(10) NOT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `idRol_UNIQUE` (`idRol`)
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

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuarios` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `aPaterno` varchar(45) DEFAULT NULL,
  `aMaterno` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `idPais` tinyint(4) unsigned NOT NULL,
  `idIdioma` tinyint(4) unsigned NOT NULL,
  `idRol` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  UNIQUE KEY `idUsuarios_UNIQUE` (`idUsuarios`),
  KEY `FK_paises_usuarios` (`idPais`),
  KEY `FK_IDIOMAS_USUARIOS` (`idIdioma`),
  KEY `FK_ROLES_USUARIOS` (`idRol`),
  KEY `FK_USUARIOS_PAISES` (`idPais`),
  KEY `FK_USUARIOS_ROLES` (`idRol`),
  KEY `FK_USUARIOS_IDIOMAS` (`idIdioma`)
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
-- Filtros para la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD CONSTRAINT `FK_DETALLES_PEDIDOS` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_PEDIDOS_PAISES` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIOS_FORMASENVIO` FOREIGN KEY (`idFormaEnvio`) REFERENCES `formasenvio` (`idFormaEnvio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIOS_FORMASPAGO` FOREIGN KEY (`idFormaPago`) REFERENCES `formaspago` (`idFormaPago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_USUARIOS_IDIOMAS` FOREIGN KEY (`idIdioma`) REFERENCES `idiomas` (`idIdioma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIOS_PAISES` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_USUARIOS_ROLES` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
