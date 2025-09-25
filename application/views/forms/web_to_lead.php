<?php
// ================= OCR HANDLER =================
$CI =& get_instance();
// $helpers_to_try = ['wnotication', 'wnotification', 'whatsapp', 'wn_whatsapp'];
// $found = null;

// // Find and load helper
// foreach ($helpers_to_try as $h) {
//     if (file_exists(APPPATH . 'helpers/' . $h . '_helper.php')) {
//         $found = $h;
//         break;
//     }
// }

// if ($found) {
//     log_message('info', "Loading helper: $found");
//     $CI->load->helper($found);
// } else {
//     log_message('error', "No helper file found. Checked: " . implode(', ', $helpers_to_try));
// }

// // Ensure phone and msg are set
// $phone = $_POST['phonenumber'] ?? $_POST['phone'] ?? '';
// $name  = $_POST['name'] ?? '';
// $msg   = $name ? "✅ Thanks $name, we received your enquiry successfully." : "✅ Thanks, we received your enquiry successfully.";


// if ($phone === '') {
//     log_message('error', "Phone number is empty. Cannot send WhatsApp.");
// } elseif (function_exists('wn_send_whatsapp_text')) {
//     log_message('info', "wn_send_whatsapp_text exists, sending message…");
//     $result = wn_send_whatsapp_text($phone, $msg);
//     log_message('info', "WhatsApp result: " . json_encode($result));
// } else {
//     log_message('error', "wn_send_whatsapp_text function not found");
// }


 // =============== HANDLE NORMAL FORM SUBMIT + WHATSAPP ===============
// if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_GET['ocr']) && !isset($_GET['whatsapp_test'])) {

//     $CI =& get_instance();

//     // Load your WhatsApp helper dynamically
//     $helpers_to_try = ['wnotication', 'wnotification', 'whatsapp', 'wn_whatsapp'];
//     $found = null;
//     foreach ($helpers_to_try as $h) {
//         if (file_exists(APPPATH . 'helpers/' . $h . '_helper.php')) {
//             $found = $h;
//             break;
//         }
//     }

//     if ($found) {
//         $CI->load->helper($found);
//         log_message('info', "WhatsApp helper loaded: {$found}");
//     } else {
//         log_message('error', "No WhatsApp helper found. Checked: " . implode(', ', $helpers_to_try));
//     }

//     // Get phone & name from posted form fields
//     $phone = $_POST['phonenumber'] ?? '';
//     $name  = $_POST['name'] ?? '';

//     log_message('info', "Form submission detected. Phone: '{$phone}', Name: '{$name}', Helper loaded: " . ($found ?? 'none'));

//     if ($phone === '') {
//         log_message('error', "Phone number missing in POST data.");
//     }

//     if (function_exists('wn_send_whatsapp_text')) {
//         log_message('info', "wn_send_whatsapp_text() function exists, attempting to send WhatsApp.");

//         $msg = "✅ Thanks $name, we received your enquiry successfully.";

//         // Log before sending
//         log_message('info', "Attempting to send WhatsApp to {$phone}: {$msg}");

//         $result = wn_send_whatsapp_text($phone, $msg);

//         // Log the result
//         if ($result['success']) {
//             log_message('info', "WhatsApp sent successfully to {$phone}. Response: " . json_encode($result['response']));
//         } else {
//             log_message('error', "WhatsApp failed to {$phone}. Error: " . ($result['error'] ?? 'Unknown') . "; Response: " . json_encode($result['response']));
//         }
//     } else {
//         log_message('error', "wn_send_whatsapp_text() function does not exist. Helper loaded: " . ($found ?? 'none'));
//     }

//     // Continue normal lead-processing or JSON response if needed
// }


// list helper basenames you *might* have (update to the names you expect)
// $helpers_to_try = ['wnotication', 'wnotification', 'whatsapp', 'wn_whatsapp'];

// $found = null;
// foreach ($helpers_to_try as $h) {
//     if (file_exists(APPPATH . 'helpers/' . $h . '_helper.php')) {
//         $found = $h;
//         break;
//     }
// }

// if (isset($_GET['whatsapp_test']) && $_GET['whatsapp_test'] === '1') {
//     if ($found === null) {
//         header('Content-Type: application/json; charset=utf-8', true, 500);
//         echo json_encode([
//             'success' => false,
//             'error' => 'No helper file found.',
//             'helpers_checked' => $helpers_to_try,
//             'hint' => 'Place your helper file in application/helpers/ or update $helpers_to_try with the correct basename.'
//         ]);
//         exit;
//     }

//     // load the actual helper
//     $CI->load->helper($found);

//     if (!function_exists('wn_send_whatsapp_text')) {
//         header('Content-Type: application/json; charset=utf-8', true, 500);
//         echo json_encode([
//             'success' => false,
//             'error' => "Helper loaded ({$found}) but function wn_send_whatsapp_text() was not found.",
//             'loaded_helper' => $found
//         ]);
//         exit;
//     }

//     // Call function
//     $phone = '918233081931';
//     $message = "✅ Test WhatsApp message\nWe received your query successfully.";
//     $result = wn_send_whatsapp_text($phone, $message);

//     header('Content-Type: application/json; charset=utf-8');
//     echo json_encode($result);
//     exit;
// }



if (isset($_GET['ocr']) && $_GET['ocr'] == '1') {
    // log_message('info', '$_FILES dump: ' . print_r($_FILES, true));

    if (!isset($_FILES['image'])) {
        echo json_encode(["error" => "No file field found in upload"]);
        exit;
    }

    $fileError = $_FILES['image']['error'];
    $fileName  = $_FILES['image']['name'];
    $fileSize  = $_FILES['image']['size'];

    // Map PHP upload errors
    $uploadErrors = [
        UPLOAD_ERR_OK         => null,
        UPLOAD_ERR_INI_SIZE   => "The uploaded file exceeds the server's maximum allowed size.",
        UPLOAD_ERR_FORM_SIZE  => "The uploaded file exceeds the form's maximum allowed size.",
        UPLOAD_ERR_PARTIAL    => "The uploaded file was only partially uploaded.",
        UPLOAD_ERR_NO_FILE    => "No file was uploaded.",
        UPLOAD_ERR_NO_TMP_DIR => "Missing a temporary folder on the server.",
        UPLOAD_ERR_CANT_WRITE => "Failed to write file to disk.",
        UPLOAD_ERR_EXTENSION  => "A PHP extension stopped the file upload."
    ];

    if ($fileError !== UPLOAD_ERR_OK) {
        echo json_encode([
            "error" => $uploadErrors[$fileError] ?? "Unknown upload error",
            "file_name" => $fileName,
            "file_size" => $fileSize,
            "error_code" => $fileError
        ]);
        exit;
    }

    if (empty($_FILES['image']['tmp_name'])) {
        echo json_encode([
            "error" => "No temporary file available",
            "file_name" => $fileName,
            "file_size" => $fileSize
        ]);
        exit;
    }
    // Mistral API config
    $MISTRAL_API_KEY = "bgh3XFDOvgfGGHgzBFizJIZyfxkUL6Nl";
    $MISTRAL_API_URL = "https://api.mistral.ai/v1/chat/completions";

    // Read uploaded file
    $image_data = base64_encode(file_get_contents($_FILES['image']['tmp_name']));
    $image_base64 = "data:image/png;base64," . $image_data;

    // Payload
    $payload = [
        "model" => "pixtral-12b-2409",
        "messages" => [
            [
                "role" => "system",
                "content" => "You are a professional business card parser. Always return structured JSON."
            ],
            [
                "role" => "user",
                "content" => [
                    [
                        "type" => "text",
                        "text" => "Extract the following fields from this business card image with high accuracy:
- FullName
- CompanyName
- Designation / JobTitle
- Phone
- Email
- Website
- Address

Return JSON only. If a field is missing, use null."
                    ],
                    [
                        "type" => "image_url",
                        "image_url" => $image_base64
                    ]
                ]
            ]
        ],
        "temperature" => 0.2
    ];

    // Call API
    $ch = curl_init($MISTRAL_API_URL);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Authorization: Bearer " . $MISTRAL_API_KEY,
        "Content-Type: application/json"
    ]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
    $response = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($http_code == 200) {
        $result = json_decode($response, true);
        $content = $result["choices"][0]["message"]["content"];

        // Handle text content
        if (is_string($content)) {
            $structured_data = $content;
        } else {
            $structured_data = "";
            foreach ($content as $c) {
                $structured_data .= $c["text"] ?? "";
            }
        }

        // 🔹 Clean markdown fences like ```json ... ```
        $structured_data = preg_replace('/^```(?:json)?|```$/m', '', trim($structured_data));

        // Decode clean JSON
        $parsed_json = json_decode($structured_data, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            $parsed_json = [
                "error" => "Invalid JSON returned",
                "raw"   => $structured_data
            ];
        }

        echo json_encode($parsed_json);
    } else {
        echo json_encode([
            "error" => "OCR failed",
            "status" => $http_code,
            "response" => $response
        ]);
    }
    exit; //  Stop further HTML rendering
}




// =============== END OCR HANDLER ===============
?>


<!DOCTYPE html>
<html dir="<?php echo is_rtl(true) ? 'rtl' : 'ltr'; ?>">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
    <title><?php echo ($form->name); ?></title>
    <?php app_external_form_header($form); ?>
    <?php hooks()->do_action('app_web_to_lead_form_head'); ?>
    <style>
    #form_submit:hover {
        background-color: <?php echo adjust_color_brightness($form->submit_btn_bg_color, -30) ?> !important;
    }
    /* skeleton shimmer style */
.shimmer {
  position: relative;
  background: #f6f7f8;
  background-image: linear-gradient(90deg, #f6f7f8 0px, #edeef1 40px, #f6f7f8 80px);
  background-size: 600px;
  animation: shimmer 1.2s infinite linear;
  /* removed color: transparent */
}

@keyframes shimmer {
  0% { background-position: -600px 0; }
  100% { background-position: 600px 0; }
}
/* Scan Card button with your theme colors */
.scan-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 10px 18px;
  font-size: 16px;
  font-weight: 600;
  color: #fff;
  background: linear-gradient(135deg, #002A46, #39c529);
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
}

.scan-btn:hover {
  background: linear-gradient(135deg, #00375f, #45d935); /* slightly lighter on hover */
  transform: translateY(-1px);
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
}

.scan-btn:active {
  transform: translateY(0);
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
}

.scan-btn:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

body.styled .form-col{
    margin-top: 20px;
}

    </style>
</head>

<body class="web-to-lead <?php echo $form->form_key . ($this->input->get('styled') === '1' ? ' styled' : ''); ?>">
    <div class="container-fluid">
        <div class="row">
            <div
                class="<?php echo $this->input->get('col') ? $this->input->get('col') : ($this->input->get('styled') === '1' ? 'col-md-6 col-md-offset-3' : 'col-md-12'); ?>">
                <?php if ($this->input->get('with_logo')) { ?>
                <div class="text-center " >
                    <!-- <?php get_dark_company_logo(); ?> -->
<img style="max-width:300px"; src="<?php echo base_url('assets/images/Dotonecrm3.png'); ?>" alt="">
                </div>
                <?php } ?>
       <button type="button" id="scanCardBtn" class="scan-btn">
  📷 Scan Card
</button>

<input type="file"  name="image"  accept="image/*" capture="environment" id="cardImageInput" style="display: none;">
<!-- Loader -->
<div id="loader" style="display: none; margin: 10px 0;">🔄 Processing...</div>

                <div class="form-col">
                    <div id="response"></div>
                    <?php echo form_open_multipart($this->uri->uri_string(), ['id' => $form->form_key, 'class' => 'disable-on-submit']); ?>
                    <?php hooks()->do_action('web_to_lead_form_start'); ?>
                    <?php echo form_hidden('key', $form->form_key); ?>
                    <div class="row [&_p]:tw-mb-5">
                        <?php foreach ($form_fields as $field) {
    render_form_builder_field($field);
} ?>
                        <?php if (show_recaptcha() && $form->recaptcha == 1) { ?>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="g-recaptcha" data-sitekey="<?php echo get_option('recaptcha_site_key'); ?>">
                                </div>
                                <div id="recaptcha_response_field" class="text-danger"></div>
                            </div>
                            <?php } ?>
                            <?php if (is_gdpr() && get_option('gdpr_enable_terms_and_conditions_lead_form') == 1) { ?>
                            <div class="col-md-12">
                                <div class="checkbox chk">
                                    <input type="checkbox" name="accept_terms_and_conditions" required="true"
                                        id="accept_terms_and_conditions"
                                        <?php echo set_checkbox('accept_terms_and_conditions', 'on'); ?>>
                                    <label for="accept_terms_and_conditions">
                                        <?php echo _l('gdpr_terms_agree', terms_url()); ?>
                                    </label>
                                </div>
                            </div>
                            <?php } ?>
                            <div class="clearfix"></div>
                <div class="col-md-12 submit-btn-wrapper" 
     style="display:flex; justify-content:space-between; align-items:center;">
  
  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#reminderModal">
    <i class="fa-regular fa-bell"></i> Set Reminder
  </button>        
  
  <button class="btn" id="form_submit" type="submit"
          style="color: <?php echo $form->submit_btn_text_color ?>;
                 background-color:#39c529;">
    <i class="fa fa-spinner fa-spin hide" style="margin-right: 2px;"></i>
    <?php echo ($form->submit_btn_name); ?>
  </button>
  
</div>

                        </div>
                        
                        <div class="modal fade" id="reminderModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Set Reminder</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <!-- hidden rel_type, leave rel_id empty -->
        <input type="hidden" name="rel_type" value="lead">
        <?php echo render_datetime_input('reminder_date','set_reminder_date','',array('data-date-min-date'=>_d(date('Y-m-d')))); ?>
        <?php echo render_select('reminder_staff',$members,array('staffid',array('firstname','lastname')),'reminder_set_to',get_staff_user_id()); ?>
        <?php echo render_textarea('reminder_description','reminder_description'); ?>
        <?php if(is_email_template_active('reminder-email-staff')) { ?>
  <div class="form-group">
    <div class="checkbox checkbox-primary">
      <input type="checkbox" name="notify_by_email" id="notify_by_email">
      <label for="notify_by_email"><?php echo _l('reminder_notify_me_by_email'); ?></label>
    </div>
  </div>
<?php } ?>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Save</button>
      </div>
    </div>
  </div>
</div>

                        <?php hooks()->do_action('web_to_lead_form_end'); ?>
                        <?php echo form_close(); ?>
                    </div>
                </div>
            </div>
        </div>
     

        <?php app_external_form_footer($form); ?>
        <script>
        var form_id = '#<?php echo ($form->form_key); ?>';
        var form_redirect_url = '<?php echo $form->submit_action == 1 ? $form->submit_redirect_url : 0; ?>';
        $(function() {
            $(form_id).appFormValidator({

                onSubmit: function(form) {

                    $("input[type=file]").each(function() {
                        if ($(this).val() === "") {
                            $(this).prop('disabled', true);
                        }
                    });
                    $('#form_submit .fa-spin').removeClass('hide');
                    // Add shimmer to all inputs/textareas/selects (excluding hidden/file/disabled)
const formEls = $(form).find('input, textarea, select').not('[type=hidden],[type=file]:disabled');
formEls.addClass('shimmer');


                    var formURL = $(form).attr("action");
                    var formData = new FormData($(form)[0]);

                    $.ajax({
                        type: $(form).attr('method'),
                        data: formData,
                        mimeType: $(form).attr('enctype'),
                        contentType: false,
                        cache: false,
                        processData: false,
                        url: formURL
                    }).always(function() {
                        $('#form_submit').prop('disabled', false);
                        $('#form_submit .fa-spin').addClass('hide');
                        formEls.removeClass('shimmer');

                    }).done(function(response) {
                        response = JSON.parse(response);
                        if (form_redirect_url !== '0') {
                            if (window.top) {
                                window.top.location.href = form_redirect_url;
                            } else {
                                window.location.href = form_redirect_url;
                            }
                            return;
                        } else if (response.redirect_url) {
                            // In case action hook is used to redirect
                            if (window.top) {
                                window.top.location.href = response.redirect_url;
                            } else {
                                window.location.href = response.redirect_url;
                            }
                            return;
                        }
                        if (response.success == false) {
                            $('#recaptcha_response_field').html(response
                                .message); // error message
                        } else if (response.success == true) {
                            $(form_id).remove();
                            $('#response').html('<div class="alert alert-success">' +
                                response.message + '</div>');
                            $('html,body').animate({
                                scrollTop: $("#online_payment_form").offset().top
                            }, 'slow');
                        } else {
                            $('#response').html("<?php echo _l('something_went_wrong'); ?>");
                        }
                        if (typeof(grecaptcha) != 'undefined') {
                            grecaptcha.reset();
                        }
                    }).fail(function(data) {
                        if (typeof(grecaptcha) != 'undefined') {
                            grecaptcha.reset();
                        }
                        if (data.status == 422) {
                            $('#response').html(
                                '<div class="alert alert-danger">Some fields that are required are not filled properly.</div>'
                            );
                        } else {
                            $('#response').html(data.responseText);
                        }
                    });
                    return false;
                }
            });
        });
        </script>
      <script>
document.getElementById('scanCardBtn').addEventListener('click', function () {
   document.getElementById('cardImageInput').click();
  /* var url = window.location.origin + window.location.pathname + '?whatsapp_test=1';

    fetch(url, { cache: 'no-store' })
        .then(res => res.text())
        .then(txt => {
            try {
                var data = JSON.parse(txt);
                console.log('WhatsApp test JSON response:', data);
                alert('WhatsApp test response: ' + JSON.stringify(data));
            } catch (e) {
                console.error('Raw non-JSON response:', txt);
                // show snippet for debugging
                alert('Not JSON — check console. Raw starts:\n' + txt.slice(0, 1200));
            }
        })
        .catch(err => {
            console.error('Fetch failed:', err);
            alert('Fetch failed: ' + err.message);
        });
   
   
   */
   
   
   // document.getElementById('cardImageInput').click();
});

// document.getElementById('cardImageInput').addEventListener('change', function () {
//     const file = this.files[0];
//     if (!file) return;

//     const formData = new FormData();
//     formData.append('image', file);
    

//     document.getElementById('loader').style.display = 'block';
//     document.getElementById('scanCardBtn').disabled = true;

//     const url = new URL(window.location.href);
//     url.searchParams.set('ocr', '1');

//     fetch(url, {
//         method: 'POST',
//         body: formData
//     })
//     .then(res => res.json())
//     .then(data => {
//         // Sometimes API returns JSON as string, parse safely
//         if (typeof data === 'string') {
//             try { data = JSON.parse(data); } catch (e) {
//                 console.error("Parse error:", e);
//                 return;
//             }
//         }

//         console.log('OCR Data:', data);

//     // helper: get value with fallback for different key styles
//     function getVal(obj, keys) {
//         for (let k of keys) {
//             if (obj[k]) return obj[k];
//         }
//         return null;
//     }

//     // Full Name → firstname (Perfex)
//     const fullName = getVal(data, ["FullName", "Full Name", "name"]);
//     if (fullName) {
//         const nameInput = document.querySelector('input[name="name"]');
//         if (nameInput) nameInput.value = fullName;
//     }

//     // Phone
//     const phone = getVal(data, ["Phone", "phone"]);
//     if (phone) {
//         const phoneInput = document.querySelector('input[name="phonenumber"]');
//         if (phoneInput) phoneInput.value = phone;
//     }

//     // Email
//     const email = getVal(data, ["Email", "email"]);
//     if (email) {
//         const emailInput = document.querySelector('input[name="email"]');
//         if (emailInput) emailInput.value = email;
//     }

//     // Address
//     const address = getVal(data, ["Address", "address"]);
//     if (address) {
//         const addressInput = document.querySelector('textarea[name="address"]');
//         if (addressInput) addressInput.value = address;
//     }

//     // Company Name
//     const company = getVal(data, ["CompanyName", "Company Name", "company"]);
//     if (company) {
//         const companyInput = document.querySelector('input[name="company"]');
//         if (companyInput) companyInput.value = company;
//     }

//     // Job Title / Position → title (Perfex)
//     const designation = getVal(data, ["Designation", "Designation / Job Title", "position"]);
//     if (designation) {
//         const positionInput = document.querySelector('input[name="title"]');
//         if (positionInput) positionInput.value = designation;
//     }

//     // Website
//     const website = getVal(data, ["Website", "website"]);
//     if (website) {
//         const websiteInput = document.querySelector('input[name="website"]');
//         if (websiteInput) websiteInput.value = website;
//     }


//     })
//     .catch(err => {
//         console.error("OCR Error:", err);
//         alert('Not able to read your card properly. Please retry with a clearer photo.');
//     })
//     .finally(() => {
//         document.getElementById('loader').style.display = 'none';
//         document.getElementById('scanCardBtn').disabled = false;
//     });
// });



document.getElementById('cardImageInput').addEventListener('change', function () {
    const file = this.files[0];
    console.log(" Selected file:", file);

    if (!file) {
        console.warn(" No file selected");
        return;
    }

    // Resize/compress image
    const reader = new FileReader();
    reader.onload = function(event) {
        const img = new Image();
        img.onload = function() {
            const canvas = document.createElement('canvas');
            const maxWidth = 1024;
            const maxHeight = 1024;
            let width = img.width;
            let height = img.height;

            if (width > height) {
                if (width > maxWidth) {
                    height *= maxWidth / width;
                    width = maxWidth;
                }
            } else {
                if (height > maxHeight) {
                    width *= maxHeight / height;
                    height = maxHeight;
                }
            }

            canvas.width = width;
            canvas.height = height;
            const ctx = canvas.getContext('2d');
            ctx.drawImage(img, 0, 0, width, height);

            canvas.toBlob(function(blob) {
                const formData = new FormData();
                formData.append('image', blob, file.name);

                console.log(" FormData appended:", formData.get('image'));

                document.getElementById('loader').style.display = 'block';
                document.getElementById('scanCardBtn').disabled = true;
// get the form ID from PHP
const formId = '<?php echo addslashes($form->form_key); ?>';
// escape it for CSS selector
const formSelector = '#' + CSS.escape(formId);

// then safely select inputs & textareas
const formEls = document.querySelectorAll(formSelector + ' input, ' + formSelector + ' textarea');


formEls.forEach(el => {
  if (el.type !== 'hidden' && el.type !== 'file' && !el.disabled) {
    el.classList.add('shimmer');
  }
});


                const url = new URL(window.location.href);
                url.searchParams.set('ocr', '1');
                console.log(" Sending fetch POST request to:", url.toString());

                fetch(url, {
                    method: 'POST',
                    body: formData
                })
                .then(res => res.json())
                .then(data => {
                    console.log(" Raw OCR Data received:", data);

                    function getVal(obj, keys) {
                        for (let k of keys) {
                            if (obj[k]) return obj[k];
                        }
                        return null;
                    }

                    // Perfex field assignment (safe now)
                    const fullName = getVal(data, ["FullName", "Full Name", "name"]);
                    const nameInput = document.querySelector('input[name="name"]');
                    if (nameInput && fullName) nameInput.value = fullName;

                    const phone = getVal(data, ["Phone", "phone"]);
                    const phoneInput = document.querySelector('input[name="phonenumber"]');
                    if (phoneInput && phone) phoneInput.value = phone;

                    const email = getVal(data, ["Email", "email"]);
                    const emailInput = document.querySelector('input[name="email"]');
                    if (emailInput && email) emailInput.value = email;

                    const address = getVal(data, ["Address", "address"]);
                    const addressInput = document.querySelector('textarea[name="address"]');
                    if (addressInput && address) addressInput.value = address;

                    const company = getVal(data, ["CompanyName", "Company Name", "company"]);
                    const companyInput = document.querySelector('input[name="company"]');
                    if (companyInput && company) companyInput.value = company;

                    const designation = getVal(data, ["Designation", "Designation / Job Title", "position"]);
                    const positionInput = document.querySelector('input[name="title"]');
                    if (positionInput && designation) positionInput.value = designation;

                    const website = getVal(data, ["Website", "website"]);
                    const websiteInput = document.querySelector('input[name="website"]');
                    if (websiteInput && website) websiteInput.value = website;

                })
                .catch(err => {
                    console.error(" OCR Error:", err);
                    alert('Not able to read your card properly. Please retry with a clearer photo.');
                })
                .finally(() => {
                    document.getElementById('loader').style.display = 'none';
                    document.getElementById('scanCardBtn').disabled = false;
                     formEls.forEach(el => el.classList.remove('shimmer'));
                });

            }, 'image/jpeg', 0.7); // compress 70%
        };
        img.src = event.target.result;
    };
    reader.readAsDataURL(file);
});

</script>



<?php if ($this->session->flashdata('form_error')): ?>
    <div class="alert alert-danger">
        <?= $this->session->flashdata('form_error'); ?>
    </div>
<?php endif; ?>



        <?php hooks()->do_action('app_web_to_lead_form_footer'); ?>
</body>

</html>