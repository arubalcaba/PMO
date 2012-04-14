# --------------------------------------------------------
# Host:                         184.106.212.88
# Server version:               5.1.52 - MySQL Community Server (GPL)
# Server OS:                    unknown-linux-gnu
# HeidiSQL version:             6.0.0.3952
# Date/time:                    2012-04-13 19:53:53
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for pmo
DROP DATABASE IF EXISTS `pmo`;
CREATE DATABASE IF NOT EXISTS `pmo` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pmo`;


# Dumping structure for table pmo.project_info
DROP TABLE IF EXISTS `project_info`;
CREATE TABLE IF NOT EXISTS `project_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `actual_cost` double NOT NULL,
  `actual_release_date` datetime DEFAULT NULL,
  `anticipated_clientgp` double NOT NULL,
  `audit_status_id` bigint(20) DEFAULT NULL,
  `budget_with_contractors` double NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `delivery_manager_id` bigint(20) DEFAULT NULL,
  `estimate_to_complete` double NOT NULL,
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
  `hand_off_complete` datetime DEFAULT NULL,
  `sixty_day_review` datetime DEFAULT NULL,
  `support_doc_delivered` datetime DEFAULT NULL,
  `thirty_day_review` datetime DEFAULT NULL,
  `turnover_status_id` bigint(20) DEFAULT NULL,
  `audit_turnover_comments` varchar(255) DEFAULT NULL,
  `total_cap_cost` double DEFAULT NULL,
  `total_expense_cost` double DEFAULT NULL,
  `total_cap_hours` double DEFAULT NULL,
  `total_expense_hours` double DEFAULT NULL,
  `billable_flag` char(1) NOT NULL,
  `budget_comments` varchar(255) DEFAULT NULL,
  `exec_summary` longtext,
  `quality_met` bit(1) NOT NULL,
  `schedule_comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK37FBDA145DF380A2` (`delivery_manager_id`),
  KEY `FK37FBDA141A680BC` (`audit_status_id`),
  KEY `FK37FBDA148AA13A1E` (`status_id`),
  KEY `FK37FBDA14851CBCA0` (`invoice_status_id`),
  KEY `FK37FBDA148008F6F2` (`turnover_status_id`),
  CONSTRAINT `FK37FBDA141A680BC` FOREIGN KEY (`audit_status_id`) REFERENCES `audit_status` (`id`),
  CONSTRAINT `FK37FBDA145DF380A2` FOREIGN KEY (`delivery_manager_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK37FBDA148008F6F2` FOREIGN KEY (`turnover_status_id`) REFERENCES `turnover_status` (`id`),
  CONSTRAINT `FK37FBDA14851CBCA0` FOREIGN KEY (`invoice_status_id`) REFERENCES `invoice_status` (`id`),
  CONSTRAINT `FK37FBDA148AA13A1E` FOREIGN KEY (`status_id`) REFERENCES `project_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2272 DEFAULT CHARSET=latin1;

# Dumping data for table pmo.project_info: ~14 rows (approximately)
/*!40000 ALTER TABLE `project_info` DISABLE KEYS */;
INSERT INTO `project_info` (`id`, `version`, `actual_cost`, `actual_release_date`, `anticipated_clientgp`, `audit_status_id`, `budget_with_contractors`, `category`, `close_date`, `delivery_manager_id`, `estimate_to_complete`, `link`, `loe_hours`, `number_of_quality_measures`, `number_of_quality_measures_not_met`, `planned_release_date`, `project_code`, `project_name`, `project_type`, `scrum_master`, `start_date`, `status_id`, `invoice_status_id`, `hand_off_complete`, `sixty_day_review`, `support_doc_delivered`, `thirty_day_review`, `turnover_status_id`, `audit_turnover_comments`, `total_cap_cost`, `total_expense_cost`, `total_cap_hours`, `total_expense_hours`, `billable_flag`, `budget_comments`, `exec_summary`, `quality_met`, `schedule_comments`) VALUES
	(1, 1, 0, '2012-03-05 14:20:45', 0, NULL, 0, 'test', '2012-03-05 14:20:45', 1, 0, NULL, 0, 0, 0, NULL, '123', 'Project BAM', 'Top Secret', 'Malcolm', '2012-03-05 14:20:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2012, 1, 0, NULL, 0, NULL, 0, 'Expense', NULL, 2, 0, NULL, 0, 0, 0, NULL, '67209', 'RM67209_Sprint AmEx Prepaid_Reporting', 'Client', 'Peggy Rattarree', '2011-02-02 00:00:00', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2017, 0, 0, '2011-03-24 00:00:00', 0, NULL, 0, 'Expense', NULL, NULL, 0, NULL, 0, 0, 0, NULL, 'NONE', 'RP05137_Netgear Incentives Audit Process Change', 'Client', 'Kimberly Stanton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2147, 0, 0, '2011-11-10 00:00:00', 0, NULL, 0, 'Expense', '2011-11-11 00:00:00', NULL, 0, NULL, 0, 0, 0, NULL, '74626_Staples_e', '74626_Staples_eCode Integration with DJA', 'Client', 'Kyle Frederick', '2011-09-26 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2166, 0, 0, NULL, 0, NULL, 0, 'Capitalized', NULL, NULL, 0, NULL, 0, 0, 0, NULL, '76780', '76780_Toyota Validation Plugin Phase 2', 'Client', 'Christina Behrend', '2011-11-14 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2181, 0, 0, NULL, 0, NULL, 0, 'Capitalized', '2012-06-28 00:00:00', NULL, 0, NULL, 0, 0, 0, NULL, '78087', '78087_Pepsi_Independent Bottlers', 'Client Delivery', 'Kyle Frederick', '2012-06-28 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2229, 0, 0, NULL, 0, NULL, 0, 'Capitalized', '2012-05-31 00:00:00', NULL, 0, NULL, 0, 0, 0, NULL, '79149', '79149_Pepsi_Power of One', 'Client Delivery', 'Kyle Frederick', '2012-01-10 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2233, 0, 0, NULL, 0, NULL, 0, 'Capitalized', '2012-05-01 00:00:00', NULL, 0, NULL, 0, 0, 0, NULL, '79372_MetroPCS_', '79372_MetroPCS_GoRebate Mobile Submission', 'Client', 'Kyle Frederick', '2012-01-19 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2239, 0, 0, NULL, 0, NULL, 0, 'Expense', NULL, NULL, 0, NULL, 0, 0, 0, NULL, '79524', '79524_KIA Survey Reporting', 'Client', 'Peggy Rattarree', '2012-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2240, 0, 0, '2012-02-16 00:00:00', 0, NULL, 0, 'Expense', '2012-02-16 00:00:00', NULL, 0, NULL, 0, 0, 0, NULL, '79783', '79783_ExxonChalmettEcodesFileChange', 'Client', 'Neelima Annam', '2012-01-30 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2245, 0, 0, NULL, 0, NULL, 0, 'Capitalized', '2012-06-15 00:00:00', NULL, 0, NULL, 0, 0, 0, NULL, '80164', '80164 MetroPCS Add-A-Line TPV Changes', 'Client', 'Debbie Harrell', '2012-02-12 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2246, 0, 0, NULL, 0, NULL, 0, 'Expense', '2012-07-15 00:00:00', NULL, 0, NULL, 0, 0, 0, NULL, '79594', '79594 GE GeoSpring Refer-a-Friend', 'Client', 'Debbie Harrell', '2012-02-12 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2249, 0, 0, NULL, 0, NULL, 0, 'Expense', NULL, NULL, 0, NULL, 0, 0, 0, NULL, '80239', 'TXU Contractual Reporting 80239', 'Client', 'Peggy Rattarree', '2012-02-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL),
	(2271, 0, 0, '2012-06-01 00:00:00', 0, NULL, 0, 'Expense', '2012-07-31 00:00:00', NULL, 0, NULL, 0, 0, 0, NULL, 'RM00081951', '2012 F5 LTM OS Upgrade', 'Internal', 'Craig Hammer', '2012-03-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, b'00000000', NULL);
/*!40000 ALTER TABLE `project_info` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
