<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Migration_Version_034 extends App_module_migration
{
    public function up()
    {
        $CI = &get_instance();

        // SQL for new tables (use placeholders for db prefix if needed)
        $sqls = [

            "CREATE TABLE IF NOT EXISTS `{dbprefix}tblnaming_attr_pref` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `group_subgroup_pairs` JSON NOT NULL,
                `separator` VARCHAR(10) DEFAULT ' - ',
                `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",

            "CREATE TABLE IF NOT EXISTS `{dbprefix}tblnaming_attr_store` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `pref_id` INT NOT NULL,
                `attr_id` INT NOT NULL,
                `name` VARCHAR(100) NOT NULL,
                `display_order` INT DEFAULT 0,
                `use_attr` BOOLEAN DEFAULT TRUE,
                `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (`pref_id`) REFERENCES `{dbprefix}tblnaming_attr_pref`(`id`) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;"
        ];

        // Run on MASTER DB
        foreach ($sqls as $sql) {
            $CI->db->query(str_replace('{dbprefix}', db_prefix(), $sql));
        }

        // Run for ALL TENANTS
        $tenants = $CI->perfex_saas_model->companies();
        foreach ($tenants as $tenant) {
            $dsn = perfex_saas_get_company_dsn($tenant);
            foreach ($sqls as $sql) {
                perfex_saas_raw_query(str_replace('{dbprefix}', perfex_saas_tenant_db_prefix($tenant->slug), $sql), $dsn);
            }
        }
    }

    public function down()
    {
        $CI = &get_instance();

        $sqls = [
            "DROP TABLE IF EXISTS `{dbprefix}tblnaming_attr_store`;",
            "DROP TABLE IF EXISTS `{dbprefix}tblnaming_attr_pref`;"
        ];

        // Drop from MASTER
        foreach ($sqls as $sql) {
            $CI->db->query(str_replace('{dbprefix}', db_prefix(), $sql));
        }

        // Drop from TENANTS
        $tenants = $CI->perfex_saas_model->companies();
        foreach ($tenants as $tenant) {
            $dsn = perfex_saas_get_company_dsn($tenant);
            foreach ($sqls as $sql) {
                perfex_saas_raw_query(str_replace('{dbprefix}', perfex_saas_tenant_db_prefix($tenant->slug), $sql), $dsn);
            }
        }
    }
}
