<?php

defined('BASEPATH') or exit('No direct script access allowed');

include_once(APPPATH . 'libraries/pdf/App_pdf.php');

class NDA_pdf extends App_pdf
{
    protected $instance;
    private $nda_file_name;

    public function __construct($instance)
    {
        if (!$instance) {
            log_message('error', 'NDA_pdf::__construct - Instance object is missing.');
            return false;
        }

        $this->instance = $instance;

        $instance_name = isset($instance->name) ? trim($instance->name) : 'New_Instance';
        $this->nda_file_name = 'NDA_' . str_replace(' ', '_', $instance_name) . '_' . date('Y-m-d') . '.pdf';

        log_message('debug', 'NDA_pdf::__construct - NDA file name set to: ' . $this->nda_file_name);

        parent::__construct();
        $this->SetTitle('Non-Disclosure Agreement');
        log_message('debug', 'NDA_pdf::__construct - Initialized for instance: ' . $instance_name);
    }

    public function prepare()
    {
        log_message('debug', 'NDA_pdf::prepare - Starting PDF preparation.');

        if (!$this->instance) {
            log_message('error', 'NDA_pdf::prepare - Instance data is missing.');
            return false;
        }

        $CI =& get_instance();
        $CI->load->library('merge_fields/client_merge_fields');

        $client_id  = $this->instance->client_id ?? null;
        $contact_id = $this->instance->contact_id ?? null;

        if (!$client_id) {
            log_message('error', 'NDA_pdf::prepare - Missing client ID in instance.');
            return false;
        }

        $mergeFields = (new Client_merge_fields())->format($client_id, $contact_id);

        // Extract with fallback
        $first_name = $mergeFields['{contact_firstname}'] ?? '';
        $last_name  = $mergeFields['{contact_lastname}'] ?? '';
        $full_name  = trim($first_name . ' ' . $last_name);
        $email      = $mergeFields['{contact_email}'] ?? 'N/A';
        $phone      = $mergeFields['{contact_phonenumber}'] ?? 'N/A';
        $company    = $mergeFields['{client_company}'] ?? 'N/A';
        $vat        = $mergeFields['{client_vat_number}'] ?? 'N/A';

        $slug   = $this->instance->slug ?? 'N/A';
        $status = $this->instance->status ?? 'N/A';
        $domain = $this->instance->custom_domain ?? 'N/A';

        $view_vars = [
            'client_name'        => !empty($full_name) ? $full_name : $company,
            'email'              => $email,
            'phone'              => $phone,
            'company'            => $company,
            'gst'                => $vat,
            'slug'               => $slug,
            'status'             => $status,
            'custom_domain'      => $domain,
            'instance_url'       => perfex_saas_tenant_base_url($this->instance),
            'instance_admin_url' => perfex_saas_tenant_admin_url($this->instance),
            'date'               => date('Y-m-d'),
        ];

        log_message('debug', 'NDA_pdf::prepare - View variables set: ' . json_encode($view_vars));

        $this->set_view_vars($view_vars);

        $result = $this->build();
        log_message('debug', 'NDA_pdf::prepare - PDF build result: ' . ($result ? 'Success' : 'Failure'));

        return $result;
    }

    protected function type()
    {
        return 'nda';
    }

    protected function file_path()
    {
        $filePath = module_views_path('perfex_saas', 'nda_template.php');

        log_message('debug', 'NDA_pdf::file_path - Expected template path: ' . $filePath);

        if (!file_exists($filePath)) {
            log_message('error', 'NDA_pdf::file_path - Template file missing at ' . $filePath);
        } elseif (!is_readable($filePath)) {
            log_message('error', 'NDA_pdf::file_path - Template file exists but is not readable: ' . $filePath);
        } else {
            log_message('debug', 'NDA_pdf::file_path - Template file confirmed and readable.');
        }

        return $filePath;
    }
}
