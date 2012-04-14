# --------------------------------------------------------
# Host:                         pariww11
# Server version:               5.5.22 - MySQL Community Server (GPL) by Remi
# Server OS:                    Linux
# HeidiSQL version:             6.0.0.3952
# Date/time:                    2012-04-13 20:08:22
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.person: ~7 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`id`, `version`, `email`, `first_name`, `last_name`) VALUES
	(1, 0, 'neelima@parago.com', 'Neelima', 'Annam'),
	(2, 0, 'mchammer@parago.com', 'Craig', 'Hammer'),
	(3, 0, 'tom.kale@parago.com', 'Tom', 'Kale'),
	(4, 0, 'peggy.rattarree@parago.com', 'Peggy', 'Rattarree'),
	(5, 0, 'miriam.seasock@parago.com', 'Miriam', 'Seasock'),
	(6, 0, 'amy.tribendis@parago.com', 'Amy', 'Tribndis'),
	(7, 0, 'franz.zemen@parago.com', 'Franz', 'Zemen');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


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


# Dumping structure for table pmo.project_info
DROP TABLE IF EXISTS `project_info`;
CREATE TABLE IF NOT EXISTS `project_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `actual_cost` double NOT NULL,
  `actual_release_date` datetime DEFAULT NULL,
  `anticipated_clientgp` double NOT NULL,
  `audit_status_id` bigint(20) DEFAULT NULL,
  `audit_turnover_comments` varchar(255) DEFAULT NULL,
  `billable_amount` double NOT NULL,
  `budget_with_contractors` double NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `delivery_manager_id` bigint(20) DEFAULT NULL,
  `estimate_to_complete` double NOT NULL,
  `hand_off_complete` datetime DEFAULT NULL,
  `invoice_note` varchar(255) DEFAULT NULL,
  `invoice_status_id` bigint(20) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `loe_hours` double NOT NULL,
  `number_of_quality_measures` double NOT NULL,
  `number_of_quality_measures_not_met` double NOT NULL,
  `planned_release_date` datetime DEFAULT NULL,
  `project_code` varchar(255) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_type` varchar(255) NOT NULL,
  `scrum_master` varchar(255) DEFAULT NULL,
  `sixty_day_review` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `support_doc_delivered` datetime DEFAULT NULL,
  `thirty_day_review` datetime DEFAULT NULL,
  `turnover_status_id` bigint(20) DEFAULT NULL,
  `total_cap_cost` double DEFAULT NULL,
  `total_expense_cost` double DEFAULT NULL,
  `total_cap_hours` double DEFAULT NULL,
  `total_expense_hours` double DEFAULT NULL,
  `billable_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK37FBDA145DF380A2` (`delivery_manager_id`),
  KEY `FK37FBDA148008F6F2` (`turnover_status_id`),
  KEY `FK37FBDA14851CBCA0` (`invoice_status_id`),
  KEY `FK37FBDA141A680BC` (`audit_status_id`),
  KEY `FK37FBDA148AA13A1E` (`status_id`),
  CONSTRAINT `FK37FBDA141A680BC` FOREIGN KEY (`audit_status_id`) REFERENCES `audit_status` (`id`),
  CONSTRAINT `FK37FBDA145DF380A2` FOREIGN KEY (`delivery_manager_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK37FBDA148008F6F2` FOREIGN KEY (`turnover_status_id`) REFERENCES `turnover_status` (`id`),
  CONSTRAINT `FK37FBDA14851CBCA0` FOREIGN KEY (`invoice_status_id`) REFERENCES `invoice_status` (`id`),
  CONSTRAINT `FK37FBDA148AA13A1E` FOREIGN KEY (`status_id`) REFERENCES `project_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2285 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.project_info: ~27 rows (approximately)
/*!40000 ALTER TABLE `project_info` DISABLE KEYS */;
INSERT INTO `project_info` (`id`, `version`, `actual_cost`, `actual_release_date`, `anticipated_clientgp`, `audit_status_id`, `audit_turnover_comments`, `billable_amount`, `budget_with_contractors`, `category`, `close_date`, `delivery_manager_id`, `estimate_to_complete`, `hand_off_complete`, `invoice_note`, `invoice_status_id`, `link`, `loe_hours`, `number_of_quality_measures`, `number_of_quality_measures_not_met`, `planned_release_date`, `project_code`, `project_name`, `project_type`, `scrum_master`, `sixty_day_review`, `start_date`, `status_id`, `support_doc_delivered`, `thirty_day_review`, `turnover_status_id`, `total_cap_cost`, `total_expense_cost`, `total_cap_hours`, `total_expense_hours`, `billable_flag`) VALUES
	(1890, 1, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '61941', '61941-Slippage Database', 'Internal', 'Peggy Rattarree', NULL, '2010-08-15 00:00:00', 3, NULL, NULL, NULL, 3969.66, 0, 83.75, 0, 'Y'),
	(2012, 2, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, 2, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '67209', 'RM67209_Sprint AmEx Prepaid_Reporting', 'Client', 'Peggy Rattarree', NULL, '2011-02-02 00:00:00', 6, NULL, NULL, NULL, 0, 0, 0, 0, 'N'),
	(2085, 0, 0, '2011-12-30 00:00:00', 0, NULL, NULL, 0, 0, 'Capitalized', '2011-12-30 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '70867', 'IVR and SIP Proxy Upgrades', 'Internal', 'Craig Hammer', NULL, '2011-06-01 00:00:00', NULL, NULL, NULL, NULL, 11883.83, 0, 350.5, 0, 'Y'),
	(2115, 0, 0, '2012-01-19 00:00:00', 0, NULL, NULL, 0, 0, 'Capitalized', '2011-09-29 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '72521', '72521_Parago_Enhance Escheatment Processes', 'Internal', 'Kyle Frederick', NULL, '2011-07-28 00:00:00', NULL, NULL, NULL, NULL, 67222.74, 924.52, 1374.75, 18.75, 'Y'),
	(2116, 0, 0, '2012-01-01 00:00:00', 0, NULL, NULL, 0, 0, 'Capitalized', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '73796', '73796 - Paramax Incentives Dashboard', 'Internal', 'Peggy Rattarree', NULL, '2011-07-01 00:00:00', NULL, NULL, NULL, NULL, 20135.39, 1095.86, 416, 25.25, 'Y'),
	(2147, 0, 0, '2011-11-10 00:00:00', 0, NULL, NULL, 0, 0, 'Expense', '2011-11-11 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '74626_Staples_e', '74626_Staples_eCode Integration with DJA', 'Client', 'Kyle Frederick', NULL, '2011-09-26 00:00:00', NULL, NULL, NULL, NULL, 0, 33306.08, 0, 702.5, 'Y'),
	(2151, 0, 0, '2012-01-04 00:00:00', 0, NULL, NULL, 0, 0, 'Capitalized', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '05359', 'RP05359_GE Serial Number Feed', 'Client', 'Kimberly Stanton', NULL, NULL, NULL, NULL, NULL, NULL, 5807.52, 28755.16, 117.75, 547.75, 'Y'),
	(2161, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', '2012-02-29 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '76355', '76355_Parago_Campaign Attribute Recognition from OCR Scans', 'Internal', 'Christina Behrend', NULL, '2011-11-01 00:00:00', NULL, NULL, NULL, NULL, 4911.57, 9000.74, 107.75, 189.75, 'Y'),
	(2166, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '76780', '76780_Toyota Validation Plugin Phase 2', 'Client', 'Christina Behrend', NULL, '2011-11-14 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(2181, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', '2012-06-28 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '78087', '78087_Pepsi_Independent Bottlers', 'Client Delivery', 'Kyle Frederick', NULL, '2012-06-28 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(2207, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '894', 'CR-894 Federal Mogul Promocenters', 'Client', 'Kimberly Stanton', NULL, '2012-01-04 00:00:00', NULL, NULL, NULL, NULL, 0, 21215.56, 0, 478.75, 'Y'),
	(2215, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', '2012-12-31 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '78846', '2012 Data Center Virtualization', 'Internal', 'Craig Hammer', NULL, '2012-01-01 00:00:00', NULL, NULL, NULL, NULL, 49057.42, 0, 982.75, 0, 'Y'),
	(2229, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', '2012-05-31 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '79149', '79149_Pepsi_Pepsi + 2', 'Client', 'Kyle Frederick', NULL, '2012-01-10 00:00:00', NULL, NULL, NULL, NULL, 874.86, 0, 21, 0, 'Y'),
	(2233, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', '2012-05-01 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '79372', '79372_MetroPCS_GoRebate Mobile Submission', 'Client', 'Kyle Frederick', NULL, '2012-01-19 00:00:00', NULL, NULL, NULL, NULL, 44782.49, 3658.11, 1004.08, 54, 'Y'),
	(2239, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '79524', '79524_KIA Survey Reporting', 'Client', 'Peggy Rattarree', NULL, '2012-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(2240, 0, 0, '2012-02-16 00:00:00', 0, NULL, NULL, 0, 0, 'Expense', '2012-02-16 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '79783', '79783_ExxonChalmettEcodesFileChange', 'Client', 'Neelima Annam', NULL, '2012-01-30 00:00:00', NULL, NULL, NULL, NULL, 0, 1225.85, 0, 23.5, 'Y'),
	(2242, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '79973', '79973_Federal Mogul Reward Filter', 'Client', 'Kimberly Stanton', NULL, NULL, NULL, NULL, NULL, NULL, 5306.09, 0, 103.25, 0, 'Y'),
	(2244, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '79789', '79789_Verizon Perks Program', 'Client', 'Kimberly Stanton', NULL, '2012-02-03 00:00:00', NULL, NULL, NULL, NULL, 0, 2387.97, 0, 46.75, 'Y'),
	(2245, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Capitalized', '2012-06-15 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '80164', '80164 MetroPCS Add-A-Line TPV Changes', 'Client', 'Debbie Harrell', NULL, '2012-02-12 00:00:00', NULL, NULL, NULL, NULL, 16516.64, -33.17, 322.25, -1, 'Y'),
	(2246, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', '2012-07-15 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '79594', '79594 GE GeoSpring Refer-a-Friend', 'Client', 'Debbie Harrell', NULL, '2012-02-12 00:00:00', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Y'),
	(2249, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '80239', 'TXU Contractual Reporting 80239', 'Client', 'Peggy Rattarree', NULL, '2012-02-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(2260, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'NONE', '80773_Federal Mogul NAPA Promocenter', 'Client', 'Kimberly Stanton', NULL, '2012-03-05 00:00:00', NULL, NULL, NULL, NULL, 0, 9844.01, 0, 209.75, 'Y'),
	(2262, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '80359', '80359_VzW Negative ESN Insurance Claim Plug-in', 'Client', 'Debbie Harrell', NULL, '2012-03-26 00:00:00', NULL, NULL, NULL, NULL, 0, 1849.44, 0, 36, 'Y'),
	(2271, 0, 0, '2012-06-01 00:00:00', 0, NULL, NULL, 0, 0, 'Expense', '2012-07-31 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'RM00081951', '2012 F5 LTM OS Upgrade', 'Internal', 'Craig Hammer', NULL, '2012-03-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N'),
	(2275, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '81524', '81524_Staples_Update Easy Rebates Logo', 'Client', 'Debbie Harrell', NULL, '2012-03-21 00:00:00', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Y'),
	(2279, 0, 0, NULL, 0, NULL, NULL, 0, 0, 'Expense', NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '81962', '81962_Staples_CDF Reward Type Field Change', 'Client', 'Debbie Harrell', NULL, '2012-04-09 00:00:00', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Y'),
	(2284, 0, 0, '2012-04-26 00:00:00', 0, NULL, NULL, 0, 0, 'Expense', '2012-04-26 00:00:00', NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, '82588', '82588_EcodesforExxonEdison', 'Client', 'Neelima Annam', NULL, '2012-04-12 00:00:00', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Y');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.quality_target: ~2 rows (approximately)
/*!40000 ALTER TABLE `quality_target` DISABLE KEYS */;
INSERT INTO `quality_target` (`id`, `version`, `project_info_id`, `quality_measurement_process`, `quality_target`) VALUES
	(1, 0, 2166, 'PM Review', 'Meets all standards'),
	(2, 0, 2166, 'PM Review', 'Good HF');
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

# Dumping data for table pmo.risk: ~0 rows (approximately)
/*!40000 ALTER TABLE `risk` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk` ENABLE KEYS */;


# Dumping structure for table pmo.turnover_status
DROP TABLE IF EXISTS `turnover_status`;
CREATE TABLE IF NOT EXISTS `turnover_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.turnover_status: ~4 rows (approximately)
/*!40000 ALTER TABLE `turnover_status` DISABLE KEYS */;
INSERT INTO `turnover_status` (`id`, `version`, `status`) VALUES
	(1, 0, 'Planned'),
	(2, 0, 'Complete'),
	(3, 0, 'In Progress'),
	(4, 0, 'Not Applicable');
/*!40000 ALTER TABLE `turnover_status` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
