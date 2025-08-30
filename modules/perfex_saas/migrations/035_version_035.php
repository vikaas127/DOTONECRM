<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Migration_Version_035 extends App_module_migration
{
    public function up()
    {
        $CI = &get_instance();
        $dbprefix = db_prefix();

        if (!$CI->db->table_exists($dbprefix . 'naming_attr_pref')) {
            $CI->db->query("
                CREATE TABLE `{$dbprefix}naming_attr_pref` (
                  `id` INT AUTO_INCREMENT PRIMARY KEY,
                  `group_subgroup_pairs` JSON NOT NULL,
                  `separator` VARCHAR(10) DEFAULT ' - ',
                  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
            ");
        }

        if (!$CI->db->table_exists($dbprefix . 'naming_attr_store')) {
            $CI->db->query("
                CREATE TABLE `{$dbprefix}naming_attr_store` (
                  `id` INT AUTO_INCREMENT PRIMARY KEY,
                  `pref_id` INT NOT NULL,
                  `attr_id` INT NOT NULL,
                  `name` VARCHAR(100) NOT NULL,
                  `display_order` INT DEFAULT 0,
                  `use_attr` BOOLEAN DEFAULT TRUE,
                  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                  FOREIGN KEY (`pref_id`) REFERENCES `{$dbprefix}naming_attr_pref`(`id`) ON DELETE CASCADE
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
            ");
        }
    }
}
