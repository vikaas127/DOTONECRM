<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Migration_Version_311 extends CI_Migration
{
    public function up()
    {
        // Table 1: naming_attr_pref
        $this->db->query(
            'CREATE TABLE IF NOT EXISTS `' . db_prefix() . 'naming_attr_pref` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `group_subgroup_pairs` JSON NOT NULL,
                `separator` VARCHAR(10) DEFAULT " - ",
                `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;'
        );

        // Table 2: naming_attr_store
        $this->db->query(
            'CREATE TABLE IF NOT EXISTS `' . db_prefix() . 'naming_attr_store` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `pref_id` INT NOT NULL,
                `attr_id` INT NOT NULL,
                `name` VARCHAR(100) NOT NULL,
                `display_order` INT DEFAULT 0,
                `use_attr` BOOLEAN DEFAULT TRUE,
                `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (`pref_id`) REFERENCES `' . db_prefix() . 'naming_attr_pref`(`id`) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;'
        );
    }

    public function down()
    {
        // Optional rollback
        $this->db->query('DROP TABLE IF EXISTS `' . db_prefix() . 'naming_attr_store`;');
        $this->db->query('DROP TABLE IF EXISTS `' . db_prefix() . 'naming_attr_pref`;');
    }
}
