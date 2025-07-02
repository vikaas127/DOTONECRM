<?php

defined('BASEPATH') or exit('No direct script access allowed');

include_once(APPPATH . 'libraries/pdf/NDA_pdf.php');

class Customer_registration_confirmed extends App_mail_template
{
    protected $for = 'customer';
    protected $contact;

    public $slug = 'client-registration-confirmed';
    public $rel_type = 'contact';

    public function __construct($contact)
    {
        parent::__construct();
        $this->contact = $contact;
    }

    public function build()
    {
        $this->to($this->contact->email)
             ->set_rel_id($this->contact->id)
             ->set_merge_fields('client_merge_fields', $this->contact->userid, $this->contact->id);

        // Build full name
        $full_name = isset($this->contact->firstname) ? trim($this->contact->firstname . ' ' . $this->contact->lastname) : 'New_Customer';

        // Generate NDA PDF
        $pdf = new NDA_pdf($this->contact);
        if (!$pdf->prepare()) {
            log_message('error', 'Customer_registration_confirmed::build - Failed to prepare NDA PDF for ' . $full_name);
            return;
        }

        $filename = 'NDA_' . str_replace(' ', '_', $full_name) . '_' . date('Y-m-d') . '.pdf';

        // Output the PDF as a string
        $nda_attachment = $pdf->Output($filename, 'S');

        // Attach the PDF
        $this->add_attachment([
            'attachment' => $nda_attachment,
            'filename'   => $filename,
            'type'       => 'application/pdf',
        ]);

        log_message('debug', 'Customer_registration_confirmed::build - NDA PDF attached: ' . $filename);
    }
}
