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
    .login-form{
        width: 100%;

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
    display: flex;
    align-items: center;
    justify-content: center;



}
.right-box{
    border-left: 1px solid #cbd5e1;
    padding:0;
    display: flex;
    align-items: center;


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


<div class="col-md-5 col-lg-5  left-box">
  
   <div class="login-form">
      
                <h1 class="tw-font-semibold text-center"><?php echo _l('customer_forgot_password_heading'); ?></h1>
                
                <?php echo form_open($this->uri->uri_string(), ['id' => 'forgot-password-form']); ?>
                <?php echo validation_errors('<div class="alert alert-danger text-center">', '</div>'); ?>
                <?php if ($this->session->flashdata('message-danger')) { ?>
                <div class="alert alert-danger">
                    <?php echo $this->session->flashdata('message-danger'); ?>
                </div>
                <?php } ?>
                <?php echo render_input('email', 'customer_forgot_password_email', '', 'email'); ?>
                <div class="form-group" style="margin-bottom:5px">
                    <button type="submit"
                        class="btn btn-success btn-block"><?php echo _l('customer_forgot_password_submit'); ?></button>
                </div>

                <div  style=" display: flex;">
                                    <a href="<?php echo site_url('authentication/login'); ?>" class="btn-link" style="margin-left: auto;">
                                        Back to Login!
                                    </a>
                </div>
<div     style=" color:#337ab7; margin-top:5px;" class="text-center" >
                    <?php if (get_option('allow_registration') == 1) { ?>
                        Don't have an account with us, 
                        <a href="<?php echo site_url('authentication/register'); ?>">
                            <?php echo _l('clients_register_string'); ?>
                        </a>
                        now
                    <?php } ?>
</div>
                <?php echo form_close(); ?>

               
             

                   
       
    </div>
</div>
<div class="col-md-7 col-lg-7  right-box">
    <div class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item slides active">
                <img class="d-block w-100" style=" width: 100%; height: 100%; object-fit: cover;" src="<?php echo base_url('assets/images/fp_banner1.png'); ?>" alt="First slide">
            </div>
            <div class="item slides ">
                <img class="d-block w-100" style=" width: 100%; height: 100%; object-fit: cover;" src="<?php echo base_url('assets/images/fp_banner2.png'); ?>" alt="Second slide">
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