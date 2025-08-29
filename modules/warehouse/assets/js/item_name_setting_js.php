<script>
$(function () {

    // Reset form when Add button clicked
    $('[data-target="#prefModal"]').on('click', function () {
        $('#prefForm')[0].reset();
        $('#pref_id').val('');
        $('#pairsContainer').empty();
        $('#prefForm').attr('action', admin_url + 'warehouse/save_pref');
        $('#prefModal .modal-title').text('Add Naming Preference');
    });

    // Load subgroups when group changes
    $('#groupSelect').on('change', function () {
        let gid = $(this).val();
        if (!gid) return;

        $.post(admin_url + 'warehouse/get_subgroups_by_groups', { group_ids: [gid] }, function (res) {
            let subgroups;
            try {
                subgroups = JSON.parse(res);
            } catch (e) {
                alert("Error loading subgroups");
                return;
            }

            $('#subgroupSelect').empty().append('<option value="">Select Subgroup</option>');
            subgroups.forEach(function (sg) {
                $('#subgroupSelect').append('<option value="' + sg.id + '">' + sg.sub_group_name + '</option>');
            });
        });
    });

    // Add group-subgroup pair
    $('#addPairBtn').on('click', function () {
        let groupId = $('#groupSelect').val();
        let subgroupId = $('#subgroupSelect').val();
        let groupText = $('#groupSelect option:selected').text();
        let subgroupText = $('#subgroupSelect option:selected').text();

        if (!groupId || !subgroupId) {
            alert("Please select both group and subgroup");
            return;
        }

        addPairToUI(groupId, subgroupId, groupText, subgroupText);
    });

    // Helper to add pair to UI
    function addPairToUI(groupId, subgroupId, groupText, subgroupText) {
        let pairKey = groupId + "-" + subgroupId;
        if ($('#pairsContainer').find('[data-pair="' + pairKey + '"]').length > 0) return;

        let badge = $('<span>', {
            class: 'badge badge-info m-1',
            text: groupText + " → " + subgroupText,
            'data-pair': pairKey
        });

        let removeBtn = $('<button>', {
            type: 'button',
            class: 'btn btn-xs btn-danger ml-1',
            text: 'x'
        }).on('click', function () {
            badge.remove();
            hidden.remove();
        });

        let hidden = $('<input>', {
            type: 'hidden',
            name: 'pairs[]',
            value: JSON.stringify({ group_id: groupId, subgroup_id: subgroupId }),
            'data-pair': pairKey
        });

        badge.append(removeBtn);
        $('#pairsContainer').append(badge).append(hidden);
    }

    // Edit preference
    $(document).on('click', '.edit-rule', function () {
        let id = $(this).data('id');
        $('#pref_id').val(id);

        $.get(admin_url + "warehouse/get_pref/" + id, function (resp) {
            let data;
            try {
                data = JSON.parse(resp);
            } catch (e) {
                alert("Error loading preference data");
                return;
            }

            $('#prefForm')[0].reset();
            $('#prefModal .modal-title').text('Edit Naming Preference');
            $('#pairsContainer').empty();

            // Populate group-subgroup pairs
            if (data.group_subgroup_pairs && data.group_subgroup_pairs.length > 0) {
                data.group_subgroup_pairs.forEach(function (pair) {
                    addPairToUI(
                        pair.group_id,
                        pair.subgroup_id,
                        pair.group_name || ("Group " + pair.group_id),
                        pair.subgroup_name || ("Subgroup " + pair.subgroup_id)
                    );
                });
            }

            // Reset attr UI
            $('#prefForm input[type=checkbox]').prop('checked', false);
            $('#prefForm input[type=number]').val(0);
            $('#prefForm select').val(' - ');

            // Populate attributes
            if (data.attributes) {
                data.attributes.forEach(function (attr) {
                    $('#prefForm input[name="attr[' + attr.name + '][include]"]').prop('checked', attr.use_attr == 1);
                    $('#prefForm input[name="attr[' + attr.name + '][order]"]').val(attr.display_order);
                    $('#prefForm select[name="attr[' + attr.name + '][separator]"]').val(attr.separator);
                });
            }

            $('#prefForm').attr('action', admin_url + "warehouse/save_pref/" + id);
            $('#prefModal').modal('show');
        });
    });

});
</script>
