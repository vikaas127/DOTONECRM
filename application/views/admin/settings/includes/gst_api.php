<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>

<!-- Navigation Tabs -->
<ul class="nav nav-tabs" role="tablist">
    <li class="active">
        <a href="#eway_bills" role="tab" data-toggle="tab" class="tab-link"
            data-tab="eway_bills"><?php echo _l('eway_bills_tab'); ?></a>
    </li>
    <li>
        <a href="#eway_bill_invoice" role="tab" data-toggle="tab" class="tab-link"
            data-tab="eway_bill_invoice"><?php echo _l('eway_bill_invoice_tab'); ?></a>
    </li>
</ul>

<div class="tab-content">
    <!-- E-way Bills Tab -->
    <div role="tabpanel" class="tab-pane active" id="eway_bills">
        <div class="api-container">
            <button type="button" class="btn btn-primary" id="openEwayInvoiceModal" data-tab="eway_bills">+
                <?php echo _l('add_eway_bill_api_account'); ?></button>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th><?php echo _l('gstin'); ?></th>
                    <th><?php echo _l('gst_api_username'); ?></th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="eway_table_body"></tbody>
        </table>
    </div>

    <!-- E-way Invoice Tab -->
    <div role="tabpanel" class="tab-pane" id="eway_bill_invoice">
        <div class="api-container">
            <button type="button" class="btn btn-primary" id="openEwayModal" data-tab="eway_bill_invoice">+
                <?php echo _l('add_eway_invoice_api_account'); ?></button>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th><?php echo _l('gstin'); ?></th>
                    <th><?php echo _l('gst_api_username'); ?></th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="eway_invoice_table_body"></tbody>
        </table>
    </div>
</div>

<!-- Single Modal for Both Tabs -->
<div id="ewayModal" class="modal">
    <div class="modal-content">
        <span class="closeEway">&times;</span>
        <h4 id="modalTitle"><?php echo _l('add_api_account'); ?></h4>
        <form id="ewayForm" onsubmit="return false;">

            <!-- <?php echo form_open('GSTAPI/authenticate', ['id' => 'ewayForm']); ?> -->
            <div class="form-group">
                <label for="gstin"><?php echo _l('gstin'); ?>: <span class="model_span">*</span></label>
                <input type="text" class="form-control" name="gstin" id="gstin" required>
            </div>
            <div class="form-group">
                <label for="username"><?php echo _l('gst_api_username'); ?>: <span class="model_span">*</span></label>
                <input type="text" class="form-control" name="username" id="username" required>
            </div>
            <div class="form-group">
                <label for="password"><?php echo _l('gst_api_password'); ?>: <span class="model_span">*</span></label>
                <input type="password" class="form-control" name="password" id="password" required>
            </div>
            <button type="button" id="saveButton" class="btn btn-success">Save</button>
            <!-- <?php echo form_close(); ?> -->
        </form>
    </div>
</div>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        var ewayModal = document.getElementById("ewayModal");
        var ewayBtn = document.getElementById("openEwayModal");
        var ewayInvoiceBtn = document.getElementById("openEwayInvoiceModal");
        var closeEway = document.querySelector(".closeEway");
        var responseMessage = document.getElementById("responseMessage");
        var gstinInput = document.getElementById("gstin");

        // Open modal
        ewayBtn.addEventListener("click", function () {
            ewayModal.style.display = "block";
        });

        ewayInvoiceBtn.addEventListener("click", function () {
            ewayModal.style.display = "block";
        });

        // Close modal on button click
        if (closeEway) {
            closeEway.addEventListener("click", function () {
                ewayModal.style.display = "none";
            });
        }

        // Close modal when clicking outside of modal
        window.addEventListener("click", function (event) {
            if (event.target === ewayModal) {
                ewayModal.style.display = "none";
            }
        });

        if (gstinInput) {
            gstinInput.addEventListener("input", function () {
                this.value = this.value.toUpperCase();
            });
        }
        document.getElementById("saveButton").addEventListener("click", function (event) {
            var gstin = document.getElementById("gstin").value;
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            if (!gstin || !username || !password) {
                responseMessage.innerHTML = "<div class='alert alert-danger'>All fields are required!</div>";
                return;
            }

            var formData = {
                gstin: gstin,
                username: username,
                password: password
            };

            // Send AJAX request
            fetch("<?php echo base_url('GSTAPI/authenticate'); ?>", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(formData)
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        responseMessage.innerHTML = "<div class='alert alert-success'>" + data.message + "</div>";
                        setTimeout(() => { ewayModal.style.display = "none"; }, 2000);
                    } else {
                        responseMessage.innerHTML = "<div class='alert alert-danger'>" + data.message + "</div>";
                    }
                })
                .catch(error => {
                    responseMessage.innerHTML = "<div class='alert alert-danger'>Invalid GST Number</div>";
                });
        })
    });

</script>

<style>
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .model_span {
        color: red;
    }

    .modal-content {
        background-color: white;
        padding: 20px;
        border-radius: 5px;
        width: 30%;
        margin: 10% auto;
        position: relative;
    }

    .close {
        position: absolute;
        right: 10px;
        top: 10px;
        font-size: 20px;
        cursor: pointer;
    }

    /* Table Styling */
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }

    .table th,
    .table td {
        padding: 10px;
        border: 1px solid #ddd;
    }

    .table th {
        background-color: #f4f4f4;
        text-align: left;
    }

    /* API Container */
    .api-container {
        display: flex;
        justify-content: flex-start;
        margin-bottom: 15px;
    }
</style>