<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Integrations extends AdminController
{
    /**
     * @inheritDoc
     */
    public function __construct()
    {
        parent::__construct();
    }

     public function test_vps()
    {
        $config = $this->input->post('settings', true);

        try {

            if (empty($config)) {
                throw new \Exception(_l('perfex_saas_empty_data'), 1);
            }

            $this->load->library(PERFEX_SAAS_MODULE_NAME . '/integrations/cpanel_api');
            if (!function_exists('random_string')) {
                $this->load->helper('string');
            }

            $db_prefix = $config['perfex_saas_cpanel_db_prefix'] ?? '';
            $db_prefix = empty($db_prefix) ? $config['perfex_saas_cpanel_username'] : $db_prefix;
            $prefix = (empty($db_prefix) ? '' : $db_prefix . '_') . PERFEX_SAAS_MODULE_NAME_SHORT . '_';

            /** @var Cpanel_api $cpanel */
            $cpanel = $this->cpanel_api->init(
                $config['perfex_saas_cpanel_username'],
                $config['perfex_saas_cpanel_password'],
                $config['perfex_saas_cpanel_login_domain'],
                $config['perfex_saas_cpanel_port'],
                $prefix
            );

            $root_dir = get_option('perfex_saas_cpanel_document_root');
            $primarydomain = $config['perfex_saas_cpanel_primary_domain'];

            //test creating subdomain and database and its removal
            $slug = 'test' . date('ymd');

            $db_password = random_string('alnum', 16);
            $db_user = $cpanel->addPrefix($slug);
            $db_name = $cpanel->addPrefix($slug);

            // try to delete if already created
            try {
                $cpanel->deleteDatabase($db_name);
                $cpanel->deleteDatabaseUser($db_user);
            } catch (\Throwable $th) {
                //throw $th;
            }

            $cpanel->createDatabase($db_name);
            $cpanel->createDatabaseUser($db_user, $db_password);
            $cpanel->setDatabaseUserPrivileges($db_user, $db_name);

            $cpanel->deleteDatabase($db_name);
            $cpanel->deleteDatabaseUser($db_user);


            // If addon domain enabled
            $alias_enabled = (int)($config['perfex_saas_cpanel_enable_addondomain'] ?? 0);
            if ($alias_enabled) {
                try {
                    $cpanel->deleteSubdomain($slug, $primarydomain);
                } catch (\Throwable $th) {
                    //throw $th;
                }
                $cpanel->createSubdomain($slug, $primarydomain, $root_dir);
                $cpanel->deleteSubdomain($slug, $primarydomain);
            }

            echo json_encode([
                'status' => 'success',
                'message' => _l('perfex_saas_integration_connection_success')
            ]);
            exit;
        } catch (\Throwable $th) {

            echo json_encode([
                'status' => 'danger',
                'message' => $th->getMessage(),
                'trace' => $th->getTraceAsString()
            ]);
            exit;
        }
    }

public function test_cpanel()
{
    $config = $this->input->post('settings', true);

    try {
        if (empty($config)) {
            throw new \Exception(_l('perfex_saas_empty_data'), 1);
        }

        if (!function_exists('random_string')) {
            $this->load->helper('string');
        }

        $slug = 'test' . date('ymdHis');
        $root_dir = rtrim(get_option('perfex_saas_vps_document_root'), '/');
        $primary_domain = get_option('perfex_saas_vps_primary_domain');
        $subdomain_dir = "$root_dir/$slug";
        $subdomain_url = "$slug.$primary_domain";

        // Create subdomain directory
        if (!is_dir($subdomain_dir)) {
            mkdir($subdomain_dir, 0755, true);
        }

        // Create Apache virtual host file
        $vhost = "
<VirtualHost *:80>
    ServerName $subdomain_url
    DocumentRoot $subdomain_dir
    <Directory $subdomain_dir>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>";
        $vhost_path = "/etc/apache2/sites-available/$subdomain_url.conf";
        file_put_contents($vhost_path, $vhost);

        // Enable site and reload Apache
        exec("a2ensite $subdomain_url.conf");
        exec("systemctl reload apache2");


$host = 'localhost';
$port = '3306';
$username = 'dotadmin';
$password = 'StrongPassTDB@123!';


        // MySQL test
        $db_user = 'u_' . $slug;
        $db_name = 'db_' . $slug;
        $db_pass = random_string('alnum', 16);
        $mysqli = new mysqli(
            $host,
            $username,
            $password,
            '',
            $port        );

        if ($mysqli->connect_error) {
            throw new Exception('MySQL Connect Error: ' . $mysqli->connect_error);
        }

        $mysqli->query("CREATE DATABASE $db_name");
        $mysqli->query("CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_pass'");
        $mysqli->query("GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost'");
        $mysqli->query("FLUSH PRIVILEGES");

        // Cleanup
        $mysqli->query("DROP DATABASE $db_name");
        $mysqli->query("DROP USER '$db_user'@'localhost'");
        $mysqli->close();

        // Remove Apache site and directory
        exec("a2dissite $subdomain_url.conf");
        exec("rm $vhost_path");
        exec("systemctl reload apache2");
        exec("rm -rf $subdomain_dir");

        echo json_encode([
            'status' => 'success',
            'message' => 'VPS integration test successful.'
        ]);
        exit;
    } catch (\Throwable $th) {
        echo json_encode([
            'status' => 'danger',
            'message' => $th->getMessage(),
            'trace' => $th->getTraceAsString()
        ]);
        exit;
    }
}

    public function test_plesk()
    {
        $config = $this->input->post('settings', true);

        try {

            if (empty($config)) {
                throw new \Exception(_l('perfex_saas_empty_data'), 1);
            }

            $this->load->library(PERFEX_SAAS_MODULE_NAME . '/integrations/plesk_api');
            if (!function_exists('random_string')) {
                $this->load->helper('string');
            }

            $prefix = PERFEX_SAAS_MODULE_NAME_SHORT . '_';

            /** @var Plesk_api $plesk */
            $plesk = $this->plesk_api->init(
                $config['perfex_saas_plesk_host'],
                $config['perfex_saas_plesk_primary_domain'],
                $config['perfex_saas_plesk_username'],
                $config['perfex_saas_plesk_password'],
                $prefix
            );

            $app_base_host = perfex_saas_get_saas_default_host();
            $primarydomain = $config['perfex_saas_plesk_primary_domain'];

            //test creating subdomain and database and its removal
            $slug = 'test-' . PERFEX_SAAS_MODULE_NAME_SHORT . '-' . date('y');
            $subdomain = $slug . '.' . $app_base_host;
            if (perfex_saas_host_is_local($app_base_host, true))
                $subdomain = $slug . '.' . $primarydomain;

            $db_password = random_string('alnum', 16);
            $db_user = $plesk->addPrefix($slug);
            $db_name = $plesk->addPrefix($slug);

            // Test database and user
            try {
                $plesk->deleteDatabase($db_name);
            } catch (\Throwable $th) {
            }
            $plesk->createDatabaseWithUser($db_user, $db_password, $db_name);
            $plesk->deleteDatabase($db_name);

            // Test alias creation
            $alias_enabled = (int)($config['perfex_saas_plesk_enable_aliasdomain'] ?? 0);
            if ($alias_enabled) {
                try {
                    $plesk->deleteSiteAlias($subdomain);
                } catch (\Throwable $th) {
                }
                $plesk->createSiteAlias($subdomain);
                $plesk->deleteSiteAlias($subdomain);
            }

            echo json_encode([
                'status' => 'success',
                'message' => _l('perfex_saas_integration_connection_success')
            ]);
            exit;
        } catch (\Throwable $th) {

            echo json_encode([
                'status' => 'danger',
                'message' => $th->getMessage(),
                'trace' => $th->getTraceAsString()
            ]);
            exit;
        }
    }

    public function test_mysql_root()
    {
        $config = $this->input->post('settings', true);

        try {

            if (empty($config)) {
                throw new \Exception(_l('perfex_saas_empty_data'), 1);
            }

            $this->load->library(PERFEX_SAAS_MODULE_NAME . '/integrations/mysql_root_api');
            if (!function_exists('random_string')) {
                $this->load->helper('string');
            }

            $prefix = PERFEX_SAAS_MODULE_NAME_SHORT . '_';

            /** @var Mysql_root_api $mysql_root */
            $mysql_root = $this->mysql_root_api->init(
                $config['perfex_saas_mysql_root_username'],
                $config['perfex_saas_mysql_root_password'],
                $config['perfex_saas_mysql_root_host'],
                $config['perfex_saas_mysql_root_port'],
                $prefix
            );

            // Test db create and removal
            $separateUserEnabled = $config['perfex_saas_mysql_root_enable_separate_user'] == '1';
            $mysql_root->testConnection($separateUserEnabled);

            echo json_encode([
                'status' => 'success',
                'message' => _l('perfex_saas_integration_connection_success')
            ]);
            exit;
        } catch (\Throwable $th) {

            echo json_encode([
                'status' => 'danger',
                'message' => $th->getMessage(),
                'trace' => $th->getTraceAsString()
            ]);
            exit;
        }
    }
}
