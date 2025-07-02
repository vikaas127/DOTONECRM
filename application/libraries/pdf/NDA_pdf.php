<?php

defined('BASEPATH') or exit('No direct script access allowed');

include_once(__DIR__ . '/App_pdf.php');

class NDA_pdf extends App_pdf
{
    protected $client;
    private $nda_file_name;

    public function __construct($client)
    {
        if (!$client) {
            log_message('error', 'NDA_pdf::__construct - Client object is missing.');
            return false;
        }

        $this->client = $client;

        $client_name = isset($this->client->firstname) ? trim($this->client->firstname . ' ' . $this->client->lastname) : 'New Customer';
        $this->nda_file_name = 'NDA_' . str_replace(' ', '_', $client_name) . '_' . date('Y-m-d') . '.pdf';

        log_message('debug', 'NDA_pdf::__construct - NDA file name set to: ' . $this->nda_file_name);

        parent::__construct();

        $this->SetTitle('Non-Disclosure Agreement');
        log_message('debug', 'NDA_pdf::__construct - Initialized for client: ' . $client_name);
    }

    public function prepare()
    {
        log_message('debug', 'NDA_pdf::prepare - Starting PDF preparation.');

        if (!$this->client) {
            log_message('error', 'NDA_pdf::prepare - Client data is missing.');
            return false;
        }

        $company = !empty($this->client->company) ? $this->client->company : 'N/A';
        $gst = !empty($this->client->vat) ? $this->client->vat : 'N/A';
        $phone = !empty($this->client->contact_phonenumber) ? $this->client->contact_phonenumber : 'N/A';


        $email = !empty($this->client->email) ? $this->client->email : 'N/A';
        $client_name = isset($this->client->firstname) ? trim($this->client->firstname . ' ' . $this->client->lastname) : 'New Customer';

        log_message('debug', "NDA_pdf::prepare - Client: $client_name, Company: $company, Email: $email,GST: $gst");

        $view_vars = [
            'client_name' => $client_name,
            'email'       => $email,
            'company'     => $company,
            'gst'         => $gst,
            'phone'           =>$phone,
            'date'        => date('Y-m-d'),
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
        $theme = active_clients_theme();
        $filePath = APPPATH . 'views/themes/' . $theme . '/views/nda_template.php';

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
