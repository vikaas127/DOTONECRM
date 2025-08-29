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
                    <th>Group(s) & Subgroup(s)</th>
                    <th>Attributes</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="prefList">
                <?php if (!empty($naming_rules)) { ?>
                    <?php foreach ($naming_rules as $pref) { ?>
                        <tr>
                            <td>
                                <?php
                                $pairs = json_decode($pref['group_subgroup_pairs'], true);
                                if ($pairs) {
                                    foreach ($pairs as $p) {
                                        echo '<span class="label label-info mright5">Group ' . $p['group_id'] . ' - Subgroup ' . $p['subgroup_id'] . '</span>';
                                    }
                                } else {
                                    echo 'All Groups/Subgroups';
                                }
                                ?>
                            </td>
                            <td>
                                <?php
                                if (isset($pref['attributes'])) {
                                    foreach ($pref['attributes'] as $attr) {
                                        if ($attr['use_attr']) {
                                            echo '<span class="label label-default mright5">'
                                                . ucfirst(str_replace('_', ' ', $attr['name']))
                                                . ' (Order: ' . $attr['display_order'] . ', Sep: ' . $attr['separator'] . ')</span><br>';
                                        }
                                    }
                                }
                                ?>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-warning edit-rule" data-id="<?= $pref['id']; ?>">Edit</button>
                                <a href="<?= admin_url('warehouse/delete_pref/' . $pref['id']); ?>"
                                   class="btn btn-sm btn-danger _delete">Delete</a>
                            </td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr><td colspan="3" class="text-center">No preferences found.</td></tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</div>

<<!-- Add/Edit Modal -->
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

                <!-- hidden field to store pairs -->
                <input type="hidden" name="group_subgroup_pairs" id="groupSubgroupPairs">

                <!-- Group & Subgroup Pair Builder -->
                <div class="form-group">
                    <label>Add Group & Subgroup Pair</label>
                    <div class="form-row align-items-center">
                        <div class="col">
                            <select id="groupSelect" name="group_id" class="form-control">
                                <option value="">Select Group</option>
                                <?php foreach ($item_groups as $g): ?>
                                    <option value="<?= $g['id']; ?>"><?= $g['name']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col">
                            <select id="subgroupSelect" name="subgroup_id" class="form-control">
                                <option value="">Select Subgroup</option>
                            </select>
                        </div>
                        <div class="col-auto">
                            <button type="button" id="addPairBtn" class="btn btn-primary btn-sm">
                                + Add Pair
                            </button>
                        </div>
                    </div>
                    <div id="pairsContainer" class="mt-2 d-flex flex-wrap"></div>
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
                        <?php foreach ($attributes as $attr) { ?>
                            <tr>
                                <td><?= ucfirst(str_replace('_', ' ', $attr)); ?></td>
                                <td class="text-center">
                                    <input type="checkbox" name="attr[<?= $attr; ?>][include]">
                                </td>
                                <td>
                                    <input type="number" name="attr[<?= $attr; ?>][order]" value="0" class="form-control">
                                </td>
                                <td>
                                    <select name="attr[<?= $attr; ?>][separator]" class="form-control">
                                        <option value=" ">Space</option>
                                        <option value=",">Comma</option>
                                        <option value=".">Dot</option>
                                        <option value="|">Pipe</option>
                                        <option value="_">Underscore</option>
                                        <option value="-">Hyphen</option>
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
