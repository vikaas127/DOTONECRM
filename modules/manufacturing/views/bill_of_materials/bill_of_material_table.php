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

// Product filter
if (isset($products_filter)) {
    $products = $this->ci->manufacturing_model->bom_get_product_filter($products_filter);
    $where_products_filter = '';

    foreach ($products as $product) {
        if ($where_products_filter == '') {
            if (isset($product['parent_id']) && $product['parent_id'] != 0) {
                $where_products_filter .= "AND ( ( (" . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['parent_id'] . " AND " . db_prefix() . "mrp_bill_of_materials.product_variant_id = " . $product['id'] . ") OR (" . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['parent_id'] . " AND (" . db_prefix() . "mrp_bill_of_materials.product_variant_id = 0 OR " . db_prefix() . "mrp_bill_of_materials.product_variant_id IS NULL)) )";
            } else {
                $where_products_filter .= "AND (" . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['id'];
            }
        } else {
            if (isset($product['parent_id']) && $product['parent_id'] != 0) {
                $where_products_filter .= " OR ( (" . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['parent_id'] . " AND " . db_prefix() . "mrp_bill_of_materials.product_variant_id = " . $product['id'] . ") OR (" . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['parent_id'] . " AND (" . db_prefix() . "mrp_bill_of_materials.product_variant_id = 0 OR " . db_prefix() . "mrp_bill_of_materials.product_variant_id IS NULL)) )";
            } else {
                $where_products_filter .= " OR " . db_prefix() . "mrp_bill_of_materials.product_id = " . $product['id'];
            }
        }
    }

    if ($where_products_filter != '') {
        $where_products_filter .= ')';
        array_push($where, $where_products_filter);
    }
}

// BOM type filter
if (isset($bom_type_filter)) {
    $where_bom_type_filter = '';
    foreach ($bom_type_filter as $bom_type) {
        if ($bom_type != '') {
            if ($where_bom_type_filter == '') {
                $where_bom_type_filter .= 'AND (' . db_prefix() . 'mrp_bill_of_materials.bom_type = "' . $bom_type . '"';
            } else {
                $where_bom_type_filter .= ' OR ' . db_prefix() . 'mrp_bill_of_materials.bom_type = "' . $bom_type . '"';
            }
        }
    }
    if ($where_bom_type_filter != '') {
        $where_bom_type_filter .= ')';
        array_push($where, $where_bom_type_filter);
    }
}

// Routing filter
if (isset($routing_filter)) {
    $where_routing_filter = '';
    foreach ($routing_filter as $routing_id) {
        if ($routing_id != '') {
            if ($where_routing_filter == '') {
                $where_routing_filter .= 'AND (' . db_prefix() . 'mrp_bill_of_materials.routing_id = "' . $routing_id . '"';
            } else {
                $where_routing_filter .= ' OR ' . db_prefix() . 'mrp_bill_of_materials.routing_id = "' . $routing_id . '"';
            }
        }
    }
    if ($where_routing_filter != '') {
        $where_routing_filter .= ')';
        array_push($where, $where_routing_filter);
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
