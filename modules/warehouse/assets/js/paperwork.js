  function new_paperwork(){
    "use strict";

    $('#paperwork').modal('show');
    $('.edit-title').addClass('hide');
    $('.add-title').removeClass('hide');
    $('#paperwork_id_t').html('');

    $('#paperworks_setting input[name="paperwork_code"]').val('');
    $('#paperworks_setting input[name="paperwork_name"]').val('');
    $('#paperworks_setting input[name="paperwork_hex"]').val('');
    $('#paperworks_setting textarea[name="note"]').val('');
       
  }

  function edit_paperwork(invoker,id){
      "use strict";
      
      $('#paperwork').modal('show');
      $('.edit-title').removeClass('hide');
      $('.add-title').addClass('hide');

      $('#paperwork_id_t').html('');
      $('#paperwork_id_t').append(hidden_input('id',id));

      $('#paperworks_setting input[name="paperwork_code"]').val($(invoker).data('paperwork_code'));
      $('#paperworks_setting input[name="paperwork_name"]').val($(invoker).data('paperwork_name'));
      $('#paperworks_setting input[name="paperwork_hex"]').val($(invoker).data('paperwork_hex'));
      $('#paperworks_setting textarea[name="note"]').val($(invoker).data('note'));

      $('#paperworks_setting input[name="order"]').val($(invoker).data('order'));
      if($(invoker).data('display') == 1){
        $('#paperworks_setting input[name="display"]').prop("checked", true);
      }else{
        $('#paperworks_setting input[name="display"]').prop("checked", false);

      }
   
       
  }