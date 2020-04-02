-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para vacunatorio
CREATE DATABASE IF NOT EXISTS `vacunatorio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vacunatorio`;

-- Volcando estructura para tabla vacunatorio.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `rut_paciente` varchar(12) NOT NULL,
  `nombre_paciente` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`rut_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla vacunatorio.pacientes: ~2 rows (aproximadamente)
DELETE FROM `pacientes`;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`rut_paciente`, `nombre_paciente`, `telefono`, `fecha_nacimiento`) VALUES
	('04-620-9547', 'Leroi Wilman', '60-565-4906', '2019-07-31'),
	('04-730-0817', 'Niall Gulvin', '04-043-8341', '2020-03-14'),
	('37-476-4141', 'Sal Gooden', '91-324-8045', '2019-04-11'),
	('67-996-5138', 'Marybelle Umbers', '42-177-7691', '2019-06-09'),
	('73-977-1564', 'Townsend Preshaw', '13-713-3032', '2019-04-13'),
	('79-357-7992', 'Morgen Segebrecht', '85-587-4552', '2019-10-05'),
	('79-972-2674', 'Jabez Taggert', '10-546-4256', '2019-06-17'),
	('80-165-1457', 'Maurise Verrico', '47-098-7866', '2019-12-20'),
	('89-818-1802', 'Walliw Mussalli', '03-164-5224', '2019-09-27'),
	('98-697-4032', 'Gustaf Janak', '19-257-6800', '2019-04-03');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

-- Volcando estructura para tabla vacunatorio.paciente_vacuna
CREATE TABLE IF NOT EXISTS `paciente_vacuna` (
  `rut_paciente` varchar(12) NOT NULL,
  `id_vacuna` int(3) NOT NULL,
  `fecha_vacunacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla vacunatorio.paciente_vacuna: ~2 rows (aproximadamente)
DELETE FROM `paciente_vacuna`;
/*!40000 ALTER TABLE `paciente_vacuna` DISABLE KEYS */;
INSERT INTO `paciente_vacuna` (`rut_paciente`, `id_vacuna`, `fecha_vacunacion`) VALUES
	('04-620-9547', 1, '2020-04-02'),
	('04-620-9547', 2, '2020-04-02');
/*!40000 ALTER TABLE `paciente_vacuna` ENABLE KEYS */;

-- Volcando estructura para tabla vacunatorio.vacunas
CREATE TABLE IF NOT EXISTS `vacunas` (
  `id_vacuna` int(3) NOT NULL AUTO_INCREMENT,
  `nombre_enfermedad` varchar(20) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`id_vacuna`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla vacunatorio.vacunas: ~1 rows (aproximadamente)
DELETE FROM `vacunas`;
/*!40000 ALTER TABLE `vacunas` DISABLE KEYS */;
INSERT INTO `vacunas` (`id_vacuna`, `nombre_enfermedad`, `fecha_registro`) VALUES
	(1, 'Rabia', '2019-05-16'),
	(2, 'Tuberculosis', '2019-06-17'),
	(3, 'Fiebre Amarilla', '2020-03-23'),
	(4, 'Difteria', '2020-01-26'),
	(5, 'Sarampion', '2020-03-30'),
	(6, 'Tetanos', '2020-03-16'),
	(7, 'Poliomielitis', '2019-09-04'),
	(8, 'Hib', '2019-06-18');
/*!40000 ALTER TABLE `vacunas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
