-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2018 a las 06:22:20
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdmarianista`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `IDALUMNO` int(3) NOT NULL,
  `IDPERSONA` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`IDALUMNO`, `IDPERSONA`) VALUES
(1, 11),
(2, 12),
(3, 13),
(4, 13),
(5, 13),
(6, 13),
(7, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID` int(3) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID`, `NOMBRE`) VALUES
(1, 'Normal'),
(2, 'Padre Policia'),
(3, 'Deportista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `IDCURSO` int(3) NOT NULL,
  `IDDOCENTE` int(3) DEFAULT NULL,
  `CURSO` varchar(30) NOT NULL,
  `DETALLE` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`IDCURSO`, `IDDOCENTE`, `CURSO`, `DETALLE`) VALUES
(2, 2, 'Matematica 2', 'Para Alumnos  de Secundaria'),
(3, 3, 'Educacion Fisica', 'Deporte'),
(4, 2, 'fisica ', 'Para alumnos de secundaria'),
(5, 1, 'Comunicacion Integral', 'Comunicar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `IDDOCENTE` int(3) NOT NULL,
  `IDPERSONA` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`IDDOCENTE`, `IDPERSONA`) VALUES
(1, 4),
(2, 6),
(3, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `IDHORARIO` int(3) NOT NULL,
  `IDSECCION` int(3) NOT NULL,
  `IDCURSO` int(3) NOT NULL,
  `DIA` varchar(15) NOT NULL,
  `HORA` varchar(15) NOT NULL,
  `HORAFIN` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`IDHORARIO`, `IDSECCION`, `IDCURSO`, `DIA`, `HORA`, `HORAFIN`) VALUES
(1, 1, 2, '1', '07:45', '09:00'),
(2, 1, 3, '1', '09:00', '11:00'),
(5, 4, 2, '1', '07:45', '09:00'),
(7, 1, 2, '2', '12:00', '02:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `IDMATRICULA` int(3) NOT NULL,
  `IDALUMNO` int(3) NOT NULL,
  `IDSECCION` int(3) NOT NULL,
  `IDCATEGORIA` int(3) NOT NULL,
  `FECHA` varchar(20) NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `APELLIDO` varchar(30) NOT NULL,
  `TELEFONO` int(10) NOT NULL,
  `DNI` int(9) NOT NULL,
  `FECHA_CREADA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`IDMATRICULA`, `IDALUMNO`, `IDSECCION`, `IDCATEGORIA`, `FECHA`, `NOMBRE`, `APELLIDO`, `TELEFONO`, `DNI`, `FECHA_CREADA`) VALUES
(1, 1, 4, 2, '2018', 'dsadsa', 'dsadsad', 32523532, 645765657, '2018-11-11 22:19:31'),
(2, 2, 4, 1, '2018', 'fsdfds', 'sdfdsfds', 32543534, 543454354, '2018-11-11 22:21:41'),
(3, 3, 4, 1, '2018', 'fdsfdsf', 'sdfdsfdsf', 32253253, 532525555, '2018-11-11 22:25:57'),
(4, 7, 4, 1, '2018', 'dasda', 'dsadsada', 32432432, 443243242, '2018-11-11 22:28:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID` int(11) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TOTALT` double NOT NULL DEFAULT '280'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`ID`, `FECHA`, `TOTALT`) VALUES
(1, '2018-11-11 22:25:58', 280),
(2, '2018-11-11 22:28:34', 280);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_detalle`
--

CREATE TABLE `pago_detalle` (
  `ID` int(3) NOT NULL,
  `IDPAGO` int(3) NOT NULL,
  `IDPROGRAMACION_PAGO` int(3) DEFAULT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `MONTO` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago_detalle`
--

INSERT INTO `pago_detalle` (`ID`, `IDPAGO`, `IDPROGRAMACION_PAGO`, `NOMBRE`, `MONTO`) VALUES
(1, 2, 3, 'Matricula', 280);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `IDPERSONA` int(3) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(30) DEFAULT NULL,
  `APELLIDOM` varchar(30) DEFAULT NULL,
  `FOTO` varchar(50) NOT NULL,
  `CORREO` varchar(30) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `DNI` varchar(10) DEFAULT NULL,
  `SEXO` varchar(1) DEFAULT NULL,
  `TELEFONO` varchar(10) DEFAULT NULL,
  `ESTADO_CIVIL` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(25) DEFAULT NULL,
  `DISTRITO` varchar(50) DEFAULT NULL,
  `PROVINCIA` varchar(30) DEFAULT NULL,
  `DEPARTAMENTO` varchar(30) DEFAULT NULL,
  `ESTADO` varchar(20) NOT NULL DEFAULT 'Activado',
  `FECHA_CREADA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`IDPERSONA`, `NOMBRE`, `APELLIDO`, `APELLIDOM`, `FOTO`, `CORREO`, `FECHA`, `DNI`, `SEXO`, `TELEFONO`, `ESTADO_CIVIL`, `DIRECCION`, `DISTRITO`, `PROVINCIA`, `DEPARTAMENTO`, `ESTADO`, `FECHA_CREADA`) VALUES
(1, 'Domingo', 'Huaytalla', 'Lopez', 'f1.png', 'HDomingo@gmail.com', '1954-08-05', '748380828', '1', '988957754', 'Casado', 'Jr. San Juan 182', 'Miraflores', 'Lima', 'Lima', 'Activado', '2018-11-11 03:05:45'),
(3, 'Fanny', 'Santos', 'Santos', '', 'Fanny@gmail.com', '2018-11-17', '74565654', '1', '958474575', 'Soltero', 'sdfdsf', 'San Juan de Miraflores', 'Lima', 'Lima', 'Activado', '2018-11-11 03:05:45'),
(4, 'Nombre', 'apellifo', 'fff', 'f.jpg', '@ccc', '2018-11-01', '74565', '1', '956856759', 'Soltero', 'gggg', 'La Victoria', 'fffff', 'ffff', 'Activado', '2018-11-11 03:05:45'),
(5, 'wade', 'dwade', 'howard', 'wade.png', 'wade@gmail.com', '1959-06-06', '75636454', '1', '986745636', 'Soltero', 'Jr. Callao 145', 'Ate', 'Lima', 'Lima', 'Activado', '2018-11-11 03:05:45'),
(6, 'joel', 'cuenca', 'villogas', 'jjj.jpg', 'jcuenca@gmail.com', '1999-09-16', '77774444', '1', '999332323', 'Soltero', 'Jr. Veneca', 'Villa El Salvador', 'Lima', 'Lima', 'Activado', '2018-11-11 03:05:45'),
(7, 'angel', 'reyna', 'ciriaco', 'ff.jpg', 'reyna@gmail.com', '1999-07-20', '74333222', '1', '969769989', 'Soltero', 'Jr. Vella 189', 'Chorrillos', 'Lima', 'Lima', 'Activado', '2018-11-11 03:05:45'),
(8, 'dsad', 'dasd', 'dasdas', 'gggg.jpg', 'dasdasd', '2018-11-16', '44324234', '1', '745465464', 'Soltero', 'ivan@CNacionesU.pe', 'Villa María del Triunfo', 'Lima', 'Lima', 'Activado', '2018-11-11 22:08:40'),
(9, 'dadsad', 'asdsad', 'dasdsa', 'yp.jpg', 'sdsada', '2018-11-15', '42343242', '1', '754654654', 'Soltero', 'sadsadas', 'Lurín', 'Lima', 'Lima', 'Activado', '2018-11-11 22:09:23'),
(10, 'saadas', 'dasdasda', 'dasdsadd', 'gggg.jpg', 'ewqewq', '2018-11-17', '43534534', '1', '325435435', 'Soltero', 'fsdfdsfsd', 'Lurín', 'Lima', 'Lima', 'Activado', '2018-11-11 22:12:05'),
(11, 'dddd', 'sss', 'fff', 'gggg.jpg', 'fsdfdsf', '2018-11-09', '54354353', '1', '434354354', 'Viudo', 'dsadsadsad', 'Lurín', 'Lima', 'Lima', 'Activado', '2018-11-11 22:18:59'),
(12, 'dsfdsf', 'fdsfdsf', 'fsfsdfds', 'yp.jpg', 'fsdfds', '2018-11-17', '32423432', '1', '234324324', 'Soltero', 'fdsfdsfsdffsd', 'Lurín', 'Lima', 'Lima', 'Activado', '2018-11-11 22:21:07'),
(13, 'fdsf', 'fdsfdsf', 'fdsfdsf', 'gggg.jpg', 'fdsfsdfsf@', '2018-11-08', '43234324', '0', '343253252', 'Soltero', 'rffsfds', 'Los Olivos', 'Lima', 'Lima', 'Activado', '2018-11-11 22:25:24'),
(14, 'dsdasd', 'sadsadsad', 'dsadsadsa', 'yp.jpg', 'dsdadad', '2018-11-17', '43242432', '1', '324343242', 'Soltero', 'asdsadsad', 'Lurigancho', 'Lima', 'Lima', 'Activado', '2018-11-11 22:28:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacion_pagos`
--

CREATE TABLE `programacion_pagos` (
  `ID` int(3) NOT NULL,
  `IDALUMNO` int(3) NOT NULL,
  `DETALLE` varchar(30) NOT NULL,
  `MONTO` double NOT NULL,
  `MORA` double NOT NULL DEFAULT '0',
  `FECHAV` date NOT NULL,
  `FECHACREADA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ESTADO` varchar(30) NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programacion_pagos`
--

INSERT INTO `programacion_pagos` (`ID`, `IDALUMNO`, `DETALLE`, `MONTO`, `MORA`, `FECHAV`, `FECHACREADA`, `ESTADO`) VALUES
(1, 2, 'Matricula', 280, 0, '2018-03-15', '2018-11-11 22:21:41', 'Cancelado'),
(2, 3, 'Matricula', 280, 0, '2018-03-15', '2018-11-11 22:25:58', 'Cancelado'),
(3, 7, 'Matricula', 280, 0, '2018-03-15', '2018-11-11 22:28:34', 'Cancelado'),
(4, 7, 'Mensualidad 1', 280, 0, '2018-03-30', '2018-11-11 22:28:34', 'Pendiente'),
(5, 7, 'Mensualidad 2', 280, 0, '2018-04-30', '2018-11-11 22:28:34', 'Pendiente'),
(6, 7, 'Mensualidad 3', 280, 0, '2018-05-30', '2018-11-11 22:28:34', 'Pendiente'),
(7, 7, 'Mensualidad 4', 280, 0, '2018-06-30', '2018-11-11 22:28:34', 'Pendiente'),
(8, 7, 'Mensualidad 5', 280, 0, '2018-07-30', '2018-11-11 22:28:35', 'Pendiente'),
(9, 7, 'Mensualidad 6', 280, 0, '2018-08-30', '2018-11-11 22:28:35', 'Pendiente'),
(10, 7, 'Mensualidad 7', 280, 0, '2018-09-30', '2018-11-11 22:28:35', 'Pendiente'),
(11, 7, 'Mensualidad 8', 280, 0, '2018-10-30', '2018-11-11 22:28:35', 'Pendiente'),
(12, 7, 'Mensualidad 9', 280, 0, '2018-11-30', '2018-11-11 22:28:35', 'Pendiente'),
(13, 7, 'Mensualidad 10', 280, 0, '2018-12-30', '2018-11-11 22:28:35', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salon`
--

CREATE TABLE `salon` (
  `ID` int(11) NOT NULL,
  `NUMERO` int(4) NOT NULL,
  `EDIFICIO` varchar(25) NOT NULL,
  `FORO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salon`
--

INSERT INTO `salon` (`ID`, `NUMERO`, `EDIFICIO`, `FORO`) VALUES
(2, 111, 'Primaria', 40),
(3, 210, 'Primaria', 40),
(4, 221, 'Primaria', 45),
(5, 10, 'Primaria', 40),
(6, 300, 'Secundaria', 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `IDSECCION` int(3) NOT NULL,
  `GRADO` varchar(30) NOT NULL,
  `PAIS` varchar(30) NOT NULL,
  `FOROA` int(4) NOT NULL DEFAULT '0',
  `IDSALON` int(4) DEFAULT NULL,
  `IDDOCENTE` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`IDSECCION`, `GRADO`, `PAIS`, `FOROA`, `IDSALON`, `IDDOCENTE`) VALUES
(1, '3 año de Inicial', 'Alemania', 0, 2, NULL),
(2, '5 año de Inicial', 'Bahamas', 0, 5, 2),
(3, 'Cuarto de Primaria', 'Brasil', 0, 4, 3),
(4, 'Cuarto de Secundaria', 'Paraguay', 4, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `IDTIPO` int(3) NOT NULL,
  `TIPO` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`IDTIPO`, `TIPO`) VALUES
(1, 'Director'),
(2, 'Sub-Director'),
(3, 'Secretaria'),
(4, 'Profesor'),
(5, 'Alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IDUSUARIO` int(3) NOT NULL,
  `IDTIPO` int(3) NOT NULL,
  `CLAVE` varchar(20) NOT NULL,
  `USUARIO` varchar(30) NOT NULL,
  `IDPERSONA` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IDUSUARIO`, `IDTIPO`, `CLAVE`, `USUARIO`, `IDPERSONA`) VALUES
(1, 1, '1234567', 'Domingo', 1),
(2, 4, '1234567', 'usus', 3),
(3, 4, '1234567', 'naaaa', 4),
(4, 3, '1234567', 'wade', 5),
(5, 4, '12345', 'jcuenca', 6),
(6, 4, '1234567', 'areyna', 7),
(7, 3, '1234567', 'ddasd', 8),
(8, 5, '1234567', 'dsadsadfdsfds', 11),
(9, 5, '1234567', 'fernando', 12),
(10, 5, '1234567', 'sdfdsfdsfsafsdfs', 13),
(11, 5, '1234567', 'ffdsfsdfdfdsfdsfdsf', 13),
(12, 5, '1234567', 'ffdsfsdfdfdsfdsfdsf', 13),
(13, 5, '1234567', 'ffdsfsdfdfdsfdsfdsf', 13),
(14, 5, '1234567', 'dsadsadasadsadsad', 14);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`IDALUMNO`),
  ADD KEY `FK_T_ALUMNO1` (`IDPERSONA`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`IDCURSO`),
  ADD KEY `FK_T_DOCENTE1` (`IDDOCENTE`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`IDDOCENTE`),
  ADD KEY `FK_T_DOCENTE1` (`IDPERSONA`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`IDHORARIO`),
  ADD KEY `FK_T_HORARIO1` (`IDCURSO`),
  ADD KEY `FK_T_HORARIO2` (`IDSECCION`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`IDMATRICULA`),
  ADD KEY `FK_T_MATRICULA1` (`IDALUMNO`),
  ADD KEY `FK_T_MATRICULA2` (`IDSECCION`),
  ADD KEY `FK_T_USUARIO3` (`IDCATEGORIA`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `pago_detalle`
--
ALTER TABLE `pago_detalle`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_T_USUARIO` (`IDPROGRAMACION_PAGO`),
  ADD KEY `FK_T_USUARIO2` (`IDPAGO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`IDPERSONA`),
  ADD UNIQUE KEY `DNI` (`DNI`);

--
-- Indices de la tabla `programacion_pagos`
--
ALTER TABLE `programacion_pagos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_T_USUARIO2` (`IDALUMNO`);

--
-- Indices de la tabla `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`IDSECCION`),
  ADD KEY `FK_T_HORARIO1` (`IDSALON`),
  ADD KEY `FK_T_HORARIO2` (`IDDOCENTE`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`IDTIPO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IDUSUARIO`),
  ADD KEY `FK_T_USUARIO1` (`IDPERSONA`),
  ADD KEY `FK_T_USUARIO2` (`IDTIPO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `IDALUMNO` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `IDCURSO` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `IDDOCENTE` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `IDHORARIO` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `IDMATRICULA` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pago_detalle`
--
ALTER TABLE `pago_detalle`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `IDPERSONA` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `programacion_pagos`
--
ALTER TABLE `programacion_pagos`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `salon`
--
ALTER TABLE `salon`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `IDSECCION` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `IDTIPO` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IDUSUARIO` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_T_ALUMNO1` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `FK_T_DOCENT` FOREIGN KEY (`IDDOCENTE`) REFERENCES `docente` (`IDDOCENTE`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `FK_T_DOCENTE1` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `FK_T_HORARIO1` FOREIGN KEY (`IDCURSO`) REFERENCES `curso` (`IDCURSO`),
  ADD CONSTRAINT `FK_T_HORARIO2` FOREIGN KEY (`IDSECCION`) REFERENCES `seccion` (`IDSECCION`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `FK_T_ALUMNO7` FOREIGN KEY (`IDCATEGORIA`) REFERENCES `categoria` (`ID`),
  ADD CONSTRAINT `FK_T_MATRICULA1` FOREIGN KEY (`IDALUMNO`) REFERENCES `alumno` (`IDALUMNO`),
  ADD CONSTRAINT `FK_T_MATRICULA2` FOREIGN KEY (`IDSECCION`) REFERENCES `seccion` (`IDSECCION`);

--
-- Filtros para la tabla `pago_detalle`
--
ALTER TABLE `pago_detalle`
  ADD CONSTRAINT `FK_T_ALUMNO2` FOREIGN KEY (`IDPROGRAMACION_PAGO`) REFERENCES `programacion_pagos` (`ID`),
  ADD CONSTRAINT `FK_T_ALUMNO3` FOREIGN KEY (`IDPAGO`) REFERENCES `pago` (`ID`);

--
-- Filtros para la tabla `programacion_pagos`
--
ALTER TABLE `programacion_pagos`
  ADD CONSTRAINT `FK_T_ALUMNO` FOREIGN KEY (`IDALUMNO`) REFERENCES `alumno` (`IDALUMNO`);

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `FK_T_ALUMNO10` FOREIGN KEY (`IDSALON`) REFERENCES `salon` (`ID`),
  ADD CONSTRAINT `FK_T_ALUMNO11` FOREIGN KEY (`IDDOCENTE`) REFERENCES `docente` (`IDDOCENTE`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_T_USUARIO1` FOREIGN KEY (`IDPERSONA`) REFERENCES `persona` (`IDPERSONA`),
  ADD CONSTRAINT `FK_T_USUARIO2` FOREIGN KEY (`IDTIPO`) REFERENCES `tipousuario` (`IDTIPO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
