<script>
$(function () {

    // Reset form for Add
    $('[data-target="#prefModal"]').on('click', function () {
        $('#prefForm')[0].reset();
        $('#pref_id').val('');
        $('#prefForm').attr('action', admin_url + 'warehouse/save_pref');
        $('#pairsContainer').empty();
        $('#prefModal .modal-title').text('Add Naming Preference');
    });

    // Load subgroups dynamically
    $('#groupSelect').on('change', function () {
        let gid = $(this).val();
        if (!gid) return;

        $.post(admin_url + 'warehouse/get_subgroups_by_groups', { group_ids: [gid] }, function (res) {
            let subgroups = JSON.parse(res);
            $('#subgroupSelect').empty().append('<option value="">Select Subgroup</option>');
            subgroups.forEach(function (sg) {
                $('#subgroupSelect').append('<option value="' + sg.id + '">' + sg.sub_group_name + '</option>');
            });
        });
    });

    // Add pair
    $('#addPairBtn').on('click', function () {
        let groupId = $('#groupSelect').val();
        let subgroupId = $('#subgroupSelect').val();
        let groupName = $('#groupSelect option:selected').text();
        let subgroupName = $('#subgroupSelect option:selected').text();

        if (!groupId || !subgroupId) {
            alert("Please select both group and subgroup");
            return;
        }

        addPairToUI(groupId, subgroupId, groupName, subgroupName);
    });

    // Add pair to UI
    function addPairToUI(groupId, subgroupId, groupName, subgroupName) {
        let pairKey = groupId + "-" + subgroupId;

        if ($('#pairsContainer').find('[data-pair="' + pairKey + '"]').length > 0) return;

        let badge = $('<span>', {
            class: 'badge badge-info m-1',
            html: "Group: " + groupName + " - Subgroup: " + subgroupName,
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
            value: JSON.stringify({
                group_id: groupId,
                subgroup_id: subgroupId,
                group_name: groupName,
                subgroup_name: subgroupName
            }),
            'data-pair': pairKey
        });

        badge.append(removeBtn);
        $('#pairsContainer').append(badge).append(hidden);
    }

    // Edit existing pref
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

            if (data.group_subgroup_pairs) {
                data.group_subgroup_pairs.forEach(function (pair) {
                    addPairToUI(
                        pair.group_id,
                        pair.subgroup_id,
                        pair.group_name ?? pair.group_id,
                        pair.subgroup_name ?? pair.subgroup_id
                    );
                });
            }

            $('#prefForm input[type=checkbox]').prop('checked', false);
            $('#prefForm input[type=number]').val(0);

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
