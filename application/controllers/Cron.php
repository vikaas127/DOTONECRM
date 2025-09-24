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
    public function process_whatsapp_single($queue_id = 0)
{
    $this->load->helper('wnotication');

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

    // Fetch the queue row
    $row = $this->db->get_where('tblwhatsapp_queue', ['id' => $queue_id])->row();

    if (!$row) {
        log_message('warning', 'process_whatsapp_single: queue row not found id=' . $queue_id);
        return;
    }

    if ($row->status !== 'pending') {
        log_message('info', 'process_whatsapp_single: skipping non-pending id=' . $queue_id . ' status=' . $row->status);
        return;
    }

    // mark as processing
    $this->db->where('id', $queue_id)->update('tblwhatsapp_queue', [
        'status' => 'processing',
        'updated_at' => date('Y-m-d H:i:s')
    ]);

    try {
        log_message('info', 'process_whatsapp_single: sending queue_id=' . $queue_id . ' phone=' . $row->phone);

        // Send the WhatsApp message via your helper. Adjust if your helper signature differs.
        $result = wn_send_whatsapp_text($row->phone, $row->message /*, $row->company_from */);

        // Decide success/failure based on your helper's contract.
        if ($result) {
            $this->db->where('id', $queue_id)->update('tblwhatsapp_queue', [
                'status' => 'sent',
                'attempts' => $row->attempts + 1,
                'last_error' => null,
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
            log_message('info', 'process_whatsapp_single: sent queue_id=' . $queue_id);
        } else {
            $attempts = $row->attempts + 1;
            $new_status = ($attempts >= 3) ? 'failed' : 'pending';
            $this->db->where('id', $queue_id)->update('tblwhatsapp_queue', [
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
        $this->db->where('id', $queue_id)->update('tblwhatsapp_queue', [
            'status' => $new_status,
            'attempts' => $attempts,
            'last_error' => $e->getMessage(),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);
        log_message('error', 'process_whatsapp_single exception queue_id=' . $queue_id . ' error=' . $e->getMessage());
    }
}





}
