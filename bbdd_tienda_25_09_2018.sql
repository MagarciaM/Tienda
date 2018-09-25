-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.21-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_tienda
CREATE DATABASE IF NOT EXISTS `bd_tienda` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_tienda`;

-- Volcando estructura para tabla bd_tienda.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `id_admin` int(11) NOT NULL,
  `nif_admin` varchar(9) NOT NULL,
  `pass_admin` varchar(50) DEFAULT NULL,
  `nombre_admin` varchar(50) DEFAULT NULL,
  `apellido_1_admin` varchar(50) DEFAULT NULL,
  `apellido_2_admin` varchar(50) DEFAULT NULL,
  `email_admin` varchar(50) DEFAULT NULL,
  `fecha_alta_admin` datetime DEFAULT NULL,
  `fecha_nac_admin` date DEFAULT NULL,
  PRIMARY KEY (`id_admin`,`nif_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd_tienda.administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.articulo
CREATE TABLE IF NOT EXISTS `articulo` (
  `id_articulo` int(11) NOT NULL,
  `id_vendedor_art` int(11) NOT NULL,
  `id_categoria_art` int(11) DEFAULT NULL,
  `id_subcategoria_art` int(11) NOT NULL,
  `nombre_art` varchar(50) DEFAULT NULL,
  `descripcion_art` varchar(50) DEFAULT NULL,
  `importe_art` float NOT NULL,
  `fecha_alta_art` datetime NOT NULL,
  `cantidad_max_art` int(11) NOT NULL,
  PRIMARY KEY (`id_articulo`),
  KEY `FK_articulo_categoria` (`id_categoria_art`),
  KEY `FK_articulo_vendedor` (`id_vendedor_art`),
  KEY `FK_articulo_subcategoria` (`id_subcategoria_art`),
  CONSTRAINT `FK_articulo_categoria` FOREIGN KEY (`id_categoria_art`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `FK_articulo_subcategoria` FOREIGN KEY (`id_subcategoria_art`) REFERENCES `subcategoria` (`id_subcategoria`),
  CONSTRAINT `FK_articulo_vendedor` FOREIGN KEY (`id_vendedor_art`) REFERENCES `vendedor` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.articulo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_cat` varchar(50) DEFAULT NULL,
  `descripcion_cat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `id_comentario` int(11) NOT NULL,
  `id_articulo_com` int(11) DEFAULT NULL,
  `id_usuario_com` int(11) DEFAULT NULL,
  `descripcion_com` varchar(50) DEFAULT NULL,
  `valoracion_com` int(11) DEFAULT NULL,
  `fecha_alta_com` datetime DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `FK_comentario_articulo` (`id_articulo_com`),
  CONSTRAINT `FK_comentario_articulo` FOREIGN KEY (`id_articulo_com`) REFERENCES `articulo` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.comentario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id_configuracion` int(11) NOT NULL,
  PRIMARY KEY (`id_configuracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.configuracion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL,
  `descripcion_ped` varchar(50) DEFAULT NULL,
  `id_usuario_ped` int(11) DEFAULT NULL,
  `importe_ped` float DEFAULT NULL,
  `importe_total` float DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_pedidos_usuario` (`id_usuario_ped`),
  CONSTRAINT `FK_pedidos_usuario` FOREIGN KEY (`id_usuario_ped`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.pedido_lin
CREATE TABLE IF NOT EXISTS `pedido_lin` (
  `id_pedido_lin` int(11) NOT NULL,
  `id_articulo_lin` int(11) NOT NULL,
  `cantidad_lin` int(11) NOT NULL,
  `importe_lin` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido_lin`),
  KEY `FK_pedido_lin_articulo` (`id_articulo_lin`),
  CONSTRAINT `FK_pedido_lin_articulo` FOREIGN KEY (`id_articulo_lin`) REFERENCES `articulo` (`id_articulo`),
  CONSTRAINT `FK_pedido_lin_pedido` FOREIGN KEY (`id_pedido_lin`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.pedido_lin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_lin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_lin` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.subcategoria
CREATE TABLE IF NOT EXISTS `subcategoria` (
  `id_subcategoria` int(11) NOT NULL,
  `descripcion_subcat` varchar(50) DEFAULT NULL,
  `nombre_subcat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_subcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd_tienda.subcategoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_tarj` int(11) NOT NULL DEFAULT '0',
  `numero_tarj` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tarjeta`),
  KEY `FK_tarjeta_usuario` (`id_usuario_tarj`),
  CONSTRAINT `FK_tarjeta_usuario` FOREIGN KEY (`id_usuario_tarj`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.tarjeta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nif_usr` varchar(9) NOT NULL,
  `pass_usr` varchar(9) NOT NULL,
  `nombre_usr` varchar(50) DEFAULT NULL,
  `apellido_1_usr` varchar(50) DEFAULT NULL,
  `apellido_2_usr` varchar(50) DEFAULT NULL,
  `email_usr` varchar(50) DEFAULT NULL,
  `fecha_alta_usr` datetime DEFAULT NULL,
  `fecha_nac_usr` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`nif_usr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.vendedor
CREATE TABLE IF NOT EXISTS `vendedor` (
  `id_vendedor` int(11) NOT NULL,
  `nif_vend` varchar(50) NOT NULL,
  `pass_vend` varchar(50) DEFAULT NULL,
  `nombre_vend` varchar(50) DEFAULT NULL,
  `apellido_1_vend` varchar(50) DEFAULT NULL,
  `email_vend` varchar(50) DEFAULT NULL,
  `apellido_2__vend` varchar(50) DEFAULT NULL,
  `fecha_alta_vend` datetime DEFAULT NULL,
  `fecha_nac_vend` date DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`,`nif_vend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.vendedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
