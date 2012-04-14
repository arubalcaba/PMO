# --------------------------------------------------------
# Host:                         184.106.212.88
# Server version:               5.1.52 - MySQL Community Server (GPL)
# Server OS:                    unknown-linux-gnu
# HeidiSQL version:             6.0.0.3952
# Date/time:                    2012-04-13 20:32:57
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table pmo.pmo_rating_lookup
DROP TABLE IF EXISTS `pmo_rating_lookup`;
CREATE TABLE IF NOT EXISTS `pmo_rating_lookup` (
  `min_value` double DEFAULT NULL,
  `max_value` double DEFAULT NULL,
  `rating` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pmo.pmo_rating_lookup: ~51 rows (approximately)
/*!40000 ALTER TABLE `pmo_rating_lookup` DISABLE KEYS */;
INSERT INTO `pmo_rating_lookup` (`min_value`, `max_value`, `rating`) VALUES
	(0, 0, 10),
	(0.01, 0.01, 9.8),
	(0.02, 0.02, 9.6),
	(0.03, 0.03, 9.4),
	(0.04, 0.04, 9.2),
	(0.05, 0.05, 9),
	(0.06, 0.06, 8.8),
	(0.07, 0.07, 8.6),
	(0.08, 0.08, 8.4),
	(0.09, 0.09, 8.2),
	(0.1, 0.1, 8),
	(0.11, 0.11, 7.8),
	(0.12, 0.12, 7.6),
	(0.13, 0.13, 7.4),
	(0.14, 0.14, 7.2),
	(0.15, 0.15, 7),
	(0.16, 0.16, 6.8),
	(0.17, 0.17, 6.6),
	(0.18, 0.18, 6.4),
	(0.19, 0.19, 6.2),
	(0.2, 0.2, 6),
	(0.21, 0.21, 5.8),
	(0.22, 0.22, 5.6),
	(0.23, 0.23, 5.4),
	(0.24, 0.24, 5.2),
	(0.25, 0.25, 5),
	(0.26, 0.26, 4.8),
	(0.27, 0.27, 4.6),
	(0.28, 0.28, 4.4),
	(0.29, 0.29, 4.2),
	(0.3, 0.3, 4),
	(0.31, 0.31, 3.8),
	(0.32, 0.32, 3.6),
	(0.33, 0.33, 3.4),
	(0.34, 0.34, 3.2),
	(0.35, 0.35, 3),
	(0.36, 0.36, 2.8),
	(0.37, 0.37, 2.6),
	(0.38, 0.38, 2.4),
	(0.39, 0.39, 2.2),
	(0.4, 0.4, 2),
	(0.41, 0.41, 1.8),
	(0.42, 0.42, 1.6),
	(0.43, 0.43, 1.4),
	(0.44, 0.44, 1.2),
	(0.45, 0.45, 1),
	(0.46, 0.46, 0.8),
	(0.47, 0.47, 0.6),
	(0.48, 0.48, 0.4),
	(0.49, 0.49, 0.2),
	(0.5, 99.9, 0);
/*!40000 ALTER TABLE `pmo_rating_lookup` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
