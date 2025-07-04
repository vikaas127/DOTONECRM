<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Vps_api
{
    protected $username;
    protected $password;
    protected $primaryDomain;
    protected $port;
    protected $prefix;

    protected $documentRoot;

    protected $mysqlHost;
    protected $mysqlPort;
    protected $mysqlRootUser;
    protected $mysqlRootPass;
    protected $enableSeparateUser;

    public function init($username, $password, $primaryDomain, $port, $prefix)
    {
        $this->username = $username;
        $this->password = $password;
        $this->primaryDomain = $primaryDomain;
        $this->port = $port;
        $this->prefix = $prefix;

        $this->documentRoot = rtrim(get_option('perfex_saas_vps_document_root'), '/');
        $this->mysqlHost = get_option('perfex_saas_mysql_root_host', 'localhost');
        $this->mysqlPort = get_option('perfex_saas_mysql_root_port', '3306');
        $this->mysqlRootUser = get_option('perfex_saas_mysql_root_username', 'root');
        $this->mysqlRootPass = get_option('perfex_saas_mysql_root_password', '');
        $this->enableSeparateUser = get_option('perfex_saas_mysql_root_enable_separate_user', 1);

        return $this;
    }

    public function addPrefix($name)
    {
        return $this->prefix . $name;
    }

    public function createSubdomain($slug, $domain, $docRoot = null)
    {
        $subdomain = "$slug.$domain";
        $subdomainDir = $docRoot ? rtrim($docRoot, '/') . "/$slug" : "$this->documentRoot/$slug";

        if (!is_dir($subdomainDir)) {
            mkdir($subdomainDir, 0755, true);
        }

        $vhost = "
<VirtualHost *:80>
    ServerName $subdomain
    DocumentRoot $subdomainDir
    <Directory $subdomainDir>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>";

        $confPath = "/etc/apache2/sites-available/$subdomain.conf";
        file_put_contents($confPath, $vhost);

        exec("a2ensite $subdomain.conf");
        exec("systemctl reload apache2");
    }

    public function deleteSubdomain($slug, $domain)
    {
        $subdomain = "$slug.$domain";
        $confPath = "/etc/apache2/sites-available/$subdomain.conf";
        $subdomainDir = "$this->documentRoot/$slug";

        exec("a2dissite $subdomain.conf");
        exec("systemctl reload apache2");
        if (file_exists($confPath)) {
            unlink($confPath);
        }

        exec("rm -rf $subdomainDir");
    }

    public function createDatabase($db_name)
    {
        $mysqli = $this->connectRoot();
        $mysqli->query("CREATE DATABASE `$db_name`");
        $mysqli->close();
    }

    public function deleteDatabase($db_name)
    {
        $mysqli = $this->connectRoot();
        $mysqli->query("DROP DATABASE IF EXISTS `$db_name`");
        $mysqli->close();
    }

    public function createDatabaseUser($user, $password)
    {
        if (!$this->enableSeparateUser) return;
        $mysqli = $this->connectRoot();
        $mysqli->query("CREATE USER '$user'@'localhost' IDENTIFIED BY '$password'");
        $mysqli->close();
    }

    public function deleteDatabaseUser($user)
    {
        if (!$this->enableSeparateUser) return;
        $mysqli = $this->connectRoot();
        $mysqli->query("DROP USER IF EXISTS '$user'@'localhost'");
        $mysqli->close();
    }

    public function setDatabaseUserPrivileges($user, $db)
    {
        if (!$this->enableSeparateUser) return;
        $mysqli = $this->connectRoot();
        $mysqli->query("GRANT ALL PRIVILEGES ON `$db`.* TO '$user'@'localhost'");
        $mysqli->query("FLUSH PRIVILEGES");
        $mysqli->close();
    }

    protected function connectRoot()
    {
        $mysqli = new mysqli(
            $this->mysqlHost,
            $this->mysqlRootUser,
            $this->mysqlRootPass,
            '',
            (int)$this->mysqlPort
        );

        if ($mysqli->connect_error) {
            throw new Exception('MySQL Connection failed: ' . $mysqli->connect_error);
        }

        return $mysqli;
    }
}
