# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.9 - MySQL Community Server (GPL)
# Server OS:                    Win64
# HeidiSQL version:             6.0.0.3952
# Date/time:                    2012-03-06 11:14:48
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for pmo
DROP DATABASE IF EXISTS `pmo`;
CREATE DATABASE IF NOT EXISTS `pmo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pmo`;


# Dumping structure for table pmo.audit_status
DROP TABLE IF EXISTS `audit_status`;
CREATE TABLE IF NOT EXISTS `audit_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.audit_status: ~4 rows (approximately)
/*!40000 ALTER TABLE `audit_status` DISABLE KEYS */;
INSERT INTO `audit_status` (`id`, `version`, `status`) VALUES
	(1, 0, 'In Progress'),
	(2, 0, 'N/A'),
	(3, 0, 'Pending Completetion'),
	(4, 0, 'Complete');
/*!40000 ALTER TABLE `audit_status` ENABLE KEYS */;


# Dumping structure for table pmo.change_order
DROP TABLE IF EXISTS `change_order`;
CREATE TABLE IF NOT EXISTS `change_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `change_order_name` varchar(120) NOT NULL,
  `link` longtext NOT NULL,
  `project_info_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEB379FF4F071278` (`project_info_id`),
  CONSTRAINT `FKEB379FF4F071278` FOREIGN KEY (`project_info_id`) REFERENCES `project_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pmo.change_order: ~0 rows (approximately)
/*!40000 ALTER TABLE `change_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_order` ENABLE KEYS */;


# Dumping structure for table pmo.impediment
DROP TABLE IF EXISTS `impediment`;
CREATE TABLE IF NOT EXISTS `impediment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `impediment` varchar(120) NOT NULL,
  `project_info_id` bigint(20) NOT NULL,
  `remediation_plan` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK553B02BC4F071278` (`project_info_id`),
  CONSTRAINT `FK553B02BC4F071278` FOREIGN KEY (`project_info_id`) REFERENCES `project_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pmo.impediment: ~0 rows (approximately)
/*!40000 ALTER TABLE `impediment` DISABLE KEYS */;
/*!40000 ALTER TABLE `impediment` ENABLE KEYS */;


# Dumping structure for table pmo.invoice_status
DROP TABLE IF EXISTS `invoice_status`;
CREATE TABLE IF NOT EXISTS `invoice_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.invoice_status: ~6 rows (approximately)
/*!40000 ALTER TABLE `invoice_status` DISABLE KEYS */;
INSERT INTO `invoice_status` (`id`, `version`, `status`) VALUES
	(1, 0, 'Pending Completion'),
	(2, 0, 'Invoiced'),
	(3, 0, 'Waived'),
	(4, 0, 'Included in Transaction Fees'),
	(5, 0, 'Free Hours'),
	(6, 0, ' N/A - Corporate');
/*!40000 ALTER TABLE `invoice_status` ENABLE KEYS */;


# Dumping structure for table pmo.person
DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `email` longtext NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.person: ~2 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`, `version`, `email`, `first_name`, `last_name`) VALUES
	(1, 0, 'neelima@parago.com', 'Neelima', 'Annam'),
	(2, 0, 'mchammer@parago.com', 'Craig', 'Hammer');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


# Dumping structure for table pmo.project_info
DROP TABLE IF EXISTS `project_info`;
CREATE TABLE IF NOT EXISTS `project_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `actual_cost` double NOT NULL,
  `actual_release_date` datetime DEFAULT NULL,
  `anticipated_clientgp` double NOT NULL,
  `audit_status_id` bigint(20) DEFAULT NULL,
  `billable_amount` double NOT NULL,
  `budget_with_contractors` double NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `delivery_manager_id` bigint(20) DEFAULT NULL,
  `estimate_to_complete` double NOT NULL,
  `invoice_note` varchar(255) DEFAULT NULL,
  `invoice_status` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `loe_hours` double NOT NULL,
  `number_of_quality_measures` double NOT NULL,
  `number_of_quality_measures_not_met` double NOT NULL,
  `planned_release_date` datetime DEFAULT NULL,
  `project_code` varchar(255) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_type` varchar(255) NOT NULL,
  `scrum_master` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `invoice_status_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK37FBDA145DF380A2` (`delivery_manager_id`),
  KEY `FK37FBDA141A680BC` (`audit_status_id`),
  KEY `FK37FBDA148AA13A1E` (`status_id`),
  KEY `FK37FBDA14851CBCA0` (`invoice_status_id`),
  CONSTRAINT `FK37FBDA14851CBCA0` FOREIGN KEY (`invoice_status_id`) REFERENCES `invoice_status` (`id`),
  CONSTRAINT `FK37FBDA141A680BC` FOREIGN KEY (`audit_status_id`) REFERENCES `audit_status` (`id`),
  CONSTRAINT `FK37FBDA145DF380A2` FOREIGN KEY (`delivery_manager_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK37FBDA148AA13A1E` FOREIGN KEY (`status_id`) REFERENCES `project_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.project_info: ~1 rows (approximately)
/*!40000 ALTER TABLE `project_info` DISABLE KEYS */;
INSERT INTO `project_info` (`id`, `version`, `actual_cost`, `actual_release_date`, `anticipated_clientgp`, `audit_status_id`, `billable_amount`, `budget_with_contractors`, `category`, `close_date`, `delivery_manager_id`, `estimate_to_complete`, `invoice_note`, `invoice_status`, `link`, `loe_hours`, `number_of_quality_measures`, `number_of_quality_measures_not_met`, `planned_release_date`, `project_code`, `project_name`, `project_type`, `scrum_master`, `start_date`, `status_id`, `invoice_status_id`) VALUES
	(1, 0, 0, '2012-03-05 14:20:45', 0, NULL, 0, 0, 'test', '2012-03-05 14:20:45', NULL, 0, NULL, NULL, NULL, 0, 0, 0, NULL, '123', 'Project BAM', 'Top Secret', 'Malcolm', '2012-03-05 14:20:45', NULL, NULL);
/*!40000 ALTER TABLE `project_info` ENABLE KEYS */;


# Dumping structure for table pmo.project_status
DROP TABLE IF EXISTS `project_status`;
CREATE TABLE IF NOT EXISTS `project_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.project_status: ~6 rows (approximately)
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
INSERT INTO `project_status` (`id`, `version`, `status`) VALUES
	(1, 0, 'Active'),
	(2, 0, 'Pending Approval'),
	(3, 0, 'On Hold'),
	(4, 0, '90 day'),
	(5, 0, 'Complete'),
	(6, 0, 'Cancelled');
/*!40000 ALTER TABLE `project_status` ENABLE KEYS */;


# Dumping structure for table pmo.quality_target
DROP TABLE IF EXISTS `quality_target`;
CREATE TABLE IF NOT EXISTS `quality_target` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `project_info_id` bigint(20) NOT NULL,
  `quality_measurement_process` varchar(255) NOT NULL,
  `quality_target` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK571160D14F071278` (`project_info_id`),
  CONSTRAINT `FK571160D14F071278` FOREIGN KEY (`project_info_id`) REFERENCES `project_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table pmo.quality_target: ~0 rows (approximately)
/*!40000 ALTER TABLE `quality_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `quality_target` ENABLE KEYS */;


# Dumping structure for table pmo.risk
DROP TABLE IF EXISTS `risk`;
CREATE TABLE IF NOT EXISTS `risk` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `project_info_id` bigint(20) NOT NULL,
  `risk` varchar(255) NOT NULL,
  `risk_migration_strategy` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK356ACF4F071278` (`project_info_id`),
  CONSTRAINT `FK356ACF4F071278` FOREIGN KEY (`project_info_id`) REFERENCES `project_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.risk: ~1 rows (approximately)
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
INSERT INTO `risk` (`id`, `version`, `project_info_id`, `risk`, `risk_migration_strategy`) VALUES
	(1, 0, 1, 'Herpes Risk', 'Something');
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
