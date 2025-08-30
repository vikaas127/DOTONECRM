<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div>
<div class="_buttons">
    <?php if (has_permission('wh_setting', '', 'create') || is_admin() ) { ?>

    <a href="#" onclick="new_paperwork(); return false;" class="btn btn-info pull-left display-block">
        <?php echo _l('add_paperwork'); ?>
    </a>
<?php } ?>

</div>
<div class="clearfix"></div>
<hr class="hr-panel-heading" />
<div class="clearfix"></div>
<table class="table dt-table border table-striped">
 <thead>
    <th><?php echo _l('_order'); ?></th>
    <th><?php echo _l('paperwork_code'); ?></th>
    <th><?php echo _l('paperwork_name'); ?></th>
  
    <th><?php echo _l('order'); ?></th>
    <th><?php echo _l('display'); ?></th>
    <th><?php echo _l('note'); ?></th>
    <th><?php echo _l('options'); ?></th>
 </thead>
  <tbody>
    <?php foreach($paperworks as $paperwork){ ?>

    <tr>
        <td><?php echo _l($paperwork['paperwork_id']); ?></td>
        <td><?php echo _l($paperwork['paperwork_code']); ?></td>
        <td><?php echo _l($paperwork['paperwork_name']); ?></td>
       
        <td><?php echo _l($paperwork['order']); ?></td>
        <td><?php if($paperwork['display'] == 0){ echo _l('not_display'); }else{echo _l('display');} ?></td>
        <td><?php echo _l($paperwork['note']); ?></td>

        <td>
            <?php if (has_permission('wh_setting', '', 'edit') || is_admin()) { ?>
              <a href="#" onclick="edit_paperwork(this,<?php echo new_html_entity_decode($paperwork['paperwork_id']); ?>); return false;" data-paperwork_code="<?php echo new_html_entity_decode($paperwork['paperwork_code']); ?>" data-paperwork_name="<?php echo new_html_entity_decode($paperwork['paperwork_name']); ?>" data-order="<?php echo new_html_entity_decode($paperwork['order']); ?>" data-display="<?php echo new_html_entity_decode($paperwork['display']); ?>" data-note="<?php echo new_html_entity_decode($paperwork['note']); ?>" class="btn btn-default btn-icon"><i class="fa-regular fa-pen-to-square"></i>
            </a>
            <?php } ?>

            <?php if (has_permission('wh_setting', '', 'delete') || is_admin()) { ?> 
            <a href="<?php echo admin_url('warehouse/delete_paperwork/'.$paperwork['paperwork_id']); ?>" class="btn btn-danger btn-icon _delete"><i class="fa fa-remove"></i></a>
             <?php } ?>
        </td>
    </tr>
    <?php } ?>
 </tbody>
</table>   

<div class="modal1 fade" id="paperwork" tabindex="-1" role="dialog">
        <div class="modal-dialog setting-handsome-table">
          <?php echo form_open_multipart(admin_url('warehouse/paperwork'), array('id'=>'add_paperwork')); ?>

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">
                        <span class="add-title"><?php echo _l('add_paperwork'); ?></span>
                        <span class="edit-title"><?php echo _l('edit_paperwork'); ?></span>
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                             <div id="paperwork_id">
                             </div>   
                         <div class="form"> 
                            <div class="col-md-12" id="add_handsontable">

                            
                            </div>
                              <?php echo form_hidden('hot_paperwork'); ?>
                        </div>
                        </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo _l('close'); ?></button>
                        
                         <button id="latch_assessor" type="button" class="btn btn-info intext-btn" onclick="add_paperwork(this); return false;" ><?php echo _l('submit'); ?></button>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
</div>

<?php require 'modules/warehouse/assets/js/paperwork_js.php';?>
</body>
</html>
