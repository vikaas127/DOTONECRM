<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<div class="">
    <div class="">
       
        <button class="btn btn-primary " data-toggle="modal" data-target="#prefModal">
            + Add Preference
        </button>
    </div>
    <div class="clearfix"></div>
<hr class="hr-panel-heading" />
<div class="clearfix"></div>
   <div class="" style="padding: 0; overflow-x: auto;">
    <div class="table-responsive" style="margin: 0; overflow-x: auto;">
        <table class="table table-striped table-bordered" style="width: max-content;">
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
$assignedPairs = [];

if ($pairs) {
    foreach ($pairs as $p) {
        $groupName = isset($p['group_name']) ? $p['group_name'] : $p['group_id'];
        $subgroupName = isset($p['subgroup_name']) ? $p['subgroup_name'] : $p['subgroup_id'];

        // Print the label
        echo '<span class="label label-info mright5">Group: ' . htmlspecialchars($groupName) . ' - Subgroup: ' . htmlspecialchars($subgroupName) . '</span>';

        // Build JS-friendly array for duplicate checking
        $assignedPairs[] = $p['group_id'] . '-' . $p['subgroup_id'];
    }
} else {
    echo 'All Groups/Subgroups available';
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
                               
                               <button class="btn btn-default btn-icon edit-rule" data-id="<?= $pref['id']; ?>">
                                    <i class="fa-regular fa-pen-to-square"></i>
                                </button>

                                <a href="<?= admin_url('warehouse/delete_pref/' . $pref['id']); ?>"
                                   class="btn btn-danger btn-icon _delete"><i class="fa fa-remove"></i></a>
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
                                        <option value=" ">Space()</option>
                                        <option value=",">Comma(,)</option>
                                        <option value=".">Dot(.)</option>
                                        <option value="|">Pipe(|)</option>
                                        <option value="_">Underscore(_)</option>
                                        <option value="-">Hyphen(-)</option>
                                        <option value="(">(Left Bracket</option>
                                        <option value=")">)Right Bracket</option>
                                        <option value="[">[Left Square Bracket]</option>
                                        <option value="]">]Right Square Bracket</option>
                                        <option value="{">{Left Curly Brace</option>
                                        <option value="}">}Right Curly Brace</option>
                                        <option value="X">X (Letter)</option>
                                        <option value="/">Forward Slash (/)</option>
                                        <option value="\\">Backward Slash (\)</option>
                                        <option value=":">Colon(:)</option>
                                        <option value=";">Semicolon(;) </option>
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
window.assignedGroupSubgroups = <?php echo json_encode($assignedPairs); ?>;
console.log('Assigned DB pairs:', window.assignedGroupSubgroups);
</script>



