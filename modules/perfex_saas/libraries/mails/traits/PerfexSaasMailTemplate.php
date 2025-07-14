<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once(FCPATH . 'modules/perfex_saas/libraries/pdf/NDA_pdf.php');

/**
 * Email template class for all mail sent through the saas.
 * The class is inherited by all saas email templates.
 */
trait PerfexSaasMailTemplate
{

    /**
     * Tenant email address
     *
     * @var string
     */
    protected $contact_email;

    /**
     * The ID of the client/tenant.
     *
     * @var mixed
     */
    protected $client_id;

    /**
     * The ID of the client/tenant contact.
     *
     * @var mixed
     */
    protected $contact_id;

    /**
     * Instance
     *
     * @var mixed
     */
    protected $instance_data;
    protected $other_extra_data;


    /**
     * The constructor.
     * This is called when perfex is creating instance of this template
     *
     * @param string $contact_email
     * @param int $client_id
     * @param int $contact_id
     * @param mixed $instance_data
     */
    public function __construct($contact_email, $client_id, $contact_id, $instance_data, $other_extra_data = [])
    {
        parent::__construct();

        $this->contact_email = $contact_email;
        $this->contact_id    = $contact_id;
        $this->client_id     = $client_id;
        $this->instance_data = $instance_data;
        $this->other_extra_data = $other_extra_data;
    }

    /**
     * Build the email message.
     */
 public function build()
{
    // Load required libraries
    $this->ci->load->library('merge_fields/client_merge_fields');
    $this->ci->load->library(PERFEX_SAAS_MODULE_NAME . '/merge_fields/perfex_saas_company_merge_fields');

    // Set email recipients and merge fields
    $this->to($this->contact_email)
        ->set_rel_id($this->contact_id)
        ->set_merge_fields('client_merge_fields', $this->client_id, $this->contact_id)
        ->set_merge_fields('perfex_saas_company_merge_fields', $this->instance_data, $this->other_extra_data);

    // ✅ Get merge fields for logging or NDA full name
    $mergeFields = (new Client_merge_fields())->format($this->client_id, $this->contact_id);

    $first_name = $mergeFields['{contact_firstname}'] ?? '';
    $last_name  = $mergeFields['{contact_lastname}'] ?? '';
    $full_name  = trim($first_name . ' ' . $last_name);
    if (empty($full_name)) {
        $full_name = $mergeFields['{client_company}'] ?? 'New_Customer';
    }

    log_message('debug', 'PerfexSaasMailTemplate::build - Generating NDA for ' . $full_name);

    try {
        // ✅ Pass instance_data (must include client_id/contact_id for NDA_pdf to work)
        $pdf = new NDA_pdf($this->instance_data);
    } catch (Exception $e) {
        log_message('error', 'PerfexSaasMailTemplate::build - NDA_pdf instantiation failed: ' . $e->getMessage());
        return;
    }

    if (!$pdf->prepare()) {
        log_message('error', 'PerfexSaasMailTemplate::build - Failed to prepare NDA PDF for ' . $full_name);
        return;
    }

    $filename = 'NDA_' . str_replace(' ', '_', $full_name) . '_' . date('Y-m-d') . '.pdf';
    $nda_attachment = $pdf->Output($filename, 'S');

    // Attach the NDA to the outgoing email
    $this->add_attachment([
        'attachment' => $nda_attachment,
        'filename'   => $filename,
        'type'       => 'application/pdf',
    ]);

    log_message('debug', 'PerfexSaasMailTemplate::build - NDA PDF successfully attached: ' . $filename);
}


    }

