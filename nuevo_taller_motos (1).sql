-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-09-2024 a las 22:30:50
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
-- Base de datos: `nuevo_taller_motos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) NOT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_Cliente`, `nombre`, `cedula`, `correo_electronico`, `telefono`, `direccion`) VALUES
(1, 'Juan Pérez', '123456789', 'juan.perez@email.com', '3001234567', 'Calle 123'),
(2, 'María Gómez', '987654321', 'maria.gomez@email.com', '3109876543', 'Avenida 456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_trabajo`
--

CREATE TABLE `estado_trabajo` (
  `ID_Estado` int(11) NOT NULL,
  `estado_descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_trabajo`
--

INSERT INTO `estado_trabajo` (`ID_Estado`, `estado_descripcion`) VALUES
(1, 'Pendiente'),
(2, 'En proceso'),
(3, 'Completado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_Factura` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Trabajo` int(11) DEFAULT NULL,
  `fecha_factura` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`ID_Factura`, `ID_Cliente`, `ID_Trabajo`, `fecha_factura`, `total`) VALUES
(1, 1, 1, '2024-09-05', 500.00),
(2, 2, 2, '2024-08-27', 150.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_producto`
--

CREATE TABLE `inventario_producto` (
  `ID_Producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario_producto`
--

INSERT INTO `inventario_producto` (`ID_Producto`, `nombre_producto`, `descripcion`, `cantidad`, `precio_unitario`) VALUES
(1, 'Aceite 10W-40', 'Aceite para motor 4 tiempos', 50, 20.00),
(2, 'Filtro de aire', 'Filtro de aire para motos', 30, 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mecánico`
--

CREATE TABLE `mecánico` (
  `ID_Mecánico` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mecánico`
--

INSERT INTO `mecánico` (`ID_Mecánico`, `nombre`, `telefono`) VALUES
(1, 'Carlos Sánchez', '3111111111'),
(2, 'Luis Martínez', '3122222222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moto`
--

CREATE TABLE `moto` (
  `ID_Moto` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `placa` varchar(10) NOT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `moto`
--

INSERT INTO `moto` (`ID_Moto`, `ID_Cliente`, `marca`, `modelo`, `placa`, `estado`) VALUES
(1, 1, 'Yamaha', 'YZF-R3', 'ABC123', 'En reparación'),
(2, 2, 'Honda', 'CB500F', 'DEF456', 'Listo para entregar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo`
--

CREATE TABLE `trabajo` (
  `ID_Trabajo` int(11) NOT NULL,
  `ID_Moto` int(11) DEFAULT NULL,
  `ID_Mecánico` int(11) DEFAULT NULL,
  `ID_Estado` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `costo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajo`
--

INSERT INTO `trabajo` (`ID_Trabajo`, `ID_Moto`, `ID_Mecánico`, `ID_Estado`, `descripcion`, `fecha_inicio`, `fecha_fin`, `costo`) VALUES
(1, 1, 1, 2, 'Reparación del sistema de frenos', '2024-09-01', NULL, 500.00),
(2, 2, 2, 3, 'Cambio de aceite y revisión general', '2024-08-25', '2024-08-26', 150.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `estado_trabajo`
--
ALTER TABLE `estado_trabajo`
  ADD PRIMARY KEY (`ID_Estado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Trabajo` (`ID_Trabajo`);

--
-- Indices de la tabla `inventario_producto`
--
ALTER TABLE `inventario_producto`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `mecánico`
--
ALTER TABLE `mecánico`
  ADD PRIMARY KEY (`ID_Mecánico`);

--
-- Indices de la tabla `moto`
--
ALTER TABLE `moto`
  ADD PRIMARY KEY (`ID_Moto`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD PRIMARY KEY (`ID_Trabajo`),
  ADD KEY `ID_Moto` (`ID_Moto`),
  ADD KEY `ID_Mecánico` (`ID_Mecánico`),
  ADD KEY `ID_Estado` (`ID_Estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_trabajo`
--
ALTER TABLE `estado_trabajo`
  MODIFY `ID_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_Factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario_producto`
--
ALTER TABLE `inventario_producto`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mecánico`
--
ALTER TABLE `mecánico`
  MODIFY `ID_Mecánico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `moto`
--
ALTER TABLE `moto`
  MODIFY `ID_Moto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  MODIFY `ID_Trabajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`ID_Trabajo`) REFERENCES `trabajo` (`ID_Trabajo`);

--
-- Filtros para la tabla `moto`
--
ALTER TABLE `moto`
  ADD CONSTRAINT `moto_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`);

--
-- Filtros para la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD CONSTRAINT `trabajo_ibfk_1` FOREIGN KEY (`ID_Moto`) REFERENCES `moto` (`ID_Moto`),
  ADD CONSTRAINT `trabajo_ibfk_2` FOREIGN KEY (`ID_Mecánico`) REFERENCES `mecánico` (`ID_Mecánico`),
  ADD CONSTRAINT `trabajo_ibfk_3` FOREIGN KEY (`ID_Estado`) REFERENCES `estado_trabajo` (`ID_Estado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
