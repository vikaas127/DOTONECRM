<?php
include_once(APPPATH . 'libraries/App_items_table.php');

defined('BASEPATH') or exit('No direct script access allowed');


$pdf_logo_url = pdf_logo_url();
$formatted_estimate_id = 'EST-' . str_pad($estimate->id, 6, '0', STR_PAD_LEFT);

// Organisation info
$org_info = format_organization_info();

// Estimate details
$leftContent  = '<span style="color:#999;">' . _l('estimate') . ':</span> <b>' . $formatted_estimate_id . '</b><br>';
$leftContent .= '<span style="color:#999;">' . _l('estimate_date') . ':</span> ' . _d($estimate->date) . '<br>';
if (!empty($estimate->expirydate)) {
    $leftContent .= '<span style="color:#999;">' . _l('estimate_data_expiry_date') . ':</span> ' . _d($estimate->expirydate);
}

$rightContent  = '<span style="color:#999;">City:</span> ' . $estimate->city . '<br>';
$rightContent .= '<span style="color:#999;">Address:</span> ' . $estimate->state;

// Client info
$client_details  = format_customer_info($estimate, 'estimate', 'billing');

// Build items table HTML using existing function
// $items = get_items_table_data($estimate, 'estimate', 'pdf')->set_headings('estimate');
// $items_html = $items->table();
$items = new App_items_table($estimate, 'estimate');
$items->set_heading_type('pdf'); // forces PDF headings
$items_html = $items->table();

$items_html .= '<br /><br /><table cellpadding="6" style="font-size:' . ($font_size + 4) . 'px">';

$items_html .= '<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_subtotal') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($estimate->subtotal, $estimate->currency_name) . '</td>
</tr>';

if (is_sale_discount_applied($estimate)) {
    $items_html .= '<tr>
        <td align="right" width="85%"><strong>' . _l('estimate_discount');
    if (is_sale_discount($estimate, 'percent')) {
        $items_html .= ' (' . app_format_number($estimate->discount_percent, true) . '%)';
    }
    $items_html .= '</strong></td>
        <td align="right" width="15%">-' . app_format_money($estimate->discount_total, $estimate->currency_name) . '</td>
    </tr>';
}

foreach ($items->taxes() as $tax) {
    $items_html .= '<tr>
        <td align="right" width="85%"><strong>' . $tax['taxname'] . ' (' . app_format_number($tax['taxrate']) . '%)</strong></td>
        <td align="right" width="15%">' . app_format_money($tax['total_tax'], $estimate->currency_name) . '</td>
    </tr>';
}

if ((int)$estimate->adjustment != 0) {
    $items_html .= '<tr>
        <td align="right" width="85%"><strong>' . _l('estimate_adjustment') . '</strong></td>
        <td align="right" width="15%">' . app_format_money($estimate->adjustment, $estimate->currency_name) . '</td>
    </tr>';
}

$items_html .= '<tr style="background-color:#f0f0f0;">
    <td align="right" width="85%"><strong>' . _l('estimate_total') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($estimate->total, $estimate->currency_name) . '</td>
</tr>';
$items_html .= '</table>';

if (get_option('total_to_words_enabled') == 1) {
    $items_html .= '<br /><br /><br />';
    $items_html .= '<strong style="text-align:center;">' . _l('num_word') . ': ' . $CI->numberword->convert($estimate->total, $estimate->currency_name) . '</strong>';
}

// --- Terms (Left) and Signature (Right) ---
$terms_html = '<b>' . _l('terms_and_conditions') . ':</b><br />';
$terms_html .= $estimate->terms;


$left_column_width  = '50%';
$right_column_width = '50%';

// --- Build full HTML block ---
$html = '
<table border="1" cellpadding="5" cellspacing="0" width="100%">
  <tr>
    <td border="0" width="30%">' . $pdf_logo_url . '</td>
    <td border="0" width="40%">' . $org_info . '</td>
    <td border="0" width="30%" style="font-size:20px;">Estimate</td>
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


<div style="width:100% !important;">' . $items_html . '</div>


<table border="1" cellpadding="5" cellspacing="0" width="100%">
  <tr>
    <td >' . $terms_html . '</td>
  </tr>
</table>
';

// Write all content at once
$pdf->writeHTML($html, true, false, true, false, '');
?>
