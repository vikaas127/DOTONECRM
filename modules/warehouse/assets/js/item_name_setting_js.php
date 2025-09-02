<script>
$(function () {
     window.assignedGroupSubgroups =Array.isArray(window.assignedGroupSubgroups) ? window.assignedGroupSubgroups : [];

    // Reset form when Add button clicked
    $('[data-target="#prefModal"]').on('click', function () {
        $('#prefForm')[0].reset();
        $('#pref_id').val('');
        $('#pairsContainer').empty();
        $('#prefForm').attr('action', admin_url + 'warehouse/save_pref');
        $('#prefModal .modal-title').text('Add Naming Preference');
    });

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
            let pairKey = gid + '-' + sg.id;
            let disabled = window.assignedGroupSubgroups.includes(pairKey) ? 'disabled' : '';
            let label = sg.sub_group_name;

            // Temporarily mark DB pairs in the option text
            if (disabled) {
                label += ' (Already in DB)';
            }

            $('#subgroupSelect').append('<option value="' + sg.id + '" ' + disabled + '>' + label + '</option>');
        });
    });
});


    // Add group-subgroup pair
    
$('#addPairBtn').on('click', function () {
    let groupId = $('#groupSelect').val();
    let subgroupId = $('#subgroupSelect').val();
    if (!groupId || !subgroupId) {
        alert("Please select both group and subgroup");
        return;
    }

    let pairKey = groupId + "-" + subgroupId;

    // Block if already used in DB (global)
    if (window.assignedGroupSubgroups.includes(pairKey)) {
        alert("This Group-Subgroup pair already exists in the system!");
        return;
    }

    // Block duplicates in current form
    if ($('#pairsContainer').find('[data-pair="' + pairKey + '"]').length > 0) {
        alert("This pair is already added in the current form!");
        return;
    }

    let groupName = $('#groupSelect option:selected').text().trim();
    let subgroupName = $('#subgroupSelect option:selected').text().trim();
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

    // Edit preference
    $(document).on('click', '.edit-rule', function () {
        let id = $(this).data('id');
        $('#pref_id').val(id);

        $.getJSON(admin_url + "warehouse/get_pref/" + id, function (data) {
    $('#prefForm')[0].reset();
    $('#prefModal .modal-title').text('Edit Naming Preference');
    $('#pairsContainer').empty();

    if (data.group_subgroup_pairs && data.group_subgroup_pairs.length > 0) {
        data.group_subgroup_pairs.forEach(function (pair) {
            addPairToUI(
                pair.group_id,
                pair.subgroup_id,
                pair.group_name ?? pair.group_id,
                pair.subgroup_name ?? pair.subgroup_id
            );
        });
    }

    // Reset attr UI
    $('#prefForm input[type=checkbox]').prop('checked', false);
    $('#prefForm input[type=number]').val(0);
    $('#prefForm select').val('');

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
