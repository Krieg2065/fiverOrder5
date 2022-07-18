-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 18-07-2022 a las 02:53:31
-- Versión del servidor: 5.7.38
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wwwportalsdv_sdvapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` int(11) NOT NULL,
  `cedulaPaciente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombreExamen` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examen` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lectura` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fecha_examen` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relaciones`
--

CREATE TABLE `relaciones` (
  `id` int(11) NOT NULL,
  `cedulaMedico` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cedulaPaciente` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `tipoDocumento` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cedula` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(102) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `fechaNacimiento` datetime NOT NULL,
  `direccion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` decimal(65,0) NOT NULL,
  `email1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `examen` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaExamen` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lectura` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fechaCreacionUsuario` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `tipoDocumento`, `cedula`, `password`, `nombre`, `apellido`, `fechaNacimiento`, `direccion`, `telefono`, `email1`, `email2`, `rol`, `examen`, `fechaExamen`, `lectura`, `fechaCreacionUsuario`) VALUES
(1, 'Cédula', 'Admin', '12345678', 'Administrador', 'Admin', '2022-06-02 00:00:00', 'SDV', '2161022', 'admin@portalsdv.com', NULL, 'admin', NULL, NULL, NULL, NULL),
(2, 'Cédula', 'Remisor', '12345678', 'Remisor Prueba', 'Numero Uno', '2022-07-01 08:52:12', 'SDV', '2161023', 'remisor@portalsdv.com', NULL, 'medico', NULL, NULL, NULL, '2022-06-26'),
(3, 'Cédula', 'Paciente', 'Paciente', 'Paciente Prueba', 'Numero Uno', '2022-06-02 00:00:00', 'SDV', '2161024', 'paciente@portalsdv.com', NULL, 'paciente', NULL, NULL, NULL, '2022-07-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `relaciones`
--
ALTER TABLE `relaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `email1` (`email1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `relaciones`
--
ALTER TABLE `relaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
