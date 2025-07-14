<?php

defined('BASEPATH') or exit('No direct script access allowed');

$dimensions = $pdf->getPageDimensions();

// Header layout
$info_left_column =pdf_logo_url();
$info_right_column = 
'   <p>TechdotBit</p>
    <p>08CTAPD2435D1Z</p>
    <p>T 53, Suncity, Jaipur, Rajasthan</p>
    <p>Phone: +91 8077841585</p>
    <p>Email: akshay@techdotbit.com</p>
';
pdf_multi_row($info_left_column, $info_right_column, $pdf, ($dimensions['wk'] / 2) - $dimensions['lm']);
$pdf->Ln(2); 





$formatted_date = _d($date);

$html = <<<EOD
 <span style="font-weight:bold;font-size:27px; ">NON-DISCLOSURE AGREEMENT</span><br />

<p style="line-height: 1.5;">
    This Non-Disclosure Agreement (the &ldquo;Agreement&rdquo;) is made and entered into on 
    <span style="font-weight: bold;">{$formatted_date}</span> by and between:
</p>

<ul>
    <li>
        Provider: <b>TechDotBit [08CTAPD2435D1Z]</b>, company registered in Jaipur, India, with their principal place of business at T 53, Suncity, Jaipur, Rajasthan (hereinafter referred to as "TechDotBit"), and
    </li>
    <li>
        Client: <b>{$company} [{$gst}]</b>, with their principal place of business at D-001, SECTOR-80, NOIDA, Gautambuddha Nagar, Uttar Pradesh, 201305 (hereinafter referred to as "Client").
    </li>
</ul>
<p>The parties agree to the terms below to protect confidential information and set forth conditions for the use of TechDotBit's SaaS products, including [DotOne Business Solution] (the "Services").</p>

<h3>Purpose</h3>
<p>The purpose of this Agreement is to establish a framework for the confidential exchange of information between the Parties in connection with potential collaboration opportunities. The Parties agree to protect the confidentiality of each other's confidential information as defined herein.</p>

<h3>Roles and Responsibilities</h3>
<h6 style="font-size:15px; color:#002a46;">TechDotBit:</h6>
<ol style="padding-left: 20px;">
    <li>TechDotBit agrees to grant the Client a non-exclusive, non-transferable license to access and use the Services/SaaS Products which may include but are not limited to DotOne ERP (the "Services").</li>
    <li>TechDotBit's ERP solution is provided as a Software as a Service (SaaS) model. All software, servers, and infrastructure required for the ERP system are hosted and maintained solely on TechDotBit's server infrastructure.</li>
    <li>TechDotBit will provide secure access to the software, implementing all necessary security protocols, including encryption, firewalls, and data access controls, to protect the Client's data and to comply with GDPR and other applicable data protection standards.</li>
    <li>TechDotBit agrees to implement reasonable administrative, physical, and technical safeguards to protect the Client's data against unauthorized access, disclosure, alteration, or destruction.</li>
    <li>TechDotBit shall not claim any ownership rights over the Client's data and will securely store all confidential information on its robust and secure servers.</li>
    <li>TechDotBit will implement regular data backup procedures to protect the Client's data and also offers clients the ability to schedule regular data backups or establish a customized backup schedule.</li>
    <li>In the event of a cyberattack, data breach, or any other unforeseen event that results in data loss, TechDotBit will make reasonable efforts to restore data from the most recent available backup but does not guarantee full data restoration.</li>
    <li>TechDotBit retains all intellectual property rights, including copyrights, patents, trademarks, and trade secrets, in and to the ERP software, its underlying technology, and all related documentation, data, and materials.</li>
    <li>TechDotBit will provide support from Monday to Friday during regular business hours (10:00 AM to 6:30 PM IST), which includes assistance with basic operational issues, guidance on standard features, and troubleshooting of any system issues related to the software.</li>
    <li>In case of any urgent or critical issues outside regular support hours, TechDotBit may assign a dedicated developer. Any such support services will be billed separately as per the support policies.</li>
    <li>TechDotBit will charge a non-refundable setup fee prior to the initial installation of the ERP system.</li>
    <li>TechDotBit will charge a monthly subscription fee in advance for continued access to ERP services based on the payment plan as specified in Schedule A, exclusive of GST and other applicable taxes, and will be non-refundable and non-transferable.</li>
    <li>Any refund, if made, will be subject to deductions for server charges, administrative fees, and other applicable costs.</li>
    <li>TechDotBit may charge an additional Enterprise Management Charge (EMC) to accommodate specific client requirements that may extend beyond standard service offerings.</li>
    <li>TechDotBit is not liable for any issues or costs arising from the use of these third-party services.</li>
    <li>TechDotBit reserves the right to adjust fees based on market conditions or internal business needs, which will be communicated in writing, with adjustments taking effect at the start of the next billing cycle following notice.</li>
    <li>The monthly subscription fee does not cover any customization requests or alterations to the ERP software. Customization work will be scoped, agreed upon, and billed separately.</li>
    <li>In the event of any copyright or intellectual property rights violation by the Client, TechDotBit reserves the right to terminate this Agreement immediately and pursue all available legal remedies.</li>

</ol>

<h6 style="font-size:15px; color:#002a46;">{$company}:</h6>
<ol style="padding-left: 20px;">
    <li>The Client agrees to use the Services solely for its own internal business purposes and in accordance with the terms of this Agreement and any applicable laws and regulations.</li>
    <li>The Client shall not sublicense, assign, or transfer the Services to any third party; modify, adapt, or create derivative works of the Services; reverse engineer, decompile, or disassemble the Services and attempt to circumvent any technical protections or security measures implemented in the Services.</li>
    <li>The Client agrees to protect TechDotBit's intellectual property rights and will not reproduce, distribute, or modify any part of the ERP software without explicit authorization from TechDotBit.</li>
    <li>The Client agrees that the access will be limited to using the ERP system through the provided interface and APIs provided through the SaaS platform.</li>
    <li>The Client does not acquire any ownership rights in the software or its source code.</li>
    <li>The Client agrees to pay a recurring monthly subscription fee, as outlined in Schedule A, for continued access to the ERP Services.</li>
    <li>The Client agrees to pay a one-month advance payment upon the commencement of the Services.</li>
    <li>The Client agrees to pay all applicable taxes, including Goods and Services Tax (GST), on the Services provided by TechDotBit.</li>
    <li>The Client agrees to the support terms and must discuss and approve the fee and scope of work in case of any customization.</li>
    <li>The Client agrees that refunds will only be considered for the current month's payment and only if requested within 15 days of the invoice date. Any refunds will be subject to deductions for server charges, administrative fees, and other applicable costs. The maximum refund amount will be 40% of the current month's payment. The Client must submit a written refund request, which will be reviewed by TechDotBit at its sole discretion. All other payments made are strictly non-refundable under any circumstances.</li>
    <li>The Client acknowledges that data loss can occur and assumes responsibility for maintaining their own data backup strategies as an additional safeguard.</li>
    <li>The Client may integrate third-party applications with the TechDotBit ERP using the APIs provided by TechDotBit. However, the Client is solely responsible for the technical implementation of the integration and any associated risks, including data loss or corruption. TechDotBit shall not be liable for any damages or losses arising from such integration.</li>
    <li>The Client is solely responsible for any fees or charges associated with these third-party services and should review the terms of service of each third-party service provider before enabling any integrations.</li>
    <li>The Client may use TechDotBit's trademarks or logos only as expressly permitted by TechDotBit in writing and in accordance with TechDotBit brand guidelines.</li>
    <li>The Client agrees not to use the ERP software or its components to develop any competing software or products. Any such attempt will be considered as a material breach of this Agreement and may result in immediate termination and legal action.</li>

</ol>

<h3>Confidentiality</h3>
<p>Each party agrees to keep confidential all information received from each other party in connection with this agreement, except as authorised by the other party or required by law.</p>

<h3>Governing Law</h3>
<p>This Agreement shall be governed by and construed in accordance with the laws of the State of [State, e.g., Rajasthan], India.</p>

<h3>Dispute Resolution</h3>
<p>Any dispute, controversy, or claim arising out of or relating to this Agreement shall be resolved through [mediation/arbitration/litigation] in Jaipur, Rajasthan, India, in accordance with the applicable rules.
</p>

<h3>Point of Contact</h3>
<p>Each party may appoint a Point of Contact ("POC") responsible for overseeing the implementation of this agreement and acting as the primary liaison between the parties. Any changes to the designated POCs must be notified to the other party in writing</p>

<h3>Representative Detail:</h3>
<table border="1" cellpadding="8" style="border-collapse: collapse; width: 100%; text-align: left;">
    <thead>
        <tr style="background-color: #002a46; color:#fff">
            <th>Organization</th>
            <th>Name</th>
            <th>Phone Number</th>
            <th>Email Address</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>TechDotBit</td>
            <td>Akshay Chauhan</td>
            <td>+91 8077841585</td>
            <td>akshay@techdotbit.com</td>
        </tr>
        <tr>
            <td>{$company}</td>
            <td>{$client_name}</td>
            <td>{$phone}</td>
            <td>{$email}</td>
        </tr>
    </tbody>
</table>

<h3>TERMINATION</h3>
<ul style="list-style-type: disc; padding-left: 20px;">
    <li>This Agreement shall commence on the Effective Date and shall continue until terminated.</li>
    <li>Either party may terminate this Agreement with 45 days written notice to the other party.</li>
    <li>TechDotBit may terminate this Agreement immediately, without notice, if the Client materially breaches this Agreement and fails to cure such breach within 15 days of written notice.</li>

</ul>

<h3>MISCELLANEOUS</h3>
<ul style="list-style-type: disc; padding-left: 20px;">
    <li>This Agreement constitutes the entire agreement between the parties and supersedes all prior or contemporaneous communications, representations, or agreements, whether oral or written.</li>
    <li>The Client agrees to keep confidential any special pricing or discounts offered by TechDotBit for the use of the services and shall not disclose this confidential information to any third party without TechDotBit's prior written consent.</li>

</ul>

<h3>Pricing Plans</h3>
<table border="1" cellpadding="8" style="border-collapse: collapse; width: 100%; text-align: left;">
    <thead>
        <tr style="background-color: #002a46; color:#fff">
            <th>Plan</th>
            <th>Installation Charges</th>
            <th>Price (Per Year)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Standard</td>
            <td>Rs.50,000/-</td>
            <td>Rs.1,80,000/year</td>
        </tr>
        <tr>
            <td>Professional</td>
            <td>Rs.50,000/-</td>
            <td>Rs.2,16,000/year</td>
        </tr>
        <tr>
            <td>Enterprise</td>
            <td>Rs.50,000/-</td>
            <td>Rs.2,40,000/year</td>
        </tr>
    </tbody>
</table>

<h3>SIGNATURES</h3>
<p>IN WITNESS WHEREOF, the parties have executed this MoU as of the date first written above.</p>
<table width="100%" style="margin-top: 20px;">
    <tr>
        <td width="50%" valign="top">
            <p><strong>Dayanand Yadav</strong></p>
            <p>CEO, TechDotBit</p>
            <p style="margin-top: 40px;">Signature: ________________________</p>
        </td>
        <td width="50%" valign="top">
            <p><strong>{$company}</strong></p>
            <p>Authorized Representative</p>
            <p style="margin-top: 40px;">Signature: ________________________</p>
        </td>
    </tr>
</table>
EOD;

// Output the HTML to TCPDF
$pdf->writeHTML($html, true, false, false, false, '');
$pdf->Ln(6);
