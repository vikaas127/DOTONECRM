<?php

defined('BASEPATH') or exit('No direct script access allowed');
require_once(APPPATH . 'libraries/import/App_import.php');

class Import_customers extends App_import
{
    protected $notImportableFields = [];
    protected $importErrors = [];


    private $countryFields = ['country', 'billing_country', 'shipping_country'];

    protected $requiredFields = [ 'company' ];

    public function __construct()
    {
        $this->notImportableFields = hooks()->apply_filters('not_importable_clients_fields', ['userid', 'id', 'is_primary', 'password', 'datecreated', 'last_ip', 'last_login', 'last_password_change', 'active', 'new_pass_key', 'new_pass_key_requested', 'leadid', 'default_currency', 'profile_image', 'default_language', 'direction', 'show_primary_contact', 'invoice_emails', 'estimate_emails', 'project_emails', 'task_emails', 'contract_emails', 'credit_note_emails', 'ticket_emails', 'addedfrom', 'registration_confirmed', 'last_active_time', 'email_verified_at', 'email_verification_key', 'email_verification_sent_at']);

        if (get_option('company_is_required') == 1) {
            $this->requiredFields[] = 'company';
        }

        $this->addImportGuidelinesInfo('Duplicate email rows won\'t be imported.', true);

        $this->addImportGuidelinesInfo('Make sure you configure the default contact permission in <a href="' . admin_url('settings?group=clients') . '" target="_blank">Setup->Settings->Customers</a> to get the best results like auto assigning contact permissions and email notification settings based on the permission.');

        parent::__construct();
    }

    // public function perform()
    // {
    //     $this->initialize();

    //     $databaseFields      = $this->getImportableDatabaseFields();
    //     $totalDatabaseFields = count($databaseFields);

    //     foreach ($this->getRows() as $rowNumber => $row) {
    //         $insert    = [];
    //         $duplicate = false;

    //         for ($i = 0; $i < $totalDatabaseFields; $i++) {
    //             if (!isset($row[$i])) {
    //                 continue;
    //             }

    //             $row[$i] = $this->checkNullValueAddedByUser($row[$i]);

    //             if (in_array($databaseFields[$i], $this->requiredFields) &&
    //                 $row[$i] == '' &&
    //                 $databaseFields[$i] != 'company'
    //                 && $databaseFields[$i] != 'email') {
    //                 $row[$i] = '/';
    //             } elseif (in_array($databaseFields[$i], $this->countryFields)) {
    //                 $row[$i] = $this->countryValue($row[$i]);
    //             } elseif ($databaseFields[$i] == 'email') {
    //                 $duplicate = $this->isDuplicateContact($row[$i]);
    //             } elseif ($databaseFields[$i] == 'stripe_id') {
    //                 if (empty($row[$i]) || (!empty($row[$i]) && !startsWith($row[$i], 'cus_'))) {
    //                     $row[$i] = null;
    //                 }
    //             } elseif ($databaseFields[$i] == 'contact_phonenumber') {
    //                 if (is_automatic_calling_codes_enabled() && !empty($row[$i])) {
    //                     $customerCountryIndex = array_search('country', $databaseFields);
    //                     if (isset($row[$customerCountryIndex]) && !empty($row[$customerCountryIndex])) {
    //                         $customerCountry = $this->getCountry(null, $this->countryValue($row[$customerCountryIndex]));

    //                         if ($customerCountry) {
    //                             $callingCode = '+' . ltrim($customerCountry->calling_code, '+');

    //                             if (startsWith($row[$i], $customerCountry->calling_code)) { // with calling code but without the + prefix
    //                                 $row[$i] = '+' . $row[$i];
    //                             } elseif (!startsWith($row[$i], $callingCode)) {
    //                                 $row[$i] = $callingCode . $row[$i];
    //                             }
    //                         }
    //                     }
    //                 }
    //             }

    //             $insert[$databaseFields[$i]] = $row[$i];
    //         }

    //         if ($duplicate) {
    //             continue;
    //         }

    //         $insert = $this->trimInsertValues($insert);

    //         if (count($insert) > 0) {
    //             $this->incrementImported();

    //             $id = null;

    //             if (!$this->isSimulation()) {
    //                 $insert['datecreated']           = date('Y-m-d H:i:s');
    //                 $insert['donotsendwelcomeemail'] = true;

    //                 if ($this->ci->input->post('default_pass_all')) {
    //                     $insert['password'] = $this->ci->input->post('default_pass_all', false);
    //                 }

    //                 if ($this->shouldAddContactUnderCustomer($insert)) {
    //                     $this->addContactUnderCustomer($insert);

    //                     continue;
    //                 }

    //                 $insert['is_primary'] = 1;
    //                 $id                   = $this->ci->clients_model->add($insert, true);

    //                 if ($id) {
    //                     if ($this->ci->input->post('groups_in[]')) {
    //                         $this->insertCustomerGroups($this->ci->input->post('groups_in[]'), $id);
    //                     }

    //                     if (staff_cant('view', 'customers')) {
    //                         $assign['customer_admins']   = [];
    //                         $assign['customer_admins'][] = get_staff_user_id();
    //                         $this->ci->clients_model->assign_admins($assign, $id);
    //                     }
    //                 }
    //             } else {
    //                 $this->simulationData[$rowNumber] = $this->formatValuesForSimulation($insert);
    //             }

    //             $this->handleCustomFieldsInsert($id, $row, $i, $rowNumber, 'customers');
    //         }

    //         if ($this->isSimulation() && $rowNumber >= $this->maxSimulationRows) {
    //             break;
    //         }
    //     }
    // }

public function perform()
{
    $this->initialize();

    $databaseFields = $this->getImportableDatabaseFields();
    $totalDatabaseFields = count($databaseFields);

    foreach ($this->getRows() as $rowNumber => $row) {
        $insert = [];

        // Build insert array
        for ($i = 0; $i < $totalDatabaseFields; $i++) {
            if (!isset($row[$i])) {
                continue;
            }

            $row[$i] = $this->checkNullValueAddedByUser($row[$i]);

            if (in_array($databaseFields[$i], $this->requiredFields) &&
                $row[$i] == '' &&
                $databaseFields[$i] != 'company' &&
                $databaseFields[$i] != 'email') {
                $row[$i] = '/';
            } elseif (in_array($databaseFields[$i], $this->countryFields)) {
                $row[$i] = $this->countryValue($row[$i]);
            } elseif ($databaseFields[$i] == 'stripe_id') {
                if (empty($row[$i]) || (!empty($row[$i]) && !startsWith($row[$i], 'cus_'))) {
                    $row[$i] = null;
                }
            } elseif ($databaseFields[$i] == 'contact_phonenumber') {
                if (is_automatic_calling_codes_enabled() && !empty($row[$i])) {
                    $customerCountryIndex = array_search('country', $databaseFields);
                    if (isset($row[$customerCountryIndex]) && !empty($row[$customerCountryIndex])) {
                        $customerCountry = $this->getCountry(null, $this->countryValue($row[$customerCountryIndex]));
                        if ($customerCountry) {
                            $callingCode = '+' . ltrim($customerCountry->calling_code, '+');
                            if (startsWith($row[$i], $customerCountry->calling_code)) {
                                $row[$i] = '+' . $row[$i];
                            } elseif (!startsWith($row[$i], $callingCode)) {
                                $row[$i] = $callingCode . $row[$i];
                            }
                        }
                    }
                }
            }

            $insert[$databaseFields[$i]] = $row[$i];
        }

        $insert = $this->trimInsertValues($insert);

        

        // Skip row if both email and phone number are empty
        if (empty($insert['email']) && empty($insert['contact_phonenumber'])) {
            $errorMsg = 'Both email and phone number are missing.';
            log_message('error', 'Import failed for row #' . $rowNumber . ': ' . $errorMsg);
            $this->importErrors[] = ['row' => $rowNumber, 'error' => $errorMsg];
            continue;
        }

        // Check duplicates
        $duplicate = false;

        if (!empty($insert['email']) && $this->isDuplicateContact($insert['email'])) {
            $duplicate = true;
            $errorMsg = 'Duplicate email "' . $insert['email'] . '"';
            log_message('error', 'Import failed for row #' . $rowNumber . ': ' . $errorMsg);
            $this->importErrors[] = ['row' => $rowNumber, 'error' => $errorMsg];
        }

        if (empty($insert['email']) && !empty($insert['contact_phonenumber']) && $this->isDuplicatePhoneNumber($insert['contact_phonenumber'])) {
            $duplicate = true;
            $errorMsg = 'Duplicate phone number "' . $insert['contact_phonenumber'] . '"';
            log_message('error', 'Import failed for row #' . $rowNumber . ': ' . $errorMsg);
            $this->importErrors[] = ['row' => $rowNumber, 'error' => $errorMsg];
        }

        if ($duplicate || count($insert) === 0) {
            if (count($insert) === 0 && !$duplicate) {
                $errorMsg = 'No valid data to insert.';
                log_message('error', 'Import failed for row #' . $rowNumber . ': ' . $errorMsg);
                $this->importErrors[] = ['row' => $rowNumber, 'error' => $errorMsg];
            }
            continue;
        }


        $this->incrementImported();

        $id = null;

        if (!$this->isSimulation()) {
            $insert['datecreated'] = date('Y-m-d H:i:s');
            $insert['donotsendwelcomeemail'] = true;

            if ($this->ci->input->post('default_pass_all')) {
                $insert['password'] = $this->ci->input->post('default_pass_all', false);
            }

            try {
                if ($this->shouldAddContactUnderCustomer($insert)) {
                    $this->addContactUnderCustomer($insert);
                    continue;
                }

                $insert['is_primary'] = 1;
                $id = $this->ci->clients_model->add($insert, true);

                if (!$id) {
                    log_message('error', 'Failed to insert customer for row #' . $rowNumber . ': ' . json_encode($insert));
                }

                if ($id && $this->ci->input->post('groups_in[]')) {
                    $this->insertCustomerGroups($this->ci->input->post('groups_in[]'), $id);
                }

                if ($id && staff_cant('view', 'customers')) {
                    $assign['customer_admins'] = [];
                    $assign['customer_admins'][] = get_staff_user_id();
                    $this->ci->clients_model->assign_admins($assign, $id);
                }

            } catch (Exception $e) {
                log_message('error', 'Exception for row #' . $rowNumber . ': ' . $e->getMessage() . ' | Data: ' . json_encode($insert));
            }
        } else {
            $this->simulationData[$rowNumber] = $this->formatValuesForSimulation($insert);
        }

        $this->handleCustomFieldsInsert($id, $row, $i, $rowNumber, 'customers');

        if ($this->isSimulation() && $rowNumber >= $this->maxSimulationRows) {
            break;
        }
    }
}
public function generateErrorFile()
{
    if (empty($this->importErrors)) {
        return null;
    }

    $filename = 'import_errors_' . date('Y-m-d_H-i-s') . '.csv';
    $filepath = FCPATH . 'uploads/import_errors/' . $filename;

    if (!is_dir(FCPATH . 'uploads/import_errors')) {
        mkdir(FCPATH . 'uploads/import_errors', 0755, true);
    }

    $file = fopen($filepath, 'w');
    fputcsv($file, ['Row Number', 'Error Message']);

    foreach ($this->importErrors as $error) {
        fputcsv($file, [$error['row'], $error['error']]);
    }

    fclose($file);

    return base_url('uploads/import_errors/' . $filename);
}


    public function formatFieldNameForHeading($field)
    {
        if (strtolower($field) == 'title') {
            return 'Position';
        }

        return parent::formatFieldNameForHeading($field);
    }

    protected function email_formatSampleData()
    {
        return uniqid() . '@example.com';
    }

    protected function failureRedirectURL()
    {
        return admin_url('clients/import');
    }

    protected function afterSampleTableHeadingText($field)
    {
        $contactFields = [
            'firstname', 'lastname', 'email', 'contact_phonenumber', 'title',
        ];

        if (in_array($field, $contactFields)) {
            return '<br /><span class="text-info">' . _l('import_contact_field') . '</span>';
        }
    }

    private function insertCustomerGroups($groups, $customer_id)
    {
        foreach ($groups as $group) {
            $this->ci->db->insert(db_prefix() . 'customer_groups', [
                                                    'customer_id' => $customer_id,
                                                    'groupid'     => $group,
                                                ]);
        }
    }

    private function shouldAddContactUnderCustomer($data)
    {
        return (isset($data['company']) && $data['company'] != '' && $data['company'] != '/')
        && (total_rows(db_prefix() . 'clients', ['company' => $data['company']]) === 1);
    }

    private function addContactUnderCustomer($data)
    {
        $contactFields = $this->getContactFields();
        $this->ci->db->where('company', $data['company']);

        $existingCompany = $this->ci->db->get(db_prefix() . 'clients')->row();
        $tmpInsert       = [];

        foreach ($data as $key => $val) {
            foreach ($contactFields as $tmpContactField) {
                if (isset($data[$tmpContactField])) {
                    $tmpInsert[$tmpContactField] = $data[$tmpContactField];
                }
            }
        }
        $tmpInsert['donotsendwelcomeemail'] = true;

        if (isset($data['contact_phonenumber'])) {
            $tmpInsert['phonenumber'] = $data['contact_phonenumber'];
        }

        $this->ci->clients_model->add_contact($tmpInsert, $existingCompany->userid, true);
    }

    private function getContactFields()
    {
        return $this->ci->db->list_fields(db_prefix() . 'contacts');
    }

    private function isDuplicateContact($email)
    {
        return total_rows(db_prefix() . 'contacts', ['email' => $email]);
    }
    private function isDuplicatePhoneNumber($phone)
{
    return total_rows(db_prefix() . 'contacts', ['phonenumber' => $phone]);
}


    private function formatValuesForSimulation($values)
    {
        // ATM only country fields
        foreach ($this->countryFields as $country_field) {
            if (array_key_exists($country_field, $values)) {
                if (!empty($values[$country_field]) && is_numeric($values[$country_field])) {
                    $country = $this->getCountry(null, $values[$country_field]);
                    if ($country) {
                        $values[$country_field] = $country->short_name;
                    }
                }
            }
        }

        return $values;
    }

    private function getCountry($search = null, $id = null)
    {
        if ($search) {
            $searchSlug = slug_it($search);

            if (empty($search)) {
                return null;
            }

            if ($country = $this->ci->app_object_cache->get('import-country-search-' . $searchSlug)) {
                return $country;
            }

            $this->ci->db->where('iso2', $search);
            $this->ci->db->or_where('short_name', $search);
            $this->ci->db->or_where('long_name', $search);
        } else {
            if (empty($id)) {
                return null;
            }

            if ($country = $this->ci->app_object_cache->get('import-country-id-' . $id)) {
                return $country;
            }

            $this->ci->db->where('country_id', $id);
        }

        $country = $this->ci->db->get(db_prefix() . 'countries')->row();

        if ($search) {
            $this->ci->app_object_cache->add('import-country-search-' . $searchSlug, $country);
        } else {
            $this->ci->app_object_cache->add('import-country-id-' . $id, $country);
        }

        return $country;
    }
public function hasErrors()
{
    return !empty($this->importErrors);
}

    private function countryValue($value)
    {
        if ($value != '') {
            if (!is_numeric($value)) {
                $country = $this->getCountry($value);
                $value   = $country ? $country->country_id : 0;
            }
        } else {
            $value = 0;
        }

        return $value;
    }
}
