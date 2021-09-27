-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2021 a las 04:06:50
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jamy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `ID_cargo` int(11) NOT NULL,
  `carNombrePersonal` varchar(20) NOT NULL,
  `Cargo` varchar(30) NOT NULL,
  `perUsuSesion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_created_at` timestamp NULL DEFAULT current_timestamp(),
  `per_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `carEstado` set('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`ID_cargo`, `carNombrePersonal`, `Cargo`, `perUsuSesion`, `per_created_at`, `per_updated_at`, `carEstado`) VALUES
(1, 'Sebastian Cuervo', 'Domiciliario', '3', '2021-04-22 23:27:44', '2021-04-26 03:34:20', 'INACTIVO'),
(2, 'Daniel Cuervo', 'Domiciliario', '4', '2021-04-22 08:22:13', '2021-04-26 02:49:39', 'INACTIVO'),
(3, 'Esteban Diaz', 'ADMIN', '1', '2021-04-26 02:47:17', '2021-04-26 03:33:46', 'ACTIVO'),
(4, 'Mauricio Cely', 'Domiciliario', '5', '2021-04-22 08:22:13', '2021-04-26 03:39:36', 'ACTIVO'),
(5, 'Yefry Narvaez', 'ADMIN', '2', '2021-04-26 02:49:07', '2021-04-26 03:39:51', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleentrada`
--

CREATE TABLE `detalleentrada` (
  `detEId` int(11) NOT NULL,
  `tbl_products_ProductID` int(11) NOT NULL,
  `detECantidadIngresa` varchar(45) DEFAULT NULL,
  `detUsuSesion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `det_created_at` timestamp NULL DEFAULT current_timestamp(),
  `det_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalleentrada`
--

INSERT INTO `detalleentrada` (`detEId`, `tbl_products_ProductID`, `detECantidadIngresa`, `detUsuSesion`, `det_created_at`, `det_updated_at`) VALUES
(1, 1, '5', NULL, '2021-04-25 21:59:33', '2021-04-25 21:59:33'),
(2, 2, '10', NULL, '2021-04-22 04:01:15', '2021-04-25 22:01:11'),
(3, 3, '5', NULL, '2021-04-25 21:59:54', '2021-04-25 21:59:54'),
(4, 4, '10', NULL, '2021-04-25 21:59:54', '2021-04-25 21:59:54'),
(5, 5, '10', NULL, '2021-04-25 22:00:41', '2021-04-25 22:00:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `IDdomicilio` int(10) NOT NULL,
  `domDireccion` varchar(20) NOT NULL,
  `domFecha` date NOT NULL,
  `domHora` datetime NOT NULL,
  `domNombreCliente` varchar(20) NOT NULL,
  `factura_CodigoFactura` int(10) NOT NULL,
  `factura_IDcliente` int(10) NOT NULL,
  `personal_IDpersonal` int(10) NOT NULL,
  `domUsuSesion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dom_created_at` timestamp NULL DEFAULT current_timestamp(),
  `dom_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `domEstado` set('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`IDdomicilio`, `domDireccion`, `domFecha`, `domHora`, `domNombreCliente`, `factura_CodigoFactura`, `factura_IDcliente`, `personal_IDpersonal`, `domUsuSesion`, `dom_created_at`, `dom_updated_at`, `domEstado`) VALUES
(1, 'calle 102 b sur 6a n', '2021-04-21', '2021-04-20 23:12:49', 'Laura Valbuena', 1, 1001065403, 1000128655, NULL, '2021-04-22 03:46:19', '2021-09-21 01:30:01', 'ACTIVO'),
(3, 'calle 102 b sur 6a n', '2021-04-29', '2021-04-28 13:16:03', 'Danilo Rocha', 4, 1000128765, 1000143664, NULL, '2021-04-28 18:16:03', '2021-04-28 18:16:03', 'ACTIVO'),
(3, 'Kr 22 a no. 67-89', '2021-04-29', '2021-04-28 20:15:30', 'Laura Valbuena', 4, 1000128765, 1000143666, NULL, '2021-04-28 18:15:53', '2021-04-28 18:15:53', 'ACTIVO'),
(4, 'calle 14 no. 25-37', '2021-04-25', '2021-04-28 20:31:50', 'Martha ', 3, 1000134655, 1000078965, NULL, '2021-04-28 18:31:50', '2021-04-28 18:31:50', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `CodigoFactura` int(10) NOT NULL,
  `IDcliente` int(10) NOT NULL,
  `ID domicilio` int(10) NOT NULL,
  `Fecha` date NOT NULL,
  `Total pagar` int(10) NOT NULL,
  `tbl_customers_CustomerID` int(11) NOT NULL,
  `nombreProd` varchar(20) DEFAULT NULL,
  `facUsuSesion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fac_created_at` timestamp NULL DEFAULT current_timestamp(),
  `fac_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `facEstado` set('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`CodigoFactura`, `IDcliente`, `ID domicilio`, `Fecha`, `Total pagar`, `tbl_customers_CustomerID`, `nombreProd`, `facUsuSesion`, `fac_created_at`, `fac_updated_at`, `facEstado`) VALUES
(1, 1001065403, 1, '2021-04-21', 150000, 1001065403, 'Boda', NULL, '2021-04-22 03:49:01', '2021-04-22 18:34:45', 'ACTIVO'),
(2, 1001065403, 2, '2021-04-21', 150000, 1001065403, 'Cumpleaños', NULL, '2021-04-22 03:49:01', '2021-04-22 18:34:49', 'ACTIVO'),
(3, 1000134655, 3, '2021-04-30', 80000, 1000134655, 'Bautizo', NULL, '2021-04-25 22:08:31', '2021-04-25 22:11:02', 'ACTIVO'),
(4, 1000128765, 4, '2021-04-29', 80000, 1000128765, 'Funerario', NULL, '2021-04-25 22:11:13', '2021-04-25 22:25:40', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `IDpersonal` int(20) NOT NULL,
  `perNombre` varchar(20) NOT NULL,
  `perEdad` int(10) NOT NULL,
  `perDireccion` varchar(20) DEFAULT NULL,
  `perTelefono` int(11) NOT NULL,
  `perEMAIL` varchar(30) NOT NULL,
  `personalUsuSesion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal_created_at` timestamp NULL DEFAULT current_timestamp(),
  `personal_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `personalEstado` set('ACTIVO','INACTIVO') DEFAULT NULL,
  `PASSWORD` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`IDpersonal`, `perNombre`, `perEdad`, `perDireccion`, `perTelefono`, `perEMAIL`, `personalUsuSesion`, `personal_created_at`, `personal_updated_at`, `personalEstado`, `PASSWORD`) VALUES
(1000078965, 'Sebastian Cuervo', 20, 'calle 89 b no. 78-98', 0, 'sebatian@gmail.com', '3', '2021-04-27 21:21:57', '2021-09-26 21:59:00', 'INACTIVO', '1234'),
(1000128457, 'Daniel Cuervo', 20, NULL, 0, 'daniel1@gmail.com', '4', '2021-04-27 21:22:46', '2021-09-26 22:02:12', 'INACTIVO', 'Alvarijua89'),
(1000128655, 'Esteban Diaz ', 18, 'calle 25 no.14-03', 0, 'aediaz5589@gmail.com', '1', '2021-04-22 08:52:05', '2021-09-26 22:02:18', 'ACTIVO', '12345'),
(1000143664, 'Mauricio Narvaez', 20, NULL, 0, 'yefrynarvaezCely@gmail.com', '5', '2021-04-27 21:24:55', '2021-09-26 22:02:22', 'ACTIVO', '1234'),
(1000143666, 'Yefry Narvaez', 20, 'calle 24 no.14-04', 0, 'yefrynarvaez@gmail.com', '2', '2021-04-22 08:52:05', '2021-09-26 22:02:25', 'ACTIVO', 'yefry');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rolId` int(11) NOT NULL,
  `rolNombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rolDescripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rolEstado` tinyint(1) NOT NULL DEFAULT 1,
  `rolUsuSesion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rol_created_at` timestamp NULL DEFAULT current_timestamp(),
  `rol_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rolId`, `rolNombre`, `rolDescripcion`, `rolEstado`, `rolUsuSesion`, `rol_created_at`, `rol_updated_at`) VALUES
(2, 'Cliente', 'Este rol puede entrar al sistema de informacion y podra crear un usuario con el cual podra ordenar los productos de la tienda', 2, '2', '2021-04-21 01:59:00', '2021-04-21 01:59:00'),
(3, 'ADMIN', 'Administrativo de la empresa total ', 1, 'GDfmgs', '2021-04-20 14:30:39', '2021-04-25 22:33:35'),
(5, 'Domiciliario', 'Repartidor del producto', 1, 'Rfmgs', '2021-04-20 12:30:48', '2021-04-25 21:44:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `CustomerID` int(11) NOT NULL,
  `Username` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(30) DEFAULT NULL,
  `Role` varchar(30) DEFAULT NULL,
  `Firstname` varchar(30) DEFAULT NULL,
  `Middlename` varchar(30) DEFAULT NULL,
  `Lastname` varchar(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `EmailAddress` varchar(30) DEFAULT NULL,
  `tbl_customersUsuSesion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tbl_customers_created_at` timestamp NULL DEFAULT current_timestamp(),
  `tbl_customers_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `custEstado` set('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_customers`
--

INSERT INTO `tbl_customers` (`CustomerID`, `Username`, `PASSWORD`, `Role`, `Firstname`, `Middlename`, `Lastname`, `Address`, `EmailAddress`, `tbl_customersUsuSesion`, `tbl_customers_created_at`, `tbl_customers_updated_at`, `custEstado`) VALUES
(1000128655, 'Alvareto', 'Alvarijua89', 'ADMIN', 'Alvaro', 'Esteban', 'Diaz', 'calle 22 C no.25-37', 'aediaz5589@gmail.com', NULL, '2021-04-22 03:54:37', '2021-04-25 22:33:26', 'ACTIVO'),
(1000128765, 'martha', '1003', 'User', 'Martha', 'Moreno', 'Vargas', 'samper mendoza', 'aediaz5589@gmail.com', NULL, '2021-04-25 22:02:32', '2021-09-26 20:23:14', 'ACTIVO'),
(1000134655, 'Martha', '1003', 'User', 'Martha', NULL, 'Vargas', 'calle 22 C no.25-37', 'martha.1@gmail.com', NULL, '2021-04-25 22:05:32', '2021-09-16 00:29:33', 'ACTIVO'),
(1000143664, 'Yefry', 'yefry123', 'ADMIN', 'Yefry', 'Mauricio', 'Narvaez', NULL, 'yefrynarvaez@gmail.com', NULL, '2021-04-27 16:06:55', '2021-06-09 16:15:26', 'ACTIVO'),
(1001065403, 'valbuena', '12345', 'User', 'Laura', 'Dayana', 'Valbuena', 'calle 102 b sur 6a no.19', 'lauradvc.48@gmail.com', NULL, '2021-04-22 03:54:37', '2021-09-16 00:29:37', 'ACTIVO'),
(1001065409, 'Alvaro', '12345', 'User', 'Esteban', 'Diaz', 'Moreno', 'calle 22c no.25-37', 'prueba@gmail.com', NULL, '2021-09-26 20:24:00', '2021-09-26 20:24:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Size` varchar(30) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `DateOrdered` date DEFAULT NULL,
  `FechaEntrega` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_orders`
--

INSERT INTO `tbl_orders` (`OrderID`, `ProductID`, `CustomerID`, `Size`, `Color`, `DateOrdered`, `FechaEntrega`) VALUES
(1, 2, 1000134655, '1', 'amariillo', '2021-09-26', '2021-09-26'),
(4, 5, 1000134655, '2', 'Azul', '2021-09-27', '2021-09-27'),
(6, 3, 1000134655, '2', 'amariillo', '2021-09-27', '2021-09-27'),
(7, 2, 1001065409, '3', 'Rojo', '2021-09-27', '2021-09-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_products`
--

CREATE TABLE `tbl_products` (
  `ProductID` int(11) NOT NULL,
  `Productname` varchar(30) DEFAULT NULL,
  `ProductSize` varchar(30) DEFAULT NULL,
  `ProductPrice` varchar(30) DEFAULT NULL,
  `ProductCategory` varchar(30) DEFAULT NULL,
  `ProductImageName` varchar(50) DEFAULT NULL,
  `ProductImage` text DEFAULT NULL,
  `proEstado` set('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_products`
--

INSERT INTO `tbl_products` (`ProductID`, `Productname`, `ProductSize`, `ProductPrice`, `ProductCategory`, `ProductImageName`, `ProductImage`, `proEstado`) VALUES
(1, 'RAMO', '2', '160000', 'BODA', 'RAMOBODA.jpg', '', 'ACTIVO'),
(2, 'RAMO', '3', '150000', 'CUMPLEAÑOS', 'RAMO CUMPLEAÑOS.jpg', NULL, 'ACTIVO'),
(3, 'RAMO', '1', '100000', 'BAUTIZO', 'RAMO BAUTIZO.jpg', NULL, 'ACTIVO'),
(4, 'RAMO', '2', '80000', 'BABY SHOWER', 'RAMO SHAWER.jpg', NULL, 'ACTIVO'),
(5, 'RAMO', '1', '100000', 'FUNERARIO', 'RAMO FUNERARIO.jpg', NULL, 'ACTIVO'),
(6, 'RAMO', '3', '180000', 'GRADUACION', 'RAMO GRADUACION.jpg', NULL, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_s`
--

CREATE TABLE `usuario_s` (
  `usuId` int(11) NOT NULL,
  `usuLogin` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `usuPassword` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usuUsuSesion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuEstado` tinyint(1) NOT NULL DEFAULT 1,
  `usuRemember_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usu_created_at` timestamp NULL DEFAULT current_timestamp(),
  `usu_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuaEstado` set('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario_s`
--

INSERT INTO `usuario_s` (`usuId`, `usuLogin`, `usuPassword`, `usuUsuSesion`, `usuEstado`, `usuRemember_token`, `usu_created_at`, `usu_updated_at`, `usuaEstado`) VALUES
(1000123476, 'Alvaro', 'Alvarijua89', 'Alvaro', 1, '', '2021-04-21 02:02:11', '2021-04-22 18:40:17', 'ACTIVO'),
(1000124655, 'Martha', '1003', '1', 1, '', '2021-04-27 16:04:26', '2021-04-27 16:04:26', 'ACTIVO'),
(1000129765, 'Danilo', 'Danilo123', '3', 1, '', '2021-04-27 16:00:52', '2021-04-27 16:00:52', 'ACTIVO'),
(1000143664, 'Yefry', 'Yefry123', '1', 1, '', '2021-04-27 16:07:35', '2021-04-27 16:07:35', 'ACTIVO'),
(1001065403, 'Laura', '12345', '1', 1, '', '2021-04-27 15:56:38', '2021-04-27 15:56:38', 'ACTIVO'),
(1001065404, 'aediaz55@gmail.com', 'cf7d4bdd2afbb023f0b265b3e99ba1f9', NULL, 1, '', '2021-05-20 20:17:05', '2021-05-20 20:17:05', NULL),
(1001065405, 'aediaz5589@gmail.com', 'd9840773233fa6b19fde8caf765402f5', NULL, 1, '', '2021-05-20 20:18:51', '2021-06-10 19:31:25', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`ID_cargo`);

--
-- Indices de la tabla `detalleentrada`
--
ALTER TABLE `detalleentrada`
  ADD PRIMARY KEY (`detEId`,`tbl_products_ProductID`),
  ADD KEY `fk_detalleEntrada_tbl_products1_idx` (`tbl_products_ProductID`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`IDdomicilio`,`factura_CodigoFactura`,`factura_IDcliente`,`personal_IDpersonal`),
  ADD KEY `fk_domicilio_factura1_idx` (`factura_CodigoFactura`,`factura_IDcliente`),
  ADD KEY `fk_domicilio_personal1_idx` (`personal_IDpersonal`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`CodigoFactura`,`IDcliente`,`tbl_customers_CustomerID`),
  ADD KEY `fk_factura_tbl_customers1_idx` (`tbl_customers_CustomerID`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`IDpersonal`) USING BTREE,
  ADD KEY `fk_personal_cargo1_idx` (`IDpersonal`) USING BTREE;

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rolId`),
  ADD UNIQUE KEY `uniq_nombrerol` (`rolNombre`);

--
-- Indices de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indices de la tabla `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indices de la tabla `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indices de la tabla `usuario_s`
--
ALTER TABLE `usuario_s`
  ADD PRIMARY KEY (`usuId`),
  ADD UNIQUE KEY `uniq_login` (`usuLogin`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `ID_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalleentrada`
--
ALTER TABLE `detalleentrada`
  MODIFY `detEId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rolId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001065410;

--
-- AUTO_INCREMENT de la tabla `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario_s`
--
ALTER TABLE `usuario_s`
  MODIFY `usuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001065406;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleentrada`
--
ALTER TABLE `detalleentrada`
  ADD CONSTRAINT `fk_detalleEntrada_tbl_products1` FOREIGN KEY (`tbl_products_ProductID`) REFERENCES `tbl_products` (`ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `fk_domicilio_factura1` FOREIGN KEY (`factura_CodigoFactura`,`factura_IDcliente`) REFERENCES `factura` (`CodigoFactura`, `IDcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_domicilio_personal1` FOREIGN KEY (`personal_IDpersonal`) REFERENCES `personal` (`IDpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_tbl_customers1` FOREIGN KEY (`tbl_customers_CustomerID`) REFERENCES `tbl_customers` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
