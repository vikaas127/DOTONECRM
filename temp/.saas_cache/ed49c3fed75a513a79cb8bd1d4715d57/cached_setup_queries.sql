CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `date` datetime NOT NULL,
  `staffid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}activity_log` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}announcements` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}announcements` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}clients` (
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
  PRIMARY KEY (`userid`),
  KEY `country` (`country`),
  KEY `leadid` (`leadid`),
  KEY `company` (`company`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}clients` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}consents` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}consents` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}consent_purposes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}consent_purposes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contacts` (
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contacts` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contact_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contact_permissions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contracts` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contracts` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contracts_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contracts_types` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contract_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  `contract_id` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contract_comments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}contract_renewals` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}contract_renewals` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}countries` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}countries` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}creditnotes` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}creditnotes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}creditnote_refunds` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}creditnote_refunds` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}credits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `credit_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_applied` datetime NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}credits` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `decimal_separator` varchar(5) DEFAULT NULL,
  `thousand_separator` varchar(5) DEFAULT NULL,
  `placement` varchar(10) DEFAULT NULL,
  `isdefault` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}currencies` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customers_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `default_discount` decimal(5,2) DEFAULT NULL COMMENT 'Default discount to apply unless item overrides',
  `default_profit_margin` decimal(5,2) DEFAULT NULL COMMENT 'Used to auto-calculate selling price from cost',
  `override_allowed` tinyint(1) DEFAULT 1 COMMENT '1 = allow item-level override, 0 = enforce group defaults only',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customers_groups` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customer_admins` (
  `staff_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_assigned` mediumtext NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customer_admins` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupid` (`groupid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customer_groups` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customfields` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customfields` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}customfieldsvalues` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}customfieldsvalues` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}departments` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}departments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}dismissed_announcements` (
  `dismissedannouncementid` int(11) NOT NULL AUTO_INCREMENT,
  `announcementid` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`dismissedannouncementid`),
  KEY `announcementid` (`announcementid`),
  KEY `staff` (`staff`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}dismissed_announcements` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}emailtemplates` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3069 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}emailtemplates` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}estimates` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}estimates` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}estimate_requests` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}estimate_requests` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}estimate_request_forms` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}estimate_request_forms` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}estimate_request_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `flag` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}estimate_request_status` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}events` (
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
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}events` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}expenses` (
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
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `category` (`category`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}expenses` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}expenses_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}expenses_categories` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(40) DEFAULT NULL,
  `visible_to_customer` int(11) NOT NULL DEFAULT 0,
  `attachment_key` varchar(32) DEFAULT NULL,
  `external` varchar(40) DEFAULT NULL,
  `external_link` mediumtext DEFAULT NULL,
  `thumbnail_link` mediumtext DEFAULT NULL COMMENT 'For external usage',
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT 0,
  `task_comment_id` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}files` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `builder` mediumtext NOT NULL,
  `staff_id` int(10) unsigned NOT NULL,
  `identifier` varchar(191) NOT NULL,
  `is_shared` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}filters` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}filter_defaults` (
  `filter_id` int(10) unsigned NOT NULL,
  `staff_id` int(11) NOT NULL,
  `identifier` varchar(191) NOT NULL,
  `view` varchar(191) NOT NULL,
  KEY `filter_id` (`filter_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `{TENANT_SLUG_PLACEHOLDER}filter_defaults_ibfk_1` FOREIGN KEY (`filter_id`) REFERENCES `tblfilters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `{TENANT_SLUG_PLACEHOLDER}filter_defaults_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `tblstaff` (`staffid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}filter_defaults` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}form_questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `question` longtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `question_order` int(11) NOT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}form_questions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}form_question_box` (
  `boxid` int(11) NOT NULL AUTO_INCREMENT,
  `boxtype` varchar(10) NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`boxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}form_question_box` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}form_question_box_description` (
  `questionboxdescriptionid` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `boxid` longtext NOT NULL,
  `questionid` int(11) NOT NULL,
  PRIMARY KEY (`questionboxdescriptionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}form_question_box_description` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}form_results` (
  `resultid` int(11) NOT NULL AUTO_INCREMENT,
  `boxid` int(11) NOT NULL,
  `boxdescriptionid` int(11) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) DEFAULT NULL,
  `questionid` int(11) NOT NULL,
  `answer` mediumtext DEFAULT NULL,
  `resultsetid` int(11) NOT NULL,
  PRIMARY KEY (`resultid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}form_results` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}gdpr_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL DEFAULT 0,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `lead_id` int(11) NOT NULL DEFAULT 0,
  `request_type` varchar(191) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `request_from` varchar(150) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}gdpr_requests` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}invoicepaymentrecords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoiceid` int(11) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `paymentmode` varchar(40) DEFAULT NULL,
  `paymentmethod` varchar(191) DEFAULT NULL,
  `date` date NOT NULL,
  `daterecorded` datetime NOT NULL,
  `note` mediumtext DEFAULT NULL,
  `transactionid` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoiceid`),
  KEY `paymentmethod` (`paymentmethod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}invoicepaymentrecords` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(1) NOT NULL DEFAULT 0,
  `datesend` datetime DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  `deleted_customer_name` varchar(100) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `number_format` int(11) NOT NULL DEFAULT 0,
  `datecreated` datetime NOT NULL,
  `date` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `total` decimal(15,2) NOT NULL,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `status` int(11) DEFAULT 1,
  `clientnote` mediumtext DEFAULT NULL,
  `adminnote` mediumtext DEFAULT NULL,
  `last_overdue_reminder` date DEFAULT NULL,
  `last_due_reminder` date DEFAULT NULL,
  `cancel_overdue_reminders` int(11) NOT NULL DEFAULT 0,
  `allowed_payment_modes` longtext DEFAULT NULL,
  `token` longtext DEFAULT NULL,
  `discount_percent` decimal(15,2) DEFAULT 0.00,
  `discount_total` decimal(15,2) DEFAULT 0.00,
  `discount_type` varchar(30) NOT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `recurring_type` varchar(10) DEFAULT NULL,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `cycles` int(11) NOT NULL DEFAULT 0,
  `total_cycles` int(11) NOT NULL DEFAULT 0,
  `is_recurring_from` int(11) DEFAULT NULL,
  `last_recurring_date` date DEFAULT NULL,
  `terms` mediumtext DEFAULT NULL,
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
  `show_shipping_on_invoice` tinyint(1) NOT NULL DEFAULT 1,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `project_id` int(11) DEFAULT 0,
  `subscription_id` int(11) NOT NULL DEFAULT 0,
  `perfex_saas_packageid` int(11) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency` (`currency`),
  KEY `clientid` (`clientid`),
  KEY `project_id` (`project_id`),
  KEY `sale_agent` (`sale_agent`),
  KEY `total` (`total`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}invoices` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}itemable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `description` longtext NOT NULL,
  `long_description` longtext DEFAULT NULL,
  `qty` decimal(15,2) NOT NULL,
  `rate` decimal(15,2) NOT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  `wh_delivered_quantity` decimal(15,2) DEFAULT 0.00,
  `item_id` int(11) DEFAULT NULL,
  `line_discount_rate` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `qty` (`qty`),
  KEY `rate` (`rate`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}itemable` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `sort_name` varchar(255) DEFAULT NULL,
  `long_description` mediumtext DEFAULT NULL,
  `rate` decimal(15,2) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax2` int(11) DEFAULT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `product_type` varchar(100) DEFAULT NULL,
  `description_internal_transfers` text DEFAULT NULL,
  `description_receipts` text DEFAULT NULL,
  `description_delivery_orders` text DEFAULT NULL,
  `customer_lead_time` decimal(15,2) DEFAULT 0.00,
  `replenish_on_order` varchar(100) DEFAULT NULL,
  `supplier_taxes_id` text DEFAULT NULL,
  `description_sale` text DEFAULT NULL,
  `invoice_policy` varchar(100) DEFAULT 'ordered_quantities',
  `purchase_unit_measure` int(11) DEFAULT NULL,
  `can_be_sold` varchar(100) DEFAULT 'can_be_sold',
  `can_be_purchased` varchar(100) DEFAULT 'can_be_purchased',
  `can_be_manufacturing` varchar(100) DEFAULT 'can_be_manufacturing',
  `manufacture` varchar(100) DEFAULT NULL,
  `manufacturing_lead_time` decimal(15,2) DEFAULT 0.00,
  `weight` decimal(15,2) DEFAULT 0.00,
  `volume` decimal(15,2) DEFAULT 0.00,
  `hs_code` varchar(200) DEFAULT NULL,
  `commodity_code` varchar(100) NOT NULL,
  `commodity_barcode` text DEFAULT NULL,
  `commodity_type` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `style_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `sku_code` varchar(200) DEFAULT NULL,
  `sku_name` varchar(200) DEFAULT NULL,
  `purchase_price` decimal(15,2) DEFAULT NULL,
  `sub_group` varchar(200) DEFAULT NULL,
  `commodity_name` varchar(200) NOT NULL,
  `color` text DEFAULT NULL,
  `guarantee` text DEFAULT NULL,
  `profif_ratio` text DEFAULT NULL,
  `active` int(11) DEFAULT 1,
  `long_descriptions` longtext DEFAULT NULL,
  `without_checking_warehouse` int(11) DEFAULT 0,
  `series_id` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL,
  `parent_attributes` longtext DEFAULT NULL,
  `can_be_inventory` varchar(100) DEFAULT 'can_be_inventory',
  `from_vendor_item` int(11) DEFAULT NULL,
  `thickness` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax` (`tax`),
  KEY `tax2` (`tax2`),
  KEY `group_id` (`group_id`),
  KEY `idx_items_sort_name` (`sort_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}items` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}items_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `commodity_group_code` varchar(100) DEFAULT NULL,
  `order` int(10) DEFAULT NULL,
  `display` int(1) DEFAULT NULL,
  `note` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}items_groups` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}item_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  `taxname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemid` (`itemid`),
  KEY `rel_id` (`rel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}item_tax` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}knowedge_base_article_feedback` (
  `articleanswerid` int(11) NOT NULL AUTO_INCREMENT,
  `articleid` int(11) NOT NULL,
  `answer` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`articleanswerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}knowedge_base_article_feedback` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}knowledge_base` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `articlegroup` int(11) NOT NULL,
  `subject` longtext NOT NULL,
  `description` mediumtext NOT NULL,
  `slug` longtext NOT NULL,
  `active` tinyint(4) NOT NULL,
  `datecreated` datetime NOT NULL,
  `article_order` int(11) NOT NULL DEFAULT 0,
  `staff_article` int(11) NOT NULL DEFAULT 0,
  `question_answers` int(11) DEFAULT 0,
  `file_name` varchar(255) DEFAULT '',
  `curator` varchar(11) DEFAULT '',
  `benchmark` int(11) DEFAULT 0,
  `score` int(11) DEFAULT 0,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}knowledge_base` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}knowledge_base_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `group_slug` mediumtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `group_order` int(11) DEFAULT 0,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}knowledge_base_groups` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(65) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(191) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(15) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `assigned` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  `from_form_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `source` int(11) NOT NULL,
  `lastcontact` datetime DEFAULT NULL,
  `dateassigned` date DEFAULT NULL,
  `last_status_change` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `leadorder` int(11) DEFAULT 1,
  `phonenumber` varchar(50) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `lost` tinyint(1) NOT NULL DEFAULT 0,
  `junk` int(11) NOT NULL DEFAULT 0,
  `last_lead_status` int(11) NOT NULL DEFAULT 0,
  `is_imported_from_email_integration` tinyint(1) NOT NULL DEFAULT 0,
  `email_integration_uid` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `default_language` varchar(40) DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT 0,
  `lead_value` decimal(15,2) DEFAULT NULL,
  `vat` varchar(50) DEFAULT NULL,
  `from_ma_form_id` int(11) NOT NULL DEFAULT 0,
  `ma_point` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `company` (`company`),
  KEY `email` (`email`),
  KEY `assigned` (`assigned`),
  KEY `status` (`status`),
  KEY `source` (`source`),
  KEY `lastcontact` (`lastcontact`),
  KEY `dateadded` (`dateadded`),
  KEY `leadorder` (`leadorder`),
  KEY `from_form_id` (`from_form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}leads` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}leads_email_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'the ID always must be 1',
  `active` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `imap_server` varchar(100) NOT NULL,
  `password` longtext NOT NULL,
  `check_every` int(11) NOT NULL DEFAULT 5,
  `responsible` int(11) NOT NULL,
  `lead_source` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `encryption` varchar(3) DEFAULT NULL,
  `folder` varchar(100) NOT NULL,
  `last_run` varchar(50) DEFAULT NULL,
  `notify_lead_imported` tinyint(1) NOT NULL DEFAULT 1,
  `notify_lead_contact_more_times` tinyint(1) NOT NULL DEFAULT 1,
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` longtext DEFAULT NULL,
  `mark_public` int(11) NOT NULL DEFAULT 0,
  `only_loop_on_unseen_emails` tinyint(1) NOT NULL DEFAULT 1,
  `delete_after_import` int(11) NOT NULL DEFAULT 0,
  `create_task_if_customer` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}leads_email_integration` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}leads_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}leads_sources` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}leads_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `statusorder` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT '#28B8DA',
  `isdefault` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}leads_status` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}lead_activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leadid` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `additional_data` mediumtext DEFAULT NULL,
  `date` datetime NOT NULL,
  `staffid` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `custom_activity` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}lead_activity_log` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}lead_integration_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `leadid` int(11) NOT NULL,
  `emailid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}lead_integration_emails` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}mail_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine` varchar(40) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `cc` mediumtext DEFAULT NULL,
  `bcc` mediumtext DEFAULT NULL,
  `message` longtext NOT NULL,
  `alt_message` longtext DEFAULT NULL,
  `status` enum('pending','sending','sent','failed') DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` mediumtext DEFAULT NULL,
  `attachments` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}mail_queue` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}migrations` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}milestones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `description_visible_to_customer` tinyint(1) DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `milestone_order` int(11) NOT NULL DEFAULT 0,
  `datecreated` date NOT NULL,
  `hide_from_customer` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}milestones` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(55) NOT NULL,
  `installed_version` varchar(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}modules` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}newsfeed_comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `commentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}newsfeed_comment_likes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}newsfeed_posts` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `visibility` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `pinned` int(11) NOT NULL,
  `datepinned` datetime DEFAULT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}newsfeed_posts` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}newsfeed_post_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}newsfeed_post_comments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}newsfeed_post_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dateliked` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}newsfeed_post_likes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `date_contacted` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}notes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isread` int(11) NOT NULL DEFAULT 0,
  `isread_inline` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `description` mediumtext NOT NULL,
  `fromuserid` int(11) NOT NULL,
  `fromclientid` int(11) NOT NULL DEFAULT 0,
  `from_fullname` varchar(100) NOT NULL,
  `touserid` int(11) NOT NULL,
  `fromcompany` int(11) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `additional_data` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}notifications` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `autoload` tinyint(1) NOT NULL DEFAULT 1,
  `annual_turnover` decimal(15,2) DEFAULT 0.00 COMMENT 'Yearly turnover (?) as declared by admin or fetched from GSTR-3B',
  `einvoice_enabled` tinyint(1) DEFAULT 0 COMMENT 'True/False – whether E-Invoicing is enabled for this company',
  `einvoice_enforced` tinyint(1) DEFAULT 0 COMMENT 'True if system decides it must be enabled (auto based on turnover)',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=815 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}options` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}payment_attempts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `fee` double NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}payment_attempts` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}payment_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `show_on_pdf` int(11) NOT NULL DEFAULT 0,
  `invoices_only` int(11) NOT NULL DEFAULT 0,
  `expenses_only` int(11) NOT NULL DEFAULT 0,
  `selected_by_default` int(11) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}payment_modes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}pinned_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}pinned_projects` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}projectdiscussioncomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_id` int(11) NOT NULL,
  `discussion_type` varchar(10) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `staff_id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT 0,
  `fullname` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `file_mime_type` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}projectdiscussioncomments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}projectdiscussions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `description` mediumtext NOT NULL,
  `show_to_customer` tinyint(1) NOT NULL DEFAULT 0,
  `datecreated` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 0,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}projectdiscussions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `clientid` int(11) NOT NULL,
  `billing_type` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `project_created` date NOT NULL,
  `date_finished` datetime DEFAULT NULL,
  `progress` int(11) DEFAULT 0,
  `progress_from_tasks` int(11) NOT NULL DEFAULT 1,
  `project_cost` decimal(15,2) DEFAULT NULL,
  `project_rate_per_hour` decimal(15,2) DEFAULT NULL,
  `estimated_hours` decimal(15,2) DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `contact_notification` int(11) DEFAULT 1,
  `notify_contacts` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}projects` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL DEFAULT 0,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `fullname` varchar(100) DEFAULT NULL,
  `visible_to_customer` int(11) NOT NULL DEFAULT 0,
  `description_key` varchar(191) NOT NULL COMMENT 'Language file key',
  `additional_data` mediumtext DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_activity` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(191) NOT NULL,
  `original_file_name` longtext DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `visible_to_customer` tinyint(1) DEFAULT 0,
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `external` varchar(40) DEFAULT NULL,
  `external_link` mediumtext DEFAULT NULL,
  `thumbnail_link` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_files` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_members` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `content` mediumtext NOT NULL,
  `staff_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_notes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}project_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}project_settings` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}proposals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(191) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `datecreated` datetime NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `total_tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `adjustment` decimal(15,2) DEFAULT NULL,
  `discount_percent` decimal(15,2) NOT NULL,
  `discount_total` decimal(15,2) NOT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `show_quantity_as` int(11) NOT NULL DEFAULT 1,
  `currency` int(11) NOT NULL,
  `open_till` date DEFAULT NULL,
  `date` date NOT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(40) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `hash` varchar(32) NOT NULL,
  `proposal_to` varchar(191) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `country` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(50) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL,
  `estimate_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `date_converted` datetime DEFAULT NULL,
  `pipeline_order` int(11) DEFAULT 1,
  `is_expiry_notified` int(11) NOT NULL DEFAULT 0,
  `acceptance_firstname` varchar(50) DEFAULT NULL,
  `acceptance_lastname` varchar(50) DEFAULT NULL,
  `acceptance_email` varchar(100) DEFAULT NULL,
  `acceptance_date` datetime DEFAULT NULL,
  `acceptance_ip` varchar(40) DEFAULT NULL,
  `signature` varchar(40) DEFAULT NULL,
  `short_link` varchar(100) DEFAULT NULL,
  `processing` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}proposals` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}proposal_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext DEFAULT NULL,
  `proposalid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}proposal_comments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}related_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(30) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}related_items` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}reminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext DEFAULT NULL,
  `date` datetime NOT NULL,
  `isnotified` int(11) NOT NULL DEFAULT 0,
  `rel_id` int(11) NOT NULL,
  `staff` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `notify_by_email` int(11) NOT NULL DEFAULT 1,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `staff` (`staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}reminders` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}roles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `permissions` longtext DEFAULT NULL,
  `enable_gg_auth` int(1) DEFAULT 0,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}roles` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}sales_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_type` varchar(20) DEFAULT NULL,
  `rel_id` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `additional_data` mediumtext DEFAULT NULL,
  `staffid` varchar(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}sales_activity` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}scheduled_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(15) NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `contacts` varchar(197) NOT NULL,
  `cc` mediumtext DEFAULT NULL,
  `attach_pdf` tinyint(1) NOT NULL DEFAULT 1,
  `template` varchar(197) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}scheduled_emails` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}services` (
  `serviceid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}services` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}sessions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}shared_customer_files` (
  `file_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}shared_customer_files` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}spam_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL,
  `rel_type` varchar(10) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}spam_filters` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}staff` (
  `staffid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `facebook` longtext DEFAULT NULL,
  `linkedin` longtext DEFAULT NULL,
  `phonenumber` varchar(30) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `password` varchar(250) NOT NULL,
  `datecreated` datetime NOT NULL,
  `profile_image` varchar(191) DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `last_password_change` datetime DEFAULT NULL,
  `new_pass_key` varchar(32) DEFAULT NULL,
  `new_pass_key_requested` datetime DEFAULT NULL,
  `admin` int(11) NOT NULL DEFAULT 0,
  `role` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `default_language` varchar(40) DEFAULT NULL,
  `direction` varchar(3) DEFAULT NULL,
  `media_path_slug` varchar(191) DEFAULT NULL,
  `is_not_staff` int(11) NOT NULL DEFAULT 0,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `two_factor_auth_enabled` tinyint(1) DEFAULT 0,
  `two_factor_auth_code` varchar(100) DEFAULT NULL,
  `two_factor_auth_code_requested` datetime DEFAULT NULL,
  `email_signature` mediumtext DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `birthplace` varchar(200) DEFAULT NULL,
  `sex` varchar(15) DEFAULT NULL,
  `marital_status` varchar(25) DEFAULT NULL,
  `nation` varchar(25) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `identification` varchar(100) DEFAULT NULL,
  `days_for_identity` date DEFAULT NULL,
  `home_town` varchar(200) DEFAULT NULL,
  `resident` varchar(200) DEFAULT NULL,
  `current_address` varchar(200) DEFAULT NULL,
  `literacy` varchar(50) DEFAULT NULL,
  `orther_infor` text DEFAULT NULL,
  `job_position` int(11) DEFAULT NULL,
  `workplace` int(11) DEFAULT NULL,
  `place_of_issue` varchar(50) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `name_account` varchar(50) DEFAULT NULL,
  `issue_bank` varchar(200) DEFAULT NULL,
  `records_received` longtext DEFAULT NULL,
  `Personal_tax_code` varchar(50) DEFAULT NULL,
  `google_auth_secret` mediumtext DEFAULT NULL,
  `team_manage` int(11) DEFAULT 0,
  `staff_identifi` varchar(200) DEFAULT NULL,
  `status_work` varchar(100) DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  `epf_no` text DEFAULT NULL,
  `social_security_no` text DEFAULT NULL,
  `mail_password` varchar(250) DEFAULT NULL,
  `mail_signature` varchar(250) DEFAULT NULL,
  `last_email_check` varchar(50) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `uan_no` varchar(20) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `ho_wo_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `disability_type` varchar(100) DEFAULT NULL,
  `adhar_no` varchar(20) DEFAULT NULL,
  `esi_insurance_no` varchar(20) DEFAULT NULL,
  `esi_enable` tinyint(1) DEFAULT 0,
  `epf_enable` tinyint(1) DEFAULT 0,
  `enable_contribute_to_employee_pension_scheme` tinyint(1) DEFAULT 0,
  `contribute_eps_on_actual_pf_wages` tinyint(1) DEFAULT 0,
  `mfa_google_ath_enable` tinyint(1) DEFAULT 0,
  `mfa_whatsapp_enable` tinyint(1) DEFAULT 0,
  `mfa_sms_enable` tinyint(1) DEFAULT 0,
  `whatsapp_number` text DEFAULT '',
  `gg_auth_secret_key` text DEFAULT '',
  PRIMARY KEY (`staffid`),
  KEY `firstname` (`firstname`),
  KEY `lastname` (`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}staff` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}staff_departments` (
  `staffdepartmentid` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `departmentid` int(11) NOT NULL,
  PRIMARY KEY (`staffdepartmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}staff_departments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}staff_permissions` (
  `staff_id` int(11) NOT NULL,
  `feature` varchar(40) NOT NULL,
  `capability` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}staff_permissions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `description_in_item` tinyint(1) NOT NULL DEFAULT 0,
  `clientid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `terms` mediumtext DEFAULT NULL,
  `currency` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL DEFAULT 0,
  `stripe_tax_id` varchar(50) DEFAULT NULL,
  `tax_id_2` int(11) NOT NULL DEFAULT 0,
  `stripe_tax_id_2` varchar(50) DEFAULT NULL,
  `stripe_plan_id` mediumtext DEFAULT NULL,
  `stripe_subscription_id` mediumtext NOT NULL,
  `next_billing_cycle` bigint(20) DEFAULT NULL,
  `ends_at` bigint(20) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(32) NOT NULL,
  `created` datetime NOT NULL,
  `created_from` int(11) NOT NULL,
  `date_subscribed` datetime DEFAULT NULL,
  `in_test_environment` int(11) DEFAULT NULL,
  `last_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `currency` (`currency`),
  KEY `tax_id` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}subscriptions` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}taggables` (
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `tag_order` int(11) NOT NULL DEFAULT 0,
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}taggables` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tags` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  `startdate` date NOT NULL,
  `duedate` date DEFAULT NULL,
  `datefinished` datetime DEFAULT NULL,
  `addedfrom` int(11) NOT NULL,
  `is_added_from_contact` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `recurring_type` varchar(10) DEFAULT NULL,
  `repeat_every` int(11) DEFAULT NULL,
  `recurring` int(11) NOT NULL DEFAULT 0,
  `is_recurring_from` int(11) DEFAULT NULL,
  `cycles` int(11) NOT NULL DEFAULT 0,
  `total_cycles` int(11) NOT NULL DEFAULT 0,
  `custom_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `last_recurring_date` date DEFAULT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `rel_type` varchar(30) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `billable` tinyint(1) NOT NULL DEFAULT 0,
  `billed` tinyint(1) NOT NULL DEFAULT 0,
  `invoice_id` int(11) NOT NULL DEFAULT 0,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `milestone` int(11) DEFAULT 0,
  `kanban_order` int(11) DEFAULT 1,
  `milestone_order` int(11) NOT NULL DEFAULT 0,
  `visible_to_client` tinyint(1) NOT NULL DEFAULT 0,
  `deadline_notified` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_type` (`rel_type`),
  KEY `milestone` (`milestone`),
  KEY `kanban_order` (`kanban_order`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tasks` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}taskstimers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `start_time` varchar(64) NOT NULL,
  `end_time` varchar(64) DEFAULT NULL,
  `staff_id` int(11) NOT NULL,
  `hourly_rate` decimal(15,2) NOT NULL DEFAULT 0.00,
  `note` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}taskstimers` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tasks_checklist_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tasks_checklist_templates` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}task_assigned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `assigned_from` int(11) NOT NULL DEFAULT 0,
  `is_assigned_from_contact` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}task_assigned` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}task_checklist_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskid` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `finished` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `finished_from` int(11) DEFAULT 0,
  `list_order` int(11) NOT NULL DEFAULT 0,
  `assigned` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}task_checklist_items` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}task_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `taskid` int(11) NOT NULL,
  `staffid` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL DEFAULT 0,
  `file_id` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id` (`file_id`),
  KEY `taskid` (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}task_comments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}task_followers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staffid` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}task_followers` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `taxrate` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}taxes` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `addedfrom` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}templates` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets` (
  `ticketid` int(11) NOT NULL AUTO_INCREMENT,
  `adminreplying` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL,
  `contactid` int(11) NOT NULL DEFAULT 0,
  `merged_ticket_id` int(11) DEFAULT NULL,
  `email` mediumtext DEFAULT NULL,
  `name` mediumtext DEFAULT NULL,
  `department` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `service` int(11) DEFAULT NULL,
  `ticketkey` varchar(32) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` mediumtext DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `lastreply` datetime DEFAULT NULL,
  `clientread` int(11) NOT NULL DEFAULT 0,
  `adminread` int(11) NOT NULL DEFAULT 0,
  `assigned` int(11) NOT NULL DEFAULT 0,
  `staff_id_replying` int(11) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`ticketid`),
  KEY `service` (`service`),
  KEY `department` (`department`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `priority` (`priority`),
  KEY `project_id` (`project_id`),
  KEY `contactid` (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets_pipe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` longtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets_pipe_log` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets_predefined_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets_predefined_replies` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets_priorities` (
  `priorityid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`priorityid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets_priorities` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tickets_status` (
  `ticketstatusid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `isdefault` int(11) NOT NULL DEFAULT 0,
  `statuscolor` varchar(7) DEFAULT NULL,
  `statusorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticketstatusid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tickets_status` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}ticket_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `replyid` int(11) DEFAULT NULL,
  `file_name` varchar(191) NOT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}ticket_attachments` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}ticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticketid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `contactid` int(11) NOT NULL DEFAULT 0,
  `name` mediumtext DEFAULT NULL,
  `email` mediumtext DEFAULT NULL,
  `date` datetime NOT NULL,
  `message` mediumtext DEFAULT NULL,
  `attachment` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}ticket_replies` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}todos` (
  `todoid` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext NOT NULL,
  `staffid` int(11) NOT NULL,
  `dateadded` datetime NOT NULL,
  `finished` tinyint(1) NOT NULL,
  `datefinished` datetime DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`todoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}todos` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}tracked_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `email` varchar(100) NOT NULL,
  `opened` tinyint(1) NOT NULL DEFAULT 0,
  `date_opened` datetime DEFAULT NULL,
  `subject` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}tracked_mails` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}twocheckout_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference` varchar(64) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `attempt_reference` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `{TENANT_SLUG_PLACEHOLDER}twocheckout_log_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `tblinvoices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}twocheckout_log` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}user_auto_login` (
  `key_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_agent` varchar(150) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}user_auto_login` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}user_meta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `client_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `contact_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(191) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  `candidate_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`umeta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}user_meta` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}vault` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `server_address` varchar(191) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `username` varchar(191) NOT NULL,
  `password` mediumtext NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `creator_name` varchar(100) DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `share_in_projects` tinyint(1) NOT NULL DEFAULT 0,
  `last_updated` datetime DEFAULT NULL,
  `last_updated_from` varchar(100) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}vault` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}views_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rel_id` int(11) NOT NULL,
  `rel_type` varchar(40) NOT NULL,
  `date` datetime NOT NULL,
  `view_ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}views_tracking` AUTO_INCREMENT = 1;
CREATE TABLE IF NOT EXISTS `{TENANT_SLUG_PLACEHOLDER}web_to_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_key` varchar(32) NOT NULL,
  `lead_source` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `notify_lead_imported` int(11) NOT NULL DEFAULT 1,
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_ids` longtext DEFAULT NULL,
  `responsible` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL,
  `form_data` longtext DEFAULT NULL,
  `recaptcha` int(11) NOT NULL DEFAULT 0,
  `submit_btn_name` varchar(40) DEFAULT NULL,
  `submit_btn_text_color` varchar(10) DEFAULT '#ffffff',
  `submit_btn_bg_color` varchar(10) DEFAULT '#84c529',
  `success_submit_msg` mediumtext DEFAULT NULL,
  `submit_action` int(11) DEFAULT 0,
  `lead_name_prefix` varchar(255) DEFAULT NULL,
  `submit_redirect_url` longtext DEFAULT NULL,
  `language` varchar(40) DEFAULT NULL,
  `allow_duplicate` int(11) NOT NULL DEFAULT 1,
  `mark_public` int(11) NOT NULL DEFAULT 0,
  `track_duplicate_field` varchar(20) DEFAULT NULL,
  `track_duplicate_field_and` varchar(20) DEFAULT NULL,
  `create_task_on_duplicate` int(11) NOT NULL DEFAULT 0,
  `dateadded` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
ALTER TABLE `{TENANT_SLUG_PLACEHOLDER}web_to_lead` AUTO_INCREMENT = 1