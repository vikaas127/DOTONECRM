<script>
$(function(){

    // Helper: get assigned subgroup IDs used in other prefs
    function getAssignedSubgroups(currentPrefId = null) {
        let assigned = [];
        $('#prefList tr').each(function(){
            let rowId = $(this).find('.edit-rule').data('id');
            if(currentPrefId && rowId == currentPrefId) return; // skip current pref
            let ids = $(this).data('subgroup-ids');
            if(ids){
                assigned = assigned.concat(JSON.parse(ids));
            }
        });
        return assigned;
    }

    // Load subgroups based on selected groups
    function loadSubgroups(groupIds, selectedSubgroups = [], prefId = null) {
        let $subgroupSelect = $('select[name="subgroup_ids[]"]');

        if(!groupIds || groupIds.length === 0){
            $subgroupSelect.empty().prop('disabled', true).selectpicker('refresh');
            return;
        }

        $.post(admin_url + 'warehouse/get_subgroups_by_groups', { group_ids: groupIds }, function(res) {
            let subgroups = JSON.parse(res);
            $subgroupSelect.empty();

            if(subgroups.length > 0){
                let assigned = window.assignedGroupSubgroups || [];

                subgroups.forEach(function(sg){
                    let option = $('<option>', { value: sg.id, text: sg.sub_group_name });

                    // Check for each selected group
                    let disable = false;
                    groupIds.forEach(function(gid){
                        if(assigned.includes(gid + '-' + sg.id) && !selectedSubgroups.includes(sg.id)){
                            disable = true;
                        }
                    });

                    if(disable){
                        option.prop('disabled', true);
                        option.text(sg.sub_group_name + ' (assigned)');
                    }

                    $subgroupSelect.append(option);
                });
            }

            $subgroupSelect.prop('disabled', subgroups.length === 0);

            if(selectedSubgroups.length > 0){
                $subgroupSelect.val(selectedSubgroups.map(String));
            }

            $subgroupSelect.selectpicker('refresh');
            $subgroupSelect.selectpicker('render');

            // Prevent selecting disabled options
            $subgroupSelect.off('changed.bs.select').on('changed.bs.select', function(e, clickedIndex, isSelected, previousValue){
                let option = $(this).find('option').eq(clickedIndex);
                if(option.prop('disabled')){
                    e.preventDefault();
                    $(this).selectpicker('val', $(this).val().filter(v => v != option.val()));
                }
            });
        });
    }

    // Add modal
    $('[data-target="#prefModal"]').on('click', function(){
        $('#prefForm')[0].reset();
        $('#pref_id').val('');
        $('#prefForm').attr('action', "<?= admin_url('warehouse/save_pref'); ?>");
        $('select[name="subgroup_ids[]"]').empty().prop('disabled', true).selectpicker('refresh');
        $('#prefModal .modal-title').text('Add Naming Preference');
    });

    // Edit modal
    $(document).on('click', '.edit-rule', function(){
        let id = $(this).data('id');
        $('#pref_id').val(id);

        $.get("<?= admin_url('warehouse/get_pref/'); ?>" + id, function(resp){
            let data = JSON.parse(resp);

            $('#prefForm')[0].reset();
            $('#prefModal .modal-title').text('Edit Naming Preference');

            // Prefill groups
            let $groupSelect = $('select[name="group_ids[]"]');
            $groupSelect.val(data.group_ids.map(String));
            $groupSelect.selectpicker('refresh').selectpicker('render');

            // Load subgroups after groups are set
            loadSubgroups(data.group_ids, data.subgroup_ids, id);

            // Prefill attributes
            $('#prefForm input[type=checkbox]').prop('checked', false);
            $('#prefForm input[type=number]').val(0);
            if(data.attributes){
                data.attributes.forEach(function(attr){
                    $('#prefForm input[name="attr['+attr.name+'][include]"]').prop('checked', attr.use_attr==1);
                    $('#prefForm input[name="attr['+attr.name+'][order]"]').val(attr.display_order);
                    $('#prefForm select[name="attr['+attr.name+'][separator]"]').val(attr.separator);
                });
            }

            // Update form action dynamically
            $('#prefForm').attr('action', "<?= admin_url('warehouse/save_pref/'); ?>" + id);

            $('#prefModal').modal('show');
        });
    });

    // When groups change in modal (Add or Edit)
    $('select[name="group_ids[]"]').on('change', function(){
        let groupIds = $(this).val();
        let prefId = $('#pref_id').val() || null;
        loadSubgroups(groupIds, [], prefId);
    });

});
</script>
