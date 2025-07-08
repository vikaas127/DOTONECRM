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
.inner-body {
    position: relative;
    z-index: 2;
    width: 100%;
    max-width: 900px;
    background: #fff;
    border-radius: 10px !important;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}
#particles-js {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 2;
        }




.slides img{
border-top-right-radius: 10px;
border-bottom-right-radius: 10px;
}
.left-box{
    padding: 30px;
    padding-bottom:10px !important;
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

<div class="col-md-6 col-lg-6  left-box">
  
   
    <div class="login-form">
        <?php echo form_open($this->uri->uri_string(), ['class' => 'login-form']); ?>
        <?php hooks()->do_action('clients_login_form_start'); ?>
    
                <h1 class="tw-font-semibold  text-center" style="font-size:25px">
                    
                            <?php echo _l('admin_auth_login_heading'); ?>
                </h1>
                <!-- <div class="d-flex tab-buttons">
                    <a href="<?php echo site_url('authentication/login'); ?>" class="btn-link active">Vendor</a>
                </div> -->
                <?php if (!is_language_disabled()) { ?>
                <div class="form-group">
                    <label for="language" class="control-label"><?php echo _l('language'); ?>
                    </label>
                    <select name="language" id="language" class="form-control selectpicker"
                        onchange="change_contact_language(this)"
                        data-none-selected-text="<?php echo _l('dropdown_non_selected_tex'); ?>"
                        data-live-search="true">
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

                <div class="form-group">
                    <label for="email"><?php echo _l('clients_login_email'); ?></label>
                    <input type="text" autofocus="true" class="form-control" name="email" id="email" placeholder="Enter Email Address">
                    <?php echo form_error('email'); ?>
                </div>

                <div class="form-group">
                    <label for="password"><?php echo _l('clients_login_password'); ?></label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password">
                    <?php echo form_error('password'); ?>
                </div>

                <?php if (show_recaptcha_in_customers_area()) { ?>
                <div class="g-recaptcha tw-mb-4" data-sitekey="<?php echo get_option('recaptcha_site_key'); ?>"></div>
                <?php echo form_error('g-recaptcha-response'); ?>
                <?php } ?>

                <div class="row align-items-center form-group">
                    <div class="col-sm-6">
                        <div class="checkbox">
                            <input type="checkbox" name="remember" id="remember">
                            <label for="remember">
                                <?php echo _l('clients_login_remember'); ?>
                            </label>
                        </div>
                    </div>
                    <div class="col-sm-6 text-right">
                        <a href="<?php echo site_url('authentication/forgot_password'); ?>">
                            <?php echo _l('customer_forgot_password'); ?>
                        </a>
                    </div>
                </div>
                

                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-block">
                        <?php echo _l('clients_login_login_string'); ?>
                    </button>
                </div>
                 <p class="text-left">
                            Login as 
                              <a href="<?php echo site_url('admin/authentication'); ?>" class="btn-link">Company</a>
                </p>
                <p style="margin-top: 15px; color:#337ab7;" class="text-center">
                    <?php if (get_option('allow_registration') == 1) { ?>
                        Don't have an account with us, 
                        <a href="<?php echo site_url('authentication/register'); ?>">
                            <?php echo _l('clients_register_string'); ?>
                        </a>
                        now
                    <?php } ?>
                    </p>
                
                <?php hooks()->do_action('clients_login_form_end'); ?>
                <?php echo form_close(); ?>
      
    </div>
</div>
<div class="col-md-6 col-lg-6 right-box">
    <div class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item slides active">
                <img class="d-block w-100" style=" width: 100%; height: 100%; object-fit: cover;" src="<?php echo base_url('assets/images/log_banner1.png'); ?>" alt="First slide">
            </div>
            <div class="item slides ">
                <img class="d-block w-100" style=" width: 100%; height: 100%; object-fit: cover;" src="<?php echo base_url('assets/images/log_banner2.png'); ?>" alt="Second slide">
            </div>
           
        </div> 
    </div>
</div>
</div>
</div>
</div>

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