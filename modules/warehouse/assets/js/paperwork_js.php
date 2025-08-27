<script> 

var paperwork_value = {};
    function new_paperwork(){
      "use strict";
      
        $('#paperwork').modal('show');
        $('.edit-title').addClass('hide');
        $('.add-title').removeClass('hide');
        $('#paperwork_id').html('');

        var handsontable_html ='<div id="hot_paperwork" class="hot handsontable htColumnHeaders"></div>';
        if($('#add_handsontable').html() != null){
          $('#add_handsontable').empty();

          $('#add_handsontable').html(handsontable_html);
        }else{
          $('#add_handsontable').html(handsontable_html);

        }

      setTimeout(function(){
        "use strict";
        var hotElement1 = document.querySelector('#hot_paperwork');


         var paperwork = new Handsontable(hotElement1, {
          contextMenu: true,
          manualRowMove: true,
          manualColumnMove: true,
          stretchH: 'all',
          autoWrapRow: true,
          rowHeights: 30,
          defaultRowHeight: 100,
          maxRows: 22,
          minRows:9,
          width: '100%',
          height: 330,
          rowHeaders: true,
          autoColumnpaperwork: {
            samplingRatio: 23
          },

          licenseKey: 'non-commercial-and-evaluation',
          filters: true,
          manualRowRepaperwork: true,
          manualColumnRepaperwork: true,
          allowInsertRow: true,
          allowRemoveRow: true,
          columnHeaderHeight: 40,

          colWidths: [40, 40, 100, 30,30, 30, 140],
          rowHeights: 30,
          // colWidths: 55,
          rowHeaderWidth: [44],
          hiddenColumns: {
            columns: [0],
            indicators: true
          },

          columns: [
                      {
                        type: 'text',
                        data: 'paperwork_id'
                      },
                      {
                        type: 'text',
                        data: 'paperwork_code'
                      },
                       {
                        type: 'text',
                        data: 'paperwork_name',
                        // set desired format pattern and
                      },
                        
                       
                      {
                        type: 'numeric',
                        data: 'order',
                      },
                      {
                        type: 'checkbox',
                        data: 'display',
                        checkedTemplate: 'yes',
                        uncheckedTemplate: 'no'
                      },
                      {
                        type: 'text',
                        data: 'note',
                      },
                    
                    ],

          colHeaders: true,
          nestedHeaders: [{
                            "1":"<?php echo _l('paperwork_id') ?>",
                            "2":"<?php echo _l('paperwork_code') ?>",
                            "3":"<?php echo _l('paperwork_name') ?>",
                           
                            "4":"<?php echo _l('order') ?>",
                           "5":"<?php echo _l('display') ?>",
                           "6":"<?php echo _l('note') ?>",
                          }],

          data: [
          {"paperwork_code":"","paperwork_name":"","order":"","display":"yes","note":""},
          {"paperwork_code":"","paperwork_name":"","order":"","display":"yes","note":""},

          {"paperwork_code":"","paperwork_name":"","order":"","display":"yes","note":""},

          {"paperwork_code":"","paperwork_name":"","order":"","display":"yes","note":""},
          {"paperwork_code":"","paperwork_name":"","order":"","display":"yes","note":""},

          {"paperwork_code":"","paperwork_name":"","order":"","display":"yes","note":""},


          
          ],

        });
         paperwork_value = paperwork;
        },300);


    }

  function edit_paperwork(invoker,id){
    
    "use strict";

    var paperwork_code = $(invoker).data('paperwork_code');
    var paperwork_name = $(invoker).data('paperwork_name');
   

    var order = $(invoker).data('order');
    if($(invoker).data('display') == 0){
      var display = 'no';
    }else{
      var display = 'yes';
    }
    var note = $(invoker).data('note');

        $('#paperwork_id').html('');
        $('#paperwork_id').append(hidden_input('id',id));
        $('#paperwork').modal('show');
        $('.edit-title').removeClass('hide');
        $('.add-title').addClass('hide');

        var handsontable_html ='<div id="hot_paperwork" class="hot handsontable htColumnHeaders"></div>';
        if($('#add_handsontable').html() != null){
          $('#add_handsontable').empty();

          $('#add_handsontable').html(handsontable_html);
        }else{
          $('#add_handsontable').html(handsontable_html);

        }

    setTimeout(function(){
       "use strict";
      var hotElement1 = document.querySelector('#hot_paperwork');

       var paperwork = new Handsontable(hotElement1, {
        contextMenu: true,
        manualRowMove: true,
        manualColumnMove: true,
        stretchH: 'all',
        autoWrapRow: true,
        rowHeights: 30,
        defaultRowHeight: 100,
        maxRows: 1,
        width: '100%',
        height: 130,
        rowHeaders: true,
        autoColumnpaperwork: {
          samplingRatio: 23
        },
        licenseKey: 'non-commercial-and-evaluation',
        filters: true,
        manualRowRepaperwork: true,
        manualColumnRepaperwork: true,
        columnHeaderHeight: 40,

        colWidths: [40, 40, 100, 30,30, 30, 140],
        rowHeights: 30,
        rowHeaderWidth: [44],
        hiddenColumns: {
          columns: [0],
          indicators: true
        },


        columns: [
                {
                  type: 'text',
                  data: 'paperwork_id'
                },
                {
                  type: 'text',
                  data: 'paperwork_code',
                  readOnly:true,
                  
                },
                 {
                  type: 'text',
                  data: 'paperwork_name',
                  // set desired format pattern and
                },
                   
                {
                  type: 'numeric',
                  data: 'order',
                },
                {
                  type: 'checkbox',
                  data: 'display',
                  checkedTemplate: 'yes',
                  uncheckedTemplate: 'no'
                },
                {
                  type: 'text',
                  data: 'note',
                },
              
              ],

        colHeaders: true,
        nestedHeaders: [{
                      "1":"<?php echo _l('paperwork_id') ?>",
                      "2":"<?php echo _l('paperwork_code') ?>",
                      "3":"<?php echo _l('paperwork_name') ?>",
                       
                      "4":"<?php echo _l('order') ?>",
                      "5":"<?php echo _l('display') ?>",
                      "6":"<?php echo _l('note') ?>",
                    }],

        data: [{"paperwork_id":id,"paperwork_code":paperwork_code,"paperwork_name":paperwork_name,"order":order,"display":display,"note":note}],

      });
       paperwork_value = paperwork;
      },300);

    }
    

    function add_paperwork(invoker){
        "use strict";
        var valid_paperwork = $('#hot_paperwork').find('.htInvalid').html();

        if(valid_paperwork){
          alert_float('danger', "<?php echo _l('data_must_number') ; ?>");
        }else{

          $('input[name="hot_paperwork"]').val(JSON.stringify(paperwork_value.getData()));
          $('#add_paperwork').submit(); 

        }
        
    }
</script>