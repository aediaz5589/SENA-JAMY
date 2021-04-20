-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2021 a las 19:20:45
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
CREATE DATABASE IF NOT EXISTS `jamy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `jamy`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `IDpersonal` int(10) NOT NULL,
  `Nombre personal` varchar(20) NOT NULL,
  `Cargo` varchar(10) NOT NULL,
  `Area` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`IDpersonal`, `Nombre personal`, `Cargo`, `Area`) VALUES
(1000126946, 'Yefry Narvaez', 'programado', 'administrativo'),
(1000128655, 'Alvaro Diaz', 'programado', 'administrativo'),
(1000131691, 'Angie Agamez', 'programado', 'administrativo'),
(1000807607, 'Jeimmy Cuervo', 'programado', 'administrativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IDcliente` int(10) NOT NULL,
  `CodigoFactura` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Direccion` varchar(20) NOT NULL,
  `Telefono` int(10) NOT NULL,
  `Email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IDcliente`, `CodigoFactura`, `Nombre`, `Direccion`, `Telefono`, `Email`) VALUES
(100032783, 3, 'Victor Cortes', 'trans 2 #23b sur', 308965676, 'victorcorte@gmail.co'),
(100037273, 2, 'Wendy Diaz', 'carrera 78h #18c sur', 315435839, 'wendy1996@gmail.com'),
(100089389, 4, 'Stiven Gonzales', 'carrera 78h #68-30 s', 308937392, 'stivenG@gmail.com'),
(100089765, 1, 'Jaider Sierra', 'calle 27a #78-13 sur', 308928392, 'jaiders@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `IDpersonal` int(10) NOT NULL,
  `Fecha finalizacion` date NOT NULL,
  `Fecha contrato` date NOT NULL,
  `Salario` int(10) NOT NULL,
  `Tipo contrato` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`IDpersonal`, `Fecha finalizacion`, `Fecha contrato`, `Salario`, `Tipo contrato`) VALUES
(52752024, '2021-11-10', '2019-11-10', 3000000, 'temporal'),
(1000126946, '2021-05-10', '2019-05-10', 1000000, 'temporal'),
(1000128655, '2020-11-10', '2019-11-10', 1000000, 'temporal'),
(1000128712, '2021-12-10', '2019-12-10', 1000000, 'temporal'),
(1000131691, '2021-01-10', '2019-01-10', 1000000, 'temporal'),
(1000145236, '2021-05-10', '2019-05-10', 1000000, 'temporal'),
(1000158732, '2021-09-10', '2019-09-10', 1000000, 'temporal'),
(1000159263, '2021-02-10', '2019-02-10', 1000000, 'temporal'),
(1000254689, '2021-01-10', '2019-01-10', 1000000, 'temporal'),
(1000487963, '2020-11-10', '2018-11-10', 1000000, 'temporal'),
(1000807607, '2020-12-10', '2018-12-10', 1000000, 'temporal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion_producto`
--

CREATE TABLE `descripcion_producto` (
  `Codigo` int(10) NOT NULL,
  `Precio` int(10) NOT NULL,
  `Color` varchar(10) NOT NULL,
  `Gama` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `descripcion_producto`
--

INSERT INTO `descripcion_producto` (`Codigo`, `Precio`, `Color`, `Gama`) VALUES
(8, 90000, 'blanca', 'alta'),
(1344, 79000, 'violeta', 'media'),
(2346, 80000, 'amarillo', 'baja'),
(2354, 80000, 'rojo', 'media');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `Codigo` int(10) NOT NULL,
  `IDcliente` int(10) NOT NULL,
  `Producto` varchar(20) NOT NULL,
  `Precio` int(10) NOT NULL,
  `Cantidad_Producto` int(10) NOT NULL,
  `Precio total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`Codigo`, `IDcliente`, `Producto`, `Precio`, `Cantidad_Producto`, `Precio total`) VALUES
(8, 100089389, 'Ramo orquidea', 90000, 15, 90000),
(1344, 100037273, 'Ramo rosas', 79000, 10, 79000),
(2346, 100032783, 'Ramo girasol', 80000, 10, 80000),
(2354, 100089765, 'Ramo tulipan', 80000, 10, 80000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `IDdomicilio` int(10) NOT NULL,
  `ID cliente` int(10) NOT NULL,
  `Codigo Factura` int(10) NOT NULL,
  `Destino` varchar(20) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora entrega` date NOT NULL,
  `Nombre cliente` varchar(20) NOT NULL,
  `Telefono` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`IDdomicilio`, `ID cliente`, `Codigo Factura`, `Destino`, `Fecha`, `Hora entrega`, `Nombre cliente`, `Telefono`) VALUES
(1478, 100032783, 2, 'calle 106a #23-43a', '2020-01-14', '0000-00-00', 'victor cortez', 308965676),
(2587, 100089389, 4, 'carrera 78h #18c sur', '2020-04-20', '0000-00-00', 'stiven gonzales', 308937392),
(7532, 100089765, 1, 'calle 27a #78-13 sur', '2020-09-19', '0000-00-00', 'Jaider Sierra', 308928392),
(9632, 100037273, 3, 'calle 27a #78-13 sur', '2020-07-27', '0000-00-00', 'wendy diaz', 315435839);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `CodigoFactura` int(10) NOT NULL,
  `IDcliente` int(10) NOT NULL,
  `ID domicilio` int(10) NOT NULL,
  `IVA` int(10) NOT NULL,
  `Fecha` date NOT NULL,
  `Total pagar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`CodigoFactura`, `IDcliente`, `ID domicilio`, `IVA`, `Fecha`, `Total pagar`) VALUES
(1, 100089765, 3, 0, '2020-09-19', 90000),
(2, 100037273, 1, 0, '2020-01-14', 80000),
(3, 100032783, 2, 0, '2020-07-27', 79000),
(4, 100089389, 4, 0, '2020-04-20', 80000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `Codigo` int(10) NOT NULL,
  `Cantidad_Producto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`Codigo`, `Cantidad_Producto`) VALUES
(8, 15),
(1344, 10),
(2346, 10),
(2354, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_pedido`
--

CREATE TABLE `inventario_pedido` (
  `IDpedido` int(10) NOT NULL,
  `Codigo` int(10) NOT NULL,
  `Producto entrada` int(10) NOT NULL,
  `Producto salida` int(10) NOT NULL,
  `Fecha movimiento` date NOT NULL,
  `Cantidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario_pedido`
--

INSERT INTO `inventario_pedido` (`IDpedido`, `Codigo`, `Producto entrada`, `Producto salida`, `Fecha movimiento`, `Cantidad`) VALUES
(1233, 8, 15, 5, '2020-09-19', 10),
(3423, 1344, 10, 1, '2020-01-14', 9),
(5667, 2354, 10, 5, '2020-04-20', 5),
(9890, 2346, 10, 3, '2020-07-27', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `IDpedido` int(10) NOT NULL,
  `IDcliente` int(10) NOT NULL,
  `Producto` varchar(20) DEFAULT NULL,
  `Precio` int(10) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` date NOT NULL,
  `Estado pedido` varchar(20) DEFAULT NULL,
  `Destino` varchar(20) DEFAULT NULL,
  `Fecha salida` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`IDpedido`, `IDcliente`, `Producto`, `Precio`, `Fecha`, `Hora`, `Estado pedido`, `Destino`, `Fecha salida`) VALUES
(1233, 100089765, 'Ramo tulipanes', 80000, '2020-06-06', '0000-00-00', 'proceso de entrega', 'calle 27a #78-13 sur', '2020-07-27'),
(3423, 100089389, 'Ramo orquidea', 90000, '2020-07-08', '0000-00-00', 'preoceso de entrega', 'carrera 78h #18c sur', '2020-09-19'),
(5667, 100032738, 'Ramo tulipanes', 79000, '2020-03-09', '0000-00-00', 'proceso de entrega', 'trans 2 #23b sur', '2020-10-17'),
(9890, 100037273, 'Ramo rosas', 80000, '2020-01-01', '0000-00-00', 'entregado', 'carrera 78h #68-30 s', '2020-01-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `IDpersonal` int(10) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Edad` int(10) NOT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  `Telefono` int(10) NOT NULL,
  `EMAIL` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`IDpersonal`, `Nombre`, `Edad`, `Direccion`, `Telefono`, `EMAIL`) VALUES
(52752024, 'Rosmira García', 38, 'calle 9a #40-23', 323249320, 'lidag1759@gmail.com'),
(1000126946, 'Yefry Narvaez', 18, 'DIG 39b #17-108', 316695187, 'ymnarvaez@misena.edu'),
(1000128655, 'Alvaro Diaz', 17, 'car 54h #14-15', 305360446, 'aediaz55@misena.edu.'),
(1000128712, 'Stewart Suarez', 25, 'Dig 39b # 02-17', 313423490, 'stewartLS@gmail.com'),
(1000131691, 'Angie Agamez', 18, 'calle 19 #20-29', 319672996, 'akagamez@misena.edu.'),
(1000145236, 'Juanita Diaz', 19, 'Calle 10 No. 9 - 78 ', 303430490, 'juanitadiaz@gmail.co'),
(1000158732, 'Carolina Garcia', 25, 'Carrera 54 No. 68 - ', 320430437, 'Caroo52@gmail.com'),
(1000159263, 'Jhon Carascal', 32, 'Carrera 56A No. 51 -', 313994059, 'carascal55@gmail.com'),
(1000254689, 'Camilo Plazas', 24, 'Calle 59 No. 27 - 35', 311689918, 'aCam11@gmail.com'),
(1000487963, 'Sebastian Susa', 22, 'Carrera 22 No. 17-31', 319983934, 'SEBASramirez@gmail.c'),
(1000807607, 'Jeimmy Cuervo', 17, 'carrera 54a #20-12', 320931739, 'jcuervo70@misena.edu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Codigo` int(10) NOT NULL,
  `Nombre producto` varchar(50) NOT NULL,
  `Precio unitario` int(10) NOT NULL,
  `Stock Actual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Codigo`, `Nombre producto`, `Precio unitario`, `Stock Actual`) VALUES
(8, 'Ramo orquidea', 90000, 15),
(1344, 'Ramo rosas', 79000, 10),
(2346, 'Ramo girasol', 80000, 10),
(2354, 'Ramo tulipanes', 80000, 10);

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
  `EmailAddress` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_customers`
--

INSERT INTO `tbl_customers` (`CustomerID`, `Username`, `PASSWORD`, `Role`, `Firstname`, `Middlename`, `Lastname`, `Address`, `EmailAddress`) VALUES
(3, 'yefry2002', 'yefry123', 'admin', 'admin', 'admin', NULL, 'Diagonal 39b # 17-108', 'ymnarvaez64@misena.edu.co'),
(5, 'comprador', '1234abcd..', 'admin', 'admin', 'admin', NULL, 'Calle con Carrera', 'comprador@cweb.com'),
(8, 'yefry', 'yefry123', 'User', 'mauricio', 'narvaez', 'cely', 'DIG 39B #17 - 108', 'narvaezcelyy@gmail.com');

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
  `DateOrdered` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_orders`
--

INSERT INTO `tbl_orders` (`OrderID`, `ProductID`, `CustomerID`, `Size`, `Color`, `DateOrdered`) VALUES
(8, 9, 8, 'asdasd', 'sdasd', '2021/04/13'),
(9, 9, 8, '', '', '2021/04/13'),
(10, 9, 8, '', '', '2021/04/13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_products`
--

CREATE TABLE `tbl_products` (
  `ProductID` int(11) NOT NULL,
  `Productname` varchar(30) DEFAULT NULL,
  `ProductBrand` varchar(30) DEFAULT NULL,
  `ProductSize` varchar(30) DEFAULT NULL,
  `ProductColor` varchar(30) DEFAULT NULL,
  `ProductPrice` varchar(30) DEFAULT NULL,
  `ProductCategory` varchar(30) DEFAULT NULL,
  `ProductImageName` varchar(50) DEFAULT NULL,
  `ProductImage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_products`
--

INSERT INTO `tbl_products` (`ProductID`, `Productname`, `ProductBrand`, `ProductSize`, `ProductColor`, `ProductPrice`, `ProductCategory`, `ProductImageName`, `ProductImage`) VALUES
(9, 'asd', 'asdasd', '', '', 'asdasd', '', 'bodasramo.jpg', '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');
INSERT INTO `tbl_products` (`ProductID`, `Productname`, `ProductBrand`, `ProductSize`, `ProductColor`, `ProductPrice`, `ProductCategory`, `ProductImageName`, `ProductImage`) VALUES
(10, 'ROSAS', 'Cumpleaños', '', '', '$150.000', '', 'Cumpleaños.jpg', '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');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuadmin`
--

CREATE TABLE `usuadmin` (
  `cedula` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuadmin`
--

INSERT INTO `usuadmin` (`cedula`, `nombre`, `telefono`, `correo`, `password`) VALUES
(1000467897, 'Yefry Moreno', 2147483647, 'yefry@gmail.com', 'admin1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `cedula` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `contraseña` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cedula`, `nombre`, `contraseña`) VALUES
(1000337337, 'Alvaro Narvaez', 'somos5678');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`IDpersonal`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IDcliente`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`IDpersonal`);

--
-- Indices de la tabla `descripcion_producto`
--
ALTER TABLE `descripcion_producto`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`Codigo`,`IDcliente`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`IDdomicilio`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`CodigoFactura`,`IDcliente`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `inventario_pedido`
--
ALTER TABLE `inventario_pedido`
  ADD PRIMARY KEY (`IDpedido`,`Codigo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`IDpedido`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`IDpersonal`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indices de la tabla `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indices de la tabla `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indices de la tabla `usuadmin`
--
ALTER TABLE `usuadmin`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD CONSTRAINT `tbl_orders_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `tbl_products` (`ProductID`),
  ADD CONSTRAINT `tbl_orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `tbl_customers` (`CustomerID`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"jamy\",\"table\":\"tbl_customers\"},{\"db\":\"jamy\",\"table\":\"tbl_orders\"},{\"db\":\"jamy\",\"table\":\"tbl_products\"},{\"db\":\"jamy\",\"table\":\"usuarios\"},{\"db\":\"jamy\",\"table\":\"pedido\"},{\"db\":\"jamy\",\"table\":\"cliente\"},{\"db\":\"jamy\",\"table\":\"usuadmin\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-04-20 17:20:00', '{\"Console\\/Mode\":\"show\",\"lang\":\"es\",\"Console\\/Height\":178.971,\"Console\\/DarkTheme\":true}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
