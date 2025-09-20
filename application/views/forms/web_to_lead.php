<?php
// ================= OCR HANDLER =================
if (isset($_GET['ocr']) && $_GET['ocr'] == '1') {
    if (empty($_FILES['image']['tmp_name'])) {
        echo json_encode(["error" => "No image uploaded"]);
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
    exit; // ⛔ Stop further HTML rendering
}
// =============== END OCR HANDLER ===============
?>


<!DOCTYPE html>
<html dir="<?php echo is_rtl(true) ? 'rtl' : 'ltr'; ?>">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1, maximum-scale=1">
    <title><?php echo e($form->name); ?></title>
    <?php app_external_form_header($form); ?>
    <?php hooks()->do_action('app_web_to_lead_form_head'); ?>
    <style>
    #form_submit:hover {
        background-color: <?php echo adjust_color_brightness($form->submit_btn_bg_color, -30) ?> !important;
    }
    </style>
</head>

<body class="web-to-lead <?php echo $form->form_key . ($this->input->get('styled') === '1' ? ' styled' : ''); ?>">
    <div class="container-fluid">
        <div class="row">
            <div
                class="<?php echo $this->input->get('col') ? $this->input->get('col') : ($this->input->get('styled') === '1' ? 'col-md-6 col-md-offset-3' : 'col-md-12'); ?>">
                <?php if ($this->input->get('with_logo')) { ?>
                <div class="text-center logo">
                    <?php get_dark_company_logo(); ?>
                </div>
                <?php } ?>
                 <button type="button" id="scanCardBtn" style="margin-bottom: 10px;">
    📷 Scan Card
</button>
<input type="file" accept="image/*" capture="environment" id="cardImageInput" style="display: none;">
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
                            <div class="text-left col-md-12 submit-btn-wrapper">
                                <button class="btn" id="form_submit" type="submit"
                                    style="color: <?php echo $form->submit_btn_text_color ?>;background-color: <?php echo $form->submit_btn_bg_color ?>;">
                                    <i class="fa fa-spinner fa-spin hide" style="margin-right: 2px;"></i>
                                    <?php echo e($form->submit_btn_name); ?></button>
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
        var form_id = '#<?php echo e($form->form_key); ?>';
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
});

document.getElementById('cardImageInput').addEventListener('change', function () {
    const file = this.files[0];
    if (!file) return;

    const formData = new FormData();
    formData.append('image', file);

    document.getElementById('loader').style.display = 'block';
    document.getElementById('scanCardBtn').disabled = true;

    const url = new URL(window.location.href);
    url.searchParams.set('ocr', '1');

    fetch(url, {
        method: 'POST',
        body: formData
    })
    .then(res => res.json())
    .then(data => {
        // Sometimes API returns JSON as string, parse safely
        if (typeof data === 'string') {
            try { data = JSON.parse(data); } catch (e) {
                console.error("Parse error:", e);
                return;
            }
        }

        console.log('OCR Data:', data);

// helper: get value with fallback for different key styles
function getVal(obj, keys) {
    for (let k of keys) {
        if (obj[k]) return obj[k];
    }
    return null;
}

// Full Name → firstname (Perfex)
const fullName = getVal(data, ["FullName", "Full Name", "name"]);
if (fullName) {
    const nameInput = document.querySelector('input[name="name"]');
    if (nameInput) nameInput.value = fullName;
}

// Phone
const phone = getVal(data, ["Phone", "phone"]);
if (phone) {
    const phoneInput = document.querySelector('input[name="phonenumber"]');
    if (phoneInput) phoneInput.value = phone;
}

// Email
const email = getVal(data, ["Email", "email"]);
if (email) {
    const emailInput = document.querySelector('input[name="email"]');
    if (emailInput) emailInput.value = email;
}

// Address
const address = getVal(data, ["Address", "address"]);
if (address) {
    const addressInput = document.querySelector('textarea[name="address"]');
    if (addressInput) addressInput.value = address;
}

// Company Name
const company = getVal(data, ["CompanyName", "Company Name", "company"]);
if (company) {
    const companyInput = document.querySelector('input[name="company"]');
    if (companyInput) companyInput.value = company;
}

// Job Title / Position → title (Perfex)
const designation = getVal(data, ["Designation", "Designation / Job Title", "position"]);
if (designation) {
    const positionInput = document.querySelector('input[name="title"]');
    if (positionInput) positionInput.value = designation;
}

// Website
const website = getVal(data, ["Website", "website"]);
if (website) {
    const websiteInput = document.querySelector('input[name="website"]');
    if (websiteInput) websiteInput.value = website;
}


/*     // Full Name → firstname (Perfex)
        if (data.name) {
            const nameInput = document.querySelector('input[name="firstname"]');
            if (nameInput) nameInput.value = data.name;
        }

        // Phone
        if (data.phone) {
            const phoneInput = document.querySelector('input[name="phonenumber"]');
            if (phoneInput) phoneInput.value = data.phone;
        }

        // Email
        if (data.email) {
            const emailInput = document.querySelector('input[name="email"]');
            if (emailInput) emailInput.value = data.email;
        }

        // Address
        if (data.address) {
            const addressInput = document.querySelector('textarea[name="address"]');
            if (addressInput) addressInput.value = data.address;
        }

        // Company Name
        if (data.company) {
            const companyInput = document.querySelector('input[name="company"]');
            if (companyInput) companyInput.value = data.company;
        }

        // Job Title / Position → title (Perfex)
        if (data.position) {
            const positionInput = document.querySelector('input[name="title"]');
            if (positionInput) positionInput.value = data.position;
        }

        // Website
        if (data.website) {
            const websiteInput = document.querySelector('input[name="website"]');
            if (websiteInput) websiteInput.value = data.website;
        }*/
    })
    .catch(err => {
        console.error("OCR Error:", err);
        alert('Not able to read your card properly. Please retry with a clearer photo.');
    })
    .finally(() => {
        document.getElementById('loader').style.display = 'none';
        document.getElementById('scanCardBtn').disabled = false;
    });
});
</script>




        <?php hooks()->do_action('app_web_to_lead_form_footer'); ?>
</body>

</html>