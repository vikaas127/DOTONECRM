<?php

defined('BASEPATH') or exit('No direct script access allowed');

$aColumns = [
    db_prefix() . 'mrp_bill_of_materials.id as id',            
    db_prefix() . 'mrp_bill_of_materials.product_id as product_id',
    db_prefix() . 'mrp_bill_of_materials.bom_code as bom_code',
    db_prefix() . 'mrp_bill_of_materials.bom_type as bom_type',
    db_prefix() . 'mrp_bill_of_materials.product_variant_id as product_variant_id',
    db_prefix() . 'mrp_bill_of_materials.product_qty as product_qty',
    db_prefix() . 'mrp_bill_of_materials.unit_id as unit_id',
    db_prefix() . 'mrp_bill_of_materials.routing_id as routing_id',
    db_prefix() . 'items.commodity_code as commodity_code',
];

$sIndexColumn = 'id';
$sTable = db_prefix() . 'mrp_bill_of_materials';

$where = [];
$join = [];
$join[] = 'LEFT JOIN ' . db_prefix() . 'items ON ' . db_prefix() . 'items.id = ' . db_prefix() . 'mrp_bill_of_materials.product_id';

// Filters
$products_filter = $this->ci->input->post('products_filter');
$bom_type_filter = $this->ci->input->post('bom_type_filter');
$routing_filter = $this->ci->input->post('routing_filter');
$commodity_code_filter = $this->ci->input->post('commodity_code_filter');


// Product filter
if (!empty($products_filter)) {
    $products = $this->ci->manufacturing_model->bom_get_product_filter($products_filter);
    $product_where = [];
    foreach ($products as $product) {
        if (isset($product['parent_id']) && $product['parent_id'] != 0) {
            $product_where[] = "(" . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['parent_id'] .
                               " AND " . db_prefix() . "mrp_bill_of_materials.product_variant_id = " . $product['id'] . ")";
            $product_where[] = "(" . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['parent_id'] .
                               " AND (" . db_prefix() . "mrp_bill_of_materials.product_variant_id = 0 OR " .
                               db_prefix() . "mrp_bill_of_materials.product_variant_id IS NULL))";
        } else {
            $product_where[] = "(" . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['id'] . ")";
        }
    }
    if (!empty($product_where)) {
        array_push($where, 'AND (' . implode(' OR ', $product_where) . ')');
    }
}

// BOM type filter
if (!empty($bom_type_filter)) {
    $bom_where = [];
    foreach ($bom_type_filter as $bom_type) {
        $bom_where[] = db_prefix() . 'mrp_bill_of_materials.bom_type = "' . $bom_type . '"';
    }
    if (!empty($bom_where)) {
        array_push($where, 'AND (' . implode(' OR ', $bom_where) . ')');
    }
}

// Commodity Code filter
if (!empty($commodity_code_filter)) {
    $commodity_where = [];
    foreach ($commodity_code_filter as $commodity_code) {
        $commodity_where[] = db_prefix() . 'items.commodity_code = "' . trim($commodity_code) . '"';
    }
    if (!empty($commodity_where)) {
        array_push($where, 'AND (' . implode(' OR ', $commodity_where) . ')');
    }
}

// Routing filter
if (!empty($routing_filter)) {
    $routing_where = [];
    foreach ($routing_filter as $routing_id) {
        $routing_where[] = db_prefix() . 'mrp_bill_of_materials.routing_id = "' . $routing_id . '"';
    }
    if (!empty($routing_where)) {
        array_push($where, 'AND (' . implode(' OR ', $routing_where) . ')');
    }
}


// DataTables init
$result = data_tables_init($aColumns, $sIndexColumn, $sTable, $join, $where, [db_prefix() . 'mrp_bill_of_materials.id']);

$output = $result['output'];
$rResult = $result['rResult'];

// Loop through results
foreach ($rResult as $aRow) {
    $row = [];
    $row[] = '<div class="checkbox"><input type="checkbox" value="' . $aRow['id'] . '"><label></label></div>';

    foreach ($aColumns as $col) {
        switch ($col) {
            case db_prefix() . 'mrp_bill_of_materials.id as id':
                $_data = $aRow['id'];
                break;

            case db_prefix() . 'mrp_bill_of_materials.product_id as product_id':
                $code = '<a href="' . admin_url('manufacturing/bill_of_material_detail_manage/' . $aRow['id']) . '">' 
                        . mrp_get_product_name($aRow['product_id']) . '</a>';
                $code .= '<div class="row-options">';
                $code .= '<a href="' . admin_url('manufacturing/view_bill_of_material_detail/' . $aRow['id']) . '" >' . _l('view') . '</a>';
                if ((has_permission('manufacturing', '', 'edit') && has_permission('bill_of_material', '', 'edit')) || is_admin()) {
                    $code .= ' | <a href="' . admin_url('manufacturing/bill_of_material_detail_manage/' . $aRow['id']) . '" >' . _l('edit') . '</a>';
                }
                if ((has_permission('manufacturing', '', 'delete') && has_permission('bill_of_material', '', 'delete')) || is_admin()) {
                    $code .= ' | <a href="' . admin_url('manufacturing/delete_bill_of_material/' . $aRow['id']) . '" class="text-danger _delete">' . _l('delete') . '</a>';
                }
                $code .= ' | <a href="#" onclick="copyBOM(' . $aRow['id'] . '); return false;">' . _l('copy_BOM') . '</a>';
                $code .= '</div>';
                $_data = $code;
                break;

            case db_prefix() . 'mrp_bill_of_materials.bom_code as bom_code':
                $_data = $aRow['bom_code'];
                break;

            case db_prefix() . 'mrp_bill_of_materials.bom_type as bom_type':
                $_data = _l($aRow['bom_type']);
                break;

            case db_prefix() . 'mrp_bill_of_materials.product_variant_id as product_variant_id':
                $_data = mrp_get_product_name($aRow['product_variant_id']);
                break;

            case db_prefix() . 'mrp_bill_of_materials.product_qty as product_qty':
                $_data = app_format_money($aRow['product_qty'], '');
                break;

            case db_prefix() . 'mrp_bill_of_materials.unit_id as unit_id':
                $_data = mrp_get_unit_name($aRow['unit_id']);
                break;

            case db_prefix() . 'mrp_bill_of_materials.routing_id as routing_id':
                $_data = mrp_get_routing_name($aRow['routing_id']);
                break;

            case db_prefix() . 'items.commodity_code as commodity_code':
                $_data = $aRow['commodity_code'];
                break;

            default:
                $_data = '';
                break;
        }

        $row[] = $_data;
    }

    $output['aaData'][] = $row;
}
