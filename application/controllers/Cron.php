<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Cron extends App_Controller
{


    

      
      
    
    public function index($key = '')
    {
        update_option('cron_has_run_from_cli', 1);

        if (defined('APP_CRON_KEY') && (APP_CRON_KEY != $key)) {
            header('HTTP/1.0 401 Unauthorized');
            die('Passed cron job key is not correct. The cron job key should be the same like the one defined in APP_CRON_KEY constant.');
        }

        $last_cron_run                  = get_option('last_cron_run');
        $seconds = hooks()->apply_filters('cron_functions_execute_seconds', 300);

        if ($last_cron_run == '' || (time() > ($last_cron_run + $seconds))) {
            $this->load->model('cron_model');
            $this->cron_model->run();
        }
    }
  
  /**
 * Process a single tenant queue row.
 * CLI usage:
 *   /usr/bin/php /var/www/html/index.php cron process_whatsapp_single <queue_id> <tenant_db> <tenant_prefix> <token>
 *
 * HTTP fallback:
 *   http://127.0.0.1/index.php/cron/process_whatsapp_single/<queue_id>/<tenant_db>/<tenant_prefix>?token=...
 */
public function process_whatsapp_single($queue_id = 0, $tenant_db = '', $tenant_prefix = '')
{
    // Ensure we have DB loaded for this controller
   
   
   $queue_id      = (int) $queue_id;
$tenant_db     = (string) $tenant_db;
$tenant_prefix = (string) $tenant_prefix;

log_message('debug', 'process_whatsapp_single: db='.$tenant_db.' prefix='.$tenant_prefix.' id='.$queue_id);

$expected_token = '46f332bac7c63c6dfe88e56dca96ad30792a11b861f2ce8dadb7b21733ed8139';

$is_cli = $this->input->is_cli_request();
if ($is_cli) {
    // CLI path — token must be the LAST argv
    $argv = (array) $this->input->server('argv');

    // Expect: 0=index.php 1=cron 2=process_whatsapp_single 3=queue 4=db 5=prefix 6=token
    if (count($argv) < 7) {
        log_message('error', 'process_whatsapp_single: missing CLI params. ARGV=' . print_r($argv, true));
        return;
    }

    // Safely rebind params from argv (avoid surprises if invoked differently)
    $queue_id      = (int)($argv[3] ?? $queue_id);
    $tenant_db     = (string)($argv[4] ?? $tenant_db);
    $tenant_prefix = (string)($argv[5] ?? $tenant_prefix);

    $possible_token = trim((string) end($argv));
    if (!hash_equals($expected_token, $possible_token)) {
        log_message('error', 'process_whatsapp_single: invalid token in CLI. got='.$possible_token.' expected='.$expected_token.' ARGV=' . print_r($argv, true));
        return;
    }
} else {
    // HTTP fallback — require loopback + token in GET
    $token     = (string) $this->input->get('token', true);
    $remote_ip = $this->input->ip_address();
    if (!hash_equals($expected_token, $token) || !in_array($remote_ip, ['127.0.0.1','::1'], true)) {
        show_error('Forbidden', 403);
        return;
    }
}


    // Accept args from CLI or URL segments if not provided as method params
    // (CI passes additional URI segments as method args when called via CLI or HTTP)
  /*
    $queue_id = (int)$queue_id;
    $tenant_db = (string)$tenant_db;
    $tenant_prefix = (string)$tenant_prefix;
    log_message('debug', 'process_whatsapp_single: prefix '.$tenant_db.' prefix='.$tenant_prefix .' id='.$queue_id);
    // If called via HTTP (curl fallback), token is passed in GET
    $is_cli = $this->input->is_cli_request();
    if ($is_cli) {
        // For CLI, token will be in argv (last param) — fetch from argv if available
        $argv = $this->input->server('argv');
        $expected_token = '46f332bac7c63c6dfe88e56dca96ad30792a11b861f2ce8dadb7b21733ed8139';
        if (is_array($argv) && count($argv) >= 5) {
            // argv example: [index.php, 'cron', 'process_whatsapp_single', '<queue_id>', '<tenant_db>', '<tenant_prefix>', '<token>']
            // token likely at the end
            $possible_token = end($argv);
            if ($possible_token !== $expected_token) {
                log_message('error', 'process_whatsapp_single: invalid token in CLI');
                return;
            }
        } else {
            // If no token passed via CLI, you may decide to allow or reject; we'll reject for safety
            log_message('error', 'process_whatsapp_single: missing CLI token');
            return;
        }
    } else {
        // HTTP call - require token param and loopback IP
        $token = $this->input->get('token');
        $expected_token = '46f332bac7c63c6dfe88e56dca96ad30792a11b861f2ce8dadb7b21733ed8139';
        $remote_ip = $this->input->ip_address();
        if ($token !== $expected_token || !in_array($remote_ip, ['127.0.0.1', '::1'])) {
            show_error('Forbidden', 403);
            return;
        }
    }
    */

    if ($queue_id <= 0 || $tenant_db === '') {
        log_message('error', 'process_whatsapp_single: invalid args. queue_id=' . $queue_id . ' tenant_db=' . $tenant_db);
        return;
    }

    // Load the helper that defines wn_send_whatsapp_text()
    $this->load->helper('wnotication'); // adjust helper name if different

    // Now create a tenant DB connection (do not overwrite $this->db permanently)
    // Build connection params — using global constants for host/creds; if tenant uses different creds, pass/store them when enqueuing.
    $tenant_params = [
        'dsn'       => '',
        'hostname'  => defined('APP_DB_HOSTNAME') ? APP_DB_HOSTNAME : 'localhost',
        'username'  => defined('APP_DB_USERNAME') ? APP_DB_USERNAME : 'dbuser',
        'password'  => defined('APP_DB_PASSWORD') ? APP_DB_PASSWORD : 'dbpass',
        'database'  => $tenant_db,
        'dbdriver'  => defined('APP_DB_DRIVER') ? APP_DB_DRIVER : 'mysqli',
        'dbprefix'  => $tenant_prefix,
        'pconnect'  => false,
        'db_debug'  => (ENVIRONMENT !== 'production'),
        'cache_on'  => false,
        'char_set'  => 'utf8',
        'dbcollat'  => 'utf8_general_ci',
    ];

    // Open tenant DB as a separate connection
    $tenantDB = $this->load->database($tenant_params, TRUE);
    if (!$tenantDB) {
        log_message('error', 'process_whatsapp_single: failed to connect tenant DB ' . $tenant_db);
        return;
    }

    // Compute tenant table name (with prefix applied)
    $table = $tenantDB->dbprefix('whatsapp_queue');

    // Fetch the queue row from tenant table
    $row = $tenantDB->get_where($table, ['id' => $queue_id])->row();

    if (!$row) {
        log_message('warning', "process_whatsapp_single: queue row not found id={$queue_id} in {$tenant_db}.{$table}");
        return;
    }

    if ($row->status !== 'pending') {
        log_message('info', "process_whatsapp_single: skipping non-pending id={$queue_id} status={$row->status}");
        return;
    }

    // mark as processing
    $tenantDB->where('id', $queue_id)->update($table, [
        'status' => 'processing',
        'updated_at' => date('Y-m-d H:i:s')
    ]);

    try {
        log_message('info', 'process_whatsapp_single: sending queue_id=' . $queue_id . ' phone=' . $row->phone . ' tenant=' . $tenant_db);

        // send whatsapp using helper
        $result = wn_send_whatsapp_text($row->phone, $row->message /*, $row->company_from */);

        if ($result) {
            $tenantDB->where('id', $queue_id)->update($table, [
                'status' => 'sent',
                'attempts' => $row->attempts + 1,
                'last_error' => null,
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            log_message('info', 'process_whatsapp_single: sent queue_id=' . $queue_id . ' tenant=' . $tenant_db);
        } else {
            $attempts = $row->attempts + 1;
            $new_status = ($attempts >= 3) ? 'failed' : 'pending';
            $tenantDB->where('id', $queue_id)->update($table, [
                'status' => $new_status,
                'attempts' => $attempts,
                'last_error' => 'Empty/false result from wn_send_whatsapp_text',
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            log_message('error', 'process_whatsapp_single: send failed queue_id=' . $queue_id . ' attempts=' . $attempts . ' tenant=' . $tenant_db);
        }
    } catch (Throwable $e) {
        $attempts = (isset($row->attempts) ? $row->attempts : 0) + 1;
        $new_status = ($attempts >= 3) ? 'failed' : 'pending';
        $tenantDB->where('id', $queue_id)->update($table, [
            'status' => $new_status,
            'attempts' => $attempts,
            'last_error' => $e->getMessage(),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        log_message('error', 'process_whatsapp_single exception queue_id=' . $queue_id . ' tenant=' . $tenant_db . ' error=' . $e->getMessage());
    }

    // Close tenant connection (optional)
    $tenantDB->close();
}
/*
  
    public function process_whatsapp_single($queue_id = 0, $tenant_db = '', $tenant_prefix = '')
{
    $this->load->helper('wnotication');
    log_message('debug', 'Connected database1: ' . $this->db->database);
log_message('debug', 'DB prefix1: ' . $this->db->dbprefix(''));
log_message('debug', 'WhatsApp table111 (full): ' . $this->db->dbprefix('tblwhatsapp_queue'));
    // Allow CLI always. For HTTP calls validate token + loopback IP.
    $is_cli = $this->input->is_cli_request();

    if (!$is_cli) {
        // Expect the same secret token used in Forms controller fallback
        $token = $this->input->get('token');
        $expected_token = '46f332bac7c63c6dfe88e56dca96ad30792a11b861f2ce8dadb7b21733ed8139'; // <-- REPLACE with your token

        $remote_ip = $this->input->ip_address();
        if ($token !== $expected_token || !in_array($remote_ip, ['127.0.0.1', '::1'])) {
            // Keep it generic
            show_error('Forbidden', 403);
            return;
        }
    }

    $queue_id = (int)$queue_id;
    if ($queue_id <= 0) {
        log_message('error', 'process_whatsapp_single called without valid id');
        return;
    }
    if (!isset($this->db) || empty($this->db)) {
    $this->load->database();
}
$table = $this->db->dbprefix('whatsapp_queue');
log_message('debug', 'process_whatsapp_single called '.$table);

    // Fetch the queue row
    $row = $this->db->get_where($table, ['id' => $queue_id])->row();

    if (!$row) {
        log_message('warning', 'process_whatsapp_single: queue row not found id=' . $queue_id);
        return;
    }

    if ($row->status !== 'pending') {
        log_message('info', 'process_whatsapp_single: skipping non-pending id=' . $queue_id . ' status=' . $row->status);
        return;
    }

    // mark as processing
    $this->db->where('id', $queue_id)->update($table, [
        'status' => 'processing',
        'updated_at' => date('Y-m-d H:i:s')
    ]);

    try {
        log_message('info', 'process_whatsapp_single: sending queue_id=' . $queue_id . ' phone=' . $row->phone);

        // Send the WhatsApp message via your helper. Adjust if your helper signature differs.
        $result = wn_send_whatsapp_text($row->phone, $row->message , $row->company_from );

        // Decide success/failure based on your helper's contract.
        if ($result) {
            $this->db->where('id', $queue_id)->update($table, [
                'status' => 'sent',
                'attempts' => $row->attempts + 1,
                'last_error' => null,
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            log_message('info', 'process_whatsapp_single: sent queue_id=' . $queue_id);
        } else {
            $attempts = $row->attempts + 1;
            $new_status = ($attempts >= 3) ? 'failed' : 'pending';
            $this->db->where('id', $queue_id)->update($table, [
                'status' => $new_status,
                'attempts' => $attempts,
                'last_error' => 'Empty/false result from wn_send_whatsapp_text',
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            log_message('error', 'process_whatsapp_single: send failed queue_id=' . $queue_id . ' attempts=' . $attempts);
        }
    } catch (Throwable $e) {
        // Exception — increment attempts and set last_error
        $attempts = $row->attempts + 1;
        $new_status = ($attempts >= 3) ? 'failed' : 'pending';
        $this->db->where('id', $queue_id)->update($table, [
            'status' => $new_status,
            'attempts' => $attempts,
            'last_error' => $e->getMessage(),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        log_message('error', 'process_whatsapp_single exception queue_id=' . $queue_id . ' error=' . $e->getMessage());
    }
}

*/



}
