<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<div class="panel panel-default">
    <div class="panel-heading clearfix">
        <h4 class="panel-title pull-left">Item Naming Preferences</h4>
        <button class="btn btn-primary pull-right" data-toggle="modal" data-target="#prefModal">
            + Add Preference
        </button>
    </div>
    <div class="panel-body">
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Group(s)</th>
                    <th>Subgroup(s)</th>
                    <th>Attributes</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="prefList">
                <?php if(!empty($naming_rules)){ ?>
                    <?php foreach($naming_rules as $pref){ ?>
                        <tr>
                            <td>
                                <?php
                                $groups = json_decode($pref['group_ids'], true);
                                echo $groups ? implode(', ', $groups) : 'All Groups';
                                ?>
                            </td>
                            <td>
                                <?php
                                $subgroups = json_decode($pref['subgroup_ids'], true);
                                echo $subgroups ? implode(', ', $subgroups) : 'All Subgroups';
                                ?>
                            </td>
                            <td>
                                <?php 
                                if(isset($pref['attributes'])){
                                    foreach($pref['attributes'] as $attr){
                                        if($attr['use_attr']){
                                            echo '<span class="label label-default mright5">'
                                                 .ucfirst(str_replace('_',' ',$attr['name']))
                                                 .' (Order: '.$attr['display_order'].', Sep: '.$attr['separator'].')</span><br>';
                                        }
                                    }
                                }
                                ?>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-warning edit-rule" data-id="<?= $pref['id']; ?>">Edit</button>
                                <a href="<?= admin_url('warehouse/delete_pref/'.$pref['id']); ?>" 
                                   class="btn btn-sm btn-danger _delete">Delete</a>
                            </td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr><td colspan="4" class="text-center">No preferences found.</td></tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Add/Edit Modal -->
<div class="modal fade" id="prefModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Add Naming Preference</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <?php echo form_open(admin_url('warehouse/save_pref'), ['id' => 'prefForm']); ?>
                                    <input type="hidden" name="pref_id" id="pref_id">

                    <!-- Groups -->
                    <div class="form-group">
                        <label>Group(s)</label>
                        <?= render_select('group_ids[]', $item_groups, ['id','name'], 'Select Group(s)', [], ['multiple'=>true]); ?>
                    </div>

                    <!-- Subgroups -->
                    <div class="form-group">
                        <label>Subgroup(s)</label>
                        <?= render_select('subgroup_ids[]', $sub_groups, ['id','sub_group_name'], 'Select Subgroup(s)', [], ['multiple'=>true]); ?>
                    </div>

                    <!-- Attributes -->
                    <h5>Attributes</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Attribute</th>
                                <th>Include?</th>
                                <th>Order</th>
                                <th>Separator</th>
                            </tr>
                        </thead>
                        <tbody>
    <?php 
    // Use attributes from controller
    // $attributes = $data['attributes'] is already passed to view
    $separators = [
        ' '=>'Space', 
        ','=>'Comma (,)', 
        '.'=>'Dot (.)', 
        '|' => 'Pipe (|)', 
        '_' => 'Underscore (_)', 
        '-' => 'Hyphen (-)'
    ];

    foreach($attributes as $attr){ ?>
        <tr>
            <td><?= ucfirst(str_replace('_',' ',$attr)); ?></td>
            <td class="text-center"><input type="checkbox" name="attr[<?= $attr; ?>][include]"></td>
            <td><input type="number" name="attr[<?= $attr; ?>][order]" value="0" class="form-control"></td>
            <td>
                <select class="form-control" name="attr[<?= $attr; ?>][separator]">
                    <?php foreach($separators as $val=>$label){ ?>
                        <option value="<?= $val; ?>"><?= $label; ?></option>
                    <?php } ?>
                </select>
            </td>
        </tr>
    <?php } ?>
</tbody>

                        
                    </table>

                <?php echo form_close(); ?>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" form="prefForm" class="btn btn-success">Save Preference</button>
            </div>

        </div>
    </div>
</div>

<script>
window.assignedGroupSubgroups = <?= json_encode($used_group_subgroups); ?>;
</script>


