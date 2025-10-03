<?php

defined('BASEPATH') or exit('No direct script access allowed');

include_once(APPPATH . 'libraries/App_items_table_template.php');

class App_items_table extends App_items_table_template
{
    public function __construct($transaction, $type, $for = 'html', $admin_preview = false)
    {
        // Required
        $this->type          = strtolower($type);
        $this->admin_preview = $admin_preview;
        $this->for           = $for;

        $this->set_transaction($transaction);
        $this->set_items($transaction->items);

        parent::__construct();
    }

    /**
     * Builds the actual table items rows preview
     * @return string
     */
    // public function items()
    // {
    //     $html = '';


    //     $descriptionItemWidth = $this->get_description_item_width();

    //     $regularItemWidth  = $this->get_regular_items_width(4);
    //     $customFieldsItems = $this->get_custom_fields_for_table();

    //     if ($this->for == 'html') {
    //         $descriptionItemWidth = $descriptionItemWidth - 5;
    //         $regularItemWidth     = $regularItemWidth - 5;
    //     }

    //     $i = 1;
    //     foreach ($this->items as $item) {
    //         $itemHTML = '';

    //         // Open table row
    //         $itemHTML .= '<tr' . $this->tr_attributes($item) . '>';

    //         // Table data number
    //         $itemHTML .= '<td' . $this->td_attributes() . ' align="center" width="5%">' . $i . '</td>';

    //         $itemHTML .= '<td class="description" align="left;" width="' . $descriptionItemWidth . '%">';

    //         /**
    //          * Item description
    //          */
    //         if (!empty($item['description'])) {
    //             $itemHTML .= '<span style="font-size:' . $this->get_pdf_font_size() . 'px;"><strong>'
    //             . $this->period_merge_field($item['description'])
    //             . '</strong></span>';

    //             if (!empty($item['long_description'])) {
    //                 $itemHTML .= '<br />';
    //             }
    //         }

    //         /**
    //          * Item long description
    //          */
    //         if (!empty($item['long_description'])) {
    //             $itemHTML .= '<span style="color:#424242;">' . $this->period_merge_field($item['long_description']) . '</span>';
    //         }

    //         $itemHTML .= '</td>';

    //         /**
    //          * Item custom fields
    //          */
    //         foreach ($customFieldsItems as $custom_field) {
    //             $itemHTML .= '<td align="left" width="' . $regularItemWidth . '%">' . get_custom_field_value($item['id'], $custom_field['id'], 'items') . '</td>';
    //         }

    //         /**
    //          * Item quantity
    //          */
    //         $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%">' . floatVal($item['qty']);

    //         /**
    //          * Maybe item has added unit?
    //          */
    //         if ($item['unit']) {
    //             $itemHTML .= ' ' . $item['unit'];
    //         }

    //         $itemHTML .= '</td>';

    //         /**
    //          * Item rate
    //          * @var string
    //          */
    //         $rate = hooks()->apply_filters(
    //             'item_preview_rate',
    //             app_format_money($item['rate'], $this->transaction->currency_name, $this->exclude_currency()),
    //             ['item' => $item, 'transaction' => $this->transaction]
    //         );

    //         $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%">' . $rate . '</td>';

    //         /**
    //          * Items table taxes HTML custom function because it's too general for all features/options
    //          * @var string
    //          */
    //         $itemHTML .= $this->taxes_html($item, $regularItemWidth);

    //         /**
    //          * Possible action hook user to include tax in item total amount calculated with the quantiy
    //          * eq Rate * QTY + TAXES APPLIED
    //          */
    //         $item_amount_with_quantity = hooks()->apply_filters(
    //             'item_preview_amount_with_currency',
    //             app_format_money(($item['qty'] * $item['rate']), $this->transaction->currency_name, $this->exclude_currency()),
    //             $item,
    //             $this->transaction,
    //             $this->exclude_currency()
    //         );

    //         $itemHTML .= '<td class="amount" align="right" width="' . $regularItemWidth . '%">' . $item_amount_with_quantity . '</td>';

    //         // Close table row
    //         $itemHTML .= '</tr>';

    //         $html .= $itemHTML;

    //         $i++;
    //     }

    //     return $html;
    // }
    public function items()
{
    $html = '';

    $descriptionItemWidth = $this->get_description_item_width();
    $regularItemWidth     = $this->get_regular_items_width(0);
    $customFieldsItems    = $this->get_custom_fields_for_table();

    $i = 1;
    foreach ($this->items as $item) {
        $itemHTML = '<tr>';

        // Number
        $itemHTML .= '<td align="center" width="5%" style="border:1px solid #000;">' . $i . '</td>';

        // Description
        $itemHTML .= '<td align="left" width="' . $descriptionItemWidth . '%" style="border:1px solid #000;">';
        if (!empty($item['description'])) {
            $itemHTML .= '<strong style="font-size:' . $this->get_pdf_font_size() . 'px;">' . $this->period_merge_field($item['description']) . '</strong>';
            if (!empty($item['long_description'])) {
                $itemHTML .= '<br />';
            }
        }
        if (!empty($item['long_description'])) {
            $itemHTML .= '<span style="color:#424242;">' . $this->period_merge_field($item['long_description']) . '</span>';
        }
        $itemHTML .= '</td>';

        // Custom fields
        foreach ($customFieldsItems as $cf) {
            $itemHTML .= '<td align="left" width="' . $regularItemWidth . '%" style="border:1px solid #000;">' . get_custom_field_value($item['id'], $cf['id'], 'items') . '</td>';
        }

        // Quantity & Rate
        $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">' . floatval($item['qty']);
        if ($item['unit']) {
            $itemHTML .= ' ' . $item['unit'];
        }
        $itemHTML .= '</td>';

        $rate = hooks()->apply_filters(
            'item_preview_rate',
            app_format_money($item['rate'], $this->transaction->currency_name, $this->exclude_currency()),
            ['item' => $item, 'transaction' => $this->transaction]
        );
        $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">' . $rate . '</td>';

        // Taxes
        foreach ($this->get_unique_tax_names() as $taxName) {
            $found = false;
            if (isset($item['taxes']) && is_array($item['taxes'])) {
                foreach ($item['taxes'] as $tax) {
                    if ($tax['taxname'] === $taxName) {
                        $found = true;
                        $rate = $tax['taxrate'];
                        $amt  = ($item['qty'] * $item['rate']) * ($rate / 100);
                        $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">' . app_format_number($rate) . '%</td>';
                        $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">' . app_format_money($amt, $this->transaction->currency_name, $this->exclude_currency()) . '</td>';
                    }
                }
            }
            if (!$found) {
                $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">-</td>';
                $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">-</td>';
            }
        }

        // Total amount
        $amount = hooks()->apply_filters(
            'item_preview_amount_with_currency',
            app_format_money(($item['qty'] * $item['rate']), $this->transaction->currency_name, $this->exclude_currency()),
            $item,
            $this->transaction,
            $this->exclude_currency()
        );
        $itemHTML .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">' . $amount . '</td>';

        $itemHTML .= '</tr>';
        $html .= $itemHTML;
        $i++;
    }

    return $html;
}


    /**
     * Html headings preview
     * @return string
     */
public function html_headings()
{
    $html = '<tr>';
    $html .= '<th align="center">' . $this->number_heading() . '</th>';
    $html .= '<th class="description" width="' . $this->get_description_item_width() . '%" align="left">' . $this->item_heading() . '</th>';

    $customFieldsItems = $this->get_custom_fields_for_table();
    foreach ($customFieldsItems as $cf) {
        $html .= '<th class="custom_field" align="left">' . $cf['name'] . '</th>';
    }

    $html .= '<th align="right">' . $this->qty_heading() . '</th>';
    $html .= '<th align="right">' . $this->rate_heading() . '</th>';

    // ✅ Dynamic tax headings
    $uniqueTaxes = $this->get_unique_tax_names();
    foreach ($uniqueTaxes as $tax) {
        // Split tax name if it contains a pipe (e.g., "CGST|9.00")
        $taxName = explode('|', $tax)[0];
        $html .= '<th colspan="2" align="center">' . $taxName . '</th>';
    }

    $html .= '<th align="right">' . $this->amount_heading() . '</th>';
    $html .= '</tr>';

    // ✅ Sub-headings row
    if (count($uniqueTaxes) > 0) {
        $html .= '<tr>';
        $html .= '<th></th><th></th>'; // skip for number + description
        foreach ($customFieldsItems as $cf) {
            $html .= '<th></th>'; // empty for custom fields
        }
        $html .= '<th></th><th></th>'; // skip for qty & rate
        foreach ($uniqueTaxes as $tax) {
            $html .= '<th align="right">Rate %</th>';
            $html .= '<th align="right">Amt</th>';
        }
        $html .= '<th></th>'; // amount col
        $html .= '</tr>';
    }

    return $html;
}



    /**
     * PDF headings preview
     * @return string
     */
public function pdf_headings()
{
    $descriptionItemWidth = $this->get_description_item_width();
    $regularItemWidth     = $this->get_regular_items_width(0); // No extra adjustment
    $customFieldsItems    = $this->get_custom_fields_for_table();
    $uniqueTaxes          = $this->get_unique_tax_names();

    // Outer heading row with background
    $tblhtml = '<tr height="30" style="color:#000; background-color:#eee;">';

    // Number & Description
    $tblhtml .= '<th width="5%" align="center" style="border:1px solid #000;">' . $this->number_heading() . '</th>';
    $tblhtml .= '<th width="' . $descriptionItemWidth . '%" align="left" style="border:1px solid #000;">' . $this->item_heading() . '</th>';

    // Custom fields
    foreach ($customFieldsItems as $cf) {
        $tblhtml .= '<th width="' . $regularItemWidth . '%" align="left" style="border:1px solid #000;">' . $cf['name'] . '</th>';
    }

    // Quantity & Rate
    $tblhtml .= '<th width="' . $regularItemWidth . '%" align="right" style="border:1px solid #000;">' . $this->qty_heading() . '</th>';
    $tblhtml .= '<th width="' . $regularItemWidth . '%" align="right" style="border:1px solid #000;">' . $this->rate_heading() . '</th>';

    // Tax headings with colspan 2
    foreach ($uniqueTaxes as $tax) {
        $taxName = explode('|', $tax)[0]; // only tax name
        $tblhtml .= '<th colspan="2" align="center" style="border:1px solid #000; border-bottom:none;">' . $taxName . '</th>';
    }

    // Total amount
    $tblhtml .= '<th width="' . $regularItemWidth . '%" align="right" style="border:1px solid #000;z">' . $this->amount_heading() . '</th>';
    $tblhtml .= '</tr>';

    // Subheading row for tax columns (% and Amount)
    if (count($uniqueTaxes) > 0) {
        $tblhtml .= '<tr style="background-color:#eee;">';
        $tblhtml .= '<th style="border:1px solid #000;"></th>'; // number
        $tblhtml .= '<th style="border:1px solid #000;"></th>'; // description
        foreach ($customFieldsItems as $cf) {
            $tblhtml .= '<th style="border:1px solid #000;"></th>'; // custom fields
        }
        $tblhtml .= '<th style="border:1px solid #000;"></th>'; // qty
        $tblhtml .= '<th style="border:1px solid #000;"></th>'; // rate

        // Only tax sub-columns (%) and Amount have top border removed
        foreach ($uniqueTaxes as $tax) {
            $tblhtml .= '<th align="right" style="border:1px solid #000; border-top:none;">%</th>';
            $tblhtml .= '<th align="right" style="border:1px solid #000; border-top:none;">Amt</th>';
        }

        $tblhtml .= '<th style="border:1px solid #000;"></th>'; // total amount
        $tblhtml .= '</tr>';
    }

    return $tblhtml;
}



    /**
     * Check for period merge field for recurring invoices
     *
     * @return string
     */
    protected function period_merge_field($text)
    {
        if ($this->type != 'invoice') {
            return $text;
        }

        // Is subscription invoice
        if (!property_exists($this->transaction, 'recurring_type')) {
            return $text;
        }

        $startDate       = $this->transaction->date;
        $originalInvoice = $this->transaction->is_recurring_from ?
            $this->ci->invoices_model->get($this->transaction->is_recurring_from) :
            $this->transaction;

        if (!preg_match('/^(\d{4})-(\d{1,2})-(\d{1,2})$/', $startDate)) {
            $startDate = to_sql_date($startDate);
        }

        if ($originalInvoice->custom_recurring == 0) {
            $originalInvoice->recurring_type = 'month';
        }

        $nextDate = date('Y-m-d', strtotime(
            '+' . $originalInvoice->recurring . ' ' . strtoupper($originalInvoice->recurring_type),
            strtotime($startDate)
        ));

        return str_ireplace('{period}', _d($startDate) . ' - ' . _d(date('Y-m-d', strtotime('-1 day', strtotime($nextDate)))), $text);
    }

    protected function get_description_item_width()
    {
        $item_width = hooks()->apply_filters('item_description_td_width', 25);

        // If show item taxes is disabled in PDF we should increase the item width table heading
        return $this->show_tax_per_item() == 0 ? $item_width + 15 : $item_width;
    }

    // protected function get_regular_items_width($adjustment)
    // {
    //     $descriptionItemWidth = $this->get_description_item_width();
    //     $customFieldsItems    = $this->get_custom_fields_for_table();
    //     // Calculate headings width, in case there are custom fields for items
    //     $totalheadings = $this->show_tax_per_item() == 1 ? 4 : 3;
    //     $totalheadings += count($customFieldsItems);

    //     return (100 - ($descriptionItemWidth + $adjustment)) / $totalheadings;
    // }
protected function get_regular_items_width($adjustment)
{
    $descriptionItemWidth = $this->get_description_item_width();
    $customFieldsItems    = $this->get_custom_fields_for_table();

    // Always include: qty, rate, amount
    $totalRegularColumns = 3;

    // Add 2 columns for each tax if taxes are applied
    if ($this->show_tax_per_item() == 1) {
        $totalRegularColumns += count($this->get_unique_tax_names()) * 2; // % + Amt for each tax
    }

    // Add custom fields
    $totalRegularColumns += count($customFieldsItems);

    // Calculate width per regular column
    return (100 - ($descriptionItemWidth + $adjustment)) / $totalRegularColumns;
}


protected function taxes_html($item, $regularItemWidth)
{
    $html = '';

    foreach ($this->get_unique_tax_names() as $taxName) {
        $found = false;

        if (isset($item['taxes']) && is_array($item['taxes'])) {
            foreach ($item['taxes'] as $tax) {
                if ($tax['taxname'] === $taxName) {
                    $found = true;
                    $rate  = $tax['taxrate'];
                    $amt   = ($item['qty'] * $item['rate']) * ($rate / 100);

                    // Two separate columns
                    $html .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">' . app_format_number($rate) . '%</td>';
                    $html .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">' . app_format_money($amt, $this->transaction->currency_name, $this->exclude_currency()) . '</td>';
                }
            }
        }

        if (!$found) {
            $html .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">-</td>';
            $html .= '<td align="right" width="' . $regularItemWidth . '%" style="border:1px solid #000;">-</td>';
        }
    }

    return $html;
}



protected function get_unique_tax_names()
{
    $unique = [];

    foreach ($this->items as $item) {
        if (isset($item['taxes']) && is_array($item['taxes'])) {
            foreach ($item['taxes'] as $tax) {
                $unique[] = $tax['taxname']; // e.g. "CGST|9.00"
            }
        }
    }

    // keep only unique names
    return array_values(array_unique($unique));
}


public function set_heading_type($type)
{
    $this->for = $type; // 'pdf' or 'html'
    return $this;
}



}