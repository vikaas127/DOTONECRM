/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.27-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ps_dynamech
-- ------------------------------------------------------
-- Server version	10.5.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dynamech_tblacc_account_history`
--

DROP TABLE IF EXISTS `dynamech_tblacc_account_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_account_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `debit` decimal(15,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(15,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(45) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `reconcile` int(11) NOT NULL DEFAULT 0,
  `split` int(11) NOT NULL DEFAULT 0,
  `item` int(11) DEFAULT NULL,
  `paid` int(1) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `payslip_type` varchar(45) DEFAULT NULL,
  `vendor` int(11) DEFAULT NULL,
  `itemable_id` int(11) DEFAULT NULL,
  `cleared` int(11) NOT NULL DEFAULT 0,
  `sub_type` varchar(45) DEFAULT NULL,
  `bill_item` int(11) NOT NULL DEFAULT 0,
  `number` varchar(100) DEFAULT NULL,
  `issue` int(11) NOT NULL DEFAULT 0,
  `added_from_reconcile` int(11) NOT NULL DEFAULT 0,
  `bank_reconcile` int(11) NOT NULL DEFAULT 0,
  `currency_rate` decimal(15,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_account_history`
--

LOCK TABLES `dynamech_tblacc_account_history` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_account_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_account_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_account_type_details`
--

DROP TABLE IF EXISTS `dynamech_tblacc_account_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_account_type_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `statement_of_cash_flows` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_account_type_details`
--

LOCK TABLES `dynamech_tblacc_account_type_details` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_account_type_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_account_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_accounts`
--

DROP TABLE IF EXISTS `dynamech_tblacc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key_name` varchar(255) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `parent_account` int(11) DEFAULT NULL,
  `account_type_id` int(11) NOT NULL,
  `account_detail_type_id` int(11) NOT NULL,
  `balance` decimal(15,2) DEFAULT NULL,
  `balance_as_of` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `default_account` int(11) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1,
  `access_token` text DEFAULT NULL,
  `account_id` varchar(255) DEFAULT NULL,
  `plaid_status` tinyint(5) NOT NULL DEFAULT 0 COMMENT '1=>verified, 0=>not verified',
  `plaid_account_name` varchar(255) DEFAULT NULL,
  `bank_account` text DEFAULT NULL,
  `bank_routing` text DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_accounts`
--

LOCK TABLES `dynamech_tblacc_accounts` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_accounts` DISABLE KEYS */;
INSERT INTO `dynamech_tblacc_accounts` VALUES (1,'','acc_opening_balance_equity',NULL,NULL,10,71,NULL,NULL,NULL,1,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dynamech_tblacc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_bank_reconciles`
--

DROP TABLE IF EXISTS `dynamech_tblacc_bank_reconciles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_bank_reconciles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `opening_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `beginning_balance` decimal(15,2) NOT NULL,
  `ending_balance` decimal(15,2) NOT NULL,
  `ending_date` date NOT NULL,
  `finish` int(11) NOT NULL DEFAULT 0,
  `debits_for_period` decimal(15,2) NOT NULL,
  `credits_for_period` decimal(15,2) NOT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_bank_reconciles`
--

LOCK TABLES `dynamech_tblacc_bank_reconciles` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_bank_reconciles` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_bank_reconciles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_banking_rule_details`
--

DROP TABLE IF EXISTS `dynamech_tblacc_banking_rule_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_banking_rule_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `subtype` varchar(45) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `subtype_amount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_banking_rule_details`
--

LOCK TABLES `dynamech_tblacc_banking_rule_details` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_banking_rule_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_banking_rule_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_banking_rules`
--

DROP TABLE IF EXISTS `dynamech_tblacc_banking_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_banking_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `transaction` varchar(45) DEFAULT NULL,
  `following` varchar(45) DEFAULT NULL,
  `then` varchar(45) DEFAULT NULL,
  `payment_account` int(11) DEFAULT NULL,
  `deposit_to` int(11) DEFAULT NULL,
  `auto_add` int(11) NOT NULL DEFAULT 0,
  `mapping_type` varchar(25) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `split_percentage` text DEFAULT NULL,
  `split_amount` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_banking_rules`
--

LOCK TABLES `dynamech_tblacc_banking_rules` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_banking_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_banking_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_bill_mappings`
--

DROP TABLE IF EXISTS `dynamech_tblacc_bill_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_bill_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `qty` decimal(15,2) NOT NULL DEFAULT 0.00,
  `cost` decimal(15,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_bill_mappings`
--

LOCK TABLES `dynamech_tblacc_bill_mappings` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_bill_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_bill_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_budget_details`
--

DROP TABLE IF EXISTS `dynamech_tblacc_budget_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_budget_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `budget_id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `account` int(11) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_budget_details`
--

LOCK TABLES `dynamech_tblacc_budget_details` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_budget_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_budget_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_budgets`
--

DROP TABLE IF EXISTS `dynamech_tblacc_budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_budgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `data_source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_budgets`
--

LOCK TABLES `dynamech_tblacc_budgets` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_check_details`
--

DROP TABLE IF EXISTS `dynamech_tblacc_check_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_check_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_id` int(11) DEFAULT NULL,
  `bill` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_check_details`
--

LOCK TABLES `dynamech_tblacc_check_details` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_check_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_check_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_checks`
--

DROP TABLE IF EXISTS `dynamech_tblacc_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(25) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `bank_account` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `signed` int(11) NOT NULL DEFAULT 0,
  `include_company_name_address` int(11) NOT NULL DEFAULT 1,
  `include_routing_account_numbers` int(11) NOT NULL DEFAULT 1,
  `bill` int(11) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `issue` int(11) DEFAULT NULL,
  `include_check_number` int(11) NOT NULL DEFAULT 1,
  `include_bank_name` int(11) NOT NULL DEFAULT 1,
  `bank_name` varchar(255) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `vendor_city` varchar(100) DEFAULT NULL,
  `vendor_zip` varchar(15) DEFAULT NULL,
  `vendor_state` varchar(50) DEFAULT NULL,
  `vendor_address` text DEFAULT NULL,
  `reason_for_void` text DEFAULT NULL,
  `bill_items` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_checks`
--

LOCK TABLES `dynamech_tblacc_checks` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_checks_printed`
--

DROP TABLE IF EXISTS `dynamech_tblacc_checks_printed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_checks_printed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_id` int(11) DEFAULT NULL,
  `bank_account` int(11) DEFAULT NULL,
  `first_check_number` int(11) DEFAULT NULL,
  `printed_at` datetime DEFAULT NULL,
  `printed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_checks_printed`
--

LOCK TABLES `dynamech_tblacc_checks_printed` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_checks_printed` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_checks_printed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_expense_category_mapping_details`
--

DROP TABLE IF EXISTS `dynamech_tblacc_expense_category_mapping_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_expense_category_mapping_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_mapping_id` int(11) NOT NULL,
  `payment_mode_id` int(11) NOT NULL,
  `payment_account` int(11) NOT NULL DEFAULT 0,
  `deposit_to` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_expense_category_mapping_details`
--

LOCK TABLES `dynamech_tblacc_expense_category_mapping_details` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_expense_category_mapping_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_expense_category_mapping_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_expense_category_mappings`
--

DROP TABLE IF EXISTS `dynamech_tblacc_expense_category_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_expense_category_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `payment_account` int(11) NOT NULL DEFAULT 0,
  `deposit_to` int(11) NOT NULL DEFAULT 0,
  `preferred_payment_method` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_expense_category_mappings`
--

LOCK TABLES `dynamech_tblacc_expense_category_mappings` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_expense_category_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_expense_category_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_income_statement_modifications`
--

DROP TABLE IF EXISTS `dynamech_tblacc_income_statement_modifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_income_statement_modifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `account` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `account_type` int(11) DEFAULT NULL,
  `options` text DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_income_statement_modifications`
--

LOCK TABLES `dynamech_tblacc_income_statement_modifications` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_income_statement_modifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_income_statement_modifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_integration_error_logs`
--

DROP TABLE IF EXISTS `dynamech_tblacc_integration_error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_integration_error_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(50) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `software` varchar(50) NOT NULL,
  `error_detail` text DEFAULT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_integration_error_logs`
--

LOCK TABLES `dynamech_tblacc_integration_error_logs` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_integration_error_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_integration_error_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_integration_logs`
--

DROP TABLE IF EXISTS `dynamech_tblacc_integration_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_integration_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(50) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `software` varchar(50) NOT NULL,
  `connect_id` varchar(50) NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_integration_logs`
--

LOCK TABLES `dynamech_tblacc_integration_logs` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_integration_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_integration_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_integration_sync_logs`
--

DROP TABLE IF EXISTS `dynamech_tblacc_integration_sync_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_integration_sync_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(50) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `software` varchar(50) NOT NULL,
  `type` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `connect_id` text DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_integration_sync_logs`
--

LOCK TABLES `dynamech_tblacc_integration_sync_logs` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_integration_sync_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_integration_sync_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_item_automatics`
--

DROP TABLE IF EXISTS `dynamech_tblacc_item_automatics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_item_automatics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `inventory_asset_account` int(11) NOT NULL DEFAULT 0,
  `income_account` int(11) NOT NULL DEFAULT 0,
  `expense_account` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_item_automatics`
--

LOCK TABLES `dynamech_tblacc_item_automatics` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_item_automatics` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_item_automatics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_journal_entries`
--

DROP TABLE IF EXISTS `dynamech_tblacc_journal_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_journal_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `journal_date` date DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `recurring_type` varchar(10) DEFAULT NULL,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `cycles` int(11) NOT NULL DEFAULT 0,
  `total_cycles` int(11) NOT NULL DEFAULT 0,
  `is_recurring_from` int(11) DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_journal_entries`
--

LOCK TABLES `dynamech_tblacc_journal_entries` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_journal_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_journal_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_matched_transactions`
--

DROP TABLE IF EXISTS `dynamech_tblacc_matched_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_matched_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_history_id` int(11) DEFAULT NULL,
  `history_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `company` int(11) DEFAULT NULL,
  `reconcile` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_matched_transactions`
--

LOCK TABLES `dynamech_tblacc_matched_transactions` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_matched_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_matched_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_pay_bill_details`
--

DROP TABLE IF EXISTS `dynamech_tblacc_pay_bill_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_pay_bill_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_bill` int(11) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_pay_bill_details`
--

LOCK TABLES `dynamech_tblacc_pay_bill_details` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_pay_bill_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_pay_bill_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_pay_bill_item_paid`
--

DROP TABLE IF EXISTS `dynamech_tblacc_pay_bill_item_paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_pay_bill_item_paid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_bill_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `amount_paid` decimal(15,2) NOT NULL DEFAULT 0.00,
  `check_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_pay_bill_item_paid`
--

LOCK TABLES `dynamech_tblacc_pay_bill_item_paid` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_pay_bill_item_paid` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_pay_bill_item_paid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_pay_bills`
--

DROP TABLE IF EXISTS `dynamech_tblacc_pay_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_pay_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense` int(11) DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `account_debit` int(11) DEFAULT NULL,
  `account_credit` int(11) DEFAULT NULL,
  `bill` int(11) NOT NULL DEFAULT 0,
  `vendor` int(11) NOT NULL DEFAULT 0,
  `pay_number` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `bill_items` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_pay_bills`
--

LOCK TABLES `dynamech_tblacc_pay_bills` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_pay_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_pay_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_payment_mode_mappings`
--

DROP TABLE IF EXISTS `dynamech_tblacc_payment_mode_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_payment_mode_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_mode_id` int(11) NOT NULL,
  `payment_account` int(11) NOT NULL DEFAULT 0,
  `deposit_to` int(11) NOT NULL DEFAULT 0,
  `expense_payment_account` int(11) NOT NULL DEFAULT 0,
  `expense_deposit_to` int(11) NOT NULL DEFAULT 0,
  `credit_note_refund_payment_account` int(11) NOT NULL DEFAULT 0,
  `credit_note_refund_deposit_to` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_payment_mode_mappings`
--

LOCK TABLES `dynamech_tblacc_payment_mode_mappings` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_payment_mode_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_payment_mode_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_plaid_transaction_logs`
--

DROP TABLE IF EXISTS `dynamech_tblacc_plaid_transaction_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_plaid_transaction_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `last_updated` date DEFAULT NULL,
  `transaction_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `addedFrom` int(11) DEFAULT NULL,
  `company` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_plaid_transaction_logs`
--

LOCK TABLES `dynamech_tblacc_plaid_transaction_logs` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_plaid_transaction_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_plaid_transaction_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_print_later`
--

DROP TABLE IF EXISTS `dynamech_tblacc_print_later`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_print_later` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(45) DEFAULT NULL,
  `account` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_print_later`
--

LOCK TABLES `dynamech_tblacc_print_later` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_print_later` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_print_later` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_reconciles`
--

DROP TABLE IF EXISTS `dynamech_tblacc_reconciles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_reconciles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `beginning_balance` decimal(15,2) NOT NULL,
  `ending_balance` decimal(15,2) NOT NULL,
  `ending_date` date NOT NULL,
  `expense_date` date DEFAULT NULL,
  `service_charge` decimal(15,2) DEFAULT NULL,
  `expense_account` int(11) DEFAULT NULL,
  `income_date` date DEFAULT NULL,
  `interest_earned` decimal(15,2) DEFAULT NULL,
  `income_account` int(11) DEFAULT NULL,
  `finish` int(11) NOT NULL DEFAULT 0,
  `opening_balance` int(11) NOT NULL DEFAULT 0,
  `debits_for_period` decimal(15,2) DEFAULT NULL,
  `credits_for_period` decimal(15,2) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_reconciles`
--

LOCK TABLES `dynamech_tblacc_reconciles` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_reconciles` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_reconciles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_tax_mappings`
--

DROP TABLE IF EXISTS `dynamech_tblacc_tax_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_tax_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_id` int(11) NOT NULL,
  `payment_account` int(11) NOT NULL DEFAULT 0,
  `deposit_to` int(11) NOT NULL DEFAULT 0,
  `expense_payment_account` int(11) NOT NULL DEFAULT 0,
  `expense_deposit_to` int(11) NOT NULL DEFAULT 0,
  `purchase_payment_account` int(11) NOT NULL DEFAULT 0,
  `purchase_deposit_to` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_tax_mappings`
--

LOCK TABLES `dynamech_tblacc_tax_mappings` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_tax_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_tax_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_transaction_bankings`
--

DROP TABLE IF EXISTS `dynamech_tblacc_transaction_bankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_transaction_bankings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `withdrawals` decimal(15,2) NOT NULL DEFAULT 0.00,
  `deposits` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payee` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `transaction_id` varchar(150) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `status` tinyint(5) NOT NULL DEFAULT 0 COMMENT '1=>posted, 2=>pending',
  `matched` int(11) NOT NULL DEFAULT 0,
  `reconcile` int(11) NOT NULL DEFAULT 0,
  `adjusted` int(11) NOT NULL DEFAULT 0,
  `is_imported` int(11) NOT NULL DEFAULT 0,
  `banking_rule` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_transaction_bankings`
--

LOCK TABLES `dynamech_tblacc_transaction_bankings` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_transaction_bankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_transaction_bankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblacc_transfers`
--

DROP TABLE IF EXISTS `dynamech_tblacc_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblacc_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_funds_from` int(11) NOT NULL,
  `transfer_funds_to` int(11) NOT NULL,
  `transfer_amount` decimal(15,2) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblacc_transfers`
--

LOCK TABLES `dynamech_tblacc_transfers` WRITE;
/*!40000 ALTER TABLE `dynamech_tblacc_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblacc_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblactivity_log`
--

DROP TABLE IF EXISTS `dynamech_tblactivity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblactivity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `date` datetime NOT NULL,
  `staffid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dynamech_staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblactivity_log`
--

LOCK TABLES `dynamech_tblactivity_log` WRITE;
/*!40000 ALTER TABLE `dynamech_tblactivity_log` DISABLE KEYS */;
INSERT INTO `dynamech_tblactivity_log` VALUES (1,'New Client Created [ID: 1]','2025-09-25 11:56:12','[CRON]'),(2,'New Leads Source Added [SourceID: 4, Name: Flexstage Events]','2025-09-25 11:56:12','[CRON]'),(3,'New Leads Status Added [StatusID: 3, Name: Event Attendees]','2025-09-25 11:56:12','[CRON]'),(4,'User Successfully Logged In [User Id: 1, Is Staff Member: Yes, IP: 106.219.237.199]','2025-09-25 11:56:56','Ajay Thakur'),(5,'New Leads Source Added [SourceID: 5, Name: Up trade fair]','2025-09-25 11:57:44','Ajay Thakur'),(6,'New Web to Lead Form Added [Up Trade fair]','2025-09-25 11:58:20','Ajay Thakur');
/*!40000 ALTER TABLE `dynamech_tblactivity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblannouncements`
--

DROP TABLE IF EXISTS `dynamech_tblannouncements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblannouncements` (
  `announcementid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` mediumtext DEFAULT NULL,
  `showtousers` int(11) NOT NULL,
  `showtostaff` int(11) NOT NULL,
  `showname` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `userid` varchar(100) NOT NULL,
  PRIMARY KEY (`announcementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblannouncements`
--

LOCK TABLES `dynamech_tblannouncements` WRITE;
/*!40000 ALTER TABLE `dynamech_tblannouncements` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblannouncements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblappointly_appointment_types`
--

DROP TABLE IF EXISTS `dynamech_tblappointly_appointment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblappointly_appointment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblappointly_appointment_types`
--

LOCK TABLES `dynamech_tblappointly_appointment_types` WRITE;
/*!40000 ALTER TABLE `dynamech_tblappointly_appointment_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblappointly_appointment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblappointly_appointments`
--

DROP TABLE IF EXISTS `dynamech_tblappointly_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblappointly_appointments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `google_event_id` varchar(191) DEFAULT NULL,
  `google_calendar_link` varchar(191) DEFAULT NULL,
  `google_meet_link` varchar(191) DEFAULT NULL,
  `google_added_by_id` int(11) DEFAULT NULL,
  `outlook_event_id` varchar(191) DEFAULT NULL,
  `outlook_calendar_link` varchar(255) DEFAULT NULL,
  `outlook_added_by_id` int(11) DEFAULT NULL,
  `subject` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `by_sms` tinyint(1) DEFAULT NULL,
  `by_email` tinyint(1) DEFAULT NULL,
  `hash` varchar(191) DEFAULT NULL,
  `notification_date` datetime DEFAULT NULL,
  `external_notification_date` datetime DEFAULT NULL,
  `date` date NOT NULL,
  `start_hour` varchar(191) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `reminder_before` int(11) DEFAULT NULL,
  `reminder_before_type` varchar(10) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT 0,
  `cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `cancel_notes` text DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `feedback` smallint(6) DEFAULT NULL,
  `feedback_comment` text DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `custom_recurring` tinyint(4) NOT NULL,
  `cycles` int(11) NOT NULL DEFAULT 0,
  `total_cycles` int(11) NOT NULL DEFAULT 0,
  `last_recurring_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblappointly_appointments`
--

LOCK TABLES `dynamech_tblappointly_appointments` WRITE;
/*!40000 ALTER TABLE `dynamech_tblappointly_appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblappointly_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblappointly_attendees`
--

DROP TABLE IF EXISTS `dynamech_tblappointly_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblappointly_attendees` (
  `staff_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblappointly_attendees`
--

LOCK TABLES `dynamech_tblappointly_attendees` WRITE;
/*!40000 ALTER TABLE `dynamech_tblappointly_attendees` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblappointly_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblappointly_callbacks`
--

DROP TABLE IF EXISTS `dynamech_tblappointly_callbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblappointly_callbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_type` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `timezone` varchar(191) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT '1',
  `message` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblappointly_callbacks`
--

LOCK TABLES `dynamech_tblappointly_callbacks` WRITE;
/*!40000 ALTER TABLE `dynamech_tblappointly_callbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblappointly_callbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblappointly_callbacks_assignees`
--

DROP TABLE IF EXISTS `dynamech_tblappointly_callbacks_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblappointly_callbacks_assignees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callbackid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblappointly_callbacks_assignees`
--

LOCK TABLES `dynamech_tblappointly_callbacks_assignees` WRITE;
/*!40000 ALTER TABLE `dynamech_tblappointly_callbacks_assignees` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblappointly_callbacks_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblappointly_google`
--

DROP TABLE IF EXISTS `dynamech_tblappointly_google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblappointly_google` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `access_token` varchar(191) NOT NULL,
  `refresh_token` varchar(191) NOT NULL,
  `expires_in` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblappointly_google`
--

LOCK TABLES `dynamech_tblappointly_google` WRITE;
/*!40000 ALTER TABLE `dynamech_tblappointly_google` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblappointly_google` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblbonus_discipline`
--

DROP TABLE IF EXISTS `dynamech_tblbonus_discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblbonus_discipline` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `id_criteria` varchar(200) DEFAULT NULL,
  `type` int(3) NOT NULL,
  `apply_for` varchar(50) DEFAULT NULL,
  `from_time` datetime DEFAULT NULL,
  `lever_bonus` int(11) DEFAULT NULL,
  `approver` int(11) DEFAULT NULL,
  `url_file` longtext DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `id_admin` int(3) DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblbonus_discipline`
--

LOCK TABLES `dynamech_tblbonus_discipline` WRITE;
/*!40000 ALTER TABLE `dynamech_tblbonus_discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblbonus_discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblbonus_discipline_detail`
--

DROP TABLE IF EXISTS `dynamech_tblbonus_discipline_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblbonus_discipline_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_bonus_discipline` int(11) NOT NULL,
  `from_time` datetime DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `department_id` longtext DEFAULT NULL,
  `lever_bonus` int(11) DEFAULT NULL,
  `formality` varchar(50) DEFAULT NULL,
  `formality_value` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblbonus_discipline_detail`
--

LOCK TABLES `dynamech_tblbonus_discipline_detail` WRITE;
/*!40000 ALTER TABLE `dynamech_tblbonus_discipline_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblbonus_discipline_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcart`
--

DROP TABLE IF EXISTS `dynamech_tblcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_contact` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `voucher` varchar(100) NOT NULL,
  `status` int(11) DEFAULT 0,
  `complete` int(11) DEFAULT 0,
  `datecreator` datetime NOT NULL DEFAULT current_timestamp(),
  `order_number` varchar(100) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel` varchar(150) DEFAULT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `billing_street` varchar(150) DEFAULT NULL,
  `billing_city` varchar(50) DEFAULT NULL,
  `billing_state` varchar(50) DEFAULT NULL,
  `billing_country` varchar(50) DEFAULT NULL,
  `billing_zip` varchar(50) DEFAULT NULL,
  `shipping_street` varchar(150) DEFAULT NULL,
  `shipping_city` varchar(50) DEFAULT NULL,
  `shipping_state` varchar(50) DEFAULT NULL,
  `shipping_country` varchar(50) DEFAULT NULL,
  `shipping_zip` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reason` varchar(250) DEFAULT NULL,
  `admin_action` int(11) DEFAULT 0,
  `discount` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT 0,
  `total` varchar(250) DEFAULT NULL,
  `sub_total` varchar(250) DEFAULT NULL,
  `discount_total` varchar(250) NOT NULL DEFAULT '',
  `invoice` varchar(250) NOT NULL DEFAULT '',
  `number_invoice` varchar(250) NOT NULL DEFAULT '',
  `stock_export_number` varchar(250) NOT NULL DEFAULT '',
  `create_invoice` varchar(5) NOT NULL DEFAULT 'off',
  `stock_export` varchar(5) NOT NULL DEFAULT 'off',
  `customers_pay` decimal(15,2) NOT NULL DEFAULT 0.00,
  `amount_returned` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `seller` int(11) DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `allowed_payment_modes` varchar(200) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `shipping` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_method_title` varchar(250) DEFAULT NULL,
  `discount_type_str` text DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `shipping_tax` decimal(15,2) DEFAULT NULL,
  `enable` int(11) NOT NULL DEFAULT 1,
  `duedate` date DEFAULT NULL,
  `shipping_tax_json` varchar(150) DEFAULT NULL,
  `discount_voucher` varchar(150) DEFAULT NULL,
  `original_order_id` int(11) DEFAULT NULL,
  `return_reason` longtext DEFAULT NULL,
  `approve_status` int(11) NOT NULL DEFAULT 0,
  `process_invoice` varchar(5) NOT NULL DEFAULT 'off',
  `stock_import_number` int(11) NOT NULL DEFAULT 0,
  `fee_for_return_order` decimal(15,2) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `add_discount` decimal(15,2) DEFAULT 0.00,
  `shipping_form` varchar(50) DEFAULT 'fixed',
  `shipping_value` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcart`
--

LOCK TABLES `dynamech_tblcart` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcart_detailt`
--

DROP TABLE IF EXISTS `dynamech_tblcart_detailt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcart_detailt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` float NOT NULL,
  `classify` varchar(30) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `prices` decimal(15,2) DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `sku` text NOT NULL,
  `percent_discount` decimal(15,0) NOT NULL,
  `prices_discount` decimal(15,2) NOT NULL,
  `tax` text DEFAULT NULL,
  `tax_id` text DEFAULT NULL,
  `tax_rate` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcart_detailt`
--

LOCK TABLES `dynamech_tblcart_detailt` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcart_detailt` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcart_detailt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcd_care`
--

DROP TABLE IF EXISTS `dynamech_tblcd_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcd_care` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `care_time` datetime NOT NULL,
  `care_result` text NOT NULL,
  `description` text DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcd_care`
--

LOCK TABLES `dynamech_tblcd_care` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcd_care` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcd_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcd_family_infor`
--

DROP TABLE IF EXISTS `dynamech_tblcd_family_infor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcd_family_infor` (
  `fi_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `fi_birthday` date DEFAULT NULL,
  `job` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` int(15) DEFAULT NULL,
  PRIMARY KEY (`fi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcd_family_infor`
--

LOCK TABLES `dynamech_tblcd_family_infor` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcd_family_infor` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcd_family_infor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcd_interview`
--

DROP TABLE IF EXISTS `dynamech_tblcd_interview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcd_interview` (
  `in_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `interview` int(11) NOT NULL,
  `cd_from_hours` datetime DEFAULT NULL,
  `cd_to_hours` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcd_interview`
--

LOCK TABLES `dynamech_tblcd_interview` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcd_interview` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcd_interview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcd_literacy`
--

DROP TABLE IF EXISTS `dynamech_tblcd_literacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcd_literacy` (
  `li_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `literacy_from_date` date DEFAULT NULL,
  `literacy_to_date` date DEFAULT NULL,
  `diploma` varchar(200) DEFAULT NULL,
  `training_places` varchar(200) DEFAULT NULL,
  `specialized` varchar(200) DEFAULT NULL,
  `training_form` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`li_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcd_literacy`
--

LOCK TABLES `dynamech_tblcd_literacy` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcd_literacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcd_literacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcd_skill`
--

DROP TABLE IF EXISTS `dynamech_tblcd_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcd_skill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `skill_name` text DEFAULT NULL,
  `skill_description` text DEFAULT NULL,
  PRIMARY KEY (`id`,`candidate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcd_skill`
--

LOCK TABLES `dynamech_tblcd_skill` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcd_skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcd_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcd_work_experience`
--

DROP TABLE IF EXISTS `dynamech_tblcd_work_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcd_work_experience` (
  `we_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `candidate` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `position` varchar(200) DEFAULT NULL,
  `contact_person` varchar(200) DEFAULT NULL,
  `salary` varchar(200) DEFAULT NULL,
  `reason_quitwork` varchar(200) DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  PRIMARY KEY (`we_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcd_work_experience`
--

LOCK TABLES `dynamech_tblcd_work_experience` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcd_work_experience` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcd_work_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcheck_in_out`
--

DROP TABLE IF EXISTS `dynamech_tblcheck_in_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcheck_in_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type_check` int(11) DEFAULT NULL,
  `type` varchar(5) NOT NULL DEFAULT 'W',
  `route_point_id` int(11) DEFAULT NULL,
  `workplace_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcheck_in_out`
--

LOCK TABLES `dynamech_tblcheck_in_out` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcheck_in_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcheck_in_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblchecklist`
--

DROP TABLE IF EXISTS `dynamech_tblchecklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblchecklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblchecklist`
--

LOCK TABLES `dynamech_tblchecklist` WRITE;
/*!40000 ALTER TABLE `dynamech_tblchecklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblchecklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblchecklist_allocation`
--

DROP TABLE IF EXISTS `dynamech_tblchecklist_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblchecklist_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblchecklist_allocation`
--

LOCK TABLES `dynamech_tblchecklist_allocation` WRITE;
/*!40000 ALTER TABLE `dynamech_tblchecklist_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblchecklist_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblclients`
--

DROP TABLE IF EXISTS `dynamech_tblclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblclients` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(191) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT 0,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `leadid` int(11) DEFAULT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT 0,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT 0,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `default_language` varchar(40) DEFAULT NULL,
  `default_currency` int(11) NOT NULL DEFAULT 0,
  `show_primary_contact` int(11) NOT NULL DEFAULT 0,
  `stripe_id` varchar(40) DEFAULT NULL,
  `registration_confirmed` int(11) NOT NULL DEFAULT 1,
  `addedfrom` int(11) NOT NULL DEFAULT 0,
  `balance` decimal(15,2) DEFAULT NULL,
  `balance_as_of` date DEFAULT NULL,
  `loy_point` decimal(10,0) DEFAULT 0,
  `sector` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `continue_from_date` date DEFAULT NULL,
  `woo_customer_id` int(11) DEFAULT 0,
  `woo_channel_id` int(11) DEFAULT 0,
  PRIMARY KEY (`userid`),
  KEY `country` (`country`),
  KEY `leadid` (`leadid`),
  KEY `company` (`company`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblclients`
--

LOCK TABLES `dynamech_tblclients` WRITE;
/*!40000 ALTER TABLE `dynamech_tblclients` DISABLE KEYS */;
INSERT INTO `dynamech_tblclients` VALUES (1,'Flexstage Event Records',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'2025-09-25 11:56:12',1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,0,NULL,1,0,NULL,NULL,0,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `dynamech_tblclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblconsent_purposes`
--

DROP TABLE IF EXISTS `dynamech_tblconsent_purposes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblconsent_purposes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblconsent_purposes`
--

LOCK TABLES `dynamech_tblconsent_purposes` WRITE;
/*!40000 ALTER TABLE `dynamech_tblconsent_purposes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblconsent_purposes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblconsents`
--

DROP TABLE IF EXISTS `dynamech_tblconsents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblconsents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `ip` varchar(40) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `lead_id` int(11) NOT NULL DEFAULT 0,
  `description` mediumtext DEFAULT NULL,
  `opt_in_purpose_description` mediumtext DEFAULT NULL,
  `purpose_id` int(11) NOT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `candidate_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `purpose_id` (`purpose_id`),
  KEY `contact_id` (`contact_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblconsents`
--

LOCK TABLES `dynamech_tblconsents` WRITE;
/*!40000 ALTER TABLE `dynamech_tblconsents` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblconsents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcontact_permissions`
--

DROP TABLE IF EXISTS `dynamech_tblcontact_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcontact_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcontact_permissions`
--

LOCK TABLES `dynamech_tblcontact_permissions` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcontact_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcontact_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcontacts`
--

DROP TABLE IF EXISTS `dynamech_tblcontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcontacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT 1,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `email_verification_key` varchar(32) DEFAULT NULL,
  `email_verification_sent_at` datetime DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `profile_image` varchar(191) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `invoice_emails` tinyint(1) NOT NULL DEFAULT 1,
  `estimate_emails` tinyint(1) NOT NULL DEFAULT 1,
  `credit_note_emails` tinyint(1) NOT NULL DEFAULT 1,
  `contract_emails` tinyint(1) NOT NULL DEFAULT 1,
  `task_emails` tinyint(1) NOT NULL DEFAULT 1,
  `project_emails` tinyint(1) NOT NULL DEFAULT 1,
  `ticket_emails` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`),
  KEY `email` (`email`),
  KEY `is_primary` (`is_primary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcontacts`
--

LOCK TABLES `dynamech_tblcontacts` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcontract_comments`
--

DROP TABLE IF EXISTS `dynamech_tblcontract_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcontract_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  `contract_id` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcontract_comments`
--

LOCK TABLES `dynamech_tblcontract_comments` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcontract_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcontract_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcontract_renewals`
--

DROP TABLE IF EXISTS `dynamech_tblcontract_renewals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcontract_renewals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractid` int(11) NOT NULL,
  `old_start_date` date NOT NULL,
  `new_start_date` date NOT NULL,
  `old_end_date` date DEFAULT NULL,
  `new_end_date` date DEFAULT NULL,
  `old_value` decimal(15,2) DEFAULT NULL,
  `new_value` decimal(15,2) DEFAULT NULL,
  `date_renewed` datetime NOT NULL,
  `renewed_by` varchar(100) NOT NULL,
  `renewed_by_staff_id` int(11) NOT NULL DEFAULT 0,
  `is_on_old_expiry_notified` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcontract_renewals`
--

LOCK TABLES `dynamech_tblcontract_renewals` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcontract_renewals` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcontract_renewals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcontracts`
--

DROP TABLE IF EXISTS `dynamech_tblcontracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcontracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `client` int(11) NOT NULL,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `contract_type` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `isexpirynotified` int(11) NOT NULL DEFAULT 0,
  `contract_value` decimal(15,2) DEFAULT NULL,
  `trash` tinyint(1) DEFAULT 0,
  `not_visible_to_client` tinyint(1) NOT NULL DEFAULT 0,
  `hash` varchar(32) DEFAULT NULL,
  `signed` tinyint(1) NOT NULL DEFAULT 0,
  `signature` varchar(40) DEFAULT NULL,
  `marked_as_signed` tinyint(1) NOT NULL DEFAULT 0,
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  `last_sent_at` datetime DEFAULT NULL,
  `contacts_sent_to` mediumtext DEFAULT NULL,
  `last_sign_reminder_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `contract_type` (`contract_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcontracts`
--

LOCK TABLES `dynamech_tblcontracts` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcontracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcontracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcontracts_types`
--

DROP TABLE IF EXISTS `dynamech_tblcontracts_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcontracts_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcontracts_types`
--

LOCK TABLES `dynamech_tblcontracts_types` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcontracts_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcontracts_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcountries`
--

DROP TABLE IF EXISTS `dynamech_tblcountries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcountries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `short_name` varchar(80) NOT NULL DEFAULT '',
  `long_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` varchar(6) DEFAULT NULL,
  `un_member` varchar(12) DEFAULT NULL,
  `calling_code` varchar(8) DEFAULT NULL,
  `cctld` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcountries`
--

LOCK TABLES `dynamech_tblcountries` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcountries` DISABLE KEYS */;
INSERT INTO `dynamech_tblcountries` VALUES (1,'AF','Afghanistan','Islamic Republic of Afghanistan','AFG','004','yes','93','.af'),(2,'AX','Aland Islands','&Aring;land Islands','ALA','248','no','358','.ax'),(3,'AL','Albania','Republic of Albania','ALB','008','yes','355','.al'),(4,'DZ','Algeria','People\'s Democratic Republic of Algeria','DZA','012','yes','213','.dz'),(5,'AS','American Samoa','American Samoa','ASM','016','no','1+684','.as'),(6,'AD','Andorra','Principality of Andorra','AND','020','yes','376','.ad'),(7,'AO','Angola','Republic of Angola','AGO','024','yes','244','.ao'),(8,'AI','Anguilla','Anguilla','AIA','660','no','1+264','.ai'),(9,'AQ','Antarctica','Antarctica','ATA','010','no','672','.aq'),(10,'AG','Antigua and Barbuda','Antigua and Barbuda','ATG','028','yes','1+268','.ag'),(11,'AR','Argentina','Argentine Republic','ARG','032','yes','54','.ar'),(12,'AM','Armenia','Republic of Armenia','ARM','051','yes','374','.am'),(13,'AW','Aruba','Aruba','ABW','533','no','297','.aw'),(14,'AU','Australia','Commonwealth of Australia','AUS','036','yes','61','.au'),(15,'AT','Austria','Republic of Austria','AUT','040','yes','43','.at'),(16,'AZ','Azerbaijan','Republic of Azerbaijan','AZE','031','yes','994','.az'),(17,'BS','Bahamas','Commonwealth of The Bahamas','BHS','044','yes','1+242','.bs'),(18,'BH','Bahrain','Kingdom of Bahrain','BHR','048','yes','973','.bh'),(19,'BD','Bangladesh','People\'s Republic of Bangladesh','BGD','050','yes','880','.bd'),(20,'BB','Barbados','Barbados','BRB','052','yes','1+246','.bb'),(21,'BY','Belarus','Republic of Belarus','BLR','112','yes','375','.by'),(22,'BE','Belgium','Kingdom of Belgium','BEL','056','yes','32','.be'),(23,'BZ','Belize','Belize','BLZ','084','yes','501','.bz'),(24,'BJ','Benin','Republic of Benin','BEN','204','yes','229','.bj'),(25,'BM','Bermuda','Bermuda Islands','BMU','060','no','1+441','.bm'),(26,'BT','Bhutan','Kingdom of Bhutan','BTN','064','yes','975','.bt'),(27,'BO','Bolivia','Plurinational State of Bolivia','BOL','068','yes','591','.bo'),(28,'BQ','Bonaire, Sint Eustatius and Saba','Bonaire, Sint Eustatius and Saba','BES','535','no','599','.bq'),(29,'BA','Bosnia and Herzegovina','Bosnia and Herzegovina','BIH','070','yes','387','.ba'),(30,'BW','Botswana','Republic of Botswana','BWA','072','yes','267','.bw'),(31,'BV','Bouvet Island','Bouvet Island','BVT','074','no','NONE','.bv'),(32,'BR','Brazil','Federative Republic of Brazil','BRA','076','yes','55','.br'),(33,'IO','British Indian Ocean Territory','British Indian Ocean Territory','IOT','086','no','246','.io'),(34,'BN','Brunei','Brunei Darussalam','BRN','096','yes','673','.bn'),(35,'BG','Bulgaria','Republic of Bulgaria','BGR','100','yes','359','.bg'),(36,'BF','Burkina Faso','Burkina Faso','BFA','854','yes','226','.bf'),(37,'BI','Burundi','Republic of Burundi','BDI','108','yes','257','.bi'),(38,'KH','Cambodia','Kingdom of Cambodia','KHM','116','yes','855','.kh'),(39,'CM','Cameroon','Republic of Cameroon','CMR','120','yes','237','.cm'),(40,'CA','Canada','Canada','CAN','124','yes','1','.ca'),(41,'CV','Cape Verde','Republic of Cape Verde','CPV','132','yes','238','.cv'),(42,'KY','Cayman Islands','The Cayman Islands','CYM','136','no','1+345','.ky'),(43,'CF','Central African Republic','Central African Republic','CAF','140','yes','236','.cf'),(44,'TD','Chad','Republic of Chad','TCD','148','yes','235','.td'),(45,'CL','Chile','Republic of Chile','CHL','152','yes','56','.cl'),(46,'CN','China','People\'s Republic of China','CHN','156','yes','86','.cn'),(47,'CX','Christmas Island','Christmas Island','CXR','162','no','61','.cx'),(48,'CC','Cocos (Keeling) Islands','Cocos (Keeling) Islands','CCK','166','no','61','.cc'),(49,'CO','Colombia','Republic of Colombia','COL','170','yes','57','.co'),(50,'KM','Comoros','Union of the Comoros','COM','174','yes','269','.km'),(51,'CG','Congo','Republic of the Congo','COG','178','yes','242','.cg'),(52,'CK','Cook Islands','Cook Islands','COK','184','some','682','.ck'),(53,'CR','Costa Rica','Republic of Costa Rica','CRI','188','yes','506','.cr'),(54,'CI','Cote d\'ivoire (Ivory Coast)','Republic of C&ocirc;te D\'Ivoire (Ivory Coast)','CIV','384','yes','225','.ci'),(55,'HR','Croatia','Republic of Croatia','HRV','191','yes','385','.hr'),(56,'CU','Cuba','Republic of Cuba','CUB','192','yes','53','.cu'),(57,'CW','Curacao','Cura&ccedil;ao','CUW','531','no','599','.cw'),(58,'CY','Cyprus','Republic of Cyprus','CYP','196','yes','357','.cy'),(59,'CZ','Czech Republic','Czech Republic','CZE','203','yes','420','.cz'),(60,'CD','Democratic Republic of the Congo','Democratic Republic of the Congo','COD','180','yes','243','.cd'),(61,'DK','Denmark','Kingdom of Denmark','DNK','208','yes','45','.dk'),(62,'DJ','Djibouti','Republic of Djibouti','DJI','262','yes','253','.dj'),(63,'DM','Dominica','Commonwealth of Dominica','DMA','212','yes','1+767','.dm'),(64,'DO','Dominican Republic','Dominican Republic','DOM','214','yes','1+809, 8','.do'),(65,'EC','Ecuador','Republic of Ecuador','ECU','218','yes','593','.ec'),(66,'EG','Egypt','Arab Republic of Egypt','EGY','818','yes','20','.eg'),(67,'SV','El Salvador','Republic of El Salvador','SLV','222','yes','503','.sv'),(68,'GQ','Equatorial Guinea','Republic of Equatorial Guinea','GNQ','226','yes','240','.gq'),(69,'ER','Eritrea','State of Eritrea','ERI','232','yes','291','.er'),(70,'EE','Estonia','Republic of Estonia','EST','233','yes','372','.ee'),(71,'ET','Ethiopia','Federal Democratic Republic of Ethiopia','ETH','231','yes','251','.et'),(72,'FK','Falkland Islands (Malvinas)','The Falkland Islands (Malvinas)','FLK','238','no','500','.fk'),(73,'FO','Faroe Islands','The Faroe Islands','FRO','234','no','298','.fo'),(74,'FJ','Fiji','Republic of Fiji','FJI','242','yes','679','.fj'),(75,'FI','Finland','Republic of Finland','FIN','246','yes','358','.fi'),(76,'FR','France','French Republic','FRA','250','yes','33','.fr'),(77,'GF','French Guiana','French Guiana','GUF','254','no','594','.gf'),(78,'PF','French Polynesia','French Polynesia','PYF','258','no','689','.pf'),(79,'TF','French Southern Territories','French Southern Territories','ATF','260','no',NULL,'.tf'),(80,'GA','Gabon','Gabonese Republic','GAB','266','yes','241','.ga'),(81,'GM','Gambia','Republic of The Gambia','GMB','270','yes','220','.gm'),(82,'GE','Georgia','Georgia','GEO','268','yes','995','.ge'),(83,'DE','Germany','Federal Republic of Germany','DEU','276','yes','49','.de'),(84,'GH','Ghana','Republic of Ghana','GHA','288','yes','233','.gh'),(85,'GI','Gibraltar','Gibraltar','GIB','292','no','350','.gi'),(86,'GR','Greece','Hellenic Republic','GRC','300','yes','30','.gr'),(87,'GL','Greenland','Greenland','GRL','304','no','299','.gl'),(88,'GD','Grenada','Grenada','GRD','308','yes','1+473','.gd'),(89,'GP','Guadaloupe','Guadeloupe','GLP','312','no','590','.gp'),(90,'GU','Guam','Guam','GUM','316','no','1+671','.gu'),(91,'GT','Guatemala','Republic of Guatemala','GTM','320','yes','502','.gt'),(92,'GG','Guernsey','Guernsey','GGY','831','no','44','.gg'),(93,'GN','Guinea','Republic of Guinea','GIN','324','yes','224','.gn'),(94,'GW','Guinea-Bissau','Republic of Guinea-Bissau','GNB','624','yes','245','.gw'),(95,'GY','Guyana','Co-operative Republic of Guyana','GUY','328','yes','592','.gy'),(96,'HT','Haiti','Republic of Haiti','HTI','332','yes','509','.ht'),(97,'HM','Heard Island and McDonald Islands','Heard Island and McDonald Islands','HMD','334','no','NONE','.hm'),(98,'HN','Honduras','Republic of Honduras','HND','340','yes','504','.hn'),(99,'HK','Hong Kong','Hong Kong','HKG','344','no','852','.hk'),(100,'HU','Hungary','Hungary','HUN','348','yes','36','.hu'),(101,'IS','Iceland','Republic of Iceland','ISL','352','yes','354','.is'),(102,'IN','India','Republic of India','IND','356','yes','91','.in'),(103,'ID','Indonesia','Republic of Indonesia','IDN','360','yes','62','.id'),(104,'IR','Iran','Islamic Republic of Iran','IRN','364','yes','98','.ir'),(105,'IQ','Iraq','Republic of Iraq','IRQ','368','yes','964','.iq'),(106,'IE','Ireland','Ireland','IRL','372','yes','353','.ie'),(107,'IM','Isle of Man','Isle of Man','IMN','833','no','44','.im'),(108,'IL','Israel','State of Israel','ISR','376','yes','972','.il'),(109,'IT','Italy','Italian Republic','ITA','380','yes','39','.jm'),(110,'JM','Jamaica','Jamaica','JAM','388','yes','1+876','.jm'),(111,'JP','Japan','Japan','JPN','392','yes','81','.jp'),(112,'JE','Jersey','The Bailiwick of Jersey','JEY','832','no','44','.je'),(113,'JO','Jordan','Hashemite Kingdom of Jordan','JOR','400','yes','962','.jo'),(114,'KZ','Kazakhstan','Republic of Kazakhstan','KAZ','398','yes','7','.kz'),(115,'KE','Kenya','Republic of Kenya','KEN','404','yes','254','.ke'),(116,'KI','Kiribati','Republic of Kiribati','KIR','296','yes','686','.ki'),(117,'XK','Kosovo','Republic of Kosovo','---','---','some','381',''),(118,'KW','Kuwait','State of Kuwait','KWT','414','yes','965','.kw'),(119,'KG','Kyrgyzstan','Kyrgyz Republic','KGZ','417','yes','996','.kg'),(120,'LA','Laos','Lao People\'s Democratic Republic','LAO','418','yes','856','.la'),(121,'LV','Latvia','Republic of Latvia','LVA','428','yes','371','.lv'),(122,'LB','Lebanon','Republic of Lebanon','LBN','422','yes','961','.lb'),(123,'LS','Lesotho','Kingdom of Lesotho','LSO','426','yes','266','.ls'),(124,'LR','Liberia','Republic of Liberia','LBR','430','yes','231','.lr'),(125,'LY','Libya','Libya','LBY','434','yes','218','.ly'),(126,'LI','Liechtenstein','Principality of Liechtenstein','LIE','438','yes','423','.li'),(127,'LT','Lithuania','Republic of Lithuania','LTU','440','yes','370','.lt'),(128,'LU','Luxembourg','Grand Duchy of Luxembourg','LUX','442','yes','352','.lu'),(129,'MO','Macao','The Macao Special Administrative Region','MAC','446','no','853','.mo'),(130,'MK','North Macedonia','Republic of North Macedonia','MKD','807','yes','389','.mk'),(131,'MG','Madagascar','Republic of Madagascar','MDG','450','yes','261','.mg'),(132,'MW','Malawi','Republic of Malawi','MWI','454','yes','265','.mw'),(133,'MY','Malaysia','Malaysia','MYS','458','yes','60','.my'),(134,'MV','Maldives','Republic of Maldives','MDV','462','yes','960','.mv'),(135,'ML','Mali','Republic of Mali','MLI','466','yes','223','.ml'),(136,'MT','Malta','Republic of Malta','MLT','470','yes','356','.mt'),(137,'MH','Marshall Islands','Republic of the Marshall Islands','MHL','584','yes','692','.mh'),(138,'MQ','Martinique','Martinique','MTQ','474','no','596','.mq'),(139,'MR','Mauritania','Islamic Republic of Mauritania','MRT','478','yes','222','.mr'),(140,'MU','Mauritius','Republic of Mauritius','MUS','480','yes','230','.mu'),(141,'YT','Mayotte','Mayotte','MYT','175','no','262','.yt'),(142,'MX','Mexico','United Mexican States','MEX','484','yes','52','.mx'),(143,'FM','Micronesia','Federated States of Micronesia','FSM','583','yes','691','.fm'),(144,'MD','Moldava','Republic of Moldova','MDA','498','yes','373','.md'),(145,'MC','Monaco','Principality of Monaco','MCO','492','yes','377','.mc'),(146,'MN','Mongolia','Mongolia','MNG','496','yes','976','.mn'),(147,'ME','Montenegro','Montenegro','MNE','499','yes','382','.me'),(148,'MS','Montserrat','Montserrat','MSR','500','no','1+664','.ms'),(149,'MA','Morocco','Kingdom of Morocco','MAR','504','yes','212','.ma'),(150,'MZ','Mozambique','Republic of Mozambique','MOZ','508','yes','258','.mz'),(151,'MM','Myanmar (Burma)','Republic of the Union of Myanmar','MMR','104','yes','95','.mm'),(152,'NA','Namibia','Republic of Namibia','NAM','516','yes','264','.na'),(153,'NR','Nauru','Republic of Nauru','NRU','520','yes','674','.nr'),(154,'NP','Nepal','Federal Democratic Republic of Nepal','NPL','524','yes','977','.np'),(155,'NL','Netherlands','Kingdom of the Netherlands','NLD','528','yes','31','.nl'),(156,'NC','New Caledonia','New Caledonia','NCL','540','no','687','.nc'),(157,'NZ','New Zealand','New Zealand','NZL','554','yes','64','.nz'),(158,'NI','Nicaragua','Republic of Nicaragua','NIC','558','yes','505','.ni'),(159,'NE','Niger','Republic of Niger','NER','562','yes','227','.ne'),(160,'NG','Nigeria','Federal Republic of Nigeria','NGA','566','yes','234','.ng'),(161,'NU','Niue','Niue','NIU','570','some','683','.nu'),(162,'NF','Norfolk Island','Norfolk Island','NFK','574','no','672','.nf'),(163,'KP','North Korea','Democratic People\'s Republic of Korea','PRK','408','yes','850','.kp'),(164,'MP','Northern Mariana Islands','Northern Mariana Islands','MNP','580','no','1+670','.mp'),(165,'NO','Norway','Kingdom of Norway','NOR','578','yes','47','.no'),(166,'OM','Oman','Sultanate of Oman','OMN','512','yes','968','.om'),(167,'PK','Pakistan','Islamic Republic of Pakistan','PAK','586','yes','92','.pk'),(168,'PW','Palau','Republic of Palau','PLW','585','yes','680','.pw'),(169,'PS','Palestine','State of Palestine (or Occupied Palestinian Territory)','PSE','275','some','970','.ps'),(170,'PA','Panama','Republic of Panama','PAN','591','yes','507','.pa'),(171,'PG','Papua New Guinea','Independent State of Papua New Guinea','PNG','598','yes','675','.pg'),(172,'PY','Paraguay','Republic of Paraguay','PRY','600','yes','595','.py'),(173,'PE','Peru','Republic of Peru','PER','604','yes','51','.pe'),(174,'PH','Philippines','Republic of the Philippines','PHL','608','yes','63','.ph'),(175,'PN','Pitcairn','Pitcairn','PCN','612','no','NONE','.pn'),(176,'PL','Poland','Republic of Poland','POL','616','yes','48','.pl'),(177,'PT','Portugal','Portuguese Republic','PRT','620','yes','351','.pt'),(178,'PR','Puerto Rico','Commonwealth of Puerto Rico','PRI','630','no','1+939','.pr'),(179,'QA','Qatar','State of Qatar','QAT','634','yes','974','.qa'),(180,'RE','Reunion','R&eacute;union','REU','638','no','262','.re'),(181,'RO','Romania','Romania','ROU','642','yes','40','.ro'),(182,'RU','Russia','Russian Federation','RUS','643','yes','7','.ru'),(183,'RW','Rwanda','Republic of Rwanda','RWA','646','yes','250','.rw'),(184,'BL','Saint Barthelemy','Saint Barth&eacute;lemy','BLM','652','no','590','.bl'),(185,'SH','Saint Helena','Saint Helena, Ascension and Tristan da Cunha','SHN','654','no','290','.sh'),(186,'KN','Saint Kitts and Nevis','Federation of Saint Christopher and Nevis','KNA','659','yes','1+869','.kn'),(187,'LC','Saint Lucia','Saint Lucia','LCA','662','yes','1+758','.lc'),(188,'MF','Saint Martin','Saint Martin','MAF','663','no','590','.mf'),(189,'PM','Saint Pierre and Miquelon','Saint Pierre and Miquelon','SPM','666','no','508','.pm'),(190,'VC','Saint Vincent and the Grenadines','Saint Vincent and the Grenadines','VCT','670','yes','1+784','.vc'),(191,'WS','Samoa','Independent State of Samoa','WSM','882','yes','685','.ws'),(192,'SM','San Marino','Republic of San Marino','SMR','674','yes','378','.sm'),(193,'ST','Sao Tome and Principe','Democratic Republic of S&atilde;o Tom&eacute; and Pr&iacute;ncipe','STP','678','yes','239','.st'),(194,'SA','Saudi Arabia','Kingdom of Saudi Arabia','SAU','682','yes','966','.sa'),(195,'SN','Senegal','Republic of Senegal','SEN','686','yes','221','.sn'),(196,'RS','Serbia','Republic of Serbia','SRB','688','yes','381','.rs'),(197,'SC','Seychelles','Republic of Seychelles','SYC','690','yes','248','.sc'),(198,'SL','Sierra Leone','Republic of Sierra Leone','SLE','694','yes','232','.sl'),(199,'SG','Singapore','Republic of Singapore','SGP','702','yes','65','.sg'),(200,'SX','Sint Maarten','Sint Maarten','SXM','534','no','1+721','.sx'),(201,'SK','Slovakia','Slovak Republic','SVK','703','yes','421','.sk'),(202,'SI','Slovenia','Republic of Slovenia','SVN','705','yes','386','.si'),(203,'SB','Solomon Islands','Solomon Islands','SLB','090','yes','677','.sb'),(204,'SO','Somalia','Somali Republic','SOM','706','yes','252','.so'),(205,'ZA','South Africa','Republic of South Africa','ZAF','710','yes','27','.za'),(206,'GS','South Georgia and the South Sandwich Islands','South Georgia and the South Sandwich Islands','SGS','239','no','500','.gs'),(207,'KR','South Korea','Republic of Korea','KOR','410','yes','82','.kr'),(208,'SS','South Sudan','Republic of South Sudan','SSD','728','yes','211','.ss'),(209,'ES','Spain','Kingdom of Spain','ESP','724','yes','34','.es'),(210,'LK','Sri Lanka','Democratic Socialist Republic of Sri Lanka','LKA','144','yes','94','.lk'),(211,'SD','Sudan','Republic of the Sudan','SDN','729','yes','249','.sd'),(212,'SR','Suriname','Republic of Suriname','SUR','740','yes','597','.sr'),(213,'SJ','Svalbard and Jan Mayen','Svalbard and Jan Mayen','SJM','744','no','47','.sj'),(214,'SZ','Swaziland','Kingdom of Swaziland','SWZ','748','yes','268','.sz'),(215,'SE','Sweden','Kingdom of Sweden','SWE','752','yes','46','.se'),(216,'CH','Switzerland','Swiss Confederation','CHE','756','yes','41','.ch'),(217,'SY','Syria','Syrian Arab Republic','SYR','760','yes','963','.sy'),(218,'TW','Taiwan','Republic of China (Taiwan)','TWN','158','former','886','.tw'),(219,'TJ','Tajikistan','Republic of Tajikistan','TJK','762','yes','992','.tj'),(220,'TZ','Tanzania','United Republic of Tanzania','TZA','834','yes','255','.tz'),(221,'TH','Thailand','Kingdom of Thailand','THA','764','yes','66','.th'),(222,'TL','Timor-Leste (East Timor)','Democratic Republic of Timor-Leste','TLS','626','yes','670','.tl'),(223,'TG','Togo','Togolese Republic','TGO','768','yes','228','.tg'),(224,'TK','Tokelau','Tokelau','TKL','772','no','690','.tk'),(225,'TO','Tonga','Kingdom of Tonga','TON','776','yes','676','.to'),(226,'TT','Trinidad and Tobago','Republic of Trinidad and Tobago','TTO','780','yes','1+868','.tt'),(227,'TN','Tunisia','Republic of Tunisia','TUN','788','yes','216','.tn'),(228,'TR','Turkey','Republic of Turkey','TUR','792','yes','90','.tr'),(229,'TM','Turkmenistan','Turkmenistan','TKM','795','yes','993','.tm'),(230,'TC','Turks and Caicos Islands','Turks and Caicos Islands','TCA','796','no','1+649','.tc'),(231,'TV','Tuvalu','Tuvalu','TUV','798','yes','688','.tv'),(232,'UG','Uganda','Republic of Uganda','UGA','800','yes','256','.ug'),(233,'UA','Ukraine','Ukraine','UKR','804','yes','380','.ua'),(234,'AE','United Arab Emirates','United Arab Emirates','ARE','784','yes','971','.ae'),(235,'GB','United Kingdom','United Kingdom of Great Britain and Nothern Ireland','GBR','826','yes','44','.uk'),(236,'US','United States','United States of America','USA','840','yes','1','.us'),(237,'UM','United States Minor Outlying Islands','United States Minor Outlying Islands','UMI','581','no','NONE','NONE'),(238,'UY','Uruguay','Eastern Republic of Uruguay','URY','858','yes','598','.uy'),(239,'UZ','Uzbekistan','Republic of Uzbekistan','UZB','860','yes','998','.uz'),(240,'VU','Vanuatu','Republic of Vanuatu','VUT','548','yes','678','.vu'),(241,'VA','Vatican City','State of the Vatican City','VAT','336','no','39','.va'),(242,'VE','Venezuela','Bolivarian Republic of Venezuela','VEN','862','yes','58','.ve'),(243,'VN','Vietnam','Socialist Republic of Vietnam','VNM','704','yes','84','.vn'),(244,'VG','Virgin Islands, British','British Virgin Islands','VGB','092','no','1+284','.vg'),(245,'VI','Virgin Islands, US','Virgin Islands of the United States','VIR','850','no','1+340','.vi'),(246,'WF','Wallis and Futuna','Wallis and Futuna','WLF','876','no','681','.wf'),(247,'EH','Western Sahara','Western Sahara','ESH','732','no','212','.eh'),(248,'YE','Yemen','Republic of Yemen','YEM','887','yes','967','.ye'),(249,'ZM','Zambia','Republic of Zambia','ZMB','894','yes','260','.zm'),(250,'ZW','Zimbabwe','Republic of Zimbabwe','ZWE','716','yes','263','.zw');
/*!40000 ALTER TABLE `dynamech_tblcountries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcreditnote_refunds`
--

DROP TABLE IF EXISTS `dynamech_tblcreditnote_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcreditnote_refunds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit_note_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `refunded_on` date NOT NULL,
  `payment_mode` varchar(40) NOT NULL,
  `note` mediumtext DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcreditnote_refunds`
--

LOCK TABLES `dynamech_tblcreditnote_refunds` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcreditnote_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcreditnote_refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcreditnotes`
--

DROP TABLE IF EXISTS `dynamech_tblcreditnotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcreditnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT 1,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `adminnote` mediumtext DEFAULT NULL,
  `terms` mediumtext DEFAULT NULL,
  `clientnote` mediumtext DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `discount_percent` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(15,2) DEFAULT 0.00,
  `discount_type` varchar(30) NOT NULL,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_credit_note` tinyint(1) NOT NULL DEFAULT 1,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `reference_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcreditnotes`
--

LOCK TABLES `dynamech_tblcreditnotes` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcreditnotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcreditnotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcredits`
--

DROP TABLE IF EXISTS `dynamech_tblcredits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcredits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `credit_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_applied` datetime NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcredits`
--

LOCK TABLES `dynamech_tblcredits` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcredits` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcredits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcurrencies`
--

DROP TABLE IF EXISTS `dynamech_tblcurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcurrencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `decimal_separator` varchar(5) DEFAULT NULL,
  `thousand_separator` varchar(5) DEFAULT NULL,
  `placement` varchar(10) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcurrencies`
--

LOCK TABLES `dynamech_tblcurrencies` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcurrencies` DISABLE KEYS */;
INSERT INTO `dynamech_tblcurrencies` VALUES (1,'$','USD','.',',','before',0),(3,'?','INR','.',',','before',1);
/*!40000 ALTER TABLE `dynamech_tblcurrencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcurrency_rate_logs`
--

DROP TABLE IF EXISTS `dynamech_tblcurrency_rate_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcurrency_rate_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_currency_id` int(11) DEFAULT NULL,
  `from_currency_name` varchar(100) DEFAULT NULL,
  `from_currency_rate` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `to_currency_id` int(11) DEFAULT NULL,
  `to_currency_name` varchar(100) DEFAULT NULL,
  `to_currency_rate` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcurrency_rate_logs`
--

LOCK TABLES `dynamech_tblcurrency_rate_logs` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcurrency_rate_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcurrency_rate_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcurrency_rates`
--

DROP TABLE IF EXISTS `dynamech_tblcurrency_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcurrency_rates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_currency_id` int(11) DEFAULT NULL,
  `from_currency_name` varchar(100) DEFAULT NULL,
  `from_currency_rate` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `to_currency_id` int(11) DEFAULT NULL,
  `to_currency_name` varchar(100) DEFAULT NULL,
  `to_currency_rate` decimal(15,6) NOT NULL DEFAULT 0.000000,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcurrency_rates`
--

LOCK TABLES `dynamech_tblcurrency_rates` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcurrency_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcurrency_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcustomer_admins`
--

DROP TABLE IF EXISTS `dynamech_tblcustomer_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcustomer_admins` (
  `staff_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_assigned` mediumtext NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `dynamech_staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcustomer_admins`
--

LOCK TABLES `dynamech_tblcustomer_admins` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcustomer_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcustomer_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcustomer_groups`
--

DROP TABLE IF EXISTS `dynamech_tblcustomer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcustomer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcustomer_groups`
--

LOCK TABLES `dynamech_tblcustomer_groups` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcustomer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcustomer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcustomers_groups`
--

DROP TABLE IF EXISTS `dynamech_tblcustomers_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcustomers_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `default_discount` decimal(5,2) DEFAULT NULL COMMENT 'Default discount to apply unless item overrides',
  `default_profit_margin` decimal(5,2) DEFAULT NULL COMMENT 'Used to auto-calculate selling price from cost',
  `override_allowed` tinyint(1) DEFAULT 1 COMMENT '1 = allow item-level override, 0 = enforce group defaults only',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcustomers_groups`
--

LOCK TABLES `dynamech_tblcustomers_groups` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcustomers_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcustomers_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcustomfields`
--

DROP TABLE IF EXISTS `dynamech_tblcustomfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcustomfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldto` varchar(30) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL,
  `options` longtext DEFAULT NULL,
  `display_inline` tinyint(1) NOT NULL DEFAULT 0,
  `field_order` int(11) DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 1,
  `show_on_pdf` int(11) NOT NULL DEFAULT 0,
  `show_on_ticket_form` tinyint(1) NOT NULL DEFAULT 0,
  `only_admin` tinyint(1) NOT NULL DEFAULT 0,
  `show_on_table` tinyint(1) NOT NULL DEFAULT 0,
  `show_on_client_portal` int(11) NOT NULL DEFAULT 0,
  `disalow_client_to_edit` int(11) NOT NULL DEFAULT 0,
  `bs_column` int(11) NOT NULL DEFAULT 12,
  `default_value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcustomfields`
--

LOCK TABLES `dynamech_tblcustomfields` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcustomfields` DISABLE KEYS */;
INSERT INTO `dynamech_tblcustomfields` VALUES (1,'tasks','Estimate hour','tasks_estimate_hour',0,'number','',0,0,1,0,0,0,0,0,0,12,NULL);
/*!40000 ALTER TABLE `dynamech_tblcustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblcustomfieldsvalues`
--

DROP TABLE IF EXISTS `dynamech_tblcustomfieldsvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblcustomfieldsvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relid` int(11) NOT NULL,
  `fieldid` int(11) NOT NULL,
  `fieldto` varchar(15) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`),
  KEY `fieldto` (`fieldto`),
  KEY `fieldid` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblcustomfieldsvalues`
--

LOCK TABLES `dynamech_tblcustomfieldsvalues` WRITE;
/*!40000 ALTER TABLE `dynamech_tblcustomfieldsvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblcustomfieldsvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblday_off`
--

DROP TABLE IF EXISTS `dynamech_tblday_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblday_off` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `off_reason` varchar(255) NOT NULL,
  `off_type` varchar(100) NOT NULL,
  `break_date` date NOT NULL,
  `timekeeping` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `add_from` int(11) NOT NULL,
  `repeat_by_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblday_off`
--

LOCK TABLES `dynamech_tblday_off` WRITE;
/*!40000 ALTER TABLE `dynamech_tblday_off` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblday_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tbldepartments`
--

DROP TABLE IF EXISTS `dynamech_tbldepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tbldepartments` (
  `departmentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `imap_username` varchar(191) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_from_header` tinyint(1) NOT NULL DEFAULT 0,
  `host` varchar(150) DEFAULT NULL,
  `password` longtext DEFAULT NULL,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(191) NOT NULL DEFAULT 'INBOX',
  `delete_after_import` int(11) NOT NULL DEFAULT 0,
  `calendar_id` longtext DEFAULT NULL,
  `hidefromclient` tinyint(1) NOT NULL DEFAULT 0,
  `manager_id` int(11) DEFAULT 0,
  `parent_id` int(11) DEFAULT 0,
  PRIMARY KEY (`departmentid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tbldepartments`
--

LOCK TABLES `dynamech_tbldepartments` WRITE;
/*!40000 ALTER TABLE `dynamech_tbldepartments` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tbldepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tbldismissed_announcements`
--

DROP TABLE IF EXISTS `dynamech_tbldismissed_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tbldismissed_announcements` (
  `dismissedannouncementid` int(11) NOT NULL AUTO_INCREMENT,
  `announcementid` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`dismissedannouncementid`),
  KEY `announcementid` (`announcementid`),
  KEY `dynamech_staff` (`staff`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tbldismissed_announcements`
--

LOCK TABLES `dynamech_tbldismissed_announcements` WRITE;
/*!40000 ALTER TABLE `dynamech_tbldismissed_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tbldismissed_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblemaillists`
--

DROP TABLE IF EXISTS `dynamech_tblemaillists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblemaillists` (
  `listid` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext NOT NULL,
  `creator` varchar(100) NOT NULL,
  `datecreated` datetime NOT NULL,
  PRIMARY KEY (`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblemaillists`
--

LOCK TABLES `dynamech_tblemaillists` WRITE;
/*!40000 ALTER TABLE `dynamech_tblemaillists` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblemaillists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblemailtemplates`
--

DROP TABLE IF EXISTS `dynamech_tblemailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblemailtemplates` (
  `emailtemplateid` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext NOT NULL,
  `slug` varchar(100) NOT NULL,
  `language` varchar(40) DEFAULT NULL,
  `name` longtext NOT NULL,
  `subject` longtext NOT NULL,
  `message` longtext NOT NULL,
  `fromname` longtext NOT NULL,
  `fromemail` varchar(100) DEFAULT NULL,
  `plaintext` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`emailtemplateid`)
) ENGINE=InnoDB AUTO_INCREMENT=3088 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblemailtemplates`
--

LOCK TABLES `dynamech_tblemailtemplates` WRITE;
/*!40000 ALTER TABLE `dynamech_tblemailtemplates` DISABLE KEYS */;
INSERT INTO `dynamech_tblemailtemplates` VALUES (1,'client','new-client-created','english','New Contact Added/Registered (Welcome Email)','Welcome aboard','Dear {contact_firstname} {contact_lastname}<br><br>Thank you for registering on the <strong>{companyname}</strong> CRM System.<br><br>We just wanted to say welcome.<br><br>Please contact us if you need any help.<br><br>Click here to view your profile: <a href=\"%7Bcrm_url%7D\">{crm_url}</a><br><br>Kind Regards, <br>{email_signature}<br><br>(This is an automated email, so please don\'t reply to this email address)','DOT One Business Solution','',0,1,0),(2,'invoice','invoice-send-to-client','english','Send Invoice to Customer','Invoice with number {invoice_number} created','<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">We have prepared the following invoice for you: <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Invoice status</strong>: {invoice_status}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(3,'ticket','new-ticket-opened-admin','english','New Ticket Opened (Opened by Staff, Sent to Customer)','New Support Ticket Opened','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">New support ticket has been opened.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department:</strong> {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a><br /><br />Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(4,'ticket','ticket-reply','english','Ticket Reply (Sent to Customer)','New Ticket Reply','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">You have a new ticket reply to ticket <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket Subject:</strong> {ticket_subject}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(5,'ticket','ticket-autoresponse','english','New Ticket Opened - Autoresponse','New Support Ticket Opened','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Thank you for contacting our support team. A support ticket has now been opened for your request. You will be notified when a response is made by email.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_public_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(6,'invoice','invoice-payment-recorded','english','Invoice Payment Recorded (Sent to Customer)','Invoice Payment Recorded','<span style=\"font-size: 12pt;\">Hello {contact_firstname}&nbsp;{contact_lastname}<br /><br /></span>Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br /><br />Amount:&nbsp;<strong>{payment_total}<br /></strong>Date:&nbsp;<strong>{payment_date}</strong><br />Invoice number:&nbsp;<span style=\"font-size: 12pt;\"><strong># {invoice_number}<br /><br /></strong></span>-------------------------------------------------<br /><br />You can always view the invoice for this payment at the following link:&nbsp;<a href=\"{invoice_link}\"><span style=\"font-size: 12pt;\">{invoice_number}</span></a><br /><br />We are looking forward working with you.<br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(7,'invoice','invoice-overdue-notice','english','Invoice Overdue Notice','Invoice Overdue Notice - {invoice_number}','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">This is an overdue notice for invoice <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\">This invoice was due: {invoice_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(8,'invoice','invoice-already-send','english','Invoice Already Sent to Customer','Invoice # {invoice_number} ','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">At your request, here is the invoice with number <strong># {invoice_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(9,'ticket','new-ticket-created-staff','english','New Ticket Created (Opened by Customer, Sent to Staff Members)','New Ticket Created','<p><span style=\"font-size: 12pt;\">A new support ticket has been opened.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}<br /></span><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\">#{ticket_id}</a></span><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(10,'estimate','estimate-send-to-client','english','Send Estimate to Customer','Estimate # {estimate_number} created','<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Please find the attached estimate <strong># {estimate_number}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Estimate status:</strong> {estimate_status}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">We look forward to your communication.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}<br /></span>','{companyname} | CRM','',0,1,0),(11,'ticket','ticket-reply-to-admin','english','Ticket Reply (Sent to Staff)','New Support Ticket Reply','<span style=\"font-size: 12pt;\">A new support ticket reply from {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(12,'estimate','estimate-already-send','english','Estimate Already Sent to Customer','Estimate # {estimate_number} ','<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /> <br /><span style=\"font-size: 12pt;\">Thank you for your estimate request.</span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(13,'contract','contract-expiration','english','Contract Expiration Reminder (Sent to Customer Contacts)','Contract Expiration Reminder','<span style=\"font-size: 12pt;\">Dear {client_company}</span><br /><br /><span style=\"font-size: 12pt;\">This is a reminder that the following contract will expire soon:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {contract_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Description:</strong> {contract_description}</span><br /><span style=\"font-size: 12pt;\"><strong>Date Start:</strong> {contract_datestart}</span><br /><span style=\"font-size: 12pt;\"><strong>Date End:</strong> {contract_dateend}</span><br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(14,'tasks','task-assigned','english','New Task Assigned (Sent to Staff)','New Task Assigned to You - {task_name}','<span style=\"font-size: 12pt;\">Dear {staff_firstname}</span><br /><br /><span style=\"font-size: 12pt;\">You have been assigned to a new task:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}<br /></span><strong>Start Date:</strong> {task_startdate}<br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {task_priority}<br /><br /></span><span style=\"font-size: 12pt;\"><span>You can view the task on the following link</span>: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(15,'tasks','task-added-as-follower','english','Staff Member Added as Follower on Task (Sent to Staff)','You are added as follower on task - {task_name}','<span style=\"font-size: 12pt;\">Hi {staff_firstname}<br /></span><br /><span style=\"font-size: 12pt;\">You have been added as follower on the following task:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Start date:</strong> {task_startdate}</span><br /><br /><span>You can view the task on the following link</span><span>: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(16,'tasks','task-commented','english','New Comment on Task (Sent to Staff)','New Comment on Task - {task_name}','Dear {staff_firstname}<br /><br />A comment has been made on the following task:<br /><br /><strong>Name:</strong> {task_name}<br /><strong>Comment:</strong> {task_comment}<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(17,'tasks','task-added-attachment','english','New Attachment(s) on Task (Sent to Staff)','New Attachment on Task - {task_name}','Hi {staff_firstname}<br /><br /><strong>{task_user_take_action}</strong> added an attachment on the following task:<br /><br /><strong>Name:</strong> {task_name}<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(18,'estimate','estimate-declined-to-staff','english','Estimate Declined (Sent to Staff)','Customer Declined Estimate','<span style=\"font-size: 12pt;\">Hi</span><br /> <br /><span style=\"font-size: 12pt;\">Customer ({client_company}) declined estimate with number <strong># {estimate_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(19,'estimate','estimate-accepted-to-staff','english','Estimate Accepted (Sent to Staff)','Customer Accepted Estimate','<span style=\"font-size: 12pt;\">Hi</span><br /> <br /><span style=\"font-size: 12pt;\">Customer ({client_company}) accepted estimate with number <strong># {estimate_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(20,'proposals','proposal-client-accepted','english','Customer Action - Accepted (Sent to Staff)','Customer Accepted Proposal','<div>Hi<br /> <br />Client <strong>{proposal_proposal_to}</strong> accepted the following proposal:<br /> <br /><strong>Number:</strong> {proposal_number}<br /><strong>Subject</strong>: {proposal_subject}<br /><strong>Total</strong>: {proposal_total}<br /> <br />View the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /> <br />Kind Regards,<br />{email_signature}</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>\r\n<div>&nbsp;</div>','{companyname} | CRM','',0,1,0),(21,'proposals','proposal-send-to-customer','english','Send Proposal to Customer','Proposal With Number {proposal_number} Created','Dear {proposal_proposal_to}<br /><br />Please find our attached proposal.<br /><br />This proposal is valid until: {proposal_open_till}<br />You can view the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /><br />Please don\'t hesitate to comment online if you have any questions.<br /><br />We look forward to your communication.<br /><br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(22,'proposals','proposal-client-declined','english','Customer Action - Declined (Sent to Staff)','Client Declined Proposal','Hi<br /> <br />Customer <strong>{proposal_proposal_to}</strong> declined the proposal <strong>{proposal_subject}</strong><br /> <br />View the proposal on the following link <a href=\"{proposal_link}\">{proposal_number}</a>&nbsp;or from the admin area.<br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(23,'proposals','proposal-client-thank-you','english','Thank You Email (Sent to Customer After Accept)','Thank for you accepting proposal','Dear {proposal_proposal_to}<br /> <br />Thank for for accepting the proposal.<br /> <br />We look forward to doing business with you.<br /> <br />We will contact you as soon as possible<br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(24,'proposals','proposal-comment-to-client','english','New Comment Â (Sent to Customer/Lead)','New Proposal Comment','Dear {proposal_proposal_to}<br /> <br />A new comment has been made on the following proposal: <strong>{proposal_number}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(25,'proposals','proposal-comment-to-admin','english','New Comment (Sent to Staff) ','New Proposal Comment','Hi<br /> <br />A new comment has been made to the proposal <strong>{proposal_subject}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{proposal_link}\">{proposal_number}</a>&nbsp;or from the admin area.<br /> <br />{email_signature}','{companyname} | CRM','',0,1,0),(26,'estimate','estimate-thank-you-to-customer','english','Thank You Email (Sent to Customer After Accept)','Thank for you accepting estimate','<span style=\"font-size: 12pt;\">Dear {contact_firstname} {contact_lastname}</span><br /> <br /><span style=\"font-size: 12pt;\">Thank for for accepting the estimate.</span><br /> <br /><span style=\"font-size: 12pt;\">We look forward to doing business with you.</span><br /> <br /><span style=\"font-size: 12pt;\">We will contact you as soon as possible.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(27,'tasks','task-deadline-notification','english','Task Deadline Reminder - Sent to Assigned Members','Task Deadline Reminder','Hi {staff_firstname}&nbsp;{staff_lastname}<br /><br />This is an automated email from {companyname}.<br /><br />The task <strong>{task_name}</strong> deadline is on <strong>{task_duedate}</strong>. <br />This task is still not finished.<br /><br />You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a><br /><br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(28,'contract','send-contract','english','Send Contract to Customer','Contract - {contract_subject}','<p><span style=\"font-size: 12pt;\">Hi&nbsp;{contact_firstname}&nbsp;{contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Please find the <a href=\"{contract_link}\">{contract_subject}</a> attached.<br /><br />Description: {contract_description}<br /><br /></span><span style=\"font-size: 12pt;\">Looking forward to hear from you.</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(29,'invoice','invoice-payment-recorded-to-staff','english','Invoice Payment Recorded (Sent to Staff)','New Invoice Payment','<span style=\"font-size: 12pt;\">Hi</span><br /><br /><span style=\"font-size: 12pt;\">Customer recorded payment for invoice <strong># {invoice_number}</strong></span><br /> <br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(30,'ticket','auto-close-ticket','english','Auto Close Ticket','Ticket Auto Closed','<p><span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">Ticket {ticket_subject} has been auto close due to inactivity.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket #</strong>: <a href=\"{ticket_public_url}\">{ticket_id}</a></span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority:</strong> {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(31,'project','new-project-discussion-created-to-staff','english','New Project Discussion (Sent to Project Members)','New Project Discussion Created - {project_name}','<p>Hi {staff_firstname}<br /><br />New project discussion created from <strong>{discussion_creator}</strong><br /><br /><strong>Subject:</strong> {discussion_subject}<br /><strong>Description:</strong> {discussion_description}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(32,'project','new-project-discussion-created-to-customer','english','New Project Discussion (Sent to Customer Contacts)','New Project Discussion Created - {project_name}','<p>Hello {contact_firstname} {contact_lastname}<br /><br />New project discussion created from <strong>{discussion_creator}</strong><br /><br /><strong>Subject:</strong> {discussion_subject}<br /><strong>Description:</strong> {discussion_description}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(33,'project','new-project-file-uploaded-to-customer','english','New Project File(s) Uploaded (Sent to Customer Contacts)','New Project File(s) Uploaded - {project_name}','<p>Hello {contact_firstname} {contact_lastname}<br /><br />New project file is uploaded on <strong>{project_name}</strong> from <strong>{file_creator}</strong><br /><br />You can view the project on the following link: <a href=\"{project_link}\">{project_name}</a><br /><br />To view the file in our CRM you can click on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(34,'project','new-project-file-uploaded-to-staff','english','New Project File(s) Uploaded (Sent to Project Members)','New Project File(s) Uploaded - {project_name}','<p>Hello&nbsp;{staff_firstname}</p>\r\n<p>New project&nbsp;file is uploaded on&nbsp;<strong>{project_name}</strong> from&nbsp;<strong>{file_creator}</strong></p>\r\n<p>You can view the project on the following link: <a href=\"{project_link}\">{project_name}<br /></a><br />To view&nbsp;the file you can click on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a></p>\r\n<p>Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(35,'project','new-project-discussion-comment-to-customer','english','New Discussion Comment  (Sent to Customer Contacts)','New Discussion Comment','<p><span style=\"font-size: 12pt;\">Hello {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">New discussion comment has been made on <strong>{discussion_subject}</strong> from <strong>{comment_creator}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Discussion subject:</strong> {discussion_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Comment</strong>: {discussion_comment}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(36,'project','new-project-discussion-comment-to-staff','english','New Discussion Comment (Sent to Project Members)','New Discussion Comment','<p>Hi {staff_firstname}<br /><br />New discussion comment has been made on <strong>{discussion_subject}</strong> from <strong>{comment_creator}</strong><br /><br /><strong>Discussion subject:</strong> {discussion_subject}<br /><strong>Comment:</strong> {discussion_comment}<br /><br />You can view the discussion on the following link: <a href=\"{discussion_link}\">{discussion_subject}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(37,'project','staff-added-as-project-member','english','Staff Added as Project Member','New project assigned to you','<p>Hi {staff_firstname}<br /><br />New project has been assigned to you.<br /><br />You can view the project on the following link <a href=\"{project_link}\">{project_name}</a><br /><br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(38,'estimate','estimate-expiry-reminder','english','Estimate Expiration Reminder','Estimate Expiration Reminder','<p><span style=\"font-size: 12pt;\">Hello {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\">The estimate with <strong># {estimate_number}</strong> will expire on <strong>{estimate_expirydate}</strong></span><br /><br /><span style=\"font-size: 12pt;\">You can view the estimate on the following link: <a href=\"{estimate_link}\">{estimate_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(39,'proposals','proposal-expiry-reminder','english','Proposal Expiration Reminder','Proposal Expiration Reminder','<p>Hello {proposal_proposal_to}<br /><br />The proposal {proposal_number}&nbsp;will expire on <strong>{proposal_open_till}</strong><br /><br />You can view the proposal on the following link: <a href=\"{proposal_link}\">{proposal_number}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(40,'staff','new-staff-created','english','New Staff Created (Welcome Email)','You are added as staff member','Hi {staff_firstname}<br /><br />You are added as member on our CRM.<br /><br />Please use the following logic credentials:<br /><br /><strong>Email:</strong> {staff_email}<br /><strong>Password:</strong> {password}<br /><br />Click <a href=\"{admin_url}\">here </a>to login in the dashboard.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(41,'client','contact-forgot-password','english','Forgot Password','Create New Password','<h2>Create a new password</h2>\r\nForgot your password?<br> To create a new password, just follow this link:<br> <br><a href=\"%7Breset_password_url%7D\">Reset Password</a><br> <br> You received this email, because it was requested by a {companyname}&#160;user. This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same. <br><br> {email_signature}','DOT One Business Solution','',0,1,0),(42,'client','contact-password-reseted','english','Password Reset - Confirmation','Your password has been changed','<strong><span style=\"font-size: 14pt;\">You have changed your password.</span><br /></strong><br /> Please, keep it in your records so you don\'t forget it.<br /> <br /> Your email address for login is: {contact_email}<br /><br />If this wasnt you, please contact us.<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(43,'client','contact-set-password','english','Set New Password','Set new password on {companyname} ','<h2><span style=\"font-size:14pt;\">Setup your new password on {companyname}</span></h2>\r\nPlease use the following link to set up your new password:<br><br><a href=\"%7Bset_password_url%7D\">Set new password</a><br><br>Keep it in your records so you don\'t forget it.<br><br>Please set your new password in <strong>48 hours</strong>. After that, you won\'t be able to set your password because this link will expire.<br><br>You can login at: <a href=\"%7Bcrm_url%7D\">{crm_url}</a><br>Your email address for login: {contact_email}<br><br>{email_signature}','DOT One Business Solution','',0,1,0),(44,'staff','staff-forgot-password','english','Forgot Password','Create New Password','<h2><span style=\"font-size: 14pt;\">Create a new password</span></h2>\r\nForgot your password?<br /> To create a new password, just follow this link:<br /> <br /><a href=\"{reset_password_url}\">Reset Password</a><br /> <br /> You received this email, because it was requested by a <strong>{companyname}</strong>&nbsp;user. This is part of the procedure to create a new password on the system. If you DID NOT request a new password then please ignore this email and your password will remain the same. <br /><br /> {email_signature}','{companyname} | CRM','',0,1,0),(45,'staff','staff-password-reseted','english','Password Reset - Confirmation','Your password has been changed','<span style=\"font-size: 14pt;\"><strong>You have changed your password.<br /></strong></span><br /> Please, keep it in your records so you don\'t forget it.<br /> <br /> Your email address for login is: {staff_email}<br /><br /> If this wasnt you, please contact us.<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(46,'project','assigned-to-project','english','New Project Created (Sent to Customer Contacts)','New Project Created','<p>Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}</p>\r\n<p>New project is assigned to your company.<br /><br /><strong>Project Name:</strong>&nbsp;{project_name}<br /><strong>Project Start Date:</strong>&nbsp;{project_start_date}</p>\r\n<p>You can view the project on the following link:&nbsp;<a href=\"{project_link}\">{project_name}</a></p>\r\n<p>We are looking forward hearing from you.<br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(47,'tasks','task-added-attachment-to-contacts','english','New Attachment(s) on Task (Sent to Customer Contacts)','New Attachment on Task - {task_name}','<span>Hi {contact_firstname} {contact_lastname}</span><br /><br /><strong>{task_user_take_action}</strong><span> added an attachment on the following task:</span><br /><br /><strong>Name:</strong><span> {task_name}</span><br /><br /><span>You can view the task on the following link: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span>Kind Regards,</span><br /><span>{email_signature}</span>','{companyname} | CRM','',0,1,0),(48,'tasks','task-commented-to-contacts','english','New Comment on Task (Sent to Customer Contacts)','New Comment on Task - {task_name}','<span>Dear {contact_firstname} {contact_lastname}</span><br /><br /><span>A comment has been made on the following task:</span><br /><br /><strong>Name:</strong><span> {task_name}</span><br /><strong>Comment:</strong><span> {task_comment}</span><br /><br /><span>You can view the task on the following link: </span><a href=\"{task_link}\">{task_name}</a><br /><br /><span>Kind Regards,</span><br /><span>{email_signature}</span>','{companyname} | CRM','',0,1,0),(49,'leads','new-lead-assigned','english','New Lead Assigned to Staff Member','New lead assigned to you','<p>Hello {lead_assigned}<br /><br />New lead is assigned to you.<br /><br /><strong>Lead Name:</strong>&nbsp;{lead_name}<br /><strong>Lead Email:</strong>&nbsp;{lead_email}<br /><br />You can view the lead on the following link: <a href=\"{lead_link}\">{lead_name}</a><br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(50,'client','client-statement','english','Statement - Account Summary','Account Statement from {statement_from} to {statement_to}','Dear {contact_firstname} {contact_lastname}, <br /><br />Its been a great experience working with you.<br /><br />Attached with this email is a list of all transactions for the period between {statement_from} to {statement_to}<br /><br />For your information your account balance due is total:&nbsp;{statement_balance_due}<br /><br />Please contact us if you need more information.<br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(51,'ticket','ticket-assigned-to-admin','english','New Ticket Assigned (Sent to Staff)','New support ticket has been assigned to you','<p><span style=\"font-size: 12pt;\">Hi</span></p>\r\n<p><span style=\"font-size: 12pt;\">A new support ticket&nbsp;has been assigned to you.</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject</strong>: {ticket_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Department</strong>: {ticket_department}</span><br /><span style=\"font-size: 12pt;\"><strong>Priority</strong>: {ticket_priority}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Ticket message:</strong></span><br /><span style=\"font-size: 12pt;\">{ticket_message}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the ticket on the following link: <a href=\"{ticket_url}\">#{ticket_id}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM','',0,1,0),(52,'client','new-client-registered-to-admin','english','New Customer Registration (Sent to admins)','New Customer Registration','Hello.<br /><br />New customer registration on your customer portal:<br /><br /><strong>Firstname:</strong>&nbsp;{contact_firstname}<br /><strong>Lastname:</strong>&nbsp;{contact_lastname}<br /><strong>Company:</strong>&nbsp;{client_company}<br /><strong>Email:</strong>&nbsp;{contact_email}<br /><br />Best Regards','{companyname} | CRM','',0,1,0),(53,'leads','new-web-to-lead-form-submitted','english','Web to lead form submitted - Sent to lead','{lead_name} - We Received Your Request','Hello {lead_name}.<br /><br /><strong>Your request has been received.</strong><br /><br />This email is to let you know that we received your request and we will get back to you as soon as possible with more information.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,0,0),(54,'staff','two-factor-authentication','english','Two Factor Authentication','Confirm Your Login','<p>Hi {staff_firstname}</p>\r\n<p style=\"text-align: left;\">You received this email because you have enabled two factor authentication in your account.<br />Use the following code to confirm your login:</p>\r\n<p style=\"text-align: left;\"><span style=\"font-size: 18pt;\"><strong>{two_factor_auth_code}<br /><br /></strong><span style=\"font-size: 12pt;\">{email_signature}</span><strong><br /><br /><br /><br /></strong></span></p>','{companyname} | CRM','',0,1,0),(55,'project','project-finished-to-customer','english','Project Marked as Finished (Sent to Customer Contacts)','Project Marked as Finished','<p>Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}</p>\r\n<p>You are receiving this email because project&nbsp;<strong>{project_name}</strong> has been marked as finished. This project is assigned under your company and we just wanted to keep you up to date.<br /><br />You can view the project on the following link:&nbsp;<a href=\"{project_link}\">{project_name}</a></p>\r\n<p>If you have any questions don\'t hesitate to contact us.<br /><br />Kind Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(56,'credit_note','credit-note-send-to-client','english','Send Credit Note To Email','Credit Note With Number #{credit_note_number} Created','Dear&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />We have attached the credit note with number <strong>#{credit_note_number} </strong>for your reference.<br /><br /><strong>Date:</strong>&nbsp;{credit_note_date}<br /><strong>Total Amount:</strong>&nbsp;{credit_note_total}<br /><br /><span style=\"font-size: 12pt;\">Please contact us for more information.</span><br /> <br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(57,'tasks','task-status-change-to-staff','english','Task Status Changed (Sent to Staff)','Task Status Changed','<span style=\"font-size: 12pt;\">Hi {staff_firstname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>{task_user_take_action}</strong> marked task as <strong>{task_status}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(58,'tasks','task-status-change-to-contacts','english','Task Status Changed (Sent to Customer Contacts)','Task Status Changed','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}</span><br /><br /><span style=\"font-size: 12pt;\"><strong>{task_user_take_action}</strong> marked task as <strong>{task_status}</strong></span><br /><br /><span style=\"font-size: 12pt;\"><strong>Name:</strong> {task_name}</span><br /><span style=\"font-size: 12pt;\"><strong>Due date:</strong> {task_duedate}</span><br /><br /><span style=\"font-size: 12pt;\">You can view the task on the following link: <a href=\"{task_link}\">{task_name}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(59,'staff','reminder-email-staff','english','Staff Reminder Email','You Have a New Reminder!','<p>Hello&nbsp;{staff_firstname}<br /><br /><strong>You have a new reminder&nbsp;linked to&nbsp;{staff_reminder_relation_name}!<br /><br />Reminder description:</strong><br />{staff_reminder_description}<br /><br />Click <a href=\"{staff_reminder_relation_link}\">here</a> to view&nbsp;<a href=\"{staff_reminder_relation_link}\">{staff_reminder_relation_name}</a><br /><br />Best Regards<br /><br /></p>','{companyname} | CRM','',0,1,0),(60,'contract','contract-comment-to-client','english','New Comment Â (Sent to Customer Contacts)','New Contract Comment','Dear {contact_firstname} {contact_lastname}<br /> <br />A new comment has been made on the following contract: <strong>{contract_subject}</strong><br /> <br />You can view and reply to the comment on the following link: <a href=\"{contract_link}\">{contract_subject}</a><br /> <br />Kind Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(61,'contract','contract-comment-to-admin','english','New Comment (Sent to Staff) ','New Contract Comment','Hi {staff_firstname}<br /><br />A new comment has been made to the contract&nbsp;<strong>{contract_subject}</strong><br /><br />You can view and reply to the comment on the following link: <a href=\"{contract_link}\">{contract_subject}</a>&nbsp;or from the admin area.<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(62,'subscriptions','send-subscription','english','Send Subscription to Customer','Subscription Created','Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />We have prepared the subscription&nbsp;<strong>{subscription_name}</strong> for your company.<br /><br />Click <a href=\"{subscription_link}\">here</a> to review the subscription and subscribe.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(63,'subscriptions','subscription-payment-failed','english','Subscription Payment Failed','Your most recent invoice payment failed','Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br br=\"\" />Unfortunately, your most recent invoice payment for&nbsp;<strong>{subscription_name}</strong> was declined.<br /><br />This could be due to a change in your card number, your card expiring,<br />cancellation of your credit card, or the card issuer not recognizing the<br />payment and therefore taking action to prevent it.<br /><br />Please update your payment information as soon as possible by logging in here:<br /><a href=\"{crm_url}/login\">{crm_url}/login</a><br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(64,'subscriptions','subscription-canceled','english','Subscription Canceled (Sent to customer primary contact)','Your subscription has been canceled','Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />Your subscription&nbsp;<strong>{subscription_name} </strong>has been canceled, if you have any questions don\'t hesitate to contact us.<br /><br />It was a pleasure doing business with you.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(65,'subscriptions','subscription-payment-succeeded','english','Subscription Payment Succeeded (Sent to customer primary contact)','Subscription  Payment Receipt - {subscription_name}','Hello&nbsp;{contact_firstname}&nbsp;{contact_lastname}<br /><br />This email is to let you know that we received your payment for subscription&nbsp;<strong>{subscription_name}&nbsp;</strong>of&nbsp;<strong><span>{payment_total}<br /><br /></span></strong>The invoice associated with it is now with status&nbsp;<strong>{invoice_status}<br /></strong><br />Thank you for your confidence.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,1,0),(66,'contract','contract-expiration-to-staff','english','Contract Expiration Reminder (Sent to Staff)','Contract Expiration Reminder','Hi {staff_firstname}<br /><br /><span style=\"font-size: 12pt;\">This is a reminder that the following contract will expire soon:</span><br /><br /><span style=\"font-size: 12pt;\"><strong>Subject:</strong> {contract_subject}</span><br /><span style=\"font-size: 12pt;\"><strong>Description:</strong> {contract_description}</span><br /><span style=\"font-size: 12pt;\"><strong>Date Start:</strong> {contract_datestart}</span><br /><span style=\"font-size: 12pt;\"><strong>Date End:</strong> {contract_dateend}</span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(67,'gdpr','gdpr-removal-request','english','Removal Request From Contact (Sent to administrators)','Data Removal Request Received','Hello&nbsp;{staff_firstname}&nbsp;{staff_lastname}<br /><br />Data removal has been requested by&nbsp;{contact_firstname} {contact_lastname}<br /><br />You can review this request and take proper actions directly from the admin area.','{companyname} | CRM','',0,1,0),(68,'gdpr','gdpr-removal-request-lead','english','Removal Request From Lead (Sent to administrators)','Data Removal Request Received','Hello&nbsp;{staff_firstname}&nbsp;{staff_lastname}<br /><br />Data removal has been requested by {lead_name}<br /><br />You can review this request and take proper actions directly from the admin area.<br /><br />To view the lead inside the admin area click here:&nbsp;<a href=\"{lead_link}\">{lead_link}</a>','{companyname} | CRM','',0,1,0),(69,'client','client-registration-confirmed','english','Customer Registration Confirmed','Your registration is confirmed','<p>Dear {contact_firstname} {contact_lastname}<br /><br />We just wanted to let you know that your registration at&nbsp;{companyname} is successfully confirmed and your account is now active.<br /><br />You can login at&nbsp;<a href=\"{crm_url}\">{crm_url}</a> with the email and password you provided during registration.<br /><br />Please contact us if you need any help.<br /><br />Kind Regards, <br />{email_signature}</p>\r\n<p><br />(This is an automated email, so please don\'t reply to this email address)</p>','{companyname} | CRM','',0,1,0),(70,'contract','contract-signed-to-staff','english','Contract Signed (Sent to Staff)','Customer Signed a Contract','Hi {staff_firstname}<br /><br />A contract with subject&nbsp;<strong>{contract_subject} </strong>has been successfully signed by the customer.<br /><br />You can view the contract at the following link: <a href=\"{contract_link}\">{contract_subject}</a>&nbsp;or from the admin area.<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(71,'subscriptions','customer-subscribed-to-staff','english','Customer Subscribed to a Subscription (Sent to administrators and subscription creator)','Customer Subscribed to a Subscription','The customer <strong>{client_company}</strong> subscribed to a subscription with name&nbsp;<strong>{subscription_name}</strong><br /><br /><strong>ID</strong>:&nbsp;{subscription_id}<br /><strong>Subscription name</strong>:&nbsp;{subscription_name}<br /><strong>Subscription description</strong>:&nbsp;{subscription_description}<br /><br />You can view the subscription by clicking <a href=\"{subscription_link}\">here</a><br />\r\n<div style=\"text-align: center;\"><span style=\"font-size: 10pt;\">&nbsp;</span></div>\r\nBest Regards,<br />{email_signature}<br /><br /><span style=\"font-size: 10pt;\"><span style=\"color: #999999;\">You are receiving this email because you are either administrator or you are creator of the subscription.</span></span>','{companyname} | CRM','',0,1,0),(72,'client','contact-verification-email','english','Email Verification (Sent to Contact After Registration)','Verify Email Address','<p>Hello&#160;{contact_firstname}<br><br>Please click the button below to verify your email address.<br><br><a href=\"{email_verification_url}\">Verify Email Address</a><br><br>If you did not create an account, no further action is required</p>\r\n<p><br>{email_signature}</p>','{companyname}','',0,1,0),(73,'client','new-customer-profile-file-uploaded-to-staff','english','New Customer Profile File(s) Uploaded (Sent to Staff)','Customer Uploaded New File(s) in Profile','Hi!<br /><br />New file(s) is uploaded into the customer ({client_company}) profile by&nbsp;{contact_firstname}<br /><br />You can check the uploaded files into the admin area by clicking <a href=\"{customer_profile_files_admin_link}\">here</a> or at the following link:&nbsp;{customer_profile_files_admin_link}<br /><br />{email_signature}','{companyname} | CRM','',0,1,0),(74,'staff','event-notification-to-staff','english','Event Notification (Calendar)','Upcoming Event - {event_title}','Hi {staff_firstname}! <br /><br />This is a reminder for event <a href=\\\"{event_link}\\\">{event_title}</a> scheduled at {event_start_date}. <br /><br />Regards.','','',0,1,0),(75,'subscriptions','subscription-payment-requires-action','english','Credit Card Authorization Required - SCA','Important: Confirm your subscription {subscription_name} payment','<p>Hello {contact_firstname}</p>\r\n<p><strong>Your bank sometimes requires an additional step to make sure an online transaction was authorized.</strong><br /><br />Because of European regulation to protect consumers, many online payments now require two-factor authentication. Your bank ultimately decides when authentication is required to confirm a payment, but you may notice this step when you start paying for a service or when the cost changes.<br /><br />In order to pay the subscription <strong>{subscription_name}</strong>, you will need to&nbsp;confirm your payment by clicking on the follow link: <strong><a href=\"{subscription_authorize_payment_link}\">{subscription_authorize_payment_link}</a></strong><br /><br />To view the subscription, please click at the following link: <a href=\"{subscription_link}\"><span>{subscription_link}</span></a><br />or you can login in our dedicated area here: <a href=\"{crm_url}/login\">{crm_url}/login</a> in case you want to update your credit card or view the subscriptions you are subscribed.<br /><br />Best Regards,<br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(76,'invoice','invoice-due-notice','english','Invoice Due Notice','Your {invoice_number} will be due soon','<span style=\"font-size: 12pt;\">Hi {contact_firstname} {contact_lastname}<br /><br /></span>You invoice <span style=\"font-size: 12pt;\"><strong># {invoice_number} </strong>will be due on <strong>{invoice_duedate}</strong></span><br /><br /><span style=\"font-size: 12pt;\">You can view the invoice on the following link: <a href=\"{invoice_link}\">{invoice_number}</a></span><br /><br /><span style=\"font-size: 12pt;\">Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span>','{companyname} | CRM','',0,1,0),(77,'estimate_request','estimate-request-submitted-to-staff','english','Estimate Request Submitted (Sent to Staff)','New Estimate Request Submitted','<span> Hello,&nbsp;</span><br /><br />{estimate_request_email} submitted an estimate request via the {estimate_request_form_name} form.<br /><br />You can view the request at the following link: <a href=\"{estimate_request_link}\">{estimate_request_link}</a><br /><br />==<br /><br />{estimate_request_submitted_data}<br /><br />Kind Regards,<br /><span>{email_signature}</span>','{companyname} | CRM','',0,1,0),(78,'estimate_request','estimate-request-assigned','english','Estimate Request Assigned (Sent to Staff)','New Estimate Request Assigned','<span> Hello {estimate_request_assigned},&nbsp;</span><br /><br />Estimate request #{estimate_request_id} has been assigned to you.<br /><br />You can view the request at the following link: <a href=\"{estimate_request_link}\">{estimate_request_link}</a><br /><br />Kind Regards,<br /><span>{email_signature}</span>','{companyname} | CRM','',0,1,0),(79,'estimate_request','estimate-request-received-to-user','english','Estimate Request Received (Sent to User)','Estimate Request Received','Hello,<br /><br /><strong>Your request has been received.</strong><br /><br />This email is to let you know that we received your request and we will get back to you as soon as possible with more information.<br /><br />Best Regards,<br />{email_signature}','{companyname} | CRM','',0,0,0),(80,'notifications','non-billed-tasks-reminder','english','Non-billed tasks reminder (sent to selected staff members)','Action required: Completed tasks are not billed','Hello {staff_firstname}<br><br>The following tasks are marked as complete but not yet billed:<br><br>{unbilled_tasks_list}<br><br>Kind Regards,<br><br>{email_signature}','{companyname} | CRM','',0,1,0),(81,'invoice','invoices-batch-payments','english','Invoices Payments Recorded in Batch (Sent to Customer)','We have received your payments','Hello {contact_firstname} {contact_lastname}<br><br>Thank you for the payments. Please find the payments details below:<br><br>{batch_payments_list}<br><br>We are looking forward working with you.<br><br>Kind Regards,<br><br>{email_signature}','{companyname} | CRM','',0,1,0),(82,'contract','contract-sign-reminder','english','Contract Sign Reminder (Sent to Customer)','Contract Sign Reminder','<p>Hello {contact_firstname} {contact_lastname}<br /><br />This is a reminder to review and sign the contract:<a href=\"{contract_link}\">{contract_subject}</a></p><p>You can view and sign by visiting: <a href=\"{contract_link}\">{contract_subject}</a></p><p><br />We are looking forward working with you.<br /><br />Kind Regards,<br /><br />{email_signature}</p>','{companyname} | CRM','',0,1,0),(83,'timesheets_attendance_mgt','attendance_notice','english','Attendance notice','Timesheets - Attendance notice','{staff_name} {type_check} at {date_time}','{companyname} | CRM',NULL,0,1,0),(84,'timesheets_attendance_mgt','send_request_approval','english','Send request approval','Timesheets - Send request approval to approver','Hi {approver}! <br>-{staff_name} has created an apply for leave and requires your approval. Please go to this link for details and approval: {link}','{companyname} | CRM',NULL,0,1,0),(85,'timesheets_attendance_mgt','remind_user_check_in','english','Remind user check in','Timesheets - Remind user check in','Remind you to check in today to record the start time of the shift {date_time}','{companyname} | CRM',NULL,0,1,0),(86,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','english','New application (Send to notification recipient)','Timesheets - New application - Send to notification recipient','{staff_name} created a new application {link} at {date_time}','{companyname} | CRM',NULL,0,1,0),(87,'client','affiliate_management_payout_updated','english','Affiliate Payout Request Update','An update regarding your payout request','Dear {contact_firstname},<br/><br/>\n    We hope this message finds you well.\n    <br/>\n    We wanted to inform you about the latest status of your payout request, identified by reference number <b>#{payout_id}</b>. \n    <br/><br/>\n    Amount: {payout_amount}<br/>\n    Status: {payout_status}<br/>\n    Note: {payout_note_for_affiliate}<br/>\n    Created: {payout_created_at}<br/>\n    <br/><br/>\n    If you have any questions or need further clarification, please do not hesitate to reach out. We are here to assist you in any way possible.<br/><br/>\n    \n    Best regards,<br/>\n    {email_signature}','{companyname} | CRM',NULL,0,1,0),(88,'client','affiliate_management_signup_through_affiliate_link','english','Successful Signup through Affiliate Link','Congratulations on a successful signup!','Dear {contact_firstname},<br/><br/>\n    We are delighted to inform you that someone has successfully signed up using your affiliate link.\n    <br/><br/>\n    Company/Contact: {referral_name}<br/>\n    Date: {referral_created_at}<br/>\n    <br/><br/>\n    While this signup may not have resulted in an immediate transaction, your efforts are highly valued. We appreciate your contribution to our community and anticipate further success in the future.\n    <br/><br/>\n    If you have any questions or need additional information, please feel free to reach out.\n    <br/><br/>\n    Best regards,<br/>\n    {email_signature}','{companyname} | CRM',NULL,0,1,0),(89,'client','affiliate_management_successful_referral_commission','english','Successful Referral Commission Notification','A referral commission received!','Dear {contact_firstname},<br/><br/>\n    We are thrilled to inform you that your referral has resulted in a successful transaction, earning you a commission.\n    <br/><br/>\n    Company/Contact: {referral_name}<br/>\n    Transaction Amount: {payment_amount}<br/>\n    Commission Earned: {commission_amount}<br/>\n    New Balance: {affiliate_balance}<br/>\n    Date: {commission_created_at}<br/>\n    <br/><br/>\n    We appreciate your efforts and look forward to more successful collaborations. Should you have any questions or require further information, feel free to reach out.\n    <br/><br/>\n    Best regards,<br/>\n    {email_signature}','{companyname} | CRM',NULL,0,1,0),(90,'staff','affiliate_management_new_payout_request_for_admin','english','Affiliate Payout Request','You have new affiliate payout request','Dear Admin,<br/><br/>\n    I wanted to inform you about a new payout request, identified by reference number <b>#{payout_id}</b>. \n    <br/><br/>\n    Affiliate: {affiliate_name}<br/>\n    Amount: {payout_amount}<br/>\n    Status: {payout_status}<br/>\n    Note: {payout_note_for_admin}<br/>\n    Created: {payout_created_at}<br/>\n    <br/><br/>    \n    Best regards,<br/>\n    {email_signature}','{companyname} | CRM',NULL,0,1,0),(91,'staff','affiliate_management_payout_updated_for_admin','english','Affiliate Payout Request Updated','You marked payout: #{payout_id} as {payout_status}','Dear Admin,<br/><br/>\n    I wanted to update you about the recent update to a payout request, identified by reference number <b>#{payout_id}</b>. \n    <br/><br/>\n    Affiliate: {affiliate_name}<br/>\n    Amount: {payout_amount}<br/>\n    Status: {payout_status}<br/><br/>\n    Admin Note: {payout_note_for_admin}<br/>\n    Note: {payout_note_for_affiliate}<br/>\n    Created: {payout_created_at}<br/>\n    <br/><br/>    \n    Best regards,<br/>\n    {email_signature}','{companyname} | CRM',NULL,0,1,0),(92,'staff','affiliate_management_new_affiliate_signup_for_admin','english','New Affiliate Signup','A new affiliate signup','Dear Admin,<br/><br/>\n    I wanted to inform you about a new affiliate signup, identified by reference number <b>#{affiliate_slug}</b>. \n    <br/><br/>\n    Affiliate: {affiliate_name}<br/>\n    Status: {affiliate_status}<br/>\n    Created: {affiliate_created_at}<br/>\n    <br/><br/>    \n    Best regards,<br/>\n    {email_signature}','{companyname} | CRM',NULL,0,1,0),(93,'client','affiliate_management_referral_commission_reversal','english','Referral Commission Reversal Notification','A referral commission was reversed!','Dear {contact_firstname},<br/><br/>\n    We regret to inform you that the commission previously awarded for your referral has been reversed due to reversal or removal of the rewarded payment.\n    <br/><br/>\n    Company/Contact: {referral_name}<br/>\n    Comission ID: {commission_id}<br/>\n    Amount Reversed: {commission_amount}<br/>\n    New Balance: {affiliate_balance}<br/>\n    Date of commission: {commission_created_at}<br/>\n    <br/><br/>\n    We appreciate your efforts and look forward to more successful collaborations. Should you have any questions or require further information, feel free to reach out.\n    <br/><br/>\n    Best regards,<br/>\n    {email_signature}','{companyname} | CRM',NULL,0,1,0),(94,'inventory_warning','inventory-warning-to-staff','english','Inventory warning (Sent to staff)','Inventory warning','Hi {staff_name}! <br /><br />This is a inventory warning<br />{<span 12pt=\"\">notification_content</span>}. <br /><br />Regards.','{companyname} | CRM',NULL,0,1,0),(103,'purchase_order','purchase-order-to-contact','english','Purchase Order (Sent to contact)','Purchase Order','<span style=\\\"font-size: 12pt;\\\"> Hello !. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> We would like to share with you a link of Purchase Order information with the number {po_number} </span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Please click on the link to view information: {public_link}\r\n  </span><br /><br />','{companyname} | CRM',NULL,0,1,0),(104,'purchase_order','purchase-request-to-contact','english','Purchase Request (Sent to contact)','Purchase Request','<span style=\\\"font-size: 12pt;\\\"> Hello !. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> We would like to share with you a link of Purchase Request information with the number {pr_number} </span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Please click on the link to view information: {public_link}<br/ >{additional_content}\r\n  </span><br /><br />','{companyname} | CRM',NULL,0,1,0),(105,'purchase_order','purchase-quotation-to-contact','english','Purchase Quotation (Sent to contact)','Purchase Quotation','<span style=\\\"font-size: 12pt;\\\"> Hello !. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> We would like to share with you a link of Purchase Quotation information with the number {pq_number} </span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Please click on the link to view information: {quotation_link}<br/ >{additional_content}\r\n  </span><br /><br />','{companyname} | CRM',NULL,0,1,0),(106,'purchase_order','debit-note-to-contact','english','Debit Note (Sent to contact)','Debit Note','<span style=\\\"font-size: 12pt;\\\"> Hello !. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> We would like to share with you a link of Debit Note information with the number {dn_number} </span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />{additional_content}\r\n  </span><br /><br />','{companyname} | CRM',NULL,0,1,0),(107,'purchase_order','purchase-statement-to-contact','english','Purchase Statement (Sent to contact)','Purchase Statement','<span style=\\\"font-size: 12pt;\\\"> Dear {contact_firstname} {contact_lastname} !. </span><br /><br /><span style=\\\"font-size: 12pt;\\\">Its been a great experience working with you. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Attached with this email is a list of all transactions for the period between {statement_from} to {statement_to}<br/ ><br/ >For your information your account balance due is total: {statement_balance_due}<br /><br/ > Please contact us if you need more information.<br/ > <br />{additional_content}\r\n  </span><br /><br />','{companyname} | CRM',NULL,0,1,0),(108,'purchase_order','vendor-registration-confirmed','english','Vendor Registration Confirmed','Your registration is confirmed','<p>Dear {contact_firstname} {contact_lastname}<br /><br />We just wanted to let you know that your registration at&nbsp;{companyname} is successfully confirmed and your account is now active.<br /><br />You can login at&nbsp;<a href=\"{vendor_portal_url}\">{vendor_portal_url}</a> with the email and password you provided during registration.<br /><br />Please contact us if you need any help.<br /><br />Kind Regards, <br />{email_signature}</p>\r\n <p><br />(This is an automated email, so please dont reply to this email address)</p>','{companyname} | CRM',NULL,0,1,0),(109,'purchase_order','purchase-contract-to-contact','english','Purchase Contract (Sent to contact)','Purchase Contract','<span style=\\\"font-size: 12pt;\\\"> Hello !. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> We would like to share with you a link of Purchase Contract information with the number {contract_number} </span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Please click on the link to view information: {contract_link}\r\n  </span><br /><br />','{companyname} | CRM',NULL,0,1,0),(110,'purchase_order','new-contact-created','english','New Contact Added/Registered (Welcome Email)','New Contact Added/Registered (Welcome Email)','<span style=\\\"font-size: 12pt;\\\"> Dear {contact_firstname} {contact_lastname}! </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> Welcome to our system </span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Click here to login: {vendor_portal_link}</span><br /></span><br />','{companyname} | CRM',NULL,0,1,0),(111,'purchase_order','purchase-request-approval','english','Request approval','Request approval','<span style=\\\"font-size: 12pt;\\\"> Hello {staff_name}! </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> You receive an approval request: {link} from {from_staff_name}</span>','{companyname} | CRM',NULL,0,1,0),(112,'purchase_order','purchase-send-approved','english','Email send approved','Email send approved','<span style=\\\"font-size: 12pt;\\\"> Hello {staff_name}! </span><br /><br /><span style=\\\"font-size: 12pt;\\\">{type} has been approved by {by_staff_name} </span><br /><span style=\\\"font-size: 12pt;\\\"><br />Click here to view detail: {link} </span><br /></span><br />','{companyname} | CRM',NULL,0,1,0),(113,'purchase_order','purchase-send-rejected','english','Email send rejected','Email send rejected','<span style=\\\"font-size: 12pt;\\\"> Hello {staff_name}! </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> {type} has been declined by {by_staff_name} </span><br /><span style=\\\"font-size: 12pt;\\\"><br />Click here to view detail: {link}  </span><br /></span><br />','{companyname} | CRM',NULL,0,1,0),(114,'change_candidate_status','change-candidate-status-to-candidate','english','Change Candidate Status (Sent to Candidate)','Changed Candidate Status','<br />Hi {candidate_name} {last_name}<br /><br />I would like to inform you that your candidate profile status changed to {candidate_status}<br /><br />I will contact you again as soon as I have any news.<br /><br />Kind Regards,<br />{email_signature}.','{companyname} | CRM',NULL,0,1,0),(115,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','english','Change Candidate Job Applied Status (Sent to Candidate)','Changed Candidate Job Applied Status','<br />Hi {candidate_name} {last_name}<br /><br />I would like to inform you that your Job Applied status changed to {job_applied_status}<br /><br />I will contact you again as soon as I have any news.<br /><br />Kind Regards,<br />{email_signature}.','{companyname} | CRM',NULL,0,1,0),(116,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','english','Change Candidate Interview Schedule Status (Sent to Candidate)','Changed Candidate Interview Schedule Status','<br />Hi {candidate_name} {last_name}<br /><br />I would like to inform you that your Interview Schedule status changed to {interview_schedule_status}<br /><br />I will contact you again as soon as I have any news.<br /><br />Kind Regards,<br />{email_signature}.','{companyname} | CRM',NULL,0,1,0),(117,'new_candidate_have_applied','new-candidate-have-applied','english','New candidate have applied (Sent to Responsible)','New candidate have applied','<p><span style=\"font-size: 12pt;\">New Candidate have been applied.</span><br /><br /><span style=\"font-size: 12pt;\">You can view the Candidate profile on the following link: <a href=\"{candidate_link}\">#{candidate_link}</a><br /><br />Kind Regards,</span><br /><span style=\"font-size: 12pt;\">{email_signature}</span></p>','{companyname} | CRM',NULL,0,1,0),(118,'staff','flexibackup-new-backup-to-staff','english','Flexi Backup Notification','New Backup Available  - {backup_name}','Hi there! <br /><br /> Please find attached a copy of your {backup_type} created on {backup_date}.  <br /><br /> Regards.','{companyname} | CRM',NULL,0,1,0),(119,'client','new-client-created','bulgarian','New Contact Added/Registered (Welcome Email) [bulgarian]','Welcome aboard','','DOT One Business Solution','',0,1,0),(120,'invoice','invoice-send-to-client','bulgarian','Send Invoice to Customer [bulgarian]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(121,'ticket','new-ticket-opened-admin','bulgarian','New Ticket Opened (Opened by Staff, Sent to Customer) [bulgarian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(122,'ticket','ticket-reply','bulgarian','Ticket Reply (Sent to Customer) [bulgarian]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(123,'ticket','ticket-autoresponse','bulgarian','New Ticket Opened - Autoresponse [bulgarian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(124,'invoice','invoice-payment-recorded','bulgarian','Invoice Payment Recorded (Sent to Customer) [bulgarian]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(125,'invoice','invoice-overdue-notice','bulgarian','Invoice Overdue Notice [bulgarian]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(126,'invoice','invoice-already-send','bulgarian','Invoice Already Sent to Customer [bulgarian]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(127,'ticket','new-ticket-created-staff','bulgarian','New Ticket Created (Opened by Customer, Sent to Staff Members) [bulgarian]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(128,'estimate','estimate-send-to-client','bulgarian','Send Estimate to Customer [bulgarian]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(129,'ticket','ticket-reply-to-admin','bulgarian','Ticket Reply (Sent to Staff) [bulgarian]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(130,'estimate','estimate-already-send','bulgarian','Estimate Already Sent to Customer [bulgarian]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(131,'contract','contract-expiration','bulgarian','Contract Expiration Reminder (Sent to Customer Contacts) [bulgarian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(132,'tasks','task-assigned','bulgarian','New Task Assigned (Sent to Staff) [bulgarian]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(133,'tasks','task-added-as-follower','bulgarian','Staff Member Added as Follower on Task (Sent to Staff) [bulgarian]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(134,'tasks','task-commented','bulgarian','New Comment on Task (Sent to Staff) [bulgarian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(135,'tasks','task-added-attachment','bulgarian','New Attachment(s) on Task (Sent to Staff) [bulgarian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(136,'estimate','estimate-declined-to-staff','bulgarian','Estimate Declined (Sent to Staff) [bulgarian]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(137,'estimate','estimate-accepted-to-staff','bulgarian','Estimate Accepted (Sent to Staff) [bulgarian]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(138,'proposals','proposal-client-accepted','bulgarian','Customer Action - Accepted (Sent to Staff) [bulgarian]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(139,'proposals','proposal-send-to-customer','bulgarian','Send Proposal to Customer [bulgarian]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(140,'proposals','proposal-client-declined','bulgarian','Customer Action - Declined (Sent to Staff) [bulgarian]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(141,'proposals','proposal-client-thank-you','bulgarian','Thank You Email (Sent to Customer After Accept) [bulgarian]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(142,'proposals','proposal-comment-to-client','bulgarian','New Comment Â (Sent to Customer/Lead) [bulgarian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(143,'proposals','proposal-comment-to-admin','bulgarian','New Comment (Sent to Staff)  [bulgarian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(144,'estimate','estimate-thank-you-to-customer','bulgarian','Thank You Email (Sent to Customer After Accept) [bulgarian]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(145,'tasks','task-deadline-notification','bulgarian','Task Deadline Reminder - Sent to Assigned Members [bulgarian]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(146,'contract','send-contract','bulgarian','Send Contract to Customer [bulgarian]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(147,'invoice','invoice-payment-recorded-to-staff','bulgarian','Invoice Payment Recorded (Sent to Staff) [bulgarian]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(148,'ticket','auto-close-ticket','bulgarian','Auto Close Ticket [bulgarian]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(149,'project','new-project-discussion-created-to-staff','bulgarian','New Project Discussion (Sent to Project Members) [bulgarian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(150,'project','new-project-discussion-created-to-customer','bulgarian','New Project Discussion (Sent to Customer Contacts) [bulgarian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(151,'project','new-project-file-uploaded-to-customer','bulgarian','New Project File(s) Uploaded (Sent to Customer Contacts) [bulgarian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(152,'project','new-project-file-uploaded-to-staff','bulgarian','New Project File(s) Uploaded (Sent to Project Members) [bulgarian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(153,'project','new-project-discussion-comment-to-customer','bulgarian','New Discussion Comment  (Sent to Customer Contacts) [bulgarian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(154,'project','new-project-discussion-comment-to-staff','bulgarian','New Discussion Comment (Sent to Project Members) [bulgarian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(155,'project','staff-added-as-project-member','bulgarian','Staff Added as Project Member [bulgarian]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(156,'estimate','estimate-expiry-reminder','bulgarian','Estimate Expiration Reminder [bulgarian]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(157,'proposals','proposal-expiry-reminder','bulgarian','Proposal Expiration Reminder [bulgarian]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(158,'staff','new-staff-created','bulgarian','New Staff Created (Welcome Email) [bulgarian]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(159,'client','contact-forgot-password','bulgarian','Forgot Password [bulgarian]','Create New Password','','DOT One Business Solution','',0,1,0),(160,'client','contact-password-reseted','bulgarian','Password Reset - Confirmation [bulgarian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(161,'client','contact-set-password','bulgarian','Set New Password [bulgarian]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(162,'staff','staff-forgot-password','bulgarian','Forgot Password [bulgarian]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(163,'staff','staff-password-reseted','bulgarian','Password Reset - Confirmation [bulgarian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(164,'project','assigned-to-project','bulgarian','New Project Created (Sent to Customer Contacts) [bulgarian]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(165,'tasks','task-added-attachment-to-contacts','bulgarian','New Attachment(s) on Task (Sent to Customer Contacts) [bulgarian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(166,'tasks','task-commented-to-contacts','bulgarian','New Comment on Task (Sent to Customer Contacts) [bulgarian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(167,'leads','new-lead-assigned','bulgarian','New Lead Assigned to Staff Member [bulgarian]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(168,'client','client-statement','bulgarian','Statement - Account Summary [bulgarian]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(169,'ticket','ticket-assigned-to-admin','bulgarian','New Ticket Assigned (Sent to Staff) [bulgarian]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(170,'client','new-client-registered-to-admin','bulgarian','New Customer Registration (Sent to admins) [bulgarian]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(171,'leads','new-web-to-lead-form-submitted','bulgarian','Web to lead form submitted - Sent to lead [bulgarian]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(172,'staff','two-factor-authentication','bulgarian','Two Factor Authentication [bulgarian]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(173,'project','project-finished-to-customer','bulgarian','Project Marked as Finished (Sent to Customer Contacts) [bulgarian]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(174,'credit_note','credit-note-send-to-client','bulgarian','Send Credit Note To Email [bulgarian]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(175,'tasks','task-status-change-to-staff','bulgarian','Task Status Changed (Sent to Staff) [bulgarian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(176,'tasks','task-status-change-to-contacts','bulgarian','Task Status Changed (Sent to Customer Contacts) [bulgarian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(177,'staff','reminder-email-staff','bulgarian','Staff Reminder Email [bulgarian]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(178,'contract','contract-comment-to-client','bulgarian','New Comment Â (Sent to Customer Contacts) [bulgarian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(179,'contract','contract-comment-to-admin','bulgarian','New Comment (Sent to Staff)  [bulgarian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(180,'subscriptions','send-subscription','bulgarian','Send Subscription to Customer [bulgarian]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(181,'subscriptions','subscription-payment-failed','bulgarian','Subscription Payment Failed [bulgarian]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(182,'subscriptions','subscription-canceled','bulgarian','Subscription Canceled (Sent to customer primary contact) [bulgarian]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(183,'subscriptions','subscription-payment-succeeded','bulgarian','Subscription Payment Succeeded (Sent to customer primary contact) [bulgarian]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(184,'contract','contract-expiration-to-staff','bulgarian','Contract Expiration Reminder (Sent to Staff) [bulgarian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(185,'gdpr','gdpr-removal-request','bulgarian','Removal Request From Contact (Sent to administrators) [bulgarian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(186,'gdpr','gdpr-removal-request-lead','bulgarian','Removal Request From Lead (Sent to administrators) [bulgarian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(187,'client','client-registration-confirmed','bulgarian','Customer Registration Confirmed [bulgarian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(188,'contract','contract-signed-to-staff','bulgarian','Contract Signed (Sent to Staff) [bulgarian]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(189,'subscriptions','customer-subscribed-to-staff','bulgarian','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [bulgarian]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(190,'client','contact-verification-email','bulgarian','Email Verification (Sent to Contact After Registration) [bulgarian]','Verify Email Address','','{companyname}','',0,1,0),(191,'client','new-customer-profile-file-uploaded-to-staff','bulgarian','New Customer Profile File(s) Uploaded (Sent to Staff) [bulgarian]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(192,'staff','event-notification-to-staff','bulgarian','Event Notification (Calendar) [bulgarian]','Upcoming Event - {event_title}','','',NULL,0,1,0),(193,'subscriptions','subscription-payment-requires-action','bulgarian','Credit Card Authorization Required - SCA [bulgarian]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(194,'invoice','invoice-due-notice','bulgarian','Invoice Due Notice [bulgarian]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(195,'estimate_request','estimate-request-submitted-to-staff','bulgarian','Estimate Request Submitted (Sent to Staff) [bulgarian]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(196,'estimate_request','estimate-request-assigned','bulgarian','Estimate Request Assigned (Sent to Staff) [bulgarian]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(197,'estimate_request','estimate-request-received-to-user','bulgarian','Estimate Request Received (Sent to User) [bulgarian]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(198,'notifications','non-billed-tasks-reminder','bulgarian','Non-billed tasks reminder (sent to selected staff members) [bulgarian]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(199,'invoice','invoices-batch-payments','bulgarian','Invoices Payments Recorded in Batch (Sent to Customer) [bulgarian]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(200,'contract','contract-sign-reminder','bulgarian','Contract Sign Reminder (Sent to Customer) [bulgarian]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(201,'timesheets_attendance_mgt','attendance_notice','bulgarian','Attendance notice [bulgarian]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(202,'timesheets_attendance_mgt','send_request_approval','bulgarian','Send request approval [bulgarian]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(203,'timesheets_attendance_mgt','remind_user_check_in','bulgarian','Remind user check in [bulgarian]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(204,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','bulgarian','New application (Send to notification recipient) [bulgarian]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(205,'client','affiliate_management_payout_updated','bulgarian','Affiliate Payout Request Update [bulgarian]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(206,'client','affiliate_management_signup_through_affiliate_link','bulgarian','Successful Signup through Affiliate Link [bulgarian]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(207,'client','affiliate_management_successful_referral_commission','bulgarian','Successful Referral Commission Notification [bulgarian]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(208,'staff','affiliate_management_new_payout_request_for_admin','bulgarian','Affiliate Payout Request [bulgarian]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(209,'staff','affiliate_management_payout_updated_for_admin','bulgarian','Affiliate Payout Request Updated [bulgarian]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(210,'staff','affiliate_management_new_affiliate_signup_for_admin','bulgarian','New Affiliate Signup [bulgarian]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(211,'client','affiliate_management_referral_commission_reversal','bulgarian','Referral Commission Reversal Notification [bulgarian]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(212,'inventory_warning','inventory-warning-to-staff','bulgarian','Inventory warning (Sent to staff) [bulgarian]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(221,'purchase_order','purchase-order-to-contact','bulgarian','Purchase Order (Sent to contact) [bulgarian]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(222,'purchase_order','purchase-request-to-contact','bulgarian','Purchase Request (Sent to contact) [bulgarian]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(223,'purchase_order','purchase-quotation-to-contact','bulgarian','Purchase Quotation (Sent to contact) [bulgarian]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(224,'purchase_order','debit-note-to-contact','bulgarian','Debit Note (Sent to contact) [bulgarian]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(225,'purchase_order','purchase-statement-to-contact','bulgarian','Purchase Statement (Sent to contact) [bulgarian]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(226,'purchase_order','vendor-registration-confirmed','bulgarian','Vendor Registration Confirmed [bulgarian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(227,'purchase_order','purchase-contract-to-contact','bulgarian','Purchase Contract (Sent to contact) [bulgarian]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(228,'purchase_order','new-contact-created','bulgarian','New Contact Added/Registered (Welcome Email) [bulgarian]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(229,'purchase_order','purchase-request-approval','bulgarian','Request approval [bulgarian]','Request approval','','{companyname} | CRM',NULL,0,1,0),(230,'purchase_order','purchase-send-approved','bulgarian','Email send approved [bulgarian]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(231,'purchase_order','purchase-send-rejected','bulgarian','Email send rejected [bulgarian]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(232,'change_candidate_status','change-candidate-status-to-candidate','bulgarian','Change Candidate Status (Sent to Candidate) [bulgarian]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(233,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','bulgarian','Change Candidate Job Applied Status (Sent to Candidate) [bulgarian]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(234,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','bulgarian','Change Candidate Interview Schedule Status (Sent to Candidate) [bulgarian]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(235,'new_candidate_have_applied','new-candidate-have-applied','bulgarian','New candidate have applied (Sent to Responsible) [bulgarian]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(236,'staff','flexibackup-new-backup-to-staff','bulgarian','Flexi Backup Notification [bulgarian]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(237,'client','new-client-created','catalan','New Contact Added/Registered (Welcome Email) [catalan]','Welcome aboard','','DOT One Business Solution','',0,1,0),(238,'invoice','invoice-send-to-client','catalan','Send Invoice to Customer [catalan]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(239,'ticket','new-ticket-opened-admin','catalan','New Ticket Opened (Opened by Staff, Sent to Customer) [catalan]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(240,'ticket','ticket-reply','catalan','Ticket Reply (Sent to Customer) [catalan]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(241,'ticket','ticket-autoresponse','catalan','New Ticket Opened - Autoresponse [catalan]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(242,'invoice','invoice-payment-recorded','catalan','Invoice Payment Recorded (Sent to Customer) [catalan]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(243,'invoice','invoice-overdue-notice','catalan','Invoice Overdue Notice [catalan]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(244,'invoice','invoice-already-send','catalan','Invoice Already Sent to Customer [catalan]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(245,'ticket','new-ticket-created-staff','catalan','New Ticket Created (Opened by Customer, Sent to Staff Members) [catalan]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(246,'estimate','estimate-send-to-client','catalan','Send Estimate to Customer [catalan]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(247,'ticket','ticket-reply-to-admin','catalan','Ticket Reply (Sent to Staff) [catalan]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(248,'estimate','estimate-already-send','catalan','Estimate Already Sent to Customer [catalan]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(249,'contract','contract-expiration','catalan','Contract Expiration Reminder (Sent to Customer Contacts) [catalan]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(250,'tasks','task-assigned','catalan','New Task Assigned (Sent to Staff) [catalan]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(251,'tasks','task-added-as-follower','catalan','Staff Member Added as Follower on Task (Sent to Staff) [catalan]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(252,'tasks','task-commented','catalan','New Comment on Task (Sent to Staff) [catalan]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(253,'tasks','task-added-attachment','catalan','New Attachment(s) on Task (Sent to Staff) [catalan]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(254,'estimate','estimate-declined-to-staff','catalan','Estimate Declined (Sent to Staff) [catalan]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(255,'estimate','estimate-accepted-to-staff','catalan','Estimate Accepted (Sent to Staff) [catalan]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(256,'proposals','proposal-client-accepted','catalan','Customer Action - Accepted (Sent to Staff) [catalan]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(257,'proposals','proposal-send-to-customer','catalan','Send Proposal to Customer [catalan]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(258,'proposals','proposal-client-declined','catalan','Customer Action - Declined (Sent to Staff) [catalan]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(259,'proposals','proposal-client-thank-you','catalan','Thank You Email (Sent to Customer After Accept) [catalan]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(260,'proposals','proposal-comment-to-client','catalan','New Comment Â (Sent to Customer/Lead) [catalan]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(261,'proposals','proposal-comment-to-admin','catalan','New Comment (Sent to Staff)  [catalan]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(262,'estimate','estimate-thank-you-to-customer','catalan','Thank You Email (Sent to Customer After Accept) [catalan]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(263,'tasks','task-deadline-notification','catalan','Task Deadline Reminder - Sent to Assigned Members [catalan]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(264,'contract','send-contract','catalan','Send Contract to Customer [catalan]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(265,'invoice','invoice-payment-recorded-to-staff','catalan','Invoice Payment Recorded (Sent to Staff) [catalan]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(266,'ticket','auto-close-ticket','catalan','Auto Close Ticket [catalan]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(267,'project','new-project-discussion-created-to-staff','catalan','New Project Discussion (Sent to Project Members) [catalan]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(268,'project','new-project-discussion-created-to-customer','catalan','New Project Discussion (Sent to Customer Contacts) [catalan]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(269,'project','new-project-file-uploaded-to-customer','catalan','New Project File(s) Uploaded (Sent to Customer Contacts) [catalan]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(270,'project','new-project-file-uploaded-to-staff','catalan','New Project File(s) Uploaded (Sent to Project Members) [catalan]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(271,'project','new-project-discussion-comment-to-customer','catalan','New Discussion Comment  (Sent to Customer Contacts) [catalan]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(272,'project','new-project-discussion-comment-to-staff','catalan','New Discussion Comment (Sent to Project Members) [catalan]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(273,'project','staff-added-as-project-member','catalan','Staff Added as Project Member [catalan]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(274,'estimate','estimate-expiry-reminder','catalan','Estimate Expiration Reminder [catalan]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(275,'proposals','proposal-expiry-reminder','catalan','Proposal Expiration Reminder [catalan]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(276,'staff','new-staff-created','catalan','New Staff Created (Welcome Email) [catalan]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(277,'client','contact-forgot-password','catalan','Forgot Password [catalan]','Create New Password','','DOT One Business Solution','',0,1,0),(278,'client','contact-password-reseted','catalan','Password Reset - Confirmation [catalan]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(279,'client','contact-set-password','catalan','Set New Password [catalan]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(280,'staff','staff-forgot-password','catalan','Forgot Password [catalan]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(281,'staff','staff-password-reseted','catalan','Password Reset - Confirmation [catalan]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(282,'project','assigned-to-project','catalan','New Project Created (Sent to Customer Contacts) [catalan]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(283,'tasks','task-added-attachment-to-contacts','catalan','New Attachment(s) on Task (Sent to Customer Contacts) [catalan]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(284,'tasks','task-commented-to-contacts','catalan','New Comment on Task (Sent to Customer Contacts) [catalan]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(285,'leads','new-lead-assigned','catalan','New Lead Assigned to Staff Member [catalan]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(286,'client','client-statement','catalan','Statement - Account Summary [catalan]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(287,'ticket','ticket-assigned-to-admin','catalan','New Ticket Assigned (Sent to Staff) [catalan]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(288,'client','new-client-registered-to-admin','catalan','New Customer Registration (Sent to admins) [catalan]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(289,'leads','new-web-to-lead-form-submitted','catalan','Web to lead form submitted - Sent to lead [catalan]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(290,'staff','two-factor-authentication','catalan','Two Factor Authentication [catalan]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(291,'project','project-finished-to-customer','catalan','Project Marked as Finished (Sent to Customer Contacts) [catalan]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(292,'credit_note','credit-note-send-to-client','catalan','Send Credit Note To Email [catalan]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(293,'tasks','task-status-change-to-staff','catalan','Task Status Changed (Sent to Staff) [catalan]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(294,'tasks','task-status-change-to-contacts','catalan','Task Status Changed (Sent to Customer Contacts) [catalan]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(295,'staff','reminder-email-staff','catalan','Staff Reminder Email [catalan]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(296,'contract','contract-comment-to-client','catalan','New Comment Â (Sent to Customer Contacts) [catalan]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(297,'contract','contract-comment-to-admin','catalan','New Comment (Sent to Staff)  [catalan]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(298,'subscriptions','send-subscription','catalan','Send Subscription to Customer [catalan]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(299,'subscriptions','subscription-payment-failed','catalan','Subscription Payment Failed [catalan]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(300,'subscriptions','subscription-canceled','catalan','Subscription Canceled (Sent to customer primary contact) [catalan]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(301,'subscriptions','subscription-payment-succeeded','catalan','Subscription Payment Succeeded (Sent to customer primary contact) [catalan]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(302,'contract','contract-expiration-to-staff','catalan','Contract Expiration Reminder (Sent to Staff) [catalan]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(303,'gdpr','gdpr-removal-request','catalan','Removal Request From Contact (Sent to administrators) [catalan]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(304,'gdpr','gdpr-removal-request-lead','catalan','Removal Request From Lead (Sent to administrators) [catalan]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(305,'client','client-registration-confirmed','catalan','Customer Registration Confirmed [catalan]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(306,'contract','contract-signed-to-staff','catalan','Contract Signed (Sent to Staff) [catalan]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(307,'subscriptions','customer-subscribed-to-staff','catalan','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [catalan]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(308,'client','contact-verification-email','catalan','Email Verification (Sent to Contact After Registration) [catalan]','Verify Email Address','','{companyname}','',0,1,0),(309,'client','new-customer-profile-file-uploaded-to-staff','catalan','New Customer Profile File(s) Uploaded (Sent to Staff) [catalan]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(310,'staff','event-notification-to-staff','catalan','Event Notification (Calendar) [catalan]','Upcoming Event - {event_title}','','',NULL,0,1,0),(311,'subscriptions','subscription-payment-requires-action','catalan','Credit Card Authorization Required - SCA [catalan]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(312,'invoice','invoice-due-notice','catalan','Invoice Due Notice [catalan]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(313,'estimate_request','estimate-request-submitted-to-staff','catalan','Estimate Request Submitted (Sent to Staff) [catalan]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(314,'estimate_request','estimate-request-assigned','catalan','Estimate Request Assigned (Sent to Staff) [catalan]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(315,'estimate_request','estimate-request-received-to-user','catalan','Estimate Request Received (Sent to User) [catalan]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(316,'notifications','non-billed-tasks-reminder','catalan','Non-billed tasks reminder (sent to selected staff members) [catalan]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(317,'invoice','invoices-batch-payments','catalan','Invoices Payments Recorded in Batch (Sent to Customer) [catalan]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(318,'contract','contract-sign-reminder','catalan','Contract Sign Reminder (Sent to Customer) [catalan]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(319,'timesheets_attendance_mgt','attendance_notice','catalan','Attendance notice [catalan]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(320,'timesheets_attendance_mgt','send_request_approval','catalan','Send request approval [catalan]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(321,'timesheets_attendance_mgt','remind_user_check_in','catalan','Remind user check in [catalan]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(322,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','catalan','New application (Send to notification recipient) [catalan]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(323,'client','affiliate_management_payout_updated','catalan','Affiliate Payout Request Update [catalan]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(324,'client','affiliate_management_signup_through_affiliate_link','catalan','Successful Signup through Affiliate Link [catalan]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(325,'client','affiliate_management_successful_referral_commission','catalan','Successful Referral Commission Notification [catalan]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(326,'staff','affiliate_management_new_payout_request_for_admin','catalan','Affiliate Payout Request [catalan]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(327,'staff','affiliate_management_payout_updated_for_admin','catalan','Affiliate Payout Request Updated [catalan]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(328,'staff','affiliate_management_new_affiliate_signup_for_admin','catalan','New Affiliate Signup [catalan]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(329,'client','affiliate_management_referral_commission_reversal','catalan','Referral Commission Reversal Notification [catalan]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(330,'inventory_warning','inventory-warning-to-staff','catalan','Inventory warning (Sent to staff) [catalan]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(339,'purchase_order','purchase-order-to-contact','catalan','Purchase Order (Sent to contact) [catalan]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(340,'purchase_order','purchase-request-to-contact','catalan','Purchase Request (Sent to contact) [catalan]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(341,'purchase_order','purchase-quotation-to-contact','catalan','Purchase Quotation (Sent to contact) [catalan]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(342,'purchase_order','debit-note-to-contact','catalan','Debit Note (Sent to contact) [catalan]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(343,'purchase_order','purchase-statement-to-contact','catalan','Purchase Statement (Sent to contact) [catalan]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(344,'purchase_order','vendor-registration-confirmed','catalan','Vendor Registration Confirmed [catalan]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(345,'purchase_order','purchase-contract-to-contact','catalan','Purchase Contract (Sent to contact) [catalan]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(346,'purchase_order','new-contact-created','catalan','New Contact Added/Registered (Welcome Email) [catalan]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(347,'purchase_order','purchase-request-approval','catalan','Request approval [catalan]','Request approval','','{companyname} | CRM',NULL,0,1,0),(348,'purchase_order','purchase-send-approved','catalan','Email send approved [catalan]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(349,'purchase_order','purchase-send-rejected','catalan','Email send rejected [catalan]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(350,'change_candidate_status','change-candidate-status-to-candidate','catalan','Change Candidate Status (Sent to Candidate) [catalan]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(351,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','catalan','Change Candidate Job Applied Status (Sent to Candidate) [catalan]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(352,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','catalan','Change Candidate Interview Schedule Status (Sent to Candidate) [catalan]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(353,'new_candidate_have_applied','new-candidate-have-applied','catalan','New candidate have applied (Sent to Responsible) [catalan]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(354,'staff','flexibackup-new-backup-to-staff','catalan','Flexi Backup Notification [catalan]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(355,'client','new-client-created','chinese','New Contact Added/Registered (Welcome Email) [chinese]','Welcome aboard','','DOT One Business Solution','',0,1,0),(356,'invoice','invoice-send-to-client','chinese','Send Invoice to Customer [chinese]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(357,'ticket','new-ticket-opened-admin','chinese','New Ticket Opened (Opened by Staff, Sent to Customer) [chinese]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(358,'ticket','ticket-reply','chinese','Ticket Reply (Sent to Customer) [chinese]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(359,'ticket','ticket-autoresponse','chinese','New Ticket Opened - Autoresponse [chinese]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(360,'invoice','invoice-payment-recorded','chinese','Invoice Payment Recorded (Sent to Customer) [chinese]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(361,'invoice','invoice-overdue-notice','chinese','Invoice Overdue Notice [chinese]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(362,'invoice','invoice-already-send','chinese','Invoice Already Sent to Customer [chinese]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(363,'ticket','new-ticket-created-staff','chinese','New Ticket Created (Opened by Customer, Sent to Staff Members) [chinese]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(364,'estimate','estimate-send-to-client','chinese','Send Estimate to Customer [chinese]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(365,'ticket','ticket-reply-to-admin','chinese','Ticket Reply (Sent to Staff) [chinese]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(366,'estimate','estimate-already-send','chinese','Estimate Already Sent to Customer [chinese]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(367,'contract','contract-expiration','chinese','Contract Expiration Reminder (Sent to Customer Contacts) [chinese]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(368,'tasks','task-assigned','chinese','New Task Assigned (Sent to Staff) [chinese]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(369,'tasks','task-added-as-follower','chinese','Staff Member Added as Follower on Task (Sent to Staff) [chinese]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(370,'tasks','task-commented','chinese','New Comment on Task (Sent to Staff) [chinese]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(371,'tasks','task-added-attachment','chinese','New Attachment(s) on Task (Sent to Staff) [chinese]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(372,'estimate','estimate-declined-to-staff','chinese','Estimate Declined (Sent to Staff) [chinese]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(373,'estimate','estimate-accepted-to-staff','chinese','Estimate Accepted (Sent to Staff) [chinese]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(374,'proposals','proposal-client-accepted','chinese','Customer Action - Accepted (Sent to Staff) [chinese]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(375,'proposals','proposal-send-to-customer','chinese','Send Proposal to Customer [chinese]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(376,'proposals','proposal-client-declined','chinese','Customer Action - Declined (Sent to Staff) [chinese]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(377,'proposals','proposal-client-thank-you','chinese','Thank You Email (Sent to Customer After Accept) [chinese]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(378,'proposals','proposal-comment-to-client','chinese','New Comment Â (Sent to Customer/Lead) [chinese]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(379,'proposals','proposal-comment-to-admin','chinese','New Comment (Sent to Staff)  [chinese]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(380,'estimate','estimate-thank-you-to-customer','chinese','Thank You Email (Sent to Customer After Accept) [chinese]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(381,'tasks','task-deadline-notification','chinese','Task Deadline Reminder - Sent to Assigned Members [chinese]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(382,'contract','send-contract','chinese','Send Contract to Customer [chinese]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(383,'invoice','invoice-payment-recorded-to-staff','chinese','Invoice Payment Recorded (Sent to Staff) [chinese]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(384,'ticket','auto-close-ticket','chinese','Auto Close Ticket [chinese]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(385,'project','new-project-discussion-created-to-staff','chinese','New Project Discussion (Sent to Project Members) [chinese]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(386,'project','new-project-discussion-created-to-customer','chinese','New Project Discussion (Sent to Customer Contacts) [chinese]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(387,'project','new-project-file-uploaded-to-customer','chinese','New Project File(s) Uploaded (Sent to Customer Contacts) [chinese]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(388,'project','new-project-file-uploaded-to-staff','chinese','New Project File(s) Uploaded (Sent to Project Members) [chinese]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(389,'project','new-project-discussion-comment-to-customer','chinese','New Discussion Comment  (Sent to Customer Contacts) [chinese]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(390,'project','new-project-discussion-comment-to-staff','chinese','New Discussion Comment (Sent to Project Members) [chinese]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(391,'project','staff-added-as-project-member','chinese','Staff Added as Project Member [chinese]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(392,'estimate','estimate-expiry-reminder','chinese','Estimate Expiration Reminder [chinese]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(393,'proposals','proposal-expiry-reminder','chinese','Proposal Expiration Reminder [chinese]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(394,'staff','new-staff-created','chinese','New Staff Created (Welcome Email) [chinese]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(395,'client','contact-forgot-password','chinese','Forgot Password [chinese]','Create New Password','','DOT One Business Solution','',0,1,0),(396,'client','contact-password-reseted','chinese','Password Reset - Confirmation [chinese]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(397,'client','contact-set-password','chinese','Set New Password [chinese]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(398,'staff','staff-forgot-password','chinese','Forgot Password [chinese]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(399,'staff','staff-password-reseted','chinese','Password Reset - Confirmation [chinese]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(400,'project','assigned-to-project','chinese','New Project Created (Sent to Customer Contacts) [chinese]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(401,'tasks','task-added-attachment-to-contacts','chinese','New Attachment(s) on Task (Sent to Customer Contacts) [chinese]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(402,'tasks','task-commented-to-contacts','chinese','New Comment on Task (Sent to Customer Contacts) [chinese]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(403,'leads','new-lead-assigned','chinese','New Lead Assigned to Staff Member [chinese]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(404,'client','client-statement','chinese','Statement - Account Summary [chinese]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(405,'ticket','ticket-assigned-to-admin','chinese','New Ticket Assigned (Sent to Staff) [chinese]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(406,'client','new-client-registered-to-admin','chinese','New Customer Registration (Sent to admins) [chinese]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(407,'leads','new-web-to-lead-form-submitted','chinese','Web to lead form submitted - Sent to lead [chinese]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(408,'staff','two-factor-authentication','chinese','Two Factor Authentication [chinese]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(409,'project','project-finished-to-customer','chinese','Project Marked as Finished (Sent to Customer Contacts) [chinese]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(410,'credit_note','credit-note-send-to-client','chinese','Send Credit Note To Email [chinese]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(411,'tasks','task-status-change-to-staff','chinese','Task Status Changed (Sent to Staff) [chinese]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(412,'tasks','task-status-change-to-contacts','chinese','Task Status Changed (Sent to Customer Contacts) [chinese]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(413,'staff','reminder-email-staff','chinese','Staff Reminder Email [chinese]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(414,'contract','contract-comment-to-client','chinese','New Comment Â (Sent to Customer Contacts) [chinese]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(415,'contract','contract-comment-to-admin','chinese','New Comment (Sent to Staff)  [chinese]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(416,'subscriptions','send-subscription','chinese','Send Subscription to Customer [chinese]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(417,'subscriptions','subscription-payment-failed','chinese','Subscription Payment Failed [chinese]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(418,'subscriptions','subscription-canceled','chinese','Subscription Canceled (Sent to customer primary contact) [chinese]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(419,'subscriptions','subscription-payment-succeeded','chinese','Subscription Payment Succeeded (Sent to customer primary contact) [chinese]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(420,'contract','contract-expiration-to-staff','chinese','Contract Expiration Reminder (Sent to Staff) [chinese]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(421,'gdpr','gdpr-removal-request','chinese','Removal Request From Contact (Sent to administrators) [chinese]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(422,'gdpr','gdpr-removal-request-lead','chinese','Removal Request From Lead (Sent to administrators) [chinese]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(423,'client','client-registration-confirmed','chinese','Customer Registration Confirmed [chinese]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(424,'contract','contract-signed-to-staff','chinese','Contract Signed (Sent to Staff) [chinese]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(425,'subscriptions','customer-subscribed-to-staff','chinese','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [chinese]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(426,'client','contact-verification-email','chinese','Email Verification (Sent to Contact After Registration) [chinese]','Verify Email Address','','{companyname}','',0,1,0),(427,'client','new-customer-profile-file-uploaded-to-staff','chinese','New Customer Profile File(s) Uploaded (Sent to Staff) [chinese]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(428,'staff','event-notification-to-staff','chinese','Event Notification (Calendar) [chinese]','Upcoming Event - {event_title}','','',NULL,0,1,0),(429,'subscriptions','subscription-payment-requires-action','chinese','Credit Card Authorization Required - SCA [chinese]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(430,'invoice','invoice-due-notice','chinese','Invoice Due Notice [chinese]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(431,'estimate_request','estimate-request-submitted-to-staff','chinese','Estimate Request Submitted (Sent to Staff) [chinese]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(432,'estimate_request','estimate-request-assigned','chinese','Estimate Request Assigned (Sent to Staff) [chinese]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(433,'estimate_request','estimate-request-received-to-user','chinese','Estimate Request Received (Sent to User) [chinese]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(434,'notifications','non-billed-tasks-reminder','chinese','Non-billed tasks reminder (sent to selected staff members) [chinese]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(435,'invoice','invoices-batch-payments','chinese','Invoices Payments Recorded in Batch (Sent to Customer) [chinese]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(436,'contract','contract-sign-reminder','chinese','Contract Sign Reminder (Sent to Customer) [chinese]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(437,'timesheets_attendance_mgt','attendance_notice','chinese','Attendance notice [chinese]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(438,'timesheets_attendance_mgt','send_request_approval','chinese','Send request approval [chinese]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(439,'timesheets_attendance_mgt','remind_user_check_in','chinese','Remind user check in [chinese]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(440,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','chinese','New application (Send to notification recipient) [chinese]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(441,'client','affiliate_management_payout_updated','chinese','Affiliate Payout Request Update [chinese]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(442,'client','affiliate_management_signup_through_affiliate_link','chinese','Successful Signup through Affiliate Link [chinese]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(443,'client','affiliate_management_successful_referral_commission','chinese','Successful Referral Commission Notification [chinese]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(444,'staff','affiliate_management_new_payout_request_for_admin','chinese','Affiliate Payout Request [chinese]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(445,'staff','affiliate_management_payout_updated_for_admin','chinese','Affiliate Payout Request Updated [chinese]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(446,'staff','affiliate_management_new_affiliate_signup_for_admin','chinese','New Affiliate Signup [chinese]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(447,'client','affiliate_management_referral_commission_reversal','chinese','Referral Commission Reversal Notification [chinese]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(448,'inventory_warning','inventory-warning-to-staff','chinese','Inventory warning (Sent to staff) [chinese]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(457,'purchase_order','purchase-order-to-contact','chinese','Purchase Order (Sent to contact) [chinese]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(458,'purchase_order','purchase-request-to-contact','chinese','Purchase Request (Sent to contact) [chinese]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(459,'purchase_order','purchase-quotation-to-contact','chinese','Purchase Quotation (Sent to contact) [chinese]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(460,'purchase_order','debit-note-to-contact','chinese','Debit Note (Sent to contact) [chinese]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(461,'purchase_order','purchase-statement-to-contact','chinese','Purchase Statement (Sent to contact) [chinese]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(462,'purchase_order','vendor-registration-confirmed','chinese','Vendor Registration Confirmed [chinese]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(463,'purchase_order','purchase-contract-to-contact','chinese','Purchase Contract (Sent to contact) [chinese]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(464,'purchase_order','new-contact-created','chinese','New Contact Added/Registered (Welcome Email) [chinese]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(465,'purchase_order','purchase-request-approval','chinese','Request approval [chinese]','Request approval','','{companyname} | CRM',NULL,0,1,0),(466,'purchase_order','purchase-send-approved','chinese','Email send approved [chinese]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(467,'purchase_order','purchase-send-rejected','chinese','Email send rejected [chinese]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(468,'change_candidate_status','change-candidate-status-to-candidate','chinese','Change Candidate Status (Sent to Candidate) [chinese]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(469,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','chinese','Change Candidate Job Applied Status (Sent to Candidate) [chinese]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(470,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','chinese','Change Candidate Interview Schedule Status (Sent to Candidate) [chinese]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(471,'new_candidate_have_applied','new-candidate-have-applied','chinese','New candidate have applied (Sent to Responsible) [chinese]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(472,'staff','flexibackup-new-backup-to-staff','chinese','Flexi Backup Notification [chinese]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(473,'client','new-client-created','czech','New Contact Added/Registered (Welcome Email) [czech]','Welcome aboard','','DOT One Business Solution','',0,1,0),(474,'invoice','invoice-send-to-client','czech','Send Invoice to Customer [czech]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(475,'ticket','new-ticket-opened-admin','czech','New Ticket Opened (Opened by Staff, Sent to Customer) [czech]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(476,'ticket','ticket-reply','czech','Ticket Reply (Sent to Customer) [czech]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(477,'ticket','ticket-autoresponse','czech','New Ticket Opened - Autoresponse [czech]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(478,'invoice','invoice-payment-recorded','czech','Invoice Payment Recorded (Sent to Customer) [czech]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(479,'invoice','invoice-overdue-notice','czech','Invoice Overdue Notice [czech]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(480,'invoice','invoice-already-send','czech','Invoice Already Sent to Customer [czech]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(481,'ticket','new-ticket-created-staff','czech','New Ticket Created (Opened by Customer, Sent to Staff Members) [czech]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(482,'estimate','estimate-send-to-client','czech','Send Estimate to Customer [czech]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(483,'ticket','ticket-reply-to-admin','czech','Ticket Reply (Sent to Staff) [czech]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(484,'estimate','estimate-already-send','czech','Estimate Already Sent to Customer [czech]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(485,'contract','contract-expiration','czech','Contract Expiration Reminder (Sent to Customer Contacts) [czech]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(486,'tasks','task-assigned','czech','New Task Assigned (Sent to Staff) [czech]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(487,'tasks','task-added-as-follower','czech','Staff Member Added as Follower on Task (Sent to Staff) [czech]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(488,'tasks','task-commented','czech','New Comment on Task (Sent to Staff) [czech]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(489,'tasks','task-added-attachment','czech','New Attachment(s) on Task (Sent to Staff) [czech]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(490,'estimate','estimate-declined-to-staff','czech','Estimate Declined (Sent to Staff) [czech]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(491,'estimate','estimate-accepted-to-staff','czech','Estimate Accepted (Sent to Staff) [czech]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(492,'proposals','proposal-client-accepted','czech','Customer Action - Accepted (Sent to Staff) [czech]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(493,'proposals','proposal-send-to-customer','czech','Send Proposal to Customer [czech]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(494,'proposals','proposal-client-declined','czech','Customer Action - Declined (Sent to Staff) [czech]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(495,'proposals','proposal-client-thank-you','czech','Thank You Email (Sent to Customer After Accept) [czech]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(496,'proposals','proposal-comment-to-client','czech','New Comment Â (Sent to Customer/Lead) [czech]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(497,'proposals','proposal-comment-to-admin','czech','New Comment (Sent to Staff)  [czech]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(498,'estimate','estimate-thank-you-to-customer','czech','Thank You Email (Sent to Customer After Accept) [czech]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(499,'tasks','task-deadline-notification','czech','Task Deadline Reminder - Sent to Assigned Members [czech]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(500,'contract','send-contract','czech','Send Contract to Customer [czech]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(501,'invoice','invoice-payment-recorded-to-staff','czech','Invoice Payment Recorded (Sent to Staff) [czech]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(502,'ticket','auto-close-ticket','czech','Auto Close Ticket [czech]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(503,'project','new-project-discussion-created-to-staff','czech','New Project Discussion (Sent to Project Members) [czech]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(504,'project','new-project-discussion-created-to-customer','czech','New Project Discussion (Sent to Customer Contacts) [czech]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(505,'project','new-project-file-uploaded-to-customer','czech','New Project File(s) Uploaded (Sent to Customer Contacts) [czech]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(506,'project','new-project-file-uploaded-to-staff','czech','New Project File(s) Uploaded (Sent to Project Members) [czech]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(507,'project','new-project-discussion-comment-to-customer','czech','New Discussion Comment  (Sent to Customer Contacts) [czech]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(508,'project','new-project-discussion-comment-to-staff','czech','New Discussion Comment (Sent to Project Members) [czech]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(509,'project','staff-added-as-project-member','czech','Staff Added as Project Member [czech]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(510,'estimate','estimate-expiry-reminder','czech','Estimate Expiration Reminder [czech]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(511,'proposals','proposal-expiry-reminder','czech','Proposal Expiration Reminder [czech]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(512,'staff','new-staff-created','czech','New Staff Created (Welcome Email) [czech]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(513,'client','contact-forgot-password','czech','Forgot Password [czech]','Create New Password','','DOT One Business Solution','',0,1,0),(514,'client','contact-password-reseted','czech','Password Reset - Confirmation [czech]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(515,'client','contact-set-password','czech','Set New Password [czech]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(516,'staff','staff-forgot-password','czech','Forgot Password [czech]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(517,'staff','staff-password-reseted','czech','Password Reset - Confirmation [czech]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(518,'project','assigned-to-project','czech','New Project Created (Sent to Customer Contacts) [czech]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(519,'tasks','task-added-attachment-to-contacts','czech','New Attachment(s) on Task (Sent to Customer Contacts) [czech]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(520,'tasks','task-commented-to-contacts','czech','New Comment on Task (Sent to Customer Contacts) [czech]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(521,'leads','new-lead-assigned','czech','New Lead Assigned to Staff Member [czech]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(522,'client','client-statement','czech','Statement - Account Summary [czech]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(523,'ticket','ticket-assigned-to-admin','czech','New Ticket Assigned (Sent to Staff) [czech]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(524,'client','new-client-registered-to-admin','czech','New Customer Registration (Sent to admins) [czech]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(525,'leads','new-web-to-lead-form-submitted','czech','Web to lead form submitted - Sent to lead [czech]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(526,'staff','two-factor-authentication','czech','Two Factor Authentication [czech]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(527,'project','project-finished-to-customer','czech','Project Marked as Finished (Sent to Customer Contacts) [czech]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(528,'credit_note','credit-note-send-to-client','czech','Send Credit Note To Email [czech]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(529,'tasks','task-status-change-to-staff','czech','Task Status Changed (Sent to Staff) [czech]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(530,'tasks','task-status-change-to-contacts','czech','Task Status Changed (Sent to Customer Contacts) [czech]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(531,'staff','reminder-email-staff','czech','Staff Reminder Email [czech]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(532,'contract','contract-comment-to-client','czech','New Comment Â (Sent to Customer Contacts) [czech]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(533,'contract','contract-comment-to-admin','czech','New Comment (Sent to Staff)  [czech]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(534,'subscriptions','send-subscription','czech','Send Subscription to Customer [czech]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(535,'subscriptions','subscription-payment-failed','czech','Subscription Payment Failed [czech]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(536,'subscriptions','subscription-canceled','czech','Subscription Canceled (Sent to customer primary contact) [czech]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(537,'subscriptions','subscription-payment-succeeded','czech','Subscription Payment Succeeded (Sent to customer primary contact) [czech]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(538,'contract','contract-expiration-to-staff','czech','Contract Expiration Reminder (Sent to Staff) [czech]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(539,'gdpr','gdpr-removal-request','czech','Removal Request From Contact (Sent to administrators) [czech]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(540,'gdpr','gdpr-removal-request-lead','czech','Removal Request From Lead (Sent to administrators) [czech]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(541,'client','client-registration-confirmed','czech','Customer Registration Confirmed [czech]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(542,'contract','contract-signed-to-staff','czech','Contract Signed (Sent to Staff) [czech]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(543,'subscriptions','customer-subscribed-to-staff','czech','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [czech]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(544,'client','contact-verification-email','czech','Email Verification (Sent to Contact After Registration) [czech]','Verify Email Address','','{companyname}','',0,1,0),(545,'client','new-customer-profile-file-uploaded-to-staff','czech','New Customer Profile File(s) Uploaded (Sent to Staff) [czech]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(546,'staff','event-notification-to-staff','czech','Event Notification (Calendar) [czech]','Upcoming Event - {event_title}','','',NULL,0,1,0),(547,'subscriptions','subscription-payment-requires-action','czech','Credit Card Authorization Required - SCA [czech]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(548,'invoice','invoice-due-notice','czech','Invoice Due Notice [czech]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(549,'estimate_request','estimate-request-submitted-to-staff','czech','Estimate Request Submitted (Sent to Staff) [czech]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(550,'estimate_request','estimate-request-assigned','czech','Estimate Request Assigned (Sent to Staff) [czech]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(551,'estimate_request','estimate-request-received-to-user','czech','Estimate Request Received (Sent to User) [czech]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(552,'notifications','non-billed-tasks-reminder','czech','Non-billed tasks reminder (sent to selected staff members) [czech]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(553,'invoice','invoices-batch-payments','czech','Invoices Payments Recorded in Batch (Sent to Customer) [czech]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(554,'contract','contract-sign-reminder','czech','Contract Sign Reminder (Sent to Customer) [czech]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(555,'timesheets_attendance_mgt','attendance_notice','czech','Attendance notice [czech]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(556,'timesheets_attendance_mgt','send_request_approval','czech','Send request approval [czech]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(557,'timesheets_attendance_mgt','remind_user_check_in','czech','Remind user check in [czech]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(558,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','czech','New application (Send to notification recipient) [czech]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(559,'client','affiliate_management_payout_updated','czech','Affiliate Payout Request Update [czech]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(560,'client','affiliate_management_signup_through_affiliate_link','czech','Successful Signup through Affiliate Link [czech]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(561,'client','affiliate_management_successful_referral_commission','czech','Successful Referral Commission Notification [czech]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(562,'staff','affiliate_management_new_payout_request_for_admin','czech','Affiliate Payout Request [czech]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(563,'staff','affiliate_management_payout_updated_for_admin','czech','Affiliate Payout Request Updated [czech]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(564,'staff','affiliate_management_new_affiliate_signup_for_admin','czech','New Affiliate Signup [czech]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(565,'client','affiliate_management_referral_commission_reversal','czech','Referral Commission Reversal Notification [czech]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(566,'inventory_warning','inventory-warning-to-staff','czech','Inventory warning (Sent to staff) [czech]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(575,'purchase_order','purchase-order-to-contact','czech','Purchase Order (Sent to contact) [czech]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(576,'purchase_order','purchase-request-to-contact','czech','Purchase Request (Sent to contact) [czech]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(577,'purchase_order','purchase-quotation-to-contact','czech','Purchase Quotation (Sent to contact) [czech]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(578,'purchase_order','debit-note-to-contact','czech','Debit Note (Sent to contact) [czech]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(579,'purchase_order','purchase-statement-to-contact','czech','Purchase Statement (Sent to contact) [czech]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(580,'purchase_order','vendor-registration-confirmed','czech','Vendor Registration Confirmed [czech]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(581,'purchase_order','purchase-contract-to-contact','czech','Purchase Contract (Sent to contact) [czech]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(582,'purchase_order','new-contact-created','czech','New Contact Added/Registered (Welcome Email) [czech]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(583,'purchase_order','purchase-request-approval','czech','Request approval [czech]','Request approval','','{companyname} | CRM',NULL,0,1,0),(584,'purchase_order','purchase-send-approved','czech','Email send approved [czech]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(585,'purchase_order','purchase-send-rejected','czech','Email send rejected [czech]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(586,'change_candidate_status','change-candidate-status-to-candidate','czech','Change Candidate Status (Sent to Candidate) [czech]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(587,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','czech','Change Candidate Job Applied Status (Sent to Candidate) [czech]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(588,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','czech','Change Candidate Interview Schedule Status (Sent to Candidate) [czech]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(589,'new_candidate_have_applied','new-candidate-have-applied','czech','New candidate have applied (Sent to Responsible) [czech]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(590,'staff','flexibackup-new-backup-to-staff','czech','Flexi Backup Notification [czech]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(591,'client','new-client-created','dutch','New Contact Added/Registered (Welcome Email) [dutch]','Welcome aboard','','DOT One Business Solution','',0,1,0),(592,'invoice','invoice-send-to-client','dutch','Send Invoice to Customer [dutch]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(593,'ticket','new-ticket-opened-admin','dutch','New Ticket Opened (Opened by Staff, Sent to Customer) [dutch]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(594,'ticket','ticket-reply','dutch','Ticket Reply (Sent to Customer) [dutch]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(595,'ticket','ticket-autoresponse','dutch','New Ticket Opened - Autoresponse [dutch]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(596,'invoice','invoice-payment-recorded','dutch','Invoice Payment Recorded (Sent to Customer) [dutch]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(597,'invoice','invoice-overdue-notice','dutch','Invoice Overdue Notice [dutch]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(598,'invoice','invoice-already-send','dutch','Invoice Already Sent to Customer [dutch]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(599,'ticket','new-ticket-created-staff','dutch','New Ticket Created (Opened by Customer, Sent to Staff Members) [dutch]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(600,'estimate','estimate-send-to-client','dutch','Send Estimate to Customer [dutch]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(601,'ticket','ticket-reply-to-admin','dutch','Ticket Reply (Sent to Staff) [dutch]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(602,'estimate','estimate-already-send','dutch','Estimate Already Sent to Customer [dutch]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(603,'contract','contract-expiration','dutch','Contract Expiration Reminder (Sent to Customer Contacts) [dutch]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(604,'tasks','task-assigned','dutch','New Task Assigned (Sent to Staff) [dutch]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(605,'tasks','task-added-as-follower','dutch','Staff Member Added as Follower on Task (Sent to Staff) [dutch]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(606,'tasks','task-commented','dutch','New Comment on Task (Sent to Staff) [dutch]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(607,'tasks','task-added-attachment','dutch','New Attachment(s) on Task (Sent to Staff) [dutch]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(608,'estimate','estimate-declined-to-staff','dutch','Estimate Declined (Sent to Staff) [dutch]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(609,'estimate','estimate-accepted-to-staff','dutch','Estimate Accepted (Sent to Staff) [dutch]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(610,'proposals','proposal-client-accepted','dutch','Customer Action - Accepted (Sent to Staff) [dutch]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(611,'proposals','proposal-send-to-customer','dutch','Send Proposal to Customer [dutch]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(612,'proposals','proposal-client-declined','dutch','Customer Action - Declined (Sent to Staff) [dutch]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(613,'proposals','proposal-client-thank-you','dutch','Thank You Email (Sent to Customer After Accept) [dutch]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(614,'proposals','proposal-comment-to-client','dutch','New Comment Â (Sent to Customer/Lead) [dutch]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(615,'proposals','proposal-comment-to-admin','dutch','New Comment (Sent to Staff)  [dutch]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(616,'estimate','estimate-thank-you-to-customer','dutch','Thank You Email (Sent to Customer After Accept) [dutch]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(617,'tasks','task-deadline-notification','dutch','Task Deadline Reminder - Sent to Assigned Members [dutch]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(618,'contract','send-contract','dutch','Send Contract to Customer [dutch]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(619,'invoice','invoice-payment-recorded-to-staff','dutch','Invoice Payment Recorded (Sent to Staff) [dutch]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(620,'ticket','auto-close-ticket','dutch','Auto Close Ticket [dutch]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(621,'project','new-project-discussion-created-to-staff','dutch','New Project Discussion (Sent to Project Members) [dutch]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(622,'project','new-project-discussion-created-to-customer','dutch','New Project Discussion (Sent to Customer Contacts) [dutch]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(623,'project','new-project-file-uploaded-to-customer','dutch','New Project File(s) Uploaded (Sent to Customer Contacts) [dutch]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(624,'project','new-project-file-uploaded-to-staff','dutch','New Project File(s) Uploaded (Sent to Project Members) [dutch]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(625,'project','new-project-discussion-comment-to-customer','dutch','New Discussion Comment  (Sent to Customer Contacts) [dutch]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(626,'project','new-project-discussion-comment-to-staff','dutch','New Discussion Comment (Sent to Project Members) [dutch]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(627,'project','staff-added-as-project-member','dutch','Staff Added as Project Member [dutch]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(628,'estimate','estimate-expiry-reminder','dutch','Estimate Expiration Reminder [dutch]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(629,'proposals','proposal-expiry-reminder','dutch','Proposal Expiration Reminder [dutch]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(630,'staff','new-staff-created','dutch','New Staff Created (Welcome Email) [dutch]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(631,'client','contact-forgot-password','dutch','Forgot Password [dutch]','Create New Password','','DOT One Business Solution','',0,1,0),(632,'client','contact-password-reseted','dutch','Password Reset - Confirmation [dutch]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(633,'client','contact-set-password','dutch','Set New Password [dutch]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(634,'staff','staff-forgot-password','dutch','Forgot Password [dutch]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(635,'staff','staff-password-reseted','dutch','Password Reset - Confirmation [dutch]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(636,'project','assigned-to-project','dutch','New Project Created (Sent to Customer Contacts) [dutch]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(637,'tasks','task-added-attachment-to-contacts','dutch','New Attachment(s) on Task (Sent to Customer Contacts) [dutch]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(638,'tasks','task-commented-to-contacts','dutch','New Comment on Task (Sent to Customer Contacts) [dutch]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(639,'leads','new-lead-assigned','dutch','New Lead Assigned to Staff Member [dutch]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(640,'client','client-statement','dutch','Statement - Account Summary [dutch]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(641,'ticket','ticket-assigned-to-admin','dutch','New Ticket Assigned (Sent to Staff) [dutch]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(642,'client','new-client-registered-to-admin','dutch','New Customer Registration (Sent to admins) [dutch]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(643,'leads','new-web-to-lead-form-submitted','dutch','Web to lead form submitted - Sent to lead [dutch]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(644,'staff','two-factor-authentication','dutch','Two Factor Authentication [dutch]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(645,'project','project-finished-to-customer','dutch','Project Marked as Finished (Sent to Customer Contacts) [dutch]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(646,'credit_note','credit-note-send-to-client','dutch','Send Credit Note To Email [dutch]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(647,'tasks','task-status-change-to-staff','dutch','Task Status Changed (Sent to Staff) [dutch]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(648,'tasks','task-status-change-to-contacts','dutch','Task Status Changed (Sent to Customer Contacts) [dutch]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(649,'staff','reminder-email-staff','dutch','Staff Reminder Email [dutch]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(650,'contract','contract-comment-to-client','dutch','New Comment Â (Sent to Customer Contacts) [dutch]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(651,'contract','contract-comment-to-admin','dutch','New Comment (Sent to Staff)  [dutch]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(652,'subscriptions','send-subscription','dutch','Send Subscription to Customer [dutch]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(653,'subscriptions','subscription-payment-failed','dutch','Subscription Payment Failed [dutch]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(654,'subscriptions','subscription-canceled','dutch','Subscription Canceled (Sent to customer primary contact) [dutch]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(655,'subscriptions','subscription-payment-succeeded','dutch','Subscription Payment Succeeded (Sent to customer primary contact) [dutch]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(656,'contract','contract-expiration-to-staff','dutch','Contract Expiration Reminder (Sent to Staff) [dutch]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(657,'gdpr','gdpr-removal-request','dutch','Removal Request From Contact (Sent to administrators) [dutch]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(658,'gdpr','gdpr-removal-request-lead','dutch','Removal Request From Lead (Sent to administrators) [dutch]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(659,'client','client-registration-confirmed','dutch','Customer Registration Confirmed [dutch]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(660,'contract','contract-signed-to-staff','dutch','Contract Signed (Sent to Staff) [dutch]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(661,'subscriptions','customer-subscribed-to-staff','dutch','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [dutch]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(662,'client','contact-verification-email','dutch','Email Verification (Sent to Contact After Registration) [dutch]','Verify Email Address','','{companyname}','',0,1,0),(663,'client','new-customer-profile-file-uploaded-to-staff','dutch','New Customer Profile File(s) Uploaded (Sent to Staff) [dutch]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(664,'staff','event-notification-to-staff','dutch','Event Notification (Calendar) [dutch]','Upcoming Event - {event_title}','','',NULL,0,1,0),(665,'subscriptions','subscription-payment-requires-action','dutch','Credit Card Authorization Required - SCA [dutch]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(666,'invoice','invoice-due-notice','dutch','Invoice Due Notice [dutch]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(667,'estimate_request','estimate-request-submitted-to-staff','dutch','Estimate Request Submitted (Sent to Staff) [dutch]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(668,'estimate_request','estimate-request-assigned','dutch','Estimate Request Assigned (Sent to Staff) [dutch]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(669,'estimate_request','estimate-request-received-to-user','dutch','Estimate Request Received (Sent to User) [dutch]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(670,'notifications','non-billed-tasks-reminder','dutch','Non-billed tasks reminder (sent to selected staff members) [dutch]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(671,'invoice','invoices-batch-payments','dutch','Invoices Payments Recorded in Batch (Sent to Customer) [dutch]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(672,'contract','contract-sign-reminder','dutch','Contract Sign Reminder (Sent to Customer) [dutch]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(673,'timesheets_attendance_mgt','attendance_notice','dutch','Attendance notice [dutch]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(674,'timesheets_attendance_mgt','send_request_approval','dutch','Send request approval [dutch]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(675,'timesheets_attendance_mgt','remind_user_check_in','dutch','Remind user check in [dutch]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(676,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','dutch','New application (Send to notification recipient) [dutch]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(677,'client','affiliate_management_payout_updated','dutch','Affiliate Payout Request Update [dutch]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(678,'client','affiliate_management_signup_through_affiliate_link','dutch','Successful Signup through Affiliate Link [dutch]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(679,'client','affiliate_management_successful_referral_commission','dutch','Successful Referral Commission Notification [dutch]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(680,'staff','affiliate_management_new_payout_request_for_admin','dutch','Affiliate Payout Request [dutch]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(681,'staff','affiliate_management_payout_updated_for_admin','dutch','Affiliate Payout Request Updated [dutch]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(682,'staff','affiliate_management_new_affiliate_signup_for_admin','dutch','New Affiliate Signup [dutch]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(683,'client','affiliate_management_referral_commission_reversal','dutch','Referral Commission Reversal Notification [dutch]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(684,'inventory_warning','inventory-warning-to-staff','dutch','Inventory warning (Sent to staff) [dutch]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(693,'purchase_order','purchase-order-to-contact','dutch','Purchase Order (Sent to contact) [dutch]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(694,'purchase_order','purchase-request-to-contact','dutch','Purchase Request (Sent to contact) [dutch]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(695,'purchase_order','purchase-quotation-to-contact','dutch','Purchase Quotation (Sent to contact) [dutch]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(696,'purchase_order','debit-note-to-contact','dutch','Debit Note (Sent to contact) [dutch]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(697,'purchase_order','purchase-statement-to-contact','dutch','Purchase Statement (Sent to contact) [dutch]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(698,'purchase_order','vendor-registration-confirmed','dutch','Vendor Registration Confirmed [dutch]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(699,'purchase_order','purchase-contract-to-contact','dutch','Purchase Contract (Sent to contact) [dutch]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(700,'purchase_order','new-contact-created','dutch','New Contact Added/Registered (Welcome Email) [dutch]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(701,'purchase_order','purchase-request-approval','dutch','Request approval [dutch]','Request approval','','{companyname} | CRM',NULL,0,1,0),(702,'purchase_order','purchase-send-approved','dutch','Email send approved [dutch]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(703,'purchase_order','purchase-send-rejected','dutch','Email send rejected [dutch]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(704,'change_candidate_status','change-candidate-status-to-candidate','dutch','Change Candidate Status (Sent to Candidate) [dutch]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(705,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','dutch','Change Candidate Job Applied Status (Sent to Candidate) [dutch]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(706,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','dutch','Change Candidate Interview Schedule Status (Sent to Candidate) [dutch]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(707,'new_candidate_have_applied','new-candidate-have-applied','dutch','New candidate have applied (Sent to Responsible) [dutch]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(708,'staff','flexibackup-new-backup-to-staff','dutch','Flexi Backup Notification [dutch]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(709,'client','new-client-created','finnish','New Contact Added/Registered (Welcome Email) [finnish]','Welcome aboard','','DOT One Business Solution','',0,1,0),(710,'invoice','invoice-send-to-client','finnish','Send Invoice to Customer [finnish]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(711,'ticket','new-ticket-opened-admin','finnish','New Ticket Opened (Opened by Staff, Sent to Customer) [finnish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(712,'ticket','ticket-reply','finnish','Ticket Reply (Sent to Customer) [finnish]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(713,'ticket','ticket-autoresponse','finnish','New Ticket Opened - Autoresponse [finnish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(714,'invoice','invoice-payment-recorded','finnish','Invoice Payment Recorded (Sent to Customer) [finnish]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(715,'invoice','invoice-overdue-notice','finnish','Invoice Overdue Notice [finnish]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(716,'invoice','invoice-already-send','finnish','Invoice Already Sent to Customer [finnish]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(717,'ticket','new-ticket-created-staff','finnish','New Ticket Created (Opened by Customer, Sent to Staff Members) [finnish]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(718,'estimate','estimate-send-to-client','finnish','Send Estimate to Customer [finnish]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(719,'ticket','ticket-reply-to-admin','finnish','Ticket Reply (Sent to Staff) [finnish]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(720,'estimate','estimate-already-send','finnish','Estimate Already Sent to Customer [finnish]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(721,'contract','contract-expiration','finnish','Contract Expiration Reminder (Sent to Customer Contacts) [finnish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(722,'tasks','task-assigned','finnish','New Task Assigned (Sent to Staff) [finnish]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(723,'tasks','task-added-as-follower','finnish','Staff Member Added as Follower on Task (Sent to Staff) [finnish]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(724,'tasks','task-commented','finnish','New Comment on Task (Sent to Staff) [finnish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(725,'tasks','task-added-attachment','finnish','New Attachment(s) on Task (Sent to Staff) [finnish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(726,'estimate','estimate-declined-to-staff','finnish','Estimate Declined (Sent to Staff) [finnish]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(727,'estimate','estimate-accepted-to-staff','finnish','Estimate Accepted (Sent to Staff) [finnish]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(728,'proposals','proposal-client-accepted','finnish','Customer Action - Accepted (Sent to Staff) [finnish]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(729,'proposals','proposal-send-to-customer','finnish','Send Proposal to Customer [finnish]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(730,'proposals','proposal-client-declined','finnish','Customer Action - Declined (Sent to Staff) [finnish]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(731,'proposals','proposal-client-thank-you','finnish','Thank You Email (Sent to Customer After Accept) [finnish]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(732,'proposals','proposal-comment-to-client','finnish','New Comment Â (Sent to Customer/Lead) [finnish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(733,'proposals','proposal-comment-to-admin','finnish','New Comment (Sent to Staff)  [finnish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(734,'estimate','estimate-thank-you-to-customer','finnish','Thank You Email (Sent to Customer After Accept) [finnish]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(735,'tasks','task-deadline-notification','finnish','Task Deadline Reminder - Sent to Assigned Members [finnish]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(736,'contract','send-contract','finnish','Send Contract to Customer [finnish]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(737,'invoice','invoice-payment-recorded-to-staff','finnish','Invoice Payment Recorded (Sent to Staff) [finnish]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(738,'ticket','auto-close-ticket','finnish','Auto Close Ticket [finnish]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(739,'project','new-project-discussion-created-to-staff','finnish','New Project Discussion (Sent to Project Members) [finnish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(740,'project','new-project-discussion-created-to-customer','finnish','New Project Discussion (Sent to Customer Contacts) [finnish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(741,'project','new-project-file-uploaded-to-customer','finnish','New Project File(s) Uploaded (Sent to Customer Contacts) [finnish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(742,'project','new-project-file-uploaded-to-staff','finnish','New Project File(s) Uploaded (Sent to Project Members) [finnish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(743,'project','new-project-discussion-comment-to-customer','finnish','New Discussion Comment  (Sent to Customer Contacts) [finnish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(744,'project','new-project-discussion-comment-to-staff','finnish','New Discussion Comment (Sent to Project Members) [finnish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(745,'project','staff-added-as-project-member','finnish','Staff Added as Project Member [finnish]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(746,'estimate','estimate-expiry-reminder','finnish','Estimate Expiration Reminder [finnish]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(747,'proposals','proposal-expiry-reminder','finnish','Proposal Expiration Reminder [finnish]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(748,'staff','new-staff-created','finnish','New Staff Created (Welcome Email) [finnish]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(749,'client','contact-forgot-password','finnish','Forgot Password [finnish]','Create New Password','','DOT One Business Solution','',0,1,0),(750,'client','contact-password-reseted','finnish','Password Reset - Confirmation [finnish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(751,'client','contact-set-password','finnish','Set New Password [finnish]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(752,'staff','staff-forgot-password','finnish','Forgot Password [finnish]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(753,'staff','staff-password-reseted','finnish','Password Reset - Confirmation [finnish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(754,'project','assigned-to-project','finnish','New Project Created (Sent to Customer Contacts) [finnish]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(755,'tasks','task-added-attachment-to-contacts','finnish','New Attachment(s) on Task (Sent to Customer Contacts) [finnish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(756,'tasks','task-commented-to-contacts','finnish','New Comment on Task (Sent to Customer Contacts) [finnish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(757,'leads','new-lead-assigned','finnish','New Lead Assigned to Staff Member [finnish]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(758,'client','client-statement','finnish','Statement - Account Summary [finnish]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(759,'ticket','ticket-assigned-to-admin','finnish','New Ticket Assigned (Sent to Staff) [finnish]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(760,'client','new-client-registered-to-admin','finnish','New Customer Registration (Sent to admins) [finnish]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(761,'leads','new-web-to-lead-form-submitted','finnish','Web to lead form submitted - Sent to lead [finnish]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(762,'staff','two-factor-authentication','finnish','Two Factor Authentication [finnish]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(763,'project','project-finished-to-customer','finnish','Project Marked as Finished (Sent to Customer Contacts) [finnish]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(764,'credit_note','credit-note-send-to-client','finnish','Send Credit Note To Email [finnish]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(765,'tasks','task-status-change-to-staff','finnish','Task Status Changed (Sent to Staff) [finnish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(766,'tasks','task-status-change-to-contacts','finnish','Task Status Changed (Sent to Customer Contacts) [finnish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(767,'staff','reminder-email-staff','finnish','Staff Reminder Email [finnish]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(768,'contract','contract-comment-to-client','finnish','New Comment Â (Sent to Customer Contacts) [finnish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(769,'contract','contract-comment-to-admin','finnish','New Comment (Sent to Staff)  [finnish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(770,'subscriptions','send-subscription','finnish','Send Subscription to Customer [finnish]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(771,'subscriptions','subscription-payment-failed','finnish','Subscription Payment Failed [finnish]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(772,'subscriptions','subscription-canceled','finnish','Subscription Canceled (Sent to customer primary contact) [finnish]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(773,'subscriptions','subscription-payment-succeeded','finnish','Subscription Payment Succeeded (Sent to customer primary contact) [finnish]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(774,'contract','contract-expiration-to-staff','finnish','Contract Expiration Reminder (Sent to Staff) [finnish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(775,'gdpr','gdpr-removal-request','finnish','Removal Request From Contact (Sent to administrators) [finnish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(776,'gdpr','gdpr-removal-request-lead','finnish','Removal Request From Lead (Sent to administrators) [finnish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(777,'client','client-registration-confirmed','finnish','Customer Registration Confirmed [finnish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(778,'contract','contract-signed-to-staff','finnish','Contract Signed (Sent to Staff) [finnish]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(779,'subscriptions','customer-subscribed-to-staff','finnish','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [finnish]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(780,'client','contact-verification-email','finnish','Email Verification (Sent to Contact After Registration) [finnish]','Verify Email Address','','{companyname}','',0,1,0),(781,'client','new-customer-profile-file-uploaded-to-staff','finnish','New Customer Profile File(s) Uploaded (Sent to Staff) [finnish]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(782,'staff','event-notification-to-staff','finnish','Event Notification (Calendar) [finnish]','Upcoming Event - {event_title}','','',NULL,0,1,0),(783,'subscriptions','subscription-payment-requires-action','finnish','Credit Card Authorization Required - SCA [finnish]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(784,'invoice','invoice-due-notice','finnish','Invoice Due Notice [finnish]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(785,'estimate_request','estimate-request-submitted-to-staff','finnish','Estimate Request Submitted (Sent to Staff) [finnish]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(786,'estimate_request','estimate-request-assigned','finnish','Estimate Request Assigned (Sent to Staff) [finnish]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(787,'estimate_request','estimate-request-received-to-user','finnish','Estimate Request Received (Sent to User) [finnish]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(788,'notifications','non-billed-tasks-reminder','finnish','Non-billed tasks reminder (sent to selected staff members) [finnish]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(789,'invoice','invoices-batch-payments','finnish','Invoices Payments Recorded in Batch (Sent to Customer) [finnish]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(790,'contract','contract-sign-reminder','finnish','Contract Sign Reminder (Sent to Customer) [finnish]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(791,'timesheets_attendance_mgt','attendance_notice','finnish','Attendance notice [finnish]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(792,'timesheets_attendance_mgt','send_request_approval','finnish','Send request approval [finnish]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(793,'timesheets_attendance_mgt','remind_user_check_in','finnish','Remind user check in [finnish]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(794,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','finnish','New application (Send to notification recipient) [finnish]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(795,'client','affiliate_management_payout_updated','finnish','Affiliate Payout Request Update [finnish]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(796,'client','affiliate_management_signup_through_affiliate_link','finnish','Successful Signup through Affiliate Link [finnish]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(797,'client','affiliate_management_successful_referral_commission','finnish','Successful Referral Commission Notification [finnish]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(798,'staff','affiliate_management_new_payout_request_for_admin','finnish','Affiliate Payout Request [finnish]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(799,'staff','affiliate_management_payout_updated_for_admin','finnish','Affiliate Payout Request Updated [finnish]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(800,'staff','affiliate_management_new_affiliate_signup_for_admin','finnish','New Affiliate Signup [finnish]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(801,'client','affiliate_management_referral_commission_reversal','finnish','Referral Commission Reversal Notification [finnish]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(802,'inventory_warning','inventory-warning-to-staff','finnish','Inventory warning (Sent to staff) [finnish]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(811,'purchase_order','purchase-order-to-contact','finnish','Purchase Order (Sent to contact) [finnish]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(812,'purchase_order','purchase-request-to-contact','finnish','Purchase Request (Sent to contact) [finnish]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(813,'purchase_order','purchase-quotation-to-contact','finnish','Purchase Quotation (Sent to contact) [finnish]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(814,'purchase_order','debit-note-to-contact','finnish','Debit Note (Sent to contact) [finnish]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(815,'purchase_order','purchase-statement-to-contact','finnish','Purchase Statement (Sent to contact) [finnish]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(816,'purchase_order','vendor-registration-confirmed','finnish','Vendor Registration Confirmed [finnish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(817,'purchase_order','purchase-contract-to-contact','finnish','Purchase Contract (Sent to contact) [finnish]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(818,'purchase_order','new-contact-created','finnish','New Contact Added/Registered (Welcome Email) [finnish]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(819,'purchase_order','purchase-request-approval','finnish','Request approval [finnish]','Request approval','','{companyname} | CRM',NULL,0,1,0),(820,'purchase_order','purchase-send-approved','finnish','Email send approved [finnish]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(821,'purchase_order','purchase-send-rejected','finnish','Email send rejected [finnish]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(822,'change_candidate_status','change-candidate-status-to-candidate','finnish','Change Candidate Status (Sent to Candidate) [finnish]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(823,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','finnish','Change Candidate Job Applied Status (Sent to Candidate) [finnish]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(824,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','finnish','Change Candidate Interview Schedule Status (Sent to Candidate) [finnish]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(825,'new_candidate_have_applied','new-candidate-have-applied','finnish','New candidate have applied (Sent to Responsible) [finnish]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(826,'staff','flexibackup-new-backup-to-staff','finnish','Flexi Backup Notification [finnish]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(827,'client','new-client-created','french','New Contact Added/Registered (Welcome Email) [french]','Welcome aboard','','DOT One Business Solution','',0,1,0),(828,'invoice','invoice-send-to-client','french','Send Invoice to Customer [french]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(829,'ticket','new-ticket-opened-admin','french','New Ticket Opened (Opened by Staff, Sent to Customer) [french]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(830,'ticket','ticket-reply','french','Ticket Reply (Sent to Customer) [french]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(831,'ticket','ticket-autoresponse','french','New Ticket Opened - Autoresponse [french]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(832,'invoice','invoice-payment-recorded','french','Invoice Payment Recorded (Sent to Customer) [french]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(833,'invoice','invoice-overdue-notice','french','Invoice Overdue Notice [french]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(834,'invoice','invoice-already-send','french','Invoice Already Sent to Customer [french]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(835,'ticket','new-ticket-created-staff','french','New Ticket Created (Opened by Customer, Sent to Staff Members) [french]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(836,'estimate','estimate-send-to-client','french','Send Estimate to Customer [french]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(837,'ticket','ticket-reply-to-admin','french','Ticket Reply (Sent to Staff) [french]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(838,'estimate','estimate-already-send','french','Estimate Already Sent to Customer [french]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(839,'contract','contract-expiration','french','Contract Expiration Reminder (Sent to Customer Contacts) [french]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(840,'tasks','task-assigned','french','New Task Assigned (Sent to Staff) [french]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(841,'tasks','task-added-as-follower','french','Staff Member Added as Follower on Task (Sent to Staff) [french]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(842,'tasks','task-commented','french','New Comment on Task (Sent to Staff) [french]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(843,'tasks','task-added-attachment','french','New Attachment(s) on Task (Sent to Staff) [french]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(844,'estimate','estimate-declined-to-staff','french','Estimate Declined (Sent to Staff) [french]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(845,'estimate','estimate-accepted-to-staff','french','Estimate Accepted (Sent to Staff) [french]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(846,'proposals','proposal-client-accepted','french','Customer Action - Accepted (Sent to Staff) [french]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(847,'proposals','proposal-send-to-customer','french','Send Proposal to Customer [french]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(848,'proposals','proposal-client-declined','french','Customer Action - Declined (Sent to Staff) [french]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(849,'proposals','proposal-client-thank-you','french','Thank You Email (Sent to Customer After Accept) [french]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(850,'proposals','proposal-comment-to-client','french','New Comment Â (Sent to Customer/Lead) [french]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(851,'proposals','proposal-comment-to-admin','french','New Comment (Sent to Staff)  [french]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(852,'estimate','estimate-thank-you-to-customer','french','Thank You Email (Sent to Customer After Accept) [french]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(853,'tasks','task-deadline-notification','french','Task Deadline Reminder - Sent to Assigned Members [french]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(854,'contract','send-contract','french','Send Contract to Customer [french]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(855,'invoice','invoice-payment-recorded-to-staff','french','Invoice Payment Recorded (Sent to Staff) [french]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(856,'ticket','auto-close-ticket','french','Auto Close Ticket [french]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(857,'project','new-project-discussion-created-to-staff','french','New Project Discussion (Sent to Project Members) [french]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(858,'project','new-project-discussion-created-to-customer','french','New Project Discussion (Sent to Customer Contacts) [french]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(859,'project','new-project-file-uploaded-to-customer','french','New Project File(s) Uploaded (Sent to Customer Contacts) [french]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(860,'project','new-project-file-uploaded-to-staff','french','New Project File(s) Uploaded (Sent to Project Members) [french]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(861,'project','new-project-discussion-comment-to-customer','french','New Discussion Comment  (Sent to Customer Contacts) [french]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(862,'project','new-project-discussion-comment-to-staff','french','New Discussion Comment (Sent to Project Members) [french]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(863,'project','staff-added-as-project-member','french','Staff Added as Project Member [french]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(864,'estimate','estimate-expiry-reminder','french','Estimate Expiration Reminder [french]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(865,'proposals','proposal-expiry-reminder','french','Proposal Expiration Reminder [french]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(866,'staff','new-staff-created','french','New Staff Created (Welcome Email) [french]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(867,'client','contact-forgot-password','french','Forgot Password [french]','Create New Password','','DOT One Business Solution','',0,1,0),(868,'client','contact-password-reseted','french','Password Reset - Confirmation [french]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(869,'client','contact-set-password','french','Set New Password [french]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(870,'staff','staff-forgot-password','french','Forgot Password [french]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(871,'staff','staff-password-reseted','french','Password Reset - Confirmation [french]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(872,'project','assigned-to-project','french','New Project Created (Sent to Customer Contacts) [french]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(873,'tasks','task-added-attachment-to-contacts','french','New Attachment(s) on Task (Sent to Customer Contacts) [french]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(874,'tasks','task-commented-to-contacts','french','New Comment on Task (Sent to Customer Contacts) [french]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(875,'leads','new-lead-assigned','french','New Lead Assigned to Staff Member [french]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(876,'client','client-statement','french','Statement - Account Summary [french]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(877,'ticket','ticket-assigned-to-admin','french','New Ticket Assigned (Sent to Staff) [french]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(878,'client','new-client-registered-to-admin','french','New Customer Registration (Sent to admins) [french]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(879,'leads','new-web-to-lead-form-submitted','french','Web to lead form submitted - Sent to lead [french]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(880,'staff','two-factor-authentication','french','Two Factor Authentication [french]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(881,'project','project-finished-to-customer','french','Project Marked as Finished (Sent to Customer Contacts) [french]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(882,'credit_note','credit-note-send-to-client','french','Send Credit Note To Email [french]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(883,'tasks','task-status-change-to-staff','french','Task Status Changed (Sent to Staff) [french]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(884,'tasks','task-status-change-to-contacts','french','Task Status Changed (Sent to Customer Contacts) [french]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(885,'staff','reminder-email-staff','french','Staff Reminder Email [french]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(886,'contract','contract-comment-to-client','french','New Comment Â (Sent to Customer Contacts) [french]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(887,'contract','contract-comment-to-admin','french','New Comment (Sent to Staff)  [french]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(888,'subscriptions','send-subscription','french','Send Subscription to Customer [french]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(889,'subscriptions','subscription-payment-failed','french','Subscription Payment Failed [french]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(890,'subscriptions','subscription-canceled','french','Subscription Canceled (Sent to customer primary contact) [french]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(891,'subscriptions','subscription-payment-succeeded','french','Subscription Payment Succeeded (Sent to customer primary contact) [french]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(892,'contract','contract-expiration-to-staff','french','Contract Expiration Reminder (Sent to Staff) [french]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(893,'gdpr','gdpr-removal-request','french','Removal Request From Contact (Sent to administrators) [french]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(894,'gdpr','gdpr-removal-request-lead','french','Removal Request From Lead (Sent to administrators) [french]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(895,'client','client-registration-confirmed','french','Customer Registration Confirmed [french]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(896,'contract','contract-signed-to-staff','french','Contract Signed (Sent to Staff) [french]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(897,'subscriptions','customer-subscribed-to-staff','french','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [french]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(898,'client','contact-verification-email','french','Email Verification (Sent to Contact After Registration) [french]','Verify Email Address','','{companyname}','',0,1,0),(899,'client','new-customer-profile-file-uploaded-to-staff','french','New Customer Profile File(s) Uploaded (Sent to Staff) [french]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(900,'staff','event-notification-to-staff','french','Event Notification (Calendar) [french]','Upcoming Event - {event_title}','','',NULL,0,1,0),(901,'subscriptions','subscription-payment-requires-action','french','Credit Card Authorization Required - SCA [french]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(902,'invoice','invoice-due-notice','french','Invoice Due Notice [french]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(903,'estimate_request','estimate-request-submitted-to-staff','french','Estimate Request Submitted (Sent to Staff) [french]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(904,'estimate_request','estimate-request-assigned','french','Estimate Request Assigned (Sent to Staff) [french]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(905,'estimate_request','estimate-request-received-to-user','french','Estimate Request Received (Sent to User) [french]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(906,'notifications','non-billed-tasks-reminder','french','Non-billed tasks reminder (sent to selected staff members) [french]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(907,'invoice','invoices-batch-payments','french','Invoices Payments Recorded in Batch (Sent to Customer) [french]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(908,'contract','contract-sign-reminder','french','Contract Sign Reminder (Sent to Customer) [french]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(909,'timesheets_attendance_mgt','attendance_notice','french','Attendance notice [french]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(910,'timesheets_attendance_mgt','send_request_approval','french','Send request approval [french]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(911,'timesheets_attendance_mgt','remind_user_check_in','french','Remind user check in [french]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(912,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','french','New application (Send to notification recipient) [french]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(913,'client','affiliate_management_payout_updated','french','Affiliate Payout Request Update [french]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(914,'client','affiliate_management_signup_through_affiliate_link','french','Successful Signup through Affiliate Link [french]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(915,'client','affiliate_management_successful_referral_commission','french','Successful Referral Commission Notification [french]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(916,'staff','affiliate_management_new_payout_request_for_admin','french','Affiliate Payout Request [french]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(917,'staff','affiliate_management_payout_updated_for_admin','french','Affiliate Payout Request Updated [french]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(918,'staff','affiliate_management_new_affiliate_signup_for_admin','french','New Affiliate Signup [french]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(919,'client','affiliate_management_referral_commission_reversal','french','Referral Commission Reversal Notification [french]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(920,'inventory_warning','inventory-warning-to-staff','french','Inventory warning (Sent to staff) [french]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(929,'purchase_order','purchase-order-to-contact','french','Purchase Order (Sent to contact) [french]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(930,'purchase_order','purchase-request-to-contact','french','Purchase Request (Sent to contact) [french]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(931,'purchase_order','purchase-quotation-to-contact','french','Purchase Quotation (Sent to contact) [french]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(932,'purchase_order','debit-note-to-contact','french','Debit Note (Sent to contact) [french]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(933,'purchase_order','purchase-statement-to-contact','french','Purchase Statement (Sent to contact) [french]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(934,'purchase_order','vendor-registration-confirmed','french','Vendor Registration Confirmed [french]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(935,'purchase_order','purchase-contract-to-contact','french','Purchase Contract (Sent to contact) [french]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(936,'purchase_order','new-contact-created','french','New Contact Added/Registered (Welcome Email) [french]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(937,'purchase_order','purchase-request-approval','french','Request approval [french]','Request approval','','{companyname} | CRM',NULL,0,1,0),(938,'purchase_order','purchase-send-approved','french','Email send approved [french]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(939,'purchase_order','purchase-send-rejected','french','Email send rejected [french]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(940,'change_candidate_status','change-candidate-status-to-candidate','french','Change Candidate Status (Sent to Candidate) [french]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(941,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','french','Change Candidate Job Applied Status (Sent to Candidate) [french]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(942,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','french','Change Candidate Interview Schedule Status (Sent to Candidate) [french]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(943,'new_candidate_have_applied','new-candidate-have-applied','french','New candidate have applied (Sent to Responsible) [french]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(944,'staff','flexibackup-new-backup-to-staff','french','Flexi Backup Notification [french]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(945,'client','new-client-created','german','New Contact Added/Registered (Welcome Email) [german]','Welcome aboard','','DOT One Business Solution','',0,1,0),(946,'invoice','invoice-send-to-client','german','Send Invoice to Customer [german]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(947,'ticket','new-ticket-opened-admin','german','New Ticket Opened (Opened by Staff, Sent to Customer) [german]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(948,'ticket','ticket-reply','german','Ticket Reply (Sent to Customer) [german]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(949,'ticket','ticket-autoresponse','german','New Ticket Opened - Autoresponse [german]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(950,'invoice','invoice-payment-recorded','german','Invoice Payment Recorded (Sent to Customer) [german]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(951,'invoice','invoice-overdue-notice','german','Invoice Overdue Notice [german]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(952,'invoice','invoice-already-send','german','Invoice Already Sent to Customer [german]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(953,'ticket','new-ticket-created-staff','german','New Ticket Created (Opened by Customer, Sent to Staff Members) [german]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(954,'estimate','estimate-send-to-client','german','Send Estimate to Customer [german]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(955,'ticket','ticket-reply-to-admin','german','Ticket Reply (Sent to Staff) [german]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(956,'estimate','estimate-already-send','german','Estimate Already Sent to Customer [german]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(957,'contract','contract-expiration','german','Contract Expiration Reminder (Sent to Customer Contacts) [german]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(958,'tasks','task-assigned','german','New Task Assigned (Sent to Staff) [german]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(959,'tasks','task-added-as-follower','german','Staff Member Added as Follower on Task (Sent to Staff) [german]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(960,'tasks','task-commented','german','New Comment on Task (Sent to Staff) [german]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(961,'tasks','task-added-attachment','german','New Attachment(s) on Task (Sent to Staff) [german]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(962,'estimate','estimate-declined-to-staff','german','Estimate Declined (Sent to Staff) [german]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(963,'estimate','estimate-accepted-to-staff','german','Estimate Accepted (Sent to Staff) [german]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(964,'proposals','proposal-client-accepted','german','Customer Action - Accepted (Sent to Staff) [german]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(965,'proposals','proposal-send-to-customer','german','Send Proposal to Customer [german]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(966,'proposals','proposal-client-declined','german','Customer Action - Declined (Sent to Staff) [german]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(967,'proposals','proposal-client-thank-you','german','Thank You Email (Sent to Customer After Accept) [german]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(968,'proposals','proposal-comment-to-client','german','New Comment Â (Sent to Customer/Lead) [german]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(969,'proposals','proposal-comment-to-admin','german','New Comment (Sent to Staff)  [german]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(970,'estimate','estimate-thank-you-to-customer','german','Thank You Email (Sent to Customer After Accept) [german]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(971,'tasks','task-deadline-notification','german','Task Deadline Reminder - Sent to Assigned Members [german]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(972,'contract','send-contract','german','Send Contract to Customer [german]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(973,'invoice','invoice-payment-recorded-to-staff','german','Invoice Payment Recorded (Sent to Staff) [german]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(974,'ticket','auto-close-ticket','german','Auto Close Ticket [german]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(975,'project','new-project-discussion-created-to-staff','german','New Project Discussion (Sent to Project Members) [german]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(976,'project','new-project-discussion-created-to-customer','german','New Project Discussion (Sent to Customer Contacts) [german]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(977,'project','new-project-file-uploaded-to-customer','german','New Project File(s) Uploaded (Sent to Customer Contacts) [german]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(978,'project','new-project-file-uploaded-to-staff','german','New Project File(s) Uploaded (Sent to Project Members) [german]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(979,'project','new-project-discussion-comment-to-customer','german','New Discussion Comment  (Sent to Customer Contacts) [german]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(980,'project','new-project-discussion-comment-to-staff','german','New Discussion Comment (Sent to Project Members) [german]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(981,'project','staff-added-as-project-member','german','Staff Added as Project Member [german]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(982,'estimate','estimate-expiry-reminder','german','Estimate Expiration Reminder [german]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(983,'proposals','proposal-expiry-reminder','german','Proposal Expiration Reminder [german]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(984,'staff','new-staff-created','german','New Staff Created (Welcome Email) [german]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(985,'client','contact-forgot-password','german','Forgot Password [german]','Create New Password','','DOT One Business Solution','',0,1,0),(986,'client','contact-password-reseted','german','Password Reset - Confirmation [german]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(987,'client','contact-set-password','german','Set New Password [german]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(988,'staff','staff-forgot-password','german','Forgot Password [german]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(989,'staff','staff-password-reseted','german','Password Reset - Confirmation [german]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(990,'project','assigned-to-project','german','New Project Created (Sent to Customer Contacts) [german]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(991,'tasks','task-added-attachment-to-contacts','german','New Attachment(s) on Task (Sent to Customer Contacts) [german]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(992,'tasks','task-commented-to-contacts','german','New Comment on Task (Sent to Customer Contacts) [german]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(993,'leads','new-lead-assigned','german','New Lead Assigned to Staff Member [german]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(994,'client','client-statement','german','Statement - Account Summary [german]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(995,'ticket','ticket-assigned-to-admin','german','New Ticket Assigned (Sent to Staff) [german]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(996,'client','new-client-registered-to-admin','german','New Customer Registration (Sent to admins) [german]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(997,'leads','new-web-to-lead-form-submitted','german','Web to lead form submitted - Sent to lead [german]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(998,'staff','two-factor-authentication','german','Two Factor Authentication [german]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(999,'project','project-finished-to-customer','german','Project Marked as Finished (Sent to Customer Contacts) [german]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1000,'credit_note','credit-note-send-to-client','german','Send Credit Note To Email [german]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1001,'tasks','task-status-change-to-staff','german','Task Status Changed (Sent to Staff) [german]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1002,'tasks','task-status-change-to-contacts','german','Task Status Changed (Sent to Customer Contacts) [german]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1003,'staff','reminder-email-staff','german','Staff Reminder Email [german]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1004,'contract','contract-comment-to-client','german','New Comment Â (Sent to Customer Contacts) [german]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1005,'contract','contract-comment-to-admin','german','New Comment (Sent to Staff)  [german]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1006,'subscriptions','send-subscription','german','Send Subscription to Customer [german]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1007,'subscriptions','subscription-payment-failed','german','Subscription Payment Failed [german]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1008,'subscriptions','subscription-canceled','german','Subscription Canceled (Sent to customer primary contact) [german]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1009,'subscriptions','subscription-payment-succeeded','german','Subscription Payment Succeeded (Sent to customer primary contact) [german]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1010,'contract','contract-expiration-to-staff','german','Contract Expiration Reminder (Sent to Staff) [german]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1011,'gdpr','gdpr-removal-request','german','Removal Request From Contact (Sent to administrators) [german]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1012,'gdpr','gdpr-removal-request-lead','german','Removal Request From Lead (Sent to administrators) [german]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1013,'client','client-registration-confirmed','german','Customer Registration Confirmed [german]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1014,'contract','contract-signed-to-staff','german','Contract Signed (Sent to Staff) [german]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1015,'subscriptions','customer-subscribed-to-staff','german','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [german]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1016,'client','contact-verification-email','german','Email Verification (Sent to Contact After Registration) [german]','Verify Email Address','','{companyname}','',0,1,0),(1017,'client','new-customer-profile-file-uploaded-to-staff','german','New Customer Profile File(s) Uploaded (Sent to Staff) [german]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1018,'staff','event-notification-to-staff','german','Event Notification (Calendar) [german]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1019,'subscriptions','subscription-payment-requires-action','german','Credit Card Authorization Required - SCA [german]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1020,'invoice','invoice-due-notice','german','Invoice Due Notice [german]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1021,'estimate_request','estimate-request-submitted-to-staff','german','Estimate Request Submitted (Sent to Staff) [german]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1022,'estimate_request','estimate-request-assigned','german','Estimate Request Assigned (Sent to Staff) [german]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1023,'estimate_request','estimate-request-received-to-user','german','Estimate Request Received (Sent to User) [german]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1024,'notifications','non-billed-tasks-reminder','german','Non-billed tasks reminder (sent to selected staff members) [german]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1025,'invoice','invoices-batch-payments','german','Invoices Payments Recorded in Batch (Sent to Customer) [german]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1026,'contract','contract-sign-reminder','german','Contract Sign Reminder (Sent to Customer) [german]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1027,'timesheets_attendance_mgt','attendance_notice','german','Attendance notice [german]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1028,'timesheets_attendance_mgt','send_request_approval','german','Send request approval [german]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1029,'timesheets_attendance_mgt','remind_user_check_in','german','Remind user check in [german]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1030,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','german','New application (Send to notification recipient) [german]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1031,'client','affiliate_management_payout_updated','german','Affiliate Payout Request Update [german]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1032,'client','affiliate_management_signup_through_affiliate_link','german','Successful Signup through Affiliate Link [german]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1033,'client','affiliate_management_successful_referral_commission','german','Successful Referral Commission Notification [german]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1034,'staff','affiliate_management_new_payout_request_for_admin','german','Affiliate Payout Request [german]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1035,'staff','affiliate_management_payout_updated_for_admin','german','Affiliate Payout Request Updated [german]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1036,'staff','affiliate_management_new_affiliate_signup_for_admin','german','New Affiliate Signup [german]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1037,'client','affiliate_management_referral_commission_reversal','german','Referral Commission Reversal Notification [german]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1038,'inventory_warning','inventory-warning-to-staff','german','Inventory warning (Sent to staff) [german]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1047,'purchase_order','purchase-order-to-contact','german','Purchase Order (Sent to contact) [german]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1048,'purchase_order','purchase-request-to-contact','german','Purchase Request (Sent to contact) [german]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1049,'purchase_order','purchase-quotation-to-contact','german','Purchase Quotation (Sent to contact) [german]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1050,'purchase_order','debit-note-to-contact','german','Debit Note (Sent to contact) [german]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1051,'purchase_order','purchase-statement-to-contact','german','Purchase Statement (Sent to contact) [german]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1052,'purchase_order','vendor-registration-confirmed','german','Vendor Registration Confirmed [german]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1053,'purchase_order','purchase-contract-to-contact','german','Purchase Contract (Sent to contact) [german]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1054,'purchase_order','new-contact-created','german','New Contact Added/Registered (Welcome Email) [german]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1055,'purchase_order','purchase-request-approval','german','Request approval [german]','Request approval','','{companyname} | CRM',NULL,0,1,0),(1056,'purchase_order','purchase-send-approved','german','Email send approved [german]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(1057,'purchase_order','purchase-send-rejected','german','Email send rejected [german]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(1058,'change_candidate_status','change-candidate-status-to-candidate','german','Change Candidate Status (Sent to Candidate) [german]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(1059,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','german','Change Candidate Job Applied Status (Sent to Candidate) [german]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(1060,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','german','Change Candidate Interview Schedule Status (Sent to Candidate) [german]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(1061,'new_candidate_have_applied','new-candidate-have-applied','german','New candidate have applied (Sent to Responsible) [german]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(1062,'staff','flexibackup-new-backup-to-staff','german','Flexi Backup Notification [german]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(1063,'client','new-client-created','greek','New Contact Added/Registered (Welcome Email) [greek]','Welcome aboard','','DOT One Business Solution','',0,1,0),(1064,'invoice','invoice-send-to-client','greek','Send Invoice to Customer [greek]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(1065,'ticket','new-ticket-opened-admin','greek','New Ticket Opened (Opened by Staff, Sent to Customer) [greek]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1066,'ticket','ticket-reply','greek','Ticket Reply (Sent to Customer) [greek]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1067,'ticket','ticket-autoresponse','greek','New Ticket Opened - Autoresponse [greek]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1068,'invoice','invoice-payment-recorded','greek','Invoice Payment Recorded (Sent to Customer) [greek]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(1069,'invoice','invoice-overdue-notice','greek','Invoice Overdue Notice [greek]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(1070,'invoice','invoice-already-send','greek','Invoice Already Sent to Customer [greek]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(1071,'ticket','new-ticket-created-staff','greek','New Ticket Created (Opened by Customer, Sent to Staff Members) [greek]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(1072,'estimate','estimate-send-to-client','greek','Send Estimate to Customer [greek]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(1073,'ticket','ticket-reply-to-admin','greek','Ticket Reply (Sent to Staff) [greek]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1074,'estimate','estimate-already-send','greek','Estimate Already Sent to Customer [greek]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(1075,'contract','contract-expiration','greek','Contract Expiration Reminder (Sent to Customer Contacts) [greek]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1076,'tasks','task-assigned','greek','New Task Assigned (Sent to Staff) [greek]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1077,'tasks','task-added-as-follower','greek','Staff Member Added as Follower on Task (Sent to Staff) [greek]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1078,'tasks','task-commented','greek','New Comment on Task (Sent to Staff) [greek]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1079,'tasks','task-added-attachment','greek','New Attachment(s) on Task (Sent to Staff) [greek]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1080,'estimate','estimate-declined-to-staff','greek','Estimate Declined (Sent to Staff) [greek]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(1081,'estimate','estimate-accepted-to-staff','greek','Estimate Accepted (Sent to Staff) [greek]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(1082,'proposals','proposal-client-accepted','greek','Customer Action - Accepted (Sent to Staff) [greek]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(1083,'proposals','proposal-send-to-customer','greek','Send Proposal to Customer [greek]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(1084,'proposals','proposal-client-declined','greek','Customer Action - Declined (Sent to Staff) [greek]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(1085,'proposals','proposal-client-thank-you','greek','Thank You Email (Sent to Customer After Accept) [greek]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(1086,'proposals','proposal-comment-to-client','greek','New Comment Â (Sent to Customer/Lead) [greek]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1087,'proposals','proposal-comment-to-admin','greek','New Comment (Sent to Staff)  [greek]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1088,'estimate','estimate-thank-you-to-customer','greek','Thank You Email (Sent to Customer After Accept) [greek]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(1089,'tasks','task-deadline-notification','greek','Task Deadline Reminder - Sent to Assigned Members [greek]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(1090,'contract','send-contract','greek','Send Contract to Customer [greek]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(1091,'invoice','invoice-payment-recorded-to-staff','greek','Invoice Payment Recorded (Sent to Staff) [greek]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(1092,'ticket','auto-close-ticket','greek','Auto Close Ticket [greek]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(1093,'project','new-project-discussion-created-to-staff','greek','New Project Discussion (Sent to Project Members) [greek]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1094,'project','new-project-discussion-created-to-customer','greek','New Project Discussion (Sent to Customer Contacts) [greek]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1095,'project','new-project-file-uploaded-to-customer','greek','New Project File(s) Uploaded (Sent to Customer Contacts) [greek]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1096,'project','new-project-file-uploaded-to-staff','greek','New Project File(s) Uploaded (Sent to Project Members) [greek]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1097,'project','new-project-discussion-comment-to-customer','greek','New Discussion Comment  (Sent to Customer Contacts) [greek]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1098,'project','new-project-discussion-comment-to-staff','greek','New Discussion Comment (Sent to Project Members) [greek]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1099,'project','staff-added-as-project-member','greek','Staff Added as Project Member [greek]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(1100,'estimate','estimate-expiry-reminder','greek','Estimate Expiration Reminder [greek]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1101,'proposals','proposal-expiry-reminder','greek','Proposal Expiration Reminder [greek]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1102,'staff','new-staff-created','greek','New Staff Created (Welcome Email) [greek]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(1103,'client','contact-forgot-password','greek','Forgot Password [greek]','Create New Password','','DOT One Business Solution','',0,1,0),(1104,'client','contact-password-reseted','greek','Password Reset - Confirmation [greek]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1105,'client','contact-set-password','greek','Set New Password [greek]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(1106,'staff','staff-forgot-password','greek','Forgot Password [greek]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(1107,'staff','staff-password-reseted','greek','Password Reset - Confirmation [greek]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1108,'project','assigned-to-project','greek','New Project Created (Sent to Customer Contacts) [greek]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(1109,'tasks','task-added-attachment-to-contacts','greek','New Attachment(s) on Task (Sent to Customer Contacts) [greek]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1110,'tasks','task-commented-to-contacts','greek','New Comment on Task (Sent to Customer Contacts) [greek]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1111,'leads','new-lead-assigned','greek','New Lead Assigned to Staff Member [greek]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(1112,'client','client-statement','greek','Statement - Account Summary [greek]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(1113,'ticket','ticket-assigned-to-admin','greek','New Ticket Assigned (Sent to Staff) [greek]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(1114,'client','new-client-registered-to-admin','greek','New Customer Registration (Sent to admins) [greek]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(1115,'leads','new-web-to-lead-form-submitted','greek','Web to lead form submitted - Sent to lead [greek]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(1116,'staff','two-factor-authentication','greek','Two Factor Authentication [greek]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(1117,'project','project-finished-to-customer','greek','Project Marked as Finished (Sent to Customer Contacts) [greek]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1118,'credit_note','credit-note-send-to-client','greek','Send Credit Note To Email [greek]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1119,'tasks','task-status-change-to-staff','greek','Task Status Changed (Sent to Staff) [greek]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1120,'tasks','task-status-change-to-contacts','greek','Task Status Changed (Sent to Customer Contacts) [greek]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1121,'staff','reminder-email-staff','greek','Staff Reminder Email [greek]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1122,'contract','contract-comment-to-client','greek','New Comment Â (Sent to Customer Contacts) [greek]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1123,'contract','contract-comment-to-admin','greek','New Comment (Sent to Staff)  [greek]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1124,'subscriptions','send-subscription','greek','Send Subscription to Customer [greek]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1125,'subscriptions','subscription-payment-failed','greek','Subscription Payment Failed [greek]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1126,'subscriptions','subscription-canceled','greek','Subscription Canceled (Sent to customer primary contact) [greek]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1127,'subscriptions','subscription-payment-succeeded','greek','Subscription Payment Succeeded (Sent to customer primary contact) [greek]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1128,'contract','contract-expiration-to-staff','greek','Contract Expiration Reminder (Sent to Staff) [greek]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1129,'gdpr','gdpr-removal-request','greek','Removal Request From Contact (Sent to administrators) [greek]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1130,'gdpr','gdpr-removal-request-lead','greek','Removal Request From Lead (Sent to administrators) [greek]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1131,'client','client-registration-confirmed','greek','Customer Registration Confirmed [greek]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1132,'contract','contract-signed-to-staff','greek','Contract Signed (Sent to Staff) [greek]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1133,'subscriptions','customer-subscribed-to-staff','greek','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [greek]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1134,'client','contact-verification-email','greek','Email Verification (Sent to Contact After Registration) [greek]','Verify Email Address','','{companyname}','',0,1,0),(1135,'client','new-customer-profile-file-uploaded-to-staff','greek','New Customer Profile File(s) Uploaded (Sent to Staff) [greek]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1136,'staff','event-notification-to-staff','greek','Event Notification (Calendar) [greek]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1137,'subscriptions','subscription-payment-requires-action','greek','Credit Card Authorization Required - SCA [greek]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1138,'invoice','invoice-due-notice','greek','Invoice Due Notice [greek]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1139,'estimate_request','estimate-request-submitted-to-staff','greek','Estimate Request Submitted (Sent to Staff) [greek]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1140,'estimate_request','estimate-request-assigned','greek','Estimate Request Assigned (Sent to Staff) [greek]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1141,'estimate_request','estimate-request-received-to-user','greek','Estimate Request Received (Sent to User) [greek]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1142,'notifications','non-billed-tasks-reminder','greek','Non-billed tasks reminder (sent to selected staff members) [greek]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1143,'invoice','invoices-batch-payments','greek','Invoices Payments Recorded in Batch (Sent to Customer) [greek]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1144,'contract','contract-sign-reminder','greek','Contract Sign Reminder (Sent to Customer) [greek]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1145,'timesheets_attendance_mgt','attendance_notice','greek','Attendance notice [greek]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1146,'timesheets_attendance_mgt','send_request_approval','greek','Send request approval [greek]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1147,'timesheets_attendance_mgt','remind_user_check_in','greek','Remind user check in [greek]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1148,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','greek','New application (Send to notification recipient) [greek]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1149,'client','affiliate_management_payout_updated','greek','Affiliate Payout Request Update [greek]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1150,'client','affiliate_management_signup_through_affiliate_link','greek','Successful Signup through Affiliate Link [greek]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1151,'client','affiliate_management_successful_referral_commission','greek','Successful Referral Commission Notification [greek]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1152,'staff','affiliate_management_new_payout_request_for_admin','greek','Affiliate Payout Request [greek]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1153,'staff','affiliate_management_payout_updated_for_admin','greek','Affiliate Payout Request Updated [greek]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1154,'staff','affiliate_management_new_affiliate_signup_for_admin','greek','New Affiliate Signup [greek]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1155,'client','affiliate_management_referral_commission_reversal','greek','Referral Commission Reversal Notification [greek]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1156,'inventory_warning','inventory-warning-to-staff','greek','Inventory warning (Sent to staff) [greek]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1165,'purchase_order','purchase-order-to-contact','greek','Purchase Order (Sent to contact) [greek]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1166,'purchase_order','purchase-request-to-contact','greek','Purchase Request (Sent to contact) [greek]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1167,'purchase_order','purchase-quotation-to-contact','greek','Purchase Quotation (Sent to contact) [greek]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1168,'purchase_order','debit-note-to-contact','greek','Debit Note (Sent to contact) [greek]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1169,'purchase_order','purchase-statement-to-contact','greek','Purchase Statement (Sent to contact) [greek]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1170,'purchase_order','vendor-registration-confirmed','greek','Vendor Registration Confirmed [greek]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1171,'purchase_order','purchase-contract-to-contact','greek','Purchase Contract (Sent to contact) [greek]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1172,'purchase_order','new-contact-created','greek','New Contact Added/Registered (Welcome Email) [greek]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1173,'purchase_order','purchase-request-approval','greek','Request approval [greek]','Request approval','','{companyname} | CRM',NULL,0,1,0),(1174,'purchase_order','purchase-send-approved','greek','Email send approved [greek]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(1175,'purchase_order','purchase-send-rejected','greek','Email send rejected [greek]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(1176,'change_candidate_status','change-candidate-status-to-candidate','greek','Change Candidate Status (Sent to Candidate) [greek]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(1177,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','greek','Change Candidate Job Applied Status (Sent to Candidate) [greek]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(1178,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','greek','Change Candidate Interview Schedule Status (Sent to Candidate) [greek]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(1179,'new_candidate_have_applied','new-candidate-have-applied','greek','New candidate have applied (Sent to Responsible) [greek]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(1180,'staff','flexibackup-new-backup-to-staff','greek','Flexi Backup Notification [greek]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(1181,'client','new-client-created','indonesia','New Contact Added/Registered (Welcome Email) [indonesia]','Welcome aboard','','DOT One Business Solution','',0,1,0),(1182,'invoice','invoice-send-to-client','indonesia','Send Invoice to Customer [indonesia]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(1183,'ticket','new-ticket-opened-admin','indonesia','New Ticket Opened (Opened by Staff, Sent to Customer) [indonesia]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1184,'ticket','ticket-reply','indonesia','Ticket Reply (Sent to Customer) [indonesia]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1185,'ticket','ticket-autoresponse','indonesia','New Ticket Opened - Autoresponse [indonesia]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1186,'invoice','invoice-payment-recorded','indonesia','Invoice Payment Recorded (Sent to Customer) [indonesia]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(1187,'invoice','invoice-overdue-notice','indonesia','Invoice Overdue Notice [indonesia]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(1188,'invoice','invoice-already-send','indonesia','Invoice Already Sent to Customer [indonesia]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(1189,'ticket','new-ticket-created-staff','indonesia','New Ticket Created (Opened by Customer, Sent to Staff Members) [indonesia]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(1190,'estimate','estimate-send-to-client','indonesia','Send Estimate to Customer [indonesia]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(1191,'ticket','ticket-reply-to-admin','indonesia','Ticket Reply (Sent to Staff) [indonesia]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1192,'estimate','estimate-already-send','indonesia','Estimate Already Sent to Customer [indonesia]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(1193,'contract','contract-expiration','indonesia','Contract Expiration Reminder (Sent to Customer Contacts) [indonesia]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1194,'tasks','task-assigned','indonesia','New Task Assigned (Sent to Staff) [indonesia]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1195,'tasks','task-added-as-follower','indonesia','Staff Member Added as Follower on Task (Sent to Staff) [indonesia]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1196,'tasks','task-commented','indonesia','New Comment on Task (Sent to Staff) [indonesia]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1197,'tasks','task-added-attachment','indonesia','New Attachment(s) on Task (Sent to Staff) [indonesia]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1198,'estimate','estimate-declined-to-staff','indonesia','Estimate Declined (Sent to Staff) [indonesia]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(1199,'estimate','estimate-accepted-to-staff','indonesia','Estimate Accepted (Sent to Staff) [indonesia]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(1200,'proposals','proposal-client-accepted','indonesia','Customer Action - Accepted (Sent to Staff) [indonesia]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(1201,'proposals','proposal-send-to-customer','indonesia','Send Proposal to Customer [indonesia]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(1202,'proposals','proposal-client-declined','indonesia','Customer Action - Declined (Sent to Staff) [indonesia]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(1203,'proposals','proposal-client-thank-you','indonesia','Thank You Email (Sent to Customer After Accept) [indonesia]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(1204,'proposals','proposal-comment-to-client','indonesia','New Comment Â (Sent to Customer/Lead) [indonesia]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1205,'proposals','proposal-comment-to-admin','indonesia','New Comment (Sent to Staff)  [indonesia]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1206,'estimate','estimate-thank-you-to-customer','indonesia','Thank You Email (Sent to Customer After Accept) [indonesia]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(1207,'tasks','task-deadline-notification','indonesia','Task Deadline Reminder - Sent to Assigned Members [indonesia]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(1208,'contract','send-contract','indonesia','Send Contract to Customer [indonesia]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(1209,'invoice','invoice-payment-recorded-to-staff','indonesia','Invoice Payment Recorded (Sent to Staff) [indonesia]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(1210,'ticket','auto-close-ticket','indonesia','Auto Close Ticket [indonesia]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(1211,'project','new-project-discussion-created-to-staff','indonesia','New Project Discussion (Sent to Project Members) [indonesia]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1212,'project','new-project-discussion-created-to-customer','indonesia','New Project Discussion (Sent to Customer Contacts) [indonesia]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1213,'project','new-project-file-uploaded-to-customer','indonesia','New Project File(s) Uploaded (Sent to Customer Contacts) [indonesia]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1214,'project','new-project-file-uploaded-to-staff','indonesia','New Project File(s) Uploaded (Sent to Project Members) [indonesia]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1215,'project','new-project-discussion-comment-to-customer','indonesia','New Discussion Comment  (Sent to Customer Contacts) [indonesia]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1216,'project','new-project-discussion-comment-to-staff','indonesia','New Discussion Comment (Sent to Project Members) [indonesia]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1217,'project','staff-added-as-project-member','indonesia','Staff Added as Project Member [indonesia]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(1218,'estimate','estimate-expiry-reminder','indonesia','Estimate Expiration Reminder [indonesia]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1219,'proposals','proposal-expiry-reminder','indonesia','Proposal Expiration Reminder [indonesia]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1220,'staff','new-staff-created','indonesia','New Staff Created (Welcome Email) [indonesia]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(1221,'client','contact-forgot-password','indonesia','Forgot Password [indonesia]','Create New Password','','DOT One Business Solution','',0,1,0),(1222,'client','contact-password-reseted','indonesia','Password Reset - Confirmation [indonesia]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1223,'client','contact-set-password','indonesia','Set New Password [indonesia]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(1224,'staff','staff-forgot-password','indonesia','Forgot Password [indonesia]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(1225,'staff','staff-password-reseted','indonesia','Password Reset - Confirmation [indonesia]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1226,'project','assigned-to-project','indonesia','New Project Created (Sent to Customer Contacts) [indonesia]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(1227,'tasks','task-added-attachment-to-contacts','indonesia','New Attachment(s) on Task (Sent to Customer Contacts) [indonesia]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1228,'tasks','task-commented-to-contacts','indonesia','New Comment on Task (Sent to Customer Contacts) [indonesia]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1229,'leads','new-lead-assigned','indonesia','New Lead Assigned to Staff Member [indonesia]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(1230,'client','client-statement','indonesia','Statement - Account Summary [indonesia]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(1231,'ticket','ticket-assigned-to-admin','indonesia','New Ticket Assigned (Sent to Staff) [indonesia]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(1232,'client','new-client-registered-to-admin','indonesia','New Customer Registration (Sent to admins) [indonesia]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(1233,'leads','new-web-to-lead-form-submitted','indonesia','Web to lead form submitted - Sent to lead [indonesia]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(1234,'staff','two-factor-authentication','indonesia','Two Factor Authentication [indonesia]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(1235,'project','project-finished-to-customer','indonesia','Project Marked as Finished (Sent to Customer Contacts) [indonesia]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1236,'credit_note','credit-note-send-to-client','indonesia','Send Credit Note To Email [indonesia]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1237,'tasks','task-status-change-to-staff','indonesia','Task Status Changed (Sent to Staff) [indonesia]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1238,'tasks','task-status-change-to-contacts','indonesia','Task Status Changed (Sent to Customer Contacts) [indonesia]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1239,'staff','reminder-email-staff','indonesia','Staff Reminder Email [indonesia]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1240,'contract','contract-comment-to-client','indonesia','New Comment Â (Sent to Customer Contacts) [indonesia]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1241,'contract','contract-comment-to-admin','indonesia','New Comment (Sent to Staff)  [indonesia]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1242,'subscriptions','send-subscription','indonesia','Send Subscription to Customer [indonesia]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1243,'subscriptions','subscription-payment-failed','indonesia','Subscription Payment Failed [indonesia]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1244,'subscriptions','subscription-canceled','indonesia','Subscription Canceled (Sent to customer primary contact) [indonesia]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1245,'subscriptions','subscription-payment-succeeded','indonesia','Subscription Payment Succeeded (Sent to customer primary contact) [indonesia]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1246,'contract','contract-expiration-to-staff','indonesia','Contract Expiration Reminder (Sent to Staff) [indonesia]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1247,'gdpr','gdpr-removal-request','indonesia','Removal Request From Contact (Sent to administrators) [indonesia]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1248,'gdpr','gdpr-removal-request-lead','indonesia','Removal Request From Lead (Sent to administrators) [indonesia]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1249,'client','client-registration-confirmed','indonesia','Customer Registration Confirmed [indonesia]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1250,'contract','contract-signed-to-staff','indonesia','Contract Signed (Sent to Staff) [indonesia]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1251,'subscriptions','customer-subscribed-to-staff','indonesia','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [indonesia]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1252,'client','contact-verification-email','indonesia','Email Verification (Sent to Contact After Registration) [indonesia]','Verify Email Address','','{companyname}','',0,1,0),(1253,'client','new-customer-profile-file-uploaded-to-staff','indonesia','New Customer Profile File(s) Uploaded (Sent to Staff) [indonesia]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1254,'staff','event-notification-to-staff','indonesia','Event Notification (Calendar) [indonesia]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1255,'subscriptions','subscription-payment-requires-action','indonesia','Credit Card Authorization Required - SCA [indonesia]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1256,'invoice','invoice-due-notice','indonesia','Invoice Due Notice [indonesia]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1257,'estimate_request','estimate-request-submitted-to-staff','indonesia','Estimate Request Submitted (Sent to Staff) [indonesia]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1258,'estimate_request','estimate-request-assigned','indonesia','Estimate Request Assigned (Sent to Staff) [indonesia]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1259,'estimate_request','estimate-request-received-to-user','indonesia','Estimate Request Received (Sent to User) [indonesia]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1260,'notifications','non-billed-tasks-reminder','indonesia','Non-billed tasks reminder (sent to selected staff members) [indonesia]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1261,'invoice','invoices-batch-payments','indonesia','Invoices Payments Recorded in Batch (Sent to Customer) [indonesia]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1262,'contract','contract-sign-reminder','indonesia','Contract Sign Reminder (Sent to Customer) [indonesia]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1263,'timesheets_attendance_mgt','attendance_notice','indonesia','Attendance notice [indonesia]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1264,'timesheets_attendance_mgt','send_request_approval','indonesia','Send request approval [indonesia]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1265,'timesheets_attendance_mgt','remind_user_check_in','indonesia','Remind user check in [indonesia]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1266,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','indonesia','New application (Send to notification recipient) [indonesia]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1267,'client','affiliate_management_payout_updated','indonesia','Affiliate Payout Request Update [indonesia]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1268,'client','affiliate_management_signup_through_affiliate_link','indonesia','Successful Signup through Affiliate Link [indonesia]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1269,'client','affiliate_management_successful_referral_commission','indonesia','Successful Referral Commission Notification [indonesia]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1270,'staff','affiliate_management_new_payout_request_for_admin','indonesia','Affiliate Payout Request [indonesia]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1271,'staff','affiliate_management_payout_updated_for_admin','indonesia','Affiliate Payout Request Updated [indonesia]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1272,'staff','affiliate_management_new_affiliate_signup_for_admin','indonesia','New Affiliate Signup [indonesia]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1273,'client','affiliate_management_referral_commission_reversal','indonesia','Referral Commission Reversal Notification [indonesia]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1274,'inventory_warning','inventory-warning-to-staff','indonesia','Inventory warning (Sent to staff) [indonesia]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1283,'purchase_order','purchase-order-to-contact','indonesia','Purchase Order (Sent to contact) [indonesia]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1284,'purchase_order','purchase-request-to-contact','indonesia','Purchase Request (Sent to contact) [indonesia]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1285,'purchase_order','purchase-quotation-to-contact','indonesia','Purchase Quotation (Sent to contact) [indonesia]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1286,'purchase_order','debit-note-to-contact','indonesia','Debit Note (Sent to contact) [indonesia]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1287,'purchase_order','purchase-statement-to-contact','indonesia','Purchase Statement (Sent to contact) [indonesia]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1288,'purchase_order','vendor-registration-confirmed','indonesia','Vendor Registration Confirmed [indonesia]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1289,'purchase_order','purchase-contract-to-contact','indonesia','Purchase Contract (Sent to contact) [indonesia]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1290,'purchase_order','new-contact-created','indonesia','New Contact Added/Registered (Welcome Email) [indonesia]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1291,'purchase_order','purchase-request-approval','indonesia','Request approval [indonesia]','Request approval','','{companyname} | CRM',NULL,0,1,0),(1292,'purchase_order','purchase-send-approved','indonesia','Email send approved [indonesia]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(1293,'purchase_order','purchase-send-rejected','indonesia','Email send rejected [indonesia]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(1294,'change_candidate_status','change-candidate-status-to-candidate','indonesia','Change Candidate Status (Sent to Candidate) [indonesia]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(1295,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','indonesia','Change Candidate Job Applied Status (Sent to Candidate) [indonesia]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(1296,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','indonesia','Change Candidate Interview Schedule Status (Sent to Candidate) [indonesia]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(1297,'new_candidate_have_applied','new-candidate-have-applied','indonesia','New candidate have applied (Sent to Responsible) [indonesia]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(1298,'staff','flexibackup-new-backup-to-staff','indonesia','Flexi Backup Notification [indonesia]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(1299,'client','new-client-created','italian','New Contact Added/Registered (Welcome Email) [italian]','Welcome aboard','','DOT One Business Solution','',0,1,0),(1300,'invoice','invoice-send-to-client','italian','Send Invoice to Customer [italian]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(1301,'ticket','new-ticket-opened-admin','italian','New Ticket Opened (Opened by Staff, Sent to Customer) [italian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1302,'ticket','ticket-reply','italian','Ticket Reply (Sent to Customer) [italian]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1303,'ticket','ticket-autoresponse','italian','New Ticket Opened - Autoresponse [italian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1304,'invoice','invoice-payment-recorded','italian','Invoice Payment Recorded (Sent to Customer) [italian]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(1305,'invoice','invoice-overdue-notice','italian','Invoice Overdue Notice [italian]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(1306,'invoice','invoice-already-send','italian','Invoice Already Sent to Customer [italian]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(1307,'ticket','new-ticket-created-staff','italian','New Ticket Created (Opened by Customer, Sent to Staff Members) [italian]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(1308,'estimate','estimate-send-to-client','italian','Send Estimate to Customer [italian]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(1309,'ticket','ticket-reply-to-admin','italian','Ticket Reply (Sent to Staff) [italian]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1310,'estimate','estimate-already-send','italian','Estimate Already Sent to Customer [italian]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(1311,'contract','contract-expiration','italian','Contract Expiration Reminder (Sent to Customer Contacts) [italian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1312,'tasks','task-assigned','italian','New Task Assigned (Sent to Staff) [italian]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1313,'tasks','task-added-as-follower','italian','Staff Member Added as Follower on Task (Sent to Staff) [italian]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1314,'tasks','task-commented','italian','New Comment on Task (Sent to Staff) [italian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1315,'tasks','task-added-attachment','italian','New Attachment(s) on Task (Sent to Staff) [italian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1316,'estimate','estimate-declined-to-staff','italian','Estimate Declined (Sent to Staff) [italian]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(1317,'estimate','estimate-accepted-to-staff','italian','Estimate Accepted (Sent to Staff) [italian]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(1318,'proposals','proposal-client-accepted','italian','Customer Action - Accepted (Sent to Staff) [italian]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(1319,'proposals','proposal-send-to-customer','italian','Send Proposal to Customer [italian]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(1320,'proposals','proposal-client-declined','italian','Customer Action - Declined (Sent to Staff) [italian]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(1321,'proposals','proposal-client-thank-you','italian','Thank You Email (Sent to Customer After Accept) [italian]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(1322,'proposals','proposal-comment-to-client','italian','New Comment Â (Sent to Customer/Lead) [italian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1323,'proposals','proposal-comment-to-admin','italian','New Comment (Sent to Staff)  [italian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1324,'estimate','estimate-thank-you-to-customer','italian','Thank You Email (Sent to Customer After Accept) [italian]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(1325,'tasks','task-deadline-notification','italian','Task Deadline Reminder - Sent to Assigned Members [italian]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(1326,'contract','send-contract','italian','Send Contract to Customer [italian]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(1327,'invoice','invoice-payment-recorded-to-staff','italian','Invoice Payment Recorded (Sent to Staff) [italian]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(1328,'ticket','auto-close-ticket','italian','Auto Close Ticket [italian]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(1329,'project','new-project-discussion-created-to-staff','italian','New Project Discussion (Sent to Project Members) [italian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1330,'project','new-project-discussion-created-to-customer','italian','New Project Discussion (Sent to Customer Contacts) [italian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1331,'project','new-project-file-uploaded-to-customer','italian','New Project File(s) Uploaded (Sent to Customer Contacts) [italian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1332,'project','new-project-file-uploaded-to-staff','italian','New Project File(s) Uploaded (Sent to Project Members) [italian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1333,'project','new-project-discussion-comment-to-customer','italian','New Discussion Comment  (Sent to Customer Contacts) [italian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1334,'project','new-project-discussion-comment-to-staff','italian','New Discussion Comment (Sent to Project Members) [italian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1335,'project','staff-added-as-project-member','italian','Staff Added as Project Member [italian]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(1336,'estimate','estimate-expiry-reminder','italian','Estimate Expiration Reminder [italian]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1337,'proposals','proposal-expiry-reminder','italian','Proposal Expiration Reminder [italian]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1338,'staff','new-staff-created','italian','New Staff Created (Welcome Email) [italian]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(1339,'client','contact-forgot-password','italian','Forgot Password [italian]','Create New Password','','DOT One Business Solution','',0,1,0),(1340,'client','contact-password-reseted','italian','Password Reset - Confirmation [italian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1341,'client','contact-set-password','italian','Set New Password [italian]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(1342,'staff','staff-forgot-password','italian','Forgot Password [italian]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(1343,'staff','staff-password-reseted','italian','Password Reset - Confirmation [italian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1344,'project','assigned-to-project','italian','New Project Created (Sent to Customer Contacts) [italian]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(1345,'tasks','task-added-attachment-to-contacts','italian','New Attachment(s) on Task (Sent to Customer Contacts) [italian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1346,'tasks','task-commented-to-contacts','italian','New Comment on Task (Sent to Customer Contacts) [italian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1347,'leads','new-lead-assigned','italian','New Lead Assigned to Staff Member [italian]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(1348,'client','client-statement','italian','Statement - Account Summary [italian]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(1349,'ticket','ticket-assigned-to-admin','italian','New Ticket Assigned (Sent to Staff) [italian]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(1350,'client','new-client-registered-to-admin','italian','New Customer Registration (Sent to admins) [italian]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(1351,'leads','new-web-to-lead-form-submitted','italian','Web to lead form submitted - Sent to lead [italian]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(1352,'staff','two-factor-authentication','italian','Two Factor Authentication [italian]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(1353,'project','project-finished-to-customer','italian','Project Marked as Finished (Sent to Customer Contacts) [italian]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1354,'credit_note','credit-note-send-to-client','italian','Send Credit Note To Email [italian]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1355,'tasks','task-status-change-to-staff','italian','Task Status Changed (Sent to Staff) [italian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1356,'tasks','task-status-change-to-contacts','italian','Task Status Changed (Sent to Customer Contacts) [italian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1357,'staff','reminder-email-staff','italian','Staff Reminder Email [italian]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1358,'contract','contract-comment-to-client','italian','New Comment Â (Sent to Customer Contacts) [italian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1359,'contract','contract-comment-to-admin','italian','New Comment (Sent to Staff)  [italian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1360,'subscriptions','send-subscription','italian','Send Subscription to Customer [italian]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1361,'subscriptions','subscription-payment-failed','italian','Subscription Payment Failed [italian]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1362,'subscriptions','subscription-canceled','italian','Subscription Canceled (Sent to customer primary contact) [italian]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1363,'subscriptions','subscription-payment-succeeded','italian','Subscription Payment Succeeded (Sent to customer primary contact) [italian]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1364,'contract','contract-expiration-to-staff','italian','Contract Expiration Reminder (Sent to Staff) [italian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1365,'gdpr','gdpr-removal-request','italian','Removal Request From Contact (Sent to administrators) [italian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1366,'gdpr','gdpr-removal-request-lead','italian','Removal Request From Lead (Sent to administrators) [italian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1367,'client','client-registration-confirmed','italian','Customer Registration Confirmed [italian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1368,'contract','contract-signed-to-staff','italian','Contract Signed (Sent to Staff) [italian]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1369,'subscriptions','customer-subscribed-to-staff','italian','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [italian]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1370,'client','contact-verification-email','italian','Email Verification (Sent to Contact After Registration) [italian]','Verify Email Address','','{companyname}','',0,1,0),(1371,'client','new-customer-profile-file-uploaded-to-staff','italian','New Customer Profile File(s) Uploaded (Sent to Staff) [italian]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1372,'staff','event-notification-to-staff','italian','Event Notification (Calendar) [italian]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1373,'subscriptions','subscription-payment-requires-action','italian','Credit Card Authorization Required - SCA [italian]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1374,'invoice','invoice-due-notice','italian','Invoice Due Notice [italian]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1375,'estimate_request','estimate-request-submitted-to-staff','italian','Estimate Request Submitted (Sent to Staff) [italian]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1376,'estimate_request','estimate-request-assigned','italian','Estimate Request Assigned (Sent to Staff) [italian]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1377,'estimate_request','estimate-request-received-to-user','italian','Estimate Request Received (Sent to User) [italian]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1378,'notifications','non-billed-tasks-reminder','italian','Non-billed tasks reminder (sent to selected staff members) [italian]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1379,'invoice','invoices-batch-payments','italian','Invoices Payments Recorded in Batch (Sent to Customer) [italian]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1380,'contract','contract-sign-reminder','italian','Contract Sign Reminder (Sent to Customer) [italian]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1381,'timesheets_attendance_mgt','attendance_notice','italian','Attendance notice [italian]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1382,'timesheets_attendance_mgt','send_request_approval','italian','Send request approval [italian]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1383,'timesheets_attendance_mgt','remind_user_check_in','italian','Remind user check in [italian]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1384,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','italian','New application (Send to notification recipient) [italian]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1385,'client','affiliate_management_payout_updated','italian','Affiliate Payout Request Update [italian]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1386,'client','affiliate_management_signup_through_affiliate_link','italian','Successful Signup through Affiliate Link [italian]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1387,'client','affiliate_management_successful_referral_commission','italian','Successful Referral Commission Notification [italian]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1388,'staff','affiliate_management_new_payout_request_for_admin','italian','Affiliate Payout Request [italian]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1389,'staff','affiliate_management_payout_updated_for_admin','italian','Affiliate Payout Request Updated [italian]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1390,'staff','affiliate_management_new_affiliate_signup_for_admin','italian','New Affiliate Signup [italian]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1391,'client','affiliate_management_referral_commission_reversal','italian','Referral Commission Reversal Notification [italian]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1392,'inventory_warning','inventory-warning-to-staff','italian','Inventory warning (Sent to staff) [italian]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1401,'purchase_order','purchase-order-to-contact','italian','Purchase Order (Sent to contact) [italian]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1402,'purchase_order','purchase-request-to-contact','italian','Purchase Request (Sent to contact) [italian]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1403,'purchase_order','purchase-quotation-to-contact','italian','Purchase Quotation (Sent to contact) [italian]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1404,'purchase_order','debit-note-to-contact','italian','Debit Note (Sent to contact) [italian]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1405,'purchase_order','purchase-statement-to-contact','italian','Purchase Statement (Sent to contact) [italian]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1406,'purchase_order','vendor-registration-confirmed','italian','Vendor Registration Confirmed [italian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1407,'purchase_order','purchase-contract-to-contact','italian','Purchase Contract (Sent to contact) [italian]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1408,'purchase_order','new-contact-created','italian','New Contact Added/Registered (Welcome Email) [italian]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1409,'purchase_order','purchase-request-approval','italian','Request approval [italian]','Request approval','','{companyname} | CRM',NULL,0,1,0),(1410,'purchase_order','purchase-send-approved','italian','Email send approved [italian]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(1411,'purchase_order','purchase-send-rejected','italian','Email send rejected [italian]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(1412,'change_candidate_status','change-candidate-status-to-candidate','italian','Change Candidate Status (Sent to Candidate) [italian]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(1413,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','italian','Change Candidate Job Applied Status (Sent to Candidate) [italian]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(1414,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','italian','Change Candidate Interview Schedule Status (Sent to Candidate) [italian]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(1415,'new_candidate_have_applied','new-candidate-have-applied','italian','New candidate have applied (Sent to Responsible) [italian]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(1416,'staff','flexibackup-new-backup-to-staff','italian','Flexi Backup Notification [italian]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(1417,'client','new-client-created','japanese','New Contact Added/Registered (Welcome Email) [japanese]','Welcome aboard','','DOT One Business Solution','',0,1,0),(1418,'invoice','invoice-send-to-client','japanese','Send Invoice to Customer [japanese]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(1419,'ticket','new-ticket-opened-admin','japanese','New Ticket Opened (Opened by Staff, Sent to Customer) [japanese]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1420,'ticket','ticket-reply','japanese','Ticket Reply (Sent to Customer) [japanese]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1421,'ticket','ticket-autoresponse','japanese','New Ticket Opened - Autoresponse [japanese]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1422,'invoice','invoice-payment-recorded','japanese','Invoice Payment Recorded (Sent to Customer) [japanese]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(1423,'invoice','invoice-overdue-notice','japanese','Invoice Overdue Notice [japanese]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(1424,'invoice','invoice-already-send','japanese','Invoice Already Sent to Customer [japanese]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(1425,'ticket','new-ticket-created-staff','japanese','New Ticket Created (Opened by Customer, Sent to Staff Members) [japanese]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(1426,'estimate','estimate-send-to-client','japanese','Send Estimate to Customer [japanese]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(1427,'ticket','ticket-reply-to-admin','japanese','Ticket Reply (Sent to Staff) [japanese]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1428,'estimate','estimate-already-send','japanese','Estimate Already Sent to Customer [japanese]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(1429,'contract','contract-expiration','japanese','Contract Expiration Reminder (Sent to Customer Contacts) [japanese]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1430,'tasks','task-assigned','japanese','New Task Assigned (Sent to Staff) [japanese]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1431,'tasks','task-added-as-follower','japanese','Staff Member Added as Follower on Task (Sent to Staff) [japanese]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1432,'tasks','task-commented','japanese','New Comment on Task (Sent to Staff) [japanese]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1433,'tasks','task-added-attachment','japanese','New Attachment(s) on Task (Sent to Staff) [japanese]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1434,'estimate','estimate-declined-to-staff','japanese','Estimate Declined (Sent to Staff) [japanese]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(1435,'estimate','estimate-accepted-to-staff','japanese','Estimate Accepted (Sent to Staff) [japanese]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(1436,'proposals','proposal-client-accepted','japanese','Customer Action - Accepted (Sent to Staff) [japanese]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(1437,'proposals','proposal-send-to-customer','japanese','Send Proposal to Customer [japanese]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(1438,'proposals','proposal-client-declined','japanese','Customer Action - Declined (Sent to Staff) [japanese]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(1439,'proposals','proposal-client-thank-you','japanese','Thank You Email (Sent to Customer After Accept) [japanese]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(1440,'proposals','proposal-comment-to-client','japanese','New Comment Â (Sent to Customer/Lead) [japanese]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1441,'proposals','proposal-comment-to-admin','japanese','New Comment (Sent to Staff)  [japanese]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1442,'estimate','estimate-thank-you-to-customer','japanese','Thank You Email (Sent to Customer After Accept) [japanese]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(1443,'tasks','task-deadline-notification','japanese','Task Deadline Reminder - Sent to Assigned Members [japanese]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(1444,'contract','send-contract','japanese','Send Contract to Customer [japanese]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(1445,'invoice','invoice-payment-recorded-to-staff','japanese','Invoice Payment Recorded (Sent to Staff) [japanese]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(1446,'ticket','auto-close-ticket','japanese','Auto Close Ticket [japanese]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(1447,'project','new-project-discussion-created-to-staff','japanese','New Project Discussion (Sent to Project Members) [japanese]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1448,'project','new-project-discussion-created-to-customer','japanese','New Project Discussion (Sent to Customer Contacts) [japanese]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1449,'project','new-project-file-uploaded-to-customer','japanese','New Project File(s) Uploaded (Sent to Customer Contacts) [japanese]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1450,'project','new-project-file-uploaded-to-staff','japanese','New Project File(s) Uploaded (Sent to Project Members) [japanese]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1451,'project','new-project-discussion-comment-to-customer','japanese','New Discussion Comment  (Sent to Customer Contacts) [japanese]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1452,'project','new-project-discussion-comment-to-staff','japanese','New Discussion Comment (Sent to Project Members) [japanese]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1453,'project','staff-added-as-project-member','japanese','Staff Added as Project Member [japanese]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(1454,'estimate','estimate-expiry-reminder','japanese','Estimate Expiration Reminder [japanese]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1455,'proposals','proposal-expiry-reminder','japanese','Proposal Expiration Reminder [japanese]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1456,'staff','new-staff-created','japanese','New Staff Created (Welcome Email) [japanese]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(1457,'client','contact-forgot-password','japanese','Forgot Password [japanese]','Create New Password','','DOT One Business Solution','',0,1,0),(1458,'client','contact-password-reseted','japanese','Password Reset - Confirmation [japanese]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1459,'client','contact-set-password','japanese','Set New Password [japanese]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(1460,'staff','staff-forgot-password','japanese','Forgot Password [japanese]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(1461,'staff','staff-password-reseted','japanese','Password Reset - Confirmation [japanese]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1462,'project','assigned-to-project','japanese','New Project Created (Sent to Customer Contacts) [japanese]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(1463,'tasks','task-added-attachment-to-contacts','japanese','New Attachment(s) on Task (Sent to Customer Contacts) [japanese]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1464,'tasks','task-commented-to-contacts','japanese','New Comment on Task (Sent to Customer Contacts) [japanese]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1465,'leads','new-lead-assigned','japanese','New Lead Assigned to Staff Member [japanese]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(1466,'client','client-statement','japanese','Statement - Account Summary [japanese]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(1467,'ticket','ticket-assigned-to-admin','japanese','New Ticket Assigned (Sent to Staff) [japanese]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(1468,'client','new-client-registered-to-admin','japanese','New Customer Registration (Sent to admins) [japanese]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(1469,'leads','new-web-to-lead-form-submitted','japanese','Web to lead form submitted - Sent to lead [japanese]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(1470,'staff','two-factor-authentication','japanese','Two Factor Authentication [japanese]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(1471,'project','project-finished-to-customer','japanese','Project Marked as Finished (Sent to Customer Contacts) [japanese]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1472,'credit_note','credit-note-send-to-client','japanese','Send Credit Note To Email [japanese]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1473,'tasks','task-status-change-to-staff','japanese','Task Status Changed (Sent to Staff) [japanese]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1474,'tasks','task-status-change-to-contacts','japanese','Task Status Changed (Sent to Customer Contacts) [japanese]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1475,'staff','reminder-email-staff','japanese','Staff Reminder Email [japanese]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1476,'contract','contract-comment-to-client','japanese','New Comment Â (Sent to Customer Contacts) [japanese]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1477,'contract','contract-comment-to-admin','japanese','New Comment (Sent to Staff)  [japanese]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1478,'subscriptions','send-subscription','japanese','Send Subscription to Customer [japanese]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1479,'subscriptions','subscription-payment-failed','japanese','Subscription Payment Failed [japanese]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1480,'subscriptions','subscription-canceled','japanese','Subscription Canceled (Sent to customer primary contact) [japanese]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1481,'subscriptions','subscription-payment-succeeded','japanese','Subscription Payment Succeeded (Sent to customer primary contact) [japanese]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1482,'contract','contract-expiration-to-staff','japanese','Contract Expiration Reminder (Sent to Staff) [japanese]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1483,'gdpr','gdpr-removal-request','japanese','Removal Request From Contact (Sent to administrators) [japanese]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1484,'gdpr','gdpr-removal-request-lead','japanese','Removal Request From Lead (Sent to administrators) [japanese]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1485,'client','client-registration-confirmed','japanese','Customer Registration Confirmed [japanese]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1486,'contract','contract-signed-to-staff','japanese','Contract Signed (Sent to Staff) [japanese]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1487,'subscriptions','customer-subscribed-to-staff','japanese','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [japanese]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1488,'client','contact-verification-email','japanese','Email Verification (Sent to Contact After Registration) [japanese]','Verify Email Address','','{companyname}','',0,1,0),(1489,'client','new-customer-profile-file-uploaded-to-staff','japanese','New Customer Profile File(s) Uploaded (Sent to Staff) [japanese]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1490,'staff','event-notification-to-staff','japanese','Event Notification (Calendar) [japanese]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1491,'subscriptions','subscription-payment-requires-action','japanese','Credit Card Authorization Required - SCA [japanese]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1492,'invoice','invoice-due-notice','japanese','Invoice Due Notice [japanese]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1493,'estimate_request','estimate-request-submitted-to-staff','japanese','Estimate Request Submitted (Sent to Staff) [japanese]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1494,'estimate_request','estimate-request-assigned','japanese','Estimate Request Assigned (Sent to Staff) [japanese]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1495,'estimate_request','estimate-request-received-to-user','japanese','Estimate Request Received (Sent to User) [japanese]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1496,'notifications','non-billed-tasks-reminder','japanese','Non-billed tasks reminder (sent to selected staff members) [japanese]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1497,'invoice','invoices-batch-payments','japanese','Invoices Payments Recorded in Batch (Sent to Customer) [japanese]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1498,'contract','contract-sign-reminder','japanese','Contract Sign Reminder (Sent to Customer) [japanese]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1499,'timesheets_attendance_mgt','attendance_notice','japanese','Attendance notice [japanese]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1500,'timesheets_attendance_mgt','send_request_approval','japanese','Send request approval [japanese]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1501,'timesheets_attendance_mgt','remind_user_check_in','japanese','Remind user check in [japanese]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1502,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','japanese','New application (Send to notification recipient) [japanese]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1503,'client','affiliate_management_payout_updated','japanese','Affiliate Payout Request Update [japanese]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1504,'client','affiliate_management_signup_through_affiliate_link','japanese','Successful Signup through Affiliate Link [japanese]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1505,'client','affiliate_management_successful_referral_commission','japanese','Successful Referral Commission Notification [japanese]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1506,'staff','affiliate_management_new_payout_request_for_admin','japanese','Affiliate Payout Request [japanese]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1507,'staff','affiliate_management_payout_updated_for_admin','japanese','Affiliate Payout Request Updated [japanese]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1508,'staff','affiliate_management_new_affiliate_signup_for_admin','japanese','New Affiliate Signup [japanese]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1509,'client','affiliate_management_referral_commission_reversal','japanese','Referral Commission Reversal Notification [japanese]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1510,'inventory_warning','inventory-warning-to-staff','japanese','Inventory warning (Sent to staff) [japanese]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1519,'purchase_order','purchase-order-to-contact','japanese','Purchase Order (Sent to contact) [japanese]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1520,'purchase_order','purchase-request-to-contact','japanese','Purchase Request (Sent to contact) [japanese]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1521,'purchase_order','purchase-quotation-to-contact','japanese','Purchase Quotation (Sent to contact) [japanese]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1522,'purchase_order','debit-note-to-contact','japanese','Debit Note (Sent to contact) [japanese]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1523,'purchase_order','purchase-statement-to-contact','japanese','Purchase Statement (Sent to contact) [japanese]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1524,'purchase_order','vendor-registration-confirmed','japanese','Vendor Registration Confirmed [japanese]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1525,'purchase_order','purchase-contract-to-contact','japanese','Purchase Contract (Sent to contact) [japanese]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1526,'purchase_order','new-contact-created','japanese','New Contact Added/Registered (Welcome Email) [japanese]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1527,'purchase_order','purchase-request-approval','japanese','Request approval [japanese]','Request approval','','{companyname} | CRM',NULL,0,1,0),(1528,'purchase_order','purchase-send-approved','japanese','Email send approved [japanese]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(1529,'purchase_order','purchase-send-rejected','japanese','Email send rejected [japanese]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(1530,'change_candidate_status','change-candidate-status-to-candidate','japanese','Change Candidate Status (Sent to Candidate) [japanese]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(1531,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','japanese','Change Candidate Job Applied Status (Sent to Candidate) [japanese]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(1532,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','japanese','Change Candidate Interview Schedule Status (Sent to Candidate) [japanese]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(1533,'new_candidate_have_applied','new-candidate-have-applied','japanese','New candidate have applied (Sent to Responsible) [japanese]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(1534,'staff','flexibackup-new-backup-to-staff','japanese','Flexi Backup Notification [japanese]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(1535,'client','new-client-created','norwegian','New Contact Added/Registered (Welcome Email) [norwegian]','Welcome aboard','','DOT One Business Solution','',0,1,0),(1536,'invoice','invoice-send-to-client','norwegian','Send Invoice to Customer [norwegian]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(1537,'ticket','new-ticket-opened-admin','norwegian','New Ticket Opened (Opened by Staff, Sent to Customer) [norwegian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1538,'ticket','ticket-reply','norwegian','Ticket Reply (Sent to Customer) [norwegian]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1539,'ticket','ticket-autoresponse','norwegian','New Ticket Opened - Autoresponse [norwegian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1540,'invoice','invoice-payment-recorded','norwegian','Invoice Payment Recorded (Sent to Customer) [norwegian]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(1541,'invoice','invoice-overdue-notice','norwegian','Invoice Overdue Notice [norwegian]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(1542,'invoice','invoice-already-send','norwegian','Invoice Already Sent to Customer [norwegian]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(1543,'ticket','new-ticket-created-staff','norwegian','New Ticket Created (Opened by Customer, Sent to Staff Members) [norwegian]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(1544,'estimate','estimate-send-to-client','norwegian','Send Estimate to Customer [norwegian]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(1545,'ticket','ticket-reply-to-admin','norwegian','Ticket Reply (Sent to Staff) [norwegian]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1546,'estimate','estimate-already-send','norwegian','Estimate Already Sent to Customer [norwegian]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(1547,'contract','contract-expiration','norwegian','Contract Expiration Reminder (Sent to Customer Contacts) [norwegian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1548,'tasks','task-assigned','norwegian','New Task Assigned (Sent to Staff) [norwegian]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1549,'tasks','task-added-as-follower','norwegian','Staff Member Added as Follower on Task (Sent to Staff) [norwegian]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1550,'tasks','task-commented','norwegian','New Comment on Task (Sent to Staff) [norwegian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1551,'tasks','task-added-attachment','norwegian','New Attachment(s) on Task (Sent to Staff) [norwegian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1552,'estimate','estimate-declined-to-staff','norwegian','Estimate Declined (Sent to Staff) [norwegian]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(1553,'estimate','estimate-accepted-to-staff','norwegian','Estimate Accepted (Sent to Staff) [norwegian]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(1554,'proposals','proposal-client-accepted','norwegian','Customer Action - Accepted (Sent to Staff) [norwegian]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(1555,'proposals','proposal-send-to-customer','norwegian','Send Proposal to Customer [norwegian]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(1556,'proposals','proposal-client-declined','norwegian','Customer Action - Declined (Sent to Staff) [norwegian]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(1557,'proposals','proposal-client-thank-you','norwegian','Thank You Email (Sent to Customer After Accept) [norwegian]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(1558,'proposals','proposal-comment-to-client','norwegian','New Comment Â (Sent to Customer/Lead) [norwegian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1559,'proposals','proposal-comment-to-admin','norwegian','New Comment (Sent to Staff)  [norwegian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1560,'estimate','estimate-thank-you-to-customer','norwegian','Thank You Email (Sent to Customer After Accept) [norwegian]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(1561,'tasks','task-deadline-notification','norwegian','Task Deadline Reminder - Sent to Assigned Members [norwegian]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(1562,'contract','send-contract','norwegian','Send Contract to Customer [norwegian]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(1563,'invoice','invoice-payment-recorded-to-staff','norwegian','Invoice Payment Recorded (Sent to Staff) [norwegian]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(1564,'ticket','auto-close-ticket','norwegian','Auto Close Ticket [norwegian]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(1565,'project','new-project-discussion-created-to-staff','norwegian','New Project Discussion (Sent to Project Members) [norwegian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1566,'project','new-project-discussion-created-to-customer','norwegian','New Project Discussion (Sent to Customer Contacts) [norwegian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1567,'project','new-project-file-uploaded-to-customer','norwegian','New Project File(s) Uploaded (Sent to Customer Contacts) [norwegian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1568,'project','new-project-file-uploaded-to-staff','norwegian','New Project File(s) Uploaded (Sent to Project Members) [norwegian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1569,'project','new-project-discussion-comment-to-customer','norwegian','New Discussion Comment  (Sent to Customer Contacts) [norwegian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1570,'project','new-project-discussion-comment-to-staff','norwegian','New Discussion Comment (Sent to Project Members) [norwegian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1571,'project','staff-added-as-project-member','norwegian','Staff Added as Project Member [norwegian]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(1572,'estimate','estimate-expiry-reminder','norwegian','Estimate Expiration Reminder [norwegian]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1573,'proposals','proposal-expiry-reminder','norwegian','Proposal Expiration Reminder [norwegian]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1574,'staff','new-staff-created','norwegian','New Staff Created (Welcome Email) [norwegian]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(1575,'client','contact-forgot-password','norwegian','Forgot Password [norwegian]','Create New Password','','DOT One Business Solution','',0,1,0),(1576,'client','contact-password-reseted','norwegian','Password Reset - Confirmation [norwegian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1577,'client','contact-set-password','norwegian','Set New Password [norwegian]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(1578,'staff','staff-forgot-password','norwegian','Forgot Password [norwegian]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(1579,'staff','staff-password-reseted','norwegian','Password Reset - Confirmation [norwegian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1580,'project','assigned-to-project','norwegian','New Project Created (Sent to Customer Contacts) [norwegian]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(1581,'tasks','task-added-attachment-to-contacts','norwegian','New Attachment(s) on Task (Sent to Customer Contacts) [norwegian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1582,'tasks','task-commented-to-contacts','norwegian','New Comment on Task (Sent to Customer Contacts) [norwegian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1583,'leads','new-lead-assigned','norwegian','New Lead Assigned to Staff Member [norwegian]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(1584,'client','client-statement','norwegian','Statement - Account Summary [norwegian]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(1585,'ticket','ticket-assigned-to-admin','norwegian','New Ticket Assigned (Sent to Staff) [norwegian]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(1586,'client','new-client-registered-to-admin','norwegian','New Customer Registration (Sent to admins) [norwegian]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(1587,'leads','new-web-to-lead-form-submitted','norwegian','Web to lead form submitted - Sent to lead [norwegian]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(1588,'staff','two-factor-authentication','norwegian','Two Factor Authentication [norwegian]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(1589,'project','project-finished-to-customer','norwegian','Project Marked as Finished (Sent to Customer Contacts) [norwegian]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1590,'credit_note','credit-note-send-to-client','norwegian','Send Credit Note To Email [norwegian]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1591,'tasks','task-status-change-to-staff','norwegian','Task Status Changed (Sent to Staff) [norwegian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1592,'tasks','task-status-change-to-contacts','norwegian','Task Status Changed (Sent to Customer Contacts) [norwegian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1593,'staff','reminder-email-staff','norwegian','Staff Reminder Email [norwegian]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1594,'contract','contract-comment-to-client','norwegian','New Comment Â (Sent to Customer Contacts) [norwegian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1595,'contract','contract-comment-to-admin','norwegian','New Comment (Sent to Staff)  [norwegian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1596,'subscriptions','send-subscription','norwegian','Send Subscription to Customer [norwegian]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1597,'subscriptions','subscription-payment-failed','norwegian','Subscription Payment Failed [norwegian]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1598,'subscriptions','subscription-canceled','norwegian','Subscription Canceled (Sent to customer primary contact) [norwegian]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1599,'subscriptions','subscription-payment-succeeded','norwegian','Subscription Payment Succeeded (Sent to customer primary contact) [norwegian]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1600,'contract','contract-expiration-to-staff','norwegian','Contract Expiration Reminder (Sent to Staff) [norwegian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1601,'gdpr','gdpr-removal-request','norwegian','Removal Request From Contact (Sent to administrators) [norwegian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1602,'gdpr','gdpr-removal-request-lead','norwegian','Removal Request From Lead (Sent to administrators) [norwegian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1603,'client','client-registration-confirmed','norwegian','Customer Registration Confirmed [norwegian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1604,'contract','contract-signed-to-staff','norwegian','Contract Signed (Sent to Staff) [norwegian]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1605,'subscriptions','customer-subscribed-to-staff','norwegian','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [norwegian]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1606,'client','contact-verification-email','norwegian','Email Verification (Sent to Contact After Registration) [norwegian]','Verify Email Address','','{companyname}','',0,1,0),(1607,'client','new-customer-profile-file-uploaded-to-staff','norwegian','New Customer Profile File(s) Uploaded (Sent to Staff) [norwegian]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1608,'staff','event-notification-to-staff','norwegian','Event Notification (Calendar) [norwegian]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1609,'subscriptions','subscription-payment-requires-action','norwegian','Credit Card Authorization Required - SCA [norwegian]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1610,'invoice','invoice-due-notice','norwegian','Invoice Due Notice [norwegian]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1611,'estimate_request','estimate-request-submitted-to-staff','norwegian','Estimate Request Submitted (Sent to Staff) [norwegian]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1612,'estimate_request','estimate-request-assigned','norwegian','Estimate Request Assigned (Sent to Staff) [norwegian]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1613,'estimate_request','estimate-request-received-to-user','norwegian','Estimate Request Received (Sent to User) [norwegian]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1614,'notifications','non-billed-tasks-reminder','norwegian','Non-billed tasks reminder (sent to selected staff members) [norwegian]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1615,'invoice','invoices-batch-payments','norwegian','Invoices Payments Recorded in Batch (Sent to Customer) [norwegian]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1616,'contract','contract-sign-reminder','norwegian','Contract Sign Reminder (Sent to Customer) [norwegian]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1617,'timesheets_attendance_mgt','attendance_notice','norwegian','Attendance notice [norwegian]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1618,'timesheets_attendance_mgt','send_request_approval','norwegian','Send request approval [norwegian]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1619,'timesheets_attendance_mgt','remind_user_check_in','norwegian','Remind user check in [norwegian]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1620,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','norwegian','New application (Send to notification recipient) [norwegian]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1621,'client','affiliate_management_payout_updated','norwegian','Affiliate Payout Request Update [norwegian]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1622,'client','affiliate_management_signup_through_affiliate_link','norwegian','Successful Signup through Affiliate Link [norwegian]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1623,'client','affiliate_management_successful_referral_commission','norwegian','Successful Referral Commission Notification [norwegian]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1624,'staff','affiliate_management_new_payout_request_for_admin','norwegian','Affiliate Payout Request [norwegian]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1625,'staff','affiliate_management_payout_updated_for_admin','norwegian','Affiliate Payout Request Updated [norwegian]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1626,'staff','affiliate_management_new_affiliate_signup_for_admin','norwegian','New Affiliate Signup [norwegian]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1627,'client','affiliate_management_referral_commission_reversal','norwegian','Referral Commission Reversal Notification [norwegian]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1628,'inventory_warning','inventory-warning-to-staff','norwegian','Inventory warning (Sent to staff) [norwegian]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1637,'purchase_order','purchase-order-to-contact','norwegian','Purchase Order (Sent to contact) [norwegian]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1638,'purchase_order','purchase-request-to-contact','norwegian','Purchase Request (Sent to contact) [norwegian]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1639,'purchase_order','purchase-quotation-to-contact','norwegian','Purchase Quotation (Sent to contact) [norwegian]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1640,'purchase_order','debit-note-to-contact','norwegian','Debit Note (Sent to contact) [norwegian]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1641,'purchase_order','purchase-statement-to-contact','norwegian','Purchase Statement (Sent to contact) [norwegian]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1642,'purchase_order','vendor-registration-confirmed','norwegian','Vendor Registration Confirmed [norwegian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1643,'purchase_order','purchase-contract-to-contact','norwegian','Purchase Contract (Sent to contact) [norwegian]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1644,'purchase_order','new-contact-created','norwegian','New Contact Added/Registered (Welcome Email) [norwegian]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1645,'purchase_order','purchase-request-approval','norwegian','Request approval [norwegian]','Request approval','','{companyname} | CRM',NULL,0,1,0),(1646,'purchase_order','purchase-send-approved','norwegian','Email send approved [norwegian]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(1647,'purchase_order','purchase-send-rejected','norwegian','Email send rejected [norwegian]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(1648,'change_candidate_status','change-candidate-status-to-candidate','norwegian','Change Candidate Status (Sent to Candidate) [norwegian]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(1649,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','norwegian','Change Candidate Job Applied Status (Sent to Candidate) [norwegian]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(1650,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','norwegian','Change Candidate Interview Schedule Status (Sent to Candidate) [norwegian]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(1651,'new_candidate_have_applied','new-candidate-have-applied','norwegian','New candidate have applied (Sent to Responsible) [norwegian]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(1652,'staff','flexibackup-new-backup-to-staff','norwegian','Flexi Backup Notification [norwegian]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(1653,'client','new-client-created','persian','New Contact Added/Registered (Welcome Email) [persian]','Welcome aboard','','DOT One Business Solution','',0,1,0),(1654,'invoice','invoice-send-to-client','persian','Send Invoice to Customer [persian]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(1655,'ticket','new-ticket-opened-admin','persian','New Ticket Opened (Opened by Staff, Sent to Customer) [persian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1656,'ticket','ticket-reply','persian','Ticket Reply (Sent to Customer) [persian]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1657,'ticket','ticket-autoresponse','persian','New Ticket Opened - Autoresponse [persian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1658,'invoice','invoice-payment-recorded','persian','Invoice Payment Recorded (Sent to Customer) [persian]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(1659,'invoice','invoice-overdue-notice','persian','Invoice Overdue Notice [persian]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(1660,'invoice','invoice-already-send','persian','Invoice Already Sent to Customer [persian]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(1661,'ticket','new-ticket-created-staff','persian','New Ticket Created (Opened by Customer, Sent to Staff Members) [persian]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(1662,'estimate','estimate-send-to-client','persian','Send Estimate to Customer [persian]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(1663,'ticket','ticket-reply-to-admin','persian','Ticket Reply (Sent to Staff) [persian]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1664,'estimate','estimate-already-send','persian','Estimate Already Sent to Customer [persian]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(1665,'contract','contract-expiration','persian','Contract Expiration Reminder (Sent to Customer Contacts) [persian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1666,'tasks','task-assigned','persian','New Task Assigned (Sent to Staff) [persian]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1667,'tasks','task-added-as-follower','persian','Staff Member Added as Follower on Task (Sent to Staff) [persian]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1668,'tasks','task-commented','persian','New Comment on Task (Sent to Staff) [persian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1669,'tasks','task-added-attachment','persian','New Attachment(s) on Task (Sent to Staff) [persian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1670,'estimate','estimate-declined-to-staff','persian','Estimate Declined (Sent to Staff) [persian]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(1671,'estimate','estimate-accepted-to-staff','persian','Estimate Accepted (Sent to Staff) [persian]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(1672,'proposals','proposal-client-accepted','persian','Customer Action - Accepted (Sent to Staff) [persian]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(1673,'proposals','proposal-send-to-customer','persian','Send Proposal to Customer [persian]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(1674,'proposals','proposal-client-declined','persian','Customer Action - Declined (Sent to Staff) [persian]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(1675,'proposals','proposal-client-thank-you','persian','Thank You Email (Sent to Customer After Accept) [persian]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(1676,'proposals','proposal-comment-to-client','persian','New Comment Â (Sent to Customer/Lead) [persian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1677,'proposals','proposal-comment-to-admin','persian','New Comment (Sent to Staff)  [persian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1678,'estimate','estimate-thank-you-to-customer','persian','Thank You Email (Sent to Customer After Accept) [persian]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(1679,'tasks','task-deadline-notification','persian','Task Deadline Reminder - Sent to Assigned Members [persian]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(1680,'contract','send-contract','persian','Send Contract to Customer [persian]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(1681,'invoice','invoice-payment-recorded-to-staff','persian','Invoice Payment Recorded (Sent to Staff) [persian]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(1682,'ticket','auto-close-ticket','persian','Auto Close Ticket [persian]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(1683,'project','new-project-discussion-created-to-staff','persian','New Project Discussion (Sent to Project Members) [persian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1684,'project','new-project-discussion-created-to-customer','persian','New Project Discussion (Sent to Customer Contacts) [persian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1685,'project','new-project-file-uploaded-to-customer','persian','New Project File(s) Uploaded (Sent to Customer Contacts) [persian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1686,'project','new-project-file-uploaded-to-staff','persian','New Project File(s) Uploaded (Sent to Project Members) [persian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1687,'project','new-project-discussion-comment-to-customer','persian','New Discussion Comment  (Sent to Customer Contacts) [persian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1688,'project','new-project-discussion-comment-to-staff','persian','New Discussion Comment (Sent to Project Members) [persian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1689,'project','staff-added-as-project-member','persian','Staff Added as Project Member [persian]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(1690,'estimate','estimate-expiry-reminder','persian','Estimate Expiration Reminder [persian]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1691,'proposals','proposal-expiry-reminder','persian','Proposal Expiration Reminder [persian]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1692,'staff','new-staff-created','persian','New Staff Created (Welcome Email) [persian]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(1693,'client','contact-forgot-password','persian','Forgot Password [persian]','Create New Password','','DOT One Business Solution','',0,1,0),(1694,'client','contact-password-reseted','persian','Password Reset - Confirmation [persian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1695,'client','contact-set-password','persian','Set New Password [persian]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(1696,'staff','staff-forgot-password','persian','Forgot Password [persian]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(1697,'staff','staff-password-reseted','persian','Password Reset - Confirmation [persian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1698,'project','assigned-to-project','persian','New Project Created (Sent to Customer Contacts) [persian]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(1699,'tasks','task-added-attachment-to-contacts','persian','New Attachment(s) on Task (Sent to Customer Contacts) [persian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1700,'tasks','task-commented-to-contacts','persian','New Comment on Task (Sent to Customer Contacts) [persian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1701,'leads','new-lead-assigned','persian','New Lead Assigned to Staff Member [persian]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(1702,'client','client-statement','persian','Statement - Account Summary [persian]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(1703,'ticket','ticket-assigned-to-admin','persian','New Ticket Assigned (Sent to Staff) [persian]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(1704,'client','new-client-registered-to-admin','persian','New Customer Registration (Sent to admins) [persian]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(1705,'leads','new-web-to-lead-form-submitted','persian','Web to lead form submitted - Sent to lead [persian]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(1706,'staff','two-factor-authentication','persian','Two Factor Authentication [persian]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(1707,'project','project-finished-to-customer','persian','Project Marked as Finished (Sent to Customer Contacts) [persian]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1708,'credit_note','credit-note-send-to-client','persian','Send Credit Note To Email [persian]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1709,'tasks','task-status-change-to-staff','persian','Task Status Changed (Sent to Staff) [persian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1710,'tasks','task-status-change-to-contacts','persian','Task Status Changed (Sent to Customer Contacts) [persian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1711,'staff','reminder-email-staff','persian','Staff Reminder Email [persian]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1712,'contract','contract-comment-to-client','persian','New Comment Â (Sent to Customer Contacts) [persian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1713,'contract','contract-comment-to-admin','persian','New Comment (Sent to Staff)  [persian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1714,'subscriptions','send-subscription','persian','Send Subscription to Customer [persian]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1715,'subscriptions','subscription-payment-failed','persian','Subscription Payment Failed [persian]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1716,'subscriptions','subscription-canceled','persian','Subscription Canceled (Sent to customer primary contact) [persian]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1717,'subscriptions','subscription-payment-succeeded','persian','Subscription Payment Succeeded (Sent to customer primary contact) [persian]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1718,'contract','contract-expiration-to-staff','persian','Contract Expiration Reminder (Sent to Staff) [persian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1719,'gdpr','gdpr-removal-request','persian','Removal Request From Contact (Sent to administrators) [persian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1720,'gdpr','gdpr-removal-request-lead','persian','Removal Request From Lead (Sent to administrators) [persian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1721,'client','client-registration-confirmed','persian','Customer Registration Confirmed [persian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1722,'contract','contract-signed-to-staff','persian','Contract Signed (Sent to Staff) [persian]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1723,'subscriptions','customer-subscribed-to-staff','persian','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [persian]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1724,'client','contact-verification-email','persian','Email Verification (Sent to Contact After Registration) [persian]','Verify Email Address','','{companyname}','',0,1,0),(1725,'client','new-customer-profile-file-uploaded-to-staff','persian','New Customer Profile File(s) Uploaded (Sent to Staff) [persian]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1726,'staff','event-notification-to-staff','persian','Event Notification (Calendar) [persian]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1727,'subscriptions','subscription-payment-requires-action','persian','Credit Card Authorization Required - SCA [persian]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1728,'invoice','invoice-due-notice','persian','Invoice Due Notice [persian]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1729,'estimate_request','estimate-request-submitted-to-staff','persian','Estimate Request Submitted (Sent to Staff) [persian]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1730,'estimate_request','estimate-request-assigned','persian','Estimate Request Assigned (Sent to Staff) [persian]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1731,'estimate_request','estimate-request-received-to-user','persian','Estimate Request Received (Sent to User) [persian]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1732,'notifications','non-billed-tasks-reminder','persian','Non-billed tasks reminder (sent to selected staff members) [persian]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1733,'invoice','invoices-batch-payments','persian','Invoices Payments Recorded in Batch (Sent to Customer) [persian]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1734,'contract','contract-sign-reminder','persian','Contract Sign Reminder (Sent to Customer) [persian]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1735,'timesheets_attendance_mgt','attendance_notice','persian','Attendance notice [persian]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1736,'timesheets_attendance_mgt','send_request_approval','persian','Send request approval [persian]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1737,'timesheets_attendance_mgt','remind_user_check_in','persian','Remind user check in [persian]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1738,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','persian','New application (Send to notification recipient) [persian]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1739,'client','affiliate_management_payout_updated','persian','Affiliate Payout Request Update [persian]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1740,'client','affiliate_management_signup_through_affiliate_link','persian','Successful Signup through Affiliate Link [persian]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1741,'client','affiliate_management_successful_referral_commission','persian','Successful Referral Commission Notification [persian]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1742,'staff','affiliate_management_new_payout_request_for_admin','persian','Affiliate Payout Request [persian]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1743,'staff','affiliate_management_payout_updated_for_admin','persian','Affiliate Payout Request Updated [persian]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1744,'staff','affiliate_management_new_affiliate_signup_for_admin','persian','New Affiliate Signup [persian]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1745,'client','affiliate_management_referral_commission_reversal','persian','Referral Commission Reversal Notification [persian]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1746,'inventory_warning','inventory-warning-to-staff','persian','Inventory warning (Sent to staff) [persian]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1755,'purchase_order','purchase-order-to-contact','persian','Purchase Order (Sent to contact) [persian]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1756,'purchase_order','purchase-request-to-contact','persian','Purchase Request (Sent to contact) [persian]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1757,'purchase_order','purchase-quotation-to-contact','persian','Purchase Quotation (Sent to contact) [persian]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1758,'purchase_order','debit-note-to-contact','persian','Debit Note (Sent to contact) [persian]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1759,'purchase_order','purchase-statement-to-contact','persian','Purchase Statement (Sent to contact) [persian]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1760,'purchase_order','vendor-registration-confirmed','persian','Vendor Registration Confirmed [persian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1761,'purchase_order','purchase-contract-to-contact','persian','Purchase Contract (Sent to contact) [persian]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1762,'purchase_order','new-contact-created','persian','New Contact Added/Registered (Welcome Email) [persian]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1763,'purchase_order','purchase-request-approval','persian','Request approval [persian]','Request approval','','{companyname} | CRM',NULL,0,1,0),(1764,'purchase_order','purchase-send-approved','persian','Email send approved [persian]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(1765,'purchase_order','purchase-send-rejected','persian','Email send rejected [persian]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(1766,'change_candidate_status','change-candidate-status-to-candidate','persian','Change Candidate Status (Sent to Candidate) [persian]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(1767,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','persian','Change Candidate Job Applied Status (Sent to Candidate) [persian]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(1768,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','persian','Change Candidate Interview Schedule Status (Sent to Candidate) [persian]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(1769,'new_candidate_have_applied','new-candidate-have-applied','persian','New candidate have applied (Sent to Responsible) [persian]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(1770,'staff','flexibackup-new-backup-to-staff','persian','Flexi Backup Notification [persian]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(1771,'client','new-client-created','polish','New Contact Added/Registered (Welcome Email) [polish]','Welcome aboard','','DOT One Business Solution','',0,1,0),(1772,'invoice','invoice-send-to-client','polish','Send Invoice to Customer [polish]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(1773,'ticket','new-ticket-opened-admin','polish','New Ticket Opened (Opened by Staff, Sent to Customer) [polish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1774,'ticket','ticket-reply','polish','Ticket Reply (Sent to Customer) [polish]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1775,'ticket','ticket-autoresponse','polish','New Ticket Opened - Autoresponse [polish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1776,'invoice','invoice-payment-recorded','polish','Invoice Payment Recorded (Sent to Customer) [polish]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(1777,'invoice','invoice-overdue-notice','polish','Invoice Overdue Notice [polish]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(1778,'invoice','invoice-already-send','polish','Invoice Already Sent to Customer [polish]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(1779,'ticket','new-ticket-created-staff','polish','New Ticket Created (Opened by Customer, Sent to Staff Members) [polish]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(1780,'estimate','estimate-send-to-client','polish','Send Estimate to Customer [polish]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(1781,'ticket','ticket-reply-to-admin','polish','Ticket Reply (Sent to Staff) [polish]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1782,'estimate','estimate-already-send','polish','Estimate Already Sent to Customer [polish]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(1783,'contract','contract-expiration','polish','Contract Expiration Reminder (Sent to Customer Contacts) [polish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1784,'tasks','task-assigned','polish','New Task Assigned (Sent to Staff) [polish]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1785,'tasks','task-added-as-follower','polish','Staff Member Added as Follower on Task (Sent to Staff) [polish]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1786,'tasks','task-commented','polish','New Comment on Task (Sent to Staff) [polish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1787,'tasks','task-added-attachment','polish','New Attachment(s) on Task (Sent to Staff) [polish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1788,'estimate','estimate-declined-to-staff','polish','Estimate Declined (Sent to Staff) [polish]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(1789,'estimate','estimate-accepted-to-staff','polish','Estimate Accepted (Sent to Staff) [polish]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(1790,'proposals','proposal-client-accepted','polish','Customer Action - Accepted (Sent to Staff) [polish]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(1791,'proposals','proposal-send-to-customer','polish','Send Proposal to Customer [polish]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(1792,'proposals','proposal-client-declined','polish','Customer Action - Declined (Sent to Staff) [polish]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(1793,'proposals','proposal-client-thank-you','polish','Thank You Email (Sent to Customer After Accept) [polish]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(1794,'proposals','proposal-comment-to-client','polish','New Comment Â (Sent to Customer/Lead) [polish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1795,'proposals','proposal-comment-to-admin','polish','New Comment (Sent to Staff)  [polish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1796,'estimate','estimate-thank-you-to-customer','polish','Thank You Email (Sent to Customer After Accept) [polish]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(1797,'tasks','task-deadline-notification','polish','Task Deadline Reminder - Sent to Assigned Members [polish]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(1798,'contract','send-contract','polish','Send Contract to Customer [polish]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(1799,'invoice','invoice-payment-recorded-to-staff','polish','Invoice Payment Recorded (Sent to Staff) [polish]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(1800,'ticket','auto-close-ticket','polish','Auto Close Ticket [polish]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(1801,'project','new-project-discussion-created-to-staff','polish','New Project Discussion (Sent to Project Members) [polish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1802,'project','new-project-discussion-created-to-customer','polish','New Project Discussion (Sent to Customer Contacts) [polish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1803,'project','new-project-file-uploaded-to-customer','polish','New Project File(s) Uploaded (Sent to Customer Contacts) [polish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1804,'project','new-project-file-uploaded-to-staff','polish','New Project File(s) Uploaded (Sent to Project Members) [polish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1805,'project','new-project-discussion-comment-to-customer','polish','New Discussion Comment  (Sent to Customer Contacts) [polish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1806,'project','new-project-discussion-comment-to-staff','polish','New Discussion Comment (Sent to Project Members) [polish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1807,'project','staff-added-as-project-member','polish','Staff Added as Project Member [polish]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(1808,'estimate','estimate-expiry-reminder','polish','Estimate Expiration Reminder [polish]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1809,'proposals','proposal-expiry-reminder','polish','Proposal Expiration Reminder [polish]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1810,'staff','new-staff-created','polish','New Staff Created (Welcome Email) [polish]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(1811,'client','contact-forgot-password','polish','Forgot Password [polish]','Create New Password','','DOT One Business Solution','',0,1,0),(1812,'client','contact-password-reseted','polish','Password Reset - Confirmation [polish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1813,'client','contact-set-password','polish','Set New Password [polish]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(1814,'staff','staff-forgot-password','polish','Forgot Password [polish]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(1815,'staff','staff-password-reseted','polish','Password Reset - Confirmation [polish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1816,'project','assigned-to-project','polish','New Project Created (Sent to Customer Contacts) [polish]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(1817,'tasks','task-added-attachment-to-contacts','polish','New Attachment(s) on Task (Sent to Customer Contacts) [polish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1818,'tasks','task-commented-to-contacts','polish','New Comment on Task (Sent to Customer Contacts) [polish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1819,'leads','new-lead-assigned','polish','New Lead Assigned to Staff Member [polish]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(1820,'client','client-statement','polish','Statement - Account Summary [polish]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(1821,'ticket','ticket-assigned-to-admin','polish','New Ticket Assigned (Sent to Staff) [polish]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(1822,'client','new-client-registered-to-admin','polish','New Customer Registration (Sent to admins) [polish]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(1823,'leads','new-web-to-lead-form-submitted','polish','Web to lead form submitted - Sent to lead [polish]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(1824,'staff','two-factor-authentication','polish','Two Factor Authentication [polish]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(1825,'project','project-finished-to-customer','polish','Project Marked as Finished (Sent to Customer Contacts) [polish]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1826,'credit_note','credit-note-send-to-client','polish','Send Credit Note To Email [polish]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1827,'tasks','task-status-change-to-staff','polish','Task Status Changed (Sent to Staff) [polish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1828,'tasks','task-status-change-to-contacts','polish','Task Status Changed (Sent to Customer Contacts) [polish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1829,'staff','reminder-email-staff','polish','Staff Reminder Email [polish]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1830,'contract','contract-comment-to-client','polish','New Comment Â (Sent to Customer Contacts) [polish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1831,'contract','contract-comment-to-admin','polish','New Comment (Sent to Staff)  [polish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1832,'subscriptions','send-subscription','polish','Send Subscription to Customer [polish]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1833,'subscriptions','subscription-payment-failed','polish','Subscription Payment Failed [polish]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1834,'subscriptions','subscription-canceled','polish','Subscription Canceled (Sent to customer primary contact) [polish]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1835,'subscriptions','subscription-payment-succeeded','polish','Subscription Payment Succeeded (Sent to customer primary contact) [polish]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1836,'contract','contract-expiration-to-staff','polish','Contract Expiration Reminder (Sent to Staff) [polish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1837,'gdpr','gdpr-removal-request','polish','Removal Request From Contact (Sent to administrators) [polish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1838,'gdpr','gdpr-removal-request-lead','polish','Removal Request From Lead (Sent to administrators) [polish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1839,'client','client-registration-confirmed','polish','Customer Registration Confirmed [polish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1840,'contract','contract-signed-to-staff','polish','Contract Signed (Sent to Staff) [polish]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1841,'subscriptions','customer-subscribed-to-staff','polish','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [polish]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1842,'client','contact-verification-email','polish','Email Verification (Sent to Contact After Registration) [polish]','Verify Email Address','','{companyname}','',0,1,0),(1843,'client','new-customer-profile-file-uploaded-to-staff','polish','New Customer Profile File(s) Uploaded (Sent to Staff) [polish]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1844,'staff','event-notification-to-staff','polish','Event Notification (Calendar) [polish]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1845,'subscriptions','subscription-payment-requires-action','polish','Credit Card Authorization Required - SCA [polish]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1846,'invoice','invoice-due-notice','polish','Invoice Due Notice [polish]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1847,'estimate_request','estimate-request-submitted-to-staff','polish','Estimate Request Submitted (Sent to Staff) [polish]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1848,'estimate_request','estimate-request-assigned','polish','Estimate Request Assigned (Sent to Staff) [polish]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1849,'estimate_request','estimate-request-received-to-user','polish','Estimate Request Received (Sent to User) [polish]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1850,'notifications','non-billed-tasks-reminder','polish','Non-billed tasks reminder (sent to selected staff members) [polish]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1851,'invoice','invoices-batch-payments','polish','Invoices Payments Recorded in Batch (Sent to Customer) [polish]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1852,'contract','contract-sign-reminder','polish','Contract Sign Reminder (Sent to Customer) [polish]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1853,'timesheets_attendance_mgt','attendance_notice','polish','Attendance notice [polish]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1854,'timesheets_attendance_mgt','send_request_approval','polish','Send request approval [polish]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1855,'timesheets_attendance_mgt','remind_user_check_in','polish','Remind user check in [polish]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1856,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','polish','New application (Send to notification recipient) [polish]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1857,'client','affiliate_management_payout_updated','polish','Affiliate Payout Request Update [polish]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1858,'client','affiliate_management_signup_through_affiliate_link','polish','Successful Signup through Affiliate Link [polish]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1859,'client','affiliate_management_successful_referral_commission','polish','Successful Referral Commission Notification [polish]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1860,'staff','affiliate_management_new_payout_request_for_admin','polish','Affiliate Payout Request [polish]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1861,'staff','affiliate_management_payout_updated_for_admin','polish','Affiliate Payout Request Updated [polish]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1862,'staff','affiliate_management_new_affiliate_signup_for_admin','polish','New Affiliate Signup [polish]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1863,'client','affiliate_management_referral_commission_reversal','polish','Referral Commission Reversal Notification [polish]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1864,'inventory_warning','inventory-warning-to-staff','polish','Inventory warning (Sent to staff) [polish]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1873,'purchase_order','purchase-order-to-contact','polish','Purchase Order (Sent to contact) [polish]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1874,'purchase_order','purchase-request-to-contact','polish','Purchase Request (Sent to contact) [polish]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1875,'purchase_order','purchase-quotation-to-contact','polish','Purchase Quotation (Sent to contact) [polish]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1876,'purchase_order','debit-note-to-contact','polish','Debit Note (Sent to contact) [polish]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1877,'purchase_order','purchase-statement-to-contact','polish','Purchase Statement (Sent to contact) [polish]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1878,'purchase_order','vendor-registration-confirmed','polish','Vendor Registration Confirmed [polish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1879,'purchase_order','purchase-contract-to-contact','polish','Purchase Contract (Sent to contact) [polish]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1880,'purchase_order','new-contact-created','polish','New Contact Added/Registered (Welcome Email) [polish]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1881,'purchase_order','purchase-request-approval','polish','Request approval [polish]','Request approval','','{companyname} | CRM',NULL,0,1,0),(1882,'purchase_order','purchase-send-approved','polish','Email send approved [polish]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(1883,'purchase_order','purchase-send-rejected','polish','Email send rejected [polish]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(1884,'change_candidate_status','change-candidate-status-to-candidate','polish','Change Candidate Status (Sent to Candidate) [polish]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(1885,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','polish','Change Candidate Job Applied Status (Sent to Candidate) [polish]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(1886,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','polish','Change Candidate Interview Schedule Status (Sent to Candidate) [polish]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(1887,'new_candidate_have_applied','new-candidate-have-applied','polish','New candidate have applied (Sent to Responsible) [polish]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(1888,'staff','flexibackup-new-backup-to-staff','polish','Flexi Backup Notification [polish]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(1889,'client','new-client-created','portuguese','New Contact Added/Registered (Welcome Email) [portuguese]','Welcome aboard','','DOT One Business Solution','',0,1,0),(1890,'invoice','invoice-send-to-client','portuguese','Send Invoice to Customer [portuguese]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(1891,'ticket','new-ticket-opened-admin','portuguese','New Ticket Opened (Opened by Staff, Sent to Customer) [portuguese]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1892,'ticket','ticket-reply','portuguese','Ticket Reply (Sent to Customer) [portuguese]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1893,'ticket','ticket-autoresponse','portuguese','New Ticket Opened - Autoresponse [portuguese]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(1894,'invoice','invoice-payment-recorded','portuguese','Invoice Payment Recorded (Sent to Customer) [portuguese]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(1895,'invoice','invoice-overdue-notice','portuguese','Invoice Overdue Notice [portuguese]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(1896,'invoice','invoice-already-send','portuguese','Invoice Already Sent to Customer [portuguese]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(1897,'ticket','new-ticket-created-staff','portuguese','New Ticket Created (Opened by Customer, Sent to Staff Members) [portuguese]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(1898,'estimate','estimate-send-to-client','portuguese','Send Estimate to Customer [portuguese]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(1899,'ticket','ticket-reply-to-admin','portuguese','Ticket Reply (Sent to Staff) [portuguese]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(1900,'estimate','estimate-already-send','portuguese','Estimate Already Sent to Customer [portuguese]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(1901,'contract','contract-expiration','portuguese','Contract Expiration Reminder (Sent to Customer Contacts) [portuguese]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1902,'tasks','task-assigned','portuguese','New Task Assigned (Sent to Staff) [portuguese]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1903,'tasks','task-added-as-follower','portuguese','Staff Member Added as Follower on Task (Sent to Staff) [portuguese]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1904,'tasks','task-commented','portuguese','New Comment on Task (Sent to Staff) [portuguese]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1905,'tasks','task-added-attachment','portuguese','New Attachment(s) on Task (Sent to Staff) [portuguese]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1906,'estimate','estimate-declined-to-staff','portuguese','Estimate Declined (Sent to Staff) [portuguese]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(1907,'estimate','estimate-accepted-to-staff','portuguese','Estimate Accepted (Sent to Staff) [portuguese]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(1908,'proposals','proposal-client-accepted','portuguese','Customer Action - Accepted (Sent to Staff) [portuguese]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(1909,'proposals','proposal-send-to-customer','portuguese','Send Proposal to Customer [portuguese]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(1910,'proposals','proposal-client-declined','portuguese','Customer Action - Declined (Sent to Staff) [portuguese]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(1911,'proposals','proposal-client-thank-you','portuguese','Thank You Email (Sent to Customer After Accept) [portuguese]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(1912,'proposals','proposal-comment-to-client','portuguese','New Comment Â (Sent to Customer/Lead) [portuguese]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1913,'proposals','proposal-comment-to-admin','portuguese','New Comment (Sent to Staff)  [portuguese]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(1914,'estimate','estimate-thank-you-to-customer','portuguese','Thank You Email (Sent to Customer After Accept) [portuguese]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(1915,'tasks','task-deadline-notification','portuguese','Task Deadline Reminder - Sent to Assigned Members [portuguese]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(1916,'contract','send-contract','portuguese','Send Contract to Customer [portuguese]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(1917,'invoice','invoice-payment-recorded-to-staff','portuguese','Invoice Payment Recorded (Sent to Staff) [portuguese]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(1918,'ticket','auto-close-ticket','portuguese','Auto Close Ticket [portuguese]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(1919,'project','new-project-discussion-created-to-staff','portuguese','New Project Discussion (Sent to Project Members) [portuguese]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1920,'project','new-project-discussion-created-to-customer','portuguese','New Project Discussion (Sent to Customer Contacts) [portuguese]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1921,'project','new-project-file-uploaded-to-customer','portuguese','New Project File(s) Uploaded (Sent to Customer Contacts) [portuguese]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1922,'project','new-project-file-uploaded-to-staff','portuguese','New Project File(s) Uploaded (Sent to Project Members) [portuguese]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(1923,'project','new-project-discussion-comment-to-customer','portuguese','New Discussion Comment  (Sent to Customer Contacts) [portuguese]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1924,'project','new-project-discussion-comment-to-staff','portuguese','New Discussion Comment (Sent to Project Members) [portuguese]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(1925,'project','staff-added-as-project-member','portuguese','Staff Added as Project Member [portuguese]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(1926,'estimate','estimate-expiry-reminder','portuguese','Estimate Expiration Reminder [portuguese]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1927,'proposals','proposal-expiry-reminder','portuguese','Proposal Expiration Reminder [portuguese]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1928,'staff','new-staff-created','portuguese','New Staff Created (Welcome Email) [portuguese]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(1929,'client','contact-forgot-password','portuguese','Forgot Password [portuguese]','Create New Password','','DOT One Business Solution','',0,1,0),(1930,'client','contact-password-reseted','portuguese','Password Reset - Confirmation [portuguese]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1931,'client','contact-set-password','portuguese','Set New Password [portuguese]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(1932,'staff','staff-forgot-password','portuguese','Forgot Password [portuguese]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(1933,'staff','staff-password-reseted','portuguese','Password Reset - Confirmation [portuguese]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(1934,'project','assigned-to-project','portuguese','New Project Created (Sent to Customer Contacts) [portuguese]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(1935,'tasks','task-added-attachment-to-contacts','portuguese','New Attachment(s) on Task (Sent to Customer Contacts) [portuguese]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1936,'tasks','task-commented-to-contacts','portuguese','New Comment on Task (Sent to Customer Contacts) [portuguese]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(1937,'leads','new-lead-assigned','portuguese','New Lead Assigned to Staff Member [portuguese]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(1938,'client','client-statement','portuguese','Statement - Account Summary [portuguese]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(1939,'ticket','ticket-assigned-to-admin','portuguese','New Ticket Assigned (Sent to Staff) [portuguese]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(1940,'client','new-client-registered-to-admin','portuguese','New Customer Registration (Sent to admins) [portuguese]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(1941,'leads','new-web-to-lead-form-submitted','portuguese','Web to lead form submitted - Sent to lead [portuguese]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(1942,'staff','two-factor-authentication','portuguese','Two Factor Authentication [portuguese]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(1943,'project','project-finished-to-customer','portuguese','Project Marked as Finished (Sent to Customer Contacts) [portuguese]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(1944,'credit_note','credit-note-send-to-client','portuguese','Send Credit Note To Email [portuguese]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(1945,'tasks','task-status-change-to-staff','portuguese','Task Status Changed (Sent to Staff) [portuguese]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1946,'tasks','task-status-change-to-contacts','portuguese','Task Status Changed (Sent to Customer Contacts) [portuguese]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(1947,'staff','reminder-email-staff','portuguese','Staff Reminder Email [portuguese]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(1948,'contract','contract-comment-to-client','portuguese','New Comment Â (Sent to Customer Contacts) [portuguese]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1949,'contract','contract-comment-to-admin','portuguese','New Comment (Sent to Staff)  [portuguese]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(1950,'subscriptions','send-subscription','portuguese','Send Subscription to Customer [portuguese]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(1951,'subscriptions','subscription-payment-failed','portuguese','Subscription Payment Failed [portuguese]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(1952,'subscriptions','subscription-canceled','portuguese','Subscription Canceled (Sent to customer primary contact) [portuguese]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(1953,'subscriptions','subscription-payment-succeeded','portuguese','Subscription Payment Succeeded (Sent to customer primary contact) [portuguese]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(1954,'contract','contract-expiration-to-staff','portuguese','Contract Expiration Reminder (Sent to Staff) [portuguese]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(1955,'gdpr','gdpr-removal-request','portuguese','Removal Request From Contact (Sent to administrators) [portuguese]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1956,'gdpr','gdpr-removal-request-lead','portuguese','Removal Request From Lead (Sent to administrators) [portuguese]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(1957,'client','client-registration-confirmed','portuguese','Customer Registration Confirmed [portuguese]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1958,'contract','contract-signed-to-staff','portuguese','Contract Signed (Sent to Staff) [portuguese]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(1959,'subscriptions','customer-subscribed-to-staff','portuguese','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [portuguese]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(1960,'client','contact-verification-email','portuguese','Email Verification (Sent to Contact After Registration) [portuguese]','Verify Email Address','','{companyname}','',0,1,0),(1961,'client','new-customer-profile-file-uploaded-to-staff','portuguese','New Customer Profile File(s) Uploaded (Sent to Staff) [portuguese]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(1962,'staff','event-notification-to-staff','portuguese','Event Notification (Calendar) [portuguese]','Upcoming Event - {event_title}','','',NULL,0,1,0),(1963,'subscriptions','subscription-payment-requires-action','portuguese','Credit Card Authorization Required - SCA [portuguese]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(1964,'invoice','invoice-due-notice','portuguese','Invoice Due Notice [portuguese]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(1965,'estimate_request','estimate-request-submitted-to-staff','portuguese','Estimate Request Submitted (Sent to Staff) [portuguese]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(1966,'estimate_request','estimate-request-assigned','portuguese','Estimate Request Assigned (Sent to Staff) [portuguese]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(1967,'estimate_request','estimate-request-received-to-user','portuguese','Estimate Request Received (Sent to User) [portuguese]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(1968,'notifications','non-billed-tasks-reminder','portuguese','Non-billed tasks reminder (sent to selected staff members) [portuguese]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(1969,'invoice','invoices-batch-payments','portuguese','Invoices Payments Recorded in Batch (Sent to Customer) [portuguese]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(1970,'contract','contract-sign-reminder','portuguese','Contract Sign Reminder (Sent to Customer) [portuguese]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(1971,'timesheets_attendance_mgt','attendance_notice','portuguese','Attendance notice [portuguese]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(1972,'timesheets_attendance_mgt','send_request_approval','portuguese','Send request approval [portuguese]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(1973,'timesheets_attendance_mgt','remind_user_check_in','portuguese','Remind user check in [portuguese]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(1974,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','portuguese','New application (Send to notification recipient) [portuguese]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(1975,'client','affiliate_management_payout_updated','portuguese','Affiliate Payout Request Update [portuguese]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(1976,'client','affiliate_management_signup_through_affiliate_link','portuguese','Successful Signup through Affiliate Link [portuguese]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(1977,'client','affiliate_management_successful_referral_commission','portuguese','Successful Referral Commission Notification [portuguese]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(1978,'staff','affiliate_management_new_payout_request_for_admin','portuguese','Affiliate Payout Request [portuguese]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(1979,'staff','affiliate_management_payout_updated_for_admin','portuguese','Affiliate Payout Request Updated [portuguese]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(1980,'staff','affiliate_management_new_affiliate_signup_for_admin','portuguese','New Affiliate Signup [portuguese]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(1981,'client','affiliate_management_referral_commission_reversal','portuguese','Referral Commission Reversal Notification [portuguese]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(1982,'inventory_warning','inventory-warning-to-staff','portuguese','Inventory warning (Sent to staff) [portuguese]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(1991,'purchase_order','purchase-order-to-contact','portuguese','Purchase Order (Sent to contact) [portuguese]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(1992,'purchase_order','purchase-request-to-contact','portuguese','Purchase Request (Sent to contact) [portuguese]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(1993,'purchase_order','purchase-quotation-to-contact','portuguese','Purchase Quotation (Sent to contact) [portuguese]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(1994,'purchase_order','debit-note-to-contact','portuguese','Debit Note (Sent to contact) [portuguese]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(1995,'purchase_order','purchase-statement-to-contact','portuguese','Purchase Statement (Sent to contact) [portuguese]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(1996,'purchase_order','vendor-registration-confirmed','portuguese','Vendor Registration Confirmed [portuguese]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(1997,'purchase_order','purchase-contract-to-contact','portuguese','Purchase Contract (Sent to contact) [portuguese]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(1998,'purchase_order','new-contact-created','portuguese','New Contact Added/Registered (Welcome Email) [portuguese]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(1999,'purchase_order','purchase-request-approval','portuguese','Request approval [portuguese]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2000,'purchase_order','purchase-send-approved','portuguese','Email send approved [portuguese]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2001,'purchase_order','purchase-send-rejected','portuguese','Email send rejected [portuguese]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2002,'change_candidate_status','change-candidate-status-to-candidate','portuguese','Change Candidate Status (Sent to Candidate) [portuguese]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2003,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','portuguese','Change Candidate Job Applied Status (Sent to Candidate) [portuguese]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2004,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','portuguese','Change Candidate Interview Schedule Status (Sent to Candidate) [portuguese]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2005,'new_candidate_have_applied','new-candidate-have-applied','portuguese','New candidate have applied (Sent to Responsible) [portuguese]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2006,'staff','flexibackup-new-backup-to-staff','portuguese','Flexi Backup Notification [portuguese]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2007,'client','new-client-created','portuguese_br','New Contact Added/Registered (Welcome Email) [portuguese_br]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2008,'invoice','invoice-send-to-client','portuguese_br','Send Invoice to Customer [portuguese_br]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2009,'ticket','new-ticket-opened-admin','portuguese_br','New Ticket Opened (Opened by Staff, Sent to Customer) [portuguese_br]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2010,'ticket','ticket-reply','portuguese_br','Ticket Reply (Sent to Customer) [portuguese_br]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2011,'ticket','ticket-autoresponse','portuguese_br','New Ticket Opened - Autoresponse [portuguese_br]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2012,'invoice','invoice-payment-recorded','portuguese_br','Invoice Payment Recorded (Sent to Customer) [portuguese_br]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2013,'invoice','invoice-overdue-notice','portuguese_br','Invoice Overdue Notice [portuguese_br]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2014,'invoice','invoice-already-send','portuguese_br','Invoice Already Sent to Customer [portuguese_br]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2015,'ticket','new-ticket-created-staff','portuguese_br','New Ticket Created (Opened by Customer, Sent to Staff Members) [portuguese_br]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2016,'estimate','estimate-send-to-client','portuguese_br','Send Estimate to Customer [portuguese_br]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2017,'ticket','ticket-reply-to-admin','portuguese_br','Ticket Reply (Sent to Staff) [portuguese_br]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2018,'estimate','estimate-already-send','portuguese_br','Estimate Already Sent to Customer [portuguese_br]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2019,'contract','contract-expiration','portuguese_br','Contract Expiration Reminder (Sent to Customer Contacts) [portuguese_br]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2020,'tasks','task-assigned','portuguese_br','New Task Assigned (Sent to Staff) [portuguese_br]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2021,'tasks','task-added-as-follower','portuguese_br','Staff Member Added as Follower on Task (Sent to Staff) [portuguese_br]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2022,'tasks','task-commented','portuguese_br','New Comment on Task (Sent to Staff) [portuguese_br]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2023,'tasks','task-added-attachment','portuguese_br','New Attachment(s) on Task (Sent to Staff) [portuguese_br]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2024,'estimate','estimate-declined-to-staff','portuguese_br','Estimate Declined (Sent to Staff) [portuguese_br]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2025,'estimate','estimate-accepted-to-staff','portuguese_br','Estimate Accepted (Sent to Staff) [portuguese_br]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2026,'proposals','proposal-client-accepted','portuguese_br','Customer Action - Accepted (Sent to Staff) [portuguese_br]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2027,'proposals','proposal-send-to-customer','portuguese_br','Send Proposal to Customer [portuguese_br]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2028,'proposals','proposal-client-declined','portuguese_br','Customer Action - Declined (Sent to Staff) [portuguese_br]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2029,'proposals','proposal-client-thank-you','portuguese_br','Thank You Email (Sent to Customer After Accept) [portuguese_br]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2030,'proposals','proposal-comment-to-client','portuguese_br','New Comment Â (Sent to Customer/Lead) [portuguese_br]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2031,'proposals','proposal-comment-to-admin','portuguese_br','New Comment (Sent to Staff)  [portuguese_br]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2032,'estimate','estimate-thank-you-to-customer','portuguese_br','Thank You Email (Sent to Customer After Accept) [portuguese_br]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2033,'tasks','task-deadline-notification','portuguese_br','Task Deadline Reminder - Sent to Assigned Members [portuguese_br]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2034,'contract','send-contract','portuguese_br','Send Contract to Customer [portuguese_br]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2035,'invoice','invoice-payment-recorded-to-staff','portuguese_br','Invoice Payment Recorded (Sent to Staff) [portuguese_br]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2036,'ticket','auto-close-ticket','portuguese_br','Auto Close Ticket [portuguese_br]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2037,'project','new-project-discussion-created-to-staff','portuguese_br','New Project Discussion (Sent to Project Members) [portuguese_br]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2038,'project','new-project-discussion-created-to-customer','portuguese_br','New Project Discussion (Sent to Customer Contacts) [portuguese_br]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2039,'project','new-project-file-uploaded-to-customer','portuguese_br','New Project File(s) Uploaded (Sent to Customer Contacts) [portuguese_br]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2040,'project','new-project-file-uploaded-to-staff','portuguese_br','New Project File(s) Uploaded (Sent to Project Members) [portuguese_br]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2041,'project','new-project-discussion-comment-to-customer','portuguese_br','New Discussion Comment  (Sent to Customer Contacts) [portuguese_br]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2042,'project','new-project-discussion-comment-to-staff','portuguese_br','New Discussion Comment (Sent to Project Members) [portuguese_br]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2043,'project','staff-added-as-project-member','portuguese_br','Staff Added as Project Member [portuguese_br]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2044,'estimate','estimate-expiry-reminder','portuguese_br','Estimate Expiration Reminder [portuguese_br]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2045,'proposals','proposal-expiry-reminder','portuguese_br','Proposal Expiration Reminder [portuguese_br]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2046,'staff','new-staff-created','portuguese_br','New Staff Created (Welcome Email) [portuguese_br]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2047,'client','contact-forgot-password','portuguese_br','Forgot Password [portuguese_br]','Create New Password','','DOT One Business Solution','',0,1,0),(2048,'client','contact-password-reseted','portuguese_br','Password Reset - Confirmation [portuguese_br]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2049,'client','contact-set-password','portuguese_br','Set New Password [portuguese_br]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2050,'staff','staff-forgot-password','portuguese_br','Forgot Password [portuguese_br]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2051,'staff','staff-password-reseted','portuguese_br','Password Reset - Confirmation [portuguese_br]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2052,'project','assigned-to-project','portuguese_br','New Project Created (Sent to Customer Contacts) [portuguese_br]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2053,'tasks','task-added-attachment-to-contacts','portuguese_br','New Attachment(s) on Task (Sent to Customer Contacts) [portuguese_br]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2054,'tasks','task-commented-to-contacts','portuguese_br','New Comment on Task (Sent to Customer Contacts) [portuguese_br]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2055,'leads','new-lead-assigned','portuguese_br','New Lead Assigned to Staff Member [portuguese_br]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(2056,'client','client-statement','portuguese_br','Statement - Account Summary [portuguese_br]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(2057,'ticket','ticket-assigned-to-admin','portuguese_br','New Ticket Assigned (Sent to Staff) [portuguese_br]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(2058,'client','new-client-registered-to-admin','portuguese_br','New Customer Registration (Sent to admins) [portuguese_br]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(2059,'leads','new-web-to-lead-form-submitted','portuguese_br','Web to lead form submitted - Sent to lead [portuguese_br]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(2060,'staff','two-factor-authentication','portuguese_br','Two Factor Authentication [portuguese_br]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(2061,'project','project-finished-to-customer','portuguese_br','Project Marked as Finished (Sent to Customer Contacts) [portuguese_br]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(2062,'credit_note','credit-note-send-to-client','portuguese_br','Send Credit Note To Email [portuguese_br]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(2063,'tasks','task-status-change-to-staff','portuguese_br','Task Status Changed (Sent to Staff) [portuguese_br]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2064,'tasks','task-status-change-to-contacts','portuguese_br','Task Status Changed (Sent to Customer Contacts) [portuguese_br]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2065,'staff','reminder-email-staff','portuguese_br','Staff Reminder Email [portuguese_br]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(2066,'contract','contract-comment-to-client','portuguese_br','New Comment Â (Sent to Customer Contacts) [portuguese_br]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2067,'contract','contract-comment-to-admin','portuguese_br','New Comment (Sent to Staff)  [portuguese_br]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2068,'subscriptions','send-subscription','portuguese_br','Send Subscription to Customer [portuguese_br]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(2069,'subscriptions','subscription-payment-failed','portuguese_br','Subscription Payment Failed [portuguese_br]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(2070,'subscriptions','subscription-canceled','portuguese_br','Subscription Canceled (Sent to customer primary contact) [portuguese_br]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(2071,'subscriptions','subscription-payment-succeeded','portuguese_br','Subscription Payment Succeeded (Sent to customer primary contact) [portuguese_br]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(2072,'contract','contract-expiration-to-staff','portuguese_br','Contract Expiration Reminder (Sent to Staff) [portuguese_br]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2073,'gdpr','gdpr-removal-request','portuguese_br','Removal Request From Contact (Sent to administrators) [portuguese_br]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2074,'gdpr','gdpr-removal-request-lead','portuguese_br','Removal Request From Lead (Sent to administrators) [portuguese_br]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2075,'client','client-registration-confirmed','portuguese_br','Customer Registration Confirmed [portuguese_br]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2076,'contract','contract-signed-to-staff','portuguese_br','Contract Signed (Sent to Staff) [portuguese_br]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(2077,'subscriptions','customer-subscribed-to-staff','portuguese_br','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [portuguese_br]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(2078,'client','contact-verification-email','portuguese_br','Email Verification (Sent to Contact After Registration) [portuguese_br]','Verify Email Address','','{companyname}','',0,1,0),(2079,'client','new-customer-profile-file-uploaded-to-staff','portuguese_br','New Customer Profile File(s) Uploaded (Sent to Staff) [portuguese_br]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(2080,'staff','event-notification-to-staff','portuguese_br','Event Notification (Calendar) [portuguese_br]','Upcoming Event - {event_title}','','',NULL,0,1,0),(2081,'subscriptions','subscription-payment-requires-action','portuguese_br','Credit Card Authorization Required - SCA [portuguese_br]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(2082,'invoice','invoice-due-notice','portuguese_br','Invoice Due Notice [portuguese_br]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(2083,'estimate_request','estimate-request-submitted-to-staff','portuguese_br','Estimate Request Submitted (Sent to Staff) [portuguese_br]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(2084,'estimate_request','estimate-request-assigned','portuguese_br','Estimate Request Assigned (Sent to Staff) [portuguese_br]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(2085,'estimate_request','estimate-request-received-to-user','portuguese_br','Estimate Request Received (Sent to User) [portuguese_br]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(2086,'notifications','non-billed-tasks-reminder','portuguese_br','Non-billed tasks reminder (sent to selected staff members) [portuguese_br]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(2087,'invoice','invoices-batch-payments','portuguese_br','Invoices Payments Recorded in Batch (Sent to Customer) [portuguese_br]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(2088,'contract','contract-sign-reminder','portuguese_br','Contract Sign Reminder (Sent to Customer) [portuguese_br]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(2089,'timesheets_attendance_mgt','attendance_notice','portuguese_br','Attendance notice [portuguese_br]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(2090,'timesheets_attendance_mgt','send_request_approval','portuguese_br','Send request approval [portuguese_br]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(2091,'timesheets_attendance_mgt','remind_user_check_in','portuguese_br','Remind user check in [portuguese_br]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(2092,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','portuguese_br','New application (Send to notification recipient) [portuguese_br]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(2093,'client','affiliate_management_payout_updated','portuguese_br','Affiliate Payout Request Update [portuguese_br]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(2094,'client','affiliate_management_signup_through_affiliate_link','portuguese_br','Successful Signup through Affiliate Link [portuguese_br]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(2095,'client','affiliate_management_successful_referral_commission','portuguese_br','Successful Referral Commission Notification [portuguese_br]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(2096,'staff','affiliate_management_new_payout_request_for_admin','portuguese_br','Affiliate Payout Request [portuguese_br]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(2097,'staff','affiliate_management_payout_updated_for_admin','portuguese_br','Affiliate Payout Request Updated [portuguese_br]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(2098,'staff','affiliate_management_new_affiliate_signup_for_admin','portuguese_br','New Affiliate Signup [portuguese_br]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(2099,'client','affiliate_management_referral_commission_reversal','portuguese_br','Referral Commission Reversal Notification [portuguese_br]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(2100,'inventory_warning','inventory-warning-to-staff','portuguese_br','Inventory warning (Sent to staff) [portuguese_br]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(2109,'purchase_order','purchase-order-to-contact','portuguese_br','Purchase Order (Sent to contact) [portuguese_br]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(2110,'purchase_order','purchase-request-to-contact','portuguese_br','Purchase Request (Sent to contact) [portuguese_br]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(2111,'purchase_order','purchase-quotation-to-contact','portuguese_br','Purchase Quotation (Sent to contact) [portuguese_br]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(2112,'purchase_order','debit-note-to-contact','portuguese_br','Debit Note (Sent to contact) [portuguese_br]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(2113,'purchase_order','purchase-statement-to-contact','portuguese_br','Purchase Statement (Sent to contact) [portuguese_br]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(2114,'purchase_order','vendor-registration-confirmed','portuguese_br','Vendor Registration Confirmed [portuguese_br]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2115,'purchase_order','purchase-contract-to-contact','portuguese_br','Purchase Contract (Sent to contact) [portuguese_br]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(2116,'purchase_order','new-contact-created','portuguese_br','New Contact Added/Registered (Welcome Email) [portuguese_br]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(2117,'purchase_order','purchase-request-approval','portuguese_br','Request approval [portuguese_br]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2118,'purchase_order','purchase-send-approved','portuguese_br','Email send approved [portuguese_br]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2119,'purchase_order','purchase-send-rejected','portuguese_br','Email send rejected [portuguese_br]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2120,'change_candidate_status','change-candidate-status-to-candidate','portuguese_br','Change Candidate Status (Sent to Candidate) [portuguese_br]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2121,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','portuguese_br','Change Candidate Job Applied Status (Sent to Candidate) [portuguese_br]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2122,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','portuguese_br','Change Candidate Interview Schedule Status (Sent to Candidate) [portuguese_br]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2123,'new_candidate_have_applied','new-candidate-have-applied','portuguese_br','New candidate have applied (Sent to Responsible) [portuguese_br]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2124,'staff','flexibackup-new-backup-to-staff','portuguese_br','Flexi Backup Notification [portuguese_br]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2125,'client','new-client-created','romanian','New Contact Added/Registered (Welcome Email) [romanian]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2126,'invoice','invoice-send-to-client','romanian','Send Invoice to Customer [romanian]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2127,'ticket','new-ticket-opened-admin','romanian','New Ticket Opened (Opened by Staff, Sent to Customer) [romanian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2128,'ticket','ticket-reply','romanian','Ticket Reply (Sent to Customer) [romanian]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2129,'ticket','ticket-autoresponse','romanian','New Ticket Opened - Autoresponse [romanian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2130,'invoice','invoice-payment-recorded','romanian','Invoice Payment Recorded (Sent to Customer) [romanian]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2131,'invoice','invoice-overdue-notice','romanian','Invoice Overdue Notice [romanian]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2132,'invoice','invoice-already-send','romanian','Invoice Already Sent to Customer [romanian]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2133,'ticket','new-ticket-created-staff','romanian','New Ticket Created (Opened by Customer, Sent to Staff Members) [romanian]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2134,'estimate','estimate-send-to-client','romanian','Send Estimate to Customer [romanian]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2135,'ticket','ticket-reply-to-admin','romanian','Ticket Reply (Sent to Staff) [romanian]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2136,'estimate','estimate-already-send','romanian','Estimate Already Sent to Customer [romanian]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2137,'contract','contract-expiration','romanian','Contract Expiration Reminder (Sent to Customer Contacts) [romanian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2138,'tasks','task-assigned','romanian','New Task Assigned (Sent to Staff) [romanian]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2139,'tasks','task-added-as-follower','romanian','Staff Member Added as Follower on Task (Sent to Staff) [romanian]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2140,'tasks','task-commented','romanian','New Comment on Task (Sent to Staff) [romanian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2141,'tasks','task-added-attachment','romanian','New Attachment(s) on Task (Sent to Staff) [romanian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2142,'estimate','estimate-declined-to-staff','romanian','Estimate Declined (Sent to Staff) [romanian]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2143,'estimate','estimate-accepted-to-staff','romanian','Estimate Accepted (Sent to Staff) [romanian]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2144,'proposals','proposal-client-accepted','romanian','Customer Action - Accepted (Sent to Staff) [romanian]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2145,'proposals','proposal-send-to-customer','romanian','Send Proposal to Customer [romanian]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2146,'proposals','proposal-client-declined','romanian','Customer Action - Declined (Sent to Staff) [romanian]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2147,'proposals','proposal-client-thank-you','romanian','Thank You Email (Sent to Customer After Accept) [romanian]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2148,'proposals','proposal-comment-to-client','romanian','New Comment Â (Sent to Customer/Lead) [romanian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2149,'proposals','proposal-comment-to-admin','romanian','New Comment (Sent to Staff)  [romanian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2150,'estimate','estimate-thank-you-to-customer','romanian','Thank You Email (Sent to Customer After Accept) [romanian]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2151,'tasks','task-deadline-notification','romanian','Task Deadline Reminder - Sent to Assigned Members [romanian]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2152,'contract','send-contract','romanian','Send Contract to Customer [romanian]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2153,'invoice','invoice-payment-recorded-to-staff','romanian','Invoice Payment Recorded (Sent to Staff) [romanian]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2154,'ticket','auto-close-ticket','romanian','Auto Close Ticket [romanian]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2155,'project','new-project-discussion-created-to-staff','romanian','New Project Discussion (Sent to Project Members) [romanian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2156,'project','new-project-discussion-created-to-customer','romanian','New Project Discussion (Sent to Customer Contacts) [romanian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2157,'project','new-project-file-uploaded-to-customer','romanian','New Project File(s) Uploaded (Sent to Customer Contacts) [romanian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2158,'project','new-project-file-uploaded-to-staff','romanian','New Project File(s) Uploaded (Sent to Project Members) [romanian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2159,'project','new-project-discussion-comment-to-customer','romanian','New Discussion Comment  (Sent to Customer Contacts) [romanian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2160,'project','new-project-discussion-comment-to-staff','romanian','New Discussion Comment (Sent to Project Members) [romanian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2161,'project','staff-added-as-project-member','romanian','Staff Added as Project Member [romanian]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2162,'estimate','estimate-expiry-reminder','romanian','Estimate Expiration Reminder [romanian]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2163,'proposals','proposal-expiry-reminder','romanian','Proposal Expiration Reminder [romanian]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2164,'staff','new-staff-created','romanian','New Staff Created (Welcome Email) [romanian]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2165,'client','contact-forgot-password','romanian','Forgot Password [romanian]','Create New Password','','DOT One Business Solution','',0,1,0),(2166,'client','contact-password-reseted','romanian','Password Reset - Confirmation [romanian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2167,'client','contact-set-password','romanian','Set New Password [romanian]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2168,'staff','staff-forgot-password','romanian','Forgot Password [romanian]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2169,'staff','staff-password-reseted','romanian','Password Reset - Confirmation [romanian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2170,'project','assigned-to-project','romanian','New Project Created (Sent to Customer Contacts) [romanian]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2171,'tasks','task-added-attachment-to-contacts','romanian','New Attachment(s) on Task (Sent to Customer Contacts) [romanian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2172,'tasks','task-commented-to-contacts','romanian','New Comment on Task (Sent to Customer Contacts) [romanian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2173,'leads','new-lead-assigned','romanian','New Lead Assigned to Staff Member [romanian]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(2174,'client','client-statement','romanian','Statement - Account Summary [romanian]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(2175,'ticket','ticket-assigned-to-admin','romanian','New Ticket Assigned (Sent to Staff) [romanian]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(2176,'client','new-client-registered-to-admin','romanian','New Customer Registration (Sent to admins) [romanian]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(2177,'leads','new-web-to-lead-form-submitted','romanian','Web to lead form submitted - Sent to lead [romanian]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(2178,'staff','two-factor-authentication','romanian','Two Factor Authentication [romanian]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(2179,'project','project-finished-to-customer','romanian','Project Marked as Finished (Sent to Customer Contacts) [romanian]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(2180,'credit_note','credit-note-send-to-client','romanian','Send Credit Note To Email [romanian]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(2181,'tasks','task-status-change-to-staff','romanian','Task Status Changed (Sent to Staff) [romanian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2182,'tasks','task-status-change-to-contacts','romanian','Task Status Changed (Sent to Customer Contacts) [romanian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2183,'staff','reminder-email-staff','romanian','Staff Reminder Email [romanian]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(2184,'contract','contract-comment-to-client','romanian','New Comment Â (Sent to Customer Contacts) [romanian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2185,'contract','contract-comment-to-admin','romanian','New Comment (Sent to Staff)  [romanian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2186,'subscriptions','send-subscription','romanian','Send Subscription to Customer [romanian]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(2187,'subscriptions','subscription-payment-failed','romanian','Subscription Payment Failed [romanian]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(2188,'subscriptions','subscription-canceled','romanian','Subscription Canceled (Sent to customer primary contact) [romanian]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(2189,'subscriptions','subscription-payment-succeeded','romanian','Subscription Payment Succeeded (Sent to customer primary contact) [romanian]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(2190,'contract','contract-expiration-to-staff','romanian','Contract Expiration Reminder (Sent to Staff) [romanian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2191,'gdpr','gdpr-removal-request','romanian','Removal Request From Contact (Sent to administrators) [romanian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2192,'gdpr','gdpr-removal-request-lead','romanian','Removal Request From Lead (Sent to administrators) [romanian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2193,'client','client-registration-confirmed','romanian','Customer Registration Confirmed [romanian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2194,'contract','contract-signed-to-staff','romanian','Contract Signed (Sent to Staff) [romanian]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(2195,'subscriptions','customer-subscribed-to-staff','romanian','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [romanian]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(2196,'client','contact-verification-email','romanian','Email Verification (Sent to Contact After Registration) [romanian]','Verify Email Address','','{companyname}','',0,1,0),(2197,'client','new-customer-profile-file-uploaded-to-staff','romanian','New Customer Profile File(s) Uploaded (Sent to Staff) [romanian]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(2198,'staff','event-notification-to-staff','romanian','Event Notification (Calendar) [romanian]','Upcoming Event - {event_title}','','',NULL,0,1,0),(2199,'subscriptions','subscription-payment-requires-action','romanian','Credit Card Authorization Required - SCA [romanian]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(2200,'invoice','invoice-due-notice','romanian','Invoice Due Notice [romanian]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(2201,'estimate_request','estimate-request-submitted-to-staff','romanian','Estimate Request Submitted (Sent to Staff) [romanian]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(2202,'estimate_request','estimate-request-assigned','romanian','Estimate Request Assigned (Sent to Staff) [romanian]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(2203,'estimate_request','estimate-request-received-to-user','romanian','Estimate Request Received (Sent to User) [romanian]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(2204,'notifications','non-billed-tasks-reminder','romanian','Non-billed tasks reminder (sent to selected staff members) [romanian]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(2205,'invoice','invoices-batch-payments','romanian','Invoices Payments Recorded in Batch (Sent to Customer) [romanian]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(2206,'contract','contract-sign-reminder','romanian','Contract Sign Reminder (Sent to Customer) [romanian]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(2207,'timesheets_attendance_mgt','attendance_notice','romanian','Attendance notice [romanian]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(2208,'timesheets_attendance_mgt','send_request_approval','romanian','Send request approval [romanian]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(2209,'timesheets_attendance_mgt','remind_user_check_in','romanian','Remind user check in [romanian]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(2210,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','romanian','New application (Send to notification recipient) [romanian]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(2211,'client','affiliate_management_payout_updated','romanian','Affiliate Payout Request Update [romanian]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(2212,'client','affiliate_management_signup_through_affiliate_link','romanian','Successful Signup through Affiliate Link [romanian]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(2213,'client','affiliate_management_successful_referral_commission','romanian','Successful Referral Commission Notification [romanian]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(2214,'staff','affiliate_management_new_payout_request_for_admin','romanian','Affiliate Payout Request [romanian]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(2215,'staff','affiliate_management_payout_updated_for_admin','romanian','Affiliate Payout Request Updated [romanian]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(2216,'staff','affiliate_management_new_affiliate_signup_for_admin','romanian','New Affiliate Signup [romanian]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(2217,'client','affiliate_management_referral_commission_reversal','romanian','Referral Commission Reversal Notification [romanian]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(2218,'inventory_warning','inventory-warning-to-staff','romanian','Inventory warning (Sent to staff) [romanian]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(2227,'purchase_order','purchase-order-to-contact','romanian','Purchase Order (Sent to contact) [romanian]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(2228,'purchase_order','purchase-request-to-contact','romanian','Purchase Request (Sent to contact) [romanian]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(2229,'purchase_order','purchase-quotation-to-contact','romanian','Purchase Quotation (Sent to contact) [romanian]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(2230,'purchase_order','debit-note-to-contact','romanian','Debit Note (Sent to contact) [romanian]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(2231,'purchase_order','purchase-statement-to-contact','romanian','Purchase Statement (Sent to contact) [romanian]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(2232,'purchase_order','vendor-registration-confirmed','romanian','Vendor Registration Confirmed [romanian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2233,'purchase_order','purchase-contract-to-contact','romanian','Purchase Contract (Sent to contact) [romanian]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(2234,'purchase_order','new-contact-created','romanian','New Contact Added/Registered (Welcome Email) [romanian]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(2235,'purchase_order','purchase-request-approval','romanian','Request approval [romanian]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2236,'purchase_order','purchase-send-approved','romanian','Email send approved [romanian]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2237,'purchase_order','purchase-send-rejected','romanian','Email send rejected [romanian]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2238,'change_candidate_status','change-candidate-status-to-candidate','romanian','Change Candidate Status (Sent to Candidate) [romanian]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2239,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','romanian','Change Candidate Job Applied Status (Sent to Candidate) [romanian]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2240,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','romanian','Change Candidate Interview Schedule Status (Sent to Candidate) [romanian]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2241,'new_candidate_have_applied','new-candidate-have-applied','romanian','New candidate have applied (Sent to Responsible) [romanian]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2242,'staff','flexibackup-new-backup-to-staff','romanian','Flexi Backup Notification [romanian]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2243,'client','new-client-created','russian','New Contact Added/Registered (Welcome Email) [russian]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2244,'invoice','invoice-send-to-client','russian','Send Invoice to Customer [russian]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2245,'ticket','new-ticket-opened-admin','russian','New Ticket Opened (Opened by Staff, Sent to Customer) [russian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2246,'ticket','ticket-reply','russian','Ticket Reply (Sent to Customer) [russian]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2247,'ticket','ticket-autoresponse','russian','New Ticket Opened - Autoresponse [russian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2248,'invoice','invoice-payment-recorded','russian','Invoice Payment Recorded (Sent to Customer) [russian]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2249,'invoice','invoice-overdue-notice','russian','Invoice Overdue Notice [russian]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2250,'invoice','invoice-already-send','russian','Invoice Already Sent to Customer [russian]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2251,'ticket','new-ticket-created-staff','russian','New Ticket Created (Opened by Customer, Sent to Staff Members) [russian]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2252,'estimate','estimate-send-to-client','russian','Send Estimate to Customer [russian]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2253,'ticket','ticket-reply-to-admin','russian','Ticket Reply (Sent to Staff) [russian]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2254,'estimate','estimate-already-send','russian','Estimate Already Sent to Customer [russian]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2255,'contract','contract-expiration','russian','Contract Expiration Reminder (Sent to Customer Contacts) [russian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2256,'tasks','task-assigned','russian','New Task Assigned (Sent to Staff) [russian]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2257,'tasks','task-added-as-follower','russian','Staff Member Added as Follower on Task (Sent to Staff) [russian]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2258,'tasks','task-commented','russian','New Comment on Task (Sent to Staff) [russian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2259,'tasks','task-added-attachment','russian','New Attachment(s) on Task (Sent to Staff) [russian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2260,'estimate','estimate-declined-to-staff','russian','Estimate Declined (Sent to Staff) [russian]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2261,'estimate','estimate-accepted-to-staff','russian','Estimate Accepted (Sent to Staff) [russian]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2262,'proposals','proposal-client-accepted','russian','Customer Action - Accepted (Sent to Staff) [russian]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2263,'proposals','proposal-send-to-customer','russian','Send Proposal to Customer [russian]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2264,'proposals','proposal-client-declined','russian','Customer Action - Declined (Sent to Staff) [russian]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2265,'proposals','proposal-client-thank-you','russian','Thank You Email (Sent to Customer After Accept) [russian]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2266,'proposals','proposal-comment-to-client','russian','New Comment Â (Sent to Customer/Lead) [russian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2267,'proposals','proposal-comment-to-admin','russian','New Comment (Sent to Staff)  [russian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2268,'estimate','estimate-thank-you-to-customer','russian','Thank You Email (Sent to Customer After Accept) [russian]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2269,'tasks','task-deadline-notification','russian','Task Deadline Reminder - Sent to Assigned Members [russian]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2270,'contract','send-contract','russian','Send Contract to Customer [russian]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2271,'invoice','invoice-payment-recorded-to-staff','russian','Invoice Payment Recorded (Sent to Staff) [russian]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2272,'ticket','auto-close-ticket','russian','Auto Close Ticket [russian]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2273,'project','new-project-discussion-created-to-staff','russian','New Project Discussion (Sent to Project Members) [russian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2274,'project','new-project-discussion-created-to-customer','russian','New Project Discussion (Sent to Customer Contacts) [russian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2275,'project','new-project-file-uploaded-to-customer','russian','New Project File(s) Uploaded (Sent to Customer Contacts) [russian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2276,'project','new-project-file-uploaded-to-staff','russian','New Project File(s) Uploaded (Sent to Project Members) [russian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2277,'project','new-project-discussion-comment-to-customer','russian','New Discussion Comment  (Sent to Customer Contacts) [russian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2278,'project','new-project-discussion-comment-to-staff','russian','New Discussion Comment (Sent to Project Members) [russian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2279,'project','staff-added-as-project-member','russian','Staff Added as Project Member [russian]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2280,'estimate','estimate-expiry-reminder','russian','Estimate Expiration Reminder [russian]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2281,'proposals','proposal-expiry-reminder','russian','Proposal Expiration Reminder [russian]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2282,'staff','new-staff-created','russian','New Staff Created (Welcome Email) [russian]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2283,'client','contact-forgot-password','russian','Forgot Password [russian]','Create New Password','','DOT One Business Solution','',0,1,0),(2284,'client','contact-password-reseted','russian','Password Reset - Confirmation [russian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2285,'client','contact-set-password','russian','Set New Password [russian]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2286,'staff','staff-forgot-password','russian','Forgot Password [russian]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2287,'staff','staff-password-reseted','russian','Password Reset - Confirmation [russian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2288,'project','assigned-to-project','russian','New Project Created (Sent to Customer Contacts) [russian]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2289,'tasks','task-added-attachment-to-contacts','russian','New Attachment(s) on Task (Sent to Customer Contacts) [russian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2290,'tasks','task-commented-to-contacts','russian','New Comment on Task (Sent to Customer Contacts) [russian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2291,'leads','new-lead-assigned','russian','New Lead Assigned to Staff Member [russian]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(2292,'client','client-statement','russian','Statement - Account Summary [russian]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(2293,'ticket','ticket-assigned-to-admin','russian','New Ticket Assigned (Sent to Staff) [russian]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(2294,'client','new-client-registered-to-admin','russian','New Customer Registration (Sent to admins) [russian]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(2295,'leads','new-web-to-lead-form-submitted','russian','Web to lead form submitted - Sent to lead [russian]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(2296,'staff','two-factor-authentication','russian','Two Factor Authentication [russian]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(2297,'project','project-finished-to-customer','russian','Project Marked as Finished (Sent to Customer Contacts) [russian]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(2298,'credit_note','credit-note-send-to-client','russian','Send Credit Note To Email [russian]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(2299,'tasks','task-status-change-to-staff','russian','Task Status Changed (Sent to Staff) [russian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2300,'tasks','task-status-change-to-contacts','russian','Task Status Changed (Sent to Customer Contacts) [russian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2301,'staff','reminder-email-staff','russian','Staff Reminder Email [russian]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(2302,'contract','contract-comment-to-client','russian','New Comment Â (Sent to Customer Contacts) [russian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2303,'contract','contract-comment-to-admin','russian','New Comment (Sent to Staff)  [russian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2304,'subscriptions','send-subscription','russian','Send Subscription to Customer [russian]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(2305,'subscriptions','subscription-payment-failed','russian','Subscription Payment Failed [russian]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(2306,'subscriptions','subscription-canceled','russian','Subscription Canceled (Sent to customer primary contact) [russian]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(2307,'subscriptions','subscription-payment-succeeded','russian','Subscription Payment Succeeded (Sent to customer primary contact) [russian]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(2308,'contract','contract-expiration-to-staff','russian','Contract Expiration Reminder (Sent to Staff) [russian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2309,'gdpr','gdpr-removal-request','russian','Removal Request From Contact (Sent to administrators) [russian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2310,'gdpr','gdpr-removal-request-lead','russian','Removal Request From Lead (Sent to administrators) [russian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2311,'client','client-registration-confirmed','russian','Customer Registration Confirmed [russian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2312,'contract','contract-signed-to-staff','russian','Contract Signed (Sent to Staff) [russian]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(2313,'subscriptions','customer-subscribed-to-staff','russian','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [russian]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(2314,'client','contact-verification-email','russian','Email Verification (Sent to Contact After Registration) [russian]','Verify Email Address','','{companyname}','',0,1,0),(2315,'client','new-customer-profile-file-uploaded-to-staff','russian','New Customer Profile File(s) Uploaded (Sent to Staff) [russian]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(2316,'staff','event-notification-to-staff','russian','Event Notification (Calendar) [russian]','Upcoming Event - {event_title}','','',NULL,0,1,0),(2317,'subscriptions','subscription-payment-requires-action','russian','Credit Card Authorization Required - SCA [russian]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(2318,'invoice','invoice-due-notice','russian','Invoice Due Notice [russian]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(2319,'estimate_request','estimate-request-submitted-to-staff','russian','Estimate Request Submitted (Sent to Staff) [russian]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(2320,'estimate_request','estimate-request-assigned','russian','Estimate Request Assigned (Sent to Staff) [russian]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(2321,'estimate_request','estimate-request-received-to-user','russian','Estimate Request Received (Sent to User) [russian]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(2322,'notifications','non-billed-tasks-reminder','russian','Non-billed tasks reminder (sent to selected staff members) [russian]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(2323,'invoice','invoices-batch-payments','russian','Invoices Payments Recorded in Batch (Sent to Customer) [russian]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(2324,'contract','contract-sign-reminder','russian','Contract Sign Reminder (Sent to Customer) [russian]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(2325,'timesheets_attendance_mgt','attendance_notice','russian','Attendance notice [russian]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(2326,'timesheets_attendance_mgt','send_request_approval','russian','Send request approval [russian]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(2327,'timesheets_attendance_mgt','remind_user_check_in','russian','Remind user check in [russian]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(2328,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','russian','New application (Send to notification recipient) [russian]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(2329,'client','affiliate_management_payout_updated','russian','Affiliate Payout Request Update [russian]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(2330,'client','affiliate_management_signup_through_affiliate_link','russian','Successful Signup through Affiliate Link [russian]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(2331,'client','affiliate_management_successful_referral_commission','russian','Successful Referral Commission Notification [russian]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(2332,'staff','affiliate_management_new_payout_request_for_admin','russian','Affiliate Payout Request [russian]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(2333,'staff','affiliate_management_payout_updated_for_admin','russian','Affiliate Payout Request Updated [russian]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(2334,'staff','affiliate_management_new_affiliate_signup_for_admin','russian','New Affiliate Signup [russian]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(2335,'client','affiliate_management_referral_commission_reversal','russian','Referral Commission Reversal Notification [russian]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(2336,'inventory_warning','inventory-warning-to-staff','russian','Inventory warning (Sent to staff) [russian]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(2345,'purchase_order','purchase-order-to-contact','russian','Purchase Order (Sent to contact) [russian]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(2346,'purchase_order','purchase-request-to-contact','russian','Purchase Request (Sent to contact) [russian]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(2347,'purchase_order','purchase-quotation-to-contact','russian','Purchase Quotation (Sent to contact) [russian]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(2348,'purchase_order','debit-note-to-contact','russian','Debit Note (Sent to contact) [russian]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(2349,'purchase_order','purchase-statement-to-contact','russian','Purchase Statement (Sent to contact) [russian]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(2350,'purchase_order','vendor-registration-confirmed','russian','Vendor Registration Confirmed [russian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2351,'purchase_order','purchase-contract-to-contact','russian','Purchase Contract (Sent to contact) [russian]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(2352,'purchase_order','new-contact-created','russian','New Contact Added/Registered (Welcome Email) [russian]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(2353,'purchase_order','purchase-request-approval','russian','Request approval [russian]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2354,'purchase_order','purchase-send-approved','russian','Email send approved [russian]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2355,'purchase_order','purchase-send-rejected','russian','Email send rejected [russian]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2356,'change_candidate_status','change-candidate-status-to-candidate','russian','Change Candidate Status (Sent to Candidate) [russian]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2357,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','russian','Change Candidate Job Applied Status (Sent to Candidate) [russian]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2358,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','russian','Change Candidate Interview Schedule Status (Sent to Candidate) [russian]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2359,'new_candidate_have_applied','new-candidate-have-applied','russian','New candidate have applied (Sent to Responsible) [russian]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2360,'staff','flexibackup-new-backup-to-staff','russian','Flexi Backup Notification [russian]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2361,'client','new-client-created','slovak','New Contact Added/Registered (Welcome Email) [slovak]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2362,'invoice','invoice-send-to-client','slovak','Send Invoice to Customer [slovak]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2363,'ticket','new-ticket-opened-admin','slovak','New Ticket Opened (Opened by Staff, Sent to Customer) [slovak]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2364,'ticket','ticket-reply','slovak','Ticket Reply (Sent to Customer) [slovak]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2365,'ticket','ticket-autoresponse','slovak','New Ticket Opened - Autoresponse [slovak]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2366,'invoice','invoice-payment-recorded','slovak','Invoice Payment Recorded (Sent to Customer) [slovak]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2367,'invoice','invoice-overdue-notice','slovak','Invoice Overdue Notice [slovak]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2368,'invoice','invoice-already-send','slovak','Invoice Already Sent to Customer [slovak]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2369,'ticket','new-ticket-created-staff','slovak','New Ticket Created (Opened by Customer, Sent to Staff Members) [slovak]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2370,'estimate','estimate-send-to-client','slovak','Send Estimate to Customer [slovak]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2371,'ticket','ticket-reply-to-admin','slovak','Ticket Reply (Sent to Staff) [slovak]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2372,'estimate','estimate-already-send','slovak','Estimate Already Sent to Customer [slovak]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2373,'contract','contract-expiration','slovak','Contract Expiration Reminder (Sent to Customer Contacts) [slovak]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2374,'tasks','task-assigned','slovak','New Task Assigned (Sent to Staff) [slovak]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2375,'tasks','task-added-as-follower','slovak','Staff Member Added as Follower on Task (Sent to Staff) [slovak]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2376,'tasks','task-commented','slovak','New Comment on Task (Sent to Staff) [slovak]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2377,'tasks','task-added-attachment','slovak','New Attachment(s) on Task (Sent to Staff) [slovak]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2378,'estimate','estimate-declined-to-staff','slovak','Estimate Declined (Sent to Staff) [slovak]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2379,'estimate','estimate-accepted-to-staff','slovak','Estimate Accepted (Sent to Staff) [slovak]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2380,'proposals','proposal-client-accepted','slovak','Customer Action - Accepted (Sent to Staff) [slovak]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2381,'proposals','proposal-send-to-customer','slovak','Send Proposal to Customer [slovak]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2382,'proposals','proposal-client-declined','slovak','Customer Action - Declined (Sent to Staff) [slovak]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2383,'proposals','proposal-client-thank-you','slovak','Thank You Email (Sent to Customer After Accept) [slovak]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2384,'proposals','proposal-comment-to-client','slovak','New Comment Â (Sent to Customer/Lead) [slovak]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2385,'proposals','proposal-comment-to-admin','slovak','New Comment (Sent to Staff)  [slovak]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2386,'estimate','estimate-thank-you-to-customer','slovak','Thank You Email (Sent to Customer After Accept) [slovak]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2387,'tasks','task-deadline-notification','slovak','Task Deadline Reminder - Sent to Assigned Members [slovak]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2388,'contract','send-contract','slovak','Send Contract to Customer [slovak]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2389,'invoice','invoice-payment-recorded-to-staff','slovak','Invoice Payment Recorded (Sent to Staff) [slovak]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2390,'ticket','auto-close-ticket','slovak','Auto Close Ticket [slovak]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2391,'project','new-project-discussion-created-to-staff','slovak','New Project Discussion (Sent to Project Members) [slovak]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2392,'project','new-project-discussion-created-to-customer','slovak','New Project Discussion (Sent to Customer Contacts) [slovak]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2393,'project','new-project-file-uploaded-to-customer','slovak','New Project File(s) Uploaded (Sent to Customer Contacts) [slovak]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2394,'project','new-project-file-uploaded-to-staff','slovak','New Project File(s) Uploaded (Sent to Project Members) [slovak]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2395,'project','new-project-discussion-comment-to-customer','slovak','New Discussion Comment  (Sent to Customer Contacts) [slovak]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2396,'project','new-project-discussion-comment-to-staff','slovak','New Discussion Comment (Sent to Project Members) [slovak]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2397,'project','staff-added-as-project-member','slovak','Staff Added as Project Member [slovak]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2398,'estimate','estimate-expiry-reminder','slovak','Estimate Expiration Reminder [slovak]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2399,'proposals','proposal-expiry-reminder','slovak','Proposal Expiration Reminder [slovak]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2400,'staff','new-staff-created','slovak','New Staff Created (Welcome Email) [slovak]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2401,'client','contact-forgot-password','slovak','Forgot Password [slovak]','Create New Password','','DOT One Business Solution','',0,1,0),(2402,'client','contact-password-reseted','slovak','Password Reset - Confirmation [slovak]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2403,'client','contact-set-password','slovak','Set New Password [slovak]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2404,'staff','staff-forgot-password','slovak','Forgot Password [slovak]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2405,'staff','staff-password-reseted','slovak','Password Reset - Confirmation [slovak]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2406,'project','assigned-to-project','slovak','New Project Created (Sent to Customer Contacts) [slovak]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2407,'tasks','task-added-attachment-to-contacts','slovak','New Attachment(s) on Task (Sent to Customer Contacts) [slovak]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2408,'tasks','task-commented-to-contacts','slovak','New Comment on Task (Sent to Customer Contacts) [slovak]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2409,'leads','new-lead-assigned','slovak','New Lead Assigned to Staff Member [slovak]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(2410,'client','client-statement','slovak','Statement - Account Summary [slovak]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(2411,'ticket','ticket-assigned-to-admin','slovak','New Ticket Assigned (Sent to Staff) [slovak]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(2412,'client','new-client-registered-to-admin','slovak','New Customer Registration (Sent to admins) [slovak]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(2413,'leads','new-web-to-lead-form-submitted','slovak','Web to lead form submitted - Sent to lead [slovak]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(2414,'staff','two-factor-authentication','slovak','Two Factor Authentication [slovak]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(2415,'project','project-finished-to-customer','slovak','Project Marked as Finished (Sent to Customer Contacts) [slovak]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(2416,'credit_note','credit-note-send-to-client','slovak','Send Credit Note To Email [slovak]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(2417,'tasks','task-status-change-to-staff','slovak','Task Status Changed (Sent to Staff) [slovak]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2418,'tasks','task-status-change-to-contacts','slovak','Task Status Changed (Sent to Customer Contacts) [slovak]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2419,'staff','reminder-email-staff','slovak','Staff Reminder Email [slovak]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(2420,'contract','contract-comment-to-client','slovak','New Comment Â (Sent to Customer Contacts) [slovak]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2421,'contract','contract-comment-to-admin','slovak','New Comment (Sent to Staff)  [slovak]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2422,'subscriptions','send-subscription','slovak','Send Subscription to Customer [slovak]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(2423,'subscriptions','subscription-payment-failed','slovak','Subscription Payment Failed [slovak]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(2424,'subscriptions','subscription-canceled','slovak','Subscription Canceled (Sent to customer primary contact) [slovak]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(2425,'subscriptions','subscription-payment-succeeded','slovak','Subscription Payment Succeeded (Sent to customer primary contact) [slovak]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(2426,'contract','contract-expiration-to-staff','slovak','Contract Expiration Reminder (Sent to Staff) [slovak]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2427,'gdpr','gdpr-removal-request','slovak','Removal Request From Contact (Sent to administrators) [slovak]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2428,'gdpr','gdpr-removal-request-lead','slovak','Removal Request From Lead (Sent to administrators) [slovak]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2429,'client','client-registration-confirmed','slovak','Customer Registration Confirmed [slovak]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2430,'contract','contract-signed-to-staff','slovak','Contract Signed (Sent to Staff) [slovak]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(2431,'subscriptions','customer-subscribed-to-staff','slovak','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [slovak]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(2432,'client','contact-verification-email','slovak','Email Verification (Sent to Contact After Registration) [slovak]','Verify Email Address','','{companyname}','',0,1,0),(2433,'client','new-customer-profile-file-uploaded-to-staff','slovak','New Customer Profile File(s) Uploaded (Sent to Staff) [slovak]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(2434,'staff','event-notification-to-staff','slovak','Event Notification (Calendar) [slovak]','Upcoming Event - {event_title}','','',NULL,0,1,0),(2435,'subscriptions','subscription-payment-requires-action','slovak','Credit Card Authorization Required - SCA [slovak]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(2436,'invoice','invoice-due-notice','slovak','Invoice Due Notice [slovak]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(2437,'estimate_request','estimate-request-submitted-to-staff','slovak','Estimate Request Submitted (Sent to Staff) [slovak]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(2438,'estimate_request','estimate-request-assigned','slovak','Estimate Request Assigned (Sent to Staff) [slovak]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(2439,'estimate_request','estimate-request-received-to-user','slovak','Estimate Request Received (Sent to User) [slovak]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(2440,'notifications','non-billed-tasks-reminder','slovak','Non-billed tasks reminder (sent to selected staff members) [slovak]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(2441,'invoice','invoices-batch-payments','slovak','Invoices Payments Recorded in Batch (Sent to Customer) [slovak]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(2442,'contract','contract-sign-reminder','slovak','Contract Sign Reminder (Sent to Customer) [slovak]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(2443,'timesheets_attendance_mgt','attendance_notice','slovak','Attendance notice [slovak]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(2444,'timesheets_attendance_mgt','send_request_approval','slovak','Send request approval [slovak]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(2445,'timesheets_attendance_mgt','remind_user_check_in','slovak','Remind user check in [slovak]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(2446,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','slovak','New application (Send to notification recipient) [slovak]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(2447,'client','affiliate_management_payout_updated','slovak','Affiliate Payout Request Update [slovak]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(2448,'client','affiliate_management_signup_through_affiliate_link','slovak','Successful Signup through Affiliate Link [slovak]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(2449,'client','affiliate_management_successful_referral_commission','slovak','Successful Referral Commission Notification [slovak]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(2450,'staff','affiliate_management_new_payout_request_for_admin','slovak','Affiliate Payout Request [slovak]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(2451,'staff','affiliate_management_payout_updated_for_admin','slovak','Affiliate Payout Request Updated [slovak]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(2452,'staff','affiliate_management_new_affiliate_signup_for_admin','slovak','New Affiliate Signup [slovak]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(2453,'client','affiliate_management_referral_commission_reversal','slovak','Referral Commission Reversal Notification [slovak]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(2454,'inventory_warning','inventory-warning-to-staff','slovak','Inventory warning (Sent to staff) [slovak]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(2463,'purchase_order','purchase-order-to-contact','slovak','Purchase Order (Sent to contact) [slovak]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(2464,'purchase_order','purchase-request-to-contact','slovak','Purchase Request (Sent to contact) [slovak]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(2465,'purchase_order','purchase-quotation-to-contact','slovak','Purchase Quotation (Sent to contact) [slovak]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(2466,'purchase_order','debit-note-to-contact','slovak','Debit Note (Sent to contact) [slovak]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(2467,'purchase_order','purchase-statement-to-contact','slovak','Purchase Statement (Sent to contact) [slovak]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(2468,'purchase_order','vendor-registration-confirmed','slovak','Vendor Registration Confirmed [slovak]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2469,'purchase_order','purchase-contract-to-contact','slovak','Purchase Contract (Sent to contact) [slovak]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(2470,'purchase_order','new-contact-created','slovak','New Contact Added/Registered (Welcome Email) [slovak]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(2471,'purchase_order','purchase-request-approval','slovak','Request approval [slovak]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2472,'purchase_order','purchase-send-approved','slovak','Email send approved [slovak]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2473,'purchase_order','purchase-send-rejected','slovak','Email send rejected [slovak]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2474,'change_candidate_status','change-candidate-status-to-candidate','slovak','Change Candidate Status (Sent to Candidate) [slovak]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2475,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','slovak','Change Candidate Job Applied Status (Sent to Candidate) [slovak]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2476,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','slovak','Change Candidate Interview Schedule Status (Sent to Candidate) [slovak]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2477,'new_candidate_have_applied','new-candidate-have-applied','slovak','New candidate have applied (Sent to Responsible) [slovak]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2478,'staff','flexibackup-new-backup-to-staff','slovak','Flexi Backup Notification [slovak]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2479,'client','new-client-created','spanish','New Contact Added/Registered (Welcome Email) [spanish]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2480,'invoice','invoice-send-to-client','spanish','Send Invoice to Customer [spanish]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2481,'ticket','new-ticket-opened-admin','spanish','New Ticket Opened (Opened by Staff, Sent to Customer) [spanish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2482,'ticket','ticket-reply','spanish','Ticket Reply (Sent to Customer) [spanish]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2483,'ticket','ticket-autoresponse','spanish','New Ticket Opened - Autoresponse [spanish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2484,'invoice','invoice-payment-recorded','spanish','Invoice Payment Recorded (Sent to Customer) [spanish]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2485,'invoice','invoice-overdue-notice','spanish','Invoice Overdue Notice [spanish]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2486,'invoice','invoice-already-send','spanish','Invoice Already Sent to Customer [spanish]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2487,'ticket','new-ticket-created-staff','spanish','New Ticket Created (Opened by Customer, Sent to Staff Members) [spanish]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2488,'estimate','estimate-send-to-client','spanish','Send Estimate to Customer [spanish]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2489,'ticket','ticket-reply-to-admin','spanish','Ticket Reply (Sent to Staff) [spanish]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2490,'estimate','estimate-already-send','spanish','Estimate Already Sent to Customer [spanish]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2491,'contract','contract-expiration','spanish','Contract Expiration Reminder (Sent to Customer Contacts) [spanish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2492,'tasks','task-assigned','spanish','New Task Assigned (Sent to Staff) [spanish]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2493,'tasks','task-added-as-follower','spanish','Staff Member Added as Follower on Task (Sent to Staff) [spanish]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2494,'tasks','task-commented','spanish','New Comment on Task (Sent to Staff) [spanish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2495,'tasks','task-added-attachment','spanish','New Attachment(s) on Task (Sent to Staff) [spanish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2496,'estimate','estimate-declined-to-staff','spanish','Estimate Declined (Sent to Staff) [spanish]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2497,'estimate','estimate-accepted-to-staff','spanish','Estimate Accepted (Sent to Staff) [spanish]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2498,'proposals','proposal-client-accepted','spanish','Customer Action - Accepted (Sent to Staff) [spanish]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2499,'proposals','proposal-send-to-customer','spanish','Send Proposal to Customer [spanish]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2500,'proposals','proposal-client-declined','spanish','Customer Action - Declined (Sent to Staff) [spanish]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2501,'proposals','proposal-client-thank-you','spanish','Thank You Email (Sent to Customer After Accept) [spanish]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2502,'proposals','proposal-comment-to-client','spanish','New Comment Â (Sent to Customer/Lead) [spanish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2503,'proposals','proposal-comment-to-admin','spanish','New Comment (Sent to Staff)  [spanish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2504,'estimate','estimate-thank-you-to-customer','spanish','Thank You Email (Sent to Customer After Accept) [spanish]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2505,'tasks','task-deadline-notification','spanish','Task Deadline Reminder - Sent to Assigned Members [spanish]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2506,'contract','send-contract','spanish','Send Contract to Customer [spanish]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2507,'invoice','invoice-payment-recorded-to-staff','spanish','Invoice Payment Recorded (Sent to Staff) [spanish]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2508,'ticket','auto-close-ticket','spanish','Auto Close Ticket [spanish]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2509,'project','new-project-discussion-created-to-staff','spanish','New Project Discussion (Sent to Project Members) [spanish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2510,'project','new-project-discussion-created-to-customer','spanish','New Project Discussion (Sent to Customer Contacts) [spanish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2511,'project','new-project-file-uploaded-to-customer','spanish','New Project File(s) Uploaded (Sent to Customer Contacts) [spanish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2512,'project','new-project-file-uploaded-to-staff','spanish','New Project File(s) Uploaded (Sent to Project Members) [spanish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2513,'project','new-project-discussion-comment-to-customer','spanish','New Discussion Comment  (Sent to Customer Contacts) [spanish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2514,'project','new-project-discussion-comment-to-staff','spanish','New Discussion Comment (Sent to Project Members) [spanish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2515,'project','staff-added-as-project-member','spanish','Staff Added as Project Member [spanish]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2516,'estimate','estimate-expiry-reminder','spanish','Estimate Expiration Reminder [spanish]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2517,'proposals','proposal-expiry-reminder','spanish','Proposal Expiration Reminder [spanish]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2518,'staff','new-staff-created','spanish','New Staff Created (Welcome Email) [spanish]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2519,'client','contact-forgot-password','spanish','Forgot Password [spanish]','Create New Password','','DOT One Business Solution','',0,1,0),(2520,'client','contact-password-reseted','spanish','Password Reset - Confirmation [spanish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2521,'client','contact-set-password','spanish','Set New Password [spanish]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2522,'staff','staff-forgot-password','spanish','Forgot Password [spanish]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2523,'staff','staff-password-reseted','spanish','Password Reset - Confirmation [spanish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2524,'project','assigned-to-project','spanish','New Project Created (Sent to Customer Contacts) [spanish]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2525,'tasks','task-added-attachment-to-contacts','spanish','New Attachment(s) on Task (Sent to Customer Contacts) [spanish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2526,'tasks','task-commented-to-contacts','spanish','New Comment on Task (Sent to Customer Contacts) [spanish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2527,'leads','new-lead-assigned','spanish','New Lead Assigned to Staff Member [spanish]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(2528,'client','client-statement','spanish','Statement - Account Summary [spanish]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(2529,'ticket','ticket-assigned-to-admin','spanish','New Ticket Assigned (Sent to Staff) [spanish]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(2530,'client','new-client-registered-to-admin','spanish','New Customer Registration (Sent to admins) [spanish]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(2531,'leads','new-web-to-lead-form-submitted','spanish','Web to lead form submitted - Sent to lead [spanish]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(2532,'staff','two-factor-authentication','spanish','Two Factor Authentication [spanish]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(2533,'project','project-finished-to-customer','spanish','Project Marked as Finished (Sent to Customer Contacts) [spanish]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(2534,'credit_note','credit-note-send-to-client','spanish','Send Credit Note To Email [spanish]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(2535,'tasks','task-status-change-to-staff','spanish','Task Status Changed (Sent to Staff) [spanish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2536,'tasks','task-status-change-to-contacts','spanish','Task Status Changed (Sent to Customer Contacts) [spanish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2537,'staff','reminder-email-staff','spanish','Staff Reminder Email [spanish]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(2538,'contract','contract-comment-to-client','spanish','New Comment Â (Sent to Customer Contacts) [spanish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2539,'contract','contract-comment-to-admin','spanish','New Comment (Sent to Staff)  [spanish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2540,'subscriptions','send-subscription','spanish','Send Subscription to Customer [spanish]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(2541,'subscriptions','subscription-payment-failed','spanish','Subscription Payment Failed [spanish]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(2542,'subscriptions','subscription-canceled','spanish','Subscription Canceled (Sent to customer primary contact) [spanish]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(2543,'subscriptions','subscription-payment-succeeded','spanish','Subscription Payment Succeeded (Sent to customer primary contact) [spanish]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(2544,'contract','contract-expiration-to-staff','spanish','Contract Expiration Reminder (Sent to Staff) [spanish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2545,'gdpr','gdpr-removal-request','spanish','Removal Request From Contact (Sent to administrators) [spanish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2546,'gdpr','gdpr-removal-request-lead','spanish','Removal Request From Lead (Sent to administrators) [spanish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2547,'client','client-registration-confirmed','spanish','Customer Registration Confirmed [spanish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2548,'contract','contract-signed-to-staff','spanish','Contract Signed (Sent to Staff) [spanish]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(2549,'subscriptions','customer-subscribed-to-staff','spanish','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [spanish]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(2550,'client','contact-verification-email','spanish','Email Verification (Sent to Contact After Registration) [spanish]','Verify Email Address','','{companyname}','',0,1,0),(2551,'client','new-customer-profile-file-uploaded-to-staff','spanish','New Customer Profile File(s) Uploaded (Sent to Staff) [spanish]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(2552,'staff','event-notification-to-staff','spanish','Event Notification (Calendar) [spanish]','Upcoming Event - {event_title}','','',NULL,0,1,0),(2553,'subscriptions','subscription-payment-requires-action','spanish','Credit Card Authorization Required - SCA [spanish]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(2554,'invoice','invoice-due-notice','spanish','Invoice Due Notice [spanish]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(2555,'estimate_request','estimate-request-submitted-to-staff','spanish','Estimate Request Submitted (Sent to Staff) [spanish]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(2556,'estimate_request','estimate-request-assigned','spanish','Estimate Request Assigned (Sent to Staff) [spanish]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(2557,'estimate_request','estimate-request-received-to-user','spanish','Estimate Request Received (Sent to User) [spanish]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(2558,'notifications','non-billed-tasks-reminder','spanish','Non-billed tasks reminder (sent to selected staff members) [spanish]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(2559,'invoice','invoices-batch-payments','spanish','Invoices Payments Recorded in Batch (Sent to Customer) [spanish]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(2560,'contract','contract-sign-reminder','spanish','Contract Sign Reminder (Sent to Customer) [spanish]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(2561,'timesheets_attendance_mgt','attendance_notice','spanish','Attendance notice [spanish]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(2562,'timesheets_attendance_mgt','send_request_approval','spanish','Send request approval [spanish]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(2563,'timesheets_attendance_mgt','remind_user_check_in','spanish','Remind user check in [spanish]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(2564,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','spanish','New application (Send to notification recipient) [spanish]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(2565,'client','affiliate_management_payout_updated','spanish','Affiliate Payout Request Update [spanish]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(2566,'client','affiliate_management_signup_through_affiliate_link','spanish','Successful Signup through Affiliate Link [spanish]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(2567,'client','affiliate_management_successful_referral_commission','spanish','Successful Referral Commission Notification [spanish]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(2568,'staff','affiliate_management_new_payout_request_for_admin','spanish','Affiliate Payout Request [spanish]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(2569,'staff','affiliate_management_payout_updated_for_admin','spanish','Affiliate Payout Request Updated [spanish]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(2570,'staff','affiliate_management_new_affiliate_signup_for_admin','spanish','New Affiliate Signup [spanish]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(2571,'client','affiliate_management_referral_commission_reversal','spanish','Referral Commission Reversal Notification [spanish]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(2572,'inventory_warning','inventory-warning-to-staff','spanish','Inventory warning (Sent to staff) [spanish]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(2581,'purchase_order','purchase-order-to-contact','spanish','Purchase Order (Sent to contact) [spanish]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(2582,'purchase_order','purchase-request-to-contact','spanish','Purchase Request (Sent to contact) [spanish]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(2583,'purchase_order','purchase-quotation-to-contact','spanish','Purchase Quotation (Sent to contact) [spanish]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(2584,'purchase_order','debit-note-to-contact','spanish','Debit Note (Sent to contact) [spanish]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(2585,'purchase_order','purchase-statement-to-contact','spanish','Purchase Statement (Sent to contact) [spanish]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(2586,'purchase_order','vendor-registration-confirmed','spanish','Vendor Registration Confirmed [spanish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2587,'purchase_order','purchase-contract-to-contact','spanish','Purchase Contract (Sent to contact) [spanish]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(2588,'purchase_order','new-contact-created','spanish','New Contact Added/Registered (Welcome Email) [spanish]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(2589,'purchase_order','purchase-request-approval','spanish','Request approval [spanish]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2590,'purchase_order','purchase-send-approved','spanish','Email send approved [spanish]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2591,'purchase_order','purchase-send-rejected','spanish','Email send rejected [spanish]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2592,'change_candidate_status','change-candidate-status-to-candidate','spanish','Change Candidate Status (Sent to Candidate) [spanish]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2593,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','spanish','Change Candidate Job Applied Status (Sent to Candidate) [spanish]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2594,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','spanish','Change Candidate Interview Schedule Status (Sent to Candidate) [spanish]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2595,'new_candidate_have_applied','new-candidate-have-applied','spanish','New candidate have applied (Sent to Responsible) [spanish]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2596,'staff','flexibackup-new-backup-to-staff','spanish','Flexi Backup Notification [spanish]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2597,'client','new-client-created','swedish','New Contact Added/Registered (Welcome Email) [swedish]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2598,'invoice','invoice-send-to-client','swedish','Send Invoice to Customer [swedish]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2599,'ticket','new-ticket-opened-admin','swedish','New Ticket Opened (Opened by Staff, Sent to Customer) [swedish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2600,'ticket','ticket-reply','swedish','Ticket Reply (Sent to Customer) [swedish]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2601,'ticket','ticket-autoresponse','swedish','New Ticket Opened - Autoresponse [swedish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2602,'invoice','invoice-payment-recorded','swedish','Invoice Payment Recorded (Sent to Customer) [swedish]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2603,'invoice','invoice-overdue-notice','swedish','Invoice Overdue Notice [swedish]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2604,'invoice','invoice-already-send','swedish','Invoice Already Sent to Customer [swedish]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2605,'ticket','new-ticket-created-staff','swedish','New Ticket Created (Opened by Customer, Sent to Staff Members) [swedish]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2606,'estimate','estimate-send-to-client','swedish','Send Estimate to Customer [swedish]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2607,'ticket','ticket-reply-to-admin','swedish','Ticket Reply (Sent to Staff) [swedish]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2608,'estimate','estimate-already-send','swedish','Estimate Already Sent to Customer [swedish]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2609,'contract','contract-expiration','swedish','Contract Expiration Reminder (Sent to Customer Contacts) [swedish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2610,'tasks','task-assigned','swedish','New Task Assigned (Sent to Staff) [swedish]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2611,'tasks','task-added-as-follower','swedish','Staff Member Added as Follower on Task (Sent to Staff) [swedish]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2612,'tasks','task-commented','swedish','New Comment on Task (Sent to Staff) [swedish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2613,'tasks','task-added-attachment','swedish','New Attachment(s) on Task (Sent to Staff) [swedish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2614,'estimate','estimate-declined-to-staff','swedish','Estimate Declined (Sent to Staff) [swedish]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2615,'estimate','estimate-accepted-to-staff','swedish','Estimate Accepted (Sent to Staff) [swedish]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2616,'proposals','proposal-client-accepted','swedish','Customer Action - Accepted (Sent to Staff) [swedish]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2617,'proposals','proposal-send-to-customer','swedish','Send Proposal to Customer [swedish]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2618,'proposals','proposal-client-declined','swedish','Customer Action - Declined (Sent to Staff) [swedish]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2619,'proposals','proposal-client-thank-you','swedish','Thank You Email (Sent to Customer After Accept) [swedish]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2620,'proposals','proposal-comment-to-client','swedish','New Comment Â (Sent to Customer/Lead) [swedish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2621,'proposals','proposal-comment-to-admin','swedish','New Comment (Sent to Staff)  [swedish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2622,'estimate','estimate-thank-you-to-customer','swedish','Thank You Email (Sent to Customer After Accept) [swedish]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2623,'tasks','task-deadline-notification','swedish','Task Deadline Reminder - Sent to Assigned Members [swedish]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2624,'contract','send-contract','swedish','Send Contract to Customer [swedish]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2625,'invoice','invoice-payment-recorded-to-staff','swedish','Invoice Payment Recorded (Sent to Staff) [swedish]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2626,'ticket','auto-close-ticket','swedish','Auto Close Ticket [swedish]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2627,'project','new-project-discussion-created-to-staff','swedish','New Project Discussion (Sent to Project Members) [swedish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2628,'project','new-project-discussion-created-to-customer','swedish','New Project Discussion (Sent to Customer Contacts) [swedish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2629,'project','new-project-file-uploaded-to-customer','swedish','New Project File(s) Uploaded (Sent to Customer Contacts) [swedish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2630,'project','new-project-file-uploaded-to-staff','swedish','New Project File(s) Uploaded (Sent to Project Members) [swedish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2631,'project','new-project-discussion-comment-to-customer','swedish','New Discussion Comment  (Sent to Customer Contacts) [swedish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2632,'project','new-project-discussion-comment-to-staff','swedish','New Discussion Comment (Sent to Project Members) [swedish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2633,'project','staff-added-as-project-member','swedish','Staff Added as Project Member [swedish]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2634,'estimate','estimate-expiry-reminder','swedish','Estimate Expiration Reminder [swedish]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2635,'proposals','proposal-expiry-reminder','swedish','Proposal Expiration Reminder [swedish]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2636,'staff','new-staff-created','swedish','New Staff Created (Welcome Email) [swedish]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2637,'client','contact-forgot-password','swedish','Forgot Password [swedish]','Create New Password','','DOT One Business Solution','',0,1,0),(2638,'client','contact-password-reseted','swedish','Password Reset - Confirmation [swedish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2639,'client','contact-set-password','swedish','Set New Password [swedish]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2640,'staff','staff-forgot-password','swedish','Forgot Password [swedish]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2641,'staff','staff-password-reseted','swedish','Password Reset - Confirmation [swedish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2642,'project','assigned-to-project','swedish','New Project Created (Sent to Customer Contacts) [swedish]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2643,'tasks','task-added-attachment-to-contacts','swedish','New Attachment(s) on Task (Sent to Customer Contacts) [swedish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2644,'tasks','task-commented-to-contacts','swedish','New Comment on Task (Sent to Customer Contacts) [swedish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2645,'leads','new-lead-assigned','swedish','New Lead Assigned to Staff Member [swedish]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(2646,'client','client-statement','swedish','Statement - Account Summary [swedish]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(2647,'ticket','ticket-assigned-to-admin','swedish','New Ticket Assigned (Sent to Staff) [swedish]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(2648,'client','new-client-registered-to-admin','swedish','New Customer Registration (Sent to admins) [swedish]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(2649,'leads','new-web-to-lead-form-submitted','swedish','Web to lead form submitted - Sent to lead [swedish]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(2650,'staff','two-factor-authentication','swedish','Two Factor Authentication [swedish]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(2651,'project','project-finished-to-customer','swedish','Project Marked as Finished (Sent to Customer Contacts) [swedish]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(2652,'credit_note','credit-note-send-to-client','swedish','Send Credit Note To Email [swedish]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(2653,'tasks','task-status-change-to-staff','swedish','Task Status Changed (Sent to Staff) [swedish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2654,'tasks','task-status-change-to-contacts','swedish','Task Status Changed (Sent to Customer Contacts) [swedish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2655,'staff','reminder-email-staff','swedish','Staff Reminder Email [swedish]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(2656,'contract','contract-comment-to-client','swedish','New Comment Â (Sent to Customer Contacts) [swedish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2657,'contract','contract-comment-to-admin','swedish','New Comment (Sent to Staff)  [swedish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2658,'subscriptions','send-subscription','swedish','Send Subscription to Customer [swedish]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(2659,'subscriptions','subscription-payment-failed','swedish','Subscription Payment Failed [swedish]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(2660,'subscriptions','subscription-canceled','swedish','Subscription Canceled (Sent to customer primary contact) [swedish]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(2661,'subscriptions','subscription-payment-succeeded','swedish','Subscription Payment Succeeded (Sent to customer primary contact) [swedish]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(2662,'contract','contract-expiration-to-staff','swedish','Contract Expiration Reminder (Sent to Staff) [swedish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2663,'gdpr','gdpr-removal-request','swedish','Removal Request From Contact (Sent to administrators) [swedish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2664,'gdpr','gdpr-removal-request-lead','swedish','Removal Request From Lead (Sent to administrators) [swedish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2665,'client','client-registration-confirmed','swedish','Customer Registration Confirmed [swedish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2666,'contract','contract-signed-to-staff','swedish','Contract Signed (Sent to Staff) [swedish]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(2667,'subscriptions','customer-subscribed-to-staff','swedish','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [swedish]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(2668,'client','contact-verification-email','swedish','Email Verification (Sent to Contact After Registration) [swedish]','Verify Email Address','','{companyname}','',0,1,0),(2669,'client','new-customer-profile-file-uploaded-to-staff','swedish','New Customer Profile File(s) Uploaded (Sent to Staff) [swedish]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(2670,'staff','event-notification-to-staff','swedish','Event Notification (Calendar) [swedish]','Upcoming Event - {event_title}','','',NULL,0,1,0),(2671,'subscriptions','subscription-payment-requires-action','swedish','Credit Card Authorization Required - SCA [swedish]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(2672,'invoice','invoice-due-notice','swedish','Invoice Due Notice [swedish]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(2673,'estimate_request','estimate-request-submitted-to-staff','swedish','Estimate Request Submitted (Sent to Staff) [swedish]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(2674,'estimate_request','estimate-request-assigned','swedish','Estimate Request Assigned (Sent to Staff) [swedish]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(2675,'estimate_request','estimate-request-received-to-user','swedish','Estimate Request Received (Sent to User) [swedish]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(2676,'notifications','non-billed-tasks-reminder','swedish','Non-billed tasks reminder (sent to selected staff members) [swedish]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(2677,'invoice','invoices-batch-payments','swedish','Invoices Payments Recorded in Batch (Sent to Customer) [swedish]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(2678,'contract','contract-sign-reminder','swedish','Contract Sign Reminder (Sent to Customer) [swedish]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(2679,'timesheets_attendance_mgt','attendance_notice','swedish','Attendance notice [swedish]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(2680,'timesheets_attendance_mgt','send_request_approval','swedish','Send request approval [swedish]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(2681,'timesheets_attendance_mgt','remind_user_check_in','swedish','Remind user check in [swedish]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(2682,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','swedish','New application (Send to notification recipient) [swedish]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(2683,'client','affiliate_management_payout_updated','swedish','Affiliate Payout Request Update [swedish]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(2684,'client','affiliate_management_signup_through_affiliate_link','swedish','Successful Signup through Affiliate Link [swedish]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(2685,'client','affiliate_management_successful_referral_commission','swedish','Successful Referral Commission Notification [swedish]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(2686,'staff','affiliate_management_new_payout_request_for_admin','swedish','Affiliate Payout Request [swedish]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(2687,'staff','affiliate_management_payout_updated_for_admin','swedish','Affiliate Payout Request Updated [swedish]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(2688,'staff','affiliate_management_new_affiliate_signup_for_admin','swedish','New Affiliate Signup [swedish]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(2689,'client','affiliate_management_referral_commission_reversal','swedish','Referral Commission Reversal Notification [swedish]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(2690,'inventory_warning','inventory-warning-to-staff','swedish','Inventory warning (Sent to staff) [swedish]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(2699,'purchase_order','purchase-order-to-contact','swedish','Purchase Order (Sent to contact) [swedish]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(2700,'purchase_order','purchase-request-to-contact','swedish','Purchase Request (Sent to contact) [swedish]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(2701,'purchase_order','purchase-quotation-to-contact','swedish','Purchase Quotation (Sent to contact) [swedish]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(2702,'purchase_order','debit-note-to-contact','swedish','Debit Note (Sent to contact) [swedish]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(2703,'purchase_order','purchase-statement-to-contact','swedish','Purchase Statement (Sent to contact) [swedish]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(2704,'purchase_order','vendor-registration-confirmed','swedish','Vendor Registration Confirmed [swedish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2705,'purchase_order','purchase-contract-to-contact','swedish','Purchase Contract (Sent to contact) [swedish]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(2706,'purchase_order','new-contact-created','swedish','New Contact Added/Registered (Welcome Email) [swedish]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(2707,'purchase_order','purchase-request-approval','swedish','Request approval [swedish]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2708,'purchase_order','purchase-send-approved','swedish','Email send approved [swedish]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2709,'purchase_order','purchase-send-rejected','swedish','Email send rejected [swedish]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2710,'change_candidate_status','change-candidate-status-to-candidate','swedish','Change Candidate Status (Sent to Candidate) [swedish]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2711,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','swedish','Change Candidate Job Applied Status (Sent to Candidate) [swedish]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2712,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','swedish','Change Candidate Interview Schedule Status (Sent to Candidate) [swedish]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2713,'new_candidate_have_applied','new-candidate-have-applied','swedish','New candidate have applied (Sent to Responsible) [swedish]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2714,'staff','flexibackup-new-backup-to-staff','swedish','Flexi Backup Notification [swedish]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2715,'client','new-client-created','turkish','New Contact Added/Registered (Welcome Email) [turkish]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2716,'invoice','invoice-send-to-client','turkish','Send Invoice to Customer [turkish]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2717,'ticket','new-ticket-opened-admin','turkish','New Ticket Opened (Opened by Staff, Sent to Customer) [turkish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2718,'ticket','ticket-reply','turkish','Ticket Reply (Sent to Customer) [turkish]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2719,'ticket','ticket-autoresponse','turkish','New Ticket Opened - Autoresponse [turkish]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2720,'invoice','invoice-payment-recorded','turkish','Invoice Payment Recorded (Sent to Customer) [turkish]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2721,'invoice','invoice-overdue-notice','turkish','Invoice Overdue Notice [turkish]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2722,'invoice','invoice-already-send','turkish','Invoice Already Sent to Customer [turkish]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2723,'ticket','new-ticket-created-staff','turkish','New Ticket Created (Opened by Customer, Sent to Staff Members) [turkish]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2724,'estimate','estimate-send-to-client','turkish','Send Estimate to Customer [turkish]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2725,'ticket','ticket-reply-to-admin','turkish','Ticket Reply (Sent to Staff) [turkish]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2726,'estimate','estimate-already-send','turkish','Estimate Already Sent to Customer [turkish]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2727,'contract','contract-expiration','turkish','Contract Expiration Reminder (Sent to Customer Contacts) [turkish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2728,'tasks','task-assigned','turkish','New Task Assigned (Sent to Staff) [turkish]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2729,'tasks','task-added-as-follower','turkish','Staff Member Added as Follower on Task (Sent to Staff) [turkish]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2730,'tasks','task-commented','turkish','New Comment on Task (Sent to Staff) [turkish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2731,'tasks','task-added-attachment','turkish','New Attachment(s) on Task (Sent to Staff) [turkish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2732,'estimate','estimate-declined-to-staff','turkish','Estimate Declined (Sent to Staff) [turkish]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2733,'estimate','estimate-accepted-to-staff','turkish','Estimate Accepted (Sent to Staff) [turkish]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2734,'proposals','proposal-client-accepted','turkish','Customer Action - Accepted (Sent to Staff) [turkish]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2735,'proposals','proposal-send-to-customer','turkish','Send Proposal to Customer [turkish]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2736,'proposals','proposal-client-declined','turkish','Customer Action - Declined (Sent to Staff) [turkish]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2737,'proposals','proposal-client-thank-you','turkish','Thank You Email (Sent to Customer After Accept) [turkish]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2738,'proposals','proposal-comment-to-client','turkish','New Comment Â (Sent to Customer/Lead) [turkish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2739,'proposals','proposal-comment-to-admin','turkish','New Comment (Sent to Staff)  [turkish]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2740,'estimate','estimate-thank-you-to-customer','turkish','Thank You Email (Sent to Customer After Accept) [turkish]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2741,'tasks','task-deadline-notification','turkish','Task Deadline Reminder - Sent to Assigned Members [turkish]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2742,'contract','send-contract','turkish','Send Contract to Customer [turkish]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2743,'invoice','invoice-payment-recorded-to-staff','turkish','Invoice Payment Recorded (Sent to Staff) [turkish]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2744,'ticket','auto-close-ticket','turkish','Auto Close Ticket [turkish]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2745,'project','new-project-discussion-created-to-staff','turkish','New Project Discussion (Sent to Project Members) [turkish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2746,'project','new-project-discussion-created-to-customer','turkish','New Project Discussion (Sent to Customer Contacts) [turkish]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2747,'project','new-project-file-uploaded-to-customer','turkish','New Project File(s) Uploaded (Sent to Customer Contacts) [turkish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2748,'project','new-project-file-uploaded-to-staff','turkish','New Project File(s) Uploaded (Sent to Project Members) [turkish]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2749,'project','new-project-discussion-comment-to-customer','turkish','New Discussion Comment  (Sent to Customer Contacts) [turkish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2750,'project','new-project-discussion-comment-to-staff','turkish','New Discussion Comment (Sent to Project Members) [turkish]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2751,'project','staff-added-as-project-member','turkish','Staff Added as Project Member [turkish]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2752,'estimate','estimate-expiry-reminder','turkish','Estimate Expiration Reminder [turkish]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2753,'proposals','proposal-expiry-reminder','turkish','Proposal Expiration Reminder [turkish]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2754,'staff','new-staff-created','turkish','New Staff Created (Welcome Email) [turkish]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2755,'client','contact-forgot-password','turkish','Forgot Password [turkish]','Create New Password','','DOT One Business Solution','',0,1,0),(2756,'client','contact-password-reseted','turkish','Password Reset - Confirmation [turkish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2757,'client','contact-set-password','turkish','Set New Password [turkish]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2758,'staff','staff-forgot-password','turkish','Forgot Password [turkish]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2759,'staff','staff-password-reseted','turkish','Password Reset - Confirmation [turkish]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2760,'project','assigned-to-project','turkish','New Project Created (Sent to Customer Contacts) [turkish]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2761,'tasks','task-added-attachment-to-contacts','turkish','New Attachment(s) on Task (Sent to Customer Contacts) [turkish]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2762,'tasks','task-commented-to-contacts','turkish','New Comment on Task (Sent to Customer Contacts) [turkish]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2763,'leads','new-lead-assigned','turkish','New Lead Assigned to Staff Member [turkish]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(2764,'client','client-statement','turkish','Statement - Account Summary [turkish]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(2765,'ticket','ticket-assigned-to-admin','turkish','New Ticket Assigned (Sent to Staff) [turkish]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(2766,'client','new-client-registered-to-admin','turkish','New Customer Registration (Sent to admins) [turkish]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(2767,'leads','new-web-to-lead-form-submitted','turkish','Web to lead form submitted - Sent to lead [turkish]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(2768,'staff','two-factor-authentication','turkish','Two Factor Authentication [turkish]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(2769,'project','project-finished-to-customer','turkish','Project Marked as Finished (Sent to Customer Contacts) [turkish]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(2770,'credit_note','credit-note-send-to-client','turkish','Send Credit Note To Email [turkish]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(2771,'tasks','task-status-change-to-staff','turkish','Task Status Changed (Sent to Staff) [turkish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2772,'tasks','task-status-change-to-contacts','turkish','Task Status Changed (Sent to Customer Contacts) [turkish]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2773,'staff','reminder-email-staff','turkish','Staff Reminder Email [turkish]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(2774,'contract','contract-comment-to-client','turkish','New Comment Â (Sent to Customer Contacts) [turkish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2775,'contract','contract-comment-to-admin','turkish','New Comment (Sent to Staff)  [turkish]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2776,'subscriptions','send-subscription','turkish','Send Subscription to Customer [turkish]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(2777,'subscriptions','subscription-payment-failed','turkish','Subscription Payment Failed [turkish]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(2778,'subscriptions','subscription-canceled','turkish','Subscription Canceled (Sent to customer primary contact) [turkish]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(2779,'subscriptions','subscription-payment-succeeded','turkish','Subscription Payment Succeeded (Sent to customer primary contact) [turkish]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(2780,'contract','contract-expiration-to-staff','turkish','Contract Expiration Reminder (Sent to Staff) [turkish]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2781,'gdpr','gdpr-removal-request','turkish','Removal Request From Contact (Sent to administrators) [turkish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2782,'gdpr','gdpr-removal-request-lead','turkish','Removal Request From Lead (Sent to administrators) [turkish]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2783,'client','client-registration-confirmed','turkish','Customer Registration Confirmed [turkish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2784,'contract','contract-signed-to-staff','turkish','Contract Signed (Sent to Staff) [turkish]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(2785,'subscriptions','customer-subscribed-to-staff','turkish','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [turkish]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(2786,'client','contact-verification-email','turkish','Email Verification (Sent to Contact After Registration) [turkish]','Verify Email Address','','{companyname}','',0,1,0),(2787,'client','new-customer-profile-file-uploaded-to-staff','turkish','New Customer Profile File(s) Uploaded (Sent to Staff) [turkish]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(2788,'staff','event-notification-to-staff','turkish','Event Notification (Calendar) [turkish]','Upcoming Event - {event_title}','','',NULL,0,1,0),(2789,'subscriptions','subscription-payment-requires-action','turkish','Credit Card Authorization Required - SCA [turkish]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(2790,'invoice','invoice-due-notice','turkish','Invoice Due Notice [turkish]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(2791,'estimate_request','estimate-request-submitted-to-staff','turkish','Estimate Request Submitted (Sent to Staff) [turkish]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(2792,'estimate_request','estimate-request-assigned','turkish','Estimate Request Assigned (Sent to Staff) [turkish]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(2793,'estimate_request','estimate-request-received-to-user','turkish','Estimate Request Received (Sent to User) [turkish]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(2794,'notifications','non-billed-tasks-reminder','turkish','Non-billed tasks reminder (sent to selected staff members) [turkish]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(2795,'invoice','invoices-batch-payments','turkish','Invoices Payments Recorded in Batch (Sent to Customer) [turkish]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(2796,'contract','contract-sign-reminder','turkish','Contract Sign Reminder (Sent to Customer) [turkish]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(2797,'timesheets_attendance_mgt','attendance_notice','turkish','Attendance notice [turkish]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(2798,'timesheets_attendance_mgt','send_request_approval','turkish','Send request approval [turkish]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(2799,'timesheets_attendance_mgt','remind_user_check_in','turkish','Remind user check in [turkish]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(2800,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','turkish','New application (Send to notification recipient) [turkish]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(2801,'client','affiliate_management_payout_updated','turkish','Affiliate Payout Request Update [turkish]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(2802,'client','affiliate_management_signup_through_affiliate_link','turkish','Successful Signup through Affiliate Link [turkish]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(2803,'client','affiliate_management_successful_referral_commission','turkish','Successful Referral Commission Notification [turkish]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(2804,'staff','affiliate_management_new_payout_request_for_admin','turkish','Affiliate Payout Request [turkish]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(2805,'staff','affiliate_management_payout_updated_for_admin','turkish','Affiliate Payout Request Updated [turkish]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(2806,'staff','affiliate_management_new_affiliate_signup_for_admin','turkish','New Affiliate Signup [turkish]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(2807,'client','affiliate_management_referral_commission_reversal','turkish','Referral Commission Reversal Notification [turkish]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(2808,'inventory_warning','inventory-warning-to-staff','turkish','Inventory warning (Sent to staff) [turkish]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(2817,'purchase_order','purchase-order-to-contact','turkish','Purchase Order (Sent to contact) [turkish]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(2818,'purchase_order','purchase-request-to-contact','turkish','Purchase Request (Sent to contact) [turkish]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(2819,'purchase_order','purchase-quotation-to-contact','turkish','Purchase Quotation (Sent to contact) [turkish]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(2820,'purchase_order','debit-note-to-contact','turkish','Debit Note (Sent to contact) [turkish]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(2821,'purchase_order','purchase-statement-to-contact','turkish','Purchase Statement (Sent to contact) [turkish]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(2822,'purchase_order','vendor-registration-confirmed','turkish','Vendor Registration Confirmed [turkish]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2823,'purchase_order','purchase-contract-to-contact','turkish','Purchase Contract (Sent to contact) [turkish]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(2824,'purchase_order','new-contact-created','turkish','New Contact Added/Registered (Welcome Email) [turkish]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(2825,'purchase_order','purchase-request-approval','turkish','Request approval [turkish]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2826,'purchase_order','purchase-send-approved','turkish','Email send approved [turkish]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2827,'purchase_order','purchase-send-rejected','turkish','Email send rejected [turkish]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2828,'change_candidate_status','change-candidate-status-to-candidate','turkish','Change Candidate Status (Sent to Candidate) [turkish]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2829,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','turkish','Change Candidate Job Applied Status (Sent to Candidate) [turkish]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2830,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','turkish','Change Candidate Interview Schedule Status (Sent to Candidate) [turkish]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2831,'new_candidate_have_applied','new-candidate-have-applied','turkish','New candidate have applied (Sent to Responsible) [turkish]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2832,'staff','flexibackup-new-backup-to-staff','turkish','Flexi Backup Notification [turkish]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2833,'client','new-client-created','ukrainian','New Contact Added/Registered (Welcome Email) [ukrainian]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2834,'invoice','invoice-send-to-client','ukrainian','Send Invoice to Customer [ukrainian]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2835,'ticket','new-ticket-opened-admin','ukrainian','New Ticket Opened (Opened by Staff, Sent to Customer) [ukrainian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2836,'ticket','ticket-reply','ukrainian','Ticket Reply (Sent to Customer) [ukrainian]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2837,'ticket','ticket-autoresponse','ukrainian','New Ticket Opened - Autoresponse [ukrainian]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2838,'invoice','invoice-payment-recorded','ukrainian','Invoice Payment Recorded (Sent to Customer) [ukrainian]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2839,'invoice','invoice-overdue-notice','ukrainian','Invoice Overdue Notice [ukrainian]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2840,'invoice','invoice-already-send','ukrainian','Invoice Already Sent to Customer [ukrainian]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2841,'ticket','new-ticket-created-staff','ukrainian','New Ticket Created (Opened by Customer, Sent to Staff Members) [ukrainian]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2842,'estimate','estimate-send-to-client','ukrainian','Send Estimate to Customer [ukrainian]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2843,'ticket','ticket-reply-to-admin','ukrainian','Ticket Reply (Sent to Staff) [ukrainian]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2844,'estimate','estimate-already-send','ukrainian','Estimate Already Sent to Customer [ukrainian]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2845,'contract','contract-expiration','ukrainian','Contract Expiration Reminder (Sent to Customer Contacts) [ukrainian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2846,'tasks','task-assigned','ukrainian','New Task Assigned (Sent to Staff) [ukrainian]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2847,'tasks','task-added-as-follower','ukrainian','Staff Member Added as Follower on Task (Sent to Staff) [ukrainian]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2848,'tasks','task-commented','ukrainian','New Comment on Task (Sent to Staff) [ukrainian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2849,'tasks','task-added-attachment','ukrainian','New Attachment(s) on Task (Sent to Staff) [ukrainian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2850,'estimate','estimate-declined-to-staff','ukrainian','Estimate Declined (Sent to Staff) [ukrainian]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2851,'estimate','estimate-accepted-to-staff','ukrainian','Estimate Accepted (Sent to Staff) [ukrainian]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2852,'proposals','proposal-client-accepted','ukrainian','Customer Action - Accepted (Sent to Staff) [ukrainian]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2853,'proposals','proposal-send-to-customer','ukrainian','Send Proposal to Customer [ukrainian]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2854,'proposals','proposal-client-declined','ukrainian','Customer Action - Declined (Sent to Staff) [ukrainian]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2855,'proposals','proposal-client-thank-you','ukrainian','Thank You Email (Sent to Customer After Accept) [ukrainian]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2856,'proposals','proposal-comment-to-client','ukrainian','New Comment Â (Sent to Customer/Lead) [ukrainian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2857,'proposals','proposal-comment-to-admin','ukrainian','New Comment (Sent to Staff)  [ukrainian]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2858,'estimate','estimate-thank-you-to-customer','ukrainian','Thank You Email (Sent to Customer After Accept) [ukrainian]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2859,'tasks','task-deadline-notification','ukrainian','Task Deadline Reminder - Sent to Assigned Members [ukrainian]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2860,'contract','send-contract','ukrainian','Send Contract to Customer [ukrainian]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2861,'invoice','invoice-payment-recorded-to-staff','ukrainian','Invoice Payment Recorded (Sent to Staff) [ukrainian]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2862,'ticket','auto-close-ticket','ukrainian','Auto Close Ticket [ukrainian]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2863,'project','new-project-discussion-created-to-staff','ukrainian','New Project Discussion (Sent to Project Members) [ukrainian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2864,'project','new-project-discussion-created-to-customer','ukrainian','New Project Discussion (Sent to Customer Contacts) [ukrainian]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2865,'project','new-project-file-uploaded-to-customer','ukrainian','New Project File(s) Uploaded (Sent to Customer Contacts) [ukrainian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2866,'project','new-project-file-uploaded-to-staff','ukrainian','New Project File(s) Uploaded (Sent to Project Members) [ukrainian]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2867,'project','new-project-discussion-comment-to-customer','ukrainian','New Discussion Comment  (Sent to Customer Contacts) [ukrainian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2868,'project','new-project-discussion-comment-to-staff','ukrainian','New Discussion Comment (Sent to Project Members) [ukrainian]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2869,'project','staff-added-as-project-member','ukrainian','Staff Added as Project Member [ukrainian]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2870,'estimate','estimate-expiry-reminder','ukrainian','Estimate Expiration Reminder [ukrainian]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2871,'proposals','proposal-expiry-reminder','ukrainian','Proposal Expiration Reminder [ukrainian]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2872,'staff','new-staff-created','ukrainian','New Staff Created (Welcome Email) [ukrainian]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2873,'client','contact-forgot-password','ukrainian','Forgot Password [ukrainian]','Create New Password','','DOT One Business Solution','',0,1,0),(2874,'client','contact-password-reseted','ukrainian','Password Reset - Confirmation [ukrainian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2875,'client','contact-set-password','ukrainian','Set New Password [ukrainian]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2876,'staff','staff-forgot-password','ukrainian','Forgot Password [ukrainian]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2877,'staff','staff-password-reseted','ukrainian','Password Reset - Confirmation [ukrainian]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2878,'project','assigned-to-project','ukrainian','New Project Created (Sent to Customer Contacts) [ukrainian]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2879,'tasks','task-added-attachment-to-contacts','ukrainian','New Attachment(s) on Task (Sent to Customer Contacts) [ukrainian]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2880,'tasks','task-commented-to-contacts','ukrainian','New Comment on Task (Sent to Customer Contacts) [ukrainian]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2881,'leads','new-lead-assigned','ukrainian','New Lead Assigned to Staff Member [ukrainian]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(2882,'client','client-statement','ukrainian','Statement - Account Summary [ukrainian]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(2883,'ticket','ticket-assigned-to-admin','ukrainian','New Ticket Assigned (Sent to Staff) [ukrainian]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(2884,'client','new-client-registered-to-admin','ukrainian','New Customer Registration (Sent to admins) [ukrainian]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(2885,'leads','new-web-to-lead-form-submitted','ukrainian','Web to lead form submitted - Sent to lead [ukrainian]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(2886,'staff','two-factor-authentication','ukrainian','Two Factor Authentication [ukrainian]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(2887,'project','project-finished-to-customer','ukrainian','Project Marked as Finished (Sent to Customer Contacts) [ukrainian]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(2888,'credit_note','credit-note-send-to-client','ukrainian','Send Credit Note To Email [ukrainian]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(2889,'tasks','task-status-change-to-staff','ukrainian','Task Status Changed (Sent to Staff) [ukrainian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2890,'tasks','task-status-change-to-contacts','ukrainian','Task Status Changed (Sent to Customer Contacts) [ukrainian]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(2891,'staff','reminder-email-staff','ukrainian','Staff Reminder Email [ukrainian]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(2892,'contract','contract-comment-to-client','ukrainian','New Comment Â (Sent to Customer Contacts) [ukrainian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2893,'contract','contract-comment-to-admin','ukrainian','New Comment (Sent to Staff)  [ukrainian]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(2894,'subscriptions','send-subscription','ukrainian','Send Subscription to Customer [ukrainian]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(2895,'subscriptions','subscription-payment-failed','ukrainian','Subscription Payment Failed [ukrainian]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(2896,'subscriptions','subscription-canceled','ukrainian','Subscription Canceled (Sent to customer primary contact) [ukrainian]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(2897,'subscriptions','subscription-payment-succeeded','ukrainian','Subscription Payment Succeeded (Sent to customer primary contact) [ukrainian]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(2898,'contract','contract-expiration-to-staff','ukrainian','Contract Expiration Reminder (Sent to Staff) [ukrainian]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2899,'gdpr','gdpr-removal-request','ukrainian','Removal Request From Contact (Sent to administrators) [ukrainian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2900,'gdpr','gdpr-removal-request-lead','ukrainian','Removal Request From Lead (Sent to administrators) [ukrainian]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(2901,'client','client-registration-confirmed','ukrainian','Customer Registration Confirmed [ukrainian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2902,'contract','contract-signed-to-staff','ukrainian','Contract Signed (Sent to Staff) [ukrainian]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(2903,'subscriptions','customer-subscribed-to-staff','ukrainian','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [ukrainian]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(2904,'client','contact-verification-email','ukrainian','Email Verification (Sent to Contact After Registration) [ukrainian]','Verify Email Address','','{companyname}','',0,1,0),(2905,'client','new-customer-profile-file-uploaded-to-staff','ukrainian','New Customer Profile File(s) Uploaded (Sent to Staff) [ukrainian]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(2906,'staff','event-notification-to-staff','ukrainian','Event Notification (Calendar) [ukrainian]','Upcoming Event - {event_title}','','',NULL,0,1,0),(2907,'subscriptions','subscription-payment-requires-action','ukrainian','Credit Card Authorization Required - SCA [ukrainian]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(2908,'invoice','invoice-due-notice','ukrainian','Invoice Due Notice [ukrainian]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(2909,'estimate_request','estimate-request-submitted-to-staff','ukrainian','Estimate Request Submitted (Sent to Staff) [ukrainian]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(2910,'estimate_request','estimate-request-assigned','ukrainian','Estimate Request Assigned (Sent to Staff) [ukrainian]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(2911,'estimate_request','estimate-request-received-to-user','ukrainian','Estimate Request Received (Sent to User) [ukrainian]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(2912,'notifications','non-billed-tasks-reminder','ukrainian','Non-billed tasks reminder (sent to selected staff members) [ukrainian]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(2913,'invoice','invoices-batch-payments','ukrainian','Invoices Payments Recorded in Batch (Sent to Customer) [ukrainian]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(2914,'contract','contract-sign-reminder','ukrainian','Contract Sign Reminder (Sent to Customer) [ukrainian]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(2915,'timesheets_attendance_mgt','attendance_notice','ukrainian','Attendance notice [ukrainian]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(2916,'timesheets_attendance_mgt','send_request_approval','ukrainian','Send request approval [ukrainian]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(2917,'timesheets_attendance_mgt','remind_user_check_in','ukrainian','Remind user check in [ukrainian]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(2918,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','ukrainian','New application (Send to notification recipient) [ukrainian]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(2919,'client','affiliate_management_payout_updated','ukrainian','Affiliate Payout Request Update [ukrainian]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(2920,'client','affiliate_management_signup_through_affiliate_link','ukrainian','Successful Signup through Affiliate Link [ukrainian]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(2921,'client','affiliate_management_successful_referral_commission','ukrainian','Successful Referral Commission Notification [ukrainian]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(2922,'staff','affiliate_management_new_payout_request_for_admin','ukrainian','Affiliate Payout Request [ukrainian]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(2923,'staff','affiliate_management_payout_updated_for_admin','ukrainian','Affiliate Payout Request Updated [ukrainian]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(2924,'staff','affiliate_management_new_affiliate_signup_for_admin','ukrainian','New Affiliate Signup [ukrainian]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(2925,'client','affiliate_management_referral_commission_reversal','ukrainian','Referral Commission Reversal Notification [ukrainian]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(2926,'inventory_warning','inventory-warning-to-staff','ukrainian','Inventory warning (Sent to staff) [ukrainian]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(2935,'purchase_order','purchase-order-to-contact','ukrainian','Purchase Order (Sent to contact) [ukrainian]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(2936,'purchase_order','purchase-request-to-contact','ukrainian','Purchase Request (Sent to contact) [ukrainian]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(2937,'purchase_order','purchase-quotation-to-contact','ukrainian','Purchase Quotation (Sent to contact) [ukrainian]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(2938,'purchase_order','debit-note-to-contact','ukrainian','Debit Note (Sent to contact) [ukrainian]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(2939,'purchase_order','purchase-statement-to-contact','ukrainian','Purchase Statement (Sent to contact) [ukrainian]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(2940,'purchase_order','vendor-registration-confirmed','ukrainian','Vendor Registration Confirmed [ukrainian]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(2941,'purchase_order','purchase-contract-to-contact','ukrainian','Purchase Contract (Sent to contact) [ukrainian]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(2942,'purchase_order','new-contact-created','ukrainian','New Contact Added/Registered (Welcome Email) [ukrainian]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(2943,'purchase_order','purchase-request-approval','ukrainian','Request approval [ukrainian]','Request approval','','{companyname} | CRM',NULL,0,1,0),(2944,'purchase_order','purchase-send-approved','ukrainian','Email send approved [ukrainian]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(2945,'purchase_order','purchase-send-rejected','ukrainian','Email send rejected [ukrainian]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(2946,'change_candidate_status','change-candidate-status-to-candidate','ukrainian','Change Candidate Status (Sent to Candidate) [ukrainian]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(2947,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','ukrainian','Change Candidate Job Applied Status (Sent to Candidate) [ukrainian]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(2948,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','ukrainian','Change Candidate Interview Schedule Status (Sent to Candidate) [ukrainian]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(2949,'new_candidate_have_applied','new-candidate-have-applied','ukrainian','New candidate have applied (Sent to Responsible) [ukrainian]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(2950,'staff','flexibackup-new-backup-to-staff','ukrainian','Flexi Backup Notification [ukrainian]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(2951,'client','new-client-created','vietnamese','New Contact Added/Registered (Welcome Email) [vietnamese]','Welcome aboard','','DOT One Business Solution','',0,1,0),(2952,'invoice','invoice-send-to-client','vietnamese','Send Invoice to Customer [vietnamese]','Invoice with number {invoice_number} created','','{companyname} | CRM',NULL,0,1,0),(2953,'ticket','new-ticket-opened-admin','vietnamese','New Ticket Opened (Opened by Staff, Sent to Customer) [vietnamese]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2954,'ticket','ticket-reply','vietnamese','Ticket Reply (Sent to Customer) [vietnamese]','New Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2955,'ticket','ticket-autoresponse','vietnamese','New Ticket Opened - Autoresponse [vietnamese]','New Support Ticket Opened','','{companyname} | CRM',NULL,0,1,0),(2956,'invoice','invoice-payment-recorded','vietnamese','Invoice Payment Recorded (Sent to Customer) [vietnamese]','Invoice Payment Recorded','','{companyname} | CRM',NULL,0,1,0),(2957,'invoice','invoice-overdue-notice','vietnamese','Invoice Overdue Notice [vietnamese]','Invoice Overdue Notice - {invoice_number}','','{companyname} | CRM',NULL,0,1,0),(2958,'invoice','invoice-already-send','vietnamese','Invoice Already Sent to Customer [vietnamese]','Invoice # {invoice_number} ','','{companyname} | CRM',NULL,0,1,0),(2959,'ticket','new-ticket-created-staff','vietnamese','New Ticket Created (Opened by Customer, Sent to Staff Members) [vietnamese]','New Ticket Created','','{companyname} | CRM',NULL,0,1,0),(2960,'estimate','estimate-send-to-client','vietnamese','Send Estimate to Customer [vietnamese]','Estimate # {estimate_number} created','','{companyname} | CRM',NULL,0,1,0),(2961,'ticket','ticket-reply-to-admin','vietnamese','Ticket Reply (Sent to Staff) [vietnamese]','New Support Ticket Reply','','{companyname} | CRM',NULL,0,1,0),(2962,'estimate','estimate-already-send','vietnamese','Estimate Already Sent to Customer [vietnamese]','Estimate # {estimate_number} ','','{companyname} | CRM',NULL,0,1,0),(2963,'contract','contract-expiration','vietnamese','Contract Expiration Reminder (Sent to Customer Contacts) [vietnamese]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2964,'tasks','task-assigned','vietnamese','New Task Assigned (Sent to Staff) [vietnamese]','New Task Assigned to You - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2965,'tasks','task-added-as-follower','vietnamese','Staff Member Added as Follower on Task (Sent to Staff) [vietnamese]','You are added as follower on task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2966,'tasks','task-commented','vietnamese','New Comment on Task (Sent to Staff) [vietnamese]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2967,'tasks','task-added-attachment','vietnamese','New Attachment(s) on Task (Sent to Staff) [vietnamese]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2968,'estimate','estimate-declined-to-staff','vietnamese','Estimate Declined (Sent to Staff) [vietnamese]','Customer Declined Estimate','','{companyname} | CRM',NULL,0,1,0),(2969,'estimate','estimate-accepted-to-staff','vietnamese','Estimate Accepted (Sent to Staff) [vietnamese]','Customer Accepted Estimate','','{companyname} | CRM',NULL,0,1,0),(2970,'proposals','proposal-client-accepted','vietnamese','Customer Action - Accepted (Sent to Staff) [vietnamese]','Customer Accepted Proposal','','{companyname} | CRM',NULL,0,1,0),(2971,'proposals','proposal-send-to-customer','vietnamese','Send Proposal to Customer [vietnamese]','Proposal With Number {proposal_number} Created','','{companyname} | CRM',NULL,0,1,0),(2972,'proposals','proposal-client-declined','vietnamese','Customer Action - Declined (Sent to Staff) [vietnamese]','Client Declined Proposal','','{companyname} | CRM',NULL,0,1,0),(2973,'proposals','proposal-client-thank-you','vietnamese','Thank You Email (Sent to Customer After Accept) [vietnamese]','Thank for you accepting proposal','','{companyname} | CRM',NULL,0,1,0),(2974,'proposals','proposal-comment-to-client','vietnamese','New Comment Â (Sent to Customer/Lead) [vietnamese]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2975,'proposals','proposal-comment-to-admin','vietnamese','New Comment (Sent to Staff)  [vietnamese]','New Proposal Comment','','{companyname} | CRM',NULL,0,1,0),(2976,'estimate','estimate-thank-you-to-customer','vietnamese','Thank You Email (Sent to Customer After Accept) [vietnamese]','Thank for you accepting estimate','','{companyname} | CRM',NULL,0,1,0),(2977,'tasks','task-deadline-notification','vietnamese','Task Deadline Reminder - Sent to Assigned Members [vietnamese]','Task Deadline Reminder','','{companyname} | CRM',NULL,0,1,0),(2978,'contract','send-contract','vietnamese','Send Contract to Customer [vietnamese]','Contract - {contract_subject}','','{companyname} | CRM',NULL,0,1,0),(2979,'invoice','invoice-payment-recorded-to-staff','vietnamese','Invoice Payment Recorded (Sent to Staff) [vietnamese]','New Invoice Payment','','{companyname} | CRM',NULL,0,1,0),(2980,'ticket','auto-close-ticket','vietnamese','Auto Close Ticket [vietnamese]','Ticket Auto Closed','','{companyname} | CRM',NULL,0,1,0),(2981,'project','new-project-discussion-created-to-staff','vietnamese','New Project Discussion (Sent to Project Members) [vietnamese]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2982,'project','new-project-discussion-created-to-customer','vietnamese','New Project Discussion (Sent to Customer Contacts) [vietnamese]','New Project Discussion Created - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2983,'project','new-project-file-uploaded-to-customer','vietnamese','New Project File(s) Uploaded (Sent to Customer Contacts) [vietnamese]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2984,'project','new-project-file-uploaded-to-staff','vietnamese','New Project File(s) Uploaded (Sent to Project Members) [vietnamese]','New Project File(s) Uploaded - {project_name}','','{companyname} | CRM',NULL,0,1,0),(2985,'project','new-project-discussion-comment-to-customer','vietnamese','New Discussion Comment  (Sent to Customer Contacts) [vietnamese]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2986,'project','new-project-discussion-comment-to-staff','vietnamese','New Discussion Comment (Sent to Project Members) [vietnamese]','New Discussion Comment','','{companyname} | CRM',NULL,0,1,0),(2987,'project','staff-added-as-project-member','vietnamese','Staff Added as Project Member [vietnamese]','New project assigned to you','','{companyname} | CRM',NULL,0,1,0),(2988,'estimate','estimate-expiry-reminder','vietnamese','Estimate Expiration Reminder [vietnamese]','Estimate Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2989,'proposals','proposal-expiry-reminder','vietnamese','Proposal Expiration Reminder [vietnamese]','Proposal Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(2990,'staff','new-staff-created','vietnamese','New Staff Created (Welcome Email) [vietnamese]','You are added as staff member','','{companyname} | CRM',NULL,0,1,0),(2991,'client','contact-forgot-password','vietnamese','Forgot Password [vietnamese]','Create New Password','','DOT One Business Solution','',0,1,0),(2992,'client','contact-password-reseted','vietnamese','Password Reset - Confirmation [vietnamese]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2993,'client','contact-set-password','vietnamese','Set New Password [vietnamese]','Set new password on {companyname} ','','DOT One Business Solution','',0,1,0),(2994,'staff','staff-forgot-password','vietnamese','Forgot Password [vietnamese]','Create New Password','','{companyname} | CRM',NULL,0,1,0),(2995,'staff','staff-password-reseted','vietnamese','Password Reset - Confirmation [vietnamese]','Your password has been changed','','{companyname} | CRM',NULL,0,1,0),(2996,'project','assigned-to-project','vietnamese','New Project Created (Sent to Customer Contacts) [vietnamese]','New Project Created','','{companyname} | CRM',NULL,0,1,0),(2997,'tasks','task-added-attachment-to-contacts','vietnamese','New Attachment(s) on Task (Sent to Customer Contacts) [vietnamese]','New Attachment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2998,'tasks','task-commented-to-contacts','vietnamese','New Comment on Task (Sent to Customer Contacts) [vietnamese]','New Comment on Task - {task_name}','','{companyname} | CRM',NULL,0,1,0),(2999,'leads','new-lead-assigned','vietnamese','New Lead Assigned to Staff Member [vietnamese]','New lead assigned to you','','{companyname} | CRM',NULL,0,1,0),(3000,'client','client-statement','vietnamese','Statement - Account Summary [vietnamese]','Account Statement from {statement_from} to {statement_to}','','{companyname} | CRM',NULL,0,1,0),(3001,'ticket','ticket-assigned-to-admin','vietnamese','New Ticket Assigned (Sent to Staff) [vietnamese]','New support ticket has been assigned to you','','{companyname} | CRM',NULL,0,1,0),(3002,'client','new-client-registered-to-admin','vietnamese','New Customer Registration (Sent to admins) [vietnamese]','New Customer Registration','','{companyname} | CRM',NULL,0,1,0),(3003,'leads','new-web-to-lead-form-submitted','vietnamese','Web to lead form submitted - Sent to lead [vietnamese]','{lead_name} - We Received Your Request','','{companyname} | CRM',NULL,0,0,0),(3004,'staff','two-factor-authentication','vietnamese','Two Factor Authentication [vietnamese]','Confirm Your Login','','{companyname} | CRM',NULL,0,1,0),(3005,'project','project-finished-to-customer','vietnamese','Project Marked as Finished (Sent to Customer Contacts) [vietnamese]','Project Marked as Finished','','{companyname} | CRM',NULL,0,1,0),(3006,'credit_note','credit-note-send-to-client','vietnamese','Send Credit Note To Email [vietnamese]','Credit Note With Number #{credit_note_number} Created','','{companyname} | CRM',NULL,0,1,0),(3007,'tasks','task-status-change-to-staff','vietnamese','Task Status Changed (Sent to Staff) [vietnamese]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(3008,'tasks','task-status-change-to-contacts','vietnamese','Task Status Changed (Sent to Customer Contacts) [vietnamese]','Task Status Changed','','{companyname} | CRM',NULL,0,1,0),(3009,'staff','reminder-email-staff','vietnamese','Staff Reminder Email [vietnamese]','You Have a New Reminder!','','{companyname} | CRM',NULL,0,1,0),(3010,'contract','contract-comment-to-client','vietnamese','New Comment Â (Sent to Customer Contacts) [vietnamese]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(3011,'contract','contract-comment-to-admin','vietnamese','New Comment (Sent to Staff)  [vietnamese]','New Contract Comment','','{companyname} | CRM',NULL,0,1,0),(3012,'subscriptions','send-subscription','vietnamese','Send Subscription to Customer [vietnamese]','Subscription Created','','{companyname} | CRM',NULL,0,1,0),(3013,'subscriptions','subscription-payment-failed','vietnamese','Subscription Payment Failed [vietnamese]','Your most recent invoice payment failed','','{companyname} | CRM',NULL,0,1,0),(3014,'subscriptions','subscription-canceled','vietnamese','Subscription Canceled (Sent to customer primary contact) [vietnamese]','Your subscription has been canceled','','{companyname} | CRM',NULL,0,1,0),(3015,'subscriptions','subscription-payment-succeeded','vietnamese','Subscription Payment Succeeded (Sent to customer primary contact) [vietnamese]','Subscription  Payment Receipt - {subscription_name}','','{companyname} | CRM',NULL,0,1,0),(3016,'contract','contract-expiration-to-staff','vietnamese','Contract Expiration Reminder (Sent to Staff) [vietnamese]','Contract Expiration Reminder','','{companyname} | CRM',NULL,0,1,0),(3017,'gdpr','gdpr-removal-request','vietnamese','Removal Request From Contact (Sent to administrators) [vietnamese]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(3018,'gdpr','gdpr-removal-request-lead','vietnamese','Removal Request From Lead (Sent to administrators) [vietnamese]','Data Removal Request Received','','{companyname} | CRM',NULL,0,1,0),(3019,'client','client-registration-confirmed','vietnamese','Customer Registration Confirmed [vietnamese]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(3020,'contract','contract-signed-to-staff','vietnamese','Contract Signed (Sent to Staff) [vietnamese]','Customer Signed a Contract','','{companyname} | CRM',NULL,0,1,0),(3021,'subscriptions','customer-subscribed-to-staff','vietnamese','Customer Subscribed to a Subscription (Sent to administrators and subscription creator) [vietnamese]','Customer Subscribed to a Subscription','','{companyname} | CRM',NULL,0,1,0),(3022,'client','contact-verification-email','vietnamese','Email Verification (Sent to Contact After Registration) [vietnamese]','Verify Email Address','','{companyname}','',0,1,0),(3023,'client','new-customer-profile-file-uploaded-to-staff','vietnamese','New Customer Profile File(s) Uploaded (Sent to Staff) [vietnamese]','Customer Uploaded New File(s) in Profile','','{companyname} | CRM',NULL,0,1,0),(3024,'staff','event-notification-to-staff','vietnamese','Event Notification (Calendar) [vietnamese]','Upcoming Event - {event_title}','','',NULL,0,1,0),(3025,'subscriptions','subscription-payment-requires-action','vietnamese','Credit Card Authorization Required - SCA [vietnamese]','Important: Confirm your subscription {subscription_name} payment','','{companyname} | CRM',NULL,0,1,0),(3026,'invoice','invoice-due-notice','vietnamese','Invoice Due Notice [vietnamese]','Your {invoice_number} will be due soon','','{companyname} | CRM',NULL,0,1,0),(3027,'estimate_request','estimate-request-submitted-to-staff','vietnamese','Estimate Request Submitted (Sent to Staff) [vietnamese]','New Estimate Request Submitted','','{companyname} | CRM',NULL,0,1,0),(3028,'estimate_request','estimate-request-assigned','vietnamese','Estimate Request Assigned (Sent to Staff) [vietnamese]','New Estimate Request Assigned','','{companyname} | CRM',NULL,0,1,0),(3029,'estimate_request','estimate-request-received-to-user','vietnamese','Estimate Request Received (Sent to User) [vietnamese]','Estimate Request Received','','{companyname} | CRM',NULL,0,0,0),(3030,'notifications','non-billed-tasks-reminder','vietnamese','Non-billed tasks reminder (sent to selected staff members) [vietnamese]','Action required: Completed tasks are not billed','','{companyname} | CRM',NULL,0,1,0),(3031,'invoice','invoices-batch-payments','vietnamese','Invoices Payments Recorded in Batch (Sent to Customer) [vietnamese]','We have received your payments','','{companyname} | CRM',NULL,0,1,0),(3032,'contract','contract-sign-reminder','vietnamese','Contract Sign Reminder (Sent to Customer) [vietnamese]','Contract Sign Reminder','','{companyname} | CRM',NULL,0,1,0),(3033,'timesheets_attendance_mgt','attendance_notice','vietnamese','Attendance notice [vietnamese]','Timesheets - Attendance notice','','{companyname} | CRM',NULL,0,1,0),(3034,'timesheets_attendance_mgt','send_request_approval','vietnamese','Send request approval [vietnamese]','Timesheets - Send request approval to approver','','{companyname} | CRM',NULL,0,1,0),(3035,'timesheets_attendance_mgt','remind_user_check_in','vietnamese','Remind user check in [vietnamese]','Timesheets - Remind user check in','','{companyname} | CRM',NULL,0,1,0),(3036,'timesheets_attendance_mgt','new_leave_application_send_to_notification_recipient','vietnamese','New application (Send to notification recipient) [vietnamese]','Timesheets - New application - Send to notification recipient','','{companyname} | CRM',NULL,0,1,0),(3037,'client','affiliate_management_payout_updated','vietnamese','Affiliate Payout Request Update [vietnamese]','An update regarding your payout request','','{companyname} | CRM',NULL,0,1,0),(3038,'client','affiliate_management_signup_through_affiliate_link','vietnamese','Successful Signup through Affiliate Link [vietnamese]','Congratulations on a successful signup!','','{companyname} | CRM',NULL,0,1,0),(3039,'client','affiliate_management_successful_referral_commission','vietnamese','Successful Referral Commission Notification [vietnamese]','A referral commission received!','','{companyname} | CRM',NULL,0,1,0),(3040,'staff','affiliate_management_new_payout_request_for_admin','vietnamese','Affiliate Payout Request [vietnamese]','You have new affiliate payout request','','{companyname} | CRM',NULL,0,1,0),(3041,'staff','affiliate_management_payout_updated_for_admin','vietnamese','Affiliate Payout Request Updated [vietnamese]','You marked payout: #{payout_id} as {payout_status}','','{companyname} | CRM',NULL,0,1,0),(3042,'staff','affiliate_management_new_affiliate_signup_for_admin','vietnamese','New Affiliate Signup [vietnamese]','A new affiliate signup','','{companyname} | CRM',NULL,0,1,0),(3043,'client','affiliate_management_referral_commission_reversal','vietnamese','Referral Commission Reversal Notification [vietnamese]','A referral commission was reversed!','','{companyname} | CRM',NULL,0,1,0),(3044,'inventory_warning','inventory-warning-to-staff','vietnamese','Inventory warning (Sent to staff) [vietnamese]','Inventory warning','','{companyname} | CRM',NULL,0,1,0),(3053,'purchase_order','purchase-order-to-contact','vietnamese','Purchase Order (Sent to contact) [vietnamese]','Purchase Order','','{companyname} | CRM',NULL,0,1,0),(3054,'purchase_order','purchase-request-to-contact','vietnamese','Purchase Request (Sent to contact) [vietnamese]','Purchase Request','','{companyname} | CRM',NULL,0,1,0),(3055,'purchase_order','purchase-quotation-to-contact','vietnamese','Purchase Quotation (Sent to contact) [vietnamese]','Purchase Quotation','','{companyname} | CRM',NULL,0,1,0),(3056,'purchase_order','debit-note-to-contact','vietnamese','Debit Note (Sent to contact) [vietnamese]','Debit Note','','{companyname} | CRM',NULL,0,1,0),(3057,'purchase_order','purchase-statement-to-contact','vietnamese','Purchase Statement (Sent to contact) [vietnamese]','Purchase Statement','','{companyname} | CRM',NULL,0,1,0),(3058,'purchase_order','vendor-registration-confirmed','vietnamese','Vendor Registration Confirmed [vietnamese]','Your registration is confirmed','','{companyname} | CRM',NULL,0,1,0),(3059,'purchase_order','purchase-contract-to-contact','vietnamese','Purchase Contract (Sent to contact) [vietnamese]','Purchase Contract','','{companyname} | CRM',NULL,0,1,0),(3060,'purchase_order','new-contact-created','vietnamese','New Contact Added/Registered (Welcome Email) [vietnamese]','New Contact Added/Registered (Welcome Email)','','{companyname} | CRM',NULL,0,1,0),(3061,'purchase_order','purchase-request-approval','vietnamese','Request approval [vietnamese]','Request approval','','{companyname} | CRM',NULL,0,1,0),(3062,'purchase_order','purchase-send-approved','vietnamese','Email send approved [vietnamese]','Email send approved','','{companyname} | CRM',NULL,0,1,0),(3063,'purchase_order','purchase-send-rejected','vietnamese','Email send rejected [vietnamese]','Email send rejected','','{companyname} | CRM',NULL,0,1,0),(3064,'change_candidate_status','change-candidate-status-to-candidate','vietnamese','Change Candidate Status (Sent to Candidate) [vietnamese]','Changed Candidate Status','','{companyname} | CRM',NULL,0,1,0),(3065,'change_candidate_job_applied_status','change-candidate-job-applied-status-to-candidate','vietnamese','Change Candidate Job Applied Status (Sent to Candidate) [vietnamese]','Changed Candidate Job Applied Status','','{companyname} | CRM',NULL,0,1,0),(3066,'change_candidate_interview_schedule_status','change-candidate-interview-schedule-status-to-candidate','vietnamese','Change Candidate Interview Schedule Status (Sent to Candidate) [vietnamese]','Changed Candidate Interview Schedule Status','','{companyname} | CRM',NULL,0,1,0),(3067,'new_candidate_have_applied','new-candidate-have-applied','vietnamese','New candidate have applied (Sent to Responsible) [vietnamese]','New candidate have applied','','{companyname} | CRM',NULL,0,1,0),(3068,'staff','flexibackup-new-backup-to-staff','vietnamese','Flexi Backup Notification [vietnamese]','New Backup Available  - {backup_name}','','{companyname} | CRM',NULL,0,1,0),(3069,'appointly','appointment-cron-reminder-to-staff','english','Appointment reminder (Sent to Staff and Attendees)','You have an upcoming appointment!','<span style=\\\"font-size: 12pt;\\\"> Hello {staff_firstname} {staff_lastname} </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> You have an upcoming appointment that is need to be held date {appointment_date} and location {appointment_location}</span><br /><br /><span style=\\\"font-size: 12pt;\\\"><strong>Additional info for your appointment:</strong></span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Subject:</strong> {appointment_subject}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Description:</strong> {appointment_description}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment scheduled date to start:</strong> {appointment_date}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>You can view this appointment at the following link:</strong> <a href=\"{appointment_admin_url}\">Your appointment URL</a></span><br /><span style=\\\"font-size: 12pt;\\\"><br />Kind Regards</span><br /><br /><span style=\\\"font-size: 12pt;\\\">{email_signature}</span>','{companyname} | CRM',NULL,0,1,0),(3070,'appointly','appointment-recurring-to-staff','english','Appointment recurring (Sent to Staff and Attendees)','Recurring appointment was re-created!','<span style=\\\"font-size: 12pt;\\\"> Hello {staff_firstname} {staff_lastname} </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> Your recurring appointment was recreated with date {appointment_date} and location {appointment_location}</span><br /><br /><span style=\\\"font-size: 12pt;\\\"><strong> Additional info for your appointment:</strong></span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Subject:</strong> {appointment_subject}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Description:</strong> {appointment_description}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment scheduled date to start:</strong> {appointment_date}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>You can view this appointment at the following link:</strong> <a href=\"{appointment_admin_url}\">Your appointment URL</a></span><br /><span style=\\\"font-size: 12pt;\\\"><br />Kind Regards</span><br /><br /><span style=\\\"font-size: 12pt;\\\">{email_signature}</span>','{companyname} | CRM',NULL,0,1,0),(3071,'appointly','appointment-cancelled-to-staff','english','Appointment cancelled (Sent to Staff and Attendees)','Appointment has been cancelled!','<span style=\\\"font-size: 12pt;\\\"> Hello {staff_firstname} {staff_lastname}. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> The appointment that needed to be held on date {appointment_date} and location {appointment_location} with contact {appointment_client_name} is cancelled.</span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Kind Regards</span><br /><br /><span style=\\\"font-size: 12pt;\\\">{email_signature}</span>','{companyname} | CRM',NULL,0,1,0),(3072,'appointly','appointment-cancelled-to-contact','english','Appointment cancelled (Sent to Contact)','Your appointment has been cancelled!','<span style=\\\"font-size: 12pt;\\\"> Hello {appointment_client_name}. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> The appointment that needed to be held on date {appointment_date} and location {appointment_location} is now cancelled.</span><br /><br /><span style=\\\"font-size:12pt;\\\"><br />Kind Regards</span><br /><br /><span style=\\\"font-size: 12pt;\\\">{email_signature}</span>','{companyname} | CRM',NULL,0,1,0),(3073,'appointly','appointment-cron-reminder-to-contact','english','Appointment reminder (Sent to Contact)','You have an upcoming appointment!','<span style=\\\"font-size: 12pt;\\\"> Hello {appointment_client_name}. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> You have an upcoming appointment that is need to be held date {appointment_date} and location {appointment_location}.</span><br /><br /><span style=\\\"font-size: 12pt;\\\"><strong>Additional info for your appointment</strong></span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Subject:</strong> {appointment_subject}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Description:</strong> {appointment_description}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment scheduled date to start:</strong> {appointment_date}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>You can view this appointment at the following link:</strong> <a href=\"{appointment_public_url}\">Your appointment URL</a></span><br /><span style=\\\"font-size: 12pt;\\\"><br />Kind Regards</span><br /><br /><span style=\\\"font-size: 12pt;\\\">{email_signature}</span>','{companyname} | CRM',NULL,0,1,0),(3074,'appointly','appointment-recurring-to-contacts','english','Appointment recurring (Sent to Contact)','Recurring appointment was re-created!','<span style=\\\"font-size: 12pt;\\\"> Hello {appointment_client_name}. </span><br /><br /><span style=\\\"font-size: 12pt;\\\"> Your recurring appointment was recreated with date {appointment_date} and location {appointment_location}.</span><br /><br /><span style=\\\"font-size: 12pt;\\\"><strong>Additional info for your appointment</strong></span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Subject:</strong> {appointment_subject}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Description:</strong> {appointment_description}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment scheduled date to start:</strong> {appointment_date}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>You can view this appointment at the following link:</strong> <a href=\"{appointment_public_url}\">Your appointment URL</a></span><br /><span style=\\\"font-size: 12pt;\\\"><br />Kind Regards</span><br /><br /><span style=\\\"font-size: 12pt;\\\">{email_signature}</span>','{companyname} | CRM',NULL,0,1,0),(3075,'appointly','appointment-approved-to-staff','english','Appointment approved (Sent to Staff and Atendees)','You are added as a appointment attendee!','<span style=\\\"font-size: 12pt;\\\"> Hello {staff_firstname} {staff_lastname}.</span><br /><br /><span style=\\\"font-size: 12pt;\\\"> You are added as a appointment attendee.</span><br /><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Subject:</strong> {appointment_subject}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Description:</strong> {appointment_description}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment scheduled date to start:</strong> {appointment_date}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>You can view this appointment at the following link:</strong> <a href=\"{appointment_admin_url}\">Your appointment URL</a></span><br /><span style=\\\"font-size: 12pt;\\\"><br />Kind Regards</span><br /><br /><span style=\\\"font-size: 12pt;\\\">{email_signature}</span>','{companyname} | CRM',NULL,0,1,0),(3076,'appointly','appointment-approved-to-contact','english','Appointment approved (Sent to Contact)','Your appointment has been approved!','<span style=\\\"font-size: 12pt;\\\"> Hello {appointment_client_name}.</span><br /><br /><span style=\\\"font-size: 12pt;\\\"> You appointment has been approved!</span><br /><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Subject:</strong> {appointment_subject}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment Description:</strong> {appointment_description}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>Appointment scheduled date to start:</strong> {appointment_date}</span><br /><span style=\\\"font-size: 12pt;\\\"><strong>You can keep track of your appointment at the following link:</strong> <a href=\"{appointment_public_url}\">Your appointment URL</a></span><br /><span style=\\\"font-size: 12pt;\\\"><br/>If you have any questions Please contact us for more information.</span><br /><br /><span style=\\\"font-size: 12pt;\\\"><br />Kind Regards</span><br /><br /><span style=\\\"font-size: 12pt;\\\">{email_signature}</span>','{companyname} | CRM',NULL,0,1,0),(3077,'appointly','appointment-submitted-to-staff','english','New appointment request (Sent to Responsible Person)','New appointment request via external form!','<span 12pt=\"\"><span 12pt=\"\">Hello {staff_firstname} {staff_lastname}<br /><br />New appointment request submitted via external form</span>.<br /><br /><span 12pt=\"\"><strong>Appointment Subject:</strong> {appointment_subject}</span><br /><br /><span 12pt=\"\"><strong>Appointment Description:</strong> {appointment_description}</span><br /><br /><span 12pt=\"\"><strong>Appointment requested scheduled start date:</strong> {appointment_date}</span><br /><br /><span 12pt=\"\"><strong>You can view this appointment request at the following link:</strong> <a href=\"{appointment_admin_url}\">{appointment_admin_url}</a></span><br /><br /><br />{companyname}<br />{crm_url}<br /><span 12pt=\"\"></span></span>','{companyname} | CRM',NULL,0,1,0),(3078,'appointly','callback-assigned-to-staff','english','Assigned to callback (Sent to Staff)','You have been assigned to handle a new callback!','<span 12pt=\"\"><span 12pt=\"\">Hello {staff_firstname} {staff_lastname}<br /><br />An admin assigned a callback to you, you can view this callback request at the following link:</strong> <a href=\"{admin_url}/appointly/callbacks\">{admin_url}/appointly/callbacks</a></span><br /><br /><br />{companyname}<br />{crm_url}<br /><span 12pt=\"\"></span></span>','{companyname} | CRM',NULL,0,1,0),(3079,'appointly','newcallback-requested-to-staff','english','New callback request (Sent to Callbacks Responsible Person)','You have a new callback request!','<span 12pt=\"\"><span 12pt=\"\">Hello {staff_firstname} {staff_lastname}<br /><br />A new callback request has just been submitted, fast navigate to callbacks to view latest callback submitted:</strong> <a href=\"{admin_url}/appointly/callbacks\">{admin_url}/appointly/callbacks</a></span><br /><br /><br />{companyname}<br />{crm_url}<br /><span 12pt=\"\"></span></span>','{companyname} | CRM',NULL,0,1,0),(3080,'appointly','appointly-appointment-request-feedback','english','Request Appointment Feedback (Sent to Client)','Feedback request for appointment!','<span 12pt=\"\"><span 12pt=\"\">Hello {appointment_client_name} <br /><br />A new feedback request has just been submitted, please leave your comments and thoughts about this past appointment, fast navigate to the appointment to add a feedback:</strong> <a href=\"{appointment_public_url}\">{appointment_public_url}</a></span><br /><br /><br />{companyname}<br />{crm_url}<br /><span 12pt=\"\"></span></span>','{companyname} | CRM',NULL,0,1,0),(3081,'appointly','appointly-appointment-feedback-received','english','New Feedback Received (Sent to Responsible Person)','New appointment feedback rating received!','<span 12pt=\"\"><span 12pt=\"\">Hello {staff_firstname} {staff_lastname} <br /><br />A new feedback rating has been received from client {appointment_client_name}. View the new feedback rating submitted at the following link:</strong> <a href=\"{appointment_admin_url}\">{appointment_admin_url}</a></span><br /><br /><br />{companyname}<br />{crm_url}<br /><span 12pt=\"\"></span></span>','{companyname} | CRM',NULL,0,1,0),(3082,'appointly','appointly-appointment-feedback-updated','english','Feedback Updated (Sent to Responsible Person)','Appointment feedback rating updated!','<span 12pt=\"\"><span 12pt=\"\">Hello {staff_firstname} {staff_lastname} <br /><br />An existing feedback was just updated from client {appointment_client_name}. View the new rating submitted at the following link:</strong> <a href=\"{appointment_admin_url}\">{appointment_admin_url}</a></span><br /><br /><br />{companyname}<br />{crm_url}<br /><span 12pt=\"\"></span></span>','{companyname} | CRM',NULL,0,1,0),(3083,'staff','flexstage-tickets-success','english','Flexstage Tickets Success','Tickets - {event_name}','Hi there! <br/><br/>Find the tickets you ordered for the {event_name} event below.<br/><br/> Venue: {venue} <br/><br/> Date/Time: {date_time} <br/><br/> <strong>Tickets</strong><br/> {ticket_details}<br/>Regards.','{companyname} | CRM',NULL,0,1,0),(3084,'staff','flexstage-event-invitation','english','Flexstage Event Invitation','Invitation - {event_name}','Hi there! <br/><br/>You are hereby invited for {event_name}.<br/><br/> Venue: {venue} <br/><br/> Date/Time: {date_time} <br/><br/> You can register for the event here: {event_link}<br><br/>Regards.','{companyname} | CRM',NULL,0,1,0),(3085,'omni_sales','purchase-receipt','english','Purchase receipt (Sent to customer)','Purchase receipt','Hi {staff_name}! <br /><br />Thank you for shopping in our store.<br />\r\n    We send a receipt of your purchase below.<br />{<span 12pt=\"\">notification_content</span>}. <br /><br />Kind Regards.<br/>Very pleased to serve you!','{companyname} | CRM',NULL,0,1,0),(3086,'omni_sales','pre-orders-notify','english','Pre-orders notify (Sent to seller)','Pre-orders notify','Hi {seller_name}! <br /><br />You have a new order from {buyer_name}, the order is created at {create_at}. View order details: {link}.<br />','{companyname} | CRM',NULL,0,1,0),(3087,'omni_sales','pre-orders-handover','english','Pre-orders handover','Pre-orders handover','Hi {to_name}! <br /><br />{from_name} has handed over an order to you. View order details: {link}.<br />','{companyname} | CRM',NULL,0,1,0);
/*!40000 ALTER TABLE `dynamech_tblemailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblestimate_request_forms`
--

DROP TABLE IF EXISTS `dynamech_tblestimate_request_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblestimate_request_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `form_data` longtext DEFAULT NULL,
  `recaptcha` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `submit_btn_name` varchar(100) DEFAULT NULL,
  `submit_btn_bg_color` varchar(10) DEFAULT '#84c529',
  `submit_btn_text_color` varchar(10) DEFAULT '#ffffff',
  `success_submit_msg` mediumtext DEFAULT NULL,
  `submit_action` int(11) DEFAULT 0,
  `submit_redirect_url` longtext DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `notify_type` varchar(100) DEFAULT NULL,
  `notify_ids` longtext DEFAULT NULL,
  `responsible` int(11) DEFAULT NULL,
  `notify_request_submitted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblestimate_request_forms`
--

LOCK TABLES `dynamech_tblestimate_request_forms` WRITE;
/*!40000 ALTER TABLE `dynamech_tblestimate_request_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblestimate_request_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblestimate_request_status`
--

DROP TABLE IF EXISTS `dynamech_tblestimate_request_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblestimate_request_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `flag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblestimate_request_status`
--

LOCK TABLES `dynamech_tblestimate_request_status` WRITE;
/*!40000 ALTER TABLE `dynamech_tblestimate_request_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblestimate_request_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblestimate_requests`
--

DROP TABLE IF EXISTS `dynamech_tblestimate_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblestimate_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `submission` longtext NOT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `date_estimated` datetime DEFAULT NULL,
  `from_form_id` int(11) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `default_language` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblestimate_requests`
--

LOCK TABLES `dynamech_tblestimate_requests` WRITE;
/*!40000 ALTER TABLE `dynamech_tblestimate_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblestimate_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblestimates`
--

DROP TABLE IF EXISTS `dynamech_tblestimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblestimates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `datesend` datetime DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(32) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `expirydate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `clientnote` mediumtext DEFAULT NULL,
  `adminnote` mediumtext DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(15,2) DEFAULT 0.00,
  `discount_type` varchar(30) DEFAULT NULL,
  `invoiceid` int(11) DEFAULT NULL,
  `invoiced_date` datetime DEFAULT NULL,
  `terms` mediumtext DEFAULT NULL,
  `reference_no` varchar(100) DEFAULT NULL,
  `sale_agent` int(11) NOT NULL DEFAULT 0,
  `billing_street` varchar(200) DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_zip` varchar(100) DEFAULT NULL,
  `billing_country` int(11) DEFAULT NULL,
  `shipping_street` varchar(200) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_zip` varchar(100) DEFAULT NULL,
  `shipping_country` int(11) DEFAULT NULL,
  `include_shipping` tinyint(1) NOT NULL,
  `show_shipping_on_estimate` tinyint(1) NOT NULL DEFAULT 1,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `pipeline_order` int(11) DEFAULT 1,
  `is_expiry_notified` int(11) NOT NULL DEFAULT 0,
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  `production_assigned_to` int(11) DEFAULT NULL COMMENT 'Staff ID or user assigned to the production process',
  `production_type` varchar(100) DEFAULT NULL COMMENT 'Type of production process (e.g. in-house, subcontract, etc)',
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblestimates`
--

LOCK TABLES `dynamech_tblestimates` WRITE;
/*!40000 ALTER TABLE `dynamech_tblestimates` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblestimates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblevents`
--

DROP TABLE IF EXISTS `dynamech_tblevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblevents` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `public` int(11) NOT NULL DEFAULT 0,
  `color` varchar(10) DEFAULT NULL,
  `isstartnotified` tinyint(1) NOT NULL DEFAULT 0,
  `reminder_before` int(11) NOT NULL DEFAULT 0,
  `reminder_before_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblevents`
--

LOCK TABLES `dynamech_tblevents` WRITE;
/*!40000 ALTER TABLE `dynamech_tblevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblexpenses`
--

DROP TABLE IF EXISTS `dynamech_tblexpenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblexpenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `currency` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax2` int(11) NOT NULL DEFAULT 0,
  `reference_no` varchar(100) DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `expense_name` varchar(191) DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `billable` int(11) DEFAULT 0,
  `invoiceid` int(11) DEFAULT NULL,
  `paymentmode` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `cycles` int(11) NOT NULL DEFAULT 0,
  `total_cycles` int(11) NOT NULL DEFAULT 0,
  `custom_recurring` int(11) NOT NULL DEFAULT 0,
  `last_recurring_date` date DEFAULT NULL,
  `create_invoice_billable` tinyint(1) DEFAULT NULL,
  `send_invoice_to_customer` tinyint(1) NOT NULL,
  `recurring_from` int(11) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `vendor` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `date_paid` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_bill` int(11) NOT NULL DEFAULT 0,
  `reason_for_void` text DEFAULT NULL,
  `voided` int(11) NOT NULL DEFAULT 0,
  `approved` int(11) NOT NULL DEFAULT 0,
  `from_fleet` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `category` (`category`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblexpenses`
--

LOCK TABLES `dynamech_tblexpenses` WRITE;
/*!40000 ALTER TABLE `dynamech_tblexpenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblexpenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblexpenses_categories`
--

DROP TABLE IF EXISTS `dynamech_tblexpenses_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblexpenses_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblexpenses_categories`
--

LOCK TABLES `dynamech_tblexpenses_categories` WRITE;
/*!40000 ALTER TABLE `dynamech_tblexpenses_categories` DISABLE KEYS */;
INSERT INTO `dynamech_tblexpenses_categories` VALUES (1,'Fleet: Work Order',NULL);
/*!40000 ALTER TABLE `dynamech_tblexpenses_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_activity_log`
--

DROP TABLE IF EXISTS `dynamech_tblfe_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `staffid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_activity_log`
--

LOCK TABLES `dynamech_tblfe_activity_log` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_approval_details`
--

DROP TABLE IF EXISTS `dynamech_tblfe_approval_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_approval_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(45) NOT NULL,
  `staffid` varchar(45) DEFAULT NULL,
  `approve` varchar(45) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `approve_action` varchar(255) DEFAULT NULL,
  `reject_action` varchar(255) DEFAULT NULL,
  `approve_value` varchar(255) DEFAULT NULL,
  `reject_value` varchar(255) DEFAULT NULL,
  `staff_approve` int(11) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  `notification_recipient` longtext DEFAULT NULL,
  `approval_deadline` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_approval_details`
--

LOCK TABLES `dynamech_tblfe_approval_details` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_approval_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_approval_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_approval_setting`
--

DROP TABLE IF EXISTS `dynamech_tblfe_approval_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_approval_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `related` varchar(255) NOT NULL,
  `setting` longtext NOT NULL,
  `choose_when_approving` int(11) NOT NULL DEFAULT 0,
  `notification_recipient` longtext DEFAULT NULL,
  `number_day_approval` int(11) DEFAULT NULL,
  `departments` text DEFAULT NULL,
  `job_positions` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_approval_setting`
--

LOCK TABLES `dynamech_tblfe_approval_setting` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_approval_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_approval_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_asset_maintenances`
--

DROP TABLE IF EXISTS `dynamech_tblfe_asset_maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_asset_maintenances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `maintenance_type` varchar(30) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `cost` decimal(15,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `warranty_improvement` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_asset_maintenances`
--

LOCK TABLES `dynamech_tblfe_asset_maintenances` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_asset_maintenances` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_asset_maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_asset_manufacturers`
--

DROP TABLE IF EXISTS `dynamech_tblfe_asset_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_asset_manufacturers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `url` text DEFAULT NULL,
  `support_url` text DEFAULT NULL,
  `support_phone` varchar(50) DEFAULT NULL,
  `support_email` varchar(100) DEFAULT NULL,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_asset_manufacturers`
--

LOCK TABLES `dynamech_tblfe_asset_manufacturers` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_asset_manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_asset_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_assets`
--

DROP TABLE IF EXISTS `dynamech_tblfe_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assets_code` varchar(20) DEFAULT NULL,
  `assets_name` varchar(255) DEFAULT NULL,
  `series` varchar(200) DEFAULT NULL,
  `asset_group` int(11) DEFAULT NULL,
  `asset_location` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `date_buy` date DEFAULT NULL,
  `warranty_period` int(11) DEFAULT NULL,
  `unit_price` decimal(15,2) DEFAULT NULL,
  `depreciation` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `order_number` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `requestable` int(11) DEFAULT 0,
  `qr_code` varchar(300) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'asset',
  `status` int(11) NOT NULL DEFAULT 1,
  `checkin_out` int(11) NOT NULL DEFAULT 1,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) DEFAULT NULL,
  `min_quantity` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_key` text DEFAULT NULL,
  `seats` varchar(50) DEFAULT NULL,
  `model_no` varchar(80) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `licensed_to_name` text DEFAULT NULL,
  `licensed_to_email` text DEFAULT NULL,
  `reassignable` int(11) NOT NULL DEFAULT 0,
  `termination_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `purchase_order_number` varchar(150) DEFAULT NULL,
  `maintained` int(11) NOT NULL DEFAULT 0,
  `item_no` varchar(80) DEFAULT NULL,
  `checkin_out_id` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `selling_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `rental_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `for_rent` int(11) NOT NULL DEFAULT 0,
  `for_sell` int(11) NOT NULL DEFAULT 0,
  `renting_period` decimal(15,2) DEFAULT NULL,
  `renting_unit` varchar(10) DEFAULT NULL COMMENT 'hour day week month year',
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_assets`
--

LOCK TABLES `dynamech_tblfe_assets` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_assign_asset_predefined_kits`
--

DROP TABLE IF EXISTS `dynamech_tblfe_assign_asset_predefined_kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_assign_asset_predefined_kits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `assign_data` text DEFAULT '',
  `parent_id` int(11) DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_assign_asset_predefined_kits`
--

LOCK TABLES `dynamech_tblfe_assign_asset_predefined_kits` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_assign_asset_predefined_kits` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_assign_asset_predefined_kits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_audit_detail_requests`
--

DROP TABLE IF EXISTS `dynamech_tblfe_audit_detail_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_audit_detail_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `asset_name` varchar(300) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `adjusted` int(11) DEFAULT NULL,
  `accept` int(11) NOT NULL DEFAULT 0,
  `audit_id` int(11) DEFAULT NULL,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `maintenance` int(11) NOT NULL DEFAULT 0,
  `maintenance_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_audit_detail_requests`
--

LOCK TABLES `dynamech_tblfe_audit_detail_requests` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_audit_detail_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_audit_detail_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_audit_requests`
--

DROP TABLE IF EXISTS `dynamech_tblfe_audit_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_audit_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT NULL,
  `audit_date` datetime NOT NULL DEFAULT current_timestamp(),
  `auditor` int(11) DEFAULT NULL,
  `asset_location` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `asset_id` text DEFAULT NULL,
  `checkin_checkout_status` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `closed` int(11) NOT NULL DEFAULT 0,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `from_order` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_audit_requests`
--

LOCK TABLES `dynamech_tblfe_audit_requests` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_audit_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_audit_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_cart`
--

DROP TABLE IF EXISTS `dynamech_tblfe_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_contact` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `voucher` varchar(100) NOT NULL,
  `status` int(11) DEFAULT 0,
  `complete` int(11) DEFAULT 0,
  `order_number` varchar(100) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel` varchar(150) DEFAULT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `tax_id` text DEFAULT NULL,
  `tax_rate` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `add_discount` decimal(15,2) DEFAULT 0.00,
  `company` varchar(150) DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `billing_street` varchar(150) DEFAULT NULL,
  `billing_city` varchar(50) DEFAULT NULL,
  `billing_state` varchar(50) DEFAULT NULL,
  `billing_country` varchar(50) DEFAULT NULL,
  `billing_zip` varchar(50) DEFAULT NULL,
  `shipping_street` varchar(150) DEFAULT NULL,
  `shipping_city` varchar(50) DEFAULT NULL,
  `shipping_state` varchar(50) DEFAULT NULL,
  `shipping_country` varchar(50) DEFAULT NULL,
  `shipping_zip` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `reason` varchar(250) DEFAULT NULL,
  `admin_action` int(11) DEFAULT 0,
  `discount` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT 0,
  `total` varchar(250) DEFAULT NULL,
  `sub_total` varchar(250) DEFAULT NULL,
  `discount_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `invoice` varchar(250) NOT NULL DEFAULT '',
  `number_invoice` varchar(250) NOT NULL DEFAULT '',
  `stock_export_number` varchar(250) NOT NULL DEFAULT '',
  `create_invoice` varchar(5) NOT NULL DEFAULT 'off',
  `stock_export` varchar(5) NOT NULL DEFAULT 'off',
  `customers_pay` decimal(15,2) NOT NULL DEFAULT 0.00,
  `amount_returned` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `seller` int(11) DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `allowed_payment_modes` varchar(200) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `shipping` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment_method_title` varchar(250) DEFAULT NULL,
  `discount_type_str` text DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `terms` text DEFAULT NULL,
  `shipping_tax` decimal(15,2) DEFAULT NULL,
  `enable` int(11) NOT NULL DEFAULT 1,
  `duedate` date DEFAULT NULL,
  `shipping_tax_json` varchar(150) DEFAULT NULL,
  `discount_voucher` varchar(150) DEFAULT NULL,
  `original_order_id` int(11) DEFAULT NULL,
  `return_reason` longtext DEFAULT NULL,
  `approve_status` int(11) NOT NULL DEFAULT 0,
  `process_invoice` varchar(5) NOT NULL DEFAULT 'off',
  `stock_import_number` int(11) NOT NULL DEFAULT 0,
  `fee_for_return_order` decimal(15,2) DEFAULT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `shipping_form` varchar(50) DEFAULT 'fixed',
  `shipping_value` decimal(15,2) DEFAULT 0.00,
  `type` varchar(30) NOT NULL DEFAULT 'order',
  `datecreator` datetime NOT NULL DEFAULT current_timestamp(),
  `return_reason_type` varchar(50) DEFAULT NULL,
  `return_type` varchar(30) DEFAULT NULL,
  `audit_id` int(11) DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `credit_note_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_cart`
--

LOCK TABLES `dynamech_tblfe_cart` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_cart_detailt`
--

DROP TABLE IF EXISTS `dynamech_tblfe_cart_detailt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_cart_detailt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `classify` varchar(30) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `prices` decimal(15,2) DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `sku` text NOT NULL,
  `percent_discount` float NOT NULL,
  `prices_discount` decimal(15,2) NOT NULL,
  `tax` text DEFAULT NULL,
  `tax_id` text DEFAULT NULL,
  `tax_rate` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_name` varchar(255) DEFAULT NULL,
  `pickup_time` varchar(10) DEFAULT NULL,
  `dropoff_time` varchar(10) DEFAULT NULL,
  `rental_start_date` date DEFAULT NULL,
  `rental_end_date` date DEFAULT NULL,
  `number_date` int(11) DEFAULT NULL,
  `rental_value` decimal(15,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `renting_period` decimal(15,2) DEFAULT NULL,
  `renting_unit` varchar(10) DEFAULT NULL COMMENT 'hour day week month year',
  `maintenance_id` int(11) DEFAULT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `available_quantity` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_cart_detailt`
--

LOCK TABLES `dynamech_tblfe_cart_detailt` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_cart_detailt` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_cart_detailt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_categories`
--

DROP TABLE IF EXISTS `dynamech_tblfe_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `category_eula` text DEFAULT NULL,
  `primary_default_eula` bit(1) NOT NULL DEFAULT b'0',
  `confirm_acceptance` bit(1) NOT NULL DEFAULT b'0',
  `send_mail_to_user` bit(1) NOT NULL DEFAULT b'0',
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_categories`
--

LOCK TABLES `dynamech_tblfe_categories` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_checkin_assets`
--

DROP TABLE IF EXISTS `dynamech_tblfe_checkin_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_checkin_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(200) DEFAULT NULL,
  `asset_name` varchar(200) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `checkout_to` varchar(20) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `checkin_date` date DEFAULT NULL,
  `expected_checkin_date` date DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `check_status` int(11) NOT NULL DEFAULT 2,
  `requestable` int(11) NOT NULL DEFAULT 0,
  `request_status` int(11) NOT NULL DEFAULT 0,
  `request_title` varchar(300) DEFAULT NULL,
  `predefined_kit_id` int(11) DEFAULT NULL,
  `item_type` varchar(30) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_checkin_assets`
--

LOCK TABLES `dynamech_tblfe_checkin_assets` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_checkin_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_checkin_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_cron_log`
--

DROP TABLE IF EXISTS `dynamech_tblfe_cron_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_cron_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `cron_name` varchar(200) DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_cron_log`
--

LOCK TABLES `dynamech_tblfe_cron_log` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_cron_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_cron_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_custom_field_values`
--

DROP TABLE IF EXISTS `dynamech_tblfe_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_custom_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `option` text DEFAULT NULL,
  `required` int(11) NOT NULL DEFAULT 1,
  `value` text DEFAULT NULL,
  `fieldset_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_custom_field_values`
--

LOCK TABLES `dynamech_tblfe_custom_field_values` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_custom_fields`
--

DROP TABLE IF EXISTS `dynamech_tblfe_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `option` text DEFAULT NULL,
  `required` int(11) NOT NULL DEFAULT 1,
  `default_value` text DEFAULT NULL,
  `fieldset_id` int(11) NOT NULL,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_custom_fields`
--

LOCK TABLES `dynamech_tblfe_custom_fields` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_depreciation_items`
--

DROP TABLE IF EXISTS `dynamech_tblfe_depreciation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_depreciation_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `value` float DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_depreciation_items`
--

LOCK TABLES `dynamech_tblfe_depreciation_items` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_depreciation_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_depreciation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_depreciations`
--

DROP TABLE IF EXISTS `dynamech_tblfe_depreciations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_depreciations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `term` double DEFAULT NULL,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_depreciations`
--

LOCK TABLES `dynamech_tblfe_depreciations` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_depreciations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_depreciations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_fieldsets`
--

DROP TABLE IF EXISTS `dynamech_tblfe_fieldsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_fieldsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `date_creator` datetime NOT NULL DEFAULT current_timestamp(),
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_fieldsets`
--

LOCK TABLES `dynamech_tblfe_fieldsets` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_fieldsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_fieldsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_goods_delivery`
--

DROP TABLE IF EXISTS `dynamech_tblfe_goods_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_goods_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rel_type` int(11) DEFAULT NULL COMMENT 'type goods delivery',
  `rel_document` int(11) DEFAULT NULL COMMENT 'document id of goods delivery',
  `customer_code` text DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `to_` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL COMMENT 'the reason delivery',
  `staff_id` int(11) DEFAULT NULL COMMENT 'salesman',
  `date_c` date DEFAULT NULL,
  `date_add` date DEFAULT NULL,
  `goods_delivery_code` varchar(100) DEFAULT NULL COMMENT 'số chứng từ xuất kho',
  `approval` int(11) DEFAULT 0 COMMENT 'status approval ',
  `addedfrom` int(11) DEFAULT NULL,
  `total_money` varchar(200) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `total_discount` varchar(100) DEFAULT NULL,
  `after_discount` varchar(100) DEFAULT NULL,
  `invoice_id` varchar(100) DEFAULT NULL,
  `project` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `requester` int(11) DEFAULT NULL,
  `invoice_no` text DEFAULT NULL,
  `pr_order_id` int(11) DEFAULT NULL,
  `type_of_delivery` varchar(100) DEFAULT 'total',
  `additional_discount` decimal(15,2) DEFAULT 0.00,
  `sub_total` decimal(15,2) DEFAULT 0.00,
  `delivery_status` varchar(100) DEFAULT 'ready_for_packing',
  `shipping_fee` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_goods_delivery`
--

LOCK TABLES `dynamech_tblfe_goods_delivery` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_goods_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_goods_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_goods_delivery_activity_log`
--

DROP TABLE IF EXISTS `dynamech_tblfe_goods_delivery_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_goods_delivery_activity_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(100) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `additional_data` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_goods_delivery_activity_log`
--

LOCK TABLES `dynamech_tblfe_goods_delivery_activity_log` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_goods_delivery_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_goods_delivery_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_goods_delivery_detail`
--

DROP TABLE IF EXISTS `dynamech_tblfe_goods_delivery_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_goods_delivery_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_delivery_id` int(11) NOT NULL,
  `commodity_code` varchar(100) DEFAULT NULL,
  `commodity_name` text DEFAULT NULL,
  `warehouse_id` text DEFAULT NULL,
  `unit_id` text DEFAULT NULL,
  `quantities` text DEFAULT NULL,
  `unit_price` varchar(100) DEFAULT NULL,
  `total_money` varchar(200) DEFAULT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `discount_money` varchar(100) DEFAULT NULL,
  `available_quantity` varchar(100) DEFAULT NULL,
  `tax_id` varchar(100) DEFAULT NULL,
  `total_after_discount` varchar(100) DEFAULT NULL,
  `expiry_date` text DEFAULT NULL,
  `lot_number` text DEFAULT NULL,
  `guarantee_period` text DEFAULT NULL,
  `tax_rate` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `sub_total` decimal(15,2) DEFAULT 0.00,
  `packing_qty` decimal(15,2) DEFAULT 0.00,
  `serial_number` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_goods_delivery_detail`
--

LOCK TABLES `dynamech_tblfe_goods_delivery_detail` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_goods_delivery_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamech_tblfe_goods_delivery_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamech_tblfe_goods_delivery_invoices_pr_orders`
--

DROP TABLE IF EXISTS `dynamech_tblfe_goods_delivery_invoices_pr_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamech_tblfe_goods_delivery_invoices_pr_orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) DEFAULT NULL COMMENT 'goods_delivery_id',
  `rel_type` int(11) DEFAULT NULL COMMENT 'invoice_id or purchase order id',
  `type` varchar(100) DEFAULT NULL COMMENT 'invoice,  purchase_orders',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamech_tblfe_goods_delivery_invoices_pr_orders`
--

LOCK TABLES `dynamech_tblfe_goods_delivery_invoices_pr_orders` WRITE;
/*!40000 ALTER TABLE `dynamech_tblfe_goods_delivery_invoices_pr_orders` DISABLE KEYS */;
