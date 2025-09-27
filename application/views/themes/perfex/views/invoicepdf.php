<?php

defined('BASEPATH') or exit('No direct script access allowed');
include_once(APPPATH . 'libraries/App_items_table.php');

$pdf_logo_url = pdf_logo_url();
$formatted_invoice_id = 'INV-' . str_pad($invoice->id, 6, '0', STR_PAD_LEFT);

// Organisation info
$org_info = format_organization_info();

// Invoice details
$leftContent = '<span style="color:#999;">' . _l('invoice') . ':</span> <b>' . $formatted_invoice_id . '</b><br />';
$leftContent .= '<span style="color:#999;">' . _l('invoice_date') . ':</span> ' . _d($invoice->date) . '<br />';
if (!empty($invoice->duedate)) {
    $leftContent .= '<span style="color:#999;">' . _l('invoice_data_duedate') . ':</span> ' . _d($invoice->duedate);
}

$rightContent = '';
if ($status != Invoices_model::STATUS_PAID && $status != Invoices_model::STATUS_CANCELLED) {
    $rightContent .= '<span style="color:#84c529;text-decoration:none;text-transform:uppercase;"><b>' . format_invoice_status($status, '', false) . '</b></span><br>';
}

$rightContent .= '<span style="color:#999;">City:</span> ' . $invoice->city . '<br>';
$rightContent .= '<span style="color:#999;">Address:</span> ' . $invoice->state;

// Client info
$client_details = format_customer_info($invoice, 'invoice', 'billing');

// Build items table
$items = new App_items_table($invoice, 'invoice');
$items->set_heading_type('pdf'); // forces PDF headings
$items_html = $items->table();

// Totals
$items_html .= '<br /><br /><table cellpadding="6" style="font-size:' . ($font_size + 4) . 'px">';

$items_html .= '<tr>
    <td align="right" width="85%"><strong>' . _l('invoice_subtotal') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($invoice->subtotal, $invoice->currency_name) . '</td>
</tr>';

if (is_sale_discount_applied($invoice)) {
    $items_html .= '<tr>
        <td align="right" width="85%"><strong>' . _l('invoice_discount');
    if (is_sale_discount($invoice, 'percent')) {
        $items_html .= ' (' . app_format_number($invoice->discount_percent, true) . '%)';
    }
    $items_html .= '</strong></td>
        <td align="right" width="15%">-' . app_format_money($invoice->discount_total, $invoice->currency_name) . '</td>
    </tr>';
}

foreach ($items->taxes() as $tax) {
    $items_html .= '<tr>
        <td align="right" width="85%"><strong>' . $tax['taxname'] . ' (' . app_format_number($tax['taxrate']) . '%)</strong></td>
        <td align="right" width="15%">' . app_format_money($tax['total_tax'], $invoice->currency_name) . '</td>
    </tr>';
}

if ((int)$invoice->adjustment != 0) {
    $items_html .= '<tr>
        <td align="right" width="85%"><strong>' . _l('invoice_adjustment') . '</strong></td>
        <td align="right" width="15%">' . app_format_money($invoice->adjustment, $invoice->currency_name) . '</td>
    </tr>';
}

$items_html .= '<tr style="background-color:#f0f0f0;">
    <td align="right" width="85%"><strong>' . _l('invoice_total') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($invoice->total, $invoice->currency_name) . '</td>
</tr>';
$items_html .= '</table>';

// Terms
$terms_html = '<b>' . _l('terms_and_conditions') . ':</b><br />' . $invoice->terms;

// Build full HTML UI similar to estimate
$html = '
<table border="1" cellpadding="5" cellspacing="0" width="100%">
    <tr>
        <td border="0" width="30%">' . $pdf_logo_url . '</td>
        <td border="0" width="40%">' . $org_info . '</td>
        <td border="0" width="30%" style="font-size:20px;">Invoice</td>
    </tr>
</table>

<br>

<table border="1" cellpadding="5" cellspacing="0" width="100%">
    <tr>
        <td width="50%">' . $leftContent . '</td>
        <td width="50%">' . $rightContent . '</td>
    </tr>
</table>

<br>

<table border="1" cellpadding="5" cellspacing="0" width="100%">
    <tr style="background-color:#eee;">
        <th width="50%">' . _l('bill_to') . '</th>
        <th width="50%">' . _l('ship_to') . '</th>
    </tr>
    <tr>
        <td>' . $client_details . '</td>
        <td>&nbsp;</td>
    </tr>
</table>


' . $items_html . '


<table border="1" cellpadding="5" cellspacing="0" width="100%">
    <tr>
        <td>' . $terms_html . '</td>
    </tr>
</table>
';

// Write all content at once
$pdf->writeHTML($html, true, false, true, false, '');

?>
