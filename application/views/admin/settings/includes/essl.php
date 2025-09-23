<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<h4 class="tw-font-semibold tw-mt-0 tw-text-neutral-800">ESSL Device Configuration</h4>
<hr class="hr-panel-heading" />

<?php
echo render_input('settings[essl_device_name]', 'Device Name', get_option('essl_device_name'));
echo render_input('settings[essl_device_url]', 'Device URL (e.g., http://192.168.1.140/iclock/WebAPIService.asmx)', get_option('essl_device_url'));
echo render_input('settings[essl_serial_number]', 'Serial Number', get_option('essl_serial_number'));
echo render_input('settings[essl_username]', 'ESSL Username', get_option('essl_username'));
echo render_input('settings[essl_password]', 'ESSL Password', get_option('essl_password'), 'password');
?>
