-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2024 a las 03:15:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdrafael`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabancaria`
--

CREATE TABLE `cuentabancaria` (
  `id_cuenta` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `numero_cuenta` varchar(20) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `tipo_cuenta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentabancaria`
--

INSERT INTO `cuentabancaria` (`id_cuenta`, `id_persona`, `numero_cuenta`, `saldo`, `tipo_cuenta`) VALUES
(1, 1, '123456789', 5000.00, 'Corriente'),
(2, 2, '987654321', 7500.00, 'Ahorros'),
(3, 3, '456789123', 10000.00, 'Inversión'),
(11, 1, '1234567890', 1500.00, 'Corriente'),
(12, 2, '0987654321', 2500.00, 'Ahorro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido`, `edad`, `rol`, `direccion`, `departamento`, `contraseña`) VALUES
(1, 'Rafaa', 'Iri', 33, 'Empleado', 'Obrajeeeees', 'Oruro', 'secambio9'),
(2, 'María', 'López', 28, 'Titular', 'Avenida ABC, Ciudad XYZ', 'Cochabamba', 'abc123'),
(3, 'Fabricio', 'Iriarte', 21, 'Titular', 'San isidro bajo Donozo Torrez', 'Santa Cruz', 'qwerty'),
(10, 'Juan', 'Pérez', 30, 'Empleado', 'Calle A, Ciudad X', 'La Paz', 'secret'),
(13, 'Carlos', 'Gutiérrez', 40, 'Director Bancario', 'Calle Principal', 'La Paz', 'director123'),
(15, 'Anuel', 'Fernandez', 24, 'Empleado', 'Stadium', NULL, 'stadium123'),
(16, 'zenovia', 'castro', 68, 'Empleada', 'San isidro bajo Donozo Torrez', 'La Paz', 'zeno123');

--
-- Disparadores `persona`
--
DELIMITER $$
CREATE TRIGGER `eliminar_cuentas_asociadas` BEFORE DELETE ON `persona` FOR EACH ROW BEGIN
    DELETE FROM cuentabancaria WHERE id_persona = OLD.id_persona;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccionesbancarias`
--

CREATE TABLE `transaccionesbancarias` (
  `id_transaccion` int(11) NOT NULL,
  `id_cuenta` int(11) DEFAULT NULL,
  `tipo_transaccion` varchar(10) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_transaccion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transaccionesbancarias`
--

INSERT INTO `transaccionesbancarias` (`id_transaccion`, `id_cuenta`, `tipo_transaccion`, `monto`, `fecha_transaccion`) VALUES
(1, 1, 'Débito', 1000.00, '2024-04-19'),
(2, 1, 'Crédito', 200.00, '2024-04-20'),
(3, 2, 'Débito', 500.00, '2024-04-19'),
(4, 2, 'Crédito', 1000.00, '2024-04-20'),
(5, 3, 'Débito', 2000.00, '2024-04-19'),
(6, 3, 'Crédito', 500.00, '2024-04-20');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuentabancaria`
--
ALTER TABLE `cuentabancaria`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `transaccionesbancarias`
--
ALTER TABLE `transaccionesbancarias`
  ADD PRIMARY KEY (`id_transaccion`),
  ADD KEY `id_cuenta` (`id_cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentabancaria`
--
ALTER TABLE `cuentabancaria`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `transaccionesbancarias`
--
ALTER TABLE `transaccionesbancarias`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentabancaria`
--
ALTER TABLE `cuentabancaria`
  ADD CONSTRAINT `cuentabancaria_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `transaccionesbancarias`
--
ALTER TABLE `transaccionesbancarias`
  ADD CONSTRAINT `transaccionesbancarias_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentabancaria` (`id_cuenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
