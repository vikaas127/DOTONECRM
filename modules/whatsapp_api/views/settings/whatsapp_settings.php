<div class="row">
	<div class="col-md-6">
		<i class="fa fa-question-circle pull-left" data-toggle="tooltip" data-title="<?php echo _l('phone_number_id_description'); ?>" data-placement="left"></i>
		<?php echo render_input('settings[phone_number_id]', _l('phone_number_id'), get_option('phone_number_id')); ?>
	</div>
	<div class="col-md-6">
		<i class="fa fa-question-circle pull-left" data-toggle="tooltip" data-title="<?php echo _l('business_account_id_description'); ?>" data-placement="left"></i>
		<?php echo render_input('settings[whatsapp_business_account_id]', _l('whatsapp_business_account_id'), get_option('whatsapp_business_account_id')); ?>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<i class="fa fa-question-circle pull-left" data-toggle="tooltip" data-title="<?php echo _l('access_token_description'); ?>"></i>
		<?php echo render_input('settings[whatsapp_access_token]', _l('whatsapp_access_token'), get_option('whatsapp_access_token')); ?>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<i class="fa fa-question-circle pull-left" data-toggle="tooltip" data-title="<?php echo _l('access_token_description'); ?>"></i>
		<?php echo render_input('settings[whatsapp_api_token]', _l('whatsapp_api_token'), get_option('whatsapp_api_token')); ?>
	</div>
</div>
<!--<div class="row">
	<div class="col-md-12">
		<i class="fa fa-question-circle pull-left" data-toggle="tooltip" data-title="<?php echo _l('access_token_description'); ?>"></i>
		<?php echo render_input('settings[api_url]', _l('api_url'), get_option('api_url')); ?>
	</div>
</div>-->
