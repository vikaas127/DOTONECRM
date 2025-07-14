<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>

<style>
    header,footer{
        display: none  !important;
    }
    div#wrapper {
    margin: 0px !important;
    padding: 0px !important;
}
div#wrapper div#content {
    padding: 0;
}
    .header{
        display: none;
    }

    .company-logo {
        max-width: 200px;
        margin: 0 auto;
        padding: 15px 10px;
    }
    .login-form h1 {
        margin-top: 0;
        font-family: 'Poppins';
        margin-bottom: 15px;
        font-size: 20px;
    }


    .login-form .panel-body label{
        font-weight: 300;
        font-family: 'Poppins';
    }
    .login-form .panel-body input, .login-form .panel-body select{
        outline: none !important;
        box-shadow: none !important;
    }
    .login-form .panel-body input:focus, .login-form .panel-body select:focus {
        border-color: #cbd5e1 !important
    }
    .login-form .panel-body a {
        color: #39c529;
        font-family: 'Poppins';
    }
    .login-form .panel-body .checkbox{
        margin: 0;
    }
    .login-form .panel-body .checkbox label {
        font-weight: 300;
        font-family: 'Poppins';
    }

    .tab-buttons {
        display: flex;
        border-bottom: 1px solid #61ce70;
        margin-bottom: 15px;
        gap: 5px;
    }
    .tab-buttons a {
        font-weight: 500;
        width: 50%;
        display: inline-block;
        padding: 10px 15px;
        text-align: center;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .tab-buttons a.active, .tab-buttons a:hover {
        background: #39c529;
        color: #fff;
    }

img{
    display: block;
}

    .carousel, .carousel-inner{
        display: flex
    }

    footer{
        margin-top: 0
    }

    .align-items-center{
        align-items: center
    }
    .outer-body {
    position: relative;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background-color: #002A46;
    padding: 30px 20px;
    z-index: 1;
}

#particles-js {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 2;
        }

.inner-body {
    position: relative;
    z-index: 2;
    width: 100%;
    max-width: 1100px;
    background: #fff;
    border-radius: 10px !important;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}






.slides img{
border-top-right-radius: 10px;
border-bottom-right-radius: 10px;
}


.left-box{
    padding: 30px;
}
.right-box{
    border-left: 1px solid #cbd5e1;
    padding:0;
    display: block;
    

}
.top_logo{
    margin-bottom: 30px;
}

.top_logo img{
    width:100%;
    max-width: 200px;


}
.btn-success{
    background-color: #3ead3c !important;
}

input[type="radio"]:checked + label:after,
input[type="checkbox"]:checked + label:after,
.radio-primary input[type=radio] + label::after{
    background-color: #3ead3c !important;
}

body .dataTables_length select:focus, body .uneditable-input:focus, body input[type=color]:focus, body input[type=date]:focus, body input[type=datetime-local]:focus, body input[type=datetime]:focus, body input[type=email]:focus, body input[type=file]:focus, body input[type=month]:focus, body input[type=number]:focus, body input[type=password]:focus, body input[type=search]:focus, body input[type=tel]:focus, body input[type=text]:focus, body input[type=time]:focus, body input[type=url]:focus, body input[type=week]:focus, body select.form-control:focus, body textarea.form-control:focus ,
.btn-default.active, .btn-default.active.focus, .btn-default.active:focus, .btn-default.active:hover, .btn-default:active, .btn-default:active.focus, .btn-default:active:focus, .btn-default:active:hover, .open>.dropdown-toggle.btn-default, .open>.dropdown-toggle.btn-default.focus, .open>.dropdown-toggle.btn-default:focus, .open>.dropdown-toggle.btn-default:hover,

input.form-control:focus, input[type=color]:focus, input[type=date]:focus, input[type=datetime-local]:focus, input[type=datetime]:focus, input[type=email]:focus, input[type=file]:focus, input[type=month]:focus, input[type=number]:focus, input[type=password]:focus, input[type=search]:focus, input[type=tel]:focus, input[type=text]:focus, input[type=time]:focus, input[type=url]:focus, input[type=week]:focus, select.form-control:focus, textarea.form-control:focus {
    border-color: 1px solid #002a46 !important;
    box-shadow: 0 0 3px #002A46;
}


.inner-body{
    display: flex;
    
}
.right-box, .left-box{}

.right-box img {
  height: 100%;
  width: 100%;
  object-fit: cover;
}



.left-box {
    padding: 30px;
}

.right-box{
    background: #002A46;

}










@media screen and (max-width: 768px)  {
    .right-box{
        display: none;
    }

    .outer-body{
        padding-left: 20px;
        padding-right: 20px;
    }
}
</style>

<div class="outer-body">
<div id="particles-js"></div>

     <div class="top_logo" >
        <img  src="<?php echo base_url('assets/images/tbd_white_logo.png'); ?>" alt="white_logo">
     </div>

    <div class="inner-body row">
            <div class="col-lg-7 left-box">
                <!-- <div class="company-logo ">
                    <?php get_dark_company_logo(); ?>
                </div> -->
                
                <div class="login-form">
                    
                    <?php echo form_open('authentication/register', ['id' => 'register-form']); ?>
                   
                            <div class="row">
                                <div class="col-sm-8">
                                    <h1 class="tw-font-semibold register-heading">
                                        <?php echo _l('clients_register_heading'); ?>
                                    </h1>
                                </div>
                                <div class="col-sm-4">
                                    <?php if (!is_language_disabled()) { ?>
                                        <div class="form-group">
                                            <select name="language" id="language" class="form-control selectpicker"
                                                onchange="change_contact_language(this)"
                                                data-none-selected-text="<?php echo _l('dropdown_non_selected_tex'); ?>" data-live-search="true">
                                                <?php $selected = (get_contact_language() != '') ? get_contact_language() : get_option('active_language'); ?>
                                                <?php foreach ($this->app->get_available_languages() as $availableLanguage) { ?>
                                                <option value="<?php echo ($availableLanguage); ?>"
                                                    <?php echo ($availableLanguage == $selected) ? 'selected' : '' ?>>
                                                    <?php echo (ucfirst($availableLanguage)); ?>
                                                </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="row">
                            
                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
                               
                                <div class="col-md-6 ">
                                  
    <?php if (get_option('company_requires_vat_number_field') == 1) { ?>
        <div class="form-group mtop15 register-vat-group">
            <label class="control-label" for="vat">
                <?php if ($requiredFields['company']['company_vat']['is_required']) { ?>
                    <span class="text-danger">*</span>
                <?php } ?>
                <?php echo _l('clients_vat'); ?>
            </label>
            <div style="position: relative;">
                <input type="text" class="form-control" name="vat" id="vat"
                       value="<?php echo set_value('vat'); ?>" maxlength="15"
                       oninput="checkGSTLength(this.value)" autocomplete="off">
                <span id="vat-verified-icon" style="position:absolute; top: 50%; right: 10px; transform: translateY(-50%); display: none;">
                    <img src="https://cdn-icons-png.flaticon.com/512/845/845646.png" alt="Verified" width="16" height="16">
                </span>
            </div>
            <small id="gstn-info" class="text-success" style="display: none; margin-top: 4px;"></small>
            <?php echo form_error('vat'); ?>
        </div>
    <?php } ?>
                             <!--     <?php if (get_option('company_requires_vat_number_field') == 1) { ?>
                                        <div class="form-group mtop15 register-vat-group">
                                            <label class="control-label" for="vat">
                                                <?php if ($requiredFields['company']['company_vat']['is_required']) { ?>
                                                    <span class="text-danger">*</span>
                                                <?php } ?>
                                                <?php echo _l('clients_vat'); ?>
                                            </label>
                                            <div style="display: flex; align-items: center;">
                                                <input   type="text" class="form-control" name="vat" id="vat"
                                                    value="<?php echo set_value('vat'); ?>" maxlength="15"
                                                    oninput="toggleVerifyButton()">
                                                
                                                
                                                
                                            </div>
                                            <?php echo form_error('vat'); ?>
                                        </div>
                                    <?php } ?> -->

</div>  
 <div class="col-md-6">
     <div class="form-group mtop15 register-company-group">
             <label class="control-label" for="<?php echo ($fields['company']); ?>">
                 <?php if (get_option('company_is_required') == 1) { ?>
                 <span class="text-danger">*</span>
                 <?php } ?>
                 <?php echo _l('clients_company'); ?>
             </label>
             <input type="text" class="form-control" name="<?php echo ($fields['company']); ?>"
                 id="<?php echo ($fields['company']); ?>" value="<?php echo set_value($fields['company']); ?>">
             <?php echo form_error($fields['company']); ?>
         </div>
 </div>
</div>


<div class="row">


                                <div class="col-md-6">
                                    <!-- <h4 class="bold register-contact-info-heading"><?php // echo _l('client_register_contact_info'); ?>
                                    </h4> -->
                                    <div class="form-group  register-firstname-group">
                                        <label class="control-label" for="<?php echo ($fields['firstname']); ?>">
                                            <span class="text-danger">*</span> <?php echo _l('clients_firstname'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="<?php echo ($fields['firstname']); ?>"
                                            id="<?php echo ($fields['firstname']); ?>"
                                            value="<?php echo set_value($fields['firstname']); ?>">
                                        <?php echo form_error($fields['firstname']); ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group register-lastname-group">
                                        <label class="control-label" for="<?php echo ($fields['lastname']); ?>"><span
                                                class="text-danger">*</span> <?php echo _l('clients_lastname'); ?></label>
                                        <input type="text" class="form-control" name="<?php echo ($fields['lastname']); ?>"
                                            id="<?php echo ($fields['lastname']); ?>"
                                            value="<?php echo set_value($fields['lastname']); ?>">
                                        <?php echo form_error($fields['lastname']); ?>
                                    </div>
                                </div>
                                </div>
                                <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group register-email-group">
                                        <label class="control-label" for="<?php echo ($fields['email']); ?>"><span
                                                class="text-danger">*</span> <?php echo _l('clients_email'); ?></label>
                                        <input type="email" class="form-control" name="<?php echo ($fields['email']); ?>"
                                            id="<?php echo ($fields['email']); ?>" value="<?php echo set_value($fields['email']); ?>">
                                        <?php echo form_error($fields['email']); ?>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group register-contact-phone-group">
                                        <label class="control-label"
                                            for="contact_phonenumber">
                                            <?php if($requiredFields['contact']['contact_contact_phonenumber']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('clients_phone'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="contact_phonenumber" id="contact_phonenumber"
                                            value="<?php echo set_value('contact_phonenumber'); ?>">
                                        <?php echo form_error('contact_phonenumber'); ?>
                                    </div>
                                </div>
                                </div>
                                <div class="row">
                                <div class="col-md-6">
                                <div class="form-group  register-continue_from_date-group ">
                                    <label class="control-label" for="continue_from_date">
                                        <span class="text-danger">*</span> <?php echo _l('continue_from_date'); ?>
                                    </label>
                             

                                    <input type="text" class="form-control datepicker" 
                                        name="continue_from_date"
                                        id="continue_from_date"
                                        value="<?php echo set_value('continue_from_date'); ?>">
                                    <?php echo form_error('continue_from_date'); ?>
                                </div>
                          
                                </div>
                                <div class="col-md-6">
                                <div class="form-group register-country-group">
                                        <label class="control-label" for="lastname">
                                            <?php if($requiredFields['company']['company_country']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('clients_country'); ?>
                                        </label>
                                        <select data-none-selected-text="<?php echo _l('dropdown_non_selected_tex'); ?>"
                                            data-live-search="true" name="country" class="form-control" id="country">
                                            <option value=""></option>
                                            <?php foreach (get_all_countries() as $country) { ?>
                                            <option value="<?php echo ($country['country_id']); ?>" <?php if (get_option('customer_default_country') == $country['country_id']) {
                                                echo ' selected';
                                            } ?> <?php echo set_select('country', $country['country_id']); ?>><?php echo ($country['short_name']); ?></option>
                                            <?php } ?>
                                        </select>
                                        <?php echo form_error('country'); ?>
                                    </div>
                                </div>
                                </div>
                                    <!-- <div class="form-group register-website-group">
                                        <label class="control-label" for="website">
                                            <?php if($requiredFields['contact']['contact_website']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('client_website'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="website" id="website"
                                            value="<?php echo set_value('website'); ?>">
                                        <?php echo form_error('website'); ?>
                                    </div> -->
                                    <!-- <div class="form-group register-position-group">
                                        <label class="control-label" for="title">
                                      
                                        <?php if($requiredFields['contact']['contact_title']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('contact_position'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="title" id="title"
                                            value="<?php echo set_value('title'); ?>">
                                        <?php echo form_error('title'); ?>
                                    </div> -->
                                    <div class="row">
                                <div class="col-md-6">
                                       <?php
                                        $sectors = [
                                            "Manufacturing",
                                            "Retail",
                                            "Trading",
                                            "Service",
                                            "Projects",
                                            "Other"
                                        ];
                                        ?>

                                       <div class="form-group register-sector-group">
    <label class="control-label" for="sector">
        <?php if ($requiredFields['company']['sector']['is_required']) { ?>
            <span class="text-danger">*</span>
        <?php } ?>
        <?php echo _l('sector'); ?>
    </label>

    <select 
        id="sector"
        name="sector"
        class="form-control"
        data-live-search="true"
        data-none-selected-text="<?php echo _l('dropdown_non_selected_tex'); ?>"
        <?php if (!empty($requiredFields['company']['sector']['disabled']) && $requiredFields['company']['sector']['disabled']) { ?>
            disabled
        <?php } ?>
    >
        <option value=""></option>
        <?php foreach ($sectors as $sector): 
            $formatted_value = strtolower(str_replace([' ', '&', ',', '/'], ['_', '', '', ''], $sector));
        ?>
            <option value="<?php echo $formatted_value; ?>" <?php echo set_select('sector', $formatted_value); ?>>
                <?php echo $sector; ?>
            </option>
        <?php endforeach; ?>
    </select>

    <?php echo form_error('sector'); ?>
</div>

                                </div>
                                

                                <div class="col-md-6">
                                                    <?php
                                        $industries = [
                                            "Agriculture and Farming",
                                            "Apparel and Garments",
                                            "Automotive, Parts & Spares",
                                            "Building and Construction",
                                            "Chemicals and Solvents",
                                            "Cosmetics and Personal care",
                                            "Drugs and Medical",
                                            "Electrical and Electronics",
                                            "Fashion Accessories & Supplies",
                                            "FMCG",
                                            "Food and Beverage",
                                            "Furniture & Supplies",
                                            "Gems, Jewellery & Astrology",
                                            "Handicrafts and Decoratives",
                                            "House and Office Supplies",
                                            "Industrial Machinery and Supplies",
                                            "Instruments and Equipments",
                                            "Mechanical Tools and Supplies",
                                            "Metals, Alloys & Minerals",
                                            "Packaging Machines and Materials",
                                            "Paper and Paper Products",
                                            "Petroleum",
                                            "Plastic and Polymers",
                                            "Textiles, Yarn & Fabrics",
                                            "Others"
                                        ];
                                        ?>

                                        <div class="form-group register-industry-group">
    <label class="control-label" for="industry">
        <?php if ($requiredFields['company']['industry']['is_required']) { ?>
            <span class="text-danger">*</span>
        <?php } ?>
        <?php echo _l('industry'); ?>
    </label>

    <select
        id="industry"
        name="industry"
        class="form-control"
        data-live-search="true"
        data-none-selected-text="<?php echo _l('dropdown_non_selected_tex'); ?>"
        <?php if (!empty($requiredFields['company']['industry']['disabled']) && $requiredFields['company']['industry']['disabled']) { ?>
            disabled
        <?php } ?>
    >
        <option value=""></option>
        <?php foreach ($industries as $industry): 
            $formatted_value = strtolower(str_replace([' ', '&', ',', '/'], ['_', '', '', ''], $industry));
        ?>
            <option value="<?php echo $formatted_value; ?>" <?php echo set_select('industry', $formatted_value); ?>>
                <?php echo $industry; ?>
            </option>
        <?php endforeach; ?>
    </select>

    <?php echo form_error('industry'); ?>
</div>

                                </div>
                                </div>
                                <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group register-password-group">
                                        <label class="control-label" for="password"><span class="text-danger">*</span>
                                            <?php echo _l('clients_register_password'); ?></label>
                                        <input type="password" class="form-control" name="password" id="password">
                                        <?php echo form_error('password'); ?>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                   <div class="form-group register-password-repeat-group">
                                        <label class="control-label" for="passwordr"><span class="text-danger">*</span>
                                            <?php echo _l('clients_register_password_repeat'); ?></label>
                                        <input type="password" class="form-control" name="passwordr" id="passwordr">
                                        <?php echo form_error('passwordr'); ?>
                                    </div>
                                    <div class="register-contact-custom-fields">
                                        <?php echo render_custom_fields('contacts', '', ['show_on_client_portal' => 1]); ?>
                                    </div>
                                </div>
                                  </div>

                                    <!-- <h4 class="bold register-company-info-heading"><?php // echo _l('client_register_company_info'); ?>
                                    </h4> -->
                                   
                             
                                    <!-- <div class="form-group register-company-phone-group">
                                        <label class="control-label" for="phonenumber">
                                            <?php if($requiredFields['company']['company_phonenumber']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('clients_phone'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="phonenumber" id="phonenumber"
                                            value="<?php echo set_value('phonenumber'); ?>">
                                            <?php echo form_error('phonenumber'); ?>
                                    </div> -->
                                
            
                               
             

                                                            <!-- <div class="form-group register-city-group">
                                        <label class="control-label" for="city">
                                            <?php if($requiredFields['company']['company_city']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('clients_city'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="city" id="city"
                                            value="<?php echo set_value('city'); ?>">
                                        <?php echo form_error('city'); ?>
                                    </div>
                                    <div class="form-group register-address-group">
                                        <label class="control-label" for="address">
                                            <?php if($requiredFields['company']['company_address']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('clients_address'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="address" id="address"
                                            value="<?php echo set_value('address'); ?>">
                                        <?php echo form_error('address'); ?>
                                    </div>
                                    <div class="form-group register-zip-group">
                                        <label class="control-label" for="zip">
                                            <?php if($requiredFields['company']['company_zip']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('clients_zip'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="zip" id="zip"
                                            value="<?php echo set_value('zip'); ?>">
                                        <?php echo form_error('zip'); ?>
                                    </div>
                                    <div class="form-group register-state-group">
                                        <label class="control-label" for="state">
                                            <?php if($requiredFields['company']['company_state']['is_required']) { ?>
                                                <span class="text-danger">*</span>
                                            <?php } ?>
                                            <?php echo _l('clients_state'); ?>
                                        </label>
                                        <input type="text" class="form-control" name="state" id="state"
                                            value="<?php echo set_value('state'); ?>">
                                        <?php echo form_error('state'); ?>
                                    </div> -->
                                    <div class="register-company-custom-fields">
                                        <?php echo render_custom_fields('customers', '', ['show_on_client_portal' => 1]); ?>
                                    </div>
                                <?php if (is_gdpr() && get_option('gdpr_enable_terms_and_conditions') == 1) { ?>
                                <div class="col-md-12 register-terms-and-conditions-wrapper">
                                    <div class="text-center">
                                        <div class="checkbox">
                                            <input type="checkbox" name="accept_terms_and_conditions" id="accept_terms_and_conditions"
                                                <?php echo set_checkbox('accept_terms_and_conditions', 'on'); ?>>
                                            <label for="accept_terms_and_conditions">
                                                <?php echo _l('gdpr_terms_agree', terms_url()); ?>
                                            </label>

                                        </div>
                                        <?php echo form_error('accept_terms_and_conditions'); ?>
                                    </div>
                                </div>
                                <?php } ?>
           
                                <?php if ($honeypot) { ?>
                                <label class="honey-element" for="firstname"></label>
                                <input class="honey-element" autocomplete="off" type="text" id="firstname" name="firstname"
                                    placeholder="Your first name here">
                                <label class="honey-element" for="lastname"></label>
                                <input class="honey-element" autocomplete="off" type="text" id="lastname" name="lastname"
                                    placeholder="Your last name here">
                                <label class="honey-element" for="email"></label>
                                <input class="honey-element" autocomplete="off" type="email" id="email" name="email"
                                    placeholder="Your e-mail here">
                                <label class="honey-element" for="company"></label>
                                <input class="honey-element" autocomplete="off" type="text" id="company" name="company"
                                    placeholder="Your company here">
                                <?php } ?>
            
                                <?php if (show_recaptcha_in_customers_area()) { ?>
                                <div class="col-md-12 register-recaptcha">
                                    <div class="g-recaptcha" data-sitekey="<?php echo get_option('recaptcha_site_key'); ?>"></div>
                                    <?php echo form_error('g-recaptcha-response'); ?>
                                </div>
                                <?php } ?>
                                
                                <div class="col-md-12">
                                                <div class="checkbox">
                                                    <input type="checkbox" name="agree" id="agree">
                                                    <label  for="agree">Agree for <a style="color:#337ab7;" href="https://techdotbit.com/terms-and-conditions/" target="_blank">Terms & Conditions</a>  and <a style="color:#337ab7;" href="https://techdotbit.com/privacy-policy/" target="_blank">Privacy policy</a> </label>
                                                </div>
                                            </div>
                                <div class="col-md-12">
                                                <button type="submit" autocomplete="off" data-loading-text="<?php echo _l('wait_text'); ?>"
                                                class="btn btn-success btn-block">
                                                    <?php echo _l('clients_register_string'); ?>
                                                </button>
                                            
                                            </div>
                                <div class="col-md-12" style="margin-top: 10px; display: flex;">
                                    <a href="<?php echo site_url('authentication/login'); ?>" class="btn-link" style="margin-left: auto;">
                                        Already have an account? Login!
                                    </a>
                                </div>



                            </div>
                            
                            
                       
                   
                    <?php echo form_close(); ?>
                </div>


            <div class="col-lg-5 right-box" style="height:100%">
                <div style="height:100%">
            <div class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item slides active">
                    <img class="d-block w-100" src="<?php echo base_url('assets/images/re_banner1.png'); ?>" alt="First slide">
                </div>
                <div class="item slides">
                    <img class="d-block w-100"  src="<?php echo base_url('assets/images/re_banner2.png'); ?>" alt="Second slide">
                </div>
                <div class="item slides ">
                    <img class="d-block w-100"  src="<?php echo base_url('assets/images/4.png'); ?>" alt="Second slide">
                </div>
            
            </div> 
            </div>
            </div>
            </div>
    </div>
</div>

<script>
function checkGSTLength(val) {
    if (val.length === 15) {
        verifyGSTIN(val);
    } else {
        $('#vat-verified-icon').hide();
        $('#gstn-info').hide().text('');
    }
}

function verifyGSTIN(gstin) {
    $.ajax({
        url: '<?php echo base_url("authentication/verify_gst"); ?>',
        method: 'POST',
        data: { gstin: gstin },
        success: function (res) {
            try {
                let data = JSON.parse(res);
                if (data.status_cd === "1") {
                    let info = data.data;
                    $('#vat-verified-icon').show();
                    $('#gstn-info').show().text(`${info.LegalName}, ${info.AddrBno}, ${info.AddrSt}, ${info.AddrLoc} - ${info.AddrPncd}`);

                    // Replace company name field if exists
                    let companyField = document.querySelector('input[name="<?php echo $fields['company']; ?>"]');

                    if (companyField && info.LegalName) {
                        companyField.value = info.LegalName;
                    }
                } else {
                    $('#vat-verified-icon').hide();
                    $('#gstn-info').show().text('Invalid GSTIN or not found.').css('color', 'red');
                }
            } catch (e) {
                console.error("Parse error", e);
                $('#gstn-info').show().text('Verification error.').css('color', 'red');
            }
        },
        error: function () {
            $('#gstn-info').show().text('Request failed.').css('color', 'red');
        }
    });
}
</script>


<script>
        particlesJS("particles-js", {
            particles: {
                number: { value: 80 },
                size: { value: 4 },
                color: { value: "#ffffff" },
                line_linked: {
                    enable: true,
                    distance: 150,
                    color: "#ffffff",
                    opacity: 0.4,
                    width: 1
                }
            }
        });
</script>





