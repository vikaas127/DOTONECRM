<?php
include_once(APPPATH . 'libraries/App_items_table.php');

$pdf_logo_url = pdf_logo_url();
$formatted_proposal_id = 'PRO-' . str_pad($proposal->id, 6, '0', STR_PAD_LEFT);

// Organisation info
$org_info = format_organization_info();

// Proposal details
$leftContent  = '<span style="color:#999;">' . _l('proposal') . ':</span> <b>' . $formatted_proposal_id . '</b><br>';
$leftContent .= '<span style="color:#999;">' . _l('proposal_date') . ':</span> ' . _d($proposal->date) . '<br>';
if (!empty($proposal->open_till)) {
    $leftContent .= '<span style="color:#999;">' . _l('proposal_open_till') . ':</span> ' . _d($proposal->open_till);
}

$rightContent  = '<span style="color:#999;">City:</span> ' . $proposal->city . '<br>';
$rightContent .= '<span style="color:#999;">Address:</span> ' . $proposal->state;

// Client info
$client_details  = format_proposal_info($proposal, 'pdf');

// Build items table HTML using existing function
// $items = get_items_table_data($proposal, 'proposal', 'pdf');
$items = new App_items_table($proposal, 'proposal');
$items->set_heading_type('pdf'); // forces PDF headings
$items_html = $items->table();



$items_html .= '<table width="100%" cellspacing="0" cellpadding="4" style=" border-collapse:collapse; table-layout: fixed;">';

$items_html .= '
<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_subtotal') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->subtotal, $proposal->currency_name) . '</td>
</tr>';

if (is_sale_discount_applied($proposal)) {
    $items_html .= '
    <tr>
        <td align="right" width="85%"><strong>' . _l('estimate_discount');
    if (is_sale_discount($proposal, 'percent')) {
        $items_html .= ' (' . app_format_number($proposal->discount_percent, true) . '%)';
    }
    $items_html .= '</strong></td>';
    $items_html .= '<td align="right" width="15%">-' . app_format_money($proposal->discount_total, $proposal->currency_name) . '</td>
    </tr>';
}

foreach ($items->taxes() as $tax) {
    $items_html .= '<tr>
    <td align="right" width="85%"><strong>' . $tax['taxname'] . ' (' . app_format_number($tax['taxrate']) . '%)</strong></td>
    <td align="right" width="15%">' . app_format_money($tax['total_tax'], $proposal->currency_name) . '</td>
</tr>';
}

if ((int)$proposal->adjustment != 0) {
    $items_html .= '<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_adjustment') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->adjustment, $proposal->currency_name) . '</td>
</tr>';
}

$items_html .= '
<tr>
    <td align="right" width="85%"><strong>' . _l('estimate_total') . '</strong></td>
    <td align="right" width="15%">' . app_format_money($proposal->total, $proposal->currency_name) . '</td>
</tr>';

$items_html .= '</table>';

if (get_option('total_to_words_enabled') == 1) {
    $items_html .= '<br /><br /><br />';
    $items_html .= '<strong style="text-align:center;">' . _l('num_word') . ': ' . $CI->numberword->convert($proposal->total, $proposal->currency_name) . '</strong>';
}

// Now build one big HTML block
$html = '
<table border="1" cellpadding="5" cellspacing="0" width="100%">
  <tr>
    <td border="0" width="30%">' . $pdf_logo_url . '</td>
    <td border="0" width="40%">' . $org_info . '</td>
    <td border="0" width="30%" style="font-size:20px;">Proforma Proposal</td>
  </tr>
</table>


<br>

<table border="1" cellpadding="5" cellspacing="0" width="100%">
  <tr>
    <td width="50%">' . $leftContent . '</td>
    <td width="50%">' . $rightContent . '</td>
  </tr>
</table>



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




<div style="margin:0; padding:0;">' . $items_html . '</div>';

// write everything at once
$pdf->writeHTML($html, true, false, true, false, '');
?>
