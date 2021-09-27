-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2021 a las 22:46:52
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
-- Estructura de tabla para la tabla `categorialibro`
--

CREATE TABLE `categorialibro` (
  `catLibId` int(11) NOT NULL,
  `catLibNombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `catLibEstado` tinyint(1) NOT NULL DEFAULT 1,
  `catLibObservacion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorialibro`
--

INSERT INTO `categorialibro` (`catLibId`, `catLibNombre`, `catLibEstado`, `catLibObservacion`) VALUES
(1, 'General', 1, 'Libros que implican varias categorías o que no se les ha definido'),
(2, 'Cultura General', 1, 'Cultura General');

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
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `isbn` int(5) NOT NULL DEFAULT 0,
  `titulo` varchar(236) DEFAULT NULL,
  `autor` varchar(305) DEFAULT NULL,
  `precio` varchar(10) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `categoriaLibro_catLibId` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`isbn`, `titulo`, `autor`, `precio`, `estado`, `categoriaLibro_catLibId`) VALUES
(12, 'LOS DUROS DE JAMY', 'EL EQUIPO', '5000000', 1, 2),
(18, 'LOS DUROS DE JAMY', 'EL EQUIPO', '5000000', 1, 2),
(129, '24-TALLER DE FRUTAS Y HORTALIZAS', 'F.A.O', '39000', 1, 1),
(130, 'LOS DUROS DE JAMYYYYYYYYYYYYYYYYYYYYYYY', 'EL EQUIPO', '5000000', 1, 2),
(258, 'ACTIVIDAD FISICA Y SALUD INTEGRAL', 'Medina Jimâenez, Eduardo', '160000', 1, 1),
(387, 'AGUADA. Cuaderno de Pintura', 'OLMEDO SALVADOR', '42000', 1, 1),
(516, 'ALTERACIONES DEL HABLA EN LA INFANCIA ASPECTOS CLINICOS', 'Gonzâalez, Jorge Nicolâas', '11900', 1, 1),
(645, 'ANATOMIA CIENCIA EXPLICADA', 'Archila R., Leonardo, ed', '9514', 1, 1),
(774, 'Antología de la narrativa mexicana del siglo XX, I', 'Domínguez Michael, Christopher', '144000', 1, 1),
(903, 'APRENDIZAJE SERVICIO. EDUCAR PARA LA CIUDADANIA', 'PUIG ROVIRA, Josep', '70800', 1, 1),
(1032, 'ARTE DE TOULOUSE-LAUTREC', 'Harris, Nathaniel', '300000', 1, 1),
(1161, 'ATENCION A LOS DESPLAZADOS EXPERIENCIAS INSTITUCIONALES EN COLOMBIA', 'VARIOS, Autores', '24000', 1, 1),
(1290, 'ATLAS DE PLANTAS VIVIENDAS', 'Schneider, Friederike ed', '100800', 1, 1),
(1419, 'Auguste y Louis Lumière -Entre sombras y luces', 'Saad, Julián', '22500', 1, 1),
(1548, 'BEBE', 'Levin, Ina Massler', '27300', 1, 1),
(1677, 'BIOLOGIA LA UNIDAD Y DIVERSIDAD DE LA VIDA', 'Starr, Cecie', '116900', 1, 1),
(1806, 'BREVE HISTORIA DEL ARTE AFRICANO', 'GILLO WERNER', '244800', 1, 1),
(1935, 'CALDERON VIDA Y TEATRO', 'PEDRAZA JIMENEZ FELIPE B.', '45400', 1, 1),
(2064, 'CANTATA DEL MAL, LA (E.N)', 'TOLEDO ZAMORA, Fernando', '39000', 1, 1),
(2193, 'Casos prácticos de dirección financiera', 'Martín Fernández, Miguel; Martínez Solano, Pedro', '123100', 1, 1),
(2322, 'CIENCIAS SOCIALES EN DISCUSION, LAS', 'BUNGE, MARIO', '33500', 1, 1),
(2451, 'CLIMA, EL', 'HARRIS, CAROLINE', '34000', 1, 1),
(2580, 'COMISIONES FILMICAS, LAS. UN NUEVO DISPOSITIVO PARA LA PROMOCION AUDIOVISUAL', 'Martínez Hermida, Marcelo', '93000', 1, 1),
(2709, 'Compañia de sueños ilimitada', 'J.G. Ballard', '13200', 1, 1),
(2838, 'CONCEPTOS FUNDAMENTALES EN LA HISTORIA DE LA MUSIC', 'SALAZAR ADOLFO', '144100', 1, 1),
(2967, 'CONSULTOR DEL SABER', 'Elorza Martínez, Gustavo de, ed', '22900', 1, 1),
(3096, 'Copos de espuma', 'Vargas Vila, J. M.', '22300', 1, 1),
(3225, 'CRONICA DE AMERICA', 'García Jordán, Pilar', '61200', 1, 1),
(3354, 'CUERPO (IR)', 'HANIF KUREISHI', '57900', 1, 1),
(3483, 'CYBERGIRLS PORTAFOLIO', 'SHIROW HAR', '56000', 1, 1),
(3612, 'DEL RACISMO A INTERCULTURALIDAD ', 'Garcia, Alfonso Y Saez, J', '101000', 1, 1),
(3741, 'DESCUBRIMIENTO DEL UNIVERSO', 'Hacyan, Shahen, 1947-', '160000', 1, 1),
(3870, 'DIBUJO Y DISENO EN INGENIERIA', 'Jensen, Cecil', '63700', 1, 1),
(3999, 'DICCIONARIO DE CINE', 'Trueba, Fernando, 1955-', '120000', 1, 1),
(4128, 'DICCIONARIO DE INTERPRETES Y DE LA INTERPRETACION MUSICAL', 'Paris, Alain, 1947-', '300000', 1, 1),
(4257, 'DICCIONARIO DE PERIODISMO, PUBLICACIONES Y MEDIOS', ' Consuegra, Jorge ', NULL, 1, 1),
(4386, 'DICCIONARIO DEL JAZZ', 'Carles, Philippe', '83900', 1, 1),
(4515, 'DICCIONARIO HISTORICO DE LA ILUSTRACION', 'Ferrone, Vincenzo ed', '118105', 1, 1),
(4644, 'DICCIONARIO RUSO-ESPANOL 000170.000 VOCES DE ENTRADA 00045', 'Martínez Calvo, Lorenzo', '80000', 1, 1),
(4773, 'Dirección de empresas', 'Cabanelas Omil, José', '160500', 1, 1),
(4902, 'DOMINE EXCEL 2007', 'Pérez', '42000', 1, 1),
(5031, 'EDUCACION E IGUALDAD DE OPORTUNIDADES ENTRE SEXOS', 'Xosé R. Fernández Vazquez', '106000', 1, 1),
(5160, 'El Mundo de la Célula, 6/ed.', 'BECKER', '215000', 1, 1),
(5289, 'EN AMERICA', 'SONTAG, Susan', '45000', 1, 1),
(5418, 'ENCICLOPEDIA DE LAS TECNICAS DE AEROGRAFIA', 'Leek, Michael', '69000', 1, 1),
(5547, 'ENCICLOPEDIA PRACTICA DE LA PEDAGOGIA', 'Clifford, Margaret M', '80000', 1, 1),
(5676, 'Enseñar a leer y escribir. Una aproximación histórica', 'Chartier, Anne-Marie', '43000', 1, 1),
(5805, 'ESCRITOS FILOSOFICOS 2.', 'LAKATOS IMRE', '121800', 1, 1),
(5934, 'ESTADISTICA Y MATEMATICAS APLICADAS. (EDICION DIRIGIDA A LOS ESTUDIOS DE FARMACIA)', 'SÁNCHEZ, M./FRUTOS, G./CUESTA, P. L.', '153800', 1, 1),
(6063, 'ESTUCHE CARRASQUILLA', 'CARRASQUILLA, Tomás', '89000', 1, 1),
(6192, 'Explora tus sentidos ', 'Helen Otway', '19500', 1, 1),
(6321, 'FILOSOFIA DE LA LOGICA', 'QUINE W.', '72100', 1, 1),
(6450, 'FISIOLOGIA APLICADA AL DEPORTE', 'Calderâon Montero, Francisco Javier', '52500', 1, 1),
(6579, 'FREUD Y LA PSICOLOGIA DEL ARTE', 'DEL CONDE, TERESA', '28800', 1, 1),
(6708, 'FUNDAMENTOS DE QUIMICA', 'ZUMDAHL, STE', '80000', 1, 1),
(6837, 'GEOMETRIA DESCRIPTIVA SISTEMAS DE PROYECCION CILINDRICA', 'Sánchez Gallego, Juan Antonio', '16650', 1, 1),
(6966, 'GOYA SU TIEMPO SU VIDA SU OBRA', 'Aribau, Ferrán', '88140', 1, 1),
(7095, 'Grandes batallas de la historia - Batallas de Alej', 'Varios Autores', '21000', 1, 1),
(7224, 'GUIA DE EQUIPOS BASICOS PARA EL PROCESAMIENTO AGROINDUSTRI', 'Romero, Arturo', '9350', 1, 1),
(7353, 'HACIA UNA EDUCACION INFANTIL NO SEXISTA ', 'Browne', '76000', 1, 1),
(7482, 'HISTOLOGIA VEGETAL', 'Garcia Breijo', '35000', 1, 1),
(7611, 'HISTORIA DE LA VIDA PRIVADA II De la Europa feudal al Renacimiento', 'ARIES, Philippe / DUBY, Georges', '65000', 1, 1),
(7740, 'HISTORIA ILUSTRADA DE COLOMBIA', 'OCAMPO LÓPEZ JAVIER', '25000', 1, 1),
(7869, 'HORTALIZAS FRUTAS Y PLANTAS COMESTIBLES', 'Peel, Lucy', '24000', 1, 1),
(7998, 'Indicadores de gestión y cuadro de mando', 'SALGUEIRO ANABITARTE A.', '32000', 1, 1),
(8127, 'INTERACCION DEL COLOR', 'ALBERS JOSEF', '109100', 1, 1),
(8256, 'INTRODUCCION A LA SOCIOLOGIA POLITICA', 'MICHELS, Roberto', '59800', 1, 1),
(8385, 'ISO 009000 002000 CALIDAD Y EXCELENCIA', 'Senlle, Andrâes', '55740', 1, 1),
(8514, 'JUGOS BATIDOS Y SORBETES', 'Gonzâalez, Jorge, fot', '90000', 1, 1),
(8643, 'LAROUSSE DICCIONARIO ENCICLOPEDICO USUAL', NULL, '23000', 1, 1),
(8772, 'LETRA', 'Blanchard, Gerard', '135200', 1, 1),
(8901, 'LIDERAZGO Y LA COMUNICACION EFECTIVA PUNTO DE PARTIDA PARA', 'Cajiao de Pâerez, Gloria', '160000', 1, 1),
(9030, 'LOS MITOS HEBREOS', 'GRAVES ROBERT', '78100', 1, 1),
(9159, 'MANEJO POST-COSECHA Y MERCADEO DE TOMATE DE ARBOL CHYPHOMA', 'Gutiâerrez Vâasquez, Albeiro', '77675', 1, 1),
(9288, 'MANUAL DE HORTICULTURA UNA GUIA PASO A PASO', 'Lesur Esquivel, Luis', '160000', 1, 1),
(9417, 'MANUAL INTEGRADO DE DISENO Y CONSTRUCCION', 'Merrit, Frederick S., ed', '160000', 1, 1),
(9546, 'MARKETING EMOCIONAL EL METODO DE HALLMARK PARA GANAR CLIEN', 'Robinette, Scott', '27870', 1, 1),
(9675, 'MATEMATICAS PARA LOS ESTUDIANTES DE HUMANIDADES', 'Kline, Morris, 1908-', '160000', 1, 1),
(9804, 'MEMORIA DEL FLAMENCO', 'GRANDE FELIX', '122300', 1, 1),
(9933, 'MI PRIMER LAROUSSE DE LOS HEROES', 'EDICIONES LAROUSSE', '52400', 1, 1),
(10062, 'MISTERIOS DE LOS OCEANOS', 'Dipper, Frances', '52200', 1, 1),
(10191, 'MUJERES DE LA ANTIGUEDAD', 'VARIOS', '45400', 1, 1),
(10320, 'NACIMIENTO DE LA HISTORIA, EL', 'CHATELET, Francois', '70000', 1, 1),
(10449, 'NOVELA NATURALISTA HISPANOAMERICANA', 'Prendes, Manuel', '65950', 1, 1),
(10578, 'NUTRICION DE PECES COMERCIALES EN ESTANQUES', 'Hepher, Balfour', '39000', 1, 1),
(10707, 'OFICIO DE JURISTA, EL', 'DÍEZ PICAZO, Luis', '74000', 1, 1),
(10836, 'OTROS ESTUDIOS SOBRE EL ESPAÑOL EN COLOMBIA', 'MONTES GIRALDO, José Joaquín', '30000', 1, 1),
(10965, 'PASIÓN DE PAPEL- CTOS SOBRE EL MUNDO DEL LIBRO', 'AA.VV.', '67000', 1, 1),
(11094, 'PERRO CALLEJERO(IR)', 'MARTIN AMIS', '64900', 1, 1),
(11223, 'PLANTAS MEDICINALES EN VERSO ALIMENTESE Y SANESE', 'Gâomez Giraldo, Felipe, 1960-', '25000', 1, 1),
(11352, 'Política y gestión pública', 'Bresser-Pereira, Luiz Carlos, et al.', '43000', 1, 1),
(11481, 'PRIMAVERA DEL SER', 'MANTERO, Manuel', '26500', 1, 1),
(11610, 'PROCESOS INDUSTRIALES EN FRUTAS Y HORTALIZAS', 'Osorio Dâiaz, Doris Liliana', '14073', 1, 1),
(11739, 'PSICOTERAPIA Y SENTIDO DE VIDA', 'MARTINEZ ORTIZ,EFREN', '44000', 1, 1),
(11868, 'QUIMICA GENERAL ORGANICA Y BIOLOGICA', 'Wolfe, Drew H', '51350', 1, 1),
(11997, 'REDES NEURONALES', 'Anderson', '61000', 1, 1),
(12126, 'REPENSAR LA RESURRECCION. (3ª ED) LA DIFERENCIA CRISTIANA EN LA CONTINUIDAD DE LAS RELIGIONES Y LA CULTURA', 'TORRES QUEIRUGA, Andrés', '82200', 1, 1),
(12255, 'ROSTRO MAÑANA 2, TU.  BAILE Y SUEÑO', 'MARIAS, Javier', '45000', 1, 1),
(12384, 'SEGUNDO SECRETO DE LA VIDA LAS NUEVAS MATEMATICAS DEL MUNDO', 'Stewart, Ian, 1945-', '160000', 1, 1),
(12513, 'SIMBOLOS EN LA BIBLIA', 'ALVES, Herculano', '128900', 1, 1),
(12642, 'SOCIOLOGIA URBANA DE MANUEL CASTELLS', 'SUSSER IDA (ed.)', '161200', 1, 1),
(12771, 'TALMUD. TRATADO DE BERAJOT I', '0', '128000', 1, 1),
(12900, 'TEOLOGIA DE LA LIBERACION Y REFUNDACION DE LA ESPERANZA', 'GIRARDI, Giulio', '44200', 1, 1),
(13029, 'Textos políticos.', 'Burke, Edmund', '44000', 1, 1),
(13158, 'TOXINAS AMBIENTALES Y SUS EFECTOS GENETICOS', 'Rodrâiguez Arnaiz, Rosario', '160000', 1, 1),
(13287, 'TRIGONOMETRIA', 'Swokowski, Earl William, 1926-', '32200', 1, 1),
(13416, 'UNIVERSALISMO CONSTRUCTIVO 2', 'TORRES GARCIA JOAQUIN', '209600', 1, 1),
(13545, 'VIAJE AL CORAZON DE LA TORMENTA', 'EISNER WILL', '44000', 1, 1),
(13674, 'Vitaminas y minerales esenciales para la salud ', 'Challem, Jack ', '37500', 1, 1),
(13803, 'YO AMO A MI MAMI', 'JAIME BAYLY', '34900', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `perId` int(11) NOT NULL COMMENT 'Nos muetsra el Id de la tabla persona',
  `perDocumento` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nos muestra el documento de la persona',
  `perNombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nos muestra el nombre de la persona',
  `perApellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nos muestra el apellido de la persona',
  `perEstado` tinyint(1) NOT NULL DEFAULT 1,
  `perUsuSesion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `per_created_at` timestamp NULL DEFAULT current_timestamp(),
  `per_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_s_usuId` int(11) NOT NULL,
  `persEstado` set('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Esta tabla nos muestra los datos de la persona';

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`perId`, `perDocumento`, `perNombre`, `perApellido`, `perEstado`, `perUsuSesion`, `per_created_at`, `per_updated_at`, `usuario_s_usuId`, `persEstado`) VALUES
(1, '1000123476', 'Alvaro', 'Diaz', 1, '1', '2021-04-21 02:04:02', '2021-04-27 16:03:36', 1000123476, 'ACTIVO'),
(2, '1001065403', 'Laura', 'Valbuena', 1, '1', '2021-04-27 15:57:06', '2021-04-27 15:57:06', 1001065403, 'ACTIVO'),
(3, '1000128765', 'Danilo', 'Rocha', 1, '1', '2021-04-27 16:03:42', '2021-04-27 16:03:42', 1000129765, 'ACTIVO'),
(4, '1000134655', 'Martha', 'Vargas', 1, NULL, '2021-04-27 16:08:26', '2021-04-27 16:08:26', 1000124655, 'ACTIVO'),
(5, '1000143666', 'Yefry ', 'Narvaez', 1, NULL, '2021-04-27 16:08:26', '2021-04-27 16:08:26', 1000143664, 'ACTIVO'),
(1001065404, '1000128677', 'aed', 'aedi', 1, NULL, '2021-05-20 20:17:05', '2021-05-20 20:17:05', 1001065404, NULL),
(1001065405, '1001065404', 'aedi', 'aedia', 1, NULL, '2021-05-20 20:18:51', '2021-05-20 20:18:51', 1001065405, NULL);

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
  `personalEstado` set('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`IDpersonal`, `perNombre`, `perEdad`, `perDireccion`, `perTelefono`, `perEMAIL`, `personalUsuSesion`, `personal_created_at`, `personal_updated_at`, `personalEstado`) VALUES
(1000078965, 'Sebastian Cuervo', 20, 'calle 89 b no. 78-98', 0, 'sebatian@gmail.com', '3', '2021-04-27 21:21:57', '2021-04-27 21:21:57', 'INACTIVO'),
(1000128457, 'Daniel Cuervo', 20, NULL, 0, 'daniel1@gmail.com', '4', '2021-04-27 21:22:46', '2021-04-27 21:22:46', 'INACTIVO'),
(1000128655, 'Esteban Diaz ', 18, 'calle 25 no.14-03', 0, 'aediaz5589@gmail.com', '1', '2021-04-22 08:52:05', '2021-04-27 21:24:30', 'ACTIVO'),
(1000143664, 'Mauricio Narvaez', 20, NULL, 0, 'yefrynarvaezCely@gmail.com', '5', '2021-04-27 21:24:55', '2021-04-27 21:24:55', 'ACTIVO'),
(1000143666, 'Yefry Narvaez', 20, 'calle 24 no.14-04', 0, 'yefrynarvaez@gmail.com', '2', '2021-04-22 08:52:05', '2021-05-20 02:50:52', 'ACTIVO');

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
  `DateOrdered` varchar(30) DEFAULT NULL,
  `FechaEntrega` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_orders`
--

INSERT INTO `tbl_orders` (`OrderID`, `ProductID`, `CustomerID`, `Size`, `Color`, `DateOrdered`, `FechaEntrega`) VALUES
(1, 2, 1000134655, '1', 'amariillo', '2021/09/26', '2021-09-26');

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
  `proCantidadActual` int(11) DEFAULT 0,
  `proCantidadMinimo` varchar(45) DEFAULT NULL,
  `proCantidadMaximo` varchar(45) DEFAULT NULL,
  `proUsuSesion` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pro_created_at` timestamp NULL DEFAULT current_timestamp(),
  `pro_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `proEstado` set('ACTIVO','INACTIVO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_products`
--

INSERT INTO `tbl_products` (`ProductID`, `Productname`, `ProductSize`, `ProductPrice`, `ProductCategory`, `ProductImageName`, `ProductImage`, `proCantidadActual`, `proCantidadMinimo`, `proCantidadMaximo`, `proUsuSesion`, `pro_created_at`, `pro_updated_at`, `proEstado`) VALUES
(1, 'RAMO', '2', '160000', 'BODA', 'RAMOBODA.jpg', '', 5, '1', '4', NULL, '2021-04-22 03:59:39', '2021-06-28 21:40:03', 'ACTIVO'),
(2, 'RAMO', '3', '150000', 'CUMPLEAÑOS', 'RAMO CUMPLEAÑOS.jpg', NULL, 5, '1', '4', NULL, '2021-04-22 03:59:39', '2021-06-28 21:57:00', 'ACTIVO'),
(3, 'RAMO', '1', '100000', 'BAUTIZO', 'RAMO BAUTIZO.jpg', NULL, 5, '1', '4', NULL, '2021-04-25 21:51:09', '2021-06-29 02:31:21', 'ACTIVO'),
(4, 'RAMO', '2', '80000', 'BABY SHOWER', 'RAMO SHAWER.jpg', NULL, 10, '1', '9', NULL, '2021-04-25 21:51:09', '2021-06-29 02:31:27', 'ACTIVO'),
(5, 'RAMO', '1', '100000', 'FUNERARIO', 'RAMO FUNERARIO.jpg', NULL, 10, '1', '9', NULL, '2021-04-25 21:53:57', '2021-06-29 02:31:31', 'ACTIVO'),
(6, 'RAMO', '3', '180000', 'GRADUACION', 'RAMO GRADUACION.jpg', NULL, 6, '1', '5', NULL, '2021-05-11 10:59:39', '2021-06-29 02:31:44', 'ACTIVO');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_s_roles`
--

CREATE TABLE `usuario_s_roles` (
  `id_usuario_s` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fechalserRol` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `obsFechaUserRol` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuRolUsuSesion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usrolEstado` set('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario_s_roles`
--

INSERT INTO `usuario_s_roles` (`id_usuario_s`, `id_rol`, `fechalserRol`, `obsFechaUserRol`, `usuRolUsuSesion`, `created_at`, `updated_at`, `usrolEstado`) VALUES
(1000123476, 2, '2021-04-22 18:40:46', NULL, NULL, '2021-04-21 02:03:14', '2021-04-22 18:40:46', 'ACTIVO'),
(1000124655, 2, '2021-04-27 16:04:58', NULL, 'Cliente', '2021-04-27 16:04:58', '2021-04-27 16:04:58', 'ACTIVO'),
(1000129765, 2, '2021-04-27 16:01:51', NULL, 'Cliente', '2021-04-27 16:01:51', '2021-04-27 16:01:51', 'ACTIVO'),
(1000143664, 3, '2021-04-27 16:07:58', NULL, NULL, '2021-04-27 16:07:58', '2021-04-27 16:07:58', 'ACTIVO'),
(1001065403, 2, '2021-04-27 15:57:29', NULL, 'Cliente', '2021-04-27 15:57:29', '2021-04-27 15:57:29', 'ACTIVO'),
(1001065404, 3, '2021-05-20 20:17:05', NULL, NULL, '2021-05-20 20:17:05', '2021-05-20 20:17:05', NULL),
(1001065405, 3, '2021-05-20 20:18:51', NULL, NULL, '2021-05-20 20:18:51', '2021-05-20 20:18:51', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`ID_cargo`);

--
-- Indices de la tabla `categorialibro`
--
ALTER TABLE `categorialibro`
  ADD PRIMARY KEY (`catLibId`);

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
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`isbn`,`categoriaLibro_catLibId`),
  ADD KEY `fk_libros_categoriaLibro1_idx` (`categoriaLibro_catLibId`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`perId`,`usuario_s_usuId`),
  ADD UNIQUE KEY `uniq_documento` (`perDocumento`),
  ADD KEY `fk_persona_usuario_s1_idx` (`usuario_s_usuId`);

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
-- Indices de la tabla `usuario_s_roles`
--
ALTER TABLE `usuario_s_roles`
  ADD PRIMARY KEY (`id_usuario_s`,`id_rol`),
  ADD KEY `usuario_s_roles_fk_rolidrol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `ID_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorialibro`
--
ALTER TABLE `categorialibro`
  MODIFY `catLibId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_libros_categoriaLibro1` FOREIGN KEY (`categoriaLibro_catLibId`) REFERENCES `categorialibro` (`catLibId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_usuario_s1` FOREIGN KEY (`usuario_s_usuId`) REFERENCES `usuario_s` (`usuId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_s_roles`
--
ALTER TABLE `usuario_s_roles`
  ADD CONSTRAINT `usuario_s_roles_fk_rolidrol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`rolId`),
  ADD CONSTRAINT `usuario_s_roles_fk_usuario_sid` FOREIGN KEY (`id_usuario_s`) REFERENCES `usuario_s` (`usuId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
