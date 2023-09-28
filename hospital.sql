-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2023 a las 21:37:39
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `ID_DE_AREA` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermero`
--

CREATE TABLE `enfermero` (
  `ID_DE_ENFERMERO` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `FECHA_DE_NACIMIENTO` date DEFAULT NULL,
  `NUMERO_DE_TELEFONO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_de_emergencia`
--

CREATE TABLE `equipo_de_emergencia` (
  `ID_DE_EQUIPO` varchar(255) NOT NULL,
  `IDS_DE_LOS_MIEMBROS_DEL_EQUIPO` varchar(255) DEFAULT NULL,
  `FUNCIONES_DE_LA_EMERGENCIA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llama_de_atencion`
--

CREATE TABLE `llama_de_atencion` (
  `ID_LLAMADO` varchar(255) NOT NULL,
  `TIPO` varchar(255) DEFAULT NULL,
  `ESTADO_DE_LA_ALERTA` varchar(255) DEFAULT NULL,
  `FECHA_Y_HORA_DE_ACTIVACION_DE_LA_ALERTA` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `ID_DE_PACIENTE` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `FECHA_DE_NACIMIENTO` date DEFAULT NULL,
  `GENERO` varchar(255) DEFAULT NULL,
  `ESTADO_DEL_PACIENTE` varchar(255) DEFAULT NULL,
  `UBICACION_DEL_PACIENTE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_monitoreo`
--

CREATE TABLE `personal_monitoreo` (
  `ID_PERSONAL_DE_MONITOREO` varchar(255) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `FUNCIONES` varchar(255) DEFAULT NULL,
  `NUMERO_DE_TELEFONO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `FECHA_DE_NACIMIENTO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quirofano`
--

CREATE TABLE `quirofano` (
  `ID_QUIROFANO` varchar(255) NOT NULL,
  `HISTORIAL_DE_QUIROFANO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_DE_USUARIO` varchar(255) NOT NULL,
  `NOMBRE_DE_USUARIO` varchar(255) DEFAULT NULL,
  `TIPO` varchar(255) DEFAULT NULL,
  `PERMISOS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`ID_DE_AREA`);

--
-- Indices de la tabla `enfermero`
--
ALTER TABLE `enfermero`
  ADD PRIMARY KEY (`ID_DE_ENFERMERO`);

--
-- Indices de la tabla `equipo_de_emergencia`
--
ALTER TABLE `equipo_de_emergencia`
  ADD PRIMARY KEY (`ID_DE_EQUIPO`);

--
-- Indices de la tabla `llama_de_atencion`
--
ALTER TABLE `llama_de_atencion`
  ADD PRIMARY KEY (`ID_LLAMADO`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`ID_DE_PACIENTE`),
  ADD KEY `UBICACION_DEL_PACIENTE` (`UBICACION_DEL_PACIENTE`);

--
-- Indices de la tabla `personal_monitoreo`
--
ALTER TABLE `personal_monitoreo`
  ADD PRIMARY KEY (`ID_PERSONAL_DE_MONITOREO`);

--
-- Indices de la tabla `quirofano`
--
ALTER TABLE `quirofano`
  ADD PRIMARY KEY (`ID_QUIROFANO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_DE_USUARIO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`UBICACION_DEL_PACIENTE`) REFERENCES `quirofano` (`ID_QUIROFANO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
