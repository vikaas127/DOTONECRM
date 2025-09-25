<?php
// Provide defaults if not saved yet
$default_userID     = get_option('wn_userID')     ?: 'b3b9791e118642b08b9358a0682afb7a';
$default_deviceName = get_option('wn_deviceName') ?: 'DOTONE';

echo render_input('settings[wn_userID]', 'User ID', $default_userID);
echo render_input('settings[wn_deviceName]', 'Device Name', $default_deviceName);
?>
